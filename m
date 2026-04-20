Return-Path: <linux-arm-msm+bounces-103771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCeqMlw55mlutgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:34:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C8342D311
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75880328B4A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92E93BE177;
	Mon, 20 Apr 2026 13:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBCJG+c5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843AB3A5E6E;
	Mon, 20 Apr 2026 13:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691545; cv=none; b=d3owtcuZ32wPPCo0lDvvnbO39WSW5Wy7HmuMF1jkgN1w+aB2xJmFen+oZpxXmb5Lb227Jgt1+jKX3l3yTCUqZYn+dnKU+92BTM0urgCu9cpBSzfuir0pnWfaVOKKaSOVp5kCWq2rWJEgzfNKf3eTsKmpsDnf877628utEzevf9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691545; c=relaxed/simple;
	bh=V3TebsZBHaPg5vd06uGJ3BVt1AyF2aq9pQ2Zxp3zgKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LgzSNi00XQVC00VYYYc6H2nNQNFZ9CyV2OS6RHmVb3HERQ1uNEW8irudlyFziFhgU+vzVMhTsFqJ+gbOGW+uxiO93Xx/zkDIcGKR2KJlnLH0OXJZilFBEahulE/sbMX18QRwG+8+z+uGBawlVFUAwHTBmnUZRkawDTX1yBbYUOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBCJG+c5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA02EC2BCB6;
	Mon, 20 Apr 2026 13:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691545;
	bh=V3TebsZBHaPg5vd06uGJ3BVt1AyF2aq9pQ2Zxp3zgKw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KBCJG+c5j2VMRu4rWEpkNzh7hoMYo3RAnlPpWmNCHaCcvE4Bsk53JAzCCatyDluGN
	 M5bgHR2XXcpNmigH7xT1wvq+ZLFxMkzXNh5QgkRPniSAkY7XNR2X6JJ38sIp8SOh9L
	 3fzcdfPFV8GIMikNs7yQtfgq+bazKFNNAPjXn2D29k/EEe2L6f58PO3k0pegpQm9JM
	 1r5Mp74ClZIxTA5UWr+FXJGmzUbcV7YbqBegng8BDo+QmUd3aXUET/veeeINEQ5PKx
	 gJMPMJVSHO+lQgjLhjDHmfrni0H6Y/K40Qok+9gacqEe29W96DP+ByWAUHPKdrb8TV
	 qI4hPkrTiZgEA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.1] drm/msm/dpu: fix vblank IRQ registration before atomic_mode_set
Date: Mon, 20 Apr 2026 09:18:06 -0400
Message-ID: <20260420132314.1023554-92-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[adishatz.org,oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-103771-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,patchwork.freedesktop.org:url]
X-Rspamd-Queue-Id: 15C8342D311
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Cédric Bellegarde <cedric.bellegarde@adishatz.org>

[ Upstream commit 961c900628fef77ad07b4bc4c868e47b9a1269c7 ]

dpu_encoder_toggle_vblank_for_crtc() can call control_vblank_irq()
at any time in response to a userspace vblank request, independently
of the atomic commit sequence. If this happens before the encoder's
first atomic_mode_set(), irq[INTR_IDX_RDPTR] is still zero.

Passing irq_idx=0 to dpu_core_irq_register_callback() is treated as
invalid, and DPU_IRQ_REG(0) and DPU_IRQ_BIT(0) produce misleading
values of 134217727 and 31 respectively due to unsigned wraparound
in the (irq_idx - 1) macros, resulting in the confusing error:

  [dpu error]invalid IRQ=[134217727, 31]

Since irq[INTR_IDX_RDPTR] will be properly populated by
atomic_mode_set() and registered by irq_enable() as part of the
normal modeset sequence, silently skip the vblank IRQ registration
when the index has not yet been initialized. This matches the
existing pattern of the master encoder check above it.

Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/712752/
Link: https://lore.kernel.org/r/20260318171700.394945-1-cedric.bellegarde@adishatz.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed for a complete analysis. Let me
synthesize the findings.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1**: Subject: `drm/msm/dpu:` subsystem prefix. Action verb:
`fix`. Summary: Fix vblank IRQ registration when called before
atomic_mode_set() initializes the IRQ index.

**Step 1.2**: Tags:
- `Signed-off-by: Cédric Bellegarde` (author)
- `Reviewed-by: Dmitry Baryshkov` (subsystem maintainer - strong quality
  signal)
