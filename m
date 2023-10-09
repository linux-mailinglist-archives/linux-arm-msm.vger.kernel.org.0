Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4B917BE8E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377445AbjJISKs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376898AbjJISKr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:10:47 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BFA9D
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:10:45 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-504b84d59cbso6378605e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696875043; x=1697479843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo+Tbv6d2nOKlw4PvFCcvYipnGPPT636i5Xxfkjy52M=;
        b=PvLAkjwQFBYkwB7bQFe+ia9CemSz3Ve2kp7HMJdRieMA1ZAAIoSDTEvjY/2uqFyOzr
         bK9cfiFxrHn+qOUaq3+Yv8HQ5ViykAcMm47ehtOEeECTFV9hyIvUUvpIW8L2BAgIfna1
         Y98kn5LO4gc2GoNZgUWLancwZK4YXngN4LTdlsRONg1/yHZUcjq2IxhZMcEBmNgRLBIH
         YAB+rPpqQBEJZ9C2ThCSzkrBcmU0lBauFsIGnbzx3mnnWYqpHavgDgJ3+ncZrzXB2kgh
         BNaa321gq4haPWJPVDUYCKoMiUkRlTNtuTkAnBmhLsInFlyqb8Qx33Vbfth2msBI+5so
         w0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696875043; x=1697479843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yo+Tbv6d2nOKlw4PvFCcvYipnGPPT636i5Xxfkjy52M=;
        b=Jl8QIcLh56NAHBToUagjAhQpChzIPBiSBrYKahgWNhG6otpfvcuv9tSF6R+kVNFnwm
         eBE+1RcgaWY76HDM/4+U8JgATb7KLstWCDZDIFkwZAjcBcegoT7czTc32My++H/YUqbL
         9C2TkK3RsV/rHfgMsu9gk6CmsH5HmGZDI+8U1ibI18XLOUdV9Zneu+a63VaxYf8XIv+k
         emq5aPEGzby5hgLIDZd3h3rF2UJpms2TSHgRuuVsPy2fmbOXaLBJC1rZdBqhCWY7XeA1
         wRKfqo3OFAaZ5Lq3/+YrQyb1O1gvxzss+9Z2CTRNpgNd7XHpYw4XkpgL3mxwV/Gh+7WP
         DYfw==
X-Gm-Message-State: AOJu0Yw/58DHXBs2ha+5S56lv/8B7HdvJN/54J/IDQZnLVzH+ogA1xct
        kwfXQg4eJm81TUKP5DaGP0+eVA==
X-Google-Smtp-Source: AGHT+IHsYTLLv3pichduCcVZyIWn3Q1VgNaZPfT4kj4iFfTQQ8zYXhA2XAxOTBNnfnHE7bN2hq4bAA==
X-Received: by 2002:a19:a414:0:b0:503:ed:8616 with SMTP id q20-20020a19a414000000b0050300ed8616mr11682247lfc.59.1696875043563;
        Mon, 09 Oct 2023 11:10:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:10:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 02/13] drm/msm/hdmi: switch to devm_drm_bridge_add()
Date:   Mon,  9 Oct 2023 21:10:29 +0300
Message-Id: <20231009181040.2743847-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make MSM HDMI driver use devm_drm_bridge_add() instead of plain
drm_bridge_add(). As the driver doesn't require any additional cleanup,
stop adding created bridge to the priv->bridges array.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 22 +++++--------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 ++++++++------------------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  3 +--
 4 files changed, 17 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index b6bcb9f675fe..c8ebd75176bb 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -160,24 +160,16 @@ static int msm_hdmi_init(struct hdmi *hdmi)
 int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		struct drm_device *dev, struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
-	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
-		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
-		return -ENOSPC;
-	}
-
 	hdmi->dev = dev;
 	hdmi->encoder = encoder;
 
 	hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
 
-	hdmi->bridge = msm_hdmi_bridge_init(hdmi);
-	if (IS_ERR(hdmi->bridge)) {
-		ret = PTR_ERR(hdmi->bridge);
+	ret = msm_hdmi_bridge_init(hdmi);
+	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: %d\n", ret);
-		hdmi->bridge = NULL;
 		goto fail;
 	}
 
@@ -215,16 +207,9 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
-
 	return 0;
 
 fail:
-	/* bridge is normally destroyed by drm: */
-	if (hdmi->bridge) {
-		msm_hdmi_bridge_destroy(hdmi->bridge);
-		hdmi->bridge = NULL;
-	}
 	if (hdmi->connector) {
 		hdmi->connector->funcs->destroy(hdmi->connector);
 		hdmi->connector = NULL;
@@ -395,6 +380,9 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 		if (priv->hdmi->audio_pdev)
 			platform_device_unregister(priv->hdmi->audio_pdev);
 
+		if (priv->hdmi->bridge)
+			msm_hdmi_hpd_disable(priv->hdmi);
+
 		msm_hdmi_destroy(priv->hdmi);
 		priv->hdmi = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index e8dbee50637f..ec5786440391 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -224,14 +224,13 @@ void msm_hdmi_audio_set_sample_rate(struct hdmi *hdmi, int rate);
  * hdmi bridge:
  */
 
-struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi);
-void msm_hdmi_bridge_destroy(struct drm_bridge *bridge);
+int msm_hdmi_bridge_init(struct hdmi *hdmi);
 
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
 enum drm_connector_status msm_hdmi_bridge_detect(
 		struct drm_bridge *bridge);
 int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
-void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge);
+void msm_hdmi_hpd_disable(struct hdmi *hdmi);
 
 /*
  * i2c adapter for ddc:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9b1391d27ed3..0b7a6a56677e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -11,14 +11,6 @@
 #include "msm_kms.h"
 #include "hdmi.h"
 
-void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
-{
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-
-	msm_hdmi_hpd_disable(hdmi_bridge);
-	drm_bridge_remove(bridge);
-}
-
 static void msm_hdmi_power_on(struct drm_bridge *bridge)
 {
 	struct drm_device *dev = bridge->dev;
@@ -317,7 +309,7 @@ msm_hdmi_hotplug_work(struct work_struct *work)
 }
 
 /* initialize bridge */
-struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
+int msm_hdmi_bridge_init(struct hdmi *hdmi)
 {
 	struct drm_bridge *bridge = NULL;
 	struct hdmi_bridge *hdmi_bridge;
@@ -325,10 +317,8 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
 
 	hdmi_bridge = devm_kzalloc(hdmi->dev->dev,
 			sizeof(*hdmi_bridge), GFP_KERNEL);
-	if (!hdmi_bridge) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!hdmi_bridge)
+		return -ENOMEM;
 
 	hdmi_bridge->hdmi = hdmi;
 	INIT_WORK(&hdmi_bridge->hpd_work, msm_hdmi_hotplug_work);
@@ -341,17 +331,15 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_EDID;
 
-	drm_bridge_add(bridge);
+	ret = devm_drm_bridge_add(&hdmi->pdev->dev, bridge);
+	if (ret)
+		return ret;
 
 	ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
-		goto fail;
+		return ret;
 
-	return bridge;
+	hdmi->bridge = bridge;
 
-fail:
-	if (bridge)
-		msm_hdmi_bridge_destroy(bridge);
-
-	return ERR_PTR(ret);
+	return 0;
 }
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index bfa827b47989..9ce0ffa35417 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -147,9 +147,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	return ret;
 }
 
-void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge)
+void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 {
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
 	struct device *dev = &hdmi->pdev->dev;
 	int ret;
-- 
2.39.2

