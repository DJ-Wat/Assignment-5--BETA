local Background = display.newImage ("./assets/BG.jpg")

local playerBall = display.newImageRect ("./assets/ball2.png", 50, 50)
playerBall.x = display.contentCenterX
playerBall.y = display.contentCenterY - 100


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

local leftWall = display.newRect( 0, display.contentHeight / 2, 1, display.contentHeight )

leftWall:setFillColor( 0,3,10 )

physics.addBody( leftWall, "static", { 

    friction = 0.5, 

    bounce = 0.3 

    } )

local leftWall = display.newRect( 0, display.contentHeight / 2, 1, display.contentHeight )

leftWall:setFillColor( 0,3,10 )

physics.addBody( leftWall, "static", { 

    friction = 0.5, 

    bounce = 0.3 

    } )



function upArrow:touch( event )

    if ( event.phase == "ended" ) then

        -- move the character up

        transition.moveBy( playerBall, { 

        	x = 0, -- move 0 in the x direction 

        	y = -50, -- move up 50 pixels

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

        	y = 50, -- move down 50 pixels

        	time = 100 -- move in a 1/10 of a second

        	} )

    end



    return true

end

function leftArrow:touch( event )

    if ( event.phase == "ended" ) then

        -- move the character up

        transition.moveBy( playerBall, { 

        	x = -50, -- move 50 pixels left 

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

        	x = 50, -- move 50 pixelfs right

        	y = 0, 

        	time = 100 -- move in a 1/10 of a second

        	} )

    end



    return true

end




upArrow:addEventListener( "touch", upArrow )
downArrow:addEventListener( "touch", downArrow )
leftArrow:addEventListener( "touch", leftArrow )
rightArrow:addEventListener( "touch", rightArrow )