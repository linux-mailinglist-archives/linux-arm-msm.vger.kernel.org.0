Return-Path: <linux-arm-msm+bounces-13650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84116875B48
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 00:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFF1F1F229CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 23:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D533481BD;
	Thu,  7 Mar 2024 23:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jt3QTKVa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599A03D971
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 23:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709855830; cv=none; b=Zi0LGVKDUV1hnVy2TC3XJvGswg4a554m7sj6npAPS4D0ytDS+/xQK788H8h8UN4hz9/iIgNv+recBukwHa3JA2bxkcqjPizRFgTX+1juTavLm7jojKVAkSLvhrFDurWqE3yWaoJeOffZw/NTrdf08a2cQfWvXJHLfZHszdGQu08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709855830; c=relaxed/simple;
	bh=ShiNv393ZQOFkQ1UT0mY5i+Ny9G4ynWKMDoiCyzGxCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lp6O/Nqqf0SrPP7POUTvOR7fAXtWmqkH7EUDRogzRu1xZaq9BMFbRnaEL7NWkRAjXB5LR6esXSvwEZ3Avl2gahoVc2bDmUNr6LKXD3j4M/FDgLCdFTtHSLzdpQaEDkZpXMMNLe3yIcOxHlmC9Fm6Ys+bVZBLTsaBrIISk7NxU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jt3QTKVa; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513382f40e9so1819581e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 15:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709855826; x=1710460626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gY2QKi3iCCRu3R9ogdJP6Bt7K1zFE2wWgrj56u+POKc=;
        b=Jt3QTKVaj3accRGBMObUJHkQeH8JUpEG1oiymcWo0WtRf8avUqbTwUpvIHB72rTjsK
         RxvXd9VvFWwJABSjUdC8ZsBb+Iq5DaISx7XJ8gAfmuQkrb1+WAa12ueIs8nHJ2W++D0B
         3n1z4UVXcJ6rCrXZRfpb93yR/h8vQyDuh6Pu03z/vZYBPhDgkmoAQXtzNXr3+udQ1KpW
         Jgf9+6JzYoWjDmXCM0/srfj3bG6hD8r9rqe8nt1X0tspih9zUmoKgnhr0K0G1nmi9a7/
         ayN5D9lL9Va2n8HVzpCAfHgN384cVk+JvTrfXNTmFzCmkpLHXQDSnJhq33DHG4E/2bhF
         77+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709855826; x=1710460626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gY2QKi3iCCRu3R9ogdJP6Bt7K1zFE2wWgrj56u+POKc=;
        b=kFdb2+zU34+cx5/A0IJ15tmw994jtp3LGMpGdYhDbRBr97beocZejZEnN0EeFqWHbR
         uxJB2GjpLRIv4PpCoy5VL9Um7QXiwAlZQiOa1f9LEcyrf/UC29nqWdhGtw77h4NHLfYz
         WgcfQqe5NLVk9NDKoxasBK8J69M+4Xwz3c2++oaVs53ZAFj7g8zyQDfPhXoOR8QRwAd2
         tVMxl+lnpmA2tdNY2MXCo9ITqvtb8TlfheoSpFodT8CxC754qCvmQQGFLYPRoX9zMgOR
         57F9ji8YMKnPGfhsWP0jTQrWJ+dmXVaRn8RW7m75AZYxstrK/wfrpvUKXr3U9sMo/hTo
         NujQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTF239sxqfEyw3TT1tTTX7YahI5PkAnVN+LbA6fTGnaTiKiEqET/53ZvwL8C15Azv1BjwPrY9atuA0QlbYQgez/T/NV9tscTzX9cLexw==
X-Gm-Message-State: AOJu0YxLH5q1GFw09bo7hiCxvYkoyOWVWhro4XhVT9DJtYsPLrw8GtWY
	BgmCLvFbt3ut8Tazi60nN2Ud+d9OfhHZoeu/JqxVx5lt+/LxMAo8Ldeh1+7pHjw=
X-Google-Smtp-Source: AGHT+IEIYUwPWtmGW03RHbhLgl9+/GiaPgeGoRsjiKtdQa8Q6FcZOlnaaNwIQLUkOMUVGlYcZzqhtA==
X-Received: by 2002:a05:6512:3aa:b0:513:1551:e6 with SMTP id v10-20020a05651203aa00b00513155100e6mr2176294lfp.50.1709855826517;
        Thu, 07 Mar 2024 15:57:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:57:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Mar 2024 01:57:02 +0200
