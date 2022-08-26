Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8595A24A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 11:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343678AbiHZJjg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 05:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343830AbiHZJjf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 05:39:35 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0A19DB41
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:39:33 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id s1so1282339lfp.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=yN51z3L37xg9k1dPcMKg59FVaQzj5cOVbXNla1FnXzY=;
        b=HRVrAWFxauQEuhOpIb07WBC0BbEtL48koCql+EETTUWXWQ9+RXiLqCABdikbgMdHv2
         rUuU388UI8ziibFs8usCB7r1vxTp836bqI7gBxe3bPy/yTGmHbUB37ac9kiFp0TNm65I
         5tT9UdLPQSfWpe2ZUWnjPM2JqnV3lxuPDbOogFerDI+02X4qKMxK5zP8rECuSEil0LkZ
         xu/h/CHF2jSwH2YSIV0qHqsMWy7Lp5CDm3RZWgSOFH0loYtF7SaVA0xgOmp81sBHpNav
         VQxzFhmVK5hyLlWh828iAwy0Tm23YEEFUWakjtmWORxRqXRjvoDl8Y+iIeQhhG2IU8Ny
         ylnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=yN51z3L37xg9k1dPcMKg59FVaQzj5cOVbXNla1FnXzY=;
        b=EEMyT1XRwOZumQeb3lCNAua5X3UjnC6MkZ0favDxRJKYT8K9p98+pV/nKMWmvy/dB/
         lsku602WwUE/pNCecN7HuQyFYUbeCjxbKLhyGL3gHAZt3hsyUTIgDnxhap9UzMKG5E1h
         hYR3OCubarMzpTx81D2hcgbzMhKf3mbyxH8EUvCKWH6WRBFgYFKKzrsH/tuAeoRr+AMJ
         s/wjWf90GRgiT+YLwiAXJAXBGxYOg1PEP0JKcH01/QOlAFNcMDoSCxVzIR1fu/DIVoEb
         MLZpdi/vy8ui1IRWSFsO4UkXoW3AntoHSWvFMUJahGVJzy7L4EnM5hmuj2lQHSL8hV73
         UEhw==
X-Gm-Message-State: ACgBeo12GhjPCPSSpptkX6m5GCj0fUh7bsaKJe8hTm1UWyP8zf3bMagm
        hZb7X4cQ2UMbIBlBiIeyi8pMhA==
X-Google-Smtp-Source: AA6agR4FMVhUYbyKFeevY/leOuSUqG+rtv/P4Q3AcO4JwXUrrUXyFfSMbL5X9NssuHt8w7V5Pn71EA==
X-Received: by 2002:ac2:4e8d:0:b0:493:ac:7dbd with SMTP id o13-20020ac24e8d000000b0049300ac7dbdmr2130469lfr.688.1661506772226;
        Fri, 26 Aug 2022 02:39:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m6-20020a195206000000b004886508ca5csm329055lfb.68.2022.08.26.02.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 02:39:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/msm/hdmi: move resource allocation to probe function
Date:   Fri, 26 Aug 2022 12:39:25 +0300
Message-Id: <20220826093927.851597-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
References: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than having all resource allocation happen in the _bind function
(resulting in possible EPROBE_DEFER returns and component bind/unbind
cycles) allocate and check all resources in _probe function. While we
are at it, use platform_get_irq() to get the IRQ rather than going
through the irq_of_parse_and_map().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 303 +++++++++++++++-----------------
 1 file changed, 138 insertions(+), 165 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 4a364d8f4c0b..c298a36f3b42 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -76,8 +76,6 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
 
 	if (hdmi->i2c)
 		msm_hdmi_i2c_destroy(hdmi->i2c);
-
-	platform_set_drvdata(hdmi->pdev, NULL);
 }
 
 static int msm_hdmi_get_phy(struct hdmi *hdmi)
@@ -117,142 +115,10 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
  * we are to EPROBE_DEFER we want to do it here, rather than later
  * at modeset_init() time
  */
