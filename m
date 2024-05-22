Return-Path: <linux-arm-msm+bounces-20193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BDF8CBF8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 12:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A46C1F237AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 10:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E680682877;
	Wed, 22 May 2024 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FzTmBHlb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6203823AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375064; cv=none; b=nfCDjTBkBAfDxxcYEigxH0SUOUICLb7Mot/4HjNFnom3N8cTmjpMiFwL7kkO2NET7cAgqsTf9l1+PJzii14jYU/xWBilXTiw49HDcA/OcJfN1fX2KsjW1RoDig4m2aUiOMK4ECAwVDHYA2rNdNk+V+O5VPBQoq4AUvV++S+w04E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375064; c=relaxed/simple;
	bh=OqWVWP2+AiuB0eZmmX6BVNibFfmd2vfn14lHJu5N/wM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EZP4EzvDEnC/wSbKPXcbY97e8plGIszNmZwBEfwwWTERvZk+yzuBQrBg4sB5+UG2AK1HkYo89C4WrF0HlYZPlEM1nL1PLuLf43UTWvISZka5KoDRtT7jVxSNyr9A77Xm71MRkVL5AD58iY+kchmv7t38V9m+0drqsVTKYZ03cPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FzTmBHlb; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51f1e8eaee5so594819e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 03:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716375060; x=1716979860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4mDJNdY3BQpBxyPjIYj4R7zW531FPYbhtqPnKZkd9k=;
        b=FzTmBHlbI7SCG6DBYSgSZOeSU5MydeR8v8gXwlNBPhwp3ejtxVDYaLjBLgKBoIj34Z
         ADL8DcMc96KeRG5W8kEnV2pnShpNr0IPRUtcb5fvWozTwZEyENqpwiPijqTsf8M6ucIb
         zrblhDwyybFd6jtG2bVzC2TYuHGAjjmBwWwQc5ET5mc48TrjeXClDDdQGCqIQTe6l59r
         hohVDd6Pyb+6d1ujUKdXzKlrLZGuR8O03TFxssm8FjIlB9XKG4z4u7YNsfdtb0gxzQgq
         MHbSK15SWyLrGSlFb95sSM0XPCPZfQPm8uG4pEsIPk/M5eZrh8l8DFmRDtZciKzvE8m1
         3Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716375060; x=1716979860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4mDJNdY3BQpBxyPjIYj4R7zW531FPYbhtqPnKZkd9k=;
        b=KeK7qVTiiJbL+nL0wGgYF7qbUwaNYqvTxwMtudtgp5dQWrgwmg/e322FKRDUheRQm+
         CQnwqqYrj/mdxDRy1hlS/UlQL3EwgF5XniFBVUh+urw9W6nM/XkLdrZZ2i6udo/zyr/z
         rz0xsX6fm5isrqeAi9fkfJkWUYKXfRX7xI0mQftrkN8pPd3zrJU5MyRK1MXev4Kkg7LS
         Km8KaG6EOtZ5yS2fxsn1OZqtB3sN+rYJSRHnZa8g2Wirr7eXNnVzBwXZScee3Anpall9
         IaRa5btH3zIJfnlYWmhj1JIBCEwmtiU6kh4nzMIx8amZ0ZAG7a3+D3i0gRBN3Epa0Z3K
         f9aQ==
X-Gm-Message-State: AOJu0YzJ+xJPreeEt9kK909R0iK/XNBETVXhhvddeNLc9NLo2gyNz4Qs
	vgh0h8hqwL/0GNR7o4jEz3kuldNKm2/DjiI8SnzOfacm1O3FaBVrve7IY3eVMCo=
X-Google-Smtp-Source: AGHT+IEYXIMyl3eSxKpjBCG9L21f/R2Dl2+wh1OnVS2XyqdyNDi1cNFgpQEiZv9NXyXWYkFmbpjYuw==
X-Received: by 2002:ac2:46ef:0:b0:51c:b0c9:ea54 with SMTP id 2adb3069b0e04-5269b8a9c36mr552508e87.16.1716375059959;
        Wed, 22 May 2024 03:50:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 03:50:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:54 +0300
Subject: [PATCH v2 02/14] drm/msm/hdmi: simplify extp clock handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-2-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5848;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OqWVWP2+AiuB0eZmmX6BVNibFfmd2vfn14lHJu5N/wM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4PbIhSU16AXMkzZZcytwIW6PZ12zsiXOYod
 IBQ5PyaSMeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1V5oB/4mjXL6dJ/5q/obF0HXfl/AQP265nycil27dxSNjaftozZH2WVndqjQxfgl0S3O+7/ZsZU
 dUZAtqu3NwlHnTM7EnM7Rf83GjyVCwnO7hfPmNpvrAO564o7qkvDYb7MDyf1Q3hx3fIxvIdLG1D
 JLr0ZZtuxuKmeu42xCpfS7rTYlkNuONeVlxv26khJL9CzDdf3mcr8a5lMGOrcobOrh69+fhzQD1
 bWR/pzkkecsKvpDADa5Bz7rsfXaG+6RrahLWIA8DdOrV9spB5gdkj0SRJuJggDRbfdnRMqDhLw1
 +O2y7rVVBQzartquDNj5r4b5x47nugrv7XF8NBMjjXKRhn43
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

With the extp being the only "power" clock left, remove the surrounding
loops and handle the extp clock directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 24 ++++--------------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  6 +-----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 +++++++++++++--------------------
 3 files changed, 18 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 108c86925780..681265e29aa0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -235,13 +235,11 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
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
@@ -485,24 +483,10 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
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
index 4586baf36415..abdbe4779cf9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -51,7 +51,7 @@ struct hdmi {
 	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
 	struct clk **hpd_clks;
-	struct clk **pwr_clks;
+	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
 
@@ -98,10 +98,6 @@ struct hdmi_platform_config {
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
index 4a5b5112227f..9eb4d06bdc0e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -17,7 +17,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
-	int i, ret;
+	int ret;
 
 	pm_runtime_get_sync(&hdmi->pdev->dev);
 
@@ -25,21 +25,15 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
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
 
@@ -49,15 +43,15 @@ static void power_off(struct drm_bridge *bridge)
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
@@ -271,7 +265,6 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
 	struct msm_drm_private *priv = bridge->dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	long actual, requested;
@@ -285,8 +278,8 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
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


