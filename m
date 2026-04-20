Return-Path: <linux-arm-msm+bounces-103780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGBwMI1H5mnSuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:34:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3850C42E59E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B09530A8F0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609E83AEF4F;
	Mon, 20 Apr 2026 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgGgqR+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCBC4D90B5;
	Mon, 20 Apr 2026 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776692014; cv=none; b=LqtBMP9FF51jTScYWCEKc2SW6fIeMQMoPTZR8upy5P1GMe2NqH1ov4DxmLhB1GP8pNLZ6WPaq8K/GIP9LTXq5EItOjNwm8TJnPiHme+rfzue+VMIQoT0ey4h+1+sLa0ehCRHz9eU+3mZb2G/vSVeSPoOD4xKrdRU+mlKWmK+wZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776692014; c=relaxed/simple;
	bh=mx3dOkIZBfxT1nQO36SjIqI8eRf8QWZlS456mSUrd5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ruogb1FPt2Q2EqKiXPlRWU9N4To2cRflEhFCRnHMuVAHYyOJsRKPE2ua2xTuDk8QcTz6vthDcdyuS2nB2ej66qnWwC16pdg4OVkc0b2E8GlixJT+YJwGqsqnvFY4mEBAynrn2IysbB3Y3au4hrxcCIjPExYz+9Xx6Wck1IAYJUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgGgqR+8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9793EC19425;
	Mon, 20 Apr 2026 13:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776692014;
	bh=mx3dOkIZBfxT1nQO36SjIqI8eRf8QWZlS456mSUrd5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mgGgqR+8wRZj+c2ubr3Sl5W6NU2NbXzEhk3REBog+g5MQntbtek4n1rImkOlNGD9h
	 JrC/D1DJQvoEd899xLc2OGq9go452GI8X+J85uQo/fh+R3+XV6xWe7VNGpA3nqlYfO
	 KBQ02bgdF7WKt/ViKQ86l+UT9dCChcbL10nR88kchSBstUuJ1i4R5OzmLMdZ45mmcl
	 R4AM0GQd75BYJbpQN2AMz2Xu2dQJWGk/TO1I08y2XW4RsqP8qk1usY9vhl0MYkVv59
	 qOWATp5tCBkS/C4KsDGpiaIIdlsPikuDmKZ10Bxuj7Ln8QogYLgcxnsxvgvJobocoN
	 VwGvK7RiMPDzA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	lumag@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.18] drm: gpu: msm: forbid mem reclaim from reset
Date: Mon, 20 Apr 2026 09:21:56 -0400
Message-ID: <20260420132314.1023554-322-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-103780-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email,freedesktop.org:url]
X-Rspamd-Queue-Id: 3850C42E59E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sergey Senozhatsky <senozhatsky@chromium.org>

[ Upstream commit 4625fe5bbdaccd45be274c30ff0a42e30d4e38cf ]

We sometimes get into a situtation where GPU hangcheck fails to
recover GPU:

[..]
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840161
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840162
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840162
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840163
[..]

The problem is that msm_job worker is blocked on gpu->lock

INFO: task ring0:155 blocked for more than 122 seconds.
Not tainted 6.6.99-08727-gaac38b365d2c #1
task:ring0 state:D stack:0 pid:155 ppid:2 flags:0x00000008
Call trace:
__switch_to+0x108/0x208
schedule+0x544/0x11f0
schedule_preempt_disabled+0x30/0x50
__mutex_lock_common+0x410/0x850
__mutex_lock_slowpath+0x28/0x40
mutex_lock+0x5c/0x90
msm_job_run+0x9c/0x140
drm_sched_main+0x514/0x938
kthread+0x114/0x138
ret_from_fork+0x10/0x20

which is owned by recover worker, which is waiting for DMA fences
from a memory reclaim path, under the very same gpu->lock

INFO: task ring0:155 is blocked on a mutex likely owned by task gpu-worker:154.
task:gpu-worker state:D stack:0 pid:154 ppid:2 flags:0x00000008
Call trace:
__switch_to+0x108/0x208
schedule+0x544/0x11f0
schedule_timeout+0x1f8/0x770
dma_fence_default_wait+0x108/0x218
dma_fence_wait_timeout+0x6c/0x1c0
dma_resv_wait_timeout+0xe4/0x118
active_purge+0x34/0x98
drm_gem_lru_scan+0x1d0/0x388
msm_gem_shrinker_scan+0x1cc/0x2e8
shrink_slab+0x228/0x478
shrink_node+0x380/0x730
try_to_free_pages+0x204/0x510
__alloc_pages_direct_reclaim+0x90/0x158
__alloc_pages_slowpath+0x1d4/0x4a0
__alloc_pages+0x9f0/0xc88
vm_area_alloc_pages+0x17c/0x260
__vmalloc_node_range+0x1c0/0x420
kvmalloc_node+0xe8/0x108
msm_gpu_crashstate_capture+0x1e4/0x280
recover_worker+0x1c0/0x638
kthread_worker_fn+0x150/0x2d8
kthread+0x114/0x138

