Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69EEB35577D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 17:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345539AbhDFPO5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 11:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbhDFPO4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 11:14:56 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8459C06174A;
        Tue,  6 Apr 2021 08:14:46 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id p12so6578378pgj.10;
        Tue, 06 Apr 2021 08:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=adjFIDH7suKAxSkAUsA7mNQ1QGbjr8xmyHwuNOjmpYI=;
        b=h17bzcrHd+TvJspel47YuVDoHGvfLePIE+BJJnF4Bx9PwypKbzcDPTyx8aLat9ZG/k
         j8KHDiJbHUnPYbEOvwEJ97+DmQH7HcbWrJgEV/q8cmARbot1g2MiMuoiySGDZtdHY8qr
         pudIuLHnIzFnxkMaf64mTk2UpDAxAQwSmSJHaPNwfxE9aVx+Bf2+r30XirKXZFLtLG/P
         GiGHdKA48WWGZcfbfOkj2Jrhb4Xc/WyWyszuPBUCNa9iU6T72sRdBqduVxjcB+71UMQU
         tnAy+TQdMIFGiFFM7iv3ElOkD1aOINngTcw4HIuM2vFuZUoSVherFfw1QYDqsbCIWzmZ
         qoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=adjFIDH7suKAxSkAUsA7mNQ1QGbjr8xmyHwuNOjmpYI=;
        b=rKP1GbTt79nIc1WZT/azkOx+O4yIUN6Y+EiVl85SR3c/bhpIstlYWQnylPxk53Gvod
         PaIFtZOidoq4TKGudR1A9d06TAFm51xF/L2zTnUJkxIqt0if4gTxPQgggQX28JwqW5BB
         YckAdi9NEFVygNwchegyLFz0ceGxR/dl6dkq+dEJf2TaUzfKYXN33W7JAwQI3dOEIl2J
         kVroXY0N7k+WXejcMtfbrhM+0FQlRLoQO6sMWOz/85UrldkwSrVDdj2/mi08ldo7K46z
         iqSKymJ0gEdYuI6Od8L6Jmpk4CXvXrOTfjk5LuhPsHowvh4/bKxzXz59XiJ8z83vUaVq
         9BOg==
X-Gm-Message-State: AOAM533A8YXRcQGPTVgzDJ/QrGT8z2Z6U6RY/7OZIJ5LnNps4QDwnYeh
        oCdRukgL2f8LQ6az1lipGtM=
X-Google-Smtp-Source: ABdhPJzvaEMLJToUkLeuDRQNFBCCD4L+4pvaUDDz/fltxXoMhW+vGas9eqdV8ud8+qrOMfCsqCL97g==
X-Received: by 2002:a62:e20b:0:b029:23d:f634:e70e with SMTP id a11-20020a62e20b0000b029023df634e70emr4177879pfi.70.1617722086264;
        Tue, 06 Apr 2021 08:14:46 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id 12sm18286485pgw.18.2021.04.06.08.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 08:14:45 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix spelling "purgable" -> "purgeable"
Date:   Tue,  6 Apr 2021 08:18:16 -0700
Message-Id: <20210406151816.1515329-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The previous patch fixes the user visible spelling.  This one fixes the
code.  Oops.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          | 12 ++++++------
 drivers/gpu/drm/msm/msm_gem.h          | 16 ++++++++--------
 drivers/gpu/drm/msm/msm_gem_shrinker.c |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9568d551f7de..3c0b384a8984 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -821,14 +821,14 @@ static void update_inactive(struct msm_gem_object *msm_obj)
 	WARN_ON(msm_obj->active_count != 0);
 
 	if (msm_obj->dontneed)
-		mark_unpurgable(msm_obj);
+		mark_unpurgeable(msm_obj);
 
 	list_del(&msm_obj->mm_list);
 	if (msm_obj->madv == MSM_MADV_WILLNEED) {
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
 	} else if (msm_obj->madv == MSM_MADV_DONTNEED) {
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
-		mark_purgable(msm_obj);
+		mark_purgeable(msm_obj);
 	} else {
 		WARN_ON(msm_obj->madv != __MSM_MADV_PURGED);
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_purged);
@@ -901,8 +901,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		madv = " purged";
 		break;
 	case MSM_MADV_DONTNEED:
