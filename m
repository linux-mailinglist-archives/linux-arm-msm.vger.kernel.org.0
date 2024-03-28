Return-Path: <linux-arm-msm+bounces-15551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA0A88FDCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 12:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D17A11F24354
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 11:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043B07D400;
	Thu, 28 Mar 2024 11:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g8v2umrb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1891374EF
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 11:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711624333; cv=none; b=O3sMWAt1c2rs802+H5uabXjoGrz41bM9qE1D41FoiiYnEq5LHBAvaJoucUSFRSopNQBjxmVWJQqDGc93J0QmrmqVVwRhM/uiF6eYPgGiY2xe+JzVFu+LDcETFHGxKDo3Qq92OgwZabcZeRqIjmCtapr3OOeo1CFnHGKk8ZVlQtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711624333; c=relaxed/simple;
	bh=/cePtRHZg7XsqCFGzc78ezlk+7G9DXlRMb1xzEnSfnA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i6WK7qYHFh3/VC9anDRR1wcjVy093YzvYnBUbXkIhAtkV/c9LJENfg0BVDpDcHryKrM4sztXJ9tzNIp95Xxb0Cn9HVHu1B3nzFugxuam39TBCTvHMdtOsgyO7IbFx0XGJ37Ri5neIpeN7yTwZOLaAIOm5SyJTF0QaB3wRO6mYRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g8v2umrb; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e6c0098328so666750b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 04:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711624331; x=1712229131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt33Rr5w82hGvdiqgnCu2WTG/IPDnQKymInQfgtwYM4=;
        b=g8v2umrbmefBJfCjp8evjhNkoJytrJ2UhuTyLOpsSOeQa2Gi67PRDZ3TuKmEBeeDQg
         2T1uQaMQEeZqc8eBCNIzMnNGLPwj/hNOnT+Gx0XNs4jfTtQlGrE8hgsLm5zNitMDQhoW
         A4zndGdfqKuCF9jU0s80pinxwSLnlJotL8+p2pUgBMobWsW5o3+VCmiinRTpMSzFUdyV
         ghjf2Rn7U9v70dit/M26ODpknuqjhZ1yYb5XsVJTM5+PThfJs+hQF8tupQ6wWqP48fB7
         hurT6oSoTrEH/76nX+X6/KQY+HWJSapSwQZl0C/HZ0MlrXrMFBrqlUbe46NScKzhc77M
         KZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711624331; x=1712229131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bt33Rr5w82hGvdiqgnCu2WTG/IPDnQKymInQfgtwYM4=;
        b=a5Voy35xD86bUsaaIRSEqiaiIP4A49mTAkUuGpYSQjI7cUc6eWdDDmscSLOpxclvcG
         MHFaeFmnzfuGRHafAf+WoIkoSFFjAgL3UJhNSkkHNrHtjoCv+bUg2+zIRjTfTLC2NYA/
         3sVpD0xfENuulukgUumtH9fvWeCQ5JJdKHtCnbxltf8hHJ5Tx6oSiPfSCCN1qbouvJZN
         jCxSx9dVAfVIkj2L4kYHJmfS2Z71sqFkebyUbj8ykqeujEwCQ7CCnv7x72mF1AQR4xzn
         pboL4LyZvDosgAJ+28s5wqSn+FmmRXoNr4j5FKyZP5S6kkh/PMNmUvEYJMM7tU/FiIG8
         obTg==
X-Forwarded-Encrypted: i=1; AJvYcCUfIaYPvGqzwW3YAGJUZc8MIEJOL8OVVUJ/jFUnBLmLV7L4RPraz4Lk6p+ImGaBZz7Cf1/eFzf6aD/CK6NUJkm8AojkxRBen6hG1k/tIQ==
X-Gm-Message-State: AOJu0YxGM3mcAHzplPE1mUwOsNDdSMJ48nNNZlWVdjlGlY6v0KAWgYMZ
	N0k5YowzdIbSFYAIEuVjNA8lxg2P51OGE1UFcziwDivJjLC3ImSUX+xs8GjD8Mg=
X-Google-Smtp-Source: AGHT+IGgsUcyXeY8FDF8vS2XCppnudwEwoWxOKePjoBvuZitWaVpJrbYlKgd5O3rBlkgeUOtzYYyOw==
X-Received: by 2002:a05:6a20:2d0f:b0:1a3:e681:29ce with SMTP id g15-20020a056a202d0f00b001a3e68129cemr3452492pzl.52.1711624331212;
        Thu, 28 Mar 2024 04:12:11 -0700 (PDT)
