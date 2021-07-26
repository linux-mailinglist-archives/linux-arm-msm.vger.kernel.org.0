Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC3EC3D5BE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 16:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234726AbhGZN7a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 09:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234620AbhGZN7Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 09:59:25 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1064BC061757;
        Mon, 26 Jul 2021 07:39:54 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d17so11808473plh.10;
        Mon, 26 Jul 2021 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IjQ9wQWspnQkFdYFJ7LxUdrGqhSWixun2cM2wAqPIaE=;
        b=Nbhl0cP15qUq4g7eGUHFnl/XoxR7cAuclhMqL1Z2TZ5q/okIx0+N0OMGJlSQYZhmZm
         ut0GubEkqZl9hbAMV8mD9IKACyNvW+wT6mje5voGcVOdJ9vwjO7IjiQ0fNsxTQkhChZj
         LjJUI8qZ+ecUXrveh8C+DA2YS9aGm1j5YyEhED+IlKsOlhXYqLOHXbNjgvSTxNYDW/zP
         VgsMkFxfBIEKG4hikJ9rO2uyqfUESi4PdStuhdtDbNSlSbrpTnBIznG2bF0lZp5X6Nem
         HEq1D68YGqSqy2AUk/7MJy0JLiM3+YcPozPK6ynBbzKJL1VC5nq9v1+9SBVAui4wf8o+
         Kl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IjQ9wQWspnQkFdYFJ7LxUdrGqhSWixun2cM2wAqPIaE=;
        b=ngxVkplxZ01wN0dnXF9GF2VCepNyL5isbVJoigbgRdJkWNvxtAGS0HJFPaS6nWKWIe
         z/ENKVnoxFSZ10gNuJV7L7HkJFWY+L6QD1V2g61gIFsmVKgR4tfXQM5stT7TghzeQ+Ox
         O/bkshMeFW/BreHm3sO2SadL4T3g3gqCSyGaUS9HIRGZaaiV+Xpya9HxYbNcXiIH1+qJ
         fh8rVsf/4kD3cIDkucNZoTR7LrSZUtDh8/+HZbg55csEDWUzNytY7ZZAVZ9aG7Mi1Gpy
         Pd/nYsRgYiC5EBQtae4rXaN/8OTUHSjjHh9djosql+VRhNH1NEmpeyciWrhbaxPe8I8h
         JoZA==
X-Gm-Message-State: AOAM531rSeBaSks2wZLXs5WtfepQDstJmzs3tcleMgwmjuM1MNx2Mei6
        wqqOzIWx4Lk7wLFysqpHsOs=
X-Google-Smtp-Source: ABdhPJxVcme/ZypDj9k4J2IeOfO4b0MU0LZW5gUNix8AAANi8GVckcqzSKno/qA3fIBRBFAT3KwXsA==
X-Received: by 2002:a65:550a:: with SMTP id f10mr18513356pgr.155.1627310393582;
        Mon, 26 Jul 2021 07:39:53 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id c204sm238114pfb.90.2021.07.26.07.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 07:39:52 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Signal fences sooner
Date:   Mon, 26 Jul 2021 07:43:58 -0700
Message-Id: <20210726144359.2179302-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726144359.2179302-1-robdclark@gmail.com>
References: <20210726144359.2179302-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Nothing we do to in update_fences() can't be done in an atomic context,
so move this into the GPU's irq context to reduce latency (and call
dma_fence_signal() so we aren't relying on dma_fence_is_signaled() which
would defeat the purpose).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 44 +++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0ebf7bc6ad09..647af45cf892 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -278,16 +278,18 @@ static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 		uint32_t fence)
 {
 	struct msm_gem_submit *submit;
+	unsigned long flags;
 
-	spin_lock(&ring->submit_lock);
+	spin_lock_irqsave(&ring->submit_lock, flags);
 	list_for_each_entry(submit, &ring->submits, node) {
 		if (submit->seqno > fence)
 			break;
 
 		msm_update_fence(submit->ring->fctx,
 			submit->fence->seqno);
+		dma_fence_signal(submit->fence);
 	}
-	spin_unlock(&ring->submit_lock);
+	spin_unlock_irqrestore(&ring->submit_lock, flags);
 }
 
 #ifdef CONFIG_DEV_COREDUMP
