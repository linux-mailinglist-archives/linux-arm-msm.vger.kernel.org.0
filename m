Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61EF52906F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 16:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408677AbgJPONJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 10:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408682AbgJPONI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 10:13:08 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75739C0613D9
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 07:13:03 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id n18so3111548wrs.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6TEsRQhBXfaY4s3uARTgmrpJZrdRWBy/cLAUQ/qAT6A=;
        b=vKiDETLWHrPoZDUTAyRmVGNz/94kY3xxgEqAHTKFr4a/IMVqUacUvvhGK8vKOEGW+z
         beh0DH1qQ0/cebitqrF0LG8C1vfRE73T7syx8fEe0mbwoUvuO+gbgk8pRHl+d14hOskp
         cabF+hLEDpQp8SJJA91VqZe1vi9xeOIE0wxDGqRQ0BpwkRnbLOZ4ay7x9JuhIE8GnXOq
         2uWlTDGM/irfwraRgkan2wUTEgSWMldJ3BmPTTdRQ3aXlCZ2XHY1fupWbhF32x8X1bh0
         DOp++lFmdEATnqRselecpZjHVqS5tFyQfE0yzA0M/Cpe1WIfBFng9BIdozS3sJeZmZUK
         yzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6TEsRQhBXfaY4s3uARTgmrpJZrdRWBy/cLAUQ/qAT6A=;
        b=IGvp40KZejgfu1/vbWbW448HJgDk4wHetQRFcRuTA2E/xcMQTjAg5PHN+wht2UteOH
         oN8h1b6DtV+hPkR4EOAyDvslamzGk8iUtrUXkzSBERAItrzSvKvhk2pTpWpIXOAyut1W
         /bJhKuGfJNjX84hY7CMemBAvowWfzAA0FmPbbMdSnwRRwuoht2AmI6S9yGcvrIYgJiXy
         zM1fRSx3kTwfgmn67d7L58DvMGF79uuQpSvcp1I1pbisfb9YaArtJh9UlqpBE8KybOkx
         VMtcA+v213T+NmpOdJ9n4u0ntgKb1tiNGEqa4eVIUdSCIWA4dgbz9NV7bUwtS3SJmRpO
         VmPg==
X-Gm-Message-State: AOAM530skN3jAkerLqER9NODlaSw30C0yRwgUZm7c/e1R57MW9Dx0uuF
        QEjRFx9y2dO6cuEQkw4NZdLb/RSDJ1GlUg==
X-Google-Smtp-Source: ABdhPJxcpMWY3rTFSStor1EJD4mrcHxgzR2ACJOTo9nIvUmplT0pyfR3Fr/i0nWR5PXXyf615ztj6A==
X-Received: by 2002:a05:6000:18d:: with SMTP id p13mr4176877wrx.248.1602857580899;
        Fri, 16 Oct 2020 07:13:00 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id p9sm2982284wma.12.2020.10.16.07.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:13:00 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 3/4] clk: qcom: Add support to LPASS AUDIO_CC Glitch Free Mux clocks
Date:   Fri, 16 Oct 2020 15:12:40 +0100
Message-Id: <20201016141241.5839-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
References: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
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
 drivers/clk/qcom/lpass-gfm-sm8250.c | 257 ++++++++++++++++++++++++++++
 3 files changed, 264 insertions(+)
 create mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 058327310c25..c00911c110ac 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -475,4 +475,10 @@ config KRAITCC
 	  Support for the Krait CPU clocks on Qualcomm devices.
 	  Say Y if you want to support CPU frequency scaling.
 
+config CLK_GFM_LPASS_SM8250
+	tristate "SM8250 GFM LPASS Clocks"
+	help
+	  Support for the Glitch Free Mux (GFM) Low power audio
+          subsystem (LPASS) clocks found on SM8250 SoCs.
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
index 000000000000..48a73dd97d0d
--- /dev/null
+++ b/drivers/clk/qcom/lpass-gfm-sm8250.c
@@ -0,0 +1,257 @@
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
+				.fw_name = "LPASS_CLK_ID_TX_CORE_MCLK",
+			}, {
+				.index = 1,
+				.fw_name = "LPASS_CLK_ID_WSA_CORE_MCLK",
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
+				.fw_name = "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
+			}, {
+				.index = 1,
+				.fw_name = "LPASS_CLK_ID_WSA_CORE_NPL_MCLK",
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
+				.fw_name = "LPASS_CLK_ID_TX_CORE_MCLK",
+			}, {
+				.index = 1,
+				.fw_name = "LPASS_CLK_ID_RX_CORE_MCLK",
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
+				.fw_name = "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
+			}, {
+				.index = 1,
+				.fw_name = "LPASS_CLK_ID_RX_CORE_NPL_MCLK",
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
+	cc->base = devm_platform_ioremap_resource(pdev, 0);
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

