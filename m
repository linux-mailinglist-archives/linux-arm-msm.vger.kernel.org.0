Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC006350A09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 00:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbhCaWNk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 18:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbhCaWNO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 18:13:14 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA4C2C061574;
        Wed, 31 Mar 2021 15:13:14 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d8so8633385plh.11;
        Wed, 31 Mar 2021 15:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gScWN8UenNyK27brBaNwQHa1Z/Ca80GDMmaeXW0ls/U=;
        b=EMGnrNo6o01pjvX6L9vpQwX2gqn+Vh+JuULwjpOKQZj9fzNYa5XpK18wNHu9aJ+0Ot
         K9C+sg1Q+Ru4q6Xz5tNRlgz+WNmtJ1M0zUC+DeJ8dI3816K6EmknuuZPlLiMAcG3ZpEi
         YnpOl0jI8zjyw4w5UBUOPqaG4ySd+tmpkPzR1uxpgro++c+50UmXWhMMUW4Go+g75pId
         3wYKkYe3ww3EysZgDhhzdXLNuig/TP7HoYY0TNEOjMcgttBEep1d8z/7rCA4RaCCBtN5
         YoJ+dK+niOsagtWY56FKZBX3FN+UeizKl+EQs1oDuZB+aZD0Go6S7VUX2IMlUG+li139
         iNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gScWN8UenNyK27brBaNwQHa1Z/Ca80GDMmaeXW0ls/U=;
        b=UsAG1CEVibp5Cg5B8Hl7m/Q4wp4saV/wd2lRSJissJOSlay7Gb9mWXTcOiPNT/uMjk
         2uN4OXgAAVBBGCgNREu1rW5BFuAttpvTigp3DmfFc3eBX17GrBonbBtTsZxAtMNUBYvd
         X4I7xbRiCFR1BkrxXXDQ5sNuFc76Jl7BJDBAGs3L14F+9swtqq6y98ftp97u7bW+n368
         OCVWfpqKgGdZrHVjS2J0mOXmcP0B6wj7RRjxIFm47NWLB+P7LFAaE9wlDtUx95xZyDvp
         Yng+W0jIExnLCpMxa4PueYGWzB1WSukCrVDufR1CNeTyxGoAwGawdUF9oF0yYCmcZZ5Z
         q4gQ==
X-Gm-Message-State: AOAM532QtK8fw8g4NLj9GHQMZ96y9SX2LSeOae97nUb1yd5z8lk4LOIF
        AiT+BuNIM28z1Z6W1tewrB0=
X-Google-Smtp-Source: ABdhPJybF1XAVvGu+A4tCkpz5Wi/SotZeU3+SzH73gXmXupa7G+jjb2S2kVleqBbQBshj3Pq+1pYRg==
X-Received: by 2002:a17:90a:f005:: with SMTP id bt5mr5688901pjb.127.1617228794328;
        Wed, 31 Mar 2021 15:13:14 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id l14sm2883965pja.37.2021.03.31.15.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 15:13:13 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/4] drm/msm: Fix debugfs deadlock
Date:   Wed, 31 Mar 2021 15:16:28 -0700
Message-Id: <20210331221630.488498-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331221630.488498-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In normal cases the gem obj lock is acquired first before mm_lock.  The
exception is iterating the various object lists.  In the shrinker path,
deadlock is avoided by using msm_gem_trylock() and skipping over objects
that cannot be locked.  But for debugfs the straightforward thing is to
split things out into a separate list of all objects protected by it's
own lock.

