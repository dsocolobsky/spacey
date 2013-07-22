function love.load()
    g = love.graphics
    floorlvl = 500
    playerColor = {255,0,128}
    groundColor = {25,200,25}
    
    -- create our player and set initial values
    require "player"
    p = Player:new()
end
 
function love.update(dt)
    if love.keyboard.isDown("right") then
        p:moveRight()
    end
    if love.keyboard.isDown("left") then
        p:moveLeft()
    end
    
    -- if the x key is pressed...
    if love.keyboard.isDown("space") then
    -- make the player jump
        --p:shoot()
    end
 
    -- update the player's position
    p:update(dt)
 
    -- stop the player when they hit the borders
    if p.x > 800 - p.width then p.x = 800 - p.width end
    if p.x < 0 then p.x = 0 end
    if p.y < 0 then p.y = 0 end
end
 
function love.draw()
    -- round down our x, y values
    local x = math.floor(p.x)
    local y = math.floor(p.y)
        
    -- draw the player shape
    g.setColor(playerColor)
    g.rectangle("fill", x, y, p.width, p.height)

    -- debug information
    g.setColor(255, 255, 255)
    local isTrue = ""
    g.print("Player coordinates: ("..x..","..y..")", 5, 5)
    g.print("Current state: "..p.state, 5, 20)
end
 
function love.keyreleased(key)
    if key == "escape" then
        love.event.push("q")   -- actually causes the app to quit
    end
    if (key == "right") or (key == "left") then
        p:stop()
    end
end
