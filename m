Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB477282D2E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 21:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgJDTV3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 15:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgJDTVZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 15:21:25 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D87CC0613CF;
        Sun,  4 Oct 2020 12:21:25 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id n14so5086074pff.6;
        Sun, 04 Oct 2020 12:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8RonTZKV7nIutYPycO/AUjmVxTm8X/O252euLFCDy8g=;
        b=FGIyIVUbmv+JYYmPLDse5d6Al0XpfX0TkT0I0BCASHeusLqq/KNUVs4spRHJ642TbC
         Uu0C/gR2L2IrGb4YBWGvf1VGxRC/sDDojNdxFtyDoxJn5o9mPGXIMTrQ9ZL8v3s7ZG2e
         0noRTxg1xfWov0XrQMGCb3tcbEVpRTUQNIMdIU0M+9eHnQu6UTp4xwMO36BmoDWDfhMD
         bHffDBk6BJTEwBaFOHgA/0OO15HEhvg4a0qUPrmUdezCoIAznxwEbM4M4Srl/RYrT29D
         iJbkSFe1eVo0tERO8SEcUA2/jN+QR/+i77Es+AL4U2X0m0dt2tXODEhssYJyULcBtaLt
         HGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8RonTZKV7nIutYPycO/AUjmVxTm8X/O252euLFCDy8g=;
        b=PGsk7QkPvIu/1rc741lyLbzG66bD2Yccro8AJBI3cAVywOw6fkxJ7UO5n259/A6r/K
         fJ7EcXZqXXD2AAobD7RIOXLVeVdnkdt7tfZeVLUnOHjGvwr3MZ5M9q4RKP6oa2UBm7n3
         F945dOksqFqXdAeSklZ8CgJMZr4NbdFiaaKI/7JS9CPs2SfG78g2pXoS9Mfie/j0gRLa
         9fNYKdgG8oeaLVoz7T/FHu9zbUvPQeQ+DLEw7biWNHOD2ni5utWhW0fUmdviSC4ljOpN
         wqHsGqyKCre+5T2uk9Kk+xb5S62LRcH/XJ3DMzD1ZG+pyHnL5R4bnmubJobyP8YLB4Nv
         bKeg==
X-Gm-Message-State: AOAM533aN9va281Y+Mt+N09R+eLoA1nIqlMVUyK6Jnm3NY9oL8UDEUVG
        MuJKqVRVCRoTaSZ5ZblcGDk=
X-Google-Smtp-Source: ABdhPJzwhHz6PJU0sNZCTex9teqsgD1GUxASnYadyTjhVMRfVtSBaLn/hFZ/mUV8+1f+TPVkXVXadA==
X-Received: by 2002:aa7:8ad8:0:b029:150:7d36:cddf with SMTP id b24-20020aa78ad80000b02901507d36cddfmr3904428pfd.55.1601839284512;
        Sun, 04 Oct 2020 12:21:24 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id t12sm8138825pgk.32.2020.10.04.12.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 12:21:23 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 07/14] drm/msm: Refcount submits
Date:   Sun,  4 Oct 2020 12:21:39 -0700
Message-Id: <20201004192152.3298573-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Before we remove dev->struct_mutex from the retire path, we have to deal
with the situation of a submit retiring before the submit ioctl returns.

To deal with this, ring->submits will hold a reference to the submit,
which is dropped when the submit is retired.  And the submit ioctl path
holds it's own ref, which it drops when it is done with the submit.

Also, add to submit list *after* getting/pinning bo's, to prevent badness
in case the completed fence is corrupted, and retire_worker mistakenly
believes the submit is done too early.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h        |  1 -
 drivers/gpu/drm/msm/msm_gem.h        | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c | 12 ++++++------
 drivers/gpu/drm/msm/msm_gpu.c        | 21 ++++++++++++++++-----
 4 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 50978e5db376..535f9e718e2d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -277,7 +277,6 @@ void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
 bool msm_use_mmu(struct drm_device *dev);
 
-void msm_gem_submit_free(struct msm_gem_submit *submit);
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a1bf741b9b89..e05b1530aca6 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -136,6 +136,7 @@ void msm_gem_free_work(struct work_struct *work);
  * lasts for the duration of the submit-ioctl.
  */
 struct msm_gem_submit {
+	struct kref ref;
 	struct drm_device *dev;
 	struct msm_gpu *gpu;
 	struct msm_gem_address_space *aspace;
@@ -169,6 +170,18 @@ struct msm_gem_submit {
 	} bos[];
 };
 
+void __msm_gem_submit_destroy(struct kref *kref);
+
+static inline void msm_gem_submit_get(struct msm_gem_submit *submit)
+{
+	kref_get(&submit->ref);
+}
+
+static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
+{
+	kref_put(&submit->ref, __msm_gem_submit_destroy);
+}
+
 /* helper to determine of a buffer in submit should be dumped, used for both
  * devcoredump and debugfs cmdstream dumping:
  */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index e1d1f005b3d4..7d653bdc92dc 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -42,6 +42,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	if (!submit)
 		return NULL;
 
+	kref_init(&submit->ref);
 	submit->dev = dev;
 	submit->aspace = queue->ctx->aspace;
 	submit->gpu = gpu;
@@ -60,12 +61,12 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	return submit;
 }
 
-void msm_gem_submit_free(struct msm_gem_submit *submit)
+void __msm_gem_submit_destroy(struct kref *kref)
 {
+	struct msm_gem_submit *submit =
+			container_of(kref, struct msm_gem_submit, ref);
+
 	dma_fence_put(submit->fence);
-	spin_lock(&submit->ring->submit_lock);
-	list_del(&submit->node);
-	spin_unlock(&submit->ring->submit_lock);
 	put_pid(submit->pid);
 	msm_submitqueue_put(submit->queue);
 
@@ -805,8 +806,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	submit_cleanup(submit);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
-	if (ret)
-		msm_gem_submit_free(submit);
+	msm_gem_submit_put(submit);
 out_unlock:
 	if (ret && (out_fence_fd >= 0))
 		put_unused_fd(out_fence_fd);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 8d1e254f964a..fd3fc6f36ab1 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -712,7 +712,12 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
 	pm_runtime_put_autosuspend(&gpu->pdev->dev);
-	msm_gem_submit_free(submit);
+
+	spin_lock(&ring->submit_lock);
+	list_del(&submit->node);
+	spin_unlock(&ring->submit_lock);
+
+	msm_gem_submit_put(submit);
 }
 
 static void retire_submits(struct msm_gpu *gpu)
@@ -786,10 +791,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	submit->seqno = ++ring->seqno;
 
-	spin_lock(&ring->submit_lock);
-	list_add_tail(&submit->node, &ring->submits);
-	spin_unlock(&ring->submit_lock);
-
 	msm_rd_dump_submit(priv->rd, submit, NULL);
 
 	update_sw_cntrs(gpu);
@@ -816,6 +817,16 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		msm_gem_active_get(drm_obj, gpu);
 	}
 
+	/*
+	 * ring->submits holds a ref to the submit, to deal with the case
+	 * that a submit completes before msm_ioctl_gem_submit() returns.
+	 */
+	msm_gem_submit_get(submit);
+
+	spin_lock(&ring->submit_lock);
+	list_add_tail(&submit->node, &ring->submits);
+	spin_unlock(&ring->submit_lock);
+
 	gpu->funcs->submit(gpu, submit);
 	priv->lastctx = submit->queue->ctx;
 
-- 
2.26.2

