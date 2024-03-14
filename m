Return-Path: <linux-arm-msm+bounces-14058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC94B87B599
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 453FD1F22CAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4942F52;
	Thu, 14 Mar 2024 00:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zG50xUkI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940FF20EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374549; cv=none; b=aeSyn6appqHnjHyp8AoGLHohclJPgEJm9+cIZ0l7Xoz48Ug8enuYQG6uTR1OzMxS6tOImub1kmdl3Q2zbBcKTojlwCw51ytHzkwmgsYOgsEL/NttcrWvIEk3GrCC2FNfKKMUrcWsQp0hoErkvqJvZRcon0nd0hAjvMX1gS3noYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374549; c=relaxed/simple;
	bh=lui5sL0//8wS1sIzmzf52EzIt+mQozQiUxZheo+n73I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a5M7K9W/imOpsDXzE3dcufRUHT8R4l2MX8hgdclCXAiSlqvZaiHl8JaMkk9XGrrqf3yXh4pW3RMqvLTSMlWjsm4qRD0cNHabOipf5f4YYSHEhUKc5fXcUmkCWyP5uPd205woj50NUwaMAuoSz3h9QGVz0jy+yC6oKSTrH/e51gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zG50xUkI; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-513a81b717cso564033e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374546; x=1710979346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PjrhT6a27c234XDd1UAZn9+fAuU0fdQoiJECkOgv0E=;
        b=zG50xUkIDsNWvMOmrWAk8iN7Iw5HB4pLO6NnOfOmXvrPosxOTdOw8GPnFJaOWWwMjf
         f2Rx35HHKDDEXkank+BEkP8aiVWJE5kkfiY8Us2DwnlDysG1UYstScWTl/lVrxhUhgxf
         4y1EcP/jQ6h/ju7nGMMu22mVC53hjVjvF0dEHotTS3RRms2WPZ25uXVD7jvhvEBxDLiP
         NwDpdm/lHcrnRAHNovqUVDHfv1LjwGOCrmM/n/6xi/EdOPe5j2dVvkPzvdWPux8Q50XW
         k+9eFiuHzJYgXr+z7ZAb0dzk30pPxEqx+Tq0Ng3vd63S4iOXmtIOluYTQIpTPsngFeEn
         iWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374546; x=1710979346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2PjrhT6a27c234XDd1UAZn9+fAuU0fdQoiJECkOgv0E=;
        b=kq7p2zzexLhD+CbTcbkfVFKEb1KiBxuNj5d1MiUt/T40II2ufE5eTanK9ODNwkqqQw
         TnBRqtqvRIUOJXPn6MmPtJBS5ze1h9TZFYU2jmnrFth79iBjkWrwD46ecqRLTjSURy7m
         2P+FzHUmRa4k5QR68CfYXiqfzbzzWG/zSbF5t//91vRh8WbcKujxVD4lqRvAu7UdDaLy
         oJ2UgAJ9ahoIMH29GS4dvX/fXGG2SgO6XvNgKOON5Im9NkAcmo3dreCrHGa5PzKdsn4p
         gi/SqAiHDLnjZzVj2AwnbzKIZA9w8B/atuMJBTc+O22xG90RjvSZoiguL5GgtGDduZ9x
         0zDw==
X-Forwarded-Encrypted: i=1; AJvYcCWWmAsnx/cSCjU2RpJj8gs3LRm4MkDN4C4a+g6mFzeIc2fa/FV9fTHr9fkTsIe+PEAYko2jnqk/QN2wBW7Fre2OIEo2BmthBnieufLpNg==
X-Gm-Message-State: AOJu0YyvelXndaQ2TSsrZDk8J8MXvrRZhBjfQeBVOsoVQCDwOlvp1p8A
	odg2q0VpaY08MZjLdQSb3toePYnAQy98UPHDnrM0fMZRij7LPsILk3jGTk8sKzx4C7O4vTB2O8S
	W
