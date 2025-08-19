Return-Path: <linux-arm-msm+bounces-69634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777A6B2B633
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 03:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 689D55272D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 01:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3E01F0994;
	Tue, 19 Aug 2025 01:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CxCu3Kzm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9D316DEB1
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 01:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755567122; cv=none; b=F2GgucTIJUdbaj/Sny28pYRFi52gU4qbxN60psQ3R3CPNsNbSQpZlsb4CfaeO68rpc1Z9P8SU7aLy66DAEYWF/AxfpdyXbh8ZkvjBmPBqRFrSVPMj2SBwHQMYVNBRJKO64Vw3+67oeCbI3XAYOG9X7yjxe2W2fZOopk6YXA9zVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755567122; c=relaxed/simple;
	bh=CF4TPmOyKCuR1vONvBUPDXaEUNdePxwbzP99ZGSmrmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wj1D1I/BEIP+XOZE3RBWWe9+/f/4qHirKMvcd12R2JEi7iQfHB2kXB8kxU91MGOGE6rPWK9Fzw6xIJMZ7YZVQeENd+vGec0+fFbSO7Be+AsFGxKl9V93NCAgrvUzxzp/kAaw0jAlTxBNqFBj1YC6DmOSh7nPqjIH4dZml1u1FQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CxCu3Kzm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2445826fd9dso54603185ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755567120; x=1756171920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4X9gMtrXb7FnTuL7OxdpBsAZ9YfPLCWw/9fwnW/EYKc=;
        b=CxCu3KzmrhmVbCtFvTtzRqWvGIjzNxmK8WKh5HXB8ajapcS1K5nV4aWMF07rp3jMBG
         LXWHmRK+Q826gw+1cI9ROKnxXSahW3r0Pcnl7i1kY1ad9N9ACPJ4W3kAw4mAHa6k3wn6
         0NoTiczHVm1mgeg2Z0rf2aY+JBFp6ZXXv8mXHdQ5l6oRspchD4MOzQBRXipP+kZD1iqa
         LlQ3R+T2K5lfrVL0G11hBrwIPnV3PrfRdY3oRlTwDAPEHnLWxXhIQDoh9h/384S1R8fP
         LFa/4BOTj3PijOBah6YH9TORSBD0YlC4bnzAGME2lQrwqBqn/NMNgXjow17DauNJWcvP
         ckPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755567120; x=1756171920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X9gMtrXb7FnTuL7OxdpBsAZ9YfPLCWw/9fwnW/EYKc=;
        b=YC8FwuyokGh4d+8AYVhQlbKXQ+V5yu6ZM7fhh+QAEQca1zAkxZwf5yCH/ZMVtudxnE
         OmdPOMUK/1j0Vqw4eAcBkJic4JdAlFLxE5z52BWGq10V6SnY0RjEvSJlWPqVgheJ94J2
         7fNkkxn3IYx1pFPuPjtqdsgilsFY72QHNLmcgJfWiy5JL8PHW+SqE0jVK842Bw0KuZ1k
         jzWFPWn0PPUNW5k40JXX82TFpLZkMMxkQEy5edqSbRGm8oKthdjG57VN2fzspHIi9RKc
         Z+zJP4jXDsIBGJmZ503krYNwqo44MhsjfNk8xMS1ruZJWoarPyjlPiMgikdwgMU//5Iq
         SZNw==
X-Gm-Message-State: AOJu0Yx/ePU7XXBQxGVKKzqZFBJ/LFIoFE35bZiy3F5amivKfT9saBUk
	PHQjkYuVDmCuYYW4Hl7CXjgjpx6TIFNorvcDhQqs/rhO1GCYOK2QyvVMwnZCdWgEJsLfVAkuEig
	s6jzUE+8=
X-Gm-Gg: ASbGncuZf9emmlRLJ2VlLBLEieu2MXXA8Pq2jJb4sibB/oZUDKdEiksVRU7xk98ejjC
	VvpvRnbKzmqnFKyuZCnnhBCl8K2xW3y+yM8cqn2sc6yRPfptCGLF9Un3Z87HTPGjaZoDAAktRen
	enKqHqPFtf+FAS4plK4eB2qTXgLNOpPP8vQe2K5ShCd36V8R7yqOY3aP5wLFVZCUlDSUO5dHuPL
	VQvKeOOSzTcXW2FhDFvMHH4fuESgFto8fVrfo7JGXtYb+sBvwqVMeCilkOmayqUwXG6PBlsHJun
	fZeHxuA1WHKfem3MnflzX0CHa2B+GuaCF0/td7VURjEAjcXAw8+GLngVc9iWluk3ZUfRH/OFlsS
	76SI5JxZ91lfuNhuIl1K5CoyxuftE
