Return-Path: <linux-arm-msm+bounces-30359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 804559676EC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 15:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2F7E1C20FBE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 13:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B231A149E00;
	Sun,  1 Sep 2024 13:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hk2KR2z2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C0317CA1B;
	Sun,  1 Sep 2024 13:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725199174; cv=none; b=KJoQyeY/SKtIgrLPQLAk8DTJaEhU53p9hlb/7re4znOvo46JudXj2ewHVmsQGntrt69xryaG3PU/QwEHFrD7w6RBLsMCEDKed3AYeRtpN/BVdK1ixgn2htNHtnbtlaV9gb1MmR9f2lG+RujoKKNRSVfaw9akZV6KiNHUElBPjqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725199174; c=relaxed/simple;
	bh=ppuXfwFLkVoCcl1RlKr5sWejOfYJd+xSscE5E5DdCl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9hpnCR2O173/x5eLE+x+e79RisQXBOlCR4vSTi/LqO3U8r2zDSQFm/GTHViPVaLpnMt++Cfl1ZLX8twHvR50rPR6+OaOs88NvQ4zOgcdH2KETZ5pzX7fE4S3EvZK6Ky5dCo1mzHVvroIcyFBaZ77Zae/QGnl/LX8np2j1njRF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hk2KR2z2; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c24c92f699so891221a12.2;
        Sun, 01 Sep 2024 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725199171; x=1725803971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8JB0+Bs8ErmsZEQvGhO4vH+N+VrdVzHLUwxPZWQG6E=;
        b=Hk2KR2z2EiqWskXbupr+j7wXLUp/kMXKEb8NSUafwz1jdg70MCQRSrBXMIvziWy4f8
         rY40EIeXNYi1c8iHnnR0gEMQ+D6Zs/mUWE4zWt8eTeg0hj6IwBG5IlaEw00fLSzKSXRY
         LOfkaxzgeBaoab8bOSpJnqgPaHQqfG695wOInzRZOPVIKkuVs0WObF7RGeZCQBQgob1w
         +3nXpAi76I82kZzs9pwqjS3a05Zij6Zl+uA33teaWv0VRaYGosPKRraxHSiZHQKwXT82
         Xo8ZwVAXXA0ec/nAs8rUkxhG/kkYCXPc76ZLPvBAUAmoWYmGjZRQYo6pMThzlG7KEeSc
         yJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725199171; x=1725803971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8JB0+Bs8ErmsZEQvGhO4vH+N+VrdVzHLUwxPZWQG6E=;
        b=K5D4t+fe3tz527qJ+9FyA7p35qHmvkda9sZAhIbIvfCIXr0cdqxp1lNWvj0W8HwqYI
         DtbOVDZqnBpqqQjqnTnxMXYol+X3SC6kctZa09/dZ8HQrpTG7QMiXhQ8I6i7ISBShjGm
         eV/xb1JdBzQ6sdxDmt5NS8+Qc8I6OYpFvOH8NHt/JypLAL8XQtJnrmZm9pUX+PUvtTQ0
         4aaW4HisjYB0s8Pwu0tPH00PPwAX94qt85ptU2h/gfRWZAbSksJV4k1bf8MKPoS5R9NC
         NWZjW0rWsyqeGdsT+qSCrmCvnwS5oBKwodZTBIfbivwiMEVyprq3iVmfqqdM8THMsA9c
         yUkg==
X-Forwarded-Encrypted: i=1; AJvYcCU34jrfOAfuG67m6oEw9VcrtZHDKuHxN6+uTx+TUqaFcjyucgi3W8ny2Lm428SB2y14lcat9TBLGUz5zpaw@vger.kernel.org, AJvYcCXyX/v/xLIQTmKUollmzgapvqM35l6MyPknV9NSU4lOZ+W3zBX1GbvSKVQLMSOv+uxvazJDJL4fxx048XDZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzGgQl/jjM5L6QzveFaAwOtgvwKnHwFB7IDCwwNlrN/JinUvtmR
	bv04RlyPIzYY7NZsZvBPRTGIvCM58U2mArZkOWx34Kp50VNz8nhn
