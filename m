Return-Path: <linux-arm-msm+bounces-30358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C28789676E8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 15:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6B151C20DB0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 13:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1E617E00F;
	Sun,  1 Sep 2024 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOIaHIyO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7B017DFE4;
	Sun,  1 Sep 2024 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725199158; cv=none; b=d5dYs8CXJeKqY6TVjeXS6Ukw20HwgCT43ZybOSi3oFvYbij75Zh8WTcRzlRhXTRWraZAOLNyQJjg/Ft4AbVdbbdVT5KQwhSseHKrVmWiqh0RPXcL5wKMVdZ6OyvTa7F0Q/+Dls2MF3EMBRLthDww92ZD5jXY2IAd+KWHvFpbkrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725199158; c=relaxed/simple;
	bh=eyhl/34IFIo+EgeNhe/OGrVE6CHvdGyi0/Ejw77Ja98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hf+4x3IMWmXyZouzVtlv6Hn/21pZrUpIPFJ13AXWHQW8ugBeI5thG2rnB3T/cD3EGTwUk0UL0iwbhMG45XlTFV6nZ/JxIUoKSJY24dpeozrxCW254n3aeGRq7rVGyj43OE2e3kZP808lfsJK+58N02Zqo9HDT41qAd7OlmBRUgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOIaHIyO; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f50966c478so34825861fa.1;
        Sun, 01 Sep 2024 06:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725199155; x=1725803955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T92lHW8RUNhDHAQvibb0adZUC3Zfr3PwSsvkl+HJFgA=;
        b=WOIaHIyOeSPrPEnl4wd4mBygIr4FQH5hVgDtehRg9/T/sEolSnScuK7vBtUoSPibXI
         +xp8E/hzt0U1qrRw+A9q/iD9xTZxpFE/87XfYwehayDrHtK1Hzp4WEGgaqGMMRLEgWys
         gFypWz/a8syJCH1zYvrG5HLx6tsmHe+DpooQ/h9x/E6eDfZAy62YoRXEQEGeNR30ebn6
         Bwc+olSeYumVnKB1e0AplJMARV/+VadPxmP8STmtnM2pWl13CyRNsGBB6MRbi9AIeaw3
         Vi7j6lMs8L9ETVI/iz9tMbdDQmI+HkRotG1Xb5sBQtkuXhq99AfY3k+LLBi+HJjjnpkV
         7CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725199155; x=1725803955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T92lHW8RUNhDHAQvibb0adZUC3Zfr3PwSsvkl+HJFgA=;
        b=ITMOLybdyVSA/9XXZdOS1e6dPSeSRjSyO3uR3i5PfW/vdNMEyoKrEVdxUt5eVoqQCE
         4MtwcmEtEhMGPsG+8zXFUX+6GCxNxouvCUryoPppzVDAIKRXqzYuEpcDnC6uGm0gGpG+
         30bzZUIZ9m23fBfQOPT1G+kEDYV6z+8T0z0pYf53nULKl+nqP62DT/4Ax8tljfLD5yUE
         s4Ag/kM9VwcKKYyVyy+GGE0oJ83MELjCKqudZ3FCqW9vkeF5rRzAPM0w7R3y1JJHHLiZ
         WQAnN1NE6f+n/z8hLIUPF8lY+mTmRQwRejJQ5vzCwDZO10IwxydBCl7mJinhLuKh1ci7
         OlyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIc8dg7la5sLWHo5cJq6NfQ0l176g+4vKlZE9WlFa36n25eZS66ZgeYKu6e3PALWgxIgI0IpSM5nCYVJhP@vger.kernel.org, AJvYcCVzuHX/ALXUDNWRQ5UxcclVdgG+A/RlezrLKYjeijsjwvBLhouXxZ8mL+0fjSU+SdLwmj97/DWh44gmdxwY@vger.kernel.org
X-Gm-Message-State: AOJu0YwZkpJYzPS3gcaeK3K6sk1dgpz2AKj1uf0pviSOqAuD7xQKq+UY
	oH/4HaIaeNAOuXofXJcLhWYplabi2TgXwTp0KcJfjdM3eLKNj4PT
