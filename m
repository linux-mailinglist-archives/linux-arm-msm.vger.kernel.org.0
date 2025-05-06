Return-Path: <linux-arm-msm+bounces-56979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7290EAACA11
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 17:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8236524936
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E1B286D40;
	Tue,  6 May 2025 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oc8uyiBt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A6284B41
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546554; cv=none; b=GdggQ4lMiamD+fv7jkIQA+bfBq3272c9R/pVbeFL171nkjT3bsuX9+aOgu8UEZrWbMdZRKFAEkbkWQkYdlAVDGLV/uf6Q0Sx59nuwLnl/3c3ilcHH5hz1jfzaGS4Xa5bO7xcHQNwjqL0OnVjSfpoykcIbMAaoGjr6T6lOqOLUJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546554; c=relaxed/simple;
	bh=YY4sN7xbdWZfp/Re8KSXr3eEbiH28FLdUnNLnDHq/Fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hpys4TA2RSfrM7mhnYyYzw9KZdBZ74UVlR7SKTCpK/K2+gmOr6obg0afgaDif66bJmFoTx0ANFMPVRCr9eZmbubIp9XYZb7jRd69jQXtn6XZGvDoGp8scdSz+wst9lb/f7LSCI/d/+XAgNeEIBs9WFfE4+4EXeGK5ugv9H4ukro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oc8uyiBt; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22e033a3a07so62121795ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 08:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546552; x=1747151352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrSXC8CSaWVKjQd78VPB0kbH8RLAs1ZrYyrkr0ZbwVM=;
        b=oc8uyiBt4JfKvXutGIyC8zw6cipKjRCz851VfnHE+zNzlhU42tlRegLYN4OdQ5H2qm
         1h95OLzMgi1s10YobZaHKqkX9aLBlAUn8blS3b2Rk9xlLE9oz2RtkQg72fby4AGh6H+g
         hhnxDmfmNBakNbZwodts6F6LOAr/PUzhZEskR8mHzhfXObHUapoCT0ilH0iQOpZtQVMp
         4WcOsFUxOYXspJX21lojzkCKM+NOKI/3D/iftyO8ygYGfgnw0QjxJC16R3UtMdURsZiU
         Meb2i/3X2Mjpi8GTSni6OgpOb8AEWztr21JfxUNpVhhgEdYIZa2H7lLB1VzWToT8dnXB
         mI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546552; x=1747151352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrSXC8CSaWVKjQd78VPB0kbH8RLAs1ZrYyrkr0ZbwVM=;
        b=ZQ7vjQtDGHFISVKotRrA2wKcVekrjUbB7DX1cNWgaZMqSowiaJwuDIqD0jC8zTi1s8
         nkeSktWt3h99vbY2126o+KdxByyo02FvDhltyqKKBkuKs0KuqsaSUONNTl0HBVhZKp5x
         99UqKBZEdFwED1f9FgAnd9Ev4ycH3SS1FdSQTxAZt2VtKoMFs3Yu8DV3Eh6Dd8nJ4VPK
         rRjGBmhktCctlY/mYeTY5VhFNrdlF1zvG/zKXC+JN2b6FpfDLcJeNYT8HskEcdwFxSug
         gO/RwPS//slidivQmqT24dIVfIaAn/39yEcfdhLKhaNHwT+QuCkzdcV+Vjm2jQChB7NP
         MZxQ==
X-Gm-Message-State: AOJu0YxOVFMESHGWb7Z9d7W5f+e21dv0wVf8uVhBf4Y2yFiw6p41wmR3
	mLpiCtf9SQoUZvJv0E8fmzArtT7CQhbt4xMlZwP8A9xjkqyLsflpe7rZ0AMob68nmXwQkSb0C7P
	UFBbW5A==
X-Gm-Gg: ASbGncviS+m1RITSCsdj/wudFmGutSj33afj9EKWX3hOkIO8GkKYw+X0QBv06EcCCqO
	MbC/eSmWSPD2VItks4wBPBQ4ykUkF38bkUVq4zRD32DwIuOpV28DKjZPysRlgsVKr3Mwedy5Gpv
	j6UXVM1GSRFXA+EhlxZ+KFOpjgrnpKvAr29zvetehDlzkQrQiEu67a36fKAqrEHAZhCSULJts5Z
	3cM2izXijmorc3UxVi0LIG+IgT6jaEZrFDihVbLltkUH4+1cxIRlm41PCoUhy7IEBcIOWiGO3Ua
	+/5VnSmgInqbSzBQuuqd/uTwtWHqLkGC9sevwhz1cFQLXbHY
X-Google-Smtp-Source: AGHT+IEBtFUXnS8dAqCaKYwBMhrZN6VksI4/OB2wRMlUXMc8hMijAv8x2Gw5tGgKsiddLUp1u2GH+g==
X-Received: by 2002:a17:90b:4f42:b0:2ee:d433:7c50 with SMTP id 98e67ed59e1d1-30a7f32d52dmr3266079a91.23.1746546551917;
        Tue, 06 May 2025 08:49:11 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:49:11 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:41 +0800
Subject: [PATCH v9 11/14] drm/msm/dpu: blend pipes per mixer pairs config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-11-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=5139;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=YY4sN7xbdWZfp/Re8KSXr3eEbiH28FLdUnNLnDHq/Fs=;
 b=z59G7UE5c0GyBKTeFnQwFKcjApDR+0lwb5J5NlTIgLOyaebWwCy1yru4Z6Ij39Ii/NPgHJU6u
 /cM6a61HOxsAtthaf/+zLI5heopnu59LwU+sNb+NQVDkPhV5j6PJAoV
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, only 2 pipes are used at most for a plane. A stage structure
describes the configuration for a mixer pair. So only one stage is needed
for current usage cases. The quad-pipe case will be added in future and 2
stages are used in the case. So extend the stage to an array with array
size STAGES_PER_PLANE and blend pipes per mixer pair with configuration in
the stage structure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  3 +-
 2 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d710b4eec7ad946a4cf74d6ac5f4db90e8dcf1fd..f35cb1f7a7d2c2c63b4228bc47b85bb57cddbe6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -392,7 +392,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct drm_plane *plane,
 				       struct dpu_crtc_mixer *mixer,
-				       u32 num_mixers,
+				       u32 lms_in_pair,
 				       enum dpu_stage stage,
 				       const struct msm_format *format,
 				       uint64_t modifier,
@@ -426,7 +426,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
 
 	/* blend config update */
-	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
+	for (lm_idx = 0; lm_idx < lms_in_pair; lm_idx++)
 		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
 }
 
@@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t lm_idx, i;
+	uint32_t lm_idx, stage, i, pipe_idx, head_pipe_in_stage, lms_in_pair;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
@@ -463,15 +463,24 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
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
+		/* loop pipe per mixer pair with config in stage structure */
+		for (stage = 0; stage < STAGES_PER_PLANE; stage++) {
+			head_pipe_in_stage = stage * PIPES_PER_STAGE;
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				pipe_idx = i + head_pipe_in_stage;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+				lms_in_pair = min(cstate->num_mixers - (stage * PIPES_PER_STAGE),
+						  PIPES_PER_STAGE);
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
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
@@ -503,7 +512,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -516,9 +525,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -535,8 +544,12 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
+		/*
+		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
+		 * stage data is shared between PIPES_PER_STAGE pipes.
+		 */
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&stage_cfg);
+			&stage_cfg[i / PIPES_PER_STAGE]);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index b0ed41108a32158c0bc3be2e25fc229b218fd6c5..7c74221380b2c05225c9f82ed6d33765042aec78 100644
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


