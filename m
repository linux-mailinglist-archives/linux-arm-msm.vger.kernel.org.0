Return-Path: <linux-arm-msm+bounces-45389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D109A14C72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 10:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 839F5188B881
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 09:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556EE1FC7D8;
	Fri, 17 Jan 2025 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JXdGbcOT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218181F91EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 09:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737107460; cv=none; b=jBACpBYFJr+tuADk/h8L3UcpWNriEtBarTalA+3161LFldZbZ+K9jA6xbUotPPdvS6IqvHHe/VWuPndUMGZ5wh/d7leHOB3QBcIGvcl9HebOjzDwW3TtQ1jE98QjUtpSwcEVLv/NmgwsOeSX6Rzhnzjty7NsXJy1/O5CrGF4iGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737107460; c=relaxed/simple;
	bh=BVyrY3hYhzJCVJmvW+IxebCDsuJx/AtqO3kdpzmwFEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aoOJyWf2K9nxdgOwwR02V0MdWaIQ4jOTs86pLaqkZQP2wZe/zps3TerYJTID3IaMA6WOARWBlxBX1Qfm5iDkvKBSCquoV8KUWMVpqLF0rCvOQCbkGNbq8lBS12TlaE5ljuHvq5TiTviJVq3x8f2zLMaPs+Iuz3eQA0RmvC/njA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JXdGbcOT; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-540201cfedbso1659751e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 01:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737107456; x=1737712256; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6F/Qq3d3Zbuu/ir75ukBi8dSYuZyZSR4oRI6lz02Ow=;
        b=JXdGbcOTDrbFN8j+1gciJJ3mksc0Xh9LT7UOXZYUZukVeb22NA4PDJmVrwwA0OcOJv
         L35ZQ/5nRlV++4yUlexCGjR0NXBtqfizh5mHJYBiaKcyGwnG17SXApYERX4MMT3Y5JOP
         qVPmFVjiGNR1FGW7MJF6kTtklOxTXLQqX0zTtjjBh4LS8+K6Q93AsHh5lwzcKv6hQzuO
         WW2dwfTI52UQQRe/co6GG469W3lHkxjHiHfhW7OsfeN3TGuG+to906jS0IO2MoRX8KU+
         8u0jSi6zImYjBeAznM9O9cldMFPX+k8TJ8mNZPol25IJ05kbgqRrcjAUn1Iv+p73cy7Z
         PmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737107456; x=1737712256;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6F/Qq3d3Zbuu/ir75ukBi8dSYuZyZSR4oRI6lz02Ow=;
        b=pzeUd4/kFl2agoaTafspeFo2uzcDeHB4OaLwZVzqHW22sP0EFzjS1EMbiJA7cF+N07
         oVYflIJVK9J/ki2UH6ps3Hn8oU1c800obIhIg121VZuUyKu3f8+Mn4PX6K/OGB/vTxBH
         EL4If/cJqsLdNwZoLvGDlO/9WPBu8/e5BJ/11G0UHV9BB1UuU82XdMc3r1IP+DRzraDJ
         29GAO4GSavThfsBcXGuqa3HhYVEy4cQqaYK2c5GAttb8OXL8zKABIi6ZjTz7aRGybj5t
         bsxgE3j9kLk2XAUI5j5MYjvgoPHbXtmA0HXleQSNDhwmIq4TsxFM6j5icN1u+km0cCLL
         P/LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo7IoHEfS8Ly2m+bov2jg8WbCob/Yn6eJUXwe3iH2oKbvEHZt14otw5pHygVBN/eV9GyPtm384iEZwsQgM@vger.kernel.org
X-Gm-Message-State: AOJu0YwHderREyDoUJk6cIbLysMujTrfOO5y8uDh9A1OgGFX2nMd4R2D
	SX0GT9+ZrEejNnsrzIlok/XHA1jvOYouMWHV2E23sbm0EqkJtCzg20uaU8DP7MI=
X-Gm-Gg: ASbGncteJT1iqySha7eU1FiO+OsaRjfFDfNopoKpvnijXb9lF4URgaZ+Tdz5K1gbxSi
	SWlXbwUyjiv9kwjFR/yr7i5nNuShTP7G1oANonGg81RW3nanuO1hgq2PZBBpJRXa16tWxM8S6yj
	ECoSZm97GocnHyagh5SCRsJrXoivP6eXOGyqr7ix0CqogcZ6VufMC0PvI7C8h1Qe1oS7y23lJfW
	XpujWJ0K7nXe/Yf/Sw/AgNH86JaIBg7G4LF8atYxwTtCQFEl48PuMTXV8nJKPVa
X-Google-Smtp-Source: AGHT+IHJcEHFfl8KbJTI7826EF6H1lRVnlWh7o1f+pZojli98vvrH7/CjvwMD7ZRCtQd4oUKf3C+IA==
X-Received: by 2002:a2e:be91:0:b0:300:2ddb:aaa5 with SMTP id 38308e7fff4ca-3072cb0df40mr5881951fa.30.1737107456043;
        Fri, 17 Jan 2025 01:50:56 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a34489fsm3450971fa.29.2025.01.17.01.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 01:50:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 11:50:50 +0200
Subject: [PATCH v3] drm/bridge-connector: handle subconnector types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-subconnector-v3-1-1e241c13e576@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPknimcC/53OTQ6CMBCG4auQri3pHz915T0MiwIDbZTWTJFIC
 He3kHgBl+9inm82EgEdRHLNNoKwuOiCTyEvGems8SNQ16cmgomCcV7R+G674D10c0AqVNmWAyi
 t6pqkkxfC4D4nd29SDxgmOlsE80Mk00wKrrRUuairShSactpPbsY1bw2u0T7Ccns6bzDkAceDt
 S6mtfV8chEH/h/V7Pv+BfOxB3byAAAA
