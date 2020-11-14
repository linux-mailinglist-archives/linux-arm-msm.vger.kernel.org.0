Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F33A2B3031
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 20:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgKNT2d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 14:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgKNT2d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 14:28:33 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56253C0613D1;
        Sat, 14 Nov 2020 11:28:33 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id f18so9506244pgi.8;
        Sat, 14 Nov 2020 11:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CjOmYSFFYsasYX9Sq8MuBrH7p/CFaq4+YCq5TRyIrqw=;
        b=qTrp/L0r7cSYg6nAdz7tU34ktyvrLgWsW2SE+YBAtmUwyV0JywqFQjiWNXtg5IrVS5
         btrrG/lLaqrPeMS236r5oyMKtkOl+OERxtctWe3b5eLsjKDf468UKvgiIGG1VfE96ZVR
         5rhiPmTd4I7ZuCr9bDxfhAzbHh9GQOJ7hTluyMB/XXk1NeHw0ltyvhWaQwBHvAnlqjta
         GZcw5uywbJDz8FAI6KZyaN3sNWaecBYFNhoW1ZN0NbI56Ck3dbCzIZbamxmqmUAN8Dcw
         +nsGlU9cOKjL7GeAhhoCmbIG8Xmoh81j7I6BT58FEWGm2rnJWTCJilSDDhnm4mhI+2Wv
         KxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CjOmYSFFYsasYX9Sq8MuBrH7p/CFaq4+YCq5TRyIrqw=;
        b=EytLzA7+Iy6B0WrReowOAis4UegRNtLy6q8xxqKwi5oCknSGcatZZNEDMXICzGpKKB
         vTw8Aq6K7/kLAT6pOna+cVCdzeB4q6nR7JlCRWbVmHJPFUImdhAbPW7LAG3NK2GcN98/
         ScfToGlgyzU9Pebad+tIFbhY6QJFbB9/husM96zDq19Flj/bnfyS8pmXr+z/DRe/IBRj
         L0bvbmekKbZPwe/slmys63kiN/yV7rbcLOHm2aaFPguIKTZD75NLRZgar+Pnwcfhg9Jj
         aDLgvDPG2Ykq1JPDCk/a71Ue2cfwim+i1KzYVcECwQJ6N7pStOmvBgdRiiA3SDW3xDFi
         /E3A==
X-Gm-Message-State: AOAM532axNfez8DRsc/wouY3EaeLajf1TGzSEGS5eXEmJdm/26wT/kBG
        43Wo3pCvoggujeCf5lETaW4=
X-Google-Smtp-Source: ABdhPJyJfQEYepL8PyuaRVxEahLC2pXCHSM5KwJiRwsI2EOamwMmL1JTjjnfJqk9Rk6ERJK6Kijmgg==
X-Received: by 2002:a63:3150:: with SMTP id x77mr652816pgx.114.1605382112892;
        Sat, 14 Nov 2020 11:28:32 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id g8sm2891778pgn.47.2020.11.14.11.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 11:28:31 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] drm/msm: Protect obj->active_count under obj lock
Date:   Sat, 14 Nov 2020 11:30:08 -0800
Message-Id: <20201114193010.753355-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201114193010.753355-1-robdclark@gmail.com>
References: <20201114193010.753355-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Previously we only held obj lock in the _active_get() path, and relied
on atomic_dec_return() to not be racy in the _active_put() path where
obj lock was not held.

But this is a false sense of security.  Unlike obj lifetime refcnt,
where you do not expect to *increase* the refcnt after the last put
(which would mean that something has gone horribly wrong with the
object liveness reference counting), the active_count can increase
again from zero.  Racing _active_put()s and _active_get()s could leave
the obj on the wrong mm list.

But in the retire path, immediately after the _active_put(), the
_unpin_iova() would acquire obj lock.  So just move the locking earlier
and rely on that to protect obj->active_count.

Fixes: c5c1643cef7a ("drm/msm: Drop struct_mutex from the retire path")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 11 ++++++-----
 drivers/gpu/drm/msm/msm_gem.h |  5 +++--
 drivers/gpu/drm/msm/msm_gpu.c | 10 ++++++----
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index a9a834bb7794..2795288b0a95 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -770,7 +770,7 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
 
-	if (!atomic_fetch_inc(&msm_obj->active_count)) {
+	if (msm_obj->active_count++ == 0) {
 		mutex_lock(&priv->mm_lock);
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
@@ -784,8 +784,9 @@ void msm_gem_active_put(struct drm_gem_object *obj)
 	struct msm_drm_private *priv = obj->dev->dev_private;
 
 	might_sleep();
+	WARN_ON(!msm_gem_is_locked(obj));
 
-	if (!atomic_dec_return(&msm_obj->active_count)) {
+	if (--msm_obj->active_count == 0) {
 		mutex_lock(&priv->mm_lock);
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
@@ -936,15 +937,15 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	/* object should not be on active list: */
-	WARN_ON(is_active(msm_obj));
-
 	mutex_lock(&priv->mm_lock);
 	list_del(&msm_obj->mm_list);
 	mutex_unlock(&priv->mm_lock);
 
 	msm_gem_lock(obj);
 
+	/* object should not be on active list: */
+	WARN_ON(is_active(msm_obj));
+
 	put_iova(obj);
 
 	if (obj->import_attach) {
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index d79e7019cc88..3355a48a023b 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -87,7 +87,7 @@ struct msm_gem_object {
 
 	char name[32]; /* Identifier to print for the debugfs files */
 
-	atomic_t active_count;
+	int active_count;
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
@@ -185,7 +185,8 @@ msm_gem_is_locked(struct drm_gem_object *obj)
 
 static inline bool is_active(struct msm_gem_object *msm_obj)
 {
-	return atomic_read(&msm_obj->active_count);
+	WARN_ON(!msm_gem_is_locked(&msm_obj->base));
+	return msm_obj->active_count;
 }
 
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index b597213a1890..04f7ab4d63ae 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -717,11 +717,13 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 		stats->alwayson_start, stats->alwayson_end);
 
 	for (i = 0; i < submit->nr_bos; i++) {
-		struct msm_gem_object *msm_obj = submit->bos[i].obj;
+		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
-		msm_gem_active_put(&msm_obj->base);
-		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
-		drm_gem_object_put(&msm_obj->base);
+		msm_gem_lock(obj);
+		msm_gem_active_put(obj);
+		msm_gem_unpin_iova_locked(obj, submit->aspace);
+		msm_gem_unlock(obj);
+		drm_gem_object_put(obj);
 	}
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
-- 
2.28.0

