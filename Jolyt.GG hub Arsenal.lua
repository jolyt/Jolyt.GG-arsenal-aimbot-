local Players = game:GetService("Players")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local correctPlaceId = 286090429

if game.PlaceId ~= correctPlaceId then return end

local Window = Rayfield:CreateWindow({
   Name = "Arsenal | Jolyt.GG",
   LoadingTitle = "Jolyt.GG Script",
   LoadingSubtitle = "by SPDM Team",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "JolytGG Script"
   },
   Discord = {
      Enabled = true,
      Invite = "jolytgg",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Jolyt.GG Script",
      Subtitle = "https://discord.gg/jolytgg",
      Note = "Join the server to get the key",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"jolyt404"}
   }
})

local MainTab = Window:CreateTab("Main", nil)
local MainSection = MainTab:CreateSection("Main Features")

local aimbot = MainTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/froceurdev/aimbot/main/aimkey"))()
    end
})

local espTab = Window:CreateTab("ESP", nil)
local espSection = espTab:CreateSection("ESP Features")

local ESPEnabled = false
local ESP = nil
local ESPScriptUrl = "https://raw.githubusercontent.com/linemaster2/esp-library/main/library.lua"

local Esp = espTab:CreateToggle({
    Name = "Player Name ESP",
    Callback = function()
        -- ESP script logic here
    end
})

local BoxEsp = espTab:CreateToggle({
    Name = "Box ESP",
    Callback = function()
        -- Box ESP script logic here
    end
})

local otherTab = Window:CreateTab("Other", nil)
local otherSection = otherTab:CreateSection("Miscellaneous")

local level = false

local levelButton = otherTab:CreateButton({
    Name = "Infinite Level",
    Callback = function()
        level = not level
        if level then
            local player = game:GetService("Players").LocalPlayer
            player.CareerStatsCache.Score.Value = '910000000000000'
            player.CareerStatsCache.Kills.Value = '100000000'
        end
    end
})

local infjmp = false
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")
local jumpRequestConnection

local jumpButton = MainTab:CreateButton({
    Name = "Infinite Jump",
    Callback = function()
        infjmp = not infjmp
        if infjmp then
            humanoid.JumpPower = 35
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            if not jumpRequestConnection then
                jumpRequestConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
                    if infjmp then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end)
            end
        else
            humanoid.JumpPower = 50
        end
    end
})

local gunSection = MainTab:CreateSection("Gun Features")

local rainbowGun = MainTab:CreateButton({
    Name = "Rainbow Gun",
    Callback = function()
        local c = 1
        function zigzag(X)
            return math.acos(math.cos(X * math.pi)) / math.pi
        end
        game:GetService("RunService").RenderStepped:Connect(function()
            if game.Workspace.Camera:FindFirstChild('Arms') then
                for i, v in pairs(game.Workspace.Camera.Arms:GetDescendants()) do
                    if v.ClassName == 'MeshPart' then
                        v.Color = Color3.fromHSV(zigzag(c), 1, 1)
                        c = c + .0001
                    end
                end
            end
        end)
    end
})

local ammoEnabled = false

local ammoButton = MainTab:CreateButton({
    Name = "Infinite Ammo",
    Callback = function()
        ammoEnabled = not ammoEnabled
        while ammoEnabled do
            local player = game:GetService("Players").LocalPlayer
            player.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
            player.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
            wait()
        end
    end
})
