Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE0F33C34CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 16:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhGJOEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 10:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhGJOEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 10:04:23 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BBEC0613DD
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 07:01:37 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id e20so13374287ljn.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 07:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dkbuvydLh1tNR6vGgtgf1nG349bm9CLolZfbIxwL9UA=;
        b=Njsx3/m1k526vnM1o6yKejwVh5KlhY6RFe6bJnMBq4I84IdVKMJ7sut39u5NfFuh1Q
         0aVPGzH+sDeMKS5rD3DtsViXM32V/ojwmfhM9sFlVxiTwEuIcXvfBUL37UFH7QriThnL
         AajJ5U+dgaKV1eXi7b9WiKP45XQeUP2ow5YN5dzfNv/GfdSAEi1klM4JXLTFXY3Ay/B9
         orq7h3LWPt6A8xASl9JzCK+dhGuMP08qXtus6bIskNvAisO0cIgTKcDPgHR5N8wLHv/N
         TZuNJBXuYHDwPupe8jtL0S3hV77WXADi+SRuKDIFHf8M2uA0B9UAoCy9BCbZC2qqcbVY
         gvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dkbuvydLh1tNR6vGgtgf1nG349bm9CLolZfbIxwL9UA=;
        b=akK6Hs8g4ehtryX5RA24Igf705bogz1/jbJWjsgNUfzHtNEAUK0t2oEeop25kYtiVy
         R9tXODewpJBIB1GSMDUYnuAZpM1WEVXAXlPG3W8jeXUpRKl/yZD8slWIdT6f/dREycoM
         u3hzO3qwGpOsBuK6zzeY5e4D3ROx4voptHyzLvXA5+XYfwlKA5tzn6OTEFg4a0QJm3ET
         xKRTICWzAn7wAIyttS8/83X28lWG1YxKNANNp/vG2kup66Juuj0Y1RAgwx8013iaT1+w
         fQgu8VB9keMV8JmZjlJliMY2lwxR8h4BGZ0LXdlApzh3r6u7EVttRAE3Q7+WlqrIk6qN
         nr/g==
X-Gm-Message-State: AOAM5321n0Qx0Ug//tEQA7FV4eVqXyaylOg1vyWX8ZFJFvjl6GZtk15g
        tIwi21RqD+1X16WNposMWklamQ==
X-Google-Smtp-Source: ABdhPJwXerIAG0Cjgpusop3O0+c/6fIZpaKnuLjgXUq5fJaxcgxycnUhpx7rTbmauJ/JsXP2G7hTBA==
X-Received: by 2002:a05:651c:150a:: with SMTP id e10mr35084576ljf.215.1625925695727;
        Sat, 10 Jul 2021 07:01:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o17sm716111lfr.253.2021.07.10.07.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 07:01:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 2/2] clk: qcom: move pm_clk functionality into common code
Date:   Sat, 10 Jul 2021 17:01:30 +0300
Message-Id: <20210710140130.1176657-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710140130.1176657-1-dmitry.baryshkov@linaro.org>
References: <20210710140130.1176657-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several Qualcomm clock controller drivers use pm_clk functionality.
Instead of having common code in all the drivers, move the pm_clk
handling to the qcom_cc_map/qcom_cc_probe.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/camcc-sc7180.c       |  44 ++--------
 drivers/clk/qcom/common.c             | 113 +++++++++++++++++++++++---
 drivers/clk/qcom/common.h             |   6 ++
 drivers/clk/qcom/lpasscorecc-sc7180.c |  56 +++----------
 drivers/clk/qcom/mss-sc7180.c         |  40 ++-------
 drivers/clk/qcom/q6sstop-qcs404.c     |  36 ++------
 drivers/clk/qcom/turingcc-qcs404.c    |  34 ++------
 7 files changed, 142 insertions(+), 187 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index 9bcf2f8ed4de..1c6c1b7fab51 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -9,7 +9,6 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,camcc-sc7180.h>
@@ -1631,8 +1630,12 @@ static const struct regmap_config cam_cc_sc7180_regmap_config = {
 	.fast_io = true,
 };
 