- `Patchwork: https://patchwork.freedesktop.org/patch/712752/`
- `Link: https://lore.kernel.org/r/20260318171700.394945-1-
  cedric.bellegarde@adishatz.org`
- `Signed-off-by: Dmitry Baryshkov` (merged by maintainer)
- No Fixes: tag, no Cc: stable, no Reported-by. Absence of these tags is
  expected.

**Step 1.3**: The commit body explains:
- Bug: `dpu_encoder_toggle_vblank_for_crtc()` can call
  `control_vblank_irq()` at any time via a vblank workqueue,
  independently of the atomic commit sequence.
- Root cause: Before the encoder's first `atomic_mode_set()`,
  `irq[INTR_IDX_RDPTR]` is zero.
- Symptom: Passing irq_idx=0 to `dpu_core_irq_register_callback()`
  produces confusing error: `[dpu error]invalid IRQ=[134217727, 31]` due
  to unsigned wraparound in `(irq_idx - 1)` macros.
- Fix approach: Early return when irq index is 0, matching the existing
  master encoder check pattern.

**Step 1.4**: This is explicitly labeled as a fix, not hidden.

## PHASE 2: DIFF ANALYSIS

**Step 2.1**: Single file changed: `dpu_encoder_phys_cmd.c`. +6 lines
added (including blank line). One function modified:
`dpu_encoder_phys_cmd_control_vblank_irq()`. Scope: single-file surgical
fix.

**Step 2.2**: The change inserts a guard check between the slave encoder
check and the refcount-negative check:
- **Before**: If `irq[INTR_IDX_RDPTR]` is 0, the code proceeds to call
  `dpu_core_irq_register_callback(dpu_kms, 0, ...)`, which fails with
  confusing error messages.
- **After**: The new check catches irq_idx=0 early, returns -EINVAL via
  `goto end`, skipping the confusing `dpu_core_irq_register_callback()`
  error path.

**Step 2.3**: Bug category: **Logic/correctness fix** (missing guard for
uninitialized state). The function can be called via the vblank
workqueue before IRQs are initialized. The macros `DPU_IRQ_REG(0) =
(0-1)/32 = 134217727` and `DPU_IRQ_BIT(0) = (0-1)%32 = 31` produce
wildly misleading error values.

**Step 2.4**: Fix quality: Obviously correct. The check
`!phys_enc->irq[INTR_IDX_RDPTR]` is the simplest possible guard. No
regression risk - returns the same -EINVAL that the existing code path
produces (via `dpu_core_irq_is_valid(0)` returning false), just without
the confusing intermediate error message. Follows the pattern of the
slave encoder check above it.

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1**: `git blame` shows the `control_vblank_irq()` function was
introduced by Jeykumar Sankaran in commit `25fdd5933e4c0f` (June 2018),
the original DPU driver submission. The function has been present since
v5.1.

**Step 3.2**: No Fixes: tag present.

**Step 3.3**: Related commits:
- `d13f638c9b88e` (v6.9): Dropped `atomic_mode_set()`, moving IRQ init
  to `irq_enable()` — introduced the bug more acutely
- `35322c39a653c` (v6.11): Reverted the above, re-adding
  `atomic_mode_set()` — partially fixed the issue
- The current fix addresses the remaining race window even after the
  revert, since `control_vblank_irq()` can be called before the first
  `atomic_mode_set()`

**Step 3.4**: The author (Cédric Bellegarde) is not the maintainer but
the patch is reviewed and merged by Dmitry Baryshkov, who is the DPU
subsystem maintainer.

**Step 3.5**: No prerequisites needed. The fix applies to the code as it
exists in the current tree. For older stable trees, the
`vblank_ctl_lock` mutex (added in v6.8 by `45284ff733e4c`) must exist
for the `goto end` pattern to work correctly.

## PHASE 4: MAILING LIST RESEARCH

**Step 4.1**: Both lore.kernel.org and patchwork.freedesktop.org were
blocked by anti-bot protection. The b4 dig search didn't find the commit
directly. However, the patchwork link in the commit metadata
(`patch/712752/`) and the lore link confirm it was submitted and
reviewed through the normal DRM/MSM workflow.

**Step 4.2**: Reviewed by Dmitry Baryshkov (DPU subsystem maintainer),
who also merged the patch. This is the appropriate reviewer.

