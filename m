Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB48581914
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 19:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239779AbiGZRvW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 13:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239780AbiGZRuu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 13:50:50 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 268773122A;
        Tue, 26 Jul 2022 10:50:44 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id t2-20020a17090a4e4200b001f21572f3a4so13992478pjl.0;
        Tue, 26 Jul 2022 10:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zh/8/t0ZilHENXdeKCjYIuWBV3SQcdEuA5JHSYImukA=;
        b=GTpKK3lqBw/NyWp1oej+ZaKevc2p+WLuV12ibvug7cil20GX79xnP0Sm3mcGHj6UK4
         NpsrO/uapZbqeEBSSjpgzqkDVgswZa9ZKPfKA/ykGpUscs9w1Q2W4Ed5wanrOXsa/bwN
         cidEc17FxreFh/oX15q6N0B9f65a2P9iBkYtAuAlopbygbFwuzpD7wS+8ZIUikGwjRO7
         Y6XW2GAYGciK/QRWF7ut4F2TLAm2zGCCu8QKnzZUIVOkIIn3hLOoqmq9+6VqlalDogmT
         SzgbzR9Gy/8vTPObGJWVkeIouclGFtF1K64bqo+3eyB9CorDVfU/rmSQZLS1ld8LzScu
         gmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zh/8/t0ZilHENXdeKCjYIuWBV3SQcdEuA5JHSYImukA=;
        b=m+/JCJwTq1iMeWuMguxAQ2oBPUYHcvER1PNEN3wPVQ9Vepy1h3qwjKjTtjBBvLWW6w
         v+NAbXGXNMBohaJ90D9yaWbg/RtxJmtBu5O0AacjOTbaoE5et+JbXsuoTn+tP4GHFF0D
         en+WrsGgssV2NB5CoZvzUyVolnyvvUjdAOk3SfBtLrCmCTfmYalMIf08n0wLQSzUqkey
         gSK7gmZeq9vLZ/4Icea3T7kCbDlqCfNK3qJseGCVa4iAbu53LfBX57yEteV83d9sThS8
         kEO6Cblw7ljkdK52a0vpY0FgavwtFP4V58Tu8l+33SdbMffVk0ABhoxXlKtdG03qjFxe
         /9vA==
X-Gm-Message-State: AJIora+sSY6bfwnqNVl5wL+/a4zCPZcIfpUXTPdHUJ6Qlo31J4qFK0z5
        DsoWN6NMwTQrW0kBevEykzY=
X-Google-Smtp-Source: AGRyM1vUGZPuyGo3rWK8Yx9V4De98KUa7GuDrr7D0ohtXU67vembzqE9MIKZwTEqNkLZEHfDS4TgKQ==
X-Received: by 2002:a17:90b:805:b0:1f2:2fb1:e48b with SMTP id bk5-20020a17090b080500b001f22fb1e48bmr367457pjb.4.1658857843548;
        Tue, 26 Jul 2022 10:50:43 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
        by smtp.gmail.com with ESMTPSA id f16-20020a170902ab9000b0016d2d2c7df1sm11832171plr.188.2022.07.26.10.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 10:50:42 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 10/15] drm/msm/gem: Convert to using drm_gem_lru
Date:   Tue, 26 Jul 2022 10:50:34 -0700
Message-Id: <20220726175043.1027731-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726175043.1027731-1-robdclark@gmail.com>
References: <20220726175043.1027731-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This converts over to use the shared GEM LRU/shrinker helpers.  Note
that it means we are no longer tracking purgeable or willneed buffers
that are active separately.  But the most recently pinned buffers should
be at the tail of the various LRUs, and the shrinker is already prepared
to encounter objects which are still active.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c          |  14 +--
 drivers/gpu/drm/msm/msm_drv.h          |  70 +++++++++++----
 drivers/gpu/drm/msm/msm_gem.c          |  58 ++++--------
 drivers/gpu/drm/msm/msm_gem.h          |  93 --------------------
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 117 ++++++-------------------
 drivers/gpu/drm/msm/msm_gpu.c          |   3 -
 drivers/gpu/drm/msm/msm_gpu.h          |   6 --
 7 files changed, 104 insertions(+), 257 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index d7ca025457b6..1ca4a92ba96e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -418,14 +418,18 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	INIT_LIST_HEAD(&priv->objects);
 	mutex_init(&priv->obj_lock);
 
