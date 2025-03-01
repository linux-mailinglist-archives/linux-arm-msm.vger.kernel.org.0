Return-Path: <linux-arm-msm+bounces-49914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B56A4AD0A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 18:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C0421897634
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 17:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5848A1E5B8D;
	Sat,  1 Mar 2025 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GxB2KRly"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F631E32A2
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Mar 2025 17:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740849069; cv=none; b=Q3gd8VKXuWKPGS4j/uNNuNL2kN/TqeWXwR2EP07OlqzKlJBgypOHOWIDYm4gHYhIxYyaSsFjV2evvCwRy0al2xqix19YjetP7QFHmg+bs5//T4DecF35T71hAM1mKalDxV2Uk5HUESwfcdTcigqIeCKQ4EYMktpbmwqnTqXIGgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740849069; c=relaxed/simple;
	bh=Zl6KXw6AdcxHhMj4UrjLySeVvCxqw6Jr5NjSbbnIYw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ef/MTji8R3a3FU4HmLq+qDECS9R10dMPdbgQE9YNQXhRMociPaikaJnM/OFlG5m8xxyXwfVk1b+wgXvWQULNyiYqDudQUF24PaqEibsep/BG7KlECMIrQv2ZUtbvSwydTw+0Az5KNZoSai2FSueuB3qKprWezv5QcNyKaCmOKpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GxB2KRly; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5452e6f2999so3239013e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Mar 2025 09:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740849065; x=1741453865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLYSrqogef9nQqRb9pth4NuA0U5dDtdylLPK0S+qdxc=;
        b=GxB2KRlyQm+fE8g+6+gvv8gFyaRVDK7MQv6IyJJjOKh0Ar/RmttwOM+fEoiTj01uzj
         QjLnd6cuWj5pkXOtIxdYkrg0G8r7HxzVYwnv/gSMfu6tIsqqy27f1s1gg1CYfF+7+xXy
         FIZdLg1vB5n8Ia54oelF2hUB4n/aj18DX0XAyuPYZCdctX3Jf0h42hFEdZBx7fUW2TAv
         SkyVcRPUA8MPcBW5hcmTrNrpaDo/PI6gssnNRzO0ub07rwjt8fLDbUM0zJaBPfhKmUeK
         v9DVz8+zQlV1EBCQ45HuIbgcV32yw5i62LYXSobNChRdY9UfouBcAGi6MkoY0MEFPTw+
         H+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740849065; x=1741453865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLYSrqogef9nQqRb9pth4NuA0U5dDtdylLPK0S+qdxc=;
        b=qlbeU9Qilq46oqDA45i4NhFP4kWEUAjr4LnZpERTSYVvdZZ3mkfJVvtSWSLMetkoF1
         weUV9OidbDaKam1Cbt1aoA4lfMO74LUJiB4d0WtcTablt/fwwOnZeeES3qcp7kjhdYVV
         c4LI/gfB5dLT9h0efl04qD6L9tXavtPQfX141fwI+oMUi1+6MTFWwFxl3fYVVy8IoOd+
         Tw29IRoJVfisJsjSUBpFF13VPgiWSo66KGlSbAh4a3gTEW9OpwzNyXSoGekL+tbqQZGr
         OVk+QChTeJneTsiSqtgUpc4lwwx045amLjltb2XyoLna97e9T9o3lOMmpaNO7ZEMwFm0
         kr6w==
X-Forwarded-Encrypted: i=1; AJvYcCVxI2rwc/FwDcX5raHO+IxM8pllo3hsn+FqQmB6Is5GyrW0StmazLsGrkQ8m0RXPNoevy4AI4868xcXzxoP@vger.kernel.org
X-Gm-Message-State: AOJu0YyTeHK4tIkTTQ0sRnW1hWHZMbw5t6P3sik5ehH7YdkSXzu8xXQs
	tCXoVVfyU5YjXQAaK5c/DWfWxXIhMSnkPgEIN+4XnNSX7FSBNMtqyQd6DWd9bLc=
