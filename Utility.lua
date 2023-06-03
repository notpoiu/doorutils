local module = {
	player = game.Players.LocalPlayer,
	character = workspace[game.Players.LocalPlayer.Name]
}

function module:doCustomGuidingLight(color,text,song)
    game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Disabled = true
    
    local v1 = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health:FindFirstAncestor("MainUI");
    local l__LocalPlayer__2 = game.Players.LocalPlayer;
    local v3 = require(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game);
    local l__UserInputService__4 = game:GetService("UserInputService");
    local l__TweenService__5 = game:GetService("TweenService");
    local l__TextService__6 = game:GetService("TextService");
    local l__GuiService__7 = game:GetService("GuiService");
    local l__Humanoid__8 = v3.char:WaitForChild("Humanoid");
    local u7 = game:GetService("RunService")
    local l__mouse__9 = l__LocalPlayer__2:GetMouse();
    local v10 = require(game:GetService("ReplicatedStorage"):WaitForChild("ReplicaDataModule"));
    local v11 = require(game:GetService("ReplicatedStorage"):WaitForChild("ClientModules"):WaitForChild("NumberConvert"));
    local v12 = require(game:GetService("ReplicatedStorage"):WaitForChild("ClientModules"):WaitForChild("GetProductPrice"));
    local v13 = require(game:GetService("ReplicatedStorage"):WaitForChild("Products"));
    local l__Healthbar__14 = v1.MainFrame.Healthbar;
    l__Healthbar__14.Visible = true;
    local v15 = 0;
    v3.spectarget = nil;
    v3.trackspec = true;
    v3.dead = false;
    game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Ringing:Play();
    local u1 = text;
    local u2 = "Blue";
    game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Ringing:Stop();
	u14 = true;
	wait(0.2);
	v3.update();
	l__UserInputService__4.InputBegan:Connect(function(p9, p10)
		if p9.UserInputType == Enum.UserInputType.MouseButton1 or p9.UserInputType == Enum.UserInputType.Touch then
			if p10 then
				return;
			else
				u15 = true;
				return;
			end;
		end;
		if p9.KeyCode == Enum.KeyCode.ButtonB or p9.KeyCode == Enum.KeyCode.ButtonA or p9.KeyCode == Enum.KeyCode.ButtonX then
			u15 = true;
			return;
		end;
		if p9.KeyCode == Enum.KeyCode.ButtonL1 or p9.KeyCode == Enum.KeyCode.Q then
			u3(-1);
			return;
		end;
		if p9.KeyCode == Enum.KeyCode.ButtonR2 or p9.KeyCode == Enum.KeyCode.E then
			u3(1);
		end;
	end);
	local v55 = 120;
	for v56 = 1, math.huge do
		u7.Heartbeat:wait();
		if v3.deathtick <= tick() then
			v3.update();
			local l__Revive__57 = v1.HodlerRevive.Revive;
			v1.HodlerRevive.Visible = true;
			if v10 and v10.data then
				local u16 = game.ReplicatedStorage.EntityInfo.CheckRevive:InvokeServer();
				local u17 = v55;
				local l__ReviveEmpty__18 = v1.HodlerRevive.ReviveEmpty;
				local function v58()
					local l__Revives__59 = v10.data.Revives;
					l__Revive__57.AmountLabel.Text = "x" .. tostring(l__Revives__59);
					if l__Revives__59 == 0 then
						l__Revive__57.AmountLabel.Visible = false;
					else
						l__Revive__57.AmountLabel.Visible = true;
					end;
					l__Revive__57.RobuxLabel.Text = v12(v13.Revive1);
					l__Revive__57.RobuxLabel.Visible = not l__Revive__57.AmountLabel.Visible;
					if not (not u16) or u17 <= 0 or l__LocalPlayer__2:GetAttribute("CantRevive") then
						l__Revive__57.Visible = false;
					else
						l__Revive__57.Visible = true;
					end;
					l__ReviveEmpty__18.Visible = not l__Revive__57.Visible;
					if game:GetService("ReplicatedStorage"):WaitForChild("GameData"):WaitForChild("LatestRoom").Value >= 90 then
						l__ReviveEmpty__18.ReasonLabel.Text = "You cannot revive past this point.";
					end;
					if game:GetService("ReplicatedStorage"):WaitForChild("GameData"):WaitForChild("SecretFloor").Value then
						l__ReviveEmpty__18.ReasonLabel.Text = "You cannot revive here.";
					end;
					if u17 <= 0 then
						l__ReviveEmpty__18.ReasonLabel.Text = "Your time to revive ran out.";
					end;
					if l__LocalPlayer__2:GetAttribute("CantRevive") then
						l__ReviveEmpty__18.ReasonLabel.Text = "You can only revive in a run once.";
					end;
				end;
				v58();
				v10.event.Revives.Event:Connect(v58);
				l__Revive__57.MouseButton1Down:Connect(function()
					if not game.ReplicatedStorage.EntityInfo.CheckRevive:InvokeServer() and u17 > 0 then
						game:GetService("ReplicatedStorage"):WaitForChild("EntityInfo").Revive:FireServer();
					end;
				end);
				spawn(function()
					local v60 = tick();
					local v61 = tick();
					for v62 = 1, 1200000000000 do
						task.wait();
						local v63 = tick() - v60;
						if v61 + 1 <= tick() then
							v61 = tick();
							v60 = tick();
							u16 = game.ReplicatedStorage.EntityInfo.CheckRevive:InvokeServer();
							if not u16 then
								u17 = u17 - v63;
							end;
							l__Revive__57.TimerLabel.Text = math.ceil(u17);
							v58();
							if u17 <= 0 then
								break;
							end;
						end;
					end;
				end);
			end;
			l__TweenService__5:Create(game.SoundService.Main, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				Volume = 0
			}):Play();
			game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Death:Play();
			v1.MainFrame.Heartbeat.Visible = false;
			game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Parent.Heartbeat.Disabled = true;
			local l__Death__19 = v1.Death;
			spawn(function()
				local v64 = tick();
				for v65 = 1, math.huge do
					local v66 = math.clamp(v64 + 1.5 - tick(), 0, 1.5);
					local v67 = math.clamp(v64 + 3 - tick(), 0, 3);
					l__Death__19.Static.Position = UDim2.new(math.random(0, 100) / 100, 0, math.random(0, 100) / 100, 0);
					l__Death__19.Hodler.Position = UDim2.new(0.5 + math.random(-10, 10) / 500 * v66, 0, 0.5 + math.random(-10, 10) / 400 * v66, 0);
					l__Death__19.Hodler.Rotation = math.random(-v66 * 6, v66 * 6);
					l__Revive__57.Position = UDim2.new(0.5 + math.random(-10, 10) / 200 * v67, 0, 0.5 + math.random(-10, 10) / 140 * v67, 0);
					l__Revive__57.Rotation = math.random(-v67 * 4, v67 * 4);
					u7.Heartbeat:wait();
					if v64 + 3 <= tick() then
						if u1 == nil then
							break;
						end;
						if u1 == {} then
							break;
						end;
					end;
				end;
			end);
			l__Death__19.Visible = true;
			l__TweenService__5:Create(l__Death__19, TweenInfo.new(0.45, Enum.EasingStyle.Elastic, Enum.EasingDirection.In), {
				ImageTransparency = 0
			}):Play();
			l__Death__19.Hodler.Label.Visible = true;
			l__TweenService__5:Create(l__Death__19.Hodler.Label, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				ImageTransparency = 0, 
				Size = UDim2.new(0.5, 0, 0.5, 0), 
				Position = UDim2.new(0.5, 0, 0.5, 0)
			}):Play();
			v3.dead = true;
			wait(0.5);
			pcall(function()
				v1.MainFrame.Visible = false;
				v1.Jumpscare.Visible = false;
			end);
			l__TweenService__5:Create(l__Death__19, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				ImageTransparency = 0, 
				ImageColor3 = Color3.fromRGB(0, 0, 0)
			}):Play();
			l__TweenService__5:Create(l__Death__19.Hodler.Label, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				Size = UDim2.new(0.525, 0, 0.525, 0)
			}):Play();
			
			if u1 ~= nil then
				print(u1);
				local v69 = song or game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Music:FindFirstChild(u2);
				local l__End__70 = v69.End or song;
				v69:Play();
				local v71 = color
				l__Death__19.HelpfulDialogue.TextColor3 = v71[8];
				l__TweenService__5:Create(l__Death__19.Static, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					BackgroundColor3 = v71[1], 
					BackgroundTransparency = 0
				}):Play();
				l__TweenService__5:Create(l__Death__19.Static, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					ImageTransparency = 0.8, 
					ImageColor3 = v71[2]
				}):Play();
				l__TweenService__5:Create(l__Death__19.Static.Static, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					ImageTransparency = 0.8, 
					ImageColor3 = v71[3]
				}):Play();
				l__TweenService__5:Create(l__Death__19, TweenInfo.new(4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					ImageTransparency = 0, 
					ImageColor3 = v71[4]
				}):Play();
				l__TweenService__5:Create(l__Death__19.Hodler.Label, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					ImageTransparency = 1, 
					ImageColor3 = v71[5]
				}):Play();
				l__TweenService__5:Create(l__Death__19.Hodler.Label.Label, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					ImageTransparency = 0, 
					ImageColor3 = v71[6]
				}):Play();
				wait(1);
				l__TweenService__5:Create(l__Death__19.Hodler.Label.Label, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
					ImageTransparency = 1, 
					ImageColor3 = v71[7]
				}):Play();
				wait(0.5);
				l__TweenService__5:Create(l__Death__19.Hodler.Label, TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
					Size = UDim2.new(3, 0, 3, 0)
				}):Play();
				l__Death__19.HelpfulDialogue.TextTransparency = 1;
				l__Death__19.HelpfulDialogue.Visible = true;
				local v72 = v3.camShakerModule.new(200, function(p11)
					local l__Position__73 = p11.Position;
					l__Death__19.HelpfulDialogue.Position = UDim2.new(0.5 + l__Position__73.X / 10, 0, 0.5 + l__Position__73.Y / 10, 0);
					l__Death__19.HelpfulDialogue.Rotation = l__Position__73.X * 5;
				end);
				v72:Start();
				v72:StartShake(0.1, 0.5, 1, (Vector3.new(1, 1, 1)));
				v72:StartShake(0.5, 0.25, 1, (Vector3.new(1, 1, 1)));
				v72:StartShake(1, 0.05, 1, (Vector3.new(1, 1, 1)));
				u15 = false;
				wait(1);
				for v74 = 1, #u1 do
					l__Death__19.HelpfulDialogue.Text = u1[v74];
					if u15 then
						l__Death__19.HelpfulDialogue.TextTransparency = 0;
					else
						l__TweenService__5:Create(l__Death__19.HelpfulDialogue, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
							TextTransparency = 0
						}):Play();
					end;
					local v75 = tick();
					local v76 = tick() + 5 + utf8.len(l__Death__19.HelpfulDialogue.ContentText) / 30;
					if v74 == 1 or not u15 then
						wait(0.5);
					else
						wait(0.1);
					end;
					u15 = false;
					for v77 = 1, 10000000000000 do
						task.wait();
						if v76 <= tick() then
							break;
						end;
						if u15 then
							break;
						end;
					end;
					local v78 = 0.4;
					if u15 then
						v78 = 0.25;
					end;
					l__TweenService__5:Create(l__Death__19.HelpfulDialogue, TweenInfo.new(v78, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
						TextTransparency = 1
					}):Play();
					wait(v78 + 0.01);
				end;
				l__TweenService__5:Create(v69, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Volume = 0
				}):Play();
				l__TweenService__5:Create(l__End__70, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Volume = 1
				}):Play();
				l__End__70:Play();
				l__End__70.TimePosition = 55;
				delay(1, function()
					v69:Stop();
				end);
			else
				wait(2);
			end;
			l__TweenService__5:Create(v1.HodlerRevive, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				Position = UDim2.new(0.5, 0, 0.17, 0)
			}):Play();
			l__TweenService__5:Create(l__Death__19.Static, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				ImageTransparency = 1, 
				ImageColor3 = Color3.fromRGB(226, 42, 67), 
				BackgroundTransparency = 1
			}):Play();
			l__TweenService__5:Create(l__Death__19, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				ImageTransparency = 1, 
				ImageColor3 = Color3.fromRGB(89, 0, 1)
			}):Play();
			l__TweenService__5:Create(l__Death__19.Static.Static, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				ImageTransparency = 1, 
				ImageColor3 = Color3.fromRGB(255, 0, 4)
			}):Play();
			l__TweenService__5:Create(game.SoundService.Main, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
				Volume = 1
			}):Play();
			l__TweenService__5:Create(l__Death__19.Hodler.Label, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				ImageTransparency = 1, 
				ImageColor3 = Color3.fromRGB(218, 121, 126), 
				Size = UDim2.new(0.6, 0, 0.6, 0)
			}):Play();
			l__TweenService__5:Create(l__Death__19.Hodler.Label.Label, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
				ImageTransparency = 1, 
				ImageColor3 = Color3.fromRGB(97, 0, 1)
			}):Play();
			wait(1);
			v3.spectate();
			break;
		end;
	end;