-	INIT_LIST_HEAD(&priv->inactive_willneed);
-	INIT_LIST_HEAD(&priv->inactive_dontneed);
-	INIT_LIST_HEAD(&priv->inactive_unpinned);
-	mutex_init(&priv->mm_lock);
+	/*
+	 * Initialize the LRUs:
+	 */
+	mutex_init(&priv->lru.lock);
+	drm_gem_lru_init(&priv->lru.unbacked, &priv->lru.lock);
+	drm_gem_lru_init(&priv->lru.pinned,   &priv->lru.lock);
+	drm_gem_lru_init(&priv->lru.willneed, &priv->lru.lock);
+	drm_gem_lru_init(&priv->lru.dontneed, &priv->lru.lock);
 
 	/* Teach lockdep about lock ordering wrt. shrinker: */
 	fs_reclaim_acquire(GFP_KERNEL);
-	might_lock(&priv->mm_lock);
+	might_lock(&priv->lru.lock);
 	fs_reclaim_release(GFP_KERNEL);
 
 	drm_mode_config_init(ddev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b3689a2d27d7..208ae5bc5e6b 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -142,28 +142,60 @@ struct msm_drm_private {
 	struct mutex obj_lock;
 
 	/**
-	 * LRUs of inactive GEM objects.  Every bo is either in one of the
-	 * inactive lists (depending on whether or not it is shrinkable) or
-	 * gpu->active_list (for the gpu it is active on[1]), or transiently
-	 * on a temporary list as the shrinker is running.
+	 * lru:
 	 *
-	 * Note that inactive_willneed also contains pinned and vmap'd bos,
-	 * but the number of pinned-but-not-active objects is small (scanout
-	 * buffers, ringbuffer, etc).
+	 * The various LRU's that a GEM object is in at various stages of
+	 * it's lifetime.  Objects start out in the unbacked LRU.  When
+	 * pinned (for scannout or permanently mapped GPU buffers, like
+	 * ringbuffer, memptr, fw, etc) it moves to the pinned LRU.  When
+	 * unpinned, it moves into willneed or dontneed LRU depending on
+	 * madvise state.  When backing pages are evicted (willneed) or
+	 * purged (dontneed) it moves back into the unbacked LRU.
 	 *
-	 * These lists are protected by mm_lock (which should be acquired
-	 * before per GEM object lock).  One should *not* hold mm_lock in
-	 * get_pages()/vmap()/etc paths, as they can trigger the shrinker.
-	 *
-	 * [1] if someone ever added support for the old 2d cores, there could be
-	 *     more than one gpu object
+	 * The dontneed LRU is considered by the shrinker for objects
+	 * that are candidate for purging, and the willneed LRU is
+	 * considered for objects that could be evicted.
 	 */
-	struct list_head inactive_willneed;  /* inactive + potentially unpin/evictable */
-	struct list_head inactive_dontneed;  /* inactive + shrinkable */
-	struct list_head inactive_unpinned;  /* inactive + purged or unpinned */
-	long shrinkable_count;               /* write access under mm_lock */
-	long evictable_count;                /* write access under mm_lock */
-	struct mutex mm_lock;
+	struct {
+		/**
+		 * unbacked:
+		 *
+		 * The LRU for GEM objects without backing pages allocated.
+		 * This mostly exists so that objects are always is one
+		 * LRU.
+		 */
+		struct drm_gem_lru unbacked;
+
+		/**
+		 * pinned:
+		 *
+		 * The LRU for pinned GEM objects
+		 */
+		struct drm_gem_lru pinned;
+
+		/**
+		 * willneed:
+		 *
+		 * The LRU for unpinned GEM objects which are in madvise
+		 * WILLNEED state (ie. can be evicted)
+		 */
+		struct drm_gem_lru willneed;
+
+		/**
+		 * dontneed:
+		 *
+		 * The LRU for unpinned GEM objects which are in madvise
+		 * DONTNEED state (ie. can be purged)
+		 */
+		struct drm_gem_lru dontneed;
+
+		/**
+		 * lock:
+		 *
+		 * Protects manipulation of all of the LRUs.
+		 */
+		struct mutex lock;
+	} lru;
 
 	struct workqueue_struct *wq;
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 209438744bab..d4e8af46f4ef 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -174,6 +174,7 @@ static void put_pages(struct drm_gem_object *obj)
 			put_pages_vram(obj);
 
 		msm_obj->pages = NULL;
+		update_lru(obj);
 	}
 }
 
