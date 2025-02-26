Return-Path: <linux-arm-msm+bounces-49509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1F7A45F5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A94F8165E18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E617C219308;
	Wed, 26 Feb 2025 12:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m2ocKLYj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CFC2163AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740573239; cv=none; b=ut00vpgtHldLwVCJhT9Yz7UmVsPs3B3gsFaOM/5zK1ox01zBMGBOdflmEq8t/s3RJdK28xzoqRS/eO21++5wKq9a0zvBVmqrgNNSGLaxPr2FkvrLkykinM/IK6zo/IZEluG3WRxBJtccQjtxR5KsQA04UL0ua+aTz8fki8X0T7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740573239; c=relaxed/simple;
	bh=AfzDCzWE61/RiHp3arR4nrjqrt9najhrZrp7qskeOcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wr9BD5fKpAFblJxb3y8DgTGjqGlqAvEhYFQojGOLvoGZ9XC4N0pnW8DmAt8h5kuYtHBYq5JnFzJ5kYI7CyRx3MzcNn2OI3yjWmvrXLZB7QuNesbwmF7wuLjD62Zev7x1WHE4Dd3nN/Mb9xOPlBrcYJLseixoiduA6oh9ThhvAHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m2ocKLYj; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fbfa8c73a6so13171584a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 04:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740573237; x=1741178037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iP8OZkcuS6exm7vZyYBnerJLmEEFA+57WDXglQPLxM=;
        b=m2ocKLYjJKl18D7NCKcjFp9st1++2Wtadn3XWc0hp7HDR6W37Bi1oQvsYzgN0eOBzd
         WLP8owbe+vQVhQtioDL3so67czsDnaNiU7IKyCJ07hHVwUpaSJMKDex+q/inRQ2FOj3k
         fQ6c3SL7GF3NL+GkpzKFX21i8nvP4fWgtZpgpxA5/GQhvf6zqCDJBJGY2gZCZOWJdUl/
         8pMPlrM8I0BzlYLhBVF7Biv5FsTmSMtIrFd2SLQRG8B/VoKtiouddwqTV8TVaBGQ/RYL
         MCkmJLF/PIu1fShZCdk6yzRg8wUZZgpzQ65RJzsSvJSES3sRMdUhOx4QthtU08F6Cigi
         HvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740573237; x=1741178037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iP8OZkcuS6exm7vZyYBnerJLmEEFA+57WDXglQPLxM=;
        b=jg65RQ3Rrir8aAnJT1/SlndTzX8MOSgGgDZ3Hw6T9WFT33FDkGSw+Tqm7L1W35Wvio
         +AwviY3ciBXFcZTvkD3snR5iEtvmLT8Au/hbSinZ7mOr7Vb7wuQaR6nj2R8WezrZvOjC
         iAgHCZvX4uD0DtqzqYVmzSd0y6kTQH/8o7tdVRbrTYfnyUHIjcqzB7P3JHiBISwxfCZ3
         e4g6R1xcHiSsHc8nX+8QUuEloRrjZuC4lchtWGfS4quvqgzaGlSlsxvYnmN8dtnjVnpM
         AsoS/AI8MKnq9hMpIUtatqq2UZ1SOeMugpzxIm+QMk0xTXRQlPEU4nUYVpry38SW0yFr
         y12Q==
X-Gm-Message-State: AOJu0YwSRj80NJxx1XwKL5vMvzwXi7HBJdgvMs3QQnHEXTLhLSo6zigI
	aIxxcDWie6TvIz0eGzoPy8d5OqQYV6hsmAUNirzTep48AyZOY0qf3udNfsPcqPlViXCrD0AJ/v7
	szDLEGiDc
X-Gm-Gg: ASbGncvFimTWRqcWM/+NEuLXe0kGW0lgsXCNSoiiJKkMCi9MWLUShxYq7Kq0RmhAj9P
	rynHwEiy5d2XYNTU8/0eqjQM5Nqgih69uZ2P+KXwDmFOUNFgNS8ej+OFAWRF9JWaXrtfb2h+sar
	BxIGzz/jymi06fhtZ/qeL5IgtVTJDgjN51zme7zYEYEcgtZOKdP/iY55nfKeHqIFDDQ10WAHUmt
	DoDDEPt9tC4FvP9rhs0GDy4nwIYiLjoXJcY/hB0xCEOOHuc20xINOmfFonlfYGg2db6NPZKZ8Pw
	iVWxsqSh8HQ2tiV4jybNSU8=
X-Google-Smtp-Source: AGHT+IFszgvLiJWfa+wYqOxFTnqZSeEGBpni9e6FRIXlXgfgCcHY7CCFgHpi7Jpv05DR2zQ0K1tN+g==
X-Received: by 2002:a17:90b:548f:b0:2ee:5958:828 with SMTP id 98e67ed59e1d1-2fce86adf6cmr37102419a91.9.1740573237310;
        Wed, 26 Feb 2025 04:33:57 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 04:33:56 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:31:03 +0800
Subject: [PATCH v7 14/15] drm/msm/dpu: support plane splitting in quad-pipe
 case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-14-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=8117;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=AfzDCzWE61/RiHp3arR4nrjqrt9najhrZrp7qskeOcw=;
 b=Fa8B2QmM4H5DG8oUt+TL7FC2MI9Nb/SLt+ty9ByIeGuozXhNv77cv6W5n00odcJiPdkAT3zv6
 pvC3f8f5oMsBx5w7yLqCBimcQGNSUJDMdEIesLOXvFf+Nv7JwzuCFYM
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

