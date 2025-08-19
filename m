Return-Path: <linux-arm-msm+bounces-69635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E68DB2B635
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 03:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33111527281
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 01:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135A52459C9;
	Tue, 19 Aug 2025 01:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNzZcKSS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E07F243958
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 01:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755567128; cv=none; b=baWMyy/L/7d9/n70TwE8rsJMOKGP9QH/uAirrl2MLg+cTOsGvg1r37D1L+UfVFk6tmPGnTXCAJpFvjLaiQTo8MiUEsPR7kLyx+3Y9bB7ZJJkLQe3lY79WMmLk+X+kq9ZlIcY30xNrcrLbvbVPmT/j/IxWcRL/vOId9kcfSzM22Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755567128; c=relaxed/simple;
	bh=OhDnd2gXdAgyPEg+bHKAqPslfN0Sae4YKz05SBVvkhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rqgXtzWk2I+WoHRXKBjZ70/UtaSo7Gy43q6R5WzHBU2PwgM8Jz0s29+1za2B0JagMZXgT3sZ/yOpeCdy/dLR+BGAZzVwmL6EbQy1rF2+vCr/dE1XTdhxS8a5ULNJrpiJENoChjfFMIYhSIMPe3bdNyZVa0w6I8vmya8dp6x/Qqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNzZcKSS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2ea94c7cso4135944b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755567125; x=1756171925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeKw6Emxl2MD6KnkTTID2TGYzzL8WokCASiJsQxQ8Ec=;
        b=WNzZcKSS3nyb0+KSBb0f1j4mNAdrBiRXytD9QyQRo6KNk2ey5kiWLu0pYqiyciBzMC
         2uHm9enTz0vuZCBrjP9R58mSd4g0id64Pc1MmS5K578abD1C0iw6QuhiXY+VeqQ6eNz5
         +schcfI3brOmTUYn0vnOLPi0MKevONNHaQ7tAhz5CH8fK/8gKwt6EjdRYHhMxL1XHqRx
         UiIRxkYCEPUSHZeqMEbcJ2WRTR9kSuh8WZLs8NqnzaVAN/emdco5W+4bb3jX28NY0hoZ
         gcqk6Yi8j1LKNH5IgYZCjCg8rxcEDO9T7zIJiV2PJx5Xxe0LLnCF41S0yhiV76gfHbqR
         jtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755567125; x=1756171925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeKw6Emxl2MD6KnkTTID2TGYzzL8WokCASiJsQxQ8Ec=;
        b=ujt28TtLUxFg35MB1gDlTVZLSQR/JhAL+O3K8pvlFO1Gu3P4/oBMuqgzxPjyhrUi98
         +V0MpVa4BZebWoUdmbuAR61T+FWZ8CyY/ktKyh/YLHB8bHs/EYTLImFhJLmcmGNowAIk
         jq/7Y8r/tdjHWuihz2tB7izMNpXvDJeQGsgl5jo4IhuM0WQD3LEa7CHHuN8j/gZH10e/
         D4ObMttiQSPLSOQAYzK21wUYP3S3FCBexmjCaeOemFDk8/IuTqj5LP5ovRGrFKUwQhG1
         RFgc1nw4ZEPWJ9+oiI6DTw33E/zwURZLHbDajPWsQJpsZuvUAo4eR07h95+Ww1oUb4bb
         Wz+Q==
X-Gm-Message-State: AOJu0YxSvBfl9sUOOYO6aBFyo61y9oFUkj83UbcU+CpLQF5ZtALXkr2Q
	Qat3ltTRsRf/QgY4bU1Ny+UJaIKGG8Brt+ETmUNs8+hipWx5jxKixA/erXMTpDBaxDpiHqzNyMV
	HyGDQm6o=
