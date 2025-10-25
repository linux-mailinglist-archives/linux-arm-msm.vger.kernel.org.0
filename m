Return-Path: <linux-arm-msm+bounces-78784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 790ABC0963B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 18:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6EE024F1FB9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 16:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407102571A5;
	Sat, 25 Oct 2025 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ej+8x8/Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F6724DCE3;
	Sat, 25 Oct 2025 16:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761408915; cv=none; b=ahGXPoBz4XZydou/aFhp5FVGVzep2q5KFbAul87Aoa63cVUykW0onM/M943hozjH4Yx8IjGKPGh/dpCIUpaR2gGoM4QIJj9anH450r+LrO80RpKNY6w3GuG9vO6mj0BMJ4iJO0SpTpkGroEEBWdejUaZLcEnIuY5nr2z5LCfcV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761408915; c=relaxed/simple;
	bh=78ERbFKaeO0h6PkzV58N49XWB06R/jyEXp38t/OS7tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e7ub4rrJM1orV0PLRDvjCIlwE5E/P1It38tsgtOXsgiz+lOy7iN8FvfkP9VE1r1jWfAGPCasbHHV45QF6X0zl48IO2Y1/TjrYPUwnhwwcjc9z7EPigP+afitYTGfTWzzP7YfFthPiAxJoDX8RbpdtR5g/qUOqRGzkePuDRiqYVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ej+8x8/Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE70C4CEFB;
	Sat, 25 Oct 2025 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408913;
	bh=78ERbFKaeO0h6PkzV58N49XWB06R/jyEXp38t/OS7tw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ej+8x8/Y8+G0SLKDGSSSod+6qKvBWEOz3JNDqH/DIsM4OPnegVAE8PHpdjv1gHESJ
	 XFdIRfHD1qXBAn9fG/rcwE0awD57lxGNYWmmJmiPfJVaDLdJCp41WGWR7cJYqbu1fj
	 w766HjEXF9kPUJkK5U9Iy2Zx0HWkHpwcf7yKdlhFjKADX5KBgCw01ekXx5bugyRI2A
	 vLsm89iBpFzSze7iW9+D4iybCD3BYQfdC/ALTG573AS8A4/GgZxMr79nBETN+HI8Lw
	 mVpdX8GPgueKWyedKOkhEbRumitCPGSgMzM/IlUXYIh6Rn2ylBkLOhxdOMFggOneeX
	 vTWaUJnz5EfCg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Antonino Maniscalco <antomani103@gmail.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17-5.15] drm/msm: make sure to not queue up recovery more than once
Date: Sat, 25 Oct 2025 11:55:58 -0400
Message-ID: <20251025160905.3857885-127-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Antonino Maniscalco <antomani103@gmail.com>

[ Upstream commit 10fb1b2fcaee5545a5e54db1ed4d7b15c2db50c8 ]

If two fault IRQs arrive in short succession recovery work will be
queued up twice.

When recovery runs a second time it may end up killing an unrelated
context.

Prevent this by masking off interrupts when triggering recovery.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/670023/
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes: Two fault IRQs arriving back-to-back can queue
  `recover_work` twice; the second recovery may kill an unrelated
  context. The change masks interrupts before queuing recovery so
  subsequent fault IRQs don’t re-queue recovery.
- Core change: In `drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1821-1824`,
  `a6xx_fault_detect_irq()` adds:
  - `gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);` to mask all RBBM
    interrupts before `kthread_queue_work(gpu->worker,
    &gpu->recover_work);`
  - This follows the hangcheck timer being disabled, ensuring no further
    spurious recovery triggers while the first recovery proceeds.
- Call path impact: `a6xx_irq()` invokes `a6xx_fault_detect_irq()` on
  hang detect (`drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1891-1900`). With
  the new mask, subsequent IRQs won’t retrigger recovery for the same
  incident.
- Interrupts are safely restored: During recovery, the GPU is
  reinitialized and interrupts are re-enabled in `a6xx_hw_init()` via
  `REG_A6XX_RBBM_INT_0_MASK` (sets `A6XX_INT_MASK`/`A7XX_INT_MASK`) at
  `drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1410-1413`. `a6xx_recover()`
  calls `msm_gpu_hw_init(gpu)` to perform this re-init
  (`drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1614`). Additionally, the top-
  level wrapper brackets `hw_init` with `disable_irq/enable_irq`
  (`drivers/gpu/drm/msm/msm_gpu.c:168-174`), so the flow cleanly unmasks
  after reset.
- Consistency with existing patterns: A similar mask-on-fault pattern
  already exists for a7xx SW fuse violations
  (`drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1831-1834`), indicating this
  is the established approach to prevent repeated fault handling.
- Stable suitability:
  - User-visible bugfix: Prevents erroneous second recovery that can
    kill unrelated contexts.
  - Small and contained: One register write in an error path; no ABI or
    feature changes.
  - Low regression risk: Interrupts are restored during the normal
    recovery/reinit path; only affects a6xx hang/fault handling.
  - No architectural churn, limited to DRM/MSM Adreno a6xx driver.

Conclusion: This is a minimal, targeted fix for a real correctness issue
with low risk and clear recovery restore points, making it a good
candidate for backporting to all supported stable kernels that include
the a6xx driver.

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 45dd5fd1c2bfc..f8992a68df7fb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1727,6 +1727,9 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	/* Turn off the hangcheck timer to keep it from bothering us */
 	timer_delete(&gpu->hangcheck_timer);
 
+	/* Turn off interrupts to avoid triggering recovery again */
+	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);
+
 	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 
-- 
2.51.0


