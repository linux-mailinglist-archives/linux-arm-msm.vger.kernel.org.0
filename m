Return-Path: <linux-arm-msm+bounces-13761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AC08771D9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 16:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E381281A20
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 15:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E4844365;
	Sat,  9 Mar 2024 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wEd2pgPh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739B44437B
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709996954; cv=none; b=d5Jm39j5nDhbOHuxSUqX0c575r2vnKsQTk0K7Nyzzcl1wAAV8Xxo4kPYL451F3ZhByV1LrVPoKeNCIEFD9cInUrNDNoVmlhAQDdVCtY99+1Uik9jGRt++L5kshIvgUsVWU1iy0eUfOrTpvIUCmYxHJKfsKoloFhtOwSAEald+tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709996954; c=relaxed/simple;
	bh=sQ9dGrX0/pUk+Y+5/wO+qeOzx57mrk8gd0lJNrR0tkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pGReb9nE64BWk+e8O1ByDAA46uUI5LbxWITx/rqJOIs7zqhJJUP3BQ46/bY6RBcFvx7mXOMMQyr70dKwKxHvmu7lD8aes4z5XBs5z+7tawaPk2B5eXpjw27BvIjjTqP899zV3dt+KH5+g3A73MQZIvJZQasXEG0rE9CQVwMEu2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wEd2pgPh; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d29111272eso42324661fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 07:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709996950; x=1710601750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNGj9hvd5eMMotayR67It4TFcWGQFtfA/p9pyF/5mE0=;
        b=wEd2pgPhg82Q3cFj92aclkJHbI0x2RZLPawS6fwDgJhMNjQRoLJprLdtyguAOpG5XK
         tiq2Z888CJlTuRtd0y8V0jImZtY4HxOHDiJrdX+rxcfZi0Up15jddwhP07XRWjjyrAtc
         ruCz1X1dybKoP2wbZcuSRCsf6nZI7OHzpR0k6PNhKp5rfaR5FsW6j62kIgZuhOwBeJTc
         UvMZ93DQYViRrvK7xtZp+wXG76lqe7WvIYjfG1DCYQ/oepko9DuHYXgAVpWMStR3PT2V
         wkEuBDRdUlhUOfGlUgEb8WtBaiicJhjp6y8gwEPVRztomaQ23Cgu8Im9EBhDaWhtn8pu
         hnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709996950; x=1710601750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNGj9hvd5eMMotayR67It4TFcWGQFtfA/p9pyF/5mE0=;
        b=D5/Nk79Y94EfOV81UD89SMynYepzyDAWtAK+b51Uv+R0ZCknktDKC6HYJOo+of4Cbn
         /xoDDKrapn6kTs2ZUi3S08e34skc2rGgKvS1qe8L02wC0aFIf97+PatpNSmWybTF2qhT
         D2u2B6JQTq1cCKsUef2FPogR+z/rnfs9ZYvtl+y27gC6y0E8+Nzmnh99w5JQi71fKc8j
         t6ullpPINS3IwjNknTa8q3nU2nvaAZnDAdwymLoZi1jGaTQTANu1DP+ZJldYAjBtrVPL
         UrNCwDnoWuDCRcpkayS14EqeVxXrSBx/4Q0puXCJi5URNHLQCokvVu/iIw1vnRaPS6Kg
         kyBQ==
X-Gm-Message-State: AOJu0Yyz8PP1EjAm+D5weJA0dUemWfHDl7o2bMv//ihoqhrupVjXjcuV
	RUWbxPztZfpKtAUIueNuMlc8nz5lkwpTIyuY3gC/jA+FBCFWnm2T1i01dPexhLU=
X-Google-Smtp-Source: AGHT+IEHNSWqX0gXHFX29xuxi93+Jfhzbx2TyMa/UqdM693sNC4YDSZ/Of892Jm2Pp9Awa4lM82QPQ==
X-Received: by 2002:a2e:8007:0:b0:2d3:dcb0:56d9 with SMTP id j7-20020a2e8007000000b002d3dcb056d9mr1461938ljg.29.1709996950750;
        Sat, 09 Mar 2024 07:09:10 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m1-20020a2eb6c1000000b002d4062c833dsm328511ljo.98.2024.03.09.07.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 07:09:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 17:09:07 +0200
