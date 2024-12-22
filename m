Return-Path: <linux-arm-msm+bounces-43059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2059FA3F0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 06:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B322188984F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 05:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5479016EB54;
	Sun, 22 Dec 2024 05:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ABjtYV/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4666215B97D
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 05:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734843660; cv=none; b=phxYxlfVxSae/4NT9EbAombwCwe7b4YlsBMi1NfRXfLjjv7lzI1bIQ3dhPPF5pFg8X2J2bv3qkECWAURr9ts4JBmK9y+387uBWjliBMy21GQAooBXwjcey7524/JU2sld7SHrr6HJILQcGiCwOYh+1i5oJlGFgJXKYcXcpPcvP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734843660; c=relaxed/simple;
	bh=o0B+a1EF4We4PO2V9bfhp7XNttccav9liOTM6iCtHpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ex6FrwrYzwLCt1xEPx8kefR92lKMx0CYkz6TlAQqN8NldhnussvwX4+3LBYB+DtMVNpI2zuI7IVAdcufvPn1CN8hXN0ynqS3mlosVwR1zhEpwoSfcJO/Loq/s4+YfDyOqHH1AN25xLaRBHxpgPSTklqSxq2ec5gBaXUO3B6LK0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ABjtYV/i; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401ab97206so3204955e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Dec 2024 21:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734843656; x=1735448456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaQTzRa7GyvxraeqI5vqmNWxM0qcr19enSqB7F9pnhg=;
        b=ABjtYV/iOfEAUO7oG+hgJio4+InVFxC2tpAe50CEVyoZLS7T2eHikPP1f9trimSrbY
         LPNHZuxHOzrSs9zh52YLwY2bnHDhtNnzi2WiiPbC6qQvN7JXcskV9UA6VBzswLhFpfpp
         XPgx5yUYVn+b5LN+AmkPOdfKvGgVNpUCVRvL6Y4JgxkzUy6cWy1coaQ39JF9fVsvGaM+
         Cbef+qGGUiML3LDOlyhVDXATk6jEGZEXinV8hfwuC2+t90CenGOa9fOyU2WLasJqMYKd
         BB/C7ArkqUnzXF22atlbQH+Q19pkFkP56hQ7T24b8Jszz3ov3GfRcpyeMmBPCcHCkSrq
         10iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734843656; x=1735448456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaQTzRa7GyvxraeqI5vqmNWxM0qcr19enSqB7F9pnhg=;
        b=BZLdR9WCAKesbUe4Zr+XblTtux70gUtjaXAq80ZkZFRh6ZObjOufoeDx56GI+SNHYh
         1SJLcx9NrcpPXmY1Mev3KHRfFepJBOCeLQUbZ7Q/vdRAomDiM6e89RYuxXLLlsgTC2Z2
         b1c5vqDHHcjJhyO9dc6OgOuuLpVUpfGAlmHaRZyDD8ZmKVPv3+0uj+JXn23doR0mJsu8
         1qSTeusq9M8Ik04rQV3zVpQZH+rdzToVSiBplUf/91oMLzt7CxHSJmLfq3vAVnkagf+R
         821vzWr13IJvU70LhvznmIek3VTMYCCHS3seNC5wwLyBGEI47iaNeazNibFDVataY0N0
         4ZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbLA/3Tht8OX8Oac3d5dNxOi4wqIJt69stIMtdaI4l0ON+UijUoshL5Cj++NL/+IG7BCN9zhQIVgwMj/23@vger.kernel.org
X-Gm-Message-State: AOJu0YxcUgw1TnAMp6lAU6mA0hOipHqXL2hv0ZQOIvt1hGOqfpLZJxhL
	OX+B5lKdaUV5l3lYivMWEP9iSbpjps/XiWXmHb3ED8E/fXlZlZHsEg1BiVZb31c=
X-Gm-Gg: ASbGncs3NKA1hqN8QCmE4Hc5ocfkE17wPHj4nmluosjUulZGgcnsmYSetwYobYt2Ro5
	P/zolTG+eHBF3UO3io6QFc0ONuIAgfKfcjYIe+ORdl5ZLw3NJyxPiyDABYN2n/INRpACEJ0OzQN
	wPOlYw/x8Zdk2xHWLp8jHJNIFSeKgNsbHSF1D+e5nWetTtlnTURbeGNVeUV5p0mgQcu5yB664GQ
	Cc5PJgTW+7UJgYpUOo+o69P3BO7QcyJnR96A8adyXyM2ebS0TclUsKObte7++RV
