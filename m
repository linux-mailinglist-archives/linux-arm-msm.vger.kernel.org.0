Return-Path: <linux-arm-msm+bounces-56982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7CAAACA17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 17:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B89D1B67B76
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DAB285418;
	Tue,  6 May 2025 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="alH6NRrC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C342128540C
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546578; cv=none; b=WLg/bweI9QH2gWrPTb4DIqJDsGQ6Mwdz3N27OiAR1UPbxWBiS9a76rxFWUaSWJoheQr83Uyu3IxpnDGSMK5G/dTtXBjI9/zCz2eK9CDmkiaJfA2Mektr/e6eRXxo2XdVelXziz1hdHuRUYUo6ttGAtomIINMwBRb9SmOhQZ/cco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546578; c=relaxed/simple;
	bh=bWAcSzETExg/KGGM/1vDL0wVbfmxhh6cgKbTTQa/TQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s+sNuHYXUgFs2f0d2JXzhQ/UF8u3ZnD3zEL727qpnxso5Qp/fw8heK+P84wKB3B6qhSkhX2nLtIfR8HaNnWuVhhUoDlda0Hx3avHEvHVAk2l4UYDOWlzoIv3vJ2Kc3fEwvBzfWo2yoRAVCSYxXW+oL02F3oj8ljXxet00sEzbvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=alH6NRrC; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b1fde81de05so872054a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546576; x=1747151376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJfPfqxN04tRcHuJTvP/17b0SOsewAKLpZOEVwT+vec=;
        b=alH6NRrCiwy7r5Xs3banZJCNxGFEGwOiqBYRjk3Mo+lbw0feHMt3+tZtXUp61BKK5K
         PwoyZZzzutOpPC/71LRzxU2GfEw5MAZm+wpCtMLo0Dk1uVRpQdV967oI7b5cb8BQ7Zrq
         oe3Yw3a0cCntLFQURu+g7IaeXAELZffeELO8Kcg9Ow1cw22oC/rDKmj2OSW2V1K7eNpX
         +sanu76ZFr6ArD1Ek1Zi+xp4TQQNdYjOm959YQjY0aJyZBdPE5dFlZN/4cwdm+xHjnOI
         vU4MXQ5bp6YEl2qHGWwaq3kdjSqJNbZ3WYLgSzLqqcR620u1nIfFMGYBI3jyOGfSbCYY
         xzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546576; x=1747151376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJfPfqxN04tRcHuJTvP/17b0SOsewAKLpZOEVwT+vec=;
        b=WIxMYOie1qkvmHQqCmcMKp5cfJ5f/8FTIf8cG5l6T6H6wiiFpv0w8Fu5bHM3W3JD1D
         w2W/bUQsmAjIpIYgLsucvllyWP0y8xwNunlhTF2GnrnJ0ti7eQzCmEceGv6KBIF+ON6y
         onA30tNKevwswF7ssWGKSrrn+rxOylCJ7JaVxD9L7ffTFStNtXTMOyYsBFb5RWyx5pOD
         NBT9M87kdt4EHxdlTQYHdY5iKj8g5U4hnoRyeguqoO8zRIXUqVESR/y37z21yXZ92e4H
         n2C+Q+1apywN24MmQ/V3L4PKv9NpYUrFG71xSgrTH2oF5IGsr5SoYCAjD+HBsgnRmwba
         ssOg==
X-Gm-Message-State: AOJu0Yz5G/I6sZFweNd6/5vTyftuthshVq9q7GZ3NrinvDMv9oQa3J74
	IzruHFcf4hypL87R9l61vzfGabJrY/XOmCjDJQIyK4HuuiLwnZOBVtOOhO8w2wm3n6zQH7SgNqC
	etQEhDg==
X-Gm-Gg: ASbGncvrnyc2ltb3nnHV6FeeM5Qq84jyW1qDbBPLFHq4oeV7JkdampAf4jVzhe6sEPW
	KlnD2rEE78NqIAvaUzqe4iAR74c8tYS4yN1DbZpNBBaaExRBPcqR0dXGBNjHFekVY7g/B+mzKgw
	XlLHvxD9nGAvS0m92xKoqqB7hJ0aCBUN6vBuBwnOi+IuPsxxFp6gsEuWPigRkFeSm0uEu9HGP17
	YnZ7ScISdDPe/BsDiHu3Bw48N2lBQPt3WFLEPy8uMy/wfFrBjnAX2aWyII+9MydSoQaMSJrnIGT
	Q41FnCkauseZvS8lJrdz2DIQsKeKB7EZ/Z7dZg==