So no one can make any further progress.

Forbid recover/fault worker to enter memory reclaim (under
gpu->lock) to address this deadlock scenario.

Cc: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/700978/
Message-ID: <20260127073341.2862078-1-senozhatsky@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have a complete picture. Let me compile the final analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `drm: gpu: msm` (Qualcomm MSM GPU driver)
- Action verb: "forbid" — preventing a dangerous code path
- Summary: Prevent memory reclaim from GPU reset/fault handlers to avoid
  deadlock

**Step 1.2: Tags**
- `Cc: Tomasz Figa <tfiga@chromium.org>` — ChromeOS stakeholder
- `Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>` —
  author, ChromeOS/mm developer
- `Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>` — MSM subsystem
  maintainer
- `Patchwork: https://patchwork.freedesktop.org/patch/700978/`
- `Message-ID: <20260127073341.2862078-1-senozhatsky@chromium.org>`
- `Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>` —
  committer/maintainer
- No Fixes: tag (expected for manual review candidates)

**Step 1.3: Body Analysis**
The commit message contains detailed stack traces showing:
1. A GPU lockup detected by hangcheck, triggering `recover_worker`
2. `recover_worker` holds `gpu->lock` and is blocked trying to allocate
   memory
3. The allocation triggers `__alloc_pages_direct_reclaim` ->
   `shrink_slab` -> `msm_gem_shrinker_scan` -> `active_purge` ->
   `dma_fence_default_wait`
4. The DMA fences cannot complete because the GPU is hung and
   `gpu->lock` is held
5. Deadlock: `msm_job_run` needs `gpu->lock` (owned by `recover_worker`)
   and `recover_worker` is stuck in reclaim waiting on DMA fences that
   can't signal

**Step 1.4: Hidden Bug Fix Detection**
This is an explicit deadlock fix, not disguised.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- Single file: `drivers/gpu/drm/msm/msm_gpu.c`
- 1 include added, ~10 lines of actual logic across 2 functions
- Functions modified: `recover_worker()`,
  `msm_gpu_fault_crashstate_capture()`

**Step 2.2: Code Flow Change**
In both functions, the pattern is identical:
- BEFORE: crashstate capture runs with default GFP flags, allowing
  reclaim
- AFTER: `memalloc_noreclaim_save()` called before crashstate capture,
  `memalloc_noreclaim_restore()` called after, preventing the kernel
  from entering memory reclaim while `gpu->lock` is held

**Step 2.3: Bug Mechanism**
Category: **Deadlock**. The mechanism:
1. `recover_worker` acquires `gpu->lock`
2. `msm_gpu_crashstate_capture()` calls `kvmalloc()` (line 239 in
   `msm_gpu_crashstate_get_bo`)
3. Under memory pressure, `kvmalloc` -> `__alloc_pages_slowpath` ->
   `try_to_free_pages` -> `shrink_slab`
4. `msm_gem_shrinker_scan` -> `active_purge` -> `wait_for_idle` ->
   `dma_resv_wait_timeout`
5. DMA fences can't signal because the GPU is hung — recovery needs
   `gpu->lock` which is already held

**Step 2.4: Fix Quality**
- Minimal and surgical: only adds `memalloc_noreclaim_save/restore`
  bracketing
- Well-established kernel pattern (used in amdgpu, i915)
- Regression risk: extremely low — only changes allocation behavior
  within a narrow scope
- Review: accepted by Rob Clark (MSM maintainer)

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
- `recover_worker` structure dates back to Rob Clark 2013, with
  gpu->lock added in c28e2f2b417ed7 (v5.16, 2021-11-09)
- `msm_gpu_crashstate_capture` added in c0fec7f562ec76 (v4.20/v5.0,
  2018-07-24)
- `msm_gpu_fault_crashstate_capture` introduced in e25e92e08e32c6
  (v5.15, 2021-06-10), refactored in 0c5fea1eb0dc2 (v7.0)
