Player = {}
 
-- Constructor
function Player:new()
    -- define our parameters here
    local object = {
    x = 120,
    y = 580,
    width = 30,
    height = 20,
    speed = 180,
    velocity = 0,
    state = "",
    }
    setmetatable(object, { __index = Player })
    return object
end
 
function Player:moveRight()
    self.velocity = self.speed
end
 
function Player:moveLeft()
    self.velocity = -1 * (self.speed)
end
 
function Player:stop()
    self.velocity = 0
end
 
-- Update function
function Player:update(dt)
    -- update the Player's position
    self.x = self.x + (self.velocity * dt)
    
    -- update the Player's state
    if self.velocity > 0 then
	self.state = "right"
    elseif self.velocity < 0 then
	self.state = "left"
    else
	self.state = "idle"
    end
end
