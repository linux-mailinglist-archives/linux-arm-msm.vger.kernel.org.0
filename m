Return-Path: <linux-arm-msm+bounces-25944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A72392E419
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 12:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51E5C28775C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A4A158878;
	Thu, 11 Jul 2024 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYaPD2cC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6389A15884B;
	Thu, 11 Jul 2024 10:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720692199; cv=none; b=LC2ikl3CdBlb9JSAlZaVAt2KopgjyriD+dFnxz8wxN1u/tDtACXvRyQP8/hPSMqHwDC+jli/1QiX+5ize01g/pl1Z29l1T1cZ/onCznHIkH0Bi4gdQBMfssvdYyxNdqzegJ8Qso7V1riCPrMfVN3VcEX5jAcmLZTGOpG5C36BYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720692199; c=relaxed/simple;
	bh=xSDCg448wetV5AvZ9r5Wr5Td1FBmZTozFCx4NRKrJ9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQqLYZaO2m4VkqfyBcyAILzuhFIRyLK8nR+ffCevJXbtjVKAdtPl+u5YgyNdIRO2bFKpbLlJ18SJo4uSBUvPrZ5teefbmoa4wmpGKtEkkCnTKn5HBIZZCzPSZZWJ0MPOpEVZNtr83NqhJn1GzLk8Qnnvu9pDiTi8X9m4JZPSbdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYaPD2cC; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ee77db6f97so11050751fa.2;
        Thu, 11 Jul 2024 03:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720692195; x=1721296995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpDedd6FGX+sxnS7G9+Mxa2s/rVU6BfMCskO3N0uDSI=;
        b=UYaPD2cClqOED8WP4999mXii+2bMi0qMKWhk9bZRuWXC93t5r9i42ppDGnH031pdUL
         +XkWPq+QNPgbmsVddU5EcIPWW+EztKcAReOomn0Gp2p5H5GvnuSDs9ddDh7xoFbXwdWk
         3hbRwOjrwOmBxjsXZhRFR4IZbIm4byBf4m0QytU+mctOzWX0AhZW4vgqjtameTtLyVgG
         NIvyp+xBUC5MscH02CEFYdHsBqMS4IwwAPel2x0y536t+5i/Y7EbCnmTvITy7MQ0+qWH
         Iq1qB8idorJNftz8FG6nbjwFURbVKzzJDmlTsiDY3Zf0oSHJZfShu0Rwf0s2m2YrjeU9
         JzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720692195; x=1721296995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpDedd6FGX+sxnS7G9+Mxa2s/rVU6BfMCskO3N0uDSI=;
        b=OMxEhAxRw2KMSzm2YfEzqjRlkmhRoBxTtgMFeLX7C3zhSJPBu1bHFdngawf9Uw4lYk
         OMv7PffVbb3AW0A7+uaJducvI5KHBhvA0EG3AqnFh80GVpQx3MJkpIE0bQ4d0QIgo7sx
         Aan622a+URMGHTVKzCwgHWeu0Mi3eyclkqurBHk661HH6XpCXGxnFiEg8PDqQpil573a
         QpV4n/FN9bpSY3BfobNVeWc+Iqc82k1jjSDrXA1MKw9pjXQQg3aJRbBq9UmCGds+8ske
         8LcmE+zV6jMye3YRKkO0LUsuUvb3X7wGZTmpB2hUXnHj1Ig7ZkqKHuxDvq984xtKT8Ud
         GZzA==
X-Forwarded-Encrypted: i=1; AJvYcCWAzJMVdjIQ9K8ng+hj+iotlZ8CA8MUsmGrrHwPqjnYmy4GYVvAGHLS6iPTHr1pUopgXGeJwDNDqTIy7D7lnXIRlN5fChmOTDDIY05Jtlc8Mo/bOeNdrz7e4xUEstZehddzmFjjZg0nabH07Q==
X-Gm-Message-State: AOJu0Yy9pD7cbhKa1pOSMd015akcNn9+YZX4/t7yWUmXWi7Xp5DdOMtk
	ui94YqfjxRBmAgcQCdgcwMVAyPMVt4f9cCSogXMJly6tlErEaDns
