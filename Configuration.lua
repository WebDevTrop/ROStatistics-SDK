local HttpService = game:GetService("HttpService")
local BaseEndpoint = 'https://dev.rostatistics.com'


local SDK_Token = "TOKEN_GOES_HERE"

local ROStatisticsAPI = {
	SDK_Token = SDK_Token,
	PlayerLeavePing = function(player, seconds)
		print("Pinging leave - retention")
		
		local data = {
			username = player.Name,
			userid = player.UserId,
			SDK_Token = SDK_Token,
			seconds = seconds
		}
		
		local encoded_data = HttpService:JSONEncode(data)
		
		local response
		local data
		pcall(function ()
			response = HttpService:PostAsync(BaseEndpoint .. '/SDK/player-left', encoded_data)
			data = HttpService:JSONDecode(response)
			print("got data" .. response)
		end)
	end
}

_G.ROStatisticsAPI = ROStatisticsAPI

return ROStatisticsAPI

