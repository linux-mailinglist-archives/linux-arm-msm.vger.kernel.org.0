Return-Path: <linux-arm-msm+bounces-46111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C1A1BE0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 22:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E8143A5258
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 21:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A8B1EEA2B;
	Fri, 24 Jan 2025 21:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWnh5BXA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CF51E98EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 21:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737755277; cv=none; b=cDlMdKETxzByrB+qx7Pmr65L8p/a/48iZH62nKoMs6XQ9rTT1LHVoNDlTtNmOTFU4xuDxBWg2/aWc99P7KcDQaRp6rc6E1mTucdL4W122PJJX+JisyM//Q5jjAqE3Ez3wUa0RpmBWstyQZP31A3ymPfO9h35w/Ke4+6JpXxbkd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737755277; c=relaxed/simple;
	bh=aUFnzCOLwI3rcPXFc0KGTqsfg1fNX73fbcUmk4iVIWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+/OVC8zK93YKjkNBe7BSRVnwel1L0hS/3J6EXH564r8Sw6bpyuNIj3Xcreg/OqR6rFH0vFSt2HnqDMJzB2rB1voL6XUqdQa+LF8AF+7ugxiHCRql58D+dgICtVdVUaZ+t7t23JiaeUumHAbTtLtlqucvXRfm+G+SgIE5XyeR0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWnh5BXA; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so2705864e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 13:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737755272; x=1738360072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=218UCCirz0adWycPKYaSzNsLxEvuZWNW6UJ0wiWvVao=;
        b=EWnh5BXARFAbikLnwg82JT+Cqb14HsJqBPDpWkZz76HWumCzgLLgkmVdXk1JCCHxn3
         EdJcDbv0uZitUdiPZB/JpSuwAIajiaesSNnI58/7wN54QE2e7Japm1xUr21C/xGq27x5
         ISFzxkB7YtNoBhFg9IhCt5fUDgFaqJcFdhfPNofJyG3iwHxiC66/V7w606A+ODsC51Ji
         HSLyExT19AHMVnnNVlEUG5xvyGk0wu/wZfOxMbHsj58nBQxEGH/1mAKQC4APnlAbXpZT
         cEn1ewcq/Ly3FmHSw213hZGSqP3zHASCDzGjsNNZhjTERM6MAOegdxgiEcEvwewI/g1u
         WAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737755272; x=1738360072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=218UCCirz0adWycPKYaSzNsLxEvuZWNW6UJ0wiWvVao=;
        b=KrFAJH8Y1AqxpKmJLAljRX5QZSRJmdnLSLC+lDKY5LdH0BuVDH4u1B13urFbdqtfsM
         gadFtyDc/CkONdBm/+gAg1KnhfjgrZOJKt4gDjAfR+KhaOrF42UWYB2+WdGMQRcOfjt4
         8ThAqM2bKFqP58orQwAjsqRG3MjopL90fE54N+pNO80u/5sIVF5SsAiPLLj1hobGW3Bm
         wQeGNDPb/NBYIOEotqqbz9UetscOtS6tntXW3GN1ocL5bWO32fKeQ7/JszP3anzGOAvk
         PtEzsl/lxtCduQqQaNuPhYTC7zcvAWzvVLwtoeo9TutsN0FkIT7vdAYhfUNrWbmulAir
         Ilbg==
X-Forwarded-Encrypted: i=1; AJvYcCX6odHxntUXzkAKm3IeXnuusSX2JwGNqE8Olgx0twiP0CBLLZ+MIzIC0+nczoiloNnMcUtEzt9lLrYUgA0i@vger.kernel.org
X-Gm-Message-State: AOJu0YzTwfTLFZFGXZLxfl8NHWwUXtpXG0gutkz3Cpt4xugCWTu7coXE
	eeWIBt8DW0FiwmlBi0sNJIqAyru3KNSP2AAmR+BwBeuZj7/kM0HZzpCnFpfKRh0=
