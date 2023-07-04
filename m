Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC477477FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 19:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbjGDRqB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 13:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbjGDRqA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 13:46:00 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A07E3
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 10:45:58 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fba74870abso6499617e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 10:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688492757; x=1691084757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLtmYKXatBp2JCqPhIqTtQESCJxKhNtCmzZEzwR81PI=;
        b=M5wSHdGR/Kh56Gj9CQVaU98PNQTHNsmIv0z12tr5iUoW0zDNHWPnrlqzRUJdlMwQFk
         yiGbVmhQuL9lioMlt8IhusGDNwV5yvqhYoak96Mgjb83T4dDQBLuBTImLRamk2yjFRyW
         9Y0s2FQicrQiwgwuwPiGPFcm6FNYQWiBlpBzgMA1tynaXWJtSdsvFTIswd28T7blUJra
         nItM5zvBYOspvQmp42r5IQQwiuUoDBj/9egj2hJyWsE9q4bLH87IgaMscPq5A4GOaQoN
         /PSUQzip0bdaZke3ISHRtlkwKMLVoTUQH4Z+rJcRePmZHe8mf/ZBJurnKYZImRxdq7H6
         zMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688492757; x=1691084757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLtmYKXatBp2JCqPhIqTtQESCJxKhNtCmzZEzwR81PI=;
        b=cPPHRtSM0En0iKQLLqeE3Faa/NA0tTMw+TBHo+79/rFr9Wl48MMs/zoxaPhrKFOMtb
         WLO+ZWr1zYQTsjuRefdVxs3wKQaYzOagK0vwAfIM5cLLuRPb05lu9Chhv2Ws/57QS+f6
         quiXVoSXGmsWGSd04ymisbEM3QsYsX/CuSYjodJ5upUNEGkxVuKwmb0j5rFSVSD317hV
         xzhd0hbfGIpbRhk3/uLwdpsa9Kk8niOeKC8LsYzeQcNhvkNxIXSbpVR4wdgGARztWeW8
         /dlyhyrI05taqVqpQmr2yVfvv0OWKddO2Fn4P0YWSd07iOb8EZQw0et4IXz+7+HuL/ae
         JVtw==
X-Gm-Message-State: ABy/qLZW8/WP3ktmsxuoDw4YGnUN0SKiN/tPPZWj8Pu7YYf9o5WFbUpy
        VF7ZJgSV1gGiu0rhy3VXyk6Htw==
X-Google-Smtp-Source: APBJJlEYMgvTt5EFoW1ynqDjrVM8LMhbKmXTaE1VO9zJ9JmJjY+PZhPyfO70+jimLkb0vnQw2cuqTQ==
X-Received: by 2002:a05:6512:34cb:b0:4f8:d385:41bd with SMTP id w11-20020a05651234cb00b004f8d38541bdmr8805063lfr.8.1688492756887;
        Tue, 04 Jul 2023 10:45:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n25-20020a195519000000b004fb6c61e79bsm4709779lfe.117.2023.07.04.10.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 10:45:56 -0700 (PDT)
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
Subject: [PATCH v4 3/4] drm/msm/mdp4: move resource allocation to the _probe function
Date:   Tue,  4 Jul 2023 20:45:52 +0300
Message-Id: <20230704174553.216248-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704174553.216248-1-dmitry.baryshkov@linaro.org>
References: <20230704174553.216248-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To let the probe function bail early if any of the resources is
unavailable, move resource allocattion from kms_init directly to the
probe callback. While we are at it, replace irq_of_parse_and_map() with
platform_get_irq().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 +++++++++++------------
 1 file changed, 51 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index e57a1e5f9da0..a3f1da3382e8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -135,8 +135,6 @@ static void mdp4_destroy(struct msm_kms *kms)
 		pm_runtime_disable(dev);
 
 	mdp_kms_destroy(&mdp4_kms->base);
-
-	kfree(mdp4_kms);
 }
 
 static const struct mdp_kms_funcs kms_funcs = {
@@ -380,57 +378,27 @@ static int mdp4_kms_init(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct msm_drm_private *priv = dev->dev_private;
-	struct mdp4_kms *mdp4_kms;
+	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
 	struct msm_kms *kms = NULL;
 	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
-	int irq, ret;
+	int ret;
 	u32 major, minor;
 	unsigned long max_clk;
 
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	max_clk = 266667000;
 
-	mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
-	if (!mdp4_kms) {
-		DRM_DEV_ERROR(dev->dev, "failed to allocate kms\n");
-		return -ENOMEM;
-	}
-
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
 		goto fail;
 	}
 
-	priv->kms = &mdp4_kms->base.base;
 	kms = priv->kms;
 
 	mdp4_kms->dev = dev;
 
-	mdp4_kms->mmio = msm_ioremap(pdev, NULL);
-	if (IS_ERR(mdp4_kms->mmio)) {
-		ret = PTR_ERR(mdp4_kms->mmio);
-		goto fail;
-	}
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		DRM_DEV_ERROR(dev->dev, "failed to get irq: %d\n", ret);
-		goto fail;
-	}
-
-	kms->irq = irq;
-
-	/* NOTE: driver for this regulator still missing upstream.. use
-	 * _get_exclusive() and ignore the error if it does not exist
-	 * (and hope that the bootloader left it on for us)
-	 */
-	mdp4_kms->vdd = devm_regulator_get_exclusive(&pdev->dev, "vdd");
-	if (IS_ERR(mdp4_kms->vdd))
-		mdp4_kms->vdd = NULL;
-
 	if (mdp4_kms->vdd) {
 		ret = regulator_enable(mdp4_kms->vdd);
 		if (ret) {
@@ -439,24 +407,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 		}
 	}
 
