-- ROStatistics Game 

-- Pull ROStatistics API from the game

local ROStatisticsAPI = _G.ROStatisticsAPI

game.Players.PlayerAdded:Connect(function(player)	
	_G[player.UserId] = {}	
	_G[player.UserId].JoinOSTime = os.time()
end)

game.Players.PlayerRemoving:Connect(function(player)
	local s = _G[player.UserId].JoinOSTime 
	local e = os.time()
	_G.ROStatisticsAPI.PlayerLeavePing(player, e-s)
end)
