Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 112D66B3313
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjCJA5c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:57:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjCJA52 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:57:28 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A30116C15
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 16:57:13 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bi9so4628295lfb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 16:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678409832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rsfwa9+BDKhOBgzxnexSYeAVvq80n9COr+NW6z8F94=;
        b=h7gUJB5fBKHUF7jB0+0KpjwYYG4z4E9uaGgr8wPmJLHX7qnSOWOnuZ6CSkvxsduwHq
         WgNoWfowyjxKfZNnkU6OfRaBqri3y6wSFvIADZkgkeLD/076dCIxQKLwquljsbXtBurv
         Ob7FaudX7/VQ+ugo53GsNx658EgUf0NSEMlrJ/z0Nzrdac2TMmCnK2kn5Bh7yzNVF74l
         5zjFDq9IjOBndF7qlA2xvcbi+7uJBKzM/k+jKM/hG3KF/R87zLOW37Y9cGWOP5fyHSgv
         JLm5/rSor9jRmmM4VvIEMOUh3OJ3Z//6QR2fm5mUyk1s8ExIPC/HIQvfpsmJeGHH4bn4
         wWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678409832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rsfwa9+BDKhOBgzxnexSYeAVvq80n9COr+NW6z8F94=;
        b=3yzkvtt2+P5nqcH+RUhIa+NGjrD9aHZ3CiojOfLIJPhB1SN3t+DfhYA7fbwhRBDGNP
         jWn+zsFkXwX9fX8kcjyVUqNU/fhZEtL43MiqE7eisjAVhr++ZQ3ntkUi77gIVVPV9YLN
         HyTnIAUmHozW6zHsxkUW/OM8Gua0My8B/9sSSB1MJWWsRrbpkEwAN+mmJ7wAcypnDmZ+
         nEx3/MjzRik09SsFYUaEbiRaNFeKgDAkSyYeEESprzA0qCxulQDwGTHQxs2AGswMnEP7
         2TT8K7Qeh0CtCp4yGziqVj6hLDYvu2G59PnAVDFmQL9NOKuPgcP2k4NlDbA3abXUcIlS
         kk6w==
X-Gm-Message-State: AO0yUKUt32y4s5L/+yMn5tReaPY51LWYhTv82V1CVTG6zEkqxo0ijGoq
        3yvsl3VUUhOE7eQqmVJRE6av9A==
X-Google-Smtp-Source: AK7set/T5hjKPAEn/anBYm9BpwieG0FkKi9CUmbCkVmeI0sqbLaElJIP8hMKEBMgKOpDedRMZ4UKuQ==
X-Received: by 2002:ac2:4c90:0:b0:4b3:d6e1:26bb with SMTP id d16-20020ac24c90000000b004b3d6e126bbmr6856658lfl.29.1678409832206;
        Thu, 09 Mar 2023 16:57:12 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 16:57:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 07/32] drm/msm/dpu: introduce struct dpu_sw_pipe
Date:   Fri, 10 Mar 2023 02:56:39 +0200
Message-Id: <20230310005704.1332368-8-dmitry.baryshkov@linaro.org>
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

Wrap SSPP and multirect index/mode into a single structure that
represents software view on the pipe used.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  16 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 133 ++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  10 +-
 5 files changed, 90 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index eff1a3cc1cec..037347e51eb8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -431,7 +431,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		sspp_idx = pstate->hw_sspp->idx;
+		sspp_idx = pstate->pipe.sspp->idx;
 		set_bit(sspp_idx, fetch_active);
 
 		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
@@ -450,11 +450,10 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		stage_cfg->stage[pstate->stage][stage_idx] =
 					sspp_idx;
 		stage_cfg->multirect_index[pstate->stage][stage_idx] =
-					pstate->multirect_index;
+					pstate->pipe.multirect_index;
 
 		trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
 					   state, pstate, stage_idx,
-					   sspp_idx - SSPP_VIG0,
 					   format->base.pixel_format,
 					   fb ? fb->modifier : 0);
 
@@ -1202,7 +1201,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		pstates[cnt].dpu_pstate = dpu_pstate;
 		pstates[cnt].drm_pstate = pstate;
 		pstates[cnt].stage = pstate->normalized_zpos;
-		pstates[cnt].pipe_id = to_dpu_plane_state(pstate)->hw_sspp->idx;
+		pstates[cnt].pipe_id = to_dpu_plane_state(pstate)->pipe.sspp->idx;
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
 
