Return-Path: <linux-arm-msm+bounces-32278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F4E9844B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83F2BB25E4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEFE1A7260;
	Tue, 24 Sep 2024 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Flyf9RQ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C791A4F3A;
	Tue, 24 Sep 2024 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177446; cv=none; b=X9t/7fOyy15kodpCfJ0mLaeZZT9TnJOkbSOLUFY6D1EwM5U+4aotx4uQcF20JJC6ytzeeNidydguKPAVGoQnbtmrUqIzXeujQXaNl8XhqH8p+c7QWCNofN13cEu/mMeWnGEHHHR8AvRqF58PY/Sq7R/czt9y3w1ZNaVuI32c2Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177446; c=relaxed/simple;
	bh=CepXFxjXqyEXue/YGJWfm3KBEXw1RyR6W2RTmQQLiRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWTbgbfPL3QIfGd5NfdxrcnLX4xirx4yJTJGII6zindUCe9UmienEGwDr2c0cVyOPaXRgUI8zYr0Qu2vITHt7FcVLi2O1dAdKbV1wZ6QoRlIwOBtAG/Bx7mUL87JFd8jOcDzwmnB9DLda4EW4yAKN1kKpPi2lenH8Ng5hMm+UaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Flyf9RQ/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53653ee23adso4895811e87.3;
        Tue, 24 Sep 2024 04:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727177443; x=1727782243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubh2LO1iYir2G9XehyXS+a8IHNhnU1KljQqeBF6FN+A=;
        b=Flyf9RQ/0qg083SK0zazgBIxJzQGY5s+ofsZ5ABdneW6ehprXq/qUBA7w7m7ewp7Fz
         ioCCd/GqYx8jh/PiPa8XEojpgr/WtC3vzfcsC3OuZPH7FSSH9Obakl5FClc+fu+id/Ho
         rWIF2h8C0etELWeJsfxiweHrYyiTdD0dNPTHs6om0m8QpJMBAcuWAQ5GWBEvYGvZmbx7
         /+3qGs6SQXjEcg8BXnIuA/UwrUDQ7ZssjCSBdRZvXmES65VIaACXHXjyF47nlmSJBzQK
         IYAH2DSIUAhcGbY1jm5x8m9Mjdti0Oq0R1e3qeqbcHitg1hqJgDW3M/zDBELZXaJA+BE
         jabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727177443; x=1727782243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubh2LO1iYir2G9XehyXS+a8IHNhnU1KljQqeBF6FN+A=;
        b=vmxc4XjPan6ypXeXOrW03kfthkJaRzodJ5h6vlyd1naQjY9xEZbroLUoUnD3R6/86f
         d9rtzGlVdVRb0HVl8TCZyg5b+Eini+E27XefL04EwIsGH13AeAotQzUDOcAzw0hwV99U
         HNoOpLYPxgsHkd8TXitu+BiLKCYYLtlqgW/rQYbnevCBL8/OqAK+WXvH42DydRdwbcBA
         rxATsYaSxMHfiQRnUp98NFXM+uXmmrp0Io8l+DseIsfBEibtlYlQm9gKUdzLkZfLXYd4
         OIp0CHAScyPxEpqKZedtXU0JeNeFNe4X9DGhBihGj2c/97ntMvhlAqtoEfekEefcFORP
         SxLw==
X-Forwarded-Encrypted: i=1; AJvYcCUt0bO3HQTc8so96uebAjTg5vZwz7hzUl2RzjpLP1LNAtt6+zXuihvVbyjcX9kXrrKDnXSpO7IVeOA=@vger.kernel.org, AJvYcCXM2IKcNcvt3XZSWk34imF9UDAB3PkLcWX1wkVoty4NnV11I9XXEe9pNoM1wOqTZKIOraCPCCzkTVktrHk7@vger.kernel.org
X-Gm-Message-State: AOJu0YyEN9BOcTqlkJv3iogq1xjBcFDXvPFUTbvupKvFdIn3m5P6t5ue
	PPaWm8mYsuRAFK1CjjdIuJjl39A3+tn4ds7MAGaYG7yh8GTeeV9SITvpVTK4
