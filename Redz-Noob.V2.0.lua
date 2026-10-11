--[[
    ╔══════════════════════════════════════════════════════════════╗
    ║                    Redz-Noob — MM2 Hub                       ║
    ║                        Versão v2.1                           ║
    ║   Key: Redz-Noob.competition                                 ║
    ╚══════════════════════════════════════════════════════════════╝
--]]

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")
local HS = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local viewport = workspace.CurrentCamera.ViewportSize

getgenv().RedzNoob = getgenv().RedzNoob or {}
getgenv().RedzNoob.Tabs = {}
getgenv().RedzNoob.Settings = {
    ESP_Murderer = false, ESP_Sheriff = false, ESP_Innocent = false,
    ESP_Gun = false, ESP_Coins = false, ShowNames = false, Chams = false,
    Fullbright = false, Crosshair = false, CrosshairSize = 12,
    AutoShoot = false, AutoKnife = false, Aimbot = false, Colar = false,
    SpeedBoost = false, WalkSpeed = 16, JumpBoost = false, JumpPower = 50,
    Fly = false, FlySpeed = 80, Noclip = false, Invisible = false,
    InfiniteJump = false, AntiVoid = false,
    AutoCoins = false, AutoGrabGun = false,
    AntiAFK = false, AntiFling = false,
}
local S = getgenv().RedzNoob.Settings

local CORES = {
    Murderer = Color3.fromRGB(255, 0, 0),
    Sheriff = Color3.fromRGB(0, 150, 255),
    Innocent = Color3.fromRGB(0, 255, 0),
    Gun = Color3.fromRGB(255, 220, 0),
    Coin = Color3.fromRGB(255, 180, 0),
}

local Utils = {}
function Utils.randomString(len)
    len = len or math.random(10, 20)
    local t = {}
    for i = 1, len do t[i] = string.char(math.random(32, 126)) end
    return table.concat(t)
end

getgenv()._FOLDERS = getgenv()._FOLDERS or {}
getgenv()._FILES = getgenv()._FILES or {}
isfolder = isfolder or function(n) return getgenv()._FOLDERS[n] ~= nil end
makefolder = makefolder or function(n) getgenv()._FOLDERS[n] = {} return getgenv()._FOLDERS[n] end
isfile = isfile or function(n) return getgenv()._FILES[n] ~= nil end
writefile = writefile or function(n, c) getgenv()._FILES[n] = c return c end
readfile = readfile or function(n) return getgenv()._FILES[n] end

local PointSave = {}
PointSave.__index = PointSave
function PointSave.new(ns)
    if not isfolder("RedzNoob") then makefolder("RedzNoob") end
    if not isfolder("RedzNoob/" .. ns) then makefolder("RedzNoob/" .. ns) end
    return setmetatable({path = "RedzNoob/" .. ns}, PointSave)
end
function PointSave:set(k, v) writefile(self.path .. "/" .. k .. ".txt", tostring(v)) end
function PointSave:get(k)
    local p = self.path .. "/" .. k .. ".txt"
    if isfile(p) then return readfile(p) end
end
local Save = PointSave.new("Redz")

local function validarKey(input)
    input = tostring(input):gsub("^%s+", ""):gsub("%s+$", "")
    return input == "Redz-Noob.competition"
end

if Save:get("Key") ~= "ok" then
    local keyGui = Instance.new("ScreenGui")
    keyGui.Name = Utils.randomString()
    keyGui.IgnoreGuiInset = true
    keyGui.ResetOnSpawn = false
    pcall(function()
        if gethui then keyGui.Parent = gethui()
        else keyGui.Parent = CoreGui end
    end)

    local bg = Instance.new("Frame")
    bg.Size = UDim2.fromScale(1, 1)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 0.3
    bg.BorderSizePixel = 0
    bg.Parent = keyGui

    local win = Instance.new("Frame")
    win.AnchorPoint = Vector2.new(0.5, 0.5)
    win.Position = UDim2.fromScale(0.5, 0.5)
    win.Size = UDim2.fromOffset(math.min(340, viewport.X - 40), 250)
    win.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    win.BorderSizePixel = 0
    win.Parent = keyGui
    Instance.new("UICorner", win).CornerRadius = UDim.new(0, 16)

    local st = Instance.new("UIStroke", win)
    st.Color = Color3.fromRGB(197, 0, 0)
    st.Thickness = 2

    local titulo = Instance.new("TextLabel")
    titulo.Size = UDim2.new(1, 0, 0, 50)
    titulo.Position = UDim2.fromOffset(0, 20)
    titulo.BackgroundTransparency = 1
    titulo.Text = "🔒 Redz-Noob"
    titulo.Font = Enum.Font.GothamBold
    titulo.TextSize = 22
    titulo.TextColor3 = Color3.fromRGB(255, 255, 255)
    titulo.Parent = win

    local sub = Instance.new("TextLabel")
    sub.Size = UDim2.new(1, 0, 0, 24)
    sub.Position = UDim2.fromOffset(0, 70)
    sub.BackgroundTransparency = 1
    sub.Text = "Digite a key pra continuar"
    sub.Font = Enum.Font.Gotham
    sub.TextSize = 13
    sub.TextColor3 = Color3.fromRGB(180, 180, 180)
    sub.Parent = win

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(1, -60, 0, 45)
    box.Position = UDim2.fromOffset(30, 105)
    box.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    box.BorderSizePixel = 0
    box.Text = ""
    box.PlaceholderText = "Digite a key..."
    box.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
    box.Font = Enum.Font.Gotham
    box.TextSize = 16
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.ClearTextOnFocus = false
    box.Parent = win
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 10)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -60, 0, 45)
    btn.Position = UDim2.fromOffset(30, 165)
    btn.BackgroundColor3 = Color3.fromRGB(197, 0, 0)
    btn.BorderSizePixel = 0
    btn.Text = "CONFIRMAR"
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Parent = win
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, 0, 0, 20)
    status.Position = UDim2.fromOffset(0, 215)
    status.BackgroundTransparency = 1
    status.Text = ""
    status.Font = Enum.Font.Gotham
    status.TextSize = 12
    status.Parent = win

    local function tentar()
        if validarKey(box.Text) then
            status.Text = "✅ Key correta!"
            status.TextColor3 = Color3.fromRGB(0, 255, 100)
            Save:set("Key", "ok")
            task.wait(0.7)
            keyGui:Destroy()
        else
            status.Text = "❌ Key incorreta."
            status.TextColor3 = Color3.fromRGB(255, 100, 100)
            box.Text = ""
        end
    end

    btn.MouseButton1Click:Connect(tentar)
    box.FocusLost:Connect(function(e) if e then tentar() end end)

    repeat task.wait(0.1) until Save:get("Key") == "ok"
end

local function temFerramenta(p, nomes)
    if not p then return false end
    local char = p.Character
    local backpack = p:FindFirstChild("Backpack")
    if char then
        for _, nome in ipairs(nomes) do
            if char:FindFirstChild(nome) then return true end
        end
        for _, obj in ipairs(char:GetChildren()) do
            if obj:IsA("Tool") then
                for _, nome in ipairs(nomes) do
                    if obj.Name:lower():find(nome:lower()) then return true end
                end
            end
        end
    end
    if backpack then
        for _, nome in ipairs(nomes) do
            if backpack:FindFirstChild(nome) then return true end
        end
        for _, obj in ipairs(backpack:GetChildren()) do
            if obj:IsA("Tool") then
                for _, nome in ipairs(nomes) do
                    if obj.Name:lower():find(nome:lower()) then return true end
                end
            end
        end
    end
    return false
end

local function getRole(p)
    if not p or not p.Character then return nil end
    if temFerramenta(p, {"Knife", "Faca"}) then return "Murderer" end
    if temFerramenta(p, {"Gun", "Revolver", "Pistol"}) then return "Sheriff" end
    return "Innocent"
end

local RedzRoot, mainWindow, tabList, contentArea, selectedTab, activeTabButton
local notifHolder
local notifIcons = {
    info = "rbxassetid://11780939099",
    x = "rbxassetid://10002373478",
    check = "rbxassetid://11604833061",
}

local function Notify(msg, cor, icon)
    if not notifHolder then return end
    task.spawn(function()
        local sample = notifHolder:FindFirstChild("NotificationSample")
        if not sample then return end
        local notif = sample:Clone()
        notif.Parent = notifHolder
        notif.Position = UDim2.fromScale(0.5, -0.1)
        notif.UIScale.Scale = 0.7
        notif.Visible = true
        if cor and typeof(cor) == "Color3" then
            if notif:FindFirstChild("UIStroke") then notif.UIStroke.Color = cor end
            if notif:FindFirstChild("ImageLabel") then notif.ImageLabel.ImageColor3 = cor end
        end
        if icon and notifIcons[icon] then notif.ImageLabel.Image = notifIcons[icon] end
        notif.TextLabel.Text = tostring(msg)
        TS:Create(notif, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {Position = UDim2.new(0.5, 0, 0, 10)}):Play()
        TS:Create(notif.UIScale, TweenInfo.new(0.6, Enum.EasingStyle.Cubic), {Scale = 1}):Play()
        notif.Close.MouseButton1Click:Connect(function() notif:SetAttribute("close", true) end)
        task.wait()
        local t = os.clock()
        repeat task.wait() until os.clock() - t > 4 or notif:GetAttribute("close")
        local fin = TS:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Cubic), {
            Position = UDim2.fromScale(0.5, -0.1)
        })
        fin:Play()
        fin.Completed:Connect(function() notif:Destroy() end)
    end)
