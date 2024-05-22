Return-Path: <linux-arm-msm+bounces-20196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B998CBFA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 12:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F5621F23768
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 10:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7023682D90;
	Wed, 22 May 2024 10:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xf0382W7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8925482869
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375066; cv=none; b=Rtroy89vdRwMlnCV5dnIDE/RoerHJDymLscvrB24wLZ+kke3WvZ93ATypXdUQkeMzPjMht7g4VlPE0/3FkbDw49MeDF4P2hXDvBV4jpAdYw9qk3Yhgp3GfHEE7vClZ7I0ljHiaj+4zxYy0Si9JkyhP9Lr3a6IKJSqICXeTvMWt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375066; c=relaxed/simple;
	bh=qWoWxaBIT57QfQL/H3b3qamuy/KWc1sBIdaw/+EtJuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JILUY62YXrXWlxpNYWaD3hOl2tQWx3Togo7R3U40MtZWyE7J7/hF4Y9+MqnwAq9ULKyYkX5StmyXRNLIuaHAwOM637ngRqF+BXo5UPtvhCVVyk1ZW47iZsl3P2sT6p471YQnbV1/JcaJg/dhrO3B8YyLL7UOm8gwAdsdlwXkgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xf0382W7; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5238b5c080cso7888137e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716375063; x=1716979863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Thx5VEVIdtS5W6YUF2PWAi/DMOAy+79Zm1AEBWpV7cY=;
        b=Xf0382W7oHg4HtgzOES28PyexMoQR9x8xQEUhn+BVHJQDskGPdKCqsfD1G+ynr/zwK
         u0So3Y8o5qLR/t95IBbgmPjCLMEcJp6qS58r0LlyPLZ6wA3cQWQMNiwwQuPXM37uZMFY
         6x74oAsh+Vq8d8LoKeHn5aRRGHcaTCKYsggORLlIgI8toBrZSUeM3zCaJ3k3uLoH+9tl
         YB7djfDmk6yAvzHdgYyId/9mwKdv7IK7Me6++Z95CvjgW3b57U9kUmQNyEZWXOhnjMkP
         QKWMw67DZenb6gjVgvwxHi5XK6U/t8I5OfMVS1VtgE2v0/PfpMOqjYxqWrJvccUUrwcx
         sxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716375063; x=1716979863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Thx5VEVIdtS5W6YUF2PWAi/DMOAy+79Zm1AEBWpV7cY=;
        b=kOnLjp1vhqNtAekUzKJXA0NZHBUuH5H1+gC0qAZst01klJguOY6Tx0Pt60AJ7Yz/qx
         BukirRLYH1lqzjXj2sprw3/ydnCnpa0mmBTfFpP1LwIu+Y2fyoM6lEMXFIbQf+9Od4pv
         RZIYAdcmG9VcodFYZaxF9X/9EkkGncixmRC1IBJ7yAvMqKBJvHkePVg3n90gwm+M1JPu
         ONk2Wv4/1ar2juMPycJ489+H17sORDmDQca3r4mLdwvgb7Om8K+g3LsCyqqXM3hXGyiN
         hFSpFtDLNiaMTWUAZtugZBrLgM9X10oPhNh+kFdQGidcQWyjxO41koR2PDYfvE/+AkiV
         q8Ng==
X-Gm-Message-State: AOJu0YzAFmCEvumb/bdc5Pg7JXJFiNlxS5Gb0iZjfQZR+0+lKMOjk0t7
	JzalYnVG7R2YhcWHb7n2uwHcBfQ17BM+QNe/3Mo3NMsZVPM3AzaFLLEwUY9EDp0=
X-Google-Smtp-Source: AGHT+IFN/5I+WfK1fn5/Y5SqzUG4dzDQSqWg9365wTwasAYWN8c53SqYLJBZM4tHc7Y7GU7QdS8teQ==
X-Received: by 2002:a05:6512:3607:b0:523:48f2:e3fd with SMTP id 2adb3069b0e04-526bdc53aa0mr840925e87.16.1716375062796;
        Wed, 22 May 2024 03:51:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 03:51:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:58 +0300
