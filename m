Return-Path: <linux-arm-msm+bounces-47217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF0A2D218
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 01:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A7FA3A5914
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 00:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2180187FFA;
	Sat,  8 Feb 2025 00:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/bHIogz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E801865EB
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738974446; cv=none; b=MFTSWWSh+utJt6M/it663TjG9LbwVmi3cTOqxkNQE2ozuOYyPYAsHQWzfmTOlFFXkaNT+pjXN5PZFhqcEah0dAJndaqr82Mfdd6RmBF2qS/dxLPWqjDCnxJ+IcHkcAx2ArUd+7UHKxge+7gPGjKv5/cue3B7szO6NdFFlWCuddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738974446; c=relaxed/simple;
	bh=mmljonIq4bmX1OF/1IouRRVjrYkdx+Ed4/wrzZ3byT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWo8DBoQn+atfeCuN9FW0cnEq+lgkmXHlDuZOZWvSb/ImRVXqNXyMH8CjXGhWzIPrY+ZLNUHU97ezNMg3R4+4javc2LTJr9ImBUY5Aij/uQ/gc3/gqgdGGU3Qbld7I4zH6fPA+zfedMMzXlZryyIWR58zlE6nwjKTLrrFggCQeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/bHIogz; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5450475df04so239173e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 16:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738974443; x=1739579243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKBfihIb/7toQsuPMJ42zqQSv8Lp5KmiSybZXSECDfY=;
        b=x/bHIogzkgeONs0LmcfOv+gJ1t89AMHR3GY53sMOQe4x0A6XkLcpZIK8t1v072ERH+
         aeBb05oxnaVrMOYOlECwL6yNdIJyUk2xjfjhSsirrN+n0CqmIVWZu+4Tu4otque9ZEbi
         coYr7Lqe+gSP4P9CJdosloVv9pF9I1HtOYzxnWJjJ3EdxQ3OCUvLilTaQLBb3pPk5BIX
         4P3DsBDGz2j1R/ZQLMIe78hlDMytfim1lB3w7edv3E194rOrTE2SYW0xdGL9qU56rUph
         WJFRZRUTolQE/6snfJii9XtFVhEh8ChqkIvyj+pGxxZ0sokkxu+wdAOYMMbR5U5hf24R
         5q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738974443; x=1739579243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKBfihIb/7toQsuPMJ42zqQSv8Lp5KmiSybZXSECDfY=;
        b=BZf2pvnyhGxVQqCa3vUE2IJFcsU5AFQk1vTwkGbpzSFoSh0/Dqgb8R6EPb9pkYgZ0N
         3LamnB+WY8hgPl8wPFOx01okuUlUeqYnR+i7yKFRU0Ll+BtCC9ZpmfyElYIpeEid82Tg
         dSJW6Z3M7FKXLWvKlnTMEj24m59bnNd1CcJ+u7txYWpwEwf2S3p2XLHZXKa6/G+J0ncp
         AsQPDYSmrlCEESWuzk+IcvQvnHext+uj1XY4gdz4tl8SzyDdX/r1Sid3aK8i6Za0xbYQ
         qhlj90YuuXGkN6NgZoQYifQcyPl1aBrBlR1qxzPkbdEq6UmfIUtaScMMkMc3yfL5D2wK
         qeLw==
X-Forwarded-Encrypted: i=1; AJvYcCVLE+Y8HeixXIIdnTY4IkYu4MsgOtlfE0rvbuNp8qBjKDE39ZT57xgQyJ5/9/GnKw8qnVlmlDopbkBMefOb@vger.kernel.org
X-Gm-Message-State: AOJu0YzAA9RiRhyRI4M1mXySpkyWPZ+cheUDFuoPH8uezxvsXP29DKsF
	CocckZ2rhUoHO+lZyLLmUVWtMgc1U+o+AdOHZWJ4Q2rA6FDrEkSZGgh3Noj0jn8=