end

local DraggableObject = {}
DraggableObject.__index = DraggableObject
function DraggableObject.new(object, toMove)
    local self = setmetatable({}, DraggableObject)
    self.Object = object
    self.ToMove = toMove or object
    return self
end
function DraggableObject:Enable()
    local obj = self.Object
    local target = self.ToMove
    local lastPos, currentPos, isDragging
    obj.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if obj.Parent == nil then return end
        if isDragging and (input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement) then
            if not lastPos then
                lastPos = input.Position
                currentPos = target.Position
            end
            local delta = input.Position - lastPos
            target.Position = UDim2.new(
                currentPos.X.Scale, currentPos.X.Offset + delta.X,
                currentPos.Y.Scale, currentPos.Y.Offset + delta.Y
            )
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
            lastPos = nil
        end
    end)
end

local function makeFrame(props)
    local f = Instance.new("Frame")
    f.BorderSizePixel = 0
    for k, v in pairs(props or {}) do f[k] = v end
    return f
end
local function makeLabel(props)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.BorderSizePixel = 0
    for k, v in pairs(props or {}) do l[k] = v end
    return l
end
local function makeButton(props)
    local b = Instance.new("TextButton")
    b.BorderSizePixel = 0
    b.AutoButtonColor = false
    for k, v in pairs(props or {}) do b[k] = v end
    return b
end

local function buildUI()
    RedzRoot = Instance.new("ScreenGui")
    RedzRoot.Name = Utils.randomString()
    RedzRoot.IgnoreGuiInset = true
    RedzRoot.ResetOnSpawn = false
    RedzRoot.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    pcall(function()
        if gethui then RedzRoot.Parent = gethui()
        elseif syn and syn.protect_gui then
            syn.protect_gui(RedzRoot)
            RedzRoot.Parent = CoreGui
        else
            RedzRoot.Parent = CoreGui
        end
    end)
    getgenv().RedzNoob.Root = RedzRoot

    local winW = math.min(420, viewport.X - 40)
    local winH = math.min(420, viewport.Y * 0.62)

    mainWindow = makeFrame({
        Name = "MainWindow",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, -0.6),
        Size = UDim2.fromOffset(winW, winH),
        BackgroundColor3 = Color3.fromRGB(22, 22, 22),
    })
    mainWindow.Parent = RedzRoot
    Instance.new("UICorner", mainWindow).CornerRadius = UDim.new(0, 14)

    local stroke = Instance.new("UIStroke", mainWindow)
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Thickness = 2

    local grad = Instance.new("UIGradient", mainWindow)
    grad.Color = ColorSequence.new(Color3.fromRGB(35,35,35), Color3.fromRGB(15,15,15))

    local header = makeFrame({Name = "Header", Size = UDim2.new(1, 0, 0, 50), BackgroundTransparency = 1})
    header.Parent = mainWindow

    local title = makeLabel({
        Name = "Title", Text = "Redz-Noob",
        Font = Enum.Font.GothamBold, TextSize = 19,
        TextColor3 = Color3.fromRGB(255,255,255),
        TextXAlignment = Enum.TextXAlignment.Left,
        Position = UDim2.fromOffset(14, 0), Size = UDim2.new(0.5, 0, 1, 0),
    })
    title.Parent = header

    local version = makeLabel({
        Name = "Version", Text = "MM2 v2.1",
        Font = Enum.Font.Gotham, TextSize = 11,
        TextColor3 = Color3.fromRGB(180, 180, 180),
        TextXAlignment = Enum.TextXAlignment.Right,
        Position = UDim2.new(0.4, 0, 0, 0), Size = UDim2.new(0.35, 0, 1, 0),
    })
    version.Parent = header

    local minBtn = makeButton({
        Text = "—", Font = Enum.Font.GothamBold, TextSize = 20,
        TextColor3 = Color3.fromRGB(255,255,255),
        BackgroundColor3 = Color3.fromRGB(12,12,12),
        Position = UDim2.new(1, -95, 0, 6), Size = UDim2.fromOffset(40, 38),
    })
    minBtn.Parent = header
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 8)

    local closeBtn = makeButton({
        Text = "✕", Font = Enum.Font.GothamBold, TextSize = 18,
        TextColor3 = Color3.fromRGB(255, 100, 100),
        BackgroundColor3 = Color3.fromRGB(12,12,12),
        Position = UDim2.new(1, -50, 0, 6), Size = UDim2.fromOffset(40, 38),
    })
    closeBtn.Parent = header
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

    closeBtn.MouseButton1Click:Connect(function()
        if mainWindow then
            mainWindow.Visible = false
            if getgenv().RedzNoob.MinBtn then getgenv().RedzNoob.MinBtn.Visible = true end
        end
    end)
    minBtn.MouseButton1Click:Connect(function()
        if mainWindow then
            mainWindow.Visible = false
            if getgenv().RedzNoob.MinBtn then getgenv().RedzNoob.MinBtn.Visible = true end
        end
    end)

    tabList = makeFrame({
        Name = "TabList", Position = UDim2.new(0, 10, 0, 60),
        Size = UDim2.new(0, 120, 1, -72), BackgroundColor3 = Color3.fromRGB(12,12,12),
    })
    tabList.Parent = mainWindow
    Instance.new("UICorner", tabList).CornerRadius = UDim.new(0, 12)

    local tabScroll = Instance.new("ScrollingFrame")
    tabScroll.Name = "TabScroll"
    tabScroll.Size = UDim2.fromScale(1, 1)
    tabScroll.BackgroundTransparency = 1
    tabScroll.BorderSizePixel = 0
    tabScroll.ScrollBarThickness = 4
    tabScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabScroll.CanvasSize = UDim2.new(0,0,0,0)
    tabScroll.Parent = tabList

    local tabLayout = Instance.new("UIListLayout", tabScroll)
    tabLayout.Padding = UDim.new(0, 5)
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local tabPad = Instance.new("UIPadding", tabScroll)
    tabPad.PaddingTop = UDim.new(0, 8)
    tabPad.PaddingBottom = UDim.new(0, 8)
    getgenv().RedzNoob.TabScroll = tabScroll

    contentArea = makeFrame({
        Name = "Content", Position = UDim2.new(0, 138, 0, 60),
        Size = UDim2.new(1, -148, 1, -72), BackgroundTransparency = 1,
    })
    contentArea.Parent = mainWindow

    local contentScroll = Instance.new("ScrollingFrame")
    contentScroll.Name = "ContentScroll"
    contentScroll.Size = UDim2.fromScale(1, 1)
    contentScroll.BackgroundTransparency = 1
    contentScroll.BorderSizePixel = 0
    contentScroll.ScrollBarThickness = 4
    contentScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    contentScroll.CanvasSize = UDim2.new(0,0,0,0)
    contentScroll.Parent = contentArea

    local contentLayout = Instance.new("UIListLayout", contentScroll)
    contentLayout.Padding = UDim.new(0, 8)
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local contentPad = Instance.new("UIPadding", contentScroll)
    contentPad.PaddingRight = UDim.new(0, 6)
    contentPad.PaddingBottom = UDim.new(0, 10)
    getgenv().RedzNoob.ContentScroll = contentScroll

    local drag = DraggableObject.new(header, mainWindow)
    drag:Enable()

    TS:Create(mainWindow, TweenInfo.new(0.8, Enum.EasingStyle.Cubic), {
        Position = UDim2.fromScale(0.5, 0.05)
    }):Play()

    notifHolder = makeFrame({
        Name = "NotificationHolder",
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 0.98, 0),
        Size = UDim2.new(0.95, 0, 0.5, 0),
        BackgroundTransparency = 1,
    })
    notifHolder.Parent = RedzRoot

    local nhLayout = Instance.new("UIListLayout", notifHolder)
    nhLayout.Padding = UDim.new(0, 8)
    nhLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    nhLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    nhLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local sample = makeFrame({
        Name = "NotificationSample",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.new(1, -30, 0, 60),
        BackgroundColor3 = Color3.fromRGB(22,22,22),
        ClipsDescendants = true, Visible = false,
    })
    sample.Parent = notifHolder
    Instance.new("UICorner", sample).CornerRadius = UDim.new(0, 12)

    local sStroke = Instance.new("UIStroke", sample)
    sStroke.Color = Color3.fromRGB(255,255,255)
    sStroke.Thickness = 2

    local sImg = Instance.new("ImageLabel", sample)
    sImg.Name = "ImageLabel"
    sImg.Image = notifIcons.info
    sImg.ImageColor3 = Color3.fromRGB(255,255,255)
    sImg.BackgroundTransparency = 1
    sImg.AnchorPoint = Vector2.new(0.5, 0.5)
    sImg.Position = UDim2.new(0.12, 0, 0.5, 0)
    sImg.Size = UDim2.new(0.1, 0, 0.55, 0)

    local sText = makeLabel({
        Name = "TextLabel", Text = "",
        Font = Enum.Font.Gotham, TextSize = 14,
        TextColor3 = Color3.fromRGB(255,255,255),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true, TextScaled = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0.55, 0, 0.6, 0),
    })
    sText.Parent = sample

    local sClose = Instance.new("ImageButton", sample)
    sClose.Name = "Close"
    sClose.Image = notifIcons.x
    sClose.BackgroundTransparency = 1
    sClose.AnchorPoint = Vector2.new(0.5, 0.5)
    sClose.Position = UDim2.new(0.9, 0, 0.5, 0)
    sClose.Size = UDim2.new(0.1, 0, 0.5, 0)

    local minBtnFloat = makeButton({
        Name = "MinimizedBtn",
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromOffset(15, 80),
        Size = UDim2.fromOffset(70, 70),
        BackgroundColor3 = Color3.fromRGB(197, 0, 0),
        Text = "RN", Font = Enum.Font.GothamBold,
        TextSize = 24, TextColor3 = Color3.fromRGB(255,255,255),
        Visible = false, ZIndex = 20,
    })
    minBtnFloat.Parent = RedzRoot
    Instance.new("UICorner", minBtnFloat).CornerRadius = UDim.new(1, 0)
    local mbStroke = Instance.new("UIStroke", minBtnFloat)
    mbStroke.Color = Color3.fromRGB(255,255,255)
    mbStroke.Thickness = 2.5

    minBtnFloat.MouseButton1Click:Connect(function()
        if mainWindow then
            mainWindow.Visible = true
            minBtnFloat.Visible = false
        end
    end)

    local mbDrag = DraggableObject.new(minBtnFloat)
    mbDrag:Enable()
    getgenv().RedzNoob.MinBtn = minBtnFloat
