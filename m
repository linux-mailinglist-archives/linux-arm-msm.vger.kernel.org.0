Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9BF628ABEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729820AbgJLCJz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729778AbgJLCJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:38 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5C0C0613DA;
        Sun, 11 Oct 2020 19:09:35 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j7so2060441pgk.5;
        Sun, 11 Oct 2020 19:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8cenh8sbhC3ofASWaW0WRGlig0FwCUNWxn0tSgVv6pc=;
        b=tt6Y8ZDJZ9YBeu5MGzAIHCPhBMA8WR5nSRsmdpYTiUnXuLe5ogyJr5tKdETiwYAj2a
         BmFOiGSD5cGX+JDZu0i6KMtFEVJ1saOz5LZhGH7N76J2rNkL+hvAokBbdRBVymnlifrI
         vMBZwCjpk6ZazGPP+kNWUndXO5Je/PUqnmQ9sC0Tm8OLknUKUmFcpFptrTfYTARZAYhT
         StLVGFCCrlSSNE3EhzlPj3bp4thgiMD8SITpWGgipTxl/9cV1yunJltxZO397Hg8ILCC
         V6xKotoKwViFCZgbAQ8EgaAJxf6mIsK2UfenR6kVPD+h4c8eSpQtmafr9rYN1bcMxhAw
         SlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8cenh8sbhC3ofASWaW0WRGlig0FwCUNWxn0tSgVv6pc=;
        b=AjhSU1G756v/2fqYqtpsx+f54s40yEreHdgJIpTIMuv6TtqEG49WoEudH2fNX8/kIh
         IbmLfMOoGDFtP3MrM6zEKxbIZlF8v1BLoit8/UUpWS91U/ejj334FMDF4Fu9821jMYWV
         LmtSwGsRlMYFca0OW3Ms1MGg5aK1mQt6IGIy8AC/AlipKdoJ8Iim5xrJz8WllPIXEby6
         j3Hz4O0zfSKwwQFkr4KY4gxa2XGb7DnKcVexQH/Am7TLBK6owidf10GNuaRkTGcKUJHl
         dslJznXkj4rfGhgn9bulOHRgOjqrDJdZi66or0YexQzNUxaJLyeQGDrdbBtL3yK5Cpx5
         Htww==
X-Gm-Message-State: AOAM532kFSA4665GD1r0/BcnqaQEs2ymWY6WnWqIbxtY0eqyUmNeVkAW
        ZG6sJPL8RJSLJV8TIeNQMnw=
X-Google-Smtp-Source: ABdhPJxnwTIgUU01/dpi3IS0zT1litH2V2HbLH5VFgU5aAhqnvTB+FCFBqwzLcZ76v/fE/QR/bwvGA==
X-Received: by 2002:a17:90a:160f:: with SMTP id n15mr17171197pja.75.1602468574533;
        Sun, 11 Oct 2020 19:09:34 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id l3sm6517081pju.28.2020.10.11.19.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:33 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 19/22] drm/msm: remove msm_gem_free_work
Date:   Sun, 11 Oct 2020 19:09:46 -0700
Message-Id: <20201012020958.229288-20-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
index 81cb2cecc829..49e6daf30b42 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -438,9 +438,6 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 
 	priv->wq = alloc_ordered_workqueue("msm", 0);
 
-	INIT_WORK(&priv->free_work, msm_gem_free_work);
-	init_llist_head(&priv->free_list);
-
 	INIT_LIST_HEAD(&priv->inactive_list);
 	mutex_init(&priv->mm_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2ef5cff19883..af296712eae8 100644
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
@@ -291,7 +287,6 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
-void msm_gem_free_work(struct work_struct *work);
 
 int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 		struct msm_gem_address_space *aspace);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9ead1bf223e9..b60eaf6266e2 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -924,16 +924,6 @@ void msm_gem_free_object(struct drm_gem_object *obj)
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
 
@@ -966,23 +956,6 @@ static void free_object(struct msm_gem_object *msm_obj)
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
index bf5f9e94d0d3..c12fedf88e85 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -202,7 +202,6 @@ static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
 
 void msm_gem_purge(struct drm_gem_object *obj);
 void msm_gem_vunmap(struct drm_gem_object *obj);
-void msm_gem_free_work(struct work_struct *work);
 
 /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
  * associated with the cmdstream submission for synchronization (and
-- 
2.26.2

