Return-Path: <linux-arm-msm+bounces-103770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDbICZ8w5ml6tAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:56:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A987242C729
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91B4930C3CAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6A83EF657;
	Mon, 20 Apr 2026 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2Tv7AhE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941093EF650;
	Mon, 20 Apr 2026 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691525; cv=none; b=lFS1dPq1kZ9ixW4Y2c8QD76WCZcNF75H8zl/UrboJrOSBL1hf82nCoMzvrQXqudxwXye2JTd98j/udiMqqHU6vSqm4cmCYeIJP2qaPMdWTGb6/FziD4pRReapLzbqwy53wr5CG7zH0w0kmwPfCVYCYV7Cl8nh9xp84qS/WRoj2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691525; c=relaxed/simple;
	bh=2VRNVQbyAA2kIKYeFyG7zX3zgXDl8CdjLF3CM8tWmQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bBxhvlwqzq7hkJLzgq4/HmutuSXUOHx71aedQnCui76yFR4z2GUUQE9P/032fPB40Z5p3lLT5vXIfE+UR4iqTm+76gFJPWegQQYDUfqAxb2ntAFggySsL0zbyEyXqvILGgI/+XnjWTCAsHIi34ZH5Op86+yP2TuacNXuyXsyq+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2Tv7AhE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0526EC2BCC7;
	Mon, 20 Apr 2026 13:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691525;
	bh=2VRNVQbyAA2kIKYeFyG7zX3zgXDl8CdjLF3CM8tWmQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z2Tv7AhEwECvtXFuSwK77hOmR9ENpU5qBFKsQhEghjKrl3qh35kaOhQMk88ETVxXL
	 TvuyCNE9WnY9P6KDIar7v8tAt2n+IJyFKmme3UARXbVkVQroz3tJxeGeJ8MBOp2/p+
	 EI9FcL0S5LY6A3lMscK+7zBwNwkKSQhJWMVwx08rrIs6EfWmjufZ0Z2BH13tXjwX20
	 06rMsAi8tTgDjN8+glYfDORl/9us75LzriWm4/PHdIU+2IQ93SwEJ9VErJtfiL1WT+
	 fDCpT/QvOQ8fh4s6otffsOfxDr7QWTnYQS1AQcy9rIJuPYwEVx/C7xivO6+/mELCVx
	 D/h01m96vs6oQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srini@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] ASoC: codecs: wcd-clsh: Always update buck/flyback on transitions on transitions
Date: Mon, 20 Apr 2026 09:17:54 -0400
Message-ID: <20260420132314.1023554-80-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[adishatz.org,kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-103770-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,yhbt.net:url,adishatz.org:email]
X-Rspamd-Queue-Id: A987242C729
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Cédric Bellegarde <cedric.bellegarde@adishatz.org>

[ Upstream commit f8d51e903a6c97d8d298f14d9f8b4fff808670e3 ]

The WCD934x audio outputs (earpiece, headphone, speaker) share two power
supply converters, a buck and a flyback, managed by reference counters
(buck_users, flyback_users) in the Class-H controller.

The early return in wcd_clsh_ctrl_set_state() when nstate == ctrl->state
prevented _wcd_clsh_ctrl_set_state() from being called when switching
between outputs sharing the same state value. As a result, the buck and
flyback reference counters were never decremented on disable, leaving the
converters active and their counters out of sync with the actual hardware
state.

This caused audible distortion on the earpiece output and spurious MBHC
over-current protection interrupts on HPHL/HPHR during output switching.

Remove the early return so that CLSH_REQ_ENABLE and CLSH_REQ_DISABLE are
always dispatched, keeping the buck and flyback reference counters
consistent on every state transition.

Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
Link: https://patch.msgid.link/20260304141006.280894-1-cedric.bellegarde@adishatz.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information I need. Let me compile the full analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Subject Line
- **Subsystem:** ASoC: codecs: wcd-clsh
- **Action verb:** "Always update" (implies something was incorrectly
  not being updated = bug fix)
- **Summary:** Remove an incorrect early return that prevented
  buck/flyback power supply reference counters from being updated during
  audio output transitions.