X-Google-Smtp-Source: AGHT+IFCHLgrjc5HUCgWghQmBMEv8FeLcEj5wjWCG0Y3qFK+eTqcI2LEnkuQNFWTsXWjWCzbF72i7Q==
X-Received: by 2002:a05:6512:1241:b0:540:2122:fad7 with SMTP id 2adb3069b0e04-54229524544mr2818968e87.6.1734843656392;
        Sat, 21 Dec 2024 21:00:56 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 21:00:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 07:00:44 +0200
Subject: [PATCH 4/6] drm/msm/dpu: move needs_cdm setting to
 dpu_encoder_get_topology()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-drm-dirty-modeset-v1-4-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3602;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=o0B+a1EF4We4PO2V9bfhp7XNttccav9liOTM6iCtHpk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z7H7lKvmpQPT9gsq35qp8BXSedRa8X6iFH/
 oDbcZTeZZCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec+wAKCRCLPIo+Aiko
 1V30CACrnY9yBGk9zsTN2C4/b/4NS4qlZM6+sC2Y/1tiUbIK5OOelFJxlAU9YUwhFjh3IDXOHen
 96VjYP4WOWeys786HTLeSzgDqoyfN1nh4HPZKyTruv8bnO4HOC+smWKvHJp7y0HOB4J7sVMNQHq
 /eBJ+zFbkuUUdpTiYwysNHbZHZqfQyXoUAqckbsq5eb9Ah+uqo6JnYRxH2cDZGg7fuvI+b1ia6G
 7soSXXUPF4As4NiokQVNEFyq7wT1N9hYgm9zhXfEWF5p/c691qcz70X9taEA+xsz3b7Q0R/RAC3
 oRClP3Z3LB3u5boHLR8PSbvh0oDS/eo0nAb6NLszMP47KqxO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As a preparation for calling dpu_encoder_get_topology() from different
places, move the code setting topology->needs_cdm to that function
(instead of patching topology separately).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 ++++++++++++++++-------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1ccdca6044353f110bf5b507788efe368f223a3..88690191a9c9485e052d37749d1b61f50328916e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -652,8 +652,11 @@ static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_kms *dpu_kms,
 			struct drm_display_mode *mode,
 			struct drm_crtc_state *crtc_state,
+			struct drm_connector_state *conn_state,
 			struct drm_dsc_config *dsc)
 {
+	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
+	struct msm_display_info *disp_info = &dpu_enc->disp_info;
 	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
 
@@ -696,6 +699,23 @@ static struct msm_display_topology dpu_encoder_get_topology(
 		topology.num_intf = 1;
 	}
 
+	/*
+	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
+	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
+	 * earlier.
+	 */
+	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
+		struct drm_framebuffer *fb;
+
+		fb = conn_state->writeback_job->fb;
+
+		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
+			topology.needs_cdm = true;
+	} else if (disp_info->intf_type == INTF_DP) {
+		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], mode))
+			topology.needs_cdm = true;
+	}
+
 	return topology;
 }
 
@@ -743,9 +763,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
-	struct msm_display_info *disp_info;
 	struct dpu_global_state *global_state;
-	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
 	int ret = 0;
 
@@ -759,7 +777,6 @@ static int dpu_encoder_virt_atomic_check(
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
 	priv = drm_enc->dev->dev_private;
-	disp_info = &dpu_enc->disp_info;
 	dpu_kms = to_dpu_kms(priv->kms);
 	adj_mode = &crtc_state->adjusted_mode;
 	global_state = dpu_kms_get_global_state(crtc_state->state);
@@ -770,22 +787,8 @@ static int dpu_encoder_virt_atomic_check(
 
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
-
-	/*
-	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
-	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
-	 * earlier.
-	 */
-	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
-		fb = conn_state->writeback_job->fb;
-
-		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
-			topology.needs_cdm = true;
-	} else if (disp_info->intf_type == INTF_DP) {
-		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
-			topology.needs_cdm = true;
-	}
+	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, conn_state,
+					    dsc);
 
 	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
 		crtc_state->mode_changed = true;

-- 
2.39.5


