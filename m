Return-Path: <linux-arm-msm+bounces-32283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 361FF9844C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A89971F26B09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5387C1AB6F1;
	Tue, 24 Sep 2024 11:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXdLpGrP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428C41AB6C8;
	Tue, 24 Sep 2024 11:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177455; cv=none; b=R+WYHjHrUTFv+hfUaGop7qkk1J5kr7GleJ6La0FTE9lQ8iqpMrszBw93ai8pzV/6yfD6ErAQtTD7/OPKcXX+CUieG2Ucfa5Kc2zrKBKYvCYl2MG5SRgX3vkEg5KLBV4x01iCDiYGfJONa3C3wVEVhXm1jOV7UYn1SOoDwzIklWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177455; c=relaxed/simple;
	bh=3lkRPE9IG6LdIb0AbxM5VciIHuTa1FZhL5VBzl24384=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QP8dzI3er7TN7liB8QDIbnoYGRH5M/3r5E6XP89XGuMdXQziYpq5jYYGdM1zmYVt2GMBxegLmlG9NIcsSq2tmdpPesy/I9Qy3NATcrf5oMhfaHzCudCbSyOJil7T3RwqiQdN5GSdgmRWhqLtKSWZbH4FjLVpunlDSh7ZEc1wOXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXdLpGrP; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9018103214so776273566b.3;
        Tue, 24 Sep 2024 04:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727177451; x=1727782251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRFZmBTAiDK/2/ttMQtcIHHMWKwqvGSpIb2XjFF70t8=;
        b=CXdLpGrPCFm6k0O0svhJXu7Ynck+zOJ2fqoA8QfX6fMaIntAeHbYvy5t7HATkl09RJ
         FHz/qlhmpw5fDNoJJYpJVhfouCVcyURRXCkUuMbFkKuzqeTrdQWT+kmvskNbIMN4OWEV
         1Zv4CWYu9q8pRKqJ/zCKXdtRgBMxIajO1KqSm/HiDWG6QBcQ87kinv+7fvbkHY8dR645
         2jYK8q3ZZcONMxCag2S3KFYffl2bi8XTQHnweVOJpAGDQoB6OYh/YhKAIMb99+KlBuMF
         cp41tMTFevx0NT4DYJ3+5PDzzzDxfkLSP8rmU1dBjGpnQJiCsAOCAEzW8UV/rYPqAsLt
         7Duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727177451; x=1727782251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRFZmBTAiDK/2/ttMQtcIHHMWKwqvGSpIb2XjFF70t8=;
        b=Ve+t+rAayTH1Tq52djSFoa20saP8PASTaL7NwcwZFbkKHNd9Y5DcM3n4/MhvlKZCeo
         ODjb1atRgUrhTmzjmqZKnExsnsjNrhleDvcSEWmu8mxwwsoTt2cXZ743mr1BwiXNd+4+
         FVBJXZUbB/GPV0UEROOlRv0uYCb3xxCys++zvhnqz5fM6Ada/eabxN88+7RPUpPhuYUZ
         Kdg/Firdt9EfvwUNvpFYc+/Aak+6tLKigvxUPAEYA+Nh8I1NMDE/QjmAabn9D2fSaFEl
         7DvsERDh/RNyEjbAaNRloYFG/Ji2Cc8GvQiidi67x6oIDB1DjMJhEQpZObEzAur3GvVL
         9YdA==
X-Forwarded-Encrypted: i=1; AJvYcCWieQvE6zcCxwdlN4oRwojsKUFZprsN8DccfNLrBfCEprWCXGYwsYmsorU7GPaANHIN1XV79X6wocY=@vger.kernel.org, AJvYcCXUh1fIYwIV/MjIij7PSHR+RejX+MGHDsVS5cQcMvO1sVQdBy3BpyLRTivMpes0PGOPV0fE/5269KgbCVJU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/4Gvp6neWfs9HrrAfPBfF2K5RF6igmpojksoQdv6+3rWlRhus
	K/08uq+Wr8POdGCNXZH9buzHpDzizGaykUY8lq9UBaKkbRu8auxNQjV0yOXy
X-Google-Smtp-Source: AGHT+IGDW16BmYf4uKKL7inMLM4p7uJeDy9W9Q1y7JeRa3in24dMwlxZY7U9M5TLwSJpz7SA78P+aQ==
X-Received: by 2002:a17:907:3f17:b0:a86:c252:aaa2 with SMTP id a640c23a62f3a-a90d592845cmr1461319566b.51.1727177451258;
        Tue, 24 Sep 2024 04:30:51 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it. [87.7.171.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:30:50 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:42 +0200
Subject: [PATCH v5 07/11] drm/msm/A6xx: Use posamble to reset counters on
 preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-7-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
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
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=6700;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=3lkRPE9IG6LdIb0AbxM5VciIHuTa1FZhL5VBzl24384=;
 b=JBbfXjQHdQWtDk6pAQ1KieQmw5VYWl0Eg3/O5IEpTREqXkLfM68VrbWuSQfVh8X1L04T+xV/2
 TIKfrqTe6K6DPU5VDxz3NEVFh2UYPKS3K/hoUfKZa8gWVJf8mKaeMNV
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Use the postamble to reset perf counters when switching between rings,
except when sysprof is enabled, analogously to how they are reset
between submissions when switching pagetables.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 12 +++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  6 ++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 57 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 ++--
 4 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 355a3e210335d60a5bed0ee287912271c353402a..736f475d696f1133c9e55d16aa80e73fd46cb835 100644
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
index 7fc994121676844cc53438fb47756e7caf5eee03..ae13892c87e397f5cdea6785fb7d5c17b7a93690 100644
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
index 38d68b341d99e9f4c39213d968de6b1e168c9786..cf75f612edc15374f3d8238e3dc0297532569607 100644
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
index 6b1888280a83e6288c4b071733d5d6097afe3a99..87098567483b69c21025b80f356e0a68f0e7f172 100644
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
2.46.1


