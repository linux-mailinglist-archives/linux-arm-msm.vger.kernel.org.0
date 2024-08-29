Return-Path: <linux-arm-msm+bounces-29984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B719641CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 382FB1F24CF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B4018FDA3;
	Thu, 29 Aug 2024 10:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yszldzv5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06801B531C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926917; cv=none; b=ScVbUy8LtWPRbvyLmj5sFpU2cD+6+JKMjvEq3f9Zl/6eZxIE2qwQY7YOsPvQuIHi3ks/De3CQcAwgJIY0culSUQkrHoS6S35J3ZSgHs7uSxekGvmaQ1GaQ1rC+O1reNbaOsCREfmgaywTfkqeP5dfj09lK2poOu6oScvlYcYaPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926917; c=relaxed/simple;
	bh=I2ikWc1eRtSUuiI5dMozrl26pLTUFuNNmccuZxgTX/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uLa2N2mA17cQ7384A8V6RQVpbLm/m3LClMEyEPlwKjkoz4fruowOQDe3eGPvt1B0u9jmOB383KRXQ7ucIHO3FWVo1UG2/tiA9CoiaKtt15chiYdt18Ajk7NOICmN0MrjVgqb5XJl/QKtCGHmbKnpcTMseButhgUe4pgd27GyJSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yszldzv5; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-70df4b5cdd8so329344a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926915; x=1725531715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjSRyqv5jrIYe8oPavf5LS4RSFZl2p6GWK9ZKbwfHc8=;
        b=Yszldzv56j/QtWeclmslDbcFGyIVxrWpYnysPGBaE5+uL6u3xTfpbZ4jSksSLZvRp6
         UEozmouVNH4G2InmhCrcFp1/JB/Bkc4H1va41POGs2KoOfI921LpJNKq7MgpE8u0naSJ
         ezsn8Sw4gzOuAfNzJEE4Pk5132ZyN3EN6Mz64hOczrEslCUnwxZbemuhZ4QKx2BnRZRn
         97Uz3cqDPnmyb+UkQHEoHFgTzPT0RKdaipeDpPNbD2UCHIBfFH5PlyXBnyh2xA1oic20
         oWY0HtmqcnLJua2xd3vFT8tDvfwyasceXZZ9UYQRAUD3KN+KjfJeB1S9Oh0zdHl7hIAN
         a6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926915; x=1725531715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjSRyqv5jrIYe8oPavf5LS4RSFZl2p6GWK9ZKbwfHc8=;
        b=KUh7D+k3NMIWXNpXeeaGWGtI6LGbwUMGJiwAFp1bLY/HKbJgSOWI7QZzYA8ocmixtN
         ygpEjLcytpcezQMvZXWLkEawba5DskV78woEAVglISFd7tPlM1xlD54vLCUWI3zBlKPR
         sqtHu1M/cti6jcLCyKlJxHw1qhTyH0Dfwn3CY75VqBl+Vpn5wFiVfKbrVCxpqVmPCFOK
         aDMnUid6o8WqVbqyJWVejr0JkLVX1QlrreWANAgtsWPlK/ynCf8k1GjI4zI+FBZmuuKV
         LqRmQ4dlG6o1TD9QWV49+FPyZzSCGMvg68sIgx49LI8f6FUcrsYieCv6W7xSGL7a2hKd
         XAYg==
X-Gm-Message-State: AOJu0YwVq5LbwQNhNwBWUOrGzTSM34ipWkXsVujRa1w3Vg9tD8svsFdB
	xWMiQKLB79xmyyH4sz7uWVHD0gmt5thDGDyqbllfj3vfcpZ6iUOWFMVLi5cQRHI=
X-Google-Smtp-Source: AGHT+IE2sJ3gi89U+R396+pQnENMpP6DHjXJOwnchnVnRwY/yHsyKlwnhI9BSt207Nf8HMmhG8zfoA==
X-Received: by 2002:a05:6358:5290:b0:1a4:e0d7:8418 with SMTP id e5c5f4694b2df-1b603cb59camr263194455d.23.1724926914779;
        Thu, 29 Aug 2024 03:21:54 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:21:54 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:49 +0800
