Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F57297525
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752776AbgJWQuo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752772AbgJWQul (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:41 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C599C0613CE;
        Fri, 23 Oct 2020 09:50:41 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 126so1368276pfu.4;
        Fri, 23 Oct 2020 09:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nf/vn6DN/jdqsddFy69rFe9cIxF4FAPcekTDSdM1FpI=;
        b=qQbbS80sV6Zd8CuDlU0NTd5PzFxTEKHeVwZf9ZWXvqegG+lxuMfTyINhbWZjI5hdp6
         f0GgxpIF3WwrKZ8wI8ft8PUt3YCys7Gddwrq0B/pG17btdlHe5DJ+8+7M1QDfoHjti6J
         EOFYOrAgv48yM3ceTnvlJ6o4qSxti2vU7BIK+Yt0brJPbDgJ9x2wyQteFz/Ix83A8q/C
         Lo+uaiyg/eqenbEn4I2EVRjqbtiY0qa6SzvBa76+j47XnuIaMvsDa7iB2JVudw0ytQD2
         Cb+0vAuS/rgQW0lGeTS0CQZxWBeaaD4SXkp9EjaNphY/2TH7TGqYfzegkx2Oq4eCiY+y
         HojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nf/vn6DN/jdqsddFy69rFe9cIxF4FAPcekTDSdM1FpI=;
        b=ca8gK5RU30l9zOeTDLO0I+KYlh4j4/hPSYr58CK3iXr9YwNOvJQKqGMQvISNLzd1q/
         T8gTmUHhFZLbhoFjHnXeOXycEvBw3FiNMoohFbVnoHkjOVGpjarZS2VINrIVu7rDPsP5
         dLWy49yMHNSY9QYZvJM/qf8aHuHJfGgewa8PO7spS+uh+PQprulTnXvzoD2QZcxlocQa
         gfu958kZQpAzhVKg1SOFD16XLFCZOrMnpn9BFzEsi656IQneOAEYx319M77XPDnJCRCf
         e5EsssswWL2qUdRRKYayLwo937adYl03ZyeIdzZFzL8LYkJ9xXqzDDZMEGFiWQwPH9UK
         1Bbg==
X-Gm-Message-State: AOAM530MqrxoPGxny4XHPXASUSI3sC7tJC9bfXpAtqOg9HJPuUBMpfyJ
        hrggEfU0hn9CfOqP39le4RI=
X-Google-Smtp-Source: ABdhPJyGax3yzmV7T0UXqi2Z5jO/4jj63xTSqb14hU0IJ0/QWqkEAfKFypxYiZXt0Atz616ZThADMg==
X-Received: by 2002:a05:6a00:170a:b029:152:6881:5e2d with SMTP id h10-20020a056a00170ab029015268815e2dmr121187pfc.20.1603471840558;
        Fri, 23 Oct 2020 09:50:40 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id s25sm1885780pfh.194.2020.10.23.09.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:39 -0700 (PDT)
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
Subject: [PATCH v4 13/23] drm/msm: Add priv->mm_lock to protect active/inactive lists
Date:   Fri, 23 Oct 2020 09:51:14 -0700
Message-Id: <20201023165136.561680-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Rather than relying on the big dev->struct_mutex hammer, introduce a
more specific lock for protecting the bo lists.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c      |  7 +++++++
 drivers/gpu/drm/msm/msm_drv.c          |  7 +++++++
 drivers/gpu/drm/msm/msm_drv.h          | 13 +++++++++++-
 drivers/gpu/drm/msm/msm_gem.c          | 28 +++++++++++++++-----------
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 12 +++++++++++
 drivers/gpu/drm/msm/msm_gpu.h          |  5 ++++-
 6 files changed, 58 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index ee2e270f464c..64afbed89821 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -112,6 +112,11 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gpu *gpu = priv->gpu;
+	int ret;
+
+	ret = mutex_lock_interruptible(&priv->mm_lock);
+	if (ret)
+		return ret;
 
 	if (gpu) {
 		seq_printf(m, "Active Objects (%s):\n", gpu->name);
@@ -121,6 +126,8 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
 	seq_printf(m, "Inactive Objects:\n");
 	msm_gem_describe_objects(&priv->inactive_list, m);
 
+	mutex_unlock(&priv->mm_lock);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 49685571dc0e..81cb2cecc829 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -7,6 +7,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/kthread.h>
+#include <linux/sched/mm.h>
 #include <linux/uaccess.h>
 #include <uapi/linux/sched/types.h>
 
@@ -441,6 +442,12 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	init_llist_head(&priv->free_list);
 
 	INIT_LIST_HEAD(&priv->inactive_list);
+	mutex_init(&priv->mm_lock);
+
+	/* Teach lockdep about lock ordering wrt. shrinker: */
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&priv->mm_lock);
+	fs_reclaim_release(GFP_KERNEL);
 
 	drm_mode_config_init(ddev);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 79ee7d05b363..a17dadd38685 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -174,8 +174,19 @@ struct msm_drm_private {
 	struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
 	struct msm_perf_state *perf;
 
-	/* list of GEM objects: */
+	/*
+	 * List of inactive GEM objects.  Every bo is either in the inactive_list
+	 * or gpu->active_list (for the gpu it is active on[1])
+	 *
+	 * These lists are protected by mm_lock.  If struct_mutex is involved, it
+	 * should be aquired prior to mm_lock.  One should *not* hold mm_lock in
+	 * get_pages()/vmap()/etc paths, as they can trigger the shrinker.
+	 *
+	 * [1] if someone ever added support for the old 2d cores, there could be
+	 *     more than one gpu object
+	 */
 	struct list_head inactive_list;
+	struct mutex mm_lock;
 
 	/* worker for delayed free of objects: */
 	struct work_struct free_work;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 992cda7e4995..81ed03322a74 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -768,13 +768,17 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
+	struct msm_drm_private *priv = obj->dev->dev_private;
+
+	might_sleep();
 	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
 
 	if (!atomic_fetch_inc(&msm_obj->active_count)) {
+		mutex_lock(&priv->mm_lock);
 		msm_obj->gpu = gpu;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
+		mutex_unlock(&priv->mm_lock);
 	}
 }
 
@@ -783,12 +787,14 @@ void msm_gem_active_put(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_drm_private *priv = obj->dev->dev_private;
 
-	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
+	might_sleep();
 
 	if (!atomic_dec_return(&msm_obj->active_count)) {
+		mutex_lock(&priv->mm_lock);
 		msm_obj->gpu = NULL;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
+		mutex_unlock(&priv->mm_lock);
 	}
 }
 
@@ -943,13 +949,16 @@ static void free_object(struct msm_gem_object *msm_obj)
 {
 	struct drm_gem_object *obj = &msm_obj->base;
 	struct drm_device *dev = obj->dev;
+	struct msm_drm_private *priv = dev->dev_private;
 
 	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
 
 	/* object should not be on active list: */
 	WARN_ON(is_active(msm_obj));
 
+	mutex_lock(&priv->mm_lock);
 	list_del(&msm_obj->mm_list);
+	mutex_unlock(&priv->mm_lock);
 
 	msm_gem_lock(obj);
 
@@ -1128,14 +1137,9 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 		mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER);
 	}
 
