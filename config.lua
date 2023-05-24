shElevator = {}
shElevator.WaitTime = 3
shElevator.list = {
    MRPD = { -- Should Be Unique
        {
            koordinat = vector4(465.6373, -975.9534, 30.7243, 84.4128), -- Coords where to teleport at
            tempat = "Lantai Utama", -- Description on context menu
            name = "MRPD Lantai 0", -- Title on context menu
            coords = vec3(463.46, -978.05, 31.0), -- lib box zone coords
            size = vec3(0.6, 0.5, 0.7), -- lib box zone size
            rotation = 49.5, -- lib box zone rotation
            groups = { -- Can be null
                ["police"] = 0,
				["ambulance"] = 0,
                ["pemerintah"] = 0,
            }
        },
        {
            koordinat = vector4(465.6774, -976.0721, 35.0624, 88.0833),
            tempat = "Locker",
            name = "MRPD Lantai 1",
            coords = vec3(463.65, -977.99, 35.4),
            size = vec3(0.6, 0.5, 0.7),
            rotation = 45.0,
            groups = {
                ["police"] = 0,
				["ambulance"] = 0,
                ["pemerintah"] = 0,
            }
        },
        {
            koordinat = vector4(465.5736, -976.0132, 39.4169, 85.0576),
            tempat = "Ruang Kerja",
            name = "MRPD Lantai 2",
            coords = vec3(463.62, -977.99, 39.8),
            size = vec3(0.6, 0.5, 0.7),
            rotation = 49.5,
            groups = {
                ["police"] = 0,
				["ambulance"] = 0,
                ["pemerintah"] = 0,
            }
        },
        {
            koordinat = vector4(467.1668, -975.1444, 25.4707, 175.7759),
            tempat = "Gym/DLL",
            name = "MRPD Lantai -1",
            coords = vec3(465.11, -977.41, 25.75),
            size = vec3(0.6, 0.5, 0.7),
            rotation = 49.5,
            groups = {
                ["police"] = 0,
				["ambulance"] = 0,
                ["pemerintah"] = 0,
            }
        },
    }
}