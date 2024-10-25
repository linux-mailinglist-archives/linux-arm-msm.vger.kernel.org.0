Return-Path: <linux-arm-msm+bounces-35757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C76E09AF61C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 02:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B9DAB22128
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 00:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D78A1369A8;
	Fri, 25 Oct 2024 00:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JkEmuG3s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90DBB673
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 00:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729815627; cv=none; b=SZpPHxIUZmdfSjQ/X1U/oQUPzkH6Ic1u8ushFx4uNt+Mihf71OGNazV62Pn5pS6Q8VAUPLdctJuupu3EyaEPT3m+/u39wbwJ840P38n+oPipY8N6puE3A3zlj3RRQ9VBgTgYrydaiyvqNt3c3nkyKP/T+oVYWrMVj6No6JsPbmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729815627; c=relaxed/simple;
	bh=+rSm0xbjyQOWKxEArZ7JwwHMnZNApSRY3kaipRjNhm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OzHGo/qjw0eLIkaLJYlinEXgV/eviTZ/b8s6GS7j30/E+/FSXNM98JdJfcHe4obQcLaHu7ngGL0x5I7fgYj34ut7F1zTR0xhddkQw+sDpeUGmiw9Bnjr0ejJODU+Ft/MPCV3FWJuNgnSrNP8umupmOt9mDmBuoZWIUYfAjgmLD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JkEmuG3s; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so24007741fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 17:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729815623; x=1730420423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55baPHwlF5W88gPxRBMo/BOg95J3bwmagnnq5/7srw0=;
        b=JkEmuG3se3vt3x3WRceqep2t5gQiqFCO/szyPEX5TjyUF/V+ucgRa6nzlYxyEkLwKz
         uLr7WGaj/XByfs1+mUvx6ea6bMfLN45EflxFKUCy+khHkTCjtdxKx7Mtak/fReY4Nfpt
         1DdfS9T4d57s0XOQvlYiTFJeI4/AsvCCUcHYKEkZpezIqf/mKweEOe8Cxo6fmHE8ky5r
         GHpdv3UCMTQZqyVB5l6d26cVimvv0dXUpzBn8x7FKYGolKBtYGlKtrGUiuqA2Wey3cnm
         3T0MrN2TwQxyqUQImYlaffO6FF9qwfVcxDJ4avv2vwKIsP+21Flfv3jBA0UCSjTlDq8L
         zStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729815623; x=1730420423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55baPHwlF5W88gPxRBMo/BOg95J3bwmagnnq5/7srw0=;
        b=SvVBigCTx9oGfFfTm9luuD+x9QJEnoXrqXo2vRxZHrWRvaaRdKdUasMKnbC1fWG3Ny
         bWvzyuWujVZnHo4yAFwlZtnOEKQ/vHzv4yM4wQ9oOxUW0M9cRLhN8tYNQZs9vp9YsCuf
         TsiYFqy5CZB6zscwshOOKH+9zLwGvHStUFF2uyhuKdE8NGXvCyHVOULIX41MjcKjML9r
         154SodqhNkLIgkRTml54uh8Xzqsen93f3on4BtleSYwsgQ/IsIKbZKf8NK7o2AuB8EGW
         WM/rXywv+mnl7hAW4LXnhO5XWVVUOh8mn8jbajt4yuEZaPRub77OcxhjmAWyt33zUqMG
         VOag==
X-Gm-Message-State: AOJu0YzOOOghWH11p0Vc/GHMSXKNLWEIINJfjRdzJ6XxH2qaZrNtznEq
	UrOP7mCbenHMPbuUmkle9CSa968urwZFicFefE4xVVwKmQN2g8mrjSh9xobRgGE=
X-Google-Smtp-Source: AGHT+IGoJguiFG9G4Wc/5WP+YFmbiCp0o9EGCn135J/0HMe5Vn8rcqaKyZR2tZtA4djECcAEL2KYow==
X-Received: by 2002:a05:6512:6d1:b0:539:f1d2:725b with SMTP id 2adb3069b0e04-53b236c8d5fmr1240063e87.4.1729815622717;
        Thu, 24 Oct 2024 17:20:22 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1b05b3sm6227e87.161.2024.10.24.17.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:20:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 03:20:12 +0300
Subject: [PATCH v6 5/9] drm/msm/dpu: split dpu_plane_atomic_check()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-dpu-virtual-wide-v6-5-0310fd519765@linaro.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
In-Reply-To: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9791;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+rSm0xbjyQOWKxEArZ7JwwHMnZNApSRY3kaipRjNhm0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnGuQ6xICphr3p0KsuRoF8RtMUMiUK+n+REHf81
 HCvrmA92ceJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxrkOgAKCRCLPIo+Aiko
 1XdIB/9W4o/DsUOsuWzEKpZB4pHEtTM/x5Tud0H45o2674jdTZU6dTDcVno5GgxvVWJwtc//CZ1
 ZgcxfAYNQC+jc1nlxHCaqmzgRUYSI4Y63czescpD643UcU/+Jk4snPhDaSol+foh4rNkd2l4FKI
 qlwFcXlkTR535nL2xl4X4z0eCKzx1ndHekeVdUGEbw2UYnr2s4KnRMLr6fnOeBTE+bN6en8QKO/
 8fVILY2+1Hdu7wzII3728KEqshi8Awwv4O32MpuaWnCIP3QTCCSqEXw8BvmhS188aG/S4PAVqkC
 8D/tgFqA3epnBmrnFDm3XRaxxI2b4F/Us9tIaCXOAm5Swcc2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Split dpu_plane_atomic_check() function into two pieces:

