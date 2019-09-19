local addonName = ...
local addon = _G[addonName] or CreateFrame("Frame", addonName)
local backpackButton = MainMenuBarBackpackButton
local backpackButtonText = MainMenuBarBackpackButtonCount

function addon:UpdateFreeSlotCount()
   backpackButtonText:SetText(format("(%d)", backpackButton.freeSlots))
end

function addon:Initialize()
   if not backpackButton then
      print("|cff00ffffFreeSpace|r: The default UI has been modifed. As such, your bags' free space count cannot be inserted added where it needs to be. You should either go back to the default GUI, or find an addon that will modify the GUI in the way you want as well as giving you your bag item count.")
      return
   end
   self:UpdateFreeSlotCount()
   self:RegisterEvent("BAG_UPDATE")
end

addon.BAG_UPDATE = addon.UpdateFreeSlotCount
addon.PLAYER_ENTERING_WORLD = addon.Initialize

addon:SetScript("OnEvent", function(self, event, ...) self[event](self, event, ...) end)

addon:RegisterEvent("PLAYER_ENTERING_WORLD")