Return-Path: <linux-arm-msm+bounces-32777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBA398A604
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 15:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F08ED2842A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8977C191477;
	Mon, 30 Sep 2024 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbpgECDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D10C190079;
	Mon, 30 Sep 2024 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704367; cv=none; b=tTEzOH2tDo3ZAzoqXXvZMqUMxh4MlP8TFCs1vOk0kPtDVWAheElRFSNcwgwlUN6lkfXYiasj+ej651hGvQ/kHH/Xw7eJglDRmS7gqbCdbdVL0tg/uFmMJXU51eijOCwRFuQuYjwNFyCKFADznp3RCivRHEyBmJftcxFrdJSSqiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704367; c=relaxed/simple;
	bh=yIHp38RtvtLDCz+dKB6Vf596mZ26ig0Y5efzj1HIfzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SIDUUdvcygb6bLxVcmWGnIiI1KmlbkSiTKclM4QUu/AzYG6e8JRCfdX6kwBXSfsJkPmCbArJgzuk6TzpjnwK45vE0/2tCpSjP2BJ431KjxIY62kqiuut5wfRaw4JYbnWkWtePKqHMPrbkvw/Ox2625PaAmRDPU2salHm83hmjEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbpgECDK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d3e662791so353414566b.1;
        Mon, 30 Sep 2024 06:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727704364; x=1728309164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYDoFr9Rcb4U8qB9JjDnoMu8I4N6v3+THQGXkHPg2F0=;
        b=XbpgECDKDLFFLuchHzS2wIwednEmPWs2rgz6vbMVfDRsXxXVtZkK7ZbN1E1SCiXGRM
         OnV1lLgdnQ5CC9aWJ5c0GVblKPe7AIup2kmA8X4JCFzyxUlwGUdfeRcLv+a7OSOip1gX
         DF8FQW4fBHek3HBFn61npTlf0nNRLZOZky+dlA9Tsyi/LF0vNAgjZviKSaH6ic8QNRAp
         1KwAHrRrbhtWDUwE1ogXPRuNnogT4eS+MXvtcHB0V9OsSzRj/AyPP465CB0aDCTM43HS
         XfdCB7Pcza4YTX6rZz7ENy3w2jSWxNMDvR/5G2lYHxaWaVv+RzjQLDnqrn/h/YN/uc89
         Y4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704364; x=1728309164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYDoFr9Rcb4U8qB9JjDnoMu8I4N6v3+THQGXkHPg2F0=;
        b=Bx4yFfUpamX5VO33w9ayw0waIewzjkcGaBPS35OsVF2E83M4bLPB2KklplB5NSGDXM
         4QLOb7/sxWxmDGO5TmvPHlnYkTgs2shPZjbuDzNtvGdk9IODGeCsIZha1SG9ZXNVdjhS
         /bjI2jaAKhh4x/CbWIVe/YoCSHmlxrRr7mk2VOvuMLn9e9wajTHuneo1haRMU+w/Bv7S
         OXYdrfS5sBNYRPt8ugnxiKOkzvYJDZPVdQrWbZSKksp2uIwbBBkPWKfNCXXWykn8tvDT
         dxBxG9iFrgHxeodh3q5pXn48qV+gDjZl9qHS4VVCtaLXFbpbTUfEwyN3BtX73H5XL/tx
         WRIw==
X-Forwarded-Encrypted: i=1; AJvYcCUG5IYdmodn+6W9Nu4erRICohemH8s3NqzLNduv6z/kF5O/fCij3O0CwMok0ovBrVc5gJ/v963xIuU=@vger.kernel.org, AJvYcCWY9xUAuYdUVCrkgkLzUH/KGm2Qq5T+qZwK3SeZIWClEDGMSp+IWvwdBMGTMJr5wNRJRK9AvPDX8+bV44Dk@vger.kernel.org
X-Gm-Message-State: AOJu0YxL9qk/KbaHZ1NLGmoPmrGMK9hh8vbWfp2g3d9+dQVMj6skdahq
	Ekz8vXsO8Sk8lCxhKinJUZ3/JdsTRcUDv3qnOy3H4chHxecb0R+E
X-Google-Smtp-Source: AGHT+IH4JrcfMQYAjy2fyNe948G2C0pX+g5oMJjPtAa4bSbtIoTyYO7R5h1Q1yKIKjs/BBIg7J8Z/g==
X-Received: by 2002:a05:6402:13cb:b0:5c8:9696:bae2 with SMTP id 4fb4d7f45d1cf-5c89696be95mr8412100a12.32.1727704363438;
        Mon, 30 Sep 2024 06:52:43 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it. [95.250.55.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:52:43 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:37 +0200
Subject: [PATCH v7 02/12] drm/msm/a6xx: Track current_ctx_seqno per ring
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-2-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=8467;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=yIHp38RtvtLDCz+dKB6Vf596mZ26ig0Y5efzj1HIfzs=;
 b=wgxA7k1QZvSJdjmM2/VOw+MPuEvBn6t36T2WxuOAf1yO8IS8NkziEbf6guMwPf8rNXNyW19rh
 2guE+u3xY4MAIlQPpx6CkYcsGT8+yme6PCmyZ2mjWxiTt+fRjgL8Tp9
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

With preemption it is not enough to track the current_ctx_seqno globally
as execution might switch between rings.

This is especially problematic when current_ctx_seqno is used to
determine whether a page table switch is necessary as it might lead to
security bugs.

Track current context per ring.

Tested-by: Rob Clark <robdclark@gmail.com>
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