X-Gm-Gg: ASbGncsHJww1QcU+FCiTtbOcE6WyR8OQGyh9wJuP0b+gZTpSDJbJlGKTTB++StiHCcb
	vFkM1NfU1Sa/9cICpYUm07kG4tNvWMx9JGHuUs8Kwts4Q2/pJWT5yQqL6AEdec7n/71wOXAPcaF
	1+/bvTJSOiNPEuWwpMosXA67RReFKkjQwJkwZOr0KhFbVXRvnMkgRdc0YyM9wqa79VJDGDIfyXL
	JLXvKVgjoVESTvK6FFqiGvdEo3tt9wP/4JFQNTonPWNXcAjOPNYN9Rp+4kl23Lqis39psn7HhzE
	jIpbb8CO0uhprsud5XhZ0AekWY02iE2hYyJvx5+te5SMODxwfkEGE2TibuiCmhMVgpSyAlxcT8+
	IZRUBqPpmmjs2mwlRZA==
X-Google-Smtp-Source: AGHT+IE7J+CSWvhgADHldZEJfbvbM0QqU925LggpL67EFlg6inlhgYegZ133Tr9uvDbxkuHOOdBTxg==
X-Received: by 2002:a05:6a20:3ca8:b0:243:78a:828e with SMTP id adf61e73a8af0-2430d4d082bmr1106792637.53.1755567125257;
        Mon, 18 Aug 2025 18:32:05 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 18:32:04 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:31:05 +0800
Subject: [PATCH v15 11/13] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-11-2c7a85089db8@linaro.org>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=9398;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OhDnd2gXdAgyPEg+bHKAqPslfN0Sae4YKz05SBVvkhk=;
 b=chrqfPGrTpPopdrqnD2cPasAzn9ufhKPlKgKwlF6nAA++oPnKy1o3ut1nIIkP0TRjdBUeAi5y
 CmFWimeCk6cCA9CLv2j6kMyUv36dJh6KYla/f/QctSkqtdcQGwlCwH6
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, SSPPs are assigned to a maximum of two pipes. However,
quad-pipe usage scenarios require four pipes and involve configuring
two stages. In quad-pipe case, the first two pipes share a set of
mixer configurations and enable multi-rect mode when certain
conditions are met. The same applies to the subsequent two pipes.

Assign SSPPs to the pipes in each stage using a unified method and
to loop the stages accordingly.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 150 ++++++++++++++++++------------
 1 file changed, 89 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d3db843d324efcda5477a7eac73a8872a55e95e5..99c902dfa7e0256028d294113a3e9bad0e1a0069 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -957,6 +957,23 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
 }
 
+static bool dpu_plane_get_single_pipe_in_stage(struct dpu_plane_state *pstate,
+					       struct dpu_sw_pipe **single_pipe,
+					       struct dpu_sw_pipe_cfg **single_pipe_cfg,
+					       int stage_index)
+{
+	int pipe_idx;
+
+	pipe_idx = stage_index * PIPES_PER_STAGE;
+	if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0 &&
+	    drm_rect_width(&pstate->pipe_cfg[pipe_idx + 1].src_rect) == 0) {
+		*single_pipe = &pstate->pipe[pipe_idx];
+		*single_pipe_cfg = &pstate->pipe_cfg[pipe_idx];
+		return true;
+	}
+
+	return false;
+}
 
 static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 				       struct drm_atomic_state *state,
@@ -1022,17 +1039,20 @@ static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dp
 static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 					  struct dpu_plane_state *prev_adjacent_pstate,
 					  const struct msm_format *fmt,