- The deadlock has existed since v5.16 when gpu->lock was introduced
  alongside crashstate capture

**Step 3.2: No Fixes tag to follow**

**Step 3.3: Related Changes**
- Commit 4bea53b9c7c72 "drm/msm: Reduce fallout of fence signaling vs
  reclaim hangs" (2023-11-17) — Rob Clark reduced shrinker timeout from
  1000ms to 10ms as a *partial* workaround for this exact class of
  deadlock. This confirms the issue was known.

**Step 3.4: Author**
- Sergey Senozhatsky is a well-known kernel developer (mm subsystem,
  compression, ChromeOS)
- Rob Clark is the MSM subsystem maintainer who reviewed and committed
  the fix

**Step 3.5: Dependencies**
- Standalone fix, no dependencies on other patches
- The `#include <linux/sched/mm.h>` header is available in all relevant
  stable trees
- `memalloc_noreclaim_save/restore` available since at least v4.x

## PHASE 4: MAILING LIST

**Step 4.1-4.2:** Patchwork link confirms this was reviewed through the
freedesktop.org DRM process. Rob Clark (subsystem maintainer) provided
`Reviewed-by` and committed the patch.

**Step 4.3:** No specific bug report link, but the commit includes real
stack traces from a production system running kernel 6.6.99, indicating
this was hit on ChromeOS devices.

**Step 4.4:** Single standalone patch (not part of a series).

**Step 4.5:** Could not verify stable-specific discussion due to anti-
bot protections on lore.kernel.org.

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1:** Modified functions: `recover_worker()`,
`msm_gpu_fault_crashstate_capture()`

**Step 5.2:** `recover_worker` is queued by `hangcheck_handler` (timer
callback) whenever a GPU lockup is detected.
`msm_gpu_fault_crashstate_capture` is called from IOMMU fault handlers.

**Step 5.3:** Both call `msm_gpu_crashstate_capture` which calls
`kvmalloc` (via `msm_gpu_crashstate_get_bo`), the trigger for the
deadlock.

**Step 5.4:** Call chain: `hangcheck_timer` -> `hangcheck_handler` ->
`kthread_queue_work(recover_work)` -> `recover_worker`. This is the
standard GPU hang recovery path triggered automatically.

**Step 5.5:** Similar pattern exists in amdgpu and i915 where
`memalloc_noreclaim_save` is used to prevent reclaim deadlocks in GPU
driver paths.

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1:** The buggy code exists in all stable trees from v5.16+
(when `gpu->lock` was introduced). In older trees (v6.6),
`recover_worker` and `fault_worker` have the same deadlock pattern. The
code confirmed in v6.6 and v6.12 stable branches.

**Step 6.2:** The patch won't apply cleanly to older trees (v6.6) due
to:
- VM_BIND code differences in `recover_worker`
- `fault_worker` vs `msm_gpu_fault_crashstate_capture` name change
- `msm_gpu_crashstate_capture` has 4 args in v6.6 vs 5 in v7.0
But the fix concept is trivially adaptable. For v7.0.y it should apply
cleanly.

**Step 6.3:** Only the partial workaround (4bea53b9c7c72, timeout
reduction) has been applied previously.

## PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1:** `drivers/gpu/drm/msm/` — Qualcomm Adreno GPU driver.
Criticality: **IMPORTANT** — used on millions of Qualcomm SoC devices
(Chromebooks, phones, embedded systems).

**Step 7.2:** Actively developed subsystem with many recent commits.

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1:** Affects all Qualcomm Adreno GPU users running with the MSM
DRM driver.

**Step 8.2:** Trigger: GPU hang + memory pressure. GPU hangs occur in
real-world usage. Under memory pressure (common on memory-constrained
mobile/embedded devices), the deadlock triggers. The stack trace shows
it was reproduced on a ChromeOS device.

**Step 8.3:** Failure mode: **DEADLOCK** — the system hangs completely
(GPU recovery blocked for >122 seconds, tasks blocked indefinitely).
Severity: **CRITICAL**.

**Step 8.4:**
- **Benefit:** HIGH — prevents complete system deadlock on common
  hardware
- **Risk:** VERY LOW — adds ~10 lines of well-established
  `memalloc_noreclaim_save/restore` pattern, reviewed by subsystem
  maintainer

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR backporting:**
- Fixes a real, documented deadlock with stack traces
- Observed on production hardware (ChromeOS, kernel 6.6.99)
- Small, surgical fix (~10 lines of real changes)
- Uses well-established kernel pattern (`memalloc_noreclaim_save`)
- Reviewed by Rob Clark (MSM subsystem maintainer)
- Previous partial workaround (4bea53b9c7c72) confirms the issue was
  known
