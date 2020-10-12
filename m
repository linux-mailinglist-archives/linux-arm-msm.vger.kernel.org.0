Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6070328ABFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbgJLCKS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729687AbgJLCJX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:23 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A126BC0613D0;
        Sun, 11 Oct 2020 19:09:22 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id e10so12144488pfj.1;
        Sun, 11 Oct 2020 19:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZyL5oO8OrN2wimj2udT1EhCNNwPm13wKBqPVtQcCgb8=;
        b=e46AKw7Ja86lF+PzViNHSEmngqxbLCrq7srlRybORCfJElIQ2kLMnDSAcpnXQWVLWA
         39JlDDqryd6+vnF2vvZixwyBsdxevuSUwxU+ZZWH93rvpIZZOuhE59u0VwA/fUYMcABZ
         IvIZLoMXqJkd0zadNWxxPYJ0MQOSb5cxDIZzjg8PR/rSX8/Uwy8+VNbRETTmW4v8/qjG
         +YDTbMxap3bltcYUcdHDePFb+bJstz9r6YSoxr5h22kmUS4vfc3GwOUg7hdNdeSdRg4m
         /yR3qfEhSD5TKj8bea+FV6rJ0qlAsZKJ2Xa4lorrzXRJFVrkyHLNzQoxLVSlb3nAqqBI
         LP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZyL5oO8OrN2wimj2udT1EhCNNwPm13wKBqPVtQcCgb8=;
        b=EcwKjltHe9anP3K38kJYVfgxFt2DC4Z/ucz6AHESu3dXwkroEAuW5wm2e0XbhUoj+J
         bpa2D3MwwXDh3sq8T5a4mIuZObovOoBMkXX91d58imxXK3OoiuMfX0R4ksSY+btrNKsZ
         4cJE1rs+KGWrH17I4jGK8mrn2ZgGf/9Bf003YiWFezuFHHdzJhe0RevA+ZVXx/GC98Gn
         y10s9IrXY6zWvTK2RaASUiErEpG4nk6XY5UtVmsoTt7zFplp7MH/kXglDcewknjk1BH0
         v6u8IZGYnTn24/BNHvybNhmksCGPWQ5BZuwjPKNc+dN8kZvHK25O+bg4No9KIFNQ1CFL
         Lklw==
X-Gm-Message-State: AOAM533GjjZDmhjj2k2qP7EVWt4SU758j5wqeRlBxQP0mrJWcAgZ6gX7
        qmwC6jc9dhmS7fg1Ox1ou2pOkp7cE1ntLoJZ
X-Google-Smtp-Source: ABdhPJxHXz9/ZXrNkq8BOQH2/sjUdcP8edWZlDkMalRmfx6hLdR2t36zB1O0lUNSY0tSJSgoIe9VEw==
X-Received: by 2002:a17:90a:109:: with SMTP id b9mr17897165pjb.35.1602468562114;
        Sun, 11 Oct 2020 19:09:22 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id c12sm17267726pgd.57.2020.10.11.19.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:20 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 14/22] drm/msm: Protect ring->submits with it's own lock
Date:   Sun, 11 Oct 2020 19:09:41 -0700
Message-Id: <20201012020958.229288-15-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

One less place to rely on dev->struct_mutex.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c |  2 ++
 drivers/gpu/drm/msm/msm_gpu.c        | 37 ++++++++++++++++++++++------
 drivers/gpu/drm/msm/msm_ringbuffer.c |  1 +
 drivers/gpu/drm/msm/msm_ringbuffer.h |  6 +++++
 4 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 35b7d9d06850..a91c1b99db97 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -65,7 +65,9 @@ void msm_gem_submit_free(struct msm_gem_submit *submit)
 	unsigned i;
 
 	dma_fence_put(submit->fence);
+	spin_lock(&submit->ring->submit_lock);
 	list_del(&submit->node);
+	spin_unlock(&submit->ring->submit_lock);
 	put_pid(submit->pid);
 	msm_submitqueue_put(submit->queue);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index e5b7c8a77c99..bb904e467b24 100644
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

