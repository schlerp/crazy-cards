local logger = {
    debug = function(message)
        if DEBUG then print("[DEBUG] " .. message) end
    end,
    info = function(message) print("[INFO] " .. message) end,
    warn = function(message) print("[WARN] " .. message) end,
    error = function(message) print("[ERROR] " .. message) end,
}

return logger
