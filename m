Return-Path: <linux-arm-msm+bounces-42760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7259F7659
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE99F7A4BA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FBA217717;
	Thu, 19 Dec 2024 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eRsGOmzI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3B0217710
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594672; cv=none; b=MU6bNuV6pqd/ujCZQkpsUQUasjTgf1RR87zWKFdmNs49zmT2c4J477Qcus+SHipXd0jD36qI1rz/I7PL6GOTUvaGeYJKY8HRb0n/bdF1DH4bUzyr6UTuqtl6fpvbLMjTMhTvADBV8V1qrV3MLJyEUUsWpjw3gYwZZp0eGMivOK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594672; c=relaxed/simple;
	bh=Kgvxz+JddimpExknfUGmCF8U+2CnnDWzoXq631c2AJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hQiv6K+NJb8aACVhiKZvAE1O2PViCfGxHjXPnGacYi25eEoJbNRCafXRyM0uxes5x5FZuoMomO86cfVmQ0xWlCN4uKboW1RLW9I9caP1yBM4FHVupz948gbOx+pbBeToF3siCEIK8WntLv9vAbcI2iXaNVcwNilocAkv0tSSsSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eRsGOmzI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-725dc290c00so1319130b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594670; x=1735199470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncMQeFnI8FyNCTzJzx/U9WczMhrNIAA5qgalqkzfgpM=;
        b=eRsGOmzIz7WDLTcCu896mDwYtsgShJF2oGTErhbY2QYEofgrsgxqekQMPGa9mxZjCa
         NuaU3JYCgT797c3X3prW1gvs6KxCaOeoHnsjBVlf2aAh2r3cITxTDfXUGvPM3S9T1znc
         MTqkMVyNWYopoSaHtpV7YqymiTDrfjZ9DruPWY1cm8GRVNZ01ug4oGYY8YNMOUGWuEYL
         pAeKa7XoNH0A5Rk3Phq+y8kq58Tqh8amAV0jPdUXJub3qWw+VK4Fw5Q3kkN/XsEorFDI
         V+/MBLiPFx3qnR6TzLFVkUOcth2/rP/rBUfmnYIy1b6sW4+14q6r/rhaQ7ODEaSRY/Vd
         kbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594670; x=1735199470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncMQeFnI8FyNCTzJzx/U9WczMhrNIAA5qgalqkzfgpM=;
        b=EFMSV1JbHQH8tlUg/x4U0xCk7AExaAwP9uN17r3QoMJLc4JrWiHkAoZBSJ+Hbdvm19
         zCBeJVjiJY11ulp2jwFq13803FxMPYGRu2Qdaf2YYxS+bfSg4adxZpXFh7gx6VTaXPcU
         hfm0Nvj91z62/gRO61Ov3z3bgasgL1REYGjsG8+frKf3ZO1EftImZldHJdCNf39CxpHi
         /9leATx8i61ePLhnNz1mKOvS1nTE4i5L/IhUapqCFqHzt7Z7qQN1m3fQ/kNYi4PY0OEn
         pr1blDobUOH+zhTwEGkcJyEahGKBnScDRsJrSwwsKd+8u6va28xE6R3L36XR+bjwzbLr
         0Bwg==
X-Gm-Message-State: AOJu0YzeM9o965meqgiOHu74WCebIDr/1oBfQej078NJFqsOtk7VZ46x
	nu3Kr6Um2R+VSccJHrAfwx0268mf1rH5nXl0wIOb+xGz7yFqkYVZ+OU4vWNEwVIZ8s1qaiam7vK
	COPZyoA==
X-Gm-Gg: ASbGncv33Y0cgCteFdyeA82t5iYt6HhL8sBv9sxrNZKaRNi0gVfLH87Cjf34tSoWStp
	V6pF0nwjCti6N3e+ILL0J+Ph2CgHdxHaOh8s2FAsFpvoqf0sMbqZ0/SVjJaV7ysst5AURTfTOWK
	/u97FlVWsO7XL7aACtuyxNX+PMKJEgsEccGM2qLVgbbS+trCWzUptnXI9VgwZA3oc+3kn9/xKR/
	iHjYP/Weah8Biu7nB/P0OaEzOzVFCvUv0Rnro7wJKKPK98gwlGOMw==
X-Google-Smtp-Source: AGHT+IE6wutQ9rGCjIBHFXRUP8U2cudK8bKqUGf+H0wx8eea9x5QHkaF7AyJwuwtdVhfnshpWOkZ7w==
X-Received: by 2002:a17:902:da81:b0:216:59f1:c7d9 with SMTP id d9443c01a7336-219da6eabaemr34112635ad.19.1734594670471;
        Wed, 18 Dec 2024 23:51:10 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:51:10 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:33 +0800