X-Gm-Gg: ASbGncsmbyjFCPl3mo/fDyA2cio/mssb0x68PHWUFcBf5i3OdF0fXxpJift9O99cYjt
	WD2fd3ntiIuMYNORvD0L/pDXcq0ImIMYVd3zq9PbYMs8gQTCYGSXD5UAsDlA8YlJxkCVpppjgDT
	Mx/As62cEKJuhO7vH2v1kIxltM0K3ARNvYCFUhInSShvy1ZyBc6XjOFhkMGw62FDL85etzmivdb
	lieAUEpdIjM3gHNE9nKiHjuY+9uIphzzYujGgN0NETeJYO23VXVJcEhFrNqIeZh5nLICvQuMWYY
	CQpSrijOXfm8NcOJDAhmHQc=
X-Google-Smtp-Source: AGHT+IHZSW4Dkfz7HURQi0tLhTK84rJtDghh8lEJ0rbz/uo2oI/zXnEvOcA2okiZEs8sAKjV9XPpeQ==
X-Received: by 2002:a05:6512:70e:b0:544:1429:966b with SMTP id 2adb3069b0e04-54414ae6304mr1353119e87.50.1738974442559;
        Fri, 07 Feb 2025 16:27:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 16:27:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:06 +0200
Subject: [PATCH v7 7/7] drm/msm/hdmi: use DRM HDMI Audio framework
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-7-0c3837f00258@linaro.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9768;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mmljonIq4bmX1OF/1IouRRVjrYkdx+Ed4/wrzZ3byT8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTWkEs9L1fxTSs1igqv+ShEHJooNjO8pNQ9s
 F4jUjrUx9aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1gAKCRCLPIo+Aiko
 1X2HCACkBByn92WsrGJqa5QaM/8pWvBtmUs9SmuLwIsjn++TDN7FD3Ukh0c4NbF+MYJvGt2jOuv
 KFW6Dp4lOUIDm+CUArHlNIja+vCSpv7h5Czyh8Nv5TlMIjJH+RcZVoyPa9610EWusOABoDluSMA
 POoJ+PrYrYkht0iBrIhot9LHW8zm7H0g+/0t0O5y8j5bSasAjYADTqaHc+Q9TOUd4TLuckZCbfN
 m9QHw/izPjI2lCtYk/QM6Y9IGJXePtvydKY2JGH2oHedJiXVbUSI413JzkrkN8kVz6lU+5s8ifz
 MeatTUaZ9JEMLjhIhodifpye8BwnLqSb2112Jpzc2J6F8uXY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to simplify the driver even further and to remove the
boilerplate code, rewrite the audio interface to use the DRM HDMI Audio
framework.

Audio InfoFames are controlled centrally via the DRM HDMI framework.
Correct InfoFrame data is programmed at the atomic_pre_enable() time (if
it was set before, drm_atomic_helper_connector_hdmi_update_infoframes()
takes care of writing all InfoFrames, including the Audio one.) or
during msm_hdmi_bridge_audio_prepare() when the new stream is started.

All audio data frame management is deferred to
msm_hdmi_bridge_audio_prepare() and msm_hdmi_bridge_audio_shutdown().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 91 ----------------------------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 18 +++----
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c  | 68 +++++++++++++++++++++----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  5 ++
 4 files changed, 71 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 6b77e0fb8d5ec218dfbf58215e2e12ad1dfb1b85..248541ff449204c72cd444458dadb9ae4a0a53d1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -14,7 +14,6 @@
 #include <drm/drm_of.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
-#include <sound/hdmi-codec.h>
 #include "hdmi.h"
 
 void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
