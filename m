Return-Path: <linux-arm-msm+bounces-29981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E111C9641C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 118701C2137F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912EA18EFFB;
	Thu, 29 Aug 2024 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iByA0lCr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC3419E83F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926892; cv=none; b=TLKantYaztNJmVFnFpFhQ/dQqQmnAoIrZwCcFxIijSJkYmAXKVKZv3H2l4FtnCuVOrS2yKEwyQ7dHdRsc1eGonTKERhHF4JsxKtNVdYr7GPXVFOCxyXXKKB0y1oAh/FUxA0lBUpXAofoVqabLSAyaTJWA5e8impO1x4kjj82JCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926892; c=relaxed/simple;
	bh=2p1+0sprLK6BeoqG75+2/3BJRBQEnZgiwY/ji6q3SdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SaLPiHaI2myacnwoHP1/zjogmZ1VicLNH5S1/iNydmfo5CctMqed3iOzJk9F8POoxJMdIX2YBQ5CmJXo3ig/Kp5nsC8EJJD4L5061s9oUzDDVsrh2eAjYy8a8DeSp4p01eDMBOgqU51jJak8CdgZlXwKRnWNziLGrih/+YbAUSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iByA0lCr; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7142448aaf9so327868b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926890; x=1725531690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8DI7ikA88or2iDAK3xOlBJ1PA1zv5oIPqzpNTVoeMY=;
        b=iByA0lCrfWpW2bEqNnhQeUtdFIp7Nzc/awyMkpuKTa1HbsQY0BkKBchu49JuQY7y+z
         EQGEYuJNuJSWSm70qFuCyJ2VC9aXbKDCEn3staKuZoLsi0b4NsFH0fZo0bOmV1wjIam8
         WoJXldF9t5Blz6xKnIi6A6ypHz9Vauu/YgPdXgRTCmbbf1pFZnWW2EriU0YOYN6Na1mZ
         y4v4VDMHwUMrHj7caVlmRUDU93bMt5ZAdhSv+Lg/4ZtTM+6xhvnUNh6BS/mKtM2jcVla
         b1u5sWhJNfph43AbfOijOBw064HhIcsyTiy+cmISd7USWwAh85ILbvm9uy7Z2BZvhey5
         V9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926890; x=1725531690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8DI7ikA88or2iDAK3xOlBJ1PA1zv5oIPqzpNTVoeMY=;
        b=YL+xCQihrgnTykyH7yWd7Hi8nm7Ln3UW4oX31xvExPuYLl3Pqd+p76OyxvaCgG2G88
         VZ65D1Z0jhhzEWMD5Tf4Z31AX+lcjpq7Mt6qmja/mZL93Wg5qyz8Clpe1XIz1EL/ux5D
         i2QWHftRHeYyygvUTKYLLJsX17YnuFH19v4jQUV2nf0fw/EpBWJ5Mp4LWoUNUqJcMe79
         H5GhrssTtG5gSk6uAXXRyoiSesqrps9se3UxTtdEmLvw5WEwIirmAwBkJy4REewsC8fu
         Bf/04NUl2TGXHejZ/xM4kD6CbQh1Zg2ugfJ6P9Ebkq0mA5yb6/V02Fu2xUnIBBrajgff
         bdVg==
X-Gm-Message-State: AOJu0YwtOvKMABuD1xUgeuRkjy5llpb56xzQdUet0AJZBNrX4wfdxhuu
	bLS9y8C6L/rwx5P3NH2oYt6li2dF6wpg6joFjo8ClwnR/12WugwgQ43YkQsibbk=
X-Google-Smtp-Source: AGHT+IEcTRkQ5ZzVXvod6iAZFqWooirDADbwt3Jr/PqEsTMQoqohkuPi28x0O5nZR5hpkrLnnYZuuQ==
X-Received: by 2002:a05:6a00:85a5:b0:714:2336:fa91 with SMTP id d2e1a72fcca58-715e1046500mr3379581b3a.14.1724926890039;
        Thu, 29 Aug 2024 03:21:30 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:21:29 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:46 +0800
Subject: [PATCH 17/21] drm/msm/dpu: setup pipes with 2 set of stage config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-17-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=5154;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2p1+0sprLK6BeoqG75+2/3BJRBQEnZgiwY/ji6q3SdA=;
 b=H9wx3GYWS3rql7lX5rfVbEbl82Qcbjc7rs6cMYTyW+Phj7Uod5o3sipnk1tae3jS/Pk5YH9IM
 J4pqV5DA60hCdIOVKl2pnC50i3UFThlz+hG4URucuJqZAHwdFyMEuMm
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