X-Gm-Gg: ASbGnct6c9P2Ueat6GkzRussAo5tHN8Tl7udWfkpdrKN0rzSjnc1AHfzIIdeq2GL36F
	MKSVPW03rnTBUwSnm9zpiVqg0koE8EDwuRTjcsRCWeCJd2RDKjY7SJ6AyB6upA7Pup5Ucok/hNP
	QMWFENhx89w3s4bfRsybSR8C+nPJjYgDpc3gdcocN1xznODGtQBBFlB1zbDdOsaPKT1hOBfCHW0
	1PwCDPvK4rK3Y01zjjrglAIjuV8OMCKRRVsX/p1CNWwqyOyirhpOohwAf86QYd4+rMxHWuV59wb
	tMvE4yTcFu+vo5awzxWBWUWOcK063CeARVH9DyDHurUvTqh4G6wJ
X-Google-Smtp-Source: AGHT+IFMIVbPMPVwAA1gSUhouRqkobbK3iPod0XmkeW/lTun2yQ8T8ybS3Jn+hi0UICfeucggprL5w==
X-Received: by 2002:a05:6512:3a90:b0:545:944:aae1 with SMTP id 2adb3069b0e04-5494c31d2e8mr3445875e87.12.1740849065003;
        Sat, 01 Mar 2025 09:11:05 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494e52a47asm585313e87.152.2025.03.01.09.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 09:11:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 19:10:56 +0200
Subject: [PATCH v4 2/2] drm/msm/dp: reuse generic HDMI codec implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-dp-hdmi-audio-v4-2-82739daf28cc@linaro.org>
References: <20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org>
In-Reply-To: <20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13379;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Zl6KXw6AdcxHhMj4UrjLySeVvCxqw6Jr5NjSbbnIYw0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwz+iONA58Hxi4OLGV8/ILXoxiZ5viTEVsc+L5
 PeiPTADMdKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8M/ogAKCRCLPIo+Aiko
 1ZcTB/wOLp80u6TNQHtDB1Ljim9OCdmo+ZftHMCHcORm1GZGPyzN8HIux/gPV5ds4G/S2wi47+k
 IpfO1zdkXD7hiibbhtUl5dpOhepHiS7vt1XupIcztxGhNHS5JRaktPk+YNfXE5/DHW988j7/5Ny
 JUsfzzOGIkh7XwUcg11k5aPVmJv6l1elXFlykWfXuvd7G495AWmPBD9Us9RhfYSAy2+mtnjFkgk
 SUvSz8Dh5ylmOiqmR3I3e6+Ad2jCF3fhOuZrHf2jNxBUU4bhJgT6zCHp/a12xit0FdR9z7g0P52
 3Z2cr/ZhMXvmhrNAw+Tt+7UoirYK/znHX36sM/oGnInyf6nf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM DisplayPort driver implements several HDMI codec functions
in the driver, e.g. it manually manages HDMI codec device registration,
returning ELD and plugged_cb support. In order to reduce code
duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
integration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig         |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
 drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
 drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
 drivers/gpu/drm/msm/dp/dp_display.h |   6 --
 drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
 6 files changed, 31 insertions(+), 170 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 7ec833b6d8292f8cb26cfe5582812f2754cd4d35..fe36a3bcfe03994952d1b5e1b423e923e3e3b014 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -104,6 +104,7 @@ config DRM_MSM_DPU
 config DRM_MSM_DP
 	bool "Enable DisplayPort support in MSM DRM driver"
 	depends on DRM_MSM
+	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
 	default y
 	help
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 70fdc9fe228a7149546accd8479a9e4397f3d5dd..f8bfb908f9b4bf93ad5480f0785e3aed23dde160 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -13,13 +13,13 @@
 
 #include "dp_catalog.h"
 #include "dp_audio.h"
+#include "dp_drm.h"
 #include "dp_panel.h"
 #include "dp_reg.h"
 #include "dp_display.h"
 #include "dp_utils.h"
 
 struct msm_dp_audio_private {
-	struct platform_device *audio_pdev;
 	struct platform_device *pdev;
 	struct drm_device *drm_dev;
 	struct msm_dp_catalog *catalog;
@@ -160,24 +160,11 @@ static void msm_dp_audio_enable(struct msm_dp_audio_private *audio, bool enable)
 	msm_dp_catalog_audio_enable(catalog, enable);
 }
 