@@ -245,87 +244,6 @@ static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
-/*
- * HDMI audio codec callbacks
- */
-static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
-				    struct hdmi_codec_daifmt *daifmt,
-				    struct hdmi_codec_params *params)
-{
-	struct hdmi *hdmi = dev_get_drvdata(dev);
-	unsigned int rate;
-	int ret;
-
-	DRM_DEV_DEBUG(dev, "%u Hz, %d bit, %d channels\n", params->sample_rate,
-		 params->sample_width, params->cea.channels);
-
-	switch (params->sample_rate) {
-	case 32000:
-		rate = HDMI_SAMPLE_RATE_32KHZ;
-		break;
-	case 44100:
-		rate = HDMI_SAMPLE_RATE_44_1KHZ;
-		break;
-	case 48000:
-		rate = HDMI_SAMPLE_RATE_48KHZ;
-		break;
-	case 88200:
-		rate = HDMI_SAMPLE_RATE_88_2KHZ;
-		break;
-	case 96000:
-		rate = HDMI_SAMPLE_RATE_96KHZ;
-		break;
-	case 176400:
-		rate = HDMI_SAMPLE_RATE_176_4KHZ;
-		break;
-	case 192000:
-		rate = HDMI_SAMPLE_RATE_192KHZ;
-		break;
-	default:
-		DRM_DEV_ERROR(dev, "rate[%d] not supported!\n",
-			params->sample_rate);
-		return -EINVAL;
-	}
-
-	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(hdmi->connector,
-								      &params->cea);
-	if (ret)
-		return ret;
-
-	msm_hdmi_audio_info_setup(hdmi, rate, params->cea.channels);
-
-	return 0;
-}
-
-static void msm_hdmi_audio_shutdown(struct device *dev, void *data)
-{
-	struct hdmi *hdmi = dev_get_drvdata(dev);
-
-	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(hdmi->connector);
-	msm_hdmi_audio_disable(hdmi);
-}
-
-static const struct hdmi_codec_ops msm_hdmi_audio_codec_ops = {
-	.hw_params = msm_hdmi_audio_hw_params,
-	.audio_shutdown = msm_hdmi_audio_shutdown,
-};
-
-static struct hdmi_codec_pdata codec_data = {
-	.ops = &msm_hdmi_audio_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
-};
-
-static int msm_hdmi_register_audio_driver(struct hdmi *hdmi, struct device *dev)
-{
-	hdmi->audio_pdev = platform_device_register_data(dev,
-							 HDMI_CODEC_DRV_NAME,
-							 PLATFORM_DEVID_AUTO,
-							 &codec_data,
-							 sizeof(codec_data));
-	return PTR_ERR_OR_ZERO(hdmi->audio_pdev);
-}
-
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(master);
@@ -337,12 +255,6 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 		return err;
 	priv->hdmi = hdmi;
 
-	err = msm_hdmi_register_audio_driver(hdmi, dev);
-	if (err) {
-		DRM_ERROR("Failed to attach an audio codec %d\n", err);
-		hdmi->audio_pdev = NULL;
-	}
-
 	return 0;
 }
 
@@ -352,9 +264,6 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
 	if (priv->hdmi) {
-		if (priv->hdmi->audio_pdev)
-			platform_device_unregister(priv->hdmi->audio_pdev);
-
 		if (priv->hdmi->bridge)
 			msm_hdmi_hpd_disable(priv->hdmi);
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index cdd3bd4f37831f9a606a4c3627a48364f5d4025f..a5f481c39277631b7a19d294b086d6208be26511 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -33,7 +33,6 @@ struct hdmi_hdcp_ctrl;
 struct hdmi {
 	struct drm_device *dev;
 	struct platform_device *pdev;
-	struct platform_device *audio_pdev;
 
 	const struct hdmi_platform_config *config;
 
@@ -205,17 +204,16 @@ static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
 /*
  * audio:
  */
-#define	HDMI_SAMPLE_RATE_32KHZ		0
-#define	HDMI_SAMPLE_RATE_44_1KHZ	1
-#define	HDMI_SAMPLE_RATE_48KHZ		2
-#define	HDMI_SAMPLE_RATE_88_2KHZ	3
-#define	HDMI_SAMPLE_RATE_96KHZ		4
-#define	HDMI_SAMPLE_RATE_176_4KHZ	5
-#define	HDMI_SAMPLE_RATE_192KHZ		6
+struct hdmi_codec_daifmt;
+struct hdmi_codec_params;
 
 int msm_hdmi_audio_update(struct hdmi *hdmi);
-int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels);
-int msm_hdmi_audio_disable(struct hdmi *hdmi);
+int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params);
+void msm_hdmi_bridge_audio_shutdown(struct drm_connector *connector,
+				    struct drm_bridge *bridge);
 
 /*
  * hdmi bridge:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
index 0b91ed5eabd234ff3bca0c2dfaa159dd2e6a9df5..8bb975e82c17c1d77217128e9ddbd6a0575bb33d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
@@ -4,7 +4,12 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_hdmi_state_helper.h>
+
 #include <linux/hdmi.h>
+
+#include <sound/hdmi-codec.h>
+
 #include "hdmi.h"
 
 /* Supported HDMI Audio sample rates */
