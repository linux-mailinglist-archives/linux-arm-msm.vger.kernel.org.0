Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B94B16B3327
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjCJA5p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:57:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjCJA5e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:57:34 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF692105569
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 16:57:27 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j11so4580270lfg.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 16:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678409846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6SpXzRuL5PYUu4JW8T4yqt2N9HDHfkr4/0MUtYlD8U=;
        b=h2p0Jh1uJJWvuV0cR/YZdYfGbGMu4PkF3ZKkjMBB2yPc1hfhqm4LbTpq2ykBnh3fsm
         y8/r3e2L8s+yundkP5i9AS0FEAla5WmpH5QxVyByM2pnuV8xPe7/fnm3vYpvTzn+FBCA
         iK8rDoNj8qB6ZJSMuqvixfp+IN0dwDkQpoi1CdEOZYMn4I5gitygiT5jtfUlXt0caTxv
         H/0Jap3PSNxEJLs5Q7W37ac60FlKUof8SjzNwDKet5U83f+d6uPzzTR8i8qizRPMrnLZ
         JT5u+VgJJ1s+lJivUF0qHLYItYqH04MdzPEWjj1fN+/6+pten3A/2efI/MYdXE11Dmla
         mW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678409846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6SpXzRuL5PYUu4JW8T4yqt2N9HDHfkr4/0MUtYlD8U=;
        b=kUU7FxmsQK8U7DFDpElg6E82C1f9n44d2x4xNmr7fTqRB76wiJDNGOTf5aan6De9BE
         4Lbvu+weimII4lj5+CvEHKJKlwLCS6hLT+6MEG2PmbEEpGXtBBfWmowyKY0aqruIJAVb
         oLcpiZpt4pNPSJ4LhTOwS9cIntzV3xbwTe8WAqSAb7sgxNdjpJj/+zCbDaE9dcX9rRGq
         OW+w5BBGrJ1HmapZ7yyOj4MRzaPmIxl38/eibDWwH1XAi4aNvYIyaUY1+CuzvrvLqTi3
         q1K9FJ2hjIecTaVfOPLEFTvJeZyn7ePwx4goO6RN3a3S1ySO9NygY5ZKP7ZSNtOF3XNh
         L1bA==
X-Gm-Message-State: AO0yUKV8EiN+qWY2LR6uBTGAvUTex9lWDzEMMT5HyhIrORPQNy0rvK5/
        NsroPeURq7ZJb/vRepQN3LhFtg==
X-Google-Smtp-Source: AK7set/Kn3wGFOIpXJwgiIVT0K0XIxCBAgYHsqMf9cUlmBV1mLAEYU2Z49ic1Y6tkUvf2t4zqSuAKA==
X-Received: by 2002:ac2:5ec8:0:b0:4dd:af71:a5b7 with SMTP id d8-20020ac25ec8000000b004ddaf71a5b7mr6647036lfq.41.1678409846117;
        Thu, 09 Mar 2023 16:57:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 16:57:25 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 22/32] drm/msm/dpu: rework dpu_plane_sspp_atomic_update()
Date:   Fri, 10 Mar 2023 02:56:54 +0200
Message-Id: <20230310005704.1332368-23-dmitry.baryshkov@linaro.org>
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

Split pipe-dependent code from dpu_plane_sspp_atomic_update() into the
separate function dpu_plane_sspp_update_pipe(). This is one of
preparational steps to add r_pipe support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 113 ++++++++++++----------
 1 file changed, 63 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9c556ba9cb7b..f97ea39423a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -404,12 +404,13 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
  * _dpu_plane_set_ot_limit - set OT limit for the given plane
  * @plane:		Pointer to drm plane
  * @pipe:		Pointer to software pipe
- * @crtc:		Pointer to drm crtc
  * @pipe_cfg:		Pointer to pipe configuration
+ * @frame_rate:		CRTC's frame rate
  */
 static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 		struct dpu_sw_pipe *pipe,
