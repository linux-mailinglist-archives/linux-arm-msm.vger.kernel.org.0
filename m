Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D258E4BB68A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 11:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbiBRKNA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 05:13:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233358AbiBRKNA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 05:13:00 -0500
Received: from mxd1.seznam.cz (mxd1.seznam.cz [IPv6:2a02:598:a::78:210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7066456205;
        Fri, 18 Feb 2022 02:12:42 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc26b.ko.seznam.cz (email-smtpc26b.ko.seznam.cz [10.53.18.37])
        id 25daeccf7ed4b8a624732091;
        Fri, 18 Feb 2022 11:12:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1645179152; bh=YWs8UgfMXOPF4x+aQbl+9ER84ZfE+lv6cOWxe+eZbrs=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
         X-szn-frgc;
        b=egFdQ0z8pW/7KqR2vj1H3ImoIqrjG9HQuogu4yQmK31KgwHGxH4xS1EBJ6JbTxlBa
         672IzbLHupqcfjZjZW+DtK9XeflBdSlzbjECRE+HjNwYZF6XIAKi34oxu+owLFzemc
         O/89AGVyp+Y5alBl9aYpFTgjtGQxEDqG+bv8iEJU=
Received: from localhost.localdomain (ip-111-27.static.ccinternet.cz [147.161.27.111])
        by email-relay21.ko.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Fri, 18 Feb 2022 11:12:03 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH v7 4/5] drivers: bus: add driver for initializing the SSC bus on (some) qcom SoCs
Date:   Fri, 18 Feb 2022 11:09:32 +0100
Message-Id: <20220218100933.32736-4-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100933.32736-1-michael.srba@seznam.cz>
References: <20220218100933.32736-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <261e19f7-272d-4b0c-b01a-831c03c7dad9>
X-szn-frgc: <0>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

Add bindings for the AHB bus which exposes the SCC block in the global
address space. This bus (and the SSC block itself) is present on certain
qcom SoCs.

In typical configuration, this bus (as some of the clocks and registers
that we need to manipulate) is not accessible to Linux, and the resources
on this bus are indirectly accessed by communicating with a hexagon CPU
core residing in the SSC block. In this configuration, the hypervisor is
the one performing the bus initialization for the purposes of bringing
the haxagon CPU core out of reset.

However, it is possible to change the configuration, in which case this
driver will initialize the bus.

In combination with drivers for resources on the SSC bus, this driver can
aid in debugging, and for example with a TLMM driver can be used to
directly access SSC-dedicated GPIO pins, removing the need to commit
to a particular usecase during hw design.

Finally, until open firmware for the hexagon core is available, this
approach allows for using sensors hooked up to SSC-dedicated GPIO pins
on mainline Linux simply by utilizing the existing in-tree drivers for
these sensors.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 CHANGES:
 - v2: none
 - v3: fix clang warning
 - v4: address the issues pointed out in the review
 - v5: none
 - v6: restore alphabetic ordering in Makefile against v5.17-rc4
 - v7: use imperative in commit message
---
 drivers/bus/Kconfig              |   6 +
 drivers/bus/Makefile             |   1 +
 drivers/bus/qcom-ssc-block-bus.c | 383 +++++++++++++++++++++++++++++++
 3 files changed, 390 insertions(+)
 create mode 100644 drivers/bus/qcom-ssc-block-bus.c

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 3c68e174a113..9e29d1da9a61 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -152,6 +152,12 @@ config QCOM_EBI2
 	  Interface 2, which can be used to connect things like NAND Flash,
 	  SRAM, ethernet adapters, FPGAs and LCD displays.
 
+config QCOM_SSC_BLOCK_BUS
+	bool "Qualcomm SSC Block Bus Init Driver"
+	  help
+	  Say y here to enable support for initializing the bus that connects the SSC block's internal
+	  bus to the cNoC on (some) qcom SoCs
+
 config SUN50I_DE2_BUS
 	bool "Allwinner A64 DE2 Bus Driver"
 	  default ARM64
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index 52c2f35a26a9..e6756e83a9c4 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
 
 obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
+obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
 obj-$(CONFIG_OF)		+= simple-pm-bus.o
diff --git a/drivers/bus/qcom-ssc-block-bus.c b/drivers/bus/qcom-ssc-block-bus.c
new file mode 100644
index 000000000000..e489f5614e90
--- /dev/null
+++ b/drivers/bus/qcom-ssc-block-bus.c
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2021, Michael Srba
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+/* AXI Halt Register Offsets */
+#define AXI_HALTREQ_REG			0x0
+#define AXI_HALTACK_REG			0x4
+#define AXI_IDLE_REG			0x8
+
+static const char *const qcom_ssc_block_pd_names[] = {
+	"ssc_cx",
+	"ssc_mx"
+};
+
+struct qcom_ssc_block_bus_data {
+	int num_pds;
+	const char *const *pd_names;
+	struct device *pds[ARRAY_SIZE(qcom_ssc_block_pd_names)];
+	char __iomem *reg_mpm_sscaon_config0; // MPM - msm power manager; AON - always-on
+	char __iomem *reg_mpm_sscaon_config1; // that's as much as we know about these
+	struct regmap *halt_map;
+	u32 ssc_axi_halt;
+	struct clk *xo_clk;
+	struct clk *aggre2_clk;
+	struct clk *gcc_im_sleep_clk;
+	struct clk *aggre2_north_clk;
+	struct clk *ssc_xo_clk;
+	struct clk *ssc_ahbs_clk;
+	struct reset_control *ssc_bcr;
+	struct reset_control *ssc_reset;
+};
+
+static void reg32_set_bits(char __iomem *reg, u32 value)
+{
+	u32 tmp = ioread32(reg);
+
+	iowrite32(tmp | value, reg);
+}
+
+static void reg32_clear_bits(char __iomem *reg, u32 value)
+{
+	u32 tmp = ioread32(reg);
+
+	iowrite32(tmp & (~value), reg);
+}
+
+
+static int qcom_ssc_block_bus_init(struct device *dev)
+{
+	int ret;
+
+	struct qcom_ssc_block_bus_data *data = dev_get_drvdata(dev);
+
+	ret = clk_prepare_enable(data->xo_clk);
+	if (ret) {
+		dev_err(dev, "error enabling xo_clk: %d\n", ret);
+		goto err_xo_clk;
+	}
+
+	ret = clk_prepare_enable(data->aggre2_clk);
+	if (ret) {
+		dev_err(dev, "error enabling aggre2_clk: %d\n", ret);
+		goto err_aggre2_clk;
+	}
+
+	ret = clk_prepare_enable(data->gcc_im_sleep_clk);
+	if (ret) {
+		dev_err(dev, "error enabling gcc_im_sleep_clk: %d\n", ret);
+		goto err_gcc_im_sleep_clk;
+	}
+
+	reg32_clear_bits(data->reg_mpm_sscaon_config0, BIT(4) | BIT(5));
+	reg32_clear_bits(data->reg_mpm_sscaon_config1, BIT(31));
+
+	ret = clk_prepare_enable(data->aggre2_north_clk);
+	if (ret) {
+		dev_err(dev, "error enabling aggre2_north_clk: %d\n", ret);
+		goto err_aggre2_north_clk;
+	}
+
+	ret = reset_control_deassert(data->ssc_reset);
+	if (ret) {
+		dev_err(dev, "error deasserting ssc_reset: %d\n", ret);
+		goto err_ssc_reset;
+	}
+
+	ret = reset_control_deassert(data->ssc_bcr);
+	if (ret) {
+		dev_err(dev, "error deasserting ssc_bcr: %d\n", ret);
+		goto err_ssc_bcr;
+	}
+
+	regmap_write(data->halt_map, data->ssc_axi_halt + AXI_HALTREQ_REG, 0);
+
+	ret = clk_prepare_enable(data->ssc_xo_clk);
+	if (ret) {
+		dev_err(dev, "error deasserting ssc_xo_clk: %d\n", ret);
+		goto err_ssc_xo_clk;
+	}
+
+	ret = clk_prepare_enable(data->ssc_ahbs_clk);
+	if (ret) {
+		dev_err(dev, "error deasserting ssc_ahbs_clk: %d\n", ret);
+		goto err_ssc_ahbs_clk;
+	}
+
+	return 0;
+
+err_ssc_ahbs_clk:
+	clk_disable(data->ssc_xo_clk);
+
+err_ssc_xo_clk:
+	regmap_write(data->halt_map, data->ssc_axi_halt + AXI_HALTREQ_REG, 1);
+
+	reset_control_assert(data->ssc_bcr);
+
+err_ssc_bcr:
+	reset_control_assert(data->ssc_reset);
+
+err_ssc_reset:
+	clk_disable(data->aggre2_north_clk);
+
+err_aggre2_north_clk:
+	reg32_set_bits(data->reg_mpm_sscaon_config0, BIT(4) | BIT(5));
+	reg32_set_bits(data->reg_mpm_sscaon_config1, BIT(31));
+
+	clk_disable(data->gcc_im_sleep_clk);
+
+err_gcc_im_sleep_clk:
+	clk_disable(data->aggre2_clk);
+
+err_aggre2_clk:
+	clk_disable(data->xo_clk);
+
+err_xo_clk:
+	return ret;
+}
+
+static void qcom_ssc_block_bus_deinit(struct device *dev)
+{
+	int ret;
+
+	struct qcom_ssc_block_bus_data *data = dev_get_drvdata(dev);
+
+	clk_disable(data->ssc_xo_clk);
+	clk_disable(data->ssc_ahbs_clk);
+
+	ret = reset_control_assert(data->ssc_bcr);
+	if (ret)
+		dev_err(dev, "error asserting ssc_bcr: %d\n", ret);
+
+	regmap_write(data->halt_map, data->ssc_axi_halt + AXI_HALTREQ_REG, 1);
+
+	reg32_set_bits(data->reg_mpm_sscaon_config1, BIT(31));
+	reg32_set_bits(data->reg_mpm_sscaon_config0, BIT(4) | BIT(5));
+
+	ret = reset_control_assert(data->ssc_reset);
+	if (ret)
+		dev_err(dev, "error asserting ssc_reset: %d\n", ret);
+
+	clk_disable(data->gcc_im_sleep_clk);
+
+	clk_disable(data->aggre2_north_clk);
+
+	clk_disable(data->aggre2_clk);
+	clk_disable(data->xo_clk);
+}
+
+
+static int qcom_ssc_block_bus_pds_attach(struct device *dev, struct device **pds,
+					 const char *const *pd_names, size_t num_pds)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < num_pds; i++) {
+		pds[i] = dev_pm_domain_attach_by_name(dev, pd_names[i]);
+		if (IS_ERR_OR_NULL(pds[i])) {
+			ret = PTR_ERR(pds[i]) ? : -ENODATA;
+			goto unroll_attach;
+		}
+	}
+
+	return num_pds;
+
+unroll_attach:
+	for (i--; i >= 0; i--)
+		dev_pm_domain_detach(pds[i], false);
+
+	return ret;
+};
+
+static void qcom_ssc_block_bus_pds_detach(struct device *dev, struct device **pds, size_t num_pds)
+{
+	int i;
+
+	for (i = 0; i < num_pds; i++)
+		dev_pm_domain_detach(pds[i], false);
+}
+
+static int qcom_ssc_block_bus_pds_enable(struct device **pds, size_t num_pds)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < num_pds; i++) {
+		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		ret = pm_runtime_get_sync(pds[i]);
+		if (ret < 0)
+			goto unroll_pd_votes;
+	}
+
+	return 0;
+
+unroll_pd_votes:
+	for (i--; i >= 0; i--) {
+		dev_pm_genpd_set_performance_state(pds[i], 0);
+		pm_runtime_put(pds[i]);
+	}
+
+	return ret;
+};
+
+static void qcom_ssc_block_bus_pds_disable(struct device **pds, size_t num_pds)
+{
+	int i;
+
+	for (i = 0; i < num_pds; i++) {
+		dev_pm_genpd_set_performance_state(pds[i], 0);
+		pm_runtime_put(pds[i]);
+	}
+}
+
+static int qcom_ssc_block_bus_probe(struct platform_device *pdev)
+{
+	struct qcom_ssc_block_bus_data *data;
+	struct device_node *np = pdev->dev.of_node;
+	struct of_phandle_args halt_args;
+	struct resource *res;
+	int ret;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, data);
+
+	data->pd_names = qcom_ssc_block_pd_names;
+	data->num_pds = ARRAY_SIZE(qcom_ssc_block_pd_names);
+
+	// power domains
+	ret = qcom_ssc_block_bus_pds_attach(&pdev->dev, data->pds, data->pd_names, data->num_pds);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "error when attaching power domains\n");
+
+	ret = qcom_ssc_block_bus_pds_enable(data->pds, data->num_pds);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "error when enabling power domains\n");
+
+	// the meaning of the bits in these two registers is sadly not documented,
+	// the set/clear operations are just copying what qcom does
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpm_sscaon_config0");
+	data->reg_mpm_sscaon_config0 = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(data->reg_mpm_sscaon_config0))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->reg_mpm_sscaon_config0),
+				     "Failed to ioremap mpm_sscaon_config0\n");
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpm_sscaon_config1");
+	data->reg_mpm_sscaon_config1 = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(data->reg_mpm_sscaon_config1))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->reg_mpm_sscaon_config1),
+				     "Failed to ioremap mpm_sscaon_config1\n");
+
+	// resets
+	data->ssc_bcr = devm_reset_control_get_exclusive(&pdev->dev, "ssc_bcr");
+	if (IS_ERR(data->ssc_bcr))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->ssc_bcr),
+				     "Failed to acquire reset: scc_bcr\n");
+
+	data->ssc_reset = devm_reset_control_get_exclusive(&pdev->dev, "ssc_reset");
+	if (IS_ERR(data->ssc_reset))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->ssc_reset),
+				     "Failed to acquire reset: ssc_reset:\n");
+
+	// clocks
+	data->xo_clk = devm_clk_get(&pdev->dev, "xo");
+	if (IS_ERR(data->xo_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->xo_clk),
+				     "Failed to get clock: xo\n");
+
+	data->aggre2_clk = devm_clk_get(&pdev->dev, "aggre2");
+	if (IS_ERR(data->aggre2_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->aggre2_clk),
+				     "Failed to get clock: aggre2\n");
+
+	data->gcc_im_sleep_clk = devm_clk_get(&pdev->dev, "gcc_im_sleep");
+	if (IS_ERR(data->gcc_im_sleep_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->gcc_im_sleep_clk),
+				     "Failed to get clock: gcc_im_sleep\n");
+
+	data->aggre2_north_clk = devm_clk_get(&pdev->dev, "aggre2_north");
+	if (IS_ERR(data->aggre2_north_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->aggre2_north_clk),
+				     "Failed to get clock: aggre2_north\n");
+
+	data->ssc_xo_clk = devm_clk_get(&pdev->dev, "ssc_xo");
+	if (IS_ERR(data->ssc_xo_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->ssc_xo_clk),
+				     "Failed to get clock: ssc_xo\n");
+
+	data->ssc_ahbs_clk = devm_clk_get(&pdev->dev, "ssc_ahbs");
+	if (IS_ERR(data->ssc_ahbs_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->ssc_ahbs_clk),
+				     "Failed to get clock: ssc_ahbs\n");
+
+	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node, "qcom,halt-regs", 1, 0,
+					       &halt_args);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Failed to parse qcom,halt-regs\n");
+
+	data->halt_map = syscon_node_to_regmap(halt_args.np);
+	of_node_put(halt_args.np);
+	if (IS_ERR(data->halt_map))
+		return PTR_ERR(data->halt_map);
+
+	data->ssc_axi_halt = halt_args.args[0];
+
+	qcom_ssc_block_bus_init(&pdev->dev);
+
+	of_platform_populate(np, NULL, NULL, &pdev->dev);
+
+	return 0;
+}
+
+static int qcom_ssc_block_bus_remove(struct platform_device *pdev)
+{
+	struct qcom_ssc_block_bus_data *data = platform_get_drvdata(pdev);
+
+	qcom_ssc_block_bus_deinit(&pdev->dev);
+
+	iounmap(data->reg_mpm_sscaon_config0);
+	iounmap(data->reg_mpm_sscaon_config1);
+
+	qcom_ssc_block_bus_pds_disable(data->pds, data->num_pds);
+	qcom_ssc_block_bus_pds_detach(&pdev->dev, data->pds, data->num_pds);
+	pm_runtime_disable(&pdev->dev);
+	pm_clk_destroy(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id qcom_ssc_block_bus_of_match[] = {
+	{ .compatible = "qcom,ssc-block-bus", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, qcom_ssc_block_bus_of_match);
+
+static struct platform_driver qcom_ssc_block_bus_driver = {
+	.probe = qcom_ssc_block_bus_probe,
+	.remove = qcom_ssc_block_bus_remove,
+	.driver = {
+		.name = "qcom-ssc-block-bus",
+		.of_match_table = qcom_ssc_block_bus_of_match,
+	},
+};
+
+module_platform_driver(qcom_ssc_block_bus_driver);
+
+MODULE_DESCRIPTION("A driver for handling the init sequence needed for accessing the SSC block on (some) qcom SoCs over AHB");
+MODULE_AUTHOR("Michael Srba <Michael.Srba@seznam.cz>");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