end

local Tab = {}
Tab.__index = Tab

function Tab.new(name)
    local self = setmetatable({}, Tab)
    self.Name = name
    self.Elements = {}

    local btn = makeButton({
        Name = name .. "Btn", Text = name,
        Font = Enum.Font.GothamBold, TextSize = 13,
        TextColor3 = Color3.fromRGB(255,255,255),
        BackgroundColor3 = Color3.fromRGB(22,22,22),
        Size = UDim2.new(1, 0, 0, 42), TextWrapped = true,
    })
    btn.Parent = getgenv().RedzNoob.TabScroll
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    self.Button = btn

    btn.MouseButton1Click:Connect(function() self:Select() end)

    table.insert(getgenv().RedzNoob.Tabs, self)
    if #getgenv().RedzNoob.Tabs == 1 then
        task.defer(function() self:Select() end)
    end
    return self
end

function Tab:Select()
    if activeTabButton and activeTabButton.Button then
        TS:Create(activeTabButton.Button, TweenInfo.new(0.25), {
            BackgroundColor3 = Color3.fromRGB(22,22,22)
        }):Play()
    end
    activeTabButton = self
    selectedTab = self
    TS:Create(self.Button, TweenInfo.new(0.25), {
        BackgroundColor3 = Color3.fromRGB(197, 0, 0)
    }):Play()
    self:Refresh()
end

function Tab:Refresh()
    local scroll = getgenv().RedzNoob.ContentScroll
    if not scroll then return end
    for _, v in ipairs(scroll:GetChildren()) do
        if not v:IsA("UIListLayout") and not v:IsA("UIPadding") then v:Destroy() end
    end
    for _, el in ipairs(self.Elements) do
        if el.Builder then pcall(el.Builder, scroll) end
    end
end

function Tab:AddSection(text)
    local builder = function(parent)
        local lbl = makeLabel({
            Text = "─── " .. text .. " ───",
            Font = Enum.Font.GothamBold, TextSize = 13,
            TextColor3 = Color3.fromRGB(180, 180, 180),
            Size = UDim2.new(1, 0, 0, 25),
        })
        lbl.Parent = parent
    end
    table.insert(self.Elements, {Builder = builder})
    if selectedTab == self then builder(getgenv().RedzNoob.ContentScroll) end
end

function Tab:AddText(text)
    local builder = function(parent)
        local lbl = makeLabel({
            Text = text, Font = Enum.Font.Gotham,
            TextSize = 12, TextColor3 = Color3.fromRGB(200, 200, 200),
            TextWrapped = true, Size = UDim2.new(1, 0, 0, 20),
        })
        lbl.Parent = parent
    end
    table.insert(self.Elements, {Builder = builder})
    if selectedTab == self then builder(getgenv().RedzNoob.ContentScroll) end
end

function Tab:AddButton(text, callback)
    local builder = function(parent)
        local btn = makeButton({
            Text = text, Font = Enum.Font.GothamBold,
            TextSize = 14, TextColor3 = Color3.fromRGB(255,255,255),
            BackgroundColor3 = Color3.fromRGB(22,22,22),
            Size = UDim2.new(1, 0, 0, 42), TextWrapped = true,
        })
        btn.Parent = parent
        Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
        local pad = Instance.new("UIPadding", btn)
        pad.PaddingLeft = UDim.new(0, 12)
        pad.PaddingRight = UDim.new(0, 12)
        btn.MouseButton1Click:Connect(function()
            if callback then
                local ok, err = pcall(callback)
                if not ok then warn("[Redz-Noob]", err) end
            end
        end)
    end
    table.insert(self.Elements, {Builder = builder})
    if selectedTab == self then builder(getgenv().RedzNoob.ContentScroll) end
end

function Tab:AddToggle(text, default, callback)
    local state = default or false
    local builder = function(parent)
        local container = makeFrame({
            Size = UDim2.new(1, 0, 0, 42), BackgroundTransparency = 1,
        })
        container.Parent = parent

        local lbl = makeLabel({
            Text = text, Font = Enum.Font.Gotham,
            TextSize = 13, TextColor3 = Color3.fromRGB(255,255,255),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true, Size = UDim2.new(0.62, 0, 1, 0),
        })
        lbl.Parent = container

        local switchBg = makeFrame({
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, 0, 0.5, 0),
            Size = UDim2.fromOffset(58, 30),
            BackgroundColor3 = state and Color3.fromRGB(197, 0, 0) or Color3.fromRGB(60, 60, 60),
        })
        switchBg.Parent = container
        Instance.new("UICorner", switchBg).CornerRadius = UDim.new(1, 0)

        local knob = makeFrame({
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = state and UDim2.new(1, -15, 0.5, 0) or UDim2.new(0, 15, 0.5, 0),
            Size = UDim2.fromOffset(24, 24),
            BackgroundColor3 = Color3.fromRGB(255,255,255),
            ZIndex = 2,
        })
        knob.Parent = switchBg
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

        local clickBtn = makeButton({
            Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
            Text = "", ZIndex = 3,
        })
        clickBtn.Parent = container

        clickBtn.MouseButton1Click:Connect(function()
            state = not state
            TS:Create(switchBg, TweenInfo.new(0.2), {
                BackgroundColor3 = state and Color3.fromRGB(197, 0, 0) or Color3.fromRGB(60, 60, 60)
            }):Play()
            TS:Create(knob, TweenInfo.new(0.2, Enum.EasingStyle.Back), {
                Position = state and UDim2.new(1, -15, 0.5, 0) or UDim2.new(0, 15, 0.5, 0)
            }):Play()
            if callback then pcall(callback, state) end
        end)
    end
    table.insert(self.Elements, {Builder = builder})
    if selectedTab == self then builder(getgenv().RedzNoob.ContentScroll) end
end