X-Google-Smtp-Source: AGHT+IF+kagTgZb7DqrII/Qk3hyi7AMAFxbVeLFxW2dkrUO2yG/P59umyNCJLiRJCSUtvid+bzrC6A==
X-Received: by 2002:a2e:a36c:0:b0:2ec:51b5:27be with SMTP id 38308e7fff4ca-2eeb30e3c73mr59200321fa.12.1720692195273;
        Thu, 11 Jul 2024 03:03:15 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp. [219.100.37.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc876sm239207666b.5.2024.07.11.03.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 03:03:14 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm/msm/a5xx: fix races in preemption evaluation stage
Date: Thu, 11 Jul 2024 10:00:20 +0000
Message-ID: <20240711100038.268803-4-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711100038.268803-1-vladimir.lypak@gmail.com>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On A5XX GPUs when preemption is used it's invietable to enter a soft
lock-up state in which GPU is stuck at empty ring-buffer doing nothing.
This appears as full UI lockup and not detected as GPU hang (because
it's not). This happens due to not triggering preemption when it was
needed. Sometimes this state can be recovered by some new submit but
generally it won't happen because applications are waiting for old
submits to retire.

One of the reasons why this happens is a race between a5xx_submit and
a5xx_preempt_trigger called from IRQ during submit retire. Former thread
updates ring->cur of previously empty and not current ring right after
latter checks it for emptiness. Then both threads can just exit because
for first one preempt_state wasn't NONE yet and for second one all rings
appeared to be empty.

To prevent such situations from happening we need to establish guarantee
for preempt_trigger to be called after each submit. To implement it this
patch adds trigger call at the end of a5xx_preempt_irq to re-check if we
should switch to non-empty or higher priority ring. Also we find next
ring in new preemption state "EVALUATE". If the thread that updated some
ring with new submit sees this state it should wait until it passes.

Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  6 +++---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 11 +++++++----
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 24 +++++++++++++++++++----
 3 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 6c80d3003966..266744ee1d5f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -110,7 +110,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 	}
 
 	a5xx_flush(gpu, ring, true);
-	a5xx_preempt_trigger(gpu);
+	a5xx_preempt_trigger(gpu, true);
 
 	/* we might not necessarily have a cmd from userspace to
 	 * trigger an event to know that submit has completed, so
@@ -240,7 +240,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	a5xx_flush(gpu, ring, false);
 
 	/* Check to see if we need to start preemption */
-	a5xx_preempt_trigger(gpu);
+	a5xx_preempt_trigger(gpu, true);
 }
 
 static const struct adreno_five_hwcg_regs {
@@ -1296,7 +1296,7 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
 		a5xx_gpmu_err_irq(gpu);
 
 	if (status & A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
-		a5xx_preempt_trigger(gpu);
+		a5xx_preempt_trigger(gpu, false);
 		msm_gpu_retire(gpu);
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index c7187bcc5e90..1120824853d4 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -57,10 +57,12 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor);
  * through the process.
  *
  * PREEMPT_NONE - no preemption in progress.  Next state START.
- * PREEMPT_START - The trigger is evaulating if preemption is possible. Next
- * states: TRIGGERED, NONE
+ * PREEMPT_EVALUATE - The trigger is evaulating if preemption is possible. Next
+ * states: START, ABORT
  * PREEMPT_ABORT - An intermediate state before moving back to NONE. Next
  * state: NONE.
+ * PREEMPT_START - The trigger is preparing for preemption. Next state:
+ * TRIGGERED
  * PREEMPT_TRIGGERED: A preemption has been executed on the hardware. Next
  * states: FAULTED, PENDING
  * PREEMPT_FAULTED: A preemption timed out (never completed). This will trigger
@@ -71,8 +73,9 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor);
 
 enum preempt_state {
 	PREEMPT_NONE = 0,
-	PREEMPT_START,
+	PREEMPT_EVALUATE,
 	PREEMPT_ABORT,
+	PREEMPT_START,
 	PREEMPT_TRIGGERED,
 	PREEMPT_FAULTED,
 	PREEMPT_PENDING,
@@ -156,7 +159,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state);
 
 void a5xx_preempt_init(struct msm_gpu *gpu);
 void a5xx_preempt_hw_init(struct msm_gpu *gpu);
-void a5xx_preempt_trigger(struct msm_gpu *gpu);
+void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit);
 void a5xx_preempt_irq(struct msm_gpu *gpu);
 void a5xx_preempt_fini(struct msm_gpu *gpu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 67a8ef4adf6b..f8d09a83c5ae 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -87,21 +87,33 @@ static void a5xx_preempt_timer(struct timer_list *t)
 }
 
 /* Try to trigger a preemption switch */
-void a5xx_preempt_trigger(struct msm_gpu *gpu)
+void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	unsigned long flags;
 	struct msm_ringbuffer *ring;
+	enum preempt_state state;
 
 	if (gpu->nr_rings == 1)
 		return;
 
 	/*
-	 * Try to start preemption by moving from NONE to START. If
-	 * unsuccessful, a preemption is already in flight
+	 * Try to start preemption by moving from NONE to EVALUATE. If current
+	 * state is EVALUATE/ABORT we can't just quit because then we can't
+	 * guarantee that preempt_trigger will be called after ring is updated
+	 * by new submit.
 	 */
-	if (!try_preempt_state(a5xx_gpu, PREEMPT_NONE, PREEMPT_START))
+	state = atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMPT_NONE,
+			       PREEMPT_EVALUATE);
+	while (new_submit && (state == PREEMPT_EVALUATE ||
+			      state == PREEMPT_ABORT)) {
+		cpu_relax();
+		state = atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMPT_NONE,
+				       PREEMPT_EVALUATE);
+	}
+
+	if (state != PREEMPT_NONE)
 		return;
 
 	/* Get the next ring to preempt to */
@@ -130,6 +142,8 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
 		return;
 	}
 
+	set_preempt_state(a5xx_gpu, PREEMPT_START);
+
 	/* Make sure the wptr doesn't update while we're in motion */
 	spin_lock_irqsave(&ring->preempt_lock, flags);
 	a5xx_gpu->preempt[ring->id]->wptr = get_wptr(ring);
@@ -188,6 +202,8 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
 	update_wptr(gpu, a5xx_gpu->cur_ring);
 
 	set_preempt_state(a5xx_gpu, PREEMPT_NONE);
+
+	a5xx_preempt_trigger(gpu, false);
 }
 
 void a5xx_preempt_hw_init(struct msm_gpu *gpu)
-- 
2.45.2


