Return-Path: <linux-arm-msm+bounces-21026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C50C88D41D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 01:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0BB11C2174A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 23:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6410C201247;
	Wed, 29 May 2024 23:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zrYMfZmR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1CC15D5A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 23:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717024355; cv=none; b=reVYEWq7DtrUJlfmTYFac87ZHlVYgD2zc7sDEJf05UzsDjpr4nthBHP0aBCmXrEJchbrb9aZs1IQFV1yktIo/gP7rsAmF92B5MTDJVGuK4tBctt7dMgqgqklU6yrluzh3Z6mpDrUO/EeQ+LLV3D18iVZ/wQjBqR5gbhBoKbJKK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717024355; c=relaxed/simple;
	bh=tOIH3JPEpDxof7OQM6P6CQE/OX6XXbqLAqWvMjH3caE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=thu50qys8jtW6cWmNuQmax4/4mRp9LPvEmQvsFulr1DaR5QyketQ90yyiiGYWvRNDiS9s4f7qSoTRxuOWOxOLZ2MEGax1k3ScHN9vXqAbiEKOaBjpAK4LY5zEOpA/KLjHSMcX8Bqgs33ZaZ+CooC6Gn8DIdW1TKHyk7JqJYKfkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zrYMfZmR; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-529614b8c29so393553e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 16:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717024350; x=1717629150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOz+df2raUbCtUFRosciH+kU8h+dx/PGU1pG4gC6J9Y=;
        b=zrYMfZmRj74WJSot1OSS8/X9W8lipUr47E+9GSM0L0MlB6I1KNrgOl+Qj+TCn04afD
         j26Y48htEqpltoRHCEP2Ry0R9u+fDAsJWDAArOOENsSJbc7jZBv1tgSyskS0t8CYKKUf
         oQrE1+aXRiUVy2aXfQ8iNJVG1YrGEQrg74NzHf9mKUkjf65txXyHI1KLH1M3nEkRgaxo
         FxKiFIcLcCZGS+Hu0RSOR17ossIiHJccZ+lbzgnIgiIGyL+dcak3XV3UYVKkNcR7XCqe
         6zZJ8PPi0PYEshJJ6q8vQZ6jaNOWB361cKIdOyZ5kv6VSN6ktQNT3lyaR8F1Luc67pE+
         xV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717024350; x=1717629150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOz+df2raUbCtUFRosciH+kU8h+dx/PGU1pG4gC6J9Y=;
        b=odRZyYTjzwgqiKV+1ny0H4ARmI3K3/EVKvooRb2YAW8tatdlEdxJI7ObdrY98xY4lE
         vrWG0MZtp0lP2PhCpIVqMbJ0sLebVamemNgIaR/yiLNiVuhsvW8OUXempnFvotueXsGR
         4RkK4PHkpZZGtZvR4t825PwghZVr/KoP+hIkNGMU/z2Rw1/4aIFa82y+4ut8yANw6/3/
         s7bWL8xSZ8mayfGzPHZz6NPn1KHUiADfpMrTetYedZA4CtaqaQYYKQ+URHqjCwgF1+cQ
         uRqBBVB/pEoyu7WTNQvtMlOQ1G3SVZlvH+gUkFLUOPRkOQLAxl+5ShiH/2yvjw8uuT/G
         AEkg==
X-Forwarded-Encrypted: i=1; AJvYcCXn+I4dS0Po4zfMuIJOq+0tGHSeuhCOLUxklvNVJlMaKVlKZAA7nSXrFsJEl+PPmrLIwexSXpEgXaWniDwb/+vQj2GYm6AkwGKuKDrrKw==
X-Gm-Message-State: AOJu0YzENLlR5AKuIH8VnZnYCTrnQ2/XfM56gaYu5nh+4zs133hCZr0o
	73ap2/XINDtCvYuZo5neSrxn46L5Ayfmg0k3S1FA4hi7jdLzjqgpZ+CUwCUXQRQ=
X-Google-Smtp-Source: AGHT+IGcWfVhQQUzLM0fQ0j58Hq7J7sQGpv1qopmw+bd9uKZgyflTXgXKf4z9o9FcOVrrYO+5d8UbQ==
X-Received: by 2002:ac2:5979:0:b0:51a:c3b8:b9cf with SMTP id 2adb3069b0e04-52b7d4b1c97mr343366e87.69.1717024350342;
        Wed, 29 May 2024 16:12:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529acea1ea8sm1015998e87.276.2024.05.29.16.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 16:12:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 02:12:26 +0300
