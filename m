Return-Path: <linux-arm-msm+bounces-18034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 748B88AB975
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 06:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD82C1F21509
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 04:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210D1175BF;
	Sat, 20 Apr 2024 04:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sd2CiQ/R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FACE57F
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 04:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713585685; cv=none; b=QlcTrEEwxByF+tSVosNiBlGKHm1UdVX3QI3z2ngOOpjyiwrom5Jcj2lL5w8f7UmxdGVMwohF5+YICazGNXJF25dRy7OpgiWR4YUL8Ju9/lEUttSNq79zATxu6ZfynokO5RDVc7L5kuq/Th9mjRdZ9az9O4DozdyShWli+ZfGv0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713585685; c=relaxed/simple;
	bh=h3FBICNcHR5FimVkkUqA+pwNB93Q5Y5H3dOPJrq0fWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKIvuXZuuR++pMgzz0CeejBbhV/6dJ6k6Qmrk4JdyNpnq6w7xDMLwqf9vuyLJWM6/U4VDCTxHQkfE4GCWUZ6XLGQS7scAMUPwtmWDZHDnSrOQpm/IdB5YdWBwWgvGE0+n21a3OXWiK3DUbKMV025MR2riQQjR/fmABx+WAqWcTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sd2CiQ/R; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51ac5923ef6so972492e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 21:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713585678; x=1714190478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jy8+OElliGGt/MtZqjcKJwSmAfXIvgQZ4sndvhC9fas=;
        b=Sd2CiQ/R8RUxBAY7vy1bw3R3ui8E4/3JCc0YfAg7W68hUKC9QbmjefKwAjgWzr/XH8
         GV0oq5H75jicTbqnPqHXkKzvLcJlq/ViphBCkFEwpDSnxMwKx2LVrJJpYFBdpRzrveBy
         Kip/sbAZPNNt4I/gBzGPgMCcAlOB1G9QPhga2qnLQnLpXpzK0URBFkcvvQ2L8W7LZeRU
         293CCYeV9GEAD9IBEMnjJ/6Ir/JzTFx4b9jI2WvCr2ri527DE5iLdzJhauQgqdAURkiJ
         AzJ9n7mdkpkRgpCRpq/hcvTbbVyk+cMsjZDKPyZzSP06zy/bJMWQRR8rVnDtTswdmBcX
         LQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713585678; x=1714190478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jy8+OElliGGt/MtZqjcKJwSmAfXIvgQZ4sndvhC9fas=;
        b=rtfTy4TZcw1lp7FO/pdZNQ3ZLN0J+8XDN13uynva/qhf87pZBUe8kJItElZC45ZM7c
         2CdAi197elEeYbtvcOjAcmLjniNB1sfeOw3Hi1+r26/rmlzcvPwjPsg30jdZ1KjGBV+N
         QRpepGzFVHsKVCU+A4zWHsR9NXGN8ngkNb+NGN4Ix6zH2aXEOtinUyEknVPe4PZ9ASo2
         4RGKesZtunTtxuLUJQzVMO1Z0nJHadfzEWsb9GzkhlSZZMX1xCICB6BqpcBee3/wdYeJ
         TlqKEfIHP5Zre+nICK7TKerJh8ocJdwNz91tjUNLl2LvVXQPFL/uLjkKItuLqTieUS5j
         vv8Q==
X-Gm-Message-State: AOJu0YzPAyazSu9UFW2YulnCIO54eZ+ONeJEFsutn4hidW3GNDLYwrgz
	6dEg+vNGBp3FwSWD8JnMUWzdfvoV4D8f/om8dFpiN687h6iI93urj0CW2MCX/yg=
X-Google-Smtp-Source: AGHT+IFgLnxVBXok9dgCNh7q6T19erh6jpU6FhCTuTkvWXNKgCEIyUTyxX4i8Z38kO0pQEK+Q3zPGg==
X-Received: by 2002:ac2:5a5d:0:b0:516:d05a:ec14 with SMTP id r29-20020ac25a5d000000b00516d05aec14mr966858lfn.19.1713585677850;
        Fri, 19 Apr 2024 21:01:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n2-20020a0565120ac200b00518c9ccef2esm1003993lfu.22.2024.04.19.21.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 21:01:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 07:01:02 +0300
Subject: [PATCH v2 5/9] drm/msm: merge dpu_format and mdp_format in struct
 msm_format
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dpu-format-v2-5-9e93226cbffd@linaro.org>
References: <20240420-dpu-format-v2-0-9e93226cbffd@linaro.org>
In-Reply-To: <20240420-dpu-format-v2-0-9e93226cbffd@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=80537;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h3FBICNcHR5FimVkkUqA+pwNB93Q5Y5H3dOPJrq0fWg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIz4I4SpEPpR2iR2FrUgJGtFNVDz3M3qMvRQ4C
 GoKL83Eu6KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiM+CAAKCRCLPIo+Aiko
 1dfJB/44czrL72cg1g+nVj2qqCi+X5hnrJ7sb9Cmtjjgh/dSsBdwYbRgrYTlOoeHLziadx7ig8h
 mnQnuI34OvVKsRgA953UwHc+tgtjAwI2rDl64I6djEIJywELBxJK3KxuFcBefdzf03IYx6p74+0
 +rYUxe5/yDdaZrDtq2gTuma/PL9KENBaT4707ID/20bWBbYjUsVNscdpSr4JM9rq1uIUBGRVmP2
 T8lmGF/oEbiXgZYpCcmN07+WBMxv84wavFipOOhVxr55v1FLCVetpor5c6/jBn65AdPKRzgiVDv
 ceAJGjxYwpMDY36ml8oyhUCuZfDYRS6eqwowvzYv1QpFbNj+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Structures dpu_format and mdp_format are largely the same structures.
In order to remove duplication between format databases, merge these two
stucture definitions into the global struct msm_format.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 184 +++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  41 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |  30 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  74 ++++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |  26 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   7 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  54 +++---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h           |   2 +-
 drivers/gpu/drm/msm/disp/mdp_format.c              |  28 ++--
 drivers/gpu/drm/msm/disp/mdp_format.h              |  28 ++++
 drivers/gpu/drm/msm/disp/mdp_kms.h                 |  13 --
 28 files changed, 296 insertions(+), 305 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 88c2e51ab166..9f2164782844 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -320,7 +320,7 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 }
 
 static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
-		struct dpu_plane_state *pstate, struct dpu_format *format)
+		struct dpu_plane_state *pstate, const struct msm_format *format)
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
 	uint32_t blend_op;
@@ -363,7 +363,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 				fg_alpha, bg_alpha, blend_op);
 
 	DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%u blend_op:0x%x\n",
-		  &format->base.pixel_format, format->alpha_enable, blend_op);
+		  &format->pixel_format, format->alpha_enable, blend_op);
 }
 
 static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
@@ -395,7 +395,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct dpu_crtc_mixer *mixer,
 				       u32 num_mixers,
 				       enum dpu_stage stage,
-				       struct dpu_format *format,
+				       const struct msm_format *format,
 				       uint64_t modifier,
 				       struct dpu_sw_pipe *pipe,
 				       unsigned int stage_idx,
@@ -412,7 +412,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 
 	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
 				   state, to_dpu_plane_state(state), stage_idx,
-				   format->base.pixel_format,
+				   format->pixel_format,
 				   modifier);
 
 	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
@@ -440,7 +440,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct drm_plane_state *state;
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
 	struct dpu_plane_state *pstate = NULL;
-	struct dpu_format *format;
+	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
 	uint32_t lm_idx;
@@ -459,7 +459,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
+		format = msm_framebuffer_format(pstate->base.fb);
 
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 43431cb55421..119f3ea50a7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -675,7 +675,7 @@ static int dpu_encoder_virt_atomic_check(
 	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
 		fb = conn_state->writeback_job->fb;
 
-		if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
+		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
 			topology.needs_cdm = true;
 	} else if (disp_info->intf_type == INTF_DP) {
 		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
@@ -2184,7 +2184,7 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 }
 
 void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
-				       const struct dpu_format *dpu_fmt,
+				       const struct msm_format *dpu_fmt,
 				       u32 output_type)
 {
 	struct dpu_hw_cdm *hw_cdm;
@@ -2202,9 +2202,9 @@ void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
 	if (!hw_cdm)
 		return;
 
-	if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
+	if (!MSM_FORMAT_IS_YUV(dpu_fmt)) {
 		DPU_DEBUG("[enc:%d] cdm_disable fmt:%p4cc\n", DRMID(phys_enc->parent),
-			  &dpu_fmt->base.pixel_format);
+			  &dpu_fmt->pixel_format);
 		if (hw_cdm->ops.bind_pingpong_blk)
 			hw_cdm->ops.bind_pingpong_blk(hw_cdm, PINGPONG_NONE);
 
@@ -2217,7 +2217,7 @@ void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
 	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
 	cdm_cfg->output_fmt = dpu_fmt;
 	cdm_cfg->output_type = output_type;
-	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
+	cdm_cfg->output_bit_depth = MSM_FORMAT_IS_DX(dpu_fmt) ?
 			CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
 	cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
 
@@ -2246,7 +2246,7 @@ void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
 
 	DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%p4cc,%d,%d,%d,%d]\n",
 		  DRMID(phys_enc->parent), cdm_cfg->output_width,
-		  cdm_cfg->output_height, &cdm_cfg->output_fmt->base.pixel_format,
+		  cdm_cfg->output_height, &cdm_cfg->output_fmt->pixel_format,
 		  cdm_cfg->output_type, cdm_cfg->output_bit_depth,
 		  cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 98d1b64a43e8..002e89cc1705 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -393,7 +393,7 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
  * @output_type: HDMI/WB
  */
 void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
