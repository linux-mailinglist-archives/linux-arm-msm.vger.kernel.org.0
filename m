Return-Path: <linux-arm-msm+bounces-15554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F6288FDD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 12:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47967298F8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 11:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1647C0A9;
	Thu, 28 Mar 2024 11:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ej+5Y1H4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6047A1BDD0
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711624349; cv=none; b=CPh3Ymfpxam40vLYQuRLKiqLiJ1+Z2HvmvQ+m53sD4zh0GY6yn1Kov3rvj+mt5hxDB7g1xCM7UQFNIGqhzJAa9WFyKoPVkTIpo/AVHymPq58WIl8rwvPB/NUm9Avpd6jLhj2pIU58WYNU5DuNYg4ALqOLDfNXWFiGqA5dn1fGpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711624349; c=relaxed/simple;
	bh=Foxahl5f8+Bo0XN8goV9gcZye/Kq+XV2dNBhQOQagxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bMENrfiCYcSz+Dfq4icmiIjb4BnWs+bbNoO923opJPxUdV5ZzuA4aESb0uv1z2yeH2xrXCusq6z0njOGJ992JhaBNao/4+htNzGG0Zh//UBHT4BBsvPgB07tqDbwK4chBSfzCZ80UcH4ygH3Ympl05OgL+uBPAjmgvMsqyQhkEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ej+5Y1H4; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ea9a605ca7so638012b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711624347; x=1712229147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+TeuuSkQj7XTS45LutYmiDgAgbcEY5Odyx7kr6Nww4=;
        b=ej+5Y1H4BZr0BfATed24JUojTCk0dgppbf5VBpXQxFnpVlQvSX++9tFMs8t7XpldBl
         rh9FdUAj0e4PbZiTUjQl3s/k/dEADylrCpVMPVC1VXxIxRYrmdWg87DsnIg61gmEUJNs
         Pk66X17EE6S7EbBRNio95DvOLObxtIGdFblZKfK9BevBmGnEFQNCCC75nP2LwjDmnke+
         OBnm9qyQs8Dj5Kvu2S+GBKkSgwpuGJNXTirAyytZ407TCQnXhcKWdCp/b+XnA9LWw9RH
         eoCsEcjDUTP+Ur6tbtVAYyhLwkGkpZ2+GQutEPJVu+qaTQ5P1kOXEc+jr3dMy4mOkUvQ
         rrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711624347; x=1712229147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+TeuuSkQj7XTS45LutYmiDgAgbcEY5Odyx7kr6Nww4=;
        b=ZObEWOTkVPc3e64zHfTW1MmEiE5jRqV/hX3A+hyPuVPicitnPLvXxPndHUBfXItABL
         YGzWtGsBlBU/tQyS1RXtpAergkxFrEqST8b19RPZuXWerCElhYr/Fg2llpTZrtOjP2Nn
         Ib2buayEmfdIjLXUoVTF5H00HbKZdn+HTtqBHM2ZmdRnr3DUyijYOb38HmL4x3ZfCOC9
         jdCA1IyW/Gkhv7xxPOONVLUu2U4UMH5CbZVf+7Xt+DrxxCOQUz1aqNR591s7C11nNtq2
         +zmaolN9m4XKR1fibt3B4EHKV5z0EAmaOaVRxwEekBPRuY0IXZZ1IUGCJv9CISlnIYkC
         JQpw==
X-Forwarded-Encrypted: i=1; AJvYcCVZBH1fX+ZxdhJKD7cf8gFmjaDBvAeLDkHuNiYJMLNdpR6eJu6TVUXlsIG39c2a0MycoGeMkAcsXcE+/u99BkdfNUqhyvLSJOjYlNUOrw==
X-Gm-Message-State: AOJu0YxAGxqNwqc1zZ2a9nBfhLrV6kCAsRjyOi/3X4W3VyS6jpOCoGQ8
	UnLoPIjqWwVDj1Ux4YDhBtmixmnXQ4T6x4bNOik8Uv9i/6ez8lreUDGqa7bkokA=
X-Google-Smtp-Source: AGHT+IFtZtWGN0gpIdln/salcEy9PVgCOB6uagldfXRPfnddW1BVC0WLkiU9IKKaikRLoMnyPVkDoA==
X-Received: by 2002:a05:6a00:4f86:b0:6ea:74d4:a00d with SMTP id ld6-20020a056a004f8600b006ea74d4a00dmr3250046pfb.5.1711624346654;
        Thu, 28 Mar 2024 04:12:26 -0700 (PDT)