The content of every half of screen is sent out via one interface in
dual-DSI case. The content for every interface is blended by a LM
pair in quad-pipe case, thus a LM pair should not blend any content
that cross the half of screen in this case. Clip plane into pipes per
left and right half screen ROI if topology is quad pipe case.

The clipped rectangle on every half of screen is futher handled by two
pipes if its width exceeds a limit for a single pipe.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 134 +++++++++++++++++++++---------
 1 file changed, 94 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d1d6c91ed0f8e1c62b757ca42546fbc421609f72..39e3126d7b5f64ea3dabe341f366cd3c4298d303 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -831,8 +831,12 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	struct dpu_sw_pipe_cfg *pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_sw_pipe_cfg init_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
+	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	uint32_t max_linewidth;
+	u32 num_lm;
+	int stage_id, num_stages;
 
 	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
 	max_scale = MAX_DOWNSCALE_RATIO << 16;
@@ -855,13 +859,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	/* move the assignment here, to ease handling to another pairs later */
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-	/* state->src is 16.16, src_rect is not */
-	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+	num_lm = dpu_crtc_get_num_lm(crtc_state);
 
-	pipe_cfg->dst_rect = new_plane_state->dst;
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src);
 
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
@@ -886,35 +887,91 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	drm_rect_rotate(&pipe_cfg->src_rect,
+	drm_rect_rotate(&init_pipe_cfg.src_rect,
 			new_plane_state->fb->width, new_plane_state->fb->height,
 			new_plane_state->rotation);
 
-	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
-	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
-		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
+	/*
+	 * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
+	 * configs for left and right half screen in case of 4:4:2 topology.
+	 * But we may have 2 rect to split wide plane that exceeds limit with 1
+	 * config for 2:2:1. So need to handle both wide plane splitting, and
+	 * two halves of screen splitting for quad-pipe case. Check dest
+	 * rectangle left/right clipping first, then check wide rectangle
+	 * splitting in every half next.
+	 */
+	num_stages = (num_lm + 1) / 2;
+	/* iterate mixer configs for this plane, to separate left/right with the id */
+	for (stage_id = 0; stage_id < num_stages; stage_id++) {
+		struct drm_rect mixer_rect = {stage_id * mode->hdisplay / num_stages, 0,
+					(stage_id + 1) * mode->hdisplay / num_stages,
+					mode->vdisplay};
+		int cfg_idx = stage_id * PIPES_PER_STAGE;
+
+		pipe_cfg = &pstate->pipe_cfg[cfg_idx];
+		r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
+
+		drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+		pipe_cfg->dst_rect = new_plane_state->dst;
+
+		DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
+				" vs clip window " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect),
+				DRM_RECT_ARG(&mixer_rect));
+
+		/*
+		 * If this plane does not fall into mixer rect, check next
+		 * mixer rect.
+		 */
+		if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
+					  &pipe_cfg->dst_rect,
+					  &mixer_rect)) {
+			memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe_cfg));
+
+			continue;
 		}
 
-		*r_pipe_cfg = *pipe_cfg;
-		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
-		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
-		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
-		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
-	} else {
-		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
-	}
+		pipe_cfg->dst_rect.x1 -= mixer_rect.x1;
+		pipe_cfg->dst_rect.x2 -= mixer_rect.x1;
+
+		DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RECT_ARG(&pipe_cfg->dst_rect));
 
-	drm_rect_rotate_inv(&pipe_cfg->src_rect,
-			    new_plane_state->fb->width, new_plane_state->fb->height,
-			    new_plane_state->rotation);
-	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
-		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
-				    new_plane_state->fb->width, new_plane_state->fb->height,
+		/* Split wide rect into 2 rect */
+		if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
+		     _dpu_plane_calc_clk(mode, pipe_cfg) > max_mdp_clk_rate) {
+
+			if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
+				DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+						DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+				return -E2BIG;
+			}
+
+			memcpy(r_pipe_cfg, pipe_cfg, sizeof(struct dpu_sw_pipe_cfg));
+			pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
+			pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
+			r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
+			r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
+			DPU_DEBUG_PLANE(pdpu, "Split wide plane into:"
+					DRM_RECT_FMT " and " DRM_RECT_FMT "\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect),
+					DRM_RECT_ARG(&r_pipe_cfg->src_rect));
+		} else {
+			memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_cfg));
+		}
+
+		drm_rect_rotate_inv(&pipe_cfg->src_rect,
+				    new_plane_state->fb->width,
+				    new_plane_state->fb->height,
 				    new_plane_state->rotation);
 
+		if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
+			drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+					    new_plane_state->fb->width,
+					    new_plane_state->fb->height,
+					    new_plane_state->rotation);
+	}
+
 	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
 
 	return 0;
@@ -954,20 +1011,17 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 		drm_atomic_get_new_plane_state(state, plane);
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
-	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
-	int ret = 0;
-
-	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
-					  &crtc_state->adjusted_mode,
-					  new_plane_state);
-	if (ret)
-		return ret;
+	struct dpu_sw_pipe *pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	int ret = 0, i;
 
-	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
+		pipe = &pstate->pipe[i];
+		pipe_cfg = &pstate->pipe_cfg[i];
+		if (!pipe->sspp)
+			continue;
+		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
+		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
 						  &crtc_state->adjusted_mode,
 						  new_plane_state);
 		if (ret)

-- 
2.34.1


