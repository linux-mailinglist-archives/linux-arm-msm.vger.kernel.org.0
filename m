Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF020297544
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751453AbgJWQvv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752805AbgJWQvC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:51:02 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B28C0613CE;
        Fri, 23 Oct 2020 09:51:01 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x13so1777155pfa.9;
        Fri, 23 Oct 2020 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LTE3gomliTKXhUDnwYUTR88VGBt7xpw3Jdu/tPpRNR0=;
        b=uA55/QFU1AlBeLiQ9adAMOFw9ajUbsEOqjSI+scsnB37kktWMHBndl1pgaUIrcvsH7
         2L3DtnASK2qK3RAOAUh9Qw0/Nl61rZqEhece2Jmzz+KacvX+VV2csTE/WXoxYbPO6a2y
         mVxVXRKjTJSLanFDCIWr3IIWTGQLsPv+luQtcq9ZFttwJgxDu7L7MTcJthBQE1RroXl3
         XKVAMwY5MK8uUI0PKgazIEen/l24zQwx0dRovrv/bfuFVjo73qaUYpsgO6EOBZ9PIjvT
         kuv8MeSVDgzqh4Avj7OlKQzCfExyUNJQv127VxGlsMMtvjsRp7UHlCd0ct8fZpSK29HR
         XJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LTE3gomliTKXhUDnwYUTR88VGBt7xpw3Jdu/tPpRNR0=;
        b=k2GIh76FQ1fbTak7qZ5DqeOZ1tZcnK8roD3z2BAkNxjrigWhDxmXde7+iUup7BJ9qG
         0p9z/aJlrE7sNZfze2ZwDf+KBcc8sNYA6m5l/iLLO/rI0Kdi9CD940lE+AdWNpXqrbcV
         muaeZb26yavBxac/pI4GyOYlRFnSYWwPNz7YnPQTT4pC+FsInIxrqRz96Ai1KlyUk+t5
         nZc/yjrEKXtPX4UP/IyD0Iftd7s/A7QJxKrtmjfs0BjviC+TqMOSFNE/YNFTqsR46rG6
         /6nKlmrEWc4ykXGCTZHaFeM146gwjx4kdU7kjO6JCewdTofOowent6uHyHcMZsqlg5er
         6G8A==
X-Gm-Message-State: AOAM531GVAm5ekJdDYDs6m7IYUgm5G7W8yJ2L1XU3s6q+RYMlZ/4Qlq0
        +sA8F9T07tCxvJt/45/RuePj5HBuxvzq/Q==
X-Google-Smtp-Source: ABdhPJzNZLIVfnD1VopgXy+WWAzsweLsxqXsr6Ufhbs+CxyY4SQdl1PPw1AYtDHC2gyT+5fKToGp4A==
X-Received: by 2002:a05:6a00:2cf:b029:160:c0c:a95c with SMTP id b15-20020a056a0002cfb02901600c0ca95cmr94764pft.76.1603471860491;
        Fri, 23 Oct 2020 09:51:00 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id c12sm2434995pgd.57.2020.10.23.09.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:59 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 20/23] drm/msm: Remove msm_gem_free_work
Date:   Fri, 23 Oct 2020 09:51:21 -0700
Message-Id: <20201023165136.561680-21-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Now that we don't need struct_mutex in the free path, we can get rid of
the asynchronous free altogether.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
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
index 5d555750943e..00b4788366c5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -939,16 +939,6 @@ void msm_gem_free_object(struct drm_gem_object *obj)
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
 
@@ -986,23 +976,6 @@ static void free_object(struct msm_gem_object *msm_obj)
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
index f4e73c6f07bf..ffa2130ee97d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -204,7 +204,6 @@ static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
 
 void msm_gem_purge(struct drm_gem_object *obj);
 void msm_gem_vunmap(struct drm_gem_object *obj);
-void msm_gem_free_work(struct work_struct *work);
 
 /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
  * associated with the cmdstream submission for synchronization (and
-- 
2.26.2