X-Gm-Gg: ASbGnct0+AVyPrj21T0Mw8/bFeP8WYMW6AYgcWvKrl+zL2BoNYESWkQI4Vdf4mspq83
	bBz0iwNy8nDZItGv1Us2Ufe9MhFcOtptahnvJMM36uBLX93bw/lJLTjTmgJZhh8hx8lqeXGuLRH
	J+YSVD5zuwlWakOBZPV9QMS5dRsshKzx4uC6nA3f7xdoVDEAPOG8mYck2mF1vti6w8Lwk4OedUg
	aPACNFlJNbCKfYRHP1p5/dpbUxEoU3pDlP9MIqTFgKhFYcdAenxFy2nbEzYxlufKTaLTlmWTVNt
	6lcHmBc0xWVA
X-Google-Smtp-Source: AGHT+IElm/Asqb946d6xfMLis2dYG51U1RwpV5Sj+GUiw/PxhvdBh4k319aX8D8tg9lEDQjFrOnHMg==
X-Received: by 2002:a05:6512:1104:b0:53e:df2b:df25 with SMTP id 2adb3069b0e04-5439c228ceemr12330422e87.16.1737755272340;
        Fri, 24 Jan 2025 13:47:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8237491sm425014e87.104.2025.01.24.13.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 13:47:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 23:47:43 +0200
Subject: [PATCH v6 3/7] drm/msm/hdmi: make use of the drm_connector_hdmi
 framework
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-bridge-hdmi-connector-v6-3-1592632327f7@linaro.org>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
In-Reply-To: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=21579;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aUFnzCOLwI3rcPXFc0KGTqsfg1fNX73fbcUmk4iVIWw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnlAqAiK4haZBE3v7FWCPHryoNjLDbgaTaj1Z7m
 bPjuR8IxJOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5QKgAAKCRCLPIo+Aiko
 1RpNB/0Wu0eu6UMmXd7eKGqlxEJKkNkSAGqyj/UY0BTXdXSE7i2la3cSi+TQ6IzG8Spl+ntamaM
 3TFQ1WUyh85R5kl7BY1gFt2Icio+wdQ5bIm9uusvKPNRsmRpcuUlbTeXbcXifhmzEbicTQnxSkR
 6mA3reHLJt+yLgj1Kezh7P5el4NszXLk0M2u0/i68fjSxHZLiwo9e1ulBY80eQfbKpup4aTjMxx
 fPWUyoT0z4mW9dVGR69Sx4s49xZim5JZc33LXOeIT8PhGFajZQS88f2KdHdTeKR8EcUdYRlQVsG
 9I2eaivvse5LQGn8fmqSYf88V0vasuQDbKvDVSofPu/cA603
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Setup the HDMI connector on the MSM HDMI outputs. Make use of
atomic_check hook and of the provided Infoframe infrastructure.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig            |   2 +
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  45 ++-------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  16 +--
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c  |  74 ++++----------
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 180 +++++++++++++++++++++++----------
 5 files changed, 162 insertions(+), 155 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 7ec833b6d8292f8cb26cfe5582812f2754cd4d35..974bc7c0ea761147d3326bdce9039d6f26f290d0 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -170,6 +170,8 @@ config DRM_MSM_HDMI
 	bool "Enable HDMI support in MSM DRM driver"
 	depends on DRM_MSM
 	default y
+	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  Compile in support for the HDMI output MSM DRM driver. It can
 	  be a primary or a secondary display on device. Note that this is used
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 37b3809c6bdd7c35aca6b475cb1f41c0ab4d3e6d..b14205cb9e977edd0d849e0eafe9b69c0da594bd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -12,6 +12,7 @@
 
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
+#include <drm/display/drm_hdmi_state_helper.h>
 
 #include <sound/hdmi-codec.h>
 #include "hdmi.h"
@@ -165,8 +166,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	hdmi->dev = dev;
 	hdmi->encoder = encoder;
 