-					  uint32_t max_linewidth)
+					  uint32_t max_linewidth, int stage_index)
 {
-	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
-	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
-	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
-	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
+	struct dpu_sw_pipe *pipe, *prev_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
 	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
 	u16 max_tile_height = 1;
 
-	if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
+	if (!dpu_plane_get_single_pipe_in_stage(pstate, &pipe,
+						&pipe_cfg, stage_index))
+		return false;
+
+	if (!dpu_plane_get_single_pipe_in_stage(prev_adjacent_pstate,
+						&prev_pipe, &prev_pipe_cfg,
+						stage_index) ||
 	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
 		return false;
 
@@ -1047,11 +1067,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 	if (MSM_FORMAT_IS_UBWC(prev_fmt))
 		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
 
-	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-	r_pipe->sspp = NULL;
-
 	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
 	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
 	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
@@ -1180,36 +1195,69 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
+static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pipe,
+					      struct dpu_sw_pipe_cfg *pipe_cfg,
+					      struct drm_plane_state *plane_state,
+					      struct dpu_global_state *global_state,
+					      struct drm_crtc *crtc,
+					      struct dpu_rm_sspp_requirements *reqs)
+{
+	struct drm_plane *plane = plane_state->plane;
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	struct dpu_sw_pipe *r_pipe = pipe + 1;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = pipe_cfg + 1;
+
+	if (drm_rect_width(&pipe_cfg->src_rect) == 0)
+		return 0;
+
+	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
+	if (!pipe->sspp)
+		return -ENODEV;
+	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0)
+		return 0;
+
+	if (dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+					      pipe->sspp,
+					      msm_framebuffer_format(plane_state->fb),
+					      dpu_kms->catalog->caps->max_linewidth))
+		return 0;
+
+	r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
+	if (!r_pipe->sspp)
+		return -ENODEV;
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	return 0;
+}
+
 static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
 					      struct drm_plane_state *plane_state,
-					      struct drm_plane_state *prev_adjacent_plane_state)
+					      struct drm_plane_state **prev_adjacent_plane_state)
 {
 	const struct drm_crtc_state *crtc_state = NULL;
 	struct drm_plane *plane = plane_state->plane;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
-	struct dpu_plane_state *pstate, *prev_adjacent_pstate;
+	struct dpu_plane_state *pstate, *prev_adjacent_pstate[STAGES_PER_PLANE];
 	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	const struct msm_format *fmt;
-	int i;
+	int i, ret;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   plane_state->crtc);
 
 	pstate = to_dpu_plane_state(plane_state);
-	prev_adjacent_pstate = prev_adjacent_plane_state ?
-		to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
-
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
+	for (i = 0; i < STAGES_PER_PLANE; i++)
+		prev_adjacent_pstate[i] = prev_adjacent_plane_state[i] ?
+			to_dpu_plane_state(prev_adjacent_plane_state[i]) : NULL;
 
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
@@ -1224,42 +1272,24 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
-		if (!prev_adjacent_pstate ||
-		    !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
-						    dpu_kms->catalog->caps->max_linewidth)) {
-			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-			if (!pipe->sspp)
-				return -ENODEV;
-
-			r_pipe->sspp = NULL;
+	for (i = 0; i < STAGES_PER_PLANE; i++) {
+		if (prev_adjacent_pstate[i] &&
+		    dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate[i], fmt,
+						   dpu_kms->catalog->caps->max_linewidth,
+						   i))
+			continue;
 
-			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		if (dpu_plane_get_single_pipe_in_stage(pstate, &pipe, &pipe_cfg, i))
+			prev_adjacent_plane_state[i] = plane_state;
 
-			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-		}
-	} else {
-		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!pipe->sspp)
-			return -ENODEV;
-
-		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-						      pipe->sspp,
-						      msm_framebuffer_format(plane_state->fb),
-						      dpu_kms->catalog->caps->max_linewidth)) {
-			/* multirect is not possible, use two SSPP blocks */
-			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-			if (!r_pipe->sspp)
-				return -ENODEV;
-
-			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-		}
+		pipe = &pstate->pipe[i * PIPES_PER_STAGE];
+		pipe_cfg = &pstate->pipe_cfg[i * PIPES_PER_STAGE];
+		ret = dpu_plane_assign_resource_in_stage(pipe, pipe_cfg,
+							 plane_state,
+							 global_state,
+							 crtc, &reqs);
+		if (ret)
+			return ret;
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
@@ -1272,7 +1302,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			       unsigned int num_planes)
 {
 	unsigned int i;
-	struct drm_plane_state *prev_adjacent_plane_state = NULL;
+	struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLANE] = { NULL };
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];
@@ -1286,8 +1316,6 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 							     prev_adjacent_plane_state);
 		if (ret)
 			break;
-
-		prev_adjacent_plane_state = plane_state;
 	}
 
 	return 0;

-- 
2.34.1