Subject: [PATCH v2 06/14] drm/msm/hdmi: switch to clk_bulk API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-6-c30bdb7c5c7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4258;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qWoWxaBIT57QfQL/H3b3qamuy/KWc1sBIdaw/+EtJuE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4QhcbTNU1xZ4zo5pb7Is97xUeXSclmnMHPO
 dnPqXumZJeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3OEAAKCRCLPIo+Aiko
 1QLEB/4gFS6pepNvbhCKqUq2k20uwDwdS+34Dhukn30EerccF8nXVS1JtS5x0be0enjckgxW4H5
 gZi+UPdUoUsRQlDev5eALmLY3uubG6EJoWGHbV6MwyiLk3YuFSrbi0bmJe8EID0OkJ2qRKqDNAH
 ASO2yJquay9eV8KQPaqYUESX66/2JVxFShOuBjNWPmUgyE4ve8eUkYGLY1/CybiIly4pP71Z7JZ
 3PC92joqtA8NlIZucUqNWgdn1jUSGvRaUWkQ9mwVE657TFH2i9cMJ5P1rTWJMcYK9pIyIyYUAio
 c2aB8t9VYo/RHkhfXOpAZGS286LncX3QMmj+KpV1K2gtELpH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The last platform using legacy clock names for HDMI block (APQ8064)
switched to new clock names in 5.16. It's time to stop caring about old
DT, drop hand-coded helpers and switch to clk_bulk_* API.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 15 +++++---------
 drivers/gpu/drm/msm/hdmi/hdmi.h     |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 39 +++++++++++++------------------------
 3 files changed, 19 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index c14e009f38b1..7ec4ca3b7597 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -469,17 +469,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (!hdmi->hpd_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++) {
-		struct clk *clk;
+	for (i = 0; i < config->hpd_clk_cnt; i++)
+		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
 
-		clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
-		if (IS_ERR(clk))
-			return dev_err_probe(dev, PTR_ERR(clk),
-					     "failed to get hpd clk: %s\n",
-					     config->hpd_clk_names[i]);
-
-		hdmi->hpd_clks[i] = clk;
-	}
+	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		return ret;
 
 	hdmi->extp_clk = devm_clk_get_optional(&pdev->dev, "extp");
 	if (IS_ERR(hdmi->extp_clk))
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index c0d60ed23b75..eeba85ffef09 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -50,7 +50,7 @@ struct hdmi {
 
 	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
-	struct clk **hpd_clks;
+	struct clk_bulk_data *hpd_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 7ae69b14e953..36266aa626dc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -60,27 +60,6 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 	}
 }
 
-static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
-{
-	const struct hdmi_platform_config *config = hdmi->config;
-	struct device *dev = &hdmi->pdev->dev;
-	int i, ret;
-
-	if (enable) {
-		for (i = 0; i < config->hpd_clk_cnt; i++) {
-			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
-			if (ret) {
-				DRM_DEV_ERROR(dev,
-					"failed to enable hpd clk: %s (%d)\n",
-					config->hpd_clk_names[i], ret);
-			}
-		}
-	} else {
-		for (i = config->hpd_clk_cnt - 1; i >= 0; i--)
-			clk_disable_unprepare(hdmi->hpd_clks[i]);
-	}
-}
-
 int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
@@ -107,7 +86,9 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
 	pm_runtime_get_sync(dev);
-	enable_hpd_clocks(hdmi, true);
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto fail;
 
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
@@ -149,7 +130,7 @@ void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 
 	msm_hdmi_set_mode(hdmi, false);
 
-	enable_hpd_clocks(hdmi, false);
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
 	pm_runtime_put(dev);
 
 	ret = pinctrl_pm_select_sleep_state(dev);
@@ -193,14 +174,20 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 
 static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 {
-	uint32_t hpd_int_status;
+	const struct hdmi_platform_config *config = hdmi->config;
+	uint32_t hpd_int_status = 0;
+	int ret;
 
 	pm_runtime_get_sync(&hdmi->pdev->dev);
-	enable_hpd_clocks(hdmi, true);
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto out;
 
 	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
 
-	enable_hpd_clocks(hdmi, false);
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+
+out:
 	pm_runtime_put(&hdmi->pdev->dev);
 
 	return (hpd_int_status & HDMI_HPD_INT_STATUS_CABLE_DETECTED) ?

-- 
2.39.2


