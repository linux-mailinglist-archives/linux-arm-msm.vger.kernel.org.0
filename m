Return-Path: <linux-arm-msm+bounces-42756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5619F764B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 636741890A88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF31218EBB;
	Thu, 19 Dec 2024 07:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OO+oc0Il"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BE5218EA5
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594646; cv=none; b=IDeFCw6qtm8FDUF5mSC7W9c4UigNy7kbP4GsQeSf76yoPJFC5vmN7zO5GUrCVPdC2v/Kgy5lXh5y2d+zAYQ1p+B1Kc8k1txx4xnd3d4gY5WdSav6LwsbN4x28dWCm0BPekmZGmCWiEUMC0I//JEjLj/IkMSHK6AC7eMy0FKB8Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594646; c=relaxed/simple;
	bh=oxfzARhHE0/oq4CY3TryYx9jMpUF/fTBmG2EofRgAt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NrXvhBoqZZnc2FS08LHwQt96o8IEKA4T2LhQFWRqfKuWdeobL8zslZ3zXb63BqbKcLz1X142uWBDh4B6lR0Nb8J2rhoWXJhnEVjDmtG9Gbxpk4bhMnWFpT3gE8JU0pKjr5A8zG4zXzqrD+v9PHcBkwMb18Mh+tJenjH5emSBDu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OO+oc0Il; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166f1e589cso5351065ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594643; x=1735199443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENyMFx72ZbBjFc06s6EFkz2rNCIxTdMxqvx5v8cSqvI=;
        b=OO+oc0IlnxFs49ogdLVKbvxwIJ+bi86/4Usiirk2K9MdWQ1xxapzZfjum+yB7imQKo
         xCSuTzjQsNHq16GNxbpQ+7NQUvoIab5IwxRuhecCNH6CE1w/ZJIFDhEZBgGp7jIPyCT5
         MyP5JOPNav83EkT293VHLca8SC+8gh++haTb4nt5faUHZDkLQ9nL7XHP4IaULpSCW4PA
         Fyh3ZkUDmlguYXxyIE99TzrXvIWVluWJuIz29U694xg8rcW9TcdzZSdv7Legs4KiyuAa
         5nps255Qfv/fOgAaKahZTUebqmj/mkqemiGFcn6a8IzjeL0uECVwLSWe1NHPFS28QM/o
         c8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594643; x=1735199443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENyMFx72ZbBjFc06s6EFkz2rNCIxTdMxqvx5v8cSqvI=;
        b=KLr3ARDqBF6YEbZo8V1pdUairokrPt0iuenvNVxCeJ2M5DShhThNrhtZz0Yvn/CN2y
         4qQ3YLacjYrUv72mGADKWhx7uCpMJ6RACxHnJBjLaEDqxTwBI40PSw9GP+BpKehyJZvI
         4q3DupP+zIXctPbR9Te9gycZ9YCvUUnBItl2x07yvPqyp/wJZ6T642FYIhPMtrUIGS/n
         wNcvtwnO+CRecPbbRRgEcldp2BtVOZQeYr2+tneD7JG7gqZ0Ytfsy8q8MC7G2BEbgGev
         8/2Hn/mhBBU5NiHY6luffT3Y+wXvW1hHxkglHKk9LXsp2Ho1KEcy5T4YoHynbsUShPdi
         xhzw==
X-Gm-Message-State: AOJu0YyhGH5LB41ulkTYp3+eN0/lgCFRgbYLxR4a10MhbuVO+KQnuQmL
	FqQ4Sd/2PmpiwiYGMifq1bPDuDIiA8gfamwaocSsC1u/PqK0DvF1R3LJx89UYJx30A9wQTJDSfB
	XP8yz5Q==
X-Gm-Gg: ASbGnctQ+Mo6DJ1YdVuy9+TauAvL+v7RTp93bA1VBcRHQIoFBkCeWSpyqZdRi2llOjR
	iVoRtJxiGPUeKm51TbhZXJzZNjlTHH0qPDJ1ogLIn7q7JC86Mh/VgaN1Uv2kBxmPwXXhSaFbB8P
	ZgBJKMsPON8aiVyQ41Ow8nI/ziv9RHG8uowpu9+vO3GfcD+DnnJ1Go+Usmy+vGdcCM7MewwLL0w
	0DXUfJxboaiiV0orW4LydAAR0xoYIdv3eExa+nvuX9iZePMRIQgXQ==
X-Google-Smtp-Source: AGHT+IFmpHu4d1IsZ65VlCxjfUI3RfnJ3SyPUSxBWEEQxMEDM9PoBBmloo1N8vMAb0BH43O2dSKsZA==
X-Received: by 2002:a17:903:2306:b0:215:b74c:d7ad with SMTP id d9443c01a7336-218d725f86emr101088515ad.36.1734594643625;
        Wed, 18 Dec 2024 23:50:43 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:50:43 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:29 +0800
Subject: [PATCH v3 11/15] drm/msm/dpu: blend pipes per mixer pairs config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-11-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=3915;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=oxfzARhHE0/oq4CY3TryYx9jMpUF/fTBmG2EofRgAt8=;
 b=4VJ/vrmSv8023lmyh58C9GHrKJCLCtsc079xQYjNxU1PjwMNPdtal4TXeYiH+XxluBWXIBxv6
 cio4O+HUxoXBoQdmaVODcZCYQp/364gkSdqbwGST3Kpk4tPOKgqGnzG
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Blend pipes by set of mixer pair config. The first 2 pipes are for left
half screen with the first set of mixer pair config. And the later 2 pipes
are for right in quad pipe case. A stage structure serves a mixer pair,
that is coupled with 2 pipes. So the stage array number is defined as
STAGES_PER_PLANE.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6841d0504d450..6ef7e6ed00238 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t lm_idx, i;
+	uint32_t lm_idx, stage, i, pipe_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
@@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_PLANE; i++) {
-			if (!pstate->pipe[i].sspp)
-				continue;
-			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
-			_dpu_crtc_blend_setup_pipe(crtc, plane,
-						   mixer, cstate->num_mixers,
-						   pstate->stage,
-						   format, fb ? fb->modifier : 0,
-						   &pstate->pipe[i], i, stage_cfg);
+		/* loop pipe per mixer pair that's served by a stage structure */
+		for (stage = 0; stage < PIPES_PER_PLANE / STAGES_PER_PLANE; stage++) {
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				pipe_idx = i + stage * PIPES_PER_STAGE;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   mixer, cstate->num_mixers,
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   &pstate->pipe[pipe_idx], i,
+							   &stage_cfg[stage]);
+			}
 		}
 
 		/* blend config update */
@@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -516,9 +521,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg[0]);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -535,8 +540,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
+		/*
+		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
+		 * There is 4 mixers at most. The first 2 are for the left half, and
+		 * the later 2 are for the right half.
+		 */
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&stage_cfg);
+			&stage_cfg[i / 2]);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 68867c2f40d4b..27ef0771da5d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -32,6 +32,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define STAGES_PER_PLANE		2
 #define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES

-- 
2.34.1


