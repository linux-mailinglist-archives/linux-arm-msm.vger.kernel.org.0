Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B7D282D29
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 21:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgJDTVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 15:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgJDTVW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 15:21:22 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFCA7C0613CE;
        Sun,  4 Oct 2020 12:21:22 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id t14so4331969pgl.10;
        Sun, 04 Oct 2020 12:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7GbehqZxHly6cnVxFoKIhKffwo2k+nv7HJD+E3LcZlE=;
        b=eXvFIIsRblrS91tGMUAHOiHmASSkIoz7GLsHPVGpy+8MmbMNw3LqPRwtXc4ee5rAyy
         QuNHRaV+SVBz2r4heXKDntOu8c06j0wk8u/ebrUgU1Sn0FsrcEG4T5syiv8EiNifqfLL
         kMbJQXbnoZZldOHLToj2aNkR1zVt9lBUsorNyJ6tqnzYJAx4/UwSxpvrGY59RtLkbtvA
         dT54KjKzLvAjCKOBhwQnTvYY8abrn44W9BmwO+N0J15BFBi4RX90lXN6fJuR+KuIozHE
         qfoGEH0t0QnwHD+O5TgISqGOmWOqXcMHi2hRL72IVX/t2x5cp3tLTY54Zs90YJZZ6u23
         VY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7GbehqZxHly6cnVxFoKIhKffwo2k+nv7HJD+E3LcZlE=;
        b=NJuVmJMmON94AxHSNnE5Lx1YcdQszV2OMK+HJJUBn2pxvAzhlg4s497oEuj0nD1cbK
         hi4YZ3BioDV7+mktoIdFv03SQk6+mn0dtxE1NLiYtgCJHc64GDfxPSdL64EMnpXNhjtv
         CE53SNdwcX39EPaE5UgwQ3C6NBoj9Jw9YuCV24yrTZxc3oEszlGtLU7W+cv43bRhiFtJ
         cfXU5VwsF47MUH0JELhjEI28RmxBXS7/DXNT+lOsYpDCo2kZZIEu2B3oaKaQB19VQmaF
         aeCvshiiY5N64URzvdohPAbJnFIUR1N1JKrX+cmK9fxgJidKNRR+ruU+ZM8pRyv6RVNg
         O52Q==
X-Gm-Message-State: AOAM530KXu00fOEeWH38GgqdhjXF9IenNVa4hI1VJheChabcNcHiO2z/
        dm/R8JYd94MBwHUfwlPbnh4=
X-Google-Smtp-Source: ABdhPJzbBTRnB5IuDLoELVjYGojcRVOVm6VqyNSlMSWzK1wAMuYb1n1eEcDK4DNKeJgbFWcu25aK3A==
X-Received: by 2002:a65:66da:: with SMTP id c26mr6302332pgw.362.1601839282251;
        Sun, 04 Oct 2020 12:21:22 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id 16sm7964168pjl.27.2020.10.04.12.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 12:21:21 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 06/14] drm/msm: Protect ring->submits with it's own lock
Date:   Sun,  4 Oct 2020 12:21:38 -0700
Message-Id: <20201004192152.3298573-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

