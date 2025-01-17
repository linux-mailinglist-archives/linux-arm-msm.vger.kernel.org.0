Return-Path: <linux-arm-msm+bounces-45431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C66A153AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B2A1882674
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4E21A3AB1;
	Fri, 17 Jan 2025 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="taqTWpOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587671A3A8F
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129765; cv=none; b=h7R5WCZeZKlJ7PAQOP0GkThIGGaRU7PyOPjWVh0C2AhLADIPo8jxwjwHhIW0HiC3sVUk+U9elnfHG7ZtIvCuxxxYcLoOiCjVPTKvKn+nnyf1uG06aFbAHK5hpp0M4JrcDiv7KCNLqEaABEz7C2ygGcCPlU3uHcIOgduamwDAPns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129765; c=relaxed/simple;
	bh=ycMqXmVokZ1n86VFFX+45uoPmFWZS+5o6hFuoVeThpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aw/IzBWz5AM92rTaY+l0p21NSqV7ccTGgMhGqoA+MtSJ/2Rf6OlkgjaIz/RkjLEoszmx2HpZXtKXrBZ8fXaI/P318U3Cz2c+YNCYbzhvVHTgPYDkA0eBEcLhGD71d4IZf4PfRC9zNRLIarJdCRWBwMAx32Z9qNlaCuSedvNdXuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=taqTWpOU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21644aca3a0so55441295ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737129763; x=1737734563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaGM10cVg6jvGCVGU6h5sRoVI7BkvLHmz+ukxbH0FIg=;
        b=taqTWpOUoxaQlAJOjbJe3Xy387M8reID966ktRDUP9iltmQLejUzqYbW3xXBZly12D
         1gEt/+x8BtsmJFzyNNvUxYOsRxb7Awl2F3EQn0oCCawqGYpn5ZnwuyzMPK85iXkd6b5H
         INPxRhhidLR51RrqmIp59gcK9F8Jmj0ne4p5BjaiwK0pkoERP0+g3HyfNA0ivQN80Jfq
         E+TrUt6mTAIYIts60HO03g5H3AoJKdFtbG/Oc3Kmcm1HohxEI8WtOE8vEJa4MwElQHwQ
         X988Ey5AVV89ysYEJyY1ByYo+Q/UGUDf+veL6xvXaEcHfhuASAaLe9U7AGI9sfxycMSa
         q/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129763; x=1737734563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaGM10cVg6jvGCVGU6h5sRoVI7BkvLHmz+ukxbH0FIg=;
        b=S/ni31u7Zk1bH+86/rCysjh9EzkVE34AuxWzzZosgUSju6i9GNqSSaBo9HvPjgxFad
         bXlBIPWUzVvY9sR3jmXAfTJ9WzckJEAflaElrOlBTze9lPEmQkcZ86P8YjplVAs2XV0z
         Dx7B+q9TjwS3xqxDofAliQT00wLLX0kV3kuy1Y8oLf1mrd4ScyTEbH+NJFN0iT2wTiHx
         LgEd/0742lTyqQDIP6Fv78F/Tp9RZ0cquekLkubJ2r2oxaXQ+HQ3TI+jbqL6cEY8KJUf
         1c+3Do/lgV/x8zk6T8zZinYl8NYR0QWlHFlqxgQAt78WJIiWGQj2rAAPZE08sjdnZrkv
         Ti2g==
X-Gm-Message-State: AOJu0Yyv6pAx3vLAE6k0XzccJObdOQIvIBPfuzoOg8qEvtD1IMZiL+Za
	el0liAUFnxBCW9et4BbyTkya9qmEMeqgQ8tocunKbCQYyUtKEayytGLEeLyDaBY=
X-Gm-Gg: ASbGncv2PAkL+VJE0NitttNAtQyhNNBuMINg2tctN+mQC8Cq7hReaQqjrMTM5f0BEPh
	m8oVsXD2kdBTx83vHA3JtjcJ78FIXqLEhcN+Tzxw9EBG3SqskQyMMLAMouIKCxwukMzIcT9QJ7t
	2x8quXMejrcTMfAzCZ8kHRLkNSix63vFwfIfL0dgAk0JxwmAJhXLrNHTWbCVRG57nzNZ51mtDze
	A1TRvdB/wxTJyWqst3wz7liZ/6j5zaxdlMRSH2STIyOoWxu2Hbwpg==
X-Google-Smtp-Source: AGHT+IGDj0/894RNb/cPu4DzEA3GkbG/kxNG/YeY1LFOWsNhLB5/BegmV28U4Thv/AkOpxYga7tvCg==
X-Received: by 2002:a17:903:1744:b0:216:1357:8df8 with SMTP id d9443c01a7336-21c355ee6d0mr43195785ad.43.1737129762661;
        Fri, 17 Jan 2025 08:02:42 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:02:42 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:58 +0800
Subject: [PATCH v5 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-15-9701a16340da@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=6056;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=ycMqXmVokZ1n86VFFX+45uoPmFWZS+5o6hFuoVeThpA=;
 b=TOAk7KF/QOIaFQRcYVe6qyVA/8ZMDmGujDHCqgvGl03GLcbbv5loT0G6rNQeE6deygdT+lbcA
 yC+1H2CmRBaD4sPYLLgqiceofIUFvpzMBvArs78pKLNrbgcoLjoflAb
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 6 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 852c2ea632f1b..6b306755fceb3 100644
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
index b14bab2754635..38820d05edb8b 100644
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
index b0cab3ccbb57c..22ac7bbf5f775 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -54,7 +54,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 2
+#define MAX_CHANNELS_PER_ENC 4
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -664,9 +664,13 @@ static struct msm_display_topology dpu_encoder_get_topology(
 
 	/* Datapath topology selection
 	 *
-	 * Dual display
+	 * Dual display without DSC
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
 	 *
+	 * Dual display with DSC
+	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
+	 * 4 LM, 2 INTF ( Split display using 2 interfaces)
+	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
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
+		if (intf_count == 2 && dpu_kms->catalog->dsc_count >= 4) {
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
@@ -2194,8 +2208,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
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
index 63f09857025c2..a9e122243dce9 100644
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
index 4cea19e1a2038..77a7a5375d545 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,7 +24,7 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
-#define CRTC_DUAL_MIXERS	2
+#define CRTC_QUAD_MIXERS	4
 
 #define MAX_XIN_COUNT 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 64e220987be56..804858e69e7da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -35,8 +35,8 @@
 #endif
 
 #define STAGES_PER_PLANE		2
-#define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
+#define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
 #endif

-- 
2.34.1


