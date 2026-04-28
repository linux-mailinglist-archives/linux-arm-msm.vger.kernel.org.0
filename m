Return-Path: <linux-arm-msm+bounces-104962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NkLOSyV8GnnVAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:08:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADF0483542
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 956E831A1CB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1C1428848;
	Tue, 28 Apr 2026 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nd5YifBL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EABE428838;
	Tue, 28 Apr 2026 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777373002; cv=none; b=C8Pewf/rmzEsPeG0gPa7rY1eu1Pw/5DTbFdOiUIUM9rwhByt7IClJfalUJlfSST7gbdoxzFOf7ZBLW1NHQtIumo1TjnHp6OccsTPleKzm8/0xOejqXi3vov6qWA1rilURNN8Mq2ZVPQdFaWMf4YzdAWOEzctewDY75GfI2j5t/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777373002; c=relaxed/simple;
	bh=yA9GlsKbZPA0q0wYtAV3srus1XhU361ZRCUkz2/ZKKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HsseqPI/WLSg8jXuWsp7M4BZyw/I50EINgtj82Pvb2G7czLhq7JMaOTMXMyKp21GxUvHEwXjGvL5hjDcl3QcAkmqUGDC4FqvkBoftszXUaSLlk8pdUOPKzgWj8j/RMH8FSTxEqEQlHZ19VwonpvrkiPS7gkRP4SU7eioFOeFmOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nd5YifBL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D83AC2BCB5;
	Tue, 28 Apr 2026 10:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777373001;
	bh=yA9GlsKbZPA0q0wYtAV3srus1XhU361ZRCUkz2/ZKKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nd5YifBLnlNJYcBrxP9ouMf4MW2VJ40F69lAtGDeg9QENKHa9XxdtIU6UQuq2OdGd
	 66aBabNAWCqR9GHNHX/S6r7cqBNTJic75gVZ04HQrmcCcE3RrOFsejz42ATf0OrzZc
	 DrsDKBM9PnGAiKE2+TTM8vtF/iqQ4HhSoVFUoAPfwkTeaq5Cl1rWozKbwKHoEnhTgf
	 l7CdHB4PyRmcSDgTkiK+DlLTYJ5kjsJIDFRAcu29lZiOAXfjOzJGoWjs7K9V8bjkYO
	 dVKrmW8lyNcrTfn5ZfMrtPj5PNIq5/r3GgF2GmysR36nWtVSc9mn/KXdmwrYANvs9b
	 ZOX7ah3yAy5aA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Val Packett <val@packett.cool>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	agross@kernel.org,
	konrad.dybcio@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.15] dt-bindings: clock: qcom,gcc-sc8180x: Add missing GDSCs
Date: Tue, 28 Apr 2026 06:41:26 -0400
Message-ID: <20260428104133.2858589-75-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428104133.2858589-1-sashal@kernel.org>
References: <20260428104133.2858589-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3ADF0483542
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104962-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url,qualcomm.com:email]

From: Val Packett <val@packett.cool>

[ Upstream commit 76404ffbf07f28a5ec04748e18fce3dac2e78ef6 ]

There are 5 more GDSCs that we were ignoring and not putting to sleep,
which are listed in downstream DTS. Add them.

Signed-off-by: Val Packett <val@packett.cool>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260312112321.370983-2-val@packett.cool
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

I have all the evidence I need. Now let me write my analysis.

## Phase 1: Commit Message Forensics

**Step 1.1: Parse subject line**
Record: Subsystem: `dt-bindings: clock: qcom,gcc-sc8180x`. Action verb:
"Add". Summary: Adds 5 missing GDSC (Global Distributed Switch
Controller) #defines to the binding header.

**Step 1.2: Parse all tags**
Record: Tags found: `Signed-off-by: Val Packett`, `Acked-by: Krzysztof
Kozlowski` (DT bindings maintainer), `Link:` to lore.kernel.org thread,
`Signed-off-by: Bjorn Andersson` (Qualcomm maintainer who applied). No
`Fixes:` tag on this bindings patch (but its companion driver patch
`3565741eb985a` has `Fixes: 4433594bbe5d`). No `Cc: stable` tag.