One less place to rely on dev->struct_mutex.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c |  2 ++
 drivers/gpu/drm/msm/msm_gpu.c        | 37 ++++++++++++++++++++++------
 drivers/gpu/drm/msm/msm_ringbuffer.c |  1 +
 drivers/gpu/drm/msm/msm_ringbuffer.h |  6 +++++
 4 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index aa5c60a7132d..e1d1f005b3d4 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -63,7 +63,9 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 void msm_gem_submit_free(struct msm_gem_submit *submit)
 {
 	dma_fence_put(submit->fence);
+	spin_lock(&submit->ring->submit_lock);
 	list_del(&submit->node);
+	spin_unlock(&submit->ring->submit_lock);
 	put_pid(submit->pid);
 	msm_submitqueue_put(submit->queue);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index ca8c95b32c8b..8d1e254f964a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -270,6 +270,7 @@ static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 {
 	struct msm_gem_submit *submit;
 
+	spin_lock(&ring->submit_lock);
 	list_for_each_entry(submit, &ring->submits, node) {
 		if (submit->seqno > fence)
 			break;
@@ -277,6 +278,7 @@ static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 		msm_update_fence(submit->ring->fctx,
 			submit->fence->seqno);
 	}
+	spin_unlock(&ring->submit_lock);
 }
 
 #ifdef CONFIG_DEV_COREDUMP
@@ -430,11 +432,14 @@ find_submit(struct msm_ringbuffer *ring, uint32_t fence)
 {
 	struct msm_gem_submit *submit;
 
-	WARN_ON(!mutex_is_locked(&ring->gpu->dev->struct_mutex));
-
-	list_for_each_entry(submit, &ring->submits, node)
-		if (submit->seqno == fence)
+	spin_lock(&ring->submit_lock);
+	list_for_each_entry(submit, &ring->submits, node) {
+		if (submit->seqno == fence) {
+			spin_unlock(&ring->submit_lock);
 			return submit;
+		}
+	}
+	spin_unlock(&ring->submit_lock);
 
 	return NULL;
 }
@@ -523,8 +528,10 @@ static void recover_worker(struct work_struct *work)
 		for (i = 0; i < gpu->nr_rings; i++) {
 			struct msm_ringbuffer *ring = gpu->rb[i];
 
+			spin_lock(&ring->submit_lock);
 			list_for_each_entry(submit, &ring->submits, node)
 				gpu->funcs->submit(gpu, submit);
+			spin_unlock(&ring->submit_lock);
 		}
 	}
 
@@ -711,7 +718,6 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 static void retire_submits(struct msm_gpu *gpu)
 {
 	struct drm_device *dev = gpu->dev;
-	struct msm_gem_submit *submit, *tmp;
 	int i;
 
 	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
@@ -720,9 +726,24 @@ static void retire_submits(struct msm_gpu *gpu)
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
 
-		list_for_each_entry_safe(submit, tmp, &ring->submits, node) {
-			if (dma_fence_is_signaled(submit->fence))
+		while (true) {
+			struct msm_gem_submit *submit = NULL;
+
+			spin_lock(&ring->submit_lock);
+			submit = list_first_entry_or_null(&ring->submits,
+					struct msm_gem_submit, node);
+			spin_unlock(&ring->submit_lock);
+
+			/*
+			 * If no submit, we are done.  If submit->fence hasn't
+			 * been signalled, then later submits are not signalled
+			 * either, so we are also done.
+			 */
+			if (submit && dma_fence_is_signaled(submit->fence)) {
 				retire_submit(gpu, ring, submit);
+			} else {
+				break;
+			}
 		}
 	}
 }
@@ -765,7 +786,9 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	submit->seqno = ++ring->seqno;
 
+	spin_lock(&ring->submit_lock);
 	list_add_tail(&submit->node, &ring->submits);
+	spin_unlock(&ring->submit_lock);
 
 	msm_rd_dump_submit(priv->rd, submit, NULL);
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 1b6958e908dc..4d2a2a4abef8 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -46,6 +46,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	ring->memptrs_iova = memptrs_iova;
 
 	INIT_LIST_HEAD(&ring->submits);
+	spin_lock_init(&ring->submit_lock);
 	spin_lock_init(&ring->preempt_lock);
 
 	snprintf(name, sizeof(name), "gpu-ring-%d", ring->id);
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 4956d1bc5d0e..fe55d4a1aa16 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -39,7 +39,13 @@ struct msm_ringbuffer {
 	int id;
 	struct drm_gem_object *bo;
 	uint32_t *start, *end, *cur, *next;
+
+	/*
+	 * List of in-flight submits on this ring.  Protected by submit_lock.
+	 */
 	struct list_head submits;
+	spinlock_t submit_lock;
+
 	uint64_t iova;
 	uint32_t seqno;
 	uint32_t hangcheck_fence;
-- 
2.26.2