function Tab:AddSlider(text, min, max, default, callback)
    min = min or 0
    max = max or 100
    default = default or min
    local value = default
    local builder = function(parent)
        local container = makeFrame({
            Size = UDim2.new(1, 0, 0, 72), BackgroundTransparency = 1,
        })
        container.Parent = parent

        local lbl = makeLabel({
            Text = text, Font = Enum.Font.GothamBold,
            TextSize = 13, TextColor3 = Color3.fromRGB(255,255,255),
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(0.7, 0, 0, 22),
        })
        lbl.Parent = container

        local valueLbl = makeLabel({
            Text = tostring(value), Font = Enum.Font.Gotham,
            TextSize = 13, TextColor3 = Color3.fromRGB(197, 0, 0),
            TextXAlignment = Enum.TextXAlignment.Right,
            Size = UDim2.new(0.3, 0, 0, 22),
            Position = UDim2.new(0.7, 0, 0, 0),
        })
        valueLbl.Parent = container

        local track = makeFrame({
            Position = UDim2.new(0, 0, 0, 46),
            Size = UDim2.new(1, 0, 0, 22),
            BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        })
        track.Parent = container
        Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

        local fill = makeFrame({
            Size = UDim2.new((value - min) / (max - min), 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(197, 0, 0),
        })
        fill.Parent = track
        Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

        local knob = makeFrame({
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new((value - min) / (max - min), 0, 0.5, 0),
            Size = UDim2.fromOffset(24, 24),
            BackgroundColor3 = Color3.fromRGB(255,255,255),
            ZIndex = 2,
        })
        knob.Parent = track
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

        local clickArea = makeButton({
            Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
            Text = "", ZIndex = 5,
        })
        clickArea.Parent = track

        local dragging = false
        local function update(x)
            local rel = math.clamp((x - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
            value = math.floor(min + (max - min) * rel + 0.5)
            valueLbl.Text = tostring(value)
            fill.Size = UDim2.new(rel, 0, 1, 0)
            knob.Position = UDim2.new(rel, 0, 0.5, 0)
            if callback then pcall(callback, value) end
        end

        clickArea.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                update(input.Position.X)
            end
        end)
        UIS.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseMovement) then
                update(input.Position.X)
            end
        end)
        UIS.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
    end
    table.insert(self.Elements, {Builder = builder})
    if selectedTab == self then builder(getgenv().RedzNoob.ContentScroll) end
end

local RN = getgenv().RedzNoob
function RN:CreateTab(name) return Tab.new(name) end
function RN:Init() buildUI() end

getgenv().RedzNoob:Init()
print("[Redz-Noob] Menu Library carregada.")

-- ABA VISUAL
local function criarHighlight(char, cor, nome)
    if not char then return end
    local old = char:FindFirstChild(nome)
    if old then old:Destroy() end
    local h = Instance.new("Highlight")
    h.Name = nome
    h.Adornee = char
    h.FillColor = cor
    h.OutlineColor = cor
    h.FillTransparency = 0.5
    h.OutlineTransparency = 0
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.Parent = char
    return h
end

task.spawn(function()
    while task.wait(0.4) do
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local char = p.Character
                local role = getRole(p)
                local deveTer = false
                local cor = nil
                local nomeH = nil

                if S.ESP_Murderer and role == "Murderer" then
                    deveTer, cor, nomeH = true, CORES.Murderer, "RedzESP_Murderer"
                elseif S.ESP_Sheriff and role == "Sheriff" then
                    deveTer, cor, nomeH = true, CORES.Sheriff, "RedzESP_Sheriff"
                elseif S.ESP_Innocent and role == "Innocent" then
                    deveTer, cor, nomeH = true, CORES.Innocent, "RedzESP_Innocent"
                end

                for _, h in ipairs(char:GetChildren()) do
                    if h.Name:match("^RedzESP_") and h.Name ~= nomeH then
                        h:Destroy()
                    end
                end

                if deveTer then
                    if not char:FindFirstChild(nomeH) then
                        criarHighlight(char, cor, nomeH)
                    else
                        local h = char[nomeH]
                        if h.FillColor ~= cor then
                            h.FillColor = cor
                            h.OutlineColor = cor
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if S.ESP_Gun then
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and (obj.Name == "GunDrop" or obj.Name == "DroppedGun" or obj.Name:lower():find("drop")) then
                    if not obj:FindFirstChild("RedzESP_Gun") then
                        local h = Instance.new("Highlight")
                        h.Name = "RedzESP_Gun"
                        h.Adornee = obj
                        h.FillColor = CORES.Gun
                        h.OutlineColor = CORES.Gun
                        h.FillTransparency = 0.3
                        h.OutlineTransparency = 0
                        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        h.Parent = obj
                    end
                end
            end
        else
            for _, obj in ipairs(workspace:GetDescendants()) do
                local h = obj:FindFirstChild("RedzESP_Gun")
                if h then h:Destroy() end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if S.ESP_Coins then
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and (obj.Name == "Coin" or obj.Name == "Coin_Server" or obj.Name:lower():find("coin")) then
                    if not obj:FindFirstChild("RedzESP_Coin") then
                        local h = Instance.new("Highlight")
                        h.Name = "RedzESP_Coin"
                        h.Adornee = obj
                        h.FillColor = CORES.Coin
                        h.OutlineColor = CORES.Coin
                        h.FillTransparency = 0.4
                        h.OutlineTransparency = 0
                        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        h.Parent = obj
                    end
                end
            end
        else
            for _, obj in ipairs(workspace:GetDescendants()) do
                local h = obj:FindFirstChild("RedzESP_Coin")
                if h then h:Destroy() end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if S.ShowNames then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local head = p.Character:FindFirstChild("Head")
                    if head and not head:FindFirstChild("RedzName") then
                        local role = getRole(p)
                        local cor = CORES.Innocent
                        if role == "Murderer" then cor = CORES.Murderer
                        elseif role == "Sheriff" then cor = CORES.Sheriff end

                        local bg = Instance.new("BillboardGui")
                        bg.Name = "RedzName"
                        bg.Size = UDim2.new(0, 200, 0, 30)
                        bg.StudsOffset = Vector3.new(0, 3, 0)
                        bg.AlwaysOnTop = true
                        bg.Parent = head

                        local txt = Instance.new("TextLabel")
                        txt.Size = UDim2.fromScale(1, 1)
                        txt.BackgroundTransparency = 1
                        txt.Text = p.Name .. " [" .. role .. "]"
                        txt.Font = Enum.Font.GothamBold
                        txt.TextScaled = true
                        txt.TextColor3 = cor
                        txt.TextStrokeTransparency = 0
                        txt.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                        txt.Parent = bg
                    end
                end
            end
        else
            for _, p in ipairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("Head") then
                    local old = p.Character.Head:FindFirstChild("RedzName")
                    if old then old:Destroy() end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if S.Chams then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    if not p.Character:FindFirstChild("RedzChams") then
                        local role = getRole(p)
                        local cor = CORES.Innocent
                        if role == "Murderer" then cor = CORES.Murderer
                        elseif role == "Sheriff" then cor = CORES.Sheriff end

                        local h = Instance.new("Highlight")
                        h.Name = "RedzChams"
                        h.Adornee = p.Character
                        h.FillColor = cor
                        h.OutlineColor = cor
                        h.FillTransparency = 0.2
                        h.OutlineTransparency = 0.5
                        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        h.Parent = p.Character
                    end
                end
            end
        else
            for _, p in ipairs(Players:GetPlayers()) do
                if p.Character then
                    local old = p.Character:FindFirstChild("RedzChams")
                    if old then old:Destroy() end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if S.Fullbright then
            pcall(function()
                Lighting.Brightness = 3
                Lighting.ClockTime = 12
                Lighting.FogEnd = 100000
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 200)
            end)
        end
    end
end)

local crossGui = Instance.new("ScreenGui")
crossGui.Name = Utils.randomString()
crossGui.IgnoreGuiInset = true
crossGui.ResetOnSpawn = false
pcall(function()
    if gethui then crossGui.Parent = gethui()
    else crossGui.Parent = CoreGui end
end)

local dot = Instance.new("Frame")
dot.Name = "Crosshair"
dot.AnchorPoint = Vector2.new(0.5, 0.5)
dot.Position = UDim2.fromScale(0.5, 0.5)
dot.Size = UDim2.fromOffset(12, 12)
dot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
dot.BorderSizePixel = 0
dot.Visible = false
dot.Parent = crossGui
Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

task.spawn(function()
    while task.wait(0.1) do
        dot.Visible = S.Crosshair
        dot.Size = UDim2.fromOffset(S.CrosshairSize, S.CrosshairSize)
    end
end)

task.spawn(function()
    task.wait(0.5)
    local Visual = getgenv().RedzNoob:CreateTab("Visual")

    Visual:AddSection("ESP Jogadores")
    Visual:AddToggle("ESP Assassino", false, function(s) S.ESP_Murderer = s end)
    Visual:AddToggle("ESP Xerife", false, function(s) S.ESP_Sheriff = s end)
    Visual:AddToggle("ESP Inocente", false, function(s) S.ESP_Innocent = s end)

    Visual:AddSection("ESP Objetos")
    Visual:AddToggle("ESP Arma Caída", false, function(s) S.ESP_Gun = s end)
    Visual:AddToggle("ESP Moedas", false, function(s) S.ESP_Coins = s end)

    Visual:AddSection("Extras")
    Visual:AddToggle("Mostrar Nomes", false, function(s) S.ShowNames = s end)
    Visual:AddToggle("Chams (X-Ray)", false, function(s) S.Chams = s end)
    Visual:AddToggle("Fullbright", false, function(s)
        S.Fullbright = s
        if not s then
            pcall(function()
                Lighting.Brightness = 1
                Lighting.ClockTime = 14
                Lighting.FogEnd = 100000
                Lighting.GlobalShadows = true
                Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
            end)
        end
    end)

    Visual:AddSection("Mira")
    Visual:AddToggle("Crosshair", false, function(s) S.Crosshair = s end)
    Visual:AddSlider("Tamanho da Crosshair", 5, 40, 12, function(v) S.CrosshairSize = v end)

    Visual:AddButton("🔴 Desligar Todos os ESPs", function()
        S.ESP_Murderer = false
        S.ESP_Sheriff = false
        S.ESP_Innocent = false
        S.ESP_Gun = false
        S.ESP_Coins = false
        S.ShowNames = false
        S.Chams = false
        S.Fullbright = false
        S.Crosshair = false
        Notify("Todos os ESPs desligados!", Color3.fromRGB(255, 100, 100), "x")
    end)
end)