Subject: [PATCH v3 3/7] drm/bridge-connector: implement glue code for HDMI
 connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-bridge-hdmi-connector-v3-3-a1d184d68fe3@linaro.org>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
In-Reply-To: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9517;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tOIH3JPEpDxof7OQM6P6CQE/OX6XXbqLAqWvMjH3caE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmV7ZahtocGRDfZCeZ3ATZVji45oLhxvIeiW215
 Yj6EA6EJm2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZle2WgAKCRCLPIo+Aiko
 1SDPB/9AVKlLTJK6OnbadA3AHcW3UGZeJN8TpWpF53fYoS0Lp/kigDkMgs3gGuyeiQya0XkeRls
 Ex6Vu3OAO+RxP0mTgVkzWpvkH2Dw+jL6TjkaDOE+XP8mK/ohk0KZilESaMP70R7kX3Ek0HdYKll
 UbpXYgPhFFwUKvHEX3o2xDsS77uPdb4UGO1DGqg6e78AtTnAXjjIUDRYPumNeYM5mtwvoHhpnU5
 z6QUJef/HfPdHFyfoxWx+A+OKSTteC5+N3IVmtfPFGxYzQ/zKy3C0e+Wb/RX/+sOzCAtUgSR7il
 kSbyjlp1eXRl6W3b2VyB6Gv2akXNVekyFpLlv0uZKcJ4ozSl
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to let bridge chains implement HDMI connector infrastructure,
add necessary glue code to the drm_bridge_connector. In case there is a
bridge that sets DRM_BRIDGE_OP_HDMI, drm_bridge_connector will register
itself as a HDMI connector and provide proxy drm_connector_hdmi_funcs
implementation.

Note, to simplify implementation, there can be only one bridge in a
chain that sets DRM_BRIDGE_OP_HDMI. Setting more than one is considered
an error. This limitation can be lifted later, if the need arises.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 101 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/drm_debugfs.c          |   2 +
 include/drm/drm_bridge.h               |  82 ++++++++++++++++++++++++++
 3 files changed, 182 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index e093fc8928dc..8dca3eda5381 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -18,6 +18,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdmi_state_helper.h>
 
 /**
  * DOC: overview
@@ -87,6 +88,13 @@ struct drm_bridge_connector {
 	 * connector modes detection, if any (see &DRM_BRIDGE_OP_MODES).
 	 */
 	struct drm_bridge *bridge_modes;
+	/**
+	 * @bridge_hdmi:
+	 *
+	 * The bridge in the chain that implements necessary support for the
+	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
+	 */
+	struct drm_bridge *bridge_hdmi;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -287,6 +295,61 @@ static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs
 	.disable_hpd = drm_bridge_connector_disable_hpd,
 };
 
+static enum drm_mode_status
+drm_bridge_connector_tmds_char_rate_valid(const struct drm_connector *connector,
+					  const struct drm_display_mode *mode,
+					  unsigned long long tmds_rate)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (bridge)
+		return bridge->funcs->tmds_char_rate_valid ?
+			bridge->funcs->tmds_char_rate_valid(bridge, mode, tmds_rate) :
+			MODE_OK;
+
+	return MODE_ERROR;
+}
+
+static int drm_bridge_connector_clear_infoframe(struct drm_connector *connector,
+						enum hdmi_infoframe_type type)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (bridge)
+		return bridge->funcs->clear_infoframe ?
+			bridge->funcs->clear_infoframe(bridge, type) :
+			0;
+
+	return -EINVAL;
+}
+
+static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
+						enum hdmi_infoframe_type type,
+						const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (bridge)
+		return bridge->funcs->write_infoframe(bridge, type, buffer, len);
+
+	return -EINVAL;
+}
+
+static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
+	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
+	.clear_infoframe = drm_bridge_connector_clear_infoframe,
+	.write_infoframe = drm_bridge_connector_write_infoframe,
+};
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -312,6 +375,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *bridge, *panel_bridge = NULL;
+	const char *vendor = "Unknown";
+	const char *product = "Unknown";
+	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
+	unsigned int max_bpc = 8;
 	int connector_type;
 	int ret;
 