-		stats->purgable.count++;
-		stats->purgable.size += obj->size;
+		stats->purgeable.count++;
+		stats->purgeable.size += obj->size;
 		madv = " purgeable";
 		break;
 	case MSM_MADV_WILLNEED:
@@ -984,7 +984,7 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 	seq_printf(m, "Active:    %4d objects, %9zu bytes\n",
 			stats.active.count, stats.active.size);
 	seq_printf(m, "Purgeable: %4d objects, %9zu bytes\n",
-			stats.purgable.count, stats.purgable.size);
+			stats.purgeable.count, stats.purgeable.size);
 	seq_printf(m, "Purged:    %4d objects, %9zu bytes\n",
 			stats.purged.count, stats.purged.size);
 }
@@ -1003,7 +1003,7 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 
 	mutex_lock(&priv->mm_lock);
 	if (msm_obj->dontneed)
-		mark_unpurgable(msm_obj);
+		mark_unpurgeable(msm_obj);
 	list_del(&msm_obj->mm_list);
 	mutex_unlock(&priv->mm_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7c7d54bad189..13ebecdd70f4 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -163,7 +163,7 @@ struct msm_gem_stats {
 	struct {
 		unsigned count;
 		size_t size;
-	} all, active, purgable, purged;
+	} all, active, purgeable, purged;
 };
 
 void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
@@ -207,8 +207,8 @@ static inline bool is_active(struct msm_gem_object *msm_obj)
 	return msm_obj->active_count;
 }
 
-/* imported/exported objects are not purgable: */
-static inline bool is_unpurgable(struct msm_gem_object *msm_obj)
+/* imported/exported objects are not purgeable: */
+static inline bool is_unpurgeable(struct msm_gem_object *msm_obj)
 {
 	return msm_obj->base.dma_buf && msm_obj->base.import_attach;
 }
@@ -216,7 +216,7 @@ static inline bool is_unpurgable(struct msm_gem_object *msm_obj)
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
 {
 	return (msm_obj->madv == MSM_MADV_DONTNEED) && msm_obj->sgt &&
-			!is_unpurgable(msm_obj);
+			!is_unpurgeable(msm_obj);
 }
 
 static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
@@ -225,13 +225,13 @@ static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
 	return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
 }
 
-static inline void mark_purgable(struct msm_gem_object *msm_obj)
+static inline void mark_purgeable(struct msm_gem_object *msm_obj)
 {
 	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
 
 	WARN_ON(!mutex_is_locked(&priv->mm_lock));
 
-	if (is_unpurgable(msm_obj))
+	if (is_unpurgeable(msm_obj))
 		return;
 
 	if (WARN_ON(msm_obj->dontneed))
@@ -241,13 +241,13 @@ static inline void mark_purgable(struct msm_gem_object *msm_obj)
 	msm_obj->dontneed = true;
 }
 
-static inline void mark_unpurgable(struct msm_gem_object *msm_obj)
+static inline void mark_unpurgeable(struct msm_gem_object *msm_obj)
 {
 	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
 
 	WARN_ON(!mutex_is_locked(&priv->mm_lock));
 
-	if (is_unpurgable(msm_obj))
+	if (is_unpurgeable(msm_obj))
 		return;
 
 	if (WARN_ON(!msm_obj->dontneed))
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 33a49641ef30..7101ca881ae1 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -49,7 +49,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		/*
 		 * Now that we own a reference, we can drop mm_lock for the
 		 * rest of the loop body, to reduce contention with the
-		 * retire_submit path (which could make more objects purgable)
+		 * retire_submit path (which could make more objects purgeable)
 		 */
 
 		mutex_unlock(&priv->mm_lock);
-- 
2.30.2

