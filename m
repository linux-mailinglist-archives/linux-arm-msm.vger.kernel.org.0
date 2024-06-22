Return-Path: <linux-arm-msm+bounces-23721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 532BB913687
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 00:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C45EF1F2340D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 22:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E82D84D11;
	Sat, 22 Jun 2024 22:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfN3pphg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDF98003F
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 22:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719093746; cv=none; b=iLgz5r+UjFIr9IrptgGm29CbtaoM8yjnPipgT6fet4PmfyW6acnnJ0pCfRR+Qz/3KJy8gsBhcin2JTPDrTUg5Rbgnsw0mKwgkavWZsx+y0OQtaIQ8+Dm9SrAjGsDacveznIcenBUEmRYbJ6kFYrWa8HzeqqbfVVyChcm1MGqFCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719093746; c=relaxed/simple;
	bh=Cbv9GuAgvf3OlG8nZVtZC4tgrmDTjBkPfIcahMH6TZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JeIIFXvJiw+Ko0DjeG3WLPFTUFaTWOroxViML81sRotYuFmMPiiO8ThL/RvpWSPrYAtZoyb/zOUv+SPFNoyel1L4q0o6FXNGU3xRiVMvkYi2l12n1e27NETLS8icSEKRGYDBsk4zwj6c60U8eaLf12JWdlO9aL3stH80Ki7zgE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hfN3pphg; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebeefb9a6eso32237361fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 15:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719093743; x=1719698543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7hDmykrt2ZsXc+hmL2IVvYAewI1x1XZlh8sOCSDu6Q=;
        b=hfN3pphgvIHQ75/jOpsxqtqSCsvqBrXi32vlmoIfARJAq3CAn152QndH/2IuYLoiw5
         JeB5walwXbSSHzOC2fsuKjTcErfg1GBml0FUz7OjQVSwzdaPQZg5cxsaed21OFHMnYA1
         awcey8RsD8N+vPlgBGKBZEWXpEj2OOY7+NAq1ExFN+DK8a9eQFW1NDxu3Accdqrhzqqn
         O6cT+Y6I682A1x2nhSxSLWg3S/1kvUckuu1Blq9r5iODBPE5cNC+3ZbaROpjSwr3HjRG
         xIBpmVpi1ZheokFfZqpzxVYx9pPEVygSETuBB4GPwk9GiEWudj5ScWrAw+Qr7bO3vkZ8
         CKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719093743; x=1719698543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7hDmykrt2ZsXc+hmL2IVvYAewI1x1XZlh8sOCSDu6Q=;
        b=CTuf1YmGNN2NO5YQSjAsMqr93NDa/ftNuKn/PztbeUGNEOvmA935R/wDZuofqUfzsh
         jfEL5BbHSdat+wyMiDJK2+/29IIVrDpMAXDffGTv01957pUTc1mNLUemr5D68s21hdf1
         kAK/OESr3Mfl/5+O+T16d2H5anSL+gU7CLAcDF7bHSKcxKgoXVYLMDB3eZCJKEyKunU7
         KojEE3Za9lfLh2nHxZvYPYdiagd3y+lCzjZ3iFXLT2elctBZ1hG3lXW51oeRaJFt86Rw
         135L9SSOygVoXqswBNeLdyQLK8A7oVehoOc6sopr3QFkPbiwlANib2VFr5zWZzNtSIg5
         XBNA==
X-Gm-Message-State: AOJu0Yw4YlyM6W8cHvVjKT6rIqvMlMcN53UDkZ3DiFagLkKoqY32PT8W
	5O+uczxEJD+fMrd6O8VcqA/pCuwDebSPw6fT/xJ2hUg+kXzZRi4rAcHmHqu06eU=
X-Google-Smtp-Source: AGHT+IGMDkcXd01ktZF/S0kaLc34zRhGg164j2CXXcedc1M4wVD1mpuhAD7z+e5dXh/RK99uNWUzOw==
X-Received: by 2002:a2e:9209:0:b0:2eb:ea62:179c with SMTP id 38308e7fff4ca-2ec59587b4amr7367111fa.53.1719093743010;
        Sat, 22 Jun 2024 15:02:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 15:02:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:19 +0300
Subject: [PATCH v3 06/13] drm/msm/hdmi: switch to
 pm_runtime_resume_and_get()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-6-8645a64cbd63@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2669;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Cbv9GuAgvf3OlG8nZVtZC4tgrmDTjBkPfIcahMH6TZ0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0noKRQoEnzMVJt0pHda4tP7PkcR9J2EWmuxU
 2N0uAYXiwSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6AAKCRCLPIo+Aiko
 1VLTB/481ZB16vlXyVjafhAnp+jfETZwyHPWvh3Z1uJqQp33jr1iO2n9vmJ5zesmI/DQaDk285k
 QhoEVabTrrqwRU025RkUDlogx2AOpRWEwvQ/Adu/xhFP9oV74Ru9X9oOWoCiwiMQokV8t3VT6EB
 JaYIepgYGTSYYokeafI0VmiGpWMte3mKP3AKMA8dwtpiRdy/85jlA31nh2zvPkUVRc/mVLOb2P6
 4kcdD07qiOc2NMezmwhwVxrPcjG/Q74N3QRZXOuk6kDjhIAZon0ppyiv7HEEd1Ti/8yBib8vWbi
 2bEPi+DWYiawy45L90ETwVjmswoCeBQxvJGEV/AICLtfDIII
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
index f1790dedf451..34085fd9739b 100644
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
index 36266aa626dc..fc21ad3b01dc 100644
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
 	uint32_t hpd_int_status = 0;
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
index 88a3423b7f24..d5acae752300 100644
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
2.39.2


