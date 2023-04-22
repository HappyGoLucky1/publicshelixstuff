
--load up the materials
    local leftHUDElement = Material("fonvui/hud/hud_left_main.png", "smooth")
    local compassStrip = Material("fonvui/hud/compass.png", "noclamp")
    --bruh how am i gonna do this
    local compassAlphaRT = GetRenderTargetEx("CompassAlphaRT", 1024, 64, RT_SIZE_OFFSCREEN, MATERIAL_RT_DEPTH_SHARED, 0, 0, IMAGE_FORMAT_RGBA8888)
    local compassAlphaRTMat = CreateMaterial("CompassAlphaRTMask", "UnlitGeneric", {
        ["$basetexture"] = compassAlphaRT:GetName(),
        ["$translucent"] = "1"
    })
    local compassAlphaMask = Material("fonvui/hud/alpha_map.png", "smooth")

    local rightHUDElement = Material("fonvui/hud/hud_right_main.png", "smooth")
    local conditionBar = Material("fonvui/hud/hud_condition_bar.png")
    local conditionTriangle = Material("fonvui/hud/hud_condition_triangle.png", "smooth")

    local mainTickMark = Material("fonvui/hud/hud_tick_mark.png")

    local crosshair = Material("fonvui/hud/hud_crosshair.png")
    local crosshairHover = Material("fonvui/hud/hud_crosshair_hover.png")

    local explosiveIndicator = Material("fonvui/hud/hud_explosive_indicator_test.png", "smooth")
    local oxygenIndicator = Material("fonvui/hud/hud_oxygen_indicator.png")
    local oxygenIndicatorTick = Material("fonvui/hud/hud_oxygen_tick.png")

    local notificationSeperator = Material("fonvui/hud/hud_message_seperator_left.png", "smooth mips")

    local messageIcons = {
        ["karmaEvil"] = Material("fonvui/hud/icons/karma/karma_evil.png", "smooth"),
        ["karmaBad"] = Material("fonvui/hud/icons/karma/karma_bad.png", "smooth"),
        ["karmaNeutral"] = Material("fonvui/hud/icons/karma/karma_neutral.png", "smooth"),
        ["karmaGood"] = Material("fonvui/hud/icons/karma/karma_good.png", "smooth"),
        ["karmaSaint"] = Material("fonvui/hud/icons/karma/karma_saint.png", "smooth"),

        ["statusAP"] = Material("fonvui/hud/icons/status/action_points.png", "smooth"),
        ["statusCarry"] = Material("fonvui/hud/icons/status/carry_weight.png", "smooth"),
        ["statusCritical"] = Material("fonvui/hud/icons/status/critical_chance.png", "smooth"),
        ["statusDamageResist"] = Material("fonvui/hud/icons/status/damage_resistance.png", "smooth"),
        ["statusPoisonResist"] = Material("fonvui/hud/icons/status/poison_resistance.png", "smooth"),
        ["statusRadResist"] = Material("fonvui/hud/icons/status/radiation_resistance.png", "smooth"),
        ["statusHP"] = Material("fonvui/hud/icons/status/hit_points.png", "smooth"),
        ["statusHealing"] = Material("fonvui/hud/icons/status/healing_rate.png", "smooth"),
        ["statusMelee"] = Material("fonvui/hud/icons/status/melee_damage.png", "smooth"),

        ["specialAgility"] = Material("fonvui/hud/icons/special_stats/special_agility.png", "smooth"),
        ["specialCharisma"] = Material("fonvui/hud/icons/special_stats/special_charisma.png", "smooth"),
        ["specialEndurance"] = Material("fonvui/hud/icons/special_stats/special_endurance.png", "smooth"),
        ["specialIntelligence"] = Material("fonvui/hud/icons/special_stats/special_intelligence.png", "smooth"),
        ["specialLuck"] = Material("fonvui/hud/icons/special_stats/special_luck.png", "smooth"),
        ["specialPerception"] = Material("fonvui/hud/icons/special_stats/special_perception.png", "smooth"),
        ["specialStation"] = Material("fonvui/hud/icons/special_stats/special_strength.png", "smooth"),

        ["messageAngry"] = Material("fonvui/hud/icons/message/vaultboy_angry.png", "smooth"),
        ["messagePain"] = Material("fonvui/hud/icons/message/vaultboy_pain.png", "smooth"),
        ["messageSad"] = Material("fonvui/hud/icons/message/vaultboy_sad.png", "smooth"),
        ["messageNeutral"] = Material("fonvui/hud/icons/message/vaultboy_neutral.png", "smooth"),
        ["messageThinking"] = Material("fonvui/hud/icons/message/vaultboy_thinking.png", "smooth"),
        ["messageSurprise"] = Material("fonvui/hud/icons/message/vaultboy_surprise.png", "smooth"),
        ["messageVeryHappy"] = Material("fonvui/hud/icons/message/vaultboy_very_happy.png", "smooth"),
        ["messageNinja"] = Material("fonvui/hud/icons/message/vaultboy_ninja.png", "smooth"),
        ["messageWasteland"] = Material("fonvui/hud/icons/message/vaultboy_wasteland.png", "smooth"),

        ["eventGiftbox"] = Material("fonvui/hud/icons/event/event_giftbox.png", "smooth"),
        ["eventKey"] = Material("fonvui/hud/icons/event/event_key.png", "smooth"),
        ["eventLock"] = Material("fonvui/hud/icons/event/event_lock.png", "smooth"),
        ["eventMap"] = Material("fonvui/hud/icons/event/event_map.png", "smooth"),
        ["eventRadioTower"] = Material("fonvui/hud/icons/event/event_radio_tower.png", "smooth"),

        ["skillsBarter"] = Material("fonvui/hud/icons/skills/skills_barter.png", "smooth"),
        ["skillsBigGuns"] = Material("fonvui/hud/icons/skills/skills_big_guns.png", "smooth"),
        ["skillsEnergyWeapons"] = Material("fonvui/hud/icons/skills/skills_energy_weapons.png", "smooth"),
        ["skillsExplosives"] = Material("fonvui/hud/icons/skills/skills_explosives.png", "smooth"),
        ["skillsLockpick"] = Material("fonvui/hud/icons/skills/skills_lockpick.png", "smooth"),
        ["skillsMedicine"] = Material("fonvui/hud/icons/skills/skills_medicine.png", "smooth"),
        ["skillsMeleeWeapons"] = Material("fonvui/hud/icons/skills/skills_melee_weapons.png", "smooth"),
        ["skillsRepair"] = Material("fonvui/hud/icons/skills/skills_repair.png", "smooth"),
        ["skillsScience"] = Material("fonvui/hud/icons/skills/skills_science.png", "smooth"),
        ["skillsSmallGuns"] = Material("fonvui/hud/icons/skills/skills_small_guns.png", "smooth"),
        ["skillsSneak"] = Material("fonvui/hud/icons/skills/skills_sneak.png", "smooth"),
        ["skillsSpeech"] = Material("fonvui/hud/icons/skills/skills_speech.png", "smooth"),
        ["skillsThrowing"] = Material("fonvui/hud/icons/skills/skills_throwing.png", "smooth"),
        ["skillsUnarmed"] = Material("fonvui/hud/icons/skills/skills_unarmed.png", "smooth"),

        ["factionApocalypse"] = Material("fonvui/hud/icons/faction/vaultboy_apocalypse.png", "smooth"),
        ["factionBoomers"] = Material("fonvui/hud/icons/faction/vaultboy_boomers.png", "smooth"),
        ["factionBrotherhood"] = Material("fonvui/hud/icons/faction/vaultboy_brotherhood.png", "smooth"),
        ["factionFreeside"] = Material("fonvui/hud/icons/faction/vaultboy_freeside.png", "smooth"),
        ["factionGoodsprings"] = Material("fonvui/hud/icons/faction/vaultboy_goodsprings.png", "smooth"),
        ["factionKhans"] = Material("fonvui/hud/icons/faction/vaultboy_khans.png", "smooth"),
        ["factionLegion"] = Material("fonvui/hud/icons/faction/vaultboy_legion.png", "smooth"),
        ["factionNCR"] = Material("fonvui/hud/icons/faction/vaultboy_ncr.png", "smooth"),
        ["factionNovac"] = Material("fonvui/hud/icons/faction/vaultboy_novac.png", "smooth"),
        ["factionPowderGang"] = Material("fonvui/hud/icons/faction/vaultboy_powder_gang.png", "smooth"),
        ["factionPrimm"] = Material("fonvui/hud/icons/faction/vaultboy_primm.png", "smooth"),
        ["factionStrip"] = Material("fonvui/hud/icons/faction/vaultboy_strip.png", "smooth"),
        ["factionWhiteGlove"] = Material("fonvui/hud/icons/faction/vaultboy_white_glove.png", "smooth")
    }

