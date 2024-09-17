Return-Path: <linux-arm-msm+bounces-31904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB37D97AF70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 13:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5969FB25237
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 11:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BEA17278D;
	Tue, 17 Sep 2024 11:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGp6Dr+L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0364816FF3B;
	Tue, 17 Sep 2024 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726571663; cv=none; b=XxRDk+xlQpeONHbJz3uAxOwN2647hPrlXSwAVSAYZQfMUdoxdSNYo4xh2xv2/Y8uvr+Ly/oycYmcn3XLCsRRoQ4jPlZLqmjn+HTk4Uqvk9RfVv3U+yVlRHoXNakz1iUfzD8mqbc+DiguBETu+20LdT2Yz++U/VMIskyPcrPKhbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726571663; c=relaxed/simple;
	bh=V0P15+a6cDLiwlZrHWu9wIpktg4pJmPIMCVG1h+FwSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0u0Lzrnm6W/NS/l0WX5EXc/igsHTEsw9PElaM3+EqBWg96blORBmFbVBhboeisNOhdMC7bHXjRcsKor3+0kWipAOiF2mk53u1Yy7qaY7hCwLGAayb9B9YeEPiUcU70gUYa1qQphKRI557FwJyLCiuRCGWUO5ycWWghA9wJZfCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGp6Dr+L; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53658f30749so5709670e87.3;
        Tue, 17 Sep 2024 04:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726571659; x=1727176459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+R/fm18AeHfM0zMF2aVoAuU7Wpe0HEexxo3MBMx8KP4=;
        b=UGp6Dr+Ljg2Jty+W4TbluLaLF5kN6lt0UzLqgA9grIp9Yj/R13qiSdHmb75nuo0x+M
         NKTIE7fHjMC4Djbo44zBc7D+3KzU3DMNKMtwugA+wIocLEX7wmktbVcRccaUrIg1WPKx
         AO8IQxKzklX6dc+3jJygQ9lg0zyr9EG7qsi0UADc83GrA0L2ieyuWXo7R+udNRN6KSxy
         RX48sIx9fsWOPZ4EWeix8wFkzQd+eHFsdThVaGG6IsrEH3NSJ7A4S49Qx7K5eV0LNvrx
         M9JtJNJw8tRP0NwdRdkMi6Yi4nHyRaV7RU7mGhr4a/ukN0HbPYz3qWw/5rxlCnkLACJA
         3PZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726571659; x=1727176459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+R/fm18AeHfM0zMF2aVoAuU7Wpe0HEexxo3MBMx8KP4=;
        b=iooI2EdisrXmjq+6z10LwMsm564hdPqLvPzH3lMip/BnXgVKSnqaRM8IhPQMdzlaSs
         d8jLONGgzLCki8ZPTGYGRiyGpXHKVPjd8i74MhhRgDF5+aZRrt3xi1RMAzV7cG6Jzim0
         amINABjn5q4CjCsZlVMC8ocaG+KC8qZE6K3rsXrPyhRtmnFFkbQvxzBuct5dC/oEz056
         vfKqBH7gusB9+s0TJSf+CbI8nMrbnC/TfL+0zGJukwJF6cB826EJ+XzXkMhJ8mGzoc32
         kmUDu3JuIx6xV9TDBc5Lf7qYxkQlax3jqsWN5zs7NhAggf2iPwSNmteJJ6TFcM1HFsT0
         z6bw==
X-Forwarded-Encrypted: i=1; AJvYcCU8Ynf2+AZU/7YNBV4UkezZQO19Vb9JGU6lgRjrLNI4wgnPGBVyKL2vpZIApcraUB1zpWTpUG5yo7A=@vger.kernel.org, AJvYcCXHwr0os5ukmcL/SdN64C4As9LroO9TLliTQ/xk6gQwKgOTLYPnMB2lOHYKPclXFIMY62qiaw7xzK4MqaZF@vger.kernel.org
X-Gm-Message-State: AOJu0YwrVBfsXEBiwSTHh+SYg6lqHWU05wPVckQh7pG8dt4KXQlSLaDk
	xHgnTRKR+kLVqAufop+PTN2maLg197KfXc0/DoJT1OtkocpI2EU8
X-Google-Smtp-Source: AGHT+IGpVqXkWKykKEVgpQJNzF9uRy35tlKf0PLH2XCzdKdnDSWK71B7cIq4xeGh8gm2Di/y6dNo9A==
X-Received: by 2002:a05:6512:2206:b0:530:ae0a:ab7a with SMTP id 2adb3069b0e04-53678fb6fdemr9303488e87.17.1726571658484;
        Tue, 17 Sep 2024 04:14:18 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it. [82.51.105.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 04:14:18 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:12 +0200
Subject: [PATCH v4 02/11] drm/msm/A6XX: Track current_ctx_seqno per ring
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-2-95d48012e0ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=7762;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=V0P15+a6cDLiwlZrHWu9wIpktg4pJmPIMCVG1h+FwSw=;
 b=fItI8aLcFqlGvOY9j/1qGOdn3mfMH3NNo5qqe8kwSGiC2WODCftgQtcAOLLmCfIFvcsaehTmV
 Qa2HJaxiFDxAiuWeEhMlA/2dazBWzu1XBCzEyx3tn0d+h+6rT+rEuuZ
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

With preemption it is not enough to track the current_ctx_seqno globally
as execution might switch between rings.

This is especially problematic when current_ctx_seqno is used to
determine whether a page table switch is necessary as it might lead to
security bugs.

Track current context per ring.

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
index 0dc255ddf5ce..379a3d346c30 100644
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
index 5273dc849838..945fe64f835c 100644
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
index 8b4cdf95f445..50c490b492f0 100644
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
index c0b5373e90d7..80b441fe8e3a 100644
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
index 32a4faa93d7f..6e065500b64d 100644
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
index 3666b42b4ecd..c063b3896dc1 100644
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
index 1f02bb9956be..7cabc8480d7c 100644
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
index 40791b2ade46..174f83137a49 100644
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
2.46.0