X-Google-Smtp-Source: AGHT+IFwUQ0fX0i6XjltYeo1Dom59dNY1fFMpQnob6UlvVpTnE3Q+SJIj64awZOB1p5Wn1LEwZqoVA==
X-Received: by 2002:a05:651c:198c:b0:2f3:d560:ed9f with SMTP id 38308e7fff4ca-2f61e025823mr55094181fa.5.1725199153752;
        Sun, 01 Sep 2024 06:59:13 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp. [219.100.37.233])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ccff17sm4051295a12.73.2024.09.01.06.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 06:59:13 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
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
Subject: [PATCH v2 3/4] drm/msm/a5xx: fix races in preemption evaluation stage
Date: Sun,  1 Sep 2024 13:54:02 +0000
Message-ID: <20240901135419.1075412-4-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
References: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
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
for preempt_trigger to make decision after each submit or retire. To
implement this we serialize preemption initiation using spinlock. If
switch is already in progress we need to re-trigger preemption when it
finishes.

Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 24 +++++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index c7187bcc5e90..b4d06ca3e499 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -36,6 +36,7 @@ struct a5xx_gpu {
 	uint64_t preempt_iova[MSM_GPU_MAX_RINGS];
 
 	atomic_t preempt_state;
+	spinlock_t preempt_start_lock;
 	struct timer_list preempt_timer;
 
 	struct drm_gem_object *shadow_bo;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 67a8ef4adf6b..c65b34a4a8cc 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -97,12 +97,19 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
 	if (gpu->nr_rings == 1)
 		return;
 
+	/*
+	 * Serialize preemption start to ensure that we always make
+	 * decision on latest state. Otherwise we can get stuck in
+	 * lower priority or empty ring.
+	 */
+	spin_lock_irqsave(&a5xx_gpu->preempt_start_lock, flags);
+
 	/*
 	 * Try to start preemption by moving from NONE to START. If
 	 * unsuccessful, a preemption is already in flight
 	 */
 	if (!try_preempt_state(a5xx_gpu, PREEMPT_NONE, PREEMPT_START))
-		return;
+		goto out;
 
 	/* Get the next ring to preempt to */
 	ring = get_next_ring(gpu);
@@ -127,9 +134,11 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
 		set_preempt_state(a5xx_gpu, PREEMPT_ABORT);
 		update_wptr(gpu, a5xx_gpu->cur_ring);
 		set_preempt_state(a5xx_gpu, PREEMPT_NONE);
-		return;
+		goto out;
 	}
 
+	spin_unlock_irqrestore(&a5xx_gpu->preempt_start_lock, flags);
+
 	/* Make sure the wptr doesn't update while we're in motion */
 	spin_lock_irqsave(&ring->preempt_lock, flags);
 	a5xx_gpu->preempt[ring->id]->wptr = get_wptr(ring);
@@ -152,6 +161,10 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
 
 	/* And actually start the preemption */
 	gpu_write(gpu, REG_A5XX_CP_CONTEXT_SWITCH_CNTL, 1);
+	return;
+
+out:
+	spin_unlock_irqrestore(&a5xx_gpu->preempt_start_lock, flags);
 }
 
 void a5xx_preempt_irq(struct msm_gpu *gpu)
@@ -188,6 +201,12 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
 	update_wptr(gpu, a5xx_gpu->cur_ring);
 
 	set_preempt_state(a5xx_gpu, PREEMPT_NONE);
+
+	/*
+	 * Try to trigger preemption again in case there was a submit or
+	 * retire during ring switch
+	 */
+	a5xx_preempt_trigger(gpu);
 }
 
 void a5xx_preempt_hw_init(struct msm_gpu *gpu)
@@ -300,5 +319,6 @@ void a5xx_preempt_init(struct msm_gpu *gpu)
 		}
 	}
 
+	spin_lock_init(&a5xx_gpu->preempt_start_lock);
 	timer_setup(&a5xx_gpu->preempt_timer, a5xx_preempt_timer, 0);
 }
-- 
2.46.0


