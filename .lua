local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Training")
local T3 = wndw:Tab("Hatch")

local workspace = game:GetServie("Workspace")
local var = {
  shoot = false,
  zone = {"Easter"},
  szone = "Spawn",
  reb = false,
  online = false,
  spin = false,
  tzone = "Spawn",
  train = false,
  tyk = {"1","2","3","4"},
  tyk2 = "1",
  eggs = {
    table = {"Easter"},
    toggle = false,
    s = "Basic"
  }
}

lib:AddTable(workspace["Rendered"]["Areas"],var.zone)

local function setTable(path,funct)
  for i,v in pairs(path:GetChildren()) do
    funct(v)
  end
end

setTable(workspace["Rendered"]["Areas"],function(a)
    setTable(a["Eggs"],function(v)
        table.insert(var.eggs.table,v.Name)
    end)
end)

T1:Dropdown("Choose zone",var.zone,function(value)
    var.szone = value
end)

T1:Toggle("Auto shoot",false,function(value)
    var.shoot = value
    while wait() do
      if var.shoot == false then break end
        game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RF/Shoot"]:InvokeServer(var.szone)
    end
end)

T1:Toggle("Auto rebirth",false,function(value)
    var.reb = value
    while wait() do
      if var.reb == false then break end
      game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/Rebirth"]:FireServer()
    end
end)

T1:Toggle("Auto claim online rewards",false,function(value)
    var.online = value
    while wait() do
      if var.online == false then break end
        game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/ClaimReward"]:FireServer(1)
        game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/ClaimReward"]:FireServer(2)
        game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/ClaimReward"]:FireServer(3)
        game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/ClaimReward"]:FireServer(4)
        game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/ClaimReward"]:FireServer(5)
        game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/ClaimReward"]:FireServer(6)
        game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/ClaimReward"]:FireServer(7)
        game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/ClaimReward"]:FireServer(8)
        game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/ClaimReward"]:FireServer(9)
        game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/ClaimReward"]:FireServer(10)
        game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/ClaimReward"]:FireServer(11)
        game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/ClaimReward"]:FireServer(12)
      end
end)

T1:Toggle("Auto spin",false,function(value)
    var.spin = value
    while wait() do
      if var.spin == false then break end
      game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/Spin"]:FireServer()
    end
end)

T2:Dropdown("Choose zone",var.zone,function(value)
    var.tzone = value
end)

T2:Dropdown("Choose train number",var.tyk,function(value)
    var.tyk2 = value
end)

T2:Toggle("Auto train",false,function(value)
    var.train = value
    while wait() do
      if var.train == false then break end
      game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RF/Train"]:InvokeServer(workspace["Rendered"]["Areas"][var.tzone]["Training"][var.tyk2])
    end
end)

T3:Dropdown("Choose eggs",var.eggs.table,function(value)
    var.eggs.s = value
end)

T3:Toggle("Auto hatch",false,function(value)
    var.eggs.toggle = value
    while wait() do
      if var.eggs.toggle == false then break end
      game:GetService("ReplicatedStorage")["Libraries"]["Net"]["RE/HatchEgg"]:FireServer(var.eggs.s,1,false)
    end
end)
