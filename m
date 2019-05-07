Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D53D7169D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 20:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfEGSCV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 14:02:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52912 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbfEGSCR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 14:02:17 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BD3A2611FA; Tue,  7 May 2019 18:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557252135;
        bh=hvAuaeiqWwDpNNxkhQXfgLyBBNSo4KkWiQuSCzl+d40=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CB5aFeFOInYvFc/pbZ0Mm1G7JRAj0e2gLvru96erHXhQDow8W+3144hoPAd3HsakX
         gskFzjvSP/uANJMZvWseBqdspDW3jHnAHrWicMMWxBqExQbYYz57B/XuvxLEiLnG61
         5gEy9N9928zHkB6gLC0zG54cdGqOQLADqWZaa/TU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37B7961194;
        Tue,  7 May 2019 18:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557252134;
        bh=hvAuaeiqWwDpNNxkhQXfgLyBBNSo4KkWiQuSCzl+d40=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oK4eURDwof2jZ48Cyxs+BZy02T5J0nBsFqg+ZeAlx7/v5+8WNBVNFcMwSWDL5zUZx
         zEaB8QYifklid+qeapb/bIdoglh2eFLFi8fN4Fmcijj1YrfNNBzvWzo5pU20FeltQY
         rvVA++sUzHw1+4ddm5ZdsakvgZyNZTsaw5vVne3A=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37B7961194
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 3/3] drm/msm: Pass the MMU domain index in struct msm_file_private
Date:   Tue,  7 May 2019 12:02:07 -0600
Message-Id: <1557252127-11145-4-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557252127-11145-1-git-send-email-jcrouse@codeaurora.org>
References: <1557252127-11145-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pass the index of the MMU domain in struct msm_file_private instead
of assuming gpu->id throughout the submit path. This clears the way
to change ctx->aspace to a per-instance pagetable.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/msm_drv.c        |  2 ++
 drivers/gpu/drm/msm/msm_drv.h        |  1 +
 drivers/gpu/drm/msm/msm_gem.h        |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 13 ++++++++-----
 drivers/gpu/drm/msm/msm_gpu.c        |  5 ++---
 5 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 154dab0..cac101f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -611,6 +611,7 @@ static void load_gpu(struct drm_device *dev)
 
 static int context_init(struct drm_device *dev, struct drm_file *file)
 {
+	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_file_private *ctx;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -619,6 +620,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 
 	msm_submitqueue_init(dev, ctx);
 
+	ctx->aspace = priv->gpu->aspace;
 	file->driver_priv = ctx;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index bbf739d..07ae89f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -68,6 +68,7 @@ struct msm_file_private {
 	rwlock_t queuelock;
 	struct list_head submitqueues;
 	int queueid;
+	struct msm_gem_address_space *aspace;
 };
 
 enum msm_mdp_plane_property {
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c5ac781..1c75310 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -145,6 +145,7 @@ void msm_gem_free_work(struct work_struct *work);
 struct msm_gem_submit {
 	struct drm_device *dev;
 	struct msm_gpu *gpu;
+	struct msm_gem_address_space *aspace;
 	struct list_head node;   /* node in ring submit list */
 	struct list_head bo_list;
 	struct ww_acquire_ctx ticket;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 648e0c1..e19e083 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -32,8 +32,9 @@
 #define BO_PINNED   0x2000
 
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
-		struct msm_gpu *gpu, struct msm_gpu_submitqueue *queue,
-		uint32_t nr_bos, uint32_t nr_cmds)
+		struct msm_gpu *gpu, struct msm_gem_address_space *aspace,
+		struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
+		uint32_t nr_cmds)
 {
 	struct msm_gem_submit *submit;
 	uint64_t sz = sizeof(*submit) + ((u64)nr_bos * sizeof(submit->bos[0])) +
@@ -47,6 +48,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return NULL;
 
 	submit->dev = dev;
+	submit->aspace = aspace;
 	submit->gpu = gpu;
 	submit->fence = NULL;
 	submit->cmd = (void *)&submit->bos[nr_bos];
@@ -160,7 +162,7 @@ static void submit_unlock_unpin_bo(struct msm_gem_submit *submit,
 	struct msm_gem_object *msm_obj = submit->bos[i].obj;
 
 	if (submit->bos[i].flags & BO_PINNED)
-		msm_gem_unpin_iova(&msm_obj->base, submit->gpu->aspace);
+		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
 
 	if (submit->bos[i].flags & BO_LOCKED)
 		ww_mutex_unlock(&msm_obj->resv->lock);
@@ -264,7 +266,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 
 		/* if locking succeeded, pin bo: */
 		ret = msm_gem_get_and_pin_iova(&msm_obj->base,
-				submit->gpu->aspace, &iova);
+				submit->aspace, &iova);
 
 		if (ret)
 			break;
@@ -477,7 +479,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		}
 	}
 
-	submit = submit_create(dev, gpu, queue, args->nr_bos, args->nr_cmds);
+	submit = submit_create(dev, gpu, ctx->aspace, queue, args->nr_bos,
+		args->nr_cmds);
 	if (!submit) {
 		ret = -ENOMEM;
 		goto out_unlock;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index bf4ee27..0a4c77f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -684,7 +684,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
 		/* move to inactive: */
 		msm_gem_move_to_inactive(&msm_obj->base);
-		msm_gem_unpin_iova(&msm_obj->base, gpu->aspace);
+		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
 		drm_gem_object_put(&msm_obj->base);
 	}
 
@@ -768,8 +768,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 
 		/* submit takes a reference to the bo and iova until retired: */
 		drm_gem_object_get(&msm_obj->base);
-		msm_gem_get_and_pin_iova(&msm_obj->base,
-				submit->gpu->aspace, &iova);
+		msm_gem_get_and_pin_iova(&msm_obj->base, submit->aspace, &iova);
 
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
 			msm_gem_move_to_active(&msm_obj->base, gpu, true, submit->fence);
-- 
2.7.4

