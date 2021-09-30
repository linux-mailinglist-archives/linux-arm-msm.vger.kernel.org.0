Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F7141DBB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 16:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351627AbhI3OCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 10:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351623AbhI3OCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 10:02:12 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA0BC06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:29 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id e15so25768941lfr.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6k7szBFo3j8aTdpEXsB/ZpCD/JR4bHzUrZ/Dsq5ntZM=;
        b=iQRW3OwRFBL76Hi+dUDeR4Z3cFvAVw5UYwYiX6uQc4CdHc6r6aInykS5+fR42TKRXp
         qJ/3EYgSTa28EZbDHKdwJnlJeuJwdhoRQ95mAVquu/srZ8hR6qv4KexshSwA11kdrzgL
         Cs8xq7H1FynLA0pCaiV6fNi+yGNcdnAjNI+6ZU6ZX8Woc4fkMzMgwbUTfe3l+bOSaqpA
         GM35cqWzvIFa4DmfPS3kYYL2UtjGXJ7ajq4Cp8y10r+kUaveXYpWrPcHUYHE7+ALeWuh
         lhoUZqklmzMOZ6lw+O9I5ztRODYFe5EkKPSacQxXEPHOgDI7u+/0oRb7N86oWzzJ5msr
         JavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6k7szBFo3j8aTdpEXsB/ZpCD/JR4bHzUrZ/Dsq5ntZM=;
        b=UZ6RxPBl41VEi1UsvurOFswmcORecWBVEuIuJ1UHtE+vTMr3nI3BdISr+/TDt22SRn
         pzDRrHiEkrjPnoB7B+jZ8TGEzX3KEYi6hKTYE5hI5iO0YjaB/r3Z0fpU+8DugdQqf4bI
         +CA9bsUCAROaxSwL24zAewVz444tzY0hXOOSCva8liIIT8Bsmoypg+yeduXW2wbXpscC
         9AXrWR4QoDc6Y6Jz6X1h+zKlIqhnJgpm24Hft5yn9vbCzDeStNk0K5c1SoNRZdvHoJ+h
         SwL5OM5n5PQdg+UjbF7NR5W9tkujO/jPNGJbhaqit1Dr7HU1s5eFEhaekiBI8HiZTW38
         Rc2w==
X-Gm-Message-State: AOAM530g5jSodWKChTtlEtVtsiSSArDEK5ABq+7UEyh2bGKuL55Py82m
        nDgVTcQw8J43olY+yeXQL5HrQw==
X-Google-Smtp-Source: ABdhPJxqdY0zyox3O0A3C2lcMQwoia0Ugdy97gCXDuUYFdDzoqXBScIuF7E1IO+f+xMn27p/YsYm7w==
X-Received: by 2002:a2e:6f1b:: with SMTP id k27mr5994686ljc.117.1633010425390;
        Thu, 30 Sep 2021 07:00:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 07:00:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 06/11] drm/msm/dpu: drop scaler config from plane state
Date:   Thu, 30 Sep 2021 16:59:57 +0300
Message-Id: <20210930140002.308628-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
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
index 5288b5b824f8..4259c4ecde9b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -542,14 +542,12 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
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
@@ -588,9 +586,9 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
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
@@ -660,6 +658,11 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
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
@@ -668,8 +671,23 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
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
@@ -710,7 +728,6 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 			drm_rect_width(&pipe_cfg.dst_rect);
 		pipe_cfg.src_rect.y2 =
 			drm_rect_height(&pipe_cfg.dst_rect);
-		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
 
 		if (pdpu->pipe_hw->ops.setup_format)
 			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
@@ -722,15 +739,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
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
@@ -1122,8 +1131,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	pipe_cfg.dst_rect = state->dst;
 
-	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
 		/* skip remaining processing on color fill */
@@ -1136,21 +1143,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
index 34e03ac05f4a..087194be3c22 100644
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
2.33.0