Received: from niej-think.bbrouter ([112.65.12.82])
        by smtp.gmail.com with ESMTPSA id k7-20020aa792c7000000b006eab9ef5d4esm1114607pfa.50.2024.03.28.04.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 04:12:26 -0700 (PDT)
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
Subject: [PATCH 3/3] drm/panel: Enable DSC for Visionox VTDR6130 panel
Date: Thu, 28 Mar 2024 19:11:58 +0800
Message-Id: <20240328111158.2074351-3-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328111158.2074351-1-jun.nie@linaro.org>
References: <20240328111158.2074351-1-jun.nie@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable display compression (DSC v1.2) for 1080x2400 Visionox
VTDR6130 AMOLED DSI panel. DTS property is needed to enable DSC.
Default configuration is video mode + non-DSC for any back
compatibility.

Below modes works on SM8650. While cmd mode does not work yet.
- video mode + DSC
- video mode
- cmd mode + DSC

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 58 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index 540099253e1b..d6c44816cdd0 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 
 #include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
@@ -17,9 +18,12 @@
 
 struct visionox_vtdr6130 {
 	struct drm_panel panel;
+	struct drm_dsc_config dsc;
 	struct mipi_dsi_device *dsi;
 	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data supplies[3];
+	bool cmd_mode;
+	bool dsc_enable;
 };
 
 static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
@@ -49,12 +53,20 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
 	if (ret)
 		return ret;
 
+	if (ctx->dsc_enable)
+		mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
+
 	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
 	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
 	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
 	mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
 	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
+
+	if (ctx->cmd_mode)
+		mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
+	else
+		mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
+
 	mipi_dsi_dcs_write_seq(dsi, 0x70,
 			       0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
 			       0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
@@ -205,6 +217,26 @@ static const struct drm_display_mode visionox_vtdr6130_mode = {
 	.height_mm = 157,
 };
 
+static int visionox_vtdr6130_enable(struct drm_panel *panel)
+{
+	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct drm_dsc_picture_parameter_set pps;
+	int ret;
+
+	if (!dsi->dsc)
+		return 0;
+
+	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
+	ret = mipi_dsi_picture_parameter_set(dsi, &pps);
+	if (ret) {
+		dev_err(&dsi->dev, "Failed to set PPS\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
 				       struct drm_connector *connector)
 {
@@ -228,6 +260,7 @@ static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
 	.prepare = visionox_vtdr6130_prepare,
 	.unprepare = visionox_vtdr6130_unprepare,
 	.get_modes = visionox_vtdr6130_get_modes,
+	.enable = visionox_vtdr6130_enable,
 };
 
 static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
@@ -260,12 +293,32 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
 	struct visionox_vtdr6130 *ctx;
+	struct drm_dsc_config *dsc;
 	int ret;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->cmd_mode = of_property_read_bool(dev->of_node, "enforce-cmd-mode");
+	ctx->dsc_enable = of_property_read_bool(dev->of_node, "enable-dsc");
+
+	/* Set DSC params */
+	if (ctx->dsc_enable) {
+		dsc = &ctx->dsc;
+		dsc->dsc_version_major = 0x1;
+		dsc->dsc_version_minor = 0x2;
+		dsc->slice_height = 40;
+		dsc->slice_width = 540;
+		dsc->slice_count = 2;
+		dsc->slice_per_pkt = 1;
+		dsc->bits_per_component = 8;
+		dsc->bits_per_pixel = 8 << 4;
+		dsc->block_pred_enable = true;
+
+		dsi->dsc = dsc;
+	}
+
 	ctx->supplies[0].supply = "vddio";
 	ctx->supplies[1].supply = "vci";
 	ctx->supplies[2].supply = "vdd";
@@ -306,6 +359,9 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 		return ret;
 	}
 
+	dev_err(&dsi->dev, "discovered with %s mode %s\n",
+		ctx->cmd_mode ? "cmd" : "video",
+		ctx->dsc_enable ? "and DSC enabled" : "");
 	return 0;
 }
 
-- 
2.34.1