-	hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
-
 	ret = msm_hdmi_bridge_init(hdmi);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: %d\n", ret);
@@ -254,40 +253,12 @@ static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
 				    struct hdmi_codec_params *params)
 {
 	struct hdmi *hdmi = dev_get_drvdata(dev);
-	unsigned int chan;
-	unsigned int channel_allocation = 0;
 	unsigned int rate;
-	unsigned int level_shift  = 0; /* 0dB */
-	bool down_mix = false;
+	int ret;
 
 	DRM_DEV_DEBUG(dev, "%u Hz, %d bit, %d channels\n", params->sample_rate,
 		 params->sample_width, params->cea.channels);
 
-	switch (params->cea.channels) {
-	case 2:
-		/* FR and FL speakers */
-		channel_allocation  = 0;
-		chan = MSM_HDMI_AUDIO_CHANNEL_2;
-		break;
-	case 4:
-		/* FC, LFE, FR and FL speakers */
-		channel_allocation  = 0x3;
-		chan = MSM_HDMI_AUDIO_CHANNEL_4;
-		break;
-	case 6:
-		/* RR, RL, FC, LFE, FR and FL speakers */
-		channel_allocation  = 0x0B;
-		chan = MSM_HDMI_AUDIO_CHANNEL_6;
-		break;
-	case 8:
-		/* FRC, FLC, RR, RL, FC, LFE, FR and FL speakers */
-		channel_allocation  = 0x1F;
-		chan = MSM_HDMI_AUDIO_CHANNEL_8;
-		break;
-	default:
-		return -EINVAL;
-	}
-
 	switch (params->sample_rate) {
 	case 32000:
 		rate = HDMI_SAMPLE_RATE_32KHZ;
@@ -316,9 +287,12 @@ static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
 		return -EINVAL;
 	}
 
-	msm_hdmi_audio_set_sample_rate(hdmi, rate);
-	msm_hdmi_audio_info_setup(hdmi, 1, chan, channel_allocation,
-			      level_shift, down_mix);
+	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(hdmi->connector,
+								      &params->cea);
+	if (ret)
+		return ret;
+
+	msm_hdmi_audio_info_setup(hdmi, rate, params->cea.channels);
 
 	return 0;
 }
@@ -327,7 +301,8 @@ static void msm_hdmi_audio_shutdown(struct device *dev, void *data)
 {
 	struct hdmi *hdmi = dev_get_drvdata(dev);
 
-	msm_hdmi_audio_info_setup(hdmi, 0, 0, 0, 0, 0);
+	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(hdmi->connector);
+	msm_hdmi_audio_disable(hdmi);
 }
 
 static const struct hdmi_codec_ops msm_hdmi_audio_codec_ops = {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a62d2aedfbb7239d37c826c4f96762f100a2be4a..53b52351d0eddf4a5c87a5290016bb53ed4d29f7 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -24,8 +24,8 @@ struct hdmi_platform_config;
 
 struct hdmi_audio {
 	bool enabled;
-	struct hdmi_audio_infoframe infoframe;
 	int rate;
+	int channels;
 };
 
 struct hdmi_hdcp_ctrl;
@@ -207,12 +207,6 @@ static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
 /*
  * audio:
  */
-/* Supported HDMI Audio channels and rates */
-#define	MSM_HDMI_AUDIO_CHANNEL_2	0
-#define	MSM_HDMI_AUDIO_CHANNEL_4	1
-#define	MSM_HDMI_AUDIO_CHANNEL_6	2
-#define	MSM_HDMI_AUDIO_CHANNEL_8	3
-
 #define	HDMI_SAMPLE_RATE_32KHZ		0
 #define	HDMI_SAMPLE_RATE_44_1KHZ	1
 #define	HDMI_SAMPLE_RATE_48KHZ		2
@@ -221,12 +215,8 @@ static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
 #define	HDMI_SAMPLE_RATE_176_4KHZ	5
 #define	HDMI_SAMPLE_RATE_192KHZ		6
 
-int msm_hdmi_audio_update(struct hdmi *hdmi);
-int msm_hdmi_audio_info_setup(struct hdmi *hdmi, bool enabled,
-	uint32_t num_of_channels, uint32_t channel_allocation,
-	uint32_t level_shift, bool down_mix);
-void msm_hdmi_audio_set_sample_rate(struct hdmi *hdmi, int rate);
-
+int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels);
+int msm_hdmi_audio_disable(struct hdmi *hdmi);
 
 /*
  * hdmi bridge:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
index 4c2058c4adc1001a12e10f35e88a6d58f3bd2fdc..924654bfb48cf17feadea1c0661ee6ee4e1b4589 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
@@ -7,9 +7,6 @@
 #include <linux/hdmi.h>
 #include "hdmi.h"
 
-/* maps MSM_HDMI_AUDIO_CHANNEL_n consts used by audio driver to # of channels: */
-static int nchannels[] = { 2, 4, 6, 8 };
-
 /* Supported HDMI Audio sample rates */
 #define MSM_HDMI_SAMPLE_RATE_32KHZ		0
 #define MSM_HDMI_SAMPLE_RATE_44_1KHZ		1