@@ -1475,7 +1474,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
 		seq_printf(s, "\tmultirect: mode: %d index: %d\n",
-			pstate->multirect_mode, pstate->multirect_index);
+			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
 
 		seq_puts(s, "\n");
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index c30f168b6c0a..13d9e04a5153 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -158,15 +158,11 @@ struct dpu_hw_pixel_ext {
  * @src_rect:  src ROI, caller takes into account the different operations
  *             such as decimation, flip etc to program this field
  * @dest_rect: destination ROI.
- * @index:     index of the rectangle of SSPP
- * @mode:      parallel or time multiplex multirect mode
  */
 struct dpu_hw_sspp_cfg {
 	struct dpu_hw_fmt_layout layout;
 	struct drm_rect src_rect;
 	struct drm_rect dst_rect;
-	enum dpu_sspp_multirect_index index;
-	enum dpu_sspp_multirect_mode mode;
 };
 
 /**
@@ -201,6 +197,18 @@ struct dpu_hw_pipe_ts_cfg {
 	u64 time;
 };
 
+/**
+ * struct dpu_sw_pipe - software pipe description
+ * @sspp:      backing SSPP pipe
+ * @index:     index of the rectangle of SSPP
+ * @mode:      parallel or time multiplex multirect mode
+ */
+struct dpu_sw_pipe {
+	struct dpu_hw_sspp *sspp;
+	enum dpu_sspp_multirect_index multirect_index;
+	enum dpu_sspp_multirect_mode multirect_mode;
+};
+
 /**
  * struct dpu_hw_sspp_ops - interface to the SSPP Hw driver functions
  * Caller must call the init function to get the pipe context for each pipe
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 10678f6502a2..ce726bec0c31 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -251,7 +251,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 				((src_width + 32) * fmt->bpp);
 		}
 	} else {
-		if (pstate->multirect_mode == DPU_SSPP_MULTIRECT_PARALLEL) {
+		if (pstate->pipe.multirect_mode == DPU_SSPP_MULTIRECT_PARALLEL) {
 			total_fl = (fixed_buff_size / 2) * 2 /
 				((src_width + 32) * fmt->bpp);
 		} else {
@@ -310,7 +310,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 			fmt ? (char *)&fmt->base.pixel_format : NULL,
 			pdpu->is_rt_pipe, total_fl, qos_lut);
 
-	pstate->hw_sspp->ops.setup_creq_lut(pstate->hw_sspp, qos_lut);
+	pstate->pipe.sspp->ops.setup_creq_lut(pstate->pipe.sspp, qos_lut);
 }
 
 /**
@@ -362,7 +362,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 		danger_lut,
 		safe_lut);
 
-	pstate->hw_sspp->ops.setup_danger_safe_lut(pstate->hw_sspp,
+	pstate->pipe.sspp->ops.setup_danger_safe_lut(pstate->pipe.sspp,
 			danger_lut, safe_lut);
 }
 
@@ -382,9 +382,9 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
 	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pipe_qos_cfg.creq_vblank = pstate->hw_sspp->cap->sblk->creq_vblank;
+		pipe_qos_cfg.creq_vblank = pstate->pipe.sspp->cap->sblk->creq_vblank;
 		pipe_qos_cfg.danger_vblank =
-				pstate->hw_sspp->cap->sblk->danger_vblank;
+				pstate->pipe.sspp->cap->sblk->danger_vblank;
 		pipe_qos_cfg.vblank_en = enable;
 	}
 
@@ -410,7 +410,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 		pipe_qos_cfg.danger_vblank,
 		pdpu->is_rt_pipe);
 
-	pstate->hw_sspp->ops.setup_qos_ctrl(pstate->hw_sspp,
+	pstate->pipe.sspp->ops.setup_qos_ctrl(pstate->pipe.sspp,
 			&pipe_qos_cfg);
 }
 
@@ -429,14 +429,14 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	memset(&ot_params, 0, sizeof(ot_params));
-	ot_params.xin_id = pstate->hw_sspp->cap->xin_id;
-	ot_params.num = pstate->hw_sspp->idx - SSPP_NONE;
+	ot_params.xin_id = pstate->pipe.sspp->cap->xin_id;
+	ot_params.num = pstate->pipe.sspp->idx - SSPP_NONE;
 	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
 	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
 	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
 	ot_params.vbif_idx = VBIF_RT;
-	ot_params.clk_ctrl = pstate->hw_sspp->cap->clk_ctrl;
+	ot_params.clk_ctrl = pstate->pipe.sspp->cap->clk_ctrl;
 	ot_params.rd = true;
 
 	dpu_vbif_set_ot_limit(dpu_kms, &ot_params);
@@ -455,9 +455,9 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
 
 	memset(&qos_params, 0, sizeof(qos_params));
 	qos_params.vbif_idx = VBIF_RT;
-	qos_params.clk_ctrl = pstate->hw_sspp->cap->clk_ctrl;
-	qos_params.xin_id = pstate->hw_sspp->cap->xin_id;
-	qos_params.num = pstate->hw_sspp->idx - SSPP_VIG0;
+	qos_params.clk_ctrl = pstate->pipe.sspp->cap->clk_ctrl;
+	qos_params.xin_id = pstate->pipe.sspp->cap->xin_id;
+	qos_params.num = pstate->pipe.sspp->idx - SSPP_VIG0;
 	qos_params.is_rt = pdpu->is_rt_pipe;
 
 	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d, clk_ctrl:%d\n",
@@ -482,12 +482,12 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
 	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
 	if (ret)
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else if (pstate->hw_sspp->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(pstate->hw_sspp->idx,
+	else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
+		trace_dpu_plane_set_scanout(pstate->pipe.sspp->idx,
 					    &pipe_cfg->layout,
-					    pstate->multirect_index);
-		pstate->hw_sspp->ops.setup_sourceaddress(pstate->hw_sspp, pipe_cfg,
-						pstate->multirect_index);
+					    pstate->pipe.multirect_index);
+		pstate->pipe.sspp->ops.setup_sourceaddress(pstate->pipe.sspp, pipe_cfg,
+						pstate->pipe.multirect_index);
 	}
 }
 
@@ -538,7 +538,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 			scale_cfg->src_height[i] /= chroma_subsmpl_v;
 		}
 
-		if (pstate->hw_sspp->cap->features &
+		if (pstate->pipe.sspp->cap->features &
 			BIT(DPU_SSPP_SCALER_QSEED4)) {
 			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
 			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
@@ -622,7 +622,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 	if (!DPU_FORMAT_IS_YUV(fmt))
 		return NULL;
 
-	if (BIT(DPU_SSPP_CSC_10BIT) & pstate->hw_sspp->cap->features)
+	if (BIT(DPU_SSPP_CSC_10BIT) & pstate->pipe.sspp->cap->features)
 		csc_ptr = &dpu_csc10_YUV2RGB_601L;
 	else
 		csc_ptr = &dpu_csc_YUV2RGB_601L;
@@ -665,8 +665,8 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 	_dpu_plane_setup_pixel_ext(&scaler3_cfg, &pixel_ext,
 			src_width, src_height, info->hsub, info->vsub);
 
-	if (pstate->hw_sspp->ops.setup_pe)
-		pstate->hw_sspp->ops.setup_pe(pstate->hw_sspp,
+	if (pstate->pipe.sspp->ops.setup_pe)
+		pstate->pipe.sspp->ops.setup_pe(pstate->pipe.sspp,
 				&pixel_ext);
 
 	/**
@@ -674,9 +674,9 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 	 * bypassed. Still we need to update alpha and bitwidth
 	 * ONLY for RECT0
 	 */
-	if (pstate->hw_sspp->ops.setup_scaler &&
-			pstate->multirect_index != DPU_SSPP_RECT_1)
-		pstate->hw_sspp->ops.setup_scaler(pstate->hw_sspp,
+	if (pstate->pipe.sspp->ops.setup_scaler &&
+			pstate->pipe.multirect_index != DPU_SSPP_RECT_1)
+		pstate->pipe.sspp->ops.setup_scaler(pstate->pipe.sspp,
 				pipe_cfg,
 				&scaler3_cfg);
 }
@@ -705,10 +705,10 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
 
 	/* update sspp */
-	if (fmt && pstate->hw_sspp->ops.setup_solidfill) {
-		pstate->hw_sspp->ops.setup_solidfill(pstate->hw_sspp,
+	if (fmt && pstate->pipe.sspp->ops.setup_solidfill) {
+		pstate->pipe.sspp->ops.setup_solidfill(pstate->pipe.sspp,
 				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24),
-				pstate->multirect_index);
+				pstate->pipe.multirect_index);
 
 		/* override scaler/decimation if solid fill */
 		pipe_cfg.dst_rect = pstate->base.dst;
@@ -720,15 +720,15 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		pipe_cfg.src_rect.y2 =
 			drm_rect_height(&pipe_cfg.dst_rect);
 
-		if (pstate->hw_sspp->ops.setup_format)
-			pstate->hw_sspp->ops.setup_format(pstate->hw_sspp,
+		if (pstate->pipe.sspp->ops.setup_format)
+			pstate->pipe.sspp->ops.setup_format(pstate->pipe.sspp,
 					fmt, DPU_SSPP_SOLID_FILL,
-					pstate->multirect_index);
+					pstate->pipe.multirect_index);
 
-		if (pstate->hw_sspp->ops.setup_rects)
-			pstate->hw_sspp->ops.setup_rects(pstate->hw_sspp,
+		if (pstate->pipe.sspp->ops.setup_rects)
+			pstate->pipe.sspp->ops.setup_rects(pstate->pipe.sspp,
 					&pipe_cfg,
-					pstate->multirect_index);
+					pstate->pipe.multirect_index);
 
 		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
 	}
@@ -740,8 +740,8 @@ void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state)
 {
 	struct dpu_plane_state *pstate = to_dpu_plane_state(drm_state);
 
-	pstate->multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
+	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 }
 
 int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
