Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46FB259A51
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 18:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730251AbgIAQqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 12:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729171AbgIAQqg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 12:46:36 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D53FC061247;
        Tue,  1 Sep 2020 09:46:36 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mm21so901876pjb.4;
        Tue, 01 Sep 2020 09:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2liumjG+7/DHabFJ1OVqIZ4d6sswHHCz0LQDjQhDWhY=;
        b=C20tEzs8cI1H5PWiGg7J6Kjt3dMuz4+iyz56eppjCZaUo+/nLcDmNVBSysjSmXR9MJ
         O5Dx3v1bteUe0y/A49OPZxOSqu/z0kM9BdIdemL6ZbLMU641IiYVpatlN5HEZGIJHrjf
         OPumT0M4psa//xyxK4VWjGxkiqHel7QA2TyIZip2qUIjGJoTnL4jXTSGDHJCfwktAoSh
         6argkZidvJ2KXJV83LigiE/qzq/lfm2JSx8Vj3zF+Yg1RnsmK8bhCs7WWdbWI0HQz1Di
         HwDJ7f2xiXpVeEoCK62ngnCL7P/LUMJo+H5yZRN7psT57RB0Eoj3v4J6+lKK2g6Df87H
         YwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2liumjG+7/DHabFJ1OVqIZ4d6sswHHCz0LQDjQhDWhY=;
        b=BrdZUQmMeKw6Z1YX31EYksXXoDzkczRKK3CCxF11V+2BAuq/M9B+CO1LtWA2AnWwt7
         el1BcJltfsZ3+ODUr4HR22E8qV7jqGBuv1OXN4TmHqcYRxRH4jIfKLZqrANzSrnnXPfq
         Q5OliQp+VeY5LnniIvCAVcoMopY20dgm1xQ80j87kFiDtMUVolf7HUVK+k2dZxQ3iaXH
         lm0xFgsVhMiG4DD0Pa+YqYM+MRtrrgMgzCoq10yg/WenJYpOHVz8oFCI1J3x//8Rqc5t
         5/sD3PHpANfJKVCDr67qHgB/1gxPERE2O/LQY3OCJxeXDFjs8OF4lO4cWdoHF9TGN7QU
         /Pjg==
X-Gm-Message-State: AOAM5308quiIymDU+FOAOPsfGdXrW/OQDfLQaMkc8rYr28SLSsnNUrNm
        sWiO/70dTldoWqGc95m6xFM=
X-Google-Smtp-Source: ABdhPJxNThLmHXZCNlUm17Utzn//s/mjDY83Fykyc8blnjX/mneV7FWFBAjkw40Nltmm9C5ej2jfZw==
X-Received: by 2002:a17:902:758d:: with SMTP id j13mr1256122pll.174.1598978795601;
        Tue, 01 Sep 2020 09:46:35 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id 9sm2548653pfv.22.2020.09.01.09.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 09:46:34 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v16 05/20] drm/msm: Add a context pointer to the submitqueue
Date:   Tue,  1 Sep 2020 09:46:22 -0700
Message-Id: <20200901164707.2645413-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jordan Crouse <jcrouse@codeaurora.org>

Each submitqueue is attached to a context. Add a pointer to the
context to the submitqueue at create time and refcount it so
that it stays around through the life of the queue.

Co-developed-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c         |  3 ++-
 drivers/gpu/drm/msm/msm_drv.h         | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem.h         |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c  |  6 +++---
 drivers/gpu/drm/msm/msm_gpu.h         |  1 +
 drivers/gpu/drm/msm/msm_submitqueue.c |  3 +++
 6 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 79333842f70a..75cd7639f560 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -594,6 +594,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	if (!ctx)
 		return -ENOMEM;
 
+	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
 	ctx->aspace = priv->gpu ? priv->gpu->aspace : NULL;
@@ -615,7 +616,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 static void context_close(struct msm_file_private *ctx)
 {
 	msm_submitqueue_close(ctx);
-	kfree(ctx);
+	msm_file_private_put(ctx);
 }
 
 static void msm_postclose(struct drm_device *dev, struct drm_file *file)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index af259b0573ea..4561bfb5e745 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -57,6 +57,7 @@ struct msm_file_private {
 	struct list_head submitqueues;
 	int queueid;
 	struct msm_gem_address_space *aspace;
+	struct kref ref;
 };
 
 enum msm_mdp_plane_property {
@@ -428,6 +429,25 @@ void msm_submitqueue_close(struct msm_file_private *ctx);
 
 void msm_submitqueue_destroy(struct kref *kref);
 
+static inline void __msm_file_private_destroy(struct kref *kref)
+{
+	struct msm_file_private *ctx = container_of(kref,
+		struct msm_file_private, ref);
+
+	kfree(ctx);
+}
+
+static inline void msm_file_private_put(struct msm_file_private *ctx)
+{
+	kref_put(&ctx->ref, __msm_file_private_destroy);
+}
+
+static inline struct msm_file_private *msm_file_private_get(
+	struct msm_file_private *ctx)
+{
+	kref_get(&ctx->ref);
+	return ctx;
+}
 
 #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
 #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 972490b14ba5..9c573c4269cb 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -142,6 +142,7 @@ struct msm_gem_submit {
 	bool valid;         /* true if no cmdstream patching needed */
 	bool in_rb;         /* "sudo" mode, copy cmds into RB */
 	struct msm_ringbuffer *ring;
+	struct msm_file_private *ctx;
 	unsigned int nr_cmds;
 	unsigned int nr_bos;
 	u32 ident;	   /* A "identifier" for the submit for logging */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 8cb9aa15ff90..1464b04d25d3 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -27,7 +27,7 @@
 #define BO_PINNED   0x2000
 
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
-		struct msm_gpu *gpu, struct msm_gem_address_space *aspace,
+		struct msm_gpu *gpu,
 		struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
 		uint32_t nr_cmds)
 {
@@ -43,7 +43,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return NULL;
 
 	submit->dev = dev;
-	submit->aspace = aspace;
+	submit->aspace = queue->ctx->aspace;
 	submit->gpu = gpu;
 	submit->fence = NULL;
 	submit->cmd = (void *)&submit->bos[nr_bos];
@@ -677,7 +677,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		}
 	}
 
-	submit = submit_create(dev, gpu, ctx->aspace, queue, args->nr_bos,
+	submit = submit_create(dev, gpu, queue, args->nr_bos,
 		args->nr_cmds);
 	if (!submit) {
 		ret = -ENOMEM;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index f91b141add75..97c527e98391 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -190,6 +190,7 @@ struct msm_gpu_submitqueue {
 	u32 flags;
 	u32 prio;
 	int faults;
+	struct msm_file_private *ctx;
 	struct list_head node;
 	struct kref ref;
 };
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 90c9d84e6155..c3d206105d28 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -12,6 +12,8 @@ void msm_submitqueue_destroy(struct kref *kref)
 	struct msm_gpu_submitqueue *queue = container_of(kref,
 		struct msm_gpu_submitqueue, ref);
 
+	msm_file_private_put(queue->ctx);
+
 	kfree(queue);
 }
 
@@ -83,6 +85,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	write_lock(&ctx->queuelock);
 
+	queue->ctx = msm_file_private_get(ctx);
 	queue->id = ctx->queueid++;
 
 	if (id)
-- 
2.26.2

