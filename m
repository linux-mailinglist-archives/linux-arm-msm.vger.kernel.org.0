Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2C941F3FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 19:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355541AbhJAR4J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 13:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355544AbhJAR4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 13:56:08 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095AFC06177E;
        Fri,  1 Oct 2021 10:54:24 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id rj12-20020a17090b3e8c00b0019f88e44d85so835884pjb.4;
        Fri, 01 Oct 2021 10:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WijmcktACKFwEThmhwnPp+mV0haFkJxchOIO2eO1rSQ=;
        b=WSsj1pxgWkF/FGiyRxBKDHPZDgH4E91EaVDkQMyMciD9zBGBNTlqpNeSKKR+qXu0KY
         qVcUsp/4VaVMNmxswoIWN2UmJKr/LGmzda+OWDl7dBOuenzb2JpXRzNLlUsotflsrLIu
         e/wuDgihcunryT8sdklYp0ippNPwJ26zkTqPg1c+FlbGtjsxalBPtI9mPZt5WWF0g8NS
         yY3CyhFzyeyMSUG7YdAsTIGKjqMpkMs/K5bvOB8a/CXOAyVCL68ILUH8aQZ5DUR/CbUq
         in46ZV+NSnQDzR8ndPjllW+vs5qmovoaF0fWRwgloAoXyFhy/PClN5lSxdPX/3IithCY
         3KKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WijmcktACKFwEThmhwnPp+mV0haFkJxchOIO2eO1rSQ=;
        b=2ZxhQjcGUaksjMh2BX+duEV3+UgRc1lEmcL1LhajQ5OJMLG0oHQakgQDO1pnMT8N9Z
         E2y2wajnGxabSacNFJf8G9rnMrTdXGI+R2o3bO6ou6EgDIqT8iqRU3ZY5rYYjDUiIHt3
         HiOMzuWis55BBI1JIPf5/Q6YkbrnYaAxDVGh9g+2aB2IdUg5ACuMdc7DuI8ipRAyj7BZ
         fdoTrzOWiN32QK7KGtEjBDUgzRy92AzToeUrLxoYu8bii26yJqjSIznMnmxQve3ZyvSU
         tibYbCfY1F2Okg+vaoAW/jM5XE9tPDYxmJApzE0NN0OuEJ+lcFBEVec+5/qz1q+0pyi8
         Rvuw==
X-Gm-Message-State: AOAM5327UbgDjWEsIWudZuO9lrn7jWSVqYJNHadvjj0IDH5WNfRUrjCR
        Q+rQzuLOvs2Aly29wJEH9rc=
X-Google-Smtp-Source: ABdhPJylLrNqMCSmC4UBIErBI5OOeZTxVS9YD4cdHfPykk8Yd9a4fvIclaYGI3ggMjjnZpZcJ+ZeuQ==
X-Received: by 2002:a17:90a:b105:: with SMTP id z5mr20742268pjq.64.1633110863551;
        Fri, 01 Oct 2021 10:54:23 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id fz20sm3399620pjb.31.2021.10.01.10.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 10:54:22 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: One sched entity per process per priority
Date:   Fri,  1 Oct 2021 10:58:56 -0700
Message-Id: <20211001175857.1324712-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211001175857.1324712-1-robdclark@gmail.com>
References: <20211001175857.1324712-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Some userspace apps make assumptions that rendering against multiple
contexts within the same process (from the same thread, with appropriate
MakeCurrent() calls) provides sufficient synchronization without any
external synchronization (ie. glFenceSync()/glWaitSync()).  Since a
submitqueue maps to a gl/vk context, having multiple sched entities of
the same priority only works with implicit sync enabled.

To fix this, limit things to a single sched entity per priority level
per process.