-	if (struct_mutex_locked) {
-		WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
-	} else {
-		mutex_lock(&dev->struct_mutex);
-		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
-		mutex_unlock(&dev->struct_mutex);
-	}
+	mutex_lock(&priv->mm_lock);
+	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
+	mutex_unlock(&priv->mm_lock);
 
 	return obj;
 
@@ -1203,9 +1207,9 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 
 	msm_gem_unlock(obj);
 
-	mutex_lock(&dev->struct_mutex);
+	mutex_lock(&priv->mm_lock);
 	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
-	mutex_unlock(&dev->struct_mutex);
+	mutex_unlock(&priv->mm_lock);
 
 	return obj;
 
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 2dc0ffa925b4..6be073b8ca08 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -51,6 +51,8 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 	if (!msm_gem_shrinker_lock(dev, &unlock))
 		return 0;
 
+	mutex_lock(&priv->mm_lock);
+
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
 		if (!msm_gem_trylock(&msm_obj->base))
 			continue;
@@ -59,6 +61,8 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 		msm_gem_unlock(&msm_obj->base);
 	}
 
+	mutex_unlock(&priv->mm_lock);
+
 	if (unlock)
 		mutex_unlock(&dev->struct_mutex);
 
@@ -78,6 +82,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	if (!msm_gem_shrinker_lock(dev, &unlock))
 		return SHRINK_STOP;
 
+	mutex_lock(&priv->mm_lock);
+
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
 		if (freed >= sc->nr_to_scan)
 			break;
@@ -90,6 +96,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		msm_gem_unlock(&msm_obj->base);
 	}
 
+	mutex_unlock(&priv->mm_lock);
+
 	if (unlock)
 		mutex_unlock(&dev->struct_mutex);
 
@@ -112,6 +120,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 	if (!msm_gem_shrinker_lock(dev, &unlock))
 		return NOTIFY_DONE;
 
+	mutex_lock(&priv->mm_lock);
+
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
 		if (!msm_gem_trylock(&msm_obj->base))
 			continue;
@@ -129,6 +139,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 			break;
 	}
 
+	mutex_unlock(&priv->mm_lock);
+
 	if (unlock)
 		mutex_unlock(&dev->struct_mutex);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 6c9e1fdc1a76..1806e87600c0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -94,7 +94,10 @@ struct msm_gpu {
 	struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
 	int nr_rings;
 
-	/* list of GEM active objects: */
+	/*
+	 * List of GEM active objects on this gpu.  Protected by
+	 * msm_drm_private::mm_lock
+	 */
 	struct list_head active_list;
 
 	/* does gpu need hw_init? */
-- 
2.26.2