print("[Redz-Noob] Parte 2 carregada.")
-- ABA COMBAT
local function acharAssassino()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and getRole(p) == "Murderer" then
            return p
        end
    end
end
local function acharXerife()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and getRole(p) == "Sheriff" then
            return p
        end
    end
end
local function souXerife() return getRole(LocalPlayer) == "Sheriff" end
local function souAssassino() return getRole(LocalPlayer) == "Murderer" end

local autoShootConn = nil
local autoKnifeConn = nil
local aimbotConn = nil
local colarConn = nil

-- ATIRAR (SHERIFF)
local function atirarNoAssassino()
    if not souXerife() then return end
    local murder = acharAssassino()
    if not murder or not murder.Character then return end
    local char = LocalPlayer.Character
    if not char then return end
    local gun = char:FindFirstChild("Gun")
    if not gun then
        local bp = LocalPlayer:FindFirstChild("Backpack")
        if bp then
            local gunBp = bp:FindFirstChild("Gun")
            if gunBp then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then hum:EquipTool(gunBp) end
                task.wait(0.1)
                gun = char:FindFirstChild("Gun")
            end
        end
    end
    if not gun then return end
    local mHRP = murder.Character:FindFirstChild("HumanoidRootPart")
    local myHRP = char:FindFirstChild("HumanoidRootPart")
    if not mHRP or not myHRP then return end
    local vel = mHRP.AssemblyLinearVelocity
    local dist = (mHRP.Position - myHRP.Position).Magnitude
    local pred = mHRP.Position + (vel * (dist / 100))
    local shoot = gun:FindFirstChild("Shoot")
    if shoot and shoot:IsA("RemoteEvent") then
        pcall(function() shoot:FireServer(CFrame.new(myHRP.Position), CFrame.new(pred)) end)
        return
    end
    local knifeLocal = gun:FindFirstChild("KnifeLocal")
    if knifeLocal then
        local cb = knifeLocal:FindFirstChild("CreateBeam")
        if cb then
            local rf = cb:FindFirstChild("RemoteFunction")
            if rf then
                pcall(function() rf:InvokeServer(1, pred, "AH2") end)
            end
        end
    end
end

-- JOGAR FACA (ASSASSINO)
local function jogarFaca()
    if not souAssassino() then
        Notify("Você não é Assassino!", Color3.fromRGB(255, 100, 100), "x")
        return
    end
    local char = LocalPlayer.Character
    if not char then return end
    local knife = char:FindFirstChild("Knife")
    if not knife then
        local bp = LocalPlayer:FindFirstChild("Backpack")
        if bp then
            local kb = bp:FindFirstChild("Knife")
            if kb then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then hum:EquipTool(kb) end
                task.wait(0.15)
                knife = char:FindFirstChild("Knife")
            end
        end
    end
    if not knife then
        Notify("Sem faca!", Color3.fromRGB(255, 100, 100), "x")
        return
    end
    local maisProximo, distMenor = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local pRoot = p.Character:FindFirstChild("HumanoidRootPart")
            local myRoot = char:FindFirstChild("HumanoidRootPart")
            if pRoot and myRoot then
                local d = (pRoot.Position - myRoot.Position).Magnitude
                if d < distMenor then maisProximo, distMenor = p, d end
            end
        end
    end
    if not maisProximo then
        Notify("Ninguém por perto!", Color3.fromRGB(255, 100, 100), "x")
        return
    end
    local tHRP = maisProximo.Character:FindFirstChild("HumanoidRootPart")
    local myHRP = char:FindFirstChild("HumanoidRootPart")
    if not tHRP or not myHRP then return end
    local pred = tHRP.Position + (tHRP.AssemblyLinearVelocity * 0.3)
    local events = knife:FindFirstChild("Events")
    if events then
        local kt = events:FindFirstChild("KnifeThrown")
        if kt and kt:IsA("RemoteEvent") then
            pcall(function() kt:FireServer(CFrame.new(myHRP.Position), CFrame.new(pred)) end)
            Notify("Faca jogada em " .. maisProximo.Name, Color3.fromRGB(0, 200, 100), "check")
            return
        end
    end
    local throw = knife:FindFirstChild("Throw")
    if throw and throw:IsA("RemoteEvent") then
        pcall(function() throw:FireServer(CFrame.new(myHRP.Position), CFrame.new(pred)) end)
        Notify("Faca jogada em " .. maisProximo.Name, Color3.fromRGB(0, 200, 100), "check")
    end
end

task.spawn(function()
    task.wait(0.9)
    local Combat = getgenv().RedzNoob:CreateTab("Combat")

    Combat:AddSection("Auto Shoot (Sheriff)")
    Combat:AddToggle("Auto Shoot", false, function(s)
        S.AutoShoot = s
        if s then
            if autoShootConn then autoShootConn:Disconnect() end
            autoShootConn = RS.Heartbeat:Connect(function()
                if S.AutoShoot then pcall(atirarNoAssassino) end
            end)
            Notify("Auto Shoot ATIVADO", Color3.fromRGB(0, 200, 100), "check")
        else
            if autoShootConn then autoShootConn:Disconnect() autoShootConn = nil end
            Notify("Auto Shoot DESATIVADO", Color3.fromRGB(255, 100, 100), "x")
        end
    end)
    Combat:AddButton("🎯 Atirar no Assassino (1x)", function()
        if not souXerife() then
            Notify("Você não é Xerife!", Color3.fromRGB(255, 100, 100), "x")
            return
        end
        atirarNoAssassino()
        Notify("Atirou!", Color3.fromRGB(0, 200, 100), "check")
    end)

    Combat:AddSection("Assassino - Auto Faca")
    Combat:AddToggle("Auto Throw Knife", false, function(s)
        S.AutoKnife = s
        if s then
            if autoKnifeConn then autoKnifeConn:Disconnect() end
            autoKnifeConn = task.spawn(function()
                while S.AutoKnife do
                    pcall(jogarFaca)
                    task.wait(2)
                end
            end)
            Notify("Auto Faca ATIVADO", Color3.fromRGB(0, 200, 100), "check")
        else
            Notify("Auto Faca DESATIVADO", Color3.fromRGB(255, 100, 100), "x")
        end
    end)
    Combat:AddButton("🗡️ Jogar Faca (1x)", function()
        jogarFaca()
    end)

    Combat:AddSection("Aimbot")
    Combat:AddToggle("Aimbot (câmera trava)", false, function(s)
        S.Aimbot = s
        if s then
            if aimbotConn then aimbotConn:Disconnect() end
            aimbotConn = RS.RenderStepped:Connect(function()
                if not S.Aimbot then return end
                local murder = acharAssassino()
                if not murder or not murder.Character then return end
                local mHRP = murder.Character:FindFirstChild("HumanoidRootPart") or murder.Character:FindFirstChild("Head")
                if not mHRP then return end
                local cam = workspace.CurrentCamera
                cam.CFrame = CFrame.new(cam.CFrame.Position, mHRP.Position)
            end)
        else
            if aimbotConn then aimbotConn:Disconnect() aimbotConn = nil end
        end
    end)
    Combat:AddToggle("Colar no Assassino", false, function(s)
        S.Colar = s
        if s then
            if colarConn then colarConn:Disconnect() end
            colarConn = RS.Heartbeat:Connect(function()
                if not S.Colar then return end
                local murder = acharAssassino()
                if not murder or not murder.Character then return end
                local mHRP = murder.Character:FindFirstChild("HumanoidRootPart")
                local myChar = LocalPlayer.Character
                if not mHRP or not myChar then return end
                local myHRP = myChar:FindFirstChild("HumanoidRootPart")
                if not myHRP then return end
                myHRP.CFrame = mHRP.CFrame + Vector3.new(0, 2, 2)
            end)
        else
            if colarConn then colarConn:Disconnect() colarConn = nil end
        end
    end)

    Combat:AddSection("Combos")
    Combat:AddButton("⚡ Atirar + Colar (Xerife)", function()
        if not souXerife() then
            Notify("Você não é Xerife!", Color3.fromRGB(255, 100, 100), "x")
            return
        end
        local murder = acharAssassino()
        if not murder then
            Notify("Sem assassino!", Color3.fromRGB(255, 100, 100), "x")
            return
        end
        local myChar = LocalPlayer.Character
        if not myChar then return end
        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
        local mHRP = murder.Character and murder.Character:FindFirstChild("HumanoidRootPart")
        if myHRP and mHRP then
            myHRP.CFrame = mHRP.CFrame + Vector3.new(0, 2, 2)
            task.wait(0.1)
            for i = 1, 5 do
                atirarNoAssassino()
                task.wait(0.15)
            end
            Notify("Combo executado!", Color3.fromRGB(0, 200, 100), "check")
        end
    end)
    Combat:AddButton("🗡️ Faca + Colar (Assassino)", function()
        if not souAssassino() then
            Notify("Você não é Assassino!", Color3.fromRGB(255, 100, 100), "x")
            return
        end
        jogarFaca()
    end)

    Combat:AddSection("Info")
    Combat:AddText("Auto Shoot só funciona se for Sheriff.")
    Combat:AddText("Auto Faca só funciona se for Assassino.")
    Combat:AddText("Botões flutuantes: 🎯 ATIRAR e 🔪 FACADA")
end)

