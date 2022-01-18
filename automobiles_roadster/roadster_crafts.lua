--
-- items
--

-- body
minetest.register_craftitem("automobiles_roadster:roadster_body",{
	description = "Roadster body",
	inventory_image = "roadster_body.png",
})
-- engine
minetest.register_craftitem("automobiles_roadster:engine",{
	description = "Roadster engine",
	inventory_image = "roadster_engine.png",
})
-- wheel
minetest.register_craftitem("automobiles_roadster:wheel",{
	description = "Roadster wheel",
	inventory_image = "roadster_wheel.png",
})

-- roadster
minetest.register_craftitem("automobiles_roadster:roadster", {
	description = "Roadster",
	inventory_image = "automobiles_roadster.png",
    liquids_pointable = false,

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
        
        local pointed_pos = pointed_thing.above
		--pointed_pos.y=pointed_pos.y+0.2
		local car = minetest.add_entity(pointed_pos, "automobiles_roadster:roadster")
		if car and placer then
            local ent = car:get_luaentity()
            local owner = placer:get_player_name()
            if ent then
                ent.owner = owner
			    car:set_yaw(placer:get_look_horizontal())
			    itemstack:take_item()
                ent.object:set_acceleration({x=0,y=-automobiles.gravity,z=0})
            end
		end

		return itemstack
	end,
})

--
-- crafting
--
if minetest.get_modpath("default") then
	minetest.register_craft({
		output = "automobiles_roadster:roadster",
		recipe = {
			{"automobiles_roadster:wheel", "automobiles_roadster:engine", "automobiles_roadster:wheel"},
			{"automobiles_roadster:wheel","automobiles_roadster:roadster_body",  "automobiles_roadster:wheel"},
		}
	})
	minetest.register_craft({
		output = "automobiles_roadster:roadster_body",
		recipe = {
            {"default:glass" ,"","default:steel_ingot"},
			{"default:steel_ingot","default:steelblock","default:steel_ingot"},
			{"group:wood","group:wood", "group:wood"},
		}
	})
	minetest.register_craft({
		output = "automobiles_roadster:engine",
		recipe = {
			{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
			{"default:steelblock","default:mese_block", "default:steelblock"},
		}
	})
	minetest.register_craft({
		output = "automobiles_roadster:wheel",
		recipe = {
			{"group:wood", "default:stick", "group:wood"},
			{"default:stick","group:wood",  "default:stick"},
            {"group:wood", "default:stick", "group:wood"},
		}
	})
end



--[[if minetest.get_modpath("default") then
    if not minetest.registered_items["hidroplane:wings"] then
	    minetest.register_craft({
		    output = "supercub:wings",
		    recipe = {
			    {"wool:white", "farming:string", "wool:white"},
			    {"group:wood", "group:wood", "group:wood"},
			    {"wool:white", "default:steel_ingot", "wool:white"},
		    }
	    })
    end
    if not minetest.registered_items["hidroplane:fuselage"] then
	    minetest.register_craft({
		    output = "supercub:fuselage",
		    recipe = {
			    {"default:steel_ingot", "default:diamondblock", "default:steel_ingot"},
			    {"wool:white", "default:steel_ingot",  "wool:white"},
			    {"default:steel_ingot", "default:mese_block",   "default:steel_ingot"},
		    }
	    })
    end
	minetest.register_craft({
		output = "supercub:supercub",
		recipe = {
			{"supercub:wings",},
			{"supercub:fuselage",},
		}
	})
	minetest.register_craft({
		output = "supercub:supercub",
		recipe = {
			{"hidroplane:wings",},
			{"hidroplane:fuselage",},
		}
	})
end]]--