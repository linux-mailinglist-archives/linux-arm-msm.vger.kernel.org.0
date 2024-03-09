Return-Path: <linux-arm-msm+bounces-13760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 757458771D7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 16:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E15CD1F2172E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 15:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4540F44366;
	Sat,  9 Mar 2024 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l3fu65YQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE8344369
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709996953; cv=none; b=GbLw7LQowPgwUVwN9DGDQ8APSZOfq6zYru8bVjeeJUwisJJlmMmS2vbjWKBBLKl5HkkF0wQLHrq7+okdveI/7XV2wLv1kON+S65sXhTl0HLztjzJF+r24NdR+vIknnpNHBEkwdkV2WaLyqqHsC4M5mFKnRC/xIJAQK8/CsdMIQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709996953; c=relaxed/simple;
	bh=OYTBWb/J609udo4PjWcZWo+dNYpRZDjaYBzF/KuEgrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSj9LUOoFRUWRYxbV4l97lO2DXSx9XnTADEFS3N8srshsHBE8dUCTHTCNEyLME40OBIze6zyZ7FMi7W3odqgg70WIG6FOkLuvmQKFPc0DbC+XQKflGfD8bddapTIs2erVbfq8iCuvov+bTsn1H97Gb1aNow/q/mzn0/mqHT0kjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l3fu65YQ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d09cf00214so24143591fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 07:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709996950; x=1710601750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R79kFi5q6h2xuMcDgiL3xD0MGpR9aHNwztoW/ysGcfk=;
        b=l3fu65YQICHBvM/2pkqHP/oOI1tcc69dN/Osp/ORZ7M479KTnB1ayOL8AxkbseaiQG
         6u8pgVGJiR01EIi25340fPLVGpKUso92q/TR0hzIN28P4USfL03/P/15F2jO2DOeTg1w
         PLXR88pgZaf0fUGgZepKoh4FGuB2c83zuqWbly5NOKc+JPl0t94Y3f+vAP6T/z2hg/aP
         s7swvk5JqSKSQL4R+O9d451iXPMHnD/+RcuO19tRe5GNzLoTB95nqkK2wklEdl8uHdqB
         UiqOgHfMgFo2y0LrmrHARvRY1TblxdW2Sk2Tj5Ca47n5tkX8eRhnWhkg8M39UUIWtxIG
         n2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709996950; x=1710601750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R79kFi5q6h2xuMcDgiL3xD0MGpR9aHNwztoW/ysGcfk=;
        b=kfy3KEpLRd8bCsYNz7bxOjEtp3S9MaWGqw5r+PslULEKsusqxeQajfnV2DCaLSGbj/
         yBli5N6YW6VvvItZUsgouTM3uZWip+pqJlWD8orH8xNomuJVOnAK0fI50iFPsZF2SwpP
         EnRgHEqdTt9uzzzTNeUNW9Zl1NOvbTFoMs3tT7VKFN9DU6JrYOIPmu+m7OJHkvI+nFxH
         bBah6Ou87yDVCQIku4XHJJZUWNrS9vhttHCeOBdyqi8N76HBTVwD62MLFlFWtodPFN+1
         nr4xAZk64PZaiQFSoytgY9hoJcJUZChphwJig6xZTtsF/HxX2kpD1yCKbqCcRr6kd6gg
         /uOg==
X-Gm-Message-State: AOJu0YwYcym/TaeEUr06Q9UMp5S6A5z0qmhAI/c0p55IqVYMafRK+Vio
	qP0CbJlMjCAs+emfzaw4nMvQRtef9mMVR8svA5IMFjvrdpTwKRBFJsNAYF2N/XRiQwLjnut6I+J
	J
X-Google-Smtp-Source: AGHT+IF10RdRaEvCv2MBr+YeGRYtPmBijFVM+6qaB/W22c/QZiNOF6sehdHZcf/RnA+ICJGFiv516g==
X-Received: by 2002:a05:651c:218:b0:2d4:31cc:87d7 with SMTP id y24-20020a05651c021800b002d431cc87d7mr108841ljn.28.1709996949687;
        Sat, 09 Mar 2024 07:09:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m1-20020a2eb6c1000000b002d4062c833dsm328511ljo.98.2024.03.09.07.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 07:09:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 17:09:06 +0200
Subject: [PATCH 2/3] drm/msm/dsi: move next bridge acquisition to dsi_bind
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-fd-dsi-cleanup-bridges-v1-2-962ebdba82ed@linaro.org>
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
In-Reply-To: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2851;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OYTBWb/J609udo4PjWcZWo+dNYpRZDjaYBzF/KuEgrE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7HuSPV7ttgcma4S2K4UnNqtxQz1m7V6TPk4Nd
 Brshdy3BfeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZex7kgAKCRCLPIo+Aiko
 1Y8PB/4ju7I8KPNnBZAuwfztOn6XPapfqb0/O+pAbLVoCzMKZGRHsHZdSpt0mFYzzVoMrfrHOhE
 XrVazcgFuVv7Xrq9QIB7B8NHvDsR2qHObpSNe24vRNcSHuFWardbaco+YEXWsRniWzafJby1lA7
 9JM1bFtUzUQQxr/4RmOuL+JdFnzj7kXfl8rXpz1A7lL3aVhrPvUybcGY9euo6bcDvkbRaXDAYgI
 asJKK743VLnRLx7Fhxcz5aOtjr7Rc1J050h8uwksdHVYy/7CHUxcbS+8kqFUsFRRKjMVy9VHlEa
 hmECpG/9TM1ql1DOrj+EW+MQK1zYYvkvGoX2sT7EnM1ELAfg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Currently the MSM DSI driver looks for the next bridge during
msm_dsi_modeset_init(). If the bridge is not registered at that point,
this might result in -EPROBE_DEFER, which can be problematic that late
during the device probe process. Move next bridge acquisition to the
dsi_bind state so that probe deferral is returned as early as possible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 16 ++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi.h         |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  8 +-------
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 37c4c07005fe..38f10f7a10d3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -120,6 +120,22 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 
+	/*
+	 * Next bridge doesn't exist for the secondary DSI host in a bonded
+	 * pair.
+	 */
+	if (!msm_dsi_is_bonded_dsi(msm_dsi) ||
+	    msm_dsi_is_master_dsi(msm_dsi)) {
+		struct drm_bridge *ext_bridge;
+
+		ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
+						    msm_dsi->pdev->dev.of_node, 1, 0);
+		if (IS_ERR(ext_bridge))
+			return PTR_ERR(ext_bridge);
+
+		msm_dsi->next_bridge = ext_bridge;
+	}
+
 	priv->dsi[msm_dsi->id] = msm_dsi;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 2ad9a842c678..0adef65be1de 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -38,6 +38,8 @@ struct msm_dsi {
 	struct mipi_dsi_host *host;
 	struct msm_dsi_phy *phy;
 
+	struct drm_bridge *next_bridge;
+
 	struct device *phy_dev;
 	bool phy_enabled;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index a7c7f85b73e4..b7c52b14c790 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -464,18 +464,12 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct drm_device *dev = msm_dsi->dev;
 	struct drm_encoder *encoder;
-	struct drm_bridge *ext_bridge;
 	struct drm_connector *connector;
 	int ret;
 
-	ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
-					    msm_dsi->pdev->dev.of_node, 1, 0);
-	if (IS_ERR(ext_bridge))
-		return PTR_ERR(ext_bridge);
-
 	encoder = int_bridge->encoder;
 
-	ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
+	ret = drm_bridge_attach(encoder, msm_dsi->next_bridge, int_bridge,
 			DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;

-- 
2.39.2


