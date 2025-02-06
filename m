Return-Path: <linux-arm-msm+bounces-47041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E445DA2AA67
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 14:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9FC03A404A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 13:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCF31C701D;
	Thu,  6 Feb 2025 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YToK8kV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A871A3160
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849880; cv=none; b=f/xSD4heNpsnKTl2IbKc3gHy2synafKJNFZSI6aVQzwXs91Zmhinh6v1CsGjrnam6ShlK0IQ8Svb+JTs3BkF6THDMbHkv9bXbA04gEprL5tTd3V7jLWgOfK6xV55TEgQCf2uo4Gvt5FvRo6n3oXrHt9SwTNZR5WCQ2GjWyRTVMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849880; c=relaxed/simple;
	bh=snQ72owwPhrhaFwR4SIaWA+XaNcn+pxVUNbe6nPEt/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1rv4eZb8zCKzd5JendDgxLvVg871+QKt7TGG29455XnSuIoWZP4Gm/25fcFcliyMAJNoidFssZCHtnzXjOBCHbGGpG17EgiJWRlu7ORq01sq68kzWEKaaWSGbYtO+xkPrnE8D4NwmtdhmoHmWDBQMn3tLRP1YlxLL5ZMiLOhK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YToK8kV+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-307325f2436so8359491fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 05:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738849876; x=1739454676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlK+TxmJ+8NTEz5MDIlkU8q1+19XAKmZdwH/ArURmjg=;
        b=YToK8kV+Wf0nV/boTl6Ih3SwDTLxLA3ch+MBHA+AWm92A1vy5cMVDUnGh13Yf/7rf6
         f+XtPVgHiqW7uJfSht4fwu9GVe2IQm2sSnPiCZV04/So0KVk20auVRUmCynduDvFQWdV
         vDanWSaAxaRib3bq8oh7RB4mWUqRAtoh8kKkxRNA+Wp666W3zTR3+A98MmZn+8NEIQb1
         3G22HthjNA4T1iim72uvmyUquIshOfKmwcc3n0CjaTCnG0j86lpCK/0mXFvijbLuFx9q
         bibhAnrwJD/JVwu7cLthtiUVgrZFl7JiYFblbCwV0HbieS0tUzAkSbSz6BEbUb2soWf/
         KuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738849876; x=1739454676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlK+TxmJ+8NTEz5MDIlkU8q1+19XAKmZdwH/ArURmjg=;
        b=pgwyEiwh4Nz0dEEV7V4bbcPoLMLAjtTLX+fBNWUwLo6NTrC0URTDQjhbMIKZUUaF2S
         vDy/jhYyouiHzF4+gxjRkavGYnZ/+oIpz+tr9leCZ7CyMByqI9Kt88lS9/89yB54Kdbe
         SxNsTX2nCf/6mri3WpL3iLgAYuFdPDEajmu60pwsVosLWe/7DbeBTEHCPx1hJAsBXhHK
         gMSN6HQPW5iSjoP4ExDG0VKj7hduohODXbrz1/WAAZW+PfirPK90aklzWa5KUZP1hQ6P
         bKz9oF/w+mqJwUo31iTkwcIXIeYMA+0d293hRxTNb932ZDL2/avCnZSeKG7IxkkpRSn0
         sgrw==
X-Forwarded-Encrypted: i=1; AJvYcCWGIjtMQFGyWmysVgkxWaFP3rw5tt1JqjLv5jzyK2jhfTdAoA0nZuVZ8XouSzyq6Dv2wPMAmjx1hWyGxYbA@vger.kernel.org
X-Gm-Message-State: AOJu0YxN9Jzuz0zYjIoGLqDCQlQ71y/LvxMTd0vJ+uCPZ93fyqOFCsQF
	UU1NsWxCA7/N2awJwkgKDq589IGB2dQ2AvNQWDG4fzpWTCH9upR1zLLNwK6uZ9LwlpAg+whvdQz
	dPno=
