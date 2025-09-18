Return-Path: <linux-arm-msm+bounces-74085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF803B84D66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 15:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4B047C3BA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 13:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA4730C0F0;
	Thu, 18 Sep 2025 13:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fc+4xUJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A8A30CD88
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 13:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202196; cv=none; b=bWMWyyEvD0gLK0DeNQdkNEWCPVvKD0pDJoWah7dGTKn+hzoZMQWSDF0bOo4KXnykeKBqO9LKogzvVySwRWWQKFPD+nas3aKLYhe4U6J6wn97IzduiJZ4EJZlghpD1prqGA3rydTMeVjxEn7T6Gkusg5j1wuvjCeSa2X6T9bt3OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202196; c=relaxed/simple;
	bh=+n/PPUvhGtvDcjy9OGmIbqAUpvtvyvqhQ4uNu8ijzxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IzOUFHkOxAK3i9VKIPOZrTUFtXkgGXRCuf+CHKORGuf5W3h43/jXHsFyEZgrfDjChPisEIyWjriixIHJn/EhHU36+MCW+5hn2yWbinmpv7ZtwGb6v5NpUOYox/GJjNY3KQcIRFaPDI8XQsPWMYke1qozUmYiO/y9Pcoi++H/hi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fc+4xUJT; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7761578340dso1375171b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758202194; x=1758806994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t90Ux8tYCkSSrex3FdGpED+hZscFEf9iPJ36XVYsdt4=;
        b=Fc+4xUJTpHWOcMXqOgriu/BHxVWDMXjHKGR9ncNyevJw+s/VkoRMl2ixwb3wFtIsCy
         TzjqHcLtZXU3gTZXJADRmwTvDE5L5wLFJbv87MCeOpjzUAG4VmmqTDh0v0j2DGljy0u6
         iMo7tII6hG1Nk3oEfpX9J3EXWWQixKp3vtg4rWVUkoAt1+Oui0O6LRsMOyt2QOKB8mXr
         id7u7rrrp5ZQmtp8677kZffDqnehivxMWtjXywAMM+sW4bEE73o966kGqal/IT5Rd09O
         6HMLeAQNpF7XrUYp9eZ+/hhrenRqvjIyAP3FxaCPsWyBLorVe8BhPOb7GJOmlUZCpUwS
         scMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758202194; x=1758806994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t90Ux8tYCkSSrex3FdGpED+hZscFEf9iPJ36XVYsdt4=;
        b=qA4AOV955HQxvnQKpsT+pSldhosuUsMxhXuOL/GRteUkIWw0YFOAnx1zMVzvVgpbGT
         Ug56LLHVtSngAhoaihDMUc8TST2d612RM33v0GdYRgIqJBh1aDJOfuoXG3g1XSx7A7ig
         8y5NO+tvh+moytsQdMJYSidgEhFMzKyBRcaufBMIrBeDIgkDEYDtc7gYVzcXbn673K6t
         Nap6g2vZuQnAZdS11eEqmtyimMdZDSXE0NSz8uAC3RKJXulblD5maBPwUGBBj/txl07x
         WeOJ7BpALCzh/+vXixnfst/o22SY+QUKnxcnsGijwEAUg6RmXZ9edW9QeYmcN5+N4Fh2
         8T6A==
X-Gm-Message-State: AOJu0YyXeG92lBEz5rwbmOPT2G3QfiRBsCZEz3Ytg+WYGCjCJYCUObrr
	TtnR/6EoclOS+XPWWIQpcbt0GorT/zD+KIVzpwslPa9iDFZKp281C7MnBqTZmXYRtBc=
X-Gm-Gg: ASbGncu88zPHWW9qNPuJquc5IzN8nilF7e2+6KgnAqCtQRf7mo8GW8DQGb1RcwEo00A
	tFxqJnnr+bon3e1KBukd/07a5J5cmztOOn0iVIWjav1zU/dgVpoo5FFM5HRLPtv5kVyhYzKrhF3
	xWl88WspplhqmM5twKUXeew7uLV/uE+eQLsN5TWV/a8sSsVceZ3k1087X3/zA8j9t3WkSWen4D5
	NYCcnn7N66yVBV8jNaUIMAThDXYjy/fowbhFj+fJ40fPM5Qhzv0qKb38QIv3zo65kDNGX2d5dN4
	bw8XyIBv3Q+Fr6TmLjgJ32skEGt/ETX5FNxeyd7HhhB7KNG5LjUqQz01/YTgrKrrzyH6yyNo82c
	R6R4d5yCRcsxYkBfN+5z9OtyEL4lpkbbUWyg=
X-Google-Smtp-Source: AGHT+IGzFTiKX8Sek/DvzVKJAQe5PzJmHfudTo6rSgTpBO8e8GPvqRDsUopKXTwdKiL+QDJlhY8gNA==
X-Received: by 2002:a05:6a21:3286:b0:249:d3d:a4ee with SMTP id adf61e73a8af0-27ab73085b1mr8717977637.55.1758202194282;
        Thu, 18 Sep 2025 06:29:54 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35cc76sm2331479a12.10.2025.09.18.06.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:29:54 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Sep 2025 21:28:59 +0800
Subject: [PATCH v16 07/10] drm/msm/dpu: blend pipes per mixer pairs config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-7-ff6232e3472f@linaro.org>
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
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758202147; l=5682;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=+n/PPUvhGtvDcjy9OGmIbqAUpvtvyvqhQ4uNu8ijzxc=;
 b=qc72hi5zg0tOHmxOTcsnx8Dl5tdusoFV+McrrueZhYKYV+1kbDoDI4exvjoBCyrkT7aM2LE+u
 UYrHa7uOZPhC3zUmMz4Ij6/IZOlZEx+yec/lry+29X37iDdi1kQCMHr
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
index 7b57e638def60f02116325401a8341da11d58e50..d825eb8e40ae8bd456ede6269951339e3053d0d3 100644
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


