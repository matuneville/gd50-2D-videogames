--[[
    ##### Paddle class #####
    
    A class to instantiate player's paddle of the videogame.
    Used in the main program to deflect the ball toward the bricks.
    
    ---------------------
    - Created by Neville
    - 2024
]]

Paddle = Class()

--[[
    Methods
]]

-- Constructor
function Paddle:init()
    -- had to define these two variables here because if done it
    -- in the outer code, it was loaded before the love.load() at main
    -- and gTextures wasn't initializated
    local tileWidth = gTextures['blocks']:getWidth() / 6
    local tileHeight = gTextures['blocks']:getHeight() / 12

    -- starting dimensions
    self.width = 2*tileWidth
    self.height = 1*tileHeight

    self.x = VIRT_WIDTH / 2 - self.width / 2
    self.y = VIRT_HEIGHT - 16 - self.height

    self.dx = PADDLE_SPEED

    -- start with middle paddle of the first color
    self.size = 2

    self.skin = 1
end


-- Update each frame
function Paddle:update(dt)

    -- Check movement
    if love.keyboard.isDown('left') or love.keyboard.isDown('a') then
        self.x = math.max(1, self.x - dt * self.dx)
    end
    if love.keyboard.isDown('right') or love.keyboard.isDown('d') then
        self.x = math.min(VIRT_WIDTH - self.width - 1, self.x + dt * self.dx)
    end
    
end

-- Draw player's paddle
function Paddle:render()
    love.graphics.draw(gTextures['blocks'], -- drawable
                       -- quad, we jump 4 skins so we see the same size skin of next color
                       gFrames['paddles'][self.skin+4*(self.skin-1)], 
                       self.x, -- coords
                       self.y)
end