X-Gm-Gg: ASbGncsN41ZNc9KZK1PYZdxktjhin4RhPYPyznG8q/PPTT8BjOznS52MoAUgmLarZ6Q
	xBVdam2uZHUD3yG5Ewg5hsFbO3/TV8o8JDtntXzF/E+e4aE9bkAN1hXVHlL+9fNKSBRvDGdRhVs
	hrEwEMeIFiKnac1RMYC/wSJB5cH9/huwwKoKOk8HyGFhL/AurVxkPB2+oNXavalVCay9VjvUZsV
	zIE/3shqmT4TG5o0iXzdk/m1eZ7YepU8EvyDGbItwbv72bvLIW8lM1533MFtpcuGxp+OIj/Tg2z
	4M6emve36Kie+UMisIZEuD8=
X-Google-Smtp-Source: AGHT+IHHeWzoeJmQQGB9ZzM2A2qTjw7A0+OC0cnedk0GgttBKRVUhTQ2a66Cy0CFIBfHwySntG87EA==
X-Received: by 2002:a05:651c:1588:b0:300:26bc:4311 with SMTP id 38308e7fff4ca-307cf31141fmr27383791fa.18.1738849876142;
        Thu, 06 Feb 2025 05:51:16 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2da11fsm1318521fa.92.2025.02.06.05.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:51:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 06 Feb 2025 15:51:07 +0200
Subject: [PATCH 2/2] drm/msm/dp: reuse generic HDMI codec implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-dp-hdmi-audio-v1-2-8aa14a8c0d4d@linaro.org>
References: <20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org>
In-Reply-To: <20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13373;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=snQ72owwPhrhaFwR4SIaWA+XaNcn+pxVUNbe6nPEt/o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpL5NL+X32LMzFHQO7/8STk8fjrrvgD/a7tixD
 823KYl690aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6S+TQAKCRCLPIo+Aiko
 1RyTCACcx7mBhoDGP6D3QcSCVU6APbA5jrElREWEt4VvBknC/Q3KBzeHzINKm8C423CRHWfc0wC
 YwZrbA9P0/RGECJHcn44K/ucSW4Ylb45ohmYHWa1RKXptfxr0eeW73kwrW4dk2BPx6JFLOlum9y
 yZ73fPkG03Ak4mUPKCOeNIl+bu8LKDrSpHDNNsqVWisx2Z4sFtyY+TMKRLD5jdk5EQIFR70wOMT
 DFQ8XPw6VFYTFr9ej6IL3JptDPNi97RMf3rWKlevGadvyC0YMxp0wHkOTrmhni92WpqRqj9a0MG
 f5AAF3YnqNp4noKbKdwJk8nAagY/nmFXdgIhm198UncLaN7V
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
index 24dd37f1682bf5016bb0efbeb44489061deff060..cc3dd56b6ff48494e4c1e561a6cac6a54d7c1f34 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -12,6 +12,7 @@
 #include <linux/phy/phy.h>
 #include <linux/delay.h>
 #include <drm/display/drm_dp_aux_bus.h>
+#include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/drm_edid.h>
 
 #include "msm_drv.h"
@@ -287,13 +288,6 @@ static int msm_dp_display_bind(struct device *dev, struct device *master,
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
@@ -315,7 +309,6 @@ static void msm_dp_display_unbind(struct device *dev, struct device *master,
 
 	of_dp_aux_depopulate_bus(dp->aux);
 
-	msm_dp_unregister_audio_driver(dev, dp->audio);
 	msm_dp_aux_unregister(dp->aux);
 	dp->drm_dev = NULL;
 	dp->aux->drm_dev = NULL;
@@ -611,9 +604,9 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
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
@@ -892,19 +885,6 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
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
index d3e241ea6941615b8e274dd17426c2f8557f09b5..0139b6c2e53f48785cdffaf4ccfe391098da3715 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -11,6 +11,7 @@
 
 #include "msm_drv.h"
 #include "msm_kms.h"
+#include "dp_audio.h"
 #include "dp_drm.h"
 
 /**
@@ -113,6 +114,9 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.hpd_disable  = msm_dp_bridge_hpd_disable,
 	.hpd_notify   = msm_dp_bridge_hpd_notify,
 	.debugfs_init = msm_dp_bridge_debugfs_init,
+
+	.hdmi_audio_prepare = msm_dp_audio_prepare,
+	.hdmi_audio_shutdown = msm_dp_audio_shutdown,
 };
 
 static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
@@ -319,9 +323,13 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	 */
 	if (!msm_dp_display->is_edp) {
 		bridge->ops =
+			DRM_BRIDGE_OP_DisplayPort |
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


