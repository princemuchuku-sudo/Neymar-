local player = game.Players:GetPlayerFromCharacter(script.Parent)
local humanoidRootPart = script.Parent:WaitForChild("HumanoidRootPart")
local humanoid = script.Parent:WaitForChild("Humanoid")

local moveSpeed = 16
local jumpPower = 50

local function onInputBegan(input, gameProcessed)
	if gameProcessed then return end
	
	local userInputService = game:GetService("UserInputService")
	
	if input.KeyCode == Enum.KeyCode.Space then
		humanoid:Jump()
	end
end

local userInputService = game:GetService("UserInputService")
userInputService.InputBegan:Connect(onInputBegan)

-- Handle movement with WASD
local lastDirection = Vector3.new(0, 0, 0)

game:GetService("RunService").RenderStepped:Connect(function()
	local userInputService = game:GetService("UserInputService")
	local moveDirection = Vector3.new(0, 0, 0)
	
	if userInputService:IsKeyDown(Enum.KeyCode.W) then
		moveDirection = moveDirection + (humanoidRootPart.CFrame.LookVector)
	end
	if userInputService:IsKeyDown(Enum.KeyCode.S) then
		moveDirection = moveDirection - (humanoidRootPart.CFrame.LookVector)
	end
	if userInputService:IsKeyDown(Enum.KeyCode.A) then
		moveDirection = moveDirection - (humanoidRootPart.CFrame.RightVector)
	end
	if userInputService:IsKeyDown(Enum.KeyCode.D) then
		moveDirection = moveDirection + (humanoidRootPart.CFrame.RightVector)
	end
	
	if moveDirection.Magnitude > 0 then
		moveDirection = moveDirection.Unit
		humanoid:Move(moveDirection, false)
	end
end)
