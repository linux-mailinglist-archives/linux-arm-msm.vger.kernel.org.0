Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05FB27852A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Sep 2020 12:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728161AbgIYKbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Sep 2020 06:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbgIYKbi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Sep 2020 06:31:38 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37618C0613E0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 03:31:38 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k18so2703064wmj.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 03:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K8Xn4wOHHUJwjkvQ1rzRkGU3cJ1+9NVMvXhKw81XLXM=;
        b=C6HLOUjCSGKbC5jruIIZSIlNvRY1Npvr5V+TnVAmNjRI3TraO7orO0bLxM3BSB9vow
         HjHgMB9anLA+IiFcK5rJy8CSOASvRtI5d4GsywyrTOAVKUCqPzRr3IGnS6a25nVtd3+0
         a0NrNCa8GIS+m3OERfThK8X3SDF2CDnezEV1H5aceceg+NO/q+8Wq7uWjRQ5/V0Iu2bI
         GbsWfkENVzygizGBxBtNB9bnCX7Y8/p3uhFUDQtHDr7wOgNlKHqLT3oIeU5AEopZ39fp
         t6z8TV1uDWmifem/w7fbYC2tKSGbvxxGMzSE3EiiBkegMbSbDsQF6nXWrSZ2wEiJkcew
         Q54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K8Xn4wOHHUJwjkvQ1rzRkGU3cJ1+9NVMvXhKw81XLXM=;
        b=tbOYVN+Km3uJXcs46weQnf4wXGOZf3UPxb24lFO7+JienhV/Lr/C/4RM2t2bnWnZi9
         fry236FQgdtziPfXbv+hnom9Jver65+EIhYCavI5JR/4V62JNuQsO4+9kOnVvtd0Nx/q
         ugvsmWCjJ5GHGoTEfblaUjClaB1NGBqMguRWg++NMIilgWxFJNq/DeB6f488MS7bAt3V
         +YUGPqyKxdMTm3vx7/x0hwnJBrY3ZNbJkG9c94OXm3kTh+qoKSwGrwCcFb0MvYX7vyN9
         xTC+//syW9LWAw4dksLs8MuxNUe+U9e93QwcRlxD4US2tjt5WD1FKJ77Tp+zbRXi/i6q
         uFmA==
X-Gm-Message-State: AOAM5312zEcX6sH8eIm6A6nMITxSwgV/QfRyYWxXENcwRPy5M1N8Gok0
        Mc8qV6sXPK01m7E7SQDQ1v2IZw==
X-Google-Smtp-Source: ABdhPJzRmNG7vWwVgcaVpFq3Occzh2ja8Su2EqfqMGPhbAmEjXQsMCwy2xldeLjDhSNJ3iswVh2dZg==
X-Received: by 2002:a1c:2e4b:: with SMTP id u72mr2406065wmu.69.1601029896825;
        Fri, 25 Sep 2020 03:31:36 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id 11sm2354907wmi.14.2020.09.25.03.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 03:31:36 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 3/4] clk: qcom: Add support to LPASS AUDIO_CC Glitch Free Mux clocks
Date:   Fri, 25 Sep 2020 11:31:14 +0100
Message-Id: <20200925103115.15191-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
References: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GFM Muxes in AUDIO_CC control clocks to LPASS WSA and RX Codec Macros.
This patch adds support to these muxes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/Kconfig            |   6 +
 drivers/clk/qcom/Makefile           |   1 +
 drivers/clk/qcom/lpass-gfm-sm8250.c | 260 ++++++++++++++++++++++++++++
 3 files changed, 267 insertions(+)
 create mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 058327310c25..08078f4b0591 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -475,4 +475,10 @@ config KRAITCC
 	  Support for the Krait CPU clocks on Qualcomm devices.
 	  Say Y if you want to support CPU frequency scaling.
 