-				       const struct dpu_format *dpu_fmt,
+				       const struct msm_format *dpu_fmt,
 				       u32 output_type);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index d9e7dbf0499c..deb2f6b446d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -235,7 +235,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 {
 	struct drm_display_mode mode;
 	struct dpu_hw_intf_timing_params timing_params = { 0 };
-	const struct dpu_format *fmt = NULL;
+	const struct msm_format *fmt = NULL;
 	u32 fmt_fourcc;
 	unsigned long lock_flags;
 	struct dpu_hw_intf_cfg intf_cfg = { 0 };
@@ -409,7 +409,7 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_ctl *ctl;
-	const struct dpu_format *fmt;
+	const struct msm_format *fmt;
 	u32 fmt_fourcc;
 
 	ctl = phys_enc->hw_ctl;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index ff41493147ab..8b5a4a1c239e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -322,7 +322,7 @@ static void dpu_encoder_phys_wb_setup(
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
 	struct drm_writeback_job *wb_job;
 	const struct msm_format *format;
-	const struct dpu_format *dpu_fmt;
+	const struct msm_format *dpu_fmt;
 
 	wb_job = wb_enc->wb_job;
 	format = msm_framebuffer_format(wb_enc->wb_job->fb);
@@ -594,7 +594,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 	wb_cfg->dest.height = job->fb->height;
 	wb_cfg->dest.num_planes = wb_cfg->dest.format->num_planes;
 
-	if ((wb_cfg->dest.format->fetch_planes == MDP_PLANE_PLANAR) &&
+	if ((wb_cfg->dest.format->fetch_type == MDP_PLANE_PLANAR) &&
 			(wb_cfg->dest.format->element[0] == C1_B_Cb))
 		swap(wb_cfg->dest.plane_addr[1], wb_cfg->dest.plane_addr[2]);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 0c2afded0e56..855f0d29c387 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -34,18 +34,21 @@
 #define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
 bp, flg, fm, np)                                                          \
 {                                                                         \
-	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = MDP_PLANE_INTERLEAVED,                            \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
 	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), (e3) },                            \
-	.bits = { g, b, r, a },                                           \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_align_msb = 0,                                            \
 	.unpack_tight = 1,                                                \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.base.fetch_mode = fm,                                            \
-	.base.flags = flg,                                                \
+	.fetch_mode = fm,                                                 \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -53,18 +56,21 @@ bp, flg, fm, np)                                                          \
 #define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
 alpha, bp, flg, fm, np, th)                                               \
 {                                                                         \
-	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = MDP_PLANE_INTERLEAVED,                            \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
 	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), (e3) },                            \
-	.bits = { g, b, r, a },                                           \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_align_msb = 0,                                            \
 	.unpack_tight = 1,                                                \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.base.fetch_mode = fm,                                            \
-	.base.flags = flg,                                                \
+	.fetch_mode = fm,                                                 \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -73,36 +79,42 @@ alpha, bp, flg, fm, np, th)                                               \
 #define INTERLEAVED_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, e3,              \
 alpha, chroma, count, bp, flg, fm, np)                                    \
 {                                                                         \
-	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = MDP_PLANE_INTERLEAVED,                            \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
 	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), (e3)},                             \
-	.bits = { g, b, r, a },                                           \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 0,                                            \
 	.unpack_tight = 1,                                                \
 	.unpack_count = count,                                            \
 	.bpp = bp,                                                        \
-	.base.fetch_mode = fm,                                            \
-	.base.flags = flg,                                                \
+	.fetch_mode = fm,                                                 \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
 
 #define PSEUDO_YUV_FMT(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)      \
 {                                                                         \
-	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = MDP_PLANE_PSEUDO_PLANAR,                          \
-	.alpha_enable = false,                                            \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
+	.alpha_enable = 0,                                                \
 	.element = { (e0), (e1), 0, 0 },                                  \
-	.bits = { g, b, r, a },                                           \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 0,                                            \
 	.unpack_tight = 1,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.base.fetch_mode = fm,                                            \
-	.base.flags = flg,                                                \
+	.fetch_mode = fm,                                                 \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -110,36 +122,42 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 #define PSEUDO_YUV_FMT_TILED(fmt, a, r, g, b, e0, e1, chroma,             \
 flg, fm, np, th)                                                          \
 {                                                                         \
-	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = MDP_PLANE_PSEUDO_PLANAR,                          \
-	.alpha_enable = false,                                            \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
+	.alpha_enable = 0,                                                \
 	.element = { (e0), (e1), 0, 0 },                                  \
-	.bits = { g, b, r, a },                                           \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 0,                                            \
 	.unpack_tight = 1,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.base.fetch_mode = fm,                                            \
-	.base.flags = flg,                                                \
+	.fetch_mode = fm,                                                 \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
 
 #define PSEUDO_YUV_FMT_LOOSE(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)\
 {                                                                         \
-	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = MDP_PLANE_PSEUDO_PLANAR,                          \
-	.alpha_enable = false,                                            \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
+	.alpha_enable = 0,                                                \
 	.element = { (e0), (e1), 0, 0 },                                  \
-	.bits = { g, b, r, a },                                           \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 1,                                            \
 	.unpack_tight = 0,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.base.fetch_mode = fm,                                            \
-	.base.flags = flg,                                                \
+	.fetch_mode = fm,                                                 \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -147,18 +165,21 @@ flg, fm, np, th)                                                          \
 #define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
 flg, fm, np, th)                                                          \
 {                                                                         \
-	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = MDP_PLANE_PSEUDO_PLANAR,                          \
-	.alpha_enable = false,                                            \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
+	.alpha_enable = 0,                                                \
 	.element = { (e0), (e1), 0, 0 },                                  \
-	.bits = { g, b, r, a },                                           \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 1,                                            \
 	.unpack_tight = 0,                                                \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.base.fetch_mode = fm,                                            \
-	.base.flags = flg,                                                \
+	.fetch_mode = fm,                                                 \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -167,18 +188,21 @@ flg, fm, np, th)                                                          \
 #define PLANAR_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, alpha, chroma, bp,    \
 flg, fm, np)                                                      \
 {                                                                         \
-	.base.pixel_format = DRM_FORMAT_ ## fmt,                          \
-	.fetch_planes = MDP_PLANE_PLANAR,                                 \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_PLANAR,                                   \
 	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), 0 },                               \
-	.bits = { g, b, r, a },                                           \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_align_msb = 0,                                            \
 	.unpack_tight = 1,                                                \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
-	.base.fetch_mode = fm,                                            \
-	.base.flags = flg,                                                \
+	.fetch_mode = fm,                                                 \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -193,7 +217,7 @@ struct dpu_media_color_map {
 	uint32_t color;
 };
 
