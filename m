Return-Path: <linux-arm-msm+bounces-32615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58592987A8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 23:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E87132861E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 21:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FA4188703;
	Thu, 26 Sep 2024 21:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0PqMHot"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5C518859A;
	Thu, 26 Sep 2024 21:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385430; cv=none; b=AfxD3+1TB7ics0Kdy1dgOMnUfoC3N+q7TKYZr12up+ukE79CV+V/Rlfcv2TOphWvBui3S1mbDG+5FQVY4rNyzY5pDSYy9QZZal6qOT/rj0jlFUXtiDVsN+W1eV4384Po6hG6zbXH5wY/t43yD6ySnuo6JoOnJAq8OTq2JGi2yVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385430; c=relaxed/simple;
	bh=3lkRPE9IG6LdIb0AbxM5VciIHuTa1FZhL5VBzl24384=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B++Yz3QYz6WlvsBoGje1Gu23qqxtYDCpb7EEoLXOuu8Shx87yi/fwurAV4K9r8i8yoHMSDW1xblE4etedt3/t8p9d8QuE6A3tTbe5Vdz//dOuUz7DeFoBmYinoN7j9RpijszzWcHaXRO0FDQtvopMJBJRG4A/OuKuGefgLarls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0PqMHot; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37ccfada422so670342f8f.2;
        Thu, 26 Sep 2024 14:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727385427; x=1727990227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRFZmBTAiDK/2/ttMQtcIHHMWKwqvGSpIb2XjFF70t8=;
        b=j0PqMHotXdEjddRUqRT4U4gO9u0M2NdStIDZWd95/kNGphfaau8YPr7YEpeilaULL1
         0+GPGdvUXchwCZVwRQCyw/ya3ceMOrN8jEC8p3ECA5yuhZe1NLNX2biR32R86SFTMs2r
         BVdU3jZbUbmB+VHyDvbsm359DhouB37BShLR8NqJuiiT9Rn1+1kU9PIJLvCRO2lqZqh5
         NrLUAfQIm8TRmE/hTYWXbTqUvx8LNU+xJ+2k86YbQ2gSG4v+7QX8l+I7+Q4pwdQHQR0U
         gfZxrlQDDX0Rec9yNeJ0+2gYqL9rLaGvbmcVUiYWjdgG5Hex+mV72cRhMmmnPglVfnx5
         RClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385427; x=1727990227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRFZmBTAiDK/2/ttMQtcIHHMWKwqvGSpIb2XjFF70t8=;
        b=qALermFMCs9oj87fWmhuGUZrSiu7sz1SEhqBuxYy2OhniilFytsDPnDEwaOT3kzhRt
         fa7Dl6lCCE0goyXcshZIv6zbu1gVVQaCkz/mz6/MFEBqiofSGPI8Lqt7p9Mv3JXYekNi
         tnVKlqN+JxhedKUzdD/nxt/9quZsSxWGqF0w8jpXYWp3O6cj9EsFtGNP3uQMo3EGglUB
         tOIqG21LtMk9zcswT+SEondvWyd8lO5L/U0zdf1AkLeYQL+OXwd9w1EFx8TPBmJyQWkr
         /KuP1MfzXI9FxL4e5bgf2rI2k4PXH116fML5/FNdom3hku0e/HrdaPEn0roYXE2itwpr
         vwcw==
X-Forwarded-Encrypted: i=1; AJvYcCVzoJKOBOIXvnuieDmQjAdhS7+z6XBbB1Kc3zBrLYdnv2PJj88UzF8HyzfkkywDQ/h4VCEQ7L+ivwo=@vger.kernel.org, AJvYcCXbHDMSZsKav0apmU/EIqCu6AbskiGOq7FibDR/Tr8Xd/ix6zOWzh0X1z/VX0GbJ5yLfgsRxLQ/U5hiRf+A@vger.kernel.org
X-Gm-Message-State: AOJu0YytrRszvooDErn2TMf/cD/4KBs0LeGzf7VdQ/FQbVC046K7cKPQ
	1au5XFyjZN8hDYxAuQF5B9b4JV5a7kFbjyOtg9Pwf8rGkAv6Vprv
X-Google-Smtp-Source: AGHT+IGC9ZHuTmmR/4MUEh8X1thjng+T4izbWRqKCz4Myr45vbr2xJPrlfO8suB/c2XkKauZ9X+VPw==
X-Received: by 2002:a5d:45c8:0:b0:374:c847:83a with SMTP id ffacd0b85a97d-37cd5a6b581mr601548f8f.8.1727385426769;
        Thu, 26 Sep 2024 14:17:06 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 14:17:06 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 26 Sep 2024 23:16:49 +0200
Subject: [PATCH v6 07/11] drm/msm/a6xx: Use posamble to reset counters on
 preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-preemption-a750-t-v6-7-7b6e1ef3648f@gmail.com>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=6700;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=3lkRPE9IG6LdIb0AbxM5VciIHuTa1FZhL5VBzl24384=;
 b=jMrueTOAuigP1cmVIcs9TKlNQdh0mxPAB9AATRunmnuZu3wxIjvsNpbOygQXF3Wv9+vyw2kZw
 LNtWILE0Kj3Aw3g6aiixN4l31252jTdbyMNSn3h6uSEC+EpOn8s6lus
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


