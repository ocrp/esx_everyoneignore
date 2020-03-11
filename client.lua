--- ESX Stuff ---
ESX               			= nil
  
  Citizen.CreateThread(function()
	  while ESX == nil do
		  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		  Citizen.Wait(0)
	  end
  end)

-- animalList = {
-- 	"a_c_boar", 
-- 	"a_c_cat_01", 
-- 	"a_c_chimp", 
-- 	"a_c_chop", 
-- 	"a_c_cormorant", 
-- 	"a_c_cow", 
-- 	"a_c_chickenhawk", 
-- 	"a_c_coyote", 
-- 	"a_c_crow", 
-- 	"a_c_deer", 
-- 	"a_c_dolphin", 
-- 	"a_c_fish", 
-- 	"a_c_hen", 
-- 	"a_c_humpback",
-- 	"a_c_husky",
-- 	"a_c_killerwhale",
-- 	"a_c_mtlion",
-- 	"a_c_pig",
-- 	"a_c_pigeon",
-- 	"a_c_poodle",
-- 	"a_c_rabbit_01",
-- 	"a_c_rat",
-- 	"a_c_retriever",
-- 	"a_c_rhesus",
-- 	"a_c_rottweiler",
-- 	"a_c_seagull",
-- 	"a_c_sharkhammer",
-- 	"a_c_sharktiger",
-- 	"a_c_shepherd",
-- 	"a_c_westy"
-- }


Citizen.CreateThread(function()
	Citizen.Wait(0)
	local peds  = {}

	SetMaxWantedLevel(0)
	SetPoliceIgnorePlayer(GetPlayerPed(), true)
	SetEveryoneIgnorePlayer(GetPlayerPed(), true)
	SetPlayerCanBeHassledByGangs(GetPlayerPed(), false)
	SetIgnoreLowPriorityShockingEvents(GetPlayerPed(), true)

	while true do		
		Citizen.Wait(100)
		
		peds  = ESX.Game.GetPeds()

		for i=1, #peds, 1 do	

			local pedmodel = GetEntityModel(peds[i])

			if pedmodel ~= `a_c_deer` and 
					pedmodel ~= `a_c_mtlion` and 
					pedmodel ~= `a_c_coyote` and 
					pedmodel ~= `a_c_boar` and 
					pedmodel ~= `a_c_coyote` and 
					pedmodel ~= `a_c_hen` and 
					pedmodel ~= `a_c_dolphin` and 
					pedmodel ~= `a_c_humpback` and 
					pedmodel ~= `a_c_killerwhale` and 
					pedmodel ~= `a_c_rat` and 
					pedmodel ~= `a_c_rabbit_01` and 
					pedmodel ~= `a_c_sharktiger` and 
					pedmodel ~= `a_c_sharkhammer` then 
				SetBlockingOfNonTemporaryEvents(peds[i], true)	
				SetPedFleeAttributes(peds[i], 0, false)
				SetPedCombatAbility(peds[i], 17, true)
			end

		end

		peds = {}
    end
end)