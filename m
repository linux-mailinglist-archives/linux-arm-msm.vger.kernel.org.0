Return-Path: <linux-arm-msm+bounces-63887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F6EAFABBD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 08:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7238716E09E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 06:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0E127AC3A;
	Mon,  7 Jul 2025 06:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vqVBOkrn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A789A279DDD
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 06:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869149; cv=none; b=saweuoVAfG+dSu5dfK5G6DSVKH8NwEgeCJnU27CfOcPpbO3SGadm4ErTE71KeCtj9iNjuJvJkyhT2dXlQB84lsu6wb2Q0j8FwrB88fBGKu3zQ5ri+qyyE7qHLdaqD11PONNi6PQY7yjq1O32zThqTQQyExA9M3Db9kPKGhj2Uhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869149; c=relaxed/simple;
	bh=CF4TPmOyKCuR1vONvBUPDXaEUNdePxwbzP99ZGSmrmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NtyPZqRA8bBwEcVnWCfx2UpAIeGHgNIxkmRnNc4Ia3mUu+/vBlmRXmutfN36p4UeF5TyUHM5Ny/kdj+tWYgYLXfsQB33vkMk/kRW3w8WTUQV2eG3Sc6/8PtJxZ5UA14c8PIMk+q2zeG6PBknhpETAzLiCIob8a4tSEvHeH7PFJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vqVBOkrn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2350fc2591dso24339945ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 23:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751869147; x=1752473947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4X9gMtrXb7FnTuL7OxdpBsAZ9YfPLCWw/9fwnW/EYKc=;
        b=vqVBOkrnyBm4PwifM8TAU882wWU5YxdhcVOdYqq9uoYDf6n6pbkz2mNhU6C3pcYTl5
         ehS8K2zDEK0HIElGx4oX3KihtiZUnmjo7hhUWGTQ7CVcUq0DXtnjM7PhGgxA6rjoNgbo
         uvZ79VAUMA2yN7SBelCinifUcE7WcVMDrGNkOVTKPguDxEqd8Dx74xlhVzQ2xhw1714R
         /xnG3XK5fYnkMv2vSK26PnRbMlTgQKXOkkPXT5Dju1cAtazGhSEHUefkS0v+LPjaUmwx
         3ea9x7EfCZsO8LnfUOVK/jPFgJ+IbfnpCUNhCw4DtOQdKSVrFsnxyGaP93yjKslggChp
         6d3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869147; x=1752473947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X9gMtrXb7FnTuL7OxdpBsAZ9YfPLCWw/9fwnW/EYKc=;
        b=P5os46JP+Uah9ST8ZJuOJUj+8ByRY2Azo52BKcNYmUbrqcYAm4bxytG/yc93IYwdKf
         zmxP5VY/1n3fJqvkau6txY3oqAGo02hHyCNKOUcA6dyAuiYL85ofYy+v9Lv3VopoFWVD
         knyxUeeyMZzbn53+sQv3unzbancTgo8Mfd5v5CzODVnmr6TG4DZR1jEvj4VnVharyM0l
         GmNavAfTvlPNZHY/Cvc00q+qrJNtOdgS8YMEZ9raV5yF85TNR1z2KNmDuT2fGqbeDfYQ
         yLxqFxwA4XisqYgrQNlbXF92BjNAkyX+p1KnmTObsDWyPjrdP/uHiGTnXaJsS8OuQChl
         XJAg==
X-Gm-Message-State: AOJu0YzaBUNhB3X6Lmals2xPF40xaPzpEDEjp7p4LqgSJN4aU6eITnAq
	WGWG522+WLY9GVZmo3lvRKIDn8ReVzF9QuSSQ/hQ0Q59gDlAORTiEp92229JUDuRYyg=
X-Gm-Gg: ASbGncsxwfVmXO/QZsm9hi/Bt1Yt8BIe7NuJh5f9EgH9AruCQE8cMTHbxO4D3UlyykG
	x6jRo3WSXCJTNF89FUApcngookSsTUFHsDxaLQwZES5ouLD4YGYGK7xlnI2GNLzmYL/sIfJvQZD
	UGbJYKHoWvw58XNvR1oHAsSNGRTUpi5Zlrr60ykd18PLyjlWRKLMEHNDiR0L7JYZji54UNzYHI9
	n91AHxXwqSx+9XZneAlf8vJKoQ98Fbjo4uW4RvtBn6RiAWAE9gG8/La4CA/RiG/G9VlWmibkr+1
	FYKESN6XkbX7lvX59xv3Shv3bJvXRXs8yW/SUTMdnoQdek9DKooWztyi7Do=
X-Google-Smtp-Source: AGHT+IF0KghELWti7eAnoagzbwdIIn1DE9MqdtlCtyl50iG7cdctR6/FfVoLGdbm0IZghmiYQnDCAg==
X-Received: by 2002:a17:903:22d0:b0:234:1e11:95a3 with SMTP id d9443c01a7336-23c84b6842dmr178708885ad.13.1751869146841;
        Sun, 06 Jul 2025 23:19:06 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:19:06 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:18:04 +0800
Subject: [PATCH v12 09/12] drm/msm/dpu: blend pipes per mixer pairs config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-9-67e3721e7d83@linaro.org>
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
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=5682;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=CF4TPmOyKCuR1vONvBUPDXaEUNdePxwbzP99ZGSmrmQ=;
 b=N4ahDdpG2ihiFC1g+IKZNN5WQUerHf+f6XqTqdOsvy94vavAWPgeRXS8L1jrF5o0rg6EeeSan
 gXQgp+zKLSlCQFG09tmb44YXBmCyycrVryBt1pFe7MSLQA9I+1ODnIk
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