X-Google-Smtp-Source: AGHT+IGuKR8qVbwIuDszsiEvTR2T5e9+glIc5undJ9V4gEe8zTE7KxKSDhoXQT50ghsOysn7iVRtxw==
X-Received: by 2002:a19:5f54:0:b0:513:cf61:6847 with SMTP id a20-20020a195f54000000b00513cf616847mr43488lfj.22.1710374545873;
        Wed, 13 Mar 2024 17:02:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 17:02:25 -0700 (PDT)
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
Subject: [PATCH v4 09/13] drm/msm/dpu: allow using two SSPP blocks for a single plane
Date: Thu, 14 Mar 2024 02:02:12 +0200
Message-Id: <20240314000216.392549-10-dmitry.baryshkov@linaro.org>
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

Virtual wide planes give high amount of flexibility, but it is not
always enough:

In parallel multirect case only the half of the usual width is supported
for tiled formats. Thus the whole width of two tiled multirect
rectangles can not be greater than max_linewidth, which is not enough
for some platforms/compositors.

Another example is as simple as wide YUV plane. YUV planes can not use
multirect, so currently they are limited to max_linewidth too.

Now that the planes are fully virtualized, add support for allocating
two SSPP blocks to drive a single DRM plane. This fixes both mentioned
cases and allows all planes to go up to 2*max_linewidth (at the cost of
making some of the planes unavailable to the user).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 172 ++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   8 +
 2 files changed, 131 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 2961b809ccf3..cde20c1fa90d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -886,6 +886,28 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	return 0;
 }
 
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
+						   struct dpu_sw_pipe_cfg *pipe_cfg,
+						   const struct dpu_format *fmt,
+						   uint32_t max_linewidth)
+{
+	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
+	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
+		return false;
+
+	if (pipe_cfg->rotation & DRM_MODE_ROTATE_90)
+		return false;
+
+	if (DPU_FORMAT_IS_YUV(fmt))
+		return false;
+
+	if (DPU_FORMAT_IS_UBWC(fmt) &&
+	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
+		return false;
+
+	return true;
+}
+
 static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 					struct drm_atomic_state *state,
 					const struct drm_crtc_state *crtc_state)
@@ -899,7 +921,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 	const struct dpu_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	uint32_t max_linewidth;
 	uint32_t supported_rotations;
 	const struct dpu_sspp_cfg *pipe_hw_caps;
 	const struct dpu_sspp_sub_blks *sblk;
@@ -919,15 +940,8 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 	      drm_rect_height(&new_plane_state->dst))))
 		return -ERANGE;
 
-	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
 	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
 
-	max_linewidth = pdpu->catalog->caps->max_linewidth;
-
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
 
 	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
@@ -943,41 +957,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 		return ret;
 
 	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		/*
-		 * In parallel multirect case only the half of the usual width
-		 * is supported for tiled formats. If we are here, we know that
-		 * full width is more than max_linewidth, thus each rect is
-		 * wider than allowed.
-		 */
-		if (DPU_FORMAT_IS_UBWC(fmt) &&
-		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
-		}
-
-		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
-		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
-		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
-		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
-		    pipe_cfg->rotation & DRM_MODE_ROTATE_90 ||
-		    DPU_FORMAT_IS_YUV(fmt)) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
-		}
-
-		/*
-		 * Use multirect for wide plane. We do not support dynamic
-		 * assignment of SSPPs, so we know the configuration.
-		 */
-		pipe->multirect_index = DPU_SSPP_RECT_0;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
-
-		r_pipe->sspp = pipe->sspp;
-		r_pipe->multirect_index = DPU_SSPP_RECT_1;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
-
 		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
 						  &crtc_state->adjusted_mode);
 		if (ret)
@@ -998,16 +977,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	const struct drm_crtc_state *crtc_state = NULL;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	if (pdpu->pipe != SSPP_NONE) {
-		pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-		r_pipe->sspp = NULL;
-	}
+	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	r_pipe->sspp = NULL;
 
 	if (!pipe->sspp)
 		return -EINVAL;