@@ -210,8 +211,6 @@ struct page **msm_gem_pin_pages(struct drm_gem_object *obj)
 
 void msm_gem_unpin_pages(struct drm_gem_object *obj)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-
 	msm_gem_lock(obj);
 	msm_gem_unpin_locked(obj);
 	msm_gem_unlock(obj);
@@ -761,7 +760,6 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	put_iova_vmas(obj);
 
 	msm_obj->madv = __MSM_MADV_PURGED;
-	update_lru(obj);
 
 	drm_gem_free_mmap_offset(obj);
 
@@ -786,7 +784,6 @@ void msm_gem_evict(struct drm_gem_object *obj)
 
 	GEM_WARN_ON(!msm_gem_is_locked(obj));
 	GEM_WARN_ON(is_unevictable(msm_obj));
-	GEM_WARN_ON(!msm_obj->evictable);
 
 	/* Get rid of any iommu mapping(s): */
 	put_iova_spaces(obj, false);
@@ -794,8 +791,6 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
 	put_pages(obj);
-
-	update_lru(obj);
 }
 
 void msm_gem_vunmap(struct drm_gem_object *obj)
@@ -818,26 +813,20 @@ static void update_lru(struct drm_gem_object *obj)
 
 	GEM_WARN_ON(!msm_gem_is_locked(&msm_obj->base));
 
-	mutex_lock(&priv->mm_lock);
-
-	if (msm_obj->dontneed)
-		mark_unpurgeable(msm_obj);
-	if (msm_obj->evictable)
-		mark_unevictable(msm_obj);
-
-	list_del(&msm_obj->mm_list);
-	if ((msm_obj->madv == MSM_MADV_WILLNEED) && msm_obj->sgt) {
-		list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
-		mark_evictable(msm_obj);
-	} else if (msm_obj->madv == MSM_MADV_DONTNEED) {
-		list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
-		mark_purgeable(msm_obj);
+	if (!msm_obj->pages) {
+		GEM_WARN_ON(msm_obj->pin_count);
+		GEM_WARN_ON(msm_obj->vmap_count);
+
+		drm_gem_lru_move_tail(&priv->lru.unbacked, obj);
+	} else if (msm_obj->pin_count || msm_obj->vmap_count) {
+		drm_gem_lru_move_tail(&priv->lru.pinned, obj);
+	} else if (msm_obj->madv == MSM_MADV_WILLNEED) {
+		drm_gem_lru_move_tail(&priv->lru.willneed, obj);
 	} else {
-		GEM_WARN_ON((msm_obj->madv != __MSM_MADV_PURGED) && msm_obj->sgt);
-		list_add_tail(&msm_obj->mm_list, &priv->inactive_unpinned);
-	}
+		GEM_WARN_ON(msm_obj->madv != MSM_MADV_DONTNEED);
 
-	mutex_unlock(&priv->mm_lock);
+		drm_gem_lru_move_tail(&priv->lru.dontneed, obj);
+	}
 }
 
 bool msm_gem_active(struct drm_gem_object *obj)
@@ -995,12 +984,6 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 	list_del(&msm_obj->node);
 	mutex_unlock(&priv->obj_lock);
 
