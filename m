Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478AC54DC63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 10:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349996AbiFPIAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 04:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359599AbiFPH77 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 03:59:59 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A500B5D66D
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 00:59:53 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t25so1007838lfg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AgOSkrPIYoBDMzG4cyHJtHcGXpejPm8w4QHyK13FbtQ=;
        b=WPe6RPswOW14YrtL1U3vVnSC+zHIG5r+J2UR1qowO27HCJdwWuhq4DjhBI11yRst1M
         yDQBlTo/ZLny38L0WWCdLoLux9+AKAoPxyLMWIzssfPQA3ALGiEkXfiTFdcki0F+M70u
         /CqYq408bf7LO96hnv9/S5HrwnVEwvFWjp2W4WkcnNfzkI/CogW6hKKjBjdKc+5NygZ+
         MTtTfC6ODGjuygVLz/V4n1ik1VYk8hoNwIytNQO7qJW2An4WWYcTI0e77Sus2aT0uByd
         YG3XDxxj3gBCjE6yhn8gPK8fPa21uwkq3t9/6Ivt8TDxgfxCID0p9vQhE39/vjv1VTby
         Jd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AgOSkrPIYoBDMzG4cyHJtHcGXpejPm8w4QHyK13FbtQ=;
        b=E8G02k0NbmDMsrweZ5hBDHl5aGFsV37YAT3WqE2VAVx+PUpHbDc/3gR3r1y2y7eCQN
         uglegjroUDRrJAJfNv437okl87TSdqNdglGtvTKtTs0FosfINhvDpBgmllz+rNuxLyVo
         5VQFY2qiVqpfKKr9MD2msDxfM8jYoXXZXoNSsa/5V74e57TeNr2Rw2nDjn4pPvdr2Jpa
         oD+y1zdFJDd7DO4ezyGzdtahVz/wzMy2Io/oo0HQ5cjAwyaAwCB3dUZ6J5Vc8SRz59D5
         OFUPzErZRebJg+enf4fj2yxAQE5liCcBlNNgD04e6zNtx3B2OCUTFQsrmRyIbmuZHrJp
         GM1A==
X-Gm-Message-State: AJIora8/CSiH+9zaCrwQHYmuGEEpngN6E/EWn77RrX5RlglQLvgsZ7uG
        u0zRfGP3l8wJDgm3N0sFGOLXLw==
X-Google-Smtp-Source: AGRyM1sZE1SfufdgKsER1eU478+kAIuJBYttRIcZqRStKfunQgSFah8AKupF0Pi2U3MWwdRJdFvwEA==
X-Received: by 2002:a05:6512:3a8e:b0:479:d8f:1a0c with SMTP id q14-20020a0565123a8e00b004790d8f1a0cmr1897721lfu.227.1655366391862;
        Thu, 16 Jun 2022 00:59:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d3-20020a056512368300b00478ff020832sm136717lfs.106.2022.06.16.00.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 00:59:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/hdmi: move resource allocation to probe function
Date:   Thu, 16 Jun 2022 10:59:47 +0300
Message-Id: <20220616075947.347888-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
References: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/hdmi/hdmi.c | 295 +++++++++++++++-----------------
 1 file changed, 134 insertions(+), 161 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 8dfe5690366b..429abd622c81 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -75,8 +75,6 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
 
 	if (hdmi->i2c)
 		msm_hdmi_i2c_destroy(hdmi->i2c);
-
-	platform_set_drvdata(hdmi->pdev, NULL);
 }
 
 static int msm_hdmi_get_phy(struct hdmi *hdmi)
@@ -116,138 +114,10 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
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
 
@@ -271,13 +141,13 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
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
@@ -318,13 +188,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 
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
@@ -344,8 +207,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 
 	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
 
-	platform_set_drvdata(pdev, hdmi);
-
 	return 0;
 
 fail:
@@ -373,7 +234,7 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 static const char *hpd_reg_names_8960[] = {"core-vdda"};
 static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
-static struct hdmi_platform_config hdmi_tx_8960_config = {
+const static struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(hpd_reg, 8960),
 		HDMI_CFG(hpd_clk, 8960),
 };
@@ -383,7 +244,7 @@ static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
 static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
 static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
 
-static struct hdmi_platform_config hdmi_tx_8974_config = {
+const static struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
@@ -498,23 +359,12 @@ static int msm_hdmi_register_audio_driver(struct hdmi *hdmi, struct device *dev)
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
@@ -547,6 +397,129 @@ static const struct component_ops msm_hdmi_ops = {
 
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

