Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38AEE2CC250
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 17:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389136AbgLBQbJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 11:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388976AbgLBQbI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 11:31:08 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE2EC061A4A
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 08:29:50 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id z7so4699524wrn.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 08:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hjp2z/kt+GYex+29ojo6eXfuTINtrCqf0adbJNj+XCM=;
        b=TQQg+Bqc3T8d4lhGfovXGHM+ql/bt5WTTU2jDBn9GQu/ksCoiGCjhu8Ll9IMwvckFe
         8+S2Sd4L9R79R4TSjmXcXf/Eug1JpL4f6xo8+RZpSy5Ymvx4P2PVvHOL/1EwNduHoy2G
         ShWGUH8F1a0GqwB+CDPa2wdfr8nSr/YaLPLRQGIoFT3zgzog+91ijUHxVcWOQUDu6UrE
         koyvO3RXm9JpQoGkkCPnKmNkY3RPwmiuI3PJo16OwrzuJk3EhazIgob03VoKKu+5Zh4n
         xmkM4CvjfdIAgyKmV8hxdZb+ezc+S4JVlOZgCoiBFR77he+P/UGzrxozUeYBWGtEtoWo
         e0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hjp2z/kt+GYex+29ojo6eXfuTINtrCqf0adbJNj+XCM=;
        b=tUUJL/2+HiG1EFwRh1K59laoKVcro4LAh15SLZbW42KicP9Cd4eQi9zIHaFZjmCxuV
         pWo8719i+R6xtv+xt9nqozPsf1H9Se1FSznjBGcO0rHJTK5I5X6bvouHf+wjMZqtq4OU
         Y2pxsdBux8GHdvmqLpIcoerxYxjgBmkfsnXL+zF5QN46fFKor508CAnPfXdeuE6k6GZ5
         pd/T5/1w/+m9dXtXBl9yhYEop6vJln3ZThYM+k5twWR8jYmUQB9FtPnsukpil820KOLP
         Xbo3s8ytS7mRetkZgJ0KSo2Bn1Mc45zGm7tFwG7yuHJmqTNY2Ctbcp8OkUAWavWlwaHS
         6BOw==
X-Gm-Message-State: AOAM5324ArFCCDNKbnSmoyYqNXYEFxRjF93a2eiWJk1JDpNeBHS/lvzL
        1ibszeorNrKQTcKYwJiNFKcdkQ==
X-Google-Smtp-Source: ABdhPJy+WA+wR1y5LLU4EimgHe3hAtEnTAoaVNUQJEvV7tVc3YDr4ehlBLGw6J3eRb0ahKSo4XzurQ==
X-Received: by 2002:adf:f608:: with SMTP id t8mr4559888wrp.72.1606926589515;
        Wed, 02 Dec 2020 08:29:49 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id o5sm2569882wmh.8.2020.12.02.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 08:29:48 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v6 2/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
