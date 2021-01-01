local name = "mining-depot"
local depots = names.depots

local radius = depots["mining-depot"].radius
local drop_offset = depots["mining-depot"].drop_offset

local mining_depot =
{
  name = "mining-depot",
  type = "assembling-machine",
  collision_box = {{ -1.25, -3.25}, { 1.25, 1.25}},
  alert_icon_shift = { -0.09375, -0.375},
  allowed_effects = {},
  close_sound =
  {
    {
      filename = "__base__/sound/machine-close.ogg",
      volume = 0.5
    }
  },
  collision_mask =
  {
    "item-layer",
    "object-layer",
    "water-tile",
    "resource-layer"
  },
  corpse = "assembling-machine-3-remnants",
  crafting_categories =
  {
    "mining-depot"
  },
  crafting_speed = depots["mining-depot"].capacity - 1,
  damaged_trigger_effect =
  {
    damage_type_filters = "fire",
    entity_name = "spark-explosion",
    offset_deviation = {{ -0.5, -0.5}, { 0.5, 0.5}},
    offsets = {{ 0, 1}},
    type = "create-entity"
  },
  drawing_box = {{ -1.5, -1.7}, { 1.5, 1.5}},
  dying_explosion = "assembling-machine-3-explosion",
  energy_source =
  {
    emissions_per_second_per_watt = 0.1,
    type = "void",
    usage_priority = "secondary-input"
  },
  energy_usage = "1W",
  fast_replaceable_group = "assembling-machine",
  flags =
  {
    "placeable-neutral",
    "player-creation"
  },
  fluid_boxes =
  {
    off_when_no_fluid_recipe = false
  },
  gui_title_key = "mining-depot-choose-resource",
  icon = "__Mining_Drones__/data/entities/mining_depot/depot-icon.png",
  icon_mipmaps = 4,
  icon_size = 216,
  localised_name =  {"mining-depot"},
  max_health = 400,
  minable =
  {
    mining_time = 1,
    result = "mining-depot"
  },
  open_sound =
  {
    {
      filename = "__base__/sound/machine-open.ogg",
      volume = 0.5
    }
  },
  radius_visualisation_specification =
  {
    distance =  radius,
    offset = {drop_offset[1], (drop_offset[2] - radius) - 0.5},
    sprite =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      height = 10,
      width = 10
    }
  },
  resistances =
  {
    {
      percent = 70,
      type = "fire"
    }
  },
  scale_entity_info_icon = true,
  selection_box = {{ -1.5, -3.5}, { 1.5, 1.5}},
  vehicle_impact_sound =
  {
    {
      filename = "__base__/sound/car-metal-impact-2.ogg",
      volume = 0.5
    },
    {
      filename = "__base__/sound/car-metal-impact-3.ogg",
      volume = 0.5
    },
    {
      filename = "__base__/sound/car-metal-impact-4.ogg",
      volume = 0.5
    },
    {
      filename = "__base__/sound/car-metal-impact-5.ogg",
      volume = 0.5
    },
    {
      filename = "__base__/sound/car-metal-impact-6.ogg",
      volume = 0.5
    }
  },
  working_sound =
  {
    audible_distance_modifier = 0.5,
    fade_in_ticks = 4,
    fade_out_ticks = 20,
    sound =
    {
      {
        filename = "__base__/sound/assembling-machine-t3-1.ogg",
        volume = 0.45
      }
    }
  },
  working_visualisations =
  {
    {
      always_draw = true,
      east_animation =
      {
        layers =
        {
          {
            filename = "__Mining_Drones__/data/entities/mining_depot/depot-east.png",
            frame_count = 1,
            height = 192,
            scale = 0.5,
            shift = { 1, 0},
            width = 320
          }
        }
      },
      north_animation =
      {
        layers =
        {
          {
            filename = "__Mining_Drones__/data/entities/mining_depot/depot-north.png",
            frame_count = 1,
            height = 320,
            scale = 0.5,
            shift = { 0, -1},
            width = 192
          }
        }
      },
      render_layer = "floor",
      south_animation =
      {
        layers =
        {
          {
            filename = "__Mining_Drones__/data/entities/mining_depot/depot-south.png",
            frame_count = 1,
            height = 320,
            scale = 0.5,
            shift = {0,1},
            width = 192
          }
        }
      },
      west_animation =
      {
        layers =
        {
          {
            filename = "__Mining_Drones__/data/entities/mining_depot/depot-west.png",
            frame_count = 1,
            height = 192,
            scale = 0.5,
            shift = { -1, 0 },
            width = 320
          }
        }
      }
    }
  }
}

local item =
{
  type = "item",
  name = name,
  icon = mining_depot.icon,
  icon_size = mining_depot.icon_size,
  flags = {},
  subgroup = "extraction-machine",
  order = "za"..name,
  place_result = name,
  stack_size = 5
}

local category =
{
  type = "recipe-category",
  name = name
}

local recipe =
{
  type = "recipe",
  name = name,
  localised_name = {name},
  enabled = true,
  ingredients =
  {
    {"iron-plate", 50},
    {"iron-gear-wheel", 10},
    {"iron-stick", 20},
  },
  energy_required = 5,
  result = name
}

local caution_sprite =
{
  type = "sprite",
  name = "caution-sprite",
  filename = util.path("data/entities/mining_depot/depot-caution.png"),
  width = 101,
  height = 72,
  frame_count = 1,
  scale = 0.5,
  shift = shift,
  direction_count =1,
  draw_as_shadow = false,
  flags = {"terrain"}
}

local caution_corpse =
{
  type = "corpse",
  name = "caution-corpse",
  flags = {"placeable-off-grid"},
  animation = caution_sprite,
  remove_on_entity_placement = false,
  remove_on_tile_placement = false
}

local box =
{
  type = "highlight-box",
  name = "mining-depot-collision-box",
  collision_mask = {"player-layer"}
}

data:extend
{
  mining_depot,
  item,
  category,
  recipe,
  caution_sprite,
  caution_corpse,
  box
}

--error(count)