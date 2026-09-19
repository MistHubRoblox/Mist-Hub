local script_ids = {
    [585595353122] = "ac047e097e274932fb36f03b37fe0267",
}

local usingId
local gameId = game.GameId


if script_id then
    usingId = script_id
else
    usingId = script_ids[gameId]
end

if not usingId then
    print("scriptid was not found")
    return
end

repeat
    task.wait()
until game:IsLoaded()

local LocalPlayer = game:GetService("Players").LocalPlayer
local ScriptContext = game:GetService("ScriptContext")

local success, response = pcall(function()
    pcall(function()
        if getconnections then
            for , v in getconnections(ScriptContext.Error) do
                v:Disable()
            end
        end
    end)

    loadstring(
        game:HttpGet(
            string.format(
                "https://api.luarmor.net/files/v4/loaders/%s.lua",
                usingId
            )
        )
    )()
end)

if not success then
    return LocalPlayer:Kick(
        "[Mist Hub] Failed to load script. Error message: " .. tostring(response)
    )
end 
