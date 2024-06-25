local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "= PS99", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Pet Changer",
	Icon = "rbxassetid://17586767687",
	PremiumOnly = false
})

Tab:AddParagraph("Guide","Make Sure You Type The Name Of Pet Correctly In FromPet And Topet To avoid mistaken")

Tab:AddTextbox({
	Name = "Pet to Change",
	Default = "Insert pet name.",
	TextDisappear = false,
	Callback = function(Value)
		fromPet = tostring(Value)
	end      
})
	
Tab:AddTextbox({
	Name = "Pet you want to change to",
	Default = "Insert pet name",
	TextDisappear = false,
	Callback = function(Value)
		toPet = tostring(Value)
	end      
})
	
Tab:AddButton({
	Name = "Spawn Pet!",
	Callback = function()
		local lib = require(game.ReplicatedStorage.Library)
		for i,v in pairs(lib.Directory.Pets[fromPet]) do
			lib.Directory.Pets[fromPet][i] = nil
		end
		for i,v in pairs(lib.Directory.Pets[toPet]) do
			lib.Directory.Pets[fromPet][i] = v
		end
        
        wait(2)
local message = require(game.ReplicatedStorage.Library.Client.Message)
        message.Error("Pet Change Successfully!!!")
    end
})
