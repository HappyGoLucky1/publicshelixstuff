
local PLUGIN = PLUGIN
PLUGIN.name = "NPC Item Drops"
PLUGIN.author = "milk man"
PLUGIN.description = "Drops items from killing NPCs."

--[[
    To add a new npc, create a new line. The index for the entry will be the npc class and the value will be a table for the chance for an item to drop from said npc.
    The first value is the base chance for a single item to drop. After that the second value will be subtracted from the base chance until an unsuccessful roll.
    Example: ["npc_eli"] = {0.25, 0.05} (0.25 would be a 25% chance to drop an item. Each successful roll for an additonal item to drop will have 
    its chance to drop an additonal item afterwards decreased by 5%)
--]]
PLUGIN.npcDropChances = {
    ["npc_eli"] = {0.25, 0.05}
}


local function GetItemToDrop(dropPool)
    local dropItem
    local dropRoll = math.Rand(0, 1)
    local itemsCouldDrop = {}

    table.sort(dropPool, function(a, b) return a[2] > b[2] end)

    for k, v in pairs(dropPool) do
        if dropRoll <= v[2] then
            itemsCouldDrop[#itemsCouldDrop + 1] = {v[1], v[2]}
        end
    end

    if !table.IsEmpty(itemsCouldDrop) then
        table.sort(itemsCouldDrop, function(a, b) return a[2] < b[2] end)
        dropItem = itemsCouldDrop[1][1]
        return dropItem
    end

    dropItem = dropPool[1][1]
    return dropItem
end

function PLUGIN:OnNPCKilled(npc, attacker, inflictor)
    if attacker:IsPlayer() then
        local dropPool = {}
        local npcClass = npc:GetClass()

        for itemName, itemInstance in pairs(ix.item.list) do
            if itemInstance.npcDrop and istable(itemInstance.npcDrop) then
                for itemNpcClass, itemDropChance in pairs(itemInstance.npcDrop) do
                    if npcClass == itemNpcClass then
                        dropPool[#dropPool + 1] = {itemInstance.uniqueID, itemInstance.npcDrop[npcClass]}
                    end
                end
            end
        end

        if !table.IsEmpty(dropPool) then
            local dropChance = self.npcDropChances[npcClass][1]
            local bShouldDrop = math.Rand(0, 1) <= dropChance

            while bShouldDrop do
                local dropRoll = math.Rand(0, 1)
                dropChance = dropChance - self.npcDropChances[npcClass][2]
                local dropItem = GetItemToDrop(dropPool)
                ix.item.Spawn(dropItem, npc:GetPos() + Vector(0, 0, 16))

                bShouldDrop = dropRoll <= dropChance
            end
        end
    end
end