@@ -71,19 +68,20 @@ static const struct hdmi_msm_audio_arcs *get_arcs(unsigned long int pixclock)
 	return NULL;
 }
 
-int msm_hdmi_audio_update(struct hdmi *hdmi)
+static int msm_hdmi_audio_update(struct hdmi *hdmi)
 {
 	struct hdmi_audio *audio = &hdmi->audio;
-	struct hdmi_audio_infoframe *info = &audio->infoframe;
 	const struct hdmi_msm_audio_arcs *arcs = NULL;
 	bool enabled = audio->enabled;
 	uint32_t acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl;
-	uint32_t infofrm_ctrl, audio_config;
+	uint32_t audio_config;
+
+	if (!hdmi->connector->display_info.is_hdmi)
+		return -EINVAL;
+
+	DBG("audio: enabled=%d, channels=%d, rate=%d",
+	    audio->enabled, audio->channels, audio->rate);
 
-	DBG("audio: enabled=%d, channels=%d, channel_allocation=0x%x, "
-		"level_shift_value=%d, downmix_inhibit=%d, rate=%d",
-		audio->enabled, info->channels,  info->channel_allocation,
-		info->level_shift_value, info->downmix_inhibit, audio->rate);
 	DBG("video: power_on=%d, pixclock=%lu", hdmi->power_on, hdmi->pixclock);
 
 	if (enabled && !(hdmi->power_on && hdmi->pixclock)) {
@@ -104,7 +102,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 	acr_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_ACR_PKT_CTRL);
 	vbi_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_VBI_PKT_CTRL);
 	aud_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_AUDIO_PKT_CTRL1);
-	infofrm_ctrl = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
 	audio_config = hdmi_read(hdmi, REG_HDMI_AUDIO_CFG);
 
 	/* Clear N/CTS selection bits */
@@ -113,7 +110,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 	if (enabled) {
 		uint32_t n, cts, multiplier;
 		enum hdmi_acr_cts select;
-		uint8_t buf[14];
 
 		n   = arcs->lut[audio->rate].n;
 		cts = arcs->lut[audio->rate].cts;
@@ -155,20 +151,12 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 				HDMI_ACR_1_N(n));
 
 		hdmi_write(hdmi, REG_HDMI_AUDIO_PKT_CTRL2,
-				COND(info->channels != 2, HDMI_AUDIO_PKT_CTRL2_LAYOUT) |
+				COND(audio->channels != 2, HDMI_AUDIO_PKT_CTRL2_LAYOUT) |
 				HDMI_AUDIO_PKT_CTRL2_OVERRIDE);
 
 		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_CONT;
 		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_SEND;
 
