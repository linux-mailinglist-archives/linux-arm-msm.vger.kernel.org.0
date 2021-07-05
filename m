Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94CBB3BB4AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 03:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhGEB1u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 21:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhGEB1u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 21:27:50 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D93AC061574
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 18:25:13 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id r26so12024304lfp.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 18:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PBP/yjiQBGv4ppdzYPsSBer2ZwKQJMcNGwTJkUlNC9o=;
        b=p3tzYSTqmAJElaE3JODz9j354xHCT9YJrfcq16pxbkgCvY//ibOTszxyLXjkyP0drN
         L0ZdTfk6qxyPF9v+9874eUcTokcaM2dTjnXQRVEvW3I9A4gcmkeCKtdK+/StTvzBad/p
         +EBcfUvVBBeazrvGx3LYP6DOUsaKGcJ8E0WP7UTibKlG4BFQlCHV52NGhUDry7AgqnQI
         6bqrQERKCATsysTKQu1K9XH7UGSNOx69/SAFMKrBXYs7ImcJ7pGrRO6+2aGDJkzAnDBI
         dTMEKIpnzDtjlpYcWuEl00E8iHw5u09doh+8Mn7tWH3ki63wUOx0FqGs/Rf2XzKc9kLj
         kEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PBP/yjiQBGv4ppdzYPsSBer2ZwKQJMcNGwTJkUlNC9o=;
        b=jhnk3Tt4ThXs2012/E6qyGBwnx/t0BCzSHRWDnwEwNRnkHvqhXPG4VoX5D46V/n3VU
         GrVz1A99TY+eMflFTiM0asfLJc/Tk4tmiRFqXWwPWVo1gQrYKoojdAAJUGo3gZib3FFi
         aS2e/Ns0g6AnaBRTXwzTYcTRKs7HwBIK1mYXHHJZFE4itDWkCeHzzCShiUanm5jAkusC
         e3Wpslw8uGjk62JMdcmbAUx1l1M6Kfc6QF86dG8I7GlpTHAVtEMDHr8z+MSg4qi7sJNN
         eZ+SK4fnpVN88rkXocBYuPpQZYNIEw/LMSH2VWmwIomIS7r2ZUDYDfHGNa/LMpGOwvnQ
         HkCA==
X-Gm-Message-State: AOAM532uP8vUztY66I5MFNPF8rlzLZvKS3vBL2C1fzW6szl8BNQ6kiq1
        Mo22WthSq8W34HFx5FJZArHnlA==
X-Google-Smtp-Source: ABdhPJxWn+Zqn/y6EMqzGH4mpMvd3FeYG7q5+SiktCy2tGB0MV5yUuHkvedUk66bQMJt6L8P6LM2/Q==
X-Received: by 2002:a05:6512:3136:: with SMTP id p22mr8579809lfd.549.1625448312012;
        Sun, 04 Jul 2021 18:25:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 18:25:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 07/22] drm/msm/dpu: drop scaler config from plane state
Date:   Mon,  5 Jul 2021 04:21:00 +0300
Message-Id: <20210705012115.4179824-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Scaler and pixel_ext configuration does not contain a long living state,
it is used only during plane update, so remove these two fiels from
dpu_plane_state and allocate them on stack.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 59 ++++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ---
 2 files changed, 26 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index cd1a1e333f7c..46446610e07e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -527,14 +527,12 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 		struct dpu_plane_state *pstate,
 		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
 		struct dpu_hw_scaler3_cfg *scale_cfg,
+		struct dpu_hw_pixel_ext *pixel_ext,
 		const struct dpu_format *fmt,
 		uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v)
 {
 	uint32_t i;
 
-	memset(scale_cfg, 0, sizeof(*scale_cfg));
-	memset(&pstate->pixel_ext, 0, sizeof(struct dpu_hw_pixel_ext));
-
 	scale_cfg->phase_step_x[DPU_SSPP_COMP_0] =
 		mult_frac((1 << PHASE_STEP_SHIFT), src_w, dst_w);
 	scale_cfg->phase_step_y[DPU_SSPP_COMP_0] =
@@ -573,9 +571,9 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 			scale_cfg->preload_y[i] = DPU_QSEED3_DEFAULT_PRELOAD_V;
 		}
 
-		pstate->pixel_ext.num_ext_pxls_top[i] =
+		pixel_ext->num_ext_pxls_top[i] =
 			scale_cfg->src_height[i];
