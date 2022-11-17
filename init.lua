--[[
		Minetest-mod "Sugar", Adds eatable sugar made of papyrus and a sugar block
		Copyright (C) 2022 J. A. Anders

		This program is free software; you can redistribute it and/or modify
		it under the terms of the GNU General Public License as published by
		the Free Software Foundation; version 3 of the License.

		This program is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY; without even the implied warranty of
		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
		GNU General Public License for more details.

		You should have received a copy of the GNU General Public License
		along with this program; if not, write to the Free Software
		Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
		MA 02110-1301, USA.
]]

--
-- Mod Version 0.1
--

sugar = {}

-- Get Translator
local S = minetest.get_translator("sugar")
sugar.get_translator = S
local S = sugar.get_translator


-- Item and block

minetest.register_craftitem("sugar:sugar", {
  description = S("Sugar"),
  inventory_image = "sugar_sugar.png",
  on_use = minetest.item_eat(1),
})

minetest.register_node("sugar:sugar_block", {
  description = S("Block of Sugar"),
  inventory_image = minetest.inventorycube("sugar_sugar_block.png"),
  tiles = {"sugar_sugar_block.png"},
  groups = {cracky = 3},
})


-- Decay of the sugar block near water

minetest.register_abm({
  nodenames = {"sugar:sugar_block"},
  neighbours = {"group:water"},
  interval = 35,
  chance = 25,
  action = function(pos)
    minetest.set_node(pos, { name = "air" })
  end,
})


-- Crafting

minetest.register_craft({
  type = "shapeless",
  output = "sugar:sugar",
  recipe = {
    "default:papyrus",
  },
})

minetest.register_craft({
  type = "shaped",
  output = "sugar:sugar_block",
  recipe = {
    {"sugar:sugar","sugar:sugar","sugar:sugar"},
    {"sugar:sugar","sugar:sugar","sugar:sugar"},
    {"sugar:sugar","sugar:sugar","sugar:sugar"},
  },
})

minetest.register_craft({
  type = "shapeless",
  output = "sugar:sugar 9",
  recipe = {
    "sugar:sugar_block",
  },
})