-- ! YOU DO NOT HAVE PERMISSION TO MODIFY THIS !

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local TARGET_GAME = 83907398368798
local JOIN_PLACE = 96168869671905

local function showWrongGame(lobby)
	local function showPrompt(message, buttonText, onClick)
	local old = playerGui:FindFirstChild("moddy")
	if old then
		old:Destroy()
	end

	local FONT = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

	local screen = Instance.new("ScreenGui")
	screen.Name = "moddy"
	screen.ResetOnSpawn = false
	screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screen.DisplayOrder = 2147483000
	screen.Parent = playerGui

	local text = Instance.new("TextLabel")
	text.AnchorPoint = Vector2.new(0.5, 1)
	text.Position = UDim2.new(0.5, 0, 0.5, -10)
	text.Size = UDim2.fromOffset(560, 80)
	text.BackgroundTransparency = 1
	text.BorderSizePixel = 0
	text.FontFace = FONT
	text.Text = message
	text.TextColor3 = Color3.fromRGB(235, 235, 235)
	text.TextSize = 20
	text.TextWrapped = true
	text.TextYAlignment = Enum.TextYAlignment.Bottom
	text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	text.TextStrokeTransparency = 0.3
	text.Parent = screen

	local button = Instance.new("TextButton")
	button.AnchorPoint = Vector2.new(0.5, 0)
	button.Position = UDim2.new(0.5, 0, 0.5, 10)
	button.Size = UDim2.fromOffset(160, 34)
	button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	button.BorderSizePixel = 0
	button.AutoButtonColor = true
	button.FontFace = FONT
	button.Text = buttonText
	button.TextColor3 = Color3.fromRGB(235, 235, 235)
	button.TextSize = 15
	button.Parent = screen

	local prompt = { screen = screen }
	function prompt.set(newMessage, newButtonText, newClick)
		text.Text = newMessage
		button.Text = newButtonText
		onClick = newClick
	end
	function prompt.close()
		screen:Destroy()
	end
	button.MouseButton1Click:Connect(function()
		if onClick then
			onClick(prompt)
		else
			prompt.close()
		end
	end)
	return prompt
	end

	if lobby then
		showPrompt("You have to start a game then you can use the menu.", "Ok", nil)
		return
	end

	local TeleportService = game:GetService("TeleportService")
	local failed = false
	local prompt

	local function fail()
		if failed then
			return
		end
		failed = true
		if prompt.screen.Parent then
			prompt.set("Teleport failed the game is called Rob It! you can only use this menu in that game.", "Ok", nil)
		end
	end

	prompt = showPrompt("You are in the wrong game.", "Join game.", function()
		local ok = pcall(function()
			TeleportService:Teleport(JOIN_PLACE, player)
		end)
		if not ok then
			fail()
		end
	end)

	local connection
	connection = TeleportService.TeleportInitFailed:Connect(function()
		fail()
		if connection then
			connection:Disconnect()
		end
	end)
end

if game.PlaceId == JOIN_PLACE then
	showWrongGame(true)
elseif game.PlaceId ~= TARGET_GAME and game.GameId ~= TARGET_GAME then
	showWrongGame()
else

local THEMES = {
	black = {
		GREEN = Color3.fromRGB(235, 235, 235),
		DARK_GREEN = Color3.fromRGB(170, 170, 170),
		NOTE = Color3.fromRGB(120, 120, 120),
		PANEL = Color3.fromRGB(10, 10, 10),
		IDLE = Color3.fromRGB(30, 30, 30),
		HOVER = Color3.fromRGB(55, 55, 55),
		DARK_TEXT = Color3.fromRGB(12, 12, 12),
		INPUT_TEXT = Color3.fromRGB(250, 250, 250),
	},
	grey = {
		GREEN = Color3.fromRGB(245, 245, 245),
		DARK_GREEN = Color3.fromRGB(200, 200, 200),
		NOTE = Color3.fromRGB(160, 160, 160),
		PANEL = Color3.fromRGB(60, 60, 60),
		IDLE = Color3.fromRGB(85, 85, 85),
		HOVER = Color3.fromRGB(110, 110, 110),
		DARK_TEXT = Color3.fromRGB(35, 35, 35),
		INPUT_TEXT = Color3.fromRGB(252, 252, 252),
	},
	white = {
		GREEN = Color3.fromRGB(25, 25, 25),
		DARK_GREEN = Color3.fromRGB(70, 70, 70),
		NOTE = Color3.fromRGB(110, 110, 110),
		PANEL = Color3.fromRGB(240, 240, 240),
		IDLE = Color3.fromRGB(215, 215, 215),
		HOVER = Color3.fromRGB(190, 190, 190),
		DARK_TEXT = Color3.fromRGB(245, 245, 245),
		INPUT_TEXT = Color3.fromRGB(20, 20, 20),
	},
	ocean = {
		GREEN = Color3.fromRGB(90, 190, 255),
		DARK_GREEN = Color3.fromRGB(50, 130, 200),
		NOTE = Color3.fromRGB(100, 140, 170),
		PANEL = Color3.fromRGB(8, 16, 28),
		IDLE = Color3.fromRGB(18, 34, 56),
		HOVER = Color3.fromRGB(32, 58, 92),
		DARK_TEXT = Color3.fromRGB(6, 14, 26),
		INPUT_TEXT = Color3.fromRGB(235, 246, 255),
	},
	crimson = {
		GREEN = Color3.fromRGB(255, 95, 105),
		DARK_GREEN = Color3.fromRGB(200, 55, 70),
		NOTE = Color3.fromRGB(170, 110, 115),
		PANEL = Color3.fromRGB(26, 8, 10),
		IDLE = Color3.fromRGB(52, 18, 22),
		HOVER = Color3.fromRGB(86, 30, 36),
		DARK_TEXT = Color3.fromRGB(24, 6, 8),
		INPUT_TEXT = Color3.fromRGB(255, 238, 238),
	},
	forest = {
		GREEN = Color3.fromRGB(110, 230, 130),
		DARK_GREEN = Color3.fromRGB(60, 170, 90),
		NOTE = Color3.fromRGB(110, 160, 120),
		PANEL = Color3.fromRGB(8, 22, 12),
		IDLE = Color3.fromRGB(18, 46, 26),
		HOVER = Color3.fromRGB(30, 78, 44),
		DARK_TEXT = Color3.fromRGB(6, 20, 10),
		INPUT_TEXT = Color3.fromRGB(236, 255, 240),
	},
	purple = {
		GREEN = Color3.fromRGB(190, 130, 255),
		DARK_GREEN = Color3.fromRGB(140, 90, 215),
		NOTE = Color3.fromRGB(140, 115, 175),
		PANEL = Color3.fromRGB(16, 10, 28),
		IDLE = Color3.fromRGB(34, 22, 58),
		HOVER = Color3.fromRGB(58, 38, 98),
		DARK_TEXT = Color3.fromRGB(14, 8, 26),
		INPUT_TEXT = Color3.fromRGB(244, 236, 255),
	},
	sunset = {
		GREEN = Color3.fromRGB(255, 160, 80),
		DARK_GREEN = Color3.fromRGB(215, 110, 50),
		NOTE = Color3.fromRGB(175, 135, 110),
		PANEL = Color3.fromRGB(28, 14, 8),
		IDLE = Color3.fromRGB(56, 30, 16),
		HOVER = Color3.fromRGB(92, 50, 26),
		DARK_TEXT = Color3.fromRGB(26, 12, 6),
		INPUT_TEXT = Color3.fromRGB(255, 244, 234),
	},
	rose = {
		GREEN = Color3.fromRGB(255, 140, 200),
		DARK_GREEN = Color3.fromRGB(215, 90, 160),
		NOTE = Color3.fromRGB(175, 120, 150),
		PANEL = Color3.fromRGB(28, 10, 20),
		IDLE = Color3.fromRGB(56, 22, 42),
		HOVER = Color3.fromRGB(92, 38, 70),
		DARK_TEXT = Color3.fromRGB(26, 8, 18),
		INPUT_TEXT = Color3.fromRGB(255, 238, 247),
	},
	mint = {
		GREEN = Color3.fromRGB(100, 235, 205),
		DARK_GREEN = Color3.fromRGB(55, 180, 160),
		NOTE = Color3.fromRGB(110, 165, 155),
		PANEL = Color3.fromRGB(8, 24, 22),
		IDLE = Color3.fromRGB(18, 48, 44),
		HOVER = Color3.fromRGB(30, 80, 74),
		DARK_TEXT = Color3.fromRGB(6, 22, 20),
		INPUT_TEXT = Color3.fromRGB(235, 255, 251),
	},
	lime = {
		GREEN = Color3.fromRGB(170, 255, 70),
		DARK_GREEN = Color3.fromRGB(120, 200, 40),
		NOTE = Color3.fromRGB(130, 160, 90),
		PANEL = Color3.fromRGB(12, 20, 6),
		IDLE = Color3.fromRGB(26, 42, 12),
		HOVER = Color3.fromRGB(44, 70, 20),
		DARK_TEXT = Color3.fromRGB(10, 18, 4),
		INPUT_TEXT = Color3.fromRGB(244, 255, 230),
	},
	cyan = {
		GREEN = Color3.fromRGB(70, 235, 255),
		DARK_GREEN = Color3.fromRGB(40, 170, 200),
		NOTE = Color3.fromRGB(90, 150, 165),
		PANEL = Color3.fromRGB(6, 22, 26),
		IDLE = Color3.fromRGB(14, 44, 52),
		HOVER = Color3.fromRGB(24, 72, 86),
		DARK_TEXT = Color3.fromRGB(4, 20, 24),
		INPUT_TEXT = Color3.fromRGB(230, 252, 255),
	},
	magenta = {
		GREEN = Color3.fromRGB(255, 80, 235),
		DARK_GREEN = Color3.fromRGB(200, 50, 180),
		NOTE = Color3.fromRGB(170, 100, 160),
		PANEL = Color3.fromRGB(26, 6, 24),
		IDLE = Color3.fromRGB(52, 14, 48),
		HOVER = Color3.fromRGB(86, 24, 80),
		DARK_TEXT = Color3.fromRGB(24, 4, 22),
		INPUT_TEXT = Color3.fromRGB(255, 236, 252),
	},
	coffee = {
		GREEN = Color3.fromRGB(225, 185, 140),
		DARK_GREEN = Color3.fromRGB(175, 135, 95),
		NOTE = Color3.fromRGB(150, 125, 100),
		PANEL = Color3.fromRGB(24, 16, 10),
		IDLE = Color3.fromRGB(48, 34, 22),
		HOVER = Color3.fromRGB(78, 56, 38),
		DARK_TEXT = Color3.fromRGB(22, 14, 8),
		INPUT_TEXT = Color3.fromRGB(252, 244, 234),
	},
	slate = {
		GREEN = Color3.fromRGB(170, 190, 215),
		DARK_GREEN = Color3.fromRGB(120, 140, 170),
		NOTE = Color3.fromRGB(120, 135, 155),
		PANEL = Color3.fromRGB(18, 22, 30),
		IDLE = Color3.fromRGB(34, 42, 56),
		HOVER = Color3.fromRGB(54, 66, 88),
		DARK_TEXT = Color3.fromRGB(16, 20, 28),
		INPUT_TEXT = Color3.fromRGB(240, 244, 250),
	},
	sky = {
		GREEN = Color3.fromRGB(20, 60, 110),
		DARK_GREEN = Color3.fromRGB(40, 95, 160),
		NOTE = Color3.fromRGB(100, 130, 165),
		PANEL = Color3.fromRGB(226, 238, 252),
		IDLE = Color3.fromRGB(200, 220, 245),
		HOVER = Color3.fromRGB(170, 198, 236),
		DARK_TEXT = Color3.fromRGB(236, 244, 255),
		INPUT_TEXT = Color3.fromRGB(14, 40, 80),
	},
	peach = {
		GREEN = Color3.fromRGB(110, 50, 20),
		DARK_GREEN = Color3.fromRGB(160, 85, 40),
		NOTE = Color3.fromRGB(160, 120, 95),
		PANEL = Color3.fromRGB(252, 238, 226),
		IDLE = Color3.fromRGB(246, 218, 196),
		HOVER = Color3.fromRGB(238, 196, 166),
		DARK_TEXT = Color3.fromRGB(255, 244, 234),
		INPUT_TEXT = Color3.fromRGB(80, 34, 12),
	},
	lavender = {
		GREEN = Color3.fromRGB(70, 40, 120),
		DARK_GREEN = Color3.fromRGB(110, 75, 170),
		NOTE = Color3.fromRGB(140, 120, 170),
		PANEL = Color3.fromRGB(240, 232, 252),
		IDLE = Color3.fromRGB(224, 210, 246),
		HOVER = Color3.fromRGB(204, 186, 238),
		DARK_TEXT = Color3.fromRGB(248, 242, 255),
		INPUT_TEXT = Color3.fromRGB(52, 26, 92),
	},
	gold = {
		GREEN = Color3.fromRGB(255, 215, 90),
		DARK_GREEN = Color3.fromRGB(205, 165, 50),
		NOTE = Color3.fromRGB(170, 150, 100),
		PANEL = Color3.fromRGB(26, 20, 6),
		IDLE = Color3.fromRGB(52, 42, 14),
		HOVER = Color3.fromRGB(86, 70, 24),
		DARK_TEXT = Color3.fromRGB(24, 18, 4),
		INPUT_TEXT = Color3.fromRGB(255, 250, 230),
	},
}

local THEME_ORDER = { "black", "grey", "white", "ocean", "crimson", "forest", "purple", "sunset", "rose", "mint", "gold", "lime", "cyan", "magenta", "coffee", "slate", "sky", "peach", "lavender" }

do
	local function hsv(h, sat, val)
		return Color3.fromHSV(h % 1, sat, val)
	end
	local generated = {}
	local darkHues = {
		ruby = 0.99, tangerine = 0.07, amber = 0.12, citrus = 0.17, chartreuse = 0.26, emerald = 0.38,
		teal = 0.47, azure = 0.56, cobalt = 0.62, indigo = 0.69, violet = 0.76, fuchsia = 0.84, bubblegum = 0.92,
	}
	for name, hue in pairs(darkHues) do
		THEMES[name] = {
			GREEN = hsv(hue, 0.55, 1),
			DARK_GREEN = hsv(hue, 0.7, 0.8),
			NOTE = hsv(hue, 0.35, 0.65),
			PANEL = hsv(hue, 0.6, 0.1),
			IDLE = hsv(hue, 0.55, 0.2),
			HOVER = hsv(hue, 0.5, 0.33),
			DARK_TEXT = hsv(hue, 0.7, 0.08),
			INPUT_TEXT = hsv(hue, 0.08, 1),
		}
		table.insert(generated, name)
	end
	local lightHues = { blush = 0.96, buttercream = 0.13, jade = 0.4, ice = 0.55, lilac = 0.75 }
	for name, hue in pairs(lightHues) do
		THEMES[name] = {
			GREEN = hsv(hue, 0.8, 0.35),
			DARK_GREEN = hsv(hue, 0.7, 0.55),
			NOTE = hsv(hue, 0.4, 0.6),
			PANEL = hsv(hue, 0.12, 0.98),
			IDLE = hsv(hue, 0.2, 0.92),
			HOVER = hsv(hue, 0.3, 0.84),
			DARK_TEXT = hsv(hue, 0.06, 1),
			INPUT_TEXT = hsv(hue, 0.8, 0.25),
		}
		table.insert(generated, name)
	end
	table.sort(generated)
	for _, name in ipairs(generated) do
		table.insert(THEME_ORDER, name)
	end
end

do
	local function hsv(h, sat, val)
		return Color3.fromHSV(h % 1, math.clamp(sat, 0, 1), val)
	end
	local more = {}
	local darkList = {
		ember = { 0.02, 0.9 }, rust = { 0.04, 0.8 }, copper = { 0.06, 0.7 }, honey = { 0.1, 0.8 }, lemon = { 0.16, 0.7 },
		pear = { 0.2, 0.7 }, fern = { 0.3, 0.6 }, moss = { 0.28, 0.5 }, spring = { 0.34, 0.7 }, seafoam = { 0.43, 0.5 },
		aqua = { 0.5, 0.8 }, turquoise = { 0.48, 0.9 }, glacier = { 0.53, 0.35 }, denim = { 0.6, 0.6 }, sapphire = { 0.63, 0.9 },
		royal = { 0.66, 0.8 }, iris = { 0.7, 0.6 }, amethyst = { 0.74, 0.7 }, orchid = { 0.8, 0.6 }, plum = { 0.85, 0.5 },
		wine = { 0.95, 0.7 }, berry = { 0.9, 0.9 }, coral = { 0.01, 0.55 }, salmon = { 0.03, 0.4 }, charcoal = { 0, 0 },
		onyx = { 0.6, 0.08 }, graphite = { 0.55, 0.15 }, ash = { 0.1, 0.1 },
	}
	for name, info in pairs(darkList) do
		local hue, sat = info[1], info[2]
		THEMES[name] = {
			GREEN = hsv(hue, 0.15 + 0.5 * sat, 1),
			DARK_GREEN = hsv(hue, 0.2 + 0.6 * sat, 0.8),
			NOTE = hsv(hue, 0.1 + 0.3 * sat, 0.65),
			PANEL = hsv(hue, 0.2 + 0.5 * sat, 0.1),
			IDLE = hsv(hue, 0.2 + 0.4 * sat, 0.2),
			HOVER = hsv(hue, 0.2 + 0.35 * sat, 0.33),
			DARK_TEXT = hsv(hue, 0.5, 0.08),
			INPUT_TEXT = hsv(hue, 0.05, 1),
		}
		table.insert(more, name)
	end
	local lightList = {
		cream = { 0.12, 0.35 }, sand = { 0.1, 0.4 }, linen = { 0.08, 0.2 }, sage = { 0.3, 0.4 }, mist = { 0.5, 0.3 },
		frost = { 0.58, 0.35 }, periwinkle = { 0.67, 0.5 }, wisteria = { 0.76, 0.45 }, petal = { 0.93, 0.4 },
		apricot = { 0.07, 0.6 }, pearl = { 0, 0 }, lemonade = { 0.16, 0.5 },
	}
	for name, info in pairs(lightList) do
		local hue, sat = info[1], info[2]
		THEMES[name] = {
			GREEN = hsv(hue, 0.3 + 0.5 * sat, 0.35),
			DARK_GREEN = hsv(hue, 0.25 + 0.45 * sat, 0.55),
			NOTE = hsv(hue, 0.15 + 0.3 * sat, 0.6),
			PANEL = hsv(hue, 0.04 + 0.1 * sat, 0.98),
			IDLE = hsv(hue, 0.06 + 0.16 * sat, 0.92),
			HOVER = hsv(hue, 0.1 + 0.25 * sat, 0.84),
			DARK_TEXT = hsv(hue, 0.03, 1),
			INPUT_TEXT = hsv(hue, 0.3 + 0.5 * sat, 0.25),
		}
		table.insert(more, name)
	end
	table.sort(more)
	for _, name in ipairs(more) do
		table.insert(THEME_ORDER, name)
	end
end

do
	local function hsv(h, sat, val)
		return Color3.fromHSV(h % 1, math.clamp(sat, 0, 1), val)
	end
	local names = {}
	local duo = {
		cyberpunk = { 0.88, 0.66 }, matrix = { 0.36, 0.36 }, vaporwave = { 0.5, 0.82 }, halloween = { 0.08, 0.76 },
		christmas = { 0.0, 0.38 }, toxic = { 0.24, 0.8 }, ["blood moon"] = { 0.0, 0.98 }, midnight = { 0.62, 0.68 },
		synthwave = { 0.9, 0.72 }, ["deep sea"] = { 0.48, 0.62 }, lava = { 0.07, 0.0 }, bumblebee = { 0.15, 0.13 },
		["outer space"] = { 0.75, 0.65 }, jungle = { 0.2, 0.42 }, candy = { 0.92, 0.55 }, sunrise = { 0.1, 0.95 },
		arctic = { 0.53, 0.6 }, royalty = { 0.13, 0.75 }, ["miami"] = { 0.48, 0.9 }, galaxy = { 0.8, 0.68 },
		dragon = { 0.03, 0.4 }, mermaid = { 0.46, 0.8 }, ["retro"] = { 0.12, 0.55 }, storm = { 0.58, 0.63 },
		["cherry cola"] = { 0.97, 0.03 }, ["mint chip"] = { 0.42, 0.08 }, ["grape soda"] = { 0.78, 0.7 }, hacker = { 0.33, 0.5 },
		["fire and ice"] = { 0.05, 0.6 }, ["ice and fire"] = { 0.55, 0.03 }, ["pumpkin"] = { 0.07, 0.1 }, ["peacock"] = { 0.45, 0.68 },
	}
	for name, info in pairs(duo) do
		local accent, base = info[1], info[2]
		THEMES[name] = {
			GREEN = hsv(accent, 0.6, 1),
			DARK_GREEN = hsv(accent, 0.75, 0.78),
			NOTE = hsv(base, 0.3, 0.62),
			PANEL = hsv(base, 0.6, 0.09),
			IDLE = hsv(base, 0.55, 0.19),
			HOVER = hsv(base, 0.5, 0.32),
			DARK_TEXT = hsv(base, 0.7, 0.07),
			INPUT_TEXT = hsv(accent, 0.1, 1),
		}
		table.insert(names, name)
	end
	local neon = { red = 0.0, orange = 0.07, yellow = 0.15, lime = 0.25, green = 0.36, aqua = 0.48, blue = 0.6, purple = 0.75, pink = 0.88, rose = 0.95 }
	for name, hue in pairs(neon) do
		local full = "neon " .. name
		THEMES[full] = {
			GREEN = hsv(hue, 0.85, 1),
			DARK_GREEN = hsv(hue, 0.9, 0.7),
			NOTE = hsv(hue, 0.25, 0.5),
			PANEL = Color3.fromRGB(4, 4, 6),
			IDLE = Color3.fromRGB(18, 18, 22),
			HOVER = Color3.fromRGB(40, 40, 48),
			DARK_TEXT = Color3.fromRGB(8, 8, 10),
			INPUT_TEXT = hsv(hue, 0.15, 1),
		}
		table.insert(names, full)
		local soft = "pastel " .. name
		THEMES[soft] = {
			GREEN = hsv(hue, 0.55, 0.45),
			DARK_GREEN = hsv(hue, 0.45, 0.62),
			NOTE = hsv(hue, 0.25, 0.6),
			PANEL = hsv(hue, 0.14, 0.99),
			IDLE = hsv(hue, 0.22, 0.94),
			HOVER = hsv(hue, 0.3, 0.86),
			DARK_TEXT = hsv(hue, 0.05, 1),
			INPUT_TEXT = hsv(hue, 0.6, 0.28),
		}
		table.insert(names, soft)
		local deep = "deep " .. name
		THEMES[deep] = {
			GREEN = hsv(hue, 0.4, 0.95),
			DARK_GREEN = hsv(hue, 0.5, 0.72),
			NOTE = hsv(hue, 0.3, 0.55),
			PANEL = hsv(hue, 0.8, 0.14),
			IDLE = hsv(hue, 0.75, 0.25),
			HOVER = hsv(hue, 0.7, 0.38),
			DARK_TEXT = hsv(hue, 0.8, 0.09),
			INPUT_TEXT = hsv(hue, 0.06, 1),
		}
		table.insert(names, deep)
	end
	table.sort(names)
	for _, name in ipairs(names) do
		table.insert(THEME_ORDER, name)
	end
end

local themeGradients = {}
local accentGradients = {}
local cleanups = {}

local GREEN = THEMES.black.GREEN
local DARK_GREEN = THEMES.black.DARK_GREEN
local NOTE = THEMES.black.NOTE
local INPUT_TEXT = THEMES.black.INPUT_TEXT
local BLACK = Color3.fromRGB(0, 0, 0)
local WHITE = Color3.fromRGB(255, 255, 255)

local fontLoaded, silkscreen = pcall(function()
	return Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
end)

local function lowerText(text)
	if text:find("<", 1, true) then
		return text
	end
	return text:lower()
end

local function autoLower(object, property)
	local function fix()
		local current = object[property]
		local fixed = lowerText(current)
		if fixed ~= current then
			object[property] = fixed
		end
	end
	fix()
	object:GetPropertyChangedSignal(property):Connect(fix)
end

local function applyFont(object, keepText)
	if not keepText then
		if object:IsA("TextBox") then
			autoLower(object, "PlaceholderText")
		else
			autoLower(object, "Text")
		end
	end
	if fontLoaded and silkscreen then
		object.FontFace = silkscreen
	else
		object.Font = Enum.Font.Code
	end
end

local function waitPath(root, ...)
	local current = root
	for _, name in ipairs({ ... }) do
		current = current:WaitForChild(name, 3)
		if not current then
			return nil
		end
	end
	return current
end

local oldGui = playerGui:FindFirstChild("moddy")
if oldGui then
	oldGui:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "moddy"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 2147483000
gui.Parent = playerGui

local PANEL = THEMES.black.PANEL
local IDLE = THEMES.black.IDLE
local HOVER = THEMES.black.HOVER
local DARK_TEXT = THEMES.black.DARK_TEXT
local RED = Color3.fromRGB(255, 90, 90)

local WINDOW_WIDTH = 824
local WINDOW_HEIGHT = 390
local STAGE_HEIGHT = 0
local HEADER_HEIGHT = 32
local FOOTER_HEIGHT = 28
local TAB_WIDTH = 144
local TAB_BAR = 0

local TWEEN_FAST = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function addCorner()
	return nil
end

local function addStroke(object, color, transparency, thickness)
	local stroke = Instance.new("UIStroke")
	stroke.Color = color
	stroke.Transparency = transparency
	stroke.Thickness = thickness
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.Parent = object
	return stroke
end

local bracketTargets = {}
local BRACKET_GAP = 8

local function addBrackets(target)
	local holder = Instance.new("Frame")
	holder.BackgroundTransparency = 1
	holder.BorderSizePixel = 0
	holder.Visible = false
	holder.Parent = gui
	local shadow = Instance.new("Frame")
	shadow.BackgroundColor3 = BLACK
	shadow.BackgroundTransparency = 0.55
	shadow.BorderSizePixel = 0
	shadow.ZIndex = 0
	shadow.Visible = false
	shadow.Parent = gui
	local sides = { left = {}, right = {} }
	for _, corner in ipairs({ { 0, 0 }, { 1, 0 }, { 0, 1 }, { 1, 1 } }) do
		for _, size in ipairs({ UDim2.fromOffset(18, 2), UDim2.fromOffset(2, 18) }) do
			local bar = Instance.new("Frame")
			bar.AnchorPoint = Vector2.new(corner[1], corner[2])
			bar.Position = UDim2.fromScale(corner[1], corner[2])
			bar.Size = size
			bar.BackgroundColor3 = GREEN
			bar.BackgroundTransparency = 1
			bar.BorderSizePixel = 0
			bar.Parent = holder
			table.insert(corner[1] == 0 and sides.left or sides.right, bar)
		end
	end
	table.insert(bracketTargets, { target = target, holder = holder, shadow = shadow, sides = sides, hidden = { left = false, right = false } })
end

local function updateBrackets()
	local shown = {}
	for index = #bracketTargets, 1, -1 do
		local entry = bracketTargets[index]
		if not entry.target.Parent then
			entry.holder:Destroy()
			entry.shadow:Destroy()
			table.remove(bracketTargets, index)
		else
			local show = entry.target.Visible and gui.Enabled
			if entry.holder.Visible ~= show then
				entry.holder.Visible = show
				entry.shadow.Visible = false
			end
			if show then
				local target = entry.target
				local position = target.AbsolutePosition
				local size = target.AbsoluteSize
				if target.Position.X.Scale == 0 and target.Position.Y.Scale == 0 then
					position = Vector2.new(target.Position.X.Offset, target.Position.Y.Offset)
				end
				if target.Size.X.Scale == 0 and target.Size.Y.Scale == 0 then
					size = Vector2.new(target.Size.X.Offset, target.Size.Y.Offset)
				end
				entry.holder.Position = UDim2.fromOffset(position.X - BRACKET_GAP, position.Y - BRACKET_GAP)
				entry.holder.Size = UDim2.fromOffset(size.X + BRACKET_GAP * 2, size.Y + BRACKET_GAP * 2)
				entry.shadow.Position = UDim2.fromOffset(position.X + 7, position.Y + 8)
				entry.shadow.Size = UDim2.fromOffset(size.X, size.Y)
				entry.x, entry.y, entry.w, entry.h = position.X, position.Y, size.X, size.Y
				entry.wantLeft, entry.wantRight = false, false
				table.insert(shown, entry)
			end
		end
	end
	for _, first in ipairs(shown) do
		for _, second in ipairs(shown) do
			if first ~= second and math.abs((first.x + first.w) - second.x) < 30 and first.y < second.y + second.h and second.y < first.y + first.h then
				first.wantRight = true
				second.wantLeft = true
			end
		end
	end
	for _, entry in ipairs(bracketTargets) do
		for side, bars in pairs(entry.sides) do
			local hide
			if side == "left" then
				hide = entry.wantLeft and true or false
			else
				hide = entry.wantRight and true or false
			end
			if entry.hidden[side] ~= hide then
				entry.hidden[side] = hide
				for _, bar in ipairs(bars) do
					bar.Visible = not hide
				end
			end
		end
	end
end


local function addAccent(stroke)
	local gradient = Instance.new("UIGradient")
	gradient.Rotation = 45
	gradient.Color = ColorSequence.new(GREEN, DARK_GREEN)
	table.insert(accentGradients, gradient)
	gradient.Parent = stroke
	return stroke
end

local window = Instance.new("ImageLabel")
window.BackgroundColor3 = PANEL
window.BackgroundTransparency = 1
window.BorderSizePixel = 0
window.Position = UDim2.new(0.364466995, 0, 0.388888896, 0)
window.Size = UDim2.fromOffset(WINDOW_WIDTH, WINDOW_HEIGHT)
window.ClipsDescendants = true
window.Active = true
window.Draggable = true
window.Parent = gui
addStroke(window, GREEN, 0, 1)
addBrackets(window)

do
	local openScale = Instance.new("UIScale")
	openScale.Scale = 0.92
	openScale.Parent = window
	TweenService:Create(openScale, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
end

local buttonTweens = setmetatable({}, { __mode = "k" })

local function setButtonActive(button, active)
	button:SetAttribute("Active", active)
	local previous = buttonTweens[button]
	if previous then
		previous:Cancel()
	end
	local tween = TweenService:Create(button, TWEEN_FAST, {
		BackgroundColor3 = active and GREEN or IDLE,
		TextColor3 = active and DARK_TEXT or GREEN,
	})
	buttonTweens[button] = tween
	tween:Play()
end

do
	local clickSound = Instance.new("Sound")
	clickSound.Name = "ClickSound"
	clickSound.SoundId = "rbxassetid://96949444184991"
	clickSound.Volume = 1
	clickSound.Parent = gui
end

local function makeButton(parent, text, x, y, width)
	if parent.Name == "Card" then
		x = 12 + (x - 12) * 1.22
		width = (width or 160) * 1.225
	end
	local button = Instance.new("TextButton")
	button.BackgroundColor3 = IDLE
	button.BackgroundTransparency = 0.1
	button.BorderSizePixel = 0
	button.AutoButtonColor = false
	button.Position = UDim2.fromOffset(x, y)
	button.Size = UDim2.fromOffset(width or 160, 28)
	button.Text = text
	button.TextColor3 = GREEN
	button.TextScaled = true
	button.TextWrapped = true
	button.ZIndex = 3
	if (width or 160) >= 80 then
		button.TextXAlignment = Enum.TextXAlignment.Left
	end
	applyFont(button)
	button:SetAttribute("Active", false)

	local strip = Instance.new("Frame")
	strip.Name = "Strip"
	strip.BackgroundColor3 = GREEN
	strip.BorderSizePixel = 0
	strip.Position = UDim2.new(0, -12, 0, -6)
	strip.Size = UDim2.new(0, 3, 1, 12)
	strip.ZIndex = 4
	strip.Parent = button

	if (width or 160) >= 80 and parent.Name ~= "Tabs" then
		local tag = Instance.new("TextLabel")
		tag.Name = "Tag"
		tag.BackgroundTransparency = 1
		tag.BorderSizePixel = 0
		tag.AnchorPoint = Vector2.new(1, 0)
		tag.Position = UDim2.new(1, 0, 0, 0)
		tag.Size = UDim2.new(0, 24, 1, 0)
		tag.Text = "on"
		tag.TextColor3 = DARK_TEXT
		tag.TextSize = 11
		tag.TextXAlignment = Enum.TextXAlignment.Right
		tag.ZIndex = 4
		tag.Visible = false
		applyFont(tag)
		tag.Parent = button
		button:GetAttributeChangedSignal("Active"):Connect(function()
			tag.Visible = button:GetAttribute("Active") == true
		end)
	end

	local depth = Instance.new("UIGradient")
	depth.Rotation = 90
	depth.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(205, 205, 205))
	depth.Parent = button

	local flash = Instance.new("Frame")
	flash.Name = "Flash"
	flash.BackgroundColor3 = GREEN
	flash.BackgroundTransparency = 1
	flash.BorderSizePixel = 0
	flash.Position = UDim2.new(0, -12, 0, -6)
	flash.Size = UDim2.new(0, 0, 1, 12)
	flash.ZIndex = 3
	flash.Parent = button
	button.MouseButton1Click:Connect(function()
		local clickSound = gui:FindFirstChild("ClickSound")
		if clickSound then
			clickSound.TimePosition = 0
			clickSound:Play()
		end
		flash.Size = UDim2.new(0, 0, 1, 12)
		flash.BackgroundTransparency = 0.7
		TweenService:Create(flash, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(1, 24, 1, 12),
			BackgroundTransparency = 1,
		}):Play()
	end)

	local padding = Instance.new("UIPadding")
	padding.PaddingLeft = UDim.new(0, 12)
	padding.PaddingRight = UDim.new(0, 8)
	padding.PaddingTop = UDim.new(0, 6)
	padding.PaddingBottom = UDim.new(0, 6)
	padding.Parent = button

	local limit = Instance.new("UITextSizeConstraint")
	limit.MaxTextSize = 13
	limit.Parent = button

	addCorner(button, 14)
	local buttonStroke = addStroke(button, GREEN, 1, 1)

	button.MouseEnter:Connect(function()
		if not button:GetAttribute("Active") then
			TweenService:Create(button, TWEEN_FAST, { BackgroundColor3 = HOVER }):Play()
		end
	end)
	button.MouseLeave:Connect(function()
		if not button:GetAttribute("Active") then
			TweenService:Create(button, TWEEN_FAST, { BackgroundColor3 = IDLE }):Play()
		end
	end)

	button.MouseEnter:Connect(function()
		TweenService:Create(buttonStroke, TWEEN_FAST, { Transparency = 0.25 }):Play()
		TweenService:Create(strip, TWEEN_FAST, { Size = UDim2.new(0, 6, 1, 12) }):Play()
	end)
	button.MouseLeave:Connect(function()
		TweenService:Create(buttonStroke, TWEEN_FAST, { Transparency = gui:GetAttribute("StrokeRest") or 1 }):Play()
		TweenService:Create(strip, TWEEN_FAST, { Size = UDim2.new(0, 3, 1, 12) }):Play()
	end)

	local press = Instance.new("UIScale")
	press.Parent = button
	local function release()
		TweenService:Create(press, TweenInfo.new(0.14, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
	end
	button.MouseButton1Down:Connect(function()
		TweenService:Create(press, TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0.94 }):Play()
	end)
	button.MouseButton1Up:Connect(release)
	button.MouseLeave:Connect(release)

	button:SetAttribute("Wide", (width or 160) >= 80)
	do
		local rest = gui:GetAttribute("StrokeRest")
		if rest then
			local stripSide = gui:GetAttribute("ButtonStrip")
			strip.Visible = stripSide ~= "none"
			if stripSide == "right" then
				strip.AnchorPoint = Vector2.new(1, 0)
				strip.Position = UDim2.new(1, 8, 0, -6)
			end
			buttonStroke.Transparency = rest
			buttonStroke.Thickness = gui:GetAttribute("ButtonThick") or 1
			button.BackgroundTransparency = gui:GetAttribute("ButtonBg") or 0
			if (width or 160) >= 80 then
				local align = gui:GetAttribute("ButtonAlign")
				button.TextXAlignment = align == "center" and Enum.TextXAlignment.Center or (align == "right" and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left)
				local tag = button:FindFirstChild("Tag")
				if tag and align == "right" then
					tag.AnchorPoint = Vector2.new(0, 0)
					tag.Position = UDim2.new(0, 0, 0, 0)
					tag.TextXAlignment = Enum.TextXAlignment.Left
				end
			end
		end
	end
	button:GetAttributeChangedSignal("Active"):Connect(function()
		button.BackgroundTransparency = button:GetAttribute("Active") and 0 or (gui:GetAttribute("ButtonBg") or 0)
	end)

	button.Parent = parent
	return button
end

local function makeHeading(parent, text)
	local label = Instance.new("TextLabel")
	label.BackgroundTransparency = 1
	label.BorderSizePixel = 0
	label.Position = UDim2.fromOffset(24, 8)
	label.Size = UDim2.fromOffset(300, 22)
	label.Text = text
	label.TextColor3 = GREEN
	label.TextSize = 18
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.ZIndex = 3
	applyFont(label)
	label.Parent = parent

	local line = Instance.new("Frame")
	line.BackgroundColor3 = GREEN
	line.BorderSizePixel = 0
	line.Position = UDim2.fromOffset(12, 10)
	line.Size = UDim2.fromOffset(4, 36)
	line.ZIndex = 3
	line.Parent = parent
	addCorner(line, 2)
	return label
end

local function makeBox(parent, placeholder, x, y, width)
	if parent.Name == "Card" then
		width = width * 1.2
	end
	local box = Instance.new("TextBox")
	box.BackgroundColor3 = IDLE
	box.BackgroundTransparency = 0.1
	box.BorderSizePixel = 0
	box.Position = UDim2.fromOffset(x, y)
	box.Size = UDim2.fromOffset(width, 28)
	box.Text = ""
	box.PlaceholderText = placeholder
	box.PlaceholderColor3 = DARK_GREEN
	box.TextColor3 = INPUT_TEXT
	box.TextScaled = true
	box.ClearTextOnFocus = false
	box.ZIndex = 3
	applyFont(box)

	local padding = Instance.new("UIPadding")
	padding.PaddingLeft = UDim.new(0, 8)
	padding.PaddingRight = UDim.new(0, 8)
	padding.PaddingTop = UDim.new(0, 6)
	padding.PaddingBottom = UDim.new(0, 6)
	padding.Parent = box

	local limit = Instance.new("UITextSizeConstraint")
	limit.MaxTextSize = 13
	limit.Parent = box

	addCorner(box, 14)
	local stroke = addStroke(box, GREEN, 0.55, 1)
	box.Focused:Connect(function()
		stroke.Transparency = 0.1
	end)
	box.FocusLost:Connect(function()
		stroke.Transparency = 0.55
	end)

	box.Parent = parent
	return box
end

local header = Instance.new("Frame")
header.BackgroundColor3 = WHITE
header.BackgroundTransparency = 0.2
header.BorderSizePixel = 0
header.Size = UDim2.new(1, 0, 0, HEADER_HEIGHT)
header.ZIndex = 2
header.Parent = window

do
	local headerGradient = Instance.new("UIGradient")
	headerGradient.Color = ColorSequence.new(PANEL, HOVER)
	table.insert(themeGradients, headerGradient)
	headerGradient.Parent = header

	local statusDot = Instance.new("Frame")
	statusDot.BackgroundColor3 = GREEN
	statusDot.BorderSizePixel = 0
	statusDot.Position = UDim2.fromOffset(0, 0)
	statusDot.Size = UDim2.new(0, 6, 1, 0)
	statusDot.ZIndex = 3
	statusDot.Name = "Accent"
	statusDot.Parent = header
	addCorner(statusDot, 2)

	local headerLine = Instance.new("Frame")
	headerLine.BackgroundColor3 = GREEN
	headerLine.BackgroundTransparency = 0
	headerLine.BorderSizePixel = 0
	headerLine.Position = UDim2.new(0, 0, 1, -2)
	headerLine.Size = UDim2.new(1, 0, 0, 2)
	headerLine.ZIndex = 3
	headerLine.Parent = header
	local lineFade = Instance.new("UIGradient")
	lineFade.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.1),
		NumberSequenceKeypoint.new(0.6, 0.7),
		NumberSequenceKeypoint.new(1, 1),
	})
	lineFade.Enabled = false
	lineFade.Parent = headerLine

	local title = Instance.new("TextLabel")
	title.BackgroundTransparency = 1
	title.BorderSizePixel = 0
	title.Position = UDim2.fromOffset(18, 0)
	title.Size = UDim2.fromOffset(TAB_WIDTH - 18, HEADER_HEIGHT)
	title.Text = "MOD MENU"
	title.TextColor3 = GREEN
	title.TextSize = 18
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.ZIndex = 3
	applyFont(title)
	title.Name = "Title"
	title.Parent = header

	local fpsLabel = Instance.new("TextLabel")
	fpsLabel.BackgroundTransparency = 1
	fpsLabel.BorderSizePixel = 0
	fpsLabel.Position = UDim2.new(1, -172, 0, 0)
	fpsLabel.Size = UDim2.fromOffset(78, HEADER_HEIGHT)
	fpsLabel.Text = ""
	fpsLabel.TextColor3 = NOTE
	fpsLabel.TextSize = 11
	fpsLabel.TextXAlignment = Enum.TextXAlignment.Right
	fpsLabel.ZIndex = 3
	applyFont(fpsLabel)
	fpsLabel.Name = "Fps"
	fpsLabel.Parent = header

	local clockLabel = Instance.new("TextLabel")
	clockLabel.BackgroundTransparency = 1
	clockLabel.BorderSizePixel = 0
	clockLabel.Position = UDim2.new(1, -256, 0, 0)
	clockLabel.Size = UDim2.fromOffset(110, HEADER_HEIGHT)
	clockLabel.Text = ""
	clockLabel.TextColor3 = NOTE
	clockLabel.TextSize = 12
	clockLabel.TextXAlignment = Enum.TextXAlignment.Right
	clockLabel.ZIndex = 3
	applyFont(clockLabel)
	clockLabel.Name = "Clock"
	clockLabel.Parent = header
	task.spawn(function()
		while clockLabel.Parent do
			clockLabel.Text = os.date("%I:%M:%S %p")
			task.wait(1)
		end
	end)

	local frames = 0
	local elapsed = 0
	local fpsConnection = RunService.Heartbeat:Connect(function(dt)
		frames = frames + 1
		elapsed = elapsed + dt
		if elapsed >= 0.5 then
			fpsLabel.Text = math.floor(frames / elapsed + 0.5) .. " fps"
			frames = 0
			elapsed = 0
		end
	end)
	table.insert(cleanups, function()
		fpsConnection:Disconnect()
	end)
end

local tabColumn = Instance.new("Frame")
tabColumn.BackgroundColor3 = PANEL
tabColumn.BackgroundTransparency = 0.1
tabColumn.BorderSizePixel = 0
tabColumn.Position = UDim2.fromOffset(0, HEADER_HEIGHT)
tabColumn.Size = UDim2.new(0, TAB_WIDTH, 1, -(HEADER_HEIGHT + FOOTER_HEIGHT))
tabColumn.ZIndex = 2
tabColumn.Name = "Tabs"
tabColumn.Parent = window

do
	local tabDivider = Instance.new("Frame")
	tabDivider.BackgroundColor3 = GREEN
	tabDivider.BackgroundTransparency = 0.7
	tabDivider.BorderSizePixel = 0
	tabDivider.Position = UDim2.new(1, -1, 0, 0)
	tabDivider.Size = UDim2.new(0, 1, 1, 0)
	tabDivider.ZIndex = 3
	tabDivider.Name = "Divider"
	tabDivider.Parent = tabColumn
end

local footer = Instance.new("Frame")
footer.BackgroundColor3 = PANEL
footer.BackgroundTransparency = 0.3
footer.BorderSizePixel = 0
footer.Position = UDim2.new(0, 0, 1, -FOOTER_HEIGHT)
footer.Size = UDim2.new(1, 0, 0, FOOTER_HEIGHT)
footer.ZIndex = 2
footer.Parent = window

do
	local footerLine = Instance.new("Frame")
	footerLine.BackgroundColor3 = GREEN
	footerLine.BackgroundTransparency = 0.7
	footerLine.BorderSizePixel = 0
	footerLine.Size = UDim2.new(1, 0, 0, 1)
	footerLine.ZIndex = 3
	footerLine.Parent = footer
end

local statusLabel = Instance.new("TextLabel")
statusLabel.BackgroundTransparency = 1
statusLabel.BorderSizePixel = 0
statusLabel.Position = UDim2.new(1, -372, 0, 0)
statusLabel.Size = UDim2.new(0, 360, 1, 0)
statusLabel.Text = "active: none"
statusLabel.TextColor3 = DARK_GREEN
statusLabel.TextSize = 12
statusLabel.TextXAlignment = Enum.TextXAlignment.Right
statusLabel.TextTruncate = Enum.TextTruncate.AtEnd
statusLabel.ZIndex = 3
applyFont(statusLabel)
statusLabel.Parent = footer

local function makePage(canvasHeight)
	local page = Instance.new(canvasHeight and "ScrollingFrame" or "Frame")
	if canvasHeight then
		page.CanvasSize = UDim2.fromOffset(0, canvasHeight)
		page.ScrollBarThickness = 4
		page.ScrollBarImageColor3 = GREEN
		page.ScrollingDirection = Enum.ScrollingDirection.Y
	end
	page.BackgroundTransparency = 1
	page.BorderSizePixel = 0
	page.Position = UDim2.fromOffset(TAB_WIDTH, HEADER_HEIGHT + TAB_BAR)
	page.Size = UDim2.new(1, -TAB_WIDTH, 1, -(HEADER_HEIGHT + TAB_BAR + FOOTER_HEIGHT + STAGE_HEIGHT))
	page.ZIndex = 2
	page.Visible = false
	page.Parent = window
	return page
end

local pages = {}
local tabButtons = {}

local function makeNote(parent, text, x, y)
	local label = Instance.new("TextLabel")
	label.BackgroundTransparency = 1
	label.BorderSizePixel = 0
	label.Position = UDim2.fromOffset(x, y)
	label.Size = UDim2.fromOffset(400, 16)
	label.Text = text
	label.TextColor3 = NOTE
	label.TextSize = 12
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.ZIndex = 3
	applyFont(label)
	label.Parent = parent
	return label
end

local function makeCard(page, height)
	local card = Instance.new("Frame")
	card.BackgroundColor3 = IDLE
	card.BackgroundTransparency = 1
	card.BorderSizePixel = 0
	card.Position = UDim2.fromOffset(12, 58)
	card.Name = "Card"
	card.Size = UDim2.new(1, -24, 0, height)
	card.ZIndex = 2
	card.Parent = page
	addCorner(card, 16)
	addStroke(card, GREEN, 1, 1)
	local edge = Instance.new("Frame")
	edge.BackgroundColor3 = GREEN
	edge.BorderSizePixel = 0
	edge.BackgroundTransparency = 0.6
	edge.Visible = false
	edge.Name = "Edge"
	edge.Position = UDim2.fromOffset(0, 0)
	edge.Size = UDim2.new(1, 0, 0, 1)
	edge.ZIndex = 3
	edge.Parent = card
	addCorner(edge, 2)
	local sheen = Instance.new("UIGradient")
	sheen.Rotation = 90
	sheen.Transparency = NumberSequence.new(0, 0.45)
	sheen.Parent = card
	return card
end

local function makeTab(name, order, subtitle, canvasHeight)
	local page = makePage(canvasHeight)
	local tab = makeButton(tabColumn, name, 0, 8 + (order - 1) * 32, TAB_WIDTH - 1)
	tab.Size = UDim2.fromOffset(TAB_WIDTH - 1, 30)
	makeHeading(page, name)
	if subtitle then
		makeNote(page, subtitle, 24, 32)
	end
	pages[name] = { page = page, tab = tab, order = order }
	tabButtons[tab] = true
	return page
end

do
	local hello = makeNote(tabColumn, "hi " .. player.DisplayName, 12, 0)
	hello.Position = UDim2.new(0, 12, 1, -24)
	hello.Size = UDim2.new(1, -20, 0, 16)
	hello.TextTruncate = Enum.TextTruncate.AtEnd
	hello.Name = "Hello"
end

local mods = {}
local ui = {}
local perf = { low = false }
local showToast

do
	local toast = Instance.new("Frame")
	toast.AnchorPoint = Vector2.new(0.5, 1)
	toast.Position = UDim2.new(0.5, TAB_WIDTH / 2, 1, -(FOOTER_HEIGHT + 12))
	toast.Size = UDim2.fromOffset(0, 28)
	toast.AutomaticSize = Enum.AutomaticSize.X
	toast.BackgroundColor3 = PANEL
	toast.BackgroundTransparency = 1
	toast.BorderSizePixel = 0
	toast.ZIndex = 8
	toast.Visible = false
	toast.Parent = window
	addCorner(toast, 14)
	local toastStroke = addStroke(toast, GREEN, 1, 1)

	local toastPadding = Instance.new("UIPadding")
	toastPadding.PaddingLeft = UDim.new(0, 14)
	toastPadding.PaddingRight = UDim.new(0, 14)
	toastPadding.Parent = toast

	local toastLabel = Instance.new("TextLabel")
	toastLabel.BackgroundTransparency = 1
	toastLabel.BorderSizePixel = 0
	toastLabel.Size = UDim2.fromOffset(0, 28)
	toastLabel.AutomaticSize = Enum.AutomaticSize.X
	toastLabel.TextColor3 = GREEN
	toastLabel.TextSize = 13
	toastLabel.TextTransparency = 1
	toastLabel.ZIndex = 9
	applyFont(toastLabel)
	toastLabel.Parent = toast
	toast.BackgroundTransparency = 1

	local token = 0
	local fastInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local slowInfo = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

	function showToast(text)
		token = token + 1
		local mine = token
		toastLabel.Text = text
		toast.Visible = true
		TweenService:Create(toast, fastInfo, { BackgroundTransparency = 0.1 }):Play()
		TweenService:Create(toastStroke, fastInfo, { Transparency = 0.4 }):Play()
		TweenService:Create(toastLabel, fastInfo, { TextTransparency = 0 }):Play()
		task.delay(1.6, function()
			if mine ~= token then
				return
			end
			TweenService:Create(toast, slowInfo, { BackgroundTransparency = 1 }):Play()
			TweenService:Create(toastStroke, slowInfo, { Transparency = 1 }):Play()
			TweenService:Create(toastLabel, slowInfo, { TextTransparency = 1 }):Play()
		end)
	end
end

ui.playerPage = makeTab("player", 1, "player modifications")
ui.otherPage = makeTab("other", 2, "other stuff")
ui.espPage = makeTab("esp", 3, "see stuff through walls")
ui.teleportPage = makeTab("teleports", 4, "teleport to stuff in the map")
ui.destroyPage = makeTab("destroy", 5, "destroy stuff")
ui.miscPage = makeTab("Misc", 7, "settings")

ui.playerCard = makeCard(ui.playerPage, 128)
ui.superHumanButton = makeButton(ui.playerCard, "SUPER HUMAN", 12, 12)
ui.infiniteJumpButton = makeButton(ui.playerCard, "infinite jump", 184, 12)
ui.noclipButton = makeButton(ui.playerCard, "noclip", 356, 12)
ui.flyButton = makeButton(ui.playerCard, "fly", 12, 48)
ui.jumpPowerBox = makeBox(ui.playerCard, "change jump power", 12, 88, 340)

ui.miscCard = makeCard(ui.miscPage, 156)
ui.themeMenuButton = makeButton(ui.miscCard, "theme menu", 12, 12)
ui.musicMenuButton = makeButton(ui.miscCard, "music menu", 184, 12)
ui.backgroundMenuButton = makeButton(ui.miscCard, "background menu", 356, 12)
ui.clickMenuButton = makeButton(ui.miscCard, "click menu", 12, 48)
ui.resetPosButton = makeButton(ui.miscCard, "reset position", 184, 48)
ui.autoSaveModsButton = makeButton(ui.miscCard, "auto save mods", 12, 84)
ui.autoSaveThemeButton = makeButton(ui.miscCard, "auto save theme", 184, 84)
ui.trailMenuButton = makeButton(ui.miscCard, "trail menu", 356, 48)
ui.menuTypesButton = makeButton(ui.miscCard, "menu types", 356, 84)
makeNote(ui.miscCard, "created by Dawg", 12, 128)

ui.serverPage = makeTab("server", 6, "go to different games")
ui.serverCard = makeCard(ui.serverPage, 124)
ui.tpGameButton = makeButton(ui.serverCard, "tp to weird ass game", 12, 12)
ui.tpGameNote = makeNote(ui.serverCard, "are you sure? this will teleport you to a different game.", 12, 58)
ui.tpGameNote.Size = UDim2.fromOffset(560, 16)
ui.tpGameNote.Visible = false
ui.tpGameYes = makeButton(ui.serverCard, "yes", 12, 82)
ui.tpGameNo = makeButton(ui.serverCard, "no", 184, 82)
ui.tpGameYes.Visible = false
ui.tpGameNo.Visible = false

do
	local TeleportService = game:GetService("TeleportService")
	local GAME_ID = 83907398368798

	local function setConfirm(visible)
		ui.tpGameNote.Visible = visible
		ui.tpGameYes.Visible = visible
		ui.tpGameNo.Visible = visible
	end

	ui.tpGameButton.MouseButton1Click:Connect(function()
		setConfirm(true)
	end)
	ui.tpGameNo.MouseButton1Click:Connect(function()
		setConfirm(false)
	end)
	ui.tpGameYes.MouseButton1Click:Connect(function()
		setConfirm(false)
		local ok = pcall(function()
			TeleportService:Teleport(GAME_ID, player)
		end)
		if not ok and showToast then
			showToast("teleport failed")
		end
	end)
end

ui.otherCard = makeCard(ui.otherPage, 124)
ui.instantGrabButton = makeButton(ui.otherCard, "instant grab", 12, 12)
ui.fullbrightButton = makeButton(ui.otherCard, "fullbright", 184, 12)
ui.glassButton = makeButton(ui.otherCard, "Bring all glass", 356, 12)
mods.lowGravityButton = makeButton(ui.otherCard, "low gravity", 12, 48)
mods.zoomButton = makeButton(ui.otherCard, "zoom out", 184, 48)
mods.fovButton = makeButton(ui.otherCard, "wide fov", 356, 48)
ui.bringNpcsButton = makeButton(ui.otherCard, "bring all npc's", 12, 84)

ui.espCard = makeCard(ui.espPage, 88)
ui.espButton = makeButton(ui.espCard, "esp all items", 12, 12)
ui.esp2Button = makeButton(ui.espCard, "esp all items 2", 12, 48)
ui.npcEspButton = makeButton(ui.espCard, "Esp npc's", 184, 12)
mods.espPlayersButton = makeButton(ui.espCard, "esp players", 356, 12)

ui.teleportCard = makeCard(ui.teleportPage, 124)
ui.electricBoxButton = makeButton(ui.teleportCard, "tp to eletric box", 12, 12)
ui.vaultButton = makeButton(ui.teleportCard, "tp to vault", 184, 12)
ui.truckButton = makeButton(ui.teleportCard, "tp to truck", 12, 48)
ui.randomItemButton = makeButton(ui.teleportCard, "tp to random item", 184, 48)
ui.itemMenuButton = makeButton(ui.teleportCard, "item tp menu", 356, 12)
ui.safeMenuButton = makeButton(ui.teleportCard, "safe tp menu", 356, 48)
ui.boatButton = makeButton(ui.teleportCard, "tp to boat", 12, 84)
ui.playerMenuButton = makeButton(ui.teleportCard, "player tp menu", 184, 84)

ui.destroyCard = makeCard(ui.destroyPage, 52)
ui.lazersButton = makeButton(ui.destroyCard, "destroy lazers", 12, 12)
mods.destroyGlassButton = makeButton(ui.destroyCard, "destroy glass", 184, 12)
ui.vaultDoorButton = makeButton(ui.destroyCard, "destroy vault door", 356, 12)

local closeButton = makeButton(header, "X", WINDOW_WIDTH - 46, 2, 36)
closeButton.Position = UDim2.new(1, -46, 0, 2)
closeButton.TextColor3 = RED
closeButton.MouseEnter:Connect(function()
	TweenService:Create(closeButton, TWEEN_FAST, { BackgroundColor3 = Color3.fromRGB(120, 30, 30) }):Play()
end)

local minimizeButton = makeButton(header, "-", WINDOW_WIDTH - 88, 2, 36)
minimizeButton.Position = UDim2.new(1, -88, 0, 2)

local currentTab = "player"
ui.layout = { side = "left", x = TAB_WIDTH, y = HEADER_HEIGHT }
ui.size = { w = WINDOW_WIDTH, h = WINDOW_HEIGHT }
ui.indicatorGoal = function(tab)
	local side = ui.layout.side
	local mark = ui.layout.mark or 4
	if side == "left" then
		return { Position = UDim2.fromOffset(TAB_WIDTH - mark, tab.Position.Y.Offset), Size = UDim2.fromOffset(mark, tab.Size.Y.Offset) }
	elseif side == "right" then
		return { Position = UDim2.fromOffset(0, tab.Position.Y.Offset), Size = UDim2.fromOffset(mark, tab.Size.Y.Offset) }
	elseif side == "top" then
		return { Position = UDim2.fromOffset(tab.Position.X.Offset, 38 - mark), Size = UDim2.fromOffset(tab.Size.X.Offset, mark) }
	end
	return { Position = UDim2.fromOffset(tab.Position.X.Offset, 0), Size = UDim2.fromOffset(tab.Size.X.Offset, mark) }
end

local tabIndicator = Instance.new("Frame")
tabIndicator.BackgroundColor3 = GREEN
tabIndicator.BorderSizePixel = 0
tabIndicator.Position = UDim2.fromOffset(TAB_WIDTH - 4, 8)
tabIndicator.Size = UDim2.fromOffset(4, 30)
tabIndicator.ZIndex = 6
tabIndicator.Parent = tabColumn

local function showTab(name)
	local changed = currentTab ~= name
	currentTab = name
	for pageName, entry in pairs(pages) do
		local active = pageName == name
		if active and (changed or not entry.page.Visible) then
			entry.page.Position = UDim2.fromOffset(ui.layout.x + 18, ui.layout.y)
			TweenService:Create(entry.page, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Position = UDim2.fromOffset(ui.layout.x, ui.layout.y),
			}):Play()
		end
		if active and changed then
			local order = 0
			for _, object in ipairs(entry.page:GetDescendants()) do
				if object:IsA("TextButton") or object:IsA("TextBox") then
					local scale = object:FindFirstChildOfClass("UIScale")
					if scale then
						order = order + 1
						scale.Scale = 0.8
						TweenService:Create(scale, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, math.min(order, 14) * 0.02), { Scale = 1 }):Play()
					end
				end
			end
		end
		entry.page.Visible = active
		setButtonActive(entry.tab, active)
		if active then
			TweenService:Create(tabIndicator, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), ui.indicatorGoal(entry.tab)):Play()
		end
	end
end

for pageName, entry in pairs(pages) do
	entry.tab.MouseButton1Click:Connect(function()
		showTab(pageName)
	end)
end

showTab("player")

local DESCRIPTIONS = {
	["menu types"] = "This will open a menu where you can build your own menu look.",
	["SUPER HUMAN"] = "This will give you super speed.",
	["instant grab"] = "This will make it so you don't have to wait when grabbing an item.",
	["esp all items"] = "This will esp all the items around the map.",
	["esp all items 2"] = "This will esp all the items around the map but with a bigger radius.",
	["tp to eletric box"] = "Will teleport you to the Electric Box.",
	["tp to vault"] = "Will teleport you to the Vault.",
	["tp to truck"] = "Will teleport you to the Truck.",
	["tp to boat"] = "Will teleport you to the Boat.",
	["tp to random item"] = "Will teleport you to a random item in the map.",
	["item tp menu"] = "Opens a list of every item so you can pick one to teleport to.",
	["safe tp menu"] = "Opens a list of every safe so you can pick one to teleport to.",
	["infinite jump"] = "This will let you keep jumping while you are in the air.",
	["noclip"] = "This will let you walk through walls.",
	["fly"] = "This will let you fly. Use W A S D to move, Space to go up and Left Control to go down.",
	["fullbright"] = "This will remove the darkness so everything is bright.",
	["Bring all glass"] = "This will bring all the glass in front of you.",
	["bring all npc's"] = "This will bring all the npc's in front of you",
	["Esp npc's"] = "This will esp all the npc's around the map.",
	["tp to weird ass game"] = "This will tp you to a game.",
	["music menu"] = "Opens the music menu so you can pick a song and change the volume.",
	["mute music"] = "This will mute or unmute the music.",
	["destroy lazers"] = "This will destroy the Lazers.",
	["destroy glass"] = "This will destroy all the glass on the map.",
	["destroy vault door"] = "This will destroy the vault door.",
	["low gravity"] = "This will make gravity weaker so you float and fall slowly.",
	["zoom out"] = "This will let your camera zoom out much farther.",
	["wide fov"] = "This will widen your field of view so you can see more.",
	["esp players"] = "This will esp all the other players.",
	["player tp menu"] = "Opens a list of every player so you can pick one to teleport to.",
	["trail menu"] = "this will open a list of trails for the mouse.",
	["theme menu"] = "This opens a list of menu color themes to choose from.",
	["background menu"] = "This opens a list of animated backgrounds to choose from.",
	["click menu"] = "This opens a list of click effects to choose from.",
	["reset position"] = "This will move the menu back to the middle of the screen.",
	["auto save mods"] = "This will save any mods you have enabled.",
	["auto save theme"] = "This will save your theme settings.",
	["X"] = "Destroy the menu?",
	["-"] = "Hide the menu?",
	["+"] = "Show the menu?",
}

local oldTip = playerGui:FindFirstChild("moddyTip")
if oldTip then
	oldTip:Destroy()
end

local tipGui = Instance.new("ScreenGui")
tipGui.Name = "moddyTip"
tipGui.ResetOnSpawn = false
tipGui.IgnoreGuiInset = true
tipGui.DisplayOrder = 2147483002
tipGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
tipGui.Parent = playerGui

local tipFrame = Instance.new("Frame")
tipFrame.AutomaticSize = Enum.AutomaticSize.XY
tipFrame.Size = UDim2.fromOffset(0, 0)
tipFrame.AnchorPoint = Vector2.new(0, 1)
tipFrame.BackgroundColor3 = PANEL
tipFrame.BackgroundTransparency = 0.05
tipFrame.BorderSizePixel = 0
tipFrame.Visible = false
tipFrame.ZIndex = 10
tipFrame.Parent = tipGui

local tipPadding = Instance.new("UIPadding")
tipPadding.PaddingTop = UDim.new(0, 5)
tipPadding.PaddingBottom = UDim.new(0, 5)
tipPadding.PaddingLeft = UDim.new(0, 7)
tipPadding.PaddingRight = UDim.new(0, 7)
tipPadding.Parent = tipFrame
addCorner(tipFrame, 6)
addStroke(tipFrame, GREEN, 0.4, 1)

local tipLimit = Instance.new("UISizeConstraint")
tipLimit.MaxSize = Vector2.new(280, math.huge)
tipLimit.Parent = tipFrame

local tipLabel = Instance.new("TextLabel")
tipLabel.AutomaticSize = Enum.AutomaticSize.XY
tipLabel.Size = UDim2.fromOffset(0, 0)
tipLabel.BackgroundTransparency = 1
tipLabel.BorderSizePixel = 0
tipLabel.Text = ""
tipLabel.TextColor3 = INPUT_TEXT
tipLabel.TextSize = 14
tipLabel.TextWrapped = true
tipLabel.TextXAlignment = Enum.TextXAlignment.Left
tipLabel.ZIndex = 11
applyFont(tipLabel)
tipLabel.Parent = tipFrame

local tipHovering = false

local function moveTip()
	local mouse = UserInputService:GetMouseLocation()
	local camera = workspace.CurrentCamera
	local viewport = camera and camera.ViewportSize or Vector2.new(1920, 1080)
	local size = tipFrame.AbsoluteSize
	local x = mouse.X + 14
	local y = mouse.Y - 14
	if x + size.X > viewport.X then
		x = viewport.X - size.X
	end
	if y - size.Y < 0 then
		y = size.Y
	end
	tipFrame.Position = UDim2.fromOffset(x, y)
end

local tipMoveConnection = UserInputService.InputChanged:Connect(function(input)
	if tipHovering and input.UserInputType == Enum.UserInputType.MouseMovement then
		moveTip()
	end
end)

local function hideTip()
	tipHovering = false
	tipFrame.Visible = false
end

do
	local normalized = {}
	for key, value in pairs(DESCRIPTIONS) do
		normalized[lowerText(key)] = value
		normalized[key] = value
	end
	DESCRIPTIONS = normalized
end

for _, child in ipairs(window:GetDescendants()) do
	if child:IsA("TextButton") and not tabButtons[child] then
		child.MouseEnter:Connect(function()
			local description = DESCRIPTIONS[child.Text]
			if not description or description == "" then
				return
			end
			tipLabel.Text = description
			tipHovering = true
			tipFrame.Visible = true
			moveTip()
		end)
		child.MouseLeave:Connect(hideTip)
		child.Destroying:Connect(hideTip)
	end
end

local vaultLabel = Instance.new("TextLabel")
vaultLabel.BackgroundTransparency = 1
vaultLabel.BorderSizePixel = 0
vaultLabel.Position = UDim2.fromOffset(12, 0)
vaultLabel.Size = UDim2.new(0, 300, 1, 0)
vaultLabel.Text = ""
vaultLabel.TextColor3 = DARK_GREEN
vaultLabel.TextSize = 13
vaultLabel.TextXAlignment = Enum.TextXAlignment.Left
vaultLabel.ZIndex = 3
applyFont(vaultLabel)
vaultLabel.Parent = footer

local minimized = false

local function setMinimized(state)
	minimized = state
	minimizeButton.Text = state and "+" or "-"
	tabColumn.Visible = not state
	footer.Visible = not state
	if state then
		for _, entry in pairs(pages) do
			entry.page.Visible = false
		end
	else
		showTab(currentTab)
	end
	TweenService:Create(window, TWEEN_FAST, {
		Size = UDim2.fromOffset(WINDOW_WIDTH, state and HEADER_HEIGHT or WINDOW_HEIGHT),
	}):Play()
end

minimizeButton.MouseButton1Click:Connect(function()
	setMinimized(not minimized)
end)

local function getCharacterParts()
	local character = player.Character
	if not character then
		return nil, nil
	end
	return character:FindFirstChildOfClass("Humanoid"), character:FindFirstChild("HumanoidRootPart")
end

local sprint = { enabled = false }
local DEFAULT_SPEED = 30
local SPRINT_SPEED = 75
do
	local sprintConnections = {}
	local sprintOriginalSpeed = 16
	local SPRINT_KEY = Enum.KeyCode.LeftShift

	local function sprintTarget()
		if UserInputService:GetFocusedTextBox() == nil and UserInputService:IsKeyDown(SPRINT_KEY) then
			return SPRINT_SPEED
		end
		return DEFAULT_SPEED
	end

	local function sprintEnforce()
		local humanoid, root = getCharacterParts()
		if not humanoid or humanoid.Health <= 0 then
			return
		end

		local speed = sprintTarget()
		if humanoid.WalkSpeed ~= speed then
			humanoid.WalkSpeed = speed
		end

		if speed == SPRINT_SPEED and root then
			local moveDir = humanoid.MoveDirection
			if moveDir.Magnitude > 0.1 then
				local current = root.AssemblyLinearVelocity
				local flat = Vector3.new(current.X, 0, current.Z)
				if flat.Magnitude < SPRINT_SPEED - 1 then
					local target = moveDir.Unit * SPRINT_SPEED
					root.AssemblyLinearVelocity = Vector3.new(target.X, current.Y, target.Z)
				end
			end
		end
	end

	local function watchHumanoid(humanoid)
		table.insert(sprintConnections, humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
			if sprint.enabled then
				local speed = sprintTarget()
				if humanoid.WalkSpeed ~= speed then
					humanoid.WalkSpeed = speed
				end
			end
		end))
	end

	function sprint.enable()
		if sprint.enabled then
			return
		end
		sprint.enabled = true

		local humanoid = getCharacterParts()
		if humanoid then
			sprintOriginalSpeed = humanoid.WalkSpeed
			watchHumanoid(humanoid)
		end

		RunService:BindToRenderStep("ModMenuSprint", Enum.RenderPriority.Last.Value + 1, sprintEnforce)
		table.insert(sprintConnections, RunService.Stepped:Connect(sprintEnforce))
		table.insert(sprintConnections, RunService.Heartbeat:Connect(sprintEnforce))
		table.insert(sprintConnections, player.CharacterAdded:Connect(function(character)
			local newHumanoid = character:WaitForChild("Humanoid")
			sprintOriginalSpeed = 16
			watchHumanoid(newHumanoid)
		end))
	end

	function sprint.disable()
		if not sprint.enabled then
			return
		end
		sprint.enabled = false

		RunService:UnbindFromRenderStep("ModMenuSprint")
		for _, connection in ipairs(sprintConnections) do
			connection:Disconnect()
		end
		table.clear(sprintConnections)

		local humanoid = getCharacterParts()
		if humanoid then
			humanoid.WalkSpeed = sprintOriginalSpeed
		end
	end
end

local function parseSpeed(text)
	local trimmed = text:match("^%s*(.-)%s*$")
	if trimmed:match("^%d+%.?%d*$") or trimmed:match("^%.%d+$") then
		return tonumber(trimmed)
	end
	return nil
end

local function bindSpeedBox(box, defaultPlaceholder, apply)
	local errorToken = 0
	box.FocusLost:Connect(function(enterPressed)
		local value = parseSpeed(box.Text)
		if value then
			apply(value)
			return
		end
		if enterPressed and box.Text:match("%S") then
			errorToken = errorToken + 1
			local token = errorToken
			box.Text = ""
			box.PlaceholderText = "Only numbers"
			box.PlaceholderColor3 = Color3.fromRGB(255, 80, 80)
			task.delay(1.5, function()
				if token == errorToken then
					box.PlaceholderText = defaultPlaceholder
					box.PlaceholderColor3 = DARK_GREEN
				end
			end)
		end
	end)
end

local jumpPowerValue

local function applyJumpPower()
	local humanoid = getCharacterParts()
	if humanoid and jumpPowerValue then
		humanoid.UseJumpPower = true
		humanoid.JumpPower = jumpPowerValue
	end
end

bindSpeedBox(ui.jumpPowerBox, "change jump power", function(value)
	jumpPowerValue = value
	applyJumpPower()
end)

player.CharacterAdded:Connect(function(character)
	character:WaitForChild("Humanoid")
	task.wait(0.5)
	applyJumpPower()
end)

local function scanAsync(root, visit, alive)
	task.spawn(function()
		local stack = { root }
		local processed = 0
		while #stack > 0 do
			local node = table.remove(stack)
			for _, child in ipairs(node:GetChildren()) do
				visit(child)
				table.insert(stack, child)
			end
			processed = processed + 1
			if processed >= 250 then
				processed = 0
				task.wait()
				if not alive() then
					return
				end
			end
		end
	end)
end

local grab = { enabled = false }
do
	local GRAB_DURATION = 0.0001
	local grabOriginal = {}
	local grabSignals = {}
	local grabAdded
	local grabScan = 0

	local function grabApply(prompt)
		if grabOriginal[prompt] == nil then
			grabOriginal[prompt] = prompt.HoldDuration
		end
		prompt.HoldDuration = GRAB_DURATION
		if not grabSignals[prompt] then
			grabSignals[prompt] = prompt:GetPropertyChangedSignal("HoldDuration"):Connect(function()
				if grab.enabled and prompt.HoldDuration ~= GRAB_DURATION then
					prompt.HoldDuration = GRAB_DURATION
				end
			end)
		end
	end

	function grab.enable()
		if grab.enabled then
			return
		end
		grab.enabled = true

		grabScan = grabScan + 1
		local mine = grabScan
		scanAsync(workspace, function(descendant)
			if descendant:IsA("ProximityPrompt") then
				grabApply(descendant)
			end
		end, function()
			return grab.enabled and mine == grabScan
		end)

		grabAdded = workspace.DescendantAdded:Connect(function(descendant)
			if descendant:IsA("ProximityPrompt") then
				grabApply(descendant)
			end
		end)
	end

	function grab.disable()
		if not grab.enabled then
			return
		end
		grab.enabled = false

		if grabAdded then
			grabAdded:Disconnect()
			grabAdded = nil
		end
		for _, signal in pairs(grabSignals) do
			signal:Disconnect()
		end
		for prompt, original in pairs(grabOriginal) do
			if prompt.Parent then
				prompt.HoldDuration = original
			end
		end
		table.clear(grabSignals)
		table.clear(grabOriginal)
	end
end

local esp = { enabled = false }
local ESP_RADIUS = 60
local ESP_FAR_RADIUS = 100000
local espRadius = ESP_RADIUS
do

	local RED_FILL = Color3.fromRGB(255, 0, 0)
	local DARK_RED_OUTLINE = Color3.fromRGB(40, 0, 0)
	local GREY_OUTLINE = Color3.fromRGB(128, 128, 128)
	local FILL_TRANSPARENCY = 0.5
	local OUTLINE_TRANSPARENCY = 0
	local FADE_SPEED = 8

	local LABEL_FONT = Font.new("rbxassetid://12187371840", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

	local espContainer
	local espTracked = {}
	local espConnections = {}
	local pendingAdds = {}
	local pendingIndex = 1

	local function getItemPosition(item)
		if item:IsA("Model") then
			return item:GetPivot().Position
		elseif item:IsA("BasePart") then
			return item.Position
		end
		return nil
	end

	local function getAdorneePart(item)
		if item:IsA("BasePart") then
			return item
		end
		if item:IsA("Model") then
			if item.PrimaryPart then
				return item.PrimaryPart
			end
			return item:FindFirstChildWhichIsA("BasePart", true)
		end
		return nil
	end

	local function getLabelOffset(item, part)
		local top
		if item:IsA("Model") then
			local boxCFrame, boxSize = item:GetBoundingBox()
			top = boxCFrame.Position + Vector3.new(0, boxSize.Y / 2 + 1.5, 0)
		else
			top = item.Position + Vector3.new(0, item.Size.Y / 2 + 1.5, 0)
		end
		return top - part.Position
	end

	local function setVisibility(data, visibility)
		data.highlight.FillTransparency = 1 - (1 - data.baseFill) * visibility
		data.highlight.OutlineTransparency = 1 - (1 - data.baseOutline) * visibility
		data.label.TextTransparency = 1 - visibility
		data.label.TextStrokeTransparency = 1 - visibility
	end

	local function addESP(item, natural)
		if espTracked[item] then
			return
		end

		local part = getAdorneePart(item)
		if not part then
			return
		end

		local highlight = item:FindFirstChild("ESPHighlight")
		local createdHighlight = false
		local original
		local baseOutline = OUTLINE_TRANSPARENCY

		if highlight and highlight:IsA("Highlight") then
			original = {
				Enabled = highlight.Enabled,
				DepthMode = highlight.DepthMode,
				FillTransparency = highlight.FillTransparency,
				OutlineTransparency = highlight.OutlineTransparency,
			}
			if original.OutlineTransparency < 1 then
				baseOutline = original.OutlineTransparency
			end
			highlight.Enabled = true
			highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		else
			createdHighlight = true
			highlight = Instance.new("Highlight")
			highlight.Name = "ESPHighlight"
			highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			highlight.Adornee = item
			if natural then
				highlight.FillColor = WHITE
				highlight.OutlineColor = GREY_OUTLINE
			else
				highlight.FillColor = RED_FILL
				highlight.OutlineColor = DARK_RED_OUTLINE
			end
			highlight.Parent = item
		end

		local billboard = Instance.new("BillboardGui")
		billboard.Name = "ESPLabel"
		billboard.Adornee = part
		billboard.AlwaysOnTop = true
		billboard.MaxDistance = math.huge
		billboard.Size = UDim2.fromOffset(240, 22)
		billboard.StudsOffsetWorldSpace = getLabelOffset(item, part)
		billboard.Parent = espContainer

		local label = Instance.new("TextLabel")
		label.BackgroundTransparency = 1
		label.Size = UDim2.new(1, 0, 1, 0)
		label.FontFace = LABEL_FONT
		label.TextSize = 14
		label.Text = item.Name
		label.TextColor3 = WHITE
		label.TextStrokeColor3 = BLACK
		label.TextTransparency = 1
		label.TextStrokeTransparency = 1
		label.TextWrapped = false
		label.Parent = billboard

		local data = {
			highlight = highlight,
			createdHighlight = createdHighlight,
			original = original,
			baseFill = FILL_TRANSPARENCY,
			baseOutline = baseOutline,
			billboard = billboard,
			label = label,
			visibility = 0,
			target = 0,
		}

		data.connection = item:GetPropertyChangedSignal("Name"):Connect(function()
			label.Text = item.Name
		end)

		espTracked[item] = data
		setVisibility(data, 0)
	end

	local function removeESP(item)
		local data = espTracked[item]
		if not data then
			return
		end
		data.connection:Disconnect()
		if data.createdHighlight then
			data.highlight:Destroy()
		elseif data.highlight.Parent and data.original then
			for property, value in pairs(data.original) do
				data.highlight[property] = value
			end
		end
		data.billboard:Destroy()
		espTracked[item] = nil
	end

	local function setupNatural(naturalFolder)
		for _, child in ipairs(naturalFolder:GetChildren()) do
			table.insert(pendingAdds, { child, true })
		end
		table.insert(espConnections, naturalFolder.ChildAdded:Connect(function(child)
			addESP(child, true)
		end))
		table.insert(espConnections, naturalFolder.ChildRemoved:Connect(removeESP))
	end

	local function handleStealable(child)
		if child.Name == "Natural" then
			setupNatural(child)
		else
			addESP(child, false)
		end
	end

	function esp.enable()
		if esp.enabled then
			return
		end

		local folder = waitPath(workspace, "Map", "StealableItems")
		if not folder then
			warn("Mod menu: workspace.Map.StealableItems was not found")
			return
		end

		esp.enabled = true

		espContainer = Instance.new("Folder")
		espContainer.Name = "StealableESP"
		espContainer.Parent = playerGui

		for _, child in ipairs(folder:GetChildren()) do
			table.insert(pendingAdds, { child, false })
		end

		table.insert(espConnections, folder.ChildAdded:Connect(handleStealable))
		table.insert(espConnections, folder.ChildRemoved:Connect(removeESP))

		local sinceCheck = math.huge

		table.insert(espConnections, RunService.RenderStepped:Connect(function(dt)
			local alpha = math.clamp(dt * FADE_SPEED, 0, 1)

			local budget = 8
			while pendingIndex <= #pendingAdds and budget > 0 do
				local entry = pendingAdds[pendingIndex]
				pendingIndex = pendingIndex + 1
				budget = budget - 1
				if entry[1].Parent then
					if entry[2] then
						addESP(entry[1], true)
					else
						handleStealable(entry[1])
					end
				end
			end

			sinceCheck = sinceCheck + dt
			if sinceCheck >= 0.15 then
				sinceCheck = 0
				local _, root = getCharacterParts()
				for item, data in pairs(espTracked) do
					local target = 0
					if root then
						local position = getItemPosition(item)
						if position and (position - root.Position).Magnitude <= espRadius then
							target = 1
						end
					end
					data.target = target
				end
			end

			for _, data in pairs(espTracked) do
				local target = data.target
				if math.abs(data.visibility - target) > 0.01 then
					data.visibility = data.visibility + (target - data.visibility) * alpha
					setVisibility(data, data.visibility)
				elseif data.visibility ~= target then
					data.visibility = target
					setVisibility(data, target)
				end
			end
		end))
	end

	function esp.disable()
		if not esp.enabled then
			return
		end
		esp.enabled = false

		for _, connection in ipairs(espConnections) do
			connection:Disconnect()
		end
		table.clear(espConnections)
		table.clear(pendingAdds)
		pendingIndex = 1

		local items = {}
		for item in pairs(espTracked) do
			table.insert(items, item)
		end
		for _, item in ipairs(items) do
			removeESP(item)
		end

		if espContainer then
			espContainer:Destroy()
			espContainer = nil
		end
	end
end

local infiniteJump = { enabled = false }
do
	local infiniteJumpConnection

	function infiniteJump.enable()
		if infiniteJump.enabled then
			return
		end
		infiniteJump.enabled = true
		infiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
			local humanoid = getCharacterParts()
			if humanoid then
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end)
	end

	function infiniteJump.disable()
		if not infiniteJump.enabled then
			return
		end
		infiniteJump.enabled = false
		if infiniteJumpConnection then
			infiniteJumpConnection:Disconnect()
			infiniteJumpConnection = nil
		end
	end
end

local noclip = { enabled = false }
do
	local noclipConnection
	local noclipChanged = {}

	function noclip.enable()
		if noclip.enabled then
			return
		end
		noclip.enabled = true
		local cachedCharacter
		local cachedParts = {}
		local lastBuild = 0
		noclipConnection = RunService.Stepped:Connect(function()
			local character = player.Character
			if not character then
				return
			end
			local now = os.clock()
			if character ~= cachedCharacter or now - lastBuild > 2 then
				cachedCharacter = character
				lastBuild = now
				table.clear(cachedParts)
				for _, part in ipairs(character:GetDescendants()) do
					if part:IsA("BasePart") then
						table.insert(cachedParts, part)
					end
				end
			end
			for _, part in ipairs(cachedParts) do
				if part.CanCollide then
					noclipChanged[part] = true
					part.CanCollide = false
				end
			end
		end)
	end

	function noclip.disable()
		if not noclip.enabled then
			return
		end
		noclip.enabled = false
		if noclipConnection then
			noclipConnection:Disconnect()
			noclipConnection = nil
		end
		for part in pairs(noclipChanged) do
			if part.Parent then
				part.CanCollide = true
			end
		end
		table.clear(noclipChanged)
	end
end

local fly = { enabled = false }
do
	local FLY_SPEED = 60
	local flyConnection
	local flyVelocity
	local flyGyro

	local function attachFly(root)
		flyVelocity = Instance.new("BodyVelocity")
		flyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
		flyVelocity.Velocity = Vector3.zero
		flyVelocity.Parent = root

		flyGyro = Instance.new("BodyGyro")
		flyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
		flyGyro.P = 9e4
		flyGyro.CFrame = root.CFrame
		flyGyro.Parent = root
	end

	function fly.enable()
		if fly.enabled then
			return
		end
		local humanoid, root = getCharacterParts()
		if not humanoid or not root then
			return
		end
		fly.enabled = true
		humanoid.PlatformStand = true
		attachFly(root)

		flyConnection = RunService.RenderStepped:Connect(function()
			local currentHumanoid, currentRoot = getCharacterParts()
			if not currentHumanoid or not currentRoot then
				return
			end
			if not flyVelocity or flyVelocity.Parent ~= currentRoot then
				currentHumanoid.PlatformStand = true
				attachFly(currentRoot)
			end

			local camera = workspace.CurrentCamera
			local cframe = camera.CFrame
			local direction = Vector3.zero
			if UserInputService:GetFocusedTextBox() == nil then
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					direction = direction + cframe.LookVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					direction = direction - cframe.LookVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					direction = direction + cframe.RightVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					direction = direction - cframe.RightVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					direction = direction + Vector3.new(0, 1, 0)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
					direction = direction - Vector3.new(0, 1, 0)
				end
			end

			flyVelocity.Velocity = direction.Magnitude > 0 and direction.Unit * FLY_SPEED or Vector3.zero
			flyGyro.CFrame = CFrame.new(currentRoot.Position, currentRoot.Position + cframe.LookVector)
		end)
	end

	function fly.disable()
		if not fly.enabled then
			return
		end
		fly.enabled = false
		if flyConnection then
			flyConnection:Disconnect()
			flyConnection = nil
		end
		if flyVelocity then
			flyVelocity:Destroy()
			flyVelocity = nil
		end
		if flyGyro then
			flyGyro:Destroy()
			flyGyro = nil
		end
		local humanoid = getCharacterParts()
		if humanoid then
			humanoid.PlatformStand = false
		end
	end
end

local fullbright = { enabled = false }
do
	local fullbrightConnection
	local fullbrightOriginal = {}
	local BRIGHT_AMBIENT = Color3.fromRGB(178, 178, 178)

	local function applyFullbright()
		if Lighting.Brightness ~= 2 then
			Lighting.Brightness = 2
		end
		if Lighting.ClockTime ~= 14 then
			Lighting.ClockTime = 14
		end
		if Lighting.GlobalShadows then
			Lighting.GlobalShadows = false
		end
		if Lighting.Ambient ~= BRIGHT_AMBIENT then
			Lighting.Ambient = BRIGHT_AMBIENT
		end
		if Lighting.OutdoorAmbient ~= BRIGHT_AMBIENT then
			Lighting.OutdoorAmbient = BRIGHT_AMBIENT
		end
	end

	function fullbright.enable()
		if fullbright.enabled then
			return
		end
		fullbright.enabled = true
		fullbrightOriginal = {
			Brightness = Lighting.Brightness,
			ClockTime = Lighting.ClockTime,
			GlobalShadows = Lighting.GlobalShadows,
			Ambient = Lighting.Ambient,
			OutdoorAmbient = Lighting.OutdoorAmbient,
		}
		applyFullbright()
		fullbrightConnection = RunService.Heartbeat:Connect(applyFullbright)
	end

	function fullbright.disable()
		if not fullbright.enabled then
			return
		end
		fullbright.enabled = false
		if fullbrightConnection then
			fullbrightConnection:Disconnect()
			fullbrightConnection = nil
		end
		for property, value in pairs(fullbrightOriginal) do
			Lighting[property] = value
		end
	end
end

local noFog = { enabled = false }
do
	local noFogConnection
	local noFogOriginal = {}
	local NO_FOG_END = 100000

	local function applyNoFog()
		if Lighting.FogEnd ~= NO_FOG_END then
			Lighting.FogEnd = NO_FOG_END
		end
		local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
		if atmosphere then
			if atmosphere.Density ~= 0 then
				atmosphere.Density = 0
			end
			if atmosphere.Haze ~= 0 then
				atmosphere.Haze = 0
			end
		end
	end

	function noFog.enable()
		if noFog.enabled then
			return
		end
		noFog.enabled = true
		noFogOriginal = { FogEnd = Lighting.FogEnd }
		local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
		if atmosphere then
			noFogOriginal.Density = atmosphere.Density
			noFogOriginal.Haze = atmosphere.Haze
		end
		applyNoFog()
		noFogConnection = RunService.Heartbeat:Connect(applyNoFog)
	end

	function noFog.disable()
		if not noFog.enabled then
			return
		end
		noFog.enabled = false
		if noFogConnection then
			noFogConnection:Disconnect()
			noFogConnection = nil
		end
		Lighting.FogEnd = noFogOriginal.FogEnd
		local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
		if atmosphere and noFogOriginal.Density then
			atmosphere.Density = noFogOriginal.Density
			atmosphere.Haze = noFogOriginal.Haze
		end
	end
end

local antiAfk = { enabled = false }
do
	local antiAfkConnection

	function antiAfk.enable()
		if antiAfk.enabled then
			return
		end
		antiAfk.enabled = true
		antiAfkConnection = player.Idled:Connect(function()
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end

	function antiAfk.disable()
		if not antiAfk.enabled then
			return
		end
		antiAfk.enabled = false
		if antiAfkConnection then
			antiAfkConnection:Disconnect()
			antiAfkConnection = nil
		end
	end
end

local npcEsp = { enabled = false }
do
	local npcContainer
	local npcConnections = {}
	local npcHighlights = {}

	local function addNpcEsp(npc)
		if npcHighlights[npc] or not npc:IsA("PVInstance") then
			return
		end
		local highlight = Instance.new("Highlight")
		highlight.Name = "NPCESP"
		highlight.FillColor = Color3.fromRGB(0, 100, 255)
		highlight.OutlineColor = WHITE
		highlight.FillTransparency = 0.5
		highlight.OutlineTransparency = 0
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Adornee = npc
		highlight.Parent = npcContainer
		npcHighlights[npc] = highlight
	end

	local function removeNpcEsp(npc)
		local highlight = npcHighlights[npc]
		if highlight then
			highlight:Destroy()
			npcHighlights[npc] = nil
		end
	end

	function npcEsp.enable()
		if npcEsp.enabled then
			return
		end
		local folder = waitPath(workspace, "Map", "NPCS")
		if not folder then
			warn("Mod menu: workspace.Map.NPCS was not found")
			return
		end
		npcEsp.enabled = true
		npcContainer = Instance.new("Folder")
		npcContainer.Name = "NPCESP"
		npcContainer.Parent = playerGui
		for _, child in ipairs(folder:GetChildren()) do
			addNpcEsp(child)
		end
		table.insert(npcConnections, folder.ChildAdded:Connect(addNpcEsp))
		table.insert(npcConnections, folder.ChildRemoved:Connect(removeNpcEsp))
	end

	function npcEsp.disable()
		if not npcEsp.enabled then
			return
		end
		npcEsp.enabled = false
		for _, connection in ipairs(npcConnections) do
			connection:Disconnect()
		end
		table.clear(npcConnections)
		table.clear(npcHighlights)
		if npcContainer then
			npcContainer:Destroy()
			npcContainer = nil
		end
	end
end

local glass
local bringNpcs
do
	local BRING_DISTANCE = 2

	local function createBringFeature(folderName, containerName, freeze)
		local feature = { enabled = false }
		local items = {}
		local data = {}
		local connections = {}
		local dirty = true

		local function addItem(item)
			if data[item] or not item:IsA("PVInstance") then
				return
			end
			local pivot = item:GetPivot()
			local offset = Vector3.zero
			if item:IsA("Model") then
				local boxCFrame = item:GetBoundingBox()
				offset = pivot:PointToObjectSpace(boxCFrame.Position)
			end
			local collisions = {}
			local anchors = {}
			local function disableCollision(part)
				if part:IsA("BasePart") then
					collisions[part] = part.CanCollide
					part.CanCollide = false
					if freeze then
						anchors[part] = part.Anchored
						part.Anchored = true
					end
				end
			end
			disableCollision(item)
			for _, descendant in ipairs(item:GetDescendants()) do
				disableCollision(descendant)
			end
			data[item] = { pivot = pivot, offset = offset, collisions = collisions, anchors = anchors }
			dirty = true
			table.insert(items, item)
		end

		local function removeItem(item)
			local entry = data[item]
			if entry then
				for part, canCollide in pairs(entry.collisions) do
					if part.Parent then
						part.CanCollide = canCollide
					end
				end
			end
			if entry then
				for part, anchored in pairs(entry.anchors) do
					if part.Parent then
						part.Anchored = anchored
					end
				end
			end
			data[item] = nil
			local index = table.find(items, item)
			if index then
				table.remove(items, index)
			end
		end

		function feature.enable()
			if feature.enabled then
				return
			end
			local folder = waitPath(workspace, "Map", folderName)
			if not folder then
				warn("Mod menu: workspace.Map." .. folderName .. " was not found")
				return
			end
			feature.enabled = true

			local watch

			local function handleAdded(child, inContainer)
				if containerName and not inContainer and child.Name == containerName then
					watch(child, true)
				else
					addItem(child)
				end
			end

			local function handleRemoved(child, inContainer)
				if containerName and not inContainer and child.Name == containerName then
					for _, containerChild in ipairs(child:GetChildren()) do
						removeItem(containerChild)
					end
				else
					removeItem(child)
				end
			end

			function watch(target, inContainer)
				for _, child in ipairs(target:GetChildren()) do
					handleAdded(child, inContainer)
				end
				table.insert(connections, target.ChildAdded:Connect(function(child)
					handleAdded(child, inContainer)
				end))
				table.insert(connections, target.ChildRemoved:Connect(function(child)
					handleRemoved(child, inContainer)
				end))
			end

			watch(folder, false)

			local lastTarget
			local lastPin = 0
			table.insert(connections, RunService.Heartbeat:Connect(function()
				local _, root = getCharacterParts()
				if not root then
					return
				end
				if freeze then
					for _, entry in pairs(data) do
						for part in pairs(entry.collisions) do
							if part.CanCollide then
								part.CanCollide = false
							end
						end
					end
				end
				local targetPosition = (root.CFrame * CFrame.new(0, 0, -BRING_DISTANCE)).Position
				local now = os.clock()
				if not dirty and lastTarget and (targetPosition - lastTarget).Magnitude < 0.05 and now - lastPin < 0.5 then
					return
				end
				dirty = false
				lastTarget = targetPosition
				lastPin = now
				for _, item in ipairs(items) do
					if item.Parent then
						local entry = data[item]
						local rotation = entry.pivot - entry.pivot.Position
						item:PivotTo(CFrame.new(targetPosition) * rotation * CFrame.new(-entry.offset))
						if freeze then
							for _, descendant in ipairs(item:GetDescendants()) do
								if descendant:IsA("Animator") then
									for _, track in ipairs(descendant:GetPlayingAnimationTracks()) do
										track:AdjustSpeed(0)
									end
								end
							end
						end
					end
				end
			end))
		end

		function feature.disable()
			if not feature.enabled then
				return
			end
			feature.enabled = false
			for _, connection in ipairs(connections) do
				connection:Disconnect()
			end
			table.clear(connections)
			for item, entry in pairs(data) do
				for part, canCollide in pairs(entry.collisions) do
					if part.Parent then
						part.CanCollide = canCollide
					end
				end
				for part, anchored in pairs(entry.anchors) do
					if part.Parent then
						part.Anchored = anchored
					end
				end
				if item.Parent then
					item:PivotTo(entry.pivot)
				end
			end
			table.clear(data)
			table.clear(items)
		end

		return feature
	end

	glass = createBringFeature("BreakableGlass")
	bringNpcs = createBringFeature("NPCS", nil, true)
end

mods.lowGravity = { enabled = false }
do
	local original = workspace.Gravity

	function mods.lowGravity.enable()
		if mods.lowGravity.enabled then
			return
		end
		mods.lowGravity.enabled = true
		original = workspace.Gravity
		workspace.Gravity = original * 0.3
	end

	function mods.lowGravity.disable()
		if not mods.lowGravity.enabled then
			return
		end
		mods.lowGravity.enabled = false
		workspace.Gravity = original
	end
end

mods.zoomOut = { enabled = false }
do
	local original = player.CameraMaxZoomDistance

	function mods.zoomOut.enable()
		if mods.zoomOut.enabled then
			return
		end
		mods.zoomOut.enabled = true
		original = player.CameraMaxZoomDistance
		player.CameraMaxZoomDistance = 1000
	end

	function mods.zoomOut.disable()
		if not mods.zoomOut.enabled then
			return
		end
		mods.zoomOut.enabled = false
		player.CameraMaxZoomDistance = original
	end
end

mods.wideFov = { enabled = false }
do
	local original = 70
	local fovConnection

	function mods.wideFov.enable()
		if mods.wideFov.enabled then
			return
		end
		mods.wideFov.enabled = true
		local camera = workspace.CurrentCamera
		original = camera and camera.FieldOfView or 70
		fovConnection = RunService.RenderStepped:Connect(function()
			local current = workspace.CurrentCamera
			if current then
				current.FieldOfView = 105
			end
		end)
	end

	function mods.wideFov.disable()
		if not mods.wideFov.enabled then
			return
		end
		mods.wideFov.enabled = false
		if fovConnection then
			fovConnection:Disconnect()
			fovConnection = nil
		end
		local camera = workspace.CurrentCamera
		if camera then
			camera.FieldOfView = original
		end
	end
end

mods.clickTp = { enabled = false }
do
	local inputConnection

	function mods.clickTp.enable()
		if mods.clickTp.enabled then
			return
		end
		mods.clickTp.enabled = true
		inputConnection = UserInputService.InputBegan:Connect(function(input, processed)
			if processed or input.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return
			end
			if not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
				return
			end
			local camera = workspace.CurrentCamera
			local character = player.Character
			local root = character and character:FindFirstChild("HumanoidRootPart")
			if not camera or not root then
				return
			end
			local mouse = UserInputService:GetMouseLocation()
			local ray = camera:ViewportPointToRay(mouse.X, mouse.Y)
			local params = RaycastParams.new()
			params.FilterType = Enum.RaycastFilterType.Exclude
			params.FilterDescendantsInstances = { character }
			local result = workspace:Raycast(ray.Origin, ray.Direction * 2000, params)
			if result then
				root.CFrame = CFrame.new(result.Position + Vector3.new(0, 4, 0))
			end
		end)
	end

	function mods.clickTp.disable()
		if not mods.clickTp.enabled then
			return
		end
		mods.clickTp.enabled = false
		if inputConnection then
			inputConnection:Disconnect()
			inputConnection = nil
		end
	end
end

mods.espPlayers = { enabled = false }
do
	local highlights = {}
	local connections = {}

	local function watch(other)
		if other == player then
			return
		end
		local function attach(character)
			if highlights[other] then
				highlights[other]:Destroy()
			end
			local highlight = Instance.new("Highlight")
			highlight.Name = "PlayerESP"
			highlight.FillColor = Color3.fromRGB(255, 70, 70)
			highlight.OutlineColor = WHITE
			highlight.FillTransparency = 0.5
			highlight.OutlineTransparency = 0
			highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			highlight.Adornee = character
			highlight.Parent = character
			highlights[other] = highlight
		end
		if other.Character then
			attach(other.Character)
		end
		table.insert(connections, other.CharacterAdded:Connect(attach))
	end

	function mods.espPlayers.enable()
		if mods.espPlayers.enabled then
			return
		end
		mods.espPlayers.enabled = true
		for _, other in ipairs(Players:GetPlayers()) do
			watch(other)
		end
		table.insert(connections, Players.PlayerAdded:Connect(watch))
	end

	function mods.espPlayers.disable()
		if not mods.espPlayers.enabled then
			return
		end
		mods.espPlayers.enabled = false
		for _, connection in ipairs(connections) do
			connection:Disconnect()
		end
		table.clear(connections)
		for _, highlight in pairs(highlights) do
			highlight:Destroy()
		end
		table.clear(highlights)
	end
end

mods.antiVoid = { enabled = false }
do
	local voidConnection

	function mods.antiVoid.enable()
		if mods.antiVoid.enabled then
			return
		end
		mods.antiVoid.enabled = true
		local safe
		local elapsed = 0
		voidConnection = RunService.Heartbeat:Connect(function(dt)
			elapsed = elapsed + dt
			if elapsed < 0.1 then
				return
			end
			elapsed = 0
			local humanoid, root = getCharacterParts()
			if not humanoid or not root then
				return
			end
			if humanoid.FloorMaterial ~= Enum.Material.Air then
				safe = root.CFrame
			elseif safe and root.Position.Y < safe.Position.Y - 150 then
				root.AssemblyLinearVelocity = Vector3.zero
				root.CFrame = safe + Vector3.new(0, 5, 0)
			end
		end)
	end

	function mods.antiVoid.disable()
		if not mods.antiVoid.enabled then
			return
		end
		mods.antiVoid.enabled = false
		if voidConnection then
			voidConnection:Disconnect()
			voidConnection = nil
		end
	end
end

local toggleFeatures = { sprint, grab, infiniteJump, noclip, fly, fullbright, npcEsp, glass, bringNpcs, mods.lowGravity, mods.zoomOut, mods.wideFov, mods.espPlayers }

local espMode

local statusNames = {
	{ sprint, "super human" },
	{ grab, "instant grab" },
	{ infiniteJump, "infinite jump" },
	{ noclip, "noclip" },
	{ fly, "fly" },
	{ fullbright, "fullbright" },
	{ npcEsp, "esp npc" },
	{ glass, "bring glass" },
	{ bringNpcs, "bring npc's" },
	{ mods.lowGravity, "low gravity" },
	{ mods.zoomOut, "zoom out" },
	{ mods.wideFov, "wide fov" },
	{ mods.espPlayers, "esp players" },
}

local function updateStatus()
	local active = {}
	for _, entry in ipairs(statusNames) do
		if entry[1].enabled then
			table.insert(active, entry[2])
		end
	end
	if espMode == 1 then
		table.insert(active, "esp")
	elseif espMode == 2 then
		table.insert(active, "esp 2")
	end
	statusLabel.Text = "active: " .. (#active > 0 and table.concat(active, ", ") or "none")
end

local toggleBindings = {}

local function bindToggle(button, feature)
	toggleBindings[button.Text] = { button = button, feature = feature }
	button.MouseButton1Click:Connect(function()
		if feature.enabled then
			feature.disable()
		else
			feature.enable()
		end
		setButtonActive(button, feature.enabled)
		updateStatus()
		showToast(button.Text .. (feature.enabled and ": on" or ": off"))
	end)
end

bindToggle(ui.superHumanButton, sprint)
bindToggle(ui.instantGrabButton, grab)
bindToggle(ui.infiniteJumpButton, infiniteJump)
bindToggle(ui.noclipButton, noclip)
bindToggle(ui.flyButton, fly)
bindToggle(ui.fullbrightButton, fullbright)

bindToggle(ui.npcEspButton, npcEsp)
bindToggle(ui.glassButton, glass)
bindToggle(ui.bringNpcsButton, bringNpcs)
bindToggle(mods.lowGravityButton, mods.lowGravity)
bindToggle(mods.zoomButton, mods.zoomOut)
bindToggle(mods.fovButton, mods.wideFov)
bindToggle(mods.espPlayersButton, mods.espPlayers)

local function setEspMode(mode)
	esp.disable()
	if mode then
		espRadius = mode == 2 and ESP_FAR_RADIUS or ESP_RADIUS
		esp.enable()
	end
	espMode = esp.enabled and mode or nil
	setButtonActive(ui.espButton, espMode == 1)
	setButtonActive(ui.esp2Button, espMode == 2)
	updateStatus()
end

ui.espButton.MouseButton1Click:Connect(function()
	setEspMode(espMode ~= 1 and 1 or nil)
end)

ui.esp2Button.MouseButton1Click:Connect(function()
	setEspMode(espMode ~= 2 and 2 or nil)
end)

local function teleportTo(target, offset)
	local _, root = getCharacterParts()
	if not root then
		return
	end
	if not target or not target:IsA("PVInstance") then
		warn("Mod menu: teleport target was not found")
		return
	end
	root.CFrame = target:GetPivot() + offset
end

ui.electricBoxButton.MouseButton1Click:Connect(function()
	teleportTo(waitPath(workspace, "ElectricBox"), Vector3.new(0, 3, 0))
end)

ui.vaultButton.MouseButton1Click:Connect(function()
	teleportTo(waitPath(workspace, "Map", "Others", "Special", "VaultGame", "Vault"), Vector3.new(-5, 3, 0))
end)

ui.truckButton.MouseButton1Click:Connect(function()
	teleportTo(waitPath(workspace, "Map", "Truck"), Vector3.new(0, 6, 0))
end)

ui.boatButton.MouseButton1Click:Connect(function()
	teleportTo(waitPath(workspace, "Map", "CollectTruck"), Vector3.new(0, 6, 0))
end)

ui.randomItemButton.MouseButton1Click:Connect(function()
	local folder = waitPath(workspace, "Map", "StealableItems")
	if not folder then
		warn("Mod menu: workspace.Map.StealableItems was not found")
		return
	end

	local items = {}
	for _, child in ipairs(folder:GetChildren()) do
		if child.Name == "Natural" then
			for _, naturalChild in ipairs(child:GetChildren()) do
				if naturalChild:IsA("PVInstance") then
					table.insert(items, naturalChild)
				end
			end
		elseif child:IsA("PVInstance") then
			table.insert(items, child)
		end
	end

	if #items == 0 then
		warn("Mod menu: no items found to teleport to")
		return
	end

	teleportTo(items[math.random(1, #items)], Vector3.new(0, 4, 0))
end)

local MENU_WIDTH = 240
local sideMenus = {}

local function escapeRich(text)
	return (text:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
end

local function makeListButton(parent)
	local button = Instance.new("TextButton")
	button.MouseButton1Click:Connect(function()
		local clickSound = gui:FindFirstChild("ClickSound")
		if clickSound then
			clickSound.TimePosition = 0
			clickSound:Play()
		end
	end)
	button.BackgroundColor3 = IDLE
	button.BackgroundTransparency = 0.1
	button.BorderSizePixel = 0
	button.AutoButtonColor = false
	button.Size = UDim2.new(1, 0, 0, 28)
	button.TextColor3 = GREEN
	button.TextSize = 14
	button.TextTruncate = Enum.TextTruncate.AtEnd
	button.RichText = true
	button.Text = ""
	button.ZIndex = 3
	applyFont(button, true)
	addCorner(button, 6)
	button.MouseEnter:Connect(function()
		button.BackgroundColor3 = HOVER
	end)
	button.MouseLeave:Connect(function()
		button.BackgroundColor3 = IDLE
	end)
	button.Parent = parent
	return button
end

ui.arrange = function(menu, buttons, firstNames, headings)
	local first, plain, solid = {}, {}, {}
	local pinned = {}
	for _, name in ipairs(firstNames) do
		pinned[name] = true
	end
	for name in pairs(buttons) do
		if pinned[name] then
			table.insert(first, name)
		elseif string.sub(name, 1, 3) == "3d " then
			table.insert(solid, name)
		else
			table.insert(plain, name)
		end
	end
	table.sort(first)
	table.sort(plain)
	table.sort(solid)
	local order = 0
	local function place(list, title)
		if #list == 0 then
			return
		end
		if title then
			order = order + 1
			local heading = makeNote(menu.scroll, title, 0, 0)
			heading.Size = UDim2.new(1, 0, 0, 18)
			heading.LayoutOrder = order
		end
		for _, name in ipairs(list) do
			order = order + 1
			buttons[name].LayoutOrder = order
		end
	end
	place(first, nil)
	place(plain, headings and headings[1] or nil)
	place(solid, headings and headings[2] or "3d")
	return order
end

local function createSideMenu(config)
	local menu = { isOpen = false }
	local entries = {}
	local folderConnections = {}
	local openToken = 0

	local frame = Instance.new("Frame")
	frame.BackgroundColor3 = PANEL
	frame.BackgroundTransparency = 0.12
	frame.BorderSizePixel = 0
	frame.Size = UDim2.fromOffset(MENU_WIDTH, WINDOW_HEIGHT)
	frame.ClipsDescendants = true
	frame.Active = true
	frame.Visible = false
	frame.Parent = gui
	addCorner(frame, 16)
	addStroke(frame, GREEN, 0, 1)
	menu.frame = frame
	addBrackets(frame)
	if ui.attachBackground then
		ui.attachBackground(frame, MENU_WIDTH, WINDOW_HEIGHT)
	end

	local menuHeader = Instance.new("Frame")
	menuHeader.BackgroundColor3 = WHITE
	menuHeader.BackgroundTransparency = 0.2
	menuHeader.BorderSizePixel = 0
	menuHeader.Size = UDim2.new(1, 0, 0, HEADER_HEIGHT)
	menuHeader.ZIndex = 2
	menuHeader.Parent = frame

	local menuGradient = Instance.new("UIGradient")
	menuGradient.Color = ColorSequence.new(PANEL, HOVER)
	table.insert(themeGradients, menuGradient)
	menuGradient.Parent = menuHeader

	local menuDot = Instance.new("Frame")
	menuDot.BackgroundColor3 = GREEN
	menuDot.BorderSizePixel = 0
	menuDot.Position = UDim2.fromOffset(0, 0)
	menuDot.Size = UDim2.new(0, 6, 1, 0)
	menuDot.ZIndex = 3
	menuDot.Parent = menuHeader
	addCorner(menuDot, 5)

	local menuTitle = Instance.new("TextLabel")
	menuTitle.BackgroundTransparency = 1
	menuTitle.BorderSizePixel = 0
	menuTitle.Position = UDim2.fromOffset(18, 0)
	menuTitle.Size = UDim2.fromOffset(120, HEADER_HEIGHT)
	menuTitle.Text = config.title
	menuTitle.TextColor3 = GREEN
	menuTitle.TextSize = 18
	menuTitle.TextXAlignment = Enum.TextXAlignment.Left
	menuTitle.ZIndex = 3
	applyFont(menuTitle)
	menuTitle.Parent = menuHeader

	local closeX = makeButton(menuHeader, "X", MENU_WIDTH - 46, 2, 36)
	closeX.TextColor3 = RED
	closeX.MouseEnter:Connect(function()
		TweenService:Create(closeX, TWEEN_FAST, { BackgroundColor3 = Color3.fromRGB(120, 30, 30) }):Play()
	end)

	local filterActive = false
	local filterButton
	local scrollTop = HEADER_HEIGHT + 8
	if config.filter then
		filterButton = makeButton(frame, config.filter.text, 8, HEADER_HEIGHT + 8, MENU_WIDTH - 16)
		scrollTop = HEADER_HEIGHT + 44
	end

	local scroll = Instance.new("ScrollingFrame")
	scroll.BackgroundTransparency = 1
	scroll.BorderSizePixel = 0
	scroll.Position = UDim2.fromOffset(8, scrollTop)
	scroll.Size = UDim2.new(1, -16, 1, -(scrollTop + 8))
	scroll.CanvasSize = UDim2.fromOffset(0, 0)
	scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scroll.ScrollBarThickness = 4
	scroll.ScrollBarImageColor3 = GREEN
	scroll.ScrollingDirection = Enum.ScrollingDirection.Y
	scroll.ZIndex = 2
	scroll.Parent = frame

	local list = Instance.new("UIListLayout")
	list.Padding = UDim.new(0, 6)
	list.SortOrder = Enum.SortOrder.LayoutOrder
	list.Parent = scroll

	local listPadding = Instance.new("UIPadding")
	listPadding.PaddingRight = UDim.new(0, 8)
	listPadding.Parent = scroll
	menu.scroll = scroll

	local function sortButtons()
		local sorted = {}
		for item, entry in pairs(entries) do
			if entry.button then
				table.insert(sorted, item)
			end
		end
		table.sort(sorted, function(a, b)
			return a.Name:lower() < b.Name:lower()
		end)
		for index, item in ipairs(sorted) do
			entries[item].button.LayoutOrder = index
		end
	end

	local sortQueued = false
	local function requestSort()
		if sortQueued then
			return
		end
		sortQueued = true
		task.defer(function()
			sortQueued = false
			sortButtons()
		end)
	end

	local function removeEntry(item)
		local entry = entries[item]
		if not entry then
			return
		end
		for _, connection in ipairs(entry.connections) do
			connection:Disconnect()
		end
		if entry.button then
			entry.button:Destroy()
		end
		entries[item] = nil
	end

	local function refresh(item)
		local entry = entries[item]
		if not entry then
			return
		end
		local show = config.shouldShow == nil or config.shouldShow(item)
		if show and filterActive and not config.filter.test(item) then
			show = false
		end
		if show and not entry.button then
			local button = makeListButton(scroll)
			button.MouseButton1Click:Connect(function()
				if item.Parent then
					teleportTo(item, config.offset)
				else
					removeEntry(item)
				end
			end)
			entry.button = button
		elseif not show and entry.button then
			entry.button:Destroy()
			entry.button = nil
		end
		if entry.button then
			entry.button.Text = config.label(item)
		end
		requestSort()
	end

	local function addEntry(item)
		if entries[item] or not item:IsA("PVInstance") then
			return
		end
		local entry = { connections = {} }
		entries[item] = entry
		table.insert(entry.connections, item:GetPropertyChangedSignal("Name"):Connect(function()
			refresh(item)
		end))
		if config.relevant then
			table.insert(entry.connections, item.DescendantAdded:Connect(function(descendant)
				if config.relevant(descendant) then
					refresh(item)
				end
			end))
			table.insert(entry.connections, item.DescendantRemoving:Connect(function(descendant)
				if config.relevant(descendant) then
					task.defer(refresh, item)
				end
			end))
		end
		refresh(item)
	end

	local watch

	local function onAdded(child, inContainer)
		if config.containerName and not inContainer and child.Name == config.containerName then
			watch(child, true)
		else
			addEntry(child)
		end
	end

	local function onRemoved(child, inContainer)
		if config.containerName and not inContainer and child.Name == config.containerName then
			for _, containerChild in ipairs(child:GetChildren()) do
				removeEntry(containerChild)
			end
		else
			removeEntry(child)
		end
	end

	function watch(folder, inContainer)
		local children = folder:GetChildren()
		local generation = openToken
		task.spawn(function()
			local started = os.clock()
			for _, child in ipairs(children) do
				if generation ~= openToken then
					return
				end
				onAdded(child, inContainer)
				if os.clock() - started > 0.004 then
					task.wait()
					started = os.clock()
				end
			end
		end)
		table.insert(folderConnections, folder.ChildAdded:Connect(function(child)
			onAdded(child, inContainer)
		end))
		table.insert(folderConnections, folder.ChildRemoved:Connect(function(child)
			onRemoved(child, inContainer)
		end))
	end

	local function clear()
		openToken = openToken + 1
		for _, connection in ipairs(folderConnections) do
			connection:Disconnect()
		end
		table.clear(folderConnections)
		local items = {}
		for item in pairs(entries) do
			table.insert(items, item)
		end
		for _, item in ipairs(items) do
			removeEntry(item)
		end
	end

	if filterButton then
		filterButton.MouseButton1Click:Connect(function()
			filterActive = not filterActive
			setButtonActive(filterButton, filterActive)
			local items = {}
			for item in pairs(entries) do
				table.insert(items, item)
			end
			for _, item in ipairs(items) do
				refresh(item)
			end
		end)
	end

	function menu.relabel()
		local items = {}
		for item in pairs(entries) do
			table.insert(items, item)
		end
		for _, item in ipairs(items) do
			refresh(item)
		end
	end

	function menu.close()
		menu.isOpen = false
		if filterButton then
			filterActive = false
			setButtonActive(filterButton, false)
		end
		frame.Visible = false
		clear()
	end

	function menu.open()
		if menu.build then
			local build = menu.build
			menu.build = nil
			build()
		end
		for _, other in ipairs(sideMenus) do
			if other ~= menu then
				other.close()
			end
		end
		clear()
		menu.isOpen = true
		if config.custom then
			return
		end
		local token = openToken
		task.spawn(function()
			local folder = workspace
			for _, name in ipairs(config.path) do
				folder = folder and folder:FindFirstChild(name)
			end
			if not folder then
				folder = waitPath(workspace, table.unpack(config.path))
			end
			if token ~= openToken or not menu.isOpen then
				return
			end
			if folder then
				watch(folder, false)
			else
				warn("Mod menu: workspace." .. table.concat(config.path, ".") .. " was not found")
			end
		end)
	end

	closeX.MouseButton1Click:Connect(menu.close)
	table.insert(sideMenus, menu)
	return menu
end

local function hasVaultDoorSound(model)
	for _, descendant in ipairs(model:GetDescendants()) do
		if descendant:IsA("Sound") and descendant.Name == "Vault Door" then
			return true
		end
	end
	return false
end

local mutatedCache = setmetatable({}, { __mode = "k" })

local function isMutated(item)
	if mutatedCache[item] then
		return true
	end
	if item:FindFirstChild("MutationEffect", true) ~= nil then
		mutatedCache[item] = true
		return true
	end
	return false
end

local itemMenu = createSideMenu({
	title = "items",
	path = { "Map", "StealableItems" },
	containerName = "Natural",
	offset = Vector3.new(0, 4, 0),
	filter = {
		text = "mutated only",
		test = isMutated,
	},
	label = function(item)
		local name = escapeRich(item.Name)
		if isMutated(item) then
			local hex = GREEN.R < 0.5 and "#000000" or "#FFFFFF"
			return name .. ' <font color="' .. hex .. '">- Mutation</font>'
		end
		return name
	end,
	relevant = function(descendant)
		return descendant.Name == "MutationEffect"
	end,
})

local safeMenu = createSideMenu({
	title = "safes",
	path = { "Map", "VaultsPositions" },
	offset = Vector3.new(0, 5, 0),
	label = function(item)
		return escapeRich(item.Name)
	end,
	shouldShow = function(item)
		return not hasVaultDoorSound(item)
	end,
	relevant = function(descendant)
		return descendant:IsA("Sound")
	end,
})

local sideMenuFollow = RunService.RenderStepped:Connect(function()
	local position = window.AbsolutePosition
	local x = position.X + window.AbsoluteSize.X + 8
	if x + MENU_WIDTH > gui.AbsoluteSize.X then
		x = math.max(0, position.X - MENU_WIDTH - 8)
	end
	for _, menu in ipairs(sideMenus) do
		local show = menu.isOpen and not minimized
		if menu.frame.Visible ~= show then
			menu.frame.Visible = show
		end
		if show then
			menu.frame.Position = UDim2.fromOffset(x, position.Y)
		end
	end
	updateBrackets()
end)

ui.itemMenuButton.MouseButton1Click:Connect(itemMenu.open)

do
	local sweepToken = 0
	ui.itemMenuButton.MouseButton1Click:Connect(function()
		sweepToken = sweepToken + 1
		local mine = sweepToken
		task.spawn(function()
			local folder = waitPath(workspace, "Map", "StealableItems")
			if not folder then
				return
			end
			local targets = {}
			local function collect(parent)
				for _, child in ipairs(parent:GetChildren()) do
					if child.Name == "Natural" then
						collect(child)
					elseif child:IsA("PVInstance") then
						table.insert(targets, child)
					end
				end
			end
			collect(folder)
			local requested = {}
			for _, item in ipairs(targets) do
				if mine ~= sweepToken or not itemMenu.isOpen then
					return
				end
				if item.Parent and not mutatedCache[item] then
					local ok, pivot = pcall(function()
						return item:GetPivot().Position
					end)
					if ok then
						local near = false
						for _, spot in ipairs(requested) do
							if (spot - pivot).Magnitude < 70 then
								near = true
								break
							end
						end
						if not near then
							table.insert(requested, pivot)
							local streamed = pcall(function()
								player:RequestStreamAroundAsync(pivot, 0.25)
							end)
							if not streamed then
								return
							end
							if item.Parent then
								isMutated(item)
							end
						end
					end
				end
			end
		end)
	end)
end
ui.safeMenuButton.MouseButton1Click:Connect(safeMenu.open)

local playerMenu = createSideMenu({ title = "players", custom = true })
do
	local buttons = {}

	local function rebuild()
		for _, button in ipairs(buttons) do
			button:Destroy()
		end
		table.clear(buttons)
		local others = {}
		for _, other in ipairs(Players:GetPlayers()) do
			if other ~= player then
				table.insert(others, other)
			end
		end
		table.sort(others, function(a, b)
			return a.Name:lower() < b.Name:lower()
		end)
		for index, other in ipairs(others) do
			local button = makeListButton(playerMenu.scroll)
			button.Text = escapeRich(other.Name)
			button.LayoutOrder = index
			button.MouseButton1Click:Connect(function()
				local character = other.Character
				if character then
					teleportTo(character, Vector3.new(0, 3, 0))
				end
			end)
			table.insert(buttons, button)
		end
	end

	ui.playerMenuButton.MouseButton1Click:Connect(function()
		playerMenu.open()
		rebuild()
	end)

	local function refreshLater()
		if playerMenu.isOpen then
			task.delay(0.2, function()
				if playerMenu.isOpen then
					rebuild()
				end
			end)
		end
	end
	local addedConnection = Players.PlayerAdded:Connect(refreshLater)
	local removingConnection = Players.PlayerRemoving:Connect(refreshLater)
	table.insert(cleanups, function()
		addedConnection:Disconnect()
		removingConnection:Disconnect()
	end)
end

local audioLevels = { bass = 0, level = 0, beat = 0, active = false, song = 0, stageOn = true, hooks = {}, theme = "black" }

do
	local BAR_WIDTH = 56
	local PERIOD = 112
	local FIELD = 1400
	local ANGLE = 40
	local SPEED = 40
	local MOVE = Vector2.new(-1, 1).Unit

	local radians = math.rad(ANGLE + 90)
	local normal = Vector2.new(math.cos(radians), math.sin(radians))
	if normal:Dot(MOVE) < 0 then
		normal = -normal
	end

	local STYLES = { "stripes", "grid", "waves", "aurora", "rain", "dots", "diamonds", "bubbles", "scan", "stars", "radar", "snow", "matrix", "fireflies", "checker", "embers", "orbit", "ripples", "spectrum", "drift", "plus", "bars", "tiles", "comets", "pixels", "sweep", "curtain", "confetti", "squares", "diagonal", "3d cubes", "3d tunnel", "3d spheres", "3d floor", "3d helix", "3d starfield", "3d waves", "3d galaxy", "3d crystals", "3d discs", "3d city", "3d snow", "3d vortex", "3d equalizer", "3d planets", "hail", "drizzle", "updraft", "traffic", "crossfire", "fog", "shards", "tumble", "twinkle", "glitter", "blocks", "streaks", "ascend", "swarm", "slant", "dust", "pillars", "shooting", "beads", "ticks", "windmill", "sidewind", "lanterns", "static", "3d asteroids", "3d warp", "3d bubbles", "3d rainfall", "3d confetti", "3d fireflies", "3d ring", "3d swarm", "3d columns", "3d debris", "3d lanterns", "3d blizzard", "3d marbles", "3d coins", "3d orbs", "3d hyperspace", "3d dust", "3d carousel", "3d cascade", "3d plates", "3d meteors", "3d halo", "3d geysers", "3d wedges", "plain" }
	local style = "plain"
	local styleIndex = 1
	local builders = {}
	local backgrounds = {}

	local function newLine(parent, transparency)
		local line = Instance.new("Frame")
		line.BackgroundColor3 = WHITE
		line.BackgroundTransparency = transparency
		line.BorderSizePixel = 0
		line.Parent = parent
		return line
	end

	local function newLayer(bg, size)
		local layer = Instance.new("Frame")
		layer.AnchorPoint = Vector2.new(0.5, 0.5)
		layer.Position = UDim2.new(0.5, 0, 0.5, 0)
		layer.Size = size or UDim2.new(1, 0, 1, 0)
		layer.BackgroundTransparency = 1
		layer.BorderSizePixel = 0
		layer.Visible = false
		layer.Parent = bg.clip
		return layer
	end

	builders.stripes = function(bg)
		local field = newLayer(bg, UDim2.fromOffset(FIELD, FIELD))
		field.Rotation = ANGLE - 90
		local bars = {}
		for index = -6, 6 do
			local bar = Instance.new("Frame")
			bar.AnchorPoint = Vector2.new(0.5, 0)
			bar.Position = UDim2.fromOffset(FIELD / 2 + index * PERIOD, 0)
			bar.Size = UDim2.fromOffset(BAR_WIDTH, FIELD)
			bar.BackgroundColor3 = WHITE
			bar.BorderSizePixel = 0
			bar.Parent = field
			table.insert(bars, bar)
		end
		local phase = 0
		local lastWidth = 0
		return field, function(dt, _, bass, beat)
			phase = (phase + SPEED * dt) % PERIOD
			field.Position = UDim2.new(0.5, normal.X * phase, 0.5, normal.Y * phase)
			local width = math.floor(BAR_WIDTH * math.min(1.85, 1 + 0.35 * bass + 0.45 * beat) / 2) * 2
			if width ~= lastWidth then
				lastWidth = width
				for _, bar in ipairs(bars) do
					bar.Size = UDim2.fromOffset(width, FIELD)
				end
			end
		end
	end

	builders.grid = function(bg)
		local layer = newLayer(bg, UDim2.fromOffset(FIELD, FIELD))
		local lines = {}
		for index = -11, 11 do
			local across = newLine(layer, 0.62)
			across.AnchorPoint = Vector2.new(0.5, 0)
			across.Position = UDim2.fromOffset(FIELD / 2 + index * 60, 0)
			across.Size = UDim2.fromOffset(2, FIELD)
			local down = newLine(layer, 0.62)
			down.AnchorPoint = Vector2.new(0, 0.5)
			down.Position = UDim2.fromOffset(0, FIELD / 2 + index * 60)
			down.Size = UDim2.fromOffset(FIELD, 2)
			table.insert(lines, { frame = across, vertical = true })
			table.insert(lines, { frame = down, vertical = false })
		end
		local phase = 0
		return layer, function(dt, _, bass, beat)
			phase = (phase + 28 * dt) % 60
			layer.Position = UDim2.new(0.5, -phase, 0.5, phase)
			local thickness = 2 + math.floor(bass * 3 + beat * 2)
			for _, entry in ipairs(lines) do
				if entry.vertical then
					entry.frame.Size = UDim2.fromOffset(thickness, FIELD)
				else
					entry.frame.Size = UDim2.fromOffset(FIELD, thickness)
				end
			end
		end
	end

	builders.waves = function(bg)
		local layer = newLayer(bg)
		local lines = {}
		for index = 1, math.ceil(bg.h / 30) + 1 do
			local line = newLine(layer, 0.5)
			line.AnchorPoint = Vector2.new(0.5, 0.5)
			line.Size = UDim2.fromOffset(bg.w + 220, 3)
			table.insert(lines, line)
		end
		return layer, function(_, clock, bass, beat)
			for index, line in ipairs(lines) do
				line.Position = UDim2.fromOffset(bg.w / 2, 15 + (index - 1) * 30 + math.sin(clock * 0.9 + index * 0.7) * (6 + 10 * beat))
				line.Rotation = math.sin(clock * 1.1 + index * 0.55) * (4 + 6 * bass)
				line.Size = UDim2.fromOffset(bg.w + 220, 2 + math.floor(bass * 3))
				line.BackgroundTransparency = 0.62 - 0.25 * (0.5 + 0.5 * math.sin(clock + index))
			end
		end
	end

	builders.aurora = function(bg)
		local layer = newLayer(bg)
		local bands = {}
		for _ = 1, 3 do
			local band = newLine(layer, 0.1)
			band.AnchorPoint = Vector2.new(0.5, 0.5)
			band.Size = UDim2.fromOffset(bg.w + 320, 240)
			local fade = Instance.new("UIGradient")
			fade.Rotation = 90
			fade.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.5, 0.8),
				NumberSequenceKeypoint.new(1, 1),
			})
			fade.Parent = band
			table.insert(bands, band)
		end
		return layer, function(_, clock, _, beat)
			for index, band in ipairs(bands) do
				band.Position = UDim2.fromOffset(
					bg.w / 2 + math.sin(clock * 0.25 + index * 2) * 160,
					bg.h / 2 + math.cos(clock * 0.2 + index * 1.7) * 110
				)
				band.Rotation = (index - 2) * 18 + math.sin(clock * 0.3 + index) * 10
				band.BackgroundTransparency = 0.12 - 0.12 * beat
			end
		end
	end

	builders.rain = function(bg)
		local layer = newLayer(bg)
		local streaks = {}
		for _ = 1, 36 do
			local streak = newLine(layer, 0.5)
			streak.AnchorPoint = Vector2.new(0.5, 0)
			streak.Rotation = 12
			table.insert(streaks, {
				frame = streak,
				x = math.random(-60, bg.w + 60),
				y = math.random(-100, bg.h),
				speed = 220 + math.random() * 220,
				length = 30 + math.random() * 50,
			})
		end
		return layer, function(dt, _, bass)
			local speedUp = 1 + bass
			for _, streak in ipairs(streaks) do
				streak.y = streak.y + streak.speed * speedUp * dt
				if streak.y > bg.h + 90 then
					streak.y = -streak.length
					streak.x = math.random(-60, bg.w + 60)
				end
				streak.frame.Position = UDim2.fromOffset(streak.x, streak.y)
				streak.frame.Size = UDim2.fromOffset(2, streak.length)
			end
		end
	end

	builders.dots = function(bg)
		local GAP = 44
		local layer = newLayer(bg, UDim2.fromOffset(bg.w + GAP * 2, bg.h + GAP * 2))
		local dots = {}
		for column = 0, math.ceil(bg.w / GAP) + 1 do
			for row = 0, math.ceil(bg.h / GAP) + 1 do
				local dot = newLine(layer, 0.45)
				dot.AnchorPoint = Vector2.new(0.5, 0.5)
				dot.Position = UDim2.fromOffset(column * GAP + GAP / 2, row * GAP + GAP / 2)
				dot.Size = UDim2.fromOffset(4, 4)
				local corner = Instance.new("UICorner")
				corner.CornerRadius = UDim.new(1, 0)
				corner.Parent = dot
				table.insert(dots, dot)
			end
		end
		local phase = 0
		local lastSize = 4
		return layer, function(dt, _, bass, beat)
			phase = (phase + 18 * dt) % GAP
			layer.Position = UDim2.new(0.5, -phase, 0.5, phase)
			local size = 4 + math.floor(bass * 3 + beat * 3)
			if size ~= lastSize then
				lastSize = size
				for _, dot in ipairs(dots) do
					dot.Size = UDim2.fromOffset(size, size)
				end
			end
		end
	end

	builders.diamonds = function(bg)
		local GAP = 74
		local layer = newLayer(bg, UDim2.fromOffset(bg.w + GAP * 2, bg.h + GAP * 2))
		local shapes = {}
		for column = 0, math.ceil(bg.w / GAP) + 1 do
			for row = 0, math.ceil(bg.h / GAP) + 1 do
				local shape = Instance.new("Frame")
				shape.AnchorPoint = Vector2.new(0.5, 0.5)
				shape.BackgroundTransparency = 1
				shape.BorderSizePixel = 0
				shape.Rotation = 45
				shape.Position = UDim2.fromOffset(column * GAP + GAP / 2, row * GAP + GAP / 2)
				shape.Size = UDim2.fromOffset(30, 30)
				shape.Parent = layer
				local stroke = Instance.new("UIStroke")
				stroke.Color = WHITE
				stroke.Thickness = 1
				stroke.Transparency = 0.55
				stroke.Parent = shape
				table.insert(shapes, { shape = shape, stroke = stroke })
			end
		end
		local phase = 0
		local lastTransparency = -1
		return layer, function(dt, clock, bass, beat)
			phase = (phase + 14 * dt) % GAP
			layer.Position = UDim2.new(0.5, phase, 0.5, phase)
			local transparency = math.floor((0.6 - 0.3 * beat - 0.1 * bass) * 10 + 0.5) / 10
			if transparency ~= lastTransparency then
				lastTransparency = transparency
				for _, entry in ipairs(shapes) do
					entry.stroke.Transparency = transparency
				end
			end
		end
	end

	builders.bubbles = function(bg)
		local layer = newLayer(bg)
		local bubbles = {}
		for index = 1, 22 do
			local depth = math.random()
			local size = math.floor(10 + depth * 44)
			local bubble = Instance.new("Frame")
			bubble.AnchorPoint = Vector2.new(0.5, 0.5)
			bubble.BackgroundColor3 = WHITE
			bubble.BackgroundTransparency = 0.93 - depth * 0.04
			bubble.BorderSizePixel = 0
			bubble.Size = UDim2.fromOffset(size, size)
			bubble.Parent = layer
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(1, 0)
			corner.Parent = bubble
			local stroke = Instance.new("UIStroke")
			stroke.Color = WHITE
			stroke.Thickness = 1 + depth
			stroke.Transparency = 0.7 - depth * 0.25
			stroke.Parent = bubble
			local shine = Instance.new("Frame")
			shine.BackgroundColor3 = WHITE
			shine.BackgroundTransparency = 0.4
			shine.BorderSizePixel = 0
			shine.Position = UDim2.fromScale(0.2, 0.17)
			shine.Size = UDim2.fromScale(0.22, 0.22)
			shine.Parent = bubble
			local shineCorner = Instance.new("UICorner")
			shineCorner.CornerRadius = UDim.new(1, 0)
			shineCorner.Parent = shine
			table.insert(bubbles, {
				frame = bubble,
				stroke = stroke,
				x = math.random(0, bg.w),
				y = math.random(0, bg.h),
				speed = 14 + depth * 46,
				sway = math.random() * 6,
				swayAmt = 6 + math.random() * 14,
				size = size,
				base = stroke.Transparency,
			})
		end
		return layer, function(dt, clock, bass, beat)
			for _, bubble in ipairs(bubbles) do
				bubble.y = bubble.y - bubble.speed * (1 + bass * 0.8) * dt
				if bubble.y < -bubble.size then
					bubble.y = bg.h + bubble.size
					bubble.x = math.random(0, bg.w)
				end
				local squash = 1 + math.sin(clock * 2 + bubble.sway) * 0.05 + beat * 0.08
				bubble.frame.Position = UDim2.fromOffset(bubble.x + math.sin(clock * 0.8 + bubble.sway) * bubble.swayAmt, bubble.y)
				bubble.frame.Size = UDim2.fromOffset(bubble.size * squash, bubble.size / squash)
				bubble.stroke.Transparency = math.clamp(bubble.base - beat * 0.25, 0, 1)
			end
		end
	end

	builders.radar = function(bg)
		local layer = newLayer(bg)
		local radius = math.max(bg.w, bg.h) * 0.8
		local rings = {}
		for index = 1, 4 do
			local ring = Instance.new("Frame")
			ring.AnchorPoint = Vector2.new(0.5, 0.5)
			ring.Position = UDim2.fromScale(0.5, 0.5)
			ring.BackgroundTransparency = 1
			ring.BorderSizePixel = 0
			ring.Parent = layer
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(1, 0)
			corner.Parent = ring
			local stroke = Instance.new("UIStroke")
			stroke.Color = WHITE
			stroke.Thickness = 2
			stroke.Parent = ring
			table.insert(rings, { frame = ring, stroke = stroke, offset = (index - 1) / 4 })
		end
		local sweep = Instance.new("Frame")
		sweep.AnchorPoint = Vector2.new(0.5, 1)
		sweep.Position = UDim2.fromScale(0.5, 0.5)
		sweep.Size = UDim2.fromOffset(3, radius)
		sweep.BackgroundColor3 = WHITE
		sweep.BorderSizePixel = 0
		sweep.Parent = layer
		local fade = Instance.new("UIGradient")
		fade.Rotation = 90
		fade.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.3),
			NumberSequenceKeypoint.new(1, 1),
		})
		fade.Parent = sweep
		local cross = Instance.new("Frame")
		cross.AnchorPoint = Vector2.new(0.5, 0.5)
		cross.Position = UDim2.fromScale(0.5, 0.5)
		cross.Size = UDim2.new(1, 0, 0, 1)
		cross.BackgroundColor3 = WHITE
		cross.BackgroundTransparency = 0.8
		cross.BorderSizePixel = 0
		cross.Parent = layer
		local upright = newLine(layer, 0.8)
		upright.AnchorPoint = Vector2.new(0.5, 0.5)
		upright.Position = UDim2.fromScale(0.5, 0.5)
		upright.Size = UDim2.new(0, 1, 1, 0)
		return layer, function(_, clock, bass, beat)
			for _, ring in ipairs(rings) do
				local progress = (clock * (0.18 + 0.1 * bass) + ring.offset) % 1
				local size = radius * 2 * progress
				ring.frame.Size = UDim2.fromOffset(size, size)
				ring.stroke.Transparency = math.clamp(0.45 + progress * 0.55 - beat * 0.2, 0, 1)
			end
			sweep.Rotation = (clock * 70) % 360
		end
	end

	builders.snow = function(bg)
		local layer = newLayer(bg)
		local flakes = {}
		for _ = 1, 44 do
			local depth = math.random()
			local size = math.floor(2 + depth * 5)
			local flake = newLine(layer, 0.25 + (1 - depth) * 0.4)
			flake.AnchorPoint = Vector2.new(0.5, 0.5)
			flake.Size = UDim2.fromOffset(size, size)
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(1, 0)
			corner.Parent = flake
			table.insert(flakes, {
				frame = flake,
				x = math.random(0, bg.w),
				y = math.random(0, bg.h),
				speed = 18 + depth * 40,
				sway = math.random() * 6,
				swayAmt = 4 + math.random() * 10,
			})
		end
		return layer, function(dt, clock, bass)
			for _, flake in ipairs(flakes) do
				flake.y = flake.y + flake.speed * (1 + bass) * dt
				if flake.y > bg.h + 10 then
					flake.y = -10
					flake.x = math.random(0, bg.w)
				end
				flake.frame.Position = UDim2.fromOffset(flake.x + math.sin(clock * 0.9 + flake.sway) * flake.swayAmt, flake.y)
			end
		end
	end

	builders.matrix = function(bg)
		local layer = newLayer(bg)
		local columns = {}
		for column = 0, math.floor(bg.w / 18) do
			local length = math.random(30, 90)
			local streak = newLine(layer, 0.35)
			streak.Position = UDim2.fromOffset(column * 18 + 8, 0)
			streak.Size = UDim2.fromOffset(2, length)
			local fade = Instance.new("UIGradient")
			fade.Rotation = 90
			fade.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(1, 0.1),
			})
			fade.Parent = streak
			table.insert(columns, {
				frame = streak,
				y = math.random(-100, bg.h),
				speed = 70 + math.random() * 150,
				length = length,
			})
		end
		return layer, function(dt, _, bass)
			for _, column in ipairs(columns) do
				column.y = column.y + column.speed * (1 + bass * 0.8) * dt
				if column.y > bg.h then
					column.y = -column.length - math.random(0, 80)
				end
				column.frame.Position = UDim2.fromOffset(column.frame.Position.X.Offset, column.y)
			end
		end
	end

	builders.fireflies = function(bg)
		local layer = newLayer(bg)
		local flies = {}
		for _ = 1, 20 do
			local fly = newLine(layer, 0.1)
			fly.AnchorPoint = Vector2.new(0.5, 0.5)
			fly.Size = UDim2.fromOffset(4, 4)
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(1, 0)
			corner.Parent = fly
			local glow = Instance.new("UIStroke")
			glow.Color = WHITE
			glow.Thickness = 5
			glow.Transparency = 0.8
			glow.Parent = fly
			table.insert(flies, {
				frame = fly,
				glow = glow,
				x = math.random(20, bg.w - 20),
				y = math.random(20, bg.h - 20),
				fx = 0.2 + math.random() * 0.5,
				fy = 0.2 + math.random() * 0.5,
				phase = math.random() * 10,
				range = 20 + math.random() * 40,
			})
		end
		return layer, function(_, clock, _, beat)
			for _, fly in ipairs(flies) do
				fly.frame.Position = UDim2.fromOffset(
					fly.x + math.sin(clock * fly.fx + fly.phase) * fly.range,
					fly.y + math.cos(clock * fly.fy + fly.phase * 1.3) * fly.range * 0.7
				)
				local pulse = 0.5 + 0.5 * math.sin(clock * 1.6 + fly.phase)
				fly.frame.BackgroundTransparency = math.clamp(0.7 - pulse * 0.6 - beat * 0.2, 0, 1)
				fly.glow.Transparency = math.clamp(0.9 - pulse * 0.25 - beat * 0.2, 0, 1)
			end
		end
	end

	builders.checker = function(bg)
		local TILE = 44
		local layer = newLayer(bg, UDim2.fromOffset(bg.w + TILE * 4, bg.h + TILE * 4))
		local tiles = {}
		for column = 0, math.ceil((bg.w + TILE * 4) / TILE) do
			for row = 0, math.ceil((bg.h + TILE * 4) / TILE) do
				if (column + row) % 2 == 0 then
					local tile = newLine(layer, 0.93)
					tile.Position = UDim2.fromOffset(column * TILE, row * TILE)
					tile.Size = UDim2.fromOffset(TILE, TILE)
					table.insert(tiles, tile)
				end
			end
		end
		local phase = 0
		local lastTransparency = -1
		return layer, function(dt, _, bass, beat)
			phase = (phase + 20 * dt) % (TILE * 2)
			layer.Position = UDim2.new(0.5, -phase, 0.5, phase)
			local transparency = math.floor((0.93 - 0.12 * beat - 0.05 * bass) * 50 + 0.5) / 50
			if transparency ~= lastTransparency then
				lastTransparency = transparency
				for _, tile in ipairs(tiles) do
					tile.BackgroundTransparency = transparency
				end
			end
		end
	end

	builders.scan = function(bg)
		local layer = newLayer(bg)
		for row = 0, math.ceil(bg.h / 14) do
			local line = newLine(layer, 0.86)
			line.Position = UDim2.fromOffset(0, row * 14)
			line.Size = UDim2.new(1, 0, 0, 1)
		end
		local band = newLine(layer, 0.7)
		band.Size = UDim2.new(1, 0, 0, 70)
		local fade = Instance.new("UIGradient")
		fade.Rotation = 90
		fade.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(0.5, 0.2),
			NumberSequenceKeypoint.new(1, 1),
		})
		fade.Parent = band
		local y = 0
		return layer, function(dt, _, bass, beat)
			y = y + (90 + 120 * bass) * dt
			if y > bg.h + 70 then
				y = -70
			end
			band.Position = UDim2.fromOffset(0, y)
			band.BackgroundTransparency = 0.75 - 0.35 * beat
		end
	end

	builders.stars = function(bg)
		local layer = newLayer(bg)
		local stars = {}
		for _ = 1, 46 do
			local size = math.random(2, 4)
			local star = newLine(layer, 0.4)
			star.Position = UDim2.fromOffset(math.random(0, bg.w), math.random(0, bg.h))
			star.Size = UDim2.fromOffset(size, size)
			table.insert(stars, { frame = star, offset = math.random() * 10, rate = 0.8 + math.random() * 2 })
		end
		return layer, function(_, clock, _, beat)
			for _, star in ipairs(stars) do
				local twinkle = 0.5 + 0.5 * math.sin(clock * star.rate + star.offset)
				star.frame.BackgroundTransparency = math.clamp(0.8 - 0.65 * twinkle - 0.3 * beat, 0, 1)
			end
		end
	end

	builders.embers = function(bg)
		local layer = newLayer(bg)
		local embers = {}
		for _ = 1, 34 do
			local size = math.random(2, 5)
			local ember = newLine(layer, 0.3)
			ember.AnchorPoint = Vector2.new(0.5, 0.5)
			ember.Size = UDim2.fromOffset(size, size)
			ember.Rotation = 45
			table.insert(embers, {
				frame = ember,
				x = math.random(0, bg.w),
				y = math.random(0, bg.h),
				speed = 30 + math.random() * 90,
				sway = math.random() * 6,
				swayAmt = 8 + math.random() * 22,
			})
		end
		return layer, function(dt, clock, bass, beat)
			for _, ember in ipairs(embers) do
				ember.y = ember.y - ember.speed * (1 + bass) * dt
				if ember.y < -6 then
					ember.y = bg.h + 6
					ember.x = math.random(0, bg.w)
				end
				ember.frame.Position = UDim2.fromOffset(ember.x + math.sin(clock * 1.3 + ember.sway) * ember.swayAmt, ember.y)
				ember.frame.BackgroundTransparency = math.clamp(0.1 + (ember.y / bg.h) * 0.8 - beat * 0.2, 0, 1)
			end
		end
	end

	builders.orbit = function(bg)
		local layer = newLayer(bg)
		local dots = {}
		for index = 1, 3 do
			local diameter = 90 + index * 80
			local ring = Instance.new("Frame")
			ring.AnchorPoint = Vector2.new(0.5, 0.5)
			ring.Position = UDim2.fromScale(0.5, 0.5)
			ring.Size = UDim2.fromOffset(diameter, diameter)
			ring.BackgroundTransparency = 1
			ring.BorderSizePixel = 0
			ring.Parent = layer
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(1, 0)
			corner.Parent = ring
			local stroke = Instance.new("UIStroke")
			stroke.Color = WHITE
			stroke.Thickness = 1
			stroke.Transparency = 0.75
			stroke.Parent = ring
			for count = 1, index + 1 do
				local dot = newLine(layer, 0.1)
				dot.AnchorPoint = Vector2.new(0.5, 0.5)
				dot.Size = UDim2.fromOffset(8, 8)
				local round = Instance.new("UICorner")
				round.CornerRadius = UDim.new(1, 0)
				round.Parent = dot
				table.insert(dots, {
					frame = dot,
					radius = diameter / 2,
					angle = count / (index + 1) * math.pi * 2,
					speed = (index % 2 == 0 and -1 or 1) * (0.5 - index * 0.1),
				})
			end
		end
		return layer, function(_, clock, bass, beat)
			for _, dot in ipairs(dots) do
				local angle = dot.angle + clock * dot.speed * (1 + bass * 0.6)
				dot.frame.Position = UDim2.fromOffset(bg.w / 2 + math.cos(angle) * dot.radius, bg.h / 2 + math.sin(angle) * dot.radius * 0.8)
				dot.frame.BackgroundTransparency = 0.4 - beat * 0.3
			end
		end
	end

	builders.ripples = function(bg)
		local layer = newLayer(bg)
		local rings = {}
		for index = 1, 5 do
			local ring = Instance.new("Frame")
			ring.AnchorPoint = Vector2.new(0.5, 0.5)
			ring.BackgroundTransparency = 1
			ring.BorderSizePixel = 0
			ring.Parent = layer
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(1, 0)
			corner.Parent = ring
			local stroke = Instance.new("UIStroke")
			stroke.Color = WHITE
			stroke.Thickness = 2
			stroke.Parent = ring
			table.insert(rings, {
				frame = ring,
				stroke = stroke,
				age = index * 0.7,
				life = 3.5,
				x = math.random(40, bg.w - 40),
				y = math.random(40, bg.h - 40),
			})
		end
		return layer, function(dt, _, bass, beat)
			for _, ring in ipairs(rings) do
				ring.age = ring.age + dt * (1 + bass * 0.5)
				if ring.age > ring.life then
					ring.age = 0
					ring.x = math.random(40, bg.w - 40)
					ring.y = math.random(40, bg.h - 40)
				end
				local progress = ring.age / ring.life
				local size = 10 + 190 * (1 - (1 - progress) ^ 2)
				ring.frame.Position = UDim2.fromOffset(ring.x, ring.y)
				ring.frame.Size = UDim2.fromOffset(size, size)
				ring.stroke.Transparency = math.clamp(0.3 + progress * 0.7 - beat * 0.2, 0, 1)
			end
		end
	end

	builders.spectrum = function(bg)
		local COUNT = 32
		local layer = newLayer(bg)
		local columns = {}
		for index = 1, COUNT do
			local column = newLine(layer, 0.6)
			column.AnchorPoint = Vector2.new(0, 1)
			column.Position = UDim2.new((index - 1) / COUNT, 1, 1, 0)
			column.Size = UDim2.new(1 / COUNT, -2, 0, 4)
			table.insert(columns, { frame = column, shown = 4 })
		end
		return layer, function(_, clock, bass)
			local levels = audioLevels.levels
			for index, column in ipairs(columns) do
				local value
				if levels and audioLevels.active then
					value = levels[math.floor((index - 1) / COUNT * #levels) + 1] or 0
				else
					value = 0.08 + 0.05 * math.sin(clock * 1.5 + index * 0.5)
				end
				local height = math.floor(4 + value * bg.h * 0.6)
				if math.abs(height - column.shown) >= 2 then
					column.shown = height
					column.frame.Size = UDim2.new(1 / COUNT, -2, 0, height)
				end
			end
		end
	end

	builders.drift = function(bg)
		local layer = newLayer(bg)
		local bands = {}
		for index = 1, 3 do
			local band = newLine(layer, 0.85)
			band.AnchorPoint = Vector2.new(0.5, 0.5)
			band.Size = UDim2.fromOffset(bg.w * 1.8, 150)
			local fade = Instance.new("UIGradient")
			fade.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.5, 0),
				NumberSequenceKeypoint.new(1, 1),
			})
			fade.Parent = band
			table.insert(bands, { frame = band, gradient = fade, index = index })
		end
		return layer, function(_, clock, bass, beat)
			for _, band in ipairs(bands) do
				band.frame.Position = UDim2.fromOffset(bg.w / 2, bg.h / 2 + math.sin(clock * 0.3 + band.index * 2) * bg.h * 0.35)
				band.frame.Rotation = -20 + band.index * 12 + math.sin(clock * 0.2 + band.index) * 8
				band.frame.BackgroundTransparency = 0.88 - 0.1 * bass - 0.08 * beat
			end
		end
	end

	builders.plus = function(bg)
		local GAP = 64
		local layer = newLayer(bg, UDim2.fromOffset(bg.w + GAP * 2, bg.h + GAP * 2))
		for column = 0, math.ceil(bg.w / GAP) + 1 do
			for row = 0, math.ceil(bg.h / GAP) + 1 do
				local mark = Instance.new("TextLabel")
				mark.BackgroundTransparency = 1
				mark.AnchorPoint = Vector2.new(0.5, 0.5)
				mark.Position = UDim2.fromOffset(column * GAP + GAP / 2, row * GAP + GAP / 2)
				mark.Size = UDim2.fromOffset(20, 20)
				mark.Text = "+"
				mark.TextColor3 = WHITE
				mark.TextTransparency = 0.6
				mark.TextSize = 20
				mark.Font = Enum.Font.Code
				mark.Parent = layer
			end
		end
		local phase = 0
		return layer, function(dt)
			phase = (phase + 16 * dt) % GAP
			layer.Position = UDim2.new(0.5, phase, 0.5, -phase)
		end
	end

	builders.bars = function(bg)
		local COUNT = 40
		local layer = newLayer(bg)
		local bars = {}
		for index = 1, COUNT do
			local bar = newLine(layer, 0.8)
			bar.AnchorPoint = Vector2.new(0, 1)
			bar.Position = UDim2.new((index - 1) / COUNT, 1, 1, 0)
			bar.Size = UDim2.new(1 / COUNT, -2, 0, 10)
			bars[index] = { frame = bar, shown = 10 }
		end
		return layer, function(_, clock, bass)
			for index, bar in ipairs(bars) do
				local height = math.floor(20 + (math.sin(clock * 1.2 + index * 0.45) * 0.5 + 0.5) * bg.h * 0.35 * (1 + bass))
				if math.abs(height - bar.shown) >= 3 then
					bar.shown = height
					bar.frame.Size = UDim2.new(1 / COUNT, -2, 0, height)
				end
			end
		end
	end

	builders.tiles = function(bg)
		local W, H = 96, 40
		local layer = newLayer(bg, UDim2.fromOffset(bg.w + W * 2, bg.h + H * 4))
		for row = 0, math.ceil((bg.h + H * 4) / H) do
			for column = 0, math.ceil((bg.w + W * 2) / W) do
				local tile = Instance.new("Frame")
				tile.BackgroundTransparency = 1
				tile.BorderSizePixel = 0
				tile.Position = UDim2.fromOffset(column * W + (row % 2) * (W / 2), row * H)
				tile.Size = UDim2.fromOffset(W - 3, H - 3)
				tile.Parent = layer
				local stroke = Instance.new("UIStroke")
				stroke.Color = WHITE
				stroke.Thickness = 1
				stroke.Transparency = 0.8
				stroke.Parent = tile
			end
		end
		local phase = 0
		return layer, function(dt)
			phase = (phase + 12 * dt) % W
			layer.Position = UDim2.new(0.5, -phase, 0.5, 0)
		end
	end

	builders.comets = function(bg)
		local layer = newLayer(bg)
		local comets = {}
		for _ = 1, 7 do
			local streak = newLine(layer, 0.2)
			streak.AnchorPoint = Vector2.new(1, 0.5)
			streak.Rotation = 135
			streak.Size = UDim2.fromOffset(math.random(90, 160), 2)
			local fade = Instance.new("UIGradient")
			fade.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(1, 0.1),
			})
			fade.Parent = streak
			table.insert(comets, {
				frame = streak,
				x = math.random(0, bg.w + 200),
				y = math.random(-200, bg.h),
				speed = 160 + math.random() * 220,
			})
		end
		return layer, function(dt, _, bass)
			for _, comet in ipairs(comets) do
				local move = comet.speed * (1 + bass) * dt * 0.7071
				comet.x = comet.x - move
				comet.y = comet.y + move
				if comet.x < -60 or comet.y > bg.h + 60 then
					comet.x = math.random(bg.w * 0.3, bg.w + 200)
					comet.y = math.random(-200, 0)
				end
				comet.frame.Position = UDim2.fromOffset(comet.x, comet.y)
			end
		end
	end

	builders.pixels = function(bg)
		local layer = newLayer(bg)
		local list = {}
		for _ = 1, 80 do
			local pixel = newLine(layer, 1)
			pixel.Position = UDim2.fromOffset(math.random(0, math.floor(bg.w / 8)) * 8, math.random(0, math.floor(bg.h / 8)) * 8)
			pixel.Size = UDim2.fromOffset(6, 6)
			table.insert(list, pixel)
		end
		return layer, function(_, _, bass, beat)
			for _ = 1, 5 + math.floor(beat * 8) do
				local pixel = list[math.random(#list)]
				pixel.BackgroundTransparency = math.random() < 0.45 and 1 or 0.3 + 0.5 * math.random()
			end
		end
	end

	builders.sweep = function(bg)
		local layer = newLayer(bg)
		local beams = {}
		for index = 1, 2 do
			local beam = newLine(layer, 0.3)
			beam.AnchorPoint = Vector2.new(0, 0.5)
			beam.Position = UDim2.fromScale(0.5, 0.5)
			beam.Size = UDim2.fromOffset(math.max(bg.w, bg.h), 3)
			local fade = Instance.new("UIGradient")
			fade.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(1, 1),
			})
			fade.Parent = beam
			beams[index] = beam
		end
		return layer, function(_, clock, bass)
			local angle = (clock * (50 + 60 * bass)) % 360
			beams[1].Rotation = angle
			beams[2].Rotation = angle + 180
		end
	end

	builders.curtain = function(bg)
		local COUNT = 14
		local layer = newLayer(bg)
		local bands = {}
		for index = 1, COUNT do
			local band = newLine(layer, 0.9)
			band.AnchorPoint = Vector2.new(0.5, 0)
			band.Position = UDim2.fromOffset(index / (COUNT + 1) * bg.w, 0)
			band.Size = UDim2.fromOffset(bg.w / COUNT * 0.8, bg.h)
			local fade = Instance.new("UIGradient")
			fade.Rotation = 90
			fade.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.5, 0.3),
				NumberSequenceKeypoint.new(1, 1),
			})
			fade.Parent = band
			bands[index] = band
		end
		return layer, function(_, clock, _, beat)
			for index, band in ipairs(bands) do
				band.BackgroundTransparency = math.clamp(0.9 - 0.4 * (0.5 + 0.5 * math.sin(clock * 0.8 + index * 0.7)) - 0.2 * beat, 0, 1)
			end
		end
	end

	builders.confetti = function(bg)
		local layer = newLayer(bg)
		local pieces = {}
		for _ = 1, 40 do
			local piece = newLine(layer, 0.35)
			piece.AnchorPoint = Vector2.new(0.5, 0.5)
			piece.Size = UDim2.fromOffset(4, 8)
			table.insert(pieces, {
				frame = piece,
				x = math.random(0, bg.w),
				y = math.random(0, bg.h),
				speed = 40 + math.random() * 80,
				spin = (math.random() - 0.5) * 240,
				rot = math.random() * 360,
				sway = math.random() * 6,
			})
		end
		return layer, function(dt, clock, bass)
			for _, piece in ipairs(pieces) do
				piece.y = piece.y + piece.speed * (1 + bass) * dt
				piece.rot = piece.rot + piece.spin * dt
				if piece.y > bg.h + 10 then
					piece.y = -10
					piece.x = math.random(0, bg.w)
				end
				piece.frame.Position = UDim2.fromOffset(piece.x + math.sin(clock + piece.sway) * 12, piece.y)
				piece.frame.Rotation = piece.rot
			end
		end
	end

	builders.squares = function(bg)
		local layer = newLayer(bg)
		local boxes = {}
		for index = 1, 6 do
			local box = Instance.new("Frame")
			box.AnchorPoint = Vector2.new(0.5, 0.5)
			box.Position = UDim2.fromScale(0.5, 0.5)
			box.BackgroundTransparency = 1
			box.BorderSizePixel = 0
			box.Parent = layer
			local stroke = Instance.new("UIStroke")
			stroke.Color = WHITE
			stroke.Thickness = 2
			stroke.Parent = box
			boxes[index] = { frame = box, stroke = stroke, offset = index / 6 }
		end
		return layer, function(_, clock, bass, beat)
			for _, box in ipairs(boxes) do
				local progress = (clock * (0.2 + 0.1 * bass) + box.offset) % 1
				local size = 30 + progress * math.max(bg.w, bg.h) * 1.1
				box.frame.Size = UDim2.fromOffset(size, size)
				box.frame.Rotation = progress * 45
				box.stroke.Transparency = math.clamp(0.4 + progress * 0.6 - beat * 0.2, 0, 1)
			end
		end
	end

	builders.diagonal = function(bg)
		local SPACING = 26
		local layer = newLayer(bg, UDim2.fromOffset(FIELD, FIELD))
		layer.Rotation = 45
		for index = -20, 20 do
			local line = newLine(layer, 0.82)
			line.AnchorPoint = Vector2.new(0.5, 0)
			line.Position = UDim2.fromOffset(FIELD / 2 + index * SPACING, 0)
			line.Size = UDim2.fromOffset(2, FIELD)
		end
		local phase = 0
		return layer, function(dt, _, bass)
			phase = (phase + (18 + 20 * bass) * dt) % SPACING
			layer.Position = UDim2.new(0.5, phase * 0.7071, 0.5, phase * 0.7071)
		end
	end

	local function newViewport(bg, fov)
		local viewport = Instance.new("ViewportFrame")
		viewport.AnchorPoint = Vector2.new(0.5, 0.5)
		viewport.Position = UDim2.new(0.5, 0, 0.5, 0)
		viewport.Size = UDim2.new(1, 0, 1, 0)
		viewport.BackgroundTransparency = 1
		viewport.BorderSizePixel = 0
		viewport.Ambient = Color3.fromRGB(150, 150, 150)
		viewport.LightColor = Color3.fromRGB(255, 255, 255)
		viewport.LightDirection = Vector3.new(-1, -1.4, -0.8)
		viewport.Visible = false
		viewport.Parent = bg.clip
		addCorner(viewport, 16)
		local camera = Instance.new("Camera")
		camera.FieldOfView = fov or 60
		camera.CFrame = CFrame.new(0, 0, 0)
		camera.Parent = viewport
		viewport.CurrentCamera = camera
		return viewport, camera
	end

	local function newPart(parent, size, shape, neon)
		local part = Instance.new("Part")
		part.Anchored = true
		part.CanCollide = false
		part.CanQuery = false
		part.CanTouch = false
		part.CastShadow = false
		part.Material = neon and Enum.Material.Neon or Enum.Material.SmoothPlastic
		part.Size = size
		part.Color = GREEN
		if shape then
			part.Shape = shape
		end
		part.Parent = parent
		return part
	end

	local function themeParts(list)
		table.insert(audioLevels.hooks, function()
			for _, entry in ipairs(list) do
				entry.part.Color = entry.alt and DARK_GREEN or GREEN
			end
		end)
	end

	builders["3d cubes"] = function(bg)
		local viewport, camera = newViewport(bg, 60)
		local aspect = bg.w / bg.h
		local list = {}
		for index = 1, 16 do
			local depth = 18 + math.random() * 40
			local half = depth * 0.577
			local size = 1.4 + math.random() * 2.4
			local part = newPart(viewport, Vector3.new(size, size, size))
			part.Transparency = 0.2
			local alt = index % 2 == 0
			part.Color = alt and DARK_GREEN or GREEN
			table.insert(list, {
				part = part,
				alt = alt,
				pos = Vector3.new((math.random() * 2 - 1) * half * aspect, (math.random() * 2 - 1) * half, -depth),
				spin = Vector3.new(math.random() * 0.8 + 0.2, math.random() * 0.8 + 0.2, math.random() * 0.4),
				phase = math.random() * 6,
				size = size,
			})
		end
		themeParts(list)
		return viewport, function(_, clock, bass, beat)
			camera.CFrame = CFrame.Angles(math.sin(clock * 0.2) * 0.06, math.cos(clock * 0.17) * 0.06, 0)
			for _, entry in ipairs(list) do
				local pos = entry.pos + Vector3.new(0, math.sin(clock * 0.6 + entry.phase) * 0.8, 0)
				entry.part.CFrame = CFrame.new(pos) * CFrame.Angles(entry.spin.X * clock, entry.spin.Y * clock, entry.spin.Z * clock)
				local scale = entry.size * (1 + 0.25 * beat + 0.1 * bass)
				entry.part.Size = Vector3.new(scale, scale, scale)
			end
		end
	end

	builders["3d tunnel"] = function(bg)
		local viewport = newViewport(bg, 70)
		local RING_COUNT = 10
		local SPACING = 9
		local RADIUS = 6
		local rings = {}
		local list = {}
		for index = 1, RING_COUNT do
			local ring = { z = -index * SPACING, bars = {} }
			for side = 1, 4 do
				local horizontal = side <= 2
				local bar = newPart(viewport, horizontal and Vector3.new(RADIUS * 2 + 0.6, 0.6, 0.6) or Vector3.new(0.6, RADIUS * 2 + 0.6, 0.6), nil, true)
				local alt = index % 2 == 0
				bar.Color = alt and DARK_GREEN or GREEN
				table.insert(list, { part = bar, alt = alt })
				local offset = horizontal and Vector3.new(0, (side == 1 and 1 or -1) * RADIUS, 0) or Vector3.new((side == 3 and 1 or -1) * RADIUS, 0, 0)
				table.insert(ring.bars, { part = bar, offset = offset })
			end
			table.insert(rings, ring)
		end
		themeParts(list)
		return viewport, function(dt, clock, bass, beat)
			local speed = 14 * (1 + bass * 0.8 + beat * 0.5)
			for index, ring in ipairs(rings) do
				ring.z = ring.z + speed * dt
				if ring.z > -3 then
					ring.z = ring.z - RING_COUNT * SPACING
				end
				local base = CFrame.new(0, 0, ring.z) * CFrame.Angles(0, 0, clock * 0.35 + index * 0.18)
				local fade = math.clamp(-ring.z / (RING_COUNT * SPACING), 0, 1)
				for _, bar in ipairs(ring.bars) do
					bar.part.CFrame = base * CFrame.new(bar.offset)
					bar.part.Transparency = 0.1 + fade * 0.85
				end
			end
		end
	end

	builders["3d spheres"] = function(bg)
		local viewport, camera = newViewport(bg, 60)
		local aspect = bg.w / bg.h
		local list = {}
		for index = 1, 13 do
			local depth = 16 + math.random() * 34
			local half = depth * 0.577
			local size = 1.5 + math.random() * 3
			local part = newPart(viewport, Vector3.new(size, size, size), Enum.PartType.Ball)
			part.Transparency = 0.15
			local alt = index % 3 == 0
			part.Color = alt and DARK_GREEN or GREEN
			table.insert(list, {
				part = part,
				alt = alt,
				pos = Vector3.new((math.random() * 2 - 1) * half * aspect, (math.random() * 2 - 1) * half, -depth),
				phase = math.random() * 6,
				size = size,
			})
		end
		themeParts(list)
		return viewport, function(_, clock, bass, beat)
			camera.CFrame = CFrame.Angles(math.sin(clock * 0.2) * 0.06, math.cos(clock * 0.17) * 0.06, 0)
			for _, entry in ipairs(list) do
				local pos = entry.pos + Vector3.new(math.sin(clock * 0.4 + entry.phase) * 1.4, math.cos(clock * 0.5 + entry.phase) * 1.2, 0)
				entry.part.Position = pos
				local scale = entry.size * (1 + 0.35 * bass + 0.2 * beat)
				entry.part.Size = Vector3.new(scale, scale, scale)
			end
		end
	end

	builders["3d floor"] = function(bg)
		local viewport, camera = newViewport(bg, 70)
		camera.CFrame = CFrame.lookAt(Vector3.new(0, 5, 0), Vector3.new(0, 1, -30))
		local list = {}
		for column = -6, 6 do
			local line = newPart(viewport, Vector3.new(0.25, 0.25, 180), nil, true)
			line.Position = Vector3.new(column * 8, 0, -95)
			line.Transparency = 0.3
			table.insert(list, { part = line, alt = false })
		end
		local across = {}
		for index = 1, 16 do
			local line = newPart(viewport, Vector3.new(110, 0.25, 0.25), nil, true)
			table.insert(list, { part = line, alt = true })
			line.Color = DARK_GREEN
			table.insert(across, { part = line, z = -index * 10 })
		end
		themeParts(list)
		return viewport, function(dt, _, bass, beat)
			local speed = 16 * (1 + bass)
			for _, line in ipairs(across) do
				line.z = line.z + speed * dt
				if line.z > -2 then
					line.z = line.z - 160
				end
				line.part.Position = Vector3.new(0, 0, line.z)
				line.part.Transparency = math.clamp(0.05 + (-line.z / 160) * 0.9 - beat * 0.2, 0, 1)
			end
		end
	end

	builders["3d helix"] = function(bg)
		local viewport = newViewport(bg, 60)
		local COUNT = 26
		local list = {}
		local items = {}
		for strand = 0, 1 do
			for index = 1, COUNT do
				local part = newPart(viewport, Vector3.new(1.4, 1.4, 1.4))
				part.Transparency = 0.1
				local alt = strand == 1
				part.Color = alt and DARK_GREEN or GREEN
				table.insert(list, { part = part, alt = alt })
				table.insert(items, { part = part, strand = strand, t = index / COUNT })
			end
		end
		themeParts(list)
		return viewport, function(_, clock, bass, beat)
			for _, item in ipairs(items) do
				local angle = item.t * math.pi * 4 + clock * 1.2 + item.strand * math.pi
				local radius = 6 + bass * 2
				item.part.CFrame = CFrame.new(math.cos(angle) * radius, (item.t - 0.5) * 30, -36 + math.sin(angle) * radius)
					* CFrame.Angles(clock, clock * 0.7, 0)
				local size = 1.4 + beat * 0.8
				item.part.Size = Vector3.new(size, size, size)
			end
		end
	end

	builders["3d starfield"] = function(bg)
		local viewport = newViewport(bg, 70)
		local list = {}
		local stars = {}
		for index = 1, 70 do
			local part = newPart(viewport, Vector3.new(0.18, 0.18, 0.8), nil, true)
			local alt = index % 3 == 0
			part.Color = alt and DARK_GREEN or GREEN
			table.insert(list, { part = part, alt = alt })
			local z = -math.random() * 80
			table.insert(stars, { part = part, z = z, x = (math.random() * 2 - 1) * 34, y = (math.random() * 2 - 1) * 20 })
		end
		themeParts(list)
		return viewport, function(dt, _, bass, beat)
			local speed = 22 * (1 + bass * 1.2 + beat)
			for _, star in ipairs(stars) do
				star.z = star.z + speed * dt
				if star.z > -1 then
					star.z = -80
					star.x = (math.random() * 2 - 1) * 34
					star.y = (math.random() * 2 - 1) * 20
				end
				star.part.Size = Vector3.new(0.18, 0.18, 0.5 + speed * 0.05)
				star.part.Position = Vector3.new(star.x, star.y, star.z)
				star.part.Transparency = math.clamp(0.05 + (-star.z / 80) * 0.9, 0, 1)
			end
		end
	end

	builders["3d waves"] = function(bg)
		local viewport, camera = newViewport(bg, 65)
		camera.CFrame = CFrame.lookAt(Vector3.new(0, 14, 0), Vector3.new(0, 0, -32))
		local list = {}
		local cells = {}
		for column = -6, 6 do
			for row = 1, 8 do
				local part = newPart(viewport, Vector3.new(3.4, 0.9, 3.4))
				local alt = (column + row) % 2 == 0
				part.Color = alt and DARK_GREEN or GREEN
				table.insert(list, { part = part, alt = alt })
				table.insert(cells, { part = part, x = column * 5, z = -10 - row * 5 })
			end
		end
		themeParts(list)
		return viewport, function(_, clock, bass, beat)
			for _, cell in ipairs(cells) do
				local height = math.sin(cell.x * 0.35 + clock * 1.6) * 1.8 + math.cos(cell.z * 0.4 + clock * 1.1) * 1.4 + bass * 2
				cell.part.Position = Vector3.new(cell.x, height, cell.z)
				cell.part.Transparency = math.clamp(0.1 + (-cell.z / 60) * 0.5 - beat * 0.1, 0, 1)
			end
		end
	end

	builders["3d galaxy"] = function(bg)
		local viewport = newViewport(bg, 60)
		local list = {}
		local dots = {}
		for index = 1, 80 do
			local size = 0.5 + math.random() * 0.6
			local part = newPart(viewport, Vector3.new(size, size, size), Enum.PartType.Ball, true)
			local alt = index % 3 == 0
			part.Color = alt and DARK_GREEN or GREEN
			table.insert(list, { part = part, alt = alt })
			table.insert(dots, { part = part, t = index / 80, arm = index % 3, jitter = (math.random() - 0.5) * 2 })
		end
		themeParts(list)
		return viewport, function(_, clock, bass, beat)
			for _, dot in ipairs(dots) do
				local radius = 3 + dot.t * 22
				local angle = dot.arm * 2.094 + dot.t * 5 + clock * 0.35
				dot.part.Position = Vector3.new(math.cos(angle) * radius, math.sin(angle) * radius * 0.35 + dot.jitter, -48 + math.sin(angle) * radius * 0.6)
				dot.part.Transparency = 0.1 + dot.t * 0.5 - beat * 0.1
			end
		end
	end

	builders["3d crystals"] = function(bg)
		local viewport, camera = newViewport(bg, 60)
		local aspect = bg.w / bg.h
		local list = {}
		local crystals = {}
		for index = 1, 14 do
			local depth = 16 + math.random() * 30
			local half = depth * 0.577
			local length = 2 + math.random() * 3
			local part = newPart(viewport, Vector3.new(0.7, length, 0.7))
			part.Transparency = 0.15
			local alt = index % 2 == 0
			part.Color = alt and DARK_GREEN or GREEN
			table.insert(list, { part = part, alt = alt })
			table.insert(crystals, {
				part = part,
				base = Vector3.new((math.random() * 2 - 1) * half * aspect, (math.random() * 2 - 1) * half, -depth),
				phase = math.random() * 6,
				spin = 0.3 + math.random() * 0.6,
				length = length,
			})
		end
		themeParts(list)
		return viewport, function(_, clock, bass, beat)
			camera.CFrame = CFrame.Angles(math.sin(clock * 0.2) * 0.06, math.cos(clock * 0.17) * 0.06, 0)
			for _, crystal in ipairs(crystals) do
				crystal.part.CFrame = CFrame.new(crystal.base + Vector3.new(0, math.sin(clock * 0.7 + crystal.phase), 0))
					* CFrame.Angles(clock * crystal.spin, clock * crystal.spin * 0.6, clock * 0.3)
				crystal.part.Size = Vector3.new(0.7 + beat * 0.3, crystal.length * (1 + bass * 0.3), 0.7 + beat * 0.3)
			end
		end
	end

	builders["3d discs"] = function(bg)
		local viewport = newViewport(bg, 60)
		local list = {}
		local discs = {}
		for index = 1, 8 do
			local diameter = 6 + index * 2.5
			local part = newPart(viewport, Vector3.new(0.35, diameter, diameter), Enum.PartType.Cylinder, true)
			part.Transparency = 0.45
			local alt = index % 2 == 0
			part.Color = alt and DARK_GREEN or GREEN
			table.insert(list, { part = part, alt = alt })
			table.insert(discs, { part = part, z = -12 - index * 5, spin = (index % 2 == 0 and -1 or 1) * (0.3 + index * 0.05), tilt = index * 0.4 })
		end
		themeParts(list)
		return viewport, function(_, clock, bass, beat)
			for _, disc in ipairs(discs) do
				disc.part.CFrame = CFrame.new(0, 0, disc.z) * CFrame.Angles(clock * disc.spin, disc.tilt + clock * 0.2, 0)
				disc.part.Transparency = 0.45 - beat * 0.2
			end
		end
	end

	builders["3d city"] = function(bg)
		local viewport, camera = newViewport(bg, 70)
		camera.CFrame = CFrame.new(0, 2, 0)
		local list = {}
		local towers = {}
		for index = 1, 28 do
			local side = index % 2 == 0 and 1 or -1
			local height = 6 + math.random() * 20
			local part = newPart(viewport, Vector3.new(5, height, 5))
			local alt = index % 3 == 0
			part.Color = alt and DARK_GREEN or GREEN
			table.insert(list, { part = part, alt = alt })
			table.insert(towers, { part = part, x = side * (9 + math.random() * 10), z = -index * 5, height = height })
		end
		themeParts(list)
		return viewport, function(dt, _, bass, beat)
			local speed = 14 * (1 + bass * 0.8)
			for _, tower in ipairs(towers) do
				tower.z = tower.z + speed * dt
				if tower.z > -2 then
					tower.z = tower.z - 140
				end
				tower.part.Position = Vector3.new(tower.x, tower.height / 2 - 3, tower.z)
				tower.part.Transparency = math.clamp(0.05 + (-tower.z / 140) * 0.9 - beat * 0.1, 0, 1)
			end
		end
	end

	builders["3d snow"] = function(bg)
		local viewport = newViewport(bg, 60)
		local aspect = bg.w / bg.h
		local list = {}
		local flakes = {}
		for index = 1, 46 do
			local depth = 14 + math.random() * 36
			local half = depth * 0.577
			local size = 0.3 + math.random() * 0.6
			local part = newPart(viewport, Vector3.new(size, size, size), Enum.PartType.Ball)
			table.insert(list, { part = part, alt = false })
			table.insert(flakes, {
				part = part,
				x = (math.random() * 2 - 1) * half * aspect,
				y = (math.random() * 2 - 1) * half,
				z = -depth,
				half = half,
				speed = 1.5 + math.random() * 3,
				phase = math.random() * 6,
			})
		end
		themeParts(list)
		return viewport, function(dt, clock, bass)
			for _, flake in ipairs(flakes) do
				flake.y = flake.y - flake.speed * (1 + bass) * dt
				if flake.y < -flake.half then
					flake.y = flake.half
				end
				flake.part.Position = Vector3.new(flake.x + math.sin(clock * 0.8 + flake.phase) * 1.2, flake.y, flake.z)
			end
		end
	end

	builders["3d vortex"] = function(bg)
		local viewport = newViewport(bg, 70)
		local list = {}
		local bits = {}
		for index = 1, 64 do
			local part = newPart(viewport, Vector3.new(0.6, 0.6, 0.6), nil, true)
			local alt = index % 2 == 0
			part.Color = alt and DARK_GREEN or GREEN
			table.insert(list, { part = part, alt = alt })
			table.insert(bits, { part = part, offset = index * 1.3 })
		end
		themeParts(list)
		return viewport, function(_, clock, bass, beat)
			for _, bit in ipairs(bits) do
				local z = -((bit.offset + clock * 12 * (1 + bass)) % 83) - 1
				local angle = z * 0.22 + clock
				local radius = 7 + math.sin(clock + bit.offset) * 1.5
				bit.part.CFrame = CFrame.new(math.cos(angle) * radius, math.sin(angle) * radius, z) * CFrame.Angles(clock, clock * 0.8, 0)
				bit.part.Transparency = math.clamp(0.05 + (-z / 83) * 0.9, 0, 1)
			end
		end
	end

	builders["3d equalizer"] = function(bg)
		local viewport, camera = newViewport(bg, 60)
		camera.CFrame = CFrame.lookAt(Vector3.new(0, 7, 0), Vector3.new(0, 1, -30))
		local COUNT = 24
		local list = {}
		local columns = {}
		for index = 1, COUNT do
			local part = newPart(viewport, Vector3.new(1.6, 1, 1.6))
			local alt = index % 2 == 0
			part.Color = alt and DARK_GREEN or GREEN
			table.insert(list, { part = part, alt = alt })
			table.insert(columns, { part = part, x = (index - (COUNT + 1) / 2) * 2.2, shown = 1 })
		end
		themeParts(list)
		return viewport, function(_, clock)
			local levels = audioLevels.levels
			for index, column in ipairs(columns) do
				local value
				if levels and audioLevels.active then
					value = levels[math.floor((index - 1) / COUNT * #levels) + 1] or 0
				else
					value = 0.1 + 0.06 * math.sin(clock * 1.5 + index * 0.5)
				end
				local height = 1 + value * 14
				column.shown = column.shown + (height - column.shown) * 0.5
				column.part.Size = Vector3.new(1.6, column.shown, 1.6)
				column.part.Position = Vector3.new(column.x, column.shown / 2 - 2, -28)
			end
		end
	end

	builders["3d planets"] = function(bg)
		local viewport = newViewport(bg, 60)
		local list = {}
		local sun = newPart(viewport, Vector3.new(8, 8, 8), Enum.PartType.Ball)
		table.insert(list, { part = sun, alt = false })
		local orbits = {}
		for index = 1, 4 do
			local planet = newPart(viewport, Vector3.new(1.4 + index * 0.3, 1.4 + index * 0.3, 1.4 + index * 0.3), Enum.PartType.Ball)
			local alt = index % 2 == 1
			planet.Color = alt and DARK_GREEN or GREEN
			table.insert(list, { part = planet, alt = alt })
			local ring = newPart(viewport, Vector3.new(0.12, 2 * (6 + index * 3.2), 2 * (6 + index * 3.2)), Enum.PartType.Cylinder, true)
			ring.Transparency = 0.75
			table.insert(list, { part = ring, alt = true })
			table.insert(orbits, { part = planet, ring = ring, radius = 6 + index * 3.2, speed = 0.9 / index, phase = index * 1.7 })
		end
		themeParts(list)
		return viewport, function(_, clock, bass, beat)
			local scale = 8 * (1 + 0.1 * beat)
			sun.Size = Vector3.new(scale, scale, scale)
			sun.Position = Vector3.new(0, 0, -40)
			for _, orbit in ipairs(orbits) do
				local angle = clock * orbit.speed + orbit.phase
				orbit.part.Position = Vector3.new(math.cos(angle) * orbit.radius, math.sin(angle) * orbit.radius * 0.25, -40 + math.sin(angle) * orbit.radius * 0.8)
				orbit.ring.CFrame = CFrame.new(0, 0, -40) * CFrame.Angles(math.rad(75), 0, math.pi / 2)
			end
		end
	end

	do
		local function field(cfg)
			return function(bg)
				local layer = newLayer(bg)
				local items = {}
				local base = cfg.t or 0.5
				for index = 1, cfg.n do
					local frame = newLine(layer, base)
					frame.AnchorPoint = Vector2.new(0.5, 0.5)
					local width = cfg.w * (0.7 + math.random() * 0.6)
					local height = cfg.h and cfg.h * (0.7 + math.random() * 0.6) or width
					frame.Size = UDim2.fromOffset(math.max(1, width), math.max(1, height))
					frame.Rotation = cfg.rot or 0
					local speed = 0.6 + math.random() * 0.8
					local vx = (cfg.vx or 0) * speed
					if cfg.flip and index % 2 == 0 then
						vx = -vx
					end
					items[index] = {
						frame = frame,
						x = math.random() * bg.w,
						y = math.random() * bg.h,
						vx = vx,
						vy = (cfg.vy or 0) * speed,
						phase = math.random() * 6.28,
						spin = (cfg.spin or 0) * (math.random() < 0.5 and -1 or 1),
						margin = math.max(width, height),
					}
				end
				local freq = cfg.swayF or 1
				return layer, function(dt, clock)
					for _, item in ipairs(items) do
						item.x = item.x + item.vx * dt
						item.y = item.y + item.vy * dt
						if item.x > bg.w + item.margin then
							item.x = -item.margin
						elseif item.x < -item.margin then
							item.x = bg.w + item.margin
						end
						if item.y > bg.h + item.margin then
							item.y = -item.margin
						elseif item.y < -item.margin then
							item.y = bg.h + item.margin
						end
						local ox = cfg.sway and math.sin(clock * freq + item.phase) * cfg.sway or 0
						local oy = cfg.bob and math.cos(clock * freq * 0.8 + item.phase) * cfg.bob or 0
						item.frame.Position = UDim2.fromOffset(item.x + ox, item.y + oy)
						if item.spin ~= 0 then
							item.frame.Rotation = (clock * item.spin + item.phase * 57) % 360
						end
						if cfg.twinkle then
							item.frame.BackgroundTransparency = math.clamp(base + 0.45 * math.sin(clock * cfg.twinkle + item.phase), 0, 1)
						end
					end
				end
			end
		end
		local flat = {
			["hail"] = { n = 40, w = 3, h = 10, vy = 260 },
			["drizzle"] = { n = 30, w = 1, h = 18, vy = 180, vx = -40, rot = 12 },
			["updraft"] = { n = 30, w = 3, vy = -50, sway = 10 },
			["traffic"] = { n = 14, w = 60, h = 3, vx = 220 },
			["crossfire"] = { n = 16, w = 40, h = 2, vx = 200, flip = true },
			["fog"] = { n = 10, w = 140, t = 0.93, vx = 12 },
			["shards"] = { n = 18, w = 4, h = 34, spin = 60, vy = 20 },
			["tumble"] = { n = 16, w = 16, spin = 90, vy = 40, t = 0.7 },
			["twinkle"] = { n = 50, w = 3, twinkle = 3 },
			["glitter"] = { n = 60, w = 2, twinkle = 9 },
			["blocks"] = { n = 12, w = 40, t = 0.88, sway = 14, bob = 14, swayF = 0.6 },
			["streaks"] = { n = 12, w = 120, h = 1, vx = 400 },
			["ascend"] = { n = 20, w = 2, h = 30, vy = -140 },
			["swarm"] = { n = 30, w = 5, sway = 40, bob = 30, swayF = 1.4 },
			["slant"] = { n = 20, w = 80, h = 2, rot = 45, vx = 90, vy = 90 },
			["dust"] = { n = 45, w = 2, vx = 8, vy = -6, sway = 6 },
			["pillars"] = { n = 10, w = 20, h = 420, t = 0.92, vx = 16 },
			["shooting"] = { n = 6, w = 90, h = 2, rot = 30, vx = 520, vy = 300 },
			["beads"] = { n = 24, w = 8, vy = 60, sway = 12 },
			["ticks"] = { n = 30, w = 1, h = 8, twinkle = 4, spin = 30 },
			["windmill"] = { n = 8, w = 70, h = 3, spin = 45, t = 0.7 },
			["sidewind"] = { n = 26, w = 10, h = 2, vx = -150, bob = 8 },
			["lanterns"] = { n = 12, w = 14, h = 20, vy = -24, sway = 8, t = 0.75 },
			["static"] = { n = 70, w = 2, h = 1, twinkle = 14 },
		}
		for name, cfg in pairs(flat) do
			builders[name] = field(cfg)
		end

		local SHAPES = { Ball = Enum.PartType.Ball, Cylinder = Enum.PartType.Cylinder }
		local function field3d(cfg)
			return function(bg)
				local viewport = newViewport(bg, 60)
				local aspect = bg.w / bg.h
				local list = {}
				for index = 1, cfg.n do
					local depth = 14 + math.random() * 44
					local half = depth * 0.577
					local scale = cfg.min + math.random() * (cfg.max - cfg.min)
					local dims = cfg.dims and cfg.dims * scale or Vector3.new(scale, scale, scale)
					local part
					if cfg.shape == "Wedge" then
						part = Instance.new("WedgePart")
						part.Anchored = true
						part.CanCollide = false
						part.CanQuery = false
						part.CanTouch = false
						part.CastShadow = false
						part.Material = Enum.Material.SmoothPlastic
						part.Size = dims
						part.Parent = viewport
					else
						part = newPart(viewport, dims, SHAPES[cfg.shape], cfg.neon)
					end
					part.Transparency = cfg.tr or 0.15
					local alt = index % 2 == 0
					part.Color = alt and DARK_GREEN or GREEN
					list[index] = {
						part = part,
						alt = alt,
						x = (math.random() * 2 - 1) * half * aspect,
						y = (math.random() * 2 - 1) * half,
						z = -depth,
						half = half,
						phase = math.random() * 6.28,
						spin = Vector3.new(math.random(), math.random(), math.random()) * (cfg.spin or 0),
						speed = 0.6 + math.random() * 0.8,
						radius = 4 + math.random() * 14,
					}
				end
				themeParts(list)
				local motion = cfg.motion
				local rate = cfg.v or 1
				return viewport, function(dt, clock)
					for _, entry in ipairs(list) do
						local pos
						if motion == "fly" then
							entry.z = entry.z + rate * entry.speed * dt
							if entry.z > -3 then
								entry.z = -58
							end
							pos = Vector3.new(entry.x, entry.y, entry.z)
						elseif motion == "fall" or motion == "rise" then
							local direction = motion == "fall" and -1 or 1
							entry.y = entry.y + direction * rate * entry.speed * dt
							if entry.y < -entry.half - 3 then
								entry.y = entry.half + 3
							elseif entry.y > entry.half + 3 then
								entry.y = -entry.half - 3
							end
							pos = Vector3.new(entry.x + (cfg.sway and math.sin(clock + entry.phase) * cfg.sway or 0), entry.y, entry.z)
						elseif motion == "orbit" then
							local angle = entry.phase + clock * rate * entry.speed * 0.1
							pos = Vector3.new(math.cos(angle) * entry.radius * aspect * 0.8, math.sin(angle) * entry.radius * 0.8, entry.z)
						elseif motion == "carousel" then
							local angle = entry.phase + clock * rate * 0.1
							pos = Vector3.new(math.cos(angle) * entry.radius * 1.6, entry.y * 0.4, -34 + math.sin(angle) * entry.radius)
						else
							pos = Vector3.new(entry.x, entry.y + math.sin(clock * rate * entry.speed + entry.phase) * (cfg.amp or 1.5), entry.z)
						end
						entry.part.CFrame = CFrame.new(pos) * CFrame.Angles(entry.spin.X * clock, entry.spin.Y * clock, entry.spin.Z * clock)
					end
				end
			end
		end
		local solid = {
			["3d asteroids"] = { n = 16, shape = "Block", min = 1, max = 3.5, motion = "fly", v = 14, spin = 1 },
			["3d warp"] = { n = 26, shape = "Block", min = 1, max = 1.6, dims = Vector3.new(0.15, 0.15, 5), motion = "fly", v = 60, neon = true },
			["3d bubbles"] = { n = 18, shape = "Ball", min = 1, max = 3, motion = "rise", v = 4, tr = 0.55, sway = 1 },
			["3d rainfall"] = { n = 30, shape = "Block", min = 1, max = 1.5, dims = Vector3.new(0.12, 2.4, 0.12), motion = "fall", v = 30, neon = true },
			["3d confetti"] = { n = 26, shape = "Block", min = 0.8, max = 1.4, dims = Vector3.new(1, 0.06, 1), motion = "fall", v = 6, spin = 3, sway = 1.5 },
			["3d fireflies"] = { n = 22, shape = "Ball", min = 0.3, max = 0.6, motion = "bob", v = 1.2, amp = 2, neon = true },
			["3d ring"] = { n = 20, shape = "Block", min = 0.8, max = 1.4, motion = "orbit", v = 5, spin = 1 },
			["3d swarm"] = { n = 26, shape = "Ball", min = 0.4, max = 0.9, motion = "orbit", v = 12, neon = true },
			["3d columns"] = { n = 12, shape = "Block", min = 1, max = 1.8, dims = Vector3.new(1, 14, 1), motion = "fly", v = 9 },
			["3d debris"] = { n = 20, shape = "Block", min = 0.5, max = 2, motion = "bob", v = 0.8, amp = 3, spin = 1.4 },
			["3d lanterns"] = { n = 14, shape = "Block", min = 1, max = 1.6, dims = Vector3.new(1, 1.4, 1), motion = "rise", v = 2.5, neon = true, sway = 0.8 },
			["3d blizzard"] = { n = 34, shape = "Ball", min = 0.25, max = 0.5, motion = "fall", v = 12, sway = 3 },
			["3d marbles"] = { n = 12, shape = "Ball", min = 1.6, max = 3, motion = "bob", v = 1, amp = 2.5 },
			["3d coins"] = { n = 16, shape = "Cylinder", min = 1.2, max = 2, dims = Vector3.new(0.15, 1, 1), motion = "fall", v = 7, spin = 4 },
			["3d orbs"] = { n = 9, shape = "Ball", min = 3, max = 6, motion = "bob", v = 0.5, amp = 3, neon = true, tr = 0.6 },
			["3d hyperspace"] = { n = 34, shape = "Ball", min = 0.2, max = 0.4, motion = "fly", v = 90, neon = true },
			["3d dust"] = { n = 34, shape = "Block", min = 0.2, max = 0.45, motion = "bob", v = 0.6, amp = 1.2, spin = 1 },
			["3d carousel"] = { n = 14, shape = "Block", min = 1.2, max = 2.2, motion = "carousel", v = 6, spin = 0.6 },
			["3d cascade"] = { n = 20, shape = "Block", min = 0.8, max = 1.8, motion = "fall", v = 10, spin = 2 },
			["3d plates"] = { n = 14, shape = "Block", min = 2, max = 4, dims = Vector3.new(1, 0.08, 1), motion = "bob", v = 0.7, amp = 2, spin = 0.5, tr = 0.4 },
			["3d meteors"] = { n = 12, shape = "Ball", min = 0.6, max = 1.2, motion = "fly", v = 40, neon = true },
			["3d halo"] = { n = 24, shape = "Ball", min = 0.5, max = 0.8, motion = "carousel", v = 10, neon = true },
			["3d geysers"] = { n = 26, shape = "Block", min = 0.3, max = 0.6, dims = Vector3.new(1, 3, 1), motion = "rise", v = 18, neon = true },
			["3d wedges"] = { n = 16, shape = "Wedge", min = 1.2, max = 2.6, motion = "bob", v = 0.9, amp = 2, spin = 1.2 },
		}
		for name, cfg in pairs(solid) do
			builders[name] = field3d(cfg)
		end
	end

	local function buildBackground(parent, width, height)
		local bg = { w = width, h = height, layers = {} }

		local clip = Instance.new("Frame")
		clip.Name = "Stripes"
		clip.BackgroundColor3 = BLACK
		clip.BorderSizePixel = 0
		clip.Size = UDim2.new(1, 0, 1, 0)
		clip.ClipsDescendants = true
		clip.ZIndex = 1
		clip.Parent = parent
		addCorner(clip, 16)
		bg.clip = clip

		local shade = Instance.new("Frame")
		shade.Name = "Shade"
		shade.BackgroundColor3 = Color3.fromRGB(140, 140, 140)
		shade.BorderSizePixel = 0
		shade.Size = UDim2.new(1, 0, 1, 0)
		shade.ZIndex = 1
		shade.Parent = parent
		addCorner(shade, 16)

		local shadeGradient = Instance.new("UIGradient")
		shadeGradient.Rotation = 45
		shadeGradient.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(0.35, 1),
			NumberSequenceKeypoint.new(1, 0.4),
		})
		shadeGradient.Parent = shade

		local tint = Instance.new("Frame")
		tint.Name = "Tint"
		tint.BackgroundColor3 = PANEL
		tint.BackgroundTransparency = 0.3
		tint.BorderSizePixel = 0
		tint.Size = UDim2.new(1, 0, 1, 0)
		tint.ZIndex = 1
		tint.Parent = parent
		addCorner(tint, 16)

		local updater

		function bg.setStyle(name)
			updater = nil
			for layerName, entry in pairs(bg.layers) do
				entry.layer.Visible = layerName == name
			end
			if builders[name] then
				local entry = bg.layers[name]
				if not entry then
					local layer, update = builders[name](bg)
					entry = { layer = layer, update = update }
					bg.layers[name] = entry
				end
				entry.layer.Visible = true
				updater = entry.update
			end
		end

		function bg.update(dt, clock)
			if updater then
				updater(dt, clock, 0, 0)
			end
		end

		return bg
	end

	local function attach(frame, width, height)
		local bg = buildBackground(frame, width, height)
		bg.setStyle(style)
		table.insert(backgrounds, bg)
		return bg
	end

	ui.attachBackground = attach
	attach(window, WINDOW_WIDTH, WINDOW_HEIGHT)
	for _, menu in ipairs(sideMenus) do
		attach(menu.frame, MENU_WIDTH, WINDOW_HEIGHT)
	end

	local refreshBgMenu

	local function setStyle(name)
		for index, candidate in ipairs(STYLES) do
			if candidate == name then
				styleIndex = index
				style = name
			end
		end
		for _, bg in ipairs(backgrounds) do
			bg.setStyle(style)
		end
		if refreshBgMenu then
			refreshBgMenu()
		end
	end

	local bgMenu = createSideMenu({ title = "backgrounds", custom = true })
	local bgButtons = {}
	function refreshBgMenu()
		for name, button in pairs(bgButtons) do
			setButtonActive(button, name == style)
		end
	end
	bgMenu.build = function()
	for index, name in ipairs(STYLES) do
		local button = makeButton(bgMenu.scroll, name, 0, 0)
		button.Size = UDim2.new(1, 0, 0, 28)
		button.MouseButton1Click:Connect(function()
			setStyle(name)
			showToast("background: " .. name)
		end)
		bgButtons[name] = button
	end
	ui.arrange(bgMenu, bgButtons, { "plain" }, { "2d", "3d" })
	refreshBgMenu()
	end
	ui.backgroundMenuButton.MouseButton1Click:Connect(bgMenu.open)
	audioLevels.setBackground = setStyle
	audioLevels.getBackground = function()
		return style
	end

	local DEFAULT_POSITION = window.Position
	ui.resetPosButton.MouseButton1Click:Connect(function()
		window.Position = DEFAULT_POSITION
	end)

	local clock = 0
	local pending = 0
	local smoothDt = 1 / 60
	local connection = RunService.RenderStepped:Connect(function(dt)
		pending = pending + dt
		smoothDt = smoothDt + (math.min(dt, 0.1) - smoothDt) * 0.05
		if minimized then
			pending = 0
			return
		end
		local interval = 0
		if smoothDt > 0.04 then
			interval = 0.034
		elseif string.sub(style, 1, 2) == "3d" then
			interval = 0.025
		end
		if pending < interval then
			return
		end
		local step = math.min(pending, 0.1)
		pending = 0
		if not gui.Enabled then
			return
		end
		clock = clock + step
		local bass = audioLevels.bass
		local beat = audioLevels.beat
		for index = #backgrounds, 1, -1 do
			local bg = backgrounds[index]
			local parent = bg.clip.Parent
			if not parent then
				table.remove(backgrounds, index)
			elseif parent.Visible then
				bg.update(step, clock, bass, beat)
			end
		end
	end)
	table.insert(cleanups, function()
		connection:Disconnect()
	end)
end

do
	local TOKENS = { "GREEN", "DARK_GREEN", "NOTE", "PANEL", "IDLE", "HOVER", "DARK_TEXT", "INPUT_TEXT" }
	local current = "black"
	local themeButtons = {}
	ui.rainbowHue = 0
	ui.rainbowCache = {}
	ui.makeRainbow = function(hue)
		local base = THEMES.black
		return {
			GREEN = Color3.fromHSV(hue, 0.63, 0.99),
			DARK_GREEN = Color3.fromHSV(hue, 0.77, 0.71),
			NOTE = base.NOTE,
			PANEL = base.PANEL,
			IDLE = base.IDLE,
			HOVER = base.HOVER,
			DARK_TEXT = base.DARK_TEXT,
			INPUT_TEXT = base.INPUT_TEXT,
		}
	end
	THEMES.rainbow = ui.makeRainbow(0)
	table.insert(THEME_ORDER, "rainbow")

	local function key(color)
		return math.floor(color.R * 255 + 0.5) * 65536 + math.floor(color.G * 255 + 0.5) * 256 + math.floor(color.B * 255 + 0.5)
	end

	local function swap(object, property, map)
		local target = map[key(object[property])]
		if target then
			object[property] = target
		end
	end

	local function recolor(root, map)
		for _, object in ipairs(root:GetDescendants()) do
			if object:IsA("GuiObject") then
				swap(object, "BackgroundColor3", map)
			end
			if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
				swap(object, "TextColor3", map)
				swap(object, "TextStrokeColor3", map)
				if object:IsA("TextBox") then
					swap(object, "PlaceholderColor3", map)
				end
			elseif object:IsA("UIStroke") then
				swap(object, "Color", map)
			elseif object:IsA("ScrollingFrame") then
				swap(object, "ScrollBarImageColor3", map)
			end
		end
	end

	local function applyTheme(name)
		local new = THEMES[name]
		if not new then
			return
		end
		if name == "rainbow" then
			ui.rainbowHue = (ui.rainbowHue + 0.004) % 1
			new = ui.makeRainbow(ui.rainbowHue)
		end
		if current == "rainbow" and name ~= "rainbow" then
			for _, entry in ipairs(ui.rainbowCache) do
				local object, property = entry[1], entry[2]
				if object.Parent then
					local _, sat = object[property]:ToHSV()
					if sat > 0.3 then
						object[property] = entry[3] and new.GREEN or new.DARK_GREEN
					end
				end
			end
		end
		local old = THEMES[current]
		local map = {}
		for _, token in ipairs(TOKENS) do
			map[key(old[token])] = new[token]
		end
		recolor(gui, map)
		recolor(tipGui, map)
		if name == "rainbow" then
			THEMES.rainbow = new
		end

		GREEN = new.GREEN
		DARK_GREEN = new.DARK_GREEN
		NOTE = new.NOTE
		INPUT_TEXT = new.INPUT_TEXT
		PANEL = new.PANEL
		IDLE = new.IDLE
		HOVER = new.HOVER
		DARK_TEXT = new.DARK_TEXT
		current = name
		audioLevels.theme = name

		for _, gradient in ipairs(themeGradients) do
			gradient.Color = ColorSequence.new(PANEL, HOVER)
		end
		for _, gradient in ipairs(accentGradients) do
			gradient.Color = ColorSequence.new(GREEN, DARK_GREEN)
		end
		for _, root in ipairs({ gui, tipGui }) do
			for _, object in ipairs(root:GetDescendants()) do
				if object:IsA("TextButton") then
					local active = object:GetAttribute("Active")
					if active ~= nil then
						local running = buttonTweens[object]
						if running then
							running:Cancel()
						end
						object.BackgroundColor3 = active and GREEN or IDLE
						object.TextColor3 = active and DARK_TEXT or GREEN
					end
				end
			end
		end
		for themeName, button in pairs(themeButtons) do
			setButtonActive(button, themeName == name)
		end
		for _, menu in ipairs(sideMenus) do
			if menu.relabel then
				menu.relabel()
			end
		end
		for _, hook in ipairs(audioLevels.hooks) do
			hook(name)
		end
	end

	audioLevels.applyTheme = applyTheme

	local themeMenu = createSideMenu({ title = "themes", custom = true })
	themeMenu.build = function()
	for index, themeName in ipairs(THEME_ORDER) do
		local button = makeButton(themeMenu.scroll, themeName, 0, 0)
		button.Size = UDim2.new(1, 0, 0, 28)
		button.MouseButton1Click:Connect(function()
			applyTheme(themeName)
		end)
		themeButtons[themeName] = button
	end
	ui.arrange(themeMenu, themeButtons, { "rainbow" }, { false })
	for themeName, button in pairs(themeButtons) do
		setButtonActive(button, themeName == current)
	end
	end
	ui.rainbowCache = {}
	ui.rainbowButtons = {}
	ui.rainbowSeen = setmetatable({}, { __mode = "k" })
	ui.rainbowState = nil
	ui.rainbowStep = function(budget)
		local state = ui.rainbowState
		if not state then
			state = { stack = { { gui, false }, { tipGui, false } }, cache = {}, buttons = {} }
			for _, entry in ipairs(ui.rainbowCache) do
				if entry[1].Parent then
					table.insert(state.cache, entry)
				end
			end
			ui.rainbowState = state
		end
		local function consider(object, property, inBg)
			local seen = ui.rainbowSeen[object]
			if seen and seen[property] then
				return
			end
			local _, sat, val = object[property]:ToHSV()
			local isAccent = math.abs(sat - 0.63) < 0.012 and math.abs(val - 0.99) < 0.012
			local isDark = math.abs(sat - 0.77) < 0.012 and math.abs(val - 0.71) < 0.012
			if isAccent or isDark then
				seen = seen or {}
				seen[property] = true
				ui.rainbowSeen[object] = seen
				table.insert(state.cache, { object, property, isAccent, inBg })
			end
		end
		local stack = state.stack
		while budget > 0 and #stack > 0 do
			budget = budget - 1
			local item = table.remove(stack)
			local object, inBg = item[1], item[2]
			if object ~= gui and object ~= tipGui then
				if object:IsA("TextButton") and object:GetAttribute("Active") ~= nil then
					table.insert(state.buttons, object)
				else
					if object:IsA("GuiObject") then
						consider(object, "BackgroundColor3", inBg)
					end
					if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
						consider(object, "TextColor3", inBg)
						consider(object, "TextStrokeColor3", inBg)
						if object:IsA("TextBox") then
							consider(object, "PlaceholderColor3", inBg)
						end
					elseif object:IsA("UIStroke") then
						consider(object, "Color", inBg)
					elseif object:IsA("ScrollingFrame") then
						consider(object, "ScrollBarImageColor3", inBg)
					end
				end
			end
			local childBg = inBg or object.Name == "Stripes"
			for _, child in ipairs(object:GetChildren()) do
				table.insert(stack, { child, childBg })
			end
		end
		if #stack == 0 then
			ui.rainbowCache = state.cache
			ui.rainbowButtons = state.buttons
			ui.rainbowState = nil
			return true
		end
		return false
	end
	ui.rainbowFast = function(tick)
		ui.rainbowHue = (ui.rainbowHue + 0.008) % 1
		local new = ui.makeRainbow(ui.rainbowHue)
		local withBg = tick % 3 == 0
		for _, entry in ipairs(ui.rainbowCache) do
			if withBg or not entry[4] then
				local object, property = entry[1], entry[2]
				if object.Parent then
					local value = object[property]
					if value ~= IDLE and value ~= HOVER and value ~= PANEL and value ~= NOTE and value ~= DARK_TEXT and value ~= INPUT_TEXT then
						object[property] = entry[3] and new.GREEN or new.DARK_GREEN
					end
				end
			end
		end
		GREEN = new.GREEN
		DARK_GREEN = new.DARK_GREEN
		THEMES.rainbow = new
		for _, button in ipairs(ui.rainbowButtons) do
			if button.Parent then
				local running = buttonTweens[button]
				if not (running and running.PlaybackState == Enum.PlaybackState.Playing) then
					if button:GetAttribute("Active") then
						button.BackgroundColor3 = new.GREEN
						button.TextColor3 = DARK_TEXT
					else
						button.TextColor3 = new.GREEN
						local _, sat = button.BackgroundColor3:ToHSV()
						if sat > 0.3 then
							button.BackgroundColor3 = IDLE
						end
					end
				end
			end
		end
		for _, gradient in ipairs(accentGradients) do
			gradient.Color = ColorSequence.new(GREEN, DARK_GREEN)
		end
		for _, hook in ipairs(audioLevels.hooks) do
			hook("rainbow")
		end
	end
	task.spawn(function()
		local tick = 0
		while gui.Parent do
			task.wait(0.1)
			if current == "rainbow" and gui.Enabled then
				tick = tick + 1
				if tick == 1 then
					applyTheme("rainbow")
				end
				if ui.rainbowState or tick % 30 == 1 then
					ui.rainbowStep(220)
				end
				if tick > 1 then
					ui.rainbowFast(tick)
				end
			else
				tick = 0
			end
		end
	end)
	ui.themeMenuButton.MouseButton1Click:Connect(themeMenu.open)
end

do
	local SoundService = game:GetService("SoundService")
	local SONG_IDS = { 92209428926055, 92062588329352, 120250834949839, 82150659389900, 128473009788756, 140232102557882, 110846165697274, 79707296077226, 102573267664123, 105490257583939, 105132207843908, 124092830839928, 86333148091674, 116628925518668, 83234254521383, 78824701795900, 134386905888294, 73984026566739, 75104612892729, 77097411209853, 135308716749313 }
	local FADE_IN = 2.5
	local FADE_OUT = 3
	local BAR_COUNT = 48

	local music = { volume = 0.5, muted = true }

	local visual = Instance.new("Frame")
	visual.Name = "Visualizer"
	visual.BackgroundTransparency = 1
	visual.BorderSizePixel = 0
	visual.AnchorPoint = Vector2.new(0, 0.5)
	visual.Position = UDim2.new(0, 150, 0.5, 0)
	visual.Size = UDim2.fromOffset(96, 18)
	visual.ZIndex = 3
	visual.Parent = header

	local baseline = Instance.new("Frame")
	baseline.AnchorPoint = Vector2.new(0, 1)
	baseline.Position = UDim2.new(0, 0, 1, 0)
	baseline.Size = UDim2.new(1, -1, 0, 1)
	baseline.ZIndex = 3
	baseline.BackgroundColor3 = WHITE
	baseline.BackgroundTransparency = 0.15
	baseline.Visible = false
	baseline.BorderSizePixel = 0
	baseline.Parent = visual

	local bars = {}
	local levels = {}
	for index = 1, BAR_COUNT do
		local bar = Instance.new("Frame")
		bar.AnchorPoint = Vector2.new(0, 1)
		bar.Position = UDim2.new((index - 1) / BAR_COUNT, 0, 1, 0)
		bar.Size = UDim2.new(1 / BAR_COUNT, -1, 0, 1)
		bar.ZIndex = 3
		bar.BackgroundColor3 = WHITE
		bar.BackgroundTransparency = 0.15
		bar.BorderSizePixel = 0
		bar.Parent = visual
		bars[index] = bar
		levels[index] = 0
	end
	audioLevels.levels = levels

	local oldAudio = SoundService:FindFirstChild("moddyAudio")
	if oldAudio then
		oldAudio:Destroy()
	end
	local container = Instance.new("Folder")
	container.Name = "moddyAudio"
	container.Parent = SoundService
	table.insert(cleanups, function()
		container:Destroy()
	end)

	local built, audioPlayer, fader, analyzer = pcall(function()
		local source = Instance.new("AudioPlayer")
		source.Looping = false
		source.Parent = container

		local reverb = Instance.new("AudioReverb")
		reverb.Parent = container
		pcall(function()
			reverb.DecayTime = 2.2
			reverb.Density = 0.8
			reverb.DryLevel = 0
			reverb.WetLevel = -6
		end)

		local gain = Instance.new("AudioFader")
		gain.Volume = 0
		gain.Parent = container

		local spectrumTap = Instance.new("AudioAnalyzer")
		spectrumTap.Parent = container

		local output = Instance.new("AudioDeviceOutput")
		output.Parent = container

		local function connect(from, to)
			local wire = Instance.new("Wire")
			wire.SourceInstance = from
			wire.TargetInstance = to
			wire.Parent = container
		end

		connect(source, reverb)
		connect(reverb, spectrumTap)
		connect(reverb, gain)
		connect(gain, output)
		return source, gain, spectrumTap
	end)

	local musicMenu = createSideMenu({ title = "music", custom = true })
	musicMenu.build = function()
		for _, object in ipairs(musicMenu.frame:GetDescendants()) do
			if object.Name == "Tag" then
				object:Destroy()
			end
		end
	end
	local list = musicMenu.scroll

	local nowPlaying = makeNote(list, "now playing: none", 0, 0)
	nowPlaying.Size = UDim2.new(1, 0, 0, 16)
	nowPlaying.LayoutOrder = 1

	local songButtons = {}
	local playSong
	local nextRandom
	local index

	local songNames = {}
	local songCreators = {}
	for songIndex = 1, #SONG_IDS do
		songNames[songIndex] = "song " .. songIndex
		songCreators[songIndex] = ""
	end

	local function refreshMusicUi()
		for songIndex, button in ipairs(songButtons) do
			setButtonActive(button, songIndex == index)
		end
		if index then
			local by = songCreators[index] ~= "" and (" by " .. songCreators[index]) or ""
			nowPlaying.Text = "now playing: " .. songNames[index] .. by
		else
			nowPlaying.Text = "now playing: none"
		end
	end

	for songIndex = 1, #SONG_IDS do
		local row = Instance.new("Frame")
		row.BackgroundTransparency = 1
		row.BorderSizePixel = 0
		row.Size = UDim2.new(1, 0, 0, 46)
		row.LayoutOrder = 10 + songIndex
		row.Parent = list
		ui.songRows = ui.songRows or {}
		ui.songRows[songIndex] = row

		local thumb = Instance.new("ImageLabel")
		thumb.BackgroundColor3 = IDLE
		thumb.BorderSizePixel = 0
		thumb.Position = UDim2.fromOffset(0, 2)
		thumb.Size = UDim2.fromOffset(40, 40)
		thumb.ScaleType = Enum.ScaleType.Crop
		thumb.Image = "rbxthumb://type=Asset&id=" .. SONG_IDS[songIndex] .. "&w=150&h=150"
		thumb.ZIndex = 3
		thumb.Parent = row

		local button = makeButton(row, "song " .. songIndex, 0, 0)
		local creatorLabel = makeNote(row, "", 0, 30)
		creatorLabel.TextSize = 11
		button.Position = UDim2.fromOffset(46, 0)
		button.Size = UDim2.new(1, -46, 0, 28)
		creatorLabel.Position = UDim2.fromOffset(46, 30)
		creatorLabel.Size = UDim2.new(1, -46, 0, 14)
		button.MouseButton1Click:Connect(function()
			if playSong then
				playSong(songIndex)
			end
		end)
		button.TextTruncate = Enum.TextTruncate.AtEnd
		songButtons[songIndex] = button
		task.spawn(function()
			local ok, info = pcall(function()
				return game:GetService("MarketplaceService"):GetProductInfo(SONG_IDS[songIndex], Enum.InfoType.Asset)
			end)
			if ok and info and type(info.Name) == "string" and info.Name ~= "" then
				songNames[songIndex] = info.Name
				button.Text = info.Name
				local ranked = {}
				for rowIndex in pairs(ui.songRows) do
					table.insert(ranked, rowIndex)
				end
				table.sort(ranked, function(a, b)
					return string.lower(songNames[a]) < string.lower(songNames[b])
				end)
				for rank, rowIndex in ipairs(ranked) do
					ui.songRows[rowIndex].LayoutOrder = 10 + rank
				end
			end
			if ok and info then
				local artist
				if type(info.Name) == "string" then
					artist = string.match(info.Name, "^(.-)%s+%-%s+.+$")
				end
				if artist and artist ~= "" then
					songCreators[songIndex] = artist
					creatorLabel.Text = "by " .. artist
				elseif type(info.Creator) == "table" and type(info.Creator.Name) == "string" then
					songCreators[songIndex] = info.Creator.Name
					creatorLabel.Text = "uploaded by " .. info.Creator.Name
				end
			end
			refreshMusicUi()
		end)
	end

	local nextButton = makeButton(list, "next song", 0, 0)
	nextButton.Size = UDim2.new(1, 0, 0, 28)
	nextButton.LayoutOrder = 2

	ui.muteMusicButton = makeButton(list, "mute music", 0, 0)
	ui.muteMusicButton.Size = UDim2.new(1, 0, 0, 28)
	ui.muteMusicButton.LayoutOrder = 3
	nextButton.MouseButton1Click:Connect(function()
		if nextRandom and playSong then
			playSong(nextRandom())
		end
	end)

	local volumeBox = makeBox(list, "volume 0-100", 0, 0, 200)
	volumeBox.Size = UDim2.new(1, 0, 0, 28)
	volumeBox.LayoutOrder = 4

	local volumeInfo = makeNote(list, "volume: 50%", 0, 0)
	volumeInfo.Size = UDim2.new(1, 0, 0, 16)
	volumeInfo.LayoutOrder = 5

	audioLevels.music = music
	audioLevels.setVolume = function(percent)
		percent = math.clamp(percent, 0, 100)
		music.volume = percent / 100
		volumeInfo.Text = "volume: " .. math.floor(percent) .. "%"
	end
	audioLevels.setMuted = function(state)
		music.muted = state
		setButtonActive(ui.muteMusicButton, state)
	end

	bindSpeedBox(volumeBox, "volume 0-100", function(value)
		local percent = math.clamp(value, 0, 100)
		music.volume = percent / 100
		volumeInfo.Text = "volume: " .. math.floor(percent) .. "%"
	end)

	ui.musicMenuButton.MouseButton1Click:Connect(musicMenu.open)
	setButtonActive(ui.muteMusicButton, music.muted)

	ui.muteMusicButton.MouseButton1Click:Connect(function()
		music.muted = not music.muted
		setButtonActive(ui.muteMusicButton, music.muted)
	end)

	if not built then
		warn("Mod menu: the audio system could not start")
	else
		local token = 0
		local failures = 0
		local lastStart = 0
		local endingToken = -1

		local function isReady()
			local ok, ready = pcall(function()
				return audioPlayer.IsReady
			end)
			if ok then
				return ready
			end
			return audioPlayer.TimeLength > 0
		end

		function nextRandom()
			local choice = math.random(1, #SONG_IDS)
			if #SONG_IDS > 1 then
				while choice == index do
					choice = math.random(1, #SONG_IDS)
				end
			end
			return choice
		end

		function playSong(songIndex)
			token = token + 1
			local myToken = token
			index = songIndex
			audioLevels.song = songIndex + token * 100
			lastStart = os.clock()
			fader.Volume = 0
			audioPlayer:Stop()
			local assetUrl = "rbxassetid://" .. SONG_IDS[songIndex]
			if not pcall(function()
				audioPlayer.AssetId = assetUrl
			end) then
				pcall(function()
					audioPlayer.Asset = assetUrl
				end)
			end
			audioPlayer.TimePosition = 0
			refreshMusicUi()

			task.spawn(function()
				local waited = 0
				while myToken == token and not isReady() and waited < 15 do
					waited = waited + task.wait(0.1)
				end
				if myToken ~= token then
					return
				end
				if not isReady() then
					failures = failures + 1
					warn("Mod menu: " .. songNames[songIndex] .. " could not be loaded")
					if failures < #SONG_IDS then
						playSong(nextRandom())
					end
					return
				end
				failures = 0
				lastStart = os.clock()
				audioPlayer:Play()
			end)
		end

		local function advance()
			if endingToken ~= token then
				endingToken = token
				playSong(nextRandom())
			end
		end

		local endedConnection = audioPlayer.Ended:Connect(function()
			if os.clock() - lastStart > 5 then
				advance()
			end
		end)

		local gainConnection = RunService.Heartbeat:Connect(function()
			if not audioPlayer.IsPlaying then
				return
			end
			local length = audioPlayer.TimeLength
			local position = audioPlayer.TimePosition
			local gain = math.min(1, position / FADE_IN)
			if length > 0 then
				gain = math.min(gain, (length - position) / FADE_OUT)
				if position >= length - 0.2 then
					advance()
				end
			end
			fader.Volume = music.muted and 0 or music.volume * math.clamp(gain, 0, 1)
		end)

		local drawn = {}
		local peak = 0.001
		local bassAverage = 0
		local lastBeat = 0
		local visualAccumulated = 0
		local visualConnection = RunService.RenderStepped:Connect(function(frameDt)
			visualAccumulated = visualAccumulated + frameDt
			if visualAccumulated < 0.033 then
				return
			end
			local dt = visualAccumulated
			visualAccumulated = 0
			local spectrum
			local base = 0
			if audioPlayer.IsPlaying and not music.muted then
				local ok, result = pcall(function()
					return analyzer:GetSpectrum()
				end)
				if ok and type(result) == "table" and #result > 0 then
					spectrum = result
				else
					local okRms, rms = pcall(function()
						return analyzer.RmsLevel
					end)
					if okRms and type(rms) == "number" then
						base = math.clamp(rms * 4, 0, 1)
					end
				end
			end

			local targets = {}
			local frameMax = 0
			if spectrum then
				local usable = math.floor(#spectrum * 0.5)
				for bar = 1, BAR_COUNT do
					local low = math.floor(usable * ((bar - 1) / BAR_COUNT) ^ 2) + 1
					local high = math.max(low, math.floor(usable * (bar / BAR_COUNT) ^ 2))
					local top = 0
					for bin = low, high do
						local value = spectrum[bin]
						if value and value > top then
							top = value
						end
					end
					targets[bar] = top
					if top > frameMax then
						frameMax = top
					end
				end
			end
			peak = math.max(peak * 0.995, frameMax, 0.001)

			local bassNorm = base
			if spectrum then
				local bassBins = math.max(2, math.floor(#spectrum * 0.012))
				local bassTop = 0
				for bin = 1, bassBins do
					local value = spectrum[bin]
					if value and value > bassTop then
						bassTop = value
					end
				end
				bassNorm = math.clamp(bassTop / peak, 0, 1)
			end
			bassAverage = bassAverage + (bassNorm - bassAverage) * math.min(1, dt * 2)
			local now = os.clock()
			if bassNorm > bassAverage * 1.2 + 0.03 and bassNorm > 0.2 and now - lastBeat > 0.15 then
				lastBeat = now
				audioLevels.beat = 1
			end
			audioLevels.beat = math.max(0, audioLevels.beat - dt * 4)
			audioLevels.bass = audioLevels.bass + (bassNorm - audioLevels.bass) * math.min(1, dt * 10)
			audioLevels.active = audioPlayer.IsPlaying and not music.muted

			local total = 0
			for bar = 1, BAR_COUNT do
				local target = 0
				if spectrum then
					target = math.clamp((targets[bar] / peak) ^ 0.8, 0, 1)
				elseif base > 0 then
					target = base * (0.5 + 0.5 * math.noise(bar * 0.7, os.clock() * 3))
				end
				local level = levels[bar]
				local speed = target > level and 18 or 6
				level = level + (target - level) * math.min(1, dt * speed)
				levels[bar] = level
				total = total + level
				if math.abs(level - (drawn[bar] or -1)) > 0.015 then
					drawn[bar] = level
					bars[bar].Size = UDim2.new(1 / BAR_COUNT, -1, level * 0.94, 1)
				end
			end
			audioLevels.level = total / BAR_COUNT
		end)

		table.insert(cleanups, function()
			endedConnection:Disconnect()
			gainConnection:Disconnect()
			visualConnection:Disconnect()
			audioPlayer:Stop()
		end)

		audioLevels.getSongId = function()
			return index and SONG_IDS[index] or nil
		end
		audioLevels.playSongId = function(id)
			for songIndex, songId in ipairs(SONG_IDS) do
				if songId == id then
					playSong(songIndex)
					return
				end
			end
		end

		playSong(math.random(1, #SONG_IDS))
	end
end

do
	local SoundService = game:GetService("SoundService")
	local originals = setmetatable({}, { __mode = "k" })
	local suppressing = false

	local function isOurs(instance)
		local container = SoundService:FindFirstChild("moddyAudio")
		return container ~= nil and instance:IsDescendantOf(container)
	end

	local function isAudio(instance)
		return instance:IsA("Sound") or instance:IsA("AudioPlayer")
	end

	local function silence(instance)
		if instance.Name == "ClickSound" then
			return
		end
		if originals[instance] == nil and not isOurs(instance) then
			originals[instance] = instance.Volume
		end
		if originals[instance] ~= nil and instance.Volume ~= 0 then
			originals[instance] = instance.Volume
			instance.Volume = 0
		end
	end

	local function restoreAll()
		for instance, volume in pairs(originals) do
			if instance.Parent then
				pcall(function()
					instance.Volume = volume
				end)
			end
		end
		table.clear(originals)
	end

	local addedConnection = game.DescendantAdded:Connect(function(instance)
		if suppressing and isAudio(instance) then
			task.defer(function()
				pcall(silence, instance)
			end)
		end
	end)

	local elapsed = 0
	local loopConnection = RunService.Heartbeat:Connect(function(dt)
		elapsed = elapsed + dt
		if elapsed < 0.25 then
			return
		end
		elapsed = 0
		local wanted = audioLevels.active == true
		if wanted and not suppressing then
			suppressing = true
			for _, root in ipairs({ workspace, SoundService, playerGui }) do
				scanAsync(root, function(instance)
					if isAudio(instance) then
						pcall(silence, instance)
					end
				end, function()
					return suppressing
				end)
			end
		elseif not wanted and suppressing then
			suppressing = false
			restoreAll()
		elseif suppressing then
			for instance in pairs(originals) do
				if instance.Parent and instance.Volume ~= 0 then
					pcall(silence, instance)
				end
			end
		end
	end)

	table.insert(cleanups, function()
		addedConnection:Disconnect()
		loopConnection:Disconnect()
		suppressing = false
		restoreAll()
	end)
end

local trailGui
local trailConnection
local trailInput

do
	local GuiService = game:GetService("GuiService")
	local MAX_POINTS = 24
	local TRAIL_LIFE = 0.45
	local trailLife = TRAIL_LIFE
	local trailStyle = "none"
	local trailShape = "classic"
	local trailPal = nil
	local trailColorName = "auto"
	local trailColorKey = nil
	local lastCount = 0
	local SHARD_COUNT = 16
	local MAX_PARTICLES = 90

	local oldTrail = playerGui:FindFirstChild("moddyTrail")
	if oldTrail then
		oldTrail:Destroy()
	end

	trailGui = Instance.new("ScreenGui")
	trailGui.Name = "moddyTrail"
	trailGui.ResetOnSpawn = false
	trailGui.IgnoreGuiInset = true
	trailGui.DisplayOrder = 2147483001
	trailGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	trailGui.Parent = playerGui

	local function newFrame(round)
		local frame = Instance.new("Frame")
		frame.AnchorPoint = Vector2.new(0.5, 0.5)
		frame.BorderSizePixel = 0
		frame.Parent = trailGui
		if round then
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(1, 0)
			corner.Parent = frame
		end
		return frame
	end

	local glowSegments = {}
	local coreSegments = {}
	for index = 1, MAX_POINTS do
		local segment = newFrame(true)
		segment.Visible = false
		glowSegments[index] = segment
	end
	for index = 1, MAX_POINTS do
		local segment = newFrame(true)
		segment.Visible = false
		coreSegments[index] = segment
	end

	local cursorGlow = newFrame(true)
	cursorGlow.BackgroundTransparency = 0.65
	cursorGlow.Visible = false
	local cursorStroke = addStroke(cursorGlow, GREEN, 0.2, 2)

	local points = {}
	local particles = {}
	local lastMouse

	local function inside(frame, point)
		if not frame.Visible then
			return false
		end
		local position = frame.AbsolutePosition
		local size = frame.AbsoluteSize
		return point.X >= position.X and point.X <= position.X + size.X and point.Y >= position.Y and point.Y <= position.Y + size.Y
	end

	local function isHovering()
		return true
	end

	local function clearTrail()
		table.clear(points)
		lastMouse = nil
		cursorGlow.Visible = false
		for index = 1, MAX_POINTS do
			glowSegments[index].Visible = false
			coreSegments[index].Visible = false
		end
	end

	local TRAIL_PALETTES = {
		vapor = { { 255, 120, 220 }, { 80, 220, 255 } },
		inferno = { { 255, 255, 180 }, { 255, 30, 0 } },
		glacier = { { 235, 250, 255 }, { 120, 190, 230 } },
		peach = { { 255, 220, 190 }, { 255, 140, 110 } },
		grape = { { 200, 140, 255 }, { 90, 20, 140 } },
		lemon = { { 255, 255, 190 }, { 240, 220, 40 } },
		cherry = { { 255, 140, 170 }, { 200, 0, 60 } },
		teal = { { 150, 240, 230 }, { 0, 130, 130 } },
		copper = { { 255, 190, 150 }, { 170, 80, 40 } },
		storm = { { 190, 200, 220 }, { 50, 60, 90 } },
		bubblegum = { { 255, 190, 240 }, { 255, 100, 200 } },
		seafoam = { { 210, 255, 235 }, { 90, 200, 170 } },
		dusk = { { 255, 170, 140 }, { 70, 40, 130 } },
		dawn = { { 255, 235, 190 }, { 255, 150, 170 } },
		venom = { { 190, 255, 90 }, { 110, 0, 170 } },
		ghost = { { 255, 255, 255 }, { 170, 220, 255 } },
		honey = { { 255, 225, 130 }, { 220, 150, 20 } },
		wine = { { 220, 110, 150 }, { 90, 0, 40 } },
		arctic = { { 220, 255, 255 }, { 90, 150, 255 } },
		jungle = { { 190, 255, 120 }, { 0, 110, 60 } },
		cyber = { { 0, 255, 230 }, { 255, 0, 150 } },
		halloween = { { 255, 160, 40 }, { 110, 30, 160 } },
		christmas = { { 255, 80, 80 }, { 40, 180, 80 } },
		bumblebee = { { 255, 225, 60 }, { 40, 40, 40 } },
		flamingo = { { 255, 170, 200 }, { 255, 110, 130 } },
		oil = { { 150, 120, 220 }, { 40, 150, 140 } },
		fire = { { 255, 210, 90 }, { 255, 60, 20 } },
		ice = { { 200, 240, 255 }, { 60, 120, 255 } },
		gold = { { 255, 232, 130 }, { 200, 140, 30 } },
		lava = { { 255, 240, 120 }, { 200, 20, 0 } },
		ocean = { { 160, 255, 240 }, { 0, 80, 200 } },
		sunset = { { 255, 230, 120 }, { 200, 60, 160 } },
		candy = { { 255, 150, 220 }, { 150, 200, 255 } },
		toxic = { { 200, 255, 60 }, { 40, 160, 20 } },
		blood = { { 255, 80, 80 }, { 90, 0, 10 } },
		galaxy = { { 200, 160, 255 }, { 40, 20, 120 } },
		white = { { 255, 255, 255 }, { 160, 160, 160 } },
		shadow = { { 50, 50, 50 }, { 0, 0, 0 } },
		red = { { 255, 120, 120 }, { 190, 0, 0 } },
		orange = { { 255, 200, 100 }, { 230, 100, 0 } },
		yellow = { { 255, 255, 160 }, { 230, 190, 0 } },
		lime = { { 220, 255, 120 }, { 100, 200, 0 } },
		green = { { 150, 255, 160 }, { 0, 150, 40 } },
		mint = { { 200, 255, 230 }, { 60, 200, 150 } },
		cyan = { { 180, 255, 255 }, { 0, 190, 220 } },
		sky = { { 200, 230, 255 }, { 80, 160, 255 } },
		blue = { { 150, 180, 255 }, { 0, 50, 220 } },
		navy = { { 90, 110, 200 }, { 0, 0, 80 } },
		purple = { { 210, 150, 255 }, { 100, 0, 190 } },
		violet = { { 190, 170, 255 }, { 80, 40, 200 } },
		magenta = { { 255, 150, 255 }, { 200, 0, 170 } },
		pink = { { 255, 200, 230 }, { 255, 90, 170 } },
		rose = { { 255, 180, 190 }, { 200, 40, 90 } },
		brown = { { 200, 150, 100 }, { 90, 50, 20 } },
		silver = { { 245, 245, 250 }, { 140, 145, 160 } },
		bronze = { { 240, 190, 120 }, { 150, 90, 30 } },
		neon_green = { { 180, 255, 120 }, { 0, 255, 80 } },
		neon_pink = { { 255, 160, 255 }, { 255, 0, 200 } },
		neon_blue = { { 160, 220, 255 }, { 0, 120, 255 } },
		matrix = { { 160, 255, 160 }, { 0, 90, 20 } },
		sakura = { { 255, 235, 240 }, { 255, 150, 190 } },
		autumn = { { 255, 210, 90 }, { 170, 50, 10 } },
		forest = { { 150, 210, 120 }, { 20, 90, 40 } },
		midnight = { { 120, 130, 220 }, { 10, 10, 60 } },
		aurora = { { 140, 255, 200 }, { 150, 60, 230 } },
		ember = { { 255, 170, 60 }, { 120, 20, 0 } },
		plasma = { { 255, 140, 255 }, { 60, 40, 255 } },
		cotton = { { 255, 190, 230 }, { 170, 220, 255 } },
		coral = { { 255, 190, 150 }, { 255, 90, 90 } },
		lavender = { { 235, 220, 255 }, { 160, 130, 230 } },
		steel = { { 200, 210, 225 }, { 80, 95, 120 } },
		sand = { { 255, 240, 200 }, { 210, 170, 110 } },
		emerald = { { 150, 255, 200 }, { 0, 140, 90 } },
		ruby = { { 255, 130, 160 }, { 150, 0, 40 } },
		sapphire = { { 140, 170, 255 }, { 10, 40, 170 } },
		amber = { { 255, 220, 120 }, { 200, 110, 0 } },
		jade = { { 170, 240, 200 }, { 40, 150, 110 } },
		smoke = { { 210, 210, 210 }, { 60, 60, 60 } },
	}
	local TRAIL_SCALE = { thin = 0.4, thick = 1.6, hairline = 0.2, bold = 2.4, ribbon = 3.6 }
	local TRAIL_LIFE_BY = { long = 0.9, short = 0.25, epic = 1.6, blink = 0.12 }
	ui.TRAIL_GAP = { beads = { 3, 1 }, morse = { 8, 5 }, stitch = { 4, 2 } }

	local function trailColor(index, fade, now)
		local style = trailPal
		if style == "rainbow" then
			return Color3.fromHSV((now * 0.7 + index * 0.025) % 1, 0.6, 1)
		elseif style == "pastel" then
			return Color3.fromHSV((now * 0.3 + index * 0.03) % 1, 0.3, 1)
		elseif style == "gradient" then
			return GREEN:Lerp(DARK_GREEN, fade)
		end
		local palette = style and TRAIL_PALETTES[style]
		if palette then
			return Color3.fromRGB(palette[1][1], palette[1][2], palette[1][3]):Lerp(Color3.fromRGB(palette[2][1], palette[2][2], palette[2][3]), fade)
		end
		return nil
	end

	local EFFECTS = { "burst", "ripple", "sparkle", "confetti", "pulse", "firework", "squares", "bloom", "bubbles", "rainbow", "shockwave", "snow", "fireflies", "spiral", "starburst", "shatter", "lightning", "ink", "dust", "comet", "gems", "halo", "3d cubes", "3d spheres", "3d ring", "3d spiral", "3d shards", "3d fountain", "3d tornado", "3d galaxy", "3d crystals", "3d dna", "3d streaks", "3d rain", "3d vortex", "3d pillars", "3d confetti", "3d pulse", "3d tiles", "3d orbit", "3d bubbles", "rays", "echo", "meteors", "blossom", "smoke", "glitch", "cross", "orbs", "heartbeat", "dotring", "zap", "needles", "pop", "geyser", "drip", "plus burst", "x burst", "pinwheel", "atoms", "nova", "sprinkles", "bolts", "bricks", "swirl", "target", "stardust", "sidewinder", "compass", "mega burst", "rainbow nova", "rainbow swirl", "fountain", "shrapnel", "3d sparks", "3d marbles", "3d coins", "3d bricks", "3d needles", "3d embers", "3d snowballs", "3d wedges", "3d dust", "3d bomb", "3d plates", "3d pearls", "3d meteor", "3d lasers", "3d petals", "3d gravel", "3d fizz", "3d nova", "3d geyser", "3d boulders", "3d neon cubes", "3d slabs", "none" }
	local effectIndex = #EFFECTS
	ui.FX2D = {
		["needles"] = { n = 22, w1 = 14, w2 = 26, h1 = 2, h2 = 2, v1 = 260, v2 = 560, life = 0.45, point = true },
		["pop"] = { n = 6, w1 = 18, w2 = 30, v1 = 60, v2 = 140, life = 0.5, rings = 1 },
		["geyser"] = { n = 22, w1 = 4, w2 = 8, v1 = 240, v2 = 520, life = 0.6, dirs = "up" },
		["drip"] = { n = 16, w1 = 3, w2 = 6, h1 = 10, h2 = 18, v1 = 160, v2 = 380, life = 0.6, dirs = "down" },
		["plus burst"] = { n = 16, w1 = 16, w2 = 24, h1 = 3, h2 = 3, v1 = 200, v2 = 460, life = 0.45, dirs = "plus", point = true },
		["x burst"] = { n = 16, w1 = 16, w2 = 24, h1 = 3, h2 = 3, v1 = 200, v2 = 460, life = 0.45, dirs = "x", point = true },
		["pinwheel"] = { n = 10, w1 = 8, w2 = 12, v1 = 120, v2 = 200, life = 0.8, orbit = true, turn = 7, dirs = "even" },
		["atoms"] = { n = 4, w1 = 7, w2 = 9, v1 = 90, v2 = 130, life = 0.9, orbit = true, turn = 12, dirs = "even", rings = 1, ringSize = 70 },
		["nova"] = { n = 40, w1 = 2, w2 = 4, v1 = 300, v2 = 700, life = 0.4, rings = 2, ringSize = 200 },
		["sprinkles"] = { n = 30, w1 = 8, w2 = 12, h1 = 2, h2 = 3, v1 = 120, v2 = 380, life = 0.7, rainbow = true },
		["bolts"] = { n = 8, w1 = 50, w2 = 90, h1 = 2, h2 = 2, v1 = 500, v2 = 900, life = 0.3, point = true },
		["bricks"] = { n = 8, w1 = 16, w2 = 26, h1 = 8, h2 = 12, v1 = 120, v2 = 300, life = 0.6 },
		["swirl"] = { n = 20, w1 = 4, w2 = 7, v1 = 80, v2 = 260, life = 0.9, orbit = true, turn = 5 },
		["target"] = { n = 0, w1 = 1, w2 = 1, v1 = 1, v2 = 1, life = 0.1, rings = 4, ringSize = 150 },
		["stardust"] = { n = 36, w1 = 2, w2 = 3, v1 = 30, v2 = 150, life = 1 },
		["sidewinder"] = { n = 18, w1 = 10, w2 = 20, h1 = 2, h2 = 2, v1 = 260, v2 = 560, life = 0.45, dirs = "side", point = true },
		["compass"] = { n = 8, w1 = 30, w2 = 30, h1 = 2, h2 = 2, v1 = 320, v2 = 320, life = 0.45, dirs = "even", point = true },
		["mega burst"] = { n = 60, w1 = 3, w2 = 7, v1 = 150, v2 = 620, life = 0.6, rings = 1, ringSize = 180 },
		["rainbow nova"] = { n = 40, w1 = 3, w2 = 5, v1 = 250, v2 = 650, life = 0.5, rainbow = true, rings = 1 },
		["rainbow swirl"] = { n = 20, w1 = 5, w2 = 8, v1 = 100, v2 = 260, life = 0.9, orbit = true, turn = 6, rainbow = true },
		["fountain"] = { n = 26, w1 = 3, w2 = 6, v1 = 300, v2 = 620, life = 0.5, dirs = "up", rainbow = true },
		["shrapnel"] = { n = 14, w1 = 6, w2 = 16, h1 = 3, h2 = 8, v1 = 300, v2 = 700, life = 0.35 },
	}
	ui.FX3D = {
		["3d sparks"] = { n = 26, shape = "Block", min = 0.15, max = 0.3, v1 = 14, v2 = 34, g = -20, spin = 6, life = 0.6, neon = true },
		["3d marbles"] = { n = 12, shape = "Ball", min = 0.8, max = 1.4, v1 = 6, v2 = 16, g = -22, life = 1 },
		["3d coins"] = { n = 14, shape = "Cylinder", min = 0.9, max = 1.2, dims = Vector3.new(0.15, 1, 1), v1 = 8, v2 = 18, g = -18, spin = 10, life = 1, up = true },
		["3d bricks"] = { n = 10, shape = "Block", min = 0.8, max = 1.2, dims = Vector3.new(1.6, 0.8, 0.8), v1 = 6, v2 = 16, g = -18, spin = 5, life = 1 },
		["3d needles"] = { n = 20, shape = "Block", min = 1, max = 1.4, dims = Vector3.new(0.12, 0.12, 2), v1 = 20, v2 = 44, life = 0.5, streak = true, neon = true },
		["3d embers"] = { n = 22, shape = "Ball", min = 0.2, max = 0.45, v1 = 3, v2 = 9, g = 9, life = 1, neon = true, shrink = true },
		["3d snowballs"] = { n = 14, shape = "Ball", min = 0.5, max = 1, v1 = 8, v2 = 18, g = -12, life = 0.9, shrink = true },
		["3d wedges"] = { n = 14, shape = "Wedge", min = 0.6, max = 1.2, v1 = 8, v2 = 22, g = -10, spin = 7, life = 0.9 },
		["3d dust"] = { n = 34, shape = "Block", min = 0.1, max = 0.22, v1 = 2, v2 = 9, life = 1.1, spin = 3 },
		["3d bomb"] = { n = 30, shape = "Block", min = 0.6, max = 1.4, v1 = 16, v2 = 40, g = -8, spin = 8, life = 0.8 },
		["3d plates"] = { n = 10, shape = "Block", min = 1.2, max = 2, dims = Vector3.new(1, 0.08, 1), v1 = 6, v2 = 14, g = -6, spin = 6, life = 1 },
		["3d pearls"] = { n = 18, shape = "Ball", min = 0.4, max = 0.7, v1 = 8, v2 = 20, life = 0.8, neon = true, shrink = true },
		["3d meteor"] = { n = 12, shape = "Ball", min = 0.5, max = 0.9, v1 = 12, v2 = 24, g = -40, life = 0.8, neon = true },
		["3d lasers"] = { n = 12, shape = "Block", min = 1, max = 1.5, dims = Vector3.new(0.1, 0.1, 5), v1 = 40, v2 = 70, life = 0.4, streak = true, neon = true },
		["3d petals"] = { n = 20, shape = "Block", min = 0.4, max = 0.7, dims = Vector3.new(1, 0.06, 0.7), v1 = 3, v2 = 9, g = -5, spin = 5, life = 1.2 },
		["3d gravel"] = { n = 24, shape = "Block", min = 0.25, max = 0.6, v1 = 8, v2 = 20, g = -30, spin = 9, life = 0.8 },
		["3d fizz"] = { n = 26, shape = "Ball", min = 0.15, max = 0.35, v1 = 2, v2 = 8, g = 14, life = 0.9, up = true },
		["3d nova"] = { n = 30, shape = "Ball", min = 0.3, max = 0.5, v1 = 24, v2 = 44, life = 0.5, neon = true, shrink = true },
		["3d geyser"] = { n = 24, shape = "Block", min = 0.3, max = 0.6, v1 = 18, v2 = 30, g = -30, spin = 6, life = 1, up = true },
		["3d boulders"] = { n = 6, shape = "Ball", min = 1.6, max = 2.6, v1 = 5, v2 = 12, g = -24, life = 1.1 },
		["3d neon cubes"] = { n = 16, shape = "Block", min = 0.4, max = 0.9, v1 = 8, v2 = 22, spin = 8, life = 0.8, neon = true, shrink = true },
		["3d slabs"] = { n = 8, shape = "Block", min = 1, max = 1.6, dims = Vector3.new(0.3, 2.2, 1), v1 = 6, v2 = 14, g = -14, spin = 4, life = 1 },
	}

	local TRAIL_STYLES = { "classic", "thin", "thick", "long", "short", "dotted", "dashed", "glow", "gradient", "rainbow", "rainbow thick", "pastel", "fire", "ice", "gold", "lava", "ocean", "sunset", "candy", "toxic", "blood", "galaxy", "white", "shadow", "sparks", "3d cubes", "3d spheres", "3d neon", "3d rainbow", "3d rainbow orbs", "3d fire", "3d ice", "3d gold", "3d confetti", "3d bubbles", "3d rings", "3d stars", "3d orbit", "3d tiles", "3d snow", "3d lava", "3d galaxy", "3d toxic", "3d candy", "3d ocean", "3d sakura", "3d matrix", "3d blood", "3d rain", "3d sparks", "3d shards", "3d disco", "3d ghost", "3d pixels", "3d comets", "3d plasma", "3d aurora", "3d emeralds", "3d rubies", "3d coins", "3d smoke", "3d embers", "3d midnight", "3d neon pink", "3d neon blue", "3d neon green", "3d cotton", "3d autumn", "3d forest", "3d steel", "3d sunset", "3d needles", "3d pillars", "3d halo", "3d jade", "3d coral", "3d amber", "3d sapphire", "3d lavender", "3d vapor", "3d inferno", "none" }
	local TRAIL3D = {
		["3d cubes"] = { shape = "Block", size = 0.8, pal = "accent", motion = "drift" },
		["3d spheres"] = { shape = "Ball", size = 0.9, pal = "accent", motion = "drift" },
		["3d neon"] = { shape = "Ball", size = 0.7, pal = "accent", motion = "drift", neon = true },
		["3d rainbow"] = { shape = "Block", size = 0.8, pal = "rainbow", motion = "drift" },
		["3d rainbow orbs"] = { shape = "Ball", size = 0.8, pal = "rainbow", motion = "drift", neon = true },
		["3d fire"] = { shape = "Ball", size = 0.9, pal = "fire", motion = "rise", neon = true },
		["3d ice"] = { shape = "Block", size = 0.7, pal = "ice", motion = "drift", neon = true },
		["3d gold"] = { shape = "Block", size = 0.7, pal = "gold", motion = "fall" },
		["3d confetti"] = { shape = "Block", size = 0.3, pal = "rainbow", motion = "fall", flat = true },
		["3d bubbles"] = { shape = "Ball", size = 1.4, pal = "ocean", motion = "rise", glass = true },
		["3d rings"] = { shape = "Cylinder", size = 1.1, pal = "accent", motion = "spin", flat = true },
		["3d stars"] = { shape = "Ball", size = 0.4, pal = "white", motion = "burst", neon = true },
		["3d orbit"] = { shape = "Ball", size = 0.55, pal = "accent", motion = "orbit", neon = true },
		["3d tiles"] = { shape = "Block", size = 1.1, pal = "accent", motion = "spin", flat = true },
		["3d snow"] = { shape = "Ball", size = 0.5, pal = "white", motion = "fall", slow = true },
		["3d lava"] = { shape = "Ball", size = 1.1, pal = "lava", motion = "rise", neon = true },
		["3d galaxy"] = { shape = "Ball", size = 0.45, pal = "galaxy", motion = "orbit", neon = true },
		["3d toxic"] = { shape = "Ball", size = 0.8, pal = "toxic", motion = "rise", neon = true },
		["3d candy"] = { shape = "Ball", size = 0.8, pal = "candy", motion = "drift" },
		["3d ocean"] = { shape = "Ball", size = 0.8, pal = "ocean", motion = "drift", glass = true },
		["3d sakura"] = { shape = "Block", size = 0.45, pal = "sakura", motion = "fall", flat = true, slow = true },
		["3d matrix"] = { shape = "Block", size = 0.35, pal = "matrix", motion = "fall", tall = true, neon = true },
		["3d blood"] = { shape = "Ball", size = 0.6, pal = "blood", motion = "fall" },
		["3d rain"] = { shape = "Block", size = 0.25, pal = "sky", motion = "fall", tall = true, fast = true },
		["3d sparks"] = { shape = "Block", size = 0.3, pal = "amber", motion = "burst", neon = true },
		["3d shards"] = { shape = "Wedge", size = 0.8, pal = "ice", motion = "burst" },
		["3d disco"] = { shape = "Block", size = 0.7, pal = "rainbow", motion = "spin", neon = true },
		["3d ghost"] = { shape = "Ball", size = 1.1, pal = "white", motion = "rise", glass = true, slow = true },
		["3d pixels"] = { shape = "Block", size = 0.35, pal = "accent", motion = "burst" },
		["3d comets"] = { shape = "Ball", size = 0.5, pal = "fire", motion = "burst", neon = true },
		["3d plasma"] = { shape = "Ball", size = 0.9, pal = "plasma", motion = "orbit", neon = true },
		["3d aurora"] = { shape = "Ball", size = 0.7, pal = "aurora", motion = "rise", neon = true },
		["3d emeralds"] = { shape = "Wedge", size = 0.7, pal = "emerald", motion = "spin" },
		["3d rubies"] = { shape = "Wedge", size = 0.7, pal = "ruby", motion = "spin" },
		["3d coins"] = { shape = "Cylinder", size = 0.9, pal = "gold", motion = "fall", flat = true },
		["3d smoke"] = { shape = "Ball", size = 1.5, pal = "smoke", motion = "rise", glass = true, slow = true },
		["3d embers"] = { shape = "Block", size = 0.25, pal = "ember", motion = "rise", neon = true },
		["3d midnight"] = { shape = "Ball", size = 0.8, pal = "midnight", motion = "drift", neon = true },
		["3d neon pink"] = { shape = "Block", size = 0.6, pal = "neon_pink", motion = "drift", neon = true },
		["3d neon blue"] = { shape = "Block", size = 0.6, pal = "neon_blue", motion = "drift", neon = true },
		["3d neon green"] = { shape = "Block", size = 0.6, pal = "neon_green", motion = "drift", neon = true },
		["3d cotton"] = { shape = "Ball", size = 1.2, pal = "cotton", motion = "rise", glass = true },
		["3d autumn"] = { shape = "Block", size = 0.5, pal = "autumn", motion = "fall", flat = true, slow = true },
		["3d forest"] = { shape = "Wedge", size = 0.6, pal = "forest", motion = "fall" },
		["3d steel"] = { shape = "Block", size = 0.7, pal = "steel", motion = "burst" },
		["3d sunset"] = { shape = "Ball", size = 0.9, pal = "sunset", motion = "drift", neon = true },
		["3d needles"] = { shape = "Block", size = 0.3, pal = "silver", motion = "fall", tall = true, fast = true },
		["3d pillars"] = { shape = "Block", size = 0.6, pal = "accent", motion = "rise", tall = true },
		["3d halo"] = { shape = "Cylinder", size = 1.6, pal = "white", motion = "spin", flat = true, neon = true },
		["3d jade"] = { shape = "Ball", size = 0.7, pal = "jade", motion = "orbit" },
		["3d coral"] = { shape = "Ball", size = 0.8, pal = "coral", motion = "drift" },
		["3d amber"] = { shape = "Block", size = 0.6, pal = "amber", motion = "spin", neon = true },
		["3d sapphire"] = { shape = "Wedge", size = 0.7, pal = "sapphire", motion = "burst" },
		["3d lavender"] = { shape = "Ball", size = 0.9, pal = "lavender", motion = "rise", glass = true },
		["3d vapor"] = { shape = "Block", size = 0.8, pal = "vapor", motion = "drift", neon = true },
		["3d inferno"] = { shape = "Wedge", size = 0.7, pal = "inferno", motion = "rise", neon = true },
	}

	local trail3d = { view = nil, parts = {}, lastSpawn = 0, lastPos = nil }

	local function clearTrail3d()
		for _, data in ipairs(trail3d.parts) do
			data.part:Destroy()
		end
		table.clear(trail3d.parts)
		trail3d.lastPos = nil
		if trail3d.view then
			trail3d.view:Destroy()
			trail3d.view = nil
		end
	end

	local function ensureTrail3dView()
		if trail3d.view and trail3d.view.Parent then
			return trail3d.view
		end
		local view = Instance.new("ViewportFrame")
		view.Size = UDim2.fromScale(1, 1)
		view.BackgroundTransparency = 1
		view.BorderSizePixel = 0
		view.Ambient = Color3.fromRGB(170, 170, 170)
		view.LightColor = Color3.fromRGB(255, 255, 255)
		view.LightDirection = Vector3.new(-1, -1.4, -0.8)
		view.ZIndex = 2
		view.Parent = trailGui
		local camera = Instance.new("Camera")
		camera.FieldOfView = 70
		camera.CFrame = CFrame.new(0, 0, 0)
		camera.Parent = view
		view.CurrentCamera = camera
		trail3d.view = view
		return view
	end

	local function trail3dColor(config, now)
		local pal = trailColorKey or config.pal
		if pal == "gradient" then
			pal = "accent"
		end
		if pal == "pastel" then
			return Color3.fromHSV((now * 0.3 + math.random() * 0.2) % 1, 0.3, 1)
		end
		if pal == "accent" then
			return math.random() < 0.5 and GREEN or DARK_GREEN
		elseif pal == "rainbow" then
			return Color3.fromHSV((now * 0.6 + math.random() * 0.15) % 1, 0.65, 1)
		end
		local palette = TRAIL_PALETTES[pal]
		if palette then
			return Color3.fromRGB(palette[1][1], palette[1][2], palette[1][3]):Lerp(Color3.fromRGB(palette[2][1], palette[2][2], palette[2][3]), math.random())
		end
		return GREEN
	end

	local function updateTrail3d(dt, mouse, now)
		local config = TRAIL3D[trailStyle]
		if not config then
			return
		end
		local view = ensureTrail3dView()
		local parts = trail3d.parts
		local size = trailGui.AbsoluteSize
		local height = math.max(size.Y, 1)
		local DEPTH = 20
		local scale = math.tan(math.rad(35)) * DEPTH
		local worldX = (mouse.X - size.X / 2) / (height / 2) * scale
		local worldY = -(mouse.Y - size.Y / 2) / (height / 2) * scale
		local here = Vector3.new(worldX, worldY, -DEPTH)
		local moved = trail3d.lastPos == nil or (here - trail3d.lastPos).Magnitude > 0.5
		if moved and now - trail3d.lastSpawn > 0.03 and #parts < (perf.low and 16 or 30) then
			trail3d.lastSpawn = now
			trail3d.lastPos = here
			local dim = config.size * (0.7 + math.random() * 0.6)
			local dims = Vector3.new(dim, dim, dim)
			if config.flat and config.shape == "Cylinder" then
				dims = Vector3.new(dim * 0.12, dim, dim)
			elseif config.flat then
				dims = Vector3.new(dim, dim * 0.12, dim)
			elseif config.tall then
				dims = Vector3.new(dim * 0.35, dim * 2.4, dim * 0.35)
			end
			local part = Instance.new(config.shape == "Wedge" and "WedgePart" or "Part")
			part.Anchored = true
			part.CanCollide = false
			part.CanQuery = false
			part.CanTouch = false
			part.CastShadow = false
			part.Material = config.neon and Enum.Material.Neon or (config.glass and Enum.Material.Glass or Enum.Material.SmoothPlastic)
			part.Color = trail3dColor(config, now)
			if config.shape == "Ball" then
				part.Shape = Enum.PartType.Ball
			elseif config.shape == "Cylinder" then
				part.Shape = Enum.PartType.Cylinder
			end
			part.Size = dims
			part.Parent = view
			local vel = Vector3.zero
			local motion = config.motion
			if motion == "drift" then
				vel = Vector3.new((math.random() - 0.5) * 5, (math.random() - 0.5) * 5, (math.random() - 0.5) * 3)
			elseif motion == "rise" then
				vel = Vector3.new((math.random() - 0.5) * 2.5, 3 + math.random() * 3, 0)
			elseif motion == "fall" then
				vel = Vector3.new((math.random() - 0.5) * 2.5, config.fast and -14 or (config.slow and -1.5 or -4), 0)
			elseif motion == "burst" then
				vel = Vector3.new((math.random() - 0.5) * 16, (math.random() - 0.5) * 16, (math.random() - 0.5) * 8)
			end
			table.insert(parts, {
				part = part,
				dims = dims,
				pos = here + Vector3.new((math.random() - 0.5) * 0.8, (math.random() - 0.5) * 0.8, (math.random() - 0.5) * 0.8),
				base = here,
				vel = vel,
				rot = Vector3.new(math.random() * 6, math.random() * 6, math.random() * 6),
				spin = Vector3.new(math.random() * 6 - 3, math.random() * 6 - 3, math.random() * 6 - 3),
				age = 0,
				life = 0.55 + math.random() * 0.35,
				phase = math.random() * 6,
				motion = motion,
				glass = config.glass,
			})
		end
		for index = #parts, 1, -1 do
			local data = parts[index]
			data.age = data.age + dt
			if data.age >= data.life then
				data.part:Destroy()
				table.remove(parts, index)
			else
				local fade = data.age / data.life
				if data.motion == "orbit" then
					local angle = data.phase + data.age * 9
					data.pos = data.base + Vector3.new(math.cos(angle) * 1.4, math.sin(angle) * 1.4, math.sin(angle * 0.7) * 0.8)
				elseif data.motion == "burst" then
					data.vel = data.vel * (1 - math.min(1, dt * 3))
					data.pos = data.pos + data.vel * dt
				else
					data.pos = data.pos + data.vel * dt
				end
				data.rot = data.rot + data.spin * dt
				data.part.CFrame = CFrame.new(data.pos) * CFrame.Angles(data.rot.X, data.rot.Y, data.rot.Z)
				data.part.Size = data.dims * math.max(0.08, 1 - 0.8 * fade)
				data.part.Transparency = (data.glass and 0.45 or 0.05) + (1 - (data.glass and 0.45 or 0.05)) * fade * fade
			end
		end
	end

	local TRAIL_INFO = {}
	for _, name in ipairs(TRAIL_STYLES) do
		TRAIL_INFO[name] = { shape = "classic" }
	end
	TRAIL_INFO.thin.shape = "thin"
	TRAIL_INFO.thick.shape = "thick"
	TRAIL_INFO.dotted.shape = "dotted"
	TRAIL_INFO.dashed.shape = "dashed"
	TRAIL_INFO.glow.shape = "glow"
	TRAIL_INFO.sparks.shape = "sparks"
	TRAIL_INFO.gradient.pal = "gradient"
	TRAIL_INFO.rainbow.pal = "rainbow"
	TRAIL_INFO["rainbow thick"].pal = "rainbow"
	TRAIL_INFO["rainbow thick"].shape = "thick"
	TRAIL_INFO.pastel.pal = "pastel"
	for _, name in ipairs({ "hairline", "bold", "ribbon", "beads", "morse", "stitch" }) do
		TRAIL_INFO[name] = { shape = name }
	end
	TRAIL_INFO.epic = { shape = "classic" }
	TRAIL_INFO.blink = { shape = "classic" }
	do
		local extra = {}
		local seen = {}
		for _, name in ipairs(TRAIL_STYLES) do
			seen[name] = true
		end
		local palNames = {}
		for key in pairs(TRAIL_PALETTES) do
			palNames[#palNames + 1] = key
		end
		table.sort(palNames)
		for _, key in ipairs(palNames) do
			local label = string.gsub(key, "_", " ")
			if not seen[label] then
				seen[label] = true
				TRAIL_INFO[label] = { pal = key, shape = "classic" }
				extra[#extra + 1] = label
			elseif TRAIL_INFO[label] then
				TRAIL_INFO[label].pal = key
			end
		end
		local combos = { "rainbow", "fire", "ice", "gold", "lava", "ocean", "galaxy", "toxic", "candy", "sunset", "aurora", "neon pink", "neon blue", "plasma" }
		local mods = { "thin", "thick", "dotted", "dashed", "glow", "long", "short" }
		for _, pal in ipairs(combos) do
			local palKey = string.gsub(pal, " ", "_")
			for _, mod in ipairs(mods) do
				local label = pal .. " " .. mod
				if not seen[label] then
					seen[label] = true
					local shape = (mod == "long" or mod == "short") and "classic" or mod
					TRAIL_INFO[label] = { pal = palKey, shape = shape, life = TRAIL_LIFE_BY[mod] }
					extra[#extra + 1] = label
				end
			end
		end
		table.sort(extra)
		for _, label in ipairs(extra) do
			table.insert(TRAIL_STYLES, label)
		end
	end
	local trailButtons = {}
	local colorButtons = {}

	local TRAIL_LOOKS = { "none", "classic", "thin", "thick", "dotted", "dashed", "glow", "sparks", "long", "short", "hairline", "bold", "ribbon", "beads", "morse", "stitch", "epic", "blink" }
	for _, name in ipairs(TRAIL_STYLES) do
		if TRAIL3D[name] then
			table.insert(TRAIL_LOOKS, name)
		end
	end

	local TRAIL_COLORS = { "auto", "theme", "rainbow", "pastel", "gradient" }
	do
		local names = {}
		for key in pairs(TRAIL_PALETTES) do
			names[#names + 1] = (string.gsub(key, "_", " "))
		end
		table.sort(names)
		for _, name in ipairs(names) do
			table.insert(TRAIL_COLORS, name)
		end
	end

	local function refreshTrailMenu()
		for name, button in pairs(trailButtons) do
			setButtonActive(button, name == trailStyle)
		end
		for name, button in pairs(colorButtons) do
			setButtonActive(button, name == trailColorName)
		end
	end

	local function applyTrail()
		local info = TRAIL_INFO[trailStyle] or TRAIL_INFO.classic
		trailShape = info.shape
		trailLife = TRAIL_LIFE_BY[trailStyle] or TRAIL_LIFE
		if trailColorName == "auto" then
			trailColorKey = nil
			trailPal = nil
		elseif trailColorName == "theme" then
			trailColorKey = "accent"
			trailPal = nil
		else
			trailColorKey = (string.gsub(trailColorName, " ", "_"))
			trailPal = trailColorKey
		end
		if TRAIL3D[trailStyle] then
			trailShape = "3d"
			trailPal = nil
		end
		clearTrail3d()
		if trailStyle == "none" then
			clearTrail()
		end
		refreshTrailMenu()
	end

	local function setTrailLook(name)
		for _, candidate in ipairs(TRAIL_LOOKS) do
			if candidate == name then
				trailStyle = name
				applyTrail()
			end
		end
	end

	local function setTrailColor(name)
		for _, candidate in ipairs(TRAIL_COLORS) do
			if candidate == name then
				trailColorName = name
				applyTrail()
			end
		end
	end

	local function setTrail(name)
		local look, color = string.match(name, "^(.-)|(.+)$")
		if look then
			setTrailLook(look)
			setTrailColor(color)
			return
		end
		local info = TRAIL_INFO[name]
		if not info then
			return
		end
		if TRAIL3D[name] or name == "none" then
			setTrailLook(name)
			return
		end
		local shapeLook = info.shape
		if TRAIL_LIFE_BY[name] then
			shapeLook = name
		end
		setTrailLook(shapeLook)
		if info.pal then
			setTrailColor((string.gsub(info.pal, "_", " ")))
		end
	end
	audioLevels.setTrail = setTrail
	audioLevels.getTrail = function()
		return trailStyle .. "|" .. trailColorName
	end

	local trailMenu = createSideMenu({ title = "trail", custom = true })
	trailMenu.build = function()
	for index, name in ipairs(TRAIL_LOOKS) do
		local button = makeButton(trailMenu.scroll, name, 0, 0)
		button.Size = UDim2.new(1, 0, 0, 28)
		button.MouseButton1Click:Connect(function()
			setTrailLook(name)
		end)
		trailButtons[name] = button
	end
	ui.lookEnd = ui.arrange(trailMenu, trailButtons, { "none" }, { "look", "3d look" })
	for index, name in ipairs(TRAIL_COLORS) do
		local button = makeButton(trailMenu.scroll, name, 0, 0)
		button.Size = UDim2.new(1, 0, 0, 28)
		button.MouseButton1Click:Connect(function()
			setTrailColor(name)
		end)
		colorButtons[name] = button
	end
	ui.colorHeading = makeNote(trailMenu.scroll, "colors", 0, 0)
	ui.colorHeading.Size = UDim2.new(1, 0, 0, 18)
	ui.colorHeading.LayoutOrder = ui.lookEnd + 1
	ui.arrange(trailMenu, colorButtons, { "auto", "theme" }, { false })
	for _, button in pairs(colorButtons) do
		button.LayoutOrder = button.LayoutOrder + ui.lookEnd + 1
	end
	refreshTrailMenu()
	end
	ui.trailMenuButton.MouseButton1Click:Connect(trailMenu.open)

	local clickMenu = createSideMenu({ title = "click effects", custom = true })
	local effectButtons = {}
	local function refreshEffectMenu()
		for index, button in ipairs(effectButtons) do
			setButtonActive(button, index == effectIndex)
		end
	end
	clickMenu.build = function()
	for index, effect in ipairs(EFFECTS) do
		local button = makeButton(clickMenu.scroll, effect, 0, 0)
		button.Size = UDim2.new(1, 0, 0, 28)
		button.MouseButton1Click:Connect(function()
			effectIndex = index
			refreshEffectMenu()
		end)
		effectButtons[index] = button
		ui.effectMap = ui.effectMap or {}
		ui.effectMap[effect] = button
	end
	ui.arrange(clickMenu, ui.effectMap, { "none" }, { "2d", "3d" })
	refreshEffectMenu()
	end
	ui.clickMenuButton.MouseButton1Click:Connect(clickMenu.open)
	audioLevels.getEffect = function()
		return EFFECTS[effectIndex]
	end
	audioLevels.setEffect = function(name)
		for index, effect in ipairs(EFFECTS) do
			if effect == name then
				effectIndex = index
				refreshEffectMenu()
			end
		end
	end

	local function spawnRing(origin, delay, life, maxSize, thickness)
		local ring = newFrame(true)
		ring.BackgroundTransparency = 1
		ring.Position = UDim2.fromOffset(origin.X, origin.Y)
		ring.Size = UDim2.fromOffset(8, 8)
		ring.Visible = false
		table.insert(particles, {
			kind = "ring",
			obj = ring,
			stroke = addStroke(ring, GREEN, 0, thickness),
			age = -delay,
			life = life,
			maxSize = maxSize,
			thick = thickness,
		})
	end

	local fxGroups = {}

	local function newGroup(origin)
		if #fxGroups >= 5 then
			return nil
		end
		local view = Instance.new("ViewportFrame")
		view.AnchorPoint = Vector2.new(0.5, 0.5)
		view.Position = UDim2.fromOffset(origin.X, origin.Y)
		view.Size = UDim2.fromOffset(620, 620)
		view.BackgroundTransparency = 1
		view.BorderSizePixel = 0
		view.Ambient = Color3.fromRGB(165, 165, 165)
		view.LightColor = Color3.fromRGB(255, 255, 255)
		view.LightDirection = Vector3.new(-1, -1.4, -0.8)
		view.ZIndex = 2
		view.Parent = trailGui
		local camera = Instance.new("Camera")
		camera.FieldOfView = 50
		camera.CFrame = CFrame.new(0, 0, 0)
		camera.Parent = view
		view.CurrentCamera = camera
		local group = { view = view, parts = {} }
		table.insert(fxGroups, group)
		return group
	end

	local function randomDirection()
		local direction = Vector3.new(math.random() * 2 - 1, math.random() * 2 - 1, (math.random() * 2 - 1) * 0.6)
		if direction.Magnitude < 0.1 then
			return Vector3.new(0, 1, 0)
		end
		return direction.Unit
	end

	local function add3d(group, shape, size, alt, data, neon)
		local part = Instance.new(shape == "Wedge" and "WedgePart" or "Part")
		part.Anchored = true
		part.CanCollide = false
		part.CanQuery = false
		part.CanTouch = false
		part.CastShadow = false
		part.Material = neon and Enum.Material.Neon or Enum.Material.SmoothPlastic
		part.Size = size
		part.Color = alt and DARK_GREEN or GREEN
		if shape == "Ball" then
			part.Shape = Enum.PartType.Ball
		elseif shape == "Cylinder" then
			part.Shape = Enum.PartType.Cylinder
		end
		part.Parent = group.view
		data.part = part
		data.size = size
		data.rot = data.rot or Vector3.zero
		data.age = 0
		data.spin = data.spin or Vector3.zero
		data.gravity = data.gravity or Vector3.zero
		data.vel = data.vel or Vector3.zero
		data.pos = data.pos or Vector3.zero
		table.insert(group.parts, data)
	end

	local CENTER = Vector3.new(0, 0, -24)

	local function spawn3d(effect, origin)
		local group = newGroup(origin)
		if not group then
			return
		end
		local cfg = ui.FX3D[effect]
		if cfg then
			for index = 1, cfg.n do
				local scale = cfg.min + math.random() * (cfg.max - cfg.min)
				local dims = cfg.dims and cfg.dims * scale or Vector3.new(scale, scale, scale)
				local direction = randomDirection()
				if cfg.up then
					direction = Vector3.new(direction.X * 0.5, math.abs(direction.Y) + 0.6, direction.Z * 0.5).Unit
				end
				add3d(group, cfg.shape, dims, index % 2 == 0, {
					kind = cfg.streak and "streak" or nil,
					pos = CENTER,
					vel = direction * (cfg.v1 + math.random() * (cfg.v2 - cfg.v1)),
					spin = Vector3.new(math.random(), math.random(), math.random()) * (cfg.spin or 0),
					gravity = Vector3.new(0, cfg.g or 0, 0),
					life = cfg.life + math.random() * 0.4,
					shrink = cfg.shrink,
				}, cfg.neon)
			end
			return
		end
		if effect == "3d cubes" then
			for index = 1, 18 do
				local size = 0.5 + math.random() * 0.8
				add3d(group, "Block", Vector3.new(size, size, size), index % 2 == 0, {
					pos = CENTER,
					vel = randomDirection() * math.random(8, 20),
					spin = Vector3.new(math.random() * 8, math.random() * 8, math.random() * 8),
					gravity = Vector3.new(0, -14, 0),
					life = 0.9 + math.random() * 0.5,
				})
			end
		elseif effect == "3d spheres" then
			for index = 1, 14 do
				local size = 0.7 + math.random() * 1
				add3d(group, "Ball", Vector3.new(size, size, size), index % 2 == 0, {
					pos = CENTER,
					vel = randomDirection() * math.random(5, 15),
					life = 0.8 + math.random() * 0.5,
					shrink = true,
				})
			end
		elseif effect == "3d ring" then
			for ring = 1, 3 do
				for index = 1, 20 do
					add3d(group, "Block", Vector3.new(0.45, 0.45, 0.45), ring == 2, {
						kind = "ring",
						center = CENTER,
						angle = index / 20 * math.pi * 2,
						maxR = 4 + ring * 2.5,
						turn = (ring % 2 == 0 and -1 or 1) * 3,
						spin = Vector3.new(5, 4, 3),
						life = 0.65 + ring * 0.1,
						shrink = true,
					}, true)
				end
			end
		elseif effect == "3d spiral" then
			for index = 1, 30 do
				add3d(group, "Block", Vector3.new(0.5, 0.5, 0.5), index % 2 == 0, {
					kind = "spiral",
					center = CENTER,
					index = index,
					spin = Vector3.new(4, 6, 0),
					life = 1,
					shrink = true,
				})
			end
		elseif effect == "3d shards" then
			for index = 1, 14 do
				local size = 0.7 + math.random() * 1
				add3d(group, "Wedge", Vector3.new(size * 0.4, size, size), index % 2 == 0, {
					pos = CENTER,
					vel = randomDirection() * math.random(9, 24),
					spin = Vector3.new(math.random() * 14, math.random() * 14, math.random() * 14),
					life = 0.8 + math.random() * 0.4,
					shrink = true,
				})
			end
		elseif effect == "3d fountain" then
			for index = 1, 22 do
				local size = 0.4 + math.random() * 0.5
				add3d(group, "Block", Vector3.new(size, size, size), index % 2 == 0, {
					pos = CENTER,
					vel = Vector3.new((math.random() - 0.5) * 12, math.random(14, 26), (math.random() - 0.5) * 6),
					spin = Vector3.new(math.random() * 6, math.random() * 6, math.random() * 6),
					gravity = Vector3.new(0, -32, 0),
					life = 1.1 + math.random() * 0.4,
				})
			end
		elseif effect == "3d tornado" then
			for index = 1, 34 do
				add3d(group, "Block", Vector3.new(0.5, 0.5, 0.5), index % 2 == 0, {
					kind = "tornado",
					center = CENTER,
					index = index,
					count = 34,
					spin = Vector3.new(3, 5, 2),
					life = 1.1,
					shrink = true,
				})
			end
		elseif effect == "3d galaxy" then
			for index = 1, 48 do
				local size = 0.35 + math.random() * 0.35
				add3d(group, "Ball", Vector3.new(size, size, size), index % 3 == 0, {
					kind = "galaxy",
					center = CENTER,
					index = index,
					count = 48,
					life = 1.2,
					shrink = true,
				}, true)
			end
		elseif effect == "3d crystals" then
			for index = 1, 11 do
				add3d(group, "Block", Vector3.new(0.45, 2.2, 0.45), index % 2 == 0, {
					pos = CENTER,
					vel = randomDirection() * math.random(7, 16),
					rot = Vector3.new(math.random() * 6, math.random() * 6, math.random() * 6),
					spin = Vector3.new(math.random() * 3, math.random() * 3, math.random() * 3),
					life = 0.9 + math.random() * 0.4,
					shrink = true,
				})
			end
		elseif effect == "3d dna" then
			for strand = 0, 1 do
				for index = 1, 18 do
					add3d(group, "Ball", Vector3.new(0.7, 0.7, 0.7), strand == 1, {
						kind = "dna",
						center = CENTER,
						index = index,
						count = 18,
						strand = strand,
						life = 1.2,
						shrink = true,
					})
				end
			end
		elseif effect == "3d rain" then
			for index = 1, 28 do
				local size = 0.4 + math.random() * 0.6
				add3d(group, "Block", Vector3.new(size, size, size), index % 2 == 0, {
					pos = CENTER + Vector3.new((math.random() - 0.5) * 16, 9 + math.random() * 4, (math.random() - 0.5) * 6),
					vel = Vector3.new(0, -math.random(10, 20), 0),
					spin = Vector3.new(math.random() * 6, math.random() * 6, math.random() * 6),
					gravity = Vector3.new(0, -22, 0),
					life = 0.9 + math.random() * 0.4,
				})
			end
		elseif effect == "3d vortex" then
			for index = 1, 36 do
				add3d(group, "Block", Vector3.new(0.45, 0.45, 0.45), index % 2 == 0, {
					kind = "vortex",
					center = CENTER,
					index = index,
					count = 36,
					spin = Vector3.new(4, 5, 3),
					life = 1,
					shrink = true,
				}, true)
			end
		elseif effect == "3d pillars" then
			for index = 1, 9 do
				add3d(group, "Block", Vector3.new(0.9, 0.9, 0.9), index % 2 == 0, {
					kind = "pillar",
					center = CENTER,
					offset = (index - 5) * 1.6,
					maxH = 4 + (5 - math.abs(index - 5)) * 1.6,
					life = 0.9,
				})
			end
		elseif effect == "3d confetti" then
			for index = 1, 30 do
				add3d(group, "Block", Vector3.new(0.7, 0.06, 0.45), index % 2 == 0, {
					pos = CENTER,
					vel = Vector3.new((math.random() - 0.5) * 20, math.random(6, 18), (math.random() - 0.5) * 8),
					rot = Vector3.new(math.random() * 6, math.random() * 6, math.random() * 6),
					spin = Vector3.new(math.random() * 10, math.random() * 10, math.random() * 10),
					gravity = Vector3.new(0, -16, 0),
					life = 1.1 + math.random() * 0.5,
				})
			end
		elseif effect == "3d pulse" then
			for index = 1, 3 do
				add3d(group, "Cylinder", Vector3.new(0.25, 1, 1), index == 2, {
					kind = "disc",
					pos = CENTER,
					maxD = 8 + index * 4,
					life = 0.5 + index * 0.12,
				}, true)
			end
		elseif effect == "3d tiles" then
			for index = 1, 22 do
				add3d(group, "Block", Vector3.new(0.9, 0.08, 0.9), index % 2 == 0, {
					pos = CENTER,
					vel = randomDirection() * math.random(8, 20),
					rot = Vector3.new(math.random() * 6, math.random() * 6, math.random() * 6),
					spin = Vector3.new(math.random() * 9, math.random() * 9, math.random() * 9),
					life = 0.8 + math.random() * 0.4,
					shrink = true,
				})
			end
		elseif effect == "3d orbit" then
			for index = 1, 28 do
				add3d(group, "Ball", Vector3.new(0.6, 0.6, 0.6), index % 2 == 0, {
					kind = "orbit3",
					center = CENTER,
					angle = index / 14 * math.pi,
					dir = index % 2 == 0 and 1 or -1,
					reach = index > 14 and 4.5 or 7,
					life = 1,
					shrink = true,
				}, true)
			end
		elseif effect == "3d bubbles" then
			for index = 1, 12 do
				local size = 0.6 + math.random() * 0.9
				add3d(group, "Ball", Vector3.new(size, size, size), index % 2 == 0, {
					pos = CENTER + Vector3.new((math.random() - 0.5) * 3, (math.random() - 0.5) * 2, 0),
					vel = Vector3.new((math.random() - 0.5) * 5, math.random(5, 11), (math.random() - 0.5) * 2),
					life = 1 + math.random() * 0.5,
				})
			end
		elseif effect == "3d streaks" then
			for index = 1, 16 do
				local direction = randomDirection()
				add3d(group, "Block", Vector3.new(0.22, 0.22, 2.6), index % 2 == 0, {
					kind = "streak",
					pos = CENTER,
					vel = direction * math.random(18, 40),
					life = 0.55 + math.random() * 0.25,
				}, true)
			end
		end
	end

	local function update3d(dt)
		for groupIndex = #fxGroups, 1, -1 do
			local group = fxGroups[groupIndex]
			local parts = group.parts
			for index = #parts, 1, -1 do
				local data = parts[index]
				data.age = data.age + dt
				if data.age >= data.life then
					data.part:Destroy()
					table.remove(parts, index)
				else
					local fade = data.age / data.life
					local ease = 1 - (1 - fade) ^ 3
					local kind = data.kind
					local orient
					if kind == "ring" then
						local angle = data.angle + data.turn * fade
						data.pos = data.center + Vector3.new(math.cos(angle) * data.maxR * ease, math.sin(angle) * data.maxR * ease, 0)
					elseif kind == "spiral" then
						local radius = 7 * ease
						local angle = data.index * 0.5 + fade * 9
						data.pos = data.center + Vector3.new(math.cos(angle) * radius, math.sin(angle) * radius, (data.index - 15) * 0.5 * fade)
					elseif kind == "tornado" then
						local t = data.index / data.count
						local angle = data.index * 0.6 + data.age * 12
						local radius = (0.6 + t * 4.5) * ease
						data.pos = data.center + Vector3.new(math.cos(angle) * radius, -6 + t * 13 * ease, math.sin(angle) * radius * 0.5)
					elseif kind == "galaxy" then
						local t = data.index / data.count
						local radius = t * 10 * ease
						local angle = (data.index % 3) * 2.094 + radius * 0.55 + data.age * 3
						data.pos = data.center + Vector3.new(math.cos(angle) * radius, math.sin(angle) * radius * 0.45, math.sin(angle) * radius * 0.5)
					elseif kind == "dna" then
						local t = data.index / data.count
						local angle = t * 6 + data.age * 8 + data.strand * math.pi
						data.pos = data.center + Vector3.new(math.cos(angle) * 2.8, (t - 0.5) * 15 * ease, math.sin(angle) * 2.8)
					elseif kind == "orbit3" then
						local angle = data.angle + data.age * 7 * data.dir
						local radius = data.reach * ease
						data.pos = data.center + Vector3.new(math.cos(angle) * radius, math.sin(angle) * radius * 0.5, math.sin(angle) * radius * 0.8)
					elseif kind == "vortex" then
						local t = data.index / data.count
						local angle = t * 8 + data.age * 10
						local radius = (1 + ease * 7) * (0.4 + t * 0.6)
						data.pos = data.center + Vector3.new(math.cos(angle) * radius, (t - 0.5) * 10, math.sin(angle) * radius * 0.5)
					elseif kind == "pillar" then
						local height = math.max(0.1, data.maxH * ease)
						data.part.Size = Vector3.new(0.9, height, 0.9)
						orient = CFrame.new(data.center.X + data.offset, data.center.Y - 6 + height / 2, data.center.Z)
					elseif kind == "disc" then
						local diameter = math.max(0.2, data.maxD * ease)
						data.part.Size = Vector3.new(0.25, diameter, diameter)
						orient = CFrame.new(data.pos) * CFrame.Angles(0, math.pi / 2, 0)
					elseif kind == "streak" then
						data.pos = data.pos + data.vel * dt
						orient = CFrame.lookAt(data.pos, data.pos + data.vel)
					else
						data.vel = data.vel + data.gravity * dt
						data.pos = data.pos + data.vel * dt
					end
					data.rot = data.rot + data.spin * dt
					if orient then
						data.part.CFrame = orient
					else
						data.part.CFrame = CFrame.new(data.pos) * CFrame.Angles(data.rot.X, data.rot.Y, data.rot.Z)
					end
					data.part.Transparency = 0.05 + 0.95 * fade * fade
					if data.shrink then
						data.part.Size = data.size * math.max(0.05, 1 - 0.7 * fade)
					end
				end
			end
			if #parts == 0 then
				group.view:Destroy()
				table.remove(fxGroups, groupIndex)
			end
		end
	end

	local function spawnClick(origin)
		local effect = EFFECTS[effectIndex]
		if effect == "none" or #particles > (perf.low and 50 or MAX_PARTICLES) then
			return
		end
		if effect:sub(1, 2) == "3d" then
			spawn3d(effect, origin)
			return
		end
		local cfg = ui.FX2D[effect]
		if cfg then
			for ring = 1, cfg.rings or 0 do
				spawnRing(origin, (ring - 1) * 0.1, 0.5, (cfg.ringSize or 120) * (1 - (ring - 1) * 0.2), 2)
			end
			for index = 1, cfg.n do
				local width = math.random(cfg.w1, cfg.w2)
				local height = cfg.h1 and math.random(cfg.h1, cfg.h2) or width
				local piece = newFrame(false)
				piece.Size = UDim2.fromOffset(width, height)
				piece.Position = UDim2.fromOffset(origin.X, origin.Y)
				if cfg.rainbow then
					piece.BackgroundColor3 = Color3.fromHSV(math.random(), 0.7, 1)
				else
					piece.BackgroundColor3 = math.random() < 0.5 and GREEN or DARK_GREEN
				end
				local angle = math.random() * math.pi * 2
				local dirs = cfg.dirs
				if dirs == "up" then
					angle = -math.pi / 2 + (math.random() - 0.5) * 1.2
				elseif dirs == "down" then
					angle = math.pi / 2 + (math.random() - 0.5) * 1.2
				elseif dirs == "plus" then
					angle = (index % 4) * math.pi / 2
				elseif dirs == "x" then
					angle = math.pi / 4 + (index % 4) * math.pi / 2
				elseif dirs == "even" then
					angle = index / cfg.n * math.pi * 2
				elseif dirs == "side" then
					angle = (index % 2) * math.pi + (math.random() - 0.5) * 0.6
				end
				local speed = math.random(cfg.v1, cfg.v2)
				local life = cfg.life + math.random() * 0.3
				if cfg.orbit then
					table.insert(particles, {
						kind = "orbit",
						obj = piece,
						origin = origin,
						angle = angle,
						turn = cfg.turn or 6,
						maxR = speed * 0.5,
						size = width,
						age = 0,
						life = life,
					})
				else
					piece.Rotation = cfg.point and math.deg(angle) or math.random(0, 90)
					table.insert(particles, {
						kind = "dart",
						obj = piece,
						pos = origin,
						vel = Vector2.new(math.cos(angle) * speed, math.sin(angle) * speed),
						age = 0,
						life = life,
					})
				end
			end
			return
		end
		if effect == "burst" or effect == "rainbow" then
			spawnRing(origin, 0, 0.55, 160, 3)
			spawnRing(origin, 0.12, 0.55, 105, 3)
			for _ = 1, SHARD_COUNT do
				local size = math.random(6, 11)
				local shard = newFrame(false)
				shard.Size = UDim2.fromOffset(size, size)
				shard.Position = UDim2.fromOffset(origin.X, origin.Y)
				shard.Rotation = math.random(0, 90)
				if effect == "rainbow" then
						shard.BackgroundColor3 = Color3.fromHSV(math.random(), 0.7, 1)
					else
						shard.BackgroundColor3 = math.random() < 0.5 and GREEN or DARK_GREEN
					end
				local angle = math.random() * math.pi * 2
				local speed = math.random(160, 430)
				table.insert(particles, {
					kind = "shard",
					obj = shard,
					pos = origin,
					vel = Vector2.new(math.cos(angle) * speed, math.sin(angle) * speed),
					spin = (math.random() < 0.5 and -1 or 1) * math.random(300, 900),
					age = 0,
					life = 0.55 + math.random() * 0.35,
					size = size,
				})
			end
		elseif effect == "firework" then
			for _ = 1, 20 do
				local streak = newFrame(false)
				streak.Size = UDim2.fromOffset(2, math.random(10, 18))
				streak.Position = UDim2.fromOffset(origin.X, origin.Y)
				streak.BackgroundColor3 = math.random() < 0.5 and GREEN or DARK_GREEN
				local angle = math.random() * math.pi * 2
				streak.Rotation = math.deg(angle) + 90
				local speed = math.random(220, 520)
				table.insert(particles, {
					kind = "confetti",
					obj = streak,
					pos = origin,
					vel = Vector2.new(math.cos(angle) * speed, math.sin(angle) * speed),
					spin = 0,
					age = 0,
					life = 0.7 + math.random() * 0.4,
				})
			end
			spawnRing(origin, 0, 0.4, 60, 2)
		elseif effect == "squares" then
			for index = 1, 4 do
				local box = newFrame(false)
				box.BackgroundTransparency = 1
				box.Position = UDim2.fromOffset(origin.X, origin.Y)
				box.Size = UDim2.fromOffset(8, 8)
				box.Visible = false
				table.insert(particles, {
					kind = "ring",
					obj = box,
					stroke = addStroke(box, GREEN, 0, 2),
					age = -(index - 1) * 0.1,
					life = 0.7,
					maxSize = 150 - index * 20,
					thick = 2,
					turn = (index % 2 == 0 and -1 or 1) * 120,
				})
			end
		elseif effect == "bloom" then
			for _ = 1, 26 do
				local size = math.random(5, 12)
				local petal = newFrame(true)
				petal.Size = UDim2.fromOffset(size, size)
				petal.Position = UDim2.fromOffset(origin.X, origin.Y)
				petal.BackgroundColor3 = math.random() < 0.5 and GREEN or DARK_GREEN
				local angle = math.random() * math.pi * 2
				local speed = math.random(40, 230)
				table.insert(particles, {
					kind = "spark",
					obj = petal,
					pos = origin,
					vel = Vector2.new(math.cos(angle) * speed, math.sin(angle) * speed),
					age = 0,
					life = 0.6 + math.random() * 0.5,
					size = size,
				})
			end
		elseif effect == "bubbles" or effect == "orbs" then
			for _ = 1, effect == "orbs" and 6 or 11 do
				local size = effect == "orbs" and math.random(22, 48) or math.random(12, 34)
				local bubble = newFrame(true)
				bubble.BackgroundColor3 = GREEN
				bubble.BackgroundTransparency = 0.88
				bubble.Size = UDim2.fromOffset(size, size)
				bubble.Position = UDim2.fromOffset(origin.X, origin.Y)
				local shine = Instance.new("Frame")
				shine.BackgroundColor3 = GREEN
				shine.BackgroundTransparency = 0.35
				shine.BorderSizePixel = 0
				shine.Position = UDim2.fromScale(0.2, 0.18)
				shine.Size = UDim2.fromScale(0.24, 0.24)
				shine.Parent = bubble
				local shineCorner = Instance.new("UICorner")
				shineCorner.CornerRadius = UDim.new(1, 0)
				shineCorner.Parent = shine
				table.insert(particles, {
					kind = "bubble",
					obj = bubble,
					shine = shine,
					stroke = addStroke(bubble, GREEN, 0.25, 1.5),
					pos = origin + Vector2.new(math.random(-16, 16), math.random(-6, 6)),
					rise = math.random(50, 140),
					sway = math.random() * 6,
					wobble = 5 + math.random() * 10,
					size = size,
					age = -math.random() * 0.12,
					life = 0.9 + math.random() * 0.7,
				})
			end
		elseif effect == "shockwave" then
			spawnRing(origin, 0, 0.45, 230, 7)
			spawnRing(origin, 0.06, 0.55, 150, 4)
			spawnRing(origin, 0.14, 0.6, 90, 2)
		elseif effect == "snow" then
			for _ = 1, 18 do
				local size = math.random(3, 8)
				local flake = newFrame(true)
				flake.BackgroundColor3 = GREEN
				flake.Size = UDim2.fromOffset(size, size)
				flake.Position = UDim2.fromOffset(origin.X, origin.Y)
				table.insert(particles, {
					kind = "float",
					obj = flake,
					pos = origin + Vector2.new(math.random(-20, 20), math.random(-10, 10)),
					vel = Vector2.new(math.random(-40, 40), math.random(30, 110)),
					sway = math.random() * 6,
					swayAmt = 6 + math.random() * 8,
					age = 0,
					life = 0.9 + math.random() * 0.7,
				})
			end
		elseif effect == "fireflies" then
			for _ = 1, 14 do
				local size = math.random(4, 7)
				local fly = newFrame(true)
				fly.BackgroundColor3 = GREEN
				fly.Size = UDim2.fromOffset(size, size)
				fly.Position = UDim2.fromOffset(origin.X, origin.Y)
				table.insert(particles, {
					kind = "float",
					obj = fly,
					stroke = addStroke(fly, GREEN, 0.7, 4),
					pos = origin + Vector2.new(math.random(-18, 18), math.random(-18, 18)),
					vel = Vector2.new(math.random(-30, 30), -math.random(20, 90)),
					sway = math.random() * 6,
					swayAmt = 10 + math.random() * 14,
					age = 0,
					life = 1 + math.random() * 0.8,
				})
			end
		elseif effect == "spiral" then
			for index = 1, 16 do
				local size = math.random(4, 8)
				local dot = newFrame(true)
				dot.BackgroundColor3 = index % 2 == 0 and GREEN or DARK_GREEN
				dot.Size = UDim2.fromOffset(size, size)
				dot.Position = UDim2.fromOffset(origin.X, origin.Y)
				table.insert(particles, {
					kind = "orbit",
					obj = dot,
					origin = origin,
					angle = index / 16 * math.pi * 2,
					turn = 7,
					maxR = 60 + index * 7,
					size = size,
					age = 0,
					life = 0.75 + index * 0.02,
				})
			end
		elseif effect == "starburst" then
			for index = 1, 4 do
				local beam = newFrame(false)
				beam.BackgroundColor3 = GREEN
				beam.Size = UDim2.fromOffset(2, 3)
				beam.Rotation = (index - 1) * 45
				beam.Position = UDim2.fromOffset(origin.X, origin.Y)
				table.insert(particles, { kind = "line", obj = beam, maxLen = 170, age = 0, life = 0.5 })
			end
			spawnRing(origin, 0, 0.4, 70, 2)
		elseif effect == "shatter" then
			for _ = 1, 20 do
				local size = math.random(5, 10)
				local piece = newFrame(false)
				piece.Size = UDim2.fromOffset(size, size)
				piece.Position = UDim2.fromOffset(origin.X, origin.Y)
				piece.Rotation = math.random(0, 90)
				piece.BackgroundColor3 = math.random() < 0.5 and GREEN or DARK_GREEN
				local angle = math.random() * math.pi * 2
				local speed = math.random(120, 360)
				table.insert(particles, {
					kind = "confetti",
					obj = piece,
					pos = origin,
					vel = Vector2.new(math.cos(angle) * speed, math.sin(angle) * speed - 120),
					spin = (math.random() < 0.5 and -1 or 1) * math.random(200, 600),
					age = 0,
					life = 0.8 + math.random() * 0.5,
				})
			end
		elseif effect == "lightning" or effect == "zap" then
			for _ = 1, effect == "zap" and 7 or 3 do
				local point = origin
				local heading = math.random() * math.pi * 2
				for _ = 1, effect == "zap" and 7 or 5 do
					local nextHeading = heading + (math.random() - 0.5) * 1.4
					local length = math.random(18, 36)
					local target = point + Vector2.new(math.cos(nextHeading), math.sin(nextHeading)) * length
					local middle = (point + target) / 2
					local bolt = newFrame(false)
					bolt.BackgroundColor3 = GREEN
					bolt.Position = UDim2.fromOffset(middle.X, middle.Y)
					bolt.Size = UDim2.fromOffset(length + 2, 3)
					bolt.Rotation = math.deg(nextHeading)
					table.insert(particles, { kind = "static", obj = bolt, age = 0, life = 0.3 + math.random() * 0.15 })
					point = target
					heading = nextHeading
				end
			end
			spawnRing(origin, 0, 0.3, 50, 2)
		elseif effect == "ink" then
			for _ = 1, 5 do
				local blob = newFrame(true)
				blob.BackgroundColor3 = math.random() < 0.5 and GREEN or DARK_GREEN
				blob.Position = UDim2.fromOffset(origin.X + math.random(-28, 28), origin.Y + math.random(-28, 28))
				blob.Size = UDim2.fromOffset(10, 10)
				table.insert(particles, { kind = "flash", obj = blob, age = -math.random() * 0.15, life = 0.6 + math.random() * 0.3 })
			end
		elseif effect == "dust" then
			for _ = 1, 24 do
				local size = math.random(2, 4)
				local mote = newFrame(true)
				mote.BackgroundColor3 = GREEN
				mote.Size = UDim2.fromOffset(size, size)
				mote.Position = UDim2.fromOffset(origin.X, origin.Y)
				local angle = math.random() * math.pi * 2
				local speed = math.random(10, 70)
				table.insert(particles, {
					kind = "float",
					obj = mote,
					pos = origin,
					vel = Vector2.new(math.cos(angle) * speed, math.sin(angle) * speed - 15),
					sway = math.random() * 6,
					swayAmt = 3 + math.random() * 5,
					age = 0,
					life = 1.2 + math.random() * 0.8,
				})
			end
		elseif effect == "comet" then
			for _ = 1, 4 do
				local dart = newFrame(false)
				dart.BackgroundColor3 = GREEN
				dart.Size = UDim2.fromOffset(math.random(14, 24), 3)
				dart.Position = UDim2.fromOffset(origin.X, origin.Y)
				local angle = math.random() * math.pi * 2
				dart.Rotation = math.deg(angle)
				local speed = math.random(300, 560)
				table.insert(particles, {
					kind = "dart",
					obj = dart,
					pos = origin,
					vel = Vector2.new(math.cos(angle) * speed, math.sin(angle) * speed),
					age = 0,
					life = 0.45 + math.random() * 0.25,
				})
			end
		elseif effect == "gems" then
			for _ = 1, 16 do
				local size = math.random(7, 12)
				local gem = newFrame(false)
				gem.Size = UDim2.fromOffset(size, size)
				gem.Position = UDim2.fromOffset(origin.X, origin.Y)
				gem.Rotation = 45
				gem.BackgroundColor3 = Color3.fromHSV(math.random(), 0.35, 1)
				local angle = -math.pi / 2 + (math.random() - 0.5) * 2.6
				local speed = math.random(160, 380)
				table.insert(particles, {
					kind = "confetti",
					obj = gem,
					pos = origin,
					vel = Vector2.new(math.cos(angle) * speed, math.sin(angle) * speed),
					spin = (math.random() < 0.5 and -1 or 1) * math.random(300, 800),
					age = 0,
					life = 0.8 + math.random() * 0.5,
				})
			end
		elseif effect == "halo" then
			for index = 1, 18 do
				local dot = newFrame(true)
				dot.BackgroundColor3 = index % 2 == 0 and GREEN or DARK_GREEN
				dot.Size = UDim2.fromOffset(6, 6)
				dot.Position = UDim2.fromOffset(origin.X, origin.Y)
				table.insert(particles, {
					kind = "orbit",
					obj = dot,
					origin = origin,
					angle = index / 18 * math.pi * 2,
					turn = 1.5,
					maxR = 50,
					size = 6,
					age = 0,
					life = 0.7,
				})
			end
			spawnRing(origin, 0, 0.5, 100, 2)
		elseif effect == "rays" then
			for index = 1, 12 do
				local beam = newFrame(false)
				beam.BackgroundColor3 = index % 2 == 0 and GREEN or DARK_GREEN
				beam.Size = UDim2.fromOffset(2, 3)
				beam.Rotation = (index - 1) * 15
				beam.Position = UDim2.fromOffset(origin.X, origin.Y)
				table.insert(particles, { kind = "line", obj = beam, maxLen = 150, age = 0, life = 0.5 })
			end
		elseif effect == "echo" then
			for index = 0, 4 do
				spawnRing(origin, index * 0.08, 0.7, 50 + index * 35, 2)
			end
		elseif effect == "meteors" then
			for _ = 1, 7 do
				local dart = newFrame(false)
				dart.BackgroundColor3 = GREEN
				dart.Size = UDim2.fromOffset(math.random(30, 48), 3)
				dart.Position = UDim2.fromOffset(origin.X, origin.Y)
				local angle = math.random() * math.pi * 2
				dart.Rotation = math.deg(angle)
				local speed = math.random(500, 800)
				table.insert(particles, {
					kind = "dart",
					obj = dart,
					pos = origin,
					vel = Vector2.new(math.cos(angle) * speed, math.sin(angle) * speed),
					age = 0,
					life = 0.35 + math.random() * 0.2,
				})
			end
		elseif effect == "blossom" then
			for index = 1, 24 do
				local dot = newFrame(true)
				dot.BackgroundColor3 = index % 2 == 0 and GREEN or DARK_GREEN
				dot.Size = UDim2.fromOffset(6, 6)
				dot.Position = UDim2.fromOffset(origin.X, origin.Y)
				table.insert(particles, {
					kind = "orbit",
					obj = dot,
					origin = origin,
					angle = index / 24 * math.pi * 2,
					turn = 4,
					maxR = 70,
					size = 6,
					age = 0,
					life = 0.8,
				})
			end
			spawnRing(origin, 0, 0.4, 40, 2)
		elseif effect == "smoke" then
			for _ = 1, 10 do
				local size = math.random(14, 26)
				local puff = newFrame(true)
				puff.BackgroundColor3 = DARK_GREEN
				puff.Size = UDim2.fromOffset(size, size)
				puff.Position = UDim2.fromOffset(origin.X, origin.Y)
				table.insert(particles, {
					kind = "float",
					obj = puff,
					pos = origin + Vector2.new(math.random(-8, 8), math.random(-4, 4)),
					vel = Vector2.new(math.random(-25, 25), -math.random(20, 50)),
					sway = math.random() * 6,
					swayAmt = 8,
					age = 0,
					life = 1.2 + math.random() * 0.6,
				})
			end
		elseif effect == "glitch" then
			for _ = 1, 8 do
				local slab = newFrame(false)
				slab.BackgroundColor3 = math.random() < 0.5 and GREEN or DARK_GREEN
				slab.Size = UDim2.fromOffset(math.random(20, 70), math.random(3, 8))
				slab.Position = UDim2.fromOffset(origin.X + math.random(-40, 40), origin.Y + math.random(-26, 26))
				table.insert(particles, { kind = "static", obj = slab, age = -math.random() * 0.1, life = 0.25 + math.random() * 0.15 })
			end
		elseif effect == "cross" then
			for index = 0, 1 do
				local beam = newFrame(false)
				beam.BackgroundColor3 = GREEN
				beam.Size = UDim2.fromOffset(2, 3)
				beam.Rotation = index * 90
				beam.Position = UDim2.fromOffset(origin.X, origin.Y)
				table.insert(particles, { kind = "line", obj = beam, maxLen = 240, age = 0, life = 0.5 })
			end
			spawnRing(origin, 0, 0.4, 60, 2)
		elseif effect == "heartbeat" then
			spawnRing(origin, 0, 0.35, 60, 3)
			spawnRing(origin, 0.12, 0.35, 60, 3)
			spawnRing(origin, 0.45, 0.45, 110, 3)
			spawnRing(origin, 0.57, 0.45, 110, 3)
		elseif effect == "dotring" then
			for index = 1, 36 do
				local inner = index > 24
				local dot = newFrame(true)
				dot.BackgroundColor3 = inner and DARK_GREEN or GREEN
				dot.Size = UDim2.fromOffset(5, 5)
				dot.Position = UDim2.fromOffset(origin.X, origin.Y)
				table.insert(particles, {
					kind = "orbit",
					obj = dot,
					origin = origin,
					angle = index / (inner and 12 or 24) * math.pi * 2,
					turn = inner and 1 or 0,
					maxR = inner and 45 or 85,
					size = 5,
					age = 0,
					life = 0.6,
				})
			end
		elseif effect == "ripple" then
			spawnRing(origin, 0, 0.9, 150, 2)
			spawnRing(origin, 0.15, 0.9, 115, 2)
			spawnRing(origin, 0.3, 0.9, 80, 2)
		elseif effect == "pulse" then
			local flash = newFrame(true)
			flash.BackgroundColor3 = GREEN
			flash.Position = UDim2.fromOffset(origin.X, origin.Y)
			flash.Size = UDim2.fromOffset(10, 10)
			table.insert(particles, { kind = "flash", obj = flash, age = 0, life = 0.5 })
			spawnRing(origin, 0, 0.5, 120, 2)
		elseif effect == "sparkle" then
			for _ = 1, 12 do
				local size = math.random(12, 22)
				local sparkle = newFrame(false)
				sparkle.BackgroundTransparency = 1
				sparkle.Size = UDim2.fromOffset(size, size)
				sparkle.Position = UDim2.fromOffset(origin.X, origin.Y)
				sparkle.Rotation = math.random(0, 90)
				local across = Instance.new("Frame")
				across.AnchorPoint = Vector2.new(0.5, 0.5)
				across.Position = UDim2.new(0.5, 0, 0.5, 0)
				across.Size = UDim2.new(1, 0, 0, 2)
				across.BorderSizePixel = 0
				across.BackgroundColor3 = GREEN
				across.Parent = sparkle
				local upright = Instance.new("Frame")
				upright.AnchorPoint = Vector2.new(0.5, 0.5)
				upright.Position = UDim2.new(0.5, 0, 0.5, 0)
				upright.Size = UDim2.new(0, 2, 1, 0)
				upright.BorderSizePixel = 0
				upright.BackgroundColor3 = GREEN
				upright.Parent = sparkle
				local angle = math.random() * math.pi * 2
				local speed = math.random(80, 260)
				table.insert(particles, {
					kind = "sparkle",
					obj = sparkle,
					pos = origin,
					vel = Vector2.new(math.cos(angle) * speed, math.sin(angle) * speed),
					spin = (math.random() < 0.5 and -1 or 1) * math.random(120, 360),
					age = 0,
					life = 0.6 + math.random() * 0.4,
					size = size,
				})
			end
		elseif effect == "confetti" then
			for _ = 1, 22 do
				local piece = newFrame(false)
				piece.Size = UDim2.fromOffset(math.random(5, 8), math.random(8, 13))
				piece.Position = UDim2.fromOffset(origin.X, origin.Y)
				piece.Rotation = math.random(0, 180)
				piece.BackgroundColor3 = Color3.fromHSV(math.random(), 0.55, 1)
				local angle = -math.pi / 2 + (math.random() - 0.5) * 2.2
				local speed = math.random(180, 420)
				table.insert(particles, {
					kind = "confetti",
					obj = piece,
					pos = origin,
					vel = Vector2.new(math.cos(angle) * speed, math.sin(angle) * speed),
					spin = (math.random() < 0.5 and -1 or 1) * math.random(200, 700),
					age = 0,
					life = 0.9 + math.random() * 0.6,
				})
			end
		end
	end

	local function spawnSpark(origin)
		if #particles > MAX_PARTICLES then
			return
		end
		local size = math.random(2, 4)
		local spark = newFrame(true)
		spark.Size = UDim2.fromOffset(size, size)
		spark.Position = UDim2.fromOffset(origin.X, origin.Y)
		spark.BackgroundColor3 = GREEN
		local angle = math.random() * math.pi * 2
		local speed = math.random(20, 90)
		table.insert(particles, {
			kind = "spark",
			obj = spark,
			pos = origin,
			vel = Vector2.new(math.cos(angle) * speed, math.sin(angle) * speed),
			age = 0,
			life = 0.35 + math.random() * 0.3,
			size = size,
		})
	end

	local function updateParticles(dt)
		for index = #particles, 1, -1 do
			local particle = particles[index]
			particle.age = particle.age + dt
			if particle.age >= particle.life then
				particle.obj:Destroy()
				table.remove(particles, index)
			elseif particle.kind == "ring" then
				if particle.age < 0 then
					particle.obj.Visible = false
				else
					local fade = particle.age / particle.life
					local size = 8 + (particle.maxSize - 8) * (1 - (1 - fade) ^ 3)
					particle.obj.Visible = true
					particle.obj.Size = UDim2.fromOffset(size, size)
					particle.stroke.Transparency = fade
					particle.stroke.Thickness = (particle.thick or 3) * (1 - fade) + 0.5
					if particle.turn then
						particle.obj.Rotation = 45 + particle.turn * particle.age
					end
				end
			elseif particle.kind == "bubble" then
				if particle.age < 0 then
					particle.obj.Visible = false
				else
					particle.obj.Visible = true
					local fade = particle.age / particle.life
					particle.pos = particle.pos - Vector2.new(0, particle.rise * (1 - fade * 0.4) * dt)
					particle.obj.Position = UDim2.fromOffset(particle.pos.X + math.sin(particle.age * 5 + particle.sway) * particle.wobble, particle.pos.Y)
					local grow = 0.55 + 0.45 * math.min(1, fade * 4)
					local pop = fade > 0.82 and (fade - 0.82) / 0.18 or 0
					local size = particle.size * grow * (1 + 0.5 * pop)
					particle.obj.Size = UDim2.fromOffset(size, size)
					particle.stroke.Transparency = 0.25 + 0.75 * pop
					particle.obj.BackgroundTransparency = 0.88 + 0.12 * pop
					particle.shine.BackgroundTransparency = 0.35 + 0.65 * pop
				end
			elseif particle.kind == "static" then
				particle.obj.BackgroundTransparency = (particle.age / particle.life) ^ 2
			elseif particle.kind == "dart" then
				local fade = particle.age / particle.life
				particle.pos = particle.pos + particle.vel * dt
				particle.obj.Position = UDim2.fromOffset(particle.pos.X, particle.pos.Y)
				particle.obj.BackgroundTransparency = fade
			elseif particle.kind == "float" then
				local fade = particle.age / particle.life
				particle.vel = particle.vel * (1 - math.min(1, dt * 0.8))
				particle.pos = particle.pos + particle.vel * dt
				particle.obj.Position = UDim2.fromOffset(particle.pos.X + math.sin(particle.age * 4 + particle.sway) * particle.swayAmt, particle.pos.Y)
				local twinkle = particle.stroke and (0.5 + 0.5 * math.sin(particle.age * 14 + particle.sway)) * 0.3 or 0
				particle.obj.BackgroundTransparency = math.clamp(fade * fade + twinkle, 0, 1)
				if particle.stroke then
					particle.stroke.Transparency = 0.7 + 0.3 * fade
				end
			elseif particle.kind == "orbit" then
				local fade = particle.age / particle.life
				particle.angle = particle.angle + particle.turn * dt
				local radius = particle.maxR * (1 - (1 - fade) ^ 3)
				local place = particle.origin + Vector2.new(math.cos(particle.angle), math.sin(particle.angle)) * radius
				particle.obj.Position = UDim2.fromOffset(place.X, place.Y)
				local size = particle.size * (1 - fade * 0.5)
				particle.obj.Size = UDim2.fromOffset(size, size)
				particle.obj.BackgroundTransparency = fade * fade
			elseif particle.kind == "line" then
				local fade = particle.age / particle.life
				local length = particle.maxLen * (1 - (1 - fade) ^ 3)
				particle.obj.Size = UDim2.fromOffset(length, math.max(1, 3 * (1 - fade)))
				particle.obj.BackgroundTransparency = fade
			elseif particle.kind == "flash" then
				local fade = particle.age / particle.life
				local size = 10 + 110 * (1 - (1 - fade) ^ 3)
				particle.obj.Size = UDim2.fromOffset(size, size)
				particle.obj.BackgroundTransparency = 0.45 + 0.55 * fade
			elseif particle.kind == "confetti" then
				local fade = particle.age / particle.life
				particle.vel = Vector2.new(particle.vel.X * (1 - math.min(1, dt * 1.6)), particle.vel.Y + 800 * dt)
				particle.pos = particle.pos + particle.vel * dt
				particle.obj.Position = UDim2.fromOffset(particle.pos.X, particle.pos.Y)
				particle.obj.Rotation = particle.obj.Rotation + particle.spin * dt
				particle.obj.BackgroundTransparency = math.max(0, fade - 0.6) / 0.4
			elseif particle.kind == "sparkle" then
				local fade = particle.age / particle.life
				particle.vel = particle.vel * (1 - math.min(1, dt * 2.5))
				particle.pos = particle.pos + particle.vel * dt
				particle.obj.Position = UDim2.fromOffset(particle.pos.X, particle.pos.Y)
				particle.obj.Rotation = particle.obj.Rotation + particle.spin * dt
				local size = particle.size * (1 - fade * 0.7)
				particle.obj.Size = UDim2.fromOffset(size, size)
				for _, part in ipairs(particle.obj:GetChildren()) do
					part.BackgroundTransparency = fade * fade
				end
			else
				local fade = particle.age / particle.life
				particle.vel = particle.vel * (1 - math.min(1, dt * 2.5))
				particle.pos = particle.pos + particle.vel * dt
				particle.obj.Position = UDim2.fromOffset(particle.pos.X, particle.pos.Y)
				if particle.spin then
					particle.obj.Rotation = particle.obj.Rotation + particle.spin * dt
				end
				local size = particle.size * (1 - fade * 0.6)
				particle.obj.Size = UDim2.fromOffset(size, size)
				particle.obj.BackgroundTransparency = fade * fade
			end
		end
	end

	trailInput = UserInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			local mouse = UserInputService:GetMouseLocation()
			if isHovering(mouse) then
				spawnClick(mouse)
			end
		end
	end)

	trailConnection = RunService.RenderStepped:Connect(function(dt)
		local now = os.clock()
		local mouse = UserInputService:GetMouseLocation()

		if trailStyle ~= "none" and trailShape ~= "3d" and isHovering(mouse) then
			if lastMouse then
				local delta = mouse - lastMouse
				local distance = delta.Magnitude
				if distance >= 1 then
					local steps = math.min(12, math.ceil(distance / 6))
					for step = 1, steps do
						local alpha = step / steps
						table.insert(points, 1, { pos = lastMouse + delta * alpha, t = now - dt * (1 - alpha) })
					end
					if trailShape == "sparks" then
						spawnSpark(mouse)
						spawnSpark(mouse)
					elseif distance > 10 and not perf.low then
						spawnSpark(mouse)
					end
					lastMouse = mouse
				end
			else
				lastMouse = mouse
			end

			while #points > 0 and now - points[#points].t > trailLife do
				table.remove(points)
			end
			while #points > MAX_POINTS + 1 do
				table.remove(points)
			end

			local count = math.min(MAX_POINTS, #points)
			for index = 1, math.max(count, lastCount) do
				local head = points[index]
				local tail = points[index + 1]
				local core = coreSegments[index]
				local glow = glowSegments[index]
				local visible = false
				if head and tail then
					local delta = head.pos - tail.pos
					local distance = delta.Magnitude
					if distance > 0.5 and not (trailShape == "dotted" and index % 2 == 0) and not (trailShape == "dashed" and index % 6 >= 3) and not (ui.TRAIL_GAP[trailShape] and index % ui.TRAIL_GAP[trailShape][1] >= ui.TRAIL_GAP[trailShape][2]) and trailShape ~= "sparks" then
						visible = true
						local fade = math.clamp((now - head.t) / trailLife, 0, 1)
						local scale = TRAIL_SCALE[trailShape] or 1
						local thickness = (2 + 9 * (1 - fade) ^ 1.2) * scale
						local middle = (head.pos + tail.pos) / 2
						local angle = math.deg(math.atan2(delta.Y, delta.X))
						local tinted = trailColor(index, fade, now)
						local color = tinted or GREEN:Lerp(PANEL, fade * 0.7)

						if trailShape == "glow" then
							core.Visible = false
						else
							core.Visible = true
							core.Position = UDim2.fromOffset(middle.X, middle.Y)
							core.Size = UDim2.fromOffset(distance + thickness * 0.6, thickness)
							core.Rotation = angle
							core.BackgroundColor3 = color
							core.BackgroundTransparency = 0.05 + 0.95 * fade ^ 0.9
						end

						if trailShape == "thin" or trailShape == "dotted" or trailShape == "dashed" or trailShape == "hairline" or ui.TRAIL_GAP[trailShape] then
							glow.Visible = false
						else
							glow.Visible = true
							glow.Position = UDim2.fromOffset(middle.X, middle.Y)
							glow.Size = UDim2.fromOffset(distance + thickness * 1.6, thickness * 2.6)
							glow.Rotation = angle
							glow.BackgroundColor3 = tinted or GREEN
							glow.BackgroundTransparency = (trailShape == "glow" and 0.45 or 0.72) + 0.28 * fade
						end
					end
				end
				if not visible then
					core.Visible = false
					glow.Visible = false
				end
			end
			lastCount = count

			local pulse = 18 + 14 * audioLevels.beat
			cursorGlow.Visible = true
			cursorGlow.Position = UDim2.fromOffset(mouse.X, mouse.Y)
			cursorGlow.Size = UDim2.fromOffset(pulse, pulse)
			local headColor = trailColor(0, 0, now) or GREEN
			cursorGlow.BackgroundColor3 = headColor
			cursorStroke.Color = headColor
		elseif lastMouse or #points > 0 then
			clearTrail()
		end

		if trailShape == "3d" then
			updateTrail3d(dt, mouse, now)
		end
		updateParticles(dt)
		update3d(dt)
	end)
end

local saveSettings

mods.destroyGlassButton.MouseButton1Click:Connect(function()
	if glass.enabled then
		glass.disable()
		setButtonActive(ui.glassButton, false)
		updateStatus()
	end
	local folder = waitPath(workspace, "Map", "BreakableGlass")
	if folder then
		folder:Destroy()
		mods.destroyGlassButton:Destroy()
	else
		warn("Mod menu: workspace.Map.BreakableGlass was not found")
	end
end)

ui.vaultDoorButton.MouseButton1Click:Connect(function()
	local vaultGame = waitPath(workspace, "Map", "Others", "Special", "VaultGame")
	local doors = {}
	if vaultGame then
		for _, object in ipairs(vaultGame:GetDescendants()) do
			if string.find(string.lower(object.Name), "door", 1, true) and (object:IsA("BasePart") or object:IsA("Model") or object:IsA("Folder")) then
				table.insert(doors, object)
			end
		end
	end
	if #doors > 0 then
		for _, door in ipairs(doors) do
			if door.Parent then
				door:Destroy()
			end
		end
		ui.vaultDoorButton:Destroy()
	else
		warn("Mod menu: no vault door was found in workspace.Map.Others.Special.VaultGame")
		if showToast then
			showToast("vault door not found")
		end
	end
end)

ui.lazersButton.MouseButton1Click:Connect(function()
	local lazers = waitPath(workspace, "Map", "Others", "Lazers")
	if lazers then
		lazers:Destroy()
		ui.lazersButton:Destroy()
	else
		warn("Mod menu: workspace.Map.Others.Lazers was not found")
	end
end)

closeButton.MouseButton1Click:Connect(function()
	if saveSettings then
		pcall(saveSettings)
	end
	for _, feature in ipairs(toggleFeatures) do
		feature.disable()
	end
	esp.disable()
	for _, menu in ipairs(sideMenus) do
		menu.close()
	end
	sideMenuFollow:Disconnect()
	trailConnection:Disconnect()
	trailInput:Disconnect()
	trailGui:Destroy()
	for _, cleanup in ipairs(cleanups) do
		cleanup()
	end
	tipMoveConnection:Disconnect()
	tipGui:Destroy()
	gui:Destroy()
end)

task.spawn(function()
	local source
	while not source and gui.Parent do
		source = waitPath(workspace, "Map", "Others", "Special", "VaultGame", "Paper", "SurfaceGui", "TextLabel")
	end
	if not source then
		return
	end

	local function update()
		local text = source.Text:match("^%s*(.-)%s*$")
		if text ~= "" then
			vaultLabel.Text = "Vault Code: " .. text
		else
			vaultLabel.Text = ""
		end
	end

	update()
	source:GetPropertyChangedSignal("Text"):Connect(update)
end)

do
	local DISPLAY = { "tabs", "tab marker", "buttons", "strip", "outline", "text", "sections", "fill", "border", "header bar", "footer bar", "tab bar", "size", "title", "accent block", "visualizer", "clock", "fps", "greeting" }
	local OPTIONS = {
		tabs = { "bottom", "left", "right", "top" },
		["tab marker"] = { "none", "thin", "normal", "thick", "chunky" },
		buttons = { "solid", "dim", "half", "faint", "ghostly", "clear" },
		strip = { "none", "left", "right" },
		outline = { "none", "faint", "thin", "bright", "thick", "heavy", "chunky" },
		text = { "center", "left", "right" },
		sections = { "open", "faint", "filled", "boxed", "lined", "outlined", "bold outlined", "boxed lined", "filled lined", "solid", "solid lined", "bright outlined" },
		fill = { "none", "thin glass", "glass", "smoky glass", "dark glass", "solid" },
		border = { "none", "thin", "medium", "thick", "heavy", "chunky" },
		["header bar"] = { "off", "on" },
		["footer bar"] = { "off", "on" },
		["tab bar"] = { "off", "on" },
		size = { "micro", "tiny", "smaller", "small", "medium", "large", "larger", "huge", "giant", "colossal" },
		title = { "off", "on" },
		["accent block"] = { "off", "on" },
		visualizer = { "off", "on" },
		clock = { "off", "on" },
		fps = { "off", "on" },
		greeting = { "off", "on" },
	}
	local MARKS = { none = 0, thin = 2, normal = 4, thick = 8, chunky = 14 }
	local BUTTON_BG = { solid = 0, dim = 0.3, half = 0.5, faint = 0.7, ghostly = 0.85, clear = 1 }
	local OUTLINES = {
		none = { stroke = 1, thick = 1 },
		faint = { stroke = 0.7, thick = 1 },
		thin = { stroke = 0.45, thick = 1 },
		bright = { stroke = 0, thick = 1 },
		thick = { stroke = 0.2, thick = 2 },
		heavy = { stroke = 0, thick = 3 },
		chunky = { stroke = 0, thick = 5 },
	}
	local ALIGN = { left = Enum.TextXAlignment.Left, center = Enum.TextXAlignment.Center, right = Enum.TextXAlignment.Right }
	local CARDS = {
		open = { bg = 1, stroke = 1 },
		faint = { bg = 0.8, stroke = 1 },
		filled = { bg = 0.3, stroke = 1 },
		boxed = { bg = 0.55, stroke = 0.8 },
		lined = { bg = 1, stroke = 1, line = true },
		outlined = { bg = 1, stroke = 0.4 },
		["bold outlined"] = { bg = 0.8, stroke = 0 },
		["boxed lined"] = { bg = 0.55, stroke = 0.8, line = true },
		["filled lined"] = { bg = 0.3, stroke = 1, line = true },
		solid = { bg = 0, stroke = 1 },
		["solid lined"] = { bg = 0, stroke = 1, line = true },
		["bright outlined"] = { bg = 1, stroke = 0 },
	}
	local FILLS = { none = false, ["thin glass"] = 0.8, glass = 0.55, ["smoky glass"] = 0.42, ["dark glass"] = 0.3, solid = 0 }
	local BORDERS = { none = 0, thin = 1, medium = 2, thick = 3, heavy = 6, chunky = 10 }
	local SIZES = { micro = 0.55, tiny = 0.7, smaller = 0.78, small = 0.85, medium = 1, large = 1.15, larger = 1.25, huge = 1.35, giant = 1.55, colossal = 1.8 }
	local HEADER_ITEMS = { title = "Title", ["accent block"] = "Accent", visualizer = "Visualizer", clock = "Clock", fps = "Fps" }
	local choice = {
		tabs = "left", ["tab marker"] = "normal", buttons = "solid", strip = "left", outline = "none", text = "left",
		sections = "open", fill = "solid", border = "thin", ["header bar"] = "on", ["footer bar"] = "on", ["tab bar"] = "on",
		size = "medium", title = "on", ["accent block"] = "on", visualizer = "on", clock = "on", fps = "on", greeting = "on",
	}
	local optionButtons = {}
	local BAR = 38

	local function styleButton(button)
		local strip = button:FindFirstChild("Strip")
		if not strip then
			return
		end
		local pad = button:FindFirstChildOfClass("UIPadding")
		strip.Visible = choice.strip ~= "none"
		if choice.strip == "right" then
			strip.AnchorPoint = Vector2.new(1, 0)
			strip.Position = UDim2.new(1, pad and pad.PaddingRight.Offset or 8, 0, -6)
		else
			strip.AnchorPoint = Vector2.new(0, 0)
			strip.Position = UDim2.new(0, pad and -pad.PaddingLeft.Offset or -12, 0, -6)
		end
		local stroke = button:FindFirstChildOfClass("UIStroke")
		if stroke then
			stroke.Transparency = OUTLINES[choice.outline].stroke
			stroke.Thickness = OUTLINES[choice.outline].thick
		end
		button.BackgroundTransparency = button:GetAttribute("Active") and 0 or BUTTON_BG[choice.buttons]
		if button:GetAttribute("Wide") then
			button.TextXAlignment = ALIGN[choice.text]
			local tag = button:FindFirstChild("Tag")
			if tag then
				local onLeft = choice.text == "right"
				tag.AnchorPoint = Vector2.new(onLeft and 0 or 1, 0)
				tag.Position = UDim2.new(onLeft and 0 or 1, 0, 0, 0)
				tag.TextXAlignment = onLeft and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right
			end
		end
	end

	local function apply()
		local card = CARDS[choice.sections]
		gui:SetAttribute("StrokeRest", OUTLINES[choice.outline].stroke)
		gui:SetAttribute("ButtonStrip", choice.strip)
		gui:SetAttribute("ButtonBg", BUTTON_BG[choice.buttons])
		gui:SetAttribute("ButtonThick", OUTLINES[choice.outline].thick)
		gui:SetAttribute("ButtonAlign", choice.text)

		local side = choice.tabs
		local vertical = side == "left" or side == "right"
		local glass = FILLS[choice.fill]
		local fill = glass ~= false
		local scaler = window:FindFirstChildOfClass("UIScale")
		if scaler then
			scaler.Scale = SIZES[choice.size]
		end
		for _, partName in ipairs({ "Stripes", "Shade", "Tint" }) do
			local part = window:FindFirstChild(partName)
			if part then
				part.Visible = fill
				if partName == "Stripes" then
					part.BackgroundTransparency = glass or 0
				elseif partName == "Tint" then
					part.BackgroundTransparency = (glass and glass > 0) and math.min(1, glass + 0.2) or 0.3
				end
			end
		end
		local border = window:FindFirstChildOfClass("UIStroke")
		if border then
			border.Enabled = BORDERS[choice.border] > 0
			border.Thickness = math.max(1, BORDERS[choice.border])
		end
		header.BackgroundTransparency = choice["header bar"] == "off" and 1 or (fill and 0.2 or 0)
		footer.BackgroundTransparency = choice["footer bar"] == "off" and 1 or (fill and 0.3 or 0)
		tabColumn.BackgroundTransparency = choice["tab bar"] == "off" and 1 or (fill and 0.1 or 0)
		for section, childName in pairs(HEADER_ITEMS) do
			local item = header:FindFirstChild(childName)
			if item then
				item.Visible = choice[section] == "on"
			end
		end

		ui.layout.side = side
		ui.layout.mark = MARKS[choice["tab marker"]]
		ui.layout.x = side == "left" and TAB_WIDTH or 0
		ui.layout.y = side == "top" and HEADER_HEIGHT + BAR or HEADER_HEIGHT

		if vertical then
			tabColumn.Position = side == "left" and UDim2.fromOffset(0, HEADER_HEIGHT) or UDim2.new(1, -TAB_WIDTH, 0, HEADER_HEIGHT)
			tabColumn.Size = UDim2.new(0, TAB_WIDTH, 1, -(HEADER_HEIGHT + FOOTER_HEIGHT))
		else
			tabColumn.Position = side == "top" and UDim2.fromOffset(0, HEADER_HEIGHT) or UDim2.new(0, 0, 1, -(FOOTER_HEIGHT + BAR))
			tabColumn.Size = UDim2.new(1, 0, 0, BAR)
		end
		local divider = tabColumn:FindFirstChild("Divider")
		if divider then
			if vertical then
				divider.Position = side == "left" and UDim2.new(1, -1, 0, 0) or UDim2.new(0, 0, 0, 0)
				divider.Size = UDim2.new(0, 1, 1, 0)
			else
				divider.Position = side == "top" and UDim2.new(0, 0, 1, -1) or UDim2.new(0, 0, 0, 0)
				divider.Size = UDim2.new(1, 0, 0, 1)
			end
		end
		local hello = tabColumn:FindFirstChild("Hello")
		if hello then
			hello.Visible = vertical and choice.greeting == "on"
		end

		for _, entry in pairs(pages) do
			local slot = entry.order - 1
			if vertical then
				entry.tab.Position = UDim2.fromOffset(0, 8 + slot * 32)
				entry.tab.Size = UDim2.fromOffset(TAB_WIDTH - 1, 30)
			else
				local step = math.floor((WINDOW_WIDTH - 24) / 7)
				entry.tab.Position = UDim2.fromOffset(12 + slot * step, 4)
				entry.tab.Size = UDim2.fromOffset(step - 6, 30)
			end
			entry.page.Position = UDim2.fromOffset(ui.layout.x, ui.layout.y)
			entry.page.Size = UDim2.new(1, vertical and -TAB_WIDTH or 0, 1, -(HEADER_HEIGHT + FOOTER_HEIGHT + STAGE_HEIGHT + (vertical and 0 or BAR)))
			for _, object in ipairs(entry.page:GetDescendants()) do
				if object.Name == "Card" then
					object.BackgroundTransparency = card.bg
					local stroke = object:FindFirstChildOfClass("UIStroke")
					if stroke then
						stroke.Transparency = card.stroke
					end
					local edge = object:FindFirstChild("Edge")
					if edge then
						edge.Visible = card.line == true
					end
				end
			end
		end

		tabIndicator.Visible = ui.layout.mark > 0
		local current = pages[currentTab]
		if current then
			local goal = ui.indicatorGoal(current.tab)
			tabIndicator.Position = goal.Position
			tabIndicator.Size = goal.Size
		end

		for _, root in ipairs({ gui, tipGui }) do
			for _, object in ipairs(root:GetDescendants()) do
				if object:IsA("TextButton") then
					styleButton(object)
				end
			end
		end

		for section, buttons in pairs(optionButtons) do
			for name, button in pairs(buttons) do
				setButtonActive(button, choice[section] == name)
			end
		end
	end

	local function setOption(section, name)
		for _, candidate in ipairs(OPTIONS[section] or {}) do
			if candidate == name then
				choice[section] = name
				return true
			end
		end
		return false
	end

	audioLevels.setMenuType = function(text)
		local changed = false
		for section, name in string.gmatch(text, "([^|=]+)=([^|=]+)") do
			if setOption(section, name) then
				changed = true
			end
		end
		if changed then
			apply()
		end
	end
	audioLevels.getMenuType = function()
		local parts = {}
		for index, section in ipairs(DISPLAY) do
			parts[index] = section .. "=" .. choice[section]
		end
		return table.concat(parts, "|")
	end

	local typeMenu = createSideMenu({ title = "menu types", custom = true })
	typeMenu.build = function()
		local order = 0
		for _, section in ipairs(DISPLAY) do
			order = order + 1
			local heading = makeNote(typeMenu.scroll, section, 0, 0)
			heading.Size = UDim2.new(1, 0, 0, 18)
			heading.LayoutOrder = order
			optionButtons[section] = {}
			for _, name in ipairs(OPTIONS[section]) do
				order = order + 1
				local button = makeButton(typeMenu.scroll, name, 0, 0)
				button.Size = UDim2.new(1, 0, 0, 28)
				button.LayoutOrder = order
				button.MouseButton1Click:Connect(function()
					if setOption(section, name) then
						apply()
					end
				end)
				optionButtons[section][name] = button
				setButtonActive(button, choice[section] == name)
			end
		end
	end
	ui.menuTypesButton.MouseButton1Click:Connect(typeMenu.open)
end

do
	local HttpService = game:GetService("HttpService")
	local FILE_NAME = "moddy_settings.json"
	local restored = false
	local autoMods = true
	local autoTheme = true

	local function refreshAutoButtons()
		setButtonActive(ui.autoSaveModsButton, autoMods)
		setButtonActive(ui.autoSaveThemeButton, autoTheme)
	end
	refreshAutoButtons()

	ui.autoSaveModsButton.MouseButton1Click:Connect(function()
		autoMods = not autoMods
		refreshAutoButtons()
		showToast("auto save mods: " .. (autoMods and "on" or "off"))
	end)
	ui.autoSaveThemeButton.MouseButton1Click:Connect(function()
		autoTheme = not autoTheme
		refreshAutoButtons()
		showToast("auto save theme: " .. (autoTheme and "on" or "off"))
	end)

	local function collect()
		local data = {
			autoMods = autoMods,
			autoTheme = autoTheme,
			pos = {
				window.Position.X.Scale,
				window.Position.X.Offset,
				window.Position.Y.Scale,
				window.Position.Y.Offset,
			},
		}
		if autoMods then
			data.esp = espMode
			data.jump = jumpPowerValue
			data.toggles = {}
			for name, entry in pairs(toggleBindings) do
				data.toggles[name] = entry.feature.enabled and true or false
			end
		end
		if autoTheme then
			data.theme = audioLevels.theme
			data.menuType = audioLevels.getMenuType and audioLevels.getMenuType() or nil
			data.effect = audioLevels.getEffect and audioLevels.getEffect() or nil
			data.trail = audioLevels.getTrail and audioLevels.getTrail() or nil
			data.background = audioLevels.getBackground and audioLevels.getBackground() or nil
			data.muted = audioLevels.music and audioLevels.music.muted or false
			data.volume = audioLevels.music and math.floor(audioLevels.music.volume * 100 + 0.5) or 50
			data.song = audioLevels.getSongId and audioLevels.getSongId() or nil
		end
		return data
	end

	local function load()
		if type(shared) == "table" and type(shared.moddySettings) == "table" then
			return shared.moddySettings
		end
		if type(isfile) == "function" and type(readfile) == "function" then
			local ok, result = pcall(function()
				if isfile(FILE_NAME) then
					return HttpService:JSONDecode(readfile(FILE_NAME))
				end
				return nil
			end)
			if ok and type(result) == "table" then
				return result
			end
		end
		return nil
	end

	function saveSettings()
		if not restored then
			return
		end
		local data = collect()
		if type(shared) == "table" then
			shared.moddySettings = data
		end
		if type(writefile) == "function" then
			pcall(function()
				writefile(FILE_NAME, HttpService:JSONEncode(data))
			end)
		end
	end

	local function apply(data)
		if data.autoMods == false then
			autoMods = false
		end
		if data.autoTheme == false then
			autoTheme = false
		end
		refreshAutoButtons()
		if type(data.theme) == "string" and audioLevels.applyTheme then
			pcall(audioLevels.applyTheme, data.theme)
		end
		if type(data.menuType) == "string" and audioLevels.setMenuType then
			pcall(audioLevels.setMenuType, data.menuType)
		end
		if type(data.background) == "string" and audioLevels.setBackground then
			audioLevels.setBackground(data.background)
		end
		if type(data.trail) == "string" and audioLevels.setTrail then
			audioLevels.setTrail(data.trail)
		end
		if type(data.effect) == "string" and audioLevels.setEffect then
			audioLevels.setEffect(data.effect)
		end
		if type(data.song) == "number" and audioLevels.playSongId then
			audioLevels.playSongId(data.song)
		end
		if audioLevels.setVolume and type(data.volume) == "number" then
			audioLevels.setVolume(data.volume)
		end
		if audioLevels.setMuted and type(data.muted) == "boolean" then
			audioLevels.setMuted(data.muted)
		end
		if type(data.jump) == "number" then
			jumpPowerValue = data.jump
			applyJumpPower()
		end
		if type(data.toggles) == "table" then
			for name, on in pairs(data.toggles) do
				local entry = toggleBindings[name] or toggleBindings[lowerText(name)]
				if on == true and entry and not entry.feature.enabled then
					pcall(entry.feature.enable)
					setButtonActive(entry.button, entry.feature.enabled)
				end
			end
		end
		if data.esp == 1 or data.esp == 2 then
			pcall(setEspMode, data.esp)
		end
		updateStatus()
	end

	task.spawn(function()
		local data = load()
		if data and type(data.pos) == "table" then
			local xs, xo, ys, yo = data.pos[1], data.pos[2], data.pos[3], data.pos[4]
			if type(xs) == "number" and type(xo) == "number" and type(ys) == "number" and type(yo) == "number" then
				local size = gui.AbsoluteSize
				local px = xs * size.X + xo
				local py = ys * size.Y + yo
				if size.X > 0 and px > -WINDOW_WIDTH + 80 and px < size.X - 80 and py > -20 and py < size.Y - 40 then
					window.Position = UDim2.new(xs, xo, ys, yo)
				end
			end
		end
		local waited = 0
		while not player.Character and waited < 10 do
			waited = waited + task.wait(0.25)
		end
		task.wait(0.5)
		if data and gui.Parent then
			pcall(apply, data)
		end
		restored = true
		while gui.Parent do
			task.wait(3)
			if gui.Parent then
				saveSettings()
			end
		end
	end)
end

do
	local keyConnection = UserInputService.InputBegan:Connect(function(input, processed)
		if processed then
			return
		end
		if input.KeyCode == Enum.KeyCode.RightShift then
			gui.Enabled = not gui.Enabled
		end
	end)
	table.insert(cleanups, function()
		keyConnection:Disconnect()
	end)
end
end
