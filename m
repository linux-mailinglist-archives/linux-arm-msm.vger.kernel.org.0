Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A7628ABE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbgJLCJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729808AbgJLCJj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:39 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83098C0613DB;
        Sun, 11 Oct 2020 19:09:37 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id e7so3113143pfn.12;
        Sun, 11 Oct 2020 19:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B9RVbg78ux75/+n4NUnNwRZeJdtfJ/ZCin3JTFeaEqU=;
        b=iv62+x78oebBSf9WRr77yT04o2Ecq8lN0AzXaBzNBW9eEulyTt8DRPFTRoLgrwAI4Y
         qs4te07B2lWie8HE1qsOu8vl2R1IeTzzAf7thCFjN5hev8QY2zLY/2rgouq71JHXJNfv
         YZ4+r99NmSzoBhrRIdPkhSrOEIDUqUDwTypkxu/sDj7FblYs69iYi3UQdX6mKvp46Prx
         IJWavR2yE2/LkpUj7hI4TYJMWC0tD8DuhIu/eyziXQ2TyRUcs3nsOceLht/wvKu6HkBM
         NEiU7nAlT/BhCFm9zJoUNu5v5q6lFadz1CXihiWmegaSFoScLBFa/lJVYvbD1YMmEmEh
         g0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B9RVbg78ux75/+n4NUnNwRZeJdtfJ/ZCin3JTFeaEqU=;
        b=YSV5apf9eV6LRfemdc0WM2mlOQGVCR+jK9RkNA30UE+m2waR9YQfpSVzxyfptTZpkR
         VOlxbce5i4xOAhAJ4dR0QP1mY3yX9hOMkXYoGmgnHx1FIiAceriXRcR/jSTW0jhXEJJi
         mijOwB+UQof3DyHRYmO6TUPRe8zFfSS36hDfYq7ZJlod3YtOy+IyxgnAqmoh7FxopEfo
         nNsAiTSVUxEEcxfQRJwa0dQWGeDBqofdMuXRxRGYYydsGgEVPZ8181Gi6cjYGEMd4AZN
         MQpdh7hVSNJvn0RB+NzdrKz49pz8q+r+pKwVZOytxAv5DctgsP0nV5y/NGlq8nzruhYX
         JvIQ==
X-Gm-Message-State: AOAM5307m0uxkZRONs8XVusunRikplKW+N8xN5UL4EsJRcE6qII0m26N
        yx4efZPh5H/e3Bo9dBD7Cik=
X-Google-Smtp-Source: ABdhPJx/pnTfRG5VIKHQvFAKpwUpJG1uTKngcpb2xP8fYZlQWrAl43pmv9un5EYkA1S/Ixx0XR3GXQ==
X-Received: by 2002:a63:4c4e:: with SMTP id m14mr10981834pgl.199.1602468577032;
        Sun, 11 Oct 2020 19:09:37 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id ng7sm3510804pjb.14.2020.10.11.19.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:36 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 20/22] drm/msm: drop struct_mutex in madvise path
Date:   Sun, 11 Oct 2020 19:09:47 -0700
Message-Id: <20201012020958.229288-21-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The obj->lock is sufficient for what we need.

This *does* have the implication that userspace can try to shoot
themselves in the foot by racing madvise(DONTNEED) with submit.  But
the result will be about the same if they did madvise(DONTNEED) before
the submit ioctl, ie. they might not get want they want if they race
with shrinker.  But iova fault handling is robust enough, and userspace
is only shooting it's own foot.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 11 ++---------
 drivers/gpu/drm/msm/msm_gem.c |  4 +---
 drivers/gpu/drm/msm/msm_gem.h |  2 --
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 49e6daf30b42..f2d58fe25497 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -912,14 +912,9 @@ static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	ret = mutex_lock_interruptible(&dev->struct_mutex);
-	if (ret)
-		return ret;
-
 	obj = drm_gem_object_lookup(file, args->handle);
 	if (!obj) {
-		ret = -ENOENT;
-		goto unlock;
+		return -ENOENT;
 	}
 
 	ret = msm_gem_madvise(obj, args->madv);
@@ -928,10 +923,8 @@ static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
 		ret = 0;
 	}
 
-	drm_gem_object_put_locked(obj);
+	drm_gem_object_put(obj);
 
-unlock:
-	mutex_unlock(&dev->struct_mutex);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b60eaf6266e2..8852c05775dc 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -658,8 +658,6 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 
 	msm_gem_lock(obj);
 
-	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
-
 	if (msm_obj->madv != __MSM_MADV_PURGED)
 		msm_obj->madv = madv;
 
@@ -676,7 +674,6 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(!is_purgeable(msm_obj));
 	WARN_ON(obj->import_attach);
 
@@ -756,6 +753,7 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	struct msm_drm_private *priv = obj->dev->dev_private;
 
 	might_sleep();
+	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
 
 	if (!atomic_fetch_inc(&msm_obj->active_count)) {
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c12fedf88e85..1f8f5f3d08c0 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -188,8 +188,6 @@ static inline bool is_active(struct msm_gem_object *msm_obj)
 
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
 {
-	WARN_ON(!msm_gem_is_locked(&msm_obj->base));
-	WARN_ON(!mutex_is_locked(&msm_obj->base.dev->struct_mutex));
 	return (msm_obj->madv == MSM_MADV_DONTNEED) && msm_obj->sgt &&
 			!msm_obj->base.dma_buf && !msm_obj->base.import_attach;
 }
-- 
2.26.2