print("[Redz-Noob] Parte 3 carregada.")
-- ABA MOVEMENT
local function getChar() return LocalPlayer.Character end
local function getHum()
    local c = getChar()
    if c then return c:FindFirstChildOfClass("Humanoid") end
end
local function getRoot()
    local c = getChar()
    if c then return c:FindFirstChild("HumanoidRootPart") end
end

local flyState = {active = false, conns = {}, bg = nil, bv = nil}
local function startFly()
    local root = getRoot()
    if not root then return end
    local bg = Instance.new("BodyGyro")
    bg.P = 9e4
    bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.CFrame = root.CFrame
    bg.Parent = root
    local bv = Instance.new("BodyVelocity")
    bv.Velocity = Vector3.zero
    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bv.P = 1250
    bv.Parent = root
    flyState.active = true
    flyState.bg = bg
    flyState.bv = bv
    local conn = RS.RenderStepped:Connect(function()
        if not flyState.active then return end
        local hum = getHum()
        if not hum or hum.Health <= 0 then return end
        local move = hum.MoveDirection
        local cam = workspace.CurrentCamera
        local dir = Vector3.zero
        if move.Magnitude > 0 then
            dir = (cam.CFrame.LookVector * move.Z + cam.CFrame.RightVector * move.X).Unit * S.FlySpeed
        end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then
            dir = dir + Vector3.new(0, S.FlySpeed, 0)
        end
        bv.Velocity = dir
        bg.CFrame = cam.CFrame
    end)
    table.insert(flyState.conns, conn)
end
local function stopFly()
    flyState.active = false
    for _, c in ipairs(flyState.conns) do c:Disconnect() end
    flyState.conns = {}
    if flyState.bg then flyState.bg:Destroy() end
    if flyState.bv then flyState.bv:Destroy() end
end

local noclipConn = nil
local function startNoclip()
    if noclipConn then return end
    noclipConn = RS.Stepped:Connect(function()
        local c = getChar()
        if not c then return end
        for _, p in ipairs(c:GetDescendants()) do
            if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
        end
    end)
end
local function stopNoclip()
    if noclipConn then noclipConn:Disconnect() noclipConn = nil end
end

local invisConn = nil
local function startInvisible()
    if invisConn then return end
    invisConn = RS.Stepped:Connect(function()
        local c = getChar()
        if not c then return end
        for _, p in ipairs(c:GetDescendants()) do
            if p:IsA("BasePart") then p.Transparency = 1 end
            if p:IsA("Decal") then p.Transparency = 1 end
        end
    end)
end
local function stopInvisible()
    if invisConn then invisConn:Disconnect() invisConn = nil end
    local c = getChar()
    if c then
        for _, p in ipairs(c:GetDescendants()) do
            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.Transparency = 0 end
            if p:IsA("Decal") then p.Transparency = 0 end
        end
    end
end

local infJumpConn = nil
local function startInfJump()
    if infJumpConn then return end
    infJumpConn = UIS.JumpRequest:Connect(function()
        if not S.InfiniteJump then return end
        local h = getHum()
        if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
    end)
end
local function stopInfJump()
    if infJumpConn then infJumpConn:Disconnect() infJumpConn = nil end
end

task.spawn(function()
    while task.wait(0.5) do
        local h = getHum()
        if h then
            if S.SpeedBoost then
                h.WalkSpeed = S.WalkSpeed
            else
                if h.WalkSpeed ~= 16 then h.WalkSpeed = 16 end
            end
            if S.JumpBoost then
                h.UseJumpPower = true
                h.JumpPower = S.JumpPower
            else
                if h.JumpPower ~= 50 then h.JumpPower = 50 end
            end
        end
    end
end)

local antiVoidConn = nil
local function startAntiVoid()
    if antiVoidConn then return end
    antiVoidConn = RS.Heartbeat:Connect(function()
        local r = getRoot()
        if r and r.Position.Y < -50 then
            r.CFrame = CFrame.new(0, 50, 0)
            Notify("Anti-Void ativado!", Color3.fromRGB(0, 200, 255), "check")
        end
    end)
end
local function stopAntiVoid()
    if antiVoidConn then antiVoidConn:Disconnect() antiVoidConn = nil end
end

task.spawn(function()
    task.wait(1.2)
    local Move = getgenv().RedzNoob:CreateTab("Movement")

    Move:AddSection("Velocidade")
    Move:AddToggle("Speed Boost", false, function(s) S.SpeedBoost = s end)
    Move:AddSlider("WalkSpeed", 16, 250, 16, function(v) S.WalkSpeed = v end)
    Move:AddToggle("Jump Boost", false, function(s) S.JumpBoost = s end)
    Move:AddSlider("JumpPower", 50, 300, 50, function(v) S.JumpPower = v end)

    Move:AddSection("Voo / Mobilidade")
    Move:AddToggle("Fly", false, function(s)
        S.Fly = s
        if s then startFly() else stopFly() end
    end)
    Move:AddSlider("Fly Speed", 20, 300, 80, function(v) S.FlySpeed = v end)
    Move:AddToggle("Infinite Jump", false, function(s)
        S.InfiniteJump = s
        if s then startInfJump() else stopInfJump() end
    end)
    Move:AddToggle("Noclip", false, function(s)
        S.Noclip = s
        if s then startNoclip() else stopNoclip() end
    end)
    Move:AddToggle("Invisible", false, function(s)
        S.Invisible = s
        if s then startInvisible() else stopInvisible() end
    end)
    Move:AddToggle("Anti-Void", false, function(s)
        S.AntiVoid = s
        if s then startAntiVoid() else stopAntiVoid() end
    end)

    -- ABA TELEPORT
    local TP = getgenv().RedzNoob:CreateTab("Teleport")
    local function tpTo(target)
        local r = getRoot()
        if not r or not target or not target.Character then return end
        local tR = target.Character:FindFirstChild("HumanoidRootPart")
        if not tR then return end
        r.CFrame = tR.CFrame * CFrame.new(0, 2, 3)
        Notify("Teleportado para " .. target.Name, Color3.fromRGB(0, 200, 255), "info")
    end

    TP:AddSection("Teleportes Rápidos")
    TP:AddButton("🎯 Teleportar para Assassino", function()
        local a = acharAssassino()
        if a then tpTo(a) else Notify("Sem assassino", Color3.fromRGB(255,100,100), "x") end
    end)
    TP:AddButton("👮 Teleportar para Xerife", function()
        local x = acharXerife()
        if x then tpTo(x) else Notify("Sem xerife", Color3.fromRGB(255,100,100), "x") end
    end)
    TP:AddButton("🔫 Teleportar para Arma Caída", function()
        local r = getRoot()
        if not r then return end
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and (obj.Name == "GunDrop" or obj.Name == "DroppedGun") then
                r.CFrame = obj.CFrame + Vector3.new(0, 3, 0)
                Notify("Teleportado pra arma", Color3.fromRGB(255,200,0), "info")
                return
            end
        end
        Notify("Sem arma caída", Color3.fromRGB(255,100,100), "x")
    end)
end)

-- ABA FLING
local function flingarPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then
        Notify("Alvo inválido!", Color3.fromRGB(255, 100, 100), "x")
        return
    end
    local meuChar = LocalPlayer.Character
    if not meuChar then return end
    local meuRoot = meuChar:FindFirstChild("HumanoidRootPart")
    if not meuRoot then return end
    local alvoHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not alvoHRP then
        Notify("Alvo sem root!", Color3.fromRGB(255, 100, 100), "x")
        return
    end
    local posOriginal = meuRoot.CFrame
    local bv = Instance.new("BodyVelocity")
    bv.Name = "RedzFling"
    bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Parent = alvoHRP
    local bav = Instance.new("BodyAngularVelocity")
    bav.Name = "RedzSpin"
    bav.AngularVelocity = Vector3.new(9e8, 9e8, 9e8)
    bav.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bav.Parent = alvoHRP
    for i = 1, 3 do
        meuRoot.CFrame = alvoHRP.CFrame
        task.wait(0.05)
    end
    task.wait(0.5)
    if bv then bv:Destroy() end
    if bav then bav:Destroy() end
    meuRoot.CFrame = posOriginal
    Notify("Flingou " .. targetPlayer.Name .. "!", Color3.fromRGB(0, 200, 100), "check")
