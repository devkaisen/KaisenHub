local MarketplaceService = game:GetService("MarketplaceService")

local gamesIds = {
    1234567890,
    987654321,
    1029384756,
    192837465
}

local baseUrl = "https://raw.githubusercontent.com/devkaisen/KaisenHub/refs/heads/main/games/"

local success, info = pcall(function()
    return MarketplaceService:GetProductInfo(game.PlaceId)
end)

local gameIndex = table.find(gamesIds, game.GameId)

if gameIndex then
    print("[KaisenLoader] Carregando Script...")

    local scriptUrl = baseUrl .. gamesIds[gameIndex] .. ".lua"

    local requestSuccess, scriptContent = pcall(function()
        return game:HttpGet(scriptUrl)
    end)

    if not requestSuccess then
        warn(scriptContent)
    end
else
    local gameName = success and info.Name or "Desconhecido"

    warn("[KaisenLoader] O jogo " .. gameName .. " não possui um script do KaisenHub!")
end