@@ -192,29 +197,72 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 	return 0;
 }
 
-int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels)
+int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params)
 {
-	if (!hdmi)
-		return -ENXIO;
-
-	if ((rate < 0) || (rate >= MSM_HDMI_SAMPLE_RATE_MAX))
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	unsigned int rate;
+	int ret;
+
+	drm_dbg_driver(bridge->dev, "%u Hz, %d bit, %d channels\n",
+		       params->sample_rate,
+		       params->sample_width,
+		       params->cea.channels);
+
+	switch (params->sample_rate) {
+	case 32000:
+		rate = MSM_HDMI_SAMPLE_RATE_32KHZ;
+		break;
+	case 44100:
+		rate = MSM_HDMI_SAMPLE_RATE_44_1KHZ;
+		break;
+	case 48000:
+		rate = MSM_HDMI_SAMPLE_RATE_48KHZ;
+		break;
+	case 88200:
+		rate = MSM_HDMI_SAMPLE_RATE_88_2KHZ;
+		break;
+	case 96000:
+		rate = MSM_HDMI_SAMPLE_RATE_96KHZ;
+		break;
+	case 176400:
+		rate = MSM_HDMI_SAMPLE_RATE_176_4KHZ;
+		break;
+	case 192000:
+		rate = MSM_HDMI_SAMPLE_RATE_192KHZ;
+		break;
+	default:
+		drm_err(bridge->dev, "rate[%d] not supported!\n",
+			params->sample_rate);
 		return -EINVAL;
+	}
+
+	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
+								      &params->cea);
+	if (ret)
+		return ret;
 
 	hdmi->audio.rate = rate;
-	hdmi->audio.channels = channels;
+	hdmi->audio.channels = params->cea.channels;
 	hdmi->audio.enabled = true;
 
 	return msm_hdmi_audio_update(hdmi);
 }
 
-int msm_hdmi_audio_disable(struct hdmi *hdmi)
+void msm_hdmi_bridge_audio_shutdown(struct drm_connector *connector,
+				    struct drm_bridge *bridge)
 {
-	if (!hdmi)
-		return -ENXIO;
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+
+	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(connector);
 
 	hdmi->audio.rate = 0;
 	hdmi->audio.channels = 2;
 	hdmi->audio.enabled = false;
 
-	return msm_hdmi_audio_update(hdmi);
+	msm_hdmi_audio_update(hdmi);
 }
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index aee75eee3d4244cd95e44df46d65b8e3e53de735..c6659e62594558b3c0c25de36aa8c459aa253834 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -478,6 +478,8 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.hdmi_tmds_char_rate_valid = msm_hdmi_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = msm_hdmi_bridge_clear_infoframe,
 	.hdmi_write_infoframe = msm_hdmi_bridge_write_infoframe,
+	.hdmi_audio_prepare = msm_hdmi_bridge_audio_prepare,
+	.hdmi_audio_shutdown = msm_hdmi_bridge_audio_shutdown,
 };
 
 static void
@@ -515,6 +517,9 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |
 		DRM_BRIDGE_OP_EDID;
+	bridge->hdmi_audio_max_i2s_playback_channels = 8;
+	bridge->hdmi_audio_dev = &hdmi->pdev->dev;
+	bridge->hdmi_audio_dai_port = -1;
 
 	ret = devm_drm_bridge_add(hdmi->dev->dev, bridge);
 	if (ret)

-- 
2.39.5