**Step 4.3-4.5**: Could not fully verify due to anti-bot protections on
lore/patchwork.

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1**: Modified function:
`dpu_encoder_phys_cmd_control_vblank_irq()`

**Step 5.2**: Call chain traced:
1. Userspace vblank request → DRM framework
2. `msm_crtc_enable_vblank()` → `vblank_ctrl_queue_work()` (queues work
   item)
3. `vblank_ctrl_worker()` (async workqueue) →
   `kms->funcs->enable_vblank()`
4. `dpu_kms_enable_vblank()` → `dpu_crtc_vblank()` →
   `dpu_encoder_toggle_vblank_for_crtc()`
5. → `phys->ops.control_vblank_irq(phys, enable)` (the function being
   fixed)

This is a common user-reachable path — any userspace app requesting
vblank events.

**Step 5.3-5.4**: The vblank worker runs asynchronously. If it fires
before the first `atomic_mode_set()` in the atomic commit path,
`irq[INTR_IDX_RDPTR]` is still zero. Confirmed at line 159:

```149:163:drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
static void dpu_encoder_phys_cmd_atomic_mode_set(
                struct dpu_encoder_phys *phys_enc,
                struct drm_crtc_state *crtc_state,
                struct drm_connector_state *conn_state)
{
        // ... sets irq[INTR_IDX_RDPTR] here
        if (phys_enc->has_intf_te)
                phys_enc->irq[INTR_IDX_RDPTR] =
phys_enc->hw_intf->cap->intr_tear_rd_ptr;
        else
                phys_enc->irq[INTR_IDX_RDPTR] =
phys_enc->hw_pp->caps->intr_rdptr;
        // ...
}
```

**Step 5.5**: The video encoder
(`dpu_encoder_phys_vid_control_vblank_irq`) has a similar pattern with
`INTR_IDX_VSYNC` but lacks this guard. Potentially a related issue
exists there too.

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1**: The buggy code (`control_vblank_irq` without the guard)
exists in all stable trees since v5.1. The async vblank workqueue path
that triggers it also exists in all DPU-capable stable trees.

**Step 6.2**: Backport complications:
- v6.12.y and later: Should apply cleanly (mutex locking exists since
  v6.8)
- v6.6.y: The `vblank_ctl_lock` mutex doesn't exist; function uses
  different locking. Would need adaptation.

**Step 6.3**: The related revert `35322c39a653c` (v6.11) fixed the acute
version of this problem but didn't address the remaining race window
this fix covers.

## PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1**: Subsystem: `drivers/gpu/drm/msm/disp/dpu1/` — DPU display
driver for Qualcomm SoCs. Criticality: IMPORTANT. Used in Qualcomm-based
phones, Chromebooks, and development boards (Dragonboard, Robotics RB
series).

**Step 7.2**: Active subsystem with regular commits from Dmitry
Baryshkov and other contributors.

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1**: Affects users of Qualcomm command-mode DSI panels (common
in mobile devices and some Chromebooks).

**Step 8.2**: Trigger: Userspace requesting vblank events before the
first atomic modeset completes. This can happen during display
initialization if applications request vblank timing early. The vblank
workqueue makes this asynchronous and timing-dependent.

**Step 8.3**: Failure mode: Confusing error messages in dmesg (`invalid
IRQ=[134217727, 31]`). Not a crash, not data corruption, not a security
issue. Severity: **MEDIUM** — the error messages are misleading and can
cause confusion during debugging, but the system still functions
correctly because `dpu_core_irq_is_valid(0)` catches the invalid index.

**Step 8.4**:
- **Benefit**: MEDIUM — eliminates confusing error messages for CMD DSI
  panel users; makes the code path cleaner and more intentional
- **Risk**: VERY LOW — 5 lines, obviously correct guard check, returns
  same error code, no change in functional behavior
- **Ratio**: Favorable — low risk fix with meaningful user-facing
  improvement

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR backporting:**
- Small, surgical fix (5 lines in one function)
- Obviously correct — simple NULL/zero check before use
- Reviewed and merged by subsystem maintainer (Dmitry Baryshkov)
- Fixes a real race condition between async vblank workqueue and atomic
  commit
- Eliminates confusing error messages (`invalid IRQ=[134217727, 31]`)
  caused by unsigned wraparound
