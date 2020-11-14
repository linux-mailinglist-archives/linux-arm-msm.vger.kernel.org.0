Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E232B3035
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 20:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgKNT2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 14:28:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgKNT2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 14:28:38 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2AECC0613D1;
        Sat, 14 Nov 2020 11:28:38 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id w20so2011356pjh.1;
        Sat, 14 Nov 2020 11:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9hezsjWfUVXluAEwjCPGwpO8neX5yHhAITTPqDFV4Hc=;
        b=b9JJUGK5EQcoxGFImr6syPvDAS66+zFg8jRWKbuPuCg2nOuwOq51LLSPn7lTbz7ES4
         jYCpvK/b90aDHteksvHiPnnARkf5lB9soHRVNVInkLd3HmYOeA+7maXTg/d+t0wufJkO
         C9146wSbvisv8NL82EJIjrlF6LJuYHqv0KNhadJAWezc8TOWLfztlf9IwRDJFcpzRasX
         ulhWfgJP6USoLSwL8ee2brNjGv3x+F9AWVbD7MN5hDzdVCrNSi1owlojyyCde8QusGHv
         OEw37IMpoZZQ2zMBWvYrUcOzucFgXQELWkTVVjmzwQb/GMLxVpLQqTG8wYGOG78aUaVq
         y+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9hezsjWfUVXluAEwjCPGwpO8neX5yHhAITTPqDFV4Hc=;
        b=qfP70o4DGVN/o7cQmPJMr+0ob0LNr8gVm13iVCPEbKrezZP4tTI+bUJv0+hMBax0H3
         qs19kFi0WamgvJl3tfB8DLhiJ3jJ7C5Her+aa0Dj/mFXdKGaoU9cJ/BboucrB+sM+Vcx
         HUcuZIp80tNSjySARUma9E4Vap6NpT3W29ssZ64e8U/E2yQ36R5NK//1hegs/vzI6AUE
         24DqUPJpiFZB2tWmCHTmnX3QotiG6gZVX2U1+EZQDPXPocWicHVb48g5A8OLD3o7OYOw
         Pe1hvPIvHa8WClCIgn2BZUXUANvYK/9SuIxp0e3YrEuILOjSAld7s4bDLxHhLGPWp70S
         QuNg==
X-Gm-Message-State: AOAM532SWOfceAVcVPZSZv9Erifw5tCqA2W9CYaN1MR77M3Nf7suYtLY
        4jLqHzaIBtfxMfUxqnSzyMo=
X-Google-Smtp-Source: ABdhPJzo1p9Z7jUL1jsTRNURdpjV+smWTpP/PDEWIwAEUVTl7BBj2+AxfCz8ceYIAi6FLNrYngVqog==
X-Received: by 2002:a17:902:b283:b029:d6:b2a7:3913 with SMTP id u3-20020a170902b283b02900d6b2a73913mr6911494plr.54.1605382118251;
        Sat, 14 Nov 2020 11:28:38 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id k73sm11683356pga.88.2020.11.14.11.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 11:28:37 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] drm/msm/shrinker: Only iterate dontneed objs
Date:   Sat, 14 Nov 2020 11:30:10 -0800
Message-Id: <20201114193010.753355-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201114193010.753355-1-robdclark@gmail.com>
References: <20201114193010.753355-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In situations where the GPU is mostly idle, all or nearly all buffer
objects will be in the inactive list.  But if the system is under memory
pressure (from something other than GPU), we could still get a lot of
shrinker calls.  Which results in traversing a list of thousands of objs
and in the end finding nothing to shrink.  Which isn't so efficient.

Instead split the inactive_list into two lists, one inactive objs which
are shrinkable, and a second one for those that are not.  This way we
can avoid traversing objs which we know are not shrinker candidates.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c      |  3 ++-
 drivers/gpu/drm/msm/msm_drv.c          |  3 ++-
 drivers/gpu/drm/msm/msm_drv.h          |  8 +++---
 drivers/gpu/drm/msm/msm_gem.c          | 34 ++++++++++++++++++++------
 drivers/gpu/drm/msm/msm_gem_shrinker.c |  7 +++---
 5 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 64afbed89821..85ad0babc326 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -124,7 +124,8 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
 	}
 
 	seq_printf(m, "Inactive Objects:\n");
