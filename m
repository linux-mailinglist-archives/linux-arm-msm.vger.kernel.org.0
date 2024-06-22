Return-Path: <linux-arm-msm+bounces-23718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBC191367A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 00:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBE7B1F22E7D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 22:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC4B80632;
	Sat, 22 Jun 2024 22:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oT+BJZcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA72974413
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 22:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719093744; cv=none; b=XHs4DjPju1RN0F026scggWEjJKEzb+Mxh+3aPQAelccuqJosAHJEs7+fy/+Caz89aI5eSAp2/cY9VBsd0vMflWbmQj1gep49tIXNAeDaiwyjgymoIK6w6oH6yFJMFQTNXBZY4ZO1Ipj76Kz0WwWF6nWz/ussU5pOeqiFqiJxAic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719093744; c=relaxed/simple;
	bh=3rPmiZo3dcY44pgbm6icOd9qL2vNRkCwi4ZPCN7/Yyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BEPPWJ4klGilZ/rA952Nri1L2S2xDP/ewyYa9K8Ap/tdpJnIlc5YQooCvNlsCu0JRS3uxWMJY3wItf+OlYloh3b+dNBQ3/N/9lAXh6SJ1t/LkjQA0kQgSPwWEdqjE6/XPchdpeHmBG4rZJRi3t9TyyDxfEvdpB2jee+yE7A+3lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oT+BJZcC; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so34374301fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 15:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719093741; x=1719698541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aS9IkNI8BPD97NPqexkA01Wai+VXQfm008vsea+QEiM=;
        b=oT+BJZcCAMdanSeZN7e6/9PJnH7ja0E40LBSM4yunmVhfuWXlplsxmoE4uowmnLQc0
         iXtBZAiWuUXrUwMvNMegG6fapnICrS6uWY6sdp2u62QV/pBYcjzRpm1CeFHedGDB/MUx
         XDhBfBltvBfdreDl/BFpYtfDzYvylOMZjo0t9zc47CfBUmhuu5gSk6ISd8TjcjOpWqrz
         Y7a632fcNzzUi6gEJ2YZb8XHRKd5M33ma5C1XPsyUy89jq7U7up0gpgw/p92P0e8O7tW
         aRzDpQJrFSeXBqtdCdH/Bw70iECBkZbPJ4LWy/45aRTc5oS6PbNCePv0ZnxIsz8VgRuP
         lvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719093741; x=1719698541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aS9IkNI8BPD97NPqexkA01Wai+VXQfm008vsea+QEiM=;
        b=o6gMmZjV9mQQFTS7nyspzbWWznwUYEHWhPKEsV4689Kl7in7HAF4DM2MzIDp44DbFA
         XAHFQt0U3AY2AY/8gSVFCl4vfBE0cUqMlLeW7QlPD4ulFpU0c3QnSSO7WU6uGnnzlmiC
         9lZ7kdLccfdxeqhRVHjZbsSBUMINYvNKTb7Xq6PJz5kARfJNHEGeDNMJyw/2DpxFCPPD
         Em7hNOyKx2pXXTMqdQBKPkXQceSeD8/CUERQEGk9MRx0wpu9yzT5UtWG61XnZqpkYTpj
         MZlB21u8u7OYvXVQZnmnGc+QuO9uoY97fIQE6Ot/guJ8vu0rWDnsEEJWmCbXpyhL4NFF
         utzw==
X-Gm-Message-State: AOJu0Yx7dtluZ4wRrgvILZifFSB+mPpVxEMmroPEvk6POH/26XwU6WWP
	fhqpNBMS/WvGd//eWPdJfgqu42yt56t4lWXdW0wnw9EAzAK5+7daWG2XoeDBPKU=
X-Google-Smtp-Source: AGHT+IEgfa1HpfF6m2kYDL3wfOTgjMi1VWbHIPyepjtmTFGUtY5sTBUYisTDFiXR/n1/RVmxPJcq8g==
X-Received: by 2002:a2e:9248:0:b0:2e9:8a0a:ea05 with SMTP id 38308e7fff4ca-2ec5931d897mr9308541fa.17.1719093740948;
        Sat, 22 Jun 2024 15:02:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 15:02:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:16 +0300
Subject: [PATCH v3 03/13] drm/msm/hdmi: simplify extp clock handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-3-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5904;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3rPmiZo3dcY44pgbm6icOd9qL2vNRkCwi4ZPCN7/Yyk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0no/LAan1a1QvgJDC7bcBfgtLxqcmIMp+8Pe
 iCgwyrGmByJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6AAKCRCLPIo+Aiko
 1du6B/9EZ/1JQFKgm9Y9w+gfmWdqjmz8mYUHOyo+0d7K9nDP5LY1VcUzt0PI3/2C+Wl3NJZHIZX
 U/Ou12SLin4kOxWVfkg2BuRe6fDSzMEdgavWatSmc37i1cicBevsV16NGjGZ3cRMBcIrhUlwivw
 DFYtS+l5EUcuJqC+iHsBuRbO4ikze0IWThDNNwIBX/XF5mE6d/fQ3ANnU1/z9aG8McRyaqxEqah
 r+36csPA5dlf11Yf3pdV3cy06XYyTmdRaGbzsVU4gkbub9fNiqj9i/Ks4ELy0obKhjFACzHhclp
 r5Nw1P7XVOK7dEX6P33QPJhrHi1TCpP9nfDoe1QZ39LiiEU7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

