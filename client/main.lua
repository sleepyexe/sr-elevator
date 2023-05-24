CreateThread(function()
    for elevatorName,elevatorFloors in pairs(shElevator.list) do
        for index, floor in pairs(elevatorFloors) do
			print(json.encode(floor))
            exports.ox_target:addBoxZone({
                coords = floor.coords,
                size = floor.size,
                rotation = floor.rotation,
                options = {
                    {
                        name = floor.name,
						tempat = floor.tempat,
                        icon = "fas fa-hand",
                        label = "Gunakan Elevator",
                        event = "loveless_job:listLantai",
                        elevator = elevatorName,
                        level = index
                    }
                }
            })
        end
    end
end)

RegisterNetEvent("loveless_job:listLantai", function(data)
	local elevator = {}
	local floor = {}
	PlayerData = ESX.GetPlayerData()
	for index, floor in pairs(shElevator.list[data.elevator]) do
			table.insert(elevator, {
				title = floor.name,
				description = floor.tempat,
				disabled = isDisabled(index, floor, data),
				event = "loveless_job:pindahLantai",
				args =  floor 
			})
	end
	lib.registerContext({
		id = 'ElevatorsMenu',
		title = 'Elevator Floor Select',
		options = elevator
	})
	lib.showContext('ElevatorsMenu')
end)

RegisterNetEvent("loveless_job:pindahLantai", function(arg)
	local floor = {}
	floor = arg
	local ped = cache.ped
	DoScreenFadeOut(1500)
	while not IsScreenFadedOut() do
		Wait(10)
	end
	RequestCollisionAtCoord(floor.koordinat.x, floor.koordinat.y, floor.koordinat.z)
	while not HasCollisionLoadedAroundEntity(ped) do
		Wait(0)
	end
	SetEntityCoords(ped, floor.koordinat.x, floor.koordinat.y, floor.koordinat.z, false, false, false, false)
	SetEntityHeading(ped, floor.koordinat.w and floor.koordinat.w or 0.0)
	Wait(shElevator.WaitTime*1000)
	DoScreenFadeIn(1500)
end)

function isDisabled(index, floor, data)
	if index == data.level then return true end
	PlayerData = ESX.GetPlayerData()
    local hasJob, hasItem = false, false
	if floor.groups ~= nil and next(floor.groups) then
		for jobName, gradeLevel in pairs(floor.groups) do
			if ESX.PlayerData.job.name == jobName and ESX.PlayerData.job.grade >= gradeLevel then
				hasJob = true
				break
			end
		end
	end
	if floor.items ~= nil and next(floor.items) then
			for i = 1, #floor.items, 1 do
				for k, v in ipairs(PlayerData.inventory) do
					if v.name == floor.items[i] and v.count > 0 then
						hasItem = true
						break
					end
				end
			end
	end
	if floor.groups == nil and floor.items == nil then return false end 
	return floor.jobAndItem and not (hasJob and hasItem) or not (hasJob or hasItem)
end
