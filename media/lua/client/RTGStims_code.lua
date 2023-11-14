--  $$$$$$$\ $$$$$$$$\  $$$$$$\         $$$$$$\                      $$\            $$\                           $$\       $$\      $$\                 $$\           
--  $$  __$$\\__$$  __|$$  __$$\       $$  __$$\                     \__|           $$ |                         $$  |      $$$\    $$$ |                $$ |          
--  $$ |  $$ |  $$ |   $$ /  \__|      $$ /  \__| $$$$$$$\  $$$$$$\  $$\  $$$$$$\ $$$$$$\    $$$$$$$\           $$  /       $$$$\  $$$$ | $$$$$$\   $$$$$$$ | $$$$$$$\ 
--  $$$$$$$  |  $$ |   $$ |$$$$\       \$$$$$$\  $$  _____|$$  __$$\ $$ |$$  __$$\\_$$  _|  $$  _____|         $$  /        $$\$$\$$ $$ |$$  __$$\ $$  __$$ |$$  _____|
--  $$  __$$<   $$ |   $$ |\_$$ |       \____$$\ $$ /      $$ |  \__|$$ |$$ /  $$ | $$ |    \$$$$$$\          $$  /         $$ \$$$  $$ |$$ /  $$ |$$ /  $$ |\$$$$$$\  
--  $$ |  $$ |  $$ |   $$ |  $$ |      $$\   $$ |$$ |      $$ |      $$ |$$ |  $$ | $$ |$$\  \____$$\        $$  /          $$ |\$  /$$ |$$ |  $$ |$$ |  $$ | \____$$\ 
--  $$ |  $$ |  $$ |   \$$$$$$  |      \$$$$$$  |\$$$$$$$\ $$ |      $$ |$$$$$$$  | \$$$$  |$$$$$$$  |      $$  /           $$ | \_/ $$ |\$$$$$$  |\$$$$$$$ |$$$$$$$  |
--  \__|  \__|  \__|    \______/        \______/  \_______|\__|      \__|$$  ____/   \____/ \_______/       \__/            \__|     \__| \______/  \_______|\_______/ 
--                                                                       $$ |                                                                                          
--                                                                       $$ |                                                                                          
--                                                                       \__|                                                                                         

--        Workshop ID: 

--        By: Rush, CaptainBusketTTV

-- Propital
PropitalTicks = 0
-- create the function to inject the propital
function InjectPropital(player)
    local AddHealth = 25.0
-- create the function to add health to the player
    local function everyOneMinute()
        player:getBodyDamage():AddGeneralHealth(AddHealth)
        -- start ticking for propital
        PropitalTicks = PropitalTicks + 1
        -- create the check to see if ten ticks have been met and resets to 0
        if PropitalTicks == 10 then
            Events.EveryOneMinute.remove(everyOneMinute)
            PropitalTicks = 0
        end
    end
-- Adds event to add 25 health every one minute in game
    Events.EveryOneMinute.add(everyOneMinute)
    PropitalTicks = 0
end