-static const struct dpu_format dpu_format_map[] = {
+static const struct msm_format dpu_format_map[] = {
 	INTERLEAVED_RGB_FMT(ARGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
@@ -483,7 +507,7 @@ static const struct dpu_format dpu_format_map[] = {
  * If a compression ratio needs to be used for this or any other format,
  * the data will be passed by user-space.
  */
-static const struct dpu_format dpu_format_map_ubwc[] = {
+static const struct msm_format dpu_format_map_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(BGR565,
 		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
@@ -593,7 +617,7 @@ static void _dpu_get_v_h_subsample_rate(
 	}
 }
 
-static int _dpu_format_get_media_color_ubwc(const struct dpu_format *fmt)
+static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
 {
 	static const struct dpu_media_color_map dpu_media_ubwc_map[] = {
 		{DRM_FORMAT_ABGR8888, COLOR_FMT_RGBA8888_UBWC},
@@ -609,9 +633,9 @@ static int _dpu_format_get_media_color_ubwc(const struct dpu_format *fmt)
 	int color_fmt = -1;
 	int i;
 
-	if (fmt->base.pixel_format == DRM_FORMAT_NV12 ||
-	    fmt->base.pixel_format == DRM_FORMAT_P010) {
-		if (DPU_FORMAT_IS_DX(fmt)) {
+	if (fmt->pixel_format == DRM_FORMAT_NV12 ||
+	    fmt->pixel_format == DRM_FORMAT_P010) {
+		if (MSM_FORMAT_IS_DX(fmt)) {
 			if (fmt->unpack_tight)
 				color_fmt = COLOR_FMT_NV12_BPP10_UBWC;
 			else
@@ -622,7 +646,7 @@ static int _dpu_format_get_media_color_ubwc(const struct dpu_format *fmt)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(dpu_media_ubwc_map); ++i)
-		if (fmt->base.pixel_format == dpu_media_ubwc_map[i].format) {
+		if (fmt->pixel_format == dpu_media_ubwc_map[i].format) {
 			color_fmt = dpu_media_ubwc_map[i].color;
 			break;
 		}
@@ -630,14 +654,14 @@ static int _dpu_format_get_media_color_ubwc(const struct dpu_format *fmt)
 }
 
 static int _dpu_format_get_plane_sizes_ubwc(
-		const struct dpu_format *fmt,
+		const struct msm_format *fmt,
 		const uint32_t width,
 		const uint32_t height,
 		struct dpu_hw_fmt_layout *layout)
 {
 	int i;
 	int color;
-	bool meta = DPU_FORMAT_IS_UBWC(fmt);
+	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
 	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
 	layout->format = fmt;
@@ -648,11 +672,11 @@ static int _dpu_format_get_plane_sizes_ubwc(
 	color = _dpu_format_get_media_color_ubwc(fmt);
 	if (color < 0) {
 		DRM_ERROR("UBWC format not supported for fmt: %p4cc\n",
-			  &fmt->base.pixel_format);
+			  &fmt->pixel_format);
 		return -EINVAL;
 	}
 
-	if (DPU_FORMAT_IS_YUV(layout->format)) {
+	if (MSM_FORMAT_IS_YUV(layout->format)) {
 		uint32_t y_sclines, uv_sclines;
 		uint32_t y_meta_scanlines = 0;
 		uint32_t uv_meta_scanlines = 0;
@@ -709,7 +733,7 @@ static int _dpu_format_get_plane_sizes_ubwc(
 }
 
 static int _dpu_format_get_plane_sizes_linear(
-		const struct dpu_format *fmt,
+		const struct msm_format *fmt,
 		const uint32_t width,
 		const uint32_t height,
 		struct dpu_hw_fmt_layout *layout,
@@ -724,7 +748,7 @@ static int _dpu_format_get_plane_sizes_linear(
 	layout->num_planes = fmt->num_planes;
 
 	/* Due to memset above, only need to set planes of interest */
-	if (fmt->fetch_planes == MDP_PLANE_INTERLEAVED) {
+	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
 		layout->plane_size[0] = width * height * layout->format->bpp;
 		layout->plane_pitch[0] = width * layout->format->bpp;
@@ -742,8 +766,8 @@ static int _dpu_format_get_plane_sizes_linear(
 			return -EINVAL;
 		}
 
-		if ((fmt->base.pixel_format == DRM_FORMAT_NV12) &&
-			(DPU_FORMAT_IS_DX(fmt)))
+		if ((fmt->pixel_format == DRM_FORMAT_NV12) &&
+			(MSM_FORMAT_IS_DX(fmt)))
 			bpp = 2;
 		layout->plane_pitch[0] = width * bpp;
 		layout->plane_pitch[1] = layout->plane_pitch[0] / h_subsample;
@@ -751,7 +775,7 @@ static int _dpu_format_get_plane_sizes_linear(
 		layout->plane_size[1] = layout->plane_pitch[1] *
 				(height / v_subsample);
 
-		if (fmt->fetch_planes == MDP_PLANE_PSEUDO_PLANAR) {
+		if (fmt->fetch_type == MDP_PLANE_PSEUDO_PLANAR) {
 			layout->num_planes = 2;
 			layout->plane_size[1] *= 2;
 			layout->plane_pitch[1] *= 2;
@@ -781,7 +805,7 @@ static int _dpu_format_get_plane_sizes_linear(
 }
 
 static int dpu_format_get_plane_sizes(
-		const struct dpu_format *fmt,
+		const struct msm_format *fmt,
 		const uint32_t w,
 		const uint32_t h,
 		struct dpu_hw_fmt_layout *layout,
@@ -797,7 +821,7 @@ static int dpu_format_get_plane_sizes(
 		return -ERANGE;
 	}
 
-	if (DPU_FORMAT_IS_UBWC(fmt) || DPU_FORMAT_IS_TILE(fmt))
+	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
 		return _dpu_format_get_plane_sizes_ubwc(fmt, w, h, layout);
 
 	return _dpu_format_get_plane_sizes_linear(fmt, w, h, layout, pitches);
@@ -823,10 +847,10 @@ static int _dpu_format_populate_addrs_ubwc(
 		return -EFAULT;
 	}
 
-	meta = DPU_FORMAT_IS_UBWC(layout->format);
+	meta = MSM_FORMAT_IS_UBWC(layout->format);
 
 	/* Per-format logic for verifying active planes */
-	if (DPU_FORMAT_IS_YUV(layout->format)) {
+	if (MSM_FORMAT_IS_YUV(layout->format)) {
 		/************************************************/
 		/*      UBWC            **                      */
 		/*      buffer          **      DPU PLANE       */
@@ -942,7 +966,7 @@ int dpu_format_populate_layout(
 		return -ERANGE;
 	}
 
-	layout->format = to_dpu_format(msm_framebuffer_format(fb));
+	layout->format = msm_framebuffer_format(fb);
 
 	/* Populate the plane sizes etc via get_format */
 	ret = dpu_format_get_plane_sizes(layout->format, fb->width, fb->height,
@@ -951,8 +975,8 @@ int dpu_format_populate_layout(
 		return ret;
 
 	/* Populate the addresses given the fb */
-	if (DPU_FORMAT_IS_UBWC(layout->format) ||
-			DPU_FORMAT_IS_TILE(layout->format))
+	if (MSM_FORMAT_IS_UBWC(layout->format) ||
+			MSM_FORMAT_IS_TILE(layout->format))
 		ret = _dpu_format_populate_addrs_ubwc(aspace, fb, layout);
 	else
 		ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
@@ -962,23 +986,21 @@ int dpu_format_populate_layout(
 
 int dpu_format_check_modified_format(
 		const struct msm_kms *kms,
-		const struct msm_format *msm_fmt,
+		const struct msm_format *fmt,
 		const struct drm_mode_fb_cmd2 *cmd,
 		struct drm_gem_object **bos)
 {
 	const struct drm_format_info *info;
-	const struct dpu_format *fmt;
 	struct dpu_hw_fmt_layout layout;
 	uint32_t bos_total_size = 0;
 	int ret, i;
 
-	if (!msm_fmt || !cmd || !bos) {
+	if (!fmt || !cmd || !bos) {
 		DRM_ERROR("invalid arguments\n");
 		return -EINVAL;
 	}
 
-	fmt = to_dpu_format(msm_fmt);
-	info = drm_format_info(fmt->base.pixel_format);
+	info = drm_format_info(fmt->pixel_format);
 	if (!info)
 		return -EINVAL;
 
@@ -1005,13 +1027,13 @@ int dpu_format_check_modified_format(
 	return 0;
 }
 
-const struct dpu_format *dpu_get_dpu_format_ext(
+const struct msm_format *dpu_get_dpu_format_ext(
 		const uint32_t format,
 		const uint64_t modifier)
 {
 	uint32_t i = 0;
-	const struct dpu_format *fmt = NULL;
-	const struct dpu_format *map = NULL;
+	const struct msm_format *fmt = NULL;
+	const struct msm_format *map = NULL;
 	ssize_t map_size = 0;
 
 	/*
@@ -1037,7 +1059,7 @@ const struct dpu_format *dpu_get_dpu_format_ext(
 	}
 
 	for (i = 0; i < map_size; i++) {
-		if (format == map[i].base.pixel_format) {
+		if (format == map[i].pixel_format) {
 			fmt = &map[i];
 			break;
 		}
@@ -1049,8 +1071,8 @@ const struct dpu_format *dpu_get_dpu_format_ext(
 	else
 		DRM_DEBUG_ATOMIC("fmt %4.4s mod 0x%llX ubwc %d yuv %ld\n",
 				(char *)&format, modifier,
-				DPU_FORMAT_IS_UBWC(fmt),
-				DPU_FORMAT_IS_YUV(fmt));
+				MSM_FORMAT_IS_UBWC(fmt),
+				MSM_FORMAT_IS_YUV(fmt));
 
 	return fmt;
 }
@@ -1060,9 +1082,5 @@ const struct msm_format *dpu_get_msm_format(
 		const uint32_t format,
 		const uint64_t modifiers)
 {
-	const struct dpu_format *fmt = dpu_get_dpu_format_ext(format,
-			modifiers);
-	if (fmt)
-		return &fmt->base;
-	return NULL;
+	return dpu_get_dpu_format_ext(format, modifiers);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 84b8b3289f18..78b585dca195 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -14,7 +14,7 @@
  * @format:          DRM FourCC Code
  * @modifiers:       format modifier array from client, one per plane
  */
-const struct dpu_format *dpu_get_dpu_format_ext(
+const struct msm_format *dpu_get_dpu_format_ext(
 		const uint32_t format,
 		const uint64_t modifier);
 
@@ -43,7 +43,7 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 }
 
 /**
- * dpu_get_msm_format - get an dpu_format by its msm_format base
+ * dpu_get_msm_format - get an msm_format by its msm_format base
  *                     callback function registers with the msm_kms layer
  * @kms:             kms driver
  * @format:          DRM FourCC Code
@@ -58,7 +58,7 @@ const struct msm_format *dpu_get_msm_format(
  * dpu_format_check_modified_format - validate format and buffers for
  *                   dpu non-standard, i.e. modified format
  * @kms:             kms driver
- * @msm_fmt:         pointer to the msm_fmt base pointer of an dpu_format
+ * @msm_fmt:         pointer to the msm_fmt base pointer of an msm_format
  * @cmd:             fb_cmd2 structure user request
  * @bos:             gem buffer object list
  *
@@ -85,4 +85,4 @@ int dpu_format_populate_layout(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *fmtl);
 
-#endif /*_DPU_FORMATS_H */
+#endif /*_MSM_FORMATS_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
index 3602cbda793e..55d2768a6d4d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
@@ -170,7 +170,7 @@ static int dpu_hw_cdm_setup_cdwn(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *
 static int dpu_hw_cdm_enable(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cdm)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	const struct dpu_format *fmt;
+	const struct msm_format *fmt;
 	u32 opmode = 0;
 	u32 csc = 0;
 
@@ -179,7 +179,7 @@ static int dpu_hw_cdm_enable(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cdm)
 
 	fmt = cdm->output_fmt;
 
-	if (!DPU_FORMAT_IS_YUV(fmt))
+	if (!MSM_FORMAT_IS_YUV(fmt))
 		return -EINVAL;
 
 	dpu_hw_csc_setup(&ctx->hw, CDM_CSC_10_MATRIX_COEFF_0, cdm->csc_cfg, true);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
index 348424df87c6..ec71c9886d75 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
@@ -19,7 +19,7 @@ struct dpu_hw_cdm;
  *  @output_bit_depth:     output bit-depth of CDM block
  *  @h_cdwn_type:          downsample type used for horizontal pixels
  *  @v_cdwn_type:          downsample type used for vertical pixels
- *  @output_fmt:           handle to dpu_format of CDM block
+ *  @output_fmt:           handle to msm_format of CDM block
  *  @csc_cfg:              handle to CSC matrix programmed for CDM block
  *  @output_type:          interface to which CDM is paired (HDMI/WB)
  *  @pp_id:                ping-pong block to which CDM is bound to
@@ -30,7 +30,7 @@ struct dpu_hw_cdm_cfg {
 	u32 output_bit_depth;
 	u32 h_cdwn_type;
 	u32 v_cdwn_type;
-	const struct dpu_format *output_fmt;
+	const struct msm_format *output_fmt;
 	const struct dpu_csc_cfg *csc_cfg;
 	u32 output_type;
 	int pp_id;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 55c7e941e163..0fa0d3b18dae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -98,7 +98,7 @@
 
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 		const struct dpu_hw_intf_timing_params *p,
-		const struct dpu_format *fmt)
+		const struct msm_format *fmt)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	u32 hsync_period, vsync_period;
@@ -194,10 +194,10 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 		(p->vsync_polarity << 1) | /* VSYNC Polarity */
 		(p->hsync_polarity << 0);  /* HSYNC Polarity */
 
-	if (!DPU_FORMAT_IS_YUV(fmt))
-		panel_format = (fmt->bits[C0_G_Y] |
-				(fmt->bits[C1_B_Cb] << 2) |
-				(fmt->bits[C2_R_Cr] << 4) |
+	if (!MSM_FORMAT_IS_YUV(fmt))
+		panel_format = (fmt->bpc_g_y |
+				(fmt->bpc_b_cb << 2) |
+				(fmt->bpc_r_cr << 4) |
 				(0x21 << 8));
 	else
 		/* Interface treats all the pixel data in RGB888 format */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 6f4c87244f94..f9015c67a574 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -81,7 +81,7 @@ struct dpu_hw_intf_cmd_mode_cfg {
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_timing_params *p,
-			const struct dpu_format *fmt);
+			const struct msm_format *fmt);
 
 	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_prog_fetch *fetch);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index aa639a43941f..d40572b251b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -37,12 +37,6 @@
 #define DPU_MAX_DE_CURVES		3
 #endif
 
-#define DPU_FORMAT_IS_YUV(X)		MSM_FORMAT_IS_YUV(&(X)->base)
-#define DPU_FORMAT_IS_DX(X)		MSM_FORMAT_IS_DX(&(X)->base)
-#define DPU_FORMAT_IS_LINEAR(X)		MSM_FORMAT_IS_LINEAR(&(X)->base)
-#define DPU_FORMAT_IS_TILE(X)		MSM_FORMAT_IS_TILE(&(X)->base)
-#define DPU_FORMAT_IS_UBWC(X)		MSM_FORMAT_IS_UBWC(&(X)->base)
-
 #define DPU_BLEND_FG_ALPHA_FG_CONST	(0 << 0)
 #define DPU_BLEND_FG_ALPHA_BG_CONST	(1 << 0)
 #define DPU_BLEND_FG_ALPHA_FG_PIXEL	(2 << 0)
@@ -305,39 +299,6 @@ enum dpu_3d_blend_mode {
 	BLEND_3D_MAX
 };
 
-/** struct dpu_format - defines the format configuration which
- * allows DPU HW to correctly fetch and decode the format
- * @base: base msm_format structure containing fourcc code
- * @fetch_planes: how the color components are packed in pixel format
- * @element: element color ordering
- * @bits: element bit widths
- * @chroma_sample: chroma sub-samplng type
- * @unpack_align_msb: unpack aligned, 0 to LSB, 1 to MSB
- * @unpack_tight: 0 for loose, 1 for tight
- * @unpack_count: 0 = 1 component, 1 = 2 component
- * @bpp: bytes per pixel
- * @alpha_enable: whether the format has an alpha channel
- * @num_planes: number of planes (including meta data planes)
- * @tile_width: format tile width
- * @tile_height: format tile height
- */
-struct dpu_format {
-	struct msm_format base;
-	enum mdp_fetch_type fetch_planes;
-	u8 element[DPU_MAX_PLANES];
-	u8 bits[DPU_MAX_PLANES];
-	enum mdp_chroma_samp_type chroma_sample;
-	u8 unpack_align_msb;
-	u8 unpack_tight;
-	u8 unpack_count;
-	u8 bpp;
-	u8 alpha_enable;
-	u8 num_planes;
-	u16 tile_width;
-	u16 tile_height;
-};
-#define to_dpu_format(x) container_of(x, struct dpu_format, base)
-
 /**
  * struct dpu_hw_fmt_layout - format information of the source pixel data
  * @format: pixel format parameters
@@ -350,7 +311,7 @@ struct dpu_format {
  * @plane_pitch: pitch of each plane
  */
 struct dpu_hw_fmt_layout {
-	const struct dpu_format *format;
+	const struct msm_format *format;
 	uint32_t num_planes;
 	uint32_t width;
 	uint32_t height;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index d19fffa3d97e..fdd77dc51776 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -206,7 +206,7 @@ static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
  * Setup source pixel format, flip,
  */
 static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
-		const struct dpu_format *fmt, u32 flags)
+		const struct msm_format *fmt, u32 flags)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
 	struct dpu_hw_blk_reg_map *c;
@@ -247,14 +247,14 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 			chroma_samp = CHROMA_H2V1;
 	}
 
-	src_format = (chroma_samp << 23) | (fmt->fetch_planes << 19) |
-		(fmt->bits[C3_ALPHA] << 6) | (fmt->bits[C2_R_Cr] << 4) |
-		(fmt->bits[C1_B_Cb] << 2) | (fmt->bits[C0_G_Y] << 0);
+	src_format = (chroma_samp << 23) | (fmt->fetch_type << 19) |
+		(fmt->bpc_a << 6) | (fmt->bpc_r_cr << 4) |
+		(fmt->bpc_b_cb << 2) | (fmt->bpc_g_y << 0);
 
 	if (flags & DPU_SSPP_ROT_90)
 		src_format |= BIT(11); /* ROT90 */
 
-	if (fmt->alpha_enable && fmt->fetch_planes == MDP_PLANE_INTERLEAVED)
+	if (fmt->alpha_enable && fmt->fetch_type == MDP_PLANE_INTERLEAVED)
 		src_format |= BIT(8); /* SRCC3_EN */
 
 	if (flags & DPU_SSPP_SOLID_FILL)
@@ -267,10 +267,10 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		(fmt->unpack_align_msb << 18) |
 		((fmt->bpp - 1) << 9);
 
-	if (!DPU_FORMAT_IS_LINEAR(fmt)) {
-		if (DPU_FORMAT_IS_UBWC(fmt))
+	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
+		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
-		src_format |= (fmt->base.fetch_mode & 3) << 30; /*FRAME_FORMAT */
+		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
 			ctx->ubwc->highest_bank_bit << 18);
@@ -295,7 +295,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 			break;
 		case UBWC_4_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
-					DPU_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
+					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
 			break;
 		}
 	}
@@ -303,20 +303,20 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	opmode |= MDSS_MDP_OP_PE_OVERRIDE;
 
 	/* if this is YUV pixel format, enable CSC */
-	if (DPU_FORMAT_IS_YUV(fmt))
+	if (MSM_FORMAT_IS_YUV(fmt))
 		src_format |= BIT(15);
 
-	if (DPU_FORMAT_IS_DX(fmt))
+	if (MSM_FORMAT_IS_DX(fmt))
 		src_format |= BIT(14);
 
 	/* update scaler opmode, if appropriate */
 	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
 		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
-			DPU_FORMAT_IS_YUV(fmt));
+			MSM_FORMAT_IS_YUV(fmt));
 	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
 		_sspp_setup_csc10_opmode(ctx,
 			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
-			DPU_FORMAT_IS_YUV(fmt));
+			MSM_FORMAT_IS_YUV(fmt));
 
 	DPU_REG_WRITE(c, format_off, src_format);
 	DPU_REG_WRITE(c, unpack_pat_off, unpack);
@@ -385,7 +385,7 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
 
 static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
-		const struct dpu_format *format)
+		const struct msm_format *format)
 {
 	if (!ctx || !scaler3_cfg)
 		return;
@@ -556,7 +556,7 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 }
 
 static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
-				  const struct dpu_format *fmt,
+				  const struct msm_format *fmt,
 				  bool enable)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index b7dc52312c39..4a910b808687 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -183,7 +183,7 @@ struct dpu_hw_sspp_ops {
 	 * @flags: Extra flags for format config
 	 */
 	void (*setup_format)(struct dpu_sw_pipe *pipe,
-			     const struct dpu_format *fmt, u32 flags);
+			     const struct msm_format *fmt, u32 flags);
 
 	/**
 	 * setup_rects - setup pipe ROI rectangles
@@ -279,7 +279,7 @@ struct dpu_hw_sspp_ops {
 	 */
 	void (*setup_scaler)(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
-		const struct dpu_format *format);
+		const struct msm_format *format);
 
 	/**
 	 * setup_cdp - setup client driven prefetch
@@ -288,7 +288,7 @@ struct dpu_hw_sspp_ops {
 	 * @enable: whether the CDP should be enabled for this pipe
 	 */
 	void (*setup_cdp)(struct dpu_sw_pipe *pipe,
-			  const struct dpu_format *fmt,
+			  const struct msm_format *fmt,
 			  bool enable);
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index dd475827314e..486be346d40d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -282,7 +282,7 @@ static void _dpu_hw_setup_scaler3_de(struct dpu_hw_blk_reg_map *c,
 void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
 		u32 scaler_offset, u32 scaler_version,
-		const struct dpu_format *format)
+		const struct msm_format *format)
 {
 	u32 op_mode = 0;
 	u32 phase_init, preload, src_y_rgb, src_uv, dst;
@@ -293,7 +293,7 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 	op_mode |= BIT(0);
 	op_mode |= (scaler3_cfg->y_rgb_filter_cfg & 0x3) << 16;
 
-	if (format && DPU_FORMAT_IS_YUV(format)) {
+	if (format && MSM_FORMAT_IS_YUV(format)) {
 		op_mode |= BIT(12);
 		op_mode |= (scaler3_cfg->uv_filter_cfg & 0x3) << 24;
 	}
@@ -367,7 +367,7 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 	DPU_REG_WRITE(c, QSEED3_DST_SIZE + scaler_offset, dst);
 
 end:
-	if (format && !DPU_FORMAT_IS_DX(format))
+	if (format && !MSM_FORMAT_IS_DX(format))
 		op_mode |= BIT(14);
 
 	if (format && format->alpha_enable) {
@@ -522,16 +522,16 @@ int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
 #define CDP_PRELOAD_AHEAD_64	BIT(3)
 
 void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
-		   const struct dpu_format *fmt, bool enable)
+		   const struct msm_format *fmt, bool enable)
 {
 	u32 cdp_cntl = CDP_PRELOAD_AHEAD_64;
 
 	if (enable)
 		cdp_cntl |= CDP_ENABLE;
-	if (DPU_FORMAT_IS_UBWC(fmt))
+	if (MSM_FORMAT_IS_UBWC(fmt))
 		cdp_cntl |= CDP_UBWC_META_ENABLE;
-	if (DPU_FORMAT_IS_UBWC(fmt) ||
-	    DPU_FORMAT_IS_TILE(fmt))
+	if (MSM_FORMAT_IS_UBWC(fmt) ||
+	    MSM_FORMAT_IS_TILE(fmt))
 		cdp_cntl |= CDP_TILE_AMORTIZE_ENABLE;
 
 	DPU_REG_WRITE(c, offset, cdp_cntl);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 64ded69fa903..67b08e99335d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -344,14 +344,14 @@ void *dpu_hw_util_get_dir(void);
 void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
 		u32 scaler_offset, u32 scaler_version,
-		const struct dpu_format *format);
+		const struct msm_format *format);
 
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10);
 
 void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
-		   const struct dpu_format *fmt, bool enable);
+		   const struct msm_format *fmt, bool enable);
 
 u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
 		u32 total_fl);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index e75995f7fcea..2fdf1b703042 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -67,7 +67,7 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
 		struct dpu_hw_wb_cfg *data)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	const struct dpu_format *fmt = data->dest.format;
+	const struct msm_format *fmt = data->dest.format;
 	u32 dst_format, pattern, ystride0, ystride1, outsize, chroma_samp;
 	u32 write_config = 0;
 	u32 opmode = 0;
@@ -76,20 +76,20 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
 	chroma_samp = fmt->chroma_sample;
 
 	dst_format = (chroma_samp << 23) |
-		(fmt->fetch_planes << 19) |
-		(fmt->bits[C3_ALPHA] << 6) |
-		(fmt->bits[C2_R_Cr] << 4) |
-		(fmt->bits[C1_B_Cb] << 2) |
-		(fmt->bits[C0_G_Y] << 0);
+		(fmt->fetch_type << 19) |
+		(fmt->bpc_a << 6) |
+		(fmt->bpc_r_cr << 4) |
+		(fmt->bpc_b_cb << 2) |
+		(fmt->bpc_g_y << 0);
 
-	if (fmt->bits[C3_ALPHA] || fmt->alpha_enable) {
+	if (fmt->bpc_a || fmt->alpha_enable) {
 		dst_format |= BIT(8); /* DSTC3_EN */
 		if (!fmt->alpha_enable ||
 			!(ctx->caps->features & BIT(DPU_WB_PIPE_ALPHA)))
 			dst_format |= BIT(14); /* DST_ALPHA_X */
 	}
 
-	if (DPU_FORMAT_IS_YUV(fmt))
+	if (MSM_FORMAT_IS_YUV(fmt))
 		dst_format |= BIT(15);
 
 	pattern = (fmt->element[3] << 24) |
@@ -149,7 +149,7 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
 }
 
 static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
-				const struct dpu_format *fmt,
+				const struct msm_format *fmt,
 				bool enable)
 {
 	if (!ctx)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index e671796ea379..37497473e16c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -46,7 +46,7 @@ struct dpu_hw_wb_ops {
 			struct dpu_hw_qos_cfg *cfg);
 
 	void (*setup_cdp)(struct dpu_hw_wb *ctx,
-			  const struct dpu_format *fmt,
+			  const struct msm_format *fmt,
 			  bool enable);
 
 	bool (*setup_clk_force_ctrl)(struct dpu_hw_wb *ctx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index e6c9b4f2a0e0..4de5c37d6e92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -113,7 +113,7 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
  * Prefill BW Equation: line src bytes * line_time
  */
 static u64 _dpu_plane_calc_bw(const struct dpu_mdss_cfg *catalog,
-	const struct dpu_format *fmt,
+	const struct msm_format *fmt,
 	const struct drm_display_mode *mode,
 	struct dpu_sw_pipe_cfg *pipe_cfg)
 {
@@ -195,7 +195,7 @@ static u64 _dpu_plane_calc_clk(const struct drm_display_mode *mode,
 static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 		struct dpu_sw_pipe *pipe,
 		enum dpu_qos_lut_usage lut_usage,
-		const struct dpu_format *fmt, u32 src_width)
+		const struct msm_format *fmt, u32 src_width)
 {
 	struct dpu_plane *pdpu;
 	u32 fixed_buff_size;
@@ -214,7 +214,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 
 	/* FIXME: in multirect case account for the src_width of all the planes */
 
-	if (fmt->fetch_planes == MDP_PLANE_PSEUDO_PLANAR) {
+	if (fmt->fetch_type == MDP_PLANE_PSEUDO_PLANAR) {
 		if (fmt->chroma_sample == CHROMA_420) {
 			/* NV12 */
 			total_fl = (fixed_buff_size / 2) /
@@ -236,7 +236,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %p4cc w:%u fl:%u\n",
 			pipe->sspp->idx - SSPP_VIG0,
-			&fmt->base.pixel_format,
+			&fmt->pixel_format,
 			src_width, total_fl);
 
 	return total_fl;
@@ -251,7 +251,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
  */
 static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 		struct dpu_sw_pipe *pipe,
-		const struct dpu_format *fmt, struct dpu_sw_pipe_cfg *pipe_cfg)
+		const struct msm_format *fmt, struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_hw_qos_cfg cfg;
@@ -260,7 +260,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 	if (!pdpu->is_rt_pipe) {
 		lut_usage = DPU_QOS_LUT_USAGE_NRT;
 	} else {
-		if (fmt && DPU_FORMAT_IS_LINEAR(fmt))
+		if (fmt && MSM_FORMAT_IS_LINEAR(fmt))
 			lut_usage = DPU_QOS_LUT_USAGE_LINEAR;
 		else
 			lut_usage = DPU_QOS_LUT_USAGE_MACROTILE;
@@ -284,24 +284,24 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 		pdpu->is_rt_pipe);
 
 	trace_dpu_perf_set_qos_luts(pipe->sspp->idx - SSPP_VIG0,
-			(fmt) ? fmt->base.pixel_format : 0,
+			(fmt) ? fmt->pixel_format : 0,
 			pdpu->is_rt_pipe, total_fl, cfg.creq_lut, lut_usage);
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %p4cc rt:%d fl:%u lut:0x%llx\n",
 			pdpu->pipe - SSPP_VIG0,
-			fmt ? &fmt->base.pixel_format : NULL,
+			fmt ? &fmt->pixel_format : NULL,
 			pdpu->is_rt_pipe, total_fl, cfg.creq_lut);
 
 	trace_dpu_perf_set_danger_luts(pdpu->pipe - SSPP_VIG0,
-			(fmt) ? fmt->base.pixel_format : 0,
-			(fmt) ? fmt->base.fetch_mode : 0,
+			(fmt) ? fmt->pixel_format : 0,
+			(fmt) ? fmt->fetch_mode : 0,
 			cfg.danger_lut,
 			cfg.safe_lut);
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %p4cc mode:%d luts[0x%x, 0x%x]\n",
 			pdpu->pipe - SSPP_VIG0,
-			fmt ? &fmt->base.pixel_format : NULL,
-			fmt ? fmt->base.fetch_mode : -1,
+			fmt ? &fmt->pixel_format : NULL,
+			fmt ? fmt->fetch_mode : -1,
 			cfg.danger_lut,
 			cfg.safe_lut);
 
@@ -425,7 +425,7 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane,
 static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
 		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
 		struct dpu_hw_scaler3_cfg *scale_cfg,
-		const struct dpu_format *fmt,
+		const struct msm_format *fmt,
 		uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v,
 		unsigned int rotation)
 {
@@ -477,7 +477,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
 			scale_cfg->preload_y[i] = DPU_QSEED3_DEFAULT_PRELOAD_V;
 		}
 	}
-	if (!(DPU_FORMAT_IS_YUV(fmt)) && (src_h == dst_h)
+	if (!(MSM_FORMAT_IS_YUV(fmt)) && (src_h == dst_h)
 		&& (src_w == dst_w))
 		return;
 
@@ -510,11 +510,11 @@ static void _dpu_plane_setup_pixel_ext(struct dpu_hw_scaler3_cfg *scale_cfg,
 }
 
 static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe,
-						    const struct dpu_format *fmt)
+						    const struct msm_format *fmt)
 {
 	const struct dpu_csc_cfg *csc_ptr;
 
-	if (!DPU_FORMAT_IS_YUV(fmt))
+	if (!MSM_FORMAT_IS_YUV(fmt))
 		return NULL;
 
 	if (BIT(DPU_SSPP_CSC_10BIT) & pipe->sspp->cap->features)
@@ -526,12 +526,12 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe,
 }
 
 static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
-		const struct dpu_format *fmt, bool color_fill,
+		const struct msm_format *fmt, bool color_fill,
 		struct dpu_sw_pipe_cfg *pipe_cfg,
 		unsigned int rotation)
 {
 	struct dpu_hw_sspp *pipe_hw = pipe->sspp;
-	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
+	const struct drm_format_info *info = drm_format_info(fmt->pixel_format);
 	struct dpu_hw_scaler3_cfg scaler3_cfg;
 	struct dpu_hw_pixel_ext pixel_ext;
 	u32 src_width = drm_rect_width(&pipe_cfg->src_rect);
@@ -577,7 +577,7 @@ static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
 				       struct dpu_sw_pipe *pipe,
 				       struct drm_rect *dst_rect,
 				       u32 fill_color,
-				       const struct dpu_format *fmt)
+				       const struct msm_format *fmt)
 {
 	struct dpu_sw_pipe_cfg pipe_cfg;
 
@@ -615,7 +615,7 @@ static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
 static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		uint32_t color, uint32_t alpha)
 {
-	const struct dpu_format *fmt;
+	const struct msm_format *fmt;
 	const struct drm_plane *plane = &pdpu->base;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
@@ -704,7 +704,7 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 
 static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 						const struct dpu_sspp_sub_blks *sblk,
-						struct drm_rect src, const struct dpu_format *fmt)
+						struct drm_rect src, const struct msm_format *fmt)
 {
 	size_t num_formats;
 	const u32 *supported_formats;
@@ -723,8 +723,8 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 	supported_formats = sblk->rotation_cfg->rot_format_list;
 	num_formats = sblk->rotation_cfg->rot_num_formats;
 
-	if (!DPU_FORMAT_IS_UBWC(fmt) ||
-		!dpu_find_format(fmt->base.pixel_format, supported_formats, num_formats))
+	if (!MSM_FORMAT_IS_UBWC(fmt) ||
+		!dpu_find_format(fmt->pixel_format, supported_formats, num_formats))
 		return -EINVAL;
 
 	return 0;
@@ -733,15 +733,15 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 		struct dpu_sw_pipe *pipe,
 		struct dpu_sw_pipe_cfg *pipe_cfg,
-		const struct dpu_format *fmt,
+		const struct msm_format *fmt,
 		const struct drm_display_mode *mode)
 {
 	uint32_t min_src_size;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 
-	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
+	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
-	if (DPU_FORMAT_IS_YUV(fmt) &&
+	if (MSM_FORMAT_IS_YUV(fmt) &&
 	    (!pipe->sspp->cap->sblk->scaler_blk.len ||
 	     !pipe->sspp->cap->sblk->csc_blk.len)) {
 		DPU_DEBUG_PLANE(pdpu,
@@ -758,7 +758,7 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 	}
 
 	/* valid yuv image */
-	if (DPU_FORMAT_IS_YUV(fmt) &&
+	if (MSM_FORMAT_IS_YUV(fmt) &&
 	    (pipe_cfg->src_rect.x1 & 0x1 ||
 	     pipe_cfg->src_rect.y1 & 0x1 ||
 	     drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
@@ -798,7 +798,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	const struct drm_crtc_state *crtc_state = NULL;
-	const struct dpu_format *fmt;
+	const struct msm_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
@@ -858,7 +858,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
-	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
@@ -870,7 +870,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		 * full width is more than max_linewidth, thus each rect is
 		 * wider than allowed.
 		 */
-		if (DPU_FORMAT_IS_UBWC(fmt) &&
+		if (MSM_FORMAT_IS_UBWC(fmt) &&
 		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
 			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
 					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
@@ -887,7 +887,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
 		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
 		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
-		    DPU_FORMAT_IS_YUV(fmt)) {
+		    MSM_FORMAT_IS_YUV(fmt)) {
 			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
 					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
 			return -E2BIG;
@@ -945,8 +945,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
 {
-	const struct dpu_format *format =
-		to_dpu_format(msm_framebuffer_format(pdpu->base.state->fb));
+	const struct msm_format *format =
+		msm_framebuffer_format(pdpu->base.state->fb);
 	const struct dpu_csc_cfg *csc_ptr;
 
 	if (!pipe->sspp || !pipe->sspp->ops.setup_csc)
@@ -1017,7 +1017,7 @@ void dpu_plane_set_error(struct drm_plane *plane, bool error)
 static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 				       struct dpu_sw_pipe *pipe,
 				       struct dpu_sw_pipe_cfg *pipe_cfg,
-				       const struct dpu_format *fmt,
+				       const struct msm_format *fmt,
 				       int frame_rate,
 				       struct dpu_hw_fmt_layout *layout)
 {
@@ -1095,8 +1095,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
 	bool is_rt_pipe;
-	const struct dpu_format *fmt =
-		to_dpu_format(msm_framebuffer_format(fb));
+	const struct msm_format *fmt =
+		msm_framebuffer_format(fb);
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
@@ -1120,7 +1120,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
 			", %p4cc ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
-			&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
+			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
 	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
 				   drm_mode_vrefresh(&crtc->mode),
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 75f93e346282..b8610aa806ea 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -182,8 +182,8 @@ static void blend_setup(struct drm_crtc *crtc)
 		enum mdp4_pipe pipe_id = mdp4_plane_pipe(plane);
 		int idx = idxs[pipe_id];
 		if (idx > 0) {
-			const struct mdp_format *format =
-					to_mdp_format(msm_framebuffer_format(plane->state->fb));
+			const struct msm_format *format =
+					msm_framebuffer_format(plane->state->fb);
 			alpha[idx-1] = format->alpha_enable;
 		}
 	}
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index cebe20c82a54..0bae90d3f21e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -218,7 +218,7 @@ static int mdp4_plane_mode_set(struct drm_plane *plane,
 	struct mdp4_plane *mdp4_plane = to_mdp4_plane(plane);
 	struct mdp4_kms *mdp4_kms = get_kms(plane);
 	enum mdp4_pipe pipe = mdp4_plane->pipe;
-	const struct mdp_format *format;
+	const struct msm_format *format;
 	uint32_t op_mode = 0;
 	uint32_t phasex_step = MDP4_VG_PHASE_STEP_DEFAULT;
 	uint32_t phasey_step = MDP4_VG_PHASE_STEP_DEFAULT;
@@ -241,7 +241,7 @@ static int mdp4_plane_mode_set(struct drm_plane *plane,
 			fb->base.id, src_x, src_y, src_w, src_h,
 			crtc->base.id, crtc_x, crtc_y, crtc_w, crtc_h);
 
-	format = to_mdp_format(msm_framebuffer_format(fb));
+	format = msm_framebuffer_format(fb);
 
 	if (src_w > (crtc_w * DOWN_SCALE_MAX)) {
 		DRM_DEV_ERROR(dev->dev, "Width down scaling exceeds limits!\n");
@@ -267,7 +267,7 @@ static int mdp4_plane_mode_set(struct drm_plane *plane,
 		uint32_t sel_unit = SCALE_FIR;
 		op_mode |= MDP4_PIPE_OP_MODE_SCALEX_EN;
 
-		if (MDP_FORMAT_IS_YUV(format)) {
+		if (MSM_FORMAT_IS_YUV(format)) {
 			if (crtc_w > src_w)
 				sel_unit = SCALE_PIXEL_RPT;
 			else if (crtc_w <= (src_w / 4))
@@ -283,7 +283,7 @@ static int mdp4_plane_mode_set(struct drm_plane *plane,
 		uint32_t sel_unit = SCALE_FIR;
 		op_mode |= MDP4_PIPE_OP_MODE_SCALEY_EN;
 
-		if (MDP_FORMAT_IS_YUV(format)) {
+		if (MSM_FORMAT_IS_YUV(format)) {
 
 			if (crtc_h > src_h)
 				sel_unit = SCALE_PIXEL_RPT;
@@ -316,11 +316,11 @@ static int mdp4_plane_mode_set(struct drm_plane *plane,
 
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRC_FORMAT(pipe),
 			MDP4_PIPE_SRC_FORMAT_A_BPC(format->bpc_a) |
-			MDP4_PIPE_SRC_FORMAT_R_BPC(format->bpc_r) |
-			MDP4_PIPE_SRC_FORMAT_G_BPC(format->bpc_g) |
-			MDP4_PIPE_SRC_FORMAT_B_BPC(format->bpc_b) |
+			MDP4_PIPE_SRC_FORMAT_R_BPC(format->bpc_r_cr) |
+			MDP4_PIPE_SRC_FORMAT_G_BPC(format->bpc_g_y) |
+			MDP4_PIPE_SRC_FORMAT_B_BPC(format->bpc_b_cb) |
 			COND(format->alpha_enable, MDP4_PIPE_SRC_FORMAT_ALPHA_ENABLE) |
-			MDP4_PIPE_SRC_FORMAT_CPP(format->cpp - 1) |
+			MDP4_PIPE_SRC_FORMAT_CPP(format->bpp - 1) |
 			MDP4_PIPE_SRC_FORMAT_UNPACK_COUNT(format->unpack_count - 1) |
 			MDP4_PIPE_SRC_FORMAT_FETCH_PLANES(format->fetch_type) |
 			MDP4_PIPE_SRC_FORMAT_CHROMA_SAMP(format->chroma_sample) |
@@ -328,12 +328,12 @@ static int mdp4_plane_mode_set(struct drm_plane *plane,
 			COND(format->unpack_tight, MDP4_PIPE_SRC_FORMAT_UNPACK_TIGHT));
 
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRC_UNPACK(pipe),
-			MDP4_PIPE_SRC_UNPACK_ELEM0(format->unpack[0]) |
-			MDP4_PIPE_SRC_UNPACK_ELEM1(format->unpack[1]) |
-			MDP4_PIPE_SRC_UNPACK_ELEM2(format->unpack[2]) |
-			MDP4_PIPE_SRC_UNPACK_ELEM3(format->unpack[3]));
+			MDP4_PIPE_SRC_UNPACK_ELEM0(format->element[0]) |
+			MDP4_PIPE_SRC_UNPACK_ELEM1(format->element[1]) |
+			MDP4_PIPE_SRC_UNPACK_ELEM2(format->element[2]) |
+			MDP4_PIPE_SRC_UNPACK_ELEM3(format->element[3]));
 
-	if (MDP_FORMAT_IS_YUV(format)) {
+	if (MSM_FORMAT_IS_YUV(format)) {
 		struct csc_cfg *csc = mdp_get_default_csc_cfg(CSC_YUV2RGB);
 
 		op_mode |= MDP4_PIPE_OP_MODE_SRC_YCBCR;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 4a3db2ea1689..0f653e62b4a0 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -216,7 +216,7 @@ static void blend_setup(struct drm_crtc *crtc)
 	struct mdp5_kms *mdp5_kms = get_kms(crtc);
 	struct drm_plane *plane;
 	struct mdp5_plane_state *pstate, *pstates[STAGE_MAX + 1] = {NULL};
-	const struct mdp_format *format;
+	const struct msm_format *format;
 	struct mdp5_hw_mixer *mixer = pipeline->mixer;
 	uint32_t lm = mixer->lm;
 	struct mdp5_hw_mixer *r_mixer = pipeline->r_mixer;
@@ -274,7 +274,7 @@ static void blend_setup(struct drm_crtc *crtc)
 		ctl_blend_flags |= MDP5_CTL_BLEND_OP_FLAG_BORDER_OUT;
 		DBG("Border Color is enabled");
 	} else if (plane_cnt) {
-		format = to_mdp_format(msm_framebuffer_format(pstates[STAGE_BASE]->base.fb));
+		format = msm_framebuffer_format(pstates[STAGE_BASE]->base.fb);
 
 		if (format->alpha_enable)
 			bg_alpha_enabled = true;
@@ -285,8 +285,7 @@ static void blend_setup(struct drm_crtc *crtc)
 		if (!pstates[i])
 			continue;
 
-		format = to_mdp_format(
-			msm_framebuffer_format(pstates[i]->base.fb));
+		format = msm_framebuffer_format(pstates[i]->base.fb);
 		plane = pstates[i]->base.plane;
 		blend_op = MDP5_LM_BLEND_OP_MODE_FG_ALPHA(FG_CONST) |
 			MDP5_LM_BLEND_OP_MODE_BG_ALPHA(BG_CONST);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index e40f6d1d5433..3b7c3eac8eda 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -228,12 +228,12 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
 
 	if (plane_enabled(state)) {
 		unsigned int rotation;
-		const struct mdp_format *format;
+		const struct msm_format *format;
 		struct mdp5_kms *mdp5_kms = get_kms(plane);
 		uint32_t blkcfg = 0;
 
-		format = to_mdp_format(msm_framebuffer_format(state->fb));
-		if (MDP_FORMAT_IS_YUV(format))
+		format = msm_framebuffer_format(state->fb);
+		if (MSM_FORMAT_IS_YUV(format))
 			caps |= MDP_PIPE_CAP_SCALE | MDP_PIPE_CAP_CSC;
 
 		if (((state->src_w >> 16) != state->crtc_w) ||
@@ -268,8 +268,8 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
 			new_hwpipe = true;
 
 		if (mdp5_kms->smp) {
-			const struct mdp_format *format =
-				to_mdp_format(msm_framebuffer_format(state->fb));
+			const struct msm_format *format =
+				msm_framebuffer_format(state->fb);
 
 			blkcfg = mdp5_smp_calculate(mdp5_kms->smp, format,
 					state->src_w >> 16, false);
@@ -630,11 +630,11 @@ static int calc_scaley_steps(struct drm_plane *plane,
 	return 0;
 }
 
-static uint32_t get_scale_config(const struct mdp_format *format,
+static uint32_t get_scale_config(const struct msm_format *format,
 		uint32_t src, uint32_t dst, bool horz)
 {
-	const struct drm_format_info *info = drm_format_info(format->base.pixel_format);
-	bool yuv = MDP_FORMAT_IS_YUV(format);
+	const struct drm_format_info *info = drm_format_info(format->pixel_format);
+	bool yuv = MSM_FORMAT_IS_YUV(format);
 	bool scaling = yuv ? true : (src != dst);
 	uint32_t sub;
 	uint32_t ya_filter, uv_filter;
@@ -661,12 +661,12 @@ static uint32_t get_scale_config(const struct mdp_format *format,
 			COND(yuv, MDP5_PIPE_SCALE_CONFIG_SCALEY_FILTER_COMP_1_2(uv_filter));
 }
 
-static void calc_pixel_ext(const struct mdp_format *format,
+static void calc_pixel_ext(const struct msm_format *format,
 		uint32_t src, uint32_t dst, uint32_t phase_step[2],
 		int pix_ext_edge1[COMP_MAX], int pix_ext_edge2[COMP_MAX],
 		bool horz)
 {
-	bool scaling = MDP_FORMAT_IS_YUV(format) ? true : (src != dst);
+	bool scaling = MSM_FORMAT_IS_YUV(format) ? true : (src != dst);
 	int i;
 
 	/*
@@ -684,11 +684,11 @@ static void calc_pixel_ext(const struct mdp_format *format,
 }
 
 static void mdp5_write_pixel_ext(struct mdp5_kms *mdp5_kms, enum mdp5_pipe pipe,
-	const struct mdp_format *format,
+	const struct msm_format *format,
 	uint32_t src_w, int pe_left[COMP_MAX], int pe_right[COMP_MAX],
 	uint32_t src_h, int pe_top[COMP_MAX], int pe_bottom[COMP_MAX])
 {
-	const struct drm_format_info *info = drm_format_info(format->base.pixel_format);
+	const struct drm_format_info *info = drm_format_info(format->pixel_format);
 	uint32_t lr, tb, req;
 	int i;
 
@@ -696,7 +696,7 @@ static void mdp5_write_pixel_ext(struct mdp5_kms *mdp5_kms, enum mdp5_pipe pipe,
 		uint32_t roi_w = src_w;
 		uint32_t roi_h = src_h;
 
-		if (MDP_FORMAT_IS_YUV(format) && i == COMP_1_2) {
+		if (MSM_FORMAT_IS_YUV(format) && i == COMP_1_2) {
 			roi_w /= info->hsub;
 			roi_h /= info->vsub;
 		}
@@ -770,8 +770,8 @@ static void mdp5_hwpipe_mode_set(struct mdp5_kms *mdp5_kms,
 {
 	enum mdp5_pipe pipe = hwpipe->pipe;
 	bool has_pe = hwpipe->caps & MDP_PIPE_CAP_SW_PIX_EXT;
-	const struct mdp_format *format =
-			to_mdp_format(msm_framebuffer_format(fb));
+	const struct msm_format *format =
+			msm_framebuffer_format(fb);
 
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC_IMG_SIZE(pipe),
 			MDP5_PIPE_SRC_IMG_SIZE_WIDTH(src_img_w) |
@@ -795,21 +795,21 @@ static void mdp5_hwpipe_mode_set(struct mdp5_kms *mdp5_kms,
 
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC_FORMAT(pipe),
 			MDP5_PIPE_SRC_FORMAT_A_BPC(format->bpc_a) |
-			MDP5_PIPE_SRC_FORMAT_R_BPC(format->bpc_r) |
-			MDP5_PIPE_SRC_FORMAT_G_BPC(format->bpc_g) |
-			MDP5_PIPE_SRC_FORMAT_B_BPC(format->bpc_b) |
+			MDP5_PIPE_SRC_FORMAT_R_BPC(format->bpc_r_cr) |
+			MDP5_PIPE_SRC_FORMAT_G_BPC(format->bpc_g_y) |
+			MDP5_PIPE_SRC_FORMAT_B_BPC(format->bpc_b_cb) |
 			COND(format->alpha_enable, MDP5_PIPE_SRC_FORMAT_ALPHA_ENABLE) |
-			MDP5_PIPE_SRC_FORMAT_CPP(format->cpp - 1) |
+			MDP5_PIPE_SRC_FORMAT_CPP(format->bpp - 1) |
 			MDP5_PIPE_SRC_FORMAT_UNPACK_COUNT(format->unpack_count - 1) |
 			COND(format->unpack_tight, MDP5_PIPE_SRC_FORMAT_UNPACK_TIGHT) |
 			MDP5_PIPE_SRC_FORMAT_FETCH_TYPE(format->fetch_type) |
 			MDP5_PIPE_SRC_FORMAT_CHROMA_SAMP(format->chroma_sample));
 
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC_UNPACK(pipe),
-			MDP5_PIPE_SRC_UNPACK_ELEM0(format->unpack[0]) |
-			MDP5_PIPE_SRC_UNPACK_ELEM1(format->unpack[1]) |
-			MDP5_PIPE_SRC_UNPACK_ELEM2(format->unpack[2]) |
-			MDP5_PIPE_SRC_UNPACK_ELEM3(format->unpack[3]));
+			MDP5_PIPE_SRC_UNPACK_ELEM0(format->element[0]) |
+			MDP5_PIPE_SRC_UNPACK_ELEM1(format->element[1]) |
+			MDP5_PIPE_SRC_UNPACK_ELEM2(format->element[2]) |
+			MDP5_PIPE_SRC_UNPACK_ELEM3(format->element[3]));
 
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC_OP_MODE(pipe),
 			(hflip ? MDP5_PIPE_SRC_OP_MODE_FLIP_LR : 0) |
@@ -842,7 +842,7 @@ static void mdp5_hwpipe_mode_set(struct mdp5_kms *mdp5_kms,
 	}
 
 	if (hwpipe->caps & MDP_PIPE_CAP_CSC) {
-		if (MDP_FORMAT_IS_YUV(format))
+		if (MSM_FORMAT_IS_YUV(format))
 			csc_enable(mdp5_kms, pipe,
 					mdp_get_default_csc_cfg(CSC_YUV2RGB));
 		else
@@ -861,7 +861,7 @@ static int mdp5_plane_mode_set(struct drm_plane *plane,
 	struct mdp5_kms *mdp5_kms = get_kms(plane);
 	enum mdp5_pipe pipe = hwpipe->pipe;
 	struct mdp5_hw_pipe *right_hwpipe;
-	const struct mdp_format *format;
+	const struct msm_format *format;
 	uint32_t nplanes, config = 0;
 	struct phase_step step = { { 0 } };
 	struct pixel_ext pe = { { 0 } };
@@ -882,8 +882,8 @@ static int mdp5_plane_mode_set(struct drm_plane *plane,
 	if (WARN_ON(nplanes > pipe2nclients(pipe)))
 		return -EINVAL;
 
-	format = to_mdp_format(msm_framebuffer_format(fb));
-	pix_format = format->base.pixel_format;
+	format = msm_framebuffer_format(fb);
+	pix_format = format->pixel_format;
 
 	src_x = src->x1;
 	src_y = src->y1;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
index b4bebb425d22..3a7f7edda96b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
@@ -114,10 +114,10 @@ static void set_fifo_thresholds(struct mdp5_smp *smp,
  * presumably happens during the dma from scanout buffer).
  */
 uint32_t mdp5_smp_calculate(struct mdp5_smp *smp,
-		const struct mdp_format *format,
+		const struct msm_format *format,
 		u32 width, bool hdecim)
 {
-	const struct drm_format_info *info = drm_format_info(format->base.pixel_format);
+	const struct drm_format_info *info = drm_format_info(format->pixel_format);
 	struct mdp5_kms *mdp5_kms = get_kms(smp);
 	int rev = mdp5_cfg_get_hw_rev(mdp5_kms->cfg);
 	int i, hsub, nplanes, nlines;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
index 21732ed485be..1be9832382d7 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
@@ -74,7 +74,7 @@ void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p,
 		   struct mdp5_global_state *global_state);
 
 uint32_t mdp5_smp_calculate(struct mdp5_smp *smp,
-		const struct mdp_format *format,
+		const struct msm_format *format,
 		u32 width, bool hdecim);
 
 int mdp5_smp_assign(struct mdp5_smp *smp, struct mdp5_smp_state *state,
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 30919641c813..5fc55f41e74f 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -63,26 +63,24 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 };
 
 #define FMT(name, a, r, g, b, e0, e1, e2, e3, alpha, tight, c, cnt, fp, cs, yuv) { \
-		.base = {                                        \
-			.pixel_format = DRM_FORMAT_ ## name,     \
-			.flags = yuv ? MSM_FORMAT_FLAG_YUV : 0,  \
-		},                                               \
+		.pixel_format = DRM_FORMAT_ ## name,             \
 		.bpc_a = BPC ## a ## A,                          \
-		.bpc_r = BPC ## r,                               \
-		.bpc_g = BPC ## g,                               \
-		.bpc_b = BPC ## b,                               \
-		.unpack = { e0, e1, e2, e3 },                    \
+		.bpc_r_cr = BPC ## r,                            \
+		.bpc_g_y = BPC ## g,                             \
+		.bpc_b_cb = BPC ## b,                            \
+		.element = { e0, e1, e2, e3 },                   \
+		.fetch_type = fp,                                \
+		.chroma_sample = cs,                             \
 		.alpha_enable = alpha,                           \
 		.unpack_tight = tight,                           \
-		.cpp = c,                                        \
 		.unpack_count = cnt,                             \
-		.fetch_type = fp,                                \
-		.chroma_sample = cs,                             \
+		.bpp = c,                                        \
+		.flags = yuv ? MSM_FORMAT_FLAG_YUV : 0,          \
 }
 
 #define BPC0A 0
 
-static const struct mdp_format formats[] = {
+static const struct msm_format formats[] = {
 	/*  name      a  r  g  b   e0 e1 e2 e3  alpha   tight  cpp cnt ... */
 	FMT(ARGB8888, 8, 8, 8, 8,  1, 0, 2, 3,  true,   true,  4,  4,
 			MDP_PLANE_INTERLEAVED, CHROMA_FULL, false),
@@ -141,9 +139,9 @@ const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
 {
 	int i;
 	for (i = 0; i < ARRAY_SIZE(formats); i++) {
-		const struct mdp_format *f = &formats[i];
-		if (f->base.pixel_format == format)
-			return &f->base;
+		const struct msm_format *f = &formats[i];
+		if (f->pixel_format == format)
+			return f;
 	}
 	return NULL;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.h b/drivers/gpu/drm/msm/disp/mdp_format.h
index b1f199d4a079..6443d53954ee 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.h
+++ b/drivers/gpu/drm/msm/disp/mdp_format.h
@@ -20,10 +20,38 @@ enum msm_format_flags {
 #define MSM_FORMAT_FLAG_DX		BIT(MSM_FORMAT_FLAG_DX_BIT)
 #define MSM_FORMAT_FLAG_COMPRESSED	BIT(MSM_FORMAT_FLAG_COMPRESSED_BIT)
 
+/**
+ * struct msm_format: defines the format configuration
+ * @pixel_format: format fourcc
+ * @element: element color ordering
+ * @fetch_type: how the color components are packed in pixel format
+ * @chroma_sample: chroma sub-samplng type
+ * @alpha_enable: whether the format has an alpha channel
+ * @unpack_tight: whether to use tight or loose unpack
+ * @unpack_align_msb: unpack aligned to LSB or MSB
+ * @unpack_count: number of the components to unpack
+ * @bpp: bytes per pixel
+ * @flags: usage bit flags
+ * @num_planes: number of planes (including meta data planes)
+ * @fetch_mode: linear, tiled, or ubwc hw fetch behavior
+ * @tile_height: format tile height
+ */
 struct msm_format {
 	uint32_t pixel_format;
+	enum mdp_bpc bpc_g_y, bpc_b_cb, bpc_r_cr;
+	enum mdp_bpc_alpha bpc_a;
+	u8 element[4];
+	enum mdp_fetch_type fetch_type;
+	enum mdp_chroma_samp_type chroma_sample;
+	bool alpha_enable;
+	u8 unpack_tight;
+	u8 unpack_align_msb;
+	u8 unpack_count;
+	u8 bpp;
 	unsigned long flags;
+	u8 num_planes;
 	enum mdp_fetch_mode fetch_mode;
+	u16 tile_height;
 };
 
 #define MSM_FORMAT_IS_YUV(X)		((X)->flags & MSM_FORMAT_FLAG_YUV)
diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h b/drivers/gpu/drm/msm/disp/mdp_kms.h
index b6e68a343336..a2d5af5c65e5 100644
--- a/drivers/gpu/drm/msm/disp/mdp_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
@@ -78,19 +78,6 @@ void mdp_irq_update(struct mdp_kms *mdp_kms);
  * pixel format helpers:
  */
 
-struct mdp_format {
-	struct msm_format base;
-	enum mdp_bpc bpc_r, bpc_g, bpc_b;
-	enum mdp_bpc_alpha bpc_a;
-	uint8_t unpack[4];
-	bool alpha_enable, unpack_tight;
-	uint8_t cpp, unpack_count;
-	enum mdp_fetch_type fetch_type;
-	enum mdp_chroma_samp_type chroma_sample;
-};
-#define to_mdp_format(x) container_of(x, struct mdp_format, base)
-#define MDP_FORMAT_IS_YUV(mdp_format) (MSM_FORMAT_IS_YUV(&(mdp_format)->base))
-
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
 
 /* MDP capabilities */

-- 
2.39.2