**Step 1.3: Analyze commit body**
Record: "There are 5 more GDSCs that we were ignoring and not putting to
sleep" — explicitly describes missing PM/power management support. The
commit adds 5 new #define identifiers (values 11-15) for MMNOC MMU TBU
(HF0/HF1/SF) and Turing MMU TBU0/TBU1 GDSCs. No version info mentioned.
Author's explanation: these were missing from mainline driver but
present in downstream DTS.

**Step 1.4: Detect hidden fix**
Record: Language uses "Add missing" — typical hidden-fix pattern. The
driver companion has `Fixes: 4433594bbe5d` tag pointing to the original
SC8180x driver (v5.12). This is a bug fix by nature (missing power
management), but THIS patch is only the header definitions.

## Phase 2: Diff Analysis

**Step 2.1: Inventory**
Record: Single file modified: `include/dt-bindings/clock/qcom,gcc-
sc8180x.h`. 5 lines added, 0 removed. Zero functions modified — purely
adding preprocessor macros.

**Step 2.2: Code flow change**
Record: Before: header defined GDSC IDs 0-10. After: header defines GDSC
IDs 0-15 (adds 11-15). No execution-path change; these are constants
used by other code (driver `drivers/clk/qcom/gcc-sc8180x.c` in the
companion patch) and potentially DTS files.

**Step 2.3: Bug mechanism category**
Record: Category (h) Hardware enablement — adds IDs needed to expose
hardware GDSCs. This is a prerequisite for the follow-on driver patch
that actually registers the 5 GDSCs so they can be power-managed.

**Step 2.4: Fix quality**
Record: Trivially correct — just #define additions. Zero regression risk
on its own (unused constants). Obvious correctness verifiable by reading
the names and numbering. No red flags.

## Phase 3: Git History Investigation

**Step 3.1: Blame**
Record: The file was introduced in commit 4433594bbe5d (SC8180x GCC
driver, v5.12-rc1, January 2021). The existing GDSC section (IDs 0-10)
has been stable since then. This patch only appends new IDs.

