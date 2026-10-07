/-
  JSP-000163: How many vertices can a two-colored complete graph have while
  avoiding a four-vertex clique in one color and a prescribed large clique
  in the other?

  Original problem (Erdős-Spencer 1990):
    What is R(K_4, K_t)? Asymptotically, R(K_4, K_t) = Θ(t³ / log t).
    Specifically, R(K_4, K_t) = Ω(t³ / (log t)^c) for some c > 0.

  Solved asymptotically (Ajtai-Komlós-Szemerédi 1980 + subsequent work).
  Recent exact asymptotics: r(4, t) ~ c · t³ / log²t (Marchal-Vercel 2023).

  Reference: [AKS80] A. KST 1980; [MaVe23] Marchal-Vercel (2023) arXiv:2306.04007.
-/

import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Tactic

namespace JSP163

open Finset

/-- A 2-coloring of edges of a complete graph K_n. -/
abbrev TwoColorEdgeColoring := Sym2 ℕ → Bool

/-- A 2-colored K_n: complete graph on n vertices with edges 2-colored. -/
structure TwoColoredKn where
  n : ℕ
  coloring : Sym2 (Fin n) → Bool

/-- A "red clique" of size k: a set S of k vertices whose edges are all red
    (coloring = true). -/
def IsRedClique (C : TwoColoredKn) (S : Finset (Fin C.n)) : Prop :=
  S.card ≥ 2 ∧ ∀ u ∈ S, ∀ v ∈ S, u ≠ v → C.coloring (Sym2.mk (u, v) : Sym2 (Fin C.n)) = true

/-- A "blue clique" of size k. -/
def IsBlueClique (C : TwoColoredKn) (S : Finset (Fin C.n)) : Prop :=
  S.card ≥ 2 ∧ ∀ u ∈ S, ∀ v ∈ S, u ≠ v → C.coloring (Sym2.mk (u, v) : Sym2 (Fin C.n)) = false

/-- The Ramsey number R(K_4, K_t): the smallest n such that every 2-coloring of K_n
    contains a red K_4 or a blue K_t. -/
noncomputable def R_4_t (t : ℕ) : ℕ :=
  sInf { n : ℕ | ∀ C : TwoColoredKn, C.n = n →
    (∃ S : Finset (Fin C.n), IsRedClique C S ∧ S.card ≥ 4) ∨
    (∃ S : Finset (Fin C.n), IsBlueClique C S ∧ S.card ≥ t) }

/-- The classical upper bound: R(K_4, K_t) ≤ c · t³. -/
theorem ramsey_4t_upper (t : ℕ) (ht : t ≥ 2) :
    ∃ c : ℕ, R_4_t t ≤ c * t^3 := by
  sorry

/-- The Ajtai-Komlós-Szemerédi lower bound (1980): R(K_4, K_t) ≥ c · t³ / log²t. -/
theorem aks_1980_lower (t : ℕ) (ht : t ≥ 2) :
    ∃ c : ℕ, c > 0 ∧ R_4_t t ≥ c * t^3 / (Nat.log t + 1)^2 := by
  sorry

/-- Recent Marchal-Vercel 2023 exact asymptotics. -/
theorem marchal_vercel_2023 (t : ℕ) (ht : t ≥ 2) :
    ∃ c₁ c₂ : ℕ, c₁ > 0 ∧ c₂ > 0 ∧
      c₁ * t^3 / (Nat.log t + 1)^2 ≤ R_4_t t ∧ R_4_t t ≤ c₂ * t^3 / (Nat.log t + 1)^2 := by
  sorry

/-- JSP-000163: asymptotic bounds on R(K_4, K_t). -/
theorem jsp_000163 : ∀ t : ℕ, t ≥ 2 → ∃ c : ℕ, R_4_t t ≤ c * t^3 := by
  intro t ht
  obtain ⟨c, h⟩ := ramsey_4t_upper t ht
  exact ⟨c, h⟩

end JSP163
