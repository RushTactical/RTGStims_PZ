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

function InjectMorphine(player)
    local stats = player:getStats();
    local bodyDamage = player:getBodyDamage();
    local char = player;
    stats:setPain(math.max(((stats:getPain()) - (0.15)), 0));
    bodyDamage:setBoredomLevel(math.max(((bodyDamage:getBoredomLevel()) - (8.0)), 0));
end

function InjectAdrenaline(player)
    

function InjectHemostaticA(player)
    local bodyDamage = player:getBodyDamage();
    local bodyParts = bodyDamage:getBodyParts();
    for i = 0, bodyParts:size() - 1 do
        local bodyPart = bodyParts:get(i);
        bodyPart:setBleedingTime(bodyPart:getBleedingTime() - 2); --reduces bleeding by 2
    end
end

function InjectHemostaticB(player)
    local bodyDamage = player:getBodyDamage()                 --used to get the body damage
    local bodyParts = bodyDamage:getBodyParts()               --used to get the body parts
    for i = 0, bodyParts:size() - 1 do                        -- loops adding 1 to i each time until i is greater than bodyParts:size()-1
        local bodyPart = bodyParts:get(i)
        bodyPart:setBleedingTime(bodyPart:getBleedingTime() - 10) --stops the bleeding
    end
end

function InjectZombCure(player)
    local AddHealth = 0.0
    local charBD = player:getBodyDamage()
    charBD:setInfectionLevel(AddHealth)     --removes infection
end

-- Define the duration in seconds (30 in-game minutes in this case)
local durationInSeconds = 1800

-- Function to set endurance change
function setEnduranceUnlimited(player)
    if player then
        player:setEnduranceChange(0) -- Set endurance change to 0 to prevent loss
        print("Endurance unlimited for 30 in-game minutes")

        -- After the specified duration, reset the endurance change to its default value
        setTimer(durationInSeconds, "resetEndurance", player)
    end
end

-- Function to reset endurance change to default after the specified duration
function resetEndurance(player)
    if player then
        player:setEnduranceChange(-0.0001) -- Set it to a small negative value to resume normal endurance loss
        print("Endurance returned to normal")
    end
end

-- Modify the InjectAdrenaline function to include endurance changes
function InjectAdrenaline(player)
    if player then
        print("Injecting adrenaline!")

        -- Your existing adrenaline injection logic goes here

        -- Call the function to set endurance to unlimited after injecting adrenaline
        setEnduranceUnlimited(player)
    end
end