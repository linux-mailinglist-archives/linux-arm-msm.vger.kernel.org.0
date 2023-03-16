Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A714A6BD545
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 17:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjCPQR5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 12:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjCPQRr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 12:17:47 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7423EDCF62
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:21 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id b10so2294179ljr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678983439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yghwGUrc3XfXyWvPFMZytjd2/aJEoP/5nuXbnUM6A70=;
        b=OD+f8BBJcDgLsyzFc8INzECPtE2DoIpSqK33coXqFvc2qri1WDoe/k5hdNPFPhH77l
         d+ajWqC32WD2yusKqWDoi8mGPX24wQB+FcBTsLU0EKnSi0N/5wqEXipYHzIxnfBygLgX
         PNbjy4qkumGvkPpBP0s1uyAsfd2zt+UGIyK6fp0Pt8MOpT1Gmb6sKrelZIqa6DkW18Cv
         3Unt2YYIJ+r+9u9KrPU0jf7ZEUni6fWS6sOFkKuC0+zn4jF7DcjIHOn/DkoDF4pApMxh
         mAE7vaNrQHnerhgdceQrP+v92GVhn4cB8UYaj9YsIciePe3Y9QZU5kSg4Has7mah+R6M
         eGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678983439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yghwGUrc3XfXyWvPFMZytjd2/aJEoP/5nuXbnUM6A70=;
        b=cPLFzVWHTYiaEEsdBNtAelnAwAQdb7Hiv63B3QFzv3QLrRNAo7QHe5GOTfSKjJpzx2
         HhuRQ6UHD+DBxBoJ54zGCmPw/xUj+ke29JP1HkpzDYvsQj5FrWX35yCMyqB7y3mDXb3N
         gQMIcF4nN1+1io9PcDoqMB9WJeZERDsztVP5ENMhH+kNNkx8Tq+Sl3T3B+TfmKTJYeZG
         imjgP2/VOagXBXy/6cw1/yWQdTvpja3kp+FFbfVdCLyKwJ0PgFAr62Z0b2o6x22HcYR6
         uxQqjy3o3j8sMIVmYPvKtzjoko8FG/sEvQN2oQCGle3M3p9J3We2XAhL/xvOikqdJj0z
         yi2w==
X-Gm-Message-State: AO0yUKVsAEHnMkEXnx2rBU/Ul0Sczpeogfrc1LM1y0W/O8ZwaXSHw7TQ
        d0iKoHU8QpSkm9nNvXr70Fztww==
X-Google-Smtp-Source: AK7set+dGJO+eTK7zPfwSHI0Go1MxyNbin/SCb2voek2c8RwTaEjMWc2/RR8JOfDrJZUXlsoHo94tw==
X-Received: by 2002:a2e:8242:0:b0:295:ab17:c98e with SMTP id j2-20020a2e8242000000b00295ab17c98emr2283600ljh.20.1678983439162;
        Thu, 16 Mar 2023 09:17:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:17:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v7 27/32] drm/msm/dpu: add support for wide planes
Date:   Thu, 16 Mar 2023 19:16:48 +0300
Message-Id: <20230316161653.4106395-28-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is possible to use multirect feature and split source to use the SSPP
to output two consecutive rectangles. This commit brings in this
capability to support wider screen resolutions.

Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  19 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 136 +++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   4 +
 3 files changed, 142 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 217a8112f1a2..90b406e409d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -481,6 +481,15 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 					   format, fb ? fb->modifier : 0,
 					   &pstate->pipe, 0, stage_cfg);
 
+		if (pstate->r_pipe.sspp) {
+			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
+			_dpu_crtc_blend_setup_pipe(crtc, plane,
+						   mixer, cstate->num_mixers,
+						   pstate->stage,
+						   format, fb ? fb->modifier : 0,
+						   &pstate->r_pipe, 1, stage_cfg);
+		}
+
 		/* blend config update */
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
 			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
@@ -1341,10 +1350,16 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
-		seq_printf(s, "\tsspp:%s\n",
+		seq_printf(s, "\tsspp[0]:%s\n",
 			   pstate->pipe.sspp->cap->name);
-		seq_printf(s, "\tmultirect: mode: %d index: %d\n",
+		seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
 			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
+		if (pstate->r_pipe.sspp) {
+			seq_printf(s, "\tsspp[1]:%s\n",
+				   pstate->r_pipe.sspp->cap->name);
+			seq_printf(s, "\tmultirect[1]: mode: %d index: %d\n",
+				   pstate->r_pipe.multirect_mode, pstate->r_pipe.multirect_index);
+		}
 
 		seq_puts(s, "\n");
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index f52120b05b6e..73db15d76059 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -701,6 +701,10 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	/* update sspp */
 	_dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
 				   fill_color, fmt);
+
+	if (pstate->r_pipe.sspp)
+		_dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg.dst_rect,
+					   fill_color, fmt);
 }
 
 int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
@@ -959,9 +963,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	int ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	const struct drm_crtc_state *crtc_state = NULL;
 	const struct dpu_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
 	uint32_t max_linewidth;
 	unsigned int rotation;
@@ -985,8 +992,11 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
-	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->sspp = NULL;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
@@ -1016,21 +1026,67 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
+	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	/* check decimated source width */
 	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
