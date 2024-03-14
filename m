Return-Path: <linux-arm-msm+bounces-14052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEC887B58E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92B26B22FC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5A38F6C;
	Thu, 14 Mar 2024 00:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NzELtxjK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3115CBD
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374544; cv=none; b=PPUd6rS+MKXcIO1qSZavV64jS3Y4JGJwmxwdlbWTzN1uh8mBMOhrBQi1LdAUVt9rG5hUBCTtncpsr+LGrrdV/NDuPiYQWkGDmhrM60EyIwf57x98aKVvSFzk5KIyuTd8GY9ez5ZHWCs1p1yIK1hOZx0ZWHv9Z7v1h0NRUTGsT30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374544; c=relaxed/simple;
	bh=+3QJuMwow+uAlv7JD46FjiD1VCz+STvRq5i3ATCqbhQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GUOZh47MZBEY3LXZl/6VQ9WJsX1lNh7wtLFe7A25Q/IjsQHPuk0s8QrvuZ1MqpWZFxoEQ+7Fkz/ksiW/hui+z05cptOWvb516R8dMx2cMAyeUWsMx2Of+kpgJvGSiPRZo67uHCS7O0SIVq3nN6OpktUNI2WPykhdOhIEE6vTzv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NzELtxjK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-513173e8191so642637e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374540; x=1710979340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XNr6KKW37IazWI0ZJpFV5pkj9zPRMLRzsCadh2vfcc=;
        b=NzELtxjKm1ULRYMl+6R8eUVh9/L5SIWmOkVeMECK1BxWjqaahWccMKlrCyJvxTI2Li
         hsy5T1etm/3c7tNUMdqS6ZR2Lg6FMBntKfWy2FtBSATARcUaVqf3OY5ryjmPsgElpDZI
         /3DrybYUS9TF4BbkeiDXGMsE68z9BPVBytyEyw/FWqJjVclBfgbU8rfX5yhsiB8uD9hh
         QYkEHU2D22KCl/s2C6kjip6HhkEfxMGfl8Po47JUVDSqj7G3ZjUK+HZ8EIhJsjTRNpkG
         8134m0CgQh4jR1pVH2xNV5UmhWPBqAkCsyVtMHSvGnTcDGJKm88Qc8LOXKgEU6YWstgW
         GBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374540; x=1710979340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XNr6KKW37IazWI0ZJpFV5pkj9zPRMLRzsCadh2vfcc=;
        b=e/kkFhxJVq+We617a7neU2e7g0xuvf8gRa/tuOaHM15zZcAP3a8VTcnVis0Mvzm5q1
         F/5JirWZpChKzPkDv+qSbuGQsmJUE0qQ95E0LKv/5Rz+yZduqCJwoCJoO3mHlV5KNgTh
         r5l/aXDJjAl5TOcVqPkXEcXNx1+TPrFdTpHecCWxZSFsYoEZZQ9iy2y/ZbZo3DhoLdkA
         3rK6zba/Ja2KTxDrhWD/tktJXiLXjVR2Ytp7JoSpXmf22yEu2y9+vXney7cRtD5sUG+v
         F0Y1R6tC4osUdyRtWDyv2x546jx8SSRQmIzH5NJnRzUPLMcPcbCelEWi8QqHej1m700H
         jD7w==
X-Forwarded-Encrypted: i=1; AJvYcCVj7i+jOK6P5xy6T7YCJZxS77z9i1PafCU0sKZJ57Is5FSpZWXSPRuERorMBVxynQ0M+m3WvzMb1dehes8pEo3KVvh8Z1vGpRzO+fcBtA==
X-Gm-Message-State: AOJu0YzlxsR1fR/RDczmk5tCNq7TZGJndffn9ys4aXbBWMOLqVLDuqaa
	aYnsKsxgp8+DL9ILY8yNYbYrkWgecfl+Bg6Arwt7QwuC+O0GM7RsZXl7pO7Z+48=
X-Google-Smtp-Source: AGHT+IGMZ6cQE2t+Zj2q16bpR1SktpXUJO2yjIiNo+IjHXUThHSVFo6j+i9y23ceYGZIyS/MkUo/RA==
X-Received: by 2002:ac2:5b45:0:b0:513:c429:c04e with SMTP id i5-20020ac25b45000000b00513c429c04emr38800lfp.33.1710374540483;
        Wed, 13 Mar 2024 17:02:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 17:02:20 -0700 (PDT)
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
Subject: [PATCH v4 03/13] drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check
Date: Thu, 14 Mar 2024 02:02:06 +0200
Message-Id: <20240314000216.392549-4-dmitry.baryshkov@linaro.org>
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

In preparation for virtualized planes support, move pstate->pipe
initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
case of virtual planes the plane's pipe will not be known up to the
point of atomic_check() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 26 +++++++++++------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9c52fe3c0261..70d6a8989e1a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -795,6 +795,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	const struct drm_crtc_state *crtc_state = NULL;
@@ -805,13 +806,22 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	uint32_t max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
-	const struct dpu_sspp_sub_blks *sblk = pstate->pipe.sspp->cap->sblk;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
+	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	r_pipe->sspp = NULL;
+
+	if (!pipe->sspp)
+		return -EINVAL;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
 	min_scale = FRAC_16_16(1, sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
@@ -828,7 +838,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->sspp = NULL;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
@@ -1292,7 +1301,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	if (!plane) {
 		DPU_ERROR("invalid plane\n");
@@ -1314,16 +1322,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
-	/*
-	 * Set the SSPP here until we have proper virtualized DPU planes.
-	 * This is the place where the state is allocated, so fill it fully.
-	 */
-	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-	pstate->r_pipe.sspp = NULL;
-
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
 
-- 
2.39.2


