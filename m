Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5776351FBB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 21:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbhDATZi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 15:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234958AbhDATZA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 15:25:00 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0869C0613A5;
        Thu,  1 Apr 2021 11:42:21 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id h20so1458666plr.4;
        Thu, 01 Apr 2021 11:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A0jPq7oBqGITolTSnl7ZMGU4PvMaBmY5cqqCges5rWg=;
        b=f037o79fvjG/fGHOzCKWrvJIWGn4ndKqXQ1DMektS8xvrV9D+d8MbDlyGtNsqICeIp
         OOyLIyiZlSRcC75hEuVOF5Z5NXk5iPra5eo3rh4OIFmZ7gLohgAhZzYH9MTw7VptUoFm
         mG3wLFwiMWFfocE+umCw9bgrhQdtuEr+HObUUbjWGbw88eerKEjwGu4702nKr4TSv4ug
         cA7Khi8+ZezDGSK1Z1ouQ9EpdDSgaRMKttpEHe7ZJcpfot+xGENk+gX0q+h9mHzHsSTG
         2ZjOSfViOgkmM5DkUDJUl95VjdyNktE7xiYJYPgq+YjzNXfo37W0W2H4RznDpSEYHaql
         H3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A0jPq7oBqGITolTSnl7ZMGU4PvMaBmY5cqqCges5rWg=;
        b=DVw5xGE314wmYkGiBqwFj+E6+kJPZlRA9MYGlOerDln6NKWQKNgs473xX6DhCTUT89
         oj0Qier86+zYyQXEZeRxCizamnjkzO/KxnqXcsdPWRTkSQ/6syvo5Z6+8lYngvy2bHc9
         eVCi8VNZAQUDha9Q7UnYxe7GHjCBn8FRi4lNHHqAIk8ElzH4WQeUQFRRCVnv2ozyLRUO
         NmX9jqYIWIbiXmxju+HULz2tvCKlp62XokwOGIEj99+WWbt6TUHaq6C66y6dMCScvz2m
         MgAArBXSPSM5QiWlXy4iXEOeejbNlG2Ov3Qu5YrckhhiY+/9vZd9ZoKzkk9B4k9qv6rA
         FJgQ==
X-Gm-Message-State: AOAM533SwuW/KoABWMBr7CVQK3OHn13xFrhB+vieqz2qcdZWnPouBHle
        sft7WfptOyrf30WlzUAKGwwigRPgkpiIrQ==
X-Google-Smtp-Source: ABdhPJxqKj8FXOu6Mvpt738kHa3uzJMpx0LOQcgPxCj0vmA4usPnrGQw8pmX/T9SfeL51k3SBTwZDA==
X-Received: by 2002:a17:90b:358:: with SMTP id fh24mr10182148pjb.109.1617302541369;
        Thu, 01 Apr 2021 11:42:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id m7sm6406936pjc.54.2021.04.01.11.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 11:42:20 -0700 (PDT)
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
Subject: [PATCH] drm/msm: Drop mm_lock in scan loop
Date:   Thu,  1 Apr 2021 11:45:48 -0700
Message-Id: <20210401184548.607663-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_gem.c          |  2 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 48 ++++++++++++++++++++++----
 2 files changed, 43 insertions(+), 7 deletions(-)

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
index f3e948af01c5..6bbb15d64861 100644
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
+		 * Now that we own a reference, we can move it to our own
+		 * private temporary list and drop mm_lock for the rest of
+		 * the loop body, to reduce contention with the retire_submit
+		 * path (which could make more objects available to purge)
+		 */
+		list_move_tail(&msm_obj->mm_list, &still_in_list);
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

