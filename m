Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 420B0747800
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 19:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbjGDRqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 13:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjGDRqA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 13:46:00 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50EBB10D7
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 10:45:59 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso6086025e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 10:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688492757; x=1691084757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cq361WQvKwVqcRhufIcUtyn4OTZxaeJsGxBGpt0ut4M=;
        b=RmZaSCRwC3f5Td1ec785rzY2U9dq0a9UbOX3/qsLSZiS+zjluov7Cxd+3UW14pcXlJ
         15axgdX996cq+vI9ik9iq6UwIHBViWRn79cA4XV5CS0iDOnjuDKa1dn+7YquKP+NR3S0
         PYRU4MIc5vPtNx2ve43VaxSSCPQDDG0IvgMevKJC8VwEfD/LwYEw1rKbLtHWFTJrDs2S
         A6imxMWkOn+N3zjoM/azVuMAC10e50eiYU2dd03cTnXOhgtfvanw8ROY3dM+5vsZSbGH
         N4Og5rDcXP2wvQmjzyebf60DWIrR7exReDX+OLCONYxDr3SaK3klYshFgM/4JuLes4Xl
         +VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688492757; x=1691084757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cq361WQvKwVqcRhufIcUtyn4OTZxaeJsGxBGpt0ut4M=;
        b=fJh3HyayCVZ2qc55d9eRNPiAnk/1OcPzfHfy+C362Gk1d3tIMoTSwre+1bCk6fVXV5
         x19rWjZaqQMs7S0lCCckoVKxY3A9+WUIvN6F349zaFBw+z8T4ZbpMJVdVonssXsfcveX
         PAmVT5eaZ9ieQs2/GwVKfMolkhzGVQYECxXCvUpX14+bORUfJJr6tHROLnRL3UxYkRzI
         ABGr289nSSQIiF5kgcGW6TeqvRdYQw2nPI6n6MDV2143PjuovjJaaPcdlkFAqm53vEqx
         q3a3vkdpq3DNtJZU7pZKW311b1Cr8xxdJZ3NwnvmMK9qYSOCvdpEfki6UqfTVT1VNc1E
         MHOw==
X-Gm-Message-State: ABy/qLatO2fxQ+8321RSO8BaauRUTxcR6frbJIK4GLFGWDX9BK7I2NDh
        T+s0Jzyc9hzDhXSt8dNqXKDUWQ==
X-Google-Smtp-Source: APBJJlFUl00WT8jzitBemmiM1JfL7aZEEnyTzC7J0Eu8HDfCZLRVLU6X7aT/bRGwEtUVrBQ3mE3pZw==
X-Received: by 2002:a05:6512:1590:b0:4fb:7666:3bbf with SMTP id bp16-20020a056512159000b004fb76663bbfmr11483586lfb.26.1688492757635;
        Tue, 04 Jul 2023 10:45:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n25-20020a195519000000b004fb6c61e79bsm4709779lfe.117.2023.07.04.10.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 10:45:57 -0700 (PDT)
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
Subject: [PATCH v4 4/4] drm/msm/mdp5: move resource allocation to the _probe function
Date:   Tue,  4 Jul 2023 20:45:53 +0300
Message-Id: <20230704174553.216248-5-dmitry.baryshkov@linaro.org>
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
probe callback.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 ++++++++++-------------
 1 file changed, 44 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 83a5b3bd09d9..52f176e08690 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -554,20 +554,16 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct platform_device *pdev;
 	struct mdp5_kms *mdp5_kms;
 	struct mdp5_cfg *config;
-	struct msm_kms *kms;
+	struct msm_kms *kms = priv->kms;
 	struct msm_gem_address_space *aspace;
-	int irq, i, ret;
+	int i, ret;
 
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
 
-	/* priv->kms would have been populated by the MDP5 driver */
-	kms = priv->kms;
-	if (!kms)
-		return -ENOMEM;
-
 	mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+
 	pdev = mdp5_kms->pdev;
 
 	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
