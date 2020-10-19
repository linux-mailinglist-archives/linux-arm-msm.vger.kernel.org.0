Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73B08292FD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729642AbgJSUqI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729583AbgJSUqH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:46:07 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C54C0613CE;
        Mon, 19 Oct 2020 13:46:06 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id o9so409689plx.10;
        Mon, 19 Oct 2020 13:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jslkY1PBZlMBA8knA4FbguBtmYUP5NUKMbgG0IT+Sg8=;
        b=Vd+AECdgZtvfraEU7ZuTuhjGHlFKubZajpPSmkqs7FpRPzjEpfNIrgCmsZqMRTeAmk
         F4jy9JwVjx64oxgf6LKoGhltWHsU66q11VI/0MmSN0eglfYtIdBAgZrq/yXGY2NX9LSg
         VLrPq/Rub81p30WFq4a1SoGyNlBzUN/ygS0GNyRsPhpITeHSGILH6RB4ilFi/s3WAUAv
         StDpG5bHtitcVME7LmhCbxTz92V4u7rtenNV3Qk7/l6D4/Gu6cUPBKMXGiDf/eDBZtoW
         wsORXX3HdGt4fwZYNur1YIfZPoEh6H5x/jUxi/ZIEtgmo+04soQ30TEUnvodivamFUf2
         cbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jslkY1PBZlMBA8knA4FbguBtmYUP5NUKMbgG0IT+Sg8=;
        b=sevPbmQGcNjbnCv0ADEfk9KaBZjy0kR/NWd55FODF0SP/qbXuTOJNcACCx8MmI7Be9
         xHmYc/0rcxNAdjhQRhqG3XGlxqf7Xe1GMQZ+Fj2aq5DcaCq1Ol4hwewyJxl7Sy2nM98H
         lmOh0If5lEVUmkoFIhGalr8t1tIxNHrY7xRMPKz94s87NqqL3TUNAfGcd6ZTnzmOcV+I
         lQeOWpHtkyBv36Q7Jjid3kSsT8wPGtIITyB85HhbPA2NkaX8FN3TVoskLHQ2I+ZEECVf
         TcutPo2kewZQnqorRxsU0lXzTxWh6UImnlQkVlSizjK3sO9RFViDI5QZ90thJHwydQOJ
         2LGw==
X-Gm-Message-State: AOAM53144PBUmV3BtDYaIn/qkpzsE8SAghpuFJ/0hb/HNVWTNszONLzI
        2c3NOLUph9XjOVJI/XO388s=
X-Google-Smtp-Source: ABdhPJyHcj5Pu1F8vdFGvZj+UHR6Hh0YyHbHzFT2Fkn9oz5e7WJumLfHIoFLcANMtIOOXOhD9PbA4g==
X-Received: by 2002:a17:90b:383:: with SMTP id ga3mr1289811pjb.2.1603140366308;
        Mon, 19 Oct 2020 13:46:06 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j20sm654779pfd.40.2020.10.19.13.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:46:05 -0700 (PDT)
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
Subject: [PATCH v3 15/23] drm/msm: Protect ring->submits with it's own lock
Date:   Mon, 19 Oct 2020 13:46:16 -0700
Message-Id: <20201019204636.139997-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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
index 50ecc8455197..c078b58d9c10 100644
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

