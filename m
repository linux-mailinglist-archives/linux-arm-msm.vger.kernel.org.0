Return-Path: <linux-arm-msm+bounces-20398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFEA8CE605
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57C151F24D33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 13:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6687D127B68;
	Fri, 24 May 2024 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWLvLvE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DEC127B47
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716556793; cv=none; b=E77IEOYcrdqr0sOIC9QOo1sIJwKF8/Af4S1tNdMAUZnPV5qPrDpM8AkqtPsqatz5vReP7d9zMxxk28VqwB8adFNDJvLUxPYtTU3hkRtXDx6Z/bp+q70qTMJRbwfvpqyz1G4+lLQLWKHSUmlszn34hGBRbjd2D7jh3168F1xltEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716556793; c=relaxed/simple;
	bh=H07H3IMSA/J1mHrNPpqm02O4EDAuHNlRiIkehTyFoK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZQvcg35Cgh44p6k530b0I2axtqbElNFmz996Sp0Hq2/bPZXIfIgeXsU104iRod6X+L5N1+GG1K4yNDEW8qm+n0x6ioGPnHb6rEDXJepbk+oXHew2kBo04I9IuSYpdWmJgyXg9dkA5HtDAM2XXRcSmDcL5GZ/qfKQRMwtZOo58U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWLvLvE/; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f4ed9dc7beso2434213b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716556791; x=1717161591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgnpbWbGj3yU1TMQYCC73xr75efIX86FBQqi5p9vSKk=;
        b=DWLvLvE/tqKaSRuah1LQyda+yIeXRdphr3TQNUqXLeIBVBCJVoIAT6rCPetApgnRG+
         ti6t+XXXXpPVwa83eCeqFbnKdaN35Zf3RiP3pv5HpZrShP59Gj6CyN9FEhuCRQokOf2o
         G8w1IFH7OHgmCMzwBXe2eF3yY8v11qugvOW4yrTgogSk6JrznBhGY6tLcDz7hPX4jIlS
         faGGHLPljHR3PeGR5NxtD6FeFKTS36jPfc2KCKn/tBrNIAx94O0A3qswk26dREoRN3Ub
         vPUzzkffLmTf9YnFuPoqj/4qYTimBFzvbBMlwXq1FBBNDPQnK9CyVgUIGw4kuGeJaBka
         Nkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716556791; x=1717161591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgnpbWbGj3yU1TMQYCC73xr75efIX86FBQqi5p9vSKk=;
        b=h9fbJvmyU1UC7rTyVvdN42BziB4lHDm5HOxCkhmq9vPLjiN14jLKl0Sdv/SnUC9DN3
         bQKOjsfFB0TdCrYOvkj6sMjalW+dYHPq3itxfCZ/qC+tZJn+V6W2LioYSDIjHq0UORhU
         nUZ4Gqej4FPnTW1482TDx0aZgbHUzOX3PvhWLVqt7LjBCRZaRqhHF4zPE7EPr+fjKLl3
         C/829a34bIRhY+XEvFka59IEoxyq6xNPzLTZwFyzdxTtzdgtZsjjjQTQSGb7gJ85bPxb
         4MGmTYWR+7To9HBREnZVz4tRFJbVC4iWxbu1bddUNaC9OXtNiT3GHxuCJF+nDXvj9/R0
         8AYA==
X-Gm-Message-State: AOJu0YxsMisEE5BJhET1WMKbEhcQ1KbtFLm9KgNJJP2wasNhJlzJ0ABj
	/pwQjvqLAudVeRQNf4b+cFMQDkyd/JDfI5eRk/WYmIKtcHA/VeoNxxJyZyKfmA4=
X-Google-Smtp-Source: AGHT+IHEL4x3gdCON7O0PynMBudw0cI55G33C2OPQFRzasPKKJOw+FbXFLEwCynVADqa94yWY0QenQ==
X-Received: by 2002:aa7:8648:0:b0:6f4:463f:af87 with SMTP id d2e1a72fcca58-6f77272c7ffmr7223303b3a.10.1716556790997;
        Fri, 24 May 2024 06:19:50 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd2d492csm1117852b3a.179.2024.05.24.06.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 06:19:50 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 24 May 2024 21:18:21 +0800
Subject: [PATCH v4 1/5] drm/msm/dpu: fix video mode DSC for DSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-1-e61c05b403df@linaro.org>
References: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
In-Reply-To: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716556778; l=3797;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=JIgIjSOIfhG3fLTjQkNn/7rXE9jtdjcvz5fMJSC9CV0=;
 b=Z2YHTYe+mOeh6vgYVQwL8RpgZX485ZkH8fuoQG+ixY9WJPhPcpb+aoVSNtxZXGkOILQR7IlYs
 Kk9Gbeyr3/FCXrUnQR2ebaVJnh/3pG/UryqSlvvQanLbnrUK7MdRWx7
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

From: Jonathan Marek <jonathan@marek.ca>

Add necessary DPU timing and control changes for DSC to work with DSI
video mode.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 13 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          |  4 ++++
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 119f3ea50a7c..48cef6e79c70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -564,7 +564,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
 
-static struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
+struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
 {
 	struct msm_drm_private *priv = drm_enc->dev->dev_private;
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 002e89cc1705..2167c46c1a45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -334,6 +334,14 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
  */
 unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
 
+/**
+ * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
+ *   This helper function is used by physical encoder to get DSC config
+ *   used for this encoder.
+ * @drm_enc: Pointer to encoder structure
+ */
+struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc);
+
 /**
  * dpu_encoder_get_drm_fmt - return DRM fourcc format
  * @phys_enc: Pointer to physical encoder structure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ef69c2f408c3..7047b607ca91 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -115,6 +115,19 @@ static void drm_mode_to_intf_timing_params(
 		timing->h_front_porch = timing->h_front_porch >> 1;
 		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
 	}
+
+	/*
+	 * for DSI, if compression is enabled, then divide the horizonal active
+	 * timing parameters by compression ratio. bits of 3 components(R/G/B)
+	 * is compressed into bits of 1 pixel.
+	 */
+	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
+		struct drm_dsc_config *dsc =
+		       dpu_encoder_get_dsc_config(phys_enc->parent);
+		timing->width = timing->width * (dsc->bits_per_pixel >> 4) /
+				(dsc->bits_per_component * 3);
+		timing->xres = timing->width;
+	}
 }
 
 static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 225c1c7768ff..2cf1f8c116b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -168,6 +168,10 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 
 	data_width = p->width;
 
+	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
+	if (p->compression_en && !dp_intf)
+		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
+
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
 

-- 
2.34.1