end

local antiFlingConn = nil
local ultimaPosAF = nil
local function startAntiFling()
    if antiFlingConn then return end
    antiFlingConn = RS.Heartbeat:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local vel = root.AssemblyLinearVelocity
        local rotVel = root.AssemblyAngularVelocity
        if vel.Magnitude > 200 or rotVel.Magnitude > 200 then
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
            if ultimaPosAF then root.CFrame = ultimaPosAF end
        else
            ultimaPosAF = root.CFrame
        end
    end)
    Notify("Anti-Fling ATIVADO", Color3.fromRGB(0, 200, 100), "check")
end
local function stopAntiFling()
    if antiFlingConn then antiFlingConn:Disconnect() antiFlingConn = nil end
    Notify("Anti-Fling DESATIVADO", Color3.fromRGB(255, 100, 100), "x")
end

task.spawn(function()
    task.wait(1.5)
    local Fling = getgenv().RedzNoob:CreateTab("Fling")

    Fling:AddSection("Fling Rápido")
    Fling:AddButton("🎯 Fling Assassino", function()
        local a = acharAssassino()
        if a then flingarPlayer(a) else Notify("Sem assassino!", Color3.fromRGB(255, 100, 100), "x") end
    end)
    Fling:AddButton("👮 Fling Xerife", function()
        local x = acharXerife()
        if x then flingarPlayer(x) else Notify("Sem xerife!", Color3.fromRGB(255, 100, 100), "x") end
    end)
    Fling:AddButton("👥 Fling Todos os Players", function()
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                task.spawn(function() flingarPlayer(p) end)
                task.wait(0.3)
            end
        end
        Notify("Flingou todos!", Color3.fromRGB(0, 200, 100), "check")
    end)

    Fling:AddSection("Anti-Fling")
    Fling:AddToggle("Anti-Fling (se protege)", false, function(s)
        S.AntiFling = s
        if s then startAntiFling() else stopAntiFling() end
    end)

    Fling:AddSection("Lista de Players")
    local listaFrame = Instance.new("ScrollingFrame")
    listaFrame.Size = UDim2.new(1, 0, 0, 180)
    listaFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    listaFrame.BorderSizePixel = 0
    listaFrame.ScrollBarThickness = 4
    listaFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    listaFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Instance.new("UICorner", listaFrame).CornerRadius = UDim.new(0, 10)
    local listaLayout = Instance.new("UIListLayout", listaFrame)
    listaLayout.Padding = UDim.new(0, 4)
    listaLayout.SortOrder = Enum.SortOrder.LayoutOrder
    local listaPad = Instance.new("UIPadding", listaFrame)
    listaPad.PaddingTop = UDim.new(0, 6)
    listaPad.PaddingBottom = UDim.new(0, 6)
    listaPad.PaddingLeft = UDim.new(0, 6)
    listaPad.PaddingRight = UDim.new(0, 6)
    listaFrame.Parent = getgenv().RedzNoob.ContentScroll

    local function atualizarLista()
        for _, v in ipairs(listaFrame:GetChildren()) do
            if v:IsA("TextButton") then v:Destroy() end
        end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local role = getRole(p)
                local cor = Color3.fromRGB(0, 255, 0)
                if role == "Murderer" then cor = Color3.fromRGB(255, 0, 0)
                elseif role == "Sheriff" then cor = Color3.fromRGB(0, 150, 255) end
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, 0, 0, 36)
                btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                btn.Text = p.Name .. " [" .. role .. "]  👉 FLING"
                btn.Font = Enum.Font.GothamBold
                btn.TextSize = 12
                btn.TextColor3 = cor
                btn.TextXAlignment = Enum.TextXAlignment.Left
                btn.Parent = listaFrame
                Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
                local pPad = Instance.new("UIPadding", btn)
                pPad.PaddingLeft = UDim.new(0, 10)
                btn.MouseButton1Click:Connect(function()
                    flingarPlayer(p)
                end)
            end
        end
    end
    task.spawn(function()
        while task.wait(2) do pcall(atualizarLista) end
    end)
    task.wait(0.3)
    atualizarLista()
end)

print("[Redz-Noob] Parte 4 carregada.")
-- ABA FARM
task.spawn(function()
    task.wait(1.8)
    local Farm = getgenv().RedzNoob:CreateTab("Farm")

    Farm:AddSection("Auto Coins")
    Farm:AddToggle("Auto Coins", false, function(s)
        S.AutoCoins = s
        Notify(s and "Auto Coins ATIVADO" or "Auto Coins DESATIVADO",
               s and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(255, 100, 100),
               s and "check" or "x")
    end)

    Farm:AddButton("Pegar 1 moeda mais próxima", function()
        local r = getRoot()
        if not r then return end
        local closest, dist = nil, math.huge
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and (obj.Name == "Coin" or obj.Name == "Coin_Server") then
                local d = (r.Position - obj.Position).Magnitude
                if d < dist then closest = obj dist = d end
            end
        end
        if closest then
            r.CFrame = closest.CFrame + Vector3.new(0, 2, 0)
            Notify("Teleportado pra moeda", Color3.fromRGB(255, 200, 0), "info")
        else
            Notify("Sem moeda próxima", Color3.fromRGB(255,100,100), "x")
        end
    end)

    Farm:AddSection("Auto Grab Gun (Salva Posição)")
    Farm:AddToggle("Auto Grab Gun", false, function(s)
        S.AutoGrabGun = s
        Notify(s and "Auto Gun ATIVADO" or "Auto Gun DESATIVADO",
               s and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(255, 100, 100),
               s and "check" or "x")
    end)

    Farm:AddButton("Pegar arma caída (salva e volta)", function()
        local r = getRoot()
        if not r then
            Notify("Sem personagem!", Color3.fromRGB(255,100,100), "x")
            return
        end
        local posOriginal = r.CFrame
        local armaEncontrada = nil
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and (obj.Name == "GunDrop" or obj.Name == "DroppedGun" or obj.Name:lower():find("drop")) then
                armaEncontrada = obj
                break
            end
        end
        if not armaEncontrada then
            Notify("Sem arma caída no mapa!", Color3.fromRGB(255,100,100), "x")
            return
        end
        Notify("Indo pegar arma...", Color3.fromRGB(255,200,0), "info")
        r.CFrame = armaEncontrada.CFrame + Vector3.new(0, 2, 0)
        task.wait(0.5)
        r.CFrame = posOriginal
        Notify("Arma pega! Voltou pra posição original.", Color3.fromRGB(0,200,100), "check")
    end)

    Farm:AddSection("Info")
    Farm:AddText("Auto Coins pega moedas automaticamente")
    Farm:AddText("Auto Gun salva sua posição, pega a arma e volta")
end)

-- LOOP AUTO COINS
task.spawn(function()
    while task.wait(0.3) do
        if S.AutoCoins then
            local r = getRoot()
            if r then
                local closest, dist = nil, math.huge
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and (obj.Name == "Coin" or obj.Name == "Coin_Server") then
                        local d = (r.Position - obj.Position).Magnitude
                        if d < dist then closest = obj dist = d end
                    end
                end
                if closest and dist < 500 then
                    r.CFrame = closest.CFrame + Vector3.new(0, 2, 0)
                end
            end
        end
    end
end)

-- LOOP AUTO GRAB GUN (salva posição e volta)
local pegadoNestaRodada = false
task.spawn(function()
    while task.wait(1) do
        if S.AutoGrabGun then
            local r = getRoot()
            if r and not pegadoNestaRodada then
                local armaEncontrada = nil
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and (obj.Name == "GunDrop" or obj.Name == "DroppedGun" or obj.Name:lower():find("drop")) then
                        armaEncontrada = obj
                        break
                    end
                end
                if armaEncontrada then
                    pegadoNestaRodada = true
                    local posOriginal = r.CFrame
                    r.CFrame = armaEncontrada.CFrame + Vector3.new(0, 2, 0)
                    task.wait(0.5)
                    r.CFrame = posOriginal
                    Notify("Auto: arma pega!", Color3.fromRGB(0,200,100), "check")
                    task.wait(5)
                    pegadoNestaRodada = false
                end
            end
        end
    end
end)

-- ABA MISC
local antiAfkConn = nil
local function startAntiAfk()
    if antiAfkConn then return end
    antiAfkConn = LocalPlayer.Idled:Connect(function()
        local vu = game:GetService("VirtualUser")
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
    end)
end
local function stopAntiAfk()
    if antiAfkConn then antiAfkConn:Disconnect() antiAfkConn = nil end
end

