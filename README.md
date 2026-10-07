# JSP-000163 — Lean 4.20 scaffold for How many vertices can a two-colored complete graph...

> **Problem (upstream JSP-000163)**: How many vertices can a two-colored complete graph have while avoiding a four-vertex clique in one color and a prescribed large clique in the other?
> **Solver**: Ma–Verma (2023, arXiv:2306.04007)
> **JSP bounty**: USD $250
> **Upstream status** ([TheJustinSunPrize/awards](https://github.com/TheJustinSunPrize/awards/blob/main/problems/catalog-0101-0200.md#JSP-000163)): **Solved, Lean proof: No, Eligible to claim: No**

## What this repository is

This is a **Lean 4.20.0 + Mathlib v4.20.0 scaffold** for the JSP outer theorem.
The file structure (lake project, lean-toolchain, lakefile, single `JSP163.lean`)
is published so that a future Lean formalization team can clone this repository,
fill in the `sorry` placeholders, and produce a verified Lean proof.

**This is NOT a Lean proof.** Every `theorem` in `JSP163.lean`
ends with `:= by sorry`. Per the JSP `docs/verification.md` policy:

> A Lean submission without the complete proof is invalid and will not be accepted.

## Files

```
JSP163.lean    -- Outer statement with `sorry`
README.md              -- This file
lakefile.toml          -- Lean 4 build config (lake)
lean-toolchain.json     -- Pinned toolchain: Lean v4.20.0
lake-manifest.json     -- Pinned dependencies: mathlib v4.20.0
.gitignore             -- Excludes `.lake/` build cache
```

## Build (to verify the scaffold compiles)

```sh
lake build
```

## Math content

Outer statement: asymptotics of r(4, t)

The Lean file states the outer theorem in a form suitable for filling in with
Mathlib lemmas. To make this a complete Lean proof, a team would need to:

1. Port the corresponding published paper (e.g. Ma–Verma (2023, arXiv:2306.04007)).
2. For each lemma in the paper, find or build a corresponding Mathlib
   statement.
3. Replace `sorry` with the corresponding Lean tactic proof.

## References

- Mathematical proof: see the publication reference cited above
- Upstream JSP catalog: https://github.com/TheJustinSunPrize/awards/blob/main/problems/catalog-0101-0200.md#JSP-000163
- Attribution policy: https://github.com/TheJustinSunPrize/awards/blob/main/docs/attribution.md

## Submission path

To claim the bounty for JSP-000163, the Lean author (or a contributor with
attributable credit on the Lean repo) must:

1. Fill the `sorry` in `JSP163.lean` and verify the proof with
   `lake build`.
2. Open a PR to `TheJustinSunPrize/awards` adding the Lean source URL to the
   catalog entry.
3. After merge, open a claim-award issue from the Lean author's own GitHub
   account using the `claim-award.yml` template.
4. Email identity-verification materials to `thejustinsunprize@hejustinsun.com`.

None of these steps can be automated from an agent sandbox.
