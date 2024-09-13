add_rules("mode.debug", "mode.release")
if is_mode("debug") then
    add_defines("DEBUG")
end 
-- add_ldflags("/subsystem:windows")
add_defines("UNICODE", "_UNICODE")
add_defines("DXVIEW_SWAP_CHAIN_BUFFER_COUNT=3")
add_requires("spdlog")
add_requires("glfw")
add_requires("tinygltf")
target("sandbox")
    set_languages("c++17")
    add_files("./src/*.cc")
    add_packages("spdlog")
    add_packages("glfw")
    add_packages("tinygltf")
    if is_plat("windows") then
        add_syslinks("user32", "kernel32", "gdi32", "shell32", "dxgi", "d3d12", "d3dcompiler")
    end
    if is_mode("debug") then
    set_targetdir("/bin/debug")
    else
    set_targetdir("/bin/release")
    end