-	mutex_lock(&priv->mm_lock);
-	if (msm_obj->dontneed)
-		mark_unpurgeable(msm_obj);
-	list_del(&msm_obj->mm_list);
-	mutex_unlock(&priv->mm_lock);
-
 	put_iova_spaces(obj, true);
 
 	if (obj->import_attach) {
@@ -1160,13 +1143,6 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32
 
 		to_msm_bo(obj)->vram_node = &vma->node;
 
-		/* Call chain get_pages() -> update_inactive() tries to
-		 * access msm_obj->mm_list, but it is not initialized yet.
-		 * To avoid NULL pointer dereference error, initialize
-		 * mm_list to be empty.
-		 */
-		INIT_LIST_HEAD(&msm_obj->mm_list);
-
 		msm_gem_lock(obj);
 		pages = get_pages(obj);
 		msm_gem_unlock(obj);
@@ -1189,9 +1165,7 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32
 		mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER);
 	}
 
-	mutex_lock(&priv->mm_lock);
-	list_add_tail(&msm_obj->mm_list, &priv->inactive_unpinned);
-	mutex_unlock(&priv->mm_lock);
+	drm_gem_lru_move_tail(&priv->lru.unbacked, obj);
 
 	mutex_lock(&priv->obj_lock);
 	list_add_tail(&msm_obj->node, &priv->objects);
@@ -1247,9 +1221,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 
 	msm_gem_unlock(obj);
 
-	mutex_lock(&priv->mm_lock);
-	list_add_tail(&msm_obj->mm_list, &priv->inactive_unpinned);
-	mutex_unlock(&priv->mm_lock);
+	drm_gem_lru_move_tail(&priv->lru.pinned, obj);
 
 	mutex_lock(&priv->obj_lock);
 	list_add_tail(&msm_obj->node, &priv->objects);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 420ba49bf21a..0403b27ff779 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -93,16 +93,6 @@ struct msm_gem_object {
 	 */
 	uint8_t madv;
 
-	/**
-	 * Is object on inactive_dontneed list (ie. counted in priv->shrinkable_count)?
-	 */
-	bool dontneed : 1;
-
-	/**
-	 * Is object evictable (ie. counted in priv->evictable_count)?
-	 */
-	bool evictable : 1;
-
 	/**
 	 * count of active vmap'ing
 	 */
@@ -114,17 +104,6 @@ struct msm_gem_object {
 	 */
 	struct list_head node;
 
-	/**
-	 * An object is either:
-	 *  inactive - on priv->inactive_dontneed or priv->inactive_willneed
-	 *     (depending on purgeability status)
-	 *  active   - on one one of the gpu's active_list..  well, at
-	 *     least for now we don't have (I don't think) hw sync between
-	 *     2d and 3d one devices which have both, meaning we need to
-	 *     block on submit if a bo is already on other ring
-	 */
-	struct list_head mm_list;
-
 	struct page **pages;
 	struct sg_table *sgt;
 	void *vaddr;
@@ -206,12 +185,6 @@ msm_gem_lock(struct drm_gem_object *obj)
 	dma_resv_lock(obj->resv, NULL);
 }
 
-static inline bool __must_check
-msm_gem_trylock(struct drm_gem_object *obj)
-{
-	return dma_resv_trylock(obj->resv);
-}
-
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
@@ -260,77 +233,11 @@ static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
 	return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
 }
 
-static inline void mark_purgeable(struct msm_gem_object *msm_obj)
-{
-	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
-
-	GEM_WARN_ON(!mutex_is_locked(&priv->mm_lock));
-
-	if (is_unpurgeable(msm_obj))
-		return;
-
-	if (GEM_WARN_ON(msm_obj->dontneed))
-		return;
-
-	priv->shrinkable_count += msm_obj->base.size >> PAGE_SHIFT;
-	msm_obj->dontneed = true;
-}
-
-static inline void mark_unpurgeable(struct msm_gem_object *msm_obj)
-{
-	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
-
-	GEM_WARN_ON(!mutex_is_locked(&priv->mm_lock));
-
-	if (is_unpurgeable(msm_obj))
-		return;
-
-	if (GEM_WARN_ON(!msm_obj->dontneed))
-		return;
-
-	priv->shrinkable_count -= msm_obj->base.size >> PAGE_SHIFT;
-	GEM_WARN_ON(priv->shrinkable_count < 0);
-	msm_obj->dontneed = false;
-}
-
 static inline bool is_unevictable(struct msm_gem_object *msm_obj)
 {
 	return is_unpurgeable(msm_obj) || msm_obj->vaddr;
 }
 
