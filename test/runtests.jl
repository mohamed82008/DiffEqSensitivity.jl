using DiffEqSensitivity, SafeTestsets
using Test

@time begin
if GROUP == "All" || GROUP == "Core"
    @safetestset "Local Sensitivity" begin include("local.jl") end
    @safetestset "Adjoint Sensitivity" begin include("adjoint.jl") end
    @safetestset "Morris Method" begin include("morris_method.jl") end
    @safetestset "Sobol Method" begin include("sobol_method.jl") end
    @safetestset "DGSM Method" begin include("DGSM.jl") end
end

if GROUP == "Downstream"
    using Pkg
    Pkg.test("DiffEqFlux")
end
