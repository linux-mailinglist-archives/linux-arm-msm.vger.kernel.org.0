Return-Path: <linux-arm-msm+bounces-23720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B48D913686
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 00:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5164D28304A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 22:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F1684038;
	Sat, 22 Jun 2024 22:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwBuFPm7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344247E59A
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 22:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719093746; cv=none; b=fVRHm9ZUeaDX0GPruVBPsoL6N+Kvm8/ibfYx5ZnMtLtlMHVKYET7MoE98MX65UUXMiZatff0xXmwDi89wViJuNCVDP/jqRdXCdhMaQnWjMux66X7GRTl9FJzJae5R0AbvCGAYL1Gljt8GBLMW0uiTEpIWryjmKAjz0KrlQvx8bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719093746; c=relaxed/simple;
	bh=qMMhEiJGtMf2g7v1irJOBZTZd4gqQt3vmkW+yduYJ5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DsPgd1B3mgW+sI/tetI6LQroELQrLu3TC/c8NjQIK1sx2Uenro4kvdAnRx7YVJbeOTSQMH0FiLFRQ1mymOiJHFWTKxrYwR6HgmaPFH8n2bIjZew7fl4FADqaxAfxR5JpmXZ3Gy48pVbNwFWBOHx+84+14CKT/gBQnqZuYTJpngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LwBuFPm7; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec52fbb50cso10650651fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 15:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719093742; x=1719698542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IStmo6xiSWG0asaFWCQdK/NUgiLLAmlGd9tuwPv/Qx0=;
        b=LwBuFPm7in1YOgzE7NSqr4qP4GMq6tEsopol0AM2qZt6EWqUSwVm+lqdirSN3wG1eh
         tLBnztZFPjOlZLkb/ZqN6fzEr73izNZJWEvjaRDd/A0bfSqMjDXNFRLG+aMFmWFj35ev
         ykAQ5kfQ40FPpZz41qpu3QbbYfoQGnoZNd+USrHR4a7VVtCn6BOCPRxowhcRrNz/I0tw
         mCtyf6H+Mipt/Xtg+vC8FcH+PuY5v+X2cTcsjwc0+xJJAc3sEX42CtZ1jx362dvQyUna
         kOIxn5seVaz7HbhfLAn4E10ENoIBJXax9uZoiwKSV7Ck6css1w9+gsBTT431C0UtdpLX
         nUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719093742; x=1719698542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IStmo6xiSWG0asaFWCQdK/NUgiLLAmlGd9tuwPv/Qx0=;
        b=lLfjQJz+A9hEA2W0YlO/47HECqKjrj3aVN//TNpW5BXdhsOnVSJC3Lj1k5nRsPp7/T
         39ljVDefvg+GoIvLkSZWvXMSiafwN8+SqtvAAGajae3KhrGvyOdcMuypMTTKkgJtcATC
         5XqXoI6Qlwtc2kgQ7hJVUPpHgH0s1hcfXyElGYgoYapmRKXCmsomkLST2maQM4um6T7p
         r7VWeq7EdQpejOl9Bw4wZKUrIMPL56CUc4gHHCTCRfkHsRxZWcvofxbMYZ4J6tnDuH9E
         qROkeqRiVdbm3zkSLMknpvotGnY+IkQbC13nwBX2HEMCOprF1nx8WqmDo4sseELdtTSV
         YA3g==
X-Gm-Message-State: AOJu0YyDy4dIRfynqFUrJ0kGlLI4IW2ue+NU8S9J45VDUAMyaGC0st2p
	/5i6cFdv1QtLMgCbA+D3WC8e/qLzLScRkrNirASXG/ue58ADL7o2kEZ0k1k3sJM=
X-Google-Smtp-Source: AGHT+IGZw2H42wRxJ9RELBzDAP73A8ArscgXWtc/kskvhjttQIpurWMQBXx/wCa9YqSVGmJ+FU/ycA==
X-Received: by 2002:a2e:bb91:0:b0:2ec:5d83:32da with SMTP id 38308e7fff4ca-2ec5d833347mr723941fa.49.1719093742334;
        Sat, 22 Jun 2024 15:02:22 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 15:02:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:18 +0300
Subject: [PATCH v3 05/13] drm/msm/hdmi: switch to clk_bulk API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-5-8645a64cbd63@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4314;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qMMhEiJGtMf2g7v1irJOBZTZd4gqQt3vmkW+yduYJ5w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0noBQU1rT1FyJzLhckR2v0eX7J4AfLxZpRoy
 d67H5nPZKiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6AAKCRCLPIo+Aiko
 1daxB/4iHvTDj3eKXXuQIHW9ezTQ5XvP0B+X2hJ8MSDqBPVuF1y3b3M6piEYFQyVphx44+S2XHM
 EuHs3LUkO5BU2Konqk2/BrVIZyEnRkHJk6y4e8jeMQ3WH8RIFf/IEGrjn7qGWmc1nA2BeNH+Bhe
 MKV4a258b5NCYtAvBqaUZjyS8PZKedfmpHbItgRdGorqa7YBH6HBBw4IZ/U2pAJac0rK2mKcDwT
 JO91ws3loQkpjWNFoF1NtKmSeISaos4OYIForCVkGtVB8oBpID9SMadU45F5KrdMuRTRlkWZIJc
 B2h05d1J89ERRbDb60mu/8yToRHCMfhHEc0kTy/1dN3XSJXY
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
index 9a39ad1847b9..34c1aac5feab 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -444,17 +444,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
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
index 14472b2d6229..287e6d33fb85 100644
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