dpu_plane_atomic_check_nosspp() performing generic checks on the pstate,
without touching the associated SSPP blocks,

and

dpu_plane_atomic_check_sspp(), which takes into account used SSPPs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 178 +++++++++++++++++++-----------
 1 file changed, 112 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 8a9e8a430da7..a5f29851361f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -780,49 +780,22 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 #define MAX_UPSCALE_RATIO	20
 #define MAX_DOWNSCALE_RATIO	4
 
-static int dpu_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_atomic_state *state)
+static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
+					 struct drm_plane_state *new_plane_state,
+					 const struct drm_crtc_state *crtc_state)
 {
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
-										 plane);
 	int i, ret = 0, min_scale, max_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	const struct drm_crtc_state *crtc_state = NULL;
-	const struct msm_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
 	uint32_t max_linewidth;
-	unsigned int rotation;
-	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps;
-	const struct dpu_sspp_sub_blks *sblk;
-
-	if (new_plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   new_plane_state->crtc);
-
-	pipe->sspp = dpu_rm_get_sspp(&kms->rm, pdpu->pipe);
-	r_pipe->sspp = NULL;
 
-	if (!pipe->sspp)
-		return -EINVAL;
-
-	pipe_hw_caps = pipe->sspp->cap;
-	sblk = pipe->sspp->cap->sblk;
-
-	if (sblk->scaler_blk.len) {
-		min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
-		max_scale = MAX_DOWNSCALE_RATIO << 16;
-	} else {
-		min_scale = DRM_PLANE_NO_SCALING;
-		max_scale = DRM_PLANE_NO_SCALING;
-	}
+	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
+	max_scale = MAX_DOWNSCALE_RATIO << 16;
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
@@ -835,11 +808,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
-	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
 		DPU_ERROR("> %d plane stages assigned\n",
@@ -873,8 +841,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
 			return -E2BIG;
 
-	fmt = msm_framebuffer_format(new_plane_state->fb);
-
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
 	drm_rect_rotate(&pipe_cfg->src_rect,
@@ -883,6 +849,78 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
 	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
+		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		*r_pipe_cfg = *pipe_cfg;
+		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
+		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
+		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
+		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
+	} else {
+		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
+	}
+
+	drm_rect_rotate_inv(&pipe_cfg->src_rect,
+			    new_plane_state->fb->width, new_plane_state->fb->height,
+			    new_plane_state->rotation);
+	if (r_pipe_cfg->src_rect.x1 != 0)
+		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+				    new_plane_state->fb->width, new_plane_state->fb->height,
+				    new_plane_state->rotation);
+
+	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
+
+	return 0;
+}
+
+static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
+				       struct drm_atomic_state *state,
+				       const struct drm_crtc_state *crtc_state)
+{
+	struct drm_plane_state *new_plane_state =
+		drm_atomic_get_new_plane_state(state, plane);
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	const struct msm_format *fmt;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	uint32_t max_linewidth;
+	unsigned int rotation;
+	uint32_t supported_rotations;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
+	int ret = 0;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
+	/*
+	 * We already have verified scaling against platform limitations.
+	 * Now check if the SSPP supports scaling at all.
+	 */
+	if (!sblk->scaler_blk.len &&
+	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
+	      drm_rect_width(&new_plane_state->dst)) ||
+	     (drm_rect_height(&new_plane_state->src) >> 16 !=
+	      drm_rect_height(&new_plane_state->dst))))
+		return -ERANGE;
+
+	fmt = msm_framebuffer_format(new_plane_state->fb);
+
+	max_linewidth = pdpu->catalog->caps->max_linewidth;
+
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
+					  &crtc_state->adjusted_mode);
+	if (ret)
+		return ret;
+
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
 		/*
 		 * In parallel multirect case only the half of the usual width
 		 * is supported for tiled formats. If we are here, we know that
@@ -896,12 +934,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 			return -E2BIG;
 		}
 
-		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
-		}
-
 		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
 		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
 		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
@@ -923,26 +955,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		r_pipe->multirect_index = DPU_SSPP_RECT_1;
 		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
-		*r_pipe_cfg = *pipe_cfg;
-		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
-		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
-		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
-		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
-	}
-
-	drm_rect_rotate_inv(&pipe_cfg->src_rect,
-			    new_plane_state->fb->width, new_plane_state->fb->height,
-			    new_plane_state->rotation);
-	if (r_pipe->sspp)
-		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
-				    new_plane_state->fb->width, new_plane_state->fb->height,
-				    new_plane_state->rotation);
-
-	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt, &crtc_state->adjusted_mode);
-	if (ret)
-		return ret;
-
-	if (r_pipe->sspp) {
 		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
 						  &crtc_state->adjusted_mode);
 		if (ret)
@@ -965,11 +977,45 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	}
 
 	pstate->rotation = rotation;
-	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
 
 	return 0;
 }
 
+static int dpu_plane_atomic_check(struct drm_plane *plane,
+				  struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	int ret = 0;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	const struct drm_crtc_state *crtc_state = NULL;
+
+	if (new_plane_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   new_plane_state->crtc);
+
+	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	r_pipe->sspp = NULL;
+
+	ret = dpu_plane_atomic_check_nosspp(plane, new_plane_state, crtc_state);
+	if (ret)
+		return ret;
+
+	if (!new_plane_state->visible)
+		return 0;
+
+	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
+}
+
 static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
 {
 	const struct msm_format *format =

-- 
2.39.5