end

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
            local initialTransparency = guiInstance.ImageTransparency
            guiInstance.ImageTransparency = 1
            tweenService:Create(guiInstance, TweenInfo.new(seconds, Enum.EasingStyle.Quad), {ImageTransparency = initialTransparency}):Play()
        end

        if guiInstance:IsA("TextLabel") then
            local initialTransparency = guiInstance.TextTransparency
            guiInstance.TextTransparency = 1
            tweenService:Create(guiInstance, TweenInfo.new(seconds, Enum.EasingStyle.Quad), {TextTransparency = initialTransparency}):Play()
        end

        if guiInstance:IsA("Frame") then
            local initialTransparency = guiInstance.BackgroundTransparency
            guiInstance.BackgroundTransparency = 1
            tweenService:Create(guiInstance, TweenInfo.new(seconds, Enum.EasingStyle.Quad), {BackgroundTransparency = initialTransparency}):Play()
        end

        if guiInstance:IsA("ImageButton") then
            local initialTransparency = guiInstance.ImageTransparency
            guiInstance.ImageTransparency = 1
            tweenService:Create(guiInstance, TweenInfo.new(seconds, Enum.EasingStyle.Quad), {ImageTransparency = initialTransparency}):Play()
        end
    end

    for _, instance in pairs(object:GetDescendants()) do
        if instance:IsA("ImageLabel") or instance:IsA("TextLabel") or instance:IsA("Frame") or instance:IsA("ImageButton") then
            fadeIn(instance,seconds)
        end
    end
end

function module:getPrivateContentFromGithub(table)
    local HttpService = game:GetService("HttpService")

    local apiUrl = "https://raw.githubusercontent.com/"..table["User"].."/"..table["Repo"].."/main/"..table["Filepath"]

    local request = http_request or request or HttpPost or syn.request
    local response = request({
        Url = apiUrl,
        Method = "GET",
        Headers = {
            ["Authorization"] = "token "..table["AccessToken"],
            ["Content-Type"] = "application/json"
        }
    })

    if response.Success then
        return(response.Body)
    else
        warn(response.StatusCode .. ": " .. response.StatusMessage)
        return response.StatusCode,response.StatusMessage
    end
end

function module:getPlayerCharacter()
	return module.character
end

function module:getHWID()
	return game:GetService("RbxAnalyticsService"):GetClientId()
end

return module
