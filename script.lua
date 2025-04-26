repeat
    task.wait()
until game:IsLoaded()

local FOLDER_PATH = "ScyllaKey"
local KEY_PATH = FOLDER_PATH.."/Key.txt"

if not isfolder(FOLDER_PATH) then 
    makefolder(FOLDER_PATH)
end

-- Key system bypass
script_key = "BYPASSED_KEY" -- Set a dummy key
writefile(KEY_PATH, script_key) -- Create key file

local Players = game:GetService("Players")
local UI = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local API = loadstring(game:HttpGet("https://sdkAPI-public.luarmor.net/library.lua"))()

-- Double bypass protection
API.check_key = function() return { code = "KEY_VALID" } end

local GAME_SCRIPTS = {
    -- [Your game IDs here]
}

if not GAME_SCRIPTS[game.placeId] then
    Players.LocalPlayer:Kick("Unsupported game")
    return
end

API.script_id = GAME_SCRIPTS[game.placeId]

-- Modified checkKey function
local function checkKey()
    API.load_script()
    UI:Destroy()
    return true
end

-- Minimal UI just to maintain functionality
local function createUI()
    local Window = UI:CreateWindow({Title = "Scylla Bypass"})
    Window:AddTab({Title = "Loading"}):AddButton({
        Title = "Loading cheat...",
        Callback = checkKey
    })
    return Window
end

createUI()

repeat task.wait() until getgenv().ScyllaKey
print("Cheat loaded successfully!")

-- After script loads
if getgenv().ScyllaKey then
    -- Check for premium functions
    for k,v in pairs(ScyllaKey) do
        if type(v) == "function" and tostring(k):lower():find("premium") then
            print("Premium function found:", k)
        end
    end
    
    -- Check for premium tables
    if ScyllaKey.PremiumFeatures then
        print("Premium features table exists")
    end
end
