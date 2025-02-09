Return-Path: <linux-arm-msm+bounces-47282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67350A2DB14
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 06:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8DCB188678C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 05:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63031714C6;
	Sun,  9 Feb 2025 05:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q7xvaELA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB25E16D9AF
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 05:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077628; cv=none; b=U4dKT7RG0XPwCnIzSquy5Qs2UrFoQsZISxSaQZdrhVwoD9STIkMCP8ua+1eW78HgGBDVoMMQUgZlhDHwopg1DFY9o6k4U4ocPbW0c4bu89dmvJghjuQDrJg0YQlkCIqwY+V/ZauorJ5FfvR8Iv57SKSk++SdDVqW0F6eB7yyoYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077628; c=relaxed/simple;
	bh=8ggrOHMoONGuV72hshgJDWyRmMWrabWT+tktxkICLQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8E4Q6QOAb/6wxHPikZ/iMzitiHhEKRTOn/rjKGXKbr6Iih0ZxOMjm1KBUP/Cjs9suvJPmOg4Fpfpca9T8BCJG1h2UkHWaMATUJt5siGoFh5joznEQElLX8FtXRTDhVAi0h1NdZqwpN5Me3jtVOC0Qvoq2K+F7A5PXU5hoRAiA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q7xvaELA; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5440d5b30a8so3972287e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 21:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077625; x=1739682425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0fvdO4R1nURbqAvtpU5cS7Y2T0kdgB8Gv4vtNNxca0=;
        b=Q7xvaELAby4Q02l8gA5uHh0iUpfnG1Wj/TIbAuSHxsMY5xg26aiG9/dXJ2fLtb+BKe
         Cz27+Lb/TfhZTebyfXYyq/3K4rAriiK0ThKB4L8h3ZaYhs4PQb2tvoSe1GAe5sywsHga
         6SAGDey/rsR1CCm9j33IUqohH7vOek/97zasuopxJTRaQkHJaM8QJ72IaV9/9Wp4/D/9
         cOhGESYfuk7IXqZNdSmcVZxpwuxBJF7ZxcMnhDlX3RM/WYdKevMx091s/YPKPSxygcGp
         2mNHHa2S4oAjQws06SAUWuneLFJ+luZg5uAg5zkGW2J6Py6SB7X/CgsVEqtXTt8/zcMF
         SLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077625; x=1739682425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0fvdO4R1nURbqAvtpU5cS7Y2T0kdgB8Gv4vtNNxca0=;
        b=phasIyXFLr0hMQOAYkAxpbNeSnvFc70SF+E4ZVGwlB5MErmzUqGeSodOELNKnbDa/u
         +HQR1jAGghODCsGqB4eWl5xsDhplSg1Qo+J0s8CIj52qSaNgfMTpuq0EUq3TcfoQTRYF
         qI13Uxl9RiYUE82BucekSfw5TUSUE2ytx3IsxxhrWO75kDRj2aME1wHPf5UGwqAQCbl+
         Ir+HUfgcnuwPwLvMcbWLoWrXDSoUrGtG2Celjl8Jn8kS+h8elJDKdQFi2ByStFh2ewBe
         fQ+UCbAEtmdpqzLcm2OzSwLjv9NUAn70Y3xZH4Pmwtn23DsBS8A1hbj/+C1SfXWLQZ1p
         TFFQ==
X-Gm-Message-State: AOJu0Yy05wu5fXN5rzKrUBt5CctJj7cFtccT8pSPz/AvR0ROt3aBZA7P
	2V3BIz07VmtOvZnhdWlPACVDujv7tumrpJQoXhFw2S0xqZIMUCzkXfuTGTeV7mMyudgTglQV8RW
	m8Dk=
X-Gm-Gg: ASbGnctjI9hzYikYrHnWi69xXJD4/rvQm15jgAXZQ6WlsVeCpvpVpmApVV4lymCReAH
	x7C2XvlZ6KJzmk7KKfHZTuICWKGp19Nkm0NZjrZwrJ5c6v82LlXkI0WA28MdTuL6ZSvvUHakwAG
	3P7LLDxNIqrPWosDvt9hnUNKEcZYEsF+pi1z+WcQ3PMed2SjrlEE0R7ABrqYyOECbDbfZzEQTLC
	5Dm5QOFi63kUId5TOlVp7eldP6dpBUoy4/Mn9yhW4nqsq3gV68RCXUSTiw8iFYEl7Db4Dr3oYuu
	Cnei8m7iiL38aiYBIo7Fyvk=
X-Google-Smtp-Source: AGHT+IHvHK9pE/lJ1sbvSikM6yxevJJhOW+toCBmWw7PDK+wzGYcNkAt2K57E9sTUMAV9Ze/PJqhag==
X-Received: by 2002:a05:6512:2821:b0:545:6a2:e52 with SMTP id 2adb3069b0e04-54506a20ff4mr841140e87.13.1739077624656;
        Sat, 08 Feb 2025 21:07:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:07:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:52 +0200
Subject: [PATCH v4 08/16] drm/msm/hdmi: switch to
 pm_runtime_resume_and_get()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-8-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8ggrOHMoONGuV72hshgJDWyRmMWrabWT+tktxkICLQM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfibvp8G2Mg6U4kntY4TDix+sHhUGkYjpmgS
 NNb+V0lzKmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34gAKCRCLPIo+Aiko
 1ZOuCACuIdGuV1z9z9UzxMNBCcGvD/1jN1gxNpsw6zo3qtvGjKRkgE29wRh+70PdHygdsSuJJND
 MQki8GKKIOtm2TMfh+6qLFk75iGLCdaFZeZxBXNCF7DXEBgAgtcHrGCRf8V59wZBCedv3aG+Fjv
 cXg7zqX6S7kZCGzN1etDHpsvbm9+otPbTE3VJ6zkIpDpBw7N1ufN+sm3I2juhcTvXxEDP1hmjxx
 o9YPIO/P3wB5ewBaRYJco7WQme9QVlQs3/YzNlYGghVOo21A0xb0tA9h+FqcQDj+rB+MVHq7t+U
 jSh9lS5oE/Md0BKq6r34Tr65Q/5WqHuA8FJ7DSqmCc1TROtB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The pm_runtime_get_sync() function is a bad choise for runtime power
management. Switch HDMI driver to pm_runtime_resume_and_get() and add
proper error handling, while we are at it.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |  6 +++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 6c5bbd772700b0362f884a737598d7bf419adf9b..d7d5d3755fb853377aa999e2a830debf54afe984 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -21,7 +21,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	const struct hdmi_platform_config *config = hdmi->config;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	pm_runtime_resume_and_get(&hdmi->pdev->dev);
 
 	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index e253c1408dd1c6dcd7e94506f0b8edcfd4a9a159..d77c68914c5f525cf12971c1058b1abc33792b24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -85,7 +85,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		goto fail;
+	}
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto fail;
@@ -178,7 +183,10 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	u32 hpd_int_status = 0;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		goto out;
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 03120c54ced686dcd2ddfe809dd9c9011f608235..667573f1db7c6bfef6c75828b5c581c147a86d0d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -58,7 +58,11 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
 	struct device *dev = &phy->pdev->dev;
 	int i, ret = 0;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		return ret;
+	}
 
 	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
 	if (ret) {

-- 
2.39.5


