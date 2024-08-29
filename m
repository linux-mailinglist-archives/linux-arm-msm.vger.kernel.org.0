Return-Path: <linux-arm-msm+bounces-29977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F379641B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 350E51F215DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A3D18CC16;
	Thu, 29 Aug 2024 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WUluBwWQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD84F1B3725
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926866; cv=none; b=UAa6fsM71DjoIliFdQs2rhWoWiKRLzFE+pgoBEVP4+8A9lbjaQiLiN/iFfslBPqAR6Knvx3Iuj178n3wmG7J0E6/xmWpTo5nQBvSUk/SGZiw0z8P/H8MH/w/02vr7gofRr9fr1H2rGmwfbGLzZwHP5j02pKSSKITeBIz9IMheaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926866; c=relaxed/simple;
	bh=7i2tZ6lsHlQvWtNNIv33X2jDrdBkZS2b+kzYUWO0fMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJoG2mVsXMw2+kbMB0SUnx+BNpTsH50j1xulvZaE118ObukDELYLP/7JCovzOFqfHm5M/EabQpXxYHzy5D+c3IEyALbD7i/JT3341EPR1OKkq/dbFMJhpta+hcVmcWOdJNd0NQmg9dsqhWjoEZ3FuWFWcWsv0UQ2J9BpLPx5IfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WUluBwWQ; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7093c94435bso152791a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926864; x=1725531664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0J6gfSiKm4ic0mw9uPw89ZXyvCtsR339YQWgX+0uvc=;
        b=WUluBwWQuKl3L7zihiyNF+8srfOxSXs+Poyn6oa/M+Pj3r6SFeQhvlI9lFPQ4soNYX
         btnPK2shJvaR0XpyGTA1cCiCrPlFm/7FyiGUNMenelPJPsushoB93raU53+nngMzgrBC
         cmPnfkgp6MBjiU3HUD2MBF0FQH3Yqo6vDlt51Pum7OxLlnpVxoiYmMZh9hovgHRtAU0l
         AA6azOfR62SH0t/1KcQXrYl+IKMeP8OMcKQ+EHP3VzqoSSN9eP+Lpol+QHfvEyZGVNTp
         sawi4/uRM5xEP7DBLjcEdAOOPWvmbHolPrMAefC5SZCmP8XkvtIcE9U1997EpCZu+G8q
         4w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926864; x=1725531664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0J6gfSiKm4ic0mw9uPw89ZXyvCtsR339YQWgX+0uvc=;
        b=qnZIAgtonCoWFQNnb3TeS22HeL0MYj+tOyCWPhafAluqGpoz9EZV5KTcZGuNfnQ6J8
         7bN/ctarOFUSlBTT0Hh5pf81VqlBnqperYvDNTrOGKOwt7XzDxhjiK3AUdcEXnAY/cdR
         UomGvAWETjJA2usk+lqlAYk0VGFlb3rNmUgPDpo/1Wuag1Ebh1hEYn5CTkTMcvhyjZoM
         CRKIkiTdo5YfBrJxAP+FdU31h/dP1+khvoyaS9+wRVmN3T/VGCYIeG8JKidqACTMTsT0
         Wdyld7araaG1RB3ByRfJEX0JPuQFd3FhD+I2lAkRgHhz2VGPsMBr+x8aAEKa5Hp3TewO
         ioFg==
X-Gm-Message-State: AOJu0YzKaXHxJq48HbJCMipQrftlQMYNWg7Ae689MaDEh9IKtFb1K5Qs
	iWJ67tiiUb6U3GvQ15RCJ4JsvVpfKqNdc4DVBTwcm0qKZn4AEFDD77KXDB1jk2c=
X-Google-Smtp-Source: AGHT+IEYeU8b0tKShp/1tqe/umI4hz9GnzhkBvnni3VPNx3JknLCkXdWH7K2aDAgRImHXjGCDUx1wg==
X-Received: by 2002:a05:6359:4c83:b0:1b5:a037:f238 with SMTP id e5c5f4694b2df-1b603a23841mr290344855d.0.1724926863890;
        Thu, 29 Aug 2024 03:21:03 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:21:03 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:43 +0800
