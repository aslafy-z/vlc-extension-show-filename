-- shows the current playing filename when a keystroke is triggered.

function descriptor()
  return {
    title = "Show Filename",
    version = "0.0.1",
    author = "Zadkiel Aslafy",
    capabilities = { "playing-listener" }
  }
end

function activate()
  updateEndTime()
end

function deactivate() 
end

function meta_changed()
end

function playing_changed()
  updateEndTime()
end

function getTimeLeft()
	-- get elapsed time in seconds
	local current = vlc.var.get(vlc.object.input(), "time")
	-- get duration in seconds
	local duration = vlc.input.item():duration()
  return duration - current
end

function updateEndTime()
  local timeLeft = getTimeLeft()
  local currentTime = os.time(t)
  local endTime = os.date("%I:%M", currentTime + timeLeft)
  vlc.osd.message( 'End Time: ' .. endTime, vlc.osd.channel_register(), "bottom-right", 3000000)
end