-static inline void mark_evictable(struct msm_gem_object *msm_obj)
-{
-	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
-
-	WARN_ON(!mutex_is_locked(&priv->mm_lock));
-
-	if (is_unevictable(msm_obj))
-		return;
-
-	if (WARN_ON(msm_obj->evictable))
-		return;
-
-	priv->evictable_count += msm_obj->base.size >> PAGE_SHIFT;
-	msm_obj->evictable = true;
-}
-
-static inline void mark_unevictable(struct msm_gem_object *msm_obj)
-{
-	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
-
-	WARN_ON(!mutex_is_locked(&priv->mm_lock));
-
-	if (is_unevictable(msm_obj))
-		return;
-
-	if (WARN_ON(!msm_obj->evictable))
-		return;
-
-	priv->evictable_count -= msm_obj->base.size >> PAGE_SHIFT;
-	WARN_ON(priv->evictable_count < 0);
-	msm_obj->evictable = false;
-}
-
 void msm_gem_purge(struct drm_gem_object *obj);
 void msm_gem_evict(struct drm_gem_object *obj);
 void msm_gem_vunmap(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index ea8ed74982c1..530b1102b46d 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -29,121 +29,61 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
-	unsigned count = priv->shrinkable_count;
+	unsigned count = priv->lru.dontneed.count;
 
 	if (can_swap())
-		count += priv->evictable_count;
+		count += priv->lru.willneed.count;
 
 	return count;
 }
 
 static bool
-purge(struct msm_gem_object *msm_obj)
+purge(struct drm_gem_object *obj)
 {
-	if (!is_purgeable(msm_obj))
+	if (!is_purgeable(to_msm_bo(obj)))
 		return false;
 
-	if (msm_gem_active(&msm_obj->base))
+	if (msm_gem_active(obj))
 		return false;
 
-	/*
-	 * This will move the obj out of still_in_list to
-	 * the purged list
-	 */
-	msm_gem_purge(&msm_obj->base);
+	msm_gem_purge(obj);
 
 	return true;
 }
 
 static bool
-evict(struct msm_gem_object *msm_obj)
+evict(struct drm_gem_object *obj)
 {
-	if (is_unevictable(msm_obj))
+	if (is_unevictable(to_msm_bo(obj)))
 		return false;
 
-	if (msm_gem_active(&msm_obj->base))
+	if (msm_gem_active(obj))
 		return false;
 
-	msm_gem_evict(&msm_obj->base);
+	msm_gem_evict(obj);
 
 	return true;
 }
 
-static unsigned long
-scan(struct msm_drm_private *priv, unsigned nr_to_scan, struct list_head *list,
-		bool (*shrink)(struct msm_gem_object *msm_obj))
-{
-	unsigned freed = 0;
-	struct list_head still_in_list;
-
-	INIT_LIST_HEAD(&still_in_list);
-
-	mutex_lock(&priv->mm_lock);
-
-	while (freed < nr_to_scan) {
-		struct msm_gem_object *msm_obj = list_first_entry_or_null(
-				list, typeof(*msm_obj), mm_list);
-
-		if (!msm_obj)
-			break;
-
-		list_move_tail(&msm_obj->mm_list, &still_in_list);
-
-		/*
-		 * If it is in the process of being freed, msm_gem_free_object
-		 * can be blocked on mm_lock waiting to remove it.  So just
-		 * skip it.
-		 */
-		if (!kref_get_unless_zero(&msm_obj->base.refcount))
-			continue;
-
-		/*
-		 * Now that we own a reference, we can drop mm_lock for the
-		 * rest of the loop body, to reduce contention with the
-		 * retire_submit path (which could make more objects purgeable)
-		 */
-
-		mutex_unlock(&priv->mm_lock);
-
-		/*
-		 * Note that this still needs to be trylock, since we can
-		 * hit shrinker in response to trying to get backing pages
-		 * for this obj (ie. while it's lock is already held)
-		 */
-		if (!msm_gem_trylock(&msm_obj->base))
-			goto tail;
-
-		if (shrink(msm_obj))
-			freed += msm_obj->base.size >> PAGE_SHIFT;
-
-		msm_gem_unlock(&msm_obj->base);
-
-tail:
-		drm_gem_object_put(&msm_obj->base);
-		mutex_lock(&priv->mm_lock);
-	}
-
-	list_splice_tail(&still_in_list, list);
-	mutex_unlock(&priv->mm_lock);
-
-	return freed;
-}
-
 static unsigned long
 msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