Subject: [PATCH 3/3] drm/msm/dsi: simplify connector creation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-fd-dsi-cleanup-bridges-v1-3-962ebdba82ed@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4757;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sQ9dGrX0/pUk+Y+5/wO+qeOzx57mrk8gd0lJNrR0tkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7HuTSHu38iYiw5kUL9hewWylm4rO5ExjUE6u6
 7tGAahVjqiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZex7kwAKCRCLPIo+Aiko
 1Ys2CACm3di5oU6X/lXIp+QIh9BnCKdasPf41Phfo4D3UzixHBdHYXeI7lluOz9oMgmjSHRdpvp
 FVkQ9j6PxkGDSJqzkAGrGgsSnZNuAPAD3zEGaB1hVPgoY2I2lns2L/4uPm8YN0VPPqSfNWm9k52
 L0xRdKYFer8SMAasJZtU+XlLQFBotC2ddTel8mWz3gQLQPMUuDTKZbp72ZKu3ZE2cHIkH+UDXz2
 g2MXSbL0VrR3WPilOUl3p/8U4s5h+LBRor8p9bncTwA4fld+P2R5Qygq6w49bXuPDhSp5s8Urli
 SFUxGJM76aFA8Fud8Z3Bx08MbDAPgA0/0lzbhcw/aXZVVu6a
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Instead of having two functions, msm_dsi_manager_bridge_init()
and msm_dsi_manager_ext_bridge_init(), merge them into
msm_dsi_manager_connector_init(), moving drm_bridge_attach() to be
called from the bridge's attach callback (as most other bridges do).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 10 +--------
 drivers/gpu/drm/msm/dsi/dsi.h         |  5 ++---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 41 +++++++++++++++--------------------
 3 files changed, 21 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 38f10f7a10d3..efd7c23b662f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -232,7 +232,6 @@ void __exit msm_dsi_unregister(void)
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder)
 {
-	struct drm_bridge *bridge;
 	int ret;
 
 	msm_dsi->dev = dev;
@@ -252,14 +251,7 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		return 0;
 	}
 
-	bridge = msm_dsi_manager_bridge_init(msm_dsi, encoder);
-	if (IS_ERR(bridge)) {
-		ret = PTR_ERR(bridge);
-		DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: %d\n", ret);
-		return ret;
-	}
-
-	ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id, bridge);
+	ret = msm_dsi_manager_connector_init(msm_dsi, encoder);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dsi connector: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 0adef65be1de..afc290408ba4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -47,9 +47,8 @@ struct msm_dsi {
 };
 
 /* dsi manager */
-struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi,
-					       struct drm_encoder *encoder);
-int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge);
+int msm_dsi_manager_connector_init(struct msm_dsi *msm_dsi,
+				   struct drm_encoder *encoder);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index b7c52b14c790..5b3f3068fd92 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -423,7 +423,18 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 	return msm_dsi_host_check_dsc(host, mode);
 }
 
+static int dsi_mgr_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
+{
+	int id = dsi_mgr_bridge_get_id(bridge);
+	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
+
+	return drm_bridge_attach(bridge->encoder, msm_dsi->next_bridge,
+				 bridge, flags);
+}
+
 static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
+	.attach = dsi_mgr_bridge_attach,
 	.pre_enable = dsi_mgr_bridge_pre_enable,
 	.post_disable = dsi_mgr_bridge_post_disable,
 	.mode_set = dsi_mgr_bridge_mode_set,
@@ -431,17 +442,19 @@ static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
 };
 
 /* initialize bridge */
-struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi,
-					       struct drm_encoder *encoder)
+int msm_dsi_manager_connector_init(struct msm_dsi *msm_dsi,
+				   struct drm_encoder *encoder)
 {
+	struct drm_device *dev = msm_dsi->dev;
 	struct drm_bridge *bridge;
 	struct dsi_bridge *dsi_bridge;
+	struct drm_connector *connector;
 	int ret;
 
 	dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
 				sizeof(*dsi_bridge), GFP_KERNEL);
 	if (!dsi_bridge)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	dsi_bridge->id = msm_dsi->id;
 
@@ -450,27 +463,9 @@ struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi,
 
 	ret = devm_drm_bridge_add(msm_dsi->dev->dev, bridge);
 	if (ret)
-		return ERR_PTR(ret);
-
-	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return bridge;
-}
-
-int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
-{
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct drm_device *dev = msm_dsi->dev;
-	struct drm_encoder *encoder;
-	struct drm_connector *connector;
-	int ret;
-
-	encoder = int_bridge->encoder;
+		return ret;
 
-	ret = drm_bridge_attach(encoder, msm_dsi->next_bridge, int_bridge,
-			DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;
 

-- 
2.39.2