@@ -823,8 +823,8 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 
 	/* Prefer PARALLEL FETCH Mode over TIME_MX Mode */
 	if (parallel_fetch_qualified) {
-		pstate[R0]->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
-		pstate[R1]->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+		pstate[R0]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+		pstate[R1]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
 		goto done;
 	}
@@ -834,8 +834,8 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 
 	if (dst[R1].y1 >= dst[R0].y2 + buffer_lines ||
 	    dst[R0].y1 >= dst[R1].y2 + buffer_lines) {
-		pstate[R0]->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
-		pstate[R1]->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+		pstate[R0]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+		pstate[R1]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
 	} else {
 		DPU_ERROR(
 			"No multirect mode possible for the planes (%d - %d)\n",
@@ -845,13 +845,13 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 	}
 
 done:
-	pstate[R0]->multirect_index = DPU_SSPP_RECT_0;
-	pstate[R1]->multirect_index = DPU_SSPP_RECT_1;
+	pstate[R0]->pipe.multirect_index = DPU_SSPP_RECT_0;
+	pstate[R1]->pipe.multirect_index = DPU_SSPP_RECT_1;
 
 	DPU_DEBUG_PLANE(dpu_plane[R0], "R0: %d - %d\n",
-		pstate[R0]->multirect_mode, pstate[R0]->multirect_index);
+		pstate[R0]->pipe.multirect_mode, pstate[R0]->pipe.multirect_index);
 	DPU_DEBUG_PLANE(dpu_plane[R1], "R1: %d - %d\n",
-		pstate[R1]->multirect_mode, pstate[R1]->multirect_index);
+		pstate[R1]->pipe.multirect_mode, pstate[R1]->pipe.multirect_index);
 	return 0;
 }
 
