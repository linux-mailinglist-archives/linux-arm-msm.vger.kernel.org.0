Return-Path: <linux-arm-msm+bounces-650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A007EBA07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 00:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D2BBB20A3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 23:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A9926AC0;
	Tue, 14 Nov 2023 23:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="I/lWWWwA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0090626AD1
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:00:30 +0000 (UTC)
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DADD2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 15:00:28 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7788db95652so402500785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 15:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1700002827; x=1700607627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCsm7VCedF16OrkkHsKZ3GlEGsmWacvBMw8jR+/V2pU=;
        b=I/lWWWwAR4elrbtN89w7VqSMtCkx3kQYTC+bfalx4c+YY+iwWL2T0ADaN08nPgTgqY
         4+s7gCEZaWk/OJLv7FJmQun+M3KycBI7DWNREapELvaX8098ckeAjlO5VG8bwo6Vi0yQ
         4mXhZCYalsBg98MQF7R0bzADg7NZm49v/aLJPaceqm9PUMX4eOM0V9Z0IPiNY51kbQcJ
         QtyM1kXh91majHRz67vX1YH+UmPTb7gtpuxsb4p5g6HL91prNeglhu5RMvSx6TukXtcI
         kfjMGT3kyHig/G4toLn+Jh8Zc15ulufkbbxIr3wpKcKe/l3CRJCSbj9lP94sIkTCqMcI
         yNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700002827; x=1700607627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCsm7VCedF16OrkkHsKZ3GlEGsmWacvBMw8jR+/V2pU=;
        b=v6SBDOdLIho7r2XUf0CxnyBWevVVnwwdt0jXE9KcBGl4unr+J2iiWOyJvq3PRgG2Lj
         FDuuVy158cYP8X0ZFXUgZnlQJ04+0gO+iDf2I+FEuIngyxL1gv/vNYVlRq+StFg3t/As
         aSHvZTXektyrZKKQWdxohJLGvFGXEWvaPQv/MIxs6eyJXXkInaAW7k2ttKIL6jS86bpQ
         hxSNQ2XhtXOsIbq6l+/cx4D2GTv5/D/c/4heF8WXFO28Ar5y76mgb0/ky7q7wLjyX7sU
         ApOWD01ELjAd/gPVYPrcPoKVwTXioZJltTJkJ5h1OKwZzSbICiAxP5BITLMYqKrT0jUd
         vKOg==
X-Gm-Message-State: AOJu0YzJwGUzbEZIuyO33oIr/ut3rxT4hp3mFxxaOUa9D4dfYFH6jLgR
	AnfZ8XURmIamnnopRTYdKsnOdw==
X-Google-Smtp-Source: AGHT+IGhxfGR9iFdmqeZtNyN8JXoHEt4QSyhdvoHgLMcAm8gIgPgRQ/R51UTcNkf5EfuQLRv6LpEbw==
X-Received: by 2002:a0c:be88:0:b0:677:9fb2:26e9 with SMTP id n8-20020a0cbe88000000b006779fb226e9mr3489562qvi.14.1700002827707;
        Tue, 14 Nov 2023 15:00:27 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id u2-20020a05621411a200b00674a45499dcsm25274qvv.88.2023.11.14.15.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 15:00:27 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	Kalyan Thota <quic_kalyant@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Arnaud Vrac <rawoul@gmail.com>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/6] drm/msm/dpu: fix video mode DSC for DSI
Date: Tue, 14 Nov 2023 17:58:29 -0500
Message-Id: <20231114225857.19702-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114225857.19702-1-jonathan@marek.ca>
References: <20231114225857.19702-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add necessary DPU changes for DSC to work with DSI video mode.

Note this changes the logic to enable HCTL to match downstream, it will
now be enabled for the no-DSC no-widebus case.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 11 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c         | 13 ++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h         |  1 +
 5 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1cf7ff6caff4..d745c8678b9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2477,7 +2477,7 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
 	return INTF_MODE_NONE;
 }
 
-unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
+unsigned int dpu_encoder_helper_get_dsc(const struct dpu_encoder_phys *phys_enc)
 {
 	struct drm_encoder *encoder = phys_enc->parent;
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 6f04c3d56e77..7e27a7da0887 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -332,7 +332,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
  *   used for this encoder.
  * @phys_enc: Pointer to physical encoder structure
  */
-unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
+unsigned int dpu_encoder_helper_get_dsc(const struct dpu_encoder_phys *phys_enc);
 
 /**
  * dpu_encoder_helper_split_config - split display configuration helper function
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index a01fda711883..df10800a9615 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -100,6 +100,8 @@ static void drm_mode_to_intf_timing_params(
 	}
 
 	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
+	if (dpu_encoder_helper_get_dsc(phys_enc))
+		timing->compression_en = true;
 
 	/*
 	 * for DP, divide the horizonal parameters by 2 when
@@ -112,6 +114,15 @@ static void drm_mode_to_intf_timing_params(
 		timing->h_front_porch = timing->h_front_porch >> 1;
 		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
 	}
+
+	/*
+	 * for DSI, if compression is enabled, then divide the horizonal active
+	 * timing parameters by compression ratio.
+	 */
+	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
+		timing->width = timing->width / 3; /* XXX: don't assume 3:1 compression ratio */
+		timing->xres = timing->width;
+	}
 }
 
 static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index e8b8908d3e12..d6fe45a6da2d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -166,10 +166,21 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	 * video timing. It is recommended to enable it for all cases, except
 	 * if compression is enabled in 1 pixel per clock mode
 	 */
+	if (!p->compression_en || p->wide_bus_en)
+		intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
+
 	if (p->wide_bus_en)
-		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
+		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
 
 	data_width = p->width;
+	if (p->wide_bus_en && !dp_intf)
+		data_width = p->width >> 1;
+
+	if (p->compression_en)
+		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
+
+	if (p->compression_en && dp_intf)
+		DPU_ERROR("missing adjustments for DSC+DP\n");
 
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index c539025c418b..15a5fdadd0a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -33,6 +33,7 @@ struct dpu_hw_intf_timing_params {
 	u32 hsync_skew;
 
 	bool wide_bus_en;
+	bool compression_en;
 };
 
 struct dpu_hw_intf_prog_fetch {
-- 
2.26.1


