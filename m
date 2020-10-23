Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2326A29751A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752735AbgJWQuY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752728AbgJWQuV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:21 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60FAC0613CE;
        Fri, 23 Oct 2020 09:50:21 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f19so1770578pfj.11;
        Fri, 23 Oct 2020 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LQsd8hTmdHRzfZ5R+TDzPM5mnO3yOLJdR6nT0gp28Sg=;
        b=fzzN6gcPILZEBwjxOYq7s69EeTbni/0MSPbPWnfvls29qMtx/Lnd2NmpMAxbPbx/tF
         Ob61dDQ4wEyqwAyKj7V0IXPm+/EdSK+uOMjibgnfTKySSAh4nUW3I+RhhJWzwoNepoLY
         sciXQpSowo+iWYkJJsJeRKeR+F7hKFHFlnx3bNpKCrGHM8w2rR2/k34bjOw7hdGTeji3
         Y5BxENPy4o+n0KgBZHS3zmCZOQFC7MBdt6+MqE2veOfm3Ktr5HcnuJwwdUR+kcXZW9Xr
         TQ1IC4mh/4jufuwqhu4TtWen8hI5EQJERyPfI1JyGh9Ks3A88lnUadfXRPOENzghmNu5
         nlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LQsd8hTmdHRzfZ5R+TDzPM5mnO3yOLJdR6nT0gp28Sg=;
        b=FbFr2xpMqXM2b2r/KQRLTlkEZeiV8kHHClyoP3+DSMviUOqT/fkVPHoIxacR/nrac2
         uoakz256mEG55VjtZDnpIm7OU8kKY0HekbZJdSdy9Rrhi5290T5/EeVkqnLZ5kVbW6mj
         Q4yEHsPr5xyOYnYkcpmhOCLHKUhzvHVmrKHPVJMikWu9UoUel38/+tyXE3+EHtFwXvih
         0Ukzf+qvAOR2GCu0Q74Fjibc9ucQMnk7kNrzcyLbO9F3T7F7IMxJf0TU/8E38qdocvJC
         I5mjjACWci+hpb139eWJBUj+u42OVWniwtAJ7fbf04yDOPlLpcT1aR+IaTqNbf7J3sc9
         n1rg==
X-Gm-Message-State: AOAM5311JaUlvsFZDNrwoziq3j6d2Ws2XSX9JAAb0dNUd9lABlEeFV8P
        3avIjswf/u2KhtHR1JKjfRA=
X-Google-Smtp-Source: ABdhPJw30Dv1hjuiRzG11GMPDznX7yCamst62qVCxMvq2UhnlEWCjOaIDV1PZqfgJ/8m8+hrf1wUlg==
X-Received: by 2002:a65:478a:: with SMTP id e10mr2865562pgs.365.1603471821327;
        Fri, 23 Oct 2020 09:50:21 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id x29sm2717526pfp.152.2020.10.23.09.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:20 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 05/23] drm/msm/gem: Add some _locked() helpers
Date:   Fri, 23 Oct 2020 09:51:06 -0700
Message-Id: <20201023165136.561680-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

When we cut-over to using dma_resv_lock/etc instead of msm_obj->lock,
we'll need these for the submit path (where resv->lock is already held).

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
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