@@ -978,8 +978,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	uint32_t min_src_size, max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->hw_sspp->cap;
-	const struct dpu_sspp_sub_blks *sblk = pstate->hw_sspp->cap->sblk;
+	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
+	const struct dpu_sspp_sub_blks *sblk = pstate->pipe.sspp->cap->sblk;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1092,12 +1092,12 @@ void dpu_plane_flush(struct drm_plane *plane)
 	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
-	else if (pstate->hw_sspp && pstate->hw_sspp->ops.setup_csc) {
+	else if (pstate->pipe.sspp && pstate->pipe.sspp->ops.setup_csc) {
 		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
 		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
 
 		if (csc_ptr)
-			pstate->hw_sspp->ops.setup_csc(pstate->hw_sspp, csc_ptr);
+			pstate->pipe.sspp->ops.setup_csc(pstate->pipe.sspp, csc_ptr);
 	}
 
 	/* flag h/w flush complete */
@@ -1127,6 +1127,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
 	bool is_rt_pipe;
@@ -1167,21 +1168,21 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		return;
 	}
 
-	if (pstate->hw_sspp->ops.setup_rects) {
-		pstate->hw_sspp->ops.setup_rects(pstate->hw_sspp,
+	if (pipe->sspp->ops.setup_rects) {
+		pipe->sspp->ops.setup_rects(pipe->sspp,
 				&pipe_cfg,
-				pstate->multirect_index);
+				pipe->multirect_index);
 	}
 
 	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
 
-	if (pstate->hw_sspp->ops.setup_multirect)
-		pstate->hw_sspp->ops.setup_multirect(
-				pstate->hw_sspp,
-				pstate->multirect_index,
-				pstate->multirect_mode);
+	if (pipe->sspp->ops.setup_multirect)
+		pipe->sspp->ops.setup_multirect(
+				pipe->sspp,
+				pipe->multirect_index,
+				pipe->multirect_mode);
 
-	if (pstate->hw_sspp->ops.setup_format) {
+	if (pipe->sspp->ops.setup_format) {
 		unsigned int rotation = pstate->rotation;
 
 		src_flags = 0x0;
@@ -1196,10 +1197,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			src_flags |= DPU_SSPP_ROT_90;
 
 		/* update format */
-		pstate->hw_sspp->ops.setup_format(pstate->hw_sspp, fmt, src_flags,
-				pstate->multirect_index);
+		pipe->sspp->ops.setup_format(pipe->sspp, fmt, src_flags,
+				pipe->multirect_index);
 
-		if (pstate->hw_sspp->ops.setup_cdp) {
+		if (pipe->sspp->ops.setup_cdp) {
 			struct dpu_hw_cdp_cfg cdp_cfg;
 
 			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
@@ -1213,8 +1214,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 					DPU_FORMAT_IS_TILE(fmt);
 			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
 
-			pstate->hw_sspp->ops.setup_cdp(pstate->hw_sspp, &cdp_cfg,
-						       pstate->multirect_index);
+			pipe->sspp->ops.setup_cdp(pipe->sspp, &cdp_cfg, pipe->multirect_index);
 		}
 	}
 
@@ -1242,7 +1242,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
 
 	trace_dpu_plane_disable(DRMID(plane), false,
-				pstate->multirect_mode);
+				pstate->pipe.multirect_mode);
 
 	pstate->pending = true;
 }
@@ -1356,9 +1356,10 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 	const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
-	drm_printf(p, "\tsspp=%s\n", pstate->hw_sspp->cap->name);
-	drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->multirect_mode));
-	drm_printf(p, "\tmultirect_index=%s\n", dpu_get_multirect_index(pstate->multirect_index));
+	drm_printf(p, "\tsspp=%s\n", pstate->pipe.sspp->cap->name);
+	drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->pipe.multirect_mode));
+	drm_printf(p, "\tmultirect_index=%s\n",
+		   dpu_get_multirect_index(pstate->pipe.multirect_index));
 }
 
 static void dpu_plane_reset(struct drm_plane *plane)
