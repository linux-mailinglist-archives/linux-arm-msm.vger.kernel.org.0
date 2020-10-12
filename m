Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABA128ABE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbgJLCJr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729819AbgJLCJk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:40 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20D8C0613CE;
        Sun, 11 Oct 2020 19:09:39 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id w11so22583pll.8;
        Sun, 11 Oct 2020 19:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aM7b0pwaJ3Kic6t5ul6vT7+G6Sk2C9laYoEYMRioRSw=;
        b=pOPzTKYVTMfn/vTZiKhTePR9dfuJ5aJjHeqFD2Vq5MeZMfeAaXaIiIAUSaR69PTSf3
         B/UuIWCh1WvISMnFM7zeo9WIWjat7foLonk1dYlDEXaJJHMaaN1b5X92o71U5tsZpvtf
         OYb8TsEP/Adh39mEODcqhSAIdzkRVbLQKpp9mx7lJkeNjkDOOKIAth7f1acrkG8biPCu
         J+TNtU+EBlMRHQt7bqpZhbGF6oggkiynt149iL5udC7va/u4C4wB6XjvD+i0kzspy+JZ
         UfiHf6IdOFfQytGRqkdTXPJr4/u17dl+ekA21Gxb/cFuyKrsfzhJ0pKkmJq7Pv0s7wlM
         KNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aM7b0pwaJ3Kic6t5ul6vT7+G6Sk2C9laYoEYMRioRSw=;
        b=LJ8mxJuNGvawPVpEXQdS2xf1QubdBqAcWzwClcfyy4JwyDxSNawOSvuiwCY7roRYh8
         Mgb7UE4jqH0irXXYVc1VcctfIj5Ci4TQTivqUMNGgpGBc/E7yosPu05FPlMh3dEM6c4m
         AFceDiF9BnanC0X35Df5OEsoibZe32WohnVXBo7lKqBf8JhEFS8cx0xXi++f/5EI1UYd
         vd3r8o3ntgEh5veXb+WpI0UtWr+/4M4KHFVVVjNnb8R3bWH3gVFPI7FknKCSTewuWXNd
         yeZOc+ifCdfpTxnIm/ZnEk/jnzVsgrO5AXLvV1IJR5D+fB0anAzmLvq/Af6QbB8FLlwq
         grfg==
X-Gm-Message-State: AOAM532S785Hrx6HXRecBLVDfUo7iMo3HmhYefhqy2mphbq19rfQ0ow7
        lpDaJLMc1UnIrN3pihGDlFo=
X-Google-Smtp-Source: ABdhPJw2DDnmYqy+aSPVa6Gk57Xifw79VHiFSVfIjhfOuGVCMllrvyE2SNen/jQ96sfk3SPxk3ZOyQ==
X-Received: by 2002:a17:902:b18f:b029:d2:1ec0:4161 with SMTP id s15-20020a170902b18fb02900d21ec04161mr21604424plr.58.1602468579414;
        Sun, 11 Oct 2020 19:09:39 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id cu5sm12696349pjb.49.2020.10.11.19.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:38 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 21/22] drm/msm: Drop struct_mutex in shrinker path
Date:   Sun, 11 Oct 2020 19:09:48 -0700
Message-Id: <20201012020958.229288-22-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Now that the inactive_list is protected by mm_lock, and everything
else on per-obj basis is protected by obj->lock, we no longer depend
on struct_mutex.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          |  1 -
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 54 --------------------------
 2 files changed, 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 8852c05775dc..ca00c3ccd413 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -673,7 +673,6 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
 	WARN_ON(!is_purgeable(msm_obj));
 	WARN_ON(obj->import_attach);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 6be073b8ca08..6f4b1355725f 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -8,48 +8,13 @@
 #include "msm_gem.h"
 #include "msm_gpu_trace.h"
 
-static bool msm_gem_shrinker_lock(struct drm_device *dev, bool *unlock)
-{
-	/* NOTE: we are *closer* to being able to get rid of
-	 * mutex_trylock_recursive().. the msm_gem code itself does
-	 * not need struct_mutex, although codepaths that can trigger
-	 * shrinker are still called in code-paths that hold the
-	 * struct_mutex.
-	 *
-	 * Also, msm_obj->madv is protected by struct_mutex.
-	 *
-	 * The next step is probably split out a seperate lock for
-	 * protecting inactive_list, so that shrinker does not need
-	 * struct_mutex.
-	 */
-	switch (mutex_trylock_recursive(&dev->struct_mutex)) {
-	case MUTEX_TRYLOCK_FAILED:
-		return false;
-
-	case MUTEX_TRYLOCK_SUCCESS:
-		*unlock = true;
-		return true;
-
-	case MUTEX_TRYLOCK_RECURSIVE:
-		*unlock = false;
-		return true;
-	}
-
-	BUG();
-}
-
 static unsigned long
 msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
-	struct drm_device *dev = priv->dev;
 	struct msm_gem_object *msm_obj;
 	unsigned long count = 0;
-	bool unlock;
-
-	if (!msm_gem_shrinker_lock(dev, &unlock))
-		return 0;
 
 	mutex_lock(&priv->mm_lock);
 
@@ -63,9 +28,6 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 
 	mutex_unlock(&priv->mm_lock);
 
-	if (unlock)
-		mutex_unlock(&dev->struct_mutex);
-
 	return count;
 }
 
@@ -74,13 +36,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
-	struct drm_device *dev = priv->dev;
 	struct msm_gem_object *msm_obj;
 	unsigned long freed = 0;
-	bool unlock;
-
-	if (!msm_gem_shrinker_lock(dev, &unlock))
-		return SHRINK_STOP;
 
 	mutex_lock(&priv->mm_lock);
 
@@ -98,9 +55,6 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 
 	mutex_unlock(&priv->mm_lock);
 
-	if (unlock)
-		mutex_unlock(&dev->struct_mutex);
-
 	if (freed > 0)
 		trace_msm_gem_purge(freed << PAGE_SHIFT);
 
@@ -112,13 +66,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 {
 	struct msm_drm_private *priv =
 		container_of(nb, struct msm_drm_private, vmap_notifier);
-	struct drm_device *dev = priv->dev;
 	struct msm_gem_object *msm_obj;
 	unsigned unmapped = 0;
-	bool unlock;
-
-	if (!msm_gem_shrinker_lock(dev, &unlock))
-		return NOTIFY_DONE;
 
 	mutex_lock(&priv->mm_lock);
 
@@ -141,9 +90,6 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 
 	mutex_unlock(&priv->mm_lock);
 
-	if (unlock)
-		mutex_unlock(&dev->struct_mutex);
-
 	*(unsigned long *)ptr += unmapped;
 
 	if (unmapped > 0)
-- 
2.26.2

