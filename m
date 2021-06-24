Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 404063B31ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbhFXPAF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 11:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbhFXPAE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 11:00:04 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8998EC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:44 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id t17so10839173lfq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vHOr5O91BQvkeV001owIbHLjqhC1uAPXk4QfUUezW3I=;
        b=r6ZIyn0GIIMSccamGJzgiosBdg3tT/g66zLlGU9IVLXVtTN40heWRzLXjPQ8waacQS
         SnCTwSNAkwGyxwOwsHWnVE/Atsk8xBXxJoYevfklXuHu+w9v0Bma4n4/KAVs4sGtDlhq
         92ptPxmPbb8ZQEOdv5wjRuo4nj+JpOT/peiVRXVPf7jsvXEGbhyfXQWIooLUUJp1Jfcy
         wdvCskITX07pIIOl8BME+RVzdEpVOJwXhBRj2xZZ2Z5KtDDMP+oImk0wJFcFJhpIkM5w
         osJbi7HquzhdAq7vGorc39qM6cGJhjDXeOw48OD0bVUezWUHgvnqBgjT2zrgwR9mQHjl
         65VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vHOr5O91BQvkeV001owIbHLjqhC1uAPXk4QfUUezW3I=;
        b=J6x8S47FbhKvVD64xgpBoaAgXyvlLOa7IxxwSQZhqv5azdKtUqTfQOA6W1J3TGYc+X
         YOiJvrd8NhIQrmOJBD9F8RJi7E/nSkzppw3RE5xv0isBK4wwRniimmuK9ZWQDwLsuzoP
         Usf4rDt8ibrhVpTNd07/s+xbTGxneg27yt9N8jffhG/gz19In6Oj8u0rbjGfuGJ0s9Jc
         Wi+d9chCcLkDzek1iyevt3B7E6zfM4y5okWELgf5rNT2CVuQmIT42NM/Obpp/vM2g6Ia
         OUaxrdkAe9i1XgRkXkVHL+87+jdJPNlk1tOKXS+Ofj45CzEUIJ/wXa0exVJQbwC5C+0u
         k0NQ==
X-Gm-Message-State: AOAM531iRBk7y+aKPn/k4GsHPhqGJL0MQnFv8tQSgJq3bHnch8swRV+R
        XbBA5Uv0qK5dtci69pj3ddaGZQ==
X-Google-Smtp-Source: ABdhPJyfZwTDAFMbLxrpGyWzGintOdK16ocMaXwQISUnV5WHNao9gPnVb9jFqVjVGH7WtayT7QuFSQ==
X-Received: by 2002:a05:6512:3f2a:: with SMTP id y42mr4137909lfa.234.1624546662838;
        Thu, 24 Jun 2021 07:57:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 07:57:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 06/17] drm/msm/dpu: move dpu_hw_pipe_cfg out of struct dpu_plane
Date:   Thu, 24 Jun 2021 17:57:22 +0300
Message-Id: <20210624145733.2561992-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

