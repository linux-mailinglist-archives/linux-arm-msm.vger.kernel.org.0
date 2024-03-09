Return-Path: <linux-arm-msm+bounces-13745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3406687706A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 11:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0A521F21814
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 10:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978932C853;
	Sat,  9 Mar 2024 10:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gmX26m1w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EB31D69E
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 10:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709980303; cv=none; b=H6uvqnqWvcg4IdYljZVtHszE7i/D38tFiaSXGKD6bh10NYKT2AIpDWnex5o3DpLh43xrKCYeI8G1X3I0FMpnYo43PmHsQUDDfz2Tv7JB4+Bwm0IIGv+Bp64nqspgp0UBCcGZOKbaEvQXuA64Lmbg/F6CpWEZUl/fEGQjHFRswVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709980303; c=relaxed/simple;
	bh=7zA/N8KAt1DsVzqE/w0UCroDP54Ugww4O7l/KrsTO+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aBPn04ghCJsC7QMfMBN0N7oXbYsUQtZnhp5l7yZwMVxauyfRcT8r+ZBue64jYdoxUBXZZMGUxcYrve1acGAQIcTIFEv2q1JdzmXNbbXaGafMa/ovP/12oKCpn2PvUd+BSLQEvMmgQBdogpDrn0qlt7aZPlkfg3ETA9J+oRccZvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gmX26m1w; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d28051376eso18109481fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 02:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709980300; x=1710585100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVak1J+o3ONy3vnRUIeVq/ARZN3J0EKCCHw4ehmpquA=;
        b=gmX26m1wbQlPI6t+z7CTTlstFNQVu/NbDWFFpAojkdAExfp7r08Q9LGzSZuEHqr/jW
         KKJrfd/SwcD+R+msTl3YgGHGNyPxBWZx1oAi12pgSp2358Zz7LAE9vuhdAulK8ObRo+p
         UbWzuLX9oa5isW1oaoMoUlpoF0qD9jOzQ0RzBd2CeK9C1ZJIYXwJm1JWW7GLbs//CiPj
         GOQMi3Q9uLUCg9zFCOFdj7cMrCiu47i1+cc6eK5GiMyhcNBb0xpw/Mgku5WhTMK0QDey
         0k1cghuH9BWrDOci4vwMjtM/AnIlkMssaz7h8gfrHOBrDF0VLR1kf69LgXeOt5fX7b7P
         w40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709980300; x=1710585100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVak1J+o3ONy3vnRUIeVq/ARZN3J0EKCCHw4ehmpquA=;
        b=pxSWqgNc9PfARxTqALouciIUGke+TUAICenDCkhKZzaFY2IDkm2tz+NCmlKfGBngJQ
         2AB4ayBvlXlJsXaNzyDvLw/bTRpM+erHgBVyGPyI353t2Y/dj7sf1fpC+Fdw0QZTTvtp
         X8y72edn7WWuN9kOFe+trjR4N11pbGnz8noi87GEKTBiz9NqbeFEQqb6ZGaW8BOHcrCP
         hZXkfKr5XXM1CN+n3z1YyaBjUhZvTtV3Jugg/kOhZXm/UCSbQ+D/AN/6F3DxaAZvtxMr
         pfopyg4vCoWqOQLI1t0YucuaUs9CtKzpEdv+ERHAmdSfcJ0aV1vxFgDS2h6mPbjuXzFQ
         bVeA==
X-Forwarded-Encrypted: i=1; AJvYcCWs9zd2MPnupf358UfKeVRPM3yEJbfcO6FO+i3xHtHAJGZsFcSgFScpyxUGX8fcIUDwRtWKAxq3844Cnr1KkuO7gtCiXQsaS3BZn6OMsw==
X-Gm-Message-State: AOJu0YwVbCPBnRBt90jgyzGXQxHhu7n1+uYbZAVnX4oGSmZ/0WZEUVe9
	5fKZrKIuUR6WNE93nIR3kI3A6IXaj54o9+YUtWgJ7wwrn2xpXxSp/6yi87NVLQc=
X-Google-Smtp-Source: AGHT+IHnYzJfbpL84RxZcdOa/oxj01C/8c/YNEBwKCgUivP4PqO5a9ifcxqYB4JLN1UpUrB8URx7HA==
X-Received: by 2002:a2e:9644:0:b0:2d2:2cff:fc49 with SMTP id z4-20020a2e9644000000b002d22cfffc49mr1116763ljh.18.1709980299872;
        Sat, 09 Mar 2024 02:31:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y5-20020a2e3205000000b002d31953bc30sm245301ljy.55.2024.03.09.02.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 02:31:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 12:31:32 +0200
Subject: [PATCH RFC v2 5/5] drm/msm/hdmi: make use of the
 drm_connector_hdmi framework
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-bridge-hdmi-connector-v2-5-1380bea3ee70@linaro.org>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
In-Reply-To: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5077;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7zA/N8KAt1DsVzqE/w0UCroDP54Ugww4O7l/KrsTO+o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7DqGKpmWQ7UnQyki0wyQsaptJlMWh9rU2kk5L
 aZGOtVRGdSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZew6hgAKCRCLPIo+Aiko
 1eIiCACmOhghs05XCA5tDfxfgOdmf3vaQaIYVk6LHpSFsRPOh1brfx5fXfxruxfRS7/nqN/sdC4
 +mSDPvMUiRS6fn5GPl35BHtxA3MF4lMr2PoSfLDNv5zLPFXURvbZCjAT9Tv4nMUjvud62sP1P3n
 Ur2l6mXBmA6ktMBbsIp+1d2EvVVtj8avJEFK73UsgU4sO9vUnfjdhTcXjGJYZnADtTtu2DREHoy
 q2PfWlC9ZbpwvKx3E4FsMmURpf9Squ9UWXPKnzwfRBq4tOmEvkO5XrIHFiFHM8q9FNqsQUV8BBo
 LMqh7Kcck2nGQIXhzi0yr3/WPryuflywGqtWrF36c6vYrpG/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Setup the HDMI connector on the MSM HDMI outputs. Make use of
atomic_check hook and of the provided Infoframe infrastructure.

Note: for now only AVI Infoframes are enabled. Audio Infoframes are
currenly handled separately. This will be fixed for the final version.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 83 +++++++++++++++++++++++++++-------
 1 file changed, 67 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d839c71091dc..26c847f42522 100644
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
+static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
+					   enum hdmi_infoframe_type type)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	u32 val;
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		val &= ~(HDMI_INFOFRAME_CTRL0_AVI_SEND |
+			 HDMI_INFOFRAME_CTRL0_AVI_CONT);
+		break;
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		val &= ~(HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
+		break;
+	default:
+		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+	}
+
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
+					   enum hdmi_infoframe_type type,
+					   const u8 *buffer, size_t len)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+
+	msm_hdmi_bridge_clear_infoframe(bridge, type);
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
@@ -310,6 +356,8 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,
+	.clear_infoframe = msm_hdmi_bridge_clear_infoframe,
+	.write_infoframe = msm_hdmi_bridge_write_infoframe,
 };
 
 static void
@@ -341,8 +389,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->funcs = &msm_hdmi_bridge_funcs;
 	bridge->ddc = hdmi->i2c;
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
+	bridge->vendor = "Qualcomm";
+	bridge->product = "Snapdragon";
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_HDMI |
 		DRM_BRIDGE_OP_EDID;
 
 	ret = devm_drm_bridge_add(hdmi->dev->dev, bridge);

-- 
2.39.2