X-Change-ID: 20250117-subconnector-246b6fe49488
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4842;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BVyrY3hYhzJCVJmvW+IxebCDsuJx/AtqO3kdpzmwFEQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBniif9fNPU4d0sQFESZpjYoMfPrnwTQTvCFTXdd
 yw6j+JsBeaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4on/QAKCRCLPIo+Aiko
 1YnVB/4v0rW4vHVX8JkTtKt78TaM7Ja07Y8IbKIl7tvEBEmUpChompmd9DpOd0Yg/TKbodNV5ho
 +hKdV2oqkZU59nB14qslKmAaeDw+mHR1V/kX0dygoBkn7JI/R09lpDprBjJT7PWQ/kHuWVpQjo1
 mbes34w1gaaJCYkn9unRex0CaV6Wp9x2TB00ZklYfn3YL9JRp1mF5XhsPlwcB5vCO0K0cugrBiE
 Un5zjwrMnyvdJxWKFRI5uYPQTt6NK/yQE4gpK0iQKgR53YdrnRIhoAVZ/1r1GUjEhvpIMezr11N
 7KwlCPIg8kdInzI3mmLOJ3BuXXBQl9K7WfHHCm8srjBkvJZp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If the created connector type supports subconnector type property,
create and attach corresponding it. The default subtype value is 0,
which maps to the DRM_MODE_SUBCONNECTOR_Unknown type. Also remove
subconnector creation from the msm_dp driver to prevent having duplicate
properties on the DP connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
This is a leftover of my previous attempt to implement USB-C DisplayPort
uABI. The idea was dropped, but I consider this part still to be useful,
as it allows one to register corresponding subconnector properties and
also to export the subconnector type.
---
Changes in v3:
- Rebased on top of linux-next
- Drop subconnector property from msm_dp driver
- Link to v2: https://lore.kernel.org/r/20230903214934.2877259-1-dmitry.baryshkov@linaro.org

Changes in v2:
- Dropped all DP and USB-related patches
- Dropped the patch adding default subtype to
  drm_connector_attach_dp_subconnector_property()
- Replaced creation of TV subconnector property with the check that it
  was created beforehand (Neil, Laurent)
- Link to v1: https://lore.kernel.org/r/20230729004913.215872-1-dmitry.baryshkov@linaro.org/
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 28 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.c                |  3 ---
 include/drm/drm_bridge.h                       |  4 ++++
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 0397e62f9cbc93321caeae99982f5e3c66d308c5..4b616dba4dd8c2dc1725a8d7562d0a37e1557dc8 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -523,6 +523,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_bridge *bridge, *panel_bridge = NULL;
 	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
 	unsigned int max_bpc = 8;
+	enum drm_mode_subconnector subconnector;
 	int connector_type;
 	int ret;
 
@@ -576,8 +577,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				max_bpc = bridge->max_bpc;
 		}
 
-		if (!drm_bridge_get_next_bridge(bridge))
+		if (!drm_bridge_get_next_bridge(bridge)) {
 			connector_type = bridge->type;
+			subconnector = bridge->subtype;
+		}
 
 #ifdef CONFIG_OF
 		if (!drm_bridge_get_next_bridge(bridge) &&
@@ -643,6 +646,29 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+		drm_connector_attach_dp_subconnector_property(connector);
+	} else if (connector_type == DRM_MODE_CONNECTOR_DVII) {
+		ret = drm_mode_create_dvi_i_properties(drm);
+		if (ret)
+			return ERR_PTR(ret);
+
+		drm_object_attach_property(&connector->base,
+					   drm->mode_config.dvi_i_subconnector_property,
+					   subconnector);
+	} else if (connector_type == DRM_MODE_CONNECTOR_TV) {
+		/*
+		 * We do not know which modes are supported by the HW, so the
+		 * property should be created in advance.
+		 */
+		if (!drm->mode_config.tv_subconnector_property)
+			return ERR_PTR(-EINVAL);
+
+		drm_object_attach_property(&connector->base,
+					   drm->mode_config.tv_subconnector_property,
+					   subconnector);
+	}
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d3e241ea6941615b8e274dd17426c2f8557f09b5..d8e3ec9fd4825916e03ced9011f460c2f32f3912 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -361,9 +361,6 @@ struct drm_connector *msm_dp_drm_connector_init(struct msm_dp *msm_dp_display,
 	if (IS_ERR(connector))
 		return connector;
 
-	if (!msm_dp_display->is_edp)
-		drm_connector_attach_dp_subconnector_property(connector);
-
 	drm_connector_attach_encoder(connector, encoder);
 
 	return connector;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4b84faf14e368310dd20aa964e8178ec80aa6fa7..27a4c9aa3475cefe0137f0a7d01b808651125ac5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -850,6 +850,10 @@ struct drm_bridge {
 	 * identifies the type of connected display.
 	 */
 	int type;
+	/**
+	 * @subtype: the subtype of the connector for the DP/TV/DVI-I cases.
+	 */
+	enum drm_mode_subconnector subtype;
 	/**
 	 * @interlace_allowed: Indicate that the bridge can handle interlaced
 	 * modes.

---
base-commit: 8defad9f57376a89914d16757717a27b567de04e
change-id: 20250117-subconnector-246b6fe49488

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