Subject: [PATCH v3 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=6569;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Kgvxz+JddimpExknfUGmCF8U+2CnnDWzoXq631c2AJ8=;
 b=IVh/pEC+zDsiWrKgIH1DqGmvx8qOE4k3X8IdEM3/dTiXEa5wLm4olw4osrKyvaGNlOBhMWFJ7
 KLSTqXVzqnQAaIwcDd+r75zXKTztI0vY3Zw8qAwibtxfiN5SybfAveG
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
enabled. We prefer to use 4 pipes for dual DSI case for it is power optimal
for DSC.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        |  2 +-
 7 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index bad75af4e50ab..3c51c199f3e05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
 		struct dpu_crtc_state *crtc_state)
 {
 	struct dpu_crtc_mixer *m;
-	u32 crcs[CRTC_DUAL_MIXERS];
+	u32 crcs[CRTC_QUAD_MIXERS];
 
 	int rc = 0;
 	int i;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index d1bb3f84fe440..ce41fb364f3db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -210,7 +210,7 @@ struct dpu_crtc_state {
 
 	bool bw_control;
 	bool bw_split_vote;
-	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
+	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
 
 	uint64_t input_fence_timeout_ns;
 
@@ -218,10 +218,10 @@ struct dpu_crtc_state {
 
 	/* HW Resources reserved for the crtc */
 	u32 num_mixers;
-	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
+	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
 
 	u32 num_ctls;
-	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
+	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
 
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 96d06db3e4be5..6e54ddeaffacd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -54,7 +54,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 2
+#define MAX_CHANNELS_PER_ENC 4
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -664,15 +664,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
 
 	/* Datapath topology selection
 	 *
-	 * Dual display
+	 * Dual display without DSC
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
 	 *
+	 * Dual display with DSC
+	 * 4 LM, 2 INTF ( Split display using 2 interfaces)
+	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
 	 * Add dspps to the reservation requirements if ctm is requested
 	 */
+
 	if (intf_count == 2)
 		topology.num_lm = 2;
 	else if (!dpu_kms->catalog->caps->has_3d_merge)
@@ -691,10 +695,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
 		 * 2 DSC encoders, 2 layer mixers and 1 interface
 		 * this is power optimal and can drive up to (including) 4k
 		 * screens
+		 * But for dual display case, we prefer 4 layer mixers. Because
+		 * the resolution is always high in the case and 4 DSCs are more
+		 * power optimal.
 		 */
-		topology.num_dsc = 2;
-		topology.num_lm = 2;
-		topology.num_intf = 1;
+
+		if (intf_count == 2) {
+			topology.num_dsc = 4;
+			topology.num_lm = 4;
+			topology.num_intf = 2;
+		} else {
+			topology.num_dsc = 2;
+			topology.num_lm = 2;
+			topology.num_intf = 1;
+		}
 	}
 
 	return topology;
@@ -2195,8 +2209,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 	struct dpu_hw_mixer_cfg mixer;
 	int i, num_lm;
 	struct dpu_global_state *global_state;
-	struct dpu_hw_blk *hw_lm[2];
-	struct dpu_hw_mixer *hw_mixer[2];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 
 	memset(&mixer, 0, sizeof(mixer));
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 63f09857025c2..d378a990cc0fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -302,7 +302,8 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 
 	/* Use merge_3d unless DSC MERGE topology is used */
 	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
+	    (dpu_cstate->num_mixers == CRTC_DUAL_MIXERS ||
+		dpu_cstate->num_mixers == CRTC_QUAD_MIXERS) &&
 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3ab79092a7f25..d9cc84b081b1f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -25,6 +25,7 @@
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
 #define CRTC_DUAL_MIXERS	2
+#define CRTC_QUAD_MIXERS	4
 
 #define MAX_XIN_COUNT 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 27ef0771da5d2..1fe21087a141a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -33,8 +33,8 @@
 #endif
 
 #define STAGES_PER_PLANE		2
-#define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
+#define PIPES_PER_PLANE			(STAGES_PER_PLANE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 57ccb73c45683..b5c1ad2a75594 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1474,7 +1474,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 		trace_dpu_plane_disable(DRMID(plane), false,
 					pstate->pipe[i].multirect_mode);
 
-		if (pipe->sspp && i == 1) {
+		if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1) {
 			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 

-- 
2.34.1