@@ -1019,6 +998,52 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
+	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
+		uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
+		const struct dpu_format *fmt;
+
+		fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+
+		/*
+		 * In parallel multirect case only the half of the usual width
+		 * is supported for tiled formats. If we are here, we know that
+		 * full width is more than max_linewidth, thus each rect is
+		 * wider than allowed.
+		 */
+		if (DPU_FORMAT_IS_UBWC(fmt) &&
+		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		r_pipe->sspp = pipe->sspp;
+
+		if (!dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) ||
+		    !dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) ||
+		    !(test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
+		      test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		/*
+		 * Use multirect for wide plane. We do not support dynamic
+		 * assignment of SSPPs, so we know the configuration.
+		 */
+		pipe->multirect_index = DPU_SSPP_RECT_0;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		r_pipe->multirect_index = DPU_SSPP_RECT_1;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+	}
+
 	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
 }
 
@@ -1053,10 +1078,18 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 
 	format = to_dpu_format(msm_framebuffer_format(plane_state->fb));
 
-	/* force resource reallocation if the format of FB has changed */
-	if (pstate->saved_fmt != format) {
+	/* force resource reallocation if the format of FB or src/dst have changed */
+	if (pstate->saved_fmt != format ||
+	    pstate->saved_src_w != plane_state->src_w ||
+	    pstate->saved_src_h != plane_state->src_h ||
+	    pstate->saved_src_w != plane_state->src_w ||
+	    pstate->saved_crtc_h != plane_state->crtc_h) {
 		crtc_state->planes_changed = true;
 		pstate->saved_fmt = format;
+		pstate->saved_src_w = plane_state->src_w;
+		pstate->saved_src_h = plane_state->src_h;
+		pstate->saved_crtc_w = plane_state->crtc_w;
+		pstate->saved_crtc_h = plane_state->crtc_h;
 	}
 
 	return 0;
@@ -1074,7 +1107,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	const struct dpu_format *fmt;
+	uint32_t max_linewidth;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1083,6 +1119,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pstate = to_dpu_plane_state(plane_state);
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
+	pipe_cfg = &pstate->pipe_cfg;
+	r_pipe_cfg = &pstate->r_pipe_cfg;
 
 	pipe->sspp = NULL;
 	r_pipe->sspp = NULL;
@@ -1097,10 +1135,46 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
+	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
+
 	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
 	if (!pipe->sspp)
 		return -ENODEV;
 
+	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
+		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+		r_pipe->sspp = NULL;
+	} else {
+		if (dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
+		    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
+		    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
+		     test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
+			r_pipe->sspp = pipe->sspp;
+
+			pipe->multirect_index = DPU_SSPP_RECT_0;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_1;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+		} else {
+			/* multirect is not possible, use two SSPP blocks */
+			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!r_pipe->sspp)
+				return -ENODEV;
+
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
+	}
+
 	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 15f7d60d8b85..5522f9035d68 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,6 +31,10 @@
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
  * @saved_fmt: format used by the plane's FB, saved for for virtual plane support
+ * @saved_src_w: cached value of plane's src_w, saved for for virtual plane support
+ * @saved_src_h: cached value of plane's src_h, saved for for virtual plane support
+ * @saved_crtc_w: cached value of plane's crtc_w, saved for for virtual plane support
+ * @saved_crtc_h: cached value of plane's crtc_h, saved for for virtual plane support
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -49,6 +53,10 @@ struct dpu_plane_state {
 	bool needs_dirtyfb;
 
 	const struct dpu_format *saved_fmt;
+	uint32_t saved_src_w;
+	uint32_t saved_src_h;
+	uint32_t saved_crtc_w;
+	uint32_t saved_crtc_h;
 };
 
 #define to_dpu_plane_state(x) \
-- 
2.39.2


