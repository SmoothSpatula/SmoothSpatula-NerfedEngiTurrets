-- NerfedEngiTurrets v1.0.0
-- SmoothSpatula

log.info("Successfully loaded ".._ENV["!guid"]..".")
mods["RoRRModdingToolkit-RoRR_Modding_Toolkit"].auto()

local post_initialize = function()
    for i, _ in ipairs(Class.ITEM) do
        local item = Item.wrap(i-1)
        item.loot_tags = item.loot_tags | Item.LOOT_TAG.item_blacklist_engi_turrets
    end
end
Initialize(post_initialize, true)
