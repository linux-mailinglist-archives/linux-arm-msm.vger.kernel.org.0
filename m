Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C905918384
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 04:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfEICEK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 22:04:10 -0400
Received: from onstation.org ([52.200.56.107]:56756 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbfEICEJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 22:04:09 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 16C0E4501F;
        Thu,  9 May 2019 02:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1557367448;
        bh=hLvKx3H0gKd8d48PrIs2ZUsM3jMYG5TE4uEae9BECco=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=T4mZiU12lOWGL9Nyg6XGDECt0GtyyfSg64JtwHj+MwJLDKZFnTeIFJOyvRHN8pxX+
         /rAS+O5RoLCOCMlHGtX5k8f6Xv8J2fTNnWP/Mr/opK/PYYXxjsRntW6WUSmpbsFMFt
         Ua0xMjqjjdBq58ukL4pWvs1oxhH9jY31SAf8aUww=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        jonathan@marek.ca, robh@kernel.org
Subject: [PATCH v2 1/6] drm: msm: remove resv fields from msm_gem_object struct
Date:   Wed,  8 May 2019 22:03:47 -0400
Message-Id: <20190509020352.14282-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509020352.14282-1-masneyb@onstation.org>
References: <20190509020352.14282-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm_gem_object structure contains resv and _resv fields that are
no longer needed since the reservation object is now stored on
drm_gem_object. msm_atomic_prepare_fb() and msm_atomic_prepare_fb()
both referenced the wrong reservation object, and would lead to an
attempt to dereference a NULL pointer. Correct those two cases to
point to the correct reservation object.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Fixes: dd55cf6929e6 ("drm: msm: Switch to use drm_gem_object reservation_object")
---
Patch introduced in v2

 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 +---
 drivers/gpu/drm/msm/msm_atomic.c          | 4 +---
 drivers/gpu/drm/msm/msm_gem.c             | 3 ---
 drivers/gpu/drm/msm/msm_gem.h             | 4 ----
 4 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index da1f727d7495..ce1a555e1f31 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -780,7 +780,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
 	struct dpu_hw_fmt_layout layout;
 	struct drm_gem_object *obj;
-	struct msm_gem_object *msm_obj;
 	struct dma_fence *fence;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
@@ -799,8 +798,7 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	 *       implicit fence and fb prepare by hand here.
 	 */
 	obj = msm_framebuffer_bo(new_state->fb, 0);
-	msm_obj = to_msm_bo(obj);
-	fence = reservation_object_get_excl_rcu(msm_obj->resv);
+	fence = reservation_object_get_excl_rcu(obj->resv);
 	if (fence)
 		drm_atomic_set_fence_for_plane(new_state, fence);
 
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index f5b1256e32b6..131c23a267ee 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -49,15 +49,13 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
 	struct msm_drm_private *priv = plane->dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	struct drm_gem_object *obj;
-	struct msm_gem_object *msm_obj;
 	struct dma_fence *fence;
 
 	if (!new_state->fb)
 		return 0;
 
 	obj = msm_framebuffer_bo(new_state->fb, 0);
-	msm_obj = to_msm_bo(obj);
-	fence = reservation_object_get_excl_rcu(msm_obj->resv);
+	fence = reservation_object_get_excl_rcu(obj->resv);
 
 	drm_atomic_set_fence_for_plane(new_state, fence);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 31d5a744d84f..947508e8269d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -973,9 +973,6 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	msm_obj->flags = flags;
 	msm_obj->madv = MSM_MADV_WILLNEED;
 
-	if (resv)
-		msm_obj->base.resv = resv;
-
 	INIT_LIST_HEAD(&msm_obj->submit_entry);
 	INIT_LIST_HEAD(&msm_obj->vmas);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c5ac781dffee..812d1b1369a5 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -86,10 +86,6 @@ struct msm_gem_object {
 
 	struct llist_node freed;
 
-	/* normally (resv == &_resv) except for imported bo's */
-	struct reservation_object *resv;
-	struct reservation_object _resv;
-
 	/* For physically contiguous buffers.  Used when we don't have
 	 * an IOMMU.  Also used for stolen/splashscreen buffer.
 	 */
-- 
2.20.1

