local composer = require( "composer" )
local scene = composer.newScene()

---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

local physics = require "physics"
physics.start()
physics.setGravity( 0, 20 )
physics.setDrawMode( "hybrid" )
local mydata = require( "mydata" )

---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view

   local options =
   {
      frames =
      {
        --frame 1
        {
            x = 0,
            y = 0,
            width = 75,
            height = 75
        },
        --frame 2
        {    
            x = 75,
            y = 0,
            width = 500,
            height = 75
        }
      }
   }

   local sheet = graphics.newImageSheet( "gems.png", options )

   local gems = {}

   for i=75,75*10,75 do
   	for e=75,75*10,75 do
     gems["gem"..i] = display.newImage( sheet, 1, i, e )
     physics.addBody(gems["gem"..i], { density=1, friction=1, bounce=0 })
     gems["gem"..i].isFixedRotation = true
    end
   end
   
   local frame2 = display.newImage( sheet, 2, 300, 950)
   physics.addBody(frame2)
   frame2.bodyType = 'static'

end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

end

-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

end

-- "scene:destroy()"
function scene:destroy( event )

   local sceneGroup = self.view

   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene










