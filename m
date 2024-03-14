Return-Path: <linux-arm-msm+bounces-14054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1D687B590
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2675E283770
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89347FD;
	Thu, 14 Mar 2024 00:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h9QDkMRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75A3946F
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374546; cv=none; b=WJ4Z/Mm7vEzuttdB6h8oTqYr3adfmioovbIGsu9Uw4jgL2JWdLXhvMnarFHtsY/s/fNZUiDwGPzYnpkRFU1ZrW/cEKGLoC14UJkGhXcCGbIxpyfWM3Jnu6EL60CV0aVNjkYuDe0jiUeR51mrq7M0EKS149IdKwvM8aJ4L78ZzZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374546; c=relaxed/simple;
	bh=3GY7qKjRqJifsf7UWPXIr+wDQO1rzmwi27+F2JI66kk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a5sYTocDELsK+4FLLL4CmvognRXzMwT3Mcw2SnCQjiKrJWYc6OWXAqalkQKEp3fP+OUtabG/3d7rTU3y/HvldS5Z5DWgJPY8paE98M0yJrrjdARYCub9qp1/r+AyerdDOd1SR0R1ipQ1MpLOA0Mfdj58eOPUkNMa1dlN+5Z0jik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h9QDkMRE; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513c53ed3d8so602911e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374543; x=1710979343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbW5IRvzlbg37aGOBqwcmdzmZ6eMhDw8NOLguxq0OBQ=;
        b=h9QDkMREFWeLFZsLWxaQMJFwtbtGNjIAcselr3XhwUKGc/s6D6B5lBN90a4hlCxd8b
         yBThzRQ5D2i4NsoZtP8IRzDnQSA7Erw66AzwtFpriwx+h6JGkdOhfTe0tqEQ2nsRh0yr
         wo55Gs8Zb+5bCdZehR2oZ8ZgX3gyNWBZPHheW5tCI6SYNbyTkbeKSWvJypfjcau8ts8f
         Gmi103T7NtFyjdMvS28CwpnwKuERsgkdYvWFa8eWfZFOd2x2jlpjmxBbPwUVVWPu4MAV
         pbiJ0m7Y7bSfTEiNfv3J3HaPNa7+kV2v3pV589j187oLYIusU2Ryav3Jnd+lBrAW/g1k
         yGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374543; x=1710979343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbW5IRvzlbg37aGOBqwcmdzmZ6eMhDw8NOLguxq0OBQ=;
        b=aBXiZU8sWhFL4JtqjL9nWV8280uxaH7IXqgQwfh3gYP2NjSovzPurw7XpJ9kxkQUsb
         IDUwdh6JeVZ5MwhOtIZHPE7Ht7B77k8ChUPKx1AQQphrSuL1fwNO5INySeEn7syz0SyU
         EIo/eWFEbg3mWDlmRqKxUaYjVZPVvxwZW9V+o5iLAop2JkqOF8uxbxpuxgerTPJEVt5Q
         92+2lhnxkWpia2L4vlUDOGQiHm9IVhynDR0kovq+N5p6MjYrIw2NWLGDU1GbD7kfldst
         ymq4rwAhs3p4ieUw1CAUPtbDvJHDbWuNtt2YC1BINNmGZ2ASvqCNlW5ahqLGUUlR5vDm
         IM8g==
X-Forwarded-Encrypted: i=1; AJvYcCUuH3GzNCJ0GShK/a3u9pZL1+yOZ4B7A3vheFvl/kKKyVV8mM2HCj2/9M/MvZFjk9NWC113rNxBHfX0SucO2fYHZiuJdi2xZXHG5U6b8w==
X-Gm-Message-State: AOJu0Yw62/SXGzQDTS7wZ56rXRxzwzS+x20J1Q+F2GK1oUsyjvLWDfKr
	XgTlgyxDl1p+ZE9C55dS2BAAqxSn871jMx0hVcVu8rjzh7tI6Ikc1ycm0veRRmU=
X-Google-Smtp-Source: AGHT+IEiIaXzM6guY9lVj9tAa5dx2lwvHcKyXs6W04Sx8VdvE9zXuqtvl2Ap/T8Kog2xgp5nrR8fNA==
X-Received: by 2002:a19:914f:0:b0:513:cff2:fe4e with SMTP id y15-20020a19914f000000b00513cff2fe4emr42255lfj.8.1710374543069;
        Wed, 13 Mar 2024 17:02:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 17:02:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v4 06/13] drm/msm/dpu: split dpu_plane_atomic_check()
Date: Thu, 14 Mar 2024 02:02:09 +0200
Message-Id: <20240314000216.392549-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split dpu_plane_atomic_check() function into two pieces:

dpu_plane_atomic_check_nopipe() performing generic checks on the pstate,
without touching the associated pipe,

and

dpu_plane_atomic_check_pipes(), which takes into account used pipes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 184 ++++++++++++++--------
 1 file changed, 117 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6360052523b5..187ac2767a2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -788,50 +788,22 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 #define MAX_UPSCALE_RATIO	20
 #define MAX_DOWNSCALE_RATIO	4
 
-static int dpu_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_atomic_state *state)
+static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
+					 struct drm_plane_state *new_plane_state,
+					 const struct drm_crtc_state *crtc_state)
 {
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
-										 plane);
 	int ret = 0, min_scale, max_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	const struct drm_crtc_state *crtc_state = NULL;
-	const struct dpu_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
 	uint32_t max_linewidth;
-	unsigned int rotation;
-	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps;
-	const struct dpu_sspp_sub_blks *sblk;
 
-	if (new_plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   new_plane_state->crtc);
-
-	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-	r_pipe->sspp = NULL;
-
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
-		min_scale = 1 << 16;
-		max_scale = 1 << 16;
-	}
+	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
+	max_scale = MAX_DOWNSCALE_RATIO << 16;
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
@@ -844,11 +816,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -872,8 +839,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
-	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
-
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
 	drm_rect_rotate(&pipe_cfg->src_rect,
@@ -882,6 +847,83 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
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
+static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
+					struct drm_atomic_state *state,
+					const struct drm_crtc_state *crtc_state)
+{
+	struct drm_plane_state *new_plane_state =
+		drm_atomic_get_new_plane_state(state, plane);
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	const struct dpu_format *fmt;
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
+	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+
+	max_linewidth = pdpu->catalog->caps->max_linewidth;
+
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
+					  &crtc_state->adjusted_mode);
+	if (ret)
+		return ret;
+
+	if (r_pipe_cfg->src_rect.x1 != 0) {
 		/*
 		 * In parallel multirect case only the half of the usual width
 		 * is supported for tiled formats. If we are here, we know that
@@ -895,12 +937,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -922,26 +958,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -964,11 +980,45 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
+	if (pdpu->pipe != SSPP_NONE) {
+		pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+		r_pipe->sspp = NULL;
+	}
+
+	if (!pipe->sspp)
+		return -EINVAL;
+
+	ret = dpu_plane_atomic_check_nopipe(plane, new_plane_state, crtc_state);
+	if (ret)
+		return ret;
+
+	if (!new_plane_state->visible)
+		return 0;
+
+	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
+}
+
 static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
 {
 	const struct dpu_format *format =
-- 
2.39.2


