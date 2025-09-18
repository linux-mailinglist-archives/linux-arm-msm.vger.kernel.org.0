Return-Path: <linux-arm-msm+bounces-74086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4FDB84D60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 15:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BBA24635F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 13:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A76D30DEDC;
	Thu, 18 Sep 2025 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xsySChoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C48630DD07
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202204; cv=none; b=PVF3+wJ0snugpRv+BbTOshMsvn3qsCxvdVq3FmpHov/6dEfEeRj2Scl/U11ljwIhUkie1l14AbryTlRV6SS4viL7NVOHIBju3Z5lXTFVtA+YoKh8LI8933DPs/u6PwFJutlDU+VW4hXT2nvHawM4Duf8VxYUkGQHvyFe6rFI+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202204; c=relaxed/simple;
	bh=IMK9b6P4nH/sbOwYa1izZSO6XJxBhmZkzCMlozKqHvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lpnaqn8kobYyL+hojkE5my4+YyJ6psb+KL/mLlW2hoJqF9FOfg2t/H7PsEMcsZVW7PLpUZHpNM3tLQ0AepzjBrivgvV6CTfrb+dHfiw4bOQpSnKEhOlQjgp+9Wf2CRg1Ipccwyqu/ciga2UmB3qLmQ6IH9ENB4bvdbwlCqcvk9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xsySChoZ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77ccb67f8e5so1095444b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758202201; x=1758807001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2oZHlAvcoUkHQ0Bzr9GFhLbEfBYpM0FqElwWTZuqNc=;
        b=xsySChoZYuwY41bL+zvAjTm0D5YIL4T+H2FQdlTCXLeEkCxrlYOmXBouYWEYIaeoPI
         Opj9Io4U+EJ2ylfqHUIUUtRUnpbtycj0ZszbK4h55wFPTUKnVV7zX1Rf5LGX1rd+fY6h
         Qv9URXWGtcJVT7vZbNDcKlkUm+niGwne0usW0ejrIntjgAq11vKS2rdS5WiIkUzyWx7a
         4Q98iAnAc6BTErRAD3H4dYDnINvLOR1jM9j4woYR62yi+pt9ih6BYNX3b3f2p31jZ3nd
         0VkY1aKjPdS0xMh98cAJ1iUAQr3UM6byjOp7Xh3LrR6lU/LGXAQ7YmRpt2BMTlmxd/T2
         UF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758202201; x=1758807001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2oZHlAvcoUkHQ0Bzr9GFhLbEfBYpM0FqElwWTZuqNc=;
        b=uvAnWTkzdFPpFkiJ2fWx8tSLKXakXZZVdaDFodXixPXVFzMNlDCJe0tcnh5lQcCktY
         y4bpKkJFM11X0liPHqcIcHFpSNMYZSsLnWMKa0Xg7GKcJz5cKPZ7XT4/ItYYUBvBZo2J
         Hts8NynpQH+023a6PCp4T7a/yaTGg+CvXOmlfEJ82Wf+EB5fwQ6cCGfaluxyEHUuMN52
         BAP9QxbWvPBJvcY/GrnnuP18sSjVPevcnN41oQ54DYDX14Qw+8XPr+vL9z8DyrG+sMTM
         d2V3LAF2s7YhAz29OmbUGVbkb47VMmkZce5WnbQqFZh5YiaIvXJX1wZbXBvX49zH/2Xs
         wcAg==
X-Gm-Message-State: AOJu0YxbGcXiDr6JFr5TuTR4uBpbhgftYjYloDfffhkk/HDfTUUVqm4N
	39L2hsab80hwxzKYC4XevgxfoxcFBobwHV8Wl6sURpyk+4ahtdMhZ1pL+xM8FH7Wjfw=
X-Gm-Gg: ASbGnctPKr9i805mEaPww+XSJUP7LHQ67HW4z5u4g+J0sJZ5WPzDk8gG2efNFThf4Ea
	fP2Z0cEuf0ZNdDdseJ8KwScWiIDDPo9VwVwP8Bn+iMFZ+VpSunWUpQSH4Uc8m9MU1dY+2hN4hVW
	8hirLHRfVIXQ43UlCIOKVs2GJK8UnwKZTDwcq6ntZiZm236PqgVzXWWhc0+P2RFKPQu0bWZ0ShL
	8WY/T3jyDhKhId/0bhPvntaLt/ypE1yMLoa5Gub2i4ibP92e8c1QlcEFGCdkqUXm1yXJ/k3VgJg
	PUsrQqDA59erYvAIfsWX0GNUf4/ZTvNnBa2Wq4FHnqTqDHCJVfBxu/XQQkoTi3Hb3JwObCntrhG
	Dcmo0axI/w52zlnpdnFz8TKF7tCt6hnfO4ks=
X-Google-Smtp-Source: AGHT+IGMJIusS/aui/WhdE/as7v6bANvfJB/hoc8iJ21ugTFcRJrjfFoSWIgt1gBfnBMptpQDHnhNA==
X-Received: by 2002:a05:6a20:3d8a:b0:243:a190:149c with SMTP id adf61e73a8af0-27aa3088790mr9685052637.27.1758202201471;
        Thu, 18 Sep 2025 06:30:01 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35cc76sm2331479a12.10.2025.09.18.06.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:30:01 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Sep 2025 21:29:00 +0800
Subject: [PATCH v16 08/10] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-8-ff6232e3472f@linaro.org>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758202147; l=9526;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=IMK9b6P4nH/sbOwYa1izZSO6XJxBhmZkzCMlozKqHvY=;
 b=y1bfdmDH3c2Hz5fB9VqExkRGo7NNRvl5JWV/Z2zZKLVM3VQCPe455ETxBxor2UFICohv2zMfW
 q5rHQDwZRyRBKzFtf5NnXakEbh/moW2mGTV2x/oyW1jI14IJK3ZnNgp
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 150 ++++++++++++++++++------------
 1 file changed, 89 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 0be3eeb5edf0c14efb20eec02ba17e072fa2c829..5ae58352cbee1251a0140879f04fc7c304cae674 100644
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