### Step 1.2: Tags
- **Signed-off-by:** Cédric Bellegarde (author)
- **Link:** https://patch.msgid.link/20260304141006.280894-1-
  cedric.bellegarde@adishatz.org
- **Signed-off-by:** Mark Brown (ASoC maintainer, applied the patch)
- No Fixes: tag, no Reported-by, no Cc: stable — all expected for
  candidate review.

### Step 1.3: Commit Body Analysis
The commit message is detailed and clearly explains:
- **Bug:** Early return in `wcd_clsh_ctrl_set_state()` when `nstate ==
  ctrl->state` prevented `_wcd_clsh_ctrl_set_state()` from being called
  during disable transitions.
- **Root cause:** Each audio output (earpiece, HPHL, HPHR) calls
  `set_state` with the same `nstate` for both enable (PRE_DAC) and
  disable (POST_PA). The early return silently skips the disable call.
- **Symptom:** Buck/flyback reference counters never decremented →
  converters left active → audible distortion on earpiece + spurious
  MBHC over-current interrupts on HPHL/HPHR.
- **Fix:** Remove the 3-line early return.

### Step 1.4: Hidden Bug Fix?
No — this is explicitly described as a bug fix with clear user-visible
symptoms. The commit message thoroughly explains the bug mechanism.

---

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory
- **Files changed:** 1 (`sound/soc/codecs/wcd-clsh-v2.c`)
- **Lines:** -3, +0 (pure deletion)
- **Function modified:** `wcd_clsh_ctrl_set_state()`
- **Scope:** Single-file, surgical fix

### Step 2.2: Code Flow Change
**Before:** When `nstate == ctrl->state`, the function returns
immediately without calling `_wcd_clsh_ctrl_set_state()`. This means
neither CLSH_REQ_ENABLE nor CLSH_REQ_DISABLE is dispatched.

**After:** The function always proceeds to the switch on `clsh_event`,
dispatching either CLSH_REQ_ENABLE or CLSH_REQ_DISABLE to
`_wcd_clsh_ctrl_set_state()`.

### Step 2.3: Bug Mechanism
This is a **reference counting bug**. Looking at the actual call pattern
in wcd934x.c:

1. **Enable EAR** (PRE_PMU): `set_state(ctrl, PRE_DAC,
   WCD_CLSH_STATE_EAR, CLS_H_NORMAL)` → state=EAR, buck_users++,
   flyback_users++
2. **Disable EAR** (POST_PMD): `set_state(ctrl, POST_PA,
   WCD_CLSH_STATE_EAR, CLS_H_NORMAL)` → nstate=EAR == ctrl->state=EAR →
   **EARLY RETURN!** Buck/flyback never decremented.

The same pattern affects ALL outputs (HPHL, HPHR, LO, AUX) across ALL
WCD codec drivers (wcd9335, wcd934x, wcd937x, wcd938x, wcd939x).

### Step 2.4: Fix Quality
- **Obviously correct:** Yes. The early return was clearly wrong — the
  function uses `clsh_event` (enable vs disable) to dispatch different
  operations, and the early return bypasses this dispatch.
- **Minimal/surgical:** Maximum surgical — 3-line deletion.
- **Regression risk:** Very low. The removed check was a premature
  optimization that incorrectly assumed same nstate means no-op. The
  `_wcd_clsh_ctrl_set_state` sub-functions use reference counting
  (buck_users, flyback_users) which already handles idempotency
  correctly.

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: Blame
The buggy early return at line 851-852 was introduced in commit
`cc2e324d39b26` ("ASoC: wcd9335: add CLASS-H Controller support") by
Srinivas Kandagatla, merged in **v5.1-rc1**. This code has been present
since the initial creation of the file.

### Step 3.2: Fixes Tag
No Fixes: tag present. However, the bug was clearly introduced by
`cc2e324d39b26` (v5.1-rc1).

### Step 3.3: File History
9 commits to `wcd-clsh-v2.c` since initial creation. Changes have been
minor: unused function removal, new codec version support, symbol
renaming, GENMASK fixes. No prior fix to this early return logic.

### Step 3.4: Author
Cédric Bellegarde has one other commit in the tree (ASoC: qcom: q6asm:
drop DSP responses for closed data streams). Not the subsystem
maintainer, but the patch was accepted by Mark Brown (ASoC maintainer).