X-Google-Smtp-Source: AGHT+IGJ7S2u5swfQvFXUIz2GMCV89hMMGXtojuyCo4a1PrgHeRFYoBgj84CD4toi9BdIGtUsaJ9yA==
X-Received: by 2002:a05:6402:1d48:b0:5b8:34a9:7fd9 with SMTP id 4fb4d7f45d1cf-5c21ed86b5amr8442101a12.27.1725199170609;
        Sun, 01 Sep 2024 06:59:30 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp. [219.100.37.233])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ccff17sm4051295a12.73.2024.09.01.06.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 06:59:30 -0700 (PDT)
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
Subject: [PATCH v2 4/4] drm/msm/a5xx: workaround early ring-buffer emptiness check
Date: Sun,  1 Sep 2024 13:54:03 +0000
Message-ID: <20240901135419.1075412-5-vladimir.lypak@gmail.com>
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

There is another cause for soft lock-up of GPU in empty ring-buffer:
race between GPU executing last commands and CPU checking ring for
emptiness. On GPU side IRQ for retire is triggered by CACHE_FLUSH_TS
event and RPTR shadow (which is used to check ring emptiness) is updated
a bit later from CP_CONTEXT_SWITCH_YIELD. Thus if GPU is executing its
last commands slow enough or we check that ring too fast we will miss a
chance to trigger switch to lower priority ring because current ring isn't
empty just yet. This can escalate to lock-up situation described in
previous patch.
To work-around this issue we keep track of last submit sequence number
for each ring and compare it with one written to memptrs from GPU during
execution of CACHE_FLUSH_TS event.

Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 4 ++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 1 +
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 6c80d3003966..7cfefb5e6221 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -65,6 +65,8 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = submit->ring;
 	struct drm_gem_object *obj;
 	uint32_t *ptr, dwords;
@@ -109,6 +111,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 		}
 	}
 
+	a5xx_gpu->last_seqno[ring->id] = submit->seqno;
 	a5xx_flush(gpu, ring, true);
 	a5xx_preempt_trigger(gpu);
 
@@ -210,6 +213,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	/* Write the fence to the scratch register */
 	OUT_PKT4(ring, REG_A5XX_CP_SCRATCH_REG(2), 1);
 	OUT_RING(ring, submit->seqno);
+	a5xx_gpu->last_seqno[ring->id] = submit->seqno;
 
 	/*
 	 * Execute a CACHE_FLUSH_TS event. This will ensure that the
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index b4d06ca3e499..9c0d701fe4b8 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -34,6 +34,7 @@ struct a5xx_gpu {
 	struct drm_gem_object *preempt_counters_bo[MSM_GPU_MAX_RINGS];
 	struct a5xx_preempt_record *preempt[MSM_GPU_MAX_RINGS];
 	uint64_t preempt_iova[MSM_GPU_MAX_RINGS];
+	uint32_t last_seqno[MSM_GPU_MAX_RINGS];
 
 	atomic_t preempt_state;
 	spinlock_t preempt_start_lock;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index c65b34a4a8cc..0469fea55010 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -55,6 +55,8 @@ static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 /* Return the highest priority ringbuffer with something in it */
 static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	unsigned long flags;
 	int i;
 
@@ -64,6 +66,8 @@ static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
 
 		spin_lock_irqsave(&ring->preempt_lock, flags);
 		empty = (get_wptr(ring) == gpu->funcs->get_rptr(gpu, ring));
+		if (!empty && ring == a5xx_gpu->cur_ring)
+			empty = ring->memptrs->fence == a5xx_gpu->last_seqno[i];
 		spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 		if (!empty)
-- 
2.46.0