With the extp being the only "power" clock left, remove the surrounding
loops and handle the extp clock directly.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 24 ++++--------------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  6 +-----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 +++++++++++++--------------------
 3 files changed, 18 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 818c66efdfed..3a65d82cedc7 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -234,13 +234,11 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp"};
 static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
@@ -460,24 +458,10 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 		hdmi->hpd_clks[i] = clk;
 	}
 
-	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
-				      config->pwr_clk_cnt,
-				      sizeof(hdmi->pwr_clks[0]),
-				      GFP_KERNEL);
-	if (!hdmi->pwr_clks)
-		return -ENOMEM;
-
-	for (i = 0; i < config->pwr_clk_cnt; i++) {
-		struct clk *clk;
-
-		clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
-		if (IS_ERR(clk))
-			return dev_err_probe(dev, PTR_ERR(clk),
-					     "failed to get pwr clk: %s\n",
-					     config->pwr_clk_names[i]);
-
-		hdmi->pwr_clks[i] = clk;
-	}
+	hdmi->extp_clk = devm_clk_get_optional(&pdev->dev, "extp");
+	if (IS_ERR(hdmi->extp_clk))
+		return dev_err_probe(dev, PTR_ERR(hdmi->extp_clk),
+				     "failed to get extp clock\n");
 
 	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
 	/* This will catch e.g. -EPROBE_DEFER */
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index b7fc1c5f1d1e..1f8c5045a78c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -51,7 +51,7 @@ struct hdmi {
 	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
 	struct clk **hpd_clks;
-	struct clk **pwr_clks;
+	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
 
@@ -96,10 +96,6 @@ struct hdmi_platform_config {
 	const char **hpd_clk_names;
 	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
-
-	/* clks that need to be on for screen pwr (ie pixel clk): */
-	const char **pwr_clk_names;
-	int pwr_clk_cnt;
 };
 
 struct hdmi_bridge {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 438416eaf390..f1790dedf451 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -19,7 +19,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
-	int i, ret;
+	int ret;
 
 	pm_runtime_get_sync(&hdmi->pdev->dev);
 
@@ -27,21 +27,15 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	if (ret)
 		DRM_DEV_ERROR(dev->dev, "failed to enable pwr regulator: %d\n", ret);
 
-	if (config->pwr_clk_cnt > 0) {
+	if (hdmi->extp_clk) {
 		DBG("pixclock: %lu", hdmi->pixclock);
-		ret = clk_set_rate(hdmi->pwr_clks[0], hdmi->pixclock);
-		if (ret) {
-			DRM_DEV_ERROR(dev->dev, "failed to set pixel clk: %s (%d)\n",
-					config->pwr_clk_names[0], ret);
-		}
-	}
+		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
+		if (ret)
+			DRM_DEV_ERROR(dev->dev, "failed to set extp clk rate: %d\n", ret);
 
-	for (i = 0; i < config->pwr_clk_cnt; i++) {
-		ret = clk_prepare_enable(hdmi->pwr_clks[i]);
-		if (ret) {
-			DRM_DEV_ERROR(dev->dev, "failed to enable pwr clk: %s (%d)\n",
-					config->pwr_clk_names[i], ret);
-		}
+		ret = clk_prepare_enable(hdmi->extp_clk);
+		if (ret)
+			DRM_DEV_ERROR(dev->dev, "failed to enable extp clk: %d\n", ret);
 	}
 }
 
@@ -51,15 +45,15 @@ static void power_off(struct drm_bridge *bridge)
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
-	int i, ret;
+	int ret;
 
 	/* TODO do we need to wait for final vblank somewhere before
 	 * cutting the clocks?
 	 */
 	mdelay(16 + 4);
 
-	for (i = 0; i < config->pwr_clk_cnt; i++)
-		clk_disable_unprepare(hdmi->pwr_clks[i]);
+	if (hdmi->extp_clk)
+		clk_disable_unprepare(hdmi->extp_clk);
 
 	ret = regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
@@ -441,7 +435,6 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
 	struct msm_drm_private *priv = bridge->dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	long actual, requested;
@@ -455,8 +448,8 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 	if (kms->funcs->round_pixclk)
 		actual = kms->funcs->round_pixclk(kms,
 			requested, hdmi_bridge->hdmi->encoder);
-	else if (config->pwr_clk_cnt > 0)
-		actual = clk_round_rate(hdmi->pwr_clks[0], requested);
+	else if (hdmi->extp_clk)
+		actual = clk_round_rate(hdmi->extp_clk, requested);
 	else
 		actual = requested;
 

-- 
2.39.2