Subject: [PATCH 14/21] drm/msm/dpu: Support quad-pipe in SSPP checking
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-14-bdb05b4b5a2e@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=6676;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=7i2tZ6lsHlQvWtNNIv33X2jDrdBkZS2b+kzYUWO0fMI=;
 b=C6t5JxSLHz+r3FxGXyme5vAaHho61+PC/rRPPm+gGMljnzAh5OkDyqUlIUQJKDLPB5ANtLE6L
 1Q7bIVmclZrBssFJaeh+hTvIJjBVyUs/Yjv5HDdU8jFVZlVYwrE8yD5
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Support quad-pipe in SSPP checking with unified method

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 108 ++++++++++++++----------------
 1 file changed, 51 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4df7cfed4d230..78bf8f0292f62 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -738,12 +738,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 		struct dpu_sw_pipe *pipe,
 		struct dpu_sw_pipe_cfg *pipe_cfg,
-		const struct msm_format *fmt,
-		const struct drm_display_mode *mode)
+		const struct drm_display_mode *mode,
+		struct drm_plane_state *new_plane_state)
 {
 	uint32_t min_src_size;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
+	const struct msm_format *fmt;
+	uint32_t supported_rotations;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
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
+	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
+
+	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
+		supported_rotations |= DRM_MODE_ROTATE_90;
+
+	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
+						   supported_rotations);
 
 	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
@@ -886,8 +914,7 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	return 0;
 }
 
-static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
-						   struct dpu_sw_pipe_cfg *pipe_cfg,
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
 						   const struct msm_format *fmt,
 						   uint32_t max_linewidth)
 {
@@ -916,49 +943,19 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 		drm_atomic_get_new_plane_state(state, plane);
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	const struct msm_format *fmt;
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps;
-	const struct dpu_sspp_sub_blks *sblk;
-	int ret = 0;
-
-	pipe_hw_caps = pipe->sspp->cap;
-	sblk = pipe->sspp->cap->sblk;
-
-	/*
-	 * We already have verified scaling against platform limitations.
-	 * Now check if the SSPP supports scaling at all.
-	 */
-	if (!sblk->scaler_blk.len &&
-	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
-	      drm_rect_width(&new_plane_state->dst)) ||
-	     (drm_rect_height(&new_plane_state->src) >> 16 !=
-	      drm_rect_height(&new_plane_state->dst))))
-		return -ERANGE;
-
-	fmt = msm_framebuffer_format(new_plane_state->fb);
-
-	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
-
-	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
-		supported_rotations |= DRM_MODE_ROTATE_90;
-
-	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
-						   supported_rotations);
-	r_pipe_cfg->rotation = pipe_cfg->rotation;
-
-	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
-					  &crtc_state->adjusted_mode);
-	if (ret)
-		return ret;
+	struct dpu_sw_pipe *pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	int ret = 0, i;
 
-	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
-						  &crtc_state->adjusted_mode);
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		pipe = &pstate->pipe[i];
+		pipe_cfg = &pstate->pipe_cfg[i];
+		if (!pipe_cfg->visible || !pipe->sspp)
+			break;
+		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
+		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
+						  &crtc_state->adjusted_mode,
+						  new_plane_state);
 		if (ret)
 			return ret;
 	}
@@ -975,10 +972,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
+	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
 	const struct drm_crtc_state *crtc_state = NULL;
 
 	if (new_plane_state->crtc)
@@ -1033,13 +1030,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 			return -E2BIG;
 		}
 
-		/*
-		 * Use multirect for wide plane. We do not support dynamic
-		 * assignment of SSPPs, so we know the configuration.
-		 */
 		pipe->multirect_index = DPU_SSPP_RECT_0;
 		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
+		r_pipe->sspp = pipe->sspp;
 		r_pipe->multirect_index = DPU_SSPP_RECT_1;
 		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 	}
@@ -1056,7 +1050,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		drm_atomic_get_old_plane_state(state, plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
 	struct drm_crtc_state *crtc_state;
-	int ret;
+	int ret, i;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1071,8 +1065,8 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		 * resources are freed by dpu_crtc_assign_plane_resources(),
 		 * but clean them here.
 		 */
-		pstate->pipe.sspp = NULL;
-		pstate->r_pipe.sspp = NULL;
+		for (i = 0; i < PIPES_PER_STAGE; i++)
+			pstate->pipe[i].sspp = NULL;
 
 		return 0;
 	}

-- 
2.34.1