-	mdp4_kms->clk = devm_clk_get(&pdev->dev, "core_clk");
-	if (IS_ERR(mdp4_kms->clk)) {
-		DRM_DEV_ERROR(dev->dev, "failed to get core_clk\n");
-		ret = PTR_ERR(mdp4_kms->clk);
-		goto fail;
-	}
-
-	mdp4_kms->pclk = devm_clk_get(&pdev->dev, "iface_clk");
-	if (IS_ERR(mdp4_kms->pclk))
-		mdp4_kms->pclk = NULL;
-
-	mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
-	if (IS_ERR(mdp4_kms->axi_clk)) {
-		DRM_DEV_ERROR(dev->dev, "failed to get axi_clk\n");
-		ret = PTR_ERR(mdp4_kms->axi_clk);
-		goto fail;
-	}
-
 	clk_set_rate(mdp4_kms->clk, max_clk);
 
 	read_mdp_hw_revision(mdp4_kms, &major, &minor);
@@ -471,10 +421,9 @@ static int mdp4_kms_init(struct drm_device *dev)
 	mdp4_kms->rev = minor;
 
 	if (mdp4_kms->rev >= 2) {
-		mdp4_kms->lut_clk = devm_clk_get(&pdev->dev, "lut_clk");
-		if (IS_ERR(mdp4_kms->lut_clk)) {
+		if (!mdp4_kms->lut_clk) {
 			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
-			ret = PTR_ERR(mdp4_kms->lut_clk);
+			ret = -ENODEV;
 			goto fail;
 		}
 		clk_set_rate(mdp4_kms->lut_clk, max_clk);
@@ -558,7 +507,53 @@ static const struct dev_pm_ops mdp4_pm_ops = {
 
 static int mdp4_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, mdp4_kms_init, NULL);
+	struct device *dev = &pdev->dev;
+	struct mdp4_kms *mdp4_kms;
+	int irq;
+
+	mdp4_kms = devm_kzalloc(dev, sizeof(*mdp4_kms), GFP_KERNEL);
+	if (!mdp4_kms)
+		return dev_err_probe(dev, -ENOMEM, "failed to allocate kms\n");
+
+	mdp4_kms->mmio = msm_ioremap(pdev, NULL);
+	if (IS_ERR(mdp4_kms->mmio))
+		return PTR_ERR(mdp4_kms->mmio);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "failed to get irq\n");
+
+	mdp4_kms->base.base.irq = irq;
+
+	/* NOTE: driver for this regulator still missing upstream.. use
+	 * _get_exclusive() and ignore the error if it does not exist
+	 * (and hope that the bootloader left it on for us)
+	 */
+	mdp4_kms->vdd = devm_regulator_get_exclusive(&pdev->dev, "vdd");
+	if (IS_ERR(mdp4_kms->vdd))
+		mdp4_kms->vdd = NULL;
+
+	mdp4_kms->clk = devm_clk_get(&pdev->dev, "core_clk");
+	if (IS_ERR(mdp4_kms->clk))
+		return dev_err_probe(dev, PTR_ERR(mdp4_kms->clk), "failed to get core_clk\n");
+
+	mdp4_kms->pclk = devm_clk_get(&pdev->dev, "iface_clk");
+	if (IS_ERR(mdp4_kms->pclk))
+		mdp4_kms->pclk = NULL;
+
+	mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
+	if (IS_ERR(mdp4_kms->axi_clk))
+		return dev_err_probe(dev, PTR_ERR(mdp4_kms->axi_clk), "failed to get axi_clk\n");
+
+	/*
+	 * This is required for revn >= 2. Handle errors here and let the kms
+	 * init bail out if the clock is not provided.
+	 */
+	mdp4_kms->lut_clk = devm_clk_get_optional(&pdev->dev, "lut_clk");
+	if (IS_ERR(mdp4_kms->lut_clk))
+		return dev_err_probe(dev, PTR_ERR(mdp4_kms->lut_clk), "failed to get lut_clk\n");
+
+	return msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base.base);
 }
 
 static int mdp4_remove(struct platform_device *pdev)
-- 
2.39.2

