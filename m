Return-Path: <linux-arm-msm+bounces-33035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B476298F3F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 411C228410C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C821ABEBB;
	Thu,  3 Oct 2024 16:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XeRhGetO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA7F1AB6E6;
	Thu,  3 Oct 2024 16:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971995; cv=none; b=TLGLLrI+xMNPsRe4+e7RvaMx7bIixwNR9sLX83SyMop/GYAjh018rnZBGpkDwImnhCWtga32HZ7VYnwC/5zGXcwS4SxWBGIWzqOPral4v7z30WjhRF84Afk6xtSDtWjZy9M11lhe00bjrvKGVawgMy/wZMMmaGvg++yicLJwVhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971995; c=relaxed/simple;
	bh=GErpIvRW+n2p4qxh8jSzvjL7YV5XCXSAicPcG/Fe5FM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dzbheo63cYFAm38pUZPv+zKlf9f959YuPs5vDUfoDxKEQX3Eun4+ctwm7D4rGmDM0QdBaoH1qhfzYAhsKdjyYX1Mc0BtJGCBWKAMKeo2qUejfgFNnXBT93UBkbSozl/q3x6p1vPO11qIESfvC2XYAxiiZdzY4QdcQcqgfStpRC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XeRhGetO; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5398fb1a871so1212415e87.3;
        Thu, 03 Oct 2024 09:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727971991; x=1728576791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcdhyLXjBdUnQH13HN5Z9aat7gLFfAqJVDn1uHZn7Is=;
        b=XeRhGetO7gq7PqJe+wvJub9hSR3geqsszUP5NZuu6lEBkJJd4uTqRl5aZBGpmN0Bt6
         UpNfOAJPDlCFp9g8Q3v63a/ctuqIb7nYxo7XVXprYrKaRSnjubtW4yMKukKspAOiUdev
         ncqQr7TXO5dn65M/PGQZhD7XH80Hv7yq+ojvUDhpdC231A6EYtsg0UAIt5KDwhdIstuy
         QuqdWmGp9laKOMUHg5Up79Bf4Fs7FHM08KvtaJpPrmEt71wSWldZQfcTC+4bVjqt2bjn
         ELic78ZdDQqePEq2+OVpjDEZAVhKW+nvD/2FOcsOYZ4gCFPvikeLx4olRNjeIKAgtxlV
         lUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971991; x=1728576791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcdhyLXjBdUnQH13HN5Z9aat7gLFfAqJVDn1uHZn7Is=;
        b=uyBNtGc3yKJmpICaOe73oyQMv9vSy+DCFK806wQS0wo21r0pCMO66SxYmoPnG3cceK
         3G06U4ZOXa51ZesAlnw6VphRtWxtIBXrQFU0UKXq7d18dMsGzgiwAAxpSE5E5bSypNZU
         R5A6rpssQCuN/KdVdLeLE4OZnFLf4DP2LIgSHq2dsWGLK++4Drd2e88Mms9HnnuE7DlQ
         klXh0HrE8/dWDjlc/5I4bSZEVx+p6AZORutJ6o2Gmr6ORvcqfFk3rAixS1sSRuxEwGO5
         K+XF3AJMpUdLLfgBwAbO0mj5rAonD4BO/UjFXYtOjkt53l/9cIf6IeSueiSzEk/+JwX6
         NWFA==
X-Forwarded-Encrypted: i=1; AJvYcCULa6I57AkKwxj/+3vuT6Ovu0daEqhr26sxzKc6ugkjywJmTD7s8/sal4nTvYfHNIlaQ1hKyw3870SCwmVN@vger.kernel.org, AJvYcCUjAo7hVYsujC43oWAQdOZBWCIO11Ge2eiOQ0luFLPD+hoxfWBAngk6BLnKISueWzLPmEzHUvZhrWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwppItBwKFa10DxNRhdyAcykUZKXhQYZ9Omv5h0685f5sIkYO1P
	GvgL5eZwwk+6kFlcMIoG03viLpEfvL39jHBM0VC6MB9PXG2RuaAh
X-Google-Smtp-Source: AGHT+IG8ge5MgQco/78qQdnge1N7/AyTdvcYjGWmXKkEu5A9AsMAtCkGS1hg5bLrL5U40FmGRQgA/g==
X-Received: by 2002:a05:6512:1247:b0:539:9f70:b01d with SMTP id 2adb3069b0e04-539a067ae27mr4529314e87.26.1727971991033;
        Thu, 03 Oct 2024 09:13:11 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it. [79.12.161.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 09:13:10 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:57 +0200
Subject: [PATCH v8 08/12] drm/msm/a6xx: Use posamble to reset counters on
 preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-8-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=6771;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=GErpIvRW+n2p4qxh8jSzvjL7YV5XCXSAicPcG/Fe5FM=;
 b=2tICMXwV9MzyVhtsiZGomhyUx9oMdGGKV/Y58NXnCgOvr0S1w7R+I0Lh5tP5l3k3YuLov5Cbu
 6ASft0BeE6oCqfS5j40Ramq3W2z7Xn8NFyzvr1VvoGnWrSJ1xH7Dgh8
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Use the postamble to reset perf counters when switching between rings,
except when sysprof is enabled, analogously to how they are reset
between submissions when switching pagetables.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 12 +++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  6 ++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 58 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 ++--
 4 files changed, 81 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b4cd562f1dd8660c77430e1aeac7e4b7af32bfc7..9b486ec08f77933c3666549a16d915aa2d2188b0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -280,6 +280,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
 		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
 {
+	u64 preempt_postamble;
+
 	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 12);
 
 	OUT_RING(ring, SMMU_INFO);
@@ -303,6 +305,16 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
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
index 070bce058d3ff92aa7452b697763a16ab7e2faee..a7fde9a27481f4f6d4efdde98a12ae4b62332f47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -69,6 +69,12 @@ struct a6xx_gpu {
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
index fd2a90360740591d45758f7311ec5cdda1855b20..21e333cb6342d33425eb96f97bcc853e9b041b36 100644
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
@@ -271,6 +309,15 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
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
 
@@ -375,6 +422,17 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
 	a6xx_gpu->uses_gmem = 1;
 	a6xx_gpu->skip_save_restore = 1;
 
+	a6xx_gpu->preempt_postamble_ptr  = msm_gem_kernel_new(gpu->dev,
+			PAGE_SIZE,
+			MSM_BO_WC | MSM_BO_MAP_PRIV | MSM_BO_GPU_READONLY,
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
index 58c63d0fbbff9818393fc62ee3cf2703365bec23..2d8eef6c668b0da246edceba0c5d92041ea9a35b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -623,12 +623,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
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


