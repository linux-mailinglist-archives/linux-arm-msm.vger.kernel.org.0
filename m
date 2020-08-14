Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E2E24436B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 04:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgHNCly (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 22:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgHNCly (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 22:41:54 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E198C061757;
        Thu, 13 Aug 2020 19:41:54 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t10so3514183plz.10;
        Thu, 13 Aug 2020 19:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wLbeJH0vy/co+tOlHv+Q071qhqctu1gmId0WOcDhB1o=;
        b=dNPw9WlmmRFqB3N0kYyNSn+4+FdCaXngN+RlAsFxM1uaj1HmPlFBlb7YXNp/foTLy6
         8KKx2ebX4ivmpQrEtWmv1tLcIVx797tyAloiWeqq7mtqox8hCUKXnLLGbUtqez2fOVFV
         UT7CIVTaQNXplm/9My+fueBHGLhLukBgSVLm/gDETLaNwTi4Ke1+mVUqO593NSUQDD0c
         VrBnwv/HTmIAdlb5e66KmUZ6GEct5WyO6RDk8cdksDUiABtH3YY7mduyQlLuAynfsT2W
         QTXXyHyIRbw3C0WkV53K2rRftlKpFk/lO+/zvSQJyXPeRveeFfMxAJFmj2wyteMuqDt1
         e8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wLbeJH0vy/co+tOlHv+Q071qhqctu1gmId0WOcDhB1o=;
        b=FssaLSQmi3r4uEOXorcKoJw/ScOu4ozsO4+E8RW8tktX8a8i1smw1+WI5LWU8CQBgQ
         n48jH5tzb8DZBC1rIbw/yvvxTc8yj3GH0YwO6TaSIAoKJs6IRUgrZiBRiVqtJVBwqhu8
         mG8Sp4aFt4bU+BXnW/Lt9d1CrRSAqMjIpJqFr4/d78lHFcrR03XvPqVODIbyXL8ToGsl
         9QTNlgaGJ0OWye6fe/wWuWYKP05jhhGEWlTLEWPRxC94x1139IiubJu/Aq7e73oTqCbc
         0XqA0kpUdwBK8i7P9i4CKsn7DROdC4AY9g717Xx39V24XnUseyqYTorxYrOhtnGAZsx8
         B5+Q==
X-Gm-Message-State: AOAM532/MaYGRaOxq7hzC//TWzjmQJS6/uWDpamj0gXbDmgA34hjiKxZ
        2P5n3qa8kQUQ3UQ+APRYmf8=
X-Google-Smtp-Source: ABdhPJzV1rx8RtvwHyFoFr3eKvRq1+P1TRtoOr9D3J1i2CnwGAm1Rn7Kn668qKjF7xH76RPwGhkNrA==
X-Received: by 2002:a17:902:7293:: with SMTP id d19mr557146pll.303.1597372913600;
        Thu, 13 Aug 2020 19:41:53 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id z29sm7329263pfj.182.2020.08.13.19.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 19:41:52 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Emil Velikov <emil.velikov@collabora.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 12/19] drm/msm: Drop context arg to gpu->submit()
Date:   Thu, 13 Aug 2020 19:41:07 -0700
Message-Id: <20200814024114.1177553-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jordan Crouse <jcrouse@codeaurora.org>

Now that we can get the ctx from the submitqueue, the extra arg is
redundant.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
[split out of previous patch to reduce churny noise]
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 12 +++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  5 ++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 ++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +--
 drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c           |  9 ++++-----
 drivers/gpu/drm/msm/msm_gpu.h           |  6 ++----
 7 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 9e63a190642c..eff2439ea57b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -43,8 +43,7 @@ static void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 		gpu_write(gpu, REG_A5XX_CP_RB_WPTR, wptr);
 }
 
-static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-	struct msm_file_private *ctx)
+static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	struct msm_drm_private *priv = gpu->dev->dev_private;
 	struct msm_ringbuffer *ring = submit->ring;
@@ -57,7 +56,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (priv->lastctx == ctx)
+			if (priv->lastctx == submit->queue->ctx)
 				break;
 			/* fall-thru */
 		case MSM_SUBMIT_CMD_BUF:
@@ -103,8 +102,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 	msm_gpu_retire(gpu);
 }
 