--hud element info
    --hud text info
    local textOutlineWidth = 2.25

    local iconSizes = {}
    --change how this i do icon sizes and shit later
    for name, material in pairs(messageIcons) do
        iconSizes[material] = {w = material:GetTexture("$basetexture"):Width(), h = material:GetTexture("$basetexture"):Height()}
    end

--create this because simpletextoutlined doesnt handle \n well
local function TextOutlined(text, font, x, y, color, xalign, outlineWidth, outlineColor)
    local steps = ( outlineWidth * 2 ) / 3
    if ( steps < 1 ) then steps = 1 end

    for _x = -outlineWidth, outlineWidth, steps do
        for _y = -outlineWidth, outlineWidth, steps do
            draw.DrawText(text, font, x + _x, y + _y, outlineColor, xalign)
        end
    end

    return draw.DrawText( text, font, x, y, color, xalign )
end

--shitty outline attempt
local function TextDoubleOutlined(text, font, x, y, color, xalign, firstOutlineWidth, firstOutlineColor, secondOutlineWidth, secondOutlineColor)
    local steps = ( secondOutlineWidth * 2 ) / 3
    if ( steps < 1 ) then steps = 1 end

    for _x = -secondOutlineWidth, secondOutlineWidth, steps do
        for _y = -secondOutlineWidth, secondOutlineWidth, steps do
            draw.DrawText(text, font, x + _x, y + _y, secondOutlineColor, xalign)
        end
    end

    return TextOutlined(text, font, x, y, color, xalign, firstOutlineWidth, firstOutlineColor)