X-Google-Smtp-Source: AGHT+IFLVpUs0SxhkEcngeGaxp/pl6HB4DFree9X1wlmmEW4M72fZ9J8d6beRPOcNgsBPIZxGtjRlA==
X-Received: by 2002:a17:90b:1dc7:b0:308:5273:4df8 with SMTP id 98e67ed59e1d1-30a4e5a57e5mr30533520a91.10.1746546575542;
        Tue, 06 May 2025 08:49:35 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:49:35 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:44 +0800
Subject: [PATCH v9 14/14] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-14-f7b273a8cc80@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=8091;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=bWAcSzETExg/KGGM/1vDL0wVbfmxhh6cgKbTTQa/TQk=;
 b=dpIvgApq8oI4Fz/Lc2zz94pjBPEkbUxlON6PqI77JtMswzVUGZL/Mle2Wf4C6bjcnYtK9eDVi
 FI1AelUb/DZAsryz1/jfU/zmH9naTCsss4BuAnYYRz+SNJyZeLCDphA
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

To support high-resolution cases that exceed the width limitation of
a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
additional pipes are necessary to enable parallel data processing
within the SSPP width constraints and MDP clock rate.

Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
and dual interfaces are enabled. More use cases can be incorporated
later if quad-pipe capabilities are required.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 +++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 6 files changed, 35 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index a56d68de219910a827830293e8ff24f4cdee74e4..f22ca13b35e778fed3e6e02c581ef689a5544cfb 100644
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
@@ -1296,6 +1296,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
+	u32 num_rt_intf;
 
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
@@ -1309,11 +1310,14 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * Dual display
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
 	 *
+	 * If DSC is enabled, try to use 4:4:2 topology if there is enough
+	 * resource. Otherwise, use 2:2:2 topology.
+	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
-	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
+	 * If DSC is enabled, use 2:2:1 topology
 	 *
 	 * Add dspps to the reservation requirements if ctm is requested
 	 *
@@ -1325,14 +1329,23 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
 	 */
 
-	if (topology.num_intf == 2 && !topology.cwb_enabled)
-		topology.num_lm = 2;
-	else if (topology.num_dsc == 2)
+	num_rt_intf = topology.num_intf;
+	if (topology.cwb_enabled)
+		num_rt_intf--;
+
+	if (topology.num_dsc) {
+		if (dpu_kms->catalog->dsc_count >= num_rt_intf * 2)
+			topology.num_dsc = num_rt_intf * 2;
+		else
+			topology.num_dsc = num_rt_intf;
+		topology.num_lm = topology.num_dsc;
+	} else if (num_rt_intf == 2) {
 		topology.num_lm = 2;
-	else if (dpu_kms->catalog->caps->has_3d_merge)
+	} else if (dpu_kms->catalog->caps->has_3d_merge) {
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
-	else
+	} else {
 		topology.num_lm = 1;
+	}
 
 	if (crtc_state->ctm)
 		topology.num_dspp = topology.num_lm;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 6eaba5696e8e6bd1246a9895c4c8714ca6589b10..455073c7025b0bcb970d8817f197d9bcacc6dca5 100644
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
index a125a477404fdafee6495f6d3778160f14a01a96..bbb0873a891879722f2b02767fc48b7406de70f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -55,7 +55,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 2
+#define MAX_CHANNELS_PER_ENC 4
 #define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
@@ -675,22 +675,12 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
-	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
-	if (dsc) {
-		/*
-		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
-		 * when Display Stream Compression (DSC) is enabled,
-		 * and when enough DSC blocks are available.
-		 * This is power-optimal and can drive up to (including) 4k
-		 * screens.
-		 */
-		WARN(topology->num_intf > 2,
-		     "DSC topology cannot support more than 2 interfaces\n");
-		if (topology->num_intf >= 2 || dpu_kms->catalog->dsc_count >= 2)
-			topology->num_dsc = 2;
-		else
-			topology->num_dsc = 1;
-	}
+	/*
+	 * Set DSC number as 1 to mark the enabled status, will be adjusted
+	 * in dpu_crtc_get_topology()
+	 */
+	if (dsc)
+		topology->num_dsc = 1;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
 	if (!connector)
@@ -2176,8 +2166,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
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
index 61b22d9494546885db609efa156222792af73d2a..09395d7910ac87c035b65cf476350bf6c9619612 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -302,7 +302,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 
 	/* Use merge_3d unless DSC MERGE topology is used */
 	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
+	    (dpu_cstate->num_mixers != 1) &&
 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..77a7a5375d545483edb316e8428df12212191362 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,7 +24,7 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
-#define CRTC_DUAL_MIXERS	2
+#define CRTC_QUAD_MIXERS	4
 
 #define MAX_XIN_COUNT 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 7c74221380b2c05225c9f82ed6d33765042aec78..94f117e36af83602e5254ebcf5f28de36fd79886 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,7 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define STAGES_PER_PLANE		1
+#define STAGES_PER_PLANE		2
 #define PIPES_PER_STAGE			2
 #define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES

-- 
2.34.1


