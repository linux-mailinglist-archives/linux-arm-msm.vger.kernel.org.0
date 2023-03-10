Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0AAA6B330A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjCJA53 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbjCJA50 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:57:26 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED2F106A16
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 16:57:12 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id i9so4609498lfc.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 16:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678409830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43O4Zz5/DbeaZ6/GkMjmGqVKawOZWq8u1Wg8/BX1+u4=;
        b=f30FPH1pLWvg65xQKK12axtDi0EPUzVbwMQIZyfxJf41k2LUSmrkyrD0IFaEgIEKeV
         A2zWG/DFTZzT1Q8+cRU8iNr5UKwIKDgLoqZ3yqM0WfWyL4C/ZVaWoPWAaoiMvoNb8HV8
         3cu8XhdSHGbdAAoA3t9rzgMYwTeo+ZwLd0yvvLDajTpPKJkcZ/1tnHr8wj9xYCd/HvCX
         v/k48cb8Yu0qW/0emgno3dmXrCx5RRLMbQFhhANEZs3QJLLjWUJFou/prUAWyf1doPKi
         7RZjmXH1N3+v7vt2TB2n68v+Lq25rcAnMonNDBDGLHFNr/ZHs8fM8P69FuIhy7v52u6r
         OznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678409830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43O4Zz5/DbeaZ6/GkMjmGqVKawOZWq8u1Wg8/BX1+u4=;
        b=43Uq5nyN9vlKqeW1w/+pGX6toVxZGwxJVJ9s5MA2jJruoUilEX15tMeH8X4s2M0ITY
         y0aF4cfukOfk5LFntNG0tx3zmyy3S5unKiDeAb32o4BItrA+Ezto83v1tcwUu0zgv0bf
         8k5wZWvoTfNIeGoF98MG0lQEtf3tcNf2HK2Z1Kktok9zymi4gN/uOoPe8DLA1e+upfCu
         Ssr+W8wzMYb3aBOcA3lkAMIY4WwMk3q9N58PKTMxtSaFrf5/YxUBLCFzwr0kThBcS7I7
         WfqoiiA0D2szIskHU52KL2vGWtpgyMUzdULYzqmrLAFhcYLuHRNtAy3qeDVxGecOrXrF
         A1yw==
X-Gm-Message-State: AO0yUKVZNLTO8TxeEEtf35b2gH6nODj1PJoAF3mxsni1z3P9v8QguXSB
        YxNsR1xfdFwXSgPRsO1i1QHTng==
X-Google-Smtp-Source: AK7set+4uWi7kkS+D3Mj9EHH+dI4aevIVqO0umI2Aizw0bxZczMiBBprCWG2qall5x3vem+p5mbc+Q==
X-Received: by 2002:ac2:5ecc:0:b0:4e6:dda2:6ad2 with SMTP id d12-20020ac25ecc000000b004e6dda26ad2mr6604668lfq.10.1678409830335;
        Thu, 09 Mar 2023 16:57:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 16:57:09 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 05/32] drm/msm/dpu: move pipe_hw to dpu_plane_state
Date:   Fri, 10 Mar 2023 02:56:37 +0200
Message-Id: <20230310005704.1332368-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
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

In preparation to adding fully virtualized planes, move struct
dpu_hw_sspp instance from struct dpu_plane to struct dpu_plane_state, as
it will become a part of state (variable, changes during runtime) rather
than part of a plane (ideally should be statically allocated during boot).

The sspp pointer is set at the dpu_plane_reset(), since this is the
function which allocates the state. Once we have fully virtual
plane<->SSPP relationship, the SSPP will be allocated dynamically in the
dpu_plane_atomic_check() function.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 107 ++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   2 +
 2 files changed, 62 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d6518ef1beb2..546629232e3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -104,7 +104,6 @@ struct dpu_plane {
 
 	enum dpu_sspp pipe;
 
-	struct dpu_hw_sspp *pipe_hw;
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
@@ -279,6 +278,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 		struct drm_framebuffer *fb, struct dpu_hw_sspp_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	const struct dpu_format *fmt = NULL;
 	u64 qos_lut;
 	u32 total_fl = 0, lut_usage;
@@ -310,7 +310,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 			fmt ? (char *)&fmt->base.pixel_format : NULL,
 			pdpu->is_rt_pipe, total_fl, qos_lut);
 