@@ -576,15 +572,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (!irq) {
-		ret = -EINVAL;
-		DRM_DEV_ERROR(&pdev->dev, "failed to get irq\n");
-		goto fail;
-	}
-
-	kms->irq = irq;
-
 	config = mdp5_cfg_get_config(mdp5_kms->cfg);
 
 	/* make sure things are off before attaching iommu (bootloader could
@@ -787,60 +774,23 @@ static int interface_init(struct mdp5_kms *mdp5_kms)
 static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct mdp5_kms *mdp5_kms;
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	struct mdp5_cfg *config;
 	u32 major, minor;
 	int ret;
 
-	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
-	if (!mdp5_kms) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	spin_lock_init(&mdp5_kms->resource_lock);
-
 	mdp5_kms->dev = dev;
-	mdp5_kms->pdev = pdev;
 
 	ret = mdp5_global_obj_init(mdp5_kms);
 	if (ret)
 		goto fail;
 
-	mdp5_kms->mmio = msm_ioremap(pdev, "mdp_phys");
-	if (IS_ERR(mdp5_kms->mmio)) {
-		ret = PTR_ERR(mdp5_kms->mmio);
-		goto fail;
-	}
-
-	/* mandatory clocks: */
-	ret = get_clk(pdev, &mdp5_kms->axi_clk, "bus", true);
-	if (ret)
-		goto fail;
-	ret = get_clk(pdev, &mdp5_kms->ahb_clk, "iface", true);
-	if (ret)
-		goto fail;
-	ret = get_clk(pdev, &mdp5_kms->core_clk, "core", true);
-	if (ret)
-		goto fail;
-	ret = get_clk(pdev, &mdp5_kms->vsync_clk, "vsync", true);
-	if (ret)
-		goto fail;
-
-	/* optional clocks: */
-	get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
-	get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
-	get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
-
 	/* we need to set a default rate before enabling.  Set a safe
 	 * rate first, then figure out hw revision, and then set a
 	 * more optimal rate:
 	 */
 	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
-	/* set uninit-ed kms */
-	priv->kms = &mdp5_kms->base.base;
-
 	pm_runtime_enable(&pdev->dev);
 	mdp5_kms->rpm_enabled = true;
 
@@ -931,15 +881,53 @@ static int mdp5_setup_interconnect(struct platform_device *pdev)
 
 static int mdp5_dev_probe(struct platform_device *pdev)
 {
-	int ret;
+	struct mdp5_kms *mdp5_kms;
+	int ret, irq;
 
 	DBG("");
 
+	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
+	if (!mdp5_kms)
+		return -ENOMEM;
+
 	ret = mdp5_setup_interconnect(pdev);
 	if (ret)
 		return ret;
 
-	return msm_drv_probe(&pdev->dev, mdp5_kms_init, NULL);
+	mdp5_kms->pdev = pdev;
+
+	spin_lock_init(&mdp5_kms->resource_lock);
+
+	mdp5_kms->mmio = msm_ioremap(pdev, "mdp_phys");
+	if (IS_ERR(mdp5_kms->mmio))
+		return PTR_ERR(mdp5_kms->mmio);
+
+	/* mandatory clocks: */
+	ret = get_clk(pdev, &mdp5_kms->axi_clk, "bus", true);
+	if (ret)
+		return ret;
+	ret = get_clk(pdev, &mdp5_kms->ahb_clk, "iface", true);
+	if (ret)
+		return ret;
+	ret = get_clk(pdev, &mdp5_kms->core_clk, "core", true);
+	if (ret)
+		return ret;
+	ret = get_clk(pdev, &mdp5_kms->vsync_clk, "vsync", true);
+	if (ret)
+		return ret;
+
+	/* optional clocks: */
+	get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
+	get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
+	get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(&pdev->dev, irq, "failed to get irq\n");
+
+	mdp5_kms->base.base.irq = irq;
+
+	return msm_drv_probe(&pdev->dev, mdp5_kms_init, &mdp5_kms->base.base);
 }
 
 static int mdp5_dev_remove(struct platform_device *pdev)
-- 
2.39.2

