Return-Path: <linux-arm-msm+bounces-13653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1504F875B4E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 00:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38D7A1C20E40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 23:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3763D1D698;
	Thu,  7 Mar 2024 23:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iboTbB2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3635A4879B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709855833; cv=none; b=SGBNQ68uvnuO3EC95zPGD66g61njLWv++XNQpA7ZeVJFLaCVgHDBHbqjF4tWwACLBMspcaLYQGaqvrRViTEK9WBhgRURwE5ZSUaJfAB/xO56YUuPP29mppn5if6hcemPWH/ISF+06ovS4YW1QHtU1zR6XwQkvriphyZeoX/7M+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709855833; c=relaxed/simple;
	bh=TXYWz2o+G56/mfXWFApDQcaAJZo0tKkXqhChihztQJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPJNsMhD6VGky8wfzDZDCNhwZikPQyrJpWeyW3xrqSIX0B6QfjcCsweX9vUNrQ/mcKypUlghzRdx+3XLSKzhCH/F9+sbbiCbNBVrQC4dv6SsMPy6dju61slvWF6tdUwcSWU6EqIuai20BvOM+rHwznDCO7pAOEtoOeh01KrNjNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iboTbB2Y; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51321e71673so1625835e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 15:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709855829; x=1710460629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GK5XNOVT37zheDhBlvzH4xXIpFb1sao65Rig8QVMcBw=;
        b=iboTbB2YrCiv9gt0SP/UKch65H1uana2vJGNLTuAXuPpF+p468BjsoOB7yv785FTe/
         //MYxq0AJcfYVgBVPUsTh2R8L2tVSoFQB7MyQkZzeH8LRcnX+2iNfTej1S3ksrXH3E22
         jMPpyHWnvwHU8k0MMvhwIEDbBOogjfYSnHSBGoFvE6QQuVMW2Tmn34rhRP8sLoumIzZg
         YDEdqwaS6uHEJsI5QldzfmupKSywMOHh/rGGcJRTAPxQLt4vY0684FngaLT673psBuv1
         ELTTLltX2dV7b+g4WwliJMUyjAvqnU5ALG1UJ0pWAn5NExi5nCKbmQfYXsPh9JHoDYp5
         OWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709855829; x=1710460629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GK5XNOVT37zheDhBlvzH4xXIpFb1sao65Rig8QVMcBw=;
        b=figeSwbUDU4figPL2PGCEY+V4zLS2x7P+Mq/V5PPvIGUnhyCuWU0XeR0m0y5tXABil
         QmEzjEZn1h8D2ZfUPbyJrJ3RhZa52DnQ3B2UGXOAVD5zJuYt6Qlg3GN7Iq0LJ98Yjwkr
         VRNaOGism5aFWFfRKLvRAGKvq817ddGI6emWHzur8lB0Chz8uvxDQG16Ssns8nkI2Hyf
         YGLbHCExfY7ZenN6ha030f/uYxbH9l0Oxx/BeyVwtcckzr3jF07T9rwUMSdDHvXK2mUv
         q/FuPjTwMQ8i4BvVmAY8ebEhDxbp5i69cjICNUVrMYYbUzIGlBL8tl6nXqaJdmi+XstW
         YlGw==
X-Forwarded-Encrypted: i=1; AJvYcCWkX7X7+h/nxfzO82NYk0ULhBlQBYWdcADliWIDtth4Y6j18tq/eDtbRRx5ggPv/O/ux54mLpsdWcHrVGaut0JMPiOuvHweoQHIYj5VoQ==
X-Gm-Message-State: AOJu0YzJy4gK9pM9n3ILUYugUJF2Rxo+/cocWnqNAIps0jlsh+z8m9uU
	xqMPHYBPI1r+kYla1IPRUrCqnjYDBWOudWmQnrFCfNwYHP5akt4BRnmN3FPXruA=
X-Google-Smtp-Source: AGHT+IHzMD7PYqcuhD/abvrL6OPdgwt61AHHLj9TptIR9Ky1X4VlQud7DglQwVyw/LxB+27EURXdhg==
X-Received: by 2002:a05:6512:2118:b0:513:7e6a:ecfb with SMTP id q24-20020a056512211800b005137e6aecfbmr2127866lfr.65.1709855829217;
        Thu, 07 Mar 2024 15:57:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:57:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Mar 2024 01:57:05 +0200
