Return-Path: <linux-arm-msm+bounces-22616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC667907951
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 873BA1C225CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AB114A4C7;
	Thu, 13 Jun 2024 17:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QGV0Jdbt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE0114A0A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718298315; cv=none; b=ln/UF1kLPRmwO7x7kMoBE8ow+ZZkLEwr5OcO4/vh1gpSSTriaq1ZFPE/M0RI1v5WNModzMq8Db/C8/337qXJp9YXBJXt4PaEa7KT/W3y46scOAAVmQAIUIMk2CYXXs2FWfeaVNpgweXN03OFjXDNmD8+Qmh5qDolOoZDRvzySCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718298315; c=relaxed/simple;
	bh=bDZH3Se3yEXeok1v+4xcgwo8ckhAiicjF4WPwysF+hY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQXlYlLHUc2v/nzV3mAgcySqQvMj6UpwBgWFHFp6H6Ob8RXHk+LLfXxPjXkTdJsN07ZO8mPGfN7BML7XvDuD6p8qlbAAkzZUpp9bTIfELpK7lQH/HzY28B8Sw7+/jw5rebQBCWKDfIqkSe32bwZle6OeDdhICZWyTy8RSD5MCQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QGV0Jdbt; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso1439519e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718298311; x=1718903111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=riizenq3L8DXhy6NcFp3E1fNog5NOwudZRa/v8cMvOY=;
        b=QGV0JdbteDQEaVK1KFq20kswXFIcy8MHU9xCd1Z/C3mbWA8YcgnmNQpJitPSNTcJwW
         5vQ8Ihspo2NLJD1N8xuufn0VXr+pLreIXf4QUi/3EvMrNIOq+NRSKLuI6b1p7/w7mcqF
         dyxcerCy6lxTCTvJW+3H83lqVYzpP3TqQNDXQKVmco3xZORQT0j8i3pnULwYSgRS1qxd
         I0B2loN1OJrtDnvCPa/6e5buRBRJFobmhzImP/TcQ2oSQiTaT09JBZQyOiLBljlFIvl+
         jIoFQcltlMxW1S29ilnwBhySbavTAQXg7cFQpVElkMu7AXRjEpjb4r7bF1vW5hdlMT3A
         EQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298311; x=1718903111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riizenq3L8DXhy6NcFp3E1fNog5NOwudZRa/v8cMvOY=;
        b=e7TCh9sWsj5GqkW31v4DaRTsq5oay2iTbqWu/8xKII7wiJNu9xyJBajjlkAwW2u2R4
         4rs/4nV93C+9r4Sax4MR9+3ME8geF0OFme15tXY4lbWEezmm9kJY4AzeKvSP8TdozZ1W
         JOtIExNxcTM1RXHWMeAm7D9l3s9sSatziDmB2pUMpLPOhL5rqb/XpoC/G71TSajOSis3
         kOLtnZgXVMFCOKDLESQaR9w54buMD9WXb5vOSnXmNQGDT8EbexRj/hbL4TKIX5dJrcl0
         aB14P3e+evc4a76GEq7lyeJKpHPGaPEgCtdac7l8gtCHURl5dD1hxhshxQkfF2XFa+yf
         +qSQ==
X-Gm-Message-State: AOJu0Yx512xW/4ViOK9/ql/O/dbv4mRpl5GkbWyqGADHQOCrGA+akqhr
	sO+8CVWug8+e9ZTjfkanm3VQgTZGIpoaCXbfaX6n5+qTIoRn4w6MENEBUJ0Qu2k=
X-Google-Smtp-Source: AGHT+IGf02+SM4/sdJmC/eEG5H+J63h6e/5s84OXjM0q6E/nqPnNJNsTbstfAFOasBEHe8VYopvujw==
X-Received: by 2002:a05:6512:402:b0:51d:4595:3527 with SMTP id 2adb3069b0e04-52ca6e99c90mr204031e87.61.1718298311298;
        Thu, 13 Jun 2024 10:05:11 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:05:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:09 +0300
Subject: [PATCH v2 6/8] drm/msm/dsi: parse vsync source from device tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-6-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3355;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bDZH3Se3yEXeok1v+4xcgwo8ckhAiicjF4WPwysF+hY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaybB2LKaRw9mB+qJ3Wcyy+ofJN/TyAW6ZOgMG
 +BEZKGyyn2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsmwQAKCRCLPIo+Aiko
 1RvtB/4lo66prEsmuaIsbxhLnN5kdIup7X3NKwqkkVugXSxRS3KGlGbjuMRWGlC9PnUCnI6+AWa
 opaaFF+z3OoCPe9e1j/YhneHyHRoAWKpkQ88893u3CkGgvLXTfV/jhP1qjB/ZqUKrtN63lD2Ja7
 ZmPU+Cpg0mAIBiC3psYh5K9u9crLtO6dLT6MYTACjXoui443ZpVZHqanmFiF7ARAihHvcjf/zRM
 U23qB0Nx3lQD25w2l0BPYT0ncHtyWVPa3oP/dkGxkoWuO0A1FN33z8/0tuRLQbBACJkJAskIzpW
 xUSW968YgQcYVAaXkgiQ/bpUQy8ZXQrac4NjraKf7QyzXHWL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Allow board's device tree to specify the vsync source (aka TE source).
If the property is omitted, the display controller driver will use the
default setting.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 11 +++++++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  5 +++++
 drivers/gpu/drm/msm/msm_drv.h         |  6 ++++++
 4 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index afc290408ba4..87496db203d6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -37,6 +37,7 @@ struct msm_dsi {
 
 	struct mipi_dsi_host *host;
 	struct msm_dsi_phy *phy;
+	const char *te_source;
 
 	struct drm_bridge *next_bridge;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c4d72562c95a..c26ad0fed54d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1786,9 +1786,11 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 
 static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 {
+	struct msm_dsi *msm_dsi = platform_get_drvdata(msm_host->pdev);
 	struct device *dev = &msm_host->pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *endpoint;
+	const char *te_source;
 	int ret = 0;
 
 	/*
@@ -1811,6 +1813,15 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 		goto err;
 	}
 
+	ret = of_property_read_string(endpoint, "qcom,te-source", &te_source);
+	if (ret && ret != -EINVAL) {
+		DRM_DEV_ERROR(dev, "%s: invalid TE source configuration %d\n",
+			__func__, ret);
+		goto err;
+	}
+	if (!ret)
+		msm_dsi->te_source = devm_kstrdup(dev, te_source, GFP_KERNEL);
+
 	if (of_property_read_bool(np, "syscon-sfpb")) {
 		msm_host->sfpb = syscon_regmap_lookup_by_phandle(np,
 					"syscon-sfpb");
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 5b3f3068fd92..a210b7c9e5ca 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -603,3 +603,8 @@ bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
 {
 	return IS_MASTER_DSI_LINK(msm_dsi->id);
 }
+
+const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
+{
+	return msm_dsi->te_source;
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 912ebaa5df84..afd98dffea99 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -330,6 +330,7 @@ bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
 bool msm_dsi_wide_bus_enabled(struct msm_dsi *msm_dsi);
 struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
+const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi);
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -367,6 +368,11 @@ static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_
 {
 	return NULL;
 }
+
+static inline const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
+{
+	return NULL;
+}
 #endif
 
 #ifdef CONFIG_DRM_MSM_DP

-- 
2.39.2


