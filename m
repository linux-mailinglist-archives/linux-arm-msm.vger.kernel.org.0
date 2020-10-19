Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E792C292FC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbgJSUpo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbgJSUpm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:45:42 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD81C0613CE;
        Mon, 19 Oct 2020 13:45:40 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a1so476500pjd.1;
        Mon, 19 Oct 2020 13:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q5k/qgzllgJinBUFQNgzgdhi3AM/b+GHZAtI8PpVALs=;
        b=hhaZuVDgZewqLwh816sQVgmzW/gFh9MlKcmEwPJEk5p6fRG0nW+xbnjtUmArbQOph5
         ahuuopQ1sUCvXv1Ny/e5R/6wLze4n3SH/GjDVxn+A8F/G31f6MQbyZadec6Po/Fx8fk2
         nO1/LR/c4VsbwYc+52WGUMG5gWLm0bWSQYeXHBdBK3EyVlnFTqn5HMeVf7WyPUfzg2+w
         mNSNe7+lSPIkRl5EnAmh231kz0MglH2v1v6G4L7cxEl5m1cz8VXQH2Yqck97lY+DLXZZ
         mg+yzWAjpXNqAJ0RRQtZOsxkaljBDdnUitZDYQwEcE4bU97M8Gwe60+5G8NIosflNXOJ
         uiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q5k/qgzllgJinBUFQNgzgdhi3AM/b+GHZAtI8PpVALs=;
        b=JLXjRNX5vofLRKo42w8Bz58fami4fDtHHjRROIcAbfc2NGzwrgrxtkPF4wY3zioRmU
         NeJwYjFQo+o+y3z3dEOh6PhWJaEQTTwU8Q2UETFpvBBixWxL7or0VeiAtYRf5MHh7l0e
         /8O2ruqe6zsnWlLZSiWc+uNxXtvSvZLTcOd+8OMd/fNtp34seNaTuvgrXW14FITya51g
         qV5AxTYeTPHcYo7C+dzYhkcqmsCgnm3toayYuImfuMvUBsER39IYhA5lDuhOmBEAezaP
         9bL65y98b6VIx0L8K2fLtpulUSnCNRjfz9VDJwZcnYRGrHKgr4EXA5erXBKDBdg+54RP
         jEIQ==
X-Gm-Message-State: AOAM530/Hf+OQT+u50WdMWwjGJdAYN+LIztUHJi6uCxj0DUC8y68rhhs
        9HUiO4Ga67ZKK2ArQ9VO6HE=
X-Google-Smtp-Source: ABdhPJykTonBPLogBYK2emaLk9agplCBVDKs3tZs59Jz+4i8pMS3TDYloXQrIfzqD/No0WSERQrDuw==
X-Received: by 2002:a17:90a:e60c:: with SMTP id j12mr1142522pjy.27.1603140340296;
        Mon, 19 Oct 2020 13:45:40 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id w74sm612234pff.200.2020.10.19.13.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:45:39 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 05/23] drm/msm/gem: Add some _locked() helpers
Date:   Mon, 19 Oct 2020 13:46:06 -0700
Message-Id: <20201019204636.139997-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

When we cut-over to using dma_resv_lock/etc instead of msm_obj->lock,
we'll need these for the submit path (where resv->lock is already held).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 89 +++++++++++++++++++++++++++--------
 drivers/gpu/drm/msm/msm_gem.h |  6 +++
 2 files changed, 75 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index dec89fe79025..e0d8d739b068 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -435,18 +435,14 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 			msm_obj->sgt, obj->size >> PAGE_SHIFT);
 }
 
-/*
- * get iova and pin it. Should have a matching put
- * limits iova to specified range (in pages)
- */
-int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
+static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
 	u64 local;
 	int ret;
 
-	msm_gem_lock(obj);
+	WARN_ON(!msm_gem_is_locked(obj));
 
 	ret = get_iova_locked(obj, aspace, &local,
 		range_start, range_end);
@@ -457,10 +453,32 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 	if (!ret)
 		*iova = local;
 
+	return ret;
+}
+
+/*
+ * get iova and pin it. Should have a matching put
+ * limits iova to specified range (in pages)
+ */
+int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova,
+		u64 range_start, u64 range_end)
+{
+	int ret;
+
+	msm_gem_lock(obj);
+	ret = get_and_pin_iova_range_locked(obj, aspace, iova, range_start, range_end);
 	msm_gem_unlock(obj);
+
 	return ret;
 }
 