struct dpu_hw_pipe_cfg represents an interim state during atomic
update/color fill, so move it out of struct dpu_plane.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 91 ++++++++++++-----------
 1 file changed, 46 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index dbc9c2c28ae0..521ae699dc5a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -103,7 +103,6 @@ struct dpu_plane {
 	uint32_t features;      /* capabilities from catalog */
 
 	struct dpu_hw_pipe *pipe_hw;
-	struct dpu_hw_pipe_cfg pipe_cfg;
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
@@ -145,9 +144,9 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
  * Prefill BW Equation: line src bytes * line_time
  */
 static void _dpu_plane_calc_bw(struct drm_plane *plane,
-	struct drm_framebuffer *fb)
+	struct drm_framebuffer *fb,
+	struct dpu_hw_pipe_cfg *pipe_cfg)
 {
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
 	const struct dpu_format *fmt = NULL;
@@ -164,9 +163,9 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 
 	fmt = dpu_get_dpu_format_ext(fb->format->format, fb->modifier);
 
-	src_width = drm_rect_width(&pdpu->pipe_cfg.src_rect);
-	src_height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
-	dst_height = drm_rect_height(&pdpu->pipe_cfg.dst_rect);
+	src_width = drm_rect_width(&pipe_cfg->src_rect);
+	src_height = drm_rect_height(&pipe_cfg->src_rect);
+	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
 	fps = drm_mode_vrefresh(mode);
 	vbp = mode->vtotal - mode->vsync_end;
 	vpw = mode->vsync_end - mode->vsync_start;
@@ -200,9 +199,8 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
  * Result: Updates calculated clock in the plane state.
  * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
  */
-static void _dpu_plane_calc_clk(struct drm_plane *plane)
+static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_hw_pipe_cfg *pipe_cfg)
 {
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
 	int dst_width, src_height, dst_height, fps;
@@ -210,9 +208,9 @@ static void _dpu_plane_calc_clk(struct drm_plane *plane)
 	pstate = to_dpu_plane_state(plane->state);
 	mode = &plane->state->crtc->mode;
 
-	src_height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
-	dst_width = drm_rect_width(&pdpu->pipe_cfg.dst_rect);
-	dst_height = drm_rect_height(&pdpu->pipe_cfg.dst_rect);
+	src_height = drm_rect_height(&pipe_cfg->src_rect);
+	dst_width = drm_rect_width(&pipe_cfg->dst_rect);
+	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
 	fps = drm_mode_vrefresh(mode);
 
 	pstate->plane_clk =
@@ -309,7 +307,7 @@ static u64 _dpu_plane_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
  * @fb:			Pointer to framebuffer associated with the given plane
  */
 static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
-		struct drm_framebuffer *fb)
+		struct drm_framebuffer *fb, struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct dpu_format *fmt = NULL;
@@ -323,7 +321,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 				fb->format->format,
 				fb->modifier);
 		total_fl = _dpu_plane_calc_fill_level(plane, fmt,
-				drm_rect_width(&pdpu->pipe_cfg.src_rect));
+				drm_rect_width(&pipe_cfg->src_rect));
 
 		if (fmt && DPU_FORMAT_IS_LINEAR(fmt))
 			lut_usage = DPU_QOS_LUT_USAGE_LINEAR;
@@ -451,7 +449,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
  * @crtc:		Pointer to drm crtc
  */
 static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
-		struct drm_crtc *crtc)
+		struct drm_crtc *crtc, struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_vbif_set_ot_params ot_params;
@@ -460,8 +458,8 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	memset(&ot_params, 0, sizeof(ot_params));
 	ot_params.xin_id = pdpu->pipe_hw->cap->xin_id;
 	ot_params.num = pdpu->pipe_hw->idx - SSPP_NONE;
-	ot_params.width = drm_rect_width(&pdpu->pipe_cfg.src_rect);
-	ot_params.height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
+	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
+	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
 	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
 	ot_params.vbif_idx = VBIF_RT;
@@ -639,17 +637,18 @@ static void _dpu_plane_setup_csc(struct dpu_plane *pdpu)
 
 static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 		struct dpu_plane_state *pstate,
-		const struct dpu_format *fmt, bool color_fill)
+		const struct dpu_format *fmt, bool color_fill,
+		struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
 
 	/* don't chroma subsample if decimating */
 	/* update scaler. calculate default config for QSEED3 */
 	_dpu_plane_setup_scaler3(pdpu, pstate,
-			drm_rect_width(&pdpu->pipe_cfg.src_rect),
-			drm_rect_height(&pdpu->pipe_cfg.src_rect),
-			drm_rect_width(&pdpu->pipe_cfg.dst_rect),
-			drm_rect_height(&pdpu->pipe_cfg.dst_rect),
+			drm_rect_width(&pipe_cfg->src_rect),
+			drm_rect_height(&pipe_cfg->src_rect),
+			drm_rect_width(&pipe_cfg->dst_rect),
+			drm_rect_height(&pipe_cfg->dst_rect),
 			&pstate->scaler3_cfg, fmt,
 			info->hsub, info->vsub);
 }
@@ -667,6 +666,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	const struct dpu_format *fmt;
 	const struct drm_plane *plane = &pdpu->base;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
+	struct dpu_hw_pipe_cfg pipe_cfg;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
@@ -683,13 +683,13 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 				pstate->multirect_index);
 
 		/* override scaler/decimation if solid fill */
