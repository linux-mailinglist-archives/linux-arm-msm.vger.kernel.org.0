Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69023654838
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 23:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235120AbiLVWPN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 17:15:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235610AbiLVWPJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 17:15:09 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5EF621E28
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 14:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1671747307; x=1703283307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H8K3GzcXSIEd1w51kx4lznBtFiP2qak8jltP0eQAHIk=;
  b=LB3vUK4Zdx/GuOtnkxIrDZx3CMIu+UkM/xdXxlxSQDIF2DvEDtiwlYJs
   9nabKn5mKmhrXEQ9Z8VvrnHBYYeDMGlIiMODBnj0whDiIRV1JRbWUMfgf
   S5/KtSF2eo7asZJVKSbj5woJberc6TTIM5oFuP+5DYgZlIVkQ7GoRm0q9
   I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Dec 2022 14:15:07 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 14:15:07 -0800
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 22 Dec 2022 14:15:05 -0800
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <contact@emersion.fr>,
        <daniel.vetter@ffwll.ch>, <laurent.pinchart@ideasonboard.com>,
        <ppaalanen@gmail.com>, <sebastian.wick@redhat.com>,
        <wayland-devel@lists.freedesktop.org>,
        <ville.syrjala@linux.intel.com>
Subject: [RFC PATCH v2 2/3] drm: Adjust atomic checks for solid fill color
Date:   Thu, 22 Dec 2022 14:14:40 -0800
Message-ID: <20221222221441.6980-3-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222221441.6980-1-quic_jesszhan@quicinc.com>
References: <20221222221441.6980-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Loosen the requirements for atomic and legacy commit so that, in cases
where solid fill planes is enabled (and FB_ID is NULL), the commit can
still go through.

In addition, add framebuffer NULL checks in other areas to account for
FB being NULL when solid fill is enabled.

Changes in V2:
- Changed to checks for if solid_fill_blob is set (Dmitry)
- Abstracted (plane_state && !solid_fill_blob) checks to helper method
  (Dmitry)
- Fixed indentation issue (Dmitry)

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic.c        | 69 ++++++++++++++++-------------
 drivers/gpu/drm/drm_atomic_helper.c | 34 ++++++++------
 drivers/gpu/drm/drm_plane.c         |  8 ++--
 include/drm/drm_atomic_helper.h     |  6 ++-
 include/drm/drm_plane.h             | 12 +++++
 5 files changed, 78 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f197f59f6d99..b92d75bda7fd 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -601,8 +601,10 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	uint32_t num_clips;
 	int ret;
 
-	/* either *both* CRTC and FB must be set, or neither */
-	if (crtc && !fb) {
+	/* When solid_fill is disabled,
+	 * either *both* CRTC and FB must be set, or neither
+	 */
+	if (crtc && !fb && !new_plane_state->solid_fill_blob) {
 		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
 			       plane->base.id, plane->name);
 		return -EINVAL;
@@ -626,14 +628,17 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	}
 
 	/* Check whether this plane supports the fb pixel format. */
-	ret = drm_plane_check_pixel_format(plane, fb->format->format,
-					   fb->modifier);
-	if (ret) {
-		drm_dbg_atomic(plane->dev,
-			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
-			       plane->base.id, plane->name,
-			       &fb->format->format, fb->modifier);
-		return ret;
+	if (fb) {
+		ret = drm_plane_check_pixel_format(plane, fb->format->format,
+						   fb->modifier);
+
+		if (ret) {
+			drm_dbg_atomic(plane->dev,
+				       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
+				       plane->base.id, plane->name,
+				       &fb->format->format, fb->modifier);
+			return ret;
+		}
 	}
 
 	/* Give drivers some help against integer overflows */
@@ -649,28 +654,30 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 		return -ERANGE;
 	}
 
