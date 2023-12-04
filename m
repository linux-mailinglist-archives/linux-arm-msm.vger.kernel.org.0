Return-Path: <linux-arm-msm+bounces-3269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C534D803427
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E86D31C20ADE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D560024B22;
	Mon,  4 Dec 2023 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OOC8K4p9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE39DF
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:14:58 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id 2adb3069b0e04-50be10acaf9so2382273e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 05:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701695697; x=1702300497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVE0MrZ/Z1PMJKWIuIoj0orbQq8vDOJ1IdPtnhEZDN8=;
        b=OOC8K4p9zl6399H0aPAG26/+Hd65kDNMaFE22IbMX0kqUHAQNlabPbbk9G6Cfl8sfM
         k59DMbULV8NoR/ltbPdw0Tnt9wyygT7CVOkgQ0g7KFsTJMPWzEQ3St37LHPfDx0+SZNh
         1xydhwWAr1tmvyoSgtgS3xRDmBXOoOzWz+4x+r4wKfoi+arwOIx/hXD4Zb6iEAdYmAKi
         VIr2DzFlxZxtHZPc5JxcechKg5lHn5mvLitmGUgdosCUYvnvPaWVHHwTDM234D48Sc3g
         vEQvR/8Scs9CnKeFSOApaiqqFzV/zZ0mP6Dob3qhAXFp3jmNWLroEEChOMcpFzSrslwF
         ftSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695697; x=1702300497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVE0MrZ/Z1PMJKWIuIoj0orbQq8vDOJ1IdPtnhEZDN8=;
        b=l5XVccmNmLzaVQD4oT9G4VbnPijbOIFfD90ZfS2HcslDwAKXLuWxvBKcpj5UtjwKQ7
         sxuslcwEzPqRjCQl9XkECKHLV8h3pjrqWYVR38ZsZKlwrPbSKyFRuve9Cik3Q2XXr3E/
         TSQM9MXBfqqQSQgczdmXk9dt6KwiS7leg5ZN8O9UC6oLFxQwtYZyuYFGZevdtop17t95
         6dHXuWg3Cxb7GolX3vym39G11+rw7Kcvfu8fwGVp/4qZZp6zdIhstJ743yD6ho6QHhfg
         TVcDkuQ5+XIoJRWdCb8ZPo2YLZtPXvFlXFGBVG4L7iBHT1Z9IT5Zh4uA9wSaxQfO2LLS
         CpVg==
X-Gm-Message-State: AOJu0YxNTS5jnlDhncTzSHyiBPLLH95QkKfpefCypfA/L9gWpV9PcflF
	/Yz4IBWqCsRDvbgcCg4eRrTgqQ==
X-Google-Smtp-Source: AGHT+IFbnzLL5kvbNu3hFZr38ebzR2vOt0bRGr/9qSkFhL4oCDnaglGfVyi8Lm/PwHuhvI/W9spRhQ==
X-Received: by 2002:a05:6512:3a85:b0:50b:bf99:b656 with SMTP id q5-20020a0565123a8500b0050bbf99b656mr3690541lfu.14.1701695697068;
        Mon, 04 Dec 2023 05:14:57 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:14:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/7] Revert "drm/atomic: Loosen FB atomic checks"
Date: Mon,  4 Dec 2023 15:13:48 +0200
Message-ID: <20231204131455.19023-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit f1e75da5364e780905d9cd6043f9c74cdcf84073.

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI. It
has neither corresponding open-source userspace implementation nor the
IGT tests coverage. Reverting this patchset until userspace obligations
are fulfilled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c        | 21 ++++++++--------
 drivers/gpu/drm/drm_atomic_helper.c | 39 +++++++++++++----------------
 include/drm/drm_atomic_helper.h     |  4 +--
 include/drm/drm_plane.h             | 29 ---------------------
 4 files changed, 29 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index aed0a694c74c..c6f2b86c48ae 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -674,16 +674,17 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 {
 	struct drm_plane *plane = new_plane_state->plane;
 	struct drm_crtc *crtc = new_plane_state->crtc;
+	const struct drm_framebuffer *fb = new_plane_state->fb;
 	int ret;
 
-	/* either *both* CRTC and pixel source must be set, or neither */
-	if (crtc && !drm_plane_has_visible_data(new_plane_state)) {
-		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no visible data\n",
+	/* either *both* CRTC and FB must be set, or neither */
+	if (crtc && !fb) {
+		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
 			       plane->base.id, plane->name);
 		return -EINVAL;
-	} else if (drm_plane_has_visible_data(new_plane_state) && !crtc) {
-		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] Source %d has visible data but no CRTC\n",
-			       plane->base.id, plane->name, new_plane_state->pixel_source);
+	} else if (fb && !crtc) {
+		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] FB set but no CRTC\n",
+			       plane->base.id, plane->name);
 		return -EINVAL;
 	}
 
