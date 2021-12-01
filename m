Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD1C465981
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 23:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234878AbhLAWzK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 17:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353712AbhLAWzJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 17:55:09 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2382C061748
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 14:51:47 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id i63so51168623lji.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 14:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2wq1wR+9Fbl0/NYq+OFpxYykAdQVhs+xIQ+W0LOVHD8=;
        b=kS3vvLLJrAOgXt9JRq6rRZeTkUS4KNuSXYGPEjorp3Mji9jPl4vnkE+XCyugZKGxpY
         YJkCpd1VZX/WQC1TeNOLjHzCGLOoyBbrNwXBOfsWjers4aHjzA65bkgWyAKcEKHQzXmT
         fdNh42YAyNY9gchXlkNPgt4GaKF5w10FzKx/gKRnfAz2gQTa2LPv3MyOE5LeIW6sMUMV
         CE5t6uyVyYcG/oVbFsCb+x3XBLz3jDeFU9j4Mw8z8n7DBaRwI0h4p4SxuD4bixhBVFeL
         i4dngsTohgggTlRgCt6VnMNc7NOJscgCUBXntAq/ysmLlpcXEgzxRPTPPx1si4Qf9Pa5
         CdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2wq1wR+9Fbl0/NYq+OFpxYykAdQVhs+xIQ+W0LOVHD8=;
        b=fSkmkvyQ6cXfQpt0UWK0dXav5ovgjCChULdFuPHnQAElDxvcyhzjQj50BZxOwfx8o4
         TmypTpcylvrJ2cWs1w7Ws+V+YFmNnTy5hLYhljSjSpd4E2S56x7uk7qu7bamxKTX4uwb
         k4MyzCY//zXQqGB0AACJ68G656HmfPwh8wJMZM3e4LhfSMHKImDU+gJY6guKQL5PZD/M
         JHD33r9l9t780sF0luY0CDga8YFGo8/7HmTpqOhfh9dJepbllvri2MthfcJUpUrXlsQt
         PzYBVvp51fsp8DXDkiZBCxYPtnyO6LBDrdYEtly4/Unje2XAgtCJ1Fd9ZkP0kgLvdqaD
         OXCw==
X-Gm-Message-State: AOAM533Xo0cS8G3Z371DD7NyKBIDVif7hkkehMTCPJXCGZMPl0qW1bIe
        B0/SB81hDkU4vEACoj6ZcuZRiA==
X-Google-Smtp-Source: ABdhPJzVNPDK63xcNB8vxN1N3Knbn8saybL3Z3BaV7i+SOPjc19bervS0xaC4iVHbuImuXBT6ql59Q==
X-Received: by 2002:a05:651c:237:: with SMTP id z23mr8455555ljn.108.1638399106240;
        Wed, 01 Dec 2021 14:51:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u7sm124819ljh.49.2021.12.01.14.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:51:45 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/msm/dpu: drop scaler config from plane state
Date:   Thu,  2 Dec 2021 01:51:37 +0300
Message-Id: <20211201225140.2481577-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
References: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
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
index ca190d92f0d5..4c373abbe89c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -536,14 +536,12 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
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
@@ -582,9 +580,9 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
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
@@ -662,6 +660,11 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
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
@@ -670,8 +673,23 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
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
@@ -712,7 +730,6 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 			drm_rect_width(&pipe_cfg.dst_rect);
 		pipe_cfg.src_rect.y2 =
 			drm_rect_height(&pipe_cfg.dst_rect);
-		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
 
 		if (pdpu->pipe_hw->ops.setup_format)
 			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
@@ -724,15 +741,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
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
@@ -1129,8 +1138,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	pipe_cfg.dst_rect = state->dst;
 
-	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
 		/* skip remaining processing on color fill */
@@ -1143,21 +1150,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
index 52792526e904..1ee5ca5fcdf7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -23,8 +23,6 @@
  * @multirect_index: index of the rectangle of SSPP
  * @multirect_mode: parallel or time multiplex multirect mode
  * @pending:	whether the current update is still pending
- * @scaler3_cfg: configuration data for scaler3
- * @pixel_ext: configuration data for pixel extensions
  * @plane_fetch_bw: calculated BW per plane
  * @plane_clk: calculated clk per plane
  */
@@ -37,10 +35,6 @@ struct dpu_plane_state {
 	uint32_t multirect_mode;
 	bool pending;
 
-	/* scaler configuration */
-	struct dpu_hw_scaler3_cfg scaler3_cfg;
-	struct dpu_hw_pixel_ext pixel_ext;
-
 	u64 plane_fetch_bw;
 	u64 plane_clk;
 };
-- 
2.33.0