-		pdpu->pipe_cfg.src_rect.x1 = 0;
-		pdpu->pipe_cfg.src_rect.y1 = 0;
-		pdpu->pipe_cfg.src_rect.x2 =
-			drm_rect_width(&pdpu->pipe_cfg.dst_rect);
-		pdpu->pipe_cfg.src_rect.y2 =
-			drm_rect_height(&pdpu->pipe_cfg.dst_rect);
-		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true);
+		pipe_cfg.src_rect.x1 = 0;
+		pipe_cfg.src_rect.y1 = 0;
+		pipe_cfg.src_rect.x2 =
+			drm_rect_width(&pipe_cfg.dst_rect);
+		pipe_cfg.src_rect.y2 =
+			drm_rect_height(&pipe_cfg.dst_rect);
+		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
 
 		if (pdpu->pipe_hw->ops.setup_format)
 			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
@@ -698,7 +698,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 
 		if (pdpu->pipe_hw->ops.setup_rects)
 			pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
-					&pdpu->pipe_cfg,
+					&pipe_cfg,
 					pstate->multirect_index);
 
 		if (pdpu->pipe_hw->ops.setup_pe)
@@ -708,7 +708,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		if (pdpu->pipe_hw->ops.setup_scaler &&
 				pstate->multirect_index != DPU_SSPP_RECT_1)
 			pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
-					&pdpu->pipe_cfg, &pstate->pixel_ext,
+					&pipe_cfg, &pstate->pixel_ext,
 					&pstate->scaler3_cfg);
 	}
 
@@ -1070,10 +1070,11 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	bool is_rt_pipe, update_qos_remap;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
+	struct dpu_hw_pipe_cfg pipe_cfg;
 
-	memset(&(pdpu->pipe_cfg), 0, sizeof(struct dpu_hw_pipe_cfg));
+	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
 
-	_dpu_plane_set_scanout(plane, pstate, &pdpu->pipe_cfg, fb);
+	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
 
 	pstate->pending = true;
 
@@ -1085,17 +1086,17 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
 			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
 
-	pdpu->pipe_cfg.src_rect = state->src;
+	pipe_cfg.src_rect = state->src;
 
 	/* state->src is 16.16, src_rect is not */
-	pdpu->pipe_cfg.src_rect.x1 >>= 16;
-	pdpu->pipe_cfg.src_rect.x2 >>= 16;
-	pdpu->pipe_cfg.src_rect.y1 >>= 16;
-	pdpu->pipe_cfg.src_rect.y2 >>= 16;
+	pipe_cfg.src_rect.x1 >>= 16;
+	pipe_cfg.src_rect.x2 >>= 16;
+	pipe_cfg.src_rect.y1 >>= 16;
+	pipe_cfg.src_rect.y2 >>= 16;
 
-	pdpu->pipe_cfg.dst_rect = state->dst;
+	pipe_cfg.dst_rect = state->dst;
 
-	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false);
+	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
 
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
@@ -1105,7 +1106,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	if (pdpu->pipe_hw->ops.setup_rects) {
 		pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
-				&pdpu->pipe_cfg,
+				&pipe_cfg,
 				pstate->multirect_index);
 	}
 
@@ -1122,7 +1123,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	if (pdpu->pipe_hw->ops.setup_scaler &&
 			pstate->multirect_index != DPU_SSPP_RECT_1)
 		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
-				&pdpu->pipe_cfg, &pstate->pixel_ext,
+				&pipe_cfg, &pstate->pixel_ext,
 				&pstate->scaler3_cfg);
 
 	if (pdpu->pipe_hw->ops.setup_multirect)
@@ -1175,12 +1176,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			pdpu->csc_ptr = 0;
 	}
 
-	_dpu_plane_set_qos_lut(plane, fb);
+	_dpu_plane_set_qos_lut(plane, fb, &pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, fb);
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 		_dpu_plane_set_qos_ctrl(plane, true, DPU_PLANE_QOS_PANIC_CTRL);
-		_dpu_plane_set_ot_limit(plane, crtc);
+		_dpu_plane_set_ot_limit(plane, crtc, &pipe_cfg);
 	}
 
 	update_qos_remap = (is_rt_pipe != pdpu->is_rt_pipe) ||
@@ -1194,9 +1195,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		_dpu_plane_set_qos_remap(plane);
 	}
 
-	_dpu_plane_calc_bw(plane, fb);
+	_dpu_plane_calc_bw(plane, fb, &pipe_cfg);
 
-	_dpu_plane_calc_clk(plane);
+	_dpu_plane_calc_clk(plane, &pipe_cfg);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
-- 
2.30.2

