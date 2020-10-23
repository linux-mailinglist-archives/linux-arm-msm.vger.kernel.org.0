Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CABC297547
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461416AbgJWQwA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752786AbgJWQut (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:49 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED48C0613CE;
        Fri, 23 Oct 2020 09:50:49 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l18so1712533pgg.0;
        Fri, 23 Oct 2020 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tZaC8+l7T3Nn2nFuFk4PV5zbgmowHmgwiXHAwS8vo7M=;
        b=nlevXG4zCVJI8V0UPq4ltCHXYoKr6nNJoyEhrMcrJLaeU54hj8E7fiztUQJY/UYKCH
         Mpi9Wr71K6eir4ZPqC0tGuE1tkpLcIc8wdMGj3ahZdnb32NUQHkYRb1GMmvEFn19LR/n
         K8AZbTTpRlmTwHURyhqVIScRHztSS0lDKdnAhTxDuhT0kB3HTnmvVPOIkTTteEVA/zfZ
         CUSaBjfrNUOT2CQn/Y+zzQRS6zxCdecdMpFT4V1q1TcHpDGaYmTAoOfCOWyD+81gugjF
         uuzJnFiA5giDRwbL8PZ6Wnzg9qDC5LTACPD+OXDmEJwjcE6shYHUP20W8Nqs2vF6PvM4
         cnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tZaC8+l7T3Nn2nFuFk4PV5zbgmowHmgwiXHAwS8vo7M=;
        b=HcjHVtdeU5OW/8b9XNxZt/WkhCi6QjK2+DeAXXhv3rHGEjCEmROgbSQk5ccx4mTu2t
         7nqJY4J480b5xtSKg/AjzFmQvifXyGMNEtt8U3p3Qz/0N0LPam6RdCqaCT/NNKsu4M1y
         ODcNQsrkdi54Afsia6D2boTwFbQkhcKE5CSBnUoBxeRYsmD95T5erCB8yfCiMgMInoU4
         OG96vHJDI96h0NtabE1PjHJHW/MihCDi77rmG5JiKpT1Y+4Z7UDm9gX5QV7ReyQ/9i/v
         +k4C1GSE0Y+/AxWlMqXY59cRpZz2b0rKua9+0rshOA1TmqGKSEcuahPhYfxwfuxwITV2
         4OMw==
X-Gm-Message-State: AOAM532Mp/GUU/A4YDPtIN5Oh5z/clrvQHIONscX30sBxkLMCMxQaZNu
        BDHTLftNT0GNQcgObQKaECw=
X-Google-Smtp-Source: ABdhPJz96X6LN2zav2wrpyLoty6EfWTFbVNefeVp8ZTXAb/lEIaTBZ5Dr55kZA6q2CbWuMnsH+mr9Q==
X-Received: by 2002:a63:3c5c:: with SMTP id i28mr2870584pgn.166.1603471848608;
        Fri, 23 Oct 2020 09:50:48 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id b20sm2517848pft.55.2020.10.23.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:47 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 15/23] drm/msm: Protect ring->submits with it's own lock
Date:   Fri, 23 Oct 2020 09:51:16 -0700
Message-Id: <20201023165136.561680-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

One less place to rely on dev->struct_mutex.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c |  2 ++
 drivers/gpu/drm/msm/msm_gpu.c        | 37 ++++++++++++++++++++++------
 drivers/gpu/drm/msm/msm_ringbuffer.c |  1 +
 drivers/gpu/drm/msm/msm_ringbuffer.h |  6 +++++
 4 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 044e9bee70a2..24ce4c65429d 100644
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
index 1667d8066897..1d6f3dc3fe78 100644
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
@@ -432,11 +434,14 @@ find_submit(struct msm_ringbuffer *ring, uint32_t fence)
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
@@ -533,8 +538,10 @@ static void recover_worker(struct work_struct *work)
 		for (i = 0; i < gpu->nr_rings; i++) {
 			struct msm_ringbuffer *ring = gpu->rb[i];
 
+			spin_lock(&ring->submit_lock);
 			list_for_each_entry(submit, &ring->submits, node)
 				gpu->funcs->submit(gpu, submit);
+			spin_unlock(&ring->submit_lock);
 		}
 	}
 
@@ -721,7 +728,6 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 static void retire_submits(struct msm_gpu *gpu)
 {
 	struct drm_device *dev = gpu->dev;
-	struct msm_gem_submit *submit, *tmp;
 	int i;
 
 	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
@@ -730,9 +736,24 @@ static void retire_submits(struct msm_gpu *gpu)
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
@@ -775,7 +796,9 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
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

