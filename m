Return-Path: <linux-arm-msm+bounces-31909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BE397AF79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 13:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BDC31C22016
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 11:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8481117B4E9;
	Tue, 17 Sep 2024 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fa4fZ24V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95076166F17;
	Tue, 17 Sep 2024 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726571670; cv=none; b=IVOHhEdO/isGOLbiF0Pi8QwYPuxnhz8TQvlpzmjOW8v/PbQaHSsBzmlqe2Kqt+lJfAwK2UfunYWuqthG+a9hicfx/2JhtLwqBgGBK9sCM1uDAy9HzmTKD/18tssCt9y2GGow58xA/nYyZDJdxa1J7EzG8qZzKnKf28DBOeLwjBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726571670; c=relaxed/simple;
	bh=dALUGbIXltkDW8VJ2GXSaW/3galrSPppuMOcBUWf6zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AP/UTxjyvbtqF2HKuY5vurlSVWa/xj1WN/L7TiwSghYdq8FeG7gXlA6GhzI0IkFmnr5RsZ2MJdyXh9xqXsIqiTAdaWH8hr2dZC3fWPzomCG3hBpzGKq0s94uKUQjeA3TjdPqksDIhJFrnxNaCGYhazlRyOCGh6UBQyEPBDfkZmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fa4fZ24V; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d64b27c45so694112966b.3;
        Tue, 17 Sep 2024 04:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726571667; x=1727176467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEXY4j2/7G4CDltDEoA/ndTvMjCET+HbDkG7aLbSQrs=;
        b=Fa4fZ24VanxjbdHAZXikWIb1YPl4Y/aZRFR/CN7JT9DSvMkPdMu0ZJ04LUfTTbz3Wa
         mCXJeun1ornY5QWNn6wQ8+Wf3EA7iVZytsd9DNlzmxV8ELg12RsCtCofHNWwJolAsBuD
         YLJF8+MYjaLIC0g7oSjoOVZNDJzq+CJAgENlAPb/1VBnT/1rNHT56r8Z5a4tj1k89zf/
         nAhUHEKYD27lf+E6S52ejZnAw3HNpLCHXJKU19VwjpQGO/TW6BoKC7cu19EUj2YrMrs8
         UdCy+p2AGLnsdu1Ryh5a/OpQyT6zdQgCyxIXQbIKslSYFyPsqMMIKRiwAc2/Ku1yAz/R
         Bk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726571667; x=1727176467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEXY4j2/7G4CDltDEoA/ndTvMjCET+HbDkG7aLbSQrs=;
        b=OcvPtNz8yaqz2s86/eSTnKBtr5Dc93CJcraZs0anp2WjPPfgkcQD3cJ727T8FgRWXj
         pbUTb54/lYAgaeWjxhBhK1gD8AFLbKgJdJmwuu9IaINQOMefIWK92csrLhN3Ov8MioNe
         4fOrUxSTCJ6vLfF8KQQpBYA5VMM9dUhD58orpBagCZ7zZm4OrH/XgBG1mJMJAUe7aHJo
         o3mA4PsZ+11j57HGAhTMgpxN93uIyK6irDqTJIrnHsVQY4DOvoQbvnoT3z2Wo1HA3VCW
         3ejRmz6N61IKvGV8h3TLZmlicale2KnT0knbfaFCcWWIInQONEsQk5i8tREyHxAuzTZK
         omgA==
X-Forwarded-Encrypted: i=1; AJvYcCUCAgzoAdEqGKQa55dtZt2p5wjdxUcVWFuKxU2Cs0FJA+6EqlX73DURtOzV6tkrvLW2yC4aSS4xEyKw95EQ@vger.kernel.org, AJvYcCWQc02ghV8e9UElkQn1jRzYu+ZP14DMMKxTMRdGaRt5Nnz0qBL2vJFfAHMP0pAUcTbcibWF4mr01dU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5SScju/YGuXa4UUseveGmDlbgxavn2OjmMAvSFrFiCSwfxzNw
	aMXTm6aD6RhT67G1d+cB1UAy6Vq+NZCQ/SJRRpOyiXIvqCwEdviJ
