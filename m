Return-Path: <linux-arm-msm+bounces-20201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0371D8CBFAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 12:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 861551F21B59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 10:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5CD84DE6;
	Wed, 22 May 2024 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dWIKMkfa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EC483CCF
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375069; cv=none; b=ofBInH3D2Hx9syJSRlWjyP95A16+K8mmwn0fKNhbOiBDsBG4Hv5qC9fx4T3VBgIUnT0aJjZbfN3YEDDwG/v64AiQv8y9NsqNknq9u8qssbaLi7BuyJZy0ULf+CgqzwrQ6M3MFSYWyGfDRViXradTksqjNGrNyFpOOKXJSfTNGRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375069; c=relaxed/simple;
	bh=u0XwnOVdGXgfRiv18KJvoggCPFhhyJzYE8jnecSwHG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CFMCBax2M+CZ/uaKdJR2pbwf3IMdiND3fNz2JYKADPCyvWqLizMLM7sim7dZEP4dd7cnBD84cQ9ta4uO2KcOifrQka9QWFoI0E/QGyYkRPIetwSmL2HZNkawoDpqjgGuqd+v6m95SwXDqmWHa1ftGlVxh+WT1ALm11ZqaeBgNZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dWIKMkfa; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5210684cee6so6655880e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716375066; x=1716979866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKuE+Md2+CJZ4ooxLw6IM33pLF9pqRQyKVYsC0dlBR4=;
        b=dWIKMkfaUiEnGyu9KdA4yFKn5VvhwX/0Kw9lZEsTc5P1fBZ5ktVWL2yafpvHWejDJW
         CkrhMyW/3Q0MTGBjYEJCPgsKaa/IeSIW1y2YHy6FI0f7/JGj/5nytvR5DEu6da6am5g2
         ALIL17DKbzIXOhULR7FrkUgHS8Dpdc9f5jnsoJ6Wm/5uU8nkUkWsd4JkZcmJ9Idikfr3
         5ZOg8VcyZtwmcdejH84V0eqOveF6IjNE6J6t+vy8qV0dDRpi+PZCnrA5hpzMJEME0SAc
         kJA6v/lDl9UWVZgYykpBS7HeBmkZeYJD0tViU++VsjeGxFP6rio1T5kEw+0cOEj8nRlK
         cSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716375066; x=1716979866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKuE+Md2+CJZ4ooxLw6IM33pLF9pqRQyKVYsC0dlBR4=;
        b=SkPjVr/QO+kcLzFBKODAF44qciIeGxK4GSEZXMU1NYReFpj2pGa3AHaNQrC6U0d3Ky
         enMnOLLYjXz3bfHYlvGIMfNWMZG0DXp6SFhfJD5S6Qlyr/Z8axkiGgMr7mPplSRbFI6J
         4neIU/Q8oTAKodCqopjbdKCtvon6o24LWTuZPB2geCjGWQn7rh2H2ChmKeTH7jbisXcy
         Eo8n3KtHBWrm4CKTp2wQ5B/cZ+r77g+7LJS4asroiAzSd+Q8IKW5qa/qH2hywgRQmV47
         v67zCZf1EUpep1zG8k9fOq4sXQT7rdUQMOmMmfr2ORgFI7fnEFn0TcNSpsO+k045jQOG
         6vuA==
X-Gm-Message-State: AOJu0YyxvUO1Uqx1m6swkF/VN8hoMI2lAmR+oGHlQViaroE00UmLBj8/
	2XUTyNviOAq5iwX42PlIvC6sisMqinhu5OEQ6PgmJ3vUyFgiBlYHECINozavWOw=
X-Google-Smtp-Source: AGHT+IHJeHTfHyWHVmMD+/FJkx5/LYCOdgdKbvGKBtmAdB4VaETozRkOXBbdUDLL9rrVCMVWowSddA==
X-Received: by 2002:ac2:58cc:0:b0:51e:150e:2c45 with SMTP id 2adb3069b0e04-526c0d496c5mr830356e87.63.1716375066002;
        Wed, 22 May 2024 03:51:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 03:51:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:51:02 +0300
