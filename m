Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8D4228ABD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgJLCJL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbgJLCI7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:08:59 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1515EC0613D1;
        Sun, 11 Oct 2020 19:08:58 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id c20so1527761pfr.8;
        Sun, 11 Oct 2020 19:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Oh42LDxapEVsr08xso+zIkteFrHOEURl7Ox6/NemvA=;
        b=elG/l8t0KoDrN6fA3BMNkVOrL1bj7/pqOd7/fdpGUlQ9ItbHJZuFMP4hhW3LajCayv
         Bnu3WOBPa4CwOIPWHwpmeugI87x/TUSU9jwY7eAIKEApYlmuRJme7AWxDC/+kzhvIc7/
         NgYLTCgdbnACkDr5anJmvz/CxGx/nzXkZP21sebXW+yFcN9IkgUBNc5CtsJGaTGc1vGt
         bSzB+n4z9fcbDPAaParwv+7KImAqencoISr4tRQ7MVEluGk4TCxCA9yjrKUL8fIjutZt
         OTebK4zAGuIGfGHBgCH30gK2bRgKiYKqEgzou7+oL3emr1k8oJLdKMzJuBG0SsjEdl7W
         fmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Oh42LDxapEVsr08xso+zIkteFrHOEURl7Ox6/NemvA=;
        b=TiWivKJof0c09XNkO/lRLblS7pBcGGtVTZ3V/clmDrzASEOtdmxMXBklanOyWDg93b
         a3rkP4LKemvmJ1AplMrxsSXSVrqLCHugbBbJmq/ITxAb057VJAFYn1t/ThK/nrZSzCQN
         9nRCZeAqjYhzkQn54HlxEjemyqaqIysC/hLeQJGVzLo9o5cofNHBoXDkUZezpeohXZox
         AgFCdmGMcCZiwISNLUlYbZaA/1uQOfT4ACJS3+C18lBOuetDK8n84j2WYU7sLrlkc+uO
         GaScoxxCySh2mKrph2rG9VU/dgRU295/n/SxqrKDyx6Le7zMDCYMAw/biAgafrrj0OYY
         /OIA==
X-Gm-Message-State: AOAM532vBgt5ugbFAx0VvVx400EhXme8l/n8Uwe+ThNkyJM1RJmoJGEm
        AiPYolMpmGSCCK+6DG6ZFk8=
X-Google-Smtp-Source: ABdhPJzKiDq5PhzQF6iqJJoDdoW9g+G5RlA2BsKHieaUWHFe0I69EkRcWmT8hTB/F34ipSXL3QKg7g==
X-Received: by 2002:a65:67d0:: with SMTP id b16mr2213165pgs.335.1602468537570;
        Sun, 11 Oct 2020 19:08:57 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id p19sm17527645pfn.204.2020.10.11.19.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:08:56 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 05/22] drm/msm/gem: Move locking in shrinker path
Date:   Sun, 11 Oct 2020 19:09:32 -0700
Message-Id: <20201012020958.229288-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Move grabbing the bo lock into shrinker, with a msm_gem_trylock() to
skip over bo's that are already locked.  This gets rid of the nested
lock classes.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          | 24 +++++----------------
 drivers/gpu/drm/msm/msm_gem.h          | 29 ++++++++++----------------
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 27 +++++++++++++++++-------
 3 files changed, 35 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 7bca2e815933..ff8ca257bdc6 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -17,8 +17,6 @@
 #include "msm_gpu.h"
 #include "msm_mmu.h"
 
-static void msm_gem_vunmap_locked(struct drm_gem_object *obj);
-
 
 static dma_addr_t physaddr(struct drm_gem_object *obj)
 {
@@ -672,20 +670,19 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 	return (madv != __MSM_MADV_PURGED);
 }
 
-void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subclass)
+void msm_gem_purge(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
+	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(!is_purgeable(msm_obj));
 	WARN_ON(obj->import_attach);
 
-	mutex_lock_nested(&msm_obj->lock, subclass);
-
 	put_iova(obj);
 
-	msm_gem_vunmap_locked(obj);
+	msm_gem_vunmap(obj);
 
 	put_pages(obj);
 
@@ -703,11 +700,9 @@ void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subclass)
 
 	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping,
 			0, (loff_t)-1);
-
-	msm_gem_unlock(obj);
 }
 
-static void msm_gem_vunmap_locked(struct drm_gem_object *obj)
+void msm_gem_vunmap(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
@@ -720,15 +715,6 @@ static void msm_gem_vunmap_locked(struct drm_gem_object *obj)
 	msm_obj->vaddr = NULL;
 }
 
