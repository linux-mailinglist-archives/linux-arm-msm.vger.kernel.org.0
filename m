Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531B1272A08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 17:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbgIUP1d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 11:27:33 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:24485 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726471AbgIUP1c (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 11:27:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600702051; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=s7K9SEo1X6Ibc0tt1bXFMEPa50tfSsiMzV95wUizo+8=; b=GFMDy5NGfv+1kNRhM60Z/A8Wt4yQkm4G6WOlJF2P1y5FTezrCq338J8p/1i6YvdjbIGXUlQO
 U0zarL6Fg4nWujrHu4DOnTE63mdqJdg6ISmwwd4X8n8ODTEMjWSSD3QjoSUgjkkJ9+w+TwyI
 nZkNPrubsQaTCzWEaXGURWjd53Q=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f68c6620049ea581645ae94 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Sep 2020 15:27:30
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CC747C43387; Mon, 21 Sep 2020 15:27:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D577EC433FE;
        Mon, 21 Sep 2020 15:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D577EC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        mka@chromium.org, jonathan@marek.ca, robdclark@gmail.com,
        dianders@chromium.org
Subject: [PATCH 1/2] drm/msm: Replace active_list with refcount
Date:   Mon, 21 Sep 2020 20:57:17 +0530
Message-Id: <1600702038-10893-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the case where we have a back-to-back submission that shares the same
BO, this BO will be prematurely moved to inactive_list while retiring the
first submit. But it will be still part of the second submit which is
being processed by the GPU. Now, if the shrinker happens to be triggered at
this point, it will result in premature purging of this BO.

To fix this, we can replace the active_list with reference counting and
move the BO to inactive list only when this count becomes zero.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_drv.h |  5 ++---
 drivers/gpu/drm/msm/msm_gem.c | 30 ++++++++++++++++--------------
 drivers/gpu/drm/msm/msm_gem.h |  4 +++-
 drivers/gpu/drm/msm/msm_gpu.c | 11 +++++++----
 4 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3193274..28e3c8d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -309,9 +309,8 @@ void msm_gem_put_vaddr(struct drm_gem_object *obj);
 int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
 int msm_gem_sync_object(struct drm_gem_object *obj,
 		struct msm_fence_context *fctx, bool exclusive);
-void msm_gem_move_to_active(struct drm_gem_object *obj,
-		struct msm_gpu *gpu, bool exclusive, struct dma_fence *fence);
-void msm_gem_move_to_inactive(struct drm_gem_object *obj);
+void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
+void msm_gem_active_put(struct drm_gem_object *obj);
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
 int msm_gem_cpu_fini(struct drm_gem_object *obj);
 void msm_gem_free_object(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 76a6c52..accc106 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -743,33 +743,36 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 	return 0;
 }
 
-void msm_gem_move_to_active(struct drm_gem_object *obj,
-		struct msm_gpu *gpu, bool exclusive, struct dma_fence *fence)
+void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
 	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
+
 	msm_obj->gpu = gpu;
-	if (exclusive)
-		dma_resv_add_excl_fence(obj->resv, fence);
-	else
-		dma_resv_add_shared_fence(obj->resv, fence);
 	list_del_init(&msm_obj->mm_list);
-	list_add_tail(&msm_obj->mm_list, &gpu->active_list);
+	atomic_inc(&msm_obj->active_count);
 }
 
-void msm_gem_move_to_inactive(struct drm_gem_object *obj)
+static void move_to_inactive(struct msm_gem_object *msm_obj)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = msm_obj->base.dev;
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
 
 	msm_obj->gpu = NULL;
-	list_del_init(&msm_obj->mm_list);
 	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
 }
 
+void msm_gem_active_put(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+
+	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
+
+	if (atomic_dec_and_test(&msm_obj->active_count))
+		move_to_inactive(msm_obj);
+}
+
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
 {
 	bool write = !!(op & MSM_PREP_WRITE);
@@ -1104,7 +1107,6 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	}
 
 	if (struct_mutex_locked) {
-		WARN_ON(!mutex_is_locked(&dev->struct_mutex));
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
 	} else {
 		mutex_lock(&dev->struct_mutex);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7b1c7a5..a1bf741 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -88,12 +88,14 @@ struct msm_gem_object {
 	struct mutex lock; /* Protects resources associated with bo */
 
 	char name[32]; /* Identifier to print for the debugfs files */
+
+	atomic_t active_count;
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 static inline bool is_active(struct msm_gem_object *msm_obj)
 {
-	return msm_obj->gpu != NULL;
+	return atomic_read(&msm_obj->active_count);
 }
 
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 29c8d73c..55d1648 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -698,8 +698,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
-		/* move to inactive: */
-		msm_gem_move_to_inactive(&msm_obj->base);
+
+		msm_gem_active_put(&msm_obj->base);
 		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
 		drm_gem_object_put_locked(&msm_obj->base);
 	}
@@ -774,6 +774,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
+		struct drm_gem_object *drm_obj = &msm_obj->base;
 		uint64_t iova;
 
 		/* can't happen yet.. but when we add 2d support we'll have
@@ -786,9 +787,11 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		msm_gem_get_and_pin_iova(&msm_obj->base, submit->aspace, &iova);
 
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
-			msm_gem_move_to_active(&msm_obj->base, gpu, true, submit->fence);
+			dma_resv_add_excl_fence(drm_obj->resv, submit->fence);
 		else if (submit->bos[i].flags & MSM_SUBMIT_BO_READ)
-			msm_gem_move_to_active(&msm_obj->base, gpu, false, submit->fence);
+			dma_resv_add_shared_fence(drm_obj->resv, submit->fence);
+
+		msm_gem_active_get(drm_obj, gpu);
 	}
 
 	gpu->funcs->submit(gpu, submit);
-- 
2.7.4