-		/* configure infoframe: */
-		hdmi_audio_infoframe_pack(info, buf, sizeof(buf));
-		hdmi_write(hdmi, REG_HDMI_AUDIO_INFO0,
-				(buf[3] <<  0) | (buf[4] <<  8) |
-				(buf[5] << 16) | (buf[6] << 24));
-		hdmi_write(hdmi, REG_HDMI_AUDIO_INFO1,
-				(buf[7] <<  0) | (buf[8] << 8));
-
 		hdmi_write(hdmi, REG_HDMI_GC, 0);
 
 		vbi_pkt_ctrl |= HDMI_VBI_PKT_CTRL_GC_ENABLE;
@@ -176,11 +164,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 
 		aud_pkt_ctrl |= HDMI_AUDIO_PKT_CTRL1_AUDIO_SAMPLE_SEND;
 
-		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND;
-		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT;
-		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE;
-		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
-
 		audio_config &= ~HDMI_AUDIO_CFG_FIFO_WATERMARK__MASK;
 		audio_config |= HDMI_AUDIO_CFG_FIFO_WATERMARK(4);
 		audio_config |= HDMI_AUDIO_CFG_ENGINE_ENABLE;
@@ -190,17 +173,12 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		vbi_pkt_ctrl &= ~HDMI_VBI_PKT_CTRL_GC_ENABLE;
 		vbi_pkt_ctrl &= ~HDMI_VBI_PKT_CTRL_GC_EVERY_FRAME;
 		aud_pkt_ctrl &= ~HDMI_AUDIO_PKT_CTRL1_AUDIO_SAMPLE_SEND;
-		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND;
-		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT;
-		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE;
-		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
 		audio_config &= ~HDMI_AUDIO_CFG_ENGINE_ENABLE;
 	}
 
 	hdmi_write(hdmi, REG_HDMI_ACR_PKT_CTRL, acr_pkt_ctrl);
 	hdmi_write(hdmi, REG_HDMI_VBI_PKT_CTRL, vbi_pkt_ctrl);
 	hdmi_write(hdmi, REG_HDMI_AUDIO_PKT_CTRL1, aud_pkt_ctrl);
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, infofrm_ctrl);
 
 	hdmi_write(hdmi, REG_HDMI_AUD_INT,
 			COND(enabled, HDMI_AUD_INT_AUD_FIFO_URUN_INT) |
@@ -214,41 +192,29 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 	return 0;
 }
 
-int msm_hdmi_audio_info_setup(struct hdmi *hdmi, bool enabled,
-	uint32_t num_of_channels, uint32_t channel_allocation,
-	uint32_t level_shift, bool down_mix)
+int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels)
 {
-	struct hdmi_audio *audio;
-
 	if (!hdmi)
 		return -ENXIO;
 
-	audio = &hdmi->audio;
-
-	if (num_of_channels >= ARRAY_SIZE(nchannels))
+	if ((rate < 0) || (rate >= MSM_HDMI_SAMPLE_RATE_MAX))
 		return -EINVAL;
 
-	audio->enabled = enabled;
-	audio->infoframe.channels = nchannels[num_of_channels];
-	audio->infoframe.channel_allocation = channel_allocation;
-	audio->infoframe.level_shift_value = level_shift;
-	audio->infoframe.downmix_inhibit = down_mix;
+	hdmi->audio.rate = rate;
+	hdmi->audio.channels = channels;
+	hdmi->audio.enabled = true;
 
 	return msm_hdmi_audio_update(hdmi);
 }
 
