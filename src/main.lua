-- Whether debugging mode is enabled
DEBUG = true

local logger = require("logger")

---@class GameState
---@field entities Entity[] The entities existing in this game

---@class Entity
---@field x number x coordinate of the entity
---@field y number y coordinate of the entity
---@field width number width of the entity
---@field height number height of the entity
---@field shape "circle" | "rectangle"
---@field mode "fill" | "line"
---@field update fun(self, GameState, number) update function of the entity

---@type GameState
local game_state = { entities = {} }

function love.load()
    local font = love.graphics.newFont("assets/fonts/ka1.ttf")
    love.graphics.setFont(font)

    -- entities
    game_state.entities["rect1"] = {
        x = 10,
        y = 10,
        width = 100,
        height = 100,
        shape = "rectangle",
        mode = "fill",
        update = function(self, _, delta_time)
            if delta_time == nil then delta_time = 1 end
            self.x = self.x + (10 * delta_time)
            self.height = self.height + (10 * delta_time)
        end,
    }
end

function love.update(delta_time)
    for name, entity in pairs(game_state.entities) do
        logger.debug("Updating entity " .. name)
        entity:update(game_state, delta_time)
        logger.debug("rect1.x = " .. entity.x)
        logger.debug("rect1.width = " .. entity.width)
        logger.debug("rect1.y = " .. entity.y)
        logger.debug("rect1.height = " .. entity.height)
    end
end

function love.keypressed(key)
    if key == "escape" then love.event.quit(0) end
end

function love.draw()
    love.graphics.print("Hello World!", 400, 300)

    for name, entity in pairs(game_state.entities) do
        logger.debug("Drawing entity " .. name)
        if entity.shape == "circle" then
            love.graphics.circle(entity.mode, entity.x, entity.y, entity.width)
        elseif entity.shape == "rectangle" then
            love.graphics.rectangle(
                entity.mode,
                entity.x,
                entity.y,
                entity.width,
                entity.height
            )
        end
    end
end