@@ -443,15 +445,16 @@ static struct msm_gem_submit *
 find_submit(struct msm_ringbuffer *ring, uint32_t fence)
 {
 	struct msm_gem_submit *submit;
+	unsigned long flags;
 
-	spin_lock(&ring->submit_lock);
+	spin_lock_irqsave(&ring->submit_lock, flags);
 	list_for_each_entry(submit, &ring->submits, node) {
 		if (submit->seqno == fence) {
-			spin_unlock(&ring->submit_lock);
+			spin_unlock_irqrestore(&ring->submit_lock, flags);
 			return submit;
 		}
 	}
-	spin_unlock(&ring->submit_lock);
+	spin_unlock_irqrestore(&ring->submit_lock, flags);
 
 	return NULL;
 }
@@ -547,11 +550,12 @@ static void recover_worker(struct kthread_work *work)
 		 */
 		for (i = 0; i < gpu->nr_rings; i++) {
 			struct msm_ringbuffer *ring = gpu->rb[i];
+			unsigned long flags;
 
-			spin_lock(&ring->submit_lock);
+			spin_lock_irqsave(&ring->submit_lock, flags);
 			list_for_each_entry(submit, &ring->submits, node)
 				gpu->funcs->submit(gpu, submit);
-			spin_unlock(&ring->submit_lock);
+			spin_unlock_irqrestore(&ring->submit_lock, flags);
 		}
 	}
 
@@ -641,7 +645,7 @@ static void hangcheck_handler(struct timer_list *t)
 		hangcheck_timer_reset(gpu);
 
 	/* workaround for missing irq: */
-	kthread_queue_work(gpu->worker, &gpu->retire_work);
+	msm_gpu_retire(gpu);
 }
 
 /*
@@ -752,6 +756,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
 	volatile struct msm_gpu_submit_stats *stats;
 	u64 elapsed, clock = 0;
+	unsigned long flags;
 	int i;
 
 	stats = &ring->memptrs->stats[index];
@@ -781,9 +786,9 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
 	pm_runtime_put_autosuspend(&gpu->pdev->dev);
 
-	spin_lock(&ring->submit_lock);
+	spin_lock_irqsave(&ring->submit_lock, flags);
 	list_del(&submit->node);
-	spin_unlock(&ring->submit_lock);
+	spin_unlock_irqrestore(&ring->submit_lock, flags);
 
 	msm_gem_submit_put(submit);
 }
@@ -798,11 +803,12 @@ static void retire_submits(struct msm_gpu *gpu)
 
 		while (true) {
 			struct msm_gem_submit *submit = NULL;
+			unsigned long flags;
 
-			spin_lock(&ring->submit_lock);
+			spin_lock_irqsave(&ring->submit_lock, flags);
 			submit = list_first_entry_or_null(&ring->submits,
 					struct msm_gem_submit, node);
-			spin_unlock(&ring->submit_lock);
+			spin_unlock_irqrestore(&ring->submit_lock, flags);
 
 			/*
 			 * If no submit, we are done.  If submit->fence hasn't
@@ -821,10 +827,6 @@ static void retire_submits(struct msm_gpu *gpu)
 static void retire_worker(struct kthread_work *work)
 {
 	struct msm_gpu *gpu = container_of(work, struct msm_gpu, retire_work);
-	int i;
-
-	for (i = 0; i < gpu->nr_rings; i++)
-		update_fences(gpu, gpu->rb[i], gpu->rb[i]->memptrs->fence);
 
 	retire_submits(gpu);
 }
@@ -832,6 +834,11 @@ static void retire_worker(struct kthread_work *work)
 /* call from irq handler to schedule work to retire bo's */
 void msm_gpu_retire(struct msm_gpu *gpu)
 {
+	int i;
+
+	for (i = 0; i < gpu->nr_rings; i++)
+		update_fences(gpu, gpu->rb[i], gpu->rb[i]->memptrs->fence);
+
 	kthread_queue_work(gpu->worker, &gpu->retire_work);
 	update_sw_cntrs(gpu);
 }
@@ -842,6 +849,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct drm_device *dev = gpu->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_ringbuffer *ring = submit->ring;
+	unsigned long flags;
 	int i;
 
 	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
@@ -879,9 +887,9 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	 */
 	msm_gem_submit_get(submit);
 
-	spin_lock(&ring->submit_lock);
+	spin_lock_irqsave(&ring->submit_lock, flags);
 	list_add_tail(&submit->node, &ring->submits);
-	spin_unlock(&ring->submit_lock);
+	spin_unlock_irqrestore(&ring->submit_lock, flags);
 
 	gpu->funcs->submit(gpu, submit);
 	priv->lastctx = submit->queue->ctx;
-- 
2.31.1