Received: from niej-think.bbrouter ([112.65.12.82])
        by smtp.gmail.com with ESMTPSA id k7-20020aa792c7000000b006eab9ef5d4esm1114607pfa.50.2024.03.28.04.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 04:12:10 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: neil.armstrong@linaro.org,
	dmitry.baryshkov@linaro.org
Cc: sam@ravnborg.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	quic_parellan@quicinc.com,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	robdclark@gmail.com,
	seanpaul@chromium.org,
	swboyd@chromium.org,
	quic_abhinavk@quicinc.com,
	quic_jesszhan@quicinc.com,
	marijn.suijten@somainline.org,
	sean@poorly.run,
	Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 1/3] drm/msm/dpu: fix DSC for DSI video mode
Date: Thu, 28 Mar 2024 19:11:56 +0800
Message-Id: <20240328111158.2074351-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix DSC timing and control configurations in DPU for DSI video mode.
Only compression ratio 3:1 is handled and tested.

This patch is modified from patchs of Jonathan Marek.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 12 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 10 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 48 +++++++++++--------
 include/drm/display/drm_dsc.h                 |  4 ++
 8 files changed, 56 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6a4b489d44e5..c1b9da06dde2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2440,7 +2440,7 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
 	return INTF_MODE_NONE;
 }
 
-unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
+unsigned int dpu_encoder_helper_get_dsc(const struct dpu_encoder_phys *phys_enc)
 {
 	struct drm_encoder *encoder = phys_enc->parent;
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 993f26343331..5000fa22ad40 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -339,7 +339,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
  *   used for this encoder.
  * @phys_enc: Pointer to physical encoder structure
  */
-unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
+unsigned int dpu_encoder_helper_get_dsc(const struct dpu_encoder_phys *phys_enc);
 
 /**
  * dpu_encoder_helper_split_config - split display configuration helper function
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index d0f56c5c4cce..c0ff39450e66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -102,6 +102,8 @@ static void drm_mode_to_intf_timing_params(
 	}
 
 	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
+	if (dpu_encoder_helper_get_dsc(phys_enc))
+		timing->dsc_en = true;
 
 	/*
 	 * for DP, divide the horizonal parameters by 2 when
@@ -114,6 +116,16 @@ static void drm_mode_to_intf_timing_params(
 		timing->h_front_porch = timing->h_front_porch >> 1;
 		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
 	}
+
+	/*
+	 * for DSI, if compression is enabled, then divide the horizonal active
+	 * timing parameters by compression ratio.
+	 */
+	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->dsc_en) {
+		/* TODO: handle non 3:1 compression ratio, such as 30bpp case */
+		timing->width = timing->width / 3;
+		timing->xres = timing->width;
+	}
 }
 
 static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 6bba531d6dc4..e2f6fa542883 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -168,10 +168,18 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	 * video timing. It is recommended to enable it for all cases, except
 	 * if compression is enabled in 1 pixel per clock mode
 	 */
+	if (!p->dsc_en || p->wide_bus_en)
+		intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
+
 	if (p->wide_bus_en)
-		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
+		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
+
+	if (p->dsc_en)
+		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
 
 	data_width = p->width;