+	long nr = sc->nr_to_scan;
 	unsigned long freed;
 
-	freed = scan(priv, sc->nr_to_scan, &priv->inactive_dontneed, purge);
+	freed = drm_gem_lru_scan(&priv->lru.dontneed, nr, purge);
+	nr -= freed;
 
 	if (freed > 0)
 		trace_msm_gem_purge(freed << PAGE_SHIFT);
 
-	if (can_swap() && freed < sc->nr_to_scan) {
-		int evicted = scan(priv, sc->nr_to_scan - freed,
-				&priv->inactive_willneed, evict);
+	if (can_swap() && nr > 0) {
+		unsigned long evicted;
+
+		evicted = drm_gem_lru_scan(&priv->lru.willneed, nr, evict);
+		nr -= evicted;
 
 		if (evicted > 0)
 			trace_msm_gem_evict(evicted << PAGE_SHIFT);
@@ -179,12 +119,12 @@ msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
 static const int vmap_shrink_limit = 15;
 
 static bool
-vmap_shrink(struct msm_gem_object *msm_obj)
+vmap_shrink(struct drm_gem_object *obj)
 {
-	if (!is_vunmapable(msm_obj))
+	if (!is_vunmapable(to_msm_bo(obj)))
 		return false;
 
-	msm_gem_vunmap(&msm_obj->base);
+	msm_gem_vunmap(obj);
 
 	return true;
 }
@@ -194,17 +134,18 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 {
 	struct msm_drm_private *priv =
 		container_of(nb, struct msm_drm_private, vmap_notifier);
-	struct list_head *mm_lists[] = {
-		&priv->inactive_dontneed,
-		&priv->inactive_willneed,
-		priv->gpu ? &priv->gpu->active_list : NULL,
+	struct drm_gem_lru *lrus[] = {
+		&priv->lru.dontneed,
+		&priv->lru.willneed,
+		&priv->lru.pinned,
 		NULL,
 	};
 	unsigned idx, unmapped = 0;
 
-	for (idx = 0; mm_lists[idx] && unmapped < vmap_shrink_limit; idx++) {
-		unmapped += scan(priv, vmap_shrink_limit - unmapped,
-				mm_lists[idx], vmap_shrink);
+	for (idx = 0; lrus[idx] && unmapped < vmap_shrink_limit; idx++) {
+		unmapped += drm_gem_lru_scan(lrus[idx],
+					     vmap_shrink_limit - unmapped,
+					     vmap_shrink);
 	}
 
 	*(unsigned long *)ptr += unmapped;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c2bfcf3f1f40..fba85f894314 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -846,7 +846,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	sched_set_fifo_low(gpu->worker->task);
 
-	INIT_LIST_HEAD(&gpu->active_list);
 	mutex_init(&gpu->active_lock);
 	mutex_init(&gpu->lock);
 	init_waitqueue_head(&gpu->retire_event);
@@ -974,8 +973,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 
 	DBG("%s", gpu->name);
 
-	WARN_ON(!list_empty(&gpu->active_list));
-
 	for (i = 0; i < ARRAY_SIZE(gpu->rb); i++) {
 		msm_ringbuffer_destroy(gpu->rb[i]);
 		gpu->rb[i] = NULL;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 962d2070bcdf..a0885ff99e5b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -187,12 +187,6 @@ struct msm_gpu {
 	 */
 	int cur_ctx_seqno;
 
-	/*
-	 * List of GEM active objects on this gpu.  Protected by
-	 * msm_drm_private::mm_lock
-	 */
-	struct list_head active_list;
-
 	/**
 	 * lock:
 	 *
-- 
2.36.1

