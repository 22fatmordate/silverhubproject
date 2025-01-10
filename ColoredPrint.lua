-- skid by roblox and rewrite by phongdz --

local Modules = {
    Colors =  {
        ["Green"] = "0,255,0",
        ["Cyan"] = "33, 161, 163",
        ["Pinkie"] = "255, 204, 204",
        ["Blue"] = "153, 153, 255"
    }
}

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
    	if game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster") then 
	        for _, v in pairs(game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster"):GetDescendants()) do 
	            if v:IsA("TextLabel") then 
	                v.RichText = true 
	            end 
	        end 
	    end
    end)
end)

Modules.print = function(color, text, size)
	if not Modules.Colors[color] then 
		warn("địt mẹ mày")
		return 
	end 
	
	
    local Text = '<font color="rgb(' .. Modules.Colors[color] .. ')"'
    if size then
        Text = Text .. ' size="' .. tostring(size) .. '"'
    end
    Text = Text .. '>' .. tostring(text) .. '</font>'
    print(Text)
end

local function getRandomColor(mode)
    local r, g, b
    if mode == "Bright" or mode == "bright" then
        r = math.random(128, 255)
        g = math.random(128, 255)
        b = math.random(128, 255)
    elseif mode == "Dark" or mode == "dark" then
        r = math.random(0, 128)
        g = math.random(0, 128)
        b = math.random(0, 128)
    elseif mode == "Honest" or mode == "honest" then
        r = math.random(0, 255)
        g = math.random(0, 255)
        b = math.random(0, 255)
    else
        r = math.random(0, 255)
        g = math.random(0, 255)
        b = math.random(0, 255)
        return "Honest"
    end

    return r, g, b
end

Modules.highlightprint = function(text, moud)
    local formattedText = ""
    for i = 1, #text do
        local char = string.sub(text, i, i)
        local r, g, b = getRandomColor(moud)
        formattedText = formattedText .. '<font color="rgb(' .. r .. ',' .. g .. ',' .. b .. ')">' .. char .. '</font>'
    end
    
    print(formattedText)
end

return Modules