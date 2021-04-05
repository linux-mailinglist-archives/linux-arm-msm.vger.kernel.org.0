Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2673D354636
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 19:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239429AbhDERmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 13:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239424AbhDERmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 13:42:24 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D53DC061756;
        Mon,  5 Apr 2021 10:42:17 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id z16so1173716pga.1;
        Mon, 05 Apr 2021 10:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sHChho7zMUiHOnTsFblEmDhAGhcQTocBf3TEMdJd+tY=;
        b=K3oGoYSRmlEfhUMGRq3WGqZGqilwkwmulVgJ92meU6+ihbOeYaJJhXJpgjcdzRvazl
         Lga9QxQfvx/FyHrKJRrpjuV/d0psQu6xMZDuJ/2OnNOlaDwbU74ByGiGMlmVOHrb79Hf
         KQ6Kbsmkk32THBDqakI8ZVIW995Sz9TeKtVTD0hz7aWK4IqI62j3GYGeQVJXHMmXNCOE
         1qTfWpIPq+n+5EnZYDdbquw0u3mZp2xdgJNc+SsOlxlfo/5NgR5Y8U4h5UKE4lMBwq0C
         UAxtYa+oYqu8D68QBjuUiuYrNdlUINA1NJcSXZCncFKdsXIfyZ5E0PugSyII5i3iLy5G
         IYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sHChho7zMUiHOnTsFblEmDhAGhcQTocBf3TEMdJd+tY=;
        b=gQQPdz15NrVEeRz4f46u9BB9x4sb+LviiZF+DMzr93oIKKKk62MtJcSn+VYpzXyyGs
         17YMk9uERIaspQmN8XGyFmIKCOV/MKxeYl2Re+lbQg3YjyYM4y7j+yHkqLKm013wuWJO
         UaAvzXHPVmYLu6exzg+y5qxbwcpRRYsU2ZUpxDkxR7KZpWCAGX1u3EYk96y+wzex38tM
         RDpM0A4jN+/k07kXEuu7OT81VelvVWOEi+9SLYR49EvX0MT5URc+dp8SySzgNyGhgXXl
         CLpEe77gVGonLt1kon9uupxIq/zMBrWM4lxl+yobT0QrwiHI3zIJHdojak4dzPU73pCt
         6ntw==
X-Gm-Message-State: AOAM533Yso4x9HfGbPACOkTD+UPqpOViovlmdNdzTBhugfVcyU0gY99t
        dbSI7uMgIpffB+8POqdAWuw=
X-Google-Smtp-Source: ABdhPJyrMISSr0sdcuXCm4ayrqtIlCTOJMOezpXviaCFdDfrnlFkeK1xFXqgU2PbrREfywv1AlBu7Q==
X-Received: by 2002:a63:aa48:: with SMTP id x8mr23969338pgo.246.1617644536531;
        Mon, 05 Apr 2021 10:42:16 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id gz12sm92813pjb.33.2021.04.05.10.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 10:42:15 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/8] drm/msm: Track potentially evictable objects