-static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
+static int msm_hdmi_init(struct hdmi *hdmi)
 {
-	struct hdmi_platform_config *config = pdev->dev.platform_data;
-	struct hdmi *hdmi = NULL;
-	struct resource *res;
-	int i, ret;
-
-	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	hdmi->pdev = pdev;
-	hdmi->config = config;
-	spin_lock_init(&hdmi->reg_lock);
-
-	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
-	if (ret && ret != -ENODEV)
-		goto fail;
-
-	hdmi->mmio = msm_ioremap(pdev, "core_physical");
-	if (IS_ERR(hdmi->mmio)) {
-		ret = PTR_ERR(hdmi->mmio);
-		goto fail;
-	}
-
-	/* HDCP needs physical address of hdmi register */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-		"core_physical");
-	if (!res) {
-		ret = -EINVAL;
-		goto fail;
-	}
-	hdmi->mmio_phy_addr = res->start;
-
-	hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
-	if (IS_ERR(hdmi->qfprom_mmio)) {
-		DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
-		hdmi->qfprom_mmio = NULL;
-	}
-
-	hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
-				      config->hpd_reg_cnt,
-				      sizeof(hdmi->hpd_regs[0]),
-				      GFP_KERNEL);
-	if (!hdmi->hpd_regs) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-	for (i = 0; i < config->hpd_reg_cnt; i++)
-		hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
-
-	ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: %d\n", ret);
-		goto fail;
-	}
-
-	hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
-				      config->pwr_reg_cnt,
-				      sizeof(hdmi->pwr_regs[0]),
-				      GFP_KERNEL);
-	if (!hdmi->pwr_regs) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	for (i = 0; i < config->pwr_reg_cnt; i++)
-		hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
-
-	ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, hdmi->pwr_regs);
-	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to get pwr regulator: %d\n", ret);
-		goto fail;
-	}
-
-	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
-				      config->hpd_clk_cnt,
-				      sizeof(hdmi->hpd_clks[0]),
-				      GFP_KERNEL);
-	if (!hdmi->hpd_clks) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-	for (i = 0; i < config->hpd_clk_cnt; i++) {
-		struct clk *clk;
-
-		clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
-		if (IS_ERR(clk)) {
-			ret = PTR_ERR(clk);
-			DRM_DEV_ERROR(&pdev->dev, "failed to get hpd clk: %s (%d)\n",
-					config->hpd_clk_names[i], ret);
-			goto fail;
-		}
-
-		hdmi->hpd_clks[i] = clk;
-	}
-
-	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
-				      config->pwr_clk_cnt,
-				      sizeof(hdmi->pwr_clks[0]),
-				      GFP_KERNEL);
-	if (!hdmi->pwr_clks) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-	for (i = 0; i < config->pwr_clk_cnt; i++) {
-		struct clk *clk;
-
-		clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
-		if (IS_ERR(clk)) {
-			ret = PTR_ERR(clk);
-			DRM_DEV_ERROR(&pdev->dev, "failed to get pwr clk: %s (%d)\n",
-					config->pwr_clk_names[i], ret);
-			goto fail;
-		}
-
-		hdmi->pwr_clks[i] = clk;
-	}
-
-	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
-	/* This will catch e.g. -EPROBE_DEFER */
-	if (IS_ERR(hdmi->hpd_gpiod)) {
-		ret = PTR_ERR(hdmi->hpd_gpiod);
-		DRM_DEV_ERROR(&pdev->dev, "failed to get hpd gpio: (%d)\n", ret);
-		goto fail;
-	}
-
-	if (!hdmi->hpd_gpiod)
-		DBG("failed to get HPD gpio");
-
-	if (hdmi->hpd_gpiod)
-		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
-
-	devm_pm_runtime_enable(&pdev->dev);
+	struct platform_device *pdev = hdmi->pdev;
+	int ret;
 
 	hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
 
@@ -276,13 +142,13 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 		hdmi->hdcp_ctrl = NULL;
 	}
 
-	return hdmi;
+	return 0;
 
 fail:
 	if (hdmi)
 		msm_hdmi_destroy(hdmi);
 
