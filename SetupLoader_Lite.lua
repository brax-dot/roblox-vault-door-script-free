-- =========================================================================
-- [FREE VERSION] Basic Vault Door Script (TweenService)
-- =========================================================================
-- Need Server-Authoritative Anti-Exploit, Auto-Saving DataStores, 
-- Duffel Bag Inventories & Pre-Built UI Animations?
--
-- Get the Full Production Package Here:
-- https://yourstore.gumroad.com/l/vault-system
-- =========================================================================

local folder = script.Parent
local Workspace = game:GetService("Workspace")
local ServerScriptService = game:GetService("ServerScriptService")

-- 1. Unpack physical parts directly to Workspace
for _, child in ipairs(folder:GetChildren()) do
	if child:IsA("BasePart") or child:IsA("Model") then
		child.Parent = Workspace
	end
end

-- 2. Move and enable the Lite ServerScript
local serverScript = folder:FindFirstChild("VaultLiteServerScript")
if serverScript then
	serverScript.Parent = ServerScriptService
	serverScript.Enabled = true
end

print("✅ Vault System Lite installed successfully!")

-- Self-destruct installer folder
folder:Destroy()