Fixes: d984457b31c4 ("drm/msm: Add priv->mm_lock to protect active/inactive lists")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 14 +++-----------
 drivers/gpu/drm/msm/msm_drv.c     |  3 +++
 drivers/gpu/drm/msm/msm_drv.h     |  8 +++++++-
 drivers/gpu/drm/msm/msm_gem.c     | 14 +++++++++++++-
 drivers/gpu/drm/msm/msm_gem.h     | 13 ++++++++++---
 5 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 85ad0babc326..d611cc8e54a4 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -111,23 +111,15 @@ static const struct file_operations msm_gpu_fops = {
 static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_gpu *gpu = priv->gpu;
 	int ret;
 
-	ret = mutex_lock_interruptible(&priv->mm_lock);
+	ret = mutex_lock_interruptible(&priv->obj_lock);
 	if (ret)
 		return ret;
 
-	if (gpu) {
-		seq_printf(m, "Active Objects (%s):\n", gpu->name);
-		msm_gem_describe_objects(&gpu->active_list, m);
-	}
-
-	seq_printf(m, "Inactive Objects:\n");
-	msm_gem_describe_objects(&priv->inactive_dontneed, m);
-	msm_gem_describe_objects(&priv->inactive_willneed, m);
+	msm_gem_describe_objects(&priv->objects, m);
 
-	mutex_unlock(&priv->mm_lock);
+	mutex_unlock(&priv->obj_lock);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3462b0ea14c6..1ef1cd0cc714 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -474,6 +474,9 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	priv->wq = alloc_ordered_workqueue("msm", 0);
 
+	INIT_LIST_HEAD(&priv->objects);
+	mutex_init(&priv->obj_lock);
+
 	INIT_LIST_HEAD(&priv->inactive_willneed);
 	INIT_LIST_HEAD(&priv->inactive_dontneed);
 	INIT_LIST_HEAD(&priv->inactive_purged);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3ead5755f695..d69f4263bd4e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -174,7 +174,13 @@ struct msm_drm_private {
 	struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
 	struct msm_perf_state *perf;
 
-	/*
+	/**
+	 * List of all GEM objects (mainly for debugfs, protected by obj_lock
+	 */
+	struct list_head objects;
+	struct mutex obj_lock;
+
+	/**
 	 * Lists of inactive GEM objects.  Every bo is either in one of the
 	 * inactive lists (depending on whether or not it is shrinkable) or
 	 * gpu->active_list (for the gpu it is active on[1])
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 74a92eedc992..c184ea68a6d0 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -961,7 +961,7 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 	size_t size = 0;
 
 	seq_puts(m, "   flags       id ref  offset   kaddr            size     madv      name\n");
-	list_for_each_entry(msm_obj, list, mm_list) {
+	list_for_each_entry(msm_obj, list, node) {
 		struct drm_gem_object *obj = &msm_obj->base;
 		seq_puts(m, "   ");
 		msm_gem_describe(obj, m);
@@ -980,6 +980,10 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
+	mutex_lock(&priv->obj_lock);
+	list_del(&msm_obj->node);
+	mutex_unlock(&priv->obj_lock);
+
 	mutex_lock(&priv->mm_lock);
 	if (msm_obj->dontneed)
 		mark_unpurgable(msm_obj);
@@ -1170,6 +1174,10 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
 	mutex_unlock(&priv->mm_lock);
 
+	mutex_lock(&priv->obj_lock);
+	list_add_tail(&msm_obj->node, &priv->objects);
+	mutex_unlock(&priv->obj_lock);
+
 	return obj;
 
 fail:
@@ -1240,6 +1248,10 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
 	mutex_unlock(&priv->mm_lock);
 
+	mutex_lock(&priv->obj_lock);
+	list_add_tail(&msm_obj->node, &priv->objects);
+	mutex_unlock(&priv->obj_lock);
+
 	return obj;
 
 fail:
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0feabae75d3d..49956196025e 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -60,13 +60,20 @@ struct msm_gem_object {
 	 */
 	uint8_t vmap_count;
 
-	/* And object is either:
-	 *  inactive - on priv->inactive_list
+	/**
+	 * Node in list of all objects (mainly for debugfs, protected by
+	 * struct_mutex
+	 */
+	struct list_head node;
+
+	/**
+	 * An object is either:
+	 *  inactive - on priv->inactive_dontneed or priv->inactive_willneed
+	 *     (depending on purgability status)
 	 *  active   - on one one of the gpu's active_list..  well, at
 	 *     least for now we don't have (I don't think) hw sync between
 	 *     2d and 3d one devices which have both, meaning we need to
 	 *     block on submit if a bo is already on other ring
-	 *
 	 */
 	struct list_head mm_list;
 
-- 
2.30.2