X-Google-Smtp-Source: AGHT+IEiTAY9+F3R+a/8LNgvAmR1+6V4tOAToZCVHj4Fq9S5hqSYVoROxU0htonMxa4LMvNNUdlI9w==
X-Received: by 2002:a17:907:3d88:b0:a7d:a080:baa with SMTP id a640c23a62f3a-a9047d1affemr1545750166b.34.1726571666850;
        Tue, 17 Sep 2024 04:14:26 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it. [82.51.105.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 04:14:26 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:17 +0200
Subject: [PATCH v4 07/11] drm/msm/A6xx: Use posamble to reset counters on
 preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-7-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=6207;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=dALUGbIXltkDW8VJ2GXSaW/3galrSPppuMOcBUWf6zM=;
 b=o3UEPHu9wUX4qx9n2GsQNpOvn8/2RI3ZRIgR628n9NJzygZscghKpepiLvGDNqiJzqnGCW//+
 tw1blaXs4o7CTEGAlHbcIRALIieEXIsWooUO6KU1RM7XqGrbPORrnMf
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Use the postamble to reset perf counters when switching between rings,
except when sysprof is enabled, analogously to how they are reset
between submissions when switching pagetables.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 12 +++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  6 ++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 57 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 ++--
 4 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 355a3e210335..736f475d696f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -358,6 +358,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
 		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
 {
+	u64 preempt_postamble;
+
 	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 12);
 
 	OUT_RING(ring, SMMU_INFO);
@@ -381,6 +383,16 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
 	/* seems OK to set to 0 to disable it */
 	OUT_RING(ring, 0);
 	OUT_RING(ring, 0);
+
+	/* Emit postamble to clear perfcounters */
+	preempt_postamble = a6xx_gpu->preempt_postamble_iova;
+
+	OUT_PKT7(ring, CP_SET_AMBLE, 3);
+	OUT_RING(ring, lower_32_bits(preempt_postamble));
+	OUT_RING(ring, upper_32_bits(preempt_postamble));
+	OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
+				 a6xx_gpu->preempt_postamble_len) |
+			 CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
 }
 
 static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 7fc994121676..ae13892c87e3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -71,6 +71,12 @@ struct a6xx_gpu {
 	bool uses_gmem;
 	bool skip_save_restore;
 
+	struct drm_gem_object *preempt_postamble_bo;
+	void *preempt_postamble_ptr;
+	uint64_t preempt_postamble_iova;
+	uint64_t preempt_postamble_len;
+	bool postamble_enabled;
+
 	struct a6xx_gmu gmu;
 
 	struct drm_gem_object *shadow_bo;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index aa4bad394f9e..77c4d5e91854 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -97,6 +97,43 @@ static void a6xx_preempt_timer(struct timer_list *t)
 	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 
+static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
+{
+	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
+	u32 count = 0;
+
+	postamble[count++] = PKT7(CP_REG_RMW, 3);
+	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
+	postamble[count++] = 0;
+	postamble[count++] = 1;
+
+	postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
+	postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
+	postamble[count++] = CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
+				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
+	postamble[count++] = CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
+	postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
+	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
+	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
+
+	a6xx_gpu->preempt_postamble_len = count;
+
+	a6xx_gpu->postamble_enabled = true;
+}
+
+static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
+{
+	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
+
+	/*
+	 * Disable the postamble by replacing the first packet header with a NOP
+	 * that covers the whole buffer.
+	 */
+	*postamble = PKT7(CP_NOP, (a6xx_gpu->preempt_postamble_len - 1));
+
+	a6xx_gpu->postamble_enabled = false;
+}
+
 void a6xx_preempt_irq(struct msm_gpu *gpu)
 {
 	uint32_t status;
@@ -187,6 +224,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	unsigned long flags;
 	struct msm_ringbuffer *ring;
 	unsigned int cntl;
+	bool sysprof;
 
 	if (gpu->nr_rings == 1)
 		return;
@@ -272,6 +310,15 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	/* Start a timer to catch a stuck preemption */
 	mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
 
+	/* Enable or disable postamble as needed */
+	sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+
+	if (!sysprof && !a6xx_gpu->postamble_enabled)
+		preempt_prepare_postamble(a6xx_gpu);
+
+	if (sysprof && a6xx_gpu->postamble_enabled)
+		preempt_disable_postamble(a6xx_gpu);
+
 	/* Set the preemption state to triggered */
 	set_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED);
 
@@ -359,6 +406,16 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
 	a6xx_gpu->uses_gmem = 1;
 	a6xx_gpu->skip_save_restore = 1;
 
+	a6xx_gpu->preempt_postamble_ptr  = msm_gem_kernel_new(gpu->dev,
+			PAGE_SIZE, MSM_BO_WC | MSM_BO_MAP_PRIV,
+			gpu->aspace, &a6xx_gpu->preempt_postamble_bo,
+			&a6xx_gpu->preempt_postamble_iova);
+
+	preempt_prepare_postamble(a6xx_gpu);
+
+	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
+		goto fail;
+
 	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
 
 	return;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6b1888280a83..87098567483b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
 	OUT_RING(ring, PKT4(regindx, cnt));
 }
 
+#define PKT7(opcode, cnt) \
+	(CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
+		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
+
 static inline void
 OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
 {
 	adreno_wait_ring(ring, cnt + 1);
-	OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
-		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
+	OUT_RING(ring, PKT7(opcode, cnt));
 }
 
 struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);

-- 
2.46.0