task.spawn(function()
    task.wait(2)
    local Misc = getgenv().RedzNoob:CreateTab("Misc")

    Misc:AddSection("Anti-AFK")
    Misc:AddToggle("Anti-AFK", false, function(s)
        S.AntiAFK = s
        if s then
            startAntiAfk()
            Notify("Anti-AFK ATIVADO", Color3.fromRGB(0, 200, 100), "check")
        else
            stopAntiAfk()
            Notify("Anti-AFK DESATIVADO", Color3.fromRGB(255, 100, 100), "x")
        end
    end)

    Misc:AddSection("Servidor")
    Misc:AddButton("🔄 Server Hop", function()
        Notify("Buscando servidor...", Color3.fromRGB(255, 200, 0), "info")
        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        local ok, result = pcall(function() return game:HttpGet(url) end)
        if not ok then
            Notify("Erro ao buscar", Color3.fromRGB(255,100,100), "x")
            return
        end
        local data = HS:JSONDecode(result)
        if data and data.data then
            for _, s in ipairs(data.data) do
                if s.id ~= game.JobId and s.playing < s.maxPlayers then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
                    return
                end
            end
        end
        Notify("Sem servidor disponível", Color3.fromRGB(255,100,100), "x")
    end)

    Misc:AddButton("🔁 Rejoin", function()
        Notify("Reconectando...", Color3.fromRGB(255, 200, 0), "info")
        pcall(function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
        end)
    end)

    Misc:AddSection("Social")
    Misc:AddButton("📋 Copiar Script", function()
        if setclipboard then
            setclipboard("loadstring(game:HttpGet('https://raw.githubusercontent.com/miguel12345711/MM2.HUB/main/Redz-Noob.competition.lua'))()")
            Notify("Script copiado!", Color3.fromRGB(0, 200, 100), "check")
        else
            Notify("Não suportado", Color3.fromRGB(255,100,100), "x")
        end
    end)

    Misc:AddSection("Sistema")
    Misc:AddButton("⏹️ Descarregar Script", function()
        if flyState.bg then flyState.bg:Destroy() end
        if flyState.bv then flyState.bv:Destroy() end
        stopNoclip()
        stopInvisible()
        stopInfJump()
        stopAntiVoid()
        stopAntiAfk()
        stopAntiFling()
        if getgenv().RedzNoob.Root then
            getgenv().RedzNoob.Root:Destroy()
        end
        Notify("Script descarregado", Color3.fromRGB(255,100,100), "x")
    end)

    Misc:AddSection("Info")
    Misc:AddText("Redz-Noob MM2 Hub v2.1")
    Misc:AddText("Executor: " .. (identifyexecutor and identifyexecutor() or "Desconhecido"))

    Notify("Script carregado! Toque no botão 'RN'.", Color3.fromRGB(0, 200, 100), "check")
end)

-- BOTÃO FLUTUANTE "ATIRAR" (Sheriff)
task.spawn(function()
    task.wait(2.5)
    local autoShootBtn = Instance.new("TextButton")
    autoShootBtn.Name = "RedzAtirarBtn"
    autoShootBtn.AnchorPoint = Vector2.new(1, 1)
    autoShootBtn.Position = UDim2.new(1, -20, 1, -20)
    autoShootBtn.Size = UDim2.fromOffset(130, 55)
    autoShootBtn.BackgroundColor3 = Color3.fromRGB(197, 0, 0)
    autoShootBtn.Text = "🎯 ATIRAR"
    autoShootBtn.Font = Enum.Font.GothamBold
    autoShootBtn.TextSize = 16
    autoShootBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    autoShootBtn.TextWrapped = true
    autoShootBtn.ZIndex = 50
    autoShootBtn.Parent = getgenv().RedzNoob.Root

    Instance.new("UICorner", autoShootBtn).CornerRadius = UDim.new(0, 12)

    local btnStrokeA = Instance.new("UIStroke", autoShootBtn)
    btnStrokeA.Color = Color3.fromRGB(255, 255, 255)
    btnStrokeA.Thickness = 2

    local animandoA = false
    autoShootBtn.MouseButton1Click:Connect(function()
        if animandoA then return end
        animandoA = true
        TS:Create(autoShootBtn, TweenInfo.new(0.1), {
            Size = UDim2.fromOffset(110, 47)
        }):Play()
        if not souXerife() then
            Notify("Você não é Xerife!", Color3.fromRGB(255, 100, 100), "x")
        else
            atirarNoAssassino()
            Notify("Atirou!", Color3.fromRGB(0, 200, 100), "check")
        end
        task.wait(0.1)
        TS:Create(autoShootBtn, TweenInfo.new(0.15, Enum.EasingStyle.Back), {
            Size = UDim2.fromOffset(130, 55)
        }):Play()
        task.wait(0.2)
        animandoA = false
    end)

    local arrastandoA = false
    local posInicialA, posFrameA

    autoShootBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            posInicialA = input.Position
            posFrameA = autoShootBtn.Position
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement) and posInicialA then
            local delta = input.Position - posInicialA
            if math.abs(delta.X) > 15 or math.abs(delta.Y) > 15 then
                arrastandoA = true
                autoShootBtn.Position = UDim2.new(
                    posFrameA.X.Scale, posFrameA.X.Offset + delta.X,
                    posFrameA.Y.Scale, posFrameA.Y.Offset + delta.Y
                )
            end
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            posInicialA = nil
            arrastandoA = false
        end
    end)
end)

-- BOTÃO FLUTUANTE "FACADA" (Assassino)
task.spawn(function()
    task.wait(3)
    local facaBtn = Instance.new("TextButton")
    facaBtn.Name = "RedzFacaBtn"
    facaBtn.AnchorPoint = Vector2.new(0, 1)
    facaBtn.Position = UDim2.new(0, 20, 1, -20)
    facaBtn.Size = UDim2.fromOffset(130, 55)
    facaBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    facaBtn.Text = "🔪 FACADA"
    facaBtn.Font = Enum.Font.GothamBold
    facaBtn.TextSize = 16
    facaBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    facaBtn.TextWrapped = true
    facaBtn.ZIndex = 50
    facaBtn.Parent = getgenv().RedzNoob.Root

    Instance.new("UICorner", facaBtn).CornerRadius = UDim.new(0, 12)

    local btnStrokeF = Instance.new("UIStroke", facaBtn)
    btnStrokeF.Color = Color3.fromRGB(255, 255, 255)
    btnStrokeF.Thickness = 2

    local animandoF = false
    facaBtn.MouseButton1Click:Connect(function()
        if animandoF then return end
        animandoF = true
        TS:Create(facaBtn, TweenInfo.new(0.1), {
            Size = UDim2.fromOffset(110, 47)
        }):Play()
        jogarFaca()
        task.wait(0.1)
        TS:Create(facaBtn, TweenInfo.new(0.15, Enum.EasingStyle.Back), {
            Size = UDim2.fromOffset(130, 55)
        }):Play()
        task.wait(0.2)
        animandoF = false
    end)

    local arrastandoF = false
    local posInicialF, posFrameF

    facaBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            posInicialF = input.Position
            posFrameF = facaBtn.Position
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement) and posInicialF then
            local delta = input.Position - posInicialF
            if math.abs(delta.X) > 15 or math.abs(delta.Y) > 15 then
                arrastandoF = true
                facaBtn.Position = UDim2.new(
                    posFrameF.X.Scale, posFrameF.X.Offset + delta.X,
                    posFrameF.Y.Scale, posFrameF.Y.Offset + delta.Y
                )
            end
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            posInicialF = nil
            arrastandoF = false
        end
    end)
end)

-- KEYBIND RIGHT SHIFT
UIS.InputBegan:Connect(function(inp, proc)
    if proc then return end
    if inp.KeyCode == Enum.KeyCode.RightShift then
        if mainWindow.Visible then
            mainWindow.Visible = false
            if getgenv().RedzNoob.MinBtn then getgenv().RedzNoob.MinBtn.Visible = true end
        else
            mainWindow.Visible = true
            if getgenv().RedzNoob.MinBtn then getgenv().RedzNoob.MinBtn.Visible = false end
        end
    end
end)

--==============================================================
-- FINAL
--==============================================================
task.spawn(function()
    task.wait(3)
    Notify("Redz-Noob v2.1 carregado!", Color3.fromRGB(0, 200, 100), "check")
    task.wait(0.7)
    Notify("Botões flutuantes: 🎯 ATIRAR e 🔪 FACADA", Color3.fromRGB(0, 150, 255), "info")
end)

print("==================================================")
print("[Redz-Noob] SCRIPT COMPLETO CARREGADO!")
print("[Redz-Noob] Key: Redz-Noob.competition")
print("[Redz-Noob] Abas: Visual, Combat, Movement, Teleport, Fling, Farm, Misc")
print("[Redz-Noob] Abrir: RightShift ou botão 'RN'")
print("[Redz-Noob] Botões: 🎯 ATIRAR (dir) e 🔪 FACADA (esq)")
print("==================================================")
print("[Redz-Noob] Feito por Redz-Noob Team")

