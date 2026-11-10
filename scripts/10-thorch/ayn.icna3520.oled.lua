-- AYN Thor upper ICNA3520: Armada's Gamma 2.2 / P3 / 650-nit profile.
-- Never advertise HDR for the lower panel or an external display.
gamescope.config.known_displays.thorch_icna3520_oled = {
    pretty_name = "AYN Thor upper ICNA3520 OLED",
    colorimetry = {
        r = { x = 0.6800, y = 0.3200 },
        g = { x = 0.2650, y = 0.6900 },
        b = { x = 0.1500, y = 0.0600 },
        w = { x = 0.3127, y = 0.3290 },
    },
    hdr = {
        supported = true,
        eotf = gamescope.eotf.gamma22,
        max_content_light_level = 650,
        max_frame_average_luminance = 650,
        min_content_light_level = 0.002,
    },
    matches = function(display)
        if display.device_id == "ayn-thor" and display.internal
            and not display.has_edid and display.connector == "DSI-2" then
            return 6000
        end
        return -1
    end,
}
