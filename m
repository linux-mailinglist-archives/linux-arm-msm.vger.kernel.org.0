Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4C7474C4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2019 15:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbfFPN36 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jun 2019 09:29:58 -0400
Received: from onstation.org ([52.200.56.107]:53656 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727255AbfFPN3t (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jun 2019 09:29:49 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 360573E93E;
        Sun, 16 Jun 2019 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1560691788;
        bh=3lYpop7VdT95zdg6bDKjM5aBmjTfcXUGw9vMX/ODVa0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gpA/zqIR7Mv86/vMmFfriZzvqCr2XN+l7x/ssuWREFu+ZAurW9JNLbIQ30+CoRzXi
         MARKpk2Hh5BAdOEQVV0N6VN35pdFVIsWyQtLoq5oES5skL85RGQkP2u6E4xrBzEFSg
         QUolUGRDzkkFf25BjuPfnPXz2rvHraJX/Dtu7/E4=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, airlied@linux.ie, daniel@ffwll.ch,
        mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH 5/6] soc: qcom: add OCMEM driver
Date:   Sun, 16 Jun 2019 09:29:29 -0400
Message-Id: <20190616132930.6942-6-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190616132930.6942-1-masneyb@onstation.org>
References: <20190616132930.6942-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@gmail.com>

The OCMEM driver handles allocation and configuration of the On Chip
MEMory that is present on some Snapdragon SoCs.

Devices which have OCMEM do not have GMEM inside the GPU core, so the
GPU must instead use OCMEM to be functional. Since currently the GPU
is the only OCMEM user with an upstream driver, this is just a minimal
implementation sufficient for statically allocating to the GPU it's
chunk of OCMEM.

Signed-off-by: Rob Clark <robdclark@gmail.com>
Co-developed-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since Rob's last version of this patch:
https://patchwork.kernel.org/patch/7379801/
- reformatted driver to allow multiple instances
- updated logging of error paths during device probing
- remove unused psgsc_ctrl
- remove _clk from clock names
- propagate error code from devm_ioremap_resource()
- use device_get_match_data()
- SPDX license tags
- remove QCOM_SMD in Kconfig
- select ARCH_QCOM in Kconfig
- select QCOM_SCM in Kconfig
- longer description in Kconfig

 drivers/soc/qcom/Kconfig     |  10 +
 drivers/soc/qcom/Makefile    |   1 +
 drivers/soc/qcom/ocmem.c     | 402 +++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/ocmem.xml.h |  86 ++++++++
 include/soc/qcom/ocmem.h     |  34 +++
 5 files changed, 533 insertions(+)
 create mode 100644 drivers/soc/qcom/ocmem.c
 create mode 100644 drivers/soc/qcom/ocmem.xml.h
 create mode 100644 include/soc/qcom/ocmem.h

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 880cf0290962..998d94d60a3c 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -62,6 +62,16 @@ config QCOM_MDT_LOADER
 	tristate
 	select QCOM_SCM
 
+config QCOM_OCMEM
+	tristate "Qualcomm On Chip Memory (OCMEM) driver"
+	depends on ARCH_QCOM
+	select QCOM_SCM
+	help
+          The On Chip Memory (OCMEM) allocator allows various clients to
+          allocate memory from OCMEM based on performance, latency and power
+          requirements. This is typically used by the GPU, camera/video, and
+          audio components on some Snapdragon SoCs.
+
 config QCOM_PM
 	bool "Qualcomm Power Management"
 	depends on ARCH_QCOM && !ARM64
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index ffe519b0cb66..76ac469f548c 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
 obj-$(CONFIG_QCOM_GLINK_SSR) +=	glink_ssr.o
 obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
+obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
 obj-$(CONFIG_QCOM_PM)	+=	spm.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
new file mode 100644
index 000000000000..5ebf5031b6c5
--- /dev/null
+++ b/drivers/soc/qcom/ocmem.c
@@ -0,0 +1,402 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Brian Masney <masneyb@onstation.org>
+ * Copyright (C) 2015 Red Hat. Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/qcom_scm.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include <soc/qcom/ocmem.h>
+#include "ocmem.xml.h"
+
+enum region_mode {
+	WIDE_MODE = 0x0,
+	THIN_MODE,
+	MODE_DEFAULT = WIDE_MODE,
+};
+
+struct ocmem_region {
+	bool interleaved;
+	enum region_mode mode;
+	unsigned int num_macros;
+	enum ocmem_macro_state macro_state[4];
+	unsigned long macro_size;
+	unsigned long region_size;
+};
+
+struct ocmem_config {
+	uint8_t num_regions;
+	uint32_t macro_size;
+};
+
+struct ocmem {
+	struct device *dev;
+	const struct ocmem_config *config;
+	struct resource *ocmem_mem;
+	struct clk *core_clk;
+	struct clk *iface_clk;
+	void __iomem *mmio;
+	unsigned int num_ports;
+	unsigned int num_macros;
+	bool interleaved;
+	struct ocmem_region *regions;
+};
+
+#define FIELD(val, name) (((val) & name ## __MASK) >> name ## __SHIFT)
+
+static inline void ocmem_write(struct ocmem *ocmem, u32 reg, u32 data)
+{
+	writel(data, ocmem->mmio + reg);
+}
+
+static inline u32 ocmem_read(struct ocmem *ocmem, u32 reg)
+{
+	return readl(ocmem->mmio + reg);
+}
+
+static int ocmem_clk_enable(struct ocmem *ocmem)
+{
+	int ret;
+
+	ret = clk_prepare_enable(ocmem->core_clk);
+	if (ret) {
+		dev_info(ocmem->dev, "Fail to enable core clk\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ocmem->iface_clk);
+	if (ret) {
+		dev_info(ocmem->dev, "Fail to enable iface clk\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ocmem_clk_disable(struct ocmem *ocmem)
+{
+	clk_disable_unprepare(ocmem->iface_clk);
+	clk_disable_unprepare(ocmem->core_clk);
+}
+
+static int ocmem_dev_remove(struct platform_device *pdev)
+{
+	struct ocmem *ocmem = platform_get_drvdata(pdev);
+
+	ocmem_clk_disable(ocmem);
+
+	return 0;
+}
+
+static void update_ocmem(struct ocmem *ocmem)
+{
+	uint32_t region_mode_ctrl = 0x0;
+	unsigned int pos = 0, i = 0;
+
+	if (!qcom_scm_ocmem_lock_available()) {
+		for (i = 0; i < ocmem->config->num_regions; i++) {
+			struct ocmem_region *region = &ocmem->regions[i];
+
+			pos = i << 2;
+			if (region->mode == THIN_MODE)
+				region_mode_ctrl |= BIT(pos);
+		}
+
+		dev_dbg(ocmem->dev, "ocmem_region_mode_control %x\n",
+			region_mode_ctrl);
+		ocmem_write(ocmem, REG_OCMEM_REGION_MODE_CTL, region_mode_ctrl);
+	}
+
+	for (i = 0; i < ocmem->config->num_regions; i++) {
+		struct ocmem_region *region = &ocmem->regions[i];
+		u32 data;
+
+		data = OCMEM_PSGSC_CTL_MACRO0_MODE(region->macro_state[0]) |
+			OCMEM_PSGSC_CTL_MACRO1_MODE(region->macro_state[1]) |
+			OCMEM_PSGSC_CTL_MACRO2_MODE(region->macro_state[2]) |
+			OCMEM_PSGSC_CTL_MACRO3_MODE(region->macro_state[3]);
+
+		ocmem_write(ocmem, REG_OCMEM_PSGSC_CTL(i), data);
+	}
+}
+
+static unsigned long phys_to_offset(struct ocmem *ocmem,
+				    unsigned long addr)
+{
+	if (addr < ocmem->ocmem_mem->start || addr >= ocmem->ocmem_mem->end)
+		return 0;
+
+	return addr - ocmem->ocmem_mem->start;
+}
+
+static unsigned long device_address(struct ocmem *ocmem,
+				    enum ocmem_client client,
+				    unsigned long addr)
+{
+	/* TODO, gpu uses phys_to_offset, but others do not.. */
+	return phys_to_offset(ocmem, addr);
+}
+
+static void update_range(struct ocmem *ocmem, struct ocmem_buf *buf,
+			 enum ocmem_macro_state mstate, enum region_mode rmode)
+{
+	unsigned long offset = 0;
+	int i, j;
+
+	/*
+	 * TODO probably should assert somewhere that range is aligned
+	 * to macro boundaries..
+	 */
+
+	for (i = 0; i < ocmem->config->num_regions; i++) {
+		struct ocmem_region *region = &ocmem->regions[i];
+
+		if (buf->offset <= offset && offset < buf->offset + buf->len)
+			region->mode = rmode;
+
+		for (j = 0; j < region->num_macros; j++) {
+			if (buf->offset <= offset &&
+			    offset < buf->offset + buf->len)
+				region->macro_state[j] = mstate;
+
+			offset += region->macro_size;
+		}
+	}
+
+	update_ocmem(ocmem);
+}
+
+struct ocmem *of_get_ocmem(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct device_node *devnode;
+
+	devnode = of_parse_phandle(dev->of_node, "ocmem", 0);
+	if (!devnode) {
+		dev_err(dev, "Cannot look up ocmem phandle\n");
+		return NULL;
+	}
+
+	pdev = of_find_device_by_node(devnode);
+	if (!pdev) {
+		dev_err(dev, "Cannot find device node %s\n", devnode->name);
+		return NULL;
+	}
+
+	return platform_get_drvdata(pdev);
+}
+EXPORT_SYMBOL(of_get_ocmem);
+
+struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem, enum ocmem_client client,
+				 unsigned long size)
+{
+	struct ocmem_buf *buf;
+
+	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
+	buf->offset = 0;
+	buf->addr = device_address(ocmem, client, buf->offset);
+	buf->len = size;
+
+	update_range(ocmem, buf, CORE_ON, WIDE_MODE);
+
+	if (qcom_scm_ocmem_lock_available()) {
+		int ret;
+
+		ret = qcom_scm_ocmem_lock(QCOM_SCM_OCMEM_GRAPHICS_ID,
+					  buf->offset, buf->len, WIDE_MODE);
+		if (ret)
+			dev_err(ocmem->dev, "could not lock: %d\n", ret);
+	} else {
+		if (client == OCMEM_GRAPHICS) {
+			ocmem_write(ocmem, REG_OCMEM_GFX_MPU_START,
+				    buf->offset);
+			ocmem_write(ocmem, REG_OCMEM_GFX_MPU_END,
+				    buf->offset + buf->len);
+		}
+	}
+
+	return buf;
+}
+EXPORT_SYMBOL(ocmem_allocate);
+
+void ocmem_free(struct ocmem *ocmem, enum ocmem_client client,
+		struct ocmem_buf *buf)
+{
+	update_range(ocmem, buf, CLK_OFF, MODE_DEFAULT);
+
+	if (qcom_scm_ocmem_lock_available()) {
+		int ret;
+
+		ret = qcom_scm_ocmem_unlock(QCOM_SCM_OCMEM_GRAPHICS_ID,
+					    buf->offset, buf->len);
+		if (ret)
+			dev_err(ocmem->dev, "could not unlock: %d\n", ret);
+	} else {
+		if (client == OCMEM_GRAPHICS) {
+			ocmem_write(ocmem, REG_OCMEM_GFX_MPU_START, 0x0);
+			ocmem_write(ocmem, REG_OCMEM_GFX_MPU_END, 0x0);
+		}
+	}
+
+	kfree(buf);
+}
+EXPORT_SYMBOL(ocmem_free);
+
+static int ocmem_dev_probe(struct platform_device *pdev)
+{
+	struct ocmem *ocmem;
+	uint32_t reg, num_banks, region_size;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	int i, j, ret;
+
+	if (!qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
+	ocmem = devm_kzalloc(dev, sizeof(*ocmem), GFP_KERNEL);
+	if (!ocmem)
+		return -ENOMEM;
+
+	ocmem->dev = dev;
+	ocmem->config = device_get_match_data(dev);
+
+	ocmem->core_clk = devm_clk_get(dev, "core");
+	if (IS_ERR(ocmem->core_clk)) {
+		if (PTR_ERR(ocmem->core_clk) != -EPROBE_DEFER)
+			dev_err(dev, "Unable to get the core clock\n");
+
+		return PTR_ERR(ocmem->core_clk);
+	}
+
+	ocmem->iface_clk = devm_clk_get(dev, "iface");
+	if (IS_ERR(ocmem->iface_clk)) {
+		if (PTR_ERR(ocmem->iface_clk) != -EPROBE_DEFER)
+			dev_err(dev, "Unable to get the iface clock\n");
+
+		return PTR_ERR(ocmem->iface_clk);
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+					   "ocmem_ctrl_physical");
+	if (!res) {
+		dev_err(dev, "Could not get ocmem_ctrl_physical region\n");
+		return -ENXIO;
+	}
+
+	ocmem->mmio = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(ocmem->mmio)) {
+		dev_err(&pdev->dev,
+			"Failed to ioremap ocmem_ctrl_physical resource\n");
+		return PTR_ERR(ocmem->mmio);
+	}
+
+	ocmem->ocmem_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+							"ocmem_physical");
+	if (!ocmem->ocmem_mem) {
+		dev_err(dev, "Could not get ocmem_physical region\n");
+		return -ENXIO;
+	}
+
+	/* The core clock is synchronous with graphics */
+	WARN_ON(clk_set_rate(ocmem->core_clk, 1000) < 0);
+
+	ret = ocmem_clk_enable(ocmem);
+	if (ret)
+		return ret;
+
+	if (qcom_scm_restore_sec_config_available()) {
+		dev_dbg(dev, "configuring scm\n");
+		ret = qcom_scm_restore_sec_config(&pdev->dev,
+						  QCOM_SCM_OCMEM_DEV_ID);
+		if (ret) {
+			dev_err(dev, "Could not enable secure configuration\n");
+			goto err_clk_disable;
+		}
+	}
+
+	reg = ocmem_read(ocmem, REG_OCMEM_HW_PROFILE);
+	ocmem->num_ports = FIELD(reg, OCMEM_HW_PROFILE_NUM_PORTS);
+	ocmem->num_macros = FIELD(reg, OCMEM_HW_PROFILE_NUM_MACROS);
+	ocmem->interleaved = !!(reg & OCMEM_HW_PROFILE_INTERLEAVING);
+
+	num_banks = ocmem->num_ports / 2;
+	region_size = ocmem->config->macro_size * num_banks;
+
+	dev_info(dev, "%u ports, %u regions, %u macros, %sinterleaved\n",
+		 ocmem->num_ports, ocmem->config->num_regions,
+		 ocmem->num_macros, ocmem->interleaved ? "" : "not ");
+
+	ocmem->regions = devm_kcalloc(dev, ocmem->config->num_regions,
+				      sizeof(struct ocmem_region), GFP_KERNEL);
+	if (!ocmem->regions) {
+		ret = -ENOMEM;
+		goto err_clk_disable;
+	}
+
+	for (i = 0; i < ocmem->config->num_regions; i++) {
+		struct ocmem_region *region = &ocmem->regions[i];
+
+		if (WARN_ON(num_banks > ARRAY_SIZE(region->macro_state))) {
+			ret = -EINVAL;
+			goto err_clk_disable;
+		}
+
+		region->mode = MODE_DEFAULT;
+		region->num_macros = num_banks;
+
+		if (i == (ocmem->config->num_regions - 1) &&
+		    reg & OCMEM_HW_PROFILE_LAST_REGN_HALFSIZE) {
+			region->macro_size = ocmem->config->macro_size / 2;
+			region->region_size = region_size / 2;
+		} else {
+			region->macro_size = ocmem->config->macro_size;
+			region->region_size = region_size;
+		}
+
+		for (j = 0; j < ARRAY_SIZE(region->macro_state); j++)
+			region->macro_state[j] = CLK_OFF;
+	}
+
+	platform_set_drvdata(pdev, ocmem);
+
+	return 0;
+
+err_clk_disable:
+	ocmem_clk_disable(ocmem);
+	return ret;
+}
+
+static const struct ocmem_config ocmem_8974_config = {
+	.num_regions = 3,
+	.macro_size = SZ_128K,
+};
+
+static const struct of_device_id ocmem_of_match[] = {
+	{ .compatible = "qcom,ocmem-msm8974", .data = &ocmem_8974_config },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, ocmem_of_match);
+
+static struct platform_driver ocmem_driver = {
+	.probe = ocmem_dev_probe,
+	.remove = ocmem_dev_remove,
+	.driver = {
+		.name = "ocmem",
+		.of_match_table = ocmem_of_match,
+	},
+};
+
+module_platform_driver(ocmem_driver);
diff --git a/drivers/soc/qcom/ocmem.xml.h b/drivers/soc/qcom/ocmem.xml.h
new file mode 100644
index 000000000000..b4bfb85d1e33
--- /dev/null
+++ b/drivers/soc/qcom/ocmem.xml.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef OCMEM_XML
+#define OCMEM_XML
+
+/* Autogenerated file, DO NOT EDIT manually!
+
+This file was generated by the rules-ng-ng headergen tool in this git repository:
+http://github.com/freedreno/envytools/
+git clone https://github.com/freedreno/envytools.git
+
+The rules-ng-ng source files this header was generated from are:
+- /home/robclark/src/freedreno/envytools/rnndb/adreno/ocmem.xml         (   1773 bytes, from 2015-09-24 17:30:00)
+
+Copyright (C) 2013-2015 by the following authors:
+- Rob Clark <robdclark@gmail.com> (robclark)
+*/
+
+enum ocmem_macro_state {
+	PASSTHROUGH = 0,
+	PERI_ON = 1,
+	CORE_ON = 2,
+	CLK_OFF = 4,
+};
+
+#define REG_OCMEM_HW_VERSION					0x00000000
+
+#define REG_OCMEM_HW_PROFILE					0x00000004
+#define OCMEM_HW_PROFILE_NUM_PORTS__MASK			0x0000000f
+#define OCMEM_HW_PROFILE_NUM_PORTS__SHIFT			0
+static inline uint32_t OCMEM_HW_PROFILE_NUM_PORTS(uint32_t val)
+{
+	return ((val) << OCMEM_HW_PROFILE_NUM_PORTS__SHIFT) & OCMEM_HW_PROFILE_NUM_PORTS__MASK;
+}
+#define OCMEM_HW_PROFILE_NUM_MACROS__MASK			0x00003f00
+#define OCMEM_HW_PROFILE_NUM_MACROS__SHIFT			8
+static inline uint32_t OCMEM_HW_PROFILE_NUM_MACROS(uint32_t val)
+{
+	return ((val) << OCMEM_HW_PROFILE_NUM_MACROS__SHIFT) & OCMEM_HW_PROFILE_NUM_MACROS__MASK;
+}
+#define OCMEM_HW_PROFILE_LAST_REGN_HALFSIZE			0x00010000
+#define OCMEM_HW_PROFILE_INTERLEAVING				0x00020000
+
+#define REG_OCMEM_GEN_STATUS					0x0000000c
+
+#define REG_OCMEM_PSGSC_STATUS					0x00000038
+
+static inline uint32_t REG_OCMEM_PSGSC(uint32_t i0) { return 0x0000003c + 0x1*i0; }
+
+static inline uint32_t REG_OCMEM_PSGSC_CTL(uint32_t i0) { return 0x0000003c + 0x1*i0; }
+#define OCMEM_PSGSC_CTL_MACRO0_MODE__MASK			0x00000007
+#define OCMEM_PSGSC_CTL_MACRO0_MODE__SHIFT			0
+static inline uint32_t OCMEM_PSGSC_CTL_MACRO0_MODE(enum ocmem_macro_state val)
+{
+	return ((val) << OCMEM_PSGSC_CTL_MACRO0_MODE__SHIFT) & OCMEM_PSGSC_CTL_MACRO0_MODE__MASK;
+}
+#define OCMEM_PSGSC_CTL_MACRO1_MODE__MASK			0x00000070
+#define OCMEM_PSGSC_CTL_MACRO1_MODE__SHIFT			4
+static inline uint32_t OCMEM_PSGSC_CTL_MACRO1_MODE(enum ocmem_macro_state val)
+{
+	return ((val) << OCMEM_PSGSC_CTL_MACRO1_MODE__SHIFT) & OCMEM_PSGSC_CTL_MACRO1_MODE__MASK;
+}
+#define OCMEM_PSGSC_CTL_MACRO2_MODE__MASK			0x00000700
+#define OCMEM_PSGSC_CTL_MACRO2_MODE__SHIFT			8
+static inline uint32_t OCMEM_PSGSC_CTL_MACRO2_MODE(enum ocmem_macro_state val)
+{
+	return ((val) << OCMEM_PSGSC_CTL_MACRO2_MODE__SHIFT) & OCMEM_PSGSC_CTL_MACRO2_MODE__MASK;
+}
+#define OCMEM_PSGSC_CTL_MACRO3_MODE__MASK			0x00007000
+#define OCMEM_PSGSC_CTL_MACRO3_MODE__SHIFT			12
+static inline uint32_t OCMEM_PSGSC_CTL_MACRO3_MODE(enum ocmem_macro_state val)
+{
+	return ((val) << OCMEM_PSGSC_CTL_MACRO3_MODE__SHIFT) & OCMEM_PSGSC_CTL_MACRO3_MODE__MASK;
+}
+
+#define REG_OCMEM_REGION_MODE_CTL				0x00001000
+#define OCMEM_REGION_MODE_CTL_REG0_THIN				0x00000001
+#define OCMEM_REGION_MODE_CTL_REG1_THIN				0x00000002
+#define OCMEM_REGION_MODE_CTL_REG2_THIN				0x00000004
+#define OCMEM_REGION_MODE_CTL_REG3_THIN				0x00000008
+
+#define REG_OCMEM_GFX_MPU_START					0x00001004
+
+#define REG_OCMEM_GFX_MPU_END					0x00001008
+
+#endif /* OCMEM_XML */
diff --git a/include/soc/qcom/ocmem.h b/include/soc/qcom/ocmem.h
new file mode 100644
index 000000000000..e56ce220096d
--- /dev/null
+++ b/include/soc/qcom/ocmem.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2015 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#ifndef __OCMEM_H__
+#define __OCMEM_H__
+
+enum ocmem_client {
+	/* GMEM clients */
+	OCMEM_GRAPHICS = 0x0,
+	/*
+	 * TODO add more once ocmem_allocate() is clever enough to
+	 * deal with multiple clients.
+	 */
+	OCMEM_CLIENT_MAX,
+};
+
+struct ocmem;
+
+struct ocmem_buf {
+	unsigned long offset;
+	unsigned long addr;
+	unsigned long len;
+};
+
+struct ocmem *of_get_ocmem(struct device *dev);
+struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem, enum ocmem_client client,
+				 unsigned long size);
+void ocmem_free(struct ocmem *ocmem, enum ocmem_client client,
+		struct ocmem_buf *buf);
+
+#endif /* __OCMEM_H__ */
-- 
2.20.1

