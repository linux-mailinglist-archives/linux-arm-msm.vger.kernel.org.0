Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFF1388875
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 09:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235972AbhESHuP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 03:50:15 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:33954 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235121AbhESHuO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 03:50:14 -0400
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 8FDFE440909;
        Wed, 19 May 2021 10:48:40 +0300 (IDT)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc:     Baruch Siach <baruch@tkos.co.il>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robert.marko@sartura.hr>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] pwm: driver for qualcomm ipq6018 pwm block
Date:   Wed, 19 May 2021 10:48:44 +0300
Message-Id: <70ced827689b7ab35d8f3b07db8d9ccd1489e3e2.1621410526.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Driver for the PWM block in Qualcomm IPQ6018 line of SoCs. Based on
driver from downstream Codeaurora kernel tree. Removed support for older
(V1) variants because I have no access to that hardware.

Tested on IPQ6010 based hardware.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/pwm/Kconfig   |  12 ++
 drivers/pwm/Makefile  |   1 +
 drivers/pwm/pwm-ipq.c | 263 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 276 insertions(+)
 create mode 100644 drivers/pwm/pwm-ipq.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 9a4f66ae8070..54ef62a27bdc 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -260,6 +260,18 @@ config PWM_INTEL_LGM
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-intel-lgm.
 
+config PWM_IPQ
+	tristate "IPQ PWM support"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on HAVE_CLK && HAS_IOMEM
+	help
+	  Generic PWM framework driver for IPQ PWM block which supports
+	  4 pwm channels. Each of the these channels can be configured
+	  independent of each other.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-ipq.
+
 config PWM_IQS620A
 	tristate "Azoteq IQS620A PWM support"
 	depends on MFD_IQS62X || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 6374d3b1d6f3..73eb955dea1d 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_PWM_IMX1)		+= pwm-imx1.o
 obj-$(CONFIG_PWM_IMX27)		+= pwm-imx27.o
 obj-$(CONFIG_PWM_IMX_TPM)	+= pwm-imx-tpm.o
 obj-$(CONFIG_PWM_INTEL_LGM)	+= pwm-intel-lgm.o
+obj-$(CONFIG_PWM_IPQ)		+= pwm-ipq.o
 obj-$(CONFIG_PWM_IQS620A)	+= pwm-iqs620a.o
 obj-$(CONFIG_PWM_JZ4740)	+= pwm-jz4740.o
 obj-$(CONFIG_PWM_KEEMBAY)	+= pwm-keembay.o