Date:   Mon,  5 Apr 2021 10:45:29 -0700
Message-Id: <20210405174532.1441497-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405174532.1441497-1-robdclark@gmail.com>
References: <20210405174532.1441497-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Objects that are potential for swapping out are (1) willneed (ie. if
they are purgable/MADV_WONTNEED we can just free the pages without them
having to land in swap), (2) not on an active list, (3) not dma-buf
imported or exported, and (4) not vmap'd.  This repurposes the purged
list for objects that do not have backing pages (either because they
have not been pinned for the first time yet, or in a later patch because
they have been unpinned/evicted.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.h | 13 ++++++----
 drivers/gpu/drm/msm/msm_gem.c | 44 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/msm/msm_gem.h | 45 +++++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e12d5fbd0a34..d3d6c743b7af 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -451,7 +451,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	INIT_LIST_HEAD(&priv->inactive_willneed);
 	INIT_LIST_HEAD(&priv->inactive_dontneed);
-	INIT_LIST_HEAD(&priv->inactive_purged);
+	INIT_LIST_HEAD(&priv->inactive_unpinned);
 	mutex_init(&priv->mm_lock);
 
 	/* Teach lockdep about lock ordering wrt. shrinker: */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6a42cdf4cf7e..2668941df529 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -182,11 +182,15 @@ struct msm_drm_private {
 	struct mutex obj_lock;
 
 	/**
-	 * Lists of inactive GEM objects.  Every bo is either in one of the
+	 * LRUs of inactive GEM objects.  Every bo is either in one of the
 	 * inactive lists (depending on whether or not it is shrinkable) or
 	 * gpu->active_list (for the gpu it is active on[1]), or transiently
 	 * on a temporary list as the shrinker is running.
 	 *
+	 * Note that inactive_willneed also contains pinned and vmap'd bos,
+	 * but the number of pinned-but-not-active objects is small (scanout
+	 * buffers, ringbuffer, etc).
+	 *
 	 * These lists are protected by mm_lock (which should be acquired
 	 * before per GEM object lock).  One should *not* hold mm_lock in
 	 * get_pages()/vmap()/etc paths, as they can trigger the shrinker.
@@ -194,10 +198,11 @@ struct msm_drm_private {
 	 * [1] if someone ever added support for the old 2d cores, there could be
 	 *     more than one gpu object
 	 */
-	struct list_head inactive_willneed;  /* inactive + !shrinkable */
-	struct list_head inactive_dontneed;  /* inactive +  shrinkable */
-	struct list_head inactive_purged;    /* inactive +  purged */
+	struct list_head inactive_willneed;  /* inactive + potentially unpin/evictable */
+	struct list_head inactive_dontneed;  /* inactive + shrinkable */
+	struct list_head inactive_unpinned;  /* inactive + purged or unpinned */
 	long shrinkable_count;               /* write access under mm_lock */
+	long evictable_count;                /* write access under mm_lock */
 	struct mutex mm_lock;
 
 	struct workqueue_struct *wq;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9ff37904ec2b..9ac89951080c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -130,6 +130,9 @@ static struct page **get_pages(struct drm_gem_object *obj)
 		 */
 		if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
 			sync_for_device(msm_obj);
+
+		GEM_WARN_ON(msm_obj->active_count);
+		update_inactive(msm_obj);
 	}
 
 	return msm_obj->pages;
@@ -428,7 +431,7 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 	struct page **pages;
-	int prot = IOMMU_READ;
+	int ret, prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
 		prot |= IOMMU_WRITE;
@@ -449,8 +452,13 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	return msm_gem_map_vma(aspace, vma, prot,
+	ret = msm_gem_map_vma(aspace, vma, prot,
 			msm_obj->sgt, obj->size >> PAGE_SHIFT);
+
+	if (!ret)
+		msm_obj->pin_count++;
+
+	return ret;
 }
 
 static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
@@ -542,14 +550,21 @@ uint64_t msm_gem_iova(struct drm_gem_object *obj,
 void msm_gem_unpin_iova_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	vma = lookup_vma(obj, aspace);
 
-	if (!GEM_WARN_ON(!vma))
+	if (!GEM_WARN_ON(!vma)) {
 		msm_gem_unmap_vma(aspace, vma);
+
+		msm_obj->pin_count--;
+		GEM_WARN_ON(msm_obj->pin_count < 0);
+
+		update_inactive(msm_obj);
+	}
 }
 
 /*
@@ -800,9 +815,12 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	GEM_WARN_ON(!msm_gem_is_locked(obj));
 	GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
 	GEM_WARN_ON(msm_obj->dontneed);
+	GEM_WARN_ON(!msm_obj->sgt);
 
 	if (msm_obj->active_count++ == 0) {
 		mutex_lock(&priv->mm_lock);
+		if (msm_obj->evictable)
+			mark_unevictable(msm_obj);
 		list_del(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
 		mutex_unlock(&priv->mm_lock);
@@ -825,21 +843,28 @@ static void update_inactive(struct msm_gem_object *msm_obj)
 {
 	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
 
+	GEM_WARN_ON(!msm_gem_is_locked(&msm_obj->base));
+
+	if (msm_obj->active_count != 0)
+		return;
+
 	mutex_lock(&priv->mm_lock);
-	GEM_WARN_ON(msm_obj->active_count != 0);
 
 	if (msm_obj->dontneed)
 		mark_unpurgable(msm_obj);
+	if (msm_obj->evictable)
+		mark_unevictable(msm_obj);
 
 	list_del(&msm_obj->mm_list);
-	if (msm_obj->madv == MSM_MADV_WILLNEED) {
+	if ((msm_obj->madv == MSM_MADV_WILLNEED) && msm_obj->sgt) {
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
+		mark_evictable(msm_obj);
 	} else if (msm_obj->madv == MSM_MADV_DONTNEED) {
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
 		mark_purgable(msm_obj);
 	} else {
-		GEM_WARN_ON(msm_obj->madv != __MSM_MADV_PURGED);
-		list_add_tail(&msm_obj->mm_list, &priv->inactive_purged);
+		GEM_WARN_ON((msm_obj->madv != __MSM_MADV_PURGED) && msm_obj->sgt);
+		list_add_tail(&msm_obj->mm_list, &priv->inactive_unpinned);
 	}
 
 	mutex_unlock(&priv->mm_lock);
@@ -1201,8 +1226,7 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	}
 
 	mutex_lock(&priv->mm_lock);
-	/* Initially obj is idle, obj->madv == WILLNEED: */
-	list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
+	list_add_tail(&msm_obj->mm_list, &priv->inactive_unpinned);
 	mutex_unlock(&priv->mm_lock);
 
 	mutex_lock(&priv->obj_lock);
@@ -1276,7 +1300,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	msm_gem_unlock(obj);
 
 	mutex_lock(&priv->mm_lock);
-	list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
+	list_add_tail(&msm_obj->mm_list, &priv->inactive_unpinned);
 	mutex_unlock(&priv->mm_lock);
 
 	mutex_lock(&priv->obj_lock);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index e13a9301b616..39b2e5584f97 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -60,6 +60,11 @@ struct msm_gem_object {
 	 */
 	bool dontneed : 1;
 
+	/**
+	 * Is object evictable (ie. counted in priv->evictable_count)?
+	 */
+	bool evictable : 1;
+
 	/**
 	 * count of active vmap'ing
 	 */
@@ -103,6 +108,7 @@ struct msm_gem_object {
 	char name[32]; /* Identifier to print for the debugfs files */
 
 	int active_count;
+	int pin_count;
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
@@ -263,7 +269,46 @@ static inline void mark_unpurgable(struct msm_gem_object *msm_obj)
 	msm_obj->dontneed = false;
 }
 
+static inline bool is_unevictable(struct msm_gem_object *msm_obj)
+{
+	return is_unpurgable(msm_obj) || msm_obj->pin_count || msm_obj->vaddr;
+}
+
+static inline void mark_evictable(struct msm_gem_object *msm_obj)
+{
+	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
+
+	WARN_ON(!mutex_is_locked(&priv->mm_lock));
+
+	if (is_unevictable(msm_obj))
+		return;
+
+	if (WARN_ON(msm_obj->evictable))
+		return;
+
+	priv->evictable_count += msm_obj->base.size >> PAGE_SHIFT;
+	msm_obj->evictable = true;
+}
+
+static inline void mark_unevictable(struct msm_gem_object *msm_obj)
+{
+	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
+
+	WARN_ON(!mutex_is_locked(&priv->mm_lock));
+
+	if (is_unevictable(msm_obj))
+		return;
+
+	if (WARN_ON(!msm_obj->evictable))
+		return;
+
+	priv->evictable_count -= msm_obj->base.size >> PAGE_SHIFT;
+	WARN_ON(priv->evictable_count < 0);
+	msm_obj->evictable = false;
+}
+
 void msm_gem_purge(struct drm_gem_object *obj);
+void msm_gem_evict(struct drm_gem_object *obj);
 void msm_gem_vunmap(struct drm_gem_object *obj);
 
 /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
-- 
2.30.2

