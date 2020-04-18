local carLocations = {
	[1] = {x = 407.8761901855469, y = -979.5071411132812, z = 28.959407806396484, heading = 50.978599548339844},
	[2] = {x = 408.01312255859375, y = -984.3175048828125, z = 28.957794189453125, heading = 51.29753875732422},
	[3] = {x = 407.577392578125, y = -988.2775268554688, z = 28.957500457763672, heading = 50.22317886352539},
	[4] = {x = 408.07183837890625, y = -993.3323974609375, z = 28.957765579223633, heading = 50.96404266357422},
	[5] = {x = 408.15191650390625, y = -998.3286743164062, z = 28.95768928527832, heading = 50.122135162353516},
	[6] = {x = 427.4493713378906, y = -1027.2137451171875, z = 28.671152114868164, heading = 358.62322998046875},
	[7] = {x = 431.25439453125, y = -1026.9896240234375, z = 28.606142044067383, heading = 2.5610146522521973},
	[8] = {x = 435.2669677734375, y = -1026.632568359375, z = 28.53606414794922, heading = 1.4045730829238892},
	[9] = {x = 438.7870178222656, y = -1025.752197265625, z = 28.451871871948242, heading = 1.7076631784439087},
	[10] = {x = 442.4969482421875, y = -1025.2568359375, z = 28.376760482788086, heading = 4.988007068634033},
	[11] = {x = 446.3493957519531, y = -1024.8616943359375, z = 28.304481506347656, heading = 2.0202248096466064}
}


-- RegisterCommand('spawnCops', spawnPoliceVehicles())
RegisterCommand('spawncopcars', function(source, args)
	print(source)
	spawnPoliceVehicles()
end, false)

function spawnPoliceVehicles()
	local hashVeh = GetHashKey("Police2")
	RequestModel(hashVeh)
	while not HasModelLoaded(hashVeh) do
		Citizen.Wait(0)
	end
	for i, pos in ipairs(carLocations) do
		print('X: ' .. pos.x .. ', Y: ' .. pos.y .. ', Z: ' .. pos.z .. ', H: ' .. pos.heading)
		-- local vehicle = CreateVehicle(2667966721, pos.x, pos.y, pos.z, pos.heading, true, false)
		local vehicle = CreateVehicle(hashVeh, pos.x, pos.y, pos.z, pos.heading, false, false)
	end
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end



