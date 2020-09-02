import Krylov

@testset "Krylov" begin
    for T in TvTYPES, f in [Krylov.cg, Krylov.minres]
        @testset "$f, $T" begin
            A = SparseMatrixCSC{T, Int}([
                1 0 1 0;
                0 1 0 1
            ])
            kkt = KKT.KrylovPDSolver(f, A)
            KKT.run_ls_tests(A, kkt)
        end
    end
end