Return-Path: <linux-arm-msm+bounces-63888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92477AFABC0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 08:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5AC817A317
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 06:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEEA13A3F7;
	Mon,  7 Jul 2025 06:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VThpdO7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7941279DDA
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 06:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869155; cv=none; b=ViN1GC0UG5REt9CRJTTzZtO9esEvCaEAWLUZIrCu8NUyTJ6jUIErHLDVyRenCM3kcRkZ23W3sLJEdzJ5mjdaQawGMIqRIwvV0nxnC3hFDvzqu0bLgU//ZSoi6rtuofXQ4c7wNkiLbYfcAwLfLxoRO6VKcnp3f+YAyAxhCMX75uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869155; c=relaxed/simple;
	bh=ap+2nA3vCpiUHkKg9Lzcj2185wHlDPqznO6jDAEkMDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J4I+k+r0wY92C7f/VpeVRndqs541RTyw8ISkJ2FW+I+wR61vRq4t6N2Ls6kV6Z1e2vfcfHzcE9uZ1McBwQKrKLx1ZE1Z01q7GIWxIux5USvWJE9WxaWph9x5C2BahoBpqIKUjaGgcxORbodzaZmwyzmiKVRaVPTuF7Tbsn9sPBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VThpdO7s; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7494999de5cso1575449b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 23:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751869153; x=1752473953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLYcyDGUwVs1TCnZ4fAtjKxYxhC0Keb+hEw8chsCJnQ=;
        b=VThpdO7sKJJvekMbDph1irOKKvlP7tFczWjF3PcKWEUAYlHtTkPVCMg1D6HkQGfIFw
         OAm/8Ng+WvQAAFhee9prGnBYABYLMMpdX90Qt/9YDI+uSaPPHxmz4aRlx2Gj1Ic3g+DG
         wwI33e6DlEXvj2hEF5OZGBjiuPa2TE5/p9F5CR0Mo6B+fyTiPjuOE01GbonlApvahvM8
         hsRI/dwDX32k7MO79ShTryCog1Fgrj0npd4jGTlIfBWeOQ9nyqqGcf3DQUeCV7m4HBS4
         lbFtgKUHSw40nzGIbCeam+blsAv5JCWpfP9ptUuLYLkJ89F8xhG3d1xpu9UvnMVBpfYw
         w5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869153; x=1752473953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLYcyDGUwVs1TCnZ4fAtjKxYxhC0Keb+hEw8chsCJnQ=;
        b=aeVtYqjSEHwo6CYUi5lN7xfISR+gZVG/LPrwpjwxcnGBj2JhpRxOG4wVF4NoqzPlQb
         PBOqdFLMnQm86Y7hck/dZH5wfsxjd4isctF1sn1olHHzEvpyXa2L6glW10seMewkj/8I
         orfCrhFdXGvFgaaZhShQe+32e4IGkLhSCOkM5aeU/lc9Qk5qDkfi7Cymldch8ZRt9S5I
         Ro1Dy3Gn99ZzUA7O5UwdCPGePp0v06dTNbtHNZa/OuC39pOt8LM2KLJ3j9rkU0plvDGY
         JJqU0W35J9VEpxn/quPiWSoqQqWGhqj/mm4KlKCyibFiqY3GjpBn3dQMOmm7oeQg+OMJ
         mgKw==
X-Gm-Message-State: AOJu0Yx45HFTQA5Q4HZSX88QXVzjaCSq4x+wALI30kvk28WckEE1AtIh
	JJFMaXUN+Qjz1LIMdfV49XEqaLJwNKweI1xfZlDa+BpmegX5YcOSy2CVx7hGAMrKOt4=
X-Gm-Gg: ASbGnctrDgBYUSFLT6YiY2Z8RjyASHkfK/W467YMLbX6CSiP7alEg9+PuhFM30umiUh
	IP6WVQTiHr+HCJTd/TllNsC9tlx1psMm9xid3Bco61PZS1VEcPE8YP6wt7fWy14H6UNMz29qy75
	LLyASkgZTcg0aCMp5xDW8AySLjZGGiXEGXUgnGKwHv9F1SM2M4ZDgyTc0Yd1aPmMv89UMy1/71J
	BV+V0TA0zzcqH7HcuE4yPM9pR8b8J4yBs7eZmbT/7QMxUpaMh6ytpxf34dW+SXoEiyu63k1VJLH
	GnYB21oGIGaKKEvwBqGrBRizQXnkpF2TsSsqoC+1k9LKE+AazcNnlkrZFfbKOEWkabEZxg==