An alternative would be sharing submitqueues between contexts in
userspace, but tracking of per-context faults (ie. GL_EXT_robustness)
is already done at the submitqueue level, so this is not an option.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Unfortunately, due to a finch experiment (a sort of A/B experiment)
all my testing of the drm/scheduler with chrome(ium) was using
SkiaRenderer which does not trigger this bug.  It wasn't until folks
started reporting misrendering on dev channel, and I tracked it down
to legacy GLRenderer vs SkiaRenderer, that I realized the problem :-(

 drivers/gpu/drm/msm/msm_gem_submit.c  |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h         | 24 ++++++----
 drivers/gpu/drm/msm/msm_submitqueue.c | 68 +++++++++++++++++++++++----
 3 files changed, 74 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 924b01b9c105..34ed56b24224 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -46,7 +46,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	if (!submit)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drm_sched_job_init(&submit->base, &queue->entity, queue);
+	ret = drm_sched_job_init(&submit->base, queue->entity, queue);
 	if (ret) {
 		kfree(submit);
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 592334cb9a0b..d72b1de3cb1f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -290,6 +290,19 @@ struct msm_file_private {
 	struct msm_gem_address_space *aspace;
 	struct kref ref;
 	int seqno;
+
+	/**
+	 * entities:
+	 *
+	 * Table of per-priority-level sched entities used by submitqueues
+	 * associated with this &drm_file.  Because some userspace apps
+	 * make assumptions about rendering from multiple gl contexts
+	 * (of the same priority) within the process happening in FIFO
+	 * order without requiring any fencing beyond MakeCurrent(), we
+	 * create at most one &drm_sched_entity per-process per-priority-
+	 * level.
+	 */
+	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 };
 
 /**
@@ -370,7 +383,7 @@ struct msm_gpu_submitqueue {
 	struct idr fence_idr;
 	struct mutex lock;
 	struct kref ref;
-	struct drm_sched_entity entity;
+	struct drm_sched_entity *entity;
 };
 
 struct msm_gpu_state_bo {
@@ -471,14 +484,7 @@ void msm_submitqueue_close(struct msm_file_private *ctx);
 
 void msm_submitqueue_destroy(struct kref *kref);
 
-static inline void __msm_file_private_destroy(struct kref *kref)
-{
-	struct msm_file_private *ctx = container_of(kref,
-		struct msm_file_private, ref);
-
-	msm_gem_address_space_put(ctx->aspace);
-	kfree(ctx);
-}
+void __msm_file_private_destroy(struct kref *kref);
 
 static inline void msm_file_private_put(struct msm_file_private *ctx)
 {
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 7ce0771b5582..b8621c6e0554 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -7,6 +7,24 @@
 
 #include "msm_gpu.h"
 
+void __msm_file_private_destroy(struct kref *kref)
+{
+	struct msm_file_private *ctx = container_of(kref,
+		struct msm_file_private, ref);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->entities); i++) {
+		if (!ctx->entities[i])
+			continue;
+
+		drm_sched_entity_destroy(ctx->entities[i]);
+		kfree(ctx->entities[i]);
+	}
+
+	msm_gem_address_space_put(ctx->aspace);
+	kfree(ctx);
+}
+
 void msm_submitqueue_destroy(struct kref *kref)
 {
 	struct msm_gpu_submitqueue *queue = container_of(kref,
@@ -14,8 +32,6 @@ void msm_submitqueue_destroy(struct kref *kref)
 
 	idr_destroy(&queue->fence_idr);
 
-	drm_sched_entity_destroy(&queue->entity);
-
 	msm_file_private_put(queue->ctx);
 
 	kfree(queue);
@@ -61,13 +77,47 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
 	}
 }
 
+static struct drm_sched_entity *
+get_sched_entity(struct msm_file_private *ctx, struct msm_ringbuffer *ring,
+		 unsigned ring_nr, enum drm_sched_priority sched_prio)
+{
+	static DEFINE_MUTEX(entity_lock);
+	unsigned idx = (ring_nr * NR_SCHED_PRIORITIES) + sched_prio;
+
+	/* We should have already validated that the requested priority is
+	 * valid by the time we get here.
+	 */
+	if (WARN_ON(idx >= ARRAY_SIZE(ctx->entities)))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&entity_lock);
+
+	if (!ctx->entities[idx]) {
+		struct drm_sched_entity *entity;
+		struct drm_gpu_scheduler *sched = &ring->sched;
+		int ret;
+
+		entity = kzalloc(sizeof(*ctx->entities[idx]), GFP_KERNEL);
+
+		ret = drm_sched_entity_init(entity, sched_prio, &sched, 1, NULL);
+		if (ret) {
+			kfree(entity);
+			return ERR_PTR(ret);
+		}
+
+		ctx->entities[idx] = entity;
+	}
+
+	mutex_unlock(&entity_lock);
+
+	return ctx->entities[idx];
+}
+
 int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 		u32 prio, u32 flags, u32 *id)
 {
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
-	struct msm_ringbuffer *ring;
-	struct drm_gpu_scheduler *sched;
 	enum drm_sched_priority sched_prio;
 	unsigned ring_nr;
 	int ret;
@@ -91,12 +141,10 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	queue->flags = flags;
 	queue->ring_nr = ring_nr;
 
-	ring = priv->gpu->rb[ring_nr];
-	sched = &ring->sched;
-
-	ret = drm_sched_entity_init(&queue->entity,
-			sched_prio, &sched, 1, NULL);
-	if (ret) {
+	queue->entity = get_sched_entity(ctx, priv->gpu->rb[ring_nr],
+					 ring_nr, sched_prio);
+	if (IS_ERR(queue->entity)) {
+		ret = PTR_ERR(queue->entity);
 		kfree(queue);
 		return ret;
 	}
-- 
2.31.1