+int msm_gem_get_and_pin_iova_locked(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova)
+{
+	return get_and_pin_iova_range_locked(obj, aspace, iova, 0, U64_MAX);
+}
+
 /* get iova and pin it. Should have a matching put */
 int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova)
@@ -501,21 +519,31 @@ uint64_t msm_gem_iova(struct drm_gem_object *obj,
 }
 
 /*
- * Unpin a iova by updating the reference counts. The memory isn't actually
- * purged until something else (shrinker, mm_notifier, destroy, etc) decides
- * to get rid of it
+ * Locked variant of msm_gem_unpin_iova()
  */
-void msm_gem_unpin_iova(struct drm_gem_object *obj,
+void msm_gem_unpin_iova_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace)
 {
 	struct msm_gem_vma *vma;
 
-	msm_gem_lock(obj);
+	WARN_ON(!msm_gem_is_locked(obj));
+
 	vma = lookup_vma(obj, aspace);
 
 	if (!WARN_ON(!vma))
 		msm_gem_unmap_vma(aspace, vma);
+}
 
+/*
+ * Unpin a iova by updating the reference counts. The memory isn't actually
+ * purged until something else (shrinker, mm_notifier, destroy, etc) decides
+ * to get rid of it
+ */
+void msm_gem_unpin_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace)
+{
+	msm_gem_lock(obj);
+	msm_gem_unpin_iova_locked(obj, aspace);
 	msm_gem_unlock(obj);
 }
 
@@ -554,15 +582,14 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int ret = 0;
 
+	WARN_ON(!msm_gem_is_locked(obj));
+
 	if (obj->import_attach)
 		return ERR_PTR(-ENODEV);
 
-	msm_gem_lock(obj);
-
 	if (WARN_ON(msm_obj->madv > madv)) {
 		DRM_DEV_ERROR(obj->dev->dev, "Invalid madv state: %u vs %u\n",
 			msm_obj->madv, madv);
-		msm_gem_unlock(obj);
 		return ERR_PTR(-EBUSY);
 	}
 
@@ -588,20 +615,29 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 		}
 	}
 
-	msm_gem_unlock(obj);
 	return msm_obj->vaddr;
 
 fail:
 	msm_obj->vmap_count--;
-	msm_gem_unlock(obj);
 	return ERR_PTR(ret);
 }
 
-void *msm_gem_get_vaddr(struct drm_gem_object *obj)
+void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj)
 {
 	return get_vaddr(obj, MSM_MADV_WILLNEED);
 }
 
+void *msm_gem_get_vaddr(struct drm_gem_object *obj)
+{
+	void *ret;
+
+	msm_gem_lock(obj);
+	ret = msm_gem_get_vaddr_locked(obj);
+	msm_gem_unlock(obj);
+
+	return ret;
+}
+
 /*
  * Don't use this!  It is for the very special case of dumping
  * submits from GPU hangs or faults, were the bo may already
@@ -610,16 +646,29 @@ void *msm_gem_get_vaddr(struct drm_gem_object *obj)
  */
 void *msm_gem_get_vaddr_active(struct drm_gem_object *obj)
 {
-	return get_vaddr(obj, __MSM_MADV_PURGED);
+	void *ret;
+
+	msm_gem_lock(obj);
+	ret = get_vaddr(obj, __MSM_MADV_PURGED);
+	msm_gem_unlock(obj);
+
+	return ret;
 }
 
-void msm_gem_put_vaddr(struct drm_gem_object *obj)
+void msm_gem_put_vaddr_locked(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	msm_gem_lock(obj);
+	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(msm_obj->vmap_count < 1);
+
 	msm_obj->vmap_count--;
+}
+
+void msm_gem_put_vaddr(struct drm_gem_object *obj)
+{
+	msm_gem_lock(obj);
+	msm_gem_put_vaddr_locked(obj);
 	msm_gem_unlock(obj);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index fbad08badf43..d55d5401a2d2 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -103,10 +103,14 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end);
+int msm_gem_get_and_pin_iova_locked(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova);
 int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
 uint64_t msm_gem_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace);
+void msm_gem_unpin_iova_locked(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace);
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace);
 struct page **msm_gem_get_pages(struct drm_gem_object *obj);
@@ -115,8 +119,10 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
 int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 		uint32_t handle, uint64_t *offset);
+void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
+void msm_gem_put_vaddr_locked(struct drm_gem_object *obj);
 void msm_gem_put_vaddr(struct drm_gem_object *obj);
 int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
 int msm_gem_sync_object(struct drm_gem_object *obj,
-- 
2.26.2