@@ -714,11 +715,9 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	}
 
 
-	if (new_plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && new_plane_state->fb) {
-		ret = drm_atomic_plane_check_fb(new_plane_state);
-		if (ret)
-			return ret;
-	}
+	ret = drm_atomic_plane_check_fb(new_plane_state);
+	if (ret)
+		return ret;
 
 	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
 		drm_dbg_atomic(plane->dev,
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index dc048988e3f3..c3f677130def 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -861,6 +861,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					bool can_position,
 					bool can_update_disabled)
 {
+	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_rect *src = &plane_state->src;
 	struct drm_rect *dst = &plane_state->dst;
 	unsigned int rotation = plane_state->rotation;
@@ -872,7 +873,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 	*src = drm_plane_state_src(plane_state);
 	*dst = drm_plane_state_dest(plane_state);
 
-	if (!drm_plane_has_visible_data(plane_state)) {
+	if (!fb) {
 		plane_state->visible = false;
 		return 0;
 	}
@@ -889,31 +890,25 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 		return -EINVAL;
 	}
 
-	/* Check that selected pixel source is valid */
-	if (plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && plane_state->fb) {
-		struct drm_framebuffer *fb = plane_state->fb;
-		drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
+	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
 
-		/* Check scaling */
-		hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
-		vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
+	/* Check scaling */
+	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
+	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
+	if (hscale < 0 || vscale < 0) {
+		drm_dbg_kms(plane_state->plane->dev,
+			    "Invalid scaling of plane\n");
+		drm_rect_debug_print("src: ", &plane_state->src, true);
+		drm_rect_debug_print("dst: ", &plane_state->dst, false);
+		return -ERANGE;
+	}
 
-		if (hscale < 0 || vscale < 0) {
-			drm_dbg_kms(plane_state->plane->dev,
-					"Invalid scaling of plane\n");
-			drm_rect_debug_print("src: ", &plane_state->src, true);
-			drm_rect_debug_print("dst: ", &plane_state->dst, false);
-			return -ERANGE;
-		}
+	if (crtc_state->enable)
+		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
 
-		if (crtc_state->enable)
-			drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
+	plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
 
-		plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
-		drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
-	} else if (drm_plane_solid_fill_enabled(plane_state)) {
-		plane_state->visible = true;
-	}
+	drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
 
 	if (!plane_state->visible)
 		/*
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 6d97f38ac1f6..536a0b0091c3 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -256,8 +256,8 @@ drm_atomic_plane_disabling(struct drm_plane_state *old_plane_state,
 	 * Anything else should be considered a bug in the atomic core, so we
 	 * gently warn about it.
 	 */
-	WARN_ON((new_plane_state->crtc == NULL && drm_plane_has_visible_data(new_plane_state)) ||
-		(new_plane_state->crtc != NULL && !drm_plane_has_visible_data(new_plane_state)));
+	WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
+		(new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
 
 	return old_plane_state->crtc && !new_plane_state->crtc;
 }
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 3b187f3f5466..d14e2f1db234 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -1016,35 +1016,6 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
 #define drm_for_each_plane(plane, dev) \
 	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
 
-/**
- * drm_plane_solid_fill_enabled - Check if solid fill is enabled on plane
- * @state: plane state
- *
- * Returns:
- * Whether the plane has been assigned a solid_fill_blob
- */
-static inline bool drm_plane_solid_fill_enabled(struct drm_plane_state *state)
-{
-	if (!state)
-		return false;
-	return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_SOLID_FILL && state->solid_fill_blob;
-}
-
-static inline bool drm_plane_has_visible_data(const struct drm_plane_state *state)
-{
-	switch (state->pixel_source) {
-	case DRM_PLANE_PIXEL_SOURCE_NONE:
-		return false;
-	case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
-		return state->solid_fill_blob != NULL;
-	case DRM_PLANE_PIXEL_SOURCE_FB:
-	default:
-		WARN_ON(state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB);
-	}
-
-	return state->fb != NULL;
-}
-
 bool drm_any_plane_has_format(struct drm_device *dev,
 			      u32 format, u64 modifier);
 
-- 
2.42.0