-void msm_gem_vunmap(struct drm_gem_object *obj, enum msm_gem_lock subclass)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-
-	mutex_lock_nested(&msm_obj->lock, subclass);
-	msm_gem_vunmap_locked(obj);
-	msm_gem_unlock(obj);
-}
-
 /* must be called before _move_to_active().. */
 int msm_gem_sync_object(struct drm_gem_object *obj,
 		struct msm_fence_context *fctx, bool exclusive)
@@ -965,7 +951,7 @@ static void free_object(struct msm_gem_object *msm_obj)
 
 		drm_prime_gem_destroy(obj, msm_obj->sgt);
 	} else {
-		msm_gem_vunmap_locked(obj);
+		msm_gem_vunmap(obj);
 		put_pages(obj);
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 016f616dd118..947eeaca661d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -160,6 +160,13 @@ msm_gem_lock(struct drm_gem_object *obj)
 	mutex_lock(&msm_obj->lock);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	return mutex_trylock_recursive(&msm_obj->lock) == MUTEX_TRYLOCK_SUCCESS;
+}
+
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
@@ -188,6 +195,7 @@ static inline bool is_active(struct msm_gem_object *msm_obj)
 
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
 {
+	WARN_ON(!msm_gem_is_locked(&msm_obj->base));
 	WARN_ON(!mutex_is_locked(&msm_obj->base.dev->struct_mutex));
 	return (msm_obj->madv == MSM_MADV_DONTNEED) && msm_obj->sgt &&
 			!msm_obj->base.dma_buf && !msm_obj->base.import_attach;
@@ -195,27 +203,12 @@ static inline bool is_purgeable(struct msm_gem_object *msm_obj)
 
 static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
 {
+	WARN_ON(!msm_gem_is_locked(&msm_obj->base));
 	return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
 }
 
-/* The shrinker can be triggered while we hold objA->lock, and need
- * to grab objB->lock to purge it.  Lockdep just sees these as a single
- * class of lock, so we use subclasses to teach it the difference.
- *
- * OBJ_LOCK_NORMAL is implicit (ie. normal mutex_lock() call), and
- * OBJ_LOCK_SHRINKER is used by shrinker.
- *
- * It is *essential* that we never go down paths that could trigger the
- * shrinker for a purgable object.  This is ensured by checking that
- * msm_obj->madv == MSM_MADV_WILLNEED.
- */
-enum msm_gem_lock {
-	OBJ_LOCK_NORMAL,
-	OBJ_LOCK_SHRINKER,
-};
-
-void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subclass);
-void msm_gem_vunmap(struct drm_gem_object *obj, enum msm_gem_lock subclass);
+void msm_gem_purge(struct drm_gem_object *obj);
+void msm_gem_vunmap(struct drm_gem_object *obj);
 void msm_gem_free_work(struct work_struct *work);
 
 /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 482576d7a39a..2dc0ffa925b4 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -52,8 +52,11 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 		return 0;
 
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
+		if (!msm_gem_trylock(&msm_obj->base))
+			continue;
 		if (is_purgeable(msm_obj))
 			count += msm_obj->base.size >> PAGE_SHIFT;
+		msm_gem_unlock(&msm_obj->base);
 	}
 
 	if (unlock)
@@ -78,10 +81,13 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
 		if (freed >= sc->nr_to_scan)
 			break;
+		if (!msm_gem_trylock(&msm_obj->base))
+			continue;
 		if (is_purgeable(msm_obj)) {
-			msm_gem_purge(&msm_obj->base, OBJ_LOCK_SHRINKER);
+			msm_gem_purge(&msm_obj->base);
 			freed += msm_obj->base.size >> PAGE_SHIFT;
 		}
+		msm_gem_unlock(&msm_obj->base);
 	}
 
 	if (unlock)
@@ -107,15 +113,20 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 		return NOTIFY_DONE;
 
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
+		if (!msm_gem_trylock(&msm_obj->base))
+			continue;
 		if (is_vunmapable(msm_obj)) {
-			msm_gem_vunmap(&msm_obj->base, OBJ_LOCK_SHRINKER);
-			/* since we don't know any better, lets bail after a few
-			 * and if necessary the shrinker will be invoked again.
-			 * Seems better than unmapping *everything*
-			 */
-			if (++unmapped >= 15)
-				break;
+			msm_gem_vunmap(&msm_obj->base);
+			unmapped++;
 		}
+		msm_gem_unlock(&msm_obj->base);
+
+		/* since we don't know any better, lets bail after a few
+		 * and if necessary the shrinker will be invoked again.
+		 * Seems better than unmapping *everything*
+		 */
+		if (++unmapped >= 15)
+			break;
 	}
 
 	if (unlock)
-- 
2.26.2