**Step 3.2: Fixes target**
Record: This bindings patch has no Fixes: tag. The driver companion
`3565741eb985a` has `Fixes: 4433594bbe5d` ("clk: qcom: gcc: Add global
clock controller driver for SC8180x"). That target commit is in v5.12
and every stable tree since (5.15, 6.1, 6.6, 6.12).

**Step 3.3: File history**
Record: Recent changes to the file have been small additions (GPLL9
support, USB MP resets, UFS QREF clocks) — standard "add missing"
completions. This fits the same pattern. Part of an 11-patch series
"clk: qcom: sc8180x: PM-related fixes (and refactoring)" but this
specific commit + the driver commit (patches 01/11 and 02/11) are the
only "fix missing GDSCs" pair.

**Step 3.4: Author context**
Record: Author Val Packett has submitted Qualcomm platform work
previously; the patch is Acked-by the DT binding maintainer (Krzysztof
Kozlowski) and applied by the Qualcomm SoC maintainer (Bjorn Andersson).
The driver commit got Reviewed-by from two additional Qualcomm
maintainers (Dmitry Baryshkov, Konrad Dybcio).

**Step 3.5: Dependencies**
Record: This bindings patch is a prerequisite for the driver patch
`3565741eb985a`, which references `HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC`
etc. Without this header change, the driver patch won't compile
(verified: `drivers/clk/qcom/gcc-sc8180x.c:17` includes this header).

## Phase 4: Mailing List Research

**Step 4.1: Original discussion**
Record: `b4 dig -c 76404ffbf07f2` found
https://patch.msgid.link/20260312112321.370983-2-val@packett.cool. Part
of v2 series (v1 had 7 patches, v2 expanded to 11 patches). Applied
version is v2. Thread saved; no stable nominations, no NAKs, no concerns
raised on this specific patch.

**Step 4.2: Reviewers**
Record: Acked-by Krzysztof Kozlowski (DT bindings maintainer). The
broader series was reviewed by subsystem maintainers Dmitry Baryshkov
and Konrad Dybcio.

**Step 4.3: Bug report search**
Record: No Reported-by tag, no bug link. The issue was identified by
comparing against downstream DTS.

**Step 4.4: Series context**
Record: 11-patch series. Patches 01-02 are the "add missing GDSCs" pair
(bindings + driver). Patches 03-06 are PM retention/runtime-PM
enablement (larger functional changes). Patches 07-08 are dispcc
changes, 09-11 are camcc refactoring. Only 01+02 are tight bug-fix
material.

**Step 4.5: Stable list**
Record: No stable-list discussion found about this specific patch.

## Phase 5: Code Semantic Analysis

**Step 5.1: Key symbols**
Record: 5 preprocessor constants:
HLOS1_VOTE_MMNOC_MMU_TBU_HF0/HF1/SF_GDSC and
HLOS1_VOTE_TURING_MMU_TBU0/1_GDSC. No functions modified.

**Step 5.2-5.4: Callers/callees**
Record: Used by `drivers/clk/qcom/gcc-sc8180x.c` to index into the
`gcc_sc8180x_gdscs[]` array (verified via grep). Not directly reachable
from user code; these IDs reference power domains managed by the clock
framework and consumed by SMMU/Turing subsystems on SC8180x hardware
(e.g. Microsoft Surface Pro X).

**Step 5.5: Similar patterns**
Record: **Strong precedent found**. An essentially identical SC8280XP
pair exists:
- `9eba4db02a88` (SC8280XP bindings: "Add missing GDSCs") +
  `4712eb7ff85b` (SC8280XP driver fix)
- Both were backported to stable as `66120ba55999a` (explicitly labeled
  `Stable-dep-of: 4712eb7ff85b`) and `a92a9604e8a43` respectively. The
  SC8280XP commit message is almost verbatim identical, and the Qualcomm
  stable process treated the bindings half as a required dependency.

## Phase 6: Cross-referencing / Stable Tree

**Step 6.1: Code in stable**
Record: The header file and driver exist in all stable trees ≥5.12. The
incomplete GDSC list is present in all active stable trees.

**Step 6.2: Backport cleanliness**
Record: Bindings file context from line 320-325 is unchanged since 2023
(last modification 19ac3579af14e "Add missing bindings on gcc-sc8180x").
The addition appends at end of GDSC section — should apply cleanly to
all stable trees without conflicts.

**Step 6.3: Related fixes in stable**
Record: SC8280XP equivalent already in stable (same fix pattern for
sibling SoC).

## Phase 7: Subsystem

**Step 7.1**: Record: `drivers/clk/qcom/` (via header it defines) and
`include/dt-bindings/` — Qualcomm clock/PM subsystem. Criticality:
PERIPHERAL (specific to SC8180x, used in Microsoft Surface Pro X-class
laptops and similar devices).

**Step 7.2**: Record: Qualcomm clock driver area is actively maintained;
this patch went through normal review cycle (v1→v2).

## Phase 8: Impact / Risk

**Step 8.1: Affected users**
Record: SC8180x platform users (notably Surface Pro X; ARM64 laptops).
When combined with driver patch, affects power consumption on these
devices.

**Step 8.2: Trigger**
Record: Always active — SMMU TBU / Turing TBU GDSCs remain powered-on
because kernel doesn't vote them off.

**Step 8.3: Severity of this patch alone**
Record: This bindings-only patch has ZERO runtime effect by itself.
Severity of the **combined fix** (with companion driver patch): MEDIUM —
power waste, excess heat, degraded battery. Not a crash, not a
corruption, but real user-facing PM issue.

**Step 8.4: Risk-benefit**
Record: Benefit: enables the companion driver fix to apply and build.
Risk: essentially zero (5 unused preprocessor macros if driver patch not
applied). As Stable-dep-of — safe and necessary.

## Phase 9: Synthesis

**Evidence FOR:**
- Companion driver fix has `Fixes: 4433594bbe5d` pointing to v5.12;
  valid bug fix
- Strong, nearly identical precedent: SC8280XP pair was backported to
  stable exactly this way (Stable-dep-of marker)
- Five trivial macro additions; zero regression risk
- Applies cleanly to all stable trees (no conflicts in the appended
  section)
- Acked by DT bindings maintainer, reviewed by Qualcomm maintainers
- Required prerequisite — without it the driver fix will not compile in
  stable

**Evidence AGAINST:**
- This patch alone has no runtime effect; it's a dependency, not a
  standalone fix
- The underlying issue is "missing PM" not "crash/corruption"
- Part of a larger 11-patch series, most of which is NOT stable material

**Stable rules check:**
1. Obviously correct — yes (5 #define lines)
2. Fixes real bug — yes, when paired with driver patch (power waste)
3. Important issue — borderline: PM/power waste, not crash
4. Small & contained — yes (5 lines, 1 file)
5. No new features/APIs — yes (enables existing hardware features
   already in DT bindings header)
6. Applies to stable — yes (verified file structure unchanged)

**Exception category**: This is effectively a DT binding additions for
existing hardware (exception category 3) AND a required Stable-dep-of
for a Fixes:-tagged driver commit — which was the exact rationale used
for the SC8280XP precedent.

## Verification

- [Phase 1] Parsed tags via `git show 76404ffbf07f2`: Acked-by Krzysztof
  Kozlowski, Signed-off-by Bjorn Andersson, Link to lore. No
  Fixes:/stable tags on bindings commit.
- [Phase 1] Companion `git show 3565741eb985a` confirmed `Fixes:
  4433594bbe5d` and two Reviewed-by tags.
- [Phase 2] Diff analysis: 5 line additions in one file, pure #define
  macros.
- [Phase 3] `git show 4433594bbe5d` and `git describe --contains
  4433594bbe5d` → v5.12-rc1~110^2^4~33. Bug present since v5.12.
- [Phase 3] `git log --oneline -- include/dt-bindings/clock/qcom,gcc-
  sc8180x.h`: confirms file has been amended via "Add missing X" commits
  repeatedly.
- [Phase 4] `b4 dig -c 76404ffbf07f2`: found
  https://patch.msgid.link/20260312112321.370983-2-val@packett.cool
- [Phase 4] `b4 dig -c 76404ffbf07f2 -a`: found v1 (7-patch) and v2
  (11-patch). Applied = v2 (latest).
- [Phase 4] Thread saved and searched for "stable": no stable
  nominations or objections.
- [Phase 5] `grep qcom,gcc-sc8180x.h drivers/clk/qcom/gcc-sc8180x.c`:
  confirms line 17 includes this header — driver build depends on these
  defines.
- [Phase 5] `git show 3565741eb985a | grep HLOS1_VOTE_`: driver patch
  uses all 5 new defines.
- [Phase 5] Precedent: `git show 66120ba55999a`: confirmed "[ Upstream
  commit 9eba4db02a88e7a810aabd70f7a6960f184f391f ]" and "Stable-dep-of:
  4712eb7ff85b" — identical pattern backported to stable for SC8280XP.
- [Phase 5] `git show a92a9604e8a43`: confirmed companion SC8280XP
  driver fix was also backported.
- [Phase 6] `git describe --contains 9eba4db02a88` → v6.6-rc1. Stable
  backports landed in older branches with Stable-dep-of marker.
- [Phase 6] Read current file (lines 300-327): confirmed GDSC section
  ends at USB30_SEC_GDSC=10; appending 5 new IDs won't conflict with any
  downstream state in stable.
- UNVERIFIED: Could not fetch the actual lore thread content (anti-bot
  wall); relied on saved mbox and local commit metadata. Could not
  verify stable maintainer's intention for this specific pair, but
  SC8280XP precedent is unambiguous.

## Conclusion

This is a pure DT-bindings header addition that is safe on its own (zero
runtime impact) and is a **required prerequisite** for the companion
driver patch `3565741eb985a` which has a `Fixes:` tag pointing to v5.12.
The almost identical SC8280XP bindings commit (`9eba4db02a88`) was
backported to stable as `Stable-dep-of: 4712eb7ff85b`, establishing a
clear precedent. Without this patch, the driver fix cannot compile in
stable trees. It is small, obviously correct, applies cleanly, and
follows an exception category (DT bindings for existing hardware +
required dependency for a Fixes:-tagged fix).

**YES**

 include/dt-bindings/clock/qcom,gcc-sc8180x.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
index b9d8438a15ffb..9ed7b794aacc4 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
@@ -322,5 +322,10 @@
 #define USB30_MP_GDSC						8
 #define USB30_PRIM_GDSC						9
 #define USB30_SEC_GDSC						10
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC		11
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC		12
+#define HLOS1_VOTE_MMNOC_MMU_TBU_SF_GDSC		13
+#define HLOS1_VOTE_TURING_MMU_TBU0_GDSC			14
+#define HLOS1_VOTE_TURING_MMU_TBU1_GDSC			15
 
 #endif
-- 
2.53.0


