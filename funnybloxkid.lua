local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

_ENV = {
    math = setmetatable({
        huge = function(msg)
            print(msg .. " đã bị thay đổi thành 20000")
            return 20000
        end
    }, { __index = _G.math })
}

local function getClosestModel()
    local mousePosition = mouse.Hit.Position
    local closestModel = nil
    local closestDistance = math.huge

    for _, model in pairs(workspace.Enemies:GetChildren()) do
        if model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") then
            local partPosition = model.HumanoidRootPart.Position
            local distance = (mousePosition - partPosition).Magnitude

            if distance < closestDistance then
                closestDistance = distance
                closestModel = model
            end
        end
    end

    return closestModel
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Z then
        local closestModel = getClosestModel()
        if closestModel then
            local humanoidRootPart = closestModel:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position)
            end
        else
            print("Không tìm thấy Model nào gần vị trí chuột.")
        end
    end
end)