+	if (p->wide_bus_en && !dp_intf)
+		data_width = p->width >> 1;
 
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 0bd57a32144a..b452e3557d10 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -33,6 +33,7 @@ struct dpu_hw_intf_timing_params {
 	u32 hsync_skew;
 
 	bool wide_bus_en;
+	bool dsc_en;
 };
 
 struct dpu_hw_intf_prog_fetch {
diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index 2a7d980e12c3..f0b3cdc020a1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -231,6 +231,7 @@ static inline uint32_t DSI_VID_CFG0_TRAFFIC_MODE(enum dsi_traffic_mode val)
 #define DSI_VID_CFG0_HSA_POWER_STOP				0x00010000
 #define DSI_VID_CFG0_HBP_POWER_STOP				0x00100000
 #define DSI_VID_CFG0_HFP_POWER_STOP				0x01000000
+#define DSI_VID_CFG0_DATABUS_WIDEN				0x02000000
 #define DSI_VID_CFG0_PULSE_MODE_HSA_HE				0x10000000
 
 #define REG_DSI_VID_CFG1					0x0000001c
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index deeecdfd6c4e..070a9aaa38d5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -745,6 +745,8 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 		data |= DSI_VID_CFG0_TRAFFIC_MODE(dsi_get_traffic_mode(flags));
 		data |= DSI_VID_CFG0_DST_FORMAT(dsi_get_vid_fmt(mipi_fmt));
 		data |= DSI_VID_CFG0_VIRT_CHANNEL(msm_host->channel);
+		if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
+			data |= DSI_VID_CFG0_DATABUS_WIDEN;
 		dsi_write(msm_host, REG_DSI_VID_CFG0, data);
 
 		/* Do not swap RGB colors */
@@ -847,6 +849,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	u32 slice_per_intf, total_bytes_per_intf;
 	u32 pkt_per_line;
 	u32 eol_byte_num;
+	u32 bytes_per_pkt;
+	u32 slice_per_pkt;
 
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
@@ -857,13 +861,12 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 
 	eol_byte_num = total_bytes_per_intf % 3;
 
-	/*
-	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
-	 *
-	 * Since the current driver only supports slice_per_pkt = 1,
-	 * pkt_per_line will be equal to slice per intf for now.
-	 */
-	pkt_per_line = slice_per_intf;
+	/* If slice_per_pkt is greater than slice_per_intf then to 1 */
+	slice_per_pkt  = dsc->slice_per_pkt > slice_per_intf ?
+			 1 : dsc->slice_per_pkt;
+
+	bytes_per_pkt = dsc->slice_chunk_size * slice_per_pkt;
+	pkt_per_line = slice_per_intf / slice_per_pkt;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
@@ -873,6 +876,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	/* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
 	 * registers have similar offsets, so for below common code use
 	 * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
+	 *
+	 * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
 	 */
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
@@ -891,6 +896,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
 	} else {
+		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(bytes_per_pkt);
 		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
 	}
 }
@@ -898,6 +904,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
 	struct drm_display_mode *mode = msm_host->mode;
+	struct drm_dsc_config *dsc = msm_host->dsc;
 	u32 hs_start = 0, vs_start = 0; /* take sync start as 0 */
 	u32 h_total = mode->htotal;
 	u32 v_total = mode->vtotal;
@@ -929,8 +936,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		hdisplay /= 2;
 	}
 
-	if (msm_host->dsc) {
-		struct drm_dsc_config *dsc = msm_host->dsc;
+	if (dsc) {
 		u32 bytes_per_pclk;
 
 		/* update dsc params with timing params */
@@ -967,7 +973,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 	}
 
 	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		if (msm_host->dsc)
+		if (dsc)
 			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
 
 		dsi_write(msm_host, REG_DSI_ACTIVE_H,
@@ -988,21 +994,17 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
 			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
 	} else {		/* command mode */
-		if (msm_host->dsc)
+		if (dsc) {
 			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
 
-		/* image data and 1 byte write_memory_start cmd */
-		if (!msm_host->dsc)
-			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
-		else
 			/*
 			 * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
-			 * Currently, the driver only supports default value of slice_per_pkt = 1
-			 *
-			 * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
-			 *       and adjust DSC math to account for slice_per_pkt.
 			 */
-			wc = msm_host->dsc->slice_chunk_size + 1;
+			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc->slice_per_pkt + 1;
+		} else {
+			/* image data and 1 byte write_memory_start cmd */
+			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
+		}
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
@@ -1629,8 +1631,12 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
-	if (dsi->dsc)
+	if (dsi->dsc) {
 		msm_host->dsc = dsi->dsc;
+		/* for backwards compatibility, assume 1 if not set */
+		if (!msm_host->dsc->slice_per_pkt)
+			msm_host->dsc->slice_per_pkt = 1;
+	}
 
 	/* Some gpios defined in panel DT need to be controlled by host */
 	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
index bc90273d06a6..01642bc9f016 100644
--- a/include/drm/display/drm_dsc.h
+++ b/include/drm/display/drm_dsc.h
@@ -92,6 +92,10 @@ struct drm_dsc_config {
 	 * @slice_count: Number fo slices per line used by the DSC encoder
 	 */
 	u8 slice_count;
+	/**
+	 * @slice_per_pkt: Number fo slices per packet in the encoded bit stream
+	 */
+	u8 slice_per_pkt;
 	/**
 	 *  @slice_width: Width of each slice in pixels
 	 */
-- 
2.34.1


