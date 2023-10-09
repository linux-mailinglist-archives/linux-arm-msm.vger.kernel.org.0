Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15A667BE8E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377448AbjJISKq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377383AbjJISKq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:10:46 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6755E94
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:10:44 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5044dd5b561so5772517e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696875042; x=1697479842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rhoq4A6nHUJ0zF6JqJTYHaFcA0Hv6qfy7RZdzUgcU3s=;
        b=bj7Z0esfbgn8ALGumfovY1+3HOHIMQdQ91YvRaLd5paAyfV3jFLps7yquKfcT5R3W0
         DcnQCMACEvVRXb4JdB36xA6z8WUUaqNdFYrkI4nLnDBP6BPkEGqdq0EfTfKkWJtL5MNk
         A0QBHe+fEUmwpTGDHcwvkK7KWTn7/NuvC6RAtD+hxzJsLVHhjVT7AAP4oXmmt+2B9THy
         kmf3A1zAmkoHxGRFBqBTWJaJwLujihneIDLndPDEBsTAoByCtS5PKRnTwQNp1PWujM5s
         SJv4N4dS8sE8E5DBx6ncuhz1CqcRO0a43i0o3FfXSqxRVJnqvIMlP9Lo4fO3aZjAZyAc
         ToAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696875042; x=1697479842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rhoq4A6nHUJ0zF6JqJTYHaFcA0Hv6qfy7RZdzUgcU3s=;
        b=QPFD3VF3GAd875vC5GsWxFnnqFOHTnKdoguBwKKA+tGESNmqFqVt2wo0X9sx3yYM2t
         Mc5PsxDs6qijfWX+6HcX6/FtH7vJ64wAtrpCW1bm/lJ3Ov1OzLiny1i+kU7QSd/DBwtk
         RyEKEWngqntrVzKKWhAT5/cbhRNc5GlQQe/dDlUYCgRA6pigVQnl6bW9QUdJ+u9NuMob
         SQHaMbUyaBv5wBAsfZUWysPqVtYx1DspngVZgPx4MX3WbVEallq9wdvBlSlDiHltleZ+
         WcOVE+PCk2wZKjprx0dVy3fM1xQXaNT/MJcXIonqJGqgNLe+F0Qt17C8zpwt8VeasSho
         BuVA==
X-Gm-Message-State: AOJu0Yy883uvqP+1Zl6MhLudztM368oXslZ4UNXzKQtCkK0H2yqPvc0v
        Mcg9wCHq3dBYazBYqlPNJhyJ/A==
X-Google-Smtp-Source: AGHT+IFgBxG8t5T/2IknHktWTchqFxzXq6gqgVoSNlOHSWDrSKIymWczVDmlLc+i1uSTJMn+TgHDNQ==
X-Received: by 2002:a05:6512:5ce:b0:501:c996:1996 with SMTP id o14-20020a05651205ce00b00501c9961996mr11491384lfo.67.1696875042613;
        Mon, 09 Oct 2023 11:10:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:10:41 -0700 (PDT)
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
Subject: [PATCH v2 01/13] drm/msm/dsi: switch to devm_drm_bridge_add()
Date:   Mon,  9 Oct 2023 21:10:28 +0300
Message-Id: <20231009181040.2743847-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make MSM DSI driver use devm_drm_bridge_add() instead of plain
drm_bridge_add(). As the driver doesn't require any additional cleanup,
stop adding created bridge to the priv->bridges array.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 28 +++++--------------------
 drivers/gpu/drm/msm/dsi/dsi.h         |  3 +--
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++------------------
 3 files changed, 16 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index d45e43024802..47f327e68471 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -215,20 +215,14 @@ void __exit msm_dsi_unregister(void)
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
-	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
-		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
-		return -ENOSPC;
-	}
-
 	msm_dsi->dev = dev;
 
 	ret = msm_dsi_host_modeset_init(msm_dsi->host, dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to modeset init host: %d\n", ret);
-		goto fail;
+		return ret;
 	}
 
 	if (msm_dsi_is_bonded_dsi(msm_dsi) &&
@@ -242,32 +236,20 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 
 	msm_dsi->encoder = encoder;
 
-	msm_dsi->bridge = msm_dsi_manager_bridge_init(msm_dsi->id);
-	if (IS_ERR(msm_dsi->bridge)) {
-		ret = PTR_ERR(msm_dsi->bridge);
+	ret = msm_dsi_manager_bridge_init(msm_dsi);
+	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: %d\n", ret);
-		msm_dsi->bridge = NULL;
-		goto fail;
+		return ret;
 	}
 
 	ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dsi connector: %d\n", ret);
-		goto fail;
+		return ret;
 	}
 
-	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
-
 	return 0;
-fail:
-	/* bridge/connector are normally destroyed by drm: */
-	if (msm_dsi->bridge) {
-		msm_dsi_manager_bridge_destroy(msm_dsi->bridge);
-		msm_dsi->bridge = NULL;
-	}
-
-	return ret;
 }
 
 void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index d21867da78b8..a01c326774a6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -56,8 +56,7 @@ struct msm_dsi {
 };
 
 /* dsi manager */
-struct drm_bridge *msm_dsi_manager_bridge_init(u8 id);
-void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge);
+int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
 int msm_dsi_manager_ext_bridge_init(u8 id);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 28b8012a21f2..17aa19bb6510 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -466,9 +466,8 @@ static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
 };
 
 /* initialize bridge */
-struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
+int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
 {
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct drm_bridge *bridge = NULL;
 	struct dsi_bridge *dsi_bridge;
 	struct drm_encoder *encoder;
@@ -476,31 +475,27 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 
 	dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
 				sizeof(*dsi_bridge), GFP_KERNEL);
-	if (!dsi_bridge) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!dsi_bridge)
+		return -ENOMEM;
 
-	dsi_bridge->id = id;
+	dsi_bridge->id = msm_dsi->id;
 
 	encoder = msm_dsi->encoder;
 
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
-	drm_bridge_add(bridge);
+	ret = devm_drm_bridge_add(&msm_dsi->pdev->dev, bridge);
+	if (ret)
+		return ret;
 
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret)
-		goto fail;
+		return ret;
 
-	return bridge;
+	msm_dsi->bridge = bridge;
 
-fail:
-	if (bridge)
-		msm_dsi_manager_bridge_destroy(bridge);
-
-	return ERR_PTR(ret);
+	return 0;
 }
 
 int msm_dsi_manager_ext_bridge_init(u8 id)
@@ -557,11 +552,6 @@ int msm_dsi_manager_ext_bridge_init(u8 id)
 	return 0;
 }
 
-void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
-{
-	drm_bridge_remove(bridge);
-}
-
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-- 
2.39.2