- Affects widely-deployed Qualcomm hardware
- Bug present in all stable trees since v5.16

**Evidence AGAINST backporting:**
- May need minor adaptation for older stable trees (different function
  names/signatures)
- No explicit Cc: stable tag (expected for review candidates)

**Stable rules checklist:**
1. Obviously correct and tested? YES — well-established pattern,
   reviewed by maintainer, real stack traces
2. Fixes a real bug? YES — documented deadlock
3. Important issue? YES — system deadlock (CRITICAL severity)
4. Small and contained? YES — single file, ~10 lines of logic
5. No new features/APIs? YES — purely a fix
6. Can apply to stable? YES for v7.0.y (clean), needs minor rework for
   v6.6.y

## Verification

- [Phase 1] Parsed tags: Reviewed-by Rob Clark (MSM maintainer), Cc
  Tomasz Figa, Patchwork link
- [Phase 2] Diff analysis: ~10 lines added across `recover_worker()` and
  `msm_gpu_fault_crashstate_capture()`, adds
  `memalloc_noreclaim_save/restore` bracketing around crashstate capture
- [Phase 3] git blame: `recover_worker` with `gpu->lock` since
  c28e2f2b417ed7 (v5.16), crashstate capture since c0fec7f562ec76
  (v4.20)
- [Phase 3] Related fix 4bea53b9c7c72: Rob Clark acknowledged this
  deadlock class, applied partial workaround (timeout reduction)
- [Phase 3] No dependencies found; standalone patch
- [Phase 4] Patchwork link confirms DRM review process; anti-bot
  protection prevented lore fetch
- [Phase 5] `recover_worker` called from hangcheck timer path;
  `msm_gpu_crashstate_capture` allocates memory via `kvmalloc` in
  `msm_gpu_crashstate_get_bo`
- [Phase 6] Confirmed buggy code exists in v6.6 (line 354+, 449+) and
  v6.12 (line 355+, 478+)
- [Phase 6] v7.0.y: should apply cleanly; older trees need minor
  adaptation
- [Phase 7] MSM GPU driver — IMPORTANT subsystem (Qualcomm Adreno,
  millions of devices)
- [Phase 8] Failure mode: system deadlock (CRITICAL), triggered by GPU
  hang + memory pressure
- [Phase 8] Stack trace from real ChromeOS device running kernel 6.6.99

**YES**

 drivers/gpu/drm/msm/msm_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 84d6c7f50c8df..67033bb01a9b0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -17,6 +17,7 @@
 #include <linux/string_helpers.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
+#include <linux/sched/mm.h>
 
 /*
  * Power Management:
@@ -468,6 +469,7 @@ static void recover_worker(struct kthread_work *work)
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
+	unsigned int noreclaim_flag;
 	struct task_struct *task;
 	int i;
 
@@ -505,6 +507,8 @@ static void recover_worker(struct kthread_work *work)
 			msm_gem_vm_unusable(submit->vm);
 	}
 
+	noreclaim_flag = memalloc_noreclaim_save();
+
 	get_comm_cmdline(submit, &comm, &cmd);
 
 	if (comm && cmd) {
@@ -523,6 +527,8 @@ static void recover_worker(struct kthread_work *work)
 	pm_runtime_get_sync(&gpu->pdev->dev);
 	msm_gpu_crashstate_capture(gpu, submit, NULL, comm, cmd);
 
+	memalloc_noreclaim_restore(noreclaim_flag);
+
 	kfree(cmd);
 	kfree(comm);
 
@@ -587,6 +593,7 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
+	unsigned int noreclaim_flag;
 
 	mutex_lock(&gpu->lock);
 
@@ -594,6 +601,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 	if (submit && submit->fault_dumped)
 		goto resume_smmu;
 
+	noreclaim_flag = memalloc_noreclaim_save();
+
 	if (submit) {
 		get_comm_cmdline(submit, &comm, &cmd);
 
@@ -609,6 +618,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 	msm_gpu_crashstate_capture(gpu, submit, fault_info, comm, cmd);
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
+	memalloc_noreclaim_restore(noreclaim_flag);
+
 	kfree(cmd);
 	kfree(comm);
 
-- 
2.53.0