Subject: [PATCH RFC 6/6] drm/msm/hdmi: make use of the drm_connector_hdmi
 framework
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-bridge-hdmi-connector-v1-6-90b693550260@linaro.org>
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
In-Reply-To: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6259;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TXYWz2o+G56/mfXWFApDQcaAJZo0tKkXqhChihztQJA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lRODQf/UkaVtuTdFcqJY0cBtJwnVmB4bQh4p
 bjEk3SI2iyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTgAKCRCLPIo+Aiko
 1Yv/CAChblAPRULvIJO+Y0ZNMTE5sXE5ycGqq/4aWMWVvZ+Yw+ffNtkFyDQIbZVf8cG0RE5eQUU
 Z9H5bP7/c5wKF+d/s6e5IH5+/2I7SLcNrTkLVKpXvWs7ksyPcOR4R81p3ML2FmlazzUGeiXbpik
 byji7EYEF/7dXuQR7eySpVMi5GjnpD8XN1QfqMGdy/6FKgpiCstrP2Raw1Pfq+QDiT5eDt3ebvh
 QYpe1ex2bbEgTAXtQkI7l4bgYJGoJ8RJYm8MgSi/q6wjFRNG3kBmwrx41qWy5Gw+sxcDZ5GU/C6
 VSUYjwvRb/HQzloPko0tOxTIYEpaA6LL+OdsjrIw/Slq7tJL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Setup the HDMI connector on the MSM HDMI outputs. Make use of
atomic_check hook and of the provided Infoframe infrastructure.

Note: for now only AVI Infoframes are enabled. Audio Infoframes are
currenly handled separately. This will be fixed for the final version.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 107 ++++++++++++++++++++++++++++-----
 1 file changed, 91 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d839c71091dc..ac42574db8f7 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -68,23 +68,15 @@ static void power_off(struct drm_bridge *bridge)
 
 #define AVI_IFRAME_LINE_NUMBER 1
 
-static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
+static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
+					  const u8 *buffer, size_t len)
 {
-	struct drm_crtc *crtc = hdmi->encoder->crtc;
-	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
-	union hdmi_infoframe frame;
-	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
 	u32 val;
-	int len;
 
-	drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
-						 hdmi->connector, mode);
-
-	len = hdmi_infoframe_pack(&frame, buffer, sizeof(buffer));
-	if (len < 0) {
+	if (len != HDMI_INFOFRAME_SIZE(AVI)) {
 		DRM_DEV_ERROR(&hdmi->pdev->dev,
 			"failed to configure avi infoframe\n");
-		return;
+		return -EINVAL;
 	}
 
 	/*
@@ -124,6 +116,55 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
 	val |= HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER);
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_clear_infoframe(struct drm_connector *connector,
+					   enum hdmi_infoframe_type type)
+{
+	struct hdmi_bridge *hdmi_bridge = connector->hdmi.data;
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	u32 val;
+
+	val = hdmi_read(REG_HDMI_INFOFRAME_CTRL0);
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		val &= ~(HDMI_INFOFRAME_CTRL0_AVI_SEND |
+			 HDMI_INFOFRAME_CTRL0_AVI_CONT);
+		break;
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		val &= ~(HDMI_INFOFRAME_CTRL0_AUDIO_SEND |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_CONT |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
+		break;
+	default:
+		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+	}
+
+	hdmi_write(REG_HDMI_INFOFRAME_CTRL0, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_write_infoframe(struct drm_connector *connector,
+					   enum hdmi_infoframe_type type,
+					   const u8 *buffer, size_t len)
+{
+	struct hdmi_bridge *hdmi_bridge = connector->hdmi.data;
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+
+	msm_hdmi_bridge_clear_infoframe(connector, type);
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		return msm_hdmi_config_avi_infoframe(hdmi, buffer, len);
+	default:
+		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return 0;
+	}
 }
 
 static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
@@ -132,6 +173,10 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct hdmi_phy *phy = hdmi->phy;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	struct drm_connector *connector =
+		drm_atomic_get_new_connector_for_encoder(state, encoder);
 
 	DBG("power up");
 
@@ -139,12 +184,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode) {
-			msm_hdmi_config_avi_infoframe(hdmi);
-			msm_hdmi_audio_update(hdmi);
-		}
 	}
 
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
+
+	if (hdmi->hdmi_mode)
+		msm_hdmi_audio_update(hdmi);
+
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
 
 	msm_hdmi_set_mode(hdmi, true);
@@ -177,6 +223,15 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	}
 }
 
+static int msm_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	return drm_atomic_helper_connector_hdmi_check(conn_state->connector,
+						      conn_state->state);
+}
+
 static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 		 const struct drm_display_mode *mode,
 		 const struct drm_display_mode *adjusted_mode)
@@ -300,16 +355,36 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 	return 0;
 }
 
+static const struct drm_connector_hdmi_funcs msm_hdmi_bridge_hdmi_funcs = {
+	.clear_infoframe = msm_hdmi_bridge_clear_infoframe,
+	.write_infoframe = msm_hdmi_bridge_write_infoframe,
+};
+
+static int msm_hdmi_bridge_setup_connector(struct drm_bridge *bridge,
+					   struct drm_connector *connector)
+{
+	if (connector->hdmi.data)
+		return -EBUSY;
+
+	connector->hdmi.data = to_hdmi_bridge(bridge);
+
+	return drm_connector_hdmi_setup(connector, "Qualcomm", "Snapdragon",
+					&msm_hdmi_bridge_hdmi_funcs,
+					BIT(HDMI_COLORSPACE_RGB), 8);
+}
+
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_check = msm_hdmi_bridge_atomic_check,
 	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,
+	.setup_connector = msm_hdmi_bridge_setup_connector,
 };
 
 static void

-- 
2.39.2