-	fb_width = fb->width << 16;
-	fb_height = fb->height << 16;
+	if (fb) {
+		fb_width = fb->width << 16;
+		fb_height = fb->height << 16;
 
-	/* Make sure source coordinates are inside the fb. */
-	if (new_plane_state->src_w > fb_width ||
-	    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
-	    new_plane_state->src_h > fb_height ||
-	    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
-		drm_dbg_atomic(plane->dev,
-			       "[PLANE:%d:%s] invalid source coordinates "
-			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
-			       plane->base.id, plane->name,
-			       new_plane_state->src_w >> 16,
-			       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
-			       new_plane_state->src_h >> 16,
-			       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
-			       new_plane_state->src_x >> 16,
-			       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
-			       new_plane_state->src_y >> 16,
-			       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
-			       fb->width, fb->height);
-		return -ENOSPC;
+		/* Make sure source coordinates are inside the fb. */
+		if (new_plane_state->src_w > fb_width ||
+		    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
+		    new_plane_state->src_h > fb_height ||
+		    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
+			drm_dbg_atomic(plane->dev,
+				       "[PLANE:%d:%s] invalid source coordinates "
+				       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
+				       plane->base.id, plane->name,
+				       new_plane_state->src_w >> 16,
+				       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
+				       new_plane_state->src_h >> 16,
+				       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
+				       new_plane_state->src_x >> 16,
+				       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
+				       new_plane_state->src_y >> 16,
+				       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
+				       fb->width, fb->height);
+			return -ENOSPC;
+		}
 	}
 
 	clips = __drm_plane_get_damage_clips(new_plane_state);
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 1a586b3c454b..b53897f882c1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -864,7 +864,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 	*src = drm_plane_state_src(plane_state);
 	*dst = drm_plane_state_dest(plane_state);
 
-	if (!fb) {
+	if (!fb && !drm_plane_solid_fill_enabled(plane_state)) {
 		plane_state->visible = false;
 		return 0;
 	}
@@ -881,25 +881,31 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 		return -EINVAL;
 	}
 
-	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
+	if (fb) {
+		drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
 
-	/* Check scaling */
-	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
-	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
-	if (hscale < 0 || vscale < 0) {
-		drm_dbg_kms(plane_state->plane->dev,
-			    "Invalid scaling of plane\n");
-		drm_rect_debug_print("src: ", &plane_state->src, true);
-		drm_rect_debug_print("dst: ", &plane_state->dst, false);
-		return -ERANGE;
+		/* Check scaling */
+		hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
+		vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
+
+		if (hscale < 0 || vscale < 0) {
+			drm_dbg_kms(plane_state->plane->dev,
+					"Invalid scaling of plane\n");
+			drm_rect_debug_print("src: ", &plane_state->src, true);
+			drm_rect_debug_print("dst: ", &plane_state->dst, false);
+			return -ERANGE;
+		}
 	}
 
 	if (crtc_state->enable)
 		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
 
-	plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
-
-	drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
+	if (drm_plane_solid_fill_enabled(plane_state)) {
+		plane_state->visible = true;
+	} else if (fb) {
+		plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
+		drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
+	}
 
 	if (!plane_state->visible)
 		/*
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 33357629a7f5..bdce2acbef6a 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -856,8 +856,8 @@ static int __setplane_internal(struct drm_plane *plane,
 
 	WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
 
-	/* No fb means shut it down */
-	if (!fb) {
+	/* No fb and no color fill means shut it down */
+	if (!fb && !drm_plane_solid_fill_enabled(plane->state)) {
 		plane->old_fb = plane->fb;
 		ret = plane->funcs->disable_plane(plane, ctx);
 		if (!ret) {
@@ -908,8 +908,8 @@ static int __setplane_atomic(struct drm_plane *plane,
 
 	WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
 
-	/* No fb means shut it down */
-	if (!fb)
+	/* No fb and no color fill means shut it down */
+	if (!fb && !drm_plane_solid_fill_enabled(plane->state))
 		return plane->funcs->disable_plane(plane, ctx);
 
 	/*
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 33f982cd1a27..16a2a8edcc68 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -230,8 +230,10 @@ drm_atomic_plane_disabling(struct drm_plane_state *old_plane_state,
 	 * Anything else should be considered a bug in the atomic core, so we
 	 * gently warn about it.
 	 */
-	WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
-		(new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
+	WARN_ON(!new_plane_state->solid_fill_blob &&
+		((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
+				(new_plane_state->crtc != NULL &&
+				 new_plane_state->fb == NULL)));
 
 	return old_plane_state->crtc && !new_plane_state->crtc;
 }
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index be5ab5f7b477..a9e6a09a75f7 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -977,6 +977,18 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
 #define drm_for_each_plane(plane, dev) \
 	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
 
+/**
+ * drm_plane_solid_fill_enabled - Check if solid fill is enabled on plane
+ * @state: plane state
+ *
+ * Returns:
+ * Whether the plane has been assigned a solid_fill_blob
+ */
+static inline bool drm_plane_solid_fill_enabled(struct drm_plane_state *state)
+{
+	return state && state->solid_fill_blob;
+}
+
 bool drm_any_plane_has_format(struct drm_device *dev,
 			      u32 format, u64 modifier);
 
-- 
2.38.1