-static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platform_device *pdev)
+static struct msm_dp_audio_private *msm_dp_audio_get_data(struct msm_dp *msm_dp_display)
 {
 	struct msm_dp_audio *msm_dp_audio;
-	struct msm_dp *msm_dp_display;
-
-	if (!pdev) {
-		DRM_ERROR("invalid input\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	msm_dp_display = platform_get_drvdata(pdev);
-	if (!msm_dp_display) {
-		DRM_ERROR("invalid input\n");
-		return ERR_PTR(-ENODEV);
-	}
 
 	msm_dp_audio = msm_dp_display->msm_dp_audio;
-
 	if (!msm_dp_audio) {
 		DRM_ERROR("invalid msm_dp_audio data\n");
 		return ERR_PTR(-EINVAL);
@@ -186,68 +173,16 @@ static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platform_device
 	return container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_audio);
 }
 
-static int msm_dp_audio_hook_plugged_cb(struct device *dev, void *data,
-		hdmi_codec_plugged_cb fn,
-		struct device *codec_dev)
-{
-
-	struct platform_device *pdev;
-	struct msm_dp *msm_dp_display;
-
-	pdev = to_platform_device(dev);
-	if (!pdev) {
-		pr_err("invalid input\n");
-		return -ENODEV;
-	}
-
-	msm_dp_display = platform_get_drvdata(pdev);
-	if (!msm_dp_display) {
-		pr_err("invalid input\n");
-		return -ENODEV;
-	}
-
-	return msm_dp_display_set_plugged_cb(msm_dp_display, fn, codec_dev);
-}
-
-static int msm_dp_audio_get_eld(struct device *dev,
-	void *data, uint8_t *buf, size_t len)
-{
-	struct platform_device *pdev;
-	struct msm_dp *msm_dp_display;
-
-	pdev = to_platform_device(dev);
-
-	if (!pdev) {
-		DRM_ERROR("invalid input\n");
-		return -ENODEV;
-	}
-
-	msm_dp_display = platform_get_drvdata(pdev);
-	if (!msm_dp_display) {
-		DRM_ERROR("invalid input\n");
-		return -ENODEV;
-	}
-
-	mutex_lock(&msm_dp_display->connector->eld_mutex);
-	memcpy(buf, msm_dp_display->connector->eld,
-		min(sizeof(msm_dp_display->connector->eld), len));
-	mutex_unlock(&msm_dp_display->connector->eld_mutex);
-
-	return 0;
-}
-
-int msm_dp_audio_hw_params(struct device *dev,
-	void *data,
-	struct hdmi_codec_daifmt *daifmt,
-	struct hdmi_codec_params *params)
+int msm_dp_audio_prepare(struct drm_connector *connector,
+			 struct drm_bridge *bridge,
+			 struct hdmi_codec_daifmt *daifmt,
+			 struct hdmi_codec_params *params)
 {
 	int rc = 0;
 	struct msm_dp_audio_private *audio;
-	struct platform_device *pdev;
 	struct msm_dp *msm_dp_display;
 
-	pdev = to_platform_device(dev);
-	msm_dp_display = platform_get_drvdata(pdev);
+	msm_dp_display = to_dp_bridge(bridge)->msm_dp_display;
 
 	/*
 	 * there could be cases where sound card can be opened even
@@ -262,7 +197,7 @@ int msm_dp_audio_hw_params(struct device *dev,
 		goto end;
 	}
 
-	audio = msm_dp_audio_get_data(pdev);
+	audio = msm_dp_audio_get_data(msm_dp_display);
 	if (IS_ERR(audio)) {
 		rc = PTR_ERR(audio);
 		goto end;
@@ -281,15 +216,14 @@ int msm_dp_audio_hw_params(struct device *dev,
 	return rc;
 }
 
-static void msm_dp_audio_shutdown(struct device *dev, void *data)
+void msm_dp_audio_shutdown(struct drm_connector *connector,
+			   struct drm_bridge *bridge)
 {
 	struct msm_dp_audio_private *audio;
-	struct platform_device *pdev;
 	struct msm_dp *msm_dp_display;
 
-	pdev = to_platform_device(dev);
-	msm_dp_display = platform_get_drvdata(pdev);
-	audio = msm_dp_audio_get_data(pdev);
+	msm_dp_display = to_dp_bridge(bridge)->msm_dp_display;
+	audio = msm_dp_audio_get_data(msm_dp_display);
 	if (IS_ERR(audio)) {
 		DRM_ERROR("failed to get audio data\n");
 		return;
@@ -311,47 +245,6 @@ static void msm_dp_audio_shutdown(struct device *dev, void *data)
 	msm_dp_display_signal_audio_complete(msm_dp_display);
 }
 
-static const struct hdmi_codec_ops msm_dp_audio_codec_ops = {
-	.hw_params = msm_dp_audio_hw_params,
-	.audio_shutdown = msm_dp_audio_shutdown,
-	.get_eld = msm_dp_audio_get_eld,
-	.hook_plugged_cb = msm_dp_audio_hook_plugged_cb,
-};
-
-static struct hdmi_codec_pdata codec_data = {
-	.ops = &msm_dp_audio_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
-};
-
-void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm_dp_audio)
-{
-	struct msm_dp_audio_private *audio_priv;
-
-	audio_priv = container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_audio);
-
-	if (audio_priv->audio_pdev) {
-		platform_device_unregister(audio_priv->audio_pdev);
-		audio_priv->audio_pdev = NULL;
-	}
-}
-
-int msm_dp_register_audio_driver(struct device *dev,
-		struct msm_dp_audio *msm_dp_audio)
-{
-	struct msm_dp_audio_private *audio_priv;
-
-	audio_priv = container_of(msm_dp_audio,
-			struct msm_dp_audio_private, msm_dp_audio);
-
-	audio_priv->audio_pdev = platform_device_register_data(dev,
-						HDMI_CODEC_DRV_NAME,
-						PLATFORM_DEVID_AUTO,
-						&codec_data,
-						sizeof(codec_data));
-	return PTR_ERR_OR_ZERO(audio_priv->audio_pdev);
-}
-
 struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
 			struct msm_dp_catalog *catalog)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/dp_audio.h
index beea34cbab77f31b33873297dc454a9cee446240..58fc14693e48bff2b57ef7278983e5f21ee80ac7 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.h
+++ b/drivers/gpu/drm/msm/dp/dp_audio.h
@@ -35,23 +35,6 @@ struct msm_dp_audio {
 struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
 			struct msm_dp_catalog *catalog);
 
-/**
- * msm_dp_register_audio_driver()
- *
- * Registers DP device with hdmi_codec interface.
- *
- * @dev: DP device instance.
- * @msm_dp_audio: an instance of msm_dp_audio module.
- *
- *
- * Returns the error code in case of failure, otherwise
- * zero on success.
- */
-int msm_dp_register_audio_driver(struct device *dev,
-		struct msm_dp_audio *msm_dp_audio);
-
-void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm_dp_audio);
-
 /**
  * msm_dp_audio_put()
  *
@@ -61,10 +44,12 @@ void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm
  */
 void msm_dp_audio_put(struct msm_dp_audio *msm_dp_audio);
 
-int msm_dp_audio_hw_params(struct device *dev,
-	void *data,
-	struct hdmi_codec_daifmt *daifmt,
-	struct hdmi_codec_params *params);
+int msm_dp_audio_prepare(struct drm_connector *connector,
+			 struct drm_bridge *bridge,
+			 struct hdmi_codec_daifmt *daifmt,
+			 struct hdmi_codec_params *params);
+void msm_dp_audio_shutdown(struct drm_connector *connector,
+			   struct drm_bridge *bridge);
 
 #endif /* _DP_AUDIO_H_ */
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bbc47d86ae9e67245c87a8365df366cce0dc529e..ece184d20c0f8bffa3c2a48216015185d6cbc99e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
+#include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/drm_edid.h>
 
 #include "msm_drv.h"
@@ -288,13 +289,6 @@ static int msm_dp_display_bind(struct device *dev, struct device *master,
 		goto end;
 	}
 
-
-	rc = msm_dp_register_audio_driver(dev, dp->audio);
-	if (rc) {
-		DRM_ERROR("Audio registration Dp failed\n");
-		goto end;
-	}
-
 	rc = msm_dp_hpd_event_thread_start(dp);
 	if (rc) {
 		DRM_ERROR("Event thread create failed\n");
@@ -316,7 +310,6 @@ static void msm_dp_display_unbind(struct device *dev, struct device *master,
 
 	of_dp_aux_depopulate_bus(dp->aux);
 
-	msm_dp_unregister_audio_driver(dev, dp->audio);
 	msm_dp_aux_unregister(dp->aux);
 	dp->drm_dev = NULL;
 	dp->aux->drm_dev = NULL;
@@ -626,9 +619,9 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 			struct msm_dp_display_private, msm_dp_display);
 
 	/* notify audio subsystem only if sink supports audio */
-	if (msm_dp_display->plugged_cb && msm_dp_display->codec_dev &&
-			dp->audio_supported)
-		msm_dp_display->plugged_cb(msm_dp_display->codec_dev, plugged);
+	if (dp->audio_supported)
+		drm_connector_hdmi_audio_plugged_notify(msm_dp_display->connector,
+							plugged);
 }
 
 static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
@@ -907,19 +900,6 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	return 0;
 }
 
-int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
-		hdmi_codec_plugged_cb fn, struct device *codec_dev)
-{
-	bool plugged;
-
-	msm_dp_display->plugged_cb = fn;
-	msm_dp_display->codec_dev = codec_dev;
-	plugged = msm_dp_display->link_ready;
-	msm_dp_display_handle_plugged_change(msm_dp_display, plugged);
-
-	return 0;
-}
-
 /**
  * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
  * @bridge: Pointer to drm bridge structure
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index ecbc2d92f546a346ee53adcf1b060933e4f54317..cc6e2cab36e9c0b1527ff292e547cbb4d69fd95c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -7,7 +7,6 @@
 #define _DP_DISPLAY_H_
 
 #include "dp_panel.h"
-#include <sound/hdmi-codec.h>
 #include "disp/msm_disp_snapshot.h"
 
 #define DP_MAX_PIXEL_CLK_KHZ	675000
@@ -15,7 +14,6 @@
 struct msm_dp {
 	struct drm_device *drm_dev;
 	struct platform_device *pdev;
-	struct device *codec_dev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
 	bool link_ready;
@@ -25,14 +23,10 @@ struct msm_dp {
 	bool is_edp;
 	bool internal_hpd;
 
-	hdmi_codec_plugged_cb plugged_cb;
-
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;
 };
 
-int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
-		hdmi_codec_plugged_cb fn, struct device *codec_dev);
 int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
 bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index cca57e56c906255a315e759e85a5af5982c80e9c..20b24eea0a4b619598079fbe4a32188485852b04 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -12,6 +12,7 @@
 
 #include "msm_drv.h"
 #include "msm_kms.h"
+#include "dp_audio.h"
 #include "dp_drm.h"
 
 /**
@@ -114,6 +115,9 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.hpd_disable  = msm_dp_bridge_hpd_disable,
 	.hpd_notify   = msm_dp_bridge_hpd_notify,
 	.debugfs_init = msm_dp_bridge_debugfs_init,
+
+	.hdmi_audio_prepare = msm_dp_audio_prepare,
+	.hdmi_audio_shutdown = msm_dp_audio_shutdown,
 };
 
 static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
@@ -320,9 +324,13 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	 */
 	if (!msm_dp_display->is_edp) {
 		bridge->ops =
+			DRM_BRIDGE_OP_HDMI_AUDIO |
 			DRM_BRIDGE_OP_DETECT |
 			DRM_BRIDGE_OP_HPD |
 			DRM_BRIDGE_OP_MODES;
+		bridge->hdmi_audio_dev = &msm_dp_display->pdev->dev;
+		bridge->hdmi_audio_max_i2s_playback_channels = 8;
+		bridge->hdmi_audio_dai_port = -1;
 	}
 
 	rc = devm_drm_bridge_add(dev->dev, bridge);

-- 
2.39.5