end

local PANEL = {}

function PANEL:Init()
    if (IsValid(ix.gui.fonvhud)) then
        ix.gui.fonvhud:Remove()
    end

    self.notifications = {}
    self.explosiveIndicatorAlpha = 0

    self:SetPos(0, 0)
    self:SetSize(ScrW(), ScrH())

    self.notificationPanel = vgui.Create("Panel", self)
    self.notificationPanel:SetPos(0, 0)
    self.notificationPanel:SetSize(self:GetWide(), self:GetTall())
    self.notificationPanel.currentAlpha = 0
    self.notificationPanel:SetAlpha(self.notificationPanel.currentAlpha)
    self.notificationPanel.fadeInAnimation = nil
    self.notificationPanel.fadeOutAnimation = nil
    self.notificationPanel.Paint = function()
        local notificationSeperatorWidth, notificationSeperatorHeight = ScrW() * notificationSeperator:GetTexture("$basetexture"):Width() * .75 / 1600, ScrH() * notificationSeperator:GetTexture("$basetexture"):Height() * .55 / 900
        local HUDColor = Color(ix.option.Get("hudColor").r, ix.option.Get("hudColor").g, ix.option.Get("hudColor").b, ix.option.Get("hudColor").a)
        local HUDTextOutlineColor = Color(HUDColor.r, HUDColor.g, HUDColor.b, 2)
        local HUDTextSecondOutlineColor = Color(HUDColor.r * 0.10, HUDColor.g * 0.10, HUDColor.b * 0.10, 30)

        if (not table.IsEmpty(self.notifications)) then
            self.currentNotification = self.notifications[#self.notifications - (#self.notifications - 1)]
            self.currentNotification.expireTime = self.currentNotification.expireTime or CurTime() + self.currentNotification.duration

            if (CurTime() >= self.currentNotification.expireTime) then
                table.remove(self.notifications, #self.notifications - (#self.notifications - 1))
                self.currentNotification = self.notifications[#self.notifications - (#self.notifications - 1)]

                if (self.currentNotification) then
                    self.currentNotification.expireTime = self.currentNotification.expireTime or CurTime() + self.currentNotification.duration
                end
            end

            if (not table.IsEmpty(self.notifications)) then
                self.currentNotification = self.notifications[#self.notifications - (#self.notifications - 1)]
                if (self.notificationPanel:GetAlpha() < 255) then
                    self.notificationPanel.fadeInAnimation = self.notificationPanel:CreateAnimation(1, {
                        target = {currentAlpha = 255},
                        easing = "outQuint",
                        Think = function(animation, panel)
                            panel:SetAlpha(panel.currentAlpha)
                        end
                    })
                end

                surface.SetDrawColor(HUDColor)
                surface.SetMaterial(notificationSeperator)
                surface.DrawTexturedRect(50, self:GetTall() * 0.037, notificationSeperatorWidth, notificationSeperatorHeight)

                surface.SetDrawColor(HUDColor)
                surface.SetMaterial(self.currentNotification.icon)
                surface.DrawTexturedRect(31, self:GetTall() * 0.03, ScrW() * iconSizes[self.currentNotification.icon].w / 1600, ScrH() * iconSizes[self.currentNotification.icon].h / 900)

                local currentNotificationText = self.currentNotification.text

                TextDoubleOutlined(currentNotificationText, "Monofonto_Medium", 155, 48, HUDColor, TEXT_ALIGN_LEFT, textOutlineWidth, HUDTextOutlineColor, textOutlineWidth * 1.5, HUDTextSecondOutlineColor)

                if (CurTime() >= self.currentNotification.expireTime - 1.5 and #self.notifications < 2) then
                    self.notificationPanel.fadeOutAnimation = self.notificationPanel:CreateAnimation(1, {
                        target = {currentAlpha = 0},
                        easing = "outQuint",
                        Think = function(animation, panel)
                            panel:SetAlpha(panel.currentAlpha)
                        end
                    })
                end
            end
        end
    end
    self.notificationPanel.Think = function()
        if (self.notificationPanel.fadeOutAnimation and self.currentNotification and CurTime() >= self.currentNotification.expireTime - 1.5 and #self.notifications > 1) then
            table.remove(self.notifications, #self.notifications - (#self.notifications -1))
        end
    end

    self:ParentToHUD()

    ix.gui.fonvhud = self
end

function PANEL:AddNotification(text, icon, duration)
    if (text:sub(1, 1) == "@") then
        text = L(text:sub(2))
    end
    local queueIndex = #self.notifications + 1

    self.notifications[queueIndex] = {
        text = text,
        icon = messageIcons[icon],
        duration = duration
    }

    return queueIndex
end

function PANEL:Paint(width, height)
    if (LocalPlayer():Alive() and LocalPlayer():GetCharacter()) then
        --hud texture sizes
        local leftHUDElementWidth, leftHUDElementHeight = ScrW() * leftHUDElement:GetTexture("$basetexture"):Width() / 1600,  ScrH() * leftHUDElement:GetTexture("$basetexture"):Height() / 900

        local rightHUDElementWidth, rightHUDElementHeight = ScrW() * rightHUDElement:GetTexture("$basetexture"):Width() / 1600, ScrH() * rightHUDElement:GetTexture("$basetexture"):Height() / 900
        local conditionBarWidth, conditionBarHeight = 70, 22
        local conditionTriangleWidth, conditionTriangleHeight = ScrW() * conditionTriangle:GetTexture("$basetexture"):Width() / 1600, ScrH() * conditionTriangle:GetTexture("$basetexture"):Height() / 900

        local tickMarkWidth, tickMarkHeight = ScrW() * mainTickMark:GetTexture("$basetexture"):Width() / 1600, ScrH() * mainTickMark:GetTexture("$basetexture"):Height() / 900

        local crosshairWidth, crosshairHeight = ScrW() * crosshair:GetTexture("$basetexture"):Width() / 1600, ScrH() * crosshair:GetTexture("$basetexture"):Height() / 900
        local crosshairHoverWidth, crosshairHoverHeight = ScrW() * crosshairHover:GetTexture("$basetexture"):Width() / 1600, ScrH() * crosshairHover:GetTexture("$basetexture"):Height() / 900

        local explosiveIndicatorWidth, explosiveIndicatorHeight = ScrW() * explosiveIndicator:GetTexture("$basetexture"):Width() / 1600, ScrH() * explosiveIndicator:GetTexture("$basetexture"):Height() / 900

        local oxygenIndicatorWidth, oxygenIndicatorHeight = ScrW() * oxygenIndicator:GetTexture("$basetexture"):Width() / 1600, ScrH() * oxygenIndicator:GetTexture("$basetexture"):Height() / 900
        local oxygenIndicatorTickWidth, oxygenIndicatorTickHeight = ScrW() * oxygenIndicatorTick:GetTexture("$basetexture"):Width() / 1600, ScrH() * oxygenIndicatorTick:GetTexture("$basetexture"):Height() / 900

        --player info
        local ply = LocalPlayer()

            --player health
            local plyHealth = ply:Health() or 0
            --local plyHealthTicks = math.floor(plyHealth / 3.125) < 32 and math.floor(plyHealth / 3.125) or 32
            local plyHealthTicks = math.Round((plyHealth / LocalPlayer():GetMaxHealth()) * 32)

            --player stamina
            local plyAP = ply:GetLocalVar("stm", 100)
            local plyAPTicks = plyAP * 0.32

            --player water
            local plyOxygen = math.floor(ply:GetLocalVar("o2") ~= nil and (ply:GetLocalVar("o2") / 6.66) < 15 and math.floor(ply:GetLocalVar("o2") / 6.66) or -1)
            local plyOxygenTicks = math.floor(plyOxygen > -1 and plyOxygen or -1)

            --player weapon
            local plyActiveWeapon = ply:GetActiveWeapon()
            local plyActiveWeaponCondition = ply:GetLocalVar("activeWeaponCondition")
            local activeWepPrimaryAmmo, activeWepSecondaryAmmo, activeWepPrimaryMag, activeWepSecondaryMag, activeWepMaxPrimaryMag, activeWepMaxSecondaryMag, plyPrimaryAmmo, plySecondaryAmmo = -1, -1, -1, -1, -1, -1, -1, -1

            if (IsValid(plyActiveWeapon)) then
                activeWepPrimaryAmmo, activeWepSecondaryAmmo = plyActiveWeapon:GetPrimaryAmmoType() or -1, plyActiveWeapon:GetSecondaryAmmoType() or -1
                activeWepPrimaryMag, activeWepSecondaryMag = plyActiveWeapon:Clip1() or -1, plyActiveWeapon:Clip2() or -1
                activeWepMaxPrimaryMag, activeWepMaxSecondaryMag = plyActiveWeapon:GetMaxClip1() or -1, plyActiveWeapon:GetMaxClip2() or -1
                plyPrimaryAmmo, plySecondaryAmmo = ply:GetAmmoCount(activeWepPrimaryAmmo) or -1, ply:GetAmmoCount(activeWepSecondaryAmmo) or -1
            end

        --hud colors
        local HUDColor = Color(ix.option.Get("hudColor").r, ix.option.Get("hudColor").g, ix.option.Get("hudColor").b, ix.option.Get("hudColor").a)
        local HUDDarkColor = Color(HUDColor.r * 0.5, HUDColor.g * 0.5, HUDColor.b * 0.5, HUDColor.a)
        local HUDTickColor = Color(HUDColor.r, HUDColor.g, HUDColor.b, HUDColor.a - 25)
        local HUDTextOutlineColor = Color(HUDColor.r, HUDColor.g, HUDColor.b, 2)
        local HUDTextSecondOutlineColor = Color(HUDColor.r * 0.10, HUDColor.g * 0.10, HUDColor.b * 0.10, 45)

        --left hud elements
        --left main hud frame
        surface.SetDrawColor(HUDColor)
        surface.SetMaterial(leftHUDElement)
        surface.DrawTexturedRect(width * 0.03125, height * 0.81, leftHUDElementWidth, leftHUDElementHeight)

        --HP text
        TextDoubleOutlined("HP", "Monofonto_HUD", width * 0.046875, height * 0.815, HUDColor, TEXT_ALIGN_LEFT, textOutlineWidth, HUDTextOutlineColor, textOutlineWidth * 1.8, HUDTextSecondOutlineColor)

        --HP ticks
        for ticks = 0, plyHealthTicks do
            surface.SetDrawColor(HUDTickColor.r, HUDTickColor.g, HUDTickColor.b, 120)
            surface.SetMaterial(mainTickMark)
            surface.DrawTexturedRect(width * 0.04 + (ticks * (tickMarkWidth / 2)), height * 0.85, tickMarkWidth, tickMarkHeight)
        end

        --compass
        render.PushRenderTarget(compassAlphaRT)
            cam.Start2D()
                render.ClearDepth()
                render.Clear( 0, 0, 0, 0 )
                surface.SetDrawColor(HUDColor)
                surface.SetMaterial(compassStrip)

                local percX, percY = ((-ply:GetAngles().y / 360) * 1024 + 135) / 1024, 0 / 64
                local percW, percH = 336 / 1024, 64 / 64
                local vertices = {
                    {x = 0, y = 0, u = percX, v = percY},
                    {x = width * 1024 / 1600, y = 0, u = percX + percW, v = percY},
                    {x = width * 1024 / 1600, y = height * 64 / 900, u = percX + percW, v = percY + percH},
                    {x = 0, y = height * 64 / 900, u = percX, v = percY + percH}
                }
                surface.DrawPoly(vertices)

                render.SetWriteDepthToDestAlpha( false )
                    render.OverrideBlend( true, BLEND_SRC_COLOR, BLEND_SRC_ALPHA, BLENDFUNC_MIN )
                        surface.SetMaterial( compassAlphaMask )
                        surface.DrawTexturedRect( width * 725 / 1600, 0, width * 400 / 1600, height * 64 / 900 )
                    render.OverrideBlend( false )
                render.SetWriteDepthToDestAlpha( true )
            cam.End2D()
        render.PopRenderTarget()

        surface.SetDrawColor(HUDColor)
        surface.SetMaterial(compassAlphaRTMat)
        surface.DrawTexturedRect(width * 0.04375, height * 0.889, 406, 64 )

        --right hud elements
        --right main hud frame
        surface.SetDrawColor(HUDColor)
        surface.SetMaterial(rightHUDElement)
        surface.DrawTexturedRect(width * 0.731, height * 0.81, rightHUDElementWidth, rightHUDElementHeight)

        --AP ticks
        TextDoubleOutlined("AP", "Monofonto_HUD", width * 0.938, height * 0.815, HUDColor, TEXT_ALIGN_LEFT, textOutlineWidth, HUDTextOutlineColor, textOutlineWidth * 1.8, HUDTextSecondOutlineColor)

        --AP ticks
        for ticks = 0, plyAPTicks do
            surface.SetDrawColor(HUDTickColor.r, HUDTickColor.g, HUDTickColor.b, 120)
            surface.SetMaterial(mainTickMark)
            surface.DrawTexturedRect(width * 0.949 - (ticks * (tickMarkWidth / 2)), height * 0.85, tickMarkWidth, tickMarkHeight)
        end

        --Weapon condition
        if (activeWepPrimaryAmmo ~= -1 and plyActiveWeaponCondition ~= nil) then
            TextDoubleOutlined("CND", "Monofonto_HUD", width - (rightHUDElementWidth * 1.07), height - rightHUDElementHeight / 2.78, HUDColor, TEXT_ALIGN_LEFT, textOutlineWidth, HUDTextOutlineColor, textOutlineWidth * 1.8, HUDTextSecondOutlineColor)

            surface.SetDrawColor(HUDDarkColor)
            surface.SetMaterial(conditionBar)
            surface.DrawTexturedRect(width - (rightHUDElementWidth * 0.95), height - rightHUDElementHeight / 2.92, conditionBarWidth, conditionBarHeight)

            surface.SetDrawColor(HUDColor)
            surface.SetMaterial(conditionBar)
            surface.DrawTexturedRect(width - (rightHUDElementWidth * 0.95), height - rightHUDElementHeight / 2.92, plyActiveWeaponCondition * 0.7, conditionBarHeight)

            surface.SetDrawColor(Color(0,0,0))
            surface.SetMaterial(conditionTriangle)
            surface.DrawTexturedRect(width - (rightHUDElementWidth * 0.8325), height - rightHUDElementHeight / 2.92, conditionTriangleWidth, conditionTriangleHeight)
            surface.DrawTexturedRectRotated(width - (rightHUDElementWidth * 0.8125), height - rightHUDElementHeight / 3.50, conditionTriangleWidth, conditionTriangleHeight, 180)
        end

        --Ammo indicator
        --Primary ammo
        if (activeWepPrimaryAmmo ~= -1) then
            local ammoText

            ammoText = plyPrimaryAmmo or ammoText and ErrorNoHalt("Failed to get new value for primary reserve ammo text.\n")
            surface.SetFont("Monofonto_HUD_Ammo")
            local reserveAmmoWidth = width * surface.GetTextSize(ammoText) / 1600
            TextDoubleOutlined(ammoText, "Monofonto_HUD_Ammo", width - (55 + reserveAmmoWidth) - rightHUDElementWidth / 22, height * 0.892, HUDColor, TEXT_ALIGN_LEFT, textOutlineWidth, HUDTextOutlineColor, textOutlineWidth * 1.8, HUDTextSecondOutlineColor)

            if (activeWepMaxPrimaryMag ~= -1) then
                ammoText = "/"
                TextDoubleOutlined(ammoText, "Monofonto_HUD_Ammo", width - (72 + reserveAmmoWidth) - rightHUDElementWidth / 22, height * 0.89, HUDColor, TEXT_ALIGN_LEFT, textOutlineWidth, HUDTextOutlineColor, textOutlineWidth * 1.8, HUDTextSecondOutlineColor)

                ammoText = activeWepPrimaryMag or ammoText and ErrorNoHalt("Failed to get new value for primary magazine ammo text.\n")
                local magazineAmmoWidth = surface.GetTextSize(ammoText)
                TextDoubleOutlined(ammoText, "Monofonto_HUD_Ammo", width - (75 + reserveAmmoWidth + magazineAmmoWidth) - rightHUDElementWidth / 22, height * 0.892, HUDColor, TEXT_ALIGN_LEFT, textOutlineWidth, HUDTextOutlineColor, textOutlineWidth * 1.8, HUDTextSecondOutlineColor)
            end
        end

        --Secondary ammo
        if (activeWepSecondaryAmmo ~= -1) then
            local ammoText
            ammoText = plySecondaryAmmo or ammoText and ErrorNoHalt("Failed to get new value for secondary reserve ammo text.\n")
            surface.SetFont("Monofonto_HUD_Ammo_Secondary")

            local reserveAmmoWidth = width * surface.GetTextSize(ammoText) / 1600
            local secondaryX = width - (58 + reserveAmmoWidth) - rightHUDElementWidth / 22
            local secondaryY = height - (leftHUDElementHeight / 4.1)

            if (activeWepPrimaryAmmo == -1) then
                surface.SetFont("Monofonto_HUD_Ammo")
                reserveAmmoWidth = surface.GetTextSize(ammoText)
                secondaryX, secondaryY = width - (55 + reserveAmmoWidth) - rightHUDElementWidth / 22, height * 0.892

                TextDoubleOutlined(ammoText, "Monofonto_HUD_Ammo", secondaryX, secondaryY, HUDColor, TEXT_ALIGN_LEFT, textOutlineWidth, HUDTextOutlineColor, textOutlineWidth * 1.8, HUDTextSecondOutlineColor)

                surface.SetFont("Monofonto_HUD_Ammo_Secondary")
                reserveAmmoWidth = surface.GetTextSize(ammoText)
            else
                TextDoubleOutlined(ammoText, "Monofonto_HUD_Ammo_Secondary", secondaryX, secondaryY, HUDColor, TEXT_ALIGN_LEFT, textOutlineWidth, HUDTextOutlineColor, textOutlineWidth * 1.8, HUDTextSecondOutlineColor)
            end

            if (activeWepMaxSecondaryMag ~= -1) then
                ammoText = "/"
                TextDoubleOutlined(ammoText, "Monofonto_HUD_Ammo_Secondary", width - (72 + reserveAmmoWidth) - rightHUDElementWidth / 22, height - (leftHUDElementHeight / 5.7), HUDColor, TEXT_ALIGN_LEFT, textOutlineWidth, HUDTextOutlineColor, textOutlineWidth * 1.8, HUDTextSecondOutlineColor)

                ammoText = activeWepSecondaryMag or ammoText and ErrorNoHalt("Failed to get new value for secondary magazine ammo text.\n")
                local magazineAmmoWidth = surface.GetTextSize(ammoText)
                TextDoubleOutlined(ammoText, "Monofonto_HUD_Ammo_Secondary", width - (75 + reserveAmmoWidth + magazineAmmoWidth) - rightHUDElementWidth / 22, height - (leftHUDElementHeight / 5.8), HUDColor, TEXT_ALIGN_LEFT, textOutlineWidth, HUDTextOutlineColor, textOutlineWidth * 1.8, HUDTextSecondOutlineColor)
            end
        end

        --oxygen stuff
        if (plyOxygenTicks > -1 and ((ply:WaterLevel() == 3 and ply:GetMoveType() ~= MOVETYPE_NOCLIP) or plyOxygenTicks < 15)) then
            local oxygenIndicatorXPos, oxygenIndicatorYPos = (width / 2 - oxygenIndicatorWidth / 2), ScrH() * 0.07

            surface.SetDrawColor(HUDColor)
            surface.SetMaterial(oxygenIndicator)
            surface.DrawTexturedRect(oxygenIndicatorXPos, oxygenIndicatorYPos, oxygenIndicatorWidth, oxygenIndicatorHeight)

            surface.SetDrawColor(HUDColor)
            surface.SetMaterial(oxygenIndicatorTick)
            if (plyOxygenTicks ~= 0) then
                for ticks = 0, plyOxygenTicks do
                    local cos, sin = math.cos(math.rad((ticks - 5) * 22.5)), math.sin(math.rad((ticks - 5) * 22.5))
                    local xModifier = ScreenScale(4.375) * sin - ScreenScale(8.875) * cos
                    local yModifier = ScreenScale(4.375) * cos + ScreenScale(8.875) * sin
                    local oxygenIndicatorTickXPos, oxygenIndicatorTickYPos = (oxygenIndicatorXPos + 6), (oxygenIndicatorYPos + oxygenIndicatorTickHeight / 2 + 11)

                    surface.DrawTexturedRectRotated((oxygenIndicatorTickXPos + oxygenIndicatorTickWidth) + xModifier, oxygenIndicatorTickYPos + yModifier, oxygenIndicatorTickWidth, oxygenIndicatorTickHeight, ticks * 22.5)
                end
            end
        end

        --crosshair
        local eyeTraceEntity = ply:GetEyeTraceNoCursor().Entity
        if (IsValid(eyeTraceEntity) and hook.Run("ShouldNewVegasCrosshairHover", eyeTraceEntity)) then
            surface.SetDrawColor(HUDColor)
            surface.SetMaterial(crosshairHover)
            surface.DrawTexturedRect(width / 2 - crosshairHoverWidth / 2, height / 2 - crosshairHoverHeight / 2, crosshairHoverWidth, crosshairHoverHeight)
        else
            surface.SetDrawColor(HUDColor)
            surface.SetMaterial(crosshair)
            surface.DrawTexturedRect(width / 2 - crosshairWidth / 2, height / 2 - crosshairHeight / 2, crosshairWidth, crosshairHeight)
        end

        --explosive indicator
        if (ix.config.Get("showExplosiveIndicator") ~= false) then
            for k, v in pairs (ents.FindInSphere(ply:GetPos(), 192)) do
                if (hook.Run("ShouldEntityDrawExplosiveIndicator", v)) then
                    if (self.explosiveIndicatorAlpha < 255) then
                        self:CreateAnimation(1, {
                            target = {explosiveIndicatorAlpha = 255},
                            easing = "outQuint",
                        })
                    end
                    local explosivePos, plyEyePos, plyEyeAngles = v:GetPos(), ply:EyePos(), ply:EyeAngles()
                    local anglePos = explosivePos - plyEyePos
                    local angleAngle = anglePos:Angle()
                    local rotationAngle = -math.NormalizeAngle(plyEyeAngles.y - angleAngle.y)

                    surface.SetDrawColor(HUDColor.r, HUDColor.g, HUDColor.b, explosiveIndicatorAlpha)
                    surface.SetMaterial(explosiveIndicator)
                    surface.DrawTexturedRectRotated(width / 2, height / 2, explosiveIndicatorWidth, explosiveIndicatorHeight, rotationAngle)
                end
            end
        end
    end
end

vgui.Register("fonvHUD", PANEL, "Panel")

if (IsValid(ix.gui.fonvhud)) then
    vgui.Create("fonvHUD")
end