-	pdpu->pipe_hw->ops.setup_creq_lut(pdpu->pipe_hw, qos_lut);
+	pstate->hw_sspp->ops.setup_creq_lut(pstate->hw_sspp, qos_lut);
 }
 
 /**
@@ -322,6 +322,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 		struct drm_framebuffer *fb)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	const struct dpu_format *fmt = NULL;
 	u32 danger_lut, safe_lut;
 
@@ -361,7 +362,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 		danger_lut,
 		safe_lut);
 
-	pdpu->pipe_hw->ops.setup_danger_safe_lut(pdpu->pipe_hw,
+	pstate->hw_sspp->ops.setup_danger_safe_lut(pstate->hw_sspp,
 			danger_lut, safe_lut);
 }
 
@@ -375,14 +376,15 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	bool enable, u32 flags)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
 
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
 	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pipe_qos_cfg.creq_vblank = pdpu->pipe_hw->cap->sblk->creq_vblank;
+		pipe_qos_cfg.creq_vblank = pstate->hw_sspp->cap->sblk->creq_vblank;
 		pipe_qos_cfg.danger_vblank =
-				pdpu->pipe_hw->cap->sblk->danger_vblank;
+				pstate->hw_sspp->cap->sblk->danger_vblank;
 		pipe_qos_cfg.vblank_en = enable;
 	}
 
@@ -408,7 +410,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 		pipe_qos_cfg.danger_vblank,
 		pdpu->is_rt_pipe);
 
-	pdpu->pipe_hw->ops.setup_qos_ctrl(pdpu->pipe_hw,
+	pstate->hw_sspp->ops.setup_qos_ctrl(pstate->hw_sspp,
 			&pipe_qos_cfg);
 }
 
@@ -422,18 +424,19 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 		struct drm_crtc *crtc, struct dpu_hw_sspp_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_vbif_set_ot_params ot_params;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	memset(&ot_params, 0, sizeof(ot_params));
-	ot_params.xin_id = pdpu->pipe_hw->cap->xin_id;
-	ot_params.num = pdpu->pipe_hw->idx - SSPP_NONE;
+	ot_params.xin_id = pstate->hw_sspp->cap->xin_id;
+	ot_params.num = pstate->hw_sspp->idx - SSPP_NONE;
 	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
 	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
 	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
 	ot_params.vbif_idx = VBIF_RT;
-	ot_params.clk_ctrl = pdpu->pipe_hw->cap->clk_ctrl;
+	ot_params.clk_ctrl = pstate->hw_sspp->cap->clk_ctrl;
 	ot_params.rd = true;
 
 	dpu_vbif_set_ot_limit(dpu_kms, &ot_params);
@@ -446,14 +449,15 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_vbif_set_qos_params qos_params;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	memset(&qos_params, 0, sizeof(qos_params));
 	qos_params.vbif_idx = VBIF_RT;
-	qos_params.clk_ctrl = pdpu->pipe_hw->cap->clk_ctrl;
-	qos_params.xin_id = pdpu->pipe_hw->cap->xin_id;
-	qos_params.num = pdpu->pipe_hw->idx - SSPP_VIG0;
+	qos_params.clk_ctrl = pstate->hw_sspp->cap->clk_ctrl;
+	qos_params.xin_id = pstate->hw_sspp->cap->xin_id;
+	qos_params.num = pstate->hw_sspp->idx - SSPP_VIG0;
 	qos_params.is_rt = pdpu->is_rt_pipe;
 
 	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d, clk_ctrl:%d\n",
@@ -478,11 +482,11 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
 	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
 	if (ret)
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else if (pdpu->pipe_hw->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(pdpu->pipe_hw->idx,
+	else if (pstate->hw_sspp->ops.setup_sourceaddress) {
+		trace_dpu_plane_set_scanout(pstate->hw_sspp->idx,
 					    &pipe_cfg->layout,
 					    pstate->multirect_index);
-		pdpu->pipe_hw->ops.setup_sourceaddress(pdpu->pipe_hw, pipe_cfg,
+		pstate->hw_sspp->ops.setup_sourceaddress(pstate->hw_sspp, pipe_cfg,
 						pstate->multirect_index);
 	}
 }
@@ -534,7 +538,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 			scale_cfg->src_height[i] /= chroma_subsmpl_v;
 		}
 
-		if (pdpu->pipe_hw->cap->features &
+		if (pstate->hw_sspp->cap->features &
 			BIT(DPU_SSPP_SCALER_QSEED4)) {
 			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
 			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
@@ -607,6 +611,7 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
 
 static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
 {
+	struct dpu_plane_state *pstate = to_dpu_plane_state(pdpu->base.state);
 	const struct dpu_csc_cfg *csc_ptr;
 
 	if (!pdpu) {
@@ -617,7 +622,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 	if (!DPU_FORMAT_IS_YUV(fmt))
 		return NULL;
 
-	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
+	if (BIT(DPU_SSPP_CSC_10BIT) & pstate->hw_sspp->cap->features)
 		csc_ptr = &dpu_csc10_YUV2RGB_601L;
 	else
 		csc_ptr = &dpu_csc_YUV2RGB_601L;
@@ -660,8 +665,8 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 	_dpu_plane_setup_pixel_ext(&scaler3_cfg, &pixel_ext,
 			src_width, src_height, info->hsub, info->vsub);
 
-	if (pdpu->pipe_hw->ops.setup_pe)
-		pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
+	if (pstate->hw_sspp->ops.setup_pe)
+		pstate->hw_sspp->ops.setup_pe(pstate->hw_sspp,
 				&pixel_ext);
 
 	/**
@@ -669,9 +674,9 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 	 * bypassed. Still we need to update alpha and bitwidth
 	 * ONLY for RECT0
 	 */
