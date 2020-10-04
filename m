Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF89282D28
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 21:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgJDTVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 15:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbgJDTVc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 15:21:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6299C0613CE;
        Sun,  4 Oct 2020 12:21:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 144so5091998pfb.4;
        Sun, 04 Oct 2020 12:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AJNtfpRr6GjvvhCQZLjZdRuI9RXAVVAdif0FCISlc84=;
        b=cQPXQz/V1xLNwvkyD+rrh90BAeDPYIcM1txf7bY4IhIAOz7Z5zf3vyzQ5CtXaNc84k
         i+nnHwBl8hzwPK0wphlGSem1j/4yrGzaaRFZ+qSeZ5XFpKbfqmyV0x3WfD40o+9obrVv
         Jj1DGx6gcv120q7Rl90cLkr79FzLqCNducrChVH9IOrnSGjCuAypkc6s9yt+Y0lwNLVn
         3mxSRzBEr13nvcG3QZoKsjTvDLn5Lj91MgiZ9WlkDMmr4XzYW6XEaFuwAU9mBzem90bX
         U04BsFNUvVHcNGobfOvhbzTCuoj4a49HViR3z3TJQPFZYbTVC9PqvLKzZi/Jin1okV+w
         ztYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AJNtfpRr6GjvvhCQZLjZdRuI9RXAVVAdif0FCISlc84=;
        b=SIQxkDfLCy4wv86ZoRi1/jrdhzWuBXRffyZO0EY/CDYOGQVUVRS9soqWLWnf5f639w
         7YgEWbPQiOnn0z2o4cUrqNjhzXxt6J3mJtSsqfZSd+f802hjB6FPpRdRjMbqZ3Y/FTXX
         EP3gVjHX8yTskCZ0w7GaOmlaVNxBGc7oA4Om8MWhSC5Bn+1PTNA5H8VEe7LC7LujHAei
         X8BtvxoClQdh6KMpqBfdnvXfE07eQNEWOnoVGfldRBdbDh9xW98i3WGDK01nmSbNRmUe
         EvXYfIvPPwfMwHXijNiDtT0DoGWJPb+AeHU7c06zFqqLWHt2Dkd+TvBtqd6Fqo5cFdj/
         574A==
X-Gm-Message-State: AOAM531btAl6R61uq3P8FZQJ9S1+gzhhlO/odwjg9j/vccSP6d+u0ePZ
        uXRWnqsLi1keYlxj1whnLUY=
X-Google-Smtp-Source: ABdhPJwaiIMf4cs5Smkw+nl4kzB43RwYY0830r9RKkDpRdQT6Dggw3kDBvUj6CKba91twMAD/RWdmA==
X-Received: by 2002:a63:b21e:: with SMTP id x30mr3994962pge.396.1601839292322;
        Sun, 04 Oct 2020 12:21:32 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id me14sm1596859pjb.23.2020.10.04.12.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 12:21:31 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 11/14] drm/msm: remove msm_gem_free_work
Date:   Sun,  4 Oct 2020 12:21:43 -0700
Message-Id: <20201004192152.3298573-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Now that we don't need struct_mutex in the free path, we can get rid of
the asynchronous free altogether.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c |  3 ---
 drivers/gpu/drm/msm/msm_drv.h |  5 -----
 drivers/gpu/drm/msm/msm_gem.c | 27 ---------------------------
 drivers/gpu/drm/msm/msm_gem.h |  1 -
 4 files changed, 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index dc6efc089285..e766c1f45045 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -437,9 +437,6 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 
 	priv->wq = alloc_ordered_workqueue("msm", 0);
 
-	INIT_WORK(&priv->free_work, msm_gem_free_work);
-	init_llist_head(&priv->free_list);
-
 	INIT_LIST_HEAD(&priv->inactive_list);
 	mutex_init(&priv->mm_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 535f9e718e2d..96f8009e247c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -188,10 +188,6 @@ struct msm_drm_private {
 	struct list_head inactive_list;
 	struct mutex mm_lock;
 
-	/* worker for delayed free of objects: */
-	struct work_struct free_work;
-	struct llist_head free_list;
-
 	struct workqueue_struct *wq;
 
 	unsigned int num_planes;
@@ -340,7 +336,6 @@ void msm_gem_kernel_put(struct drm_gem_object *bo,
 		struct msm_gem_address_space *aspace, bool locked);
 struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 		struct dma_buf *dmabuf, struct sg_table *sgt);
-void msm_gem_free_work(struct work_struct *work);
 
 __printf(2, 3)
 void msm_gem_object_set_name(struct drm_gem_object *bo, const char *fmt, ...);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 126d92fd21cd..5e75d644ce41 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -917,16 +917,6 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	if (llist_add(&msm_obj->freed, &priv->free_list))
-		queue_work(priv->wq, &priv->free_work);
-}
-
-static void free_object(struct msm_gem_object *msm_obj)
-{
-	struct drm_gem_object *obj = &msm_obj->base;
-	struct drm_device *dev = obj->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-
 	/* object should not be on active list: */
 	WARN_ON(is_active(msm_obj));
 
@@ -959,23 +949,6 @@ static void free_object(struct msm_gem_object *msm_obj)
 	kfree(msm_obj);
 }
 
-void msm_gem_free_work(struct work_struct *work)
-{
-	struct msm_drm_private *priv =
-		container_of(work, struct msm_drm_private, free_work);
-	struct llist_node *freed;
-	struct msm_gem_object *msm_obj, *next;
-
-	while ((freed = llist_del_all(&priv->free_list))) {
-		llist_for_each_entry_safe(msm_obj, next,
-					  freed, freed)
-			free_object(msm_obj);
-
-		if (need_resched())
-			break;
-	}
-}
-
 /* convenience method to construct a GEM buffer object, and userspace handle */
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		uint32_t size, uint32_t flags, uint32_t *handle,
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 61147bd96b06..e98a8004813b 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -127,7 +127,6 @@ enum msm_gem_lock {
 
 void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subclass);
 void msm_gem_vunmap(struct drm_gem_object *obj, enum msm_gem_lock subclass);
-void msm_gem_free_work(struct work_struct *work);
 
 /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
  * associated with the cmdstream submission for synchronization (and
-- 
2.26.2

