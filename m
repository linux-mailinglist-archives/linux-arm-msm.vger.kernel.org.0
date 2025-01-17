Return-Path: <linux-arm-msm+bounces-45429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6E3A153A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B411B188B6F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2701119DF62;
	Fri, 17 Jan 2025 16:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwC7IfA2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAD91A2557
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129750; cv=none; b=WqvYITMCmSmrtYLRes/H9HLQg+4lbTgg93g8SZHxA+l2Ckl3SuRE45uitMeNZtaGHBkEUS8x62rddT7GQ6oZR0bJXV/LA6gCJwYmQpd8P2nVOra0Bzd4r/22dooWAsW9xy1kKQ35crr1EDWyWwLFa5r5SusKOJci9gVY/4WFJbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129750; c=relaxed/simple;
	bh=3Dx5K/6uAomDMeJNtwufyISMDFI3SQ3qkcEnvFt0TEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FwHPPsLxKNfnWXnx1KObniDf99Hr4duyBKSgpg5JfIYbEpTcEqDvaW3b5LV+8V6WV6GawdY32zcQO+OOes9kCISpsVn6So8L2lnL+tstjmItWj7DlqLORevmTI6iC/8KLIxMeqMcngo/aEV2BIYHth4k1v+C378ALK9eblTJvb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZwC7IfA2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2163dc5155fso44573425ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737129748; x=1737734548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/VudKlbPALVqM0M7Jv8cinL9zqQTWFtOjSLds8bTH8=;
        b=ZwC7IfA2j9OLtbDMFVzi+wfWnx0u2ZXvbHBBY6jChqpemaFF55C/OvaKWX7oBcFe6Q
         vll3C8E4/uFsXzhmobSs+eCrKCRA8nl2jyDDFRpFM5wF7JP3gzvAwdbwWXMtJTaqynMf
         vN6zYl/5Q/dDM+Ipo8n5LDqW/bZVQMTw/dcUOvfyyrAtaD2UnFwHTcNaq8A8F4nwZQqT
         9I2i2JJA0f+Vsea1pQP+NO+jwoI85np5QwGxGPOL3Om/HsAtPyVM/YvUlpYXudvjiS16
         CacBtaZmVEGUZNtUMJQtf0LYnfwLnR3hiVr7Ue/M49MgttdGVIY0kHR8WQEN29j+uF7q
         MLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129748; x=1737734548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/VudKlbPALVqM0M7Jv8cinL9zqQTWFtOjSLds8bTH8=;
        b=NbvnmHpeHuAx3UqM3Y2WXR8itch/TO6H8A8xm8fsDG5io9lTthLJbi2jhy0hqA5oGO
         Yr453Id9PwXUVDgXXR3Erf06vSdbQHD7YkJaTM2MLSIgRkkdTqvq978fXeW2GXO+yGTz
         Z3JznXeDK84EfJetIUCF/YRlDTnp0ob+tbbEJXxwe2FqsRxHmGeoZHpEi/0Q+xVe7X+X
         gLjhcthvhPhWNWp8TlrX/4BCIPY++VVJdvF5VeXD//fq83hi63/V+aQBfKADyddYZF9B
         AqZOQk/WtrGMO508MfrjS3NYGxNAL6bJjdLdIPVIu7YNbgd339zdlHPF4xsveh7KYE3o
         kklQ==
X-Gm-Message-State: AOJu0YzViaQueprbyiCOVcSNY8Njm5EcmoKaT35wTcFTgNpK1a9fkk2p
	9GTvwluCdf4xFmWQVFPeHrbkNaXWyZTF0w55S19N5nnlQfdiMtGjoeohy9q9vfk=
X-Gm-Gg: ASbGncuQU5NBQetJ2kxGA5bgQeDxhEMqCNUCtb8Oqf2BZFcdtjE5tlgtK9oLDTKkVow
	Px5B8y4D2mXilpsCZ/0bmjDGGYfPm0irSsX0WNBWXI95zglmkIyDY9iMA2ZD6e4RnfPDL88p1KU
	+LOrVOAIYJZwNeetJSNz26k8O02oOf6g6bBxiAbH1VongiZtf1aw2D6vDs35x+ZLpjFG2UTL540
	VgCTZe+D4KijzCJFIhMKWjWBHDxCcLKGlggGhg6MBycI5YoO8B5zA==
X-Google-Smtp-Source: AGHT+IG2v2L+mEIrQMTWWXVznvK1a9QA1KxWi805ituqiaxFlg2Kl9dCeG39Snnn3md7Yw5CS/TFqA==
X-Received: by 2002:a17:903:1ce:b0:216:4a06:e87a with SMTP id d9443c01a7336-21c355dc64bmr48245505ad.40.1737129747935;
        Fri, 17 Jan 2025 08:02:27 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:02:27 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:56 +0800
Subject: [PATCH v5 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-13-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=4005;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=3Dx5K/6uAomDMeJNtwufyISMDFI3SQ3qkcEnvFt0TEg=;
 b=fo2bonxa5vP7HaatMCz13umTZipF5JnxHE1MuWx+G/5Kzbtf6CGxow+jTGeXd7AqjDupMGhQK
 FikawLqALoaBudKEfrJ2MEBi0KJ2OtaleFfM1iNLJ5TVnV94WuFp456
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 63 +++++++++++++++++++------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d67f2ad20b475..b87da2bd20861 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1115,8 +1115,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
-	int i;
+	int i, num_lm, stage_id, num_stages;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1124,11 +1125,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	pstate = to_dpu_plane_state(plane_state);
 
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1142,24 +1138,43 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
-
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(plane_state->fb),
-					      dpu_kms->catalog->caps->max_linewidth)) {
-		/* multirect is not possible, use two SSPP blocks */
-		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!r_pipe->sspp)
-			return -ENODEV;
-
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	num_lm = dpu_crtc_get_num_lm(crtc_state);
+	num_stages = (num_lm + 1) / 2;
+	for (stage_id = 0; stage_id < num_stages; stage_id++) {
+		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
+			pipe = &pstate->pipe[i];
+			pipe_cfg = &pstate->pipe_cfg[i];
+
+			if (drm_rect_width(&pipe_cfg->src_rect) == 0)
+				break;
+
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
+
+			r_pipe = &pstate->pipe[i + 1];
+			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
+
+			/*
+			 * If current pipe is the first pipe in pipe pair, check
+			 * multi-rect opportunity for the 2nd pipe in the pair.
+			 * SSPP multi-rect mode cross mixer pairs is not supported.
+			 */
+			if ((i % PIPES_PER_STAGE == 0) &&
+			    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+							      pipe->sspp,
+							      msm_framebuffer_format(plane_state->fb),
+							      dpu_kms->catalog->caps->max_linewidth)) {
+				i++;
+			} else {
+				/* multirect is not possible, use two SSPP blocks */
+				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
+						pipe->sspp->idx - SSPP_NONE, i);
+			}
+		}
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);

-- 
2.34.1