+static const char * const cam_cc_sc7180_pm_clks[] = { "xo", "iface" };
+
 static const struct qcom_cc_desc cam_cc_sc7180_desc = {
 	.config = &cam_cc_sc7180_regmap_config,
+	.pm_clks = cam_cc_sc7180_pm_clks,
+	.num_pm_clks = ARRAY_SIZE(cam_cc_sc7180_pm_clks),
 	.clk_hws = cam_cc_sc7180_hws,
 	.num_clk_hws = ARRAY_SIZE(cam_cc_sc7180_hws),
 	.clks = cam_cc_sc7180_clocks,
@@ -1652,33 +1655,9 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
-	pm_runtime_enable(&pdev->dev);
-	ret = pm_clk_create(&pdev->dev);
-	if (ret < 0)
-		return ret;
-
-	ret = pm_clk_add(&pdev->dev, "xo");
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to acquire XO clock\n");
-		goto disable_pm_runtime;
-	}
-
-	ret = pm_clk_add(&pdev->dev, "iface");
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to acquire iface clock\n");
-		goto disable_pm_runtime;
-	}
-
-	ret = pm_runtime_get(&pdev->dev);
-	if (ret)
-		goto destroy_pm_clk;
-
 	regmap = qcom_cc_map(pdev, &cam_cc_sc7180_desc);
-	if (IS_ERR(regmap)) {
-		ret = PTR_ERR(regmap);
-		pm_runtime_put(&pdev->dev);
-		goto destroy_pm_clk;
-	}
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
 	clk_fabia_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
 	clk_fabia_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
@@ -1686,21 +1665,12 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
 	clk_fabia_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
 
 	ret = qcom_cc_really_probe(pdev, &cam_cc_sc7180_desc, regmap);
-	pm_runtime_put(&pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register CAM CC clocks\n");
-		goto destroy_pm_clk;
+		return 0;
 	}
 
 	return 0;
-
-destroy_pm_clk:
-	pm_clk_destroy(&pdev->dev);
-
-disable_pm_runtime:
-	pm_runtime_disable(&pdev->dev);
-
-	return ret;
 }
 
 static const struct dev_pm_ops cam_cc_pm_ops = {
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index ed7c516a597a..e1d34561cab7 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -7,6 +7,8 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <linux/clk-provider.h>
 #include <linux/reset-controller.h>
 #include <linux/of.h>
@@ -69,12 +71,86 @@ int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map, u8 src)
 }
 EXPORT_SYMBOL_GPL(qcom_find_src_index);
 