-		pstate->pixel_ext.num_ext_pxls_left[i] =
+		pixel_ext->num_ext_pxls_left[i] =
 			scale_cfg->src_width[i];
 	}
 	if (!(DPU_FORMAT_IS_YUV(fmt)) && (src_h == dst_h)
@@ -645,6 +643,11 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 		struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
+	struct dpu_hw_scaler3_cfg scaler3_cfg;
+	struct dpu_hw_pixel_ext pixel_ext;
+
+	memset(&scaler3_cfg, 0, sizeof(scaler3_cfg));
+	memset(&pixel_ext, 0, sizeof(pixel_ext));
 
 	/* don't chroma subsample if decimating */
 	/* update scaler. calculate default config for QSEED3 */
@@ -653,8 +656,23 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 			drm_rect_height(&pipe_cfg->src_rect),
 			drm_rect_width(&pipe_cfg->dst_rect),
 			drm_rect_height(&pipe_cfg->dst_rect),
-			&pstate->scaler3_cfg, fmt,
+			&scaler3_cfg, &pixel_ext, fmt,
 			info->hsub, info->vsub);
+
+	if (pdpu->pipe_hw->ops.setup_pe)
+		pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
+				&pixel_ext);
+
+	/**
+	 * when programmed in multirect mode, scalar block will be
+	 * bypassed. Still we need to update alpha and bitwidth
+	 * ONLY for RECT0
+	 */
+	if (pdpu->pipe_hw->ops.setup_scaler &&
+			pstate->multirect_index != DPU_SSPP_RECT_1)
+		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
+				pipe_cfg, &pixel_ext,
+				&scaler3_cfg);
 }
 
 /**
@@ -695,7 +713,6 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 			drm_rect_width(&pipe_cfg.dst_rect);
 		pipe_cfg.src_rect.y2 =
 			drm_rect_height(&pipe_cfg.dst_rect);
-		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
 
 		if (pdpu->pipe_hw->ops.setup_format)
 			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
@@ -707,15 +724,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 					&pipe_cfg,
 					pstate->multirect_index);
 
-		if (pdpu->pipe_hw->ops.setup_pe)
-			pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
-					&pstate->pixel_ext);
-
-		if (pdpu->pipe_hw->ops.setup_scaler &&
-				pstate->multirect_index != DPU_SSPP_RECT_1)
-			pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
-					&pipe_cfg, &pstate->pixel_ext,
-					&pstate->scaler3_cfg);
+		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
 	}
 
 	return 0;
@@ -1102,8 +1111,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	pipe_cfg.dst_rect = state->dst;
 
-	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
 		/* skip remaining processing on color fill */
@@ -1116,21 +1123,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 				pstate->multirect_index);
 	}
 
-	if (pdpu->pipe_hw->ops.setup_pe &&
-			(pstate->multirect_index != DPU_SSPP_RECT_1))
-		pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
-				&pstate->pixel_ext);
-
-	/**
-	 * when programmed in multirect mode, scalar block will be
-	 * bypassed. Still we need to update alpha and bitwidth
-	 * ONLY for RECT0
-	 */
-	if (pdpu->pipe_hw->ops.setup_scaler &&
-			pstate->multirect_index != DPU_SSPP_RECT_1)
-		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
-				&pipe_cfg, &pstate->pixel_ext,
-				&pstate->scaler3_cfg);
+	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
 
 	if (pdpu->pipe_hw->ops.setup_multirect)
 		pdpu->pipe_hw->ops.setup_multirect(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index d5b7f5876e64..3e4ed8a33a3e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -23,8 +23,6 @@
  * @multirect_index: index of the rectangle of SSPP
  * @multirect_mode: parallel or time multiplex multirect mode
  * @pending:	whether the current update is still pending
- * @scaler3_cfg: configuration data for scaler3
- * @pixel_ext: configuration data for pixel extensions
  * @cdp_cfg:	CDP configuration
  * @plane_fetch_bw: calculated BW per plane
  * @plane_clk: calculated clk per plane
@@ -38,10 +36,6 @@ struct dpu_plane_state {
 	uint32_t multirect_mode;
 	bool pending;
 
-	/* scaler configuration */
-	struct dpu_hw_scaler3_cfg scaler3_cfg;
-	struct dpu_hw_pixel_ext pixel_ext;
-
 	struct dpu_hw_pipe_cdp_cfg cdp_cfg;
 	u64 plane_fetch_bw;
 	u64 plane_clk;
-- 
2.30.2