Subject: [PATCH 20/21] drm/msm/dpu: support quad pipe in general operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-20-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=6316;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=I2ikWc1eRtSUuiI5dMozrl26pLTUFuNNmccuZxgTX/s=;
 b=g1ueGL+TskNovQN/ZmNbHnb4EnXyhtPQROMxAonDNcj33RLavysgr4YjvXEtoRtODVlZTDTOu
 ri0JLuEDoopAWdVl6yM+GqV8v0lMF2vxjXlmgS/oWdM+hPzHzfuBURB
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Support quad pipe in general operations with unified method.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 87 +++++++++++++++++--------------
 1 file changed, 47 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c38c1bedd40fb..c3ea97b4ce439 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -619,6 +619,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	struct msm_drm_private *priv = plane->dev->dev_private;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
+	int i;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
@@ -632,12 +633,11 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		return;
 
 	/* update sspp */
-	_dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
-				   fill_color, fmt);
-
-	if (pstate->r_pipe.sspp)
-		_dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg.dst_rect,
-					   fill_color, fmt);
+	for (i = 0; i < PIPES_PER_STAGE; i++)
+		if (pstate->pipe[i].sspp)
+			_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
+						   &pstate->pipe_cfg[i].dst_rect,
+						   fill_color, fmt);
 }
 
 static int dpu_plane_prepare_fb(struct drm_plane *plane,
@@ -1279,8 +1279,11 @@ void dpu_plane_flush(struct drm_plane *plane)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
 	else {
-		dpu_plane_flush_csc(pdpu, &pstate->pipe);
-		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
+		int i;
+
+		for (i = 0; i < PIPES_PER_STAGE; i++)
+			if (pstate->pipe_cfg[i].visible)
+				dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
 	}
 
 	/* flag h/w flush complete */
@@ -1380,20 +1383,17 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
 	bool is_rt_pipe;
 	const struct msm_format *fmt =
 		msm_framebuffer_format(fb);
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	struct msm_gem_address_space *aspace = kms->base.aspace;
 	struct dpu_hw_fmt_layout layout;
 	bool layout_valid = false;
-	int ret;
+	int ret, i;
 
 	ret = dpu_format_populate_layout(aspace, fb, &layout);
 	if (ret)
@@ -1412,28 +1412,28 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
 			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
-	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
-				   drm_mode_vrefresh(&crtc->mode),
-				   layout_valid ? &layout : NULL);
-
-	if (r_pipe->sspp) {
-		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
-					   drm_mode_vrefresh(&crtc->mode),
-					   layout_valid ? &layout : NULL);
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		if (pstate->pipe_cfg[i].visible && pstate->pipe[i].sspp)
+			dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
+						   &pstate->pipe_cfg[i], fmt,
+						   drm_mode_vrefresh(&crtc->mode),
+						   layout_valid ? &layout : NULL);
 	}
 
 	if (pstate->needs_qos_remap)
 		pstate->needs_qos_remap = false;
 
-	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt,
-						    &crtc->mode, pipe_cfg);
-
-	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
-
-	if (r_pipe->sspp) {
-		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, r_pipe_cfg);
+	pstate->plane_fetch_bw = 0;
+	pstate->plane_clk = 0;
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		pipe_cfg = &pstate->pipe_cfg[i];
+		if (pipe_cfg->visible) {
+			pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
+								    &crtc->mode, pipe_cfg);
 
-		pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
+			pstate->plane_clk = max(pstate->plane_clk,
+						_dpu_plane_calc_clk(&crtc->mode, pipe_cfg));
+		}
 	}
 }
 
@@ -1441,17 +1441,21 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe *pipe;
+	int i;
 
-	trace_dpu_plane_disable(DRMID(plane), false,
-				pstate->pipe.multirect_mode);
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		pipe = &pstate->pipe[i];
+		if (pipe->multirect_index == DPU_SSPP_RECT_1) {
+			trace_dpu_plane_disable(DRMID(plane), false,
+						pstate->pipe[i - 1].multirect_mode);
 
-	if (r_pipe->sspp) {
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 
-		if (r_pipe->sspp->ops.setup_multirect)
-			r_pipe->sspp->ops.setup_multirect(r_pipe);
+			if (pipe->sspp && pipe->sspp->ops.setup_multirect)
+				pipe->sspp->ops.setup_multirect(pipe);
+		}
 	}
 
 	pstate->pending = true;
@@ -1607,14 +1611,17 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	int i;
 
 	if (!pdpu->is_rt_pipe)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable);
-	if (pstate->r_pipe.sspp)
-		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable);
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		if (!pstate->pipe_cfg[i].visible)
+			break;
+		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
+	}
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 #endif

-- 
2.34.1


