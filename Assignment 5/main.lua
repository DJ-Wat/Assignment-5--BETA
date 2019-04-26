--print(display.actualContentWidth)
--print(display.actualContentHeight)

local Background = display.newImage ("./assets/BG.jpg")

local playerBall = display.newImageRect ("./assets/ball2.png", 50, 50)
playerBall.x = display.contentCenterX
playerBall.y = display.contentCenterY - 100
playerBall.id = "player"
playerBall.isFixedRotation = true

local enemyBall = display.newImageRect ("./assets/ball1.png", 20, 20)
enemyBall.x = display.contentCenterX
enemyBall.y = display.contentCenterY - 160
enemyBall.id = "enemy"

local eSpeedX
local eSpeedY

local upArrow = display.newImage( "./assets/upArrow.png" )

upArrow.x = 150

upArrow.y = 330

upArrow.alpha = 0.5

upArrow.id = "up arrow"

local downArrow = display.newImage( "./assets/downArrow.png" )

downArrow.x = 150

downArrow.y = 450

downArrow.alpha = 0.5

downArrow.id = "down arrow"

local leftArrow = display.newImage( "./assets/leftArrow.png" )

leftArrow.x = 90

leftArrow.y = 390

leftArrow.alpha = 0.5

leftArrow.id = "left arrow"

local rightArrow = display.newImage( "./assets/rightArrow.png" )
 
rightArrow.x = 210

rightArrow.y = 390

rightArrow.alpha = 0.5

rightArrow.id = "right arrow"

local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0)
physics.setDrawMode( "hybrid" )

local leftWall = display.newRect( -230, display.contentHeight / 2, 500, display.contentHeight )

leftWall:setFillColor( 0,3,10 )



physics.addBody( leftWall, "static", { 

    friction = 0.5, 

    bounce = 0.3 

    } )

local rightWall = display.newRect( 550, display.contentHeight / 2, 500, display.contentHeight )

rightWall:setFillColor( 0,3,10 )

physics.addBody( rightWall, "static", { 

    friction = 0.5, 

    bounce = 0.3 

    } )

local topWall = display.newRect( 0, -250, display.contentWidth * 2, 500 )

topWall:setFillColor( 0,3,10 )

physics.addBody( topWall, "static", { 

    friction = 0.5, 

    bounce = 0.3 

    } )

local bottomWall = display.newRect( 0, 250, display.contentWidth * 2, 70 )

bottomWall:setFillColor( 0,3,10 )

physics.addBody( bottomWall, "static", { 

    friction = 0.5, 

    bounce = 0.3 

    } )

physics.addBody( playerBall, "dynamic", { 

    density = 0.5, 

    friction = 0.5, 

    bounce = 0.3

    } )

physics.addBody( enemyBall, "dynamic", { 

    density = 0.5, 

    friction = 0.5, 

    bounce = 0.3

    } )

function upArrow:touch( event )

    if ( event.phase == "ended" ) then

        -- move the character up

        transition.moveBy( playerBall, { 

            x = 0, -- move 0 in the x direction 

            y = -25, -- move up 50 pixels

            time = 100 -- move in a 1/10 of a second

            } )

    end



    return true

end

function downArrow:touch( event )

    if ( event.phase == "ended" ) then

        -- move the character down

        transition.moveBy( playerBall, { 

            x = 0, -- move 0 in the x direction 

            y = 25, -- move down 50 pixels

            time = 100 -- move in a 1/10 of a second

            } )

    end



    return true

end

function leftArrow:touch( event )

    if ( event.phase == "ended" ) then

        -- move the character up

        transition.moveBy( playerBall, { 

            x = -25, -- move 50 pixels left 

            y = 0, 

            time = 100 -- move in a 1/10 of a second

            } )

    end



    return true

end

function rightArrow:touch( event )

    if ( event.phase == "ended" ) then

        -- move the character up

        transition.moveBy( playerBall, { 

            x = 25, -- move 50 pixelfs right

            y = 0, 

            time = 100 -- move in a 1/10 of a second

            } )

    end



    return true

end

local function playerCollision (event)
	if ( event.phase == "began") then

		local thing1 = event.object1
		local thing2 = event.object2

		if ((object1.id == "enemy" and object2.id == "player") or
			(object1.id == "player" and object2.id == "enemy")) then

			display.remove (thing1)
			display.remove (thing2)
			local GameOver = display.newText ("Game Over", display.contentCenterX, display.contentCenterY, native.systemFont, 30)
		end
	end
end






upArrow:addEventListener( "touch", upArrow )
downArrow:addEventListener( "touch", downArrow )
leftArrow:addEventListener( "touch", leftArrow )
rightArrow:addEventListener( "touch", rightArrow )

playerBall.collision = playerCollision
playerBall:addEventListener("collision") 

enemyBall.collision = playerCollision
enemyBall:addEventListener("collision") 
