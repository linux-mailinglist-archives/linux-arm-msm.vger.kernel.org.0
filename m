Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE07C292FF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731111AbgJSUqi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730323AbgJSUqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:46:19 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6C1C0613CE;
        Mon, 19 Oct 2020 13:46:19 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id p21so436588pju.0;
        Mon, 19 Oct 2020 13:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aTCwqlrE+xKt7if15fCxKqrxxhA3FtRVNMOwP5PT4Lc=;
        b=lQiRyf31C0/Ej7UYaPakIGicBUJ7uesIyGJzUO/UuqSwfUqD+kzkG3k5R18XcweAPP
         Hk293Zif+bAz301ecdq7UnNqxvrZpLtyCyHS8c+SjcYvkyWksOOPfeNOW/gvOmLQEDt7
         JjaDTx1kOEMhELU/4paQt2qqhrbzS3/z+hfmOlOtDHcbXLYwkFbNlXI+mZh6N6XyelMY
         kgfN+WsQO2UDUuqhK7ZNJcT+4CSRvHkAKZrpiWUU2GsGqpzUn5/PBLo5LR56QKOTYVn3
         UTp/nbDHsroWMPEvkfjgRMPGUUWjEhdSAqUtpnai0t8Hg84NRfFqM+gNcAfBwnySFz0k
         agug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aTCwqlrE+xKt7if15fCxKqrxxhA3FtRVNMOwP5PT4Lc=;
        b=oCg2LMEmrFPLXWaL6/mHyx3qP4Du0dT7eu5t1a5j8FeflgMLRDWKKeqF+YiX0rrQl3
         cAGtYqS2LFjfp8DFakwkrl1RGfMe0qu+1HU8aS0qSiWF576DVnVULHSv6Y0hovjfOGMK
         eJoxHJxS2wRPepxuFP1+fPWec4cixb8PkTCGKqYr8V5oJTWR+mWC4Ljl5Dt/bRW0+jQ7
         7SNAKwEiEzIDjzUgjC6e1kbM5mz2DBwWaVjmUOaU+5LCHZy4XQtaO9l21M67alw7GXnz
         wiOq1fV/jXStZfttck5qE2SKFLThDbbGV/Shy8uv3XGBUI5E94D55CFWoL5AB0GihCx1
         tfIg==
X-Gm-Message-State: AOAM531mbeMR2MuDO/JKy2z7z0B7+Z0Isz9QwTgqMEK9yhtCLzdTH9cS
        aVQOH40WWlQK77o4eUMDBr4=
X-Google-Smtp-Source: ABdhPJxb4qDhDnNtxb5u5Z2RNuHoLk18uRth47UdbZOLmGEZpHUKqV0Vi9ia7S0WasQJzfJxy/zSTw==
X-Received: by 2002:a17:90a:65cc:: with SMTP id i12mr1182680pjs.193.1603140379143;
        Mon, 19 Oct 2020 13:46:19 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id w5sm433422pgf.61.2020.10.19.13.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:46:18 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 21/23] drm/msm: Drop struct_mutex in madvise path
Date:   Mon, 19 Oct 2020 13:46:22 -0700
Message-Id: <20201019204636.139997-22-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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
index ebcd8e827363..4d808769e6ed 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -939,14 +939,9 @@ static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
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
@@ -955,10 +950,8 @@ static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
 		ret = 0;
 	}
 
-	drm_gem_object_put_locked(obj);
+	drm_gem_object_put(obj);
 
-unlock:
-	mutex_unlock(&dev->struct_mutex);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 827c7397ed12..c39ba9030001 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -673,8 +673,6 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 
 	msm_gem_lock(obj);
 
-	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
-
 	if (msm_obj->madv != __MSM_MADV_PURGED)
 		msm_obj->madv = madv;
 
@@ -691,7 +689,6 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(!is_purgeable(msm_obj));
 	WARN_ON(obj->import_attach);
 
@@ -771,6 +768,7 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	struct msm_drm_private *priv = obj->dev->dev_private;
 
 	might_sleep();
+	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
 
 	if (!atomic_fetch_inc(&msm_obj->active_count)) {
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index ffa2130ee97d..d79e7019cc88 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -190,8 +190,6 @@ static inline bool is_active(struct msm_gem_object *msm_obj)
 
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
 {
-	WARN_ON(!msm_gem_is_locked(&msm_obj->base));
-	WARN_ON(!mutex_is_locked(&msm_obj->base.dev->struct_mutex));
 	return (msm_obj->madv == MSM_MADV_DONTNEED) && msm_obj->sgt &&
 			!msm_obj->base.dma_buf && !msm_obj->base.import_attach;
 }
-- 
2.26.2

