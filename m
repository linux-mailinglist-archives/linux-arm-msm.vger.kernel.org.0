Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA8EF7BEC19
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 22:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377975AbjJIU5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 16:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378055AbjJIU5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 16:57:33 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12942A3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 13:57:32 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c007d6159aso58954141fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 13:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696885050; x=1697489850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A76BFNPnJ+6jsYihExtv8TvgroW23+3EsO63qGtaSNI=;
        b=vWAMmYRUE2xZMimF3ux50z2Sa2qEe7h5p/L4A9EKGDgxCg6P0EIkW66qBobvrmAABH
         9LlsCAmu+fcp6G5tAXB9hO8qhS3sGXILmfa2fy3Zm84FoZU84bDTGiOb4Sauugw2AFim
         5XCTbPZ4UiQ8sRizYIFfN3wsXAdnfbduI6Nj0Q6n4askrYldSK/UosESD6plsgg4JQf5
         5ywC97/N7nlFVgC517jBleJOIpiEOXf6Lt5ho+keaoFHoK5woOvi2E1IBI+q0zJKWLVI
         CQ6llKoZEPjpk4GmzOjXfWhAus9dmguk1HFCcjZ+xQqjS9r9/V9nSmNYErQkkpv6n0ig
         grUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696885050; x=1697489850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A76BFNPnJ+6jsYihExtv8TvgroW23+3EsO63qGtaSNI=;
        b=Fqjefm4OR9GtHZsps+GJtfk1jJxTGN+rZgqiVRbTxFQUFnYwjT5tsC61d7MmqEt+59
         FLR96rQtXuYdi0tqLY4FC74IkfxxBnUJS4k2LEnLeWZFkTC1ZbsfmIm/srWEC6L4czmB
         dHGuFaR1uyxMHBC6H4DplT4a5tZwRuD5kz2zyLJlonPo6cIPHPiIt+W+rHtyqNEp9mRy
         l+w7hRwdtpDJOnjAnVEUKKzCCLsTMtPKZC0qy36Yye4EKTFhkuAgX4UKl8pxtD1PsRIC
         pzRrWyVA7tCIwm+jcORLHpeYCV3jZIkbesfkURRGN/K0cnJwPoqomF1Gez4gwptsCZet
         +aBw==
X-Gm-Message-State: AOJu0YyXYYZyjfapxU8FmLWRhNh0eVpcOCdc/2MF5Tt3UvK/pRorATcC
        Ho5380iiS2E7/zN9lRooedSItw==
X-Google-Smtp-Source: AGHT+IF2F5SdPHGqRpF++yDaGef6VdS+zBqWRoYdzrdYV6qgV5UguFH7QQEEFEuwHRG+fVcJjNqhqw==
X-Received: by 2002:a05:6512:108e:b0:502:9fce:b6da with SMTP id j14-20020a056512108e00b005029fceb6damr17282192lfg.21.1696885050016;
        Mon, 09 Oct 2023 13:57:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f5-20020ac251a5000000b0050300e013f3sm1540844lfk.254.2023.10.09.13.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:57:29 -0700 (PDT)
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
Subject: [PATCH 1/5] drm/msm/dsi: do not store internal bridge pointer
Date:   Mon,  9 Oct 2023 23:57:23 +0300
Message-Id: <20231009205727.2781802-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
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

Since the driver was switched to devm_drm_bridge_add(), there is no need
anymore to store the created bridge instance in struct msm_dsi. Drop
this field and pass data directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         |  8 +++++---
 drivers/gpu/drm/msm/dsi/dsi.h         |  7 ++-----
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 19 ++++++++-----------
 3 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 47f327e68471..c6d53cccb9ae 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -215,6 +215,7 @@ void __exit msm_dsi_unregister(void)
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder)
 {
+	struct drm_bridge *bridge;
 	int ret;
 
 	msm_dsi->dev = dev;
@@ -236,13 +237,14 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 
 	msm_dsi->encoder = encoder;
 
-	ret = msm_dsi_manager_bridge_init(msm_dsi);
-	if (ret) {
+	bridge = msm_dsi_manager_bridge_init(msm_dsi);
+	if (IS_ERR(bridge)) {
+		ret = PTR_ERR(bridge);
 		DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: %d\n", ret);
 		return ret;
 	}
 
-	ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
+	ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id, bridge);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dsi connector: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index a01c326774a6..269975002b95 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -35,9 +35,6 @@ struct msm_dsi {
 	struct drm_device *dev;
 	struct platform_device *pdev;
 
-	/* internal dsi bridge attached to MDP interface */
-	struct drm_bridge *bridge;
-
 	struct mipi_dsi_host *host;
 	struct msm_dsi_phy *phy;
 
@@ -56,8 +53,8 @@ struct msm_dsi {
 };
 
 /* dsi manager */
-int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
-int msm_dsi_manager_ext_bridge_init(u8 id);
+struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
+int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 17aa19bb6510..59f4728fc772 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -466,9 +466,9 @@ static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
 };
 
 /* initialize bridge */
-int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
+struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
 {
-	struct drm_bridge *bridge = NULL;
+	struct drm_bridge *bridge;
 	struct dsi_bridge *dsi_bridge;
 	struct drm_encoder *encoder;
 	int ret;
@@ -476,7 +476,7 @@ int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
 	dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
 				sizeof(*dsi_bridge), GFP_KERNEL);
 	if (!dsi_bridge)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	dsi_bridge->id = msm_dsi->id;
 
@@ -487,26 +487,23 @@ int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
 
 	ret = devm_drm_bridge_add(&msm_dsi->pdev->dev, bridge);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
-	msm_dsi->bridge = bridge;
-
-	return 0;
+	return bridge;
 }
 
-int msm_dsi_manager_ext_bridge_init(u8 id)
+int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct drm_device *dev = msm_dsi->dev;
 	struct drm_encoder *encoder;
-	struct drm_bridge *int_bridge, *ext_bridge;
+	struct drm_bridge *ext_bridge;
 	int ret;
 
-	int_bridge = msm_dsi->bridge;
 	ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
 					    msm_dsi->pdev->dev.of_node, 1, 0);
 	if (IS_ERR(ext_bridge))
-- 
2.39.2