-	if (pdpu->pipe_hw->ops.setup_scaler &&
+	if (pstate->hw_sspp->ops.setup_scaler &&
 			pstate->multirect_index != DPU_SSPP_RECT_1)
-		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
+		pstate->hw_sspp->ops.setup_scaler(pstate->hw_sspp,
 				pipe_cfg,
 				&scaler3_cfg);
 }
@@ -700,8 +705,8 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
 
 	/* update sspp */
-	if (fmt && pdpu->pipe_hw->ops.setup_solidfill) {
-		pdpu->pipe_hw->ops.setup_solidfill(pdpu->pipe_hw,
+	if (fmt && pstate->hw_sspp->ops.setup_solidfill) {
+		pstate->hw_sspp->ops.setup_solidfill(pstate->hw_sspp,
 				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24),
 				pstate->multirect_index);
 
@@ -715,13 +720,13 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		pipe_cfg.src_rect.y2 =
 			drm_rect_height(&pipe_cfg.dst_rect);
 
-		if (pdpu->pipe_hw->ops.setup_format)
-			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
+		if (pstate->hw_sspp->ops.setup_format)
+			pstate->hw_sspp->ops.setup_format(pstate->hw_sspp,
 					fmt, DPU_SSPP_SOLID_FILL,
 					pstate->multirect_index);
 
-		if (pdpu->pipe_hw->ops.setup_rects)
-			pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
+		if (pstate->hw_sspp->ops.setup_rects)
+			pstate->hw_sspp->ops.setup_rects(pstate->hw_sspp,
 					&pipe_cfg,
 					pstate->multirect_index);
 
@@ -973,8 +978,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	uint32_t min_src_size, max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps = pdpu->pipe_hw->cap;
-	const struct dpu_sspp_sub_blks *sblk = pdpu->pipe_hw->cap->sblk;
+	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->hw_sspp->cap;
+	const struct dpu_sspp_sub_blks *sblk = pstate->hw_sspp->cap->sblk;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1087,12 +1092,12 @@ void dpu_plane_flush(struct drm_plane *plane)
 	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
-	else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
+	else if (pstate->hw_sspp && pstate->hw_sspp->ops.setup_csc) {
 		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
 		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
 
 		if (csc_ptr)
-			pdpu->pipe_hw->ops.setup_csc(pdpu->pipe_hw, csc_ptr);
+			pstate->hw_sspp->ops.setup_csc(pstate->hw_sspp, csc_ptr);
 	}
 
 	/* flag h/w flush complete */
@@ -1162,21 +1167,21 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		return;
 	}
 
-	if (pdpu->pipe_hw->ops.setup_rects) {
-		pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
+	if (pstate->hw_sspp->ops.setup_rects) {
+		pstate->hw_sspp->ops.setup_rects(pstate->hw_sspp,
 				&pipe_cfg,
 				pstate->multirect_index);
 	}
 
 	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
 
-	if (pdpu->pipe_hw->ops.setup_multirect)
-		pdpu->pipe_hw->ops.setup_multirect(
-				pdpu->pipe_hw,
+	if (pstate->hw_sspp->ops.setup_multirect)
+		pstate->hw_sspp->ops.setup_multirect(
+				pstate->hw_sspp,
 				pstate->multirect_index,
 				pstate->multirect_mode);
 
-	if (pdpu->pipe_hw->ops.setup_format) {
+	if (pstate->hw_sspp->ops.setup_format) {
 		unsigned int rotation = pstate->rotation;
 
 		src_flags = 0x0;
@@ -1191,10 +1196,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			src_flags |= DPU_SSPP_ROT_90;
 
 		/* update format */
-		pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_flags,
+		pstate->hw_sspp->ops.setup_format(pstate->hw_sspp, fmt, src_flags,
 				pstate->multirect_index);
 
-		if (pdpu->pipe_hw->ops.setup_cdp) {
+		if (pstate->hw_sspp->ops.setup_cdp) {
 			struct dpu_hw_cdp_cfg cdp_cfg;
 
 			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
@@ -1208,7 +1213,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 					DPU_FORMAT_IS_TILE(fmt);
 			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
 
-			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg, pstate->multirect_index);
+			pstate->hw_sspp->ops.setup_cdp(pstate->hw_sspp, &cdp_cfg,
+						       pstate->multirect_index);
 		}
 	}
 
@@ -1348,10 +1354,9 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
 	const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	const struct dpu_plane *pdpu = to_dpu_plane(state->plane);
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
-	drm_printf(p, "\tsspp=%s\n", pdpu->pipe_hw->cap->name);
+	drm_printf(p, "\tsspp=%s\n", pstate->hw_sspp->cap->name);
 	drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->multirect_mode));
 	drm_printf(p, "\tmultirect_index=%s\n", dpu_get_multirect_index(pstate->multirect_index));
 }
@@ -1360,6 +1365,7 @@ static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	if (!plane) {
 		DPU_ERROR("invalid plane\n");
@@ -1381,6 +1387,12 @@ static void dpu_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
+	/*
+	 * Set the SSPP here until we have proper virtualized DPU planes.
+	 * This is the place where the state is allocated, so fill it fully.
+	 */
+	pstate->hw_sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
 
@@ -1445,6 +1457,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
+	struct dpu_hw_sspp *pipe_hw;
 	uint32_t num_formats;
 	uint32_t supported_rotations;
 	int ret = -EINVAL;
@@ -1462,14 +1475,14 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	pdpu->pipe = pipe;
 
 	/* initialize underlying h/w driver */
-	pdpu->pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
-	if (!pdpu->pipe_hw || !pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
+	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
+	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
 		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
 		goto clean_plane;
 	}
 
-	format_list = pdpu->pipe_hw->cap->sblk->format_list;
-	num_formats = pdpu->pipe_hw->cap->sblk->num_formats;
+	format_list = pipe_hw->cap->sblk->format_list;
+	num_formats = pipe_hw->cap->sblk->num_formats;
 
 	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
 				format_list, num_formats,
@@ -1491,7 +1504,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
 
-	if (pdpu->pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
+	if (pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
 		supported_rotations |= DRM_MODE_ROTATE_MASK;
 
 	drm_plane_create_rotation_property(plane,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index b7b1b05199c2..08a4b6a99f51 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -18,6 +18,7 @@
  * struct dpu_plane_state: Define dpu extension of drm plane state object
  * @base:	base drm plane state object
  * @aspace:	pointer to address space for input/output buffers
+ * @hw_sspp:	pointer to corresponding SSPP instance
  * @stage:	assigned by crtc blender
  * @needs_qos_remap: qos remap settings need to be updated
  * @multirect_index: index of the rectangle of SSPP
@@ -31,6 +32,7 @@
 struct dpu_plane_state {
 	struct drm_plane_state base;
 	struct msm_gem_address_space *aspace;
+	struct dpu_hw_sspp *hw_sspp;
 	enum dpu_stage stage;
 	bool needs_qos_remap;
 	uint32_t multirect_index;
-- 
2.39.2