X-Google-Smtp-Source: AGHT+IH81sdjUYY9Zv9pI/l5WsOAAAj5IrJGuTsomuTNr51SomncWkLCqBXc8Q5+xm4mUSv8OIsL5w==
X-Received: by 2002:a05:6512:682:b0:52e:8141:1b27 with SMTP id 2adb3069b0e04-536ad3b7ed9mr7757898e87.43.1727177442648;
        Tue, 24 Sep 2024 04:30:42 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it. [87.7.171.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:30:42 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:37 +0200
Subject: [PATCH v5 02/11] drm/msm/A6XX: Track current_ctx_seqno per ring
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-2-0be2bf81c187@gmail.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=8423;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=CepXFxjXqyEXue/YGJWfm3KBEXw1RyR6W2RTmQQLiRs=;
 b=ltCSJ3VygR8SkX2XvoRJoTxV+G1hfmAo4Dk9ELM6i6UVniI9UEWhKiBBrqgBCJF0xMc34+BCg
 MuUE7bXwyxsDziNA8ApKqlWjZ2FXl9WZ5ptMLQ2rfB1R04+T187rtMF
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

With preemption it is not enough to track the current_ctx_seqno globally
as execution might switch between rings.

This is especially problematic when current_ctx_seqno is used to
determine whether a page table switch is necessary as it might lead to
security bugs.

Track current context per ring.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  6 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
 drivers/gpu/drm/msm/msm_gpu.c         |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h         | 11 -----------
 drivers/gpu/drm/msm/msm_ringbuffer.h  | 10 ++++++++++
 8 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 0dc255ddf5ceba87090f64d5cb9f078b61104063..379a3d346c300f3ccc9e9bd08ef2a32aa3e24ceb 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -22,7 +22,7 @@ static void a2xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			/* ignore if there has not been a ctx switch: */
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 5273dc8498381ce09e878894f4eb56263900be39..945fe64f835cc6094f1880ea20f20584de74a464 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -40,7 +40,7 @@ static void a3xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			/* ignore if there has not been a ctx switch: */
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 8b4cdf95f4453bb76e7efb93d86080ef678c9f68..50c490b492f08a1a7ebfe33b2f206cafd91a84ba 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -34,7 +34,7 @@ static void a4xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			/* ignore if there has not been a ctx switch: */
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c0b5373e90d7139caa023aec6f272545456acb0a..80b441fe8e3a823c5bd1f74cd8c7bb418d0674fb 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -75,7 +75,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
@@ -129,7 +129,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	unsigned int i, ibs = 0;
 
 	if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
-		gpu->cur_ctx_seqno = 0;
+		ring->cur_ctx_seqno = 0;
 		a5xx_submit_in_rb(gpu, submit);
 		return;
 	}
@@ -164,7 +164,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 32a4faa93d7f072ea6b8d949f4dc9d2a58cec6b9..6e065500b64d6d95599d89c33e6703c92f210047 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -109,7 +109,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	u32 asid;
 	u64 memptr = rbmemptr(ring, ttbr0);
 
-	if (ctx->seqno == a6xx_gpu->base.base.cur_ctx_seqno)
+	if (ctx->seqno == ring->cur_ctx_seqno)
 		return;
 
 	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
@@ -219,7 +219,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
@@ -305,7 +305,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
@@ -843,6 +843,7 @@ static int hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u64 gmem_range_min;
+	unsigned int i;
 	int ret;
 
 	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
@@ -1138,7 +1139,8 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
 
-	gpu->cur_ctx_seqno = 0;
+	for (i = 0; i < gpu->nr_rings; i++)
+		gpu->rb[i]->cur_ctx_seqno = 0;
 
 	/* Enable the SQE_to start the CP engine */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 3666b42b4ecd7f91b24302d7f229eeefdc3c39b7..c063b3896dc1c193e41b8fc380a91a9076376811 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -783,7 +783,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	mutex_unlock(&gpu->active_lock);
 
 	gpu->funcs->submit(gpu, submit);
-	gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
+	submit->ring->cur_ctx_seqno = submit->queue->ctx->seqno;
 
 	pm_runtime_put(&gpu->pdev->dev);
 	hangcheck_timer_reset(gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 1f02bb9956be2720a2760646ccdf92f8bead7dd0..7cabc8480d7c5461ab8d8726fcc21690cbaf7366 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -193,17 +193,6 @@ struct msm_gpu {
 	 */
 	refcount_t sysprof_active;
 
-	/**
-	 * cur_ctx_seqno:
-	 *
-	 * The ctx->seqno value of the last context to submit rendering,
-	 * and the one with current pgtables installed (for generations
-	 * that support per-context pgtables).  Tracked by seqno rather
-	 * than pointer value to avoid dangling pointers, and cases where
-	 * a ctx can be freed and a new one created with the same address.
-	 */
-	int cur_ctx_seqno;
-
 	/**
 	 * lock:
 	 *
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 40791b2ade46ef0e16e2a4088291a575d3be9e82..174f83137a49940ec80b1fbf548e214fa3c32784 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -100,6 +100,16 @@ struct msm_ringbuffer {
 	 * preemption.  Can be aquired from irq context.
 	 */
 	spinlock_t preempt_lock;
+
+	/**
+	 * cur_ctx_seqno:
+	 *
+	 * The ctx->seqno value of the last context to submit to this ring
+	 * Tracked by seqno rather than pointer value to avoid dangling
+	 * pointers, and cases where a ctx can be freed and a new one created
+	 * with the same address.
+	 */
+	int cur_ctx_seqno;
 };
 
 struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,

-- 
2.46.1