Date:   Wed,  2 Dec 2020 16:29:43 +0000
Message-Id: <20201202162943.15210-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201202162943.15210-1-srinivas.kandagatla@linaro.org>
References: <20201202162943.15210-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add initial pinctrl driver to support pin configuration for
LPASS (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
on SM8250.

This IP is an additional pin control block for Audio Pins on top the
existing SoC Top level pin-controller.
Hardware setup looks like:

TLMM GPIO[146 - 159] --> LPASS LPI GPIO [0 - 13]

This pin controller has some similarities compared to Top level
msm SoC Pin controller like 'each pin belongs to a single group'
and so on. However this one is intended to control only audio
pins in particular, which can not be configured/touched by the
Top level SoC pin controller except setting them as gpios.
Apart from this, slew rate is also available in this block for
certain pins which are connected to SLIMbus or SoundWire Bus.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig             |   8 +
 drivers/pinctrl/qcom/Makefile            |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 695 +++++++++++++++++++++++
 3 files changed, 704 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 5fe7b8aaf69d..d3e4e89c2810 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -236,4 +236,12 @@ config PINCTRL_SM8250
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
 	  Technologies Inc SM8250 platform.
 
+config PINCTRL_LPASS_LPI
+	tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
+	depends on GPIOLIB
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
+	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
+
 endif
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 9e3d9c91a444..c8520155fb1b 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -28,3 +28,4 @@ obj-$(CONFIG_PINCTRL_SDM660)   += pinctrl-sdm660.o
 obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
 obj-$(CONFIG_PINCTRL_SM8150) += pinctrl-sm8150.o
 obj-$(CONFIG_PINCTRL_SM8250) += pinctrl-sm8250.o
+obj-$(CONFIG_PINCTRL_LPASS_LPI) += pinctrl-lpass-lpi.o
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
new file mode 100644
index 000000000000..369ee20a7ea9
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -0,0 +1,695 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020 Linaro Ltd.
+ */
+
+#include <linux/bitops.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include "../core.h"
+#include "../pinctrl-utils.h"
+
+#define LPI_SLEW_RATE_CTL_REG		0xa000
+#define LPI_TLMM_REG_OFFSET		0x1000
+#define LPI_SLEW_RATE_MAX		0x03
+#define LPI_SLEW_BITS_SIZE		0x02
+#define LPI_SLEW_RATE_MASK		GENMASK(1, 0)
+#define LPI_GPIO_CFG_REG		0x00
+#define LPI_GPIO_PULL_MASK		GENMASK(1, 0)
+#define LPI_GPIO_FUNCTION_MASK		GENMASK(5, 2)
+#define LPI_GPIO_OUT_STRENGTH_MASK	GENMASK(8, 6)
+#define LPI_GPIO_OE_MASK		BIT(9)
+#define LPI_GPIO_VALUE_REG		0x04
+#define LPI_GPIO_VALUE_IN_MASK		BIT(0)
+#define LPI_GPIO_VALUE_OUT_MASK		BIT(1)
+
+#define LPI_GPIO_BIAS_DISABLE		0x0
+#define LPI_GPIO_PULL_DOWN		0x1
+#define LPI_GPIO_KEEPER			0x2
+#define LPI_GPIO_PULL_UP		0x3
+#define LPI_GPIO_DS_TO_VAL(v)		(v / 2 - 1)
+#define NO_SLEW				-1
+
+#define LPI_FUNCTION(fname)			                \
+	[LPI_MUX_##fname] = {		                \
+		.name = #fname,				\
+		.groups = fname##_groups,               \
+		.ngroups = ARRAY_SIZE(fname##_groups),	\
+	}
+
+#define LPI_PINGROUP(id, soff, f1, f2, f3, f4)		\
+	{						\
+		.name = "gpio" #id,			\
+		.pins = gpio##id##_pins,		\
+		.pin = id,				\
+		.slew_offset = soff,			\
+		.npins = ARRAY_SIZE(gpio##id##_pins),	\
+		.funcs = (int[]){			\
+			LPI_MUX_gpio,			\
+			LPI_MUX_##f1,			\
+			LPI_MUX_##f2,			\
+			LPI_MUX_##f3,			\
+			LPI_MUX_##f4,			\
+		},					\
+		.nfuncs = 5,				\
+	}
+
+struct lpi_pingroup {
+	const char *name;
+	const unsigned int *pins;
+	unsigned int npins;
+	unsigned int pin;
+	/* Bit offset in slew register for SoundWire pins only */
+	int slew_offset;
+	unsigned int *funcs;
+	unsigned int nfuncs;
+};
+
+struct lpi_function {
+	const char *name;
+	const char * const *groups;
+	unsigned int ngroups;
+};
+
+struct lpi_pinctrl_variant_data {
+	const struct pinctrl_pin_desc *pins;
+	int npins;
+	const struct lpi_pingroup *groups;
+	int ngroups;
+	const struct lpi_function *functions;
+	int nfunctions;
+};
+
+#define MAX_LPI_NUM_CLKS	2
+
+struct lpi_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *ctrl;
+	struct gpio_chip chip;
+	struct pinctrl_desc desc;
+	char __iomem *tlmm_base;
+	char __iomem *slew_base;
+	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
+	struct mutex slew_access_lock;
+	const struct lpi_pinctrl_variant_data *data;
+};
+
+/* sm8250 variant specific data */
+static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+};
+
+enum sm8250_lpi_functions {
+	LPI_MUX_dmic1_clk,
+	LPI_MUX_dmic1_data,
+	LPI_MUX_dmic2_clk,
+	LPI_MUX_dmic2_data,
+	LPI_MUX_dmic3_clk,
+	LPI_MUX_dmic3_data,
+	LPI_MUX_i2s1_clk,
+	LPI_MUX_i2s1_data,
+	LPI_MUX_i2s1_ws,
+	LPI_MUX_i2s2_clk,
+	LPI_MUX_i2s2_data,
+	LPI_MUX_i2s2_ws,
+	LPI_MUX_qua_mi2s_data,
+	LPI_MUX_qua_mi2s_sclk,
+	LPI_MUX_qua_mi2s_ws,
+	LPI_MUX_swr_rx_clk,
+	LPI_MUX_swr_rx_data,
+	LPI_MUX_swr_tx_clk,
+	LPI_MUX_swr_tx_data,
+	LPI_MUX_wsa_swr_clk,
+	LPI_MUX_wsa_swr_data,
+	LPI_MUX_gpio,
+	LPI_MUX__,
+};
+
+static const unsigned int gpio0_pins[] = { 0 };
+static const unsigned int gpio1_pins[] = { 1 };
+static const unsigned int gpio2_pins[] = { 2 };
+static const unsigned int gpio3_pins[] = { 3 };
+static const unsigned int gpio4_pins[] = { 4 };
+static const unsigned int gpio5_pins[] = { 5 };
+static const unsigned int gpio6_pins[] = { 6 };
+static const unsigned int gpio7_pins[] = { 7 };
+static const unsigned int gpio8_pins[] = { 8 };
+static const unsigned int gpio9_pins[] = { 9 };
+static const unsigned int gpio10_pins[] = { 10 };
+static const unsigned int gpio11_pins[] = { 11 };
+static const unsigned int gpio12_pins[] = { 12 };
+static const unsigned int gpio13_pins[] = { 13 };
+static const char * const swr_tx_clk_groups[] = { "gpio0" };
+static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
+static const char * const swr_rx_clk_groups[] = { "gpio3" };
+static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
+static const char * const dmic1_clk_groups[] = { "gpio6" };
+static const char * const dmic1_data_groups[] = { "gpio7" };
+static const char * const dmic2_clk_groups[] = { "gpio8" };
+static const char * const dmic2_data_groups[] = { "gpio9" };
+static const char * const i2s2_clk_groups[] = { "gpio10" };
+static const char * const i2s2_ws_groups[] = { "gpio11" };
+static const char * const dmic3_clk_groups[] = { "gpio12" };
+static const char * const dmic3_data_groups[] = { "gpio13" };
+static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
+static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
+static const char * const qua_mi2s_data_groups[] = { "gpio2", "gpio3", "gpio4" };
+static const char * const i2s1_clk_groups[] = { "gpio6" };
+static const char * const i2s1_ws_groups[] = { "gpio7" };
+static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
+static const char * const wsa_swr_clk_groups[] = { "gpio10" };
+static const char * const wsa_swr_data_groups[] = { "gpio11" };
+static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
+
+static const struct lpi_pingroup sm8250_groups[] = {
+	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
+	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
+	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
+	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(5, 12, swr_tx_data, swr_rx_data, _, _),
+	LPI_PINGROUP(6, NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
+	LPI_PINGROUP(7, NO_SLEW, dmic1_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, NO_SLEW, dmic2_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, NO_SLEW, dmic2_data, i2s1_data, _, _),
+	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
+	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
+	LPI_PINGROUP(12, NO_SLEW, dmic3_clk, i2s2_data, _, _),
+	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
+};
+
+static const struct lpi_function sm8250_functions[] = {
+	LPI_FUNCTION(dmic1_clk),
+	LPI_FUNCTION(dmic1_data),
+	LPI_FUNCTION(dmic2_clk),
+	LPI_FUNCTION(dmic2_data),
+	LPI_FUNCTION(dmic3_clk),
+	LPI_FUNCTION(dmic3_data),
+	LPI_FUNCTION(i2s1_clk),
+	LPI_FUNCTION(i2s1_data),
+	LPI_FUNCTION(i2s1_ws),
+	LPI_FUNCTION(i2s2_clk),
+	LPI_FUNCTION(i2s2_data),
+	LPI_FUNCTION(i2s2_ws),
+	LPI_FUNCTION(qua_mi2s_data),
+	LPI_FUNCTION(qua_mi2s_sclk),
+	LPI_FUNCTION(qua_mi2s_ws),
+	LPI_FUNCTION(swr_rx_clk),
+	LPI_FUNCTION(swr_rx_data),
+	LPI_FUNCTION(swr_tx_clk),
+	LPI_FUNCTION(swr_tx_data),
+	LPI_FUNCTION(wsa_swr_clk),
+	LPI_FUNCTION(wsa_swr_data),
+};
+
+static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
+	.pins = sm8250_lpi_pins,
+	.npins = ARRAY_SIZE(sm8250_lpi_pins),
+	.groups = sm8250_groups,
+	.ngroups = ARRAY_SIZE(sm8250_groups),
+	.functions = sm8250_functions,
+	.nfunctions = ARRAY_SIZE(sm8250_functions),
+};
+
+static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
+			 unsigned int addr)
+{
+	return ioread32(state->tlmm_base + LPI_TLMM_REG_OFFSET * pin + addr);
+}
+
+static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
+			  unsigned int addr, unsigned int val)
+{
+	iowrite32(val, state->tlmm_base + LPI_TLMM_REG_OFFSET * pin + addr);
+
+	return 0;
+}
+
+static int lpi_gpio_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->data->ngroups;
+}
+
+static const char *lpi_gpio_get_group_name(struct pinctrl_dev *pctldev,
+					   unsigned int group)
+{
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->data->groups[group].name;
+}
+
+static int lpi_gpio_get_group_pins(struct pinctrl_dev *pctldev,
+				   unsigned int group,
+				   const unsigned int **pins,
+				   unsigned int *num_pins)
+{
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = pctrl->data->groups[group].pins;
+	*num_pins = pctrl->data->groups[group].npins;
+
+	return 0;
+}
+
+static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
+	.get_groups_count	= lpi_gpio_get_groups_count,
+	.get_group_name		= lpi_gpio_get_group_name,
+	.get_group_pins		= lpi_gpio_get_group_pins,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_group,
+	.dt_free_map		= pinctrl_utils_free_map,
+};
+
+static int lpi_gpio_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->data->nfunctions;
+}
+
+static const char *lpi_gpio_get_function_name(struct pinctrl_dev *pctldev,
+					      unsigned int function)
+{
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->data->functions[function].name;
+}
+
+static int lpi_gpio_get_function_groups(struct pinctrl_dev *pctldev,
+					unsigned int function,
+					const char *const **groups,
+					unsigned *const num_qgroups)
+{
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = pctrl->data->functions[function].groups;
+	*num_qgroups = pctrl->data->functions[function].ngroups;
+
+	return 0;
+}
+
+static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
+			    unsigned int group_num)
+{
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct lpi_pingroup *g = &pctrl->data->groups[group_num];
+	u32 val;
+	int i, pin = g->pin;
+
+	for (i = 0; i < g->nfuncs; i++) {
+		if (g->funcs[i] == function)
+			break;
+	}
+
+	if (WARN_ON(i == g->nfuncs))
+		return -EINVAL;
+
+	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG);
+	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
+	lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
+
+	return 0;
+}
+
+static const struct pinmux_ops lpi_gpio_pinmux_ops = {
+	.get_functions_count	= lpi_gpio_get_functions_count,
+	.get_function_name	= lpi_gpio_get_function_name,
+	.get_function_groups	= lpi_gpio_get_function_groups,
+	.set_mux		= lpi_gpio_set_mux,
+};
+
+static int lpi_config_get(struct pinctrl_dev *pctldev,
+			  unsigned int pin, unsigned long *config)
+{
+	unsigned int param = pinconf_to_config_param(*config);
+	struct lpi_pinctrl *state = dev_get_drvdata(pctldev->dev);
+	unsigned int arg = 0;
+	int is_out;
+	int pull;
+	u32 ctl_reg;
+
+	ctl_reg = lpi_gpio_read(state, pin, LPI_GPIO_CFG_REG);
+	is_out = ctl_reg & LPI_GPIO_OE_MASK;
+	pull = FIELD_GET(LPI_GPIO_PULL_MASK, ctl_reg);
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		if (pull == LPI_GPIO_BIAS_DISABLE)
+			arg = 1;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (pull == LPI_GPIO_PULL_DOWN)
+			arg = 1;
+		break;
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+		if (pull == LPI_GPIO_KEEPER)
+			arg = 1;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (pull == LPI_GPIO_PULL_UP)
+			arg = 1;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+	case PIN_CONFIG_OUTPUT:
+		if (is_out)
+			arg = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+	return 0;
+}
+
+static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
+			  unsigned long *configs, unsigned int nconfs)
+{
+	struct lpi_pinctrl *pctrl = dev_get_drvdata(pctldev->dev);
+	unsigned int param, arg, pullup, strength;
+	bool value, output_enabled = false;
+	const struct lpi_pingroup *g;
+	unsigned long sval;
+	int i, slew_offset;
+	u32 val;
+
+	g = &pctrl->data->groups[group];
+	for (i = 0; i < nconfs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			pullup = LPI_GPIO_BIAS_DISABLE;
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			pullup = LPI_GPIO_PULL_DOWN;
+			break;
+		case PIN_CONFIG_BIAS_BUS_HOLD:
+			pullup = LPI_GPIO_KEEPER;
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			pullup = LPI_GPIO_PULL_UP;
+			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			output_enabled = false;
+			break;
+		case PIN_CONFIG_OUTPUT:
+			output_enabled = true;
+			value = arg;
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			strength = arg;
+			break;
+		case PIN_CONFIG_SLEW_RATE:
+			if (arg > LPI_SLEW_RATE_MAX) {
+				dev_err(pctldev->dev, "invalid slew rate %u for pin: %d\n",
+					arg, group);
+				return -EINVAL;
+			}
+
+			slew_offset = g->slew_offset;
+			if (slew_offset == NO_SLEW)
+				break;
+
+			mutex_lock(&pctrl->slew_access_lock);
+
+			sval = ioread32(pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
+			sval &= ~(LPI_SLEW_RATE_MASK << slew_offset);
+			sval |= arg << slew_offset;
+			iowrite32(sval, pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
+
+			mutex_unlock(&pctrl->slew_access_lock);
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	val = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG);
+
+	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
+	u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
+			  LPI_GPIO_OUT_STRENGTH_MASK);
+	u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);
+
+	lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
+
+	if (output_enabled) {
+		val = u32_encode_bits(value ? 1 : 0, LPI_GPIO_VALUE_OUT_MASK);
+		lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops lpi_gpio_pinconf_ops = {
+	.is_generic			= true,
+	.pin_config_group_get		= lpi_config_get,
+	.pin_config_group_set		= lpi_config_set,
+};
+
+static int lpi_gpio_direction_input(struct gpio_chip *chip, unsigned int pin)
+{
+	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	unsigned long config;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
+
+	return lpi_config_set(state->ctrl, pin, &config, 1);
+}
+
+static int lpi_gpio_direction_output(struct gpio_chip *chip,
+				     unsigned int pin, int val)
+{
+	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	unsigned long config;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, val);
+
+	return lpi_config_set(state->ctrl, pin, &config, 1);
+}
+
+static int lpi_gpio_get(struct gpio_chip *chip, unsigned int pin)
+{
+	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+
+	return lpi_gpio_read(state, pin, LPI_GPIO_VALUE_REG) &
+		LPI_GPIO_VALUE_IN_MASK;
+}
+
+static void lpi_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
+{
+	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	unsigned long config;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
+
+	lpi_config_set(state->ctrl, pin, &config, 1);
+}
+
+#ifdef CONFIG_DEBUG_FS
+#include <linux/seq_file.h>
+
+static unsigned int lpi_regval_to_drive(u32 val)
+{
+	return (val + 1) * 2;
+}
+
+static void lpi_gpio_dbg_show_one(struct seq_file *s,
+				  struct pinctrl_dev *pctldev,
+				  struct gpio_chip *chip,
+				  unsigned int offset,
+				  unsigned int gpio)
+{
+	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	struct pinctrl_pin_desc pindesc;
+	unsigned int func;
+	int is_out;
+	int drive;
+	int pull;
+	u32 ctl_reg;
+
+	static const char * const pulls[] = {
+		"no pull",
+		"pull down",
+		"keeper",
+		"pull up"
+	};
+
+	pctldev = pctldev ? : state->ctrl;
+	pindesc = pctldev->desc->pins[offset];
+	ctl_reg = lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG);
+	is_out = ctl_reg & LPI_GPIO_OE_MASK;
+
+	func = FIELD_GET(LPI_GPIO_FUNCTION_MASK, ctl_reg);
+	drive = FIELD_GET(LPI_GPIO_OUT_STRENGTH_MASK, ctl_reg);
+	pull = FIELD_GET(LPI_GPIO_PULL_MASK, ctl_reg);
+
+	seq_printf(s, " %-8s: %-3s %d", pindesc.name, is_out ? "out" : "in", func);
+	seq_printf(s, " %dmA", lpi_regval_to_drive(drive));
+	seq_printf(s, " %s", pulls[pull]);
+}
+
+static void lpi_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
+{
+	unsigned int gpio = chip->base;
+	unsigned int i;
+
+	for (i = 0; i < chip->ngpio; i++, gpio++) {
+		lpi_gpio_dbg_show_one(s, NULL, chip, i, gpio);
+		seq_puts(s, "\n");
+	}
+}
+
+#else
+#define lpi_gpio_dbg_show NULL
+#endif
+
+static const struct gpio_chip lpi_gpio_template = {
+	.direction_input	= lpi_gpio_direction_input,
+	.direction_output	= lpi_gpio_direction_output,
+	.get			= lpi_gpio_get,
+	.set			= lpi_gpio_set,
+	.request		= gpiochip_generic_request,
+	.free			= gpiochip_generic_free,
+	.dbg_show		= lpi_gpio_dbg_show,
+};
+
+static int lpi_pinctrl_probe(struct platform_device *pdev)
+{
+	const struct lpi_pinctrl_variant_data *data;
+	struct device *dev = &pdev->dev;
+	struct lpi_pinctrl *pctrl;
+	int ret;
+
+	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, pctrl);
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	pctrl->data = data;
+	pctrl->dev = &pdev->dev;
+
+	pctrl->clks[0].id = "core";
+	pctrl->clks[1].id = "audio";
+
+	pctrl->tlmm_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pctrl->tlmm_base))
+		return dev_err_probe(dev, PTR_ERR(pctrl->tlmm_base),
+				     "TLMM resource not provided\n");
+
+	pctrl->slew_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(pctrl->slew_base))
+		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
+				     "Slew resource not provided\n");
+
+	ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Can't get clocks\n");
+
+	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Can't enable clocks\n");
+
+	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
+	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
+	pctrl->desc.confops = &lpi_gpio_pinconf_ops;
+	pctrl->desc.owner = THIS_MODULE;
+	pctrl->desc.name = dev_name(dev);
+	pctrl->desc.pins = data->pins;
+	pctrl->desc.npins = data->npins;
+	pctrl->chip = lpi_gpio_template;
+	pctrl->chip.parent = dev;
+	pctrl->chip.base = -1;
+	pctrl->chip.ngpio = data->npins;
+	pctrl->chip.label = dev_name(dev);
+	pctrl->chip.of_gpio_n_cells = 2;
+	pctrl->chip.can_sleep = false;
+
+	mutex_init(&pctrl->slew_access_lock);
+
+	pctrl->ctrl = devm_pinctrl_register(dev, &pctrl->desc, pctrl);
+	if (IS_ERR(pctrl->ctrl)) {
+		ret = PTR_ERR(pctrl->ctrl);
+		dev_err(dev, "failed to add pin controller\n");
+		goto err_pinctrl;
+	}
+
+	ret = devm_gpiochip_add_data(dev, &pctrl->chip, pctrl);
+	if (ret) {
+		dev_err(pctrl->dev, "can't add gpio chip\n");
+		goto err_pinctrl;
+	}
+
+	return 0;
+
+err_pinctrl:
+	mutex_destroy(&pctrl->slew_access_lock);
+	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
+
+	return ret;
+}
+
+static int lpi_pinctrl_remove(struct platform_device *pdev)
+{
+	struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
+
+	mutex_destroy(&pctrl->slew_access_lock);
+	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
+
+	return 0;
+}
+
+static const struct of_device_id lpi_pinctrl_of_match[] = {
+	{
+	       .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
+	       .data = &sm8250_lpi_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
+
+static struct platform_driver lpi_pinctrl_driver = {
+	.driver = {
+		   .name = "qcom-lpass-lpi-pinctrl",
+		   .of_match_table = lpi_pinctrl_of_match,
+	},
+	.probe = lpi_pinctrl_probe,
+	.remove = lpi_pinctrl_remove,
+};
+
+module_platform_driver(lpi_pinctrl_driver);
+MODULE_DESCRIPTION("QTI LPI GPIO pin control driver");
+MODULE_LICENSE("GPL");
-- 
2.21.0

