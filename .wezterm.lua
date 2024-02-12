local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.default_domain = 'WSL:Ubuntu-22.04'
config.color_scheme = "Catppuccin Mocha"

config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
	{
		key = '-',
		mods = 'LEADER',
		action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }

	},
	{
		key = '+',
		mods = 'LEADER',
		action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }

	},
}
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(wezterm.action.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(wezterm.action.ClearSelection, pane)
			else
				window:perform_action(wezterm.action({ PasteFrom = "Clipboard" }), pane)
			end
		end),
	},
}

return config
