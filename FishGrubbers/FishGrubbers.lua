FishLogData = {} -- initial value (will be overwritten when/if SavedVariables load)

local f = CreateFrame("Frame")
f:RegisterEvent("LOOT_OPENED")

local function Log_Loot()
	local n = GetNumLootItems()
	for i = 1, n do
    if( IsFishingLoot() ) then
      -- 0. for test
       --PlaySound("FISHING REEL IN");          
       --LootFramePortraitOverlay:SetTexture("Interface\\LootFrame\\FishingLoot-Icon");

      local item = GetLootSlotLink(i)
      
      local itemName = select(1, GetItemInfo(item))
      local itemLink = select(2, GetItemInfo(item))
      local itemId = select(2, strsplit(":", itemLink, 3))
      local itemRarity = select(3, GetItemInfo(item))
      local itemLevel = select(4, GetItemInfo(item))
      local itemReqLevel = select(5, GetItemInfo(item))
      local itemType = select(6, GetItemInfo(item))
      local itemSubType = select(7, GetItemInfo(item))
      local itemPrice = select(11, GetItemInfo(item))
      
      local text = format("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s",date(),itemId,itemName,itemType,itemSubType,itemRarity,itemLevel,itemLink,itemReqLevel, GetRealZoneText(), GetSubZoneText(), GetMinimapZoneText())
      table.insert(FishLogData, text)

    end

	end
end

f:SetScript("OnEvent", Log_Loot)