### Step 3.5: Dependencies
None. This is a standalone 3-line deletion with no dependencies on other
patches.

---

## PHASE 4: MAILING LIST RESEARCH

### Step 4.1: Original Discussion
Found via web search at yhbt.net/lore mirror. The patch was submitted on
2026-03-04 and applied by Mark Brown on 2026-03-16 to `broonie/sound
for-7.1` (commit `f8d51e903a6c`).

### Step 4.2: Reviewer Feedback
Mark Brown applied directly with no review comments or objections — a
clean accept from the ASoC subsystem maintainer. No NAKs or concerns
raised.

### Step 4.3: Bug Report
No separate bug report; the author discovered this through direct
debugging (audio distortion and spurious interrupts during output
switching).

### Step 4.4: Series Context
Single standalone patch, not part of any series.

### Step 4.5: Stable Discussion
No stable-specific discussion found.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: Modified Function
`wcd_clsh_ctrl_set_state()` — exported function, the main API for the
Class-H controller.

### Step 5.2: Callers
`wcd_clsh_ctrl_set_state()` is called from **5 different WCD codec
drivers**:
- `wcd9335.c` — 8 call sites (EAR, HPHL, HPHR, LO)
- `wcd934x.c` — 8 call sites (EAR, HPHL, HPHR, LO)
- `wcd937x.c` — 8 call sites (EAR, HPHL, HPHR, AUX)
- `wcd938x.c` — 10 call sites (EAR, HPHL, HPHR, AUX)
- `wcd939x.c` — 6 call sites (EAR, HPHL, HPHR)

All follow the same pattern: PRE_DAC enable on PMU, POST_PA disable on
PMD.

### Step 5.3-5.4: Call Chain
These are called from DAPM widget event handlers, triggered during
normal audio routing changes. Every user who plays audio through
earpiece, headphones, or speaker on a Qualcomm WCD93xx-based device
triggers this code path.

### Step 5.5: Similar Patterns
The reference counting pattern in `wcd_clsh_buck_ctrl()` and
`wcd_clsh_flyback_ctrl()` (and v3 variants) all use increment-on-
enable/decrement-on-disable with `buck_users`/`flyback_users`. The early
return prevented the decrement path from ever executing.

---

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: Buggy Code in Stable
The bug was introduced in `cc2e324d39b26` (v5.1-rc1). This code exists
in **all active stable trees**: 5.10.y, 5.15.y, 6.1.y, 6.6.y, 6.12.y,
and any other LTS/stable branches.

### Step 6.2: Backport Complications
The file has had only minor changes (renaming, cleanup). The patch is a
simple 3-line deletion that should apply cleanly to all stable trees.

### Step 6.3: Related Fixes
No prior fix for this issue in any stable tree.

---

## PHASE 7: SUBSYSTEM CONTEXT

### Step 7.1: Subsystem
- **Path:** sound/soc/codecs/
- **Subsystem:** ASoC (Audio System on Chip) — audio codec drivers
- **Criticality:** IMPORTANT — affects audio on all Qualcomm WCD93xx
  codec-based phones and devices (many Android devices, some embedded
  systems)

### Step 7.2: Activity
Moderately active subsystem with steady fixes and improvements.

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: Affected Users
All users of Qualcomm WCD93xx-series audio codecs (WCD9335, WCD934x,
WCD937x, WCD938x, WCD939x). This includes many Android phones and
Qualcomm-based embedded systems.

### Step 8.2: Trigger Conditions
- **Trigger:** Any normal audio output switching (e.g., call on
  earpiece, then play music through headphones) — extremely common
  operation.
- **Unprivileged trigger:** Yes — any userspace audio playback triggers
  this.

### Step 8.3: Failure Mode Severity
- **Audible distortion** on earpiece — MEDIUM-HIGH (user-perceivable
  audio quality issue)
- **Spurious MBHC over-current interrupts** — MEDIUM (can cause spurious
  headphone detection events)
- **Power supply reference counter leak** — MEDIUM (converters left
  active, wasted power, potential for undefined hardware behavior)
- Overall severity: **HIGH** — directly affects audio functionality