X-Google-Smtp-Source: AGHT+IFtcelwxhw3FHDRK7684pBDurkGqoprst0CYk6b0hnfJQOsi3R8cWrDWZPkY1XoZJAYaEnyfw==
X-Received: by 2002:a05:6a20:a113:b0:220:967d:c822 with SMTP id adf61e73a8af0-2271eccd34amr12034381637.3.1751869153219;
        Sun, 06 Jul 2025 23:19:13 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:19:12 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:18:05 +0800
Subject: [PATCH v12 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-10-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=8448;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=ap+2nA3vCpiUHkKg9Lzcj2185wHlDPqznO6jDAEkMDg=;
 b=WdjAtTQ/uEqcUgnvz4I9409D0A7XE7RG/DditYh1d3IOwvSIkG95L/eVetDcAR+JQKJXuYmPc
 7ftE8nLspCUA/w0l5/ZyutRuvx/QN7jdcRHqA3YXiMRzcKfFMhwZfQ8
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 143 +++++++++++++++++++-----------
 1 file changed, 89 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 149e7066480b07f9f6d422748d89ffd6f9416f33..ecfebf7a2406d65930075cc2a4b8a8a7d40b3d3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -954,6 +954,30 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
 }
 
+static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
+				      struct dpu_sw_pipe **single_pipe,
+				      struct dpu_sw_pipe_cfg **single_pipe_cfg,
+				      int *stage_index)
+{
+	int stage_idx, pipe_idx, i, valid_pipe = 0;
+
+	for (stage_idx = 0; stage_idx < STAGES_PER_PLANE; stage_idx++) {
+		for (i = 0; i < PIPES_PER_STAGE; i++) {
+			pipe_idx = stage_idx * PIPES_PER_STAGE + i;
+			if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0) {
+				valid_pipe++;
+				if (valid_pipe > 1)
+					return false;
+
+				*single_pipe = &pstate->pipe[pipe_idx];
+				*single_pipe_cfg = &pstate->pipe_cfg[pipe_idx];
+				*stage_index = stage_idx;
+			}
+		}
+	}
+
+	return valid_pipe == 1;
+}
 
 static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 				       struct drm_atomic_state *state,
@@ -1021,18 +1045,23 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 					  const struct msm_format *fmt,
 					  uint32_t max_linewidth)
 {
-	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
-	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
-	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
-	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
+	struct dpu_sw_pipe *pipe, *prev_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
 	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
+	int stage_index, prev_stage_index;
 	u16 max_tile_height = 1;
 
-	if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
+	if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, &stage_index))
+		return false;
+
+	if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pipe,
+				       &prev_pipe_cfg, &prev_stage_index) ||
 	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
 		return false;
 
+	if (stage_index != prev_stage_index)
+		return false;
+
 	if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
 	    !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
 		return false;
@@ -1043,11 +1072,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
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
@@ -1176,6 +1200,44 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
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
+	if (drm_rect_width(&pipe_cfg->src_rect) != 0) {
+		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
+		if (!pipe->sspp)
+			return -ENODEV;
+	}
+
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+	    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+					      pipe->sspp,
+					      msm_framebuffer_format(plane_state->fb),
+					      dpu_kms->catalog->caps->max_linewidth)) {
+		goto stage_assinged;
+	}
+
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
+		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
+		if (!r_pipe->sspp)
+			return -ENODEV;
+		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	}
+
+stage_assinged:
+	return 0;
+}
+
 static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
@@ -1188,11 +1250,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_rm_sspp_requirements reqs;
 	struct dpu_plane_state *pstate, *prev_adjacent_pstate;
 	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	const struct msm_format *fmt;
-	int i;
+	int i, stage_id, ret;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1202,11 +1262,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	prev_adjacent_pstate = prev_adjacent_plane_state ?
 		to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
 
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1220,44 +1275,24 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
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
-
-			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
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
+	if (prev_adjacent_pstate &&
+	    dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
+					    dpu_kms->catalog->caps->max_linewidth)) {
+		goto assigned;
+	}
 
-			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-		}
+	for (stage_id = 0; stage_id < STAGES_PER_PLANE; stage_id++) {
+		pipe = &pstate->pipe[stage_id * PIPES_PER_STAGE];
+		pipe_cfg = &pstate->pipe_cfg[stage_id * PIPES_PER_STAGE];
+		ret = dpu_plane_assign_resource_in_stage(pipe, pipe_cfg,
+							 plane_state,
+							 global_state,
+							 crtc, &reqs);
+		if (ret)
+			return ret;
 	}
 
+assigned:
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
 }
 

-- 
2.34.1


