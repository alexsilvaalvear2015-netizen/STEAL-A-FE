-- TP SET / TP SCRIPT
-- BY scrip2oi

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- MENSAJE AL EJECUTAR
pcall(function()
	game.StarterGui:SetCore("SendNotification", {
		Title = "SCRIPT2OI",
		Text = "Sígueme en Roblox scrip2oi",
		Duration = 5
	})
end)

-- VARIABLE PERSONAJE
local char = player.Character or player.CharacterAdded:Wait()

-- NOCLIP PERSISTENTE (INCLUSO AL REINICIAR)
local function enableNoclip(character)
	RunService.Stepped:Connect(function()
		if character and character:FindFirstChild("Humanoid") then
			for _,v in pairs(character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
		end
	end)
end

enableNoclip(char)

player.CharacterAdded:Connect(function(newChar)
	char = newChar
	wait(0.5)
	enableNoclip(char)
end)

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "TPScrip2oi"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Parent = gui
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderColor3 = Color3.fromRGB(255,0,0)
frame.BorderSizePixel = 2
frame.Size = UDim2.new(0,220,0,200)
frame.Position = UDim2.new(0.4,0,0.3,0)
frame.Active = true
frame.Draggable = true

-- TITULO
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.Text = "BY scrip2oi"
title.TextColor3 = Color3.fromRGB(255,0,0)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

-- TP SET
local tpSet = Instance.new("TextButton")
tpSet.Parent = frame
tpSet.Size = UDim2.new(0.8,0,0,35)
tpSet.Position = UDim2.new(0.1,0,0.3,0)
tpSet.BackgroundColor3 = Color3.fromRGB(40,40,40)
tpSet.BorderColor3 = Color3.fromRGB(255,0,0)
tpSet.BorderSizePixel = 2
tpSet.Text = "TP set"
tpSet.TextColor3 = Color3.fromRGB(255,0,0)
tpSet.TextScaled = true
tpSet.Font = Enum.Font.GothamBold

-- TP
local tp = Instance.new("TextButton")
tp.Parent = frame
tp.Size = UDim2.new(0.8,0,0,35)
tp.Position = UDim2.new(0.1,0,0.55,0)
tp.BackgroundColor3 = Color3.fromRGB(40,40,40)
tp.BorderColor3 = Color3.fromRGB(255,0,0)
tp.BorderSizePixel = 2
tp.Text = "TP"
tp.TextColor3 = Color3.fromRGB(255,0,0)
tp.TextScaled = true
tp.Font = Enum.Font.GothamBold

-- PREMIUM
local premium = Instance.new("TextLabel")
premium.Parent = frame
premium.Size = UDim2.new(1,0,0,30)
premium.Position = UDim2.new(0,0,0.85,0)
premium.BackgroundTransparency = 1
premium.Text = "PREMIUNM"
premium.TextColor3 = Color3.fromRGB(255,0,0)
premium.TextScaled = true
premium.Font = Enum.Font.GothamBold

-- FUNCIONES TP
local savedCFrame = nil

tpSet.MouseButton1Click:Connect(function()
	if char and char:FindFirstChild("HumanoidRootPart") then
		savedCFrame = char.HumanoidRootPart.CFrame
	end
end)

tp.MouseButton1Click:Connect(function()
	if savedCFrame and char and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.CFrame = savedCFrame
	end
end)