-		struct drm_crtc *crtc, struct dpu_sw_pipe_cfg *pipe_cfg)
+		struct dpu_sw_pipe_cfg *pipe_cfg,
+		int frame_rate)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_vbif_set_ot_params ot_params;
@@ -421,7 +422,7 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
 	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
-	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
+	ot_params.frame_rate = frame_rate;
 	ot_params.vbif_idx = VBIF_RT;
 	ot_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
 	ot_params.rd = true;
@@ -457,26 +458,6 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane,
 	dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
 }
 
-static void _dpu_plane_set_scanout(struct drm_plane *plane,
-		struct dpu_plane_state *pstate,
-		struct drm_framebuffer *fb)
-{
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	struct dpu_hw_fmt_layout layout;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(&pstate->pipe,
-					    &layout);
-		pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, &layout);
-	}
-}
-
 static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
 		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
 		struct dpu_hw_scaler3_cfg *scale_cfg,
@@ -1103,35 +1084,25 @@ void dpu_plane_set_error(struct drm_plane *plane, bool error)
 	pdpu->is_error = error;
 }
 
-static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
+static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
+				       struct dpu_sw_pipe *pipe,
+				       struct dpu_sw_pipe_cfg *pipe_cfg,
+				       const struct dpu_format *fmt,
+				       int frame_rate,
+				       struct dpu_hw_fmt_layout *layout)
 {
 	uint32_t src_flags;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct drm_crtc *crtc = state->crtc;
-	struct drm_framebuffer *fb = state->fb;
-	bool is_rt_pipe;
-	const struct dpu_format *fmt =
-		to_dpu_format(msm_framebuffer_format(fb));
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 
-	_dpu_plane_set_scanout(plane, pstate, fb);
-
-	pstate->pending = true;
-
-	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
-	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
-	pdpu->is_rt_pipe = is_rt_pipe;
+	if (layout && pipe->sspp->ops.setup_sourceaddress) {
+		trace_dpu_plane_set_scanout(pipe, layout);
+		pipe->sspp->ops.setup_sourceaddress(pipe, layout);
+	}
 
 	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
 
-	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
-			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
-			crtc->base.id, DRM_RECT_ARG(&state->dst),
-			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
 		/* skip remaining processing on color fill */
@@ -1184,23 +1155,65 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		}
 	}
 
-	_dpu_plane_set_qos_lut(plane, pipe, fmt, &pstate->pipe_cfg);
+	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
-		_dpu_plane_set_ot_limit(plane, pipe, crtc, &pstate->pipe_cfg);
+		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
 	}
 
-	if (pstate->needs_qos_remap) {
-		pstate->needs_qos_remap = false;
+	if (pstate->needs_qos_remap)
 		_dpu_plane_set_qos_remap(plane, pipe);
-	}
+}
+
+static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
+{
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct drm_plane_state *state = plane->state;
+	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct drm_crtc *crtc = state->crtc;
+	struct drm_framebuffer *fb = state->fb;
+	bool is_rt_pipe;
+	const struct dpu_format *fmt =
+		to_dpu_format(msm_framebuffer_format(fb));
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+
+	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
+	struct msm_gem_address_space *aspace = kms->base.aspace;
+	struct dpu_hw_fmt_layout layout;
+	bool layout_valid = false;
+	int ret;
+
+	ret = dpu_format_populate_layout(aspace, fb, &layout);
+	if (ret)
+		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
+	else
+		layout_valid = true;
+
+	pstate->pending = true;
+
+	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
+	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
+	pdpu->is_rt_pipe = is_rt_pipe;
+
+	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
+			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
+			crtc->base.id, DRM_RECT_ARG(&state->dst),
+			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
+
+	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
+				   drm_mode_vrefresh(&crtc->mode),
+				   layout_valid ? &layout : NULL);
+
+	if (pstate->needs_qos_remap)
+		pstate->needs_qos_remap = false;
 
 	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt,
-						    &crtc->mode, &pstate->pipe_cfg);
+						    &crtc->mode, pipe_cfg);
 
-	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, &pstate->pipe_cfg);
+	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
-- 
2.39.2