@@ -348,6 +415,25 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->bridge_detect = bridge;
 		if (bridge->ops & DRM_BRIDGE_OP_MODES)
 			bridge_connector->bridge_modes = bridge;
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
+			if (bridge_connector->bridge_hdmi)
+				return ERR_PTR(-EBUSY);
+			if (!bridge->funcs->write_infoframe)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_hdmi = bridge;
+
+			if (bridge->supported_formats)
+				supported_formats = bridge->supported_formats;
+			if (bridge->max_bpc)
+				max_bpc = bridge->max_bpc;
+		}
+
+		if (bridge->vendor)
+			vendor = bridge->vendor;
+
+		if (bridge->product)
+			product = bridge->product;
 
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
@@ -370,9 +456,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = drmm_connector_init(drm, connector,
-				  &drm_bridge_connector_funcs,
-				  connector_type, ddc);
+	if (bridge_connector->bridge_hdmi)
+		ret = drmm_connector_hdmi_init(drm, connector,
+					       vendor, product,
+					       &drm_bridge_connector_funcs,
+					       &drm_bridge_connector_hdmi_funcs,
+					       connector_type, ddc,
+					       supported_formats,
+					       max_bpc);
+	else
+		ret = drmm_connector_init(drm, connector,
+					  &drm_bridge_connector_funcs,
+					  connector_type, ddc);
 	if (ret) {
 		kfree(bridge_connector);
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index dd39a5b7a711..e385d90ef893 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -762,6 +762,8 @@ static int bridges_show(struct seq_file *m, void *data)
 			drm_puts(&p, " hpd");
 		if (bridge->ops & DRM_BRIDGE_OP_MODES)
 			drm_puts(&p, " modes");
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI)
+			drm_puts(&p, " hdmi");
 		drm_puts(&p, "\n");
 	}
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4baca0d9107b..c45e539fe276 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -630,6 +630,54 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_disable)(struct drm_bridge *bridge);
 
+	/**
+	 * @tmds_char_rate_valid:
+	 *
+	 * Check whether a particular TMDS character rate is supported by the
+	 * driver.
+	 *
+	 * This callback is optional and should only be implemented by the
+	 * bridges that take part in the HDMI connector implementation. Bridges
+	 * that implement it shall set set the DRM_BRIDGE_OP_HDMI flag in their
+	 * &drm_bridge->ops.
+	 *
+	 * Returns:
+	 *
+	 * Either &drm_mode_status.MODE_OK or one of the failure reasons
+	 * in &enum drm_mode_status.
+	 */
+	enum drm_mode_status
+	(*tmds_char_rate_valid)(const struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				unsigned long long tmds_rate);
+
+	/**
+	 * @clear_infoframe:
+	 *
+	 * This callback clears the infoframes in the hardware during commit.
+	 * It will be called multiple times, once for every disabled infoframe
+	 * type.
+	 *
+	 * This callback is optional and should only be implemented by the
+	 * bridges that take part in the HDMI connector implementation. Bridges
+	 * that implement it shall set set the DRM_BRIDGE_OP_HDMI flag in their
+	 * &drm_bridge->ops.
+	 */
+	int (*clear_infoframe)(struct drm_bridge *bridge,
+			       enum hdmi_infoframe_type type);
+	/**
+	 * @write_infoframe:
+	 *
+	 * Program the infoframe into the hardware. It will be called multiple
+	 * times, once for every updated infoframe type.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI flag in their &drm_bridge->ops.
+	 */
+	int (*write_infoframe)(struct drm_bridge *bridge,
+			       enum hdmi_infoframe_type type,
+			       const u8 *buffer, size_t len);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -705,6 +753,16 @@ enum drm_bridge_ops {
 	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
 	 */
 	DRM_BRIDGE_OP_MODES = BIT(3),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI: The bridge provides HDMI connector operations,
+	 * including infoframes support. Bridges that set this flag must
+	 * implement the &drm_bridge_funcs->write_infoframe callback.
+	 *
+	 * Note: currently there can be at most one bridge in a chain that sets
+	 * this bit. This is to simplify corresponding glue code in connector
+	 * drivers.
+	 */
+	DRM_BRIDGE_OP_HDMI = BIT(4),
 };
 
 /**
@@ -773,6 +831,30 @@ struct drm_bridge {
 	 * @hpd_cb.
 	 */
 	void *hpd_data;
+
+	/**
+	 * @vendor: Vendor of the product to be used for the SPD InfoFrame
+	 * generation.
+	 */
+	const char *vendor;
+
+	/**
+	 * @product: Name of the product to be used for the SPD InfoFrame
+	 * generation.
+	 */
+	const char *product;
+
+	/**
+	 * @supported_formats: Bitmask of @hdmi_colorspace listing supported
+	 * output formats. This is only relevant if @DRM_BRIDGE_OP_HDMI is set.
+	 */
+	unsigned int supported_formats;
+
+	/**
+	 * @max_bpc: Maximum bits per char the HDMI bridge supports. This is
+	 * only relevant if @DRM_BRIDGE_OP_HDMI is set.
+	 */
+	unsigned int max_bpc;
 };
 
 static inline struct drm_bridge *

-- 
2.39.2