-static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-	struct msm_file_private *ctx)
+static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
@@ -114,7 +112,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 
 	if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
 		priv->lastctx = NULL;
-		a5xx_submit_in_rb(gpu, submit, ctx);
+		a5xx_submit_in_rb(gpu, submit);
 		return;
 	}
 
@@ -148,7 +146,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (priv->lastctx == ctx)
+			if (priv->lastctx == submit->queue->ctx)
 				break;
 			/* fall-thru */
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c5a3e4d4c007..5eabb0109577 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -81,8 +81,7 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 	OUT_RING(ring, upper_32_bits(iova));
 }
 
-static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-	struct msm_file_private *ctx)
+static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
 	struct msm_drm_private *priv = gpu->dev->dev_private;
@@ -115,7 +114,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (priv->lastctx == ctx)
+			if (priv->lastctx == submit->queue->ctx)
 				break;
 			/* fall-thru */
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d2dbb6968cba..533a34b4cce2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -457,8 +457,7 @@ void adreno_recover(struct msm_gpu *gpu)
 	}
 }
 
-void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-		struct msm_file_private *ctx)
+void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct msm_drm_private *priv = gpu->dev->dev_private;
@@ -472,7 +471,7 @@ void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			/* ignore if there has not been a ctx switch: */
-			if (priv->lastctx == ctx)
+			if (priv->lastctx == submit->queue->ctx)
 				break;
 			/* fall-thru */
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e55abae365b5..848632758450 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -269,8 +269,7 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 		const struct firmware *fw, u64 *iova);
 int adreno_hw_init(struct msm_gpu *gpu);
 void adreno_recover(struct msm_gpu *gpu);
-void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-		struct msm_file_private *ctx);
+void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
 void adreno_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 bool adreno_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 1464b04d25d3..aa5c60a7132d 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -785,7 +785,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		}
 	}
 
-	msm_gpu_submit(gpu, submit, ctx);
+	msm_gpu_submit(gpu, submit);
 
 	args->fence = submit->fence->seqno;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 806eb0957280..e1a3cbe25a0c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -520,7 +520,7 @@ static void recover_worker(struct work_struct *work)
 			struct msm_ringbuffer *ring = gpu->rb[i];
 
 			list_for_each_entry(submit, &ring->submits, node)
-				gpu->funcs->submit(gpu, submit, NULL);
+				gpu->funcs->submit(gpu, submit);
 		}
 	}
 
@@ -747,8 +747,7 @@ void msm_gpu_retire(struct msm_gpu *gpu)
 }
 
 /* add bo's to gpu's ring, and kick gpu: */
-void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-		struct msm_file_private *ctx)
+void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	struct drm_device *dev = gpu->dev;
 	struct msm_drm_private *priv = dev->dev_private;
@@ -788,8 +787,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 			msm_gem_move_to_active(&msm_obj->base, gpu, false, submit->fence);
 	}
 
-	gpu->funcs->submit(gpu, submit, ctx);
-	priv->lastctx = ctx;
+	gpu->funcs->submit(gpu, submit);
+	priv->lastctx = submit->queue->ctx;
 
 	hangcheck_timer_reset(gpu);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 97c527e98391..1f96ac0d9049 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -45,8 +45,7 @@ struct msm_gpu_funcs {
 	int (*hw_init)(struct msm_gpu *gpu);
 	int (*pm_suspend)(struct msm_gpu *gpu);
 	int (*pm_resume)(struct msm_gpu *gpu);
-	void (*submit)(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-			struct msm_file_private *ctx);
+	void (*submit)(struct msm_gpu *gpu, struct msm_gem_submit *submit);
 	void (*flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 	irqreturn_t (*irq)(struct msm_gpu *irq);
 	struct msm_ringbuffer *(*active_ring)(struct msm_gpu *gpu);
@@ -290,8 +289,7 @@ int msm_gpu_perfcntr_sample(struct msm_gpu *gpu, uint32_t *activetime,
 		uint32_t *totaltime, uint32_t ncntrs, uint32_t *cntrs);
 
 void msm_gpu_retire(struct msm_gpu *gpu);
-void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-		struct msm_file_private *ctx);
+void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
 
 int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
-- 
2.26.2