diff --git a/drivers/pwm/pwm-ipq.c b/drivers/pwm/pwm-ipq.c
new file mode 100644
index 000000000000..885cf885fcf6
--- /dev/null
+++ b/drivers/pwm/pwm-ipq.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (c) 2016-2017, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <asm/div64.h>
+#include <linux/of_device.h>
+
+#define CLK_SRC_FREQ		(100*1000*1000)
+#define MAX_PWM_DEVICES		4
+
+/* The default period and duty cycle values to be configured. */
+#define DEFAULT_PERIOD_NS	10
+#define DEFAULT_DUTY_CYCLE_NS	5
+
+/*
+ * Enable bit is set to enable output toggling in pwm device.
+ * Update bit is set to reflect the changed divider and high duration
+ * values in register.
+ */
+#define PWM_ENABLE		0x80000000
+#define PWM_UPDATE		0x40000000
+
+/* The frequency range supported is 1Hz to 100MHz */
+#define MIN_PERIOD_NS	10
+#define MAX_PERIOD_NS	1000000000
+
+/*
+ * The max value specified for each field is based on the number of bits
+ * in the pwm control register for that field
+ */
+#define MAX_PWM_CFG		0xFFFF
+
+#define PWM_CTRL_HI_SHIFT	16
+
+#define PWM_CFG_REG0 0 /*PWM_DIV PWM_HI*/
+#define PWM_CFG_REG1 1 /*ENABLE UPDATE PWM_PRE_DIV*/
+
+struct ipq_pwm_chip {
+	struct pwm_chip chip;
+	struct clk *clk;
+	void __iomem *mem;
+};
+
+static struct ipq_pwm_chip *to_ipq_pwm_chip(struct pwm_chip *chip)
+{
+	return container_of(chip, struct ipq_pwm_chip, chip);
+}
+
+static unsigned ipq_pwm_reg_offset(struct pwm_device *pwm, unsigned reg)
+{
+	return ((pwm->hwpwm * 2) + reg) * 4;
+}
+
+static void config_div_and_duty(struct pwm_device *pwm, int pre_div,
+			unsigned long long pwm_div, unsigned long period_ns,
+			unsigned long long duty_ns)
+{
+	unsigned long hi_dur;
+	unsigned long long quotient;
+	unsigned long val = 0;
+	struct ipq_pwm_chip *ipq_chip = to_ipq_pwm_chip(pwm->chip);
+
+	/*
+	 * high duration = pwm duty * ( pwm div + 1)
+	 * pwm duty = duty_ns / period_ns
+	 */
+	quotient = (pwm_div + 1) * duty_ns;
+	do_div(quotient, period_ns);
+	hi_dur = quotient;
+
+	val |= ((hi_dur & MAX_PWM_CFG) << PWM_CTRL_HI_SHIFT);
+	val |= (pwm_div & MAX_PWM_CFG);
+	writel(val, ipq_chip->mem + ipq_pwm_reg_offset(pwm, PWM_CFG_REG0));
+	val = pre_div & MAX_PWM_CFG;
+	writel(val, ipq_chip->mem + ipq_pwm_reg_offset(pwm, PWM_CFG_REG1));
+}
+
+static int ipq_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct ipq_pwm_chip *ipq_chip = to_ipq_pwm_chip(pwm->chip);
+	unsigned offset = ipq_pwm_reg_offset(pwm, PWM_CFG_REG1);
+	unsigned long val;
+
+	val = readl(ipq_chip->mem + offset);
+	val |= (PWM_ENABLE | PWM_UPDATE);
+	writel(val, ipq_chip->mem + offset);
+
+	return 0;
+}
+
+static void ipq_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct ipq_pwm_chip *ipq_chip = to_ipq_pwm_chip(pwm->chip);
+	unsigned offset = ipq_pwm_reg_offset(pwm, PWM_CFG_REG1);
+	unsigned long val;
+
+	val = readl(ipq_chip->mem + offset);
+	val |= PWM_UPDATE;
+	val &= ~PWM_ENABLE;
+	writel(val, ipq_chip->mem + offset);
+}
+
+static int ipq_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
+						int duty_ns, int period_ns)
+{
+	struct ipq_pwm_chip *ipq_chip = to_ipq_pwm_chip(chip);
+	unsigned long freq;
+	int pre_div, close_pre_div, close_pwm_div;
+	int pwm_div;
+	long long diff;
+	unsigned long rate = clk_get_rate(ipq_chip->clk);
+	unsigned long min_diff = rate;
+	uint64_t fin_ps;
+
+	if (period_ns > MAX_PERIOD_NS || period_ns < MIN_PERIOD_NS) {
+		pr_err("PWM Frequency range supported is %dHz to %dHz\n"
+			"Switching to default configuration values\n",
+		       (int)NSEC_PER_SEC / MAX_PERIOD_NS,
+		       (int)NSEC_PER_SEC / MIN_PERIOD_NS);
+		period_ns = DEFAULT_PERIOD_NS;
+		duty_ns = DEFAULT_DUTY_CYCLE_NS;
+		pwm->state.period = period_ns;
+		pwm->state.duty_cycle = duty_ns;
+	}
+
+	/* freq in Hz for period in nano second*/
+	freq = NSEC_PER_SEC / period_ns;
+	fin_ps = (uint64_t)NSEC_PER_SEC * 1000;
+	do_div(fin_ps, rate);
+	close_pre_div = MAX_PWM_CFG;
+	close_pwm_div = MAX_PWM_CFG;
+
+	ipq_pwm_disable(chip, pwm);
+
+	for (pre_div = 0; pre_div <= MAX_PWM_CFG; pre_div++) {
+		pwm_div = DIV_ROUND_CLOSEST_ULL((uint64_t)period_ns * 1000,
+							fin_ps * (pre_div + 1));
+		pwm_div--;
+		if (pwm_div <= MAX_PWM_CFG) {
+			diff = (uint64_t)rate - ((uint64_t)freq * (pre_div + 1) * (pwm_div + 1));
+
+			if (diff < 0)
+				diff = -diff;
+			if (!diff) {
+				close_pre_div = pre_div;
+				close_pwm_div = pwm_div;
+				break;
+			}
+			if (diff < min_diff) {
+				min_diff = diff;
+				close_pre_div = pre_div;
+				close_pwm_div = pwm_div;
+			}
+		}
+	}
+
+	/* config divider values for the closest possible frequency */
+	config_div_and_duty(pwm, close_pre_div, close_pwm_div,
+					period_ns, duty_ns);
+	if (pwm->state.enabled)
+		ipq_pwm_enable(chip, pwm);
+
+	return 0;
+}
+
+static int ipq_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	pwm->state.period = DEFAULT_PERIOD_NS;
+	pwm->state.duty_cycle = DEFAULT_DUTY_CYCLE_NS;
+
+	ipq_pwm_config(chip, pwm, pwm->state.duty_cycle, pwm->state.period);
+
+	return 0;
+}
+
+static void ipq_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	ipq_pwm_disable(chip, pwm);
+}
+
+static struct pwm_ops ipq_pwm_ops = {
+	.request = ipq_pwm_request,
+	.free = ipq_pwm_free,
+	.config = ipq_pwm_config,
+	.enable = ipq_pwm_enable,
+	.disable = ipq_pwm_disable,
+	.owner = THIS_MODULE,
+};
+
+static int ipq_pwm_probe(struct platform_device *pdev)
+{
+	struct ipq_pwm_chip *pwm;
+	struct device *dev;
+	int ret;
+
+	dev = &pdev->dev;
+	pwm = devm_kzalloc(dev, sizeof(*pwm), GFP_KERNEL);
+	if (!pwm) {
+		dev_err(dev, "failed to allocate memory\n");
+		return -ENOMEM;
+	}
+
+	platform_set_drvdata(pdev, pwm);
+
+	pwm->mem = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pwm->mem))
+		return PTR_ERR(pwm->mem);
+
+	pwm->clk = devm_clk_get(dev, "core");
+	if (!IS_ERR(pwm->clk)) {
+		ret = clk_set_rate(pwm->clk, CLK_SRC_FREQ);
+		if (ret)
+			return ret;
+		ret = clk_prepare_enable(pwm->clk);
+		if (ret)
+			return ret;
+	}
+
+	pwm->chip.dev = dev;
+	pwm->chip.ops = &ipq_pwm_ops;
+	pwm->chip.npwm = MAX_PWM_DEVICES;
+
+	ret = pwmchip_add(&pwm->chip);
+	if (ret < 0) {
+		dev_err(dev, "pwmchip_add() failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ipq_pwm_remove(struct platform_device *pdev)
+{
+	struct ipq_pwm_chip *pwm = platform_get_drvdata(pdev);
+
+	return pwmchip_remove(&pwm->chip);
+}
+
+static const struct of_device_id pwm_ipq_dt_match[] = {
+	{ .compatible = "qcom,pwm-ipq6018", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, pwm_ipq_dt_match);
+
+static struct platform_driver ipq_pwm_driver = {
+	.driver = {
+		.name = "ipq-pwm",
+		.owner = THIS_MODULE,
+		.of_match_table = pwm_ipq_dt_match,
+	},
+	.probe = ipq_pwm_probe,
+	.remove = ipq_pwm_remove,
+};
+
+module_platform_driver(ipq_pwm_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.30.2