-void msm_hdmi_audio_set_sample_rate(struct hdmi *hdmi, int rate)
+int msm_hdmi_audio_disable(struct hdmi *hdmi)
 {
-	struct hdmi_audio *audio;
-
 	if (!hdmi)
-		return;
-
-	audio = &hdmi->audio;
+		return -ENXIO;
 
-	if ((rate < 0) || (rate >= MSM_HDMI_SAMPLE_RATE_MAX))
-		return;
+	hdmi->audio.rate = 0;
+	hdmi->audio.channels = 2;
+	hdmi->audio.enabled = false;
 
-	audio->rate = rate;
-	msm_hdmi_audio_update(hdmi);
+	return msm_hdmi_audio_update(hdmi);
 }
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d5ab1f74c0e6f47dc59872c016104e9a84d85e9e..168b4104e705e8217f5d7ca5f902d7557c55ae24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -7,6 +7,8 @@
 #include <linux/delay.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_hdmi_state_helper.h>
 
 #include "msm_kms.h"
 #include "hdmi.h"
@@ -68,23 +70,17 @@ static void power_off(struct drm_bridge *bridge)
 
 #define AVI_IFRAME_LINE_NUMBER 1
 
-static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
+static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
+					 const u8 *buffer, size_t len)
 {
-	struct drm_crtc *crtc = hdmi->encoder->crtc;
-	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
-	union hdmi_infoframe frame;
-	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
+	u32 buf[4] = {};
 	u32 val;
-	int len;
+	int i;
 
-	drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
-						 hdmi->connector, mode);
-
-	len = hdmi_infoframe_pack(&frame, buffer, sizeof(buffer));
-	if (len < 0) {
+	if (len != HDMI_INFOFRAME_SIZE(AVI) || len - 3 > sizeof(buf)) {
 		DRM_DEV_ERROR(&hdmi->pdev->dev,
 			"failed to configure avi infoframe\n");
-		return;
+		return -EINVAL;
 	}
 
 	/*
@@ -93,37 +89,118 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	 * written to the LSB byte of AVI_INFO0 and the version is written to
 	 * the third byte from the LSB of AVI_INFO3
 	 */
-	hdmi_write(hdmi, REG_HDMI_AVI_INFO(0),
+	memcpy(buf, &buffer[3], len - 3);
+
+	buf[3] |= buffer[1] << 24;
+
+	for (i = 0; i < ARRAY_SIZE(buf); i++)
+		hdmi_write(hdmi, REG_HDMI_AVI_INFO(i), buf[i]);
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+	val |= HDMI_INFOFRAME_CTRL0_AVI_SEND |
+		HDMI_INFOFRAME_CTRL0_AVI_CONT;
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
+	val |= HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER);
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+
+	return 0;
+}
+
+static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
+					   const u8 *buffer, size_t len)
+{
+	u32 val;
+
+	if (len != HDMI_INFOFRAME_SIZE(AUDIO)) {
+		DRM_DEV_ERROR(&hdmi->pdev->dev,
+			"failed to configure audio infoframe\n");
+		return -EINVAL;
+	}
+
+	hdmi_write(hdmi, REG_HDMI_AUDIO_INFO0,
 		   buffer[3] |
 		   buffer[4] << 8 |
 		   buffer[5] << 16 |
 		   buffer[6] << 24);
 
-	hdmi_write(hdmi, REG_HDMI_AVI_INFO(1),
+	hdmi_write(hdmi, REG_HDMI_AUDIO_INFO1,
 		   buffer[7] |
 		   buffer[8] << 8 |
 		   buffer[9] << 16 |
 		   buffer[10] << 24);
 
-	hdmi_write(hdmi, REG_HDMI_AVI_INFO(2),
-		   buffer[11] |
-		   buffer[12] << 8 |
-		   buffer[13] << 16 |
-		   buffer[14] << 24);
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+	val |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
+		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
+		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
+		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
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
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
+		val &= ~(HDMI_INFOFRAME_CTRL0_AVI_SEND |
+			 HDMI_INFOFRAME_CTRL0_AVI_CONT);
+		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
 
-	hdmi_write(hdmi, REG_HDMI_AVI_INFO(3),
-		   buffer[15] |
-		   buffer[16] << 8 |
-		   buffer[1] << 24);
+		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+		val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
+		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0,
-		   HDMI_INFOFRAME_CTRL0_AVI_SEND |
-		   HDMI_INFOFRAME_CTRL0_AVI_CONT);
+		break;
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
-	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
-	val |= HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER);
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
+		val &= ~(HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
+		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+
+		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+		val &= ~HDMI_INFOFRAME_CTRL1_AUDIO_INFO_LINE__MASK;
+		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+
+		break;
+
+	default:
+		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+	}
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
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		return msm_hdmi_config_audio_infoframe(hdmi, buffer, len);
+	default:
+		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return 0;
+	}
 }
 
 static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
