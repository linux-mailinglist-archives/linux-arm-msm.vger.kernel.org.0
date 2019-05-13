Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE9C1BFEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 01:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbfEMXlV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 19:41:21 -0400
Received: from onstation.org ([52.200.56.107]:41244 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726233AbfEMXlU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 19:41:20 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 2F68944970;
        Mon, 13 May 2019 23:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1557790879;
        bh=+8cCOED4KfTSbRV3k/MxI++S4PHLOBvuYlL8f5b9qMU=;
        h=From:To:Cc:Subject:Date:From;
        b=MKAflvfHm+VJdLDjRXpxyQ9Q882xYwizApj14wo6NB8V27Gc9f8HB8DqbkiTokWlW
         /19A8C9U1RIM1hc3JiByxR4A33X1M2gopJH2XOqHMRoCAbcgRMPU8/cRTFAmbyM2sI
         RfiE1EvJ5a6wXzYWVEvY8NGMgeCFSBqe19CwwI00=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, jonathan@marek.ca, robh@kernel.org
Subject: [PATCH v2.1 1/2] drm/msm: remove resv fields from msm_gem_object struct
Date:   Mon, 13 May 2019 19:41:04 -0400
Message-Id: <20190513234105.7531-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Fixes: dd55cf6929e6 ("drm: msm: Switch to use drm_gem_object reservation_object")
---
This is a split out version of this patch from where I am working to get
the display working on the Nexus 5:

https://lore.kernel.org/lkml/20190509020352.14282-2-masneyb@onstation.org/

Bjorn asks:
    This resolves a NULL-pointer dereference about to show up in v5.2-rc1,
    so please pick this up for -rc.

In this version, I dropped the change to msm_gem_new_impl() that
mistakenly removed 'msm_obj->base.resv = resv;'. I did not put a v3 on
this patch since I wanted to keep that version number for the larger work
to get the display working on the Nexus 5 so I went with 2.1 here. :)

 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 +---
 drivers/gpu/drm/msm/msm_atomic.c          | 4 +---
 drivers/gpu/drm/msm/msm_gem.h             | 4 ----
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4fca24b8702c..f3d009a3dc63 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -781,7 +781,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
 	struct dpu_hw_fmt_layout layout;
 	struct drm_gem_object *obj;
-	struct msm_gem_object *msm_obj;
 	struct dma_fence *fence;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
@@ -800,8 +799,7 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
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