@@ -1391,7 +1392,7 @@ static void dpu_plane_reset(struct drm_plane *plane)
 	 * Set the SSPP here until we have proper virtualized DPU planes.
 	 * This is the place where the state is allocated, so fill it fully.
 	 */
-	pstate->hw_sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
 
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 25e261cabadc..228db401e905 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -18,7 +18,7 @@
  * struct dpu_plane_state: Define dpu extension of drm plane state object
  * @base:	base drm plane state object
  * @aspace:	pointer to address space for input/output buffers
- * @hw_sspp:	pointer to corresponding SSPP instance
+ * @pipe:	software pipe description
  * @stage:	assigned by crtc blender
  * @needs_qos_remap: qos remap settings need to be updated
  * @multirect_index: index of the rectangle of SSPP
@@ -32,11 +32,9 @@
 struct dpu_plane_state {
 	struct drm_plane_state base;
 	struct msm_gem_address_space *aspace;
-	struct dpu_hw_sspp *hw_sspp;
+	struct dpu_sw_pipe pipe;
 	enum dpu_stage stage;
 	bool needs_qos_remap;
-	uint32_t multirect_index;
-	uint32_t multirect_mode;
 	bool pending;
 
 	u64 plane_fetch_bw;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 76169f406505..d7059972499f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -633,9 +633,9 @@ TRACE_EVENT(dpu_enc_phys_vid_irq_ctrl,
 TRACE_EVENT(dpu_crtc_setup_mixer,
 	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
 		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
-		 uint32_t stage_idx, enum dpu_sspp sspp, uint32_t pixel_format,
+		 uint32_t stage_idx, uint32_t pixel_format,
 		 uint64_t modifier),
-	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx, sspp,
+	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
 		pixel_format, modifier),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		crtc_id		)
@@ -659,9 +659,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__entry->dst_rect = drm_plane_state_dest(state);
 		__entry->stage_idx = stage_idx;
 		__entry->stage = pstate->stage;
-		__entry->sspp = sspp;
-		__entry->multirect_idx = pstate->multirect_index;
-		__entry->multirect_mode = pstate->multirect_mode;
+		__entry->sspp = pstate->pipe.sspp->idx;
+		__entry->multirect_idx = pstate->pipe.multirect_index;
+		__entry->multirect_mode = pstate->pipe.multirect_mode;
 		__entry->pixel_format = pixel_format;
 		__entry->modifier = modifier;
 	),
-- 
2.39.2

