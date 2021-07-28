Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EADFF3D852C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 03:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234095AbhG1BDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 21:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234561AbhG1BDJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 21:03:09 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9699C061757;
        Tue, 27 Jul 2021 18:03:07 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id ds11-20020a17090b08cbb0290172f971883bso7506538pjb.1;
        Tue, 27 Jul 2021 18:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BVHgu7P3jLeGAr6c6jiQnBbjUeZUVb7sIei9a5S3h4I=;
        b=dmWlM3T2LTqYy+3H7Q8IfXYrQN8RtqxpPMlevHLVCKuFDRXvD+T+ZwM1TEK8pW+Prr
         6We5ubyhg7wYLfcKM7vgq1QwH2ynVHcNz42fMHHpdb85J4mJ4H8MiDEFrPSlr3+SZi10
         g2bJG+tjik8SeuWOlGdOMhTMaS87qaCYNZCNQt5n/KRc6+fac0XyP9OxDXJiNY1m/KoX
         qF9/C0/hzfJlUUS1jWDSsdmxhIPBM5vHNwaoM73gz+i37bWb8PUg25S6Fldj3T8URgi2
         bDCoi6Fth0RGOqR1e2dkngEMW42co8gvjqn+xhqXBo2BQucSSedGkvhbJO0TlwV3t4R6
         tv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BVHgu7P3jLeGAr6c6jiQnBbjUeZUVb7sIei9a5S3h4I=;
        b=gFSSRHCAwD+mav1nzeRfkqAFILtrik3pTEAzImdpePztzKIW91Ey+twCIq10VQGO/V
         jBXEI9lay0jyvo9HXEV/bRhqQRr79QHCgeapm8eUtw7bf4O4xyNF5q51/BvN3Wkrygf2
         pChq/79YXiGy3h+xGB5nfs7yImx9rwkskMvLHmPfNcwvkRmVcMGBmunrxvnfvl5z6pXy
         ObtupOfVHy6UwL42vh/BIwWEffKGmYh8nnGzTwh6BL/f7PnXRrDxVwrmQbAwEUqK179k
         yrnF+7hmjs7A7RCJxKrr9oEhReUKWccPjcPAIcuXPaSk2afJdJYWneDfmDIpSA4Lxsps
         x1Gw==
X-Gm-Message-State: AOAM530EHn3SC+igVdI2LDwoQE9cg6yzjJucEXcKWtLPnT06h7Lhy6Nd
        J+1Q1RkR/cBxaobOlqdpyPQ=
X-Google-Smtp-Source: ABdhPJwLyM6C8RCSNxp9Lhz/fnnARR2n+2V3Q+Mr/oYE0qAQEOLNDhvtsm35CD5Ys48fSh0eT5pTGA==
X-Received: by 2002:a17:902:8bc3:b029:124:919f:6213 with SMTP id r3-20020a1709028bc3b0290124919f6213mr21425743plo.51.1627434187298;
        Tue, 27 Jul 2021 18:03:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id 1sm4926456pfv.138.2021.07.27.18.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 18:03:06 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 13/13] drm/msm/gem: Mark active before pinning
Date:   Tue, 27 Jul 2021 18:06:18 -0700
Message-Id: <20210728010632.2633470-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Mark all the bos in the submit as active, before pinning, to prevent
evicting a buffer in the same submit to make room for a buffer earlier
in the table.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        |  2 --
 drivers/gpu/drm/msm/msm_gem_submit.c | 28 ++++++++++++++++++++--------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index af199ef53d2f..15b1804fa64e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -131,7 +131,6 @@ static struct page **get_pages(struct drm_gem_object *obj)
 		if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
 			sync_for_device(msm_obj);
 
-		GEM_WARN_ON(msm_obj->active_count);
 		update_inactive(msm_obj);
 	}
 
@@ -815,7 +814,6 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	GEM_WARN_ON(!msm_gem_is_locked(obj));
 	GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
 	GEM_WARN_ON(msm_obj->dontneed);
-	GEM_WARN_ON(!msm_obj->sgt);
 
 	if (msm_obj->active_count++ == 0) {
 		mutex_lock(&priv->mm_lock);
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index c2ecec5b11c4..fc25a85eb1ca 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -24,7 +24,8 @@
 /* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
 #define BO_VALID    0x8000   /* is current addr in cmdstream correct/valid? */
 #define BO_LOCKED   0x4000   /* obj lock is held */
-#define BO_PINNED   0x2000   /* obj is pinned and on active list */
+#define BO_ACTIVE   0x2000   /* active refcnt is held */
+#define BO_PINNED   0x1000   /* obj is pinned and on active list */
 
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		struct msm_gpu *gpu,
@@ -239,10 +240,11 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 	struct drm_gem_object *obj = &submit->bos[i].obj->base;
 	unsigned flags = submit->bos[i].flags & cleanup_flags;
 
-	if (flags & BO_PINNED) {
+	if (flags & BO_PINNED)
 		msm_gem_unpin_iova_locked(obj, submit->aspace);
+
+	if (flags & BO_ACTIVE)
 		msm_gem_active_put(obj);
-	}
 
 	if (flags & BO_LOCKED)
 		dma_resv_unlock(obj->resv);
@@ -252,7 +254,7 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 
 static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
 {
-	submit_cleanup_bo(submit, i, BO_PINNED | BO_LOCKED);
+	submit_cleanup_bo(submit, i, BO_PINNED | BO_ACTIVE | BO_LOCKED);
 
 	if (!(submit->bos[i].flags & BO_VALID))
 		submit->bos[i].iova = 0;
@@ -356,6 +358,18 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 
 	submit->valid = true;
 
+	/*
+	 * Increment active_count first, so if under memory pressure, we
+	 * don't inadvertently evict a bo needed by the submit in order
+	 * to pin an earlier bo in the same submit.
+	 */
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = &submit->bos[i].obj->base;
+
+		msm_gem_active_get(obj, submit->gpu);
+		submit->bos[i].flags |= BO_ACTIVE;
+	}
+
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 		uint64_t iova;
@@ -367,8 +381,6 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		msm_gem_active_get(obj, submit->gpu);
-
 		submit->bos[i].flags |= BO_PINNED;
 
 		if (iova == submit->bos[i].iova) {
@@ -502,7 +514,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 	unsigned i;
 
 	if (error)
-		cleanup_flags |= BO_PINNED;
+		cleanup_flags |= BO_PINNED | BO_ACTIVE;
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
@@ -520,7 +532,7 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
 		msm_gem_lock(obj);
-		submit_cleanup_bo(submit, i, BO_PINNED);
+		submit_cleanup_bo(submit, i, BO_PINNED | BO_ACTIVE);
 		msm_gem_unlock(obj);
 		drm_gem_object_put(obj);
 	}
-- 
2.31.1

