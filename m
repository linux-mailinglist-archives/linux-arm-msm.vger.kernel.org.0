Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56D3D6B99E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbjCNPiJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbjCNPhp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:37:45 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17A9B06CA
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:52 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id h9so16448161ljq.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jv6jYwhz0OyPzzVNkhaiSu0qfN6+HLaNUAup/zMDftw=;
        b=fg1ez/4d+mniAtapnucKXTLxQRBfJ0YFEyM16ZVlz0yv/bYXdgd19eRC5tnfWInARw
         y66ZPntbsoRz72hYPxOTP2SA4e7NVqDIkBdgoGgIajtRWrVPDZF9D7vRja+riFRL44X8
         NLo9BsAxRoK4OEwQWdNhQa847dNyatWjOyD6Coxh/2pJN3sOCkMDNPhM4MQ1ZzP6xl40
         4BCkW7QWbwvV+T8YWUTpT7eh932UNkzUMVODhfEayW7aKEErGu1aqsLewkbth0lpdMbQ
         TMD+msldT4AlL7YrXGeS/Zqlyf8DcwBe6l45Eka6+aAHtwHVcJfgmxQK6Sp4IFc1adcL
         r3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jv6jYwhz0OyPzzVNkhaiSu0qfN6+HLaNUAup/zMDftw=;
        b=W6/JKrjItsyzVkO1oVH3if4pIRXorfgTv0Mb4CwEDKP2+HhGtLjgda4mZMrfADdlLt
         peR/cyo+5pcxeh21wY0YhGupZ0idcWpyy2Cc7b/3C1FYG9EOGsi0pFf7pqNMYsSco5Hr
         hfbD8+9jbBKouLEf4+0O+akS/OfWf5Be5IUTM2Bz/WsMa3sfUyyeC/yTy5p5XHq358LD
         8sG0HuAvArL5ufRx5gADm5627wLCJ55A03yuoj967t0R8ea3xC0sD3Hv62S8rzSUJxCN
         FQ46CRmlLSX0PYCLLpMPraPRYA8QcfcvJxvoySWt6Plu6iUOEXyaXtv93k2ShJmBZBdo
         HRhg==
X-Gm-Message-State: AO0yUKWybfHi4dNMCuQpTaZiJ9KSSGbm8gRp4Eq8eFnUr7kLRJpEPNll
        1d5cEaWowDTNA38pbpIMCzA2aA==
X-Google-Smtp-Source: AK7set8EKbbq1GKg0844jepLKI9OS+sSnHGwySaF46LcbJwVM0dW1RE0BZ+u2NjGUfHHikw7UtB6gQ==
X-Received: by 2002:a05:651c:550:b0:298:6ea9:185c with SMTP id q16-20020a05651c055000b002986ea9185cmr8530475ljp.38.1678808165527;
        Tue, 14 Mar 2023 08:36:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:36:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 27/32] drm/msm/dpu: add support for wide planes
Date:   Tue, 14 Mar 2023 18:35:40 +0300
Message-Id: <20230314153545.3442879-28-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is possible to use multirect feature and split source to use the SSPP
to output two consecutive rectangles. This commit brings in this
capability to support wider screen resolutions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  19 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 127 +++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   4 +
 3 files changed, 133 insertions(+), 17 deletions(-)

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
index f52120b05b6e..494c1144075a 100644
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
@@ -1016,21 +1026,58 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
+	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
+	if (DPU_FORMAT_IS_UBWC(fmt))
+		max_linewidth /= 2;
 
-	/* check decimated source width */
 	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
-		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-		return -E2BIG;
-	}
+		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
 
-	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+		/*
+		 * FIXME: it's not possible to check if sourcesplit is supported,
+		 * LMs is not assigned yet. It happens in dpu_encoder_virt_mode_set
+		 */
+		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
+			   drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
+			   (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
+			    !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
+			   DPU_FORMAT_IS_YUV(fmt)) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		/* Use multirect for wide plane. We do not support dynamic assignment of SSPPs, so we know the configuration. */
+		pipe->multirect_index = DPU_SSPP_RECT_0;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
-	ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, fmt);
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
@@ -1097,8 +1144,10 @@ void dpu_plane_flush(struct drm_plane *plane)
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
@@ -1210,13 +1259,14 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
@@ -1244,6 +1294,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
 
@@ -1251,16 +1307,31 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
 
@@ -1293,6 +1364,9 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		pstate = to_dpu_plane_state(plane->state);
 		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
 
+		if (pstate->r_pipe.sspp)
+			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+
 		mutex_destroy(&pdpu->lock);
 
 		/* this will destroy the states as well */
@@ -1373,12 +1447,29 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
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
@@ -1412,6 +1503,10 @@ static void dpu_plane_reset(struct drm_plane *plane)
 	 * This is the place where the state is allocated, so fill it fully.
 	 */
 	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
+	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	pstate->r_pipe.sspp = NULL;
 
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
@@ -1428,6 +1523,8 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 
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