-		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-		return -E2BIG;
-	}
+		/*
+		 * In parallel multirect case only the half of the usual width
+		 * is supported for tiled formats. If we are here, we know that
+		 * full width is more than max_linewidth, thus each rect is
+		 * wider than allowed.
+		 */
+		if (DPU_FORMAT_IS_UBWC(fmt)) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
 
-	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
 
-	ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, fmt);
+		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
+		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
+		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
+		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
+		    DPU_FORMAT_IS_YUV(fmt)) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		/*
+		 * Use multirect for wide plane. We do not support dynamic
+		 * assignment of SSPPs, so we know the configuration.
+		 */
+		pipe->multirect_index = DPU_SSPP_RECT_0;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		r_pipe->sspp = pipe->sspp;
+		r_pipe->multirect_index = DPU_SSPP_RECT_1;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		*r_pipe_cfg = *pipe_cfg;
+		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
+		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
+		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
+		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
+	}
+
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
 	if (ret)
 		return ret;
 
+	if (r_pipe->sspp) {
+		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt);
+		if (ret)
+			return ret;
+	}
+
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
 
 	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
@@ -1097,8 +1153,10 @@ void dpu_plane_flush(struct drm_plane *plane)
 	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
-	else
+	else {
 		dpu_plane_flush_csc(pdpu, &pstate->pipe);
+		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
+	}
 
 	/* flag h/w flush complete */
 	if (plane->state)
@@ -1210,13 +1268,14 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
 	bool is_rt_pipe;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	struct msm_gem_address_space *aspace = kms->base.aspace;
 	struct dpu_hw_fmt_layout layout;
@@ -1244,6 +1303,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 				   drm_mode_vrefresh(&crtc->mode),
 				   layout_valid ? &layout : NULL);
 
+	if (r_pipe->sspp) {
+		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
+					   drm_mode_vrefresh(&crtc->mode),
+					   layout_valid ? &layout : NULL);
+	}
+
 	if (pstate->needs_qos_remap)
 		pstate->needs_qos_remap = false;
 
@@ -1251,16 +1316,31 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 						    &crtc->mode, pipe_cfg);
 
 	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
+
+	if (r_pipe->sspp) {
+		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, r_pipe_cfg);
+
+		pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
+	}
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 
 	trace_dpu_plane_disable(DRMID(plane), false,
 				pstate->pipe.multirect_mode);
 
+	if (r_pipe->sspp) {
+		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+		if (r_pipe->sspp->ops.setup_multirect)
+			r_pipe->sspp->ops.setup_multirect(r_pipe);
+	}
+
 	pstate->pending = true;
 }
 
@@ -1293,6 +1373,9 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		pstate = to_dpu_plane_state(plane->state);
 		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
 
+		if (pstate->r_pipe.sspp)
+			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+
 		mutex_destroy(&pdpu->lock);
 
 		/* this will destroy the states as well */
@@ -1373,12 +1456,29 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
 	const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
+	const struct dpu_sw_pipe *pipe = &pstate->pipe;
+	const struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	const struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	const struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
-	drm_printf(p, "\tsspp=%s\n", pstate->pipe.sspp->cap->name);
-	drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->pipe.multirect_mode));
-	drm_printf(p, "\tmultirect_index=%s\n",
-		   dpu_get_multirect_index(pstate->pipe.multirect_index));
+
+	drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
+	drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
+	drm_printf(p, "\tmultirect_index[0]=%s\n",
+		   dpu_get_multirect_index(pipe->multirect_index));
+	drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
+	drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+
+	if (r_pipe->sspp) {
+		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
+		drm_printf(p, "\tmultirect_mode[1]=%s\n",
+			   dpu_get_multirect_mode(r_pipe->multirect_mode));
+		drm_printf(p, "\tmultirect_index[1]=%s\n",
+			   dpu_get_multirect_index(r_pipe->multirect_index));
+		drm_printf(p, "\tsrc[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->src_rect));
+		drm_printf(p, "\tdst[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->dst_rect));
+	}
 }
 
 static void dpu_plane_reset(struct drm_plane *plane)
@@ -1412,6 +1512,10 @@ static void dpu_plane_reset(struct drm_plane *plane)
 	 * This is the place where the state is allocated, so fill it fully.
 	 */
 	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
+	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	pstate->r_pipe.sspp = NULL;
 
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
@@ -1428,6 +1532,8 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
+	if (pstate->r_pipe.sspp)
+		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 0ca9002015ff..7490ffd94d03 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -19,7 +19,9 @@
  * @base:	base drm plane state object
  * @aspace:	pointer to address space for input/output buffers
  * @pipe:	software pipe description
+ * @r_pipe:	software pipe description of the second pipe
  * @pipe_cfg:	software pipe configuration
+ * @r_pipe_cfg:	software pipe configuration for the second pipe
  * @stage:	assigned by crtc blender
  * @needs_qos_remap: qos remap settings need to be updated
  * @multirect_index: index of the rectangle of SSPP
@@ -34,7 +36,9 @@ struct dpu_plane_state {
 	struct drm_plane_state base;
 	struct msm_gem_address_space *aspace;
 	struct dpu_sw_pipe pipe;
+	struct dpu_sw_pipe r_pipe;
 	struct dpu_sw_pipe_cfg pipe_cfg;
+	struct dpu_sw_pipe_cfg r_pipe_cfg;
 	enum dpu_stage stage;
 	bool needs_qos_remap;
 	bool pending;
-- 
2.30.2