+config CLK_GFM_LPASS_SM8250
+	tristate "GFM LPASS Clocks"
+	help
+	  Support for the GFM Glitch Free Mux LPASS clock. Say Y
+	  if you want to support GFM Clocks on LPASS for SM8250 SoC.
+
 endif
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 9677e769e7e9..7465cabc86aa 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -19,6 +19,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 # Keep alphabetically sorted by config
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
+obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
 obj-$(CONFIG_IPQ_APSS_6018) += apss-ipq6018.o
 obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
diff --git a/drivers/clk/qcom/lpass-gfm-sm8250.c b/drivers/clk/qcom/lpass-gfm-sm8250.c
new file mode 100644
index 000000000000..c79854e1494d
--- /dev/null
+++ b/drivers/clk/qcom/lpass-gfm-sm8250.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * LPASS Audio CC and Always ON CC Glitch Free Mux clock driver
+ *
+ * Copyright (c) 2020 Linaro Ltd.
+ * Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/clk.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/of_device.h>
+#include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
+
+struct lpass_gfm {
+	struct device *dev;
+	void __iomem *base;
+};
+
+struct clk_gfm {
+	unsigned int mux_reg;
+	unsigned int mux_mask;
+	struct clk_hw	hw;
+	struct lpass_gfm *priv;
+	void __iomem *gfm_mux;
+};
+
+#define GFM_MASK	BIT(1)
+#define to_clk_gfm(_hw) container_of(_hw, struct clk_gfm, hw)
+
+static u8 clk_gfm_get_parent(struct clk_hw *hw)
+{
+	struct clk_gfm *clk = to_clk_gfm(hw);
+
+	return readl(clk->gfm_mux) & GFM_MASK;
+}
+
+static int clk_gfm_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_gfm *clk = to_clk_gfm(hw);
+	unsigned int val;
+
+	val = readl(clk->gfm_mux);
+
+	if (index)
+		val |= GFM_MASK;
+	else
+		val &= ~GFM_MASK;
+
+	writel(val, clk->gfm_mux);
+
+	return 0;
+}
+
+static const struct clk_ops clk_gfm_ops = {
+	.get_parent = clk_gfm_get_parent,
+	.set_parent = clk_gfm_set_parent,
+	.determine_rate = __clk_mux_determine_rate,
+};
+
+static struct clk_gfm lpass_gfm_wsa_mclk = {
+	.mux_reg = 0x220d8,
+	.mux_mask = BIT(0),
+	.hw.init = &(struct clk_init_data) {
+		.name = "WSA_MCLK",
+		.ops = &clk_gfm_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.parent_data = (const struct clk_parent_data[]){
+			{
+				.index = 0,
+				.name = "LPASS_CLK_ID_TX_CORE_MCLK",
+			}, {
+				.index = 1,
+				.name = "LPASS_CLK_ID_WSA_CORE_MCLK",
+			},
+		},
+		.num_parents = 2,
+	},
+};
+
+static struct clk_gfm lpass_gfm_wsa_npl = {
+	.mux_reg = 0x220d8,
+	.mux_mask = BIT(0),
+	.hw.init = &(struct clk_init_data) {
+		.name = "WSA_NPL",
+		.ops = &clk_gfm_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.parent_data = (const struct clk_parent_data[]){
+			{
+				.index = 0,
+				.name = "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
+			}, {
+				.index = 1,
+				.name = "LPASS_CLK_ID_WSA_CORE_NPL_MCLK",
+			},
+		},
+		.num_parents = 2,
+	},
+};
+
+static struct clk_gfm lpass_gfm_rx_mclk_mclk2 = {
+	.mux_reg = 0x240d8,
+	.mux_mask = BIT(0),
+	.hw.init = &(struct clk_init_data) {
+		.name = "RX_MCLK_MCLK2",
+		.ops = &clk_gfm_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.parent_data = (const struct clk_parent_data[]){
+			{
+				.index = 0,
+				.name = "LPASS_CLK_ID_TX_CORE_MCLK",
+			}, {
+				.index = 1,
+				.name = "LPASS_CLK_ID_RX_CORE_MCLK",
+			},
+		},
+		.num_parents = 2,
+	},
+};
+
+static struct clk_gfm lpass_gfm_rx_npl = {
+	.mux_reg = 0x240d8,
+	.mux_mask = BIT(0),
+	.hw.init = &(struct clk_init_data) {
+		.name = "RX_NPL",
+		.ops = &clk_gfm_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.parent_data = (const struct clk_parent_data[]){
+			{
+				.index = 0,
+				.name = "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
+			}, {
+				.index = 1,
+				.name = "LPASS_CLK_ID_RX_CORE_NPL_MCLK",
+			},
+		},
+		.num_parents = 2,
+	},
+};
+
+static struct clk_gfm *audiocc_gfm_clks[] = {
+	[LPASS_CDC_WSA_NPL]		= &lpass_gfm_wsa_npl,
+	[LPASS_CDC_WSA_MCLK]		= &lpass_gfm_wsa_mclk,
+	[LPASS_CDC_RX_NPL]		= &lpass_gfm_rx_npl,
+	[LPASS_CDC_RX_MCLK_MCLK2]	= &lpass_gfm_rx_mclk_mclk2,
+};
+
+static struct clk_hw_onecell_data audiocc_hw_onecell_data = {
+	.hws = {
+		[LPASS_CDC_WSA_NPL]	= &lpass_gfm_wsa_npl.hw,
+		[LPASS_CDC_WSA_MCLK]	= &lpass_gfm_wsa_mclk.hw,
+		[LPASS_CDC_RX_NPL]	= &lpass_gfm_rx_npl.hw,
+		[LPASS_CDC_RX_MCLK_MCLK2] = &lpass_gfm_rx_mclk_mclk2.hw,
+	},
+	.num = ARRAY_SIZE(audiocc_gfm_clks),
+};
+
+struct lpass_gfm_data {
+	struct clk_hw_onecell_data *onecell_data;
+	struct clk_gfm **gfm_clks;
+};
+
+static struct lpass_gfm_data audiocc_data = {
+	.onecell_data = &audiocc_hw_onecell_data,
+	.gfm_clks = audiocc_gfm_clks,
+};
+
+static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
+{
+	const struct lpass_gfm_data *data;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct clk_gfm *gfm;
+	struct lpass_gfm *cc;
+	int err, i;
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
+	if (!cc)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	cc->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(cc->base))
+		return PTR_ERR(cc->base);
+
+	pm_runtime_enable(dev);
+	err = pm_clk_create(dev);
+	if (err)
+		goto pm_clk_err;
+
+	err = of_pm_clk_add_clks(dev);
+	if (err < 0) {
+		dev_dbg(dev, "Failed to get lpass core voting clocks\n");
+		goto clk_reg_err;
+	}
+
+	for (i = 0; i < data->onecell_data->num; i++) {
+		if (!data->gfm_clks[i])
+			continue;
+
+		gfm = data->gfm_clks[i];
+		gfm->priv = cc;
+		gfm->gfm_mux = cc->base;
+		gfm->gfm_mux = gfm->gfm_mux + data->gfm_clks[i]->mux_reg;
+
+		err = devm_clk_hw_register(dev, &data->gfm_clks[i]->hw);
+		if (err)
+			goto clk_reg_err;
+
+	}
+
+	err = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					  data->onecell_data);
+	if (err)
+		goto clk_reg_err;
+
+	return 0;
+
+clk_reg_err:
+	pm_clk_destroy(dev);
+pm_clk_err:
+	pm_runtime_disable(dev);
+	return err;
+}
+
+static const struct of_device_id lpass_gfm_clk_match_table[] = {
+	{
+		.compatible = "qcom,sm8250-lpass-audiocc",
+		.data = &audiocc_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_gfm_clk_match_table);
+
+static const struct dev_pm_ops lpass_gfm_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver lpass_gfm_clk_driver = {
+	.probe		= lpass_gfm_clk_driver_probe,
+	.driver		= {
+		.name	= "lpass-gfm-clk",
+		.of_match_table = lpass_gfm_clk_match_table,
+		.pm = &lpass_gfm_pm_ops,
+	},
+};
+module_platform_driver(lpass_gfm_clk_driver);
+MODULE_LICENSE("GPL v2");
-- 
2.21.0

