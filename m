Return-Path: <linux-arm-msm+bounces-47281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 574DEA2DB18
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 06:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D2B73A756B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 05:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4181916132F;
	Sun,  9 Feb 2025 05:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PizxI8QS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545C21547EE
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 05:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077626; cv=none; b=rcONqgm9lqm74eDpXGa5AjagReH4SWBtdvWxaiUpmMTYOyi/IFrZGLd4VXwJ1YL/FFUoDwdM3OLBf3FgMJn8iXKhAakKknn6RWojlqrNOxwoAr0fJQ2WH6Dr1Mt/MrcNLw+3prqIR10a2QNakSuhTktqmoDW7pj+HQycUYiOw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077626; c=relaxed/simple;
	bh=cNUywERI8hGQBw9l50SO0xvsuUis2RpMcSyOPQXrk1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s0y+xqelf3eDwRjBN5jX4Ca9ey+v17EhZNPkLYzvsao5FIICOR2XSoyZyoXEctOfHUMHa/uEZDLgttAEeAA1cB4CpL05mFlxORJVWNtaXruWojuG3aBfQOjKYMAeeSXEn8WsQ+Pq8u7ZdHg214vuiiC4opS0dGI/DdJG79wWiJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PizxI8QS; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-540215984f0so3541704e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 21:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077622; x=1739682422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rGXodl7UY6Xisbn+xeFyyE0+oLCJlfYiSTPpiZkjaU=;
        b=PizxI8QSY/d7iqZgen1cj8kTffdcLfqskQoCxBfXRCkjhAbCTBZ/LfpsKfStC1H5yq
         NWjySvrVrHUZ7sQuDGQw3Dohy3SEaZOuVgpnYhcjag1+0qD8mCPdQHtIA97T6B+2JZef
         +3oM+FxAAKs/vMjfSkbZnx9L77Dzd5CoM+0BOsJhNpT9FrMsFnUHXJvNMZz4CG66ye/F
         WeqiChTNCmu+ieoEl3Nm33q2ceSp1sqaKsw/6eHAIOcjPfnNtz3Bx15jlkHlK7YsL5ax
         vpFjB3yXIpfaIjn/4ZmffQDXJGSPH6q/icksABgscWqrfzyE5OMkKfXrwDkn1QZ9qkJa
         hgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077622; x=1739682422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rGXodl7UY6Xisbn+xeFyyE0+oLCJlfYiSTPpiZkjaU=;
        b=Plm+FeFCkXVHQxXikHf3hAUMqJ8YFLNeKPtVMWJFbM8z816gMJmcLfRMjIJJ9X41m3
         /SL5syJ6TWqUbT60DNAz2Bag59oVfJFZcs+ZFfRgggEUb2E5AvjHPnFe4ELSNVNsyBEK
         qbi9ARF6KroUuU5e95miWWH94qrox0XH7PNcQcpDUTIX5SD8aOyX6cGCxpM3xlZd8+Dr
         vOV8woCvvWWRatydj273XXZYfUPRp21T4FKnp2xPE8JHwDJiiXXFNx6+1szVtTZdsCo3
         tTZTCb/D/+/Ymgwl5jnWBc4PeGc+C0/x0hnmqjVWHFbgSR39c3t84W06NuKb/9jddH51
         HVSw==
X-Gm-Message-State: AOJu0Yy9S0BWXcC0FPE6Ua7KvGj1exJbz0a3xyfpEqGP1Vo53LBk0SEg
	KbrIhdkbzzuppeFam0ohIuqTytwwV10/VI3uunPox8Xs7OLuFvAOLypqFVxdZkpAQopUYVRp2kG
	84nc=
X-Gm-Gg: ASbGncuKzy8OpdyFICpziuuVnheK/0wjTpaAjvkz3uS6TmeHtaZj9pNOamEWJjJgp4J
	5tgCViLThjD/Ftt/ltKEbpGG0Rvgb7ee4XFzu81oPQUpDXoqPYQ6oifa0Nq95cszjfqGg1h+iH1
	4ABtjJbRpvHr82T//rV18vcAjjq9spWFntykFs3hWswlmQYKEb2FQ05/aR0YVWK+Sx5NhE6srhh
	TLn2K+SNr8hfvx+DBuErueq1sEQuddqEWLhIOsJ9baLrB7gujeoMLaI1r1eibyX4+7jKeFzYvA+
	QiufT4+UiSYh8b0wESNazsA=
X-Google-Smtp-Source: AGHT+IECHEx5wXU3DMO4GB2MoLvqoEOcXJmE/ykw6Obq3xv/T+mDtoQLue2OeXH2anuyCE0mx+aqFQ==
X-Received: by 2002:a05:6512:3288:b0:545:5d:a5c3 with SMTP id 2adb3069b0e04-545005da7eemr1544729e87.4.1739077622154;
        Sat, 08 Feb 2025 21:07:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:07:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:51 +0200
Subject: [PATCH v4 07/16] drm/msm/hdmi: switch to clk_bulk API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-7-6224568ed87f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4477;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cNUywERI8hGQBw9l50SO0xvsuUis2RpMcSyOPQXrk1Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfirTeg+xg3ns1vJT9Om7aF9A1HlE9Ki2qvq
 Wcj5oDl6S+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34gAKCRCLPIo+Aiko
 1QwlCACPy8ChP+BZLQp5Xs97+XIJG4ERSgqmkT99waymkQsollnei9VfA03mFzmQJkW2a608nqr
 L5hf1Hocdm6VaP5m0DmgdQL1SSEIAvYNgKVI0226bwTODULT1WmwqVSbJs91U/BNxmAksLvZ1W9
 LCJ+NZR8NcpybuMAHMqSLaM/kOnySq6cz4sxXtHi6bmng0esJFC8qkTZoFxj6g9XbyMOPsm/r3S
 wuWZgR2/S7Iz8AEjzCQeGT0JegDCja7uP4kSz1sY2mV53hZuFrogOsq9Wdh/Ox9bsjirav/Z+Or
 1elUQHYLq/3ap0Jnsb8mgqSKXCqOm3AHtoGGePqGhVqz878w
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The last platform using legacy clock names for HDMI block (APQ8064)
switched to new clock names in 5.16. It's time to stop caring about old
DT, drop hand-coded helpers and switch to clk_bulk_* API.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 15 +++++---------
 drivers/gpu/drm/msm/hdmi/hdmi.h     |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 39 +++++++++++++------------------------
 3 files changed, 19 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 6f09920c58190a9c195de0407e4c2dcc3d58b30f..69e337d551799b4d35c8c8c7ecb5c4680b9a9e5f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -353,17 +353,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
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
index e93d49d9e86936cb6c1f852a958398de2e134ad4..3f87535bcf43e20f0618d3016307fe1642d7baf9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -49,7 +49,7 @@ struct hdmi {
 
 	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
-	struct clk **hpd_clks;
+	struct clk_bulk_data *hpd_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 7ae69b14e953f0ee6deea8a216bfa9d3616b09af..e253c1408dd1c6dcd7e94506f0b8edcfd4a9a159 100644
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
+	u32 hpd_int_status = 0;
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
2.39.5