+static void qcom_cc_pm_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
+static void qcom_cc_pm_clk_destroy(void *data)
+{
+	pm_clk_destroy(data);
+}
+
+static int
+qcom_cc_add_pm_clks(struct platform_device *pdev, const struct qcom_cc_desc *desc)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+	int i;
+
+	if (!desc->num_pm_clks)
+		return 0;
+
+	ret = pm_clk_create(dev);
+	if (ret < 0)
+		return ret;
+	ret = devm_add_action_or_reset(dev, qcom_cc_pm_clk_destroy, dev);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < desc->num_pm_clks; i++) {
+		ret = pm_clk_add(dev, desc->pm_clks[i]);
+		if (ret < 0) {
+			dev_err(dev, "Failed to acquire %s pm clk\n", desc->pm_clks[i]);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int
+qcom_cc_manage_pm(struct platform_device *pdev, const struct qcom_cc_desc *desc)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	/* For now enable runtime PM only if we have PM clocks in use */
+	if (desc->num_pm_clks && !pm_runtime_enabled(dev)) {
+		pm_runtime_enable(dev);
+
+		ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);
+		if (ret)
+			return ret;
+	}
+
+	ret = qcom_cc_add_pm_clks(pdev, desc);
+	if (ret)
+		return ret;
+
+	/* Other code might have enabled runtime PM, resume device here */
+	if (pm_runtime_enabled(dev)) {
+		ret = pm_runtime_get_sync(dev);
+		if (ret) {
+			pm_runtime_put_noidle(dev);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static struct regmap *
 qcom_cc_map_by_index(struct platform_device *pdev, const struct qcom_cc_desc *desc, int index)
 {
 	void __iomem *base;
 	struct resource *res;
 	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = qcom_cc_manage_pm(pdev, desc);
+	if (ret)
+		return ERR_PTR(ret);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
 	base = devm_ioremap_resource(dev, res);
@@ -244,8 +320,10 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	struct clk_hw **clk_hws = desc->clk_hws;
 
 	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
-	if (!cc)
-		return -ENOMEM;
+	if (!cc) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
@@ -257,22 +335,25 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 
 	ret = devm_reset_controller_register(dev, &reset->rcdev);
 	if (ret)
-		return ret;
+		goto err;
 
 	if (desc->gdscs && desc->num_gdscs) {
 		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
-		if (!scd)
-			return -ENOMEM;
+		if (!scd) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
 		scd->dev = dev;
 		scd->scs = desc->gdscs;
 		scd->num = desc->num_gdscs;
 		ret = gdsc_register(scd, &reset->rcdev, regmap);
 		if (ret)
-			return ret;
+			goto err;
 		ret = devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister,
 					       scd);
 		if (ret)
-			return ret;
+			goto err;
 	}
 
 	cc->rclks = rclks;
@@ -283,7 +364,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	for (i = 0; i < num_clk_hws; i++) {
 		ret = devm_clk_hw_register(dev, clk_hws[i]);
 		if (ret)
-			return ret;
+			goto err;
 	}
 
 	for (i = 0; i < num_clks; i++) {
@@ -292,14 +373,26 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 
 		ret = devm_clk_register_regmap(dev, rclks[i]);
 		if (ret)
-			return ret;
+			goto err;
 	}
 
 	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
 	if (ret)
-		return ret;
+		goto err;
+
+	if (pm_runtime_enabled(dev)) {
+		/* for the LPASS on sc7180, which uses autosuspend */
+		pm_runtime_mark_last_busy(dev);
+		pm_runtime_put(dev);
+	}
 
 	return 0;
+
+err:
+	if (pm_runtime_enabled(dev))
+		pm_runtime_put(dev);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
 
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index bb39a7e106d8..5b45e2033a92 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -19,8 +19,14 @@ struct clk_hw;
 #define PLL_VOTE_FSM_ENA	BIT(20)
 #define PLL_VOTE_FSM_RESET	BIT(21)
 
+/*
+ * Note: if pm_clks are used, pm_clk_suspend/resume should be called manually
+ * from runtime pm callbacks (or just passed to SET_RUNTIME_PM_OPS).
+ */
 struct qcom_cc_desc {
 	const struct regmap_config *config;
+	const char *const *pm_clks;
+	size_t num_pm_clks;
 	struct clk_regmap **clks;
 	size_t num_clks;
 	const struct qcom_reset_map *resets;
diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 2e0ecc38efdd..5c7faa36305a 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -338,8 +338,12 @@ static struct regmap_config lpass_core_cc_sc7180_regmap_config = {
 	.fast_io = true,
 };
 
+static const char * const lpass_sc7180_pm_clks[] = { "iface" };
+
 static const struct qcom_cc_desc lpass_core_hm_sc7180_desc = {
 	.config = &lpass_core_cc_sc7180_regmap_config,
+	.pm_clks = lpass_sc7180_pm_clks,
+	.num_pm_clks = ARRAY_SIZE(lpass_sc7180_pm_clks),
 	.gdscs = lpass_core_hm_sc7180_gdscs,
 	.num_gdscs = ARRAY_SIZE(lpass_core_hm_sc7180_gdscs),
 };
@@ -352,55 +356,20 @@ static const struct qcom_cc_desc lpass_core_cc_sc7180_desc = {
 
 static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
 	.config = &lpass_core_cc_sc7180_regmap_config,
+	.pm_clks = lpass_sc7180_pm_clks,
+	.num_pm_clks = ARRAY_SIZE(lpass_sc7180_pm_clks),
 	.gdscs = lpass_audio_hm_sc7180_gdscs,
 	.num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
 };
 
-static void lpass_pm_runtime_disable(void *data)
-{
-	pm_runtime_disable(data);
-}
-
-static void lpass_pm_clk_destroy(void *data)
-{
-	pm_clk_destroy(data);
-}
-
-static int lpass_create_pm_clks(struct platform_device *pdev)
-{
-	int ret;
-
-	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
-	pm_runtime_enable(&pdev->dev);
-
-	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_runtime_disable, &pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
-	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_clk_destroy, &pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_add(&pdev->dev, "iface");
-	if (ret < 0)
-		dev_err(&pdev->dev, "failed to acquire iface clock\n");
-
-	return ret;
-}
-
 static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 {
 	const struct qcom_cc_desc *desc;
 	struct regmap *regmap;
 	int ret;
 
-	ret = lpass_create_pm_clks(pdev);
-	if (ret)
-		return ret;
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 
 	lpass_core_cc_sc7180_regmap_config.name = "lpass_audio_cc";
 	desc = &lpass_audio_hm_sc7180_desc;
@@ -428,20 +397,15 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 
 	ret = qcom_cc_really_probe(pdev, &lpass_core_cc_sc7180_desc, regmap);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
-
 	return ret;
 }
 
 static int lpass_hm_core_probe(struct platform_device *pdev)
 {
 	const struct qcom_cc_desc *desc;
-	int ret;
 
-	ret = lpass_create_pm_clks(pdev);
-	if (ret)
-		return ret;
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 
 	lpass_core_cc_sc7180_regmap_config.name = "lpass_hm_core";
 	desc = &lpass_core_hm_sc7180_desc;
diff --git a/drivers/clk/qcom/mss-sc7180.c b/drivers/clk/qcom/mss-sc7180.c
index 673fa1a4f734..41b448a0f5ff 100644
--- a/drivers/clk/qcom/mss-sc7180.c
+++ b/drivers/clk/qcom/mss-sc7180.c
@@ -63,48 +63,19 @@ static struct clk_regmap *mss_sc7180_clocks[] = {
 	[MSS_AXI_NAV_CLK] = &mss_axi_nav_clk.clkr,
 };
 
+static const char * const mss_sc7180_pm_clks[] = { "cfg_ahb" };
+
 static const struct qcom_cc_desc mss_sc7180_desc = {
 	.config = &mss_regmap_config,
+	.pm_clks = mss_sc7180_pm_clks,
+	.num_pm_clks = ARRAY_SIZE(mss_sc7180_pm_clks),
 	.clks = mss_sc7180_clocks,
 	.num_clks = ARRAY_SIZE(mss_sc7180_clocks),
 };
 
 static int mss_sc7180_probe(struct platform_device *pdev)
 {
-	int ret;
-
-	pm_runtime_enable(&pdev->dev);
-	ret = pm_clk_create(&pdev->dev);
-	if (ret)
-		goto disable_pm_runtime;
-
-	ret = pm_clk_add(&pdev->dev, "cfg_ahb");
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire iface clock\n");
-		goto destroy_pm_clk;
-	}
-
-	ret = qcom_cc_probe(pdev, &mss_sc7180_desc);
-	if (ret < 0)
-		goto destroy_pm_clk;
-
-	return 0;
-
-destroy_pm_clk:
-	pm_clk_destroy(&pdev->dev);
-
-disable_pm_runtime:
-	pm_runtime_disable(&pdev->dev);
-
-	return ret;
-}
-
-static int mss_sc7180_remove(struct platform_device *pdev)
-{
-	pm_clk_destroy(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-
-	return 0;
+	return qcom_cc_probe(pdev, &mss_sc7180_desc);
 }
 
 static const struct dev_pm_ops mss_sc7180_pm_ops = {
@@ -119,7 +90,6 @@ MODULE_DEVICE_TABLE(of, mss_sc7180_match_table);
 
 static struct platform_driver mss_sc7180_driver = {
 	.probe		= mss_sc7180_probe,
-	.remove		= mss_sc7180_remove,
 	.driver		= {
 		.name		= "sc7180-mss",
 		.of_match_table = mss_sc7180_match_table,
diff --git a/drivers/clk/qcom/q6sstop-qcs404.c b/drivers/clk/qcom/q6sstop-qcs404.c
index 723f932fbf7d..398c237417f8 100644
--- a/drivers/clk/qcom/q6sstop-qcs404.c
+++ b/drivers/clk/qcom/q6sstop-qcs404.c
@@ -117,6 +117,8 @@ static struct regmap_config q6sstop_regmap_config = {
 	.fast_io	= true,
 };
 
+static const char * const qcs404_pm_clks[] = { NULL };
+
 static struct clk_regmap *q6sstop_qcs404_clocks[] = {
 	[LCC_AHBFABRIC_CBC_CLK] = &lcc_ahbfabric_cbc_clk.clkr,
 	[LCC_Q6SS_AHBS_CBC_CLK] = &lcc_q6ss_ahbs_cbc_clk.clkr,
@@ -144,6 +146,8 @@ static struct clk_regmap *tcsr_qcs404_clocks[] = {
 
 static const struct qcom_cc_desc tcsr_qcs404_desc = {
 	.config = &q6sstop_regmap_config,
+	.pm_clks = qcs404_pm_clks,
+	.num_pm_clks = ARRAY_SIZE(qcs404_pm_clks),
 	.clks = tcsr_qcs404_clocks,
 	.num_clks = ARRAY_SIZE(tcsr_qcs404_clocks),
 };
@@ -159,46 +163,19 @@ static int q6sstopcc_qcs404_probe(struct platform_device *pdev)
 	const struct qcom_cc_desc *desc;
 	int ret;
 
-	pm_runtime_enable(&pdev->dev);
-	ret = pm_clk_create(&pdev->dev);
-	if (ret)
-		goto disable_pm_runtime;
-
-	ret = pm_clk_add(&pdev->dev, NULL);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire iface clock\n");
-		goto destroy_pm_clk;
-	}
-
 	q6sstop_regmap_config.name = "q6sstop_tcsr";
 	desc = &tcsr_qcs404_desc;
 
 	ret = qcom_cc_probe_by_index(pdev, 1, desc);
 	if (ret)
-		goto destroy_pm_clk;
+		return ret;
 
 	q6sstop_regmap_config.name = "q6sstop_cc";
 	desc = &q6sstop_qcs404_desc;
 
 	ret = qcom_cc_probe_by_index(pdev, 0, desc);
 	if (ret)
-		goto destroy_pm_clk;
-
-	return 0;
-
-destroy_pm_clk:
-	pm_clk_destroy(&pdev->dev);
-
-disable_pm_runtime:
-	pm_runtime_disable(&pdev->dev);
-
-	return ret;
-}
-
-static int q6sstopcc_qcs404_remove(struct platform_device *pdev)
-{
-	pm_clk_destroy(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
+		return ret;
 
 	return 0;
 }
@@ -209,7 +186,6 @@ static const struct dev_pm_ops q6sstopcc_pm_ops = {
 
 static struct platform_driver q6sstopcc_qcs404_driver = {
 	.probe		= q6sstopcc_qcs404_probe,
-	.remove		= q6sstopcc_qcs404_remove,
 	.driver		= {
 		.name	= "qcs404-q6sstopcc",
 		.of_match_table = q6sstopcc_qcs404_match_table,
diff --git a/drivers/clk/qcom/turingcc-qcs404.c b/drivers/clk/qcom/turingcc-qcs404.c
index 4cfbbf5bf4d9..ba283812ef7c 100644
--- a/drivers/clk/qcom/turingcc-qcs404.c
+++ b/drivers/clk/qcom/turingcc-qcs404.c
@@ -100,8 +100,12 @@ static const struct regmap_config turingcc_regmap_config = {
 	.fast_io	= true,
 };
 
+static const char * const turingcc_pm_clks[] = { NULL };
+
 static const struct qcom_cc_desc turingcc_desc = {
 	.config = &turingcc_regmap_config,
+	.pm_clks = turingcc_pm_clks,
+	.num_pm_clks = ARRAY_SIZE(turingcc_pm_clks),
 	.clks = turingcc_clocks,
 	.num_clks = ARRAY_SIZE(turingcc_clocks),
 };
@@ -110,36 +114,9 @@ static int turingcc_probe(struct platform_device *pdev)
 {
 	int ret;
 
-	pm_runtime_enable(&pdev->dev);
-	ret = pm_clk_create(&pdev->dev);
-	if (ret)
-		goto disable_pm_runtime;
-
-	ret = pm_clk_add(&pdev->dev, NULL);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire iface clock\n");
-		goto destroy_pm_clk;
-	}
-
 	ret = qcom_cc_probe(pdev, &turingcc_desc);
 	if (ret < 0)
-		goto destroy_pm_clk;
-
-	return 0;
-
-destroy_pm_clk:
-	pm_clk_destroy(&pdev->dev);
-
-disable_pm_runtime:
-	pm_runtime_disable(&pdev->dev);
-
-	return ret;
-}
-
-static int turingcc_remove(struct platform_device *pdev)
-{
-	pm_clk_destroy(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
+		return ret;
 
 	return 0;
 }
@@ -156,7 +133,6 @@ MODULE_DEVICE_TABLE(of, turingcc_match_table);
 
 static struct platform_driver turingcc_driver = {
 	.probe		= turingcc_probe,
-	.remove		= turingcc_remove,
 	.driver		= {
 		.name	= "qcs404-turingcc",
 		.of_match_table = turingcc_match_table,
-- 
2.30.2

