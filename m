Return-Path: <linux-arm-msm+bounces-20204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D818CBFB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 12:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3A001C211F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 10:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665E681AA2;
	Wed, 22 May 2024 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OOVqqLvT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57B84D0E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375072; cv=none; b=kl9TEhqIQx+8/za4eSX3aiezBM7lulWJVKl0dFgNvqPKAm1R8zfybZPonqTY+A4vg1W4lF6ZiBU0kBmMsbG/096Bjn6XpcriSa2leUY2baSrZLob0V5Szh14Y7AsalM7M7yu5fy2ssRyFxYCI2DYm92sMm/rVVyW0dWVMu8WByM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375072; c=relaxed/simple;
	bh=+CX0caTW/kgZp6WyPrwa6tsFcNkT9AW5y90XnvQROQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8HOLQy2Gy+sBinwfVdr+6SJKRkwJvtNTt7NcQ5F6CsIFPxi3uhnh9jSgLpWEi30k+sixmKaUKPa2xAwFvpH/PCymVlLR95g5Q1oR5Z8w+qhoWn+0yZRhuwgadT7q/Nnc06RhDfAnt0keeKqoDhtrmlI9ROGLpkiC705XEgksH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OOVqqLvT; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f99f9e0faso7580332e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 03:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716375067; x=1716979867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqy3Nq/FVqz5cSsGbuupU45qtEw4OAV0P+mpABZ0QzY=;
        b=OOVqqLvTa93aT44KMlo/MprjDF2jjcXQMLMukXqW/BdzkMXGBB8iYkJg3Xh5L+ZTWW
         2UNt9gsHCOrYRqsz/XTsjRLhHFcEZKylB1IfMahjKV5Ge/q4W0RFh+CL+b+ydcQFyVrD
         jcmjFXN+yyQ4S0psjqVgyLCcO1RiLhnUJ6qUNRePJcgRnuEavjJG0BLi+bwbly6DXOzl
         qp74+ZZJhmQR0YOCCwjNUnlYGqnHm9MbG7HpT77xdU/b0UJaul1MAmz8KdHFPkfQo3lU
         +YvimlBPbniU5/dwgN4x5S2epwDj0lKTHUKaG8o+HLQo6x0G/K5H2sFwXA5JMoDPMlnm
         MQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716375067; x=1716979867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqy3Nq/FVqz5cSsGbuupU45qtEw4OAV0P+mpABZ0QzY=;
        b=sXzUeRipDIx+bviRsNppQbkriuRNxcTk5xiGAzw9BlJ+V+9ePzI/Z82atIwGUHU+Wn
         Ed8lrZ2B14n1aq6rmCNCpuJWOFZaRMozxaOyYBNHpiGaCBwUFO/u15srdbVKefKZxXrq
         lELhRKOrot0RIkrLARHukKOP7jL5VrVfcuHO8j1gMuJxnXPcjaZ9xCXIaO8X0jqFH40O
         oin5E8kRj2YRCA8bN4LYsUP9mPOjLe6uQLxdK/XmT/oxZ8fJSAe56xhi81InPqe/CwW9
         CIxhxgKYzn8cD+Q3nz6NmGiY4BAngXSX7g6/SLWmJDBKThJ0LYhCAVSvu/k9U5dqTtg1
         9bWw==
X-Gm-Message-State: AOJu0YwPqVVJtb4Oieim3XaAe6TvX1gqdDQyQP9dISTa2iF8rzCQmHNn
	qZXhFNlZ3FaxeAWY3M6Aa7cK4yJKZapswZ6TNSgJJl4Wk0wFO+qznIqCrFOSboI=
X-Google-Smtp-Source: AGHT+IHgBR6IZsd/oD+qVsjGs90/sjJcSsviftKInsNc+Zspk9Ki5Svqna+XEj1d07VSv/zTMZKS2Q==
X-Received: by 2002:ac2:4650:0:b0:523:b261:3dde with SMTP id 2adb3069b0e04-526be210a62mr1072706e87.41.1716375067512;
        Wed, 22 May 2024 03:51:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 03:51:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:51:04 +0300