The first 2 fields in multirect_index and stage array are for the first
SSPP and its multi-rect. And the later 2 fields are for the 2nd SSPP
and its multi-rect.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 76 +++++++++++++++++++++++---------
 1 file changed, 55 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2c21a1e13d32f..3b3cd17976082 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -397,9 +397,8 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       const struct msm_format *format,
 				       uint64_t modifier,
 				       struct dpu_sw_pipe *pipe,
-				       unsigned int stage_idx,
-				       struct dpu_hw_stage_cfg *stage_cfg
-				      )
+				       unsigned int pipe_idx,
+				       struct dpu_hw_stage_cfg *stage_cfg)
 {
 	uint32_t lm_idx;
 	enum dpu_sspp sspp_idx;
@@ -410,7 +409,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 	state = plane->state;
 
 	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
-				   state, to_dpu_plane_state(state), stage_idx,
+				   state, to_dpu_plane_state(state), pipe_idx,
 				   format->pixel_format,
 				   modifier);
 
@@ -422,8 +421,14 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 			 state->fb ? state->fb->base.id : -1,
 			 pipe->multirect_index);
 
-	stage_cfg->stage[stage][stage_idx] = sspp_idx;
-	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
+	/* Mark sspp[sspp_idx] to be blended in stage[stage], pipe_idx decide
+	 * the SSPP is blended into which mixer. For example, SSPP 1 goes to
+	 * left half of screen, then pipe_idx 0 and 1 shall be set for sspp_idx
+	 * 1 in quad-pipe case.
+	 * The operation is done in dpu_hw_ctl_setup_blendstage()
+	 */
+	stage_cfg->stage[stage][pipe_idx] = sspp_idx;
+	stage_cfg->multirect_index[stage][pipe_idx] = pipe->multirect_index;
 
 	/* blend config update */
 	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
@@ -441,8 +446,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate = NULL;
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
+	struct dpu_sw_pipe *pipe;
 
-	uint32_t lm_idx;
+	uint32_t lm_idx, i, c;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
@@ -463,20 +469,48 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		set_bit(pstate->pipe.sspp->idx, fetch_active);
-		_dpu_crtc_blend_setup_pipe(crtc, plane,
-					   mixer, cstate->num_mixers,
-					   pstate->stage,
-					   format, fb ? fb->modifier : 0,
-					   &pstate->pipe, 0, stage_cfg);
-
-		if (pstate->r_pipe.sspp) {
-			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
-			_dpu_crtc_blend_setup_pipe(crtc, plane,
-						   mixer, cstate->num_mixers,
-						   pstate->stage,
-						   format, fb ? fb->modifier : 0,
-						   &pstate->r_pipe, 1, stage_cfg);
+		/*
+		 * Check whether the SSPP fall into left/right half of screen
+		 * via mxcfg_id. The left half is the default area with the
+		 * first config. And the right half is with the second config
+		 * in quad pipe case. The SSPP for the left half always come
+		 * first in pipe array.
+		 *
+		 * For example: there are one SSPP for left and another SSPP for
+		 * right with a super wide plane in quad-pipe case, with multi-
+		 * rect mode on both SSPP. The pipe index for the 1st SSPP are
+		 * 0/1 which goes to left half with the first 2 mixers. The pipe
+		 * index for the 2nd SSPP are 2/3 to indicate the SSPP will go
+		 * to the right half with 3rd/4th mixer in 4 mixers.
+		 *
+		 * If a small size plane is only on right half of screen in quad
+		 * pipe case, there shall be only one SSPP without multi-rect
+		 * mode. Then only the fisrt field of pipe array is valid with
+		 * the config id to be 1. The config id 1 indicates the SSPP go
+		 * to the 2nd half/rectangle of screen that clipping with the id
+		 * in dpu_plane_atomic_check_nopipe().
+		 */
+		for (c = 0; c < MIX_CFGS_IN_CRTC; c++) {
+			u32 pipe_idx = c * 2;
+
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				DRM_DEBUG_ATOMIC("Checking pipe %d visible %d, pipe_cfg_id %d vs %d\n",
+					i, pstate->pipe_cfg[i].visible, pstate->pipe_cfg[i].mxcfg_id, c);
+				if (!pstate->pipe_cfg[i].visible)
+					break;
+				if (pstate->pipe_cfg[i].mxcfg_id != c)
+					continue;
+				pipe = &pstate->pipe[i];
+				if (!pipe->sspp)
+					continue;
+				set_bit(pipe->sspp->idx, fetch_active);
+				DRM_DEBUG_ATOMIC("blend pipe %d with sspp_%d\n", i, pipe->sspp->idx);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   mixer, cstate->num_mixers,
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   pipe, pipe_idx++, stage_cfg);
+			}
 		}
 
 		/* blend config update */

-- 
2.34.1