Subject: [PATCH v2 10/14] drm/msm/hdmi: rename hpd_clks to pwr_clks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-10-c30bdb7c5c7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3783;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u0XwnOVdGXgfRiv18KJvoggCPFhhyJzYE8jnecSwHG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4QVCgxWG7MQkwYIO2fZmquhIl4W6mSsgcqw
 QAYfxikpzaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3OEAAKCRCLPIo+Aiko
 1UkvB/0QXhbzvu2Qi7WDnyqqjv7fCAiOPkjQFZ982cDkBIbjU3x1gUpa/ChxkJ+kgfp8UguLOKW
 Urr3FuY5QKNOH7upYyMF7MilONK8M6VzNEuIRhiO3Oe6k6zpxZQmoKbb9pizEqB1Sv4MGnhh7gC
 bnW59QObIlD2aXrOnMfsdCQHXsK/T1GB82W9UyUek7nwaEGFCrUIsOzgEaU/gTCpj0XoejKsgqj
 AsCm3jQdJmcyyaU4gfXFBVE0PMZ0PsCuidADxkTPfL7gtgWMeZJHsfphPLh1BbWu6/QTHLR9tS2
 03S0gc01vvsSCpUzwYIYtSlMeoOHmuJwmcTD5PLi71Exy7TZ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As these clocks are now used in the runtime PM callbacks, they have no
connection to 'HPD'. Rename corresponding fields to follow clocks
purpose, to power up the HDMI controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 26 +++++++++++++-------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  6 +++---
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index cc671baad87b..c39a1f3a7505 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -228,19 +228,19 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
 static const char *pwr_reg_names_8960[] = {"core-vdda"};
-static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
+static const char *pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(hpd_clk, 8960),
+		HDMI_CFG(pwr_clk, 8960),
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static const char *pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
+		HDMI_CFG(pwr_clk, 8x74),
 };
 
 /*
@@ -449,17 +449,17 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get pwr regulators\n");
 
-	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
-				      config->hpd_clk_cnt,
-				      sizeof(hdmi->hpd_clks[0]),
+	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
+				      config->pwr_clk_cnt,
+				      sizeof(hdmi->pwr_clks[0]),
 				      GFP_KERNEL);
-	if (!hdmi->hpd_clks)
+	if (!hdmi->pwr_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++)
-		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
+	for (i = 0; i < config->pwr_clk_cnt; i++)
+		hdmi->pwr_clks[i].id = config->pwr_clk_names[i];
 
-	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = devm_clk_bulk_get(&pdev->dev, config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		return ret;
 
@@ -517,7 +517,7 @@ static int msm_hdmi_runtime_suspend(struct device *dev)
 	struct hdmi *hdmi = dev_get_drvdata(dev);
 	const struct hdmi_platform_config *config = hdmi->config;
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+	clk_bulk_disable_unprepare(config->pwr_clk_cnt, hdmi->pwr_clks);
 
 	pinctrl_pm_select_sleep_state(dev);
 
@@ -540,7 +540,7 @@ static int msm_hdmi_runtime_resume(struct device *dev)
 	if (ret)
 		goto fail;
 
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = clk_bulk_prepare_enable(config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index ee5463eb41b6..1e346e697f8e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -49,7 +49,7 @@ struct hdmi {
 	phys_addr_t mmio_phy_addr;
 
 	struct regulator_bulk_data *pwr_regs;
-	struct clk_bulk_data *hpd_clks;
+	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
@@ -90,8 +90,8 @@ struct hdmi_platform_config {
 	int pwr_reg_cnt;
 
 	/* clks that need to be on for hpd: */
-	const char **hpd_clk_names;
-	int hpd_clk_cnt;
+	const char **pwr_clk_names;
+	int pwr_clk_cnt;
 };
 
 struct hdmi_bridge {

-- 
2.39.2


