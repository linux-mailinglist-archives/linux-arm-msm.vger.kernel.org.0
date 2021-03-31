Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6E45350A05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 00:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhCaWNk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 18:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbhCaWNM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 18:13:12 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC31C061574;
        Wed, 31 Mar 2021 15:13:12 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id k8so286952pgf.4;
        Wed, 31 Mar 2021 15:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5sYnXbCaJ1X4N5krOujp9YshPiKe4TdK5L4EckjnzvM=;
        b=pwz88OBvYt2br0+b4+cotoAWsMgFjyx3D4xp9+ifNTL1xRSNFPbHvWZ8KAB1PYzOMi
         GNKVl+FwYiNBcQCYTj1sT6kYGsuz/KDsJH16fWxVhkVXWx6pt350mv+9MsWSWumunP0b
         uybmKhMWN1+IOWTTBGzWxcfivjlLAx7l7ADtaoDByCVO1ORsnQJBOzxPkGM6v4cfExUN
         hjciKyFjSDyRvItdTtd6NwuBviTWOVBQSNv6Qnr7EM3q3CMC6hbp1gTXW0TxwbUlS+H9
         6xl3tzhGDh7KrWwNRo6EGlJ1hUPB+S8C7qSg7jMsr0xhKG1IEK/6nnQGIwjsXKEv57yY
         WdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5sYnXbCaJ1X4N5krOujp9YshPiKe4TdK5L4EckjnzvM=;
        b=MJlEEW5K9H+lC7N+60bNx9DlWJMSzLApX95IzDbJi5JpGSmYopZw62LSS5FRi/5AAl
         fwn/VYrugjOHx2fLOvf8lR98YKL4zkyDuV3L7cx0iXrBi/6r4xNFfvZLARJTsAb+HNaM
         fLFe5rDHCzL9YDrHxvdgllrsPBG8HAiRknF5uj/I/qlET9TbSp4oPGTkkj87qm172Zaz
         036YuWpAW902jrQMJHd/Bg+LdNkArqln/lSJTOykE4gp2wkHQs84h1ZOIOtExCwi5vBm
         I5l91Ps3bR94IjgQYdpdGZ58VGafgO7g7KwpHV1L2rk9qL1xTcAgETvaqLf5Fs6ml9Pk
         CCmg==
X-Gm-Message-State: AOAM5301VG8MPQoyadILA87LqiBjPvcLN0DAGaarP2AAhHOQxGxox/sD
        EHVAm6nbTPV80Bu0P21DrQQ=
X-Google-Smtp-Source: ABdhPJzURWwRi4NYH6E1auWnJvO22WQV0NPISUQDNJ1JW9OdAVw0kbzCDQLQk8WIZ/XQyzgA+QBtpA==
X-Received: by 2002:aa7:9a95:0:b029:1f3:4169:ccf2 with SMTP id w21-20020aa79a950000b02901f34169ccf2mr4811338pfi.14.1617228791924;
        Wed, 31 Mar 2021 15:13:11 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id w15sm3096114pfn.84.2021.03.31.15.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 15:13:11 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/4] drm/msm: Avoid mutex in shrinker_count()
Date:   Wed, 31 Mar 2021 15:16:27 -0700
Message-Id: <20210331221630.488498-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331221630.488498-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

When the system is under heavy memory pressure, we can end up with lots
of concurrent calls into the shrinker.  Keeping a running tab on what we
can shrink avoids grabbing a lock in shrinker->count(), and avoids
shrinker->scan() getting called when not profitable.

Also, we can keep purged objects in their own list to avoid re-traversing
them to help cut down time in the critical section further.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c          |  1 +
 drivers/gpu/drm/msm/msm_drv.h          |  2 ++
 drivers/gpu/drm/msm/msm_gem.c          | 16 +++++++++++--
 drivers/gpu/drm/msm/msm_gem.h          | 32 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 17 +-------------
 5 files changed, 50 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4f9fa0189a07..3462b0ea14c6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -476,6 +476,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	INIT_LIST_HEAD(&priv->inactive_willneed);
 	INIT_LIST_HEAD(&priv->inactive_dontneed);