Subject: [PATCH RFC 3/6] drm/connector: hdmi: split setup code of the HDMI
 connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-bridge-hdmi-connector-v1-3-90b693550260@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5714;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ShiNv393ZQOFkQ1UT0mY5i+Ny9G4ynWKMDoiCyzGxCA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lROJ6e2b1AVujzHUbjQVLrDEaTD481Rxbyny
 tZQJKp1V+2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTgAKCRCLPIo+Aiko
 1cVXB/42MRj2IrAMaxs8DpjGlZ1Q8ayl7IKSsS9Ib06j1TA+bAJnmNt2I3BsgWIW8kdOLHhqCy2
 kxUY09yWNS+7cvdkwuuOHBjv1AX/MJ/a4jKisWfw8yfRkvKfpeHccoT1D84cWlnln7eyGttXuNm
 QkbRRLfLhQBmifiR/Xw+97wbnb34bunzINBHxz8wKJ3Tp281N38bbFlE589UuiIr9LpCexqjvAo
 7xJaHNDIlVkBDZTwmMn9v60pBssiEIheo53N1zgFgidVCmzpApG5KUk49wtPFJNLtEtrBKVnsK7
 SQSd7kbtbWwPqWcHgmks4MDDmkgLdHqBUnpyDr45wAR3HrhJ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to use HDMI connector extensions from the bridge drivers, carve
out the drm_connector_hdmi_setup() from drmm_connector_hdmi_init(). This
way the drm_bridge drivers can call new function from their
setup_connector callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 67 ++++++++++++++++++++++++++++++-----------
 include/drm/drm_connector.h     |  5 +++
 2 files changed, 54 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 427816239038..ba953eb45557 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -454,15 +454,11 @@ int drmm_connector_init(struct drm_device *dev,
 EXPORT_SYMBOL(drmm_connector_init);
 
 /**
- * drmm_connector_hdmi_init - Init a preallocated HDMI connector
- * @dev: DRM device
+ * drm_connector_hdmi_setup - Init a preallocated HDMI connector
  * @connector: A pointer to the HDMI connector to init
  * @vendor: HDMI Controller Vendor name
  * @product: HDMI Controller Product name
- * @funcs: callbacks for this connector
  * @hdmi_funcs: HDMI-related callbacks for this connector
- * @connector_type: user visible type of the connector
- * @ddc: optional pointer to the associated ddc adapter
  * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
  * @max_bpc: Maximum bits per char the HDMI connector supports
  *
@@ -477,18 +473,12 @@ EXPORT_SYMBOL(drmm_connector_init);
  * Returns:
  * Zero on success, error code on failure.
  */
-int drmm_connector_hdmi_init(struct drm_device *dev,
-			     struct drm_connector *connector,
+int drm_connector_hdmi_setup(struct drm_connector *connector,
 			     const char *vendor, const char *product,
-			     const struct drm_connector_funcs *funcs,
 			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
-			     int connector_type,
-			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
 			     unsigned int max_bpc)
 {
-	int ret;
-
 	if (!vendor || !product)
 		return -EINVAL;
 
@@ -496,8 +486,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	    (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
 		return -EINVAL;
 
-	if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
-	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
+	if (connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
+	    connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
 		return -EINVAL;
 
 	if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
@@ -506,10 +496,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
-	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
-	if (ret)
-		return ret;
-
 	connector->hdmi.supported_formats = supported_formats;
 	strtomem_pad(connector->hdmi.vendor, vendor, 0);
 	strtomem_pad(connector->hdmi.product, product, 0);
@@ -531,6 +517,51 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL(drm_connector_hdmi_setup);
+
+/**
+ * drmm_connector_hdmi_init - Init a preallocated HDMI connector
+ * @dev: DRM device
+ * @connector: A pointer to the HDMI connector to init
+ * @vendor: HDMI Controller Vendor name
+ * @product: HDMI Controller Product name
+ * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
+ * @max_bpc: Maximum bits per char the HDMI connector supports
+ *
+ * Initialises a preallocated HDMI connector. Connectors can be
+ * subclassed as part of driver connector objects.
+ *
+ * Cleanup is automatically handled with a call to
+ * drm_connector_cleanup() in a DRM-managed action.
+ *
+ * The connector structure should be allocated with drmm_kzalloc().
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_connector_hdmi_init(struct drm_device *dev,
+			     struct drm_connector *connector,
+			     const char *vendor, const char *product,
+			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			     int connector_type,
+			     struct i2c_adapter *ddc,
+			     unsigned long supported_formats,
+			     unsigned int max_bpc)
+{
+	int ret;
+
+	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
+	if (ret)
+		return ret;
+
+	return drm_connector_hdmi_setup(connector, vendor, product, hdmi_funcs,
+					supported_formats, max_bpc);
+}
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
 /**
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5964ef283022..37d54d5ff0d6 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2156,6 +2156,11 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
 			     unsigned int max_bpc);
+int drm_connector_hdmi_setup(struct drm_connector *connector,
+			     const char *vendor, const char *product,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			     unsigned long supported_formats,
+			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);

-- 
2.39.2


