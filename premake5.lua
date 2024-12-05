project "Box2D"
	kind "StaticLib"
	language "C"
	cdialect "C11"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prjname}")

	files
	{
        "src/**.h",
		"src/**.c",
		"include/**.h"
	}
    
	includedirs
	{
        "include",
		"src"
	}
    
	filter "system:windows"
    systemversion "latest"
    buildoptions { "/experimental:c11atomics" }
    
	filter "configurations:Debug"
    runtime "Debug"
    symbols "on"
    
	filter "configurations:Release"
	defines { "NDEBUG", "BOX2D_ENABLE_SIMD" }
    runtime "Release"
    optimize "on"
    
	filter "configurations:Dist"
	defines { "NDEBUG", "BOX2D_ENABLE_SIMD" }
    runtime "Release"
    optimize "full"
    symbols "off"

