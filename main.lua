-- NerfedEngiTurrets v1.0.0
-- SmoothSpatula

log.info("Successfully loaded ".._ENV["!guid"]..".")

local hooks = {}
hooks["gml_Object_oStartMenu_Step_2"] = function() -- mod init
    hooks["gml_Object_oStartMenu_Step_2"] = nil
    local items = gm.variable_global_get("class_item")

    for i=1, #items do -- for all items
        if items[i] ~= nil and (items[i][15] >> 6)%2 ~= 1 then -- if item_blacklist_engi_turrets flag is off
            items[i][15] = items[i][15] + (1 << 6) -- turn item_blacklist_engi_turrets on
        end
    end
end

gm.post_code_execute(function(self, other, code, result, flags) 
    if hooks[code.name] then
        hooks[code.name](self)
    end
end)
