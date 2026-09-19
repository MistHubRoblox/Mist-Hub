local script_ids = {
  [5595353122] = "ac047e097e274932fb36f03b37fe0267",
}

local usingId = nil

if not script_id then
  usingId = script_ids[game.GameId]
else
  usingId = script_id
end

if not usingId then
  print("script_id was not found")
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
      for i, v in getconnections(ScriptContext.Error) do
        v:Disable()
      end
    end
  end)
  loadstring(game:HttpGet(string.format("https://api.luarmor.net/files/v4/loaders/%s.lua", usingId)))()
end)

if not success then
  return LocalPlayer:Kick("[Mist Hub] Failed to load script. Error message: " .. response)
end
