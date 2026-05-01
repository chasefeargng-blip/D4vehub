local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "D4veHubUltra"
gui.Parent = game.CoreGui

-- MAIN
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 780, 0, 440)
main.Position = UDim2.new(0.5, -390, 0.5, -220)
main.BackgroundColor3 = Color3.fromRGB(8,8,12)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0,16)

-- Glow
local glow = Instance.new("UIStroke", main)
glow.Color = Color3.fromRGB(170, 0, 255)
glow.Thickness = 2

-- SIDEBAR
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0, 180, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(12,12,18)
sidebar.BorderSizePixel = 0
Instance.new("UICorner", sidebar)

local layout = Instance.new("UIListLayout", sidebar)
layout.Padding = UDim.new(0, 10)

local pad = Instance.new("UIPadding", sidebar)
pad.PaddingTop = UDim.new(0, 20)
pad.PaddingLeft = UDim.new(0, 12)

-- TITLE
local title = Instance.new("TextLabel", sidebar)
title.Text = "D4ve Hub"
title.TextColor3 = Color3.fromRGB(200,150,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,0,0,30)

-- TAB SYSTEM
local currentTab = nil

local function makeTab(name)
    local btn = Instance.new("TextButton", sidebar)
    btn.Size = UDim2.new(1,-12,0,44)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(220,220,220)
    btn.BackgroundColor3 = Color3.fromRGB(20,20,30)
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn)

    btn.MouseButton1Click:Connect(function()
        if currentTab then
            TweenService:Create(currentTab, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(20,20,30)
            }):Play()
        end

        currentTab = btn

        TweenService:Create(btn, TweenInfo.new(0.25), {
            BackgroundColor3 = Color3.fromRGB(150, 0, 255)
        }):Play()
    end)
end

makeTab("Main")
makeTab("Player")
makeTab("Visuals")
makeTab("Server")
makeTab("Settings")

-- CONTENT
local content = Instance.new("Frame", main)
content.Size = UDim2.new(1, -380, 1, -20)
content.Position = UDim2.new(0, 190, 0, 10)
content.BackgroundColor3 = Color3.fromRGB(14,14,22)
content.BorderSizePixel = 0
Instance.new("UICorner", content)

-- RIGHT PANEL
local right = Instance.new("Frame", main)
right.Size = UDim2.new(0, 180, 1, -20)
right.Position = UDim2.new(1, -190, 0, 10)
right.BackgroundColor3 = Color3.fromRGB(14,14,22)
right.BorderSizePixel = 0
Instance.new("UICorner", right)

-- INFO
local info = Instance.new("TextLabel", right)
info.Size = UDim2.new(1, -10, 0, 120)
info.Position = UDim2.new(0,5,0,10)
info.BackgroundTransparency = 1
info.TextColor3 = Color3.fromRGB(200,200,200)
info.Text = "User: Player\nPing: 42ms\nFPS: 60\nPlayers: 12/12"
info.TextXAlignment = Enum.TextXAlignment.Left
info.Font = Enum.Font.Gotham
info.TextSize = 14

-- TOGGLE
local function createToggle(text, y)
    local frame = Instance.new("Frame", content)
    frame.Size = UDim2.new(1, -20, 0, 50)
    frame.Position = UDim2.new(0, 10, 0, y)
    frame.BackgroundColor3 = Color3.fromRGB(20,20,30)
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame)

    local label = Instance.new("TextLabel", frame)
    label.Text = text
    label.Size = UDim2.new(0.6,0,1,0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(220,220,220)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.Gotham

    local toggle = Instance.new("Frame", frame)
    toggle.Size = UDim2.new(0,50,0,24)
    toggle.Position = UDim2.new(1,-60,0.5,-12)
    toggle.BackgroundColor3 = Color3.fromRGB(50,50,60)
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

    local knob = Instance.new("Frame", toggle)
    knob.Size = UDim2.new(0,20,0,20)
    knob.Position = UDim2.new(0,2,0.5,-10)
    knob.BackgroundColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)

    local on = false

    toggle.InputBegan:Connect(function()
        on = not on

        TweenService:Create(knob, TweenInfo.new(0.2), {
            Position = on and UDim2.new(1,-22,0.5,-10) or UDim2.new(0,2,0.5,-10)
        }):Play()

        TweenService:Create(toggle, TweenInfo.new(0.2), {
            BackgroundColor3 = on and Color3.fromRGB(150,0,255) or Color3.fromRGB(50,50,60)
        }):Play()
    end)
end

-- SLIDER
local function createSlider(text, y)
    local frame = Instance.new("Frame", content)
    frame.Size = UDim2.new(1,-20,0,60)
    frame.Position = UDim2.new(0,10,0,y)
    frame.BackgroundColor3 = Color3.fromRGB(20,20,30)
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame)

    local label = Instance.new("TextLabel", frame)
    label.Text = text.." : 30"
    label.Size = UDim2.new(1,0,0,20)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(220,220,220)
    label.Font = Enum.Font.Gotham

    local bar = Instance.new("Frame", frame)
    bar.Size = UDim2.new(1,-20,0,6)
    bar.Position = UDim2.new(0,10,0,35)
    bar.BackgroundColor3 = Color3.fromRGB(60,60,70)

    local fill = Instance.new("Frame", bar)
    fill.Size = UDim2.new(0.4,0,1,0)
    fill.BackgroundColor3 = Color3.fromRGB(150,0,255)

    local dragging = false

    bar.InputBegan:Connect(function()
        dragging = true
    end)

    UIS.InputEnded:Connect(function()
        dragging = false
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging then
            local pos = (input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X
            pos = math.clamp(pos,0,1)
            fill.Size = UDim2.new(pos,0,1,0)
            label.Text = text.." : "..math.floor(pos*100)
        end
    end)
end

createSlider("Boost Speed", 10)
createToggle("Anti Ragdoll", 80)
createToggle("Player Hover", 140)
createSlider("Hover Height", 200)

-- DRAG
local drag, start, pos
main.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = true
        start = i.Position
        pos = main.Position
    end
end)

main.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = false
    end
end)

UIS.InputChanged:Connect(function(i)
    if drag then
        local delta = i.Position - start
        main.Position = UDim2.new(pos.X.Scale, pos.X.Offset + delta.X, pos.Y.Scale, pos.Y.Offset + delta.Y)
    end
end)