X-Google-Smtp-Source: AGHT+IHnKN7T0YfiKiIoTLc75eC5UHMzcnpav1ymPyh+yaixHj7cUDQ0vmOI+Eihi4CF4RtYQRBNMw==
X-Received: by 2002:a17:902:f54d:b0:240:7308:aecb with SMTP id d9443c01a7336-245e04926damr11947565ad.32.1755567119987;
        Mon, 18 Aug 2025 18:31:59 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 18:31:58 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:31:04 +0800
Subject: [PATCH v15 10/13] drm/msm/dpu: blend pipes per mixer pairs config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-10-2c7a85089db8@linaro.org>
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
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=5682;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=CF4TPmOyKCuR1vONvBUPDXaEUNdePxwbzP99ZGSmrmQ=;
 b=jKyLYb95TCPGlUadXL4PbylqmJLTLCu78NFY2cQoAD+xKmhwDKWqC0oq1VHOuz4fmV3pGXzK6
 i/+2b9o2NPxDuu4tfIGjpVCgmQw0qYReY8ApquDVJi6dQl8mrfxl1Cf
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, only 2 pipes are used at most for a plane. A stage structure
describes the configuration for a mixer pair. So only one stage is needed
for current usage cases. The quad-pipe case will be added in future and 2
stages are used in the case. So extend the stage to an array with array
size STAGES_PER_PLANE and blend pipes per mixer pair with configuration in
the stage structure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 49 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  3 +-
 2 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 30fbd7565b82c6b6b13dc3ec0f4c91328a8e94c9..c7dc5b47ae18ebd78de30d2a0605caa7dd547850 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -400,7 +400,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct drm_plane *plane,
 				       struct dpu_crtc_mixer *mixer,
-				       u32 num_mixers,
+				       u32 lms_in_pair,
 				       enum dpu_stage stage,
 				       const struct msm_format *format,
 				       uint64_t modifier,
@@ -434,7 +434,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
 
 	/* blend config update */
-	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
+	for (lm_idx = 0; lm_idx < lms_in_pair; lm_idx++)
 		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
 }
 
@@ -449,7 +449,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate = NULL;
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
-	u32 lm_idx, i;
+	u32 lm_idx, stage, i, pipe_idx, head_pipe_in_stage, lms_in_pair;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 	DECLARE_BITMAP(active_pipes, SSPP_MAX);
@@ -472,16 +472,25 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_PLANE; i++) {
-			if (!pstate->pipe[i].sspp)
-				continue;
-			set_bit(pstate->pipe[i].sspp->idx, active_fetch);
-			set_bit(pstate->pipe[i].sspp->idx, active_pipes);
-			_dpu_crtc_blend_setup_pipe(crtc, plane,
-						   mixer, cstate->num_mixers,
-						   pstate->stage,
-						   format, fb ? fb->modifier : 0,
-						   &pstate->pipe[i], i, stage_cfg);
+		/* loop pipe per mixer pair with config in stage structure */
+		for (stage = 0; stage < STAGES_PER_PLANE; stage++) {
+			head_pipe_in_stage = stage * PIPES_PER_STAGE;
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				pipe_idx = i + head_pipe_in_stage;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+				lms_in_pair = min(cstate->num_mixers - (stage * PIPES_PER_STAGE),
+						  PIPES_PER_STAGE);
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, active_fetch);
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, active_pipes);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   &mixer[head_pipe_in_stage],
+							   lms_in_pair,
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   &pstate->pipe[pipe_idx], i,
+							   &stage_cfg[stage]);
+			}
 		}
 
 		/* blend config update */
@@ -517,7 +526,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
 	DECLARE_BITMAP(active_lms, LM_MAX);
 	int i;
 
@@ -538,10 +547,10 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(stage_cfg));
 	memset(active_lms, 0, sizeof(active_lms));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -562,13 +571,17 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
+		/*
+		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
+		 * stage data is shared between PIPES_PER_STAGE pipes.
+		 */
 		if (ctl->ops.setup_blendstage)
 			ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-						  &stage_cfg);
+				&stage_cfg[i / PIPES_PER_STAGE]);
 
 		if (lm->ops.setup_blendstage)
 			lm->ops.setup_blendstage(lm, mixer[i].hw_lm->idx,
-						 &stage_cfg);
+				&stage_cfg[i / PIPES_PER_STAGE]);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 9f75b497aa0c939296207d58dde32028d0a76a6d..e4875a1f638db6f1983d9c51cb399319d27675e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,8 +34,9 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define PIPES_PER_PLANE			2
+#define STAGES_PER_PLANE		1
 #define PIPES_PER_STAGE			2
+#define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
 #endif

-- 
2.34.1


