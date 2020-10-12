Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA5428ABD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727626AbgJLCJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbgJLCJL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:11 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F07C0613D6;
        Sun, 11 Oct 2020 19:09:05 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id h6so12822066pgk.4;
        Sun, 11 Oct 2020 19:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eTjQ89IuXOz109TMRi5cWNXEovWk2LGV0dqyy4UoVe4=;
        b=Wv9cKwpCli62Q4QI5TYRHb6fmfORY/h7oOs2N8NEq5yfdwT2V2AI1gzS87gzk5D2Ln
         c3UW9P4LiW0C/L3Qoakm/9gz29zl0BLJfdiSyeOMUEQrjSwqtOo3MV+vlgvw9M/C6rds
         EsbSVhbkx9NoaVurJmovYGejeOqOZm4Uj2eFrGJNV50E2QdOoSesBHNXE1s1bGml+8wc
         Xv6+Zq1QI5aAxod5p7CISnG/PxCZaD6telUrYsnITfA1l4EFNlGgdMLMqx7ofySVmChF
         pMBgXh8MLLU61ovVLU91PL+rQrWB5jaWdwxh9Kt3HILnNniPZ1eCXdfBIPaAwavAsQaT
         jTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eTjQ89IuXOz109TMRi5cWNXEovWk2LGV0dqyy4UoVe4=;
        b=RjKJu0oqlSCLipieROj4aaVCSQ3FNwkYDxKdNdZuHG/mCKM5oyqS1Hui/zzgc+IyT6
         CD2+WCh06Sb7X25tNvaE4JzESCtEYY4czxBfEoUZaxd21aoVRHUEjVWvjxuGwv+CRfe0
         mBGAHQWZm0KjFw0t5XfbaN98B86e+KRxZJoMgnG0mpMIB+M6MwyeayY3lzLJiWtm9XDs
         9Gmah/+RCd7uo25bG4Kya8/pMqMJ3KUWJ22V2fxLWb8+6K8pVaiaPeNwy+8Opp6qh0Qt
         qcQSkMC6iq05LkZhpu/T5hxLaIUIu1tlcSOIOLzGqGtcaysRkrz09QpJGvz68x2VMs/D
         YRVA==
X-Gm-Message-State: AOAM531q3NeE32pcUN1B6jWobt4ZY+oBBqxIm2J9lMVos8R3/f885hVy
        1+z30mKzW+5LAutD5evvFFw=
X-Google-Smtp-Source: ABdhPJw507oY7r38qpLpkm1my+hNtuyXGzBuHetbSpVZufP0ikC6GPn4Asn7U13jpu02xkFihu9c+w==
X-Received: by 2002:a63:c20f:: with SMTP id b15mr11512847pgd.8.1602468544681;
        Sun, 11 Oct 2020 19:09:04 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q13sm6047990pfg.3.2020.10.11.19.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:03 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 08/22] drm/msm/gem: Switch over to obj->resv for locking
Date:   Sun, 11 Oct 2020 19:09:35 -0700
Message-Id: <20201012020958.229288-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        |  4 +---
 drivers/gpu/drm/msm/msm_gem.h        | 16 +++++-----------
 drivers/gpu/drm/msm/msm_gem_submit.c |  4 ++--
 drivers/gpu/drm/msm/msm_gpu.c        |  2 +-
 4 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index ff8ca257bdc6..210bf5c9c2dd 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -955,9 +955,9 @@ static void free_object(struct msm_gem_object *msm_obj)
 		put_pages(obj);
 	}
 
+	msm_gem_unlock(obj);
 	drm_gem_object_release(obj);
 
-	msm_gem_unlock(obj);
 	kfree(msm_obj);
 }
 
@@ -1029,8 +1029,6 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	if (!msm_obj)
 		return -ENOMEM;
 
-	mutex_init(&msm_obj->lock);
-
 	msm_obj->flags = flags;
 	msm_obj->madv = MSM_MADV_WILLNEED;
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 744889436a98..ec01f35ce57b 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -85,7 +85,6 @@ struct msm_gem_object {
 	 * an IOMMU.  Also used for stolen/splashscreen buffer.
 	 */
 	struct drm_mm_node *vram_node;
-	struct mutex lock; /* Protects resources associated with bo */
 
 	char name[32]; /* Identifier to print for the debugfs files */
 
@@ -156,36 +155,31 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m);
 static inline void
 msm_gem_lock(struct drm_gem_object *obj)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	mutex_lock(&msm_obj->lock);
+	dma_resv_lock(obj->resv, NULL);
 }
 
 static inline bool __must_check
 msm_gem_trylock(struct drm_gem_object *obj)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	return mutex_trylock_recursive(&msm_obj->lock) == MUTEX_TRYLOCK_SUCCESS;
+	return dma_resv_trylock(obj->resv);
 }
 
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	return mutex_lock_interruptible(&msm_obj->lock);
+	return dma_resv_lock_interruptible(obj->resv, NULL);
 }
 
 static inline void
 msm_gem_unlock(struct drm_gem_object *obj)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	mutex_unlock(&msm_obj->lock);
+	dma_resv_unlock(obj->resv);
 }
 
 static inline bool
 msm_gem_is_locked(struct drm_gem_object *obj)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	return mutex_is_locked(&msm_obj->lock);
+	return dma_resv_is_locked(obj->resv);
 }
 
 static inline bool is_active(struct msm_gem_object *msm_obj)
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index a9422d043bfe..35b7d9d06850 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -215,7 +215,7 @@ static void submit_unlock_unpin_bo(struct msm_gem_submit *submit,
 	struct msm_gem_object *msm_obj = submit->bos[i].obj;
 
 	if (submit->bos[i].flags & BO_PINNED)
-		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
+		msm_gem_unpin_iova_locked(&msm_obj->base, submit->aspace);
 
 	if (submit->bos[i].flags & BO_LOCKED)
 		dma_resv_unlock(msm_obj->base.resv);
@@ -318,7 +318,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		uint64_t iova;
 
 		/* if locking succeeded, pin bo: */
-		ret = msm_gem_get_and_pin_iova(&msm_obj->base,
+		ret = msm_gem_get_and_pin_iova_locked(&msm_obj->base,
 				submit->aspace, &iova);
 
 		if (ret)
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 55d16489d0f3..dbd9020713e5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -784,7 +784,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 		/* submit takes a reference to the bo and iova until retired: */
 		drm_gem_object_get(&msm_obj->base);
-		msm_gem_get_and_pin_iova(&msm_obj->base, submit->aspace, &iova);
+		msm_gem_get_and_pin_iova_locked(&msm_obj->base, submit->aspace, &iova);
 
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
 			dma_resv_add_excl_fence(drm_obj->resv, submit->fence);
-- 
2.26.2

