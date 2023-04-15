local module = {}

function module.fadeOutGUI(object,seconds)
    local function fadeOut(guiInstance,seconds)
        if guiInstance:IsA("ImageLabel") then
            tweenService:Create(guiInstance, TweenInfo.new(seconds, Enum.EasingStyle.Quad), {ImageTransparency = 1}):Play()
        end

        if guiInstance:IsA("TextLabel") then
            tweenService:Create(guiInstance, TweenInfo.new(seconds, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
        end

        if guiInstance:IsA("Frame") then
            tweenService:Create(guiInstance, TweenInfo.new(seconds, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
        end

        if guiInstance:IsA("ImageButton") then
            tweenService:Create(guiInstance, TweenInfo.new(seconds, Enum.EasingStyle.Quad), {ImageTransparency = 1}):Play()
        end
    end

    for _, instance in pairs(object:GetDescendants()) do
        if instance:IsA("ImageLabel") or instance:IsA("TextLabel") or instance:IsA("Frame") or instance:IsA("ImageButton") then
            fadeOut(instance,seconds)
        end
    end
end

function module.fadeInGUI(object,seconds)
    local function fadeIn(guiInstance,seconds)
        if guiInstance:IsA("ImageLabel") then

            tweenService:Create(guiInstance, TweenInfo.new(seconds, Enum.EasingStyle.Quad), {ImageTransparency = 0}):Play()
        end

        if guiInstance:IsA("TextLabel") then
            tweenService:Create(guiInstance, TweenInfo.new(seconds, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
        end

        if guiInstance:IsA("Frame") then
            tweenService:Create(guiInstance, TweenInfo.new(seconds, Enum.EasingStyle.Quad), {BackgroundTransparency = 0}):Play()
        end

        if guiInstance:IsA("ImageButton") then
            tweenService:Create(guiInstance, TweenInfo.new(seconds, Enum.EasingStyle.Quad), {ImageTransparency = 0}):Play()
        end
    end

    for _, instance in pairs(object:GetDescendants()) do
        if instance:IsA("ImageLabel") or instance:IsA("TextLabel") or instance:IsA("Frame") or instance:IsA("ImageButton") then
            fadeIn(instance,seconds)
        end
    end
end

return module