### Step 8.4: Risk-Benefit Ratio
- **Benefit:** HIGH — fixes audio distortion and spurious interrupts on
  a wide class of devices, bug present since v5.1
- **Risk:** VERY LOW — 3-line deletion, obviously correct, no regression
  risk (the removed check was always wrong)
- **Ratio:** Very favorable for backporting

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence Compilation

**FOR backporting:**
- Fixes a real, user-visible bug: audio distortion and spurious
  interrupts
- Reference counting bug — buck/flyback users never decremented on
  disable
- Affects ALL WCD93xx codec users (5 codec drivers, ~40 call sites)
- Bug present since v5.1-rc1 — affects all active stable trees
- Fix is minimal: 3-line deletion, obviously correct
- Applied by ASoC maintainer Mark Brown with no concerns
- No dependencies — standalone fix
- Will apply cleanly to all stable trees

**AGAINST backporting:**
- No Fixes: tag (expected — that's why it's under manual review)
- Author is not the subsystem maintainer
- No formal Reported-by (author found it themselves)

### Step 9.2: Stable Rules Checklist
1. **Obviously correct and tested?** YES — 3-line deletion, logic
   clearly wrong, applied by maintainer
2. **Fixes a real bug?** YES — audio distortion, spurious interrupts,
   reference counter leak
3. **Important issue?** YES — user-perceivable audio quality degradation
   on common hardware
4. **Small and contained?** YES — 3 lines removed from 1 file, 1
   function
5. **No new features or APIs?** YES — pure bug fix
6. **Can apply to stable?** YES — clean apply expected

### Step 9.3: Exception Categories
Not applicable — this is a straightforward bug fix, not an exception
category.

### Step 9.4: Decision
This is a clear, minimal fix for a real reference counting bug that
causes audible audio distortion on all Qualcomm WCD93xx codec-based
devices. The bug has existed since v5.1. The fix is a 3-line deletion
that is obviously correct and was accepted by the ASoC maintainer.

---

## Verification

- [Phase 1] Parsed tags: Signed-off-by (author + Mark Brown), Link to
  patch.msgid.link
- [Phase 2] Diff analysis: 3 lines removed from
  `wcd_clsh_ctrl_set_state()`, removes incorrect early return
- [Phase 2] Verified bug mechanism: PRE_DAC sets state=EAR, POST_PA
  passes same nstate=EAR, early return prevents DISABLE dispatch
- [Phase 2] Verified reference counting: `wcd_clsh_buck_ctrl()` (line
  182-183) and `wcd_clsh_flyback_ctrl()` (line 231-232) use
  increment/decrement of `buck_users`/`flyback_users`
- [Phase 3] git blame: buggy code introduced in cc2e324d39b26 (v5.1-rc1)
  — present since file creation
- [Phase 3] git log: only 9 commits to this file since creation, no
  prior fix for this issue
- [Phase 4] Found original submission at yhbt.net lore mirror: single
  patch, clean accept by Mark Brown for-7.1
- [Phase 4] No NAKs, no review concerns raised
- [Phase 5] Verified callers: 5 codec drivers (wcd9335, wcd934x,
  wcd937x, wcd938x, wcd939x), ~40 call sites, all follow enable/disable
  pattern
- [Phase 6] Code exists in all active stable trees (v5.1+)
- [Phase 6] File has minimal changes — clean apply expected
- [Phase 8] Failure mode: audio distortion + spurious interrupts,
  severity HIGH

**YES**

 sound/soc/codecs/wcd-clsh-v2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/wcd-clsh-v2.c b/sound/soc/codecs/wcd-clsh-v2.c
index 13d07296916f6..62ca22ea0f3b6 100644
--- a/sound/soc/codecs/wcd-clsh-v2.c
+++ b/sound/soc/codecs/wcd-clsh-v2.c
@@ -848,9 +848,6 @@ int wcd_clsh_ctrl_set_state(struct wcd_clsh_ctrl *ctrl,
 {
 	struct snd_soc_component *comp = ctrl->comp;
 
-	if (nstate == ctrl->state)
-		return 0;
-
 	if (!wcd_clsh_is_state_valid(nstate)) {
 		dev_err(comp->dev, "Class-H not a valid new state:\n");
 		return -EINVAL;
-- 
2.53.0