+	INIT_LIST_HEAD(&priv->inactive_purged);
 	mutex_init(&priv->mm_lock);
 
 	/* Teach lockdep about lock ordering wrt. shrinker: */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a1264cfcac5e..3ead5755f695 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -188,6 +188,8 @@ struct msm_drm_private {
 	 */
 	struct list_head inactive_willneed;  /* inactive + !shrinkable */
 	struct list_head inactive_dontneed;  /* inactive +  shrinkable */
+	struct list_head inactive_purged;    /* inactive +  purged */
+	int shrinkable_count;                /* write access under mm_lock */
 	struct mutex mm_lock;
 
 	struct workqueue_struct *wq;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9d10739c4eb2..74a92eedc992 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -719,6 +719,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	put_iova_vmas(obj);
 
 	msm_obj->madv = __MSM_MADV_PURGED;
+	mark_unpurgable(msm_obj);
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 	drm_gem_free_mmap_offset(obj);
@@ -790,6 +791,7 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	might_sleep();
 	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
+	WARN_ON(msm_obj->dontneed);
 
 	if (msm_obj->active_count++ == 0) {
 		mutex_lock(&priv->mm_lock);
@@ -818,11 +820,19 @@ static void update_inactive(struct msm_gem_object *msm_obj)
 	mutex_lock(&priv->mm_lock);
 	WARN_ON(msm_obj->active_count != 0);
 
+	if (msm_obj->dontneed)
+		mark_unpurgable(msm_obj);
+
 	list_del_init(&msm_obj->mm_list);
-	if (msm_obj->madv == MSM_MADV_WILLNEED)
+	if (msm_obj->madv == MSM_MADV_WILLNEED) {
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
-	else
+	} else if (msm_obj->madv == MSM_MADV_DONTNEED) {
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
+		mark_purgable(msm_obj);
+	} else {
+		WARN_ON(msm_obj->madv != __MSM_MADV_PURGED);
+		list_add_tail(&msm_obj->mm_list, &priv->inactive_purged);
+	}
 
 	mutex_unlock(&priv->mm_lock);
 }
@@ -971,6 +981,8 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	struct msm_drm_private *priv = dev->dev_private;
 
 	mutex_lock(&priv->mm_lock);
+	if (msm_obj->dontneed)
+		mark_unpurgable(msm_obj);
 	list_del(&msm_obj->mm_list);
 	mutex_unlock(&priv->mm_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7a9107cf1818..0feabae75d3d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -50,6 +50,11 @@ struct msm_gem_object {
 	 */
 	uint8_t madv;
 
+	/**
+	 * Is object on inactive_dontneed list (ie. counted in priv->shrinkable_count)?
+	 */
+	bool dontneed : 1;
+
 	/**
 	 * count of active vmap'ing
 	 */
@@ -198,6 +203,33 @@ static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
 	return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
 }
 
+static inline void mark_purgable(struct msm_gem_object *msm_obj)
+{
+	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
+
+	WARN_ON(!mutex_is_locked(&priv->mm_lock));
+
+	if (WARN_ON(msm_obj->dontneed))
+		return;
+
+	priv->shrinkable_count += msm_obj->base.size >> PAGE_SHIFT;
+	msm_obj->dontneed = true;
+}
+
+static inline void mark_unpurgable(struct msm_gem_object *msm_obj)
+{
+	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
+
+	WARN_ON(!mutex_is_locked(&priv->mm_lock));
+
+	if (WARN_ON(!msm_obj->dontneed))
+		return;
+
+	priv->shrinkable_count -= msm_obj->base.size >> PAGE_SHIFT;
+	WARN_ON(priv->shrinkable_count < 0);
+	msm_obj->dontneed = false;
+}
+
 void msm_gem_purge(struct drm_gem_object *obj);
 void msm_gem_vunmap(struct drm_gem_object *obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 9d5248be746f..7db8375f2430 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -14,22 +14,7 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
-	struct msm_gem_object *msm_obj;
-	unsigned long count = 0;
-
-	mutex_lock(&priv->mm_lock);
-
-	list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
-		if (!msm_gem_trylock(&msm_obj->base))
-			continue;
-		if (is_purgeable(msm_obj))
-			count += msm_obj->base.size >> PAGE_SHIFT;
-		msm_gem_unlock(&msm_obj->base);
-	}
-
-	mutex_unlock(&priv->mm_lock);
-
-	return count;
+	return priv->shrinkable_count;
 }
 
 static unsigned long
-- 
2.30.2

