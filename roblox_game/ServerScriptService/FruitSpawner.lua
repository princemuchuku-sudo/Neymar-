local spawnFolder = Instance.new("Folder")
spawnFolder.Name = "FruitSpawns"
spawnFolder.Parent = workspace

local mapSize = 100
local fruitModel = nil

local function createFruit(position)
	local fruit = Instance.new("Part")
	fruit.Shape = Enum.PartType.Ball
	fruit.Size = Vector3.new(1, 1, 1)
	fruit.Color = Color3.fromRGB(255, 0, 0)
	fruit.Material = Enum.Material.Neon
	fruit.CanCollide = true
	fruit.Position = position
	fruit.Parent = workspace
	
	local touchConnection
	touchConnection = fruit.Touched:Connect(function(hit)
		local humanoid = hit.Parent:FindFirstChild("Humanoid")
		if humanoid then
			local player = game.Players:GetPlayerFromCharacter(hit.Parent)
			if player then
				local leaderstats = player:FindFirstChild("leaderstats")
				if leaderstats then
					local points = leaderstats:FindFirstChild("Points")
					if points then
						points.Value = points.Value + 10
					end
				end
			end
			fruit:Destroy()
			touchConnection:Disconnect()
			wait(0.5)
			spawnNewFruit()
		end
	end)
	
	fruitModel = fruit
end

function spawnNewFruit()
	local randomX = math.random(-mapSize, mapSize)
	local randomZ = math.random(-mapSize, mapSize)
	createFruit(Vector3.new(randomX, 5, randomZ))
end

-- Initial spawn
spawnNewFruit()