@@ -146,16 +223,16 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
 	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 
+	hdmi->pixclock = conn_state->hdmi.tmds_char_rate;
+
 	if (!hdmi->power_on) {
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
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
 
 	msm_hdmi_set_mode(hdmi, true);
@@ -184,8 +261,6 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	if (hdmi->power_on) {
 		power_off(bridge);
 		hdmi->power_on = false;
-		if (hdmi->hdmi_mode)
-			msm_hdmi_audio_update(hdmi);
 		msm_hdmi_phy_resource_disable(phy);
 	}
 }
@@ -196,8 +271,6 @@ static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
 	int hstart, hend, vstart, vend;
 	uint32_t frame_ctrl;
 
-	hdmi->pixclock = mode->clock * 1000;
-
 	hstart = mode->htotal - mode->hsync_start;
 	hend   = mode->htotal - mode->hsync_start + mode->hdisplay;
 
@@ -241,9 +314,6 @@ static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
 		frame_ctrl |= HDMI_FRAME_CTRL_INTERLACED_EN;
 	DBG("frame_ctrl=%08x", frame_ctrl);
 	hdmi_write(hdmi, REG_HDMI_FRAME_CTRL, frame_ctrl);
-
-	if (hdmi->hdmi_mode)
-		msm_hdmi_audio_update(hdmi);
 }
 
 static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridge,
@@ -275,18 +345,16 @@ static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridg
 	return drm_edid;
 }
 
-static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
-		const struct drm_display_info *info,
-		const struct drm_display_mode *mode)
+static enum drm_mode_status msm_hdmi_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
+								 const struct drm_display_mode *mode,
+								 unsigned long long tmds_rate)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
 	struct msm_drm_private *priv = bridge->dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-	long actual, requested;
-
-	requested = 1000 * mode->clock;
+	long actual;
 
 	/* for mdp5/apq8074, we manage our own pixel clk (as opposed to
 	 * mdp4/dtv stuff where pixel clk is assigned to mdp/encoder
@@ -294,15 +362,16 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 	 */
 	if (kms->funcs->round_pixclk)
 		actual = kms->funcs->round_pixclk(kms,
-			requested, hdmi_bridge->hdmi->encoder);
+						  tmds_rate,
+						  hdmi_bridge->hdmi->encoder);
 	else if (config->pwr_clk_cnt > 0)
-		actual = clk_round_rate(hdmi->pwr_clks[0], requested);
+		actual = clk_round_rate(hdmi->pwr_clks[0], tmds_rate);
 	else
-		actual = requested;
+		actual = tmds_rate;
 
-	DBG("requested=%ld, actual=%ld", requested, actual);
+	DBG("requested=%lld, actual=%ld", tmds_rate, actual);
 
-	if (actual != requested)
+	if (actual != tmds_rate)
 		return MODE_CLOCK_RANGE;
 
 	return 0;
@@ -314,9 +383,11 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
-	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,
+	.hdmi_tmds_char_rate_valid = msm_hdmi_bridge_tmds_char_rate_valid,
+	.hdmi_clear_infoframe = msm_hdmi_bridge_clear_infoframe,
+	.hdmi_write_infoframe = msm_hdmi_bridge_write_infoframe,
 };
 
 static void
@@ -348,8 +419,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
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
2.39.5