Subject: [PATCH v2 12/14] drm/msm/hdmi: drop hpd-gpios support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-12-c30bdb7c5c7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4311;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+CX0caTW/kgZp6WyPrwa6tsFcNkT9AW5y90XnvQROQ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4RBfN8d+WWDxu9Xpu1mwywXrVcB/Zvb1Dt5
 CqWSyTK8umJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3OEQAKCRCLPIo+Aiko
 1df0B/0RzAIL6g568vkZbZkPLb9FipJP10RMJLky2EpTE5cL+q8WdmEQ1VJnepz2WWxQS+gG6vS
 a2SxV9T7v0unXemRNdHQD5m7kvc9HZu6Y0w16kaRF0rn6i/qWCCy2YSF61jn/nbbiWhxUfYUI5x
 6TT0PPjqJZSz+i6eOAkd8hZmb4a4Xu+bbvma7uCiEhQ9ti6xkqx8PqauXeen77BusXSY3K09cph
 t/QhkXG1CE0lK43fpgBd0QQzaqxsvw3ys5SDImQSzwAeAuooAo74CMS4Qadtoc2i1SinufzahFy
 BwfKekG9BMpvo3c1PLRp0GZFg//2osKqBG6HkAa18M9NQVCs
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Supporting simultaneous check of native HPD and the external GPIO proved
to be less stable than just native HPD. Drop the hpd-gpios support,
leaving just the native HPD support. In case the native HPD doesn't work
the user is urged to switch to specifying the HPD property to the
hdmi-connector device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 14 +++-------
 drivers/gpu/drm/msm/hdmi/hdmi.h     |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 53 +++----------------------------------
 3 files changed, 7 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index e160a23e962e..a9437054c015 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -468,17 +468,9 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(hdmi->extp_clk),
 				     "failed to get extp clock\n");
 
-	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
-	/* This will catch e.g. -EPROBE_DEFER */
-	if (IS_ERR(hdmi->hpd_gpiod))
-		return dev_err_probe(dev, PTR_ERR(hdmi->hpd_gpiod),
-				     "failed to get hpd gpio\n");
-
-	if (!hdmi->hpd_gpiod)
-		DBG("failed to get HPD gpio");
-
-	if (hdmi->hpd_gpiod)
-		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
+	if (of_find_property(dev->of_node, "hpd-gpios", NULL) ||
+	    of_find_property(dev->of_node, "hpd-gpio", NULL))
+		dev_warn(dev, "hpd-gpios is not supported anymore, please migrate to the hdmi-connector\n");
 
 	ret = msm_hdmi_get_phy(hdmi);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 2a98efa8b6bd..268ff8604423 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -52,8 +52,6 @@ struct hdmi {
 	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
-	struct gpio_desc *hpd_gpiod;
-
 	struct hdmi_phy *phy;
 	struct device *phy_dev;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 32e447267e3b..d3353c6148ed 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -69,9 +69,6 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	int ret;
 	unsigned long flags;
 
-	if (hdmi->hpd_gpiod)
-		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
-
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
@@ -144,8 +141,11 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 	}
 }
 
-static enum drm_connector_status detect_reg(struct hdmi *hdmi)
+enum drm_connector_status msm_hdmi_bridge_detect(
+		struct drm_bridge *bridge)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	uint32_t hpd_int_status = 0;
 	int ret;
 
@@ -161,48 +161,3 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	return (hpd_int_status & HDMI_HPD_INT_STATUS_CABLE_DETECTED) ?
 			connector_status_connected : connector_status_disconnected;
 }
-
-#define HPD_GPIO_INDEX	2
-static enum drm_connector_status detect_gpio(struct hdmi *hdmi)
-{
-	return gpiod_get_value(hdmi->hpd_gpiod) ?
-			connector_status_connected :
-			connector_status_disconnected;
-}
-
-enum drm_connector_status msm_hdmi_bridge_detect(
-		struct drm_bridge *bridge)
-{
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	enum drm_connector_status stat_gpio, stat_reg;
-	int retry = 20;
-
-	/*
-	 * some platforms may not have hpd gpio. Rely only on the status
-	 * provided by REG_HDMI_HPD_INT_STATUS in this case.
-	 */
-	if (!hdmi->hpd_gpiod)
-		return detect_reg(hdmi);
-
-	do {
-		stat_gpio = detect_gpio(hdmi);
-		stat_reg  = detect_reg(hdmi);
-
-		if (stat_gpio == stat_reg)
-			break;
-
-		mdelay(10);
-	} while (--retry);
-
-	/* the status we get from reading gpio seems to be more reliable,
-	 * so trust that one the most if we didn't manage to get hdmi and
-	 * gpio status to agree:
-	 */
-	if (stat_gpio != stat_reg) {
-		DBG("HDMI_HPD_INT_STATUS tells us: %d", stat_reg);
-		DBG("hpd gpio tells us: %d", stat_gpio);
-	}
-
-	return stat_gpio;
-}

-- 
2.39.2


