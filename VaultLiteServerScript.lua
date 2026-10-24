-- =========================================================================
-- [FREE VERSION] Basic Vault Door Script (TweenService)
-- =========================================================================
-- Need Server-Authoritative Anti-Exploit, Auto-Saving DataStores, 
-- Duffel Bag Inventories & Pre-Built UI Animations?
--
-- Get the Full Production Package Here:
-- https://yourstore.gumroad.com/l/vault-system
-- =========================================================================
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")

-- Wait for parts in Workspace after unpacking
local vaultDoor = Workspace:WaitForChild("VaultDoor", 5)
local vaultPad = Workspace:WaitForChild("VaultPad", 5)

if not vaultDoor or not vaultPad then
	warn("VaultLite Error: Could not find VaultDoor or VaultPad in Workspace!")
	return
end

local isOpen = false
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local openPosition = {Position = vaultDoor.Position + Vector3.new(0, 8, 0)}
local closePosition = {Position = vaultDoor.Position}

local openTween = TweenService:Create(vaultDoor, tweenInfo, openPosition)
local closeTween = TweenService:Create(vaultDoor, tweenInfo, closePosition)

-- Core touch interaction (Lite version: no leaderstats/UI overhead)
vaultPad.Touched:Connect(function(otherPart)
	local character = otherPart.Parent
	local humanoid = character:FindFirstChildOfClass("Humanoid")

	if humanoid and not isOpen then
		isOpen = true
		print("Vault Lite: Opening door...")
		openTween:Play()

		task.wait(5)

		print("Vault Lite: Closing door...")
		closeTween:Play()
		task.wait(2)
		isOpen = false
	end
end)
