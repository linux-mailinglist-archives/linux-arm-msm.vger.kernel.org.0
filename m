Return-Path: <linux-arm-msm+bounces-45206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB29A133DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ACDB163746
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CEA1A0BCA;
	Thu, 16 Jan 2025 07:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DqicIdji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D661DA11B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012445; cv=none; b=BqqpGaMKbxkxx4faW4K5f9zbdjc83c75XTqb6FP5O3Ha2nFXTYJAlIhJKiuwamjKOLhYRqPOGrEHSe5x0Ww5jTdTiLHDxraQogC3ua147BlK1hocpGMERDN0EYfWJze0skkdrrid9alA1V6bzFAxwIddU5ONCNHPPcxMNAUMw2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012445; c=relaxed/simple;
	bh=riXvJCYz3ZHmPNnxEFMshsGfh9DVde6M2D9iSPytzY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kWYYdcmwvYvllVpRGERF6eNGfOpy7vcZRbH5IXMjbdl4nDqu2BM9I7Td+F4M83q3vwY3Of90sLhasqMSIl8PbpDmrGnRmrvQbizWIaYxC/Plz0s8aG99FtmSiXjYZeU/g4Vqeca1wtduPHKgsdMNPDnzrkxOGnV9MlYxHCuzGio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DqicIdji; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2165cb60719so9180155ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737012443; x=1737617243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSkT3PGz+hK4c3uKDJme/xz4DdZfcEa+rPOa/pxcuKw=;
        b=DqicIdji+rzHsyojz7LNy/rOSXuTKmahmKQ8SJ/VMEHk0j8q6IONGMwGAoFAu3sMto
         T/uhQNnV9422ixNJ/nbnzGUzI0r70cJlUCPq0siDxxvggzgXmEe1FWHXiyVS0WwfkwpN
         KtygwkCh95VWk+och0J9h/r48RaLAfqGcWP3OavWBvuySTXNRtoIlQZ2aqsZINqnF9tK
         QCsnhUoEvazktnmeNC+9ntoI5GD4uOZtaD66EZI8RS53eODmTMPd6NxcbrObtvLJs4FQ
         xDAHF6pX5qbNlyenKnvqAtNM3t5VBOo884COXBwTDjRtxLC9puLiXDtyLZoIp9MkRFxm
         LlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012443; x=1737617243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSkT3PGz+hK4c3uKDJme/xz4DdZfcEa+rPOa/pxcuKw=;
        b=BNcO5kVbC6F/fCeMaEZimtBeZ1Z63kaxxNx/L9h3jr+SP+6lbBJqW2be4jfC//UWhr
         5iNcvNHLehaBbAG1avBHbnHlyG3+ubcizBfdKQ8A8qBI23ev+7G1rPtqIarFlTkirXaa
         LyuiBx3von3pWp0sOavRS/qkIVSpQWgeU0abCOvL3XJW9rUtTLIwh/0pLFw/VsuGHiGP
         eDuCFObwC8pDVtv90Io2HwBSfDCziShzezmHfw0ygRsq4jrbN1KdieasKMdABfRfRg2l
         vFq5c/iXYiALzwF0Qm3Gs8sCDLOj6/U510JuMqjM4yX+eBMIYK+QOInq3d0erIuoQJsn
         dbXA==
X-Gm-Message-State: AOJu0Yz3VDSqIU5oHjUOcl3Fr9POwCN2KeZ7BMWuX2SsrApaFlVEQ1NB
	wP06/TU8snb61E7OHjHbho7X4IZFjdMzJ2KOnsUw9eOCopaRgtXoecEF6gnSCfY=
X-Gm-Gg: ASbGncsdvR4HQUobKvTLhy8RTC3WV9cIz3kj4hk7K4J4gq68Hh7TYYQXFeUFD/jlu6J
	pNzYB1PVAvEJRdeTtjSe8Zkty0RH4MENE8aIoZooSoX/pi6WeOqf72KJk9E9+2gKD1AW36P6pn9
	IIj8ILc2ZstKT2MXvnZWvcohmUcfnZQSvgQkRsRGhS7TJTf0rNlcU30NDElBBxMl/616SS/0udd
	/6NDSnsKhQixKeFpma34OYvZj2GouL5rQrSGwm9tMFg9WqLL8zP9A==
X-Google-Smtp-Source: AGHT+IEsv0RALMT8qU04Aegf/K+yluWNQbU4I8oM+Lhga6n65548feoEq3KCkDSaqeMuWwoh4OPOyA==
X-Received: by 2002:a05:6a00:1413:b0:725:b12e:604c with SMTP id d2e1a72fcca58-72d21f109eemr1061302b3a.4.1737012443090;
        Wed, 15 Jan 2025 23:27:23 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:27:22 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:26:01 +0800
Subject: [PATCH v4 12/16] drm/msm/dpu: blend pipes per mixer pairs config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-12-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=4704;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=riXvJCYz3ZHmPNnxEFMshsGfh9DVde6M2D9iSPytzY0=;
 b=N90+eokB1/pHDBh9fjgX2d92pIVhyzJtSySJRwUrRkbmzYWATDHJLeNTJaYbgHelleGAuUAfc
 mBJojSGj0IADfqFey7Oaqj8g0qdjqTM9yBukm8HkEVL1UuEcn8CZEUK
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, only 2 pipes are used at most for a plane. A stage structure
describes the configuration for a mixer pair. So only one stage is needed
for current usage cases. The quad-pipe case will be added in future and 2
stages are used in the case. So extend the stage to an array with array size
STAGES_PER_PLANE and blend pipes per mixer pair with configuration in the
stage structure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 42 +++++++++++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 2 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 81474823e6799..5ae640da53fbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -401,7 +401,6 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct dpu_hw_stage_cfg *stage_cfg
 				      )
 {
-	uint32_t lm_idx;
 	enum dpu_sspp sspp_idx;
 	struct drm_plane_state *state;
 
@@ -426,8 +425,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
 
 	/* blend config update */
-	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
-		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
+	mixer->lm_ctl->ops.update_pending_flush_sspp(mixer->lm_ctl, sspp_idx);
 }
 
 static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
@@ -442,7 +440,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t lm_idx, i;
+	uint32_t lm_idx, stage, i, pipe_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
@@ -463,15 +461,20 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
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
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				pipe_idx = i + stage * PIPES_PER_STAGE;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   &mixer[pipe_idx], cstate->num_mixers,
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   &pstate->pipe[pipe_idx], i,
+							   &stage_cfg[stage]);
+			}
 		}
 
 		/* blend config update */
@@ -503,7 +506,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -516,9 +519,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -535,8 +538,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
+		/*
+		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
+		 * There are 4 mixers at most. The first 2 are for the left half, and
+		 * the later 2 are for the right half.
+		 */
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&stage_cfg);
+			&stage_cfg[i / PIPES_PER_STAGE]);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 5f010d36672cc..64e220987be56 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,6 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define STAGES_PER_PLANE		2
 #define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES

-- 
2.34.1