-	msm_gem_describe_objects(&priv->inactive_list, m);
+	msm_gem_describe_objects(&priv->inactive_dontneed, m);
+	msm_gem_describe_objects(&priv->inactive_willneed, m);
 
 	mutex_unlock(&priv->mm_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4d808769e6ed..39a54f364aa8 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -465,7 +465,8 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 
 	priv->wq = alloc_ordered_workqueue("msm", 0);
 
-	INIT_LIST_HEAD(&priv->inactive_list);
+	INIT_LIST_HEAD(&priv->inactive_willneed);
+	INIT_LIST_HEAD(&priv->inactive_dontneed);
 	mutex_init(&priv->mm_lock);
 
 	/* Teach lockdep about lock ordering wrt. shrinker: */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index f869ed67b5da..ed18c5bed10f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -175,8 +175,9 @@ struct msm_drm_private {
 	struct msm_perf_state *perf;
 
 	/*
-	 * List of inactive GEM objects.  Every bo is either in the inactive_list
-	 * or gpu->active_list (for the gpu it is active on[1])
+	 * Lists of inactive GEM objects.  Every bo is either in one of the
+	 * inactive lists (depending on whether or not it is shrinkable) or
+	 * gpu->active_list (for the gpu it is active on[1])
 	 *
 	 * These lists are protected by mm_lock.  If struct_mutex is involved, it
 	 * should be aquired prior to mm_lock.  One should *not* hold mm_lock in
@@ -185,7 +186,8 @@ struct msm_drm_private {
 	 * [1] if someone ever added support for the old 2d cores, there could be
 	 *     more than one gpu object
 	 */
-	struct list_head inactive_list;
+	struct list_head inactive_willneed;  /* inactive + !shrinkable */
+	struct list_head inactive_dontneed;  /* inactive +  shrinkable */
 	struct mutex mm_lock;
 
 	struct workqueue_struct *wq;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2795288b0a95..de8d2cfada24 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -17,6 +17,7 @@
 #include "msm_gpu.h"
 #include "msm_mmu.h"
 
+static void update_inactive(struct msm_gem_object *msm_obj);
 
 static dma_addr_t physaddr(struct drm_gem_object *obj)
 {
@@ -678,6 +679,12 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 
 	madv = msm_obj->madv;
 
+	/* If the obj is inactive, we might need to move it
+	 * between inactive lists
+	 */
+	if (msm_obj->active_count == 0)
+		update_inactive(msm_obj);
+
 	msm_gem_unlock(obj);
 
 	return (madv != __MSM_MADV_PURGED);
@@ -781,19 +788,31 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 void msm_gem_active_put(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_drm_private *priv = obj->dev->dev_private;
 
 	might_sleep();
 	WARN_ON(!msm_gem_is_locked(obj));
 
 	if (--msm_obj->active_count == 0) {
-		mutex_lock(&priv->mm_lock);
-		list_del_init(&msm_obj->mm_list);
-		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
-		mutex_unlock(&priv->mm_lock);
+		update_inactive(msm_obj);
 	}
 }
 
+static void update_inactive(struct msm_gem_object *msm_obj)
+{
+	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
+
+	mutex_lock(&priv->mm_lock);
+	WARN_ON(msm_obj->active_count != 0);
+
+	list_del_init(&msm_obj->mm_list);
+	if (msm_obj->madv == MSM_MADV_DONTNEED)
+		list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
+	else
+		list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
+
+	mutex_unlock(&priv->mm_lock);
+}
+
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
 {
 	bool write = !!(op & MSM_PREP_WRITE);
@@ -1099,7 +1118,8 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	}
 
 	mutex_lock(&priv->mm_lock);
-	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
+	/* Initially obj is idle, obj->madv == WILLNEED: */
+	list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
 	mutex_unlock(&priv->mm_lock);
 
 	return obj;
@@ -1169,7 +1189,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	msm_gem_unlock(obj);
 
 	mutex_lock(&priv->mm_lock);
-	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
+	list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
 	mutex_unlock(&priv->mm_lock);
 
 	return obj;
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 9d51c1eb808d..81dfa57b6a0d 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -19,7 +19,7 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 
 	mutex_lock(&priv->mm_lock);
 
-	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
+	list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
 		if (!msm_gem_trylock(&msm_obj->base))
 			continue;
 		if (is_purgeable(msm_obj))
@@ -42,7 +42,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 
 	mutex_lock(&priv->mm_lock);
 
-	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
+	list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
 		if (freed >= sc->nr_to_scan)
 			break;
 		if (!msm_gem_trylock(&msm_obj->base))
@@ -96,7 +96,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 	struct msm_drm_private *priv =
 		container_of(nb, struct msm_drm_private, vmap_notifier);
 	struct list_head *mm_lists[] = {
-		&priv->inactive_list,
+		&priv->inactive_dontneed,
+		&priv->inactive_willneed,
 		priv->gpu ? &priv->gpu->active_list : NULL,
 		NULL,
 	};
-- 
2.28.0

