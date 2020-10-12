Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4965428ABF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729751AbgJLCJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727346AbgJLCI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:08:56 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A791C0613D0;
        Sun, 11 Oct 2020 19:08:55 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t18so7761169plo.1;
        Sun, 11 Oct 2020 19:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kS25d5qKVGDZxWvcUI8CruK0rHlMGZPnc/KSyG6rgIQ=;
        b=Vn1vzJFVJFmP0O9FSHMj/0BY5nyOCoW//lFof2um+CcmUcqgekVvZaUYEjr/OleuSI
         wk57WLpqvzk3V315/2nEsIhh2+fD+OD0xpsx759PvRaWk2phS4Hg0xYHrlsZ7RKRWR5b
         oBtDrE49YGIBCEiuEAiLgmra30QcGqPswn8ODBRhWL3bWc8sxuUjSvIMVFAuLwPljMmR
         ToByKGFSPcj5clkw8Ow9fHbJ8LGD7uHjCEhGOLl2CWmUQcHU7cSDNZAvqibNynqIe2R9
         Mv8BcWEAJiunU4DcWZw767KmlULTzmXSAYi0HUbq5lWadz5RfwkGtu8hmMdsKXDRijey
         /i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kS25d5qKVGDZxWvcUI8CruK0rHlMGZPnc/KSyG6rgIQ=;
        b=KHUXbBVuACQWHMjmnJ0Is8PacSw2ihg1/pke+R1B3BT9fd6zSSy7vUQmnkdcT3whaN
         vYCY8IqHZ2+UVdDUQZOpIpPfdXgAE8zG+CvQA3XuEAPq/ZJ8qKJX9qSE5tFCnY2/947Q
         CNGNtlVa12OjdEG+0sOPW8qhbhh4iZbDswbtM5Wv1oMv9mkLS8sV9msUJBkD59Di1va5
         WmkeB2L+AfFEcHgO55SsB8kYDEWKDreuoPeCt+92dIe6ybCrUFhbQNifrFVPQtYPiFq2
         jbzk4iWUqmtCFjWvQTwB16XJW+XJqsNhCekilXf6XYW3mlzvD8Fh8VMCH9m88nk1a3Ky
         gQkg==
X-Gm-Message-State: AOAM531s3/fQXK777PZ13KG6wv7ub4/n03gcJjBUDdx5tGI0JNppRV3W
        qn6Avz16drgZdCvwKqHkiww=
X-Google-Smtp-Source: ABdhPJwxSla3igtA9DqgAD5GKP2q0CYqbs7fJho7xFNHP7UMTXM1LmB7nqEkXjoNuhlMAOui6nh3vA==
X-Received: by 2002:a17:902:d68d:b029:d3:dcce:d7f1 with SMTP id v13-20020a170902d68db02900d3dcced7f1mr21330798ply.84.1602468534924;
        Sun, 11 Oct 2020 19:08:54 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q5sm17078811pgh.16.2020.10.11.19.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:08:53 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 04/22] drm/msm/gem: Add some _locked() helpers
Date:   Sun, 11 Oct 2020 19:09:31 -0700
Message-Id: <20201012020958.229288-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_gem.c | 50 +++++++++++++++++++++++++++--------
 drivers/gpu/drm/msm/msm_gem.h |  4 +++
 2 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index dec89fe79025..7bca2e815933 100644
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
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index fbad08badf43..016f616dd118 100644
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
-- 
2.26.2

