Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3654353097
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 23:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbhDBVIz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 17:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235069AbhDBVIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 17:08:55 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5494BC0613E6;
        Fri,  2 Apr 2021 14:08:53 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id x126so4255918pfc.13;
        Fri, 02 Apr 2021 14:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oLTaIOrTqKkHo1IVoAW0mlBLXAv0Dz4mdCieecndjsM=;
        b=BmzNKXNDZ+83eZJE6CsakJeweXzOjOa/saT/0iK9Ie2/xNwYKrnMJ3Kvjb92zN/n6V
         Ov+Am9UjRtmEiqZPkk57Fncbo2td+exEkQew4QK/avg06ketApNWrol8B0Fda6Gthkjl
         5lXJacDda4uQ94Ix51VolNJ8AWz89tBVlzUwy8+NM+xD2yfiQo7MbBx/avM2/bNad/Vv
         tCKNPhn6sZj48gTv/Y2H0O7hB2ZwhJdVeVB525lfj17YzPwVLIlB3dN1D2Kmcw1QjaLE
         Ds3VZklM2+bBqSEK29lEL9cZmc+XmIisBovnDW4zN8gdnWhuPK4LOYeA6JMZA3oUMJfX
         dHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oLTaIOrTqKkHo1IVoAW0mlBLXAv0Dz4mdCieecndjsM=;
        b=nPEu1/A37Z7RsRpUJfcxfc3ePVIOq8lRjBg1dJrAWSjEdWgFfUQij0duQ7JAuejrrZ
         5SxlybVJpvz5Ha1dH2lyRY3WCUuJUCfxPJhcbVibp9fBzfleAL9nsk5vQTmafgdEH3DM
         nugpv1NPDhh9Fxu3eSJxLFPJhFr/Xh+jNvqUjeu6JZYVmjWY/aJHOR5xx/z2lNGK3uiL
         CjXc1zP2Sxz4g76ePYg3EwqNgept5DWB5PsQAwj9PA/Lhv3n/n519zSGAXXpG1w4dLbh
         1F18AJfSdsQhRdJlcoZfjwMkymcQ0sXyMNsnhWAHhaUg7XRSCwhGd4FzJXSELhYEPm4l
         ax4w==
X-Gm-Message-State: AOAM532s+j+3ktUd6r6w6eqztaQWMZErivKpHki9Gdt4qEYUNpSIek/X
        /BeCILs4lyEeWLgOxeAGwDAWqWvvKMU5jA==
X-Google-Smtp-Source: ABdhPJxo1Mqx1ORQ+Y7GCG6EwpiBGuCpyJRRZzg0IklZb2e0zjRvQIJ4O9B2QGQmOuNDBxNPp5z3dw==
X-Received: by 2002:a65:56cc:: with SMTP id w12mr13328411pgs.354.1617397732734;
        Fri, 02 Apr 2021 14:08:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id z14sm2811696pfn.48.2021.04.02.14.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 14:08:51 -0700 (PDT)
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
Subject: [PATCH v2] drm/msm: Drop mm_lock in scan loop
Date:   Fri,  2 Apr 2021 14:12:26 -0700
Message-Id: <20210402211226.875726-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

lock_stat + mmm_donut[1] say that this reduces contention on mm_lock
significantly (~350x lower waittime-max, and ~100x lower waittime-avg)

[1] https://chromium.googlesource.com/chromiumos/platform/microbenchmarks/+/refs/heads/main/mmm_donut.py

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h          |  3 +-
 drivers/gpu/drm/msm/msm_gem.c          |  2 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 48 ++++++++++++++++++++++----
 3 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c84e6f84cb6d..d8d64d34e6e3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -184,7 +184,8 @@ struct msm_drm_private {
 	/**
 	 * Lists of inactive GEM objects.  Every bo is either in one of the
 	 * inactive lists (depending on whether or not it is shrinkable) or
-	 * gpu->active_list (for the gpu it is active on[1])
+	 * gpu->active_list (for the gpu it is active on[1]), or transiently
+	 * on a temporary list as the shrinker is running.
 	 *
 	 * These lists are protected by mm_lock (which should be acquired
 	 * before per GEM object lock).  One should *not* hold mm_lock in
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2ecf7f1cef25..75cea5b801da 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -719,7 +719,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	put_iova_vmas(obj);
 
 	msm_obj->madv = __MSM_MADV_PURGED;
-	mark_unpurgable(msm_obj);
+	update_inactive(msm_obj);
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 	drm_gem_free_mmap_offset(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index f3e948af01c5..33a49641ef30 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -22,26 +22,62 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
-	struct msm_gem_object *msm_obj;
+	struct list_head still_in_list;
 	unsigned long freed = 0;
 
+	INIT_LIST_HEAD(&still_in_list);
+
 	mutex_lock(&priv->mm_lock);
 
-	list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
-		if (freed >= sc->nr_to_scan)
+	while (freed < sc->nr_to_scan) {
+		struct msm_gem_object *msm_obj = list_first_entry_or_null(
+				&priv->inactive_dontneed, typeof(*msm_obj), mm_list);
+
+		if (!msm_obj)
 			break;
-		/* Use trylock, because we cannot block on a obj that
-		 * might be trying to acquire mm_lock
+
+		list_move_tail(&msm_obj->mm_list, &still_in_list);
+
+		/*
+		 * If it is in the process of being freed, msm_gem_free_object
+		 * can be blocked on mm_lock waiting to remove it.  So just
+		 * skip it.
 		 */
-		if (!msm_gem_trylock(&msm_obj->base))
+		if (!kref_get_unless_zero(&msm_obj->base.refcount))
 			continue;
+
+		/*
+		 * Now that we own a reference, we can drop mm_lock for the
+		 * rest of the loop body, to reduce contention with the
+		 * retire_submit path (which could make more objects purgable)
+		 */
+
+		mutex_unlock(&priv->mm_lock);
+
+		/*
+		 * Note that this still needs to be trylock, since we can
+		 * hit shrinker in response to trying to get backing pages
+		 * for this obj (ie. while it's lock is already held)
+		 */
+		if (!msm_gem_trylock(&msm_obj->base))
+			goto tail;
+
 		if (is_purgeable(msm_obj)) {
+			/*
+			 * This will move the obj out of still_in_list to
+			 * the purged list
+			 */
 			msm_gem_purge(&msm_obj->base);
 			freed += msm_obj->base.size >> PAGE_SHIFT;
 		}
 		msm_gem_unlock(&msm_obj->base);
+
+tail:
+		drm_gem_object_put(&msm_obj->base);
+		mutex_lock(&priv->mm_lock);
 	}
 
+	list_splice_tail(&still_in_list, &priv->inactive_dontneed);
 	mutex_unlock(&priv->mm_lock);
 
 	if (freed > 0) {
-- 
2.30.2