-	return ERR_PTR(ret);
+	return ret;
 }
 
 /* Second part of initialization, the drm/kms level modeset_init,
@@ -332,13 +198,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 
 	drm_connector_attach_encoder(hdmi->connector, hdmi->encoder);
 
-	hdmi->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (!hdmi->irq) {
-		ret = -EINVAL;
-		DRM_DEV_ERROR(dev->dev, "failed to get irq\n");
-		goto fail;
-	}
-
 	ret = devm_request_irq(&pdev->dev, hdmi->irq,
 			msm_hdmi_irq, IRQF_TRIGGER_HIGH,
 			"hdmi_isr", hdmi);
@@ -358,8 +217,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 
 	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
 
-	platform_set_drvdata(pdev, hdmi);
-
 	return 0;
 
 fail:
@@ -387,7 +244,7 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 static const char *hpd_reg_names_8960[] = {"core-vdda"};
 static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
-static struct hdmi_platform_config hdmi_tx_8960_config = {
+const static struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(hpd_reg, 8960),
 		HDMI_CFG(hpd_clk, 8960),
 };
@@ -397,7 +254,7 @@ static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
 static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
 static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
 
-static struct hdmi_platform_config hdmi_tx_8974_config = {
+const static struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
@@ -512,23 +369,12 @@ static int msm_hdmi_register_audio_driver(struct hdmi *hdmi, struct device *dev)
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(master);
-	struct hdmi_platform_config *hdmi_cfg;
-	struct hdmi *hdmi;
-	struct device_node *of_node = dev->of_node;
+	struct hdmi *hdmi = dev_get_drvdata(dev);
 	int err;
 
-	hdmi_cfg = (struct hdmi_platform_config *)
-			of_device_get_match_data(dev);
-	if (!hdmi_cfg) {
-		DRM_DEV_ERROR(dev, "unknown hdmi_cfg: %pOFn\n", of_node);
-		return -ENXIO;
-	}
-
-	dev->platform_data = hdmi_cfg;
-
-	hdmi = msm_hdmi_init(to_platform_device(dev));
-	if (IS_ERR(hdmi))
-		return PTR_ERR(hdmi);
+	err = msm_hdmi_init(hdmi);
+	if (err)
+		return err;
 	priv->hdmi = hdmi;
 
 	err = msm_hdmi_register_audio_driver(hdmi, dev);
@@ -561,6 +407,133 @@ static const struct component_ops msm_hdmi_ops = {
 
 static int msm_hdmi_dev_probe(struct platform_device *pdev)
 {
+	const struct hdmi_platform_config *config;
+	struct device *dev = &pdev->dev;
+	struct hdmi *hdmi;
+	struct resource *res;
+	int i, ret;
+
+	config = of_device_get_match_data(dev);
+	if (!config)
+		return -EINVAL;
+
+	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	hdmi->pdev = pdev;
+	hdmi->config = config;
+	spin_lock_init(&hdmi->reg_lock);
+
+	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
+	if (ret && ret != -ENODEV)
+		return ret;
+
+	hdmi->mmio = msm_ioremap(pdev, "core_physical");
+	if (IS_ERR(hdmi->mmio))
+		return PTR_ERR(hdmi->mmio);
+
+	/* HDCP needs physical address of hdmi register */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+		"core_physical");
+	if (!res)
+		return -EINVAL;
+	hdmi->mmio_phy_addr = res->start;
+
+	hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
+	if (IS_ERR(hdmi->qfprom_mmio)) {
+		DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
+		hdmi->qfprom_mmio = NULL;
+	}
+
+	hdmi->irq = platform_get_irq(pdev, 0);
+	if (hdmi->irq < 0)
+		return hdmi->irq;
+
+	hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
+				      config->hpd_reg_cnt,
+				      sizeof(hdmi->hpd_regs[0]),
+				      GFP_KERNEL);
+	if (!hdmi->hpd_regs)
+		return -ENOMEM;
+
+	for (i = 0; i < config->hpd_reg_cnt; i++)
+		hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
+
+	ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, hdmi->hpd_regs);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get hpd regulators\n");
+
+	hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
+				      config->pwr_reg_cnt,
+				      sizeof(hdmi->pwr_regs[0]),
+				      GFP_KERNEL);
+	if (!hdmi->pwr_regs)
+		return -ENOMEM;
+
+	for (i = 0; i < config->pwr_reg_cnt; i++)
+		hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
+
+	ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, hdmi->pwr_regs);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get pwr regulators\n");
+
+	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
+				      config->hpd_clk_cnt,
+				      sizeof(hdmi->hpd_clks[0]),
+				      GFP_KERNEL);
+	if (!hdmi->hpd_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < config->hpd_clk_cnt; i++) {
+		struct clk *clk;
+
+		clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
+		if (IS_ERR(clk))
+			return dev_err_probe(dev, PTR_ERR(clk),
+					     "failed to get hpd clk: %s\n",
+					     config->hpd_clk_names[i]);
+
+		hdmi->hpd_clks[i] = clk;
+	}
+
+	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
+				      config->pwr_clk_cnt,
+				      sizeof(hdmi->pwr_clks[0]),
+				      GFP_KERNEL);
+	if (!hdmi->pwr_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < config->pwr_clk_cnt; i++) {
+		struct clk *clk;
+
+		clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
+		if (IS_ERR(clk))
+			return dev_err_probe(dev, PTR_ERR(clk),
+					     "failed to get pwr clk: %s\n",
+					     config->pwr_clk_names[i]);
+
+		hdmi->pwr_clks[i] = clk;
+	}
+
+	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
+	/* This will catch e.g. -EPROBE_DEFER */
+	if (IS_ERR(hdmi->hpd_gpiod))
+		return dev_err_probe(dev, PTR_ERR(hdmi->hpd_gpiod),
+				     "failed to get hpd gpio\n");
+
+	if (!hdmi->hpd_gpiod)
+		DBG("failed to get HPD gpio");
+
+	if (hdmi->hpd_gpiod)
+		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, hdmi);
+
 	return component_add(&pdev->dev, &msm_hdmi_ops);
 }
 
-- 
2.35.1