- Follows existing code pattern in the same function (master encoder
  guard)
- Affects real hardware (Qualcomm CMD DSI panels in mobile/Chromebook)
- No regression risk — returns same error as existing path

**Evidence AGAINST backporting:**
- Not fixing a crash, security issue, or data corruption
- Primarily an error message cleanup (existing code already handles
  irq_idx=0 correctly via `dpu_core_irq_is_valid`)
- May need adaptation for older stable trees (v6.6.y lacks mutex)

**Stable rules checklist:**
1. Obviously correct and tested? **YES** — trivial guard, reviewed by
   maintainer
2. Fixes a real bug? **YES** — race condition producing confusing errors
3. Important issue? **MEDIUM** — not crash/security, but user-visible
   error messages on real hardware
4. Small and contained? **YES** — 5 lines in one function
5. No new features or APIs? **YES**
6. Can apply to stable trees? **YES** for v6.12.y+; needs adaptation for
   v6.6.y

## Verification

- [Phase 1] Parsed tags: Reviewed-by Dmitry Baryshkov (maintainer), Link
  to lore, Patchwork link. No Fixes/Cc:stable (expected).
- [Phase 2] Diff analysis: 5 lines added to
  `dpu_encoder_phys_cmd_control_vblank_irq()`, guards against
  irq[INTR_IDX_RDPTR]==0 before calling dpu_core_irq_register_callback.
- [Phase 2] Verified DPU_IRQ_REG/DPU_IRQ_BIT macros at
  `dpu_hw_interrupts.h:40-41`: `(irq_idx - 1) / 32` and `(irq_idx - 1) %
  32` — confirmed unsigned wraparound when irq_idx=0.
- [Phase 2] Verified `dpu_core_irq_is_valid(0)` at
  `dpu_hw_interrupts.c:289-292`: returns false, so existing code catches
  it but after printing confusing values.
- [Phase 3] git blame: `control_vblank_irq()` introduced by
  `25fdd5933e4c0f` (v5.1, June 2018), present in all stable trees.
- [Phase 3] git show `35322c39a653c`: Confirmed revert of
  `d13f638c9b88e`, with identical call trace showing the same race
  condition this fix addresses.
- [Phase 3] `d13f638c9b88e` (v6.9) dropped atomic_mode_set;
  `35322c39a653c` (v6.11) reverted it. Current fix addresses remaining
  race window.
- [Phase 4] Lore/patchwork blocked by anti-bot protection — could not
  verify full discussion.
- [Phase 5] Traced full call chain: `msm_crtc_enable_vblank →
  vblank_ctrl_queue_work → vblank_ctrl_worker → dpu_kms_enable_vblank →
  dpu_crtc_vblank → dpu_encoder_toggle_vblank_for_crtc →
  control_vblank_irq`. Confirmed async workqueue makes this race
  realistic.
- [Phase 5] Verified `atomic_mode_set()` at line 149-164 initializes
  `irq[INTR_IDX_RDPTR]` — confirmed it's the only place this IRQ index
  is set.
- [Phase 5] Verified `dpu_encoder_toggle_vblank_for_crtc()` ignores the
  return value from `control_vblank_irq()`.
- [Phase 6] `vblank_ctl_lock` mutex added in v6.8 (`45284ff733e4c`) —
  confirmed this dependency for backport to v6.6.y.
- [Phase 7] Confirmed active subsystem with regular Dmitry Baryshkov
  contributions.
- [Phase 8] Failure mode: confusing error messages, no crash/corruption.
  Severity: MEDIUM.
- UNVERIFIED: Full mailing list discussion (lore blocked). Cannot
  confirm if stable was discussed or if there are NAKs.

The fix is small, obviously correct, reviewed by the maintainer, and
addresses a real race condition on Qualcomm command-mode DSI panels.
While the primary impact is eliminating confusing error messages rather
than preventing crashes, the fix improves code robustness with
negligible regression risk.

**YES**

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 93db1484f6069..45079ee59cf67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -257,6 +257,12 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		goto end;
 
+	/* IRQ not yet initialized */
+	if (!phys_enc->irq[INTR_IDX_RDPTR]) {
+		ret = -EINVAL;
+		goto end;
+	}
+
 	/* protect against negative */
 	if (!enable && refcount == 0) {
 		ret = -EINVAL;
-- 
2.53.0


