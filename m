Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB7655E48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2019 04:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfFZCWJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 22:22:09 -0400
Received: from onstation.org ([52.200.56.107]:46182 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbfFZCWJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 22:22:09 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id B5E743EE88;
        Wed, 26 Jun 2019 02:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1561515727;
        bh=6hWC/SZ4CzzNx6xCJf0fCb2cqfPEBlCO0PUNTEGVrXQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UsrzoewPJFxoyBCUMMRg26IGPGFw+U8a3C9B9IYkrdAcTJXWBRrNLX13TM13/D1DG
         bkXKWdZbtOzmiVgHY6mlDzWuDU/QCAjikOeX48ptbM/TqCkJxrXZuBxBZkrEo3j4X5
         5gWumhDXJHpAKO2zdqU+ObJ29tqvcbRXztKaKRKw=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org
Subject: [PATCH v3 5/6] soc: qcom: add OCMEM driver
Date:   Tue, 25 Jun 2019 22:21:47 -0400
Message-Id: <20190626022148.23712-6-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626022148.23712-1-masneyb@onstation.org>
References: <20190626022148.23712-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The OCMEM driver handles allocation and configuration of the On Chip
MEMory that is present on some Snapdragon SoCs. Devices which have
OCMEM do not have GMEM inside the GPU core, so the GPU must instead
use OCMEM to be functional. Since the GPU is currently the only OCMEM
user with an upstream driver, this is just a minimal implementation
sufficient for statically allocating to the GPU it's chunk of OCMEM.

This driver currently does not read the gmu-sram node that is described
in the device tree bindings. The starting memory address of the GPU's
reserved memory region is hardcoded to zero to match what the hardware
expects. The driver can be updated to read the reserved memory regions
from device tree once other users of OCMEM are added upstream.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Co-developed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@gmail.com>
---
Changes since v2
- Changed static inline stubs return -ENODEV when OCMEM is not
  configured into the kernel.

Changes since v1:
- ocmem_allocate(): check for alignment and minimum allocation size.
  The 64K values came from the downstream MSM kernel sources.
- add locking to memory allocations based on the client
- use clk_bulk_*() functions
- rename qcom,ocmem-msm8974 to qcom,msm8974-ocmem
- rename reg-names to ctrl and mem
- remove ocmem.xml.h file; use FIELD_PREP() instead for some nice cleanups
- add static inline noop versions of public-facing functions when ocmem
  is disabled to remove #ifdefs in adrenu_gpu.c
- use unsigned long for memory addresses
- move ocmem_dev_remove() below _probe() function
- remove error check from platform_get_resource_byname for ctrl resource
- add MODULE_DESCRIPTION() and MODULE_LICENSE()
- add description to top of ocmem.[ch]
- correct thin mode bit in update_ocmem()
- add 'WARN_ON(client != OCMEM_GRAPHICS)' to device_address()
- make of_get_ocmem return error codes via ERR_PTR instead of NULL
- ocmem_{allocate,free} - WARN_ON() if client != OCMEM_GRAPHICS.
  Simplify if statements.
- allow NULL to be passed into ocmem_free
- remove unnecessary initialization of i in update_ocmem()
- add dev_dbg to ocmem_allocate

Changes since Rob's last version of this patch from 2015:
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
- select ARCH_QCOM in Kconfig
- select QCOM_SCM in Kconfig
- longer description in Kconfig

 drivers/soc/qcom/Kconfig  |  10 +
 drivers/soc/qcom/Makefile |   1 +
 drivers/soc/qcom/ocmem.c  | 433 ++++++++++++++++++++++++++++++++++++++
 include/soc/qcom/ocmem.h  |  62 ++++++
 4 files changed, 506 insertions(+)
 create mode 100644 drivers/soc/qcom/ocmem.c
 create mode 100644 include/soc/qcom/ocmem.h

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index a6d1bfb17279..d18eb83b10da 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -74,6 +74,16 @@ config QCOM_MDT_LOADER
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
index eeb088beb15f..dfc378014a33 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
 obj-$(CONFIG_QCOM_GLINK_SSR) +=	glink_ssr.o
 obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
+obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
 obj-$(CONFIG_QCOM_PM)	+=	spm.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
new file mode 100644
index 000000000000..7c28ad3108a6
--- /dev/null
+++ b/drivers/soc/qcom/ocmem.c
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * The On Chip Memory (OCMEM) allocator allows various clients to allocate
+ * memory from OCMEM based on performance, latency and power requirements.
+ * This is typically used by the GPU, camera/video, and audio components on
+ * some Snapdragon SoCs.
+ *
+ * Copyright (C) 2019 Brian Masney <masneyb@onstation.org>
+ * Copyright (C) 2015 Red Hat. Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#include <linux/bitfield.h>
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
+#include <soc/qcom/ocmem.h>
+
+enum region_mode {
+	WIDE_MODE = 0x0,
+	THIN_MODE,
+	MODE_DEFAULT = WIDE_MODE,
+};
+
+enum ocmem_macro_state {
+	PASSTHROUGH = 0,
+	PERI_ON = 1,
+	CORE_ON = 2,
+	CLK_OFF = 4,
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
+	unsigned long macro_size;
+};
+
+struct ocmem {
+	struct device *dev;
+	const struct ocmem_config *config;
+	struct resource *memory;
+	void __iomem *mmio;
+	unsigned int num_ports;
+	unsigned int num_macros;
+	bool interleaved;
+	struct ocmem_region *regions;
+	unsigned long active_allocations;
+};
+
+#define OCMEM_MIN_ALIGN				SZ_64K
+#define OCMEM_MIN_ALLOC				SZ_64K
+
+#define OCMEM_REG_HW_VERSION			0x00000000
+#define OCMEM_REG_HW_PROFILE			0x00000004
+
+#define OCMEM_REG_REGION_MODE_CTL		0x00001000
+#define OCMEM_REGION_MODE_CTL_REG0_THIN		0x00000001
+#define OCMEM_REGION_MODE_CTL_REG1_THIN		0x00000002
+#define OCMEM_REGION_MODE_CTL_REG2_THIN		0x00000004
+#define OCMEM_REGION_MODE_CTL_REG3_THIN		0x00000008
+
+#define OCMEM_REG_GFX_MPU_START			0x00001004
+#define OCMEM_REG_GFX_MPU_END			0x00001008
+
+#define OCMEM_HW_PROFILE_NUM_PORTS(val)		FIELD_PREP(0x0000000f, (val))
+#define OCMEM_HW_PROFILE_NUM_MACROS(val)	FIELD_PREP(0x00003f00, (val))
+
+#define OCMEM_HW_PROFILE_LAST_REGN_HALFSIZE	0x00010000
+#define OCMEM_HW_PROFILE_INTERLEAVING		0x00020000
+#define OCMEM_REG_GEN_STATUS			0x0000000c
+
+#define OCMEM_REG_PSGSC_STATUS			0x00000038
+#define OCMEM_REG_PSGSC_CTL(i0)			(0x0000003c + 0x1*(i0))
+
+#define OCMEM_PSGSC_CTL_MACRO0_MODE(val)	FIELD_PREP(0x00000007, (val))
+#define OCMEM_PSGSC_CTL_MACRO1_MODE(val)	FIELD_PREP(0x00000070, (val))
+#define OCMEM_PSGSC_CTL_MACRO2_MODE(val)	FIELD_PREP(0x00000700, (val))
+#define OCMEM_PSGSC_CTL_MACRO3_MODE(val)	FIELD_PREP(0x00007000, (val))
+
+#define OCMEM_CLK_CORE_IDX			0
+static struct clk_bulk_data ocmem_clks[] = {
+	{
+		.id = "core",
+	},
+	{
+		.id = "iface",
+	},
+};
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
+static void update_ocmem(struct ocmem *ocmem)
+{
+	uint32_t region_mode_ctrl = 0x0;
+	int i;
+
+	if (!qcom_scm_ocmem_lock_available()) {
+		for (i = 0; i < ocmem->config->num_regions; i++) {
+			struct ocmem_region *region = &ocmem->regions[i];
+
+			if (region->mode == THIN_MODE)
+				region_mode_ctrl |= BIT(i);
+		}
+
+		dev_dbg(ocmem->dev, "ocmem_region_mode_control %x\n",
+			region_mode_ctrl);
+		ocmem_write(ocmem, OCMEM_REG_REGION_MODE_CTL, region_mode_ctrl);
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
+		ocmem_write(ocmem, OCMEM_REG_PSGSC_CTL(i), data);
+	}
+}
+
+static unsigned long phys_to_offset(struct ocmem *ocmem,
+				    unsigned long addr)
+{
+	if (addr < ocmem->memory->start || addr >= ocmem->memory->end)
+		return 0;
+
+	return addr - ocmem->memory->start;
+}
+
+static unsigned long device_address(struct ocmem *ocmem,
+				    enum ocmem_client client,
+				    unsigned long addr)
+{
+	WARN_ON(client != OCMEM_GRAPHICS);
+
+	/* TODO: gpu uses phys_to_offset, but others do not.. */
+	return phys_to_offset(ocmem, addr);
+}
+
+static void update_range(struct ocmem *ocmem, struct ocmem_buf *buf,
+			 enum ocmem_macro_state mstate, enum region_mode rmode)
+{
+	unsigned long offset = 0;
+	int i, j;
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
+		return ERR_PTR(-ENODEV);
+	}
+
+	pdev = of_find_device_by_node(devnode);
+	if (!pdev) {
+		dev_err(dev, "Cannot find device node %s\n", devnode->name);
+		return ERR_PTR(-EPROBE_DEFER);
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
+	int ret;
+
+	/* TODO: add support for other clients... */
+	if (WARN_ON(client != OCMEM_GRAPHICS))
+		return ERR_PTR(-ENODEV);
+
+	if (size < OCMEM_MIN_ALLOC || !IS_ALIGNED(size, OCMEM_MIN_ALIGN))
+		return ERR_PTR(-EINVAL);
+
+	if (test_and_set_bit_lock(BIT(client), &ocmem->active_allocations))
+		return ERR_PTR(-EBUSY);
+
+	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf) {
+		ret = -ENOMEM;
+		goto err_unlock;
+	}
+
+	buf->offset = 0;
+	buf->addr = device_address(ocmem, client, buf->offset);
+	buf->len = size;
+
+	update_range(ocmem, buf, CORE_ON, WIDE_MODE);
+
+	if (qcom_scm_ocmem_lock_available()) {
+		ret = qcom_scm_ocmem_lock(QCOM_SCM_OCMEM_GRAPHICS_ID,
+					  buf->offset, buf->len, WIDE_MODE);
+		if (ret) {
+			dev_err(ocmem->dev, "could not lock: %d\n", ret);
+			ret = -EINVAL;
+			goto err_kfree;
+		}
+	} else {
+		ocmem_write(ocmem, OCMEM_REG_GFX_MPU_START, buf->offset);
+		ocmem_write(ocmem, OCMEM_REG_GFX_MPU_END,
+			    buf->offset + buf->len);
+	}
+
+	dev_dbg(ocmem->dev, "using %ldK of OCMEM at 0x%08lx for client %d\n",
+		size / 1024, buf->addr, client);
+
+	return buf;
+
+err_kfree:
+	kfree(buf);
+err_unlock:
+	clear_bit_unlock(BIT(client), &ocmem->active_allocations);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(ocmem_allocate);
+
+void ocmem_free(struct ocmem *ocmem, enum ocmem_client client,
+		struct ocmem_buf *buf)
+{
+	/* TODO: add support for other clients... */
+	if (WARN_ON(client != OCMEM_GRAPHICS))
+		return;
+
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
+		ocmem_write(ocmem, OCMEM_REG_GFX_MPU_START, 0x0);
+		ocmem_write(ocmem, OCMEM_REG_GFX_MPU_END, 0x0);
+	}
+
+	kfree(buf);
+
+	clear_bit_unlock(BIT(client), &ocmem->active_allocations);
+}
+EXPORT_SYMBOL(ocmem_free);
+
+static int ocmem_dev_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	unsigned long reg, region_size;
+	int i, j, ret, num_banks;
+	struct resource *res;
+	struct ocmem *ocmem;
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
+	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(ocmem_clks), ocmem_clks);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Unable to get clocks\n");
+
+		return ret;
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ctrl");
+	ocmem->mmio = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(ocmem->mmio)) {
+		dev_err(&pdev->dev, "Failed to ioremap ocmem_ctrl resource\n");
+		return PTR_ERR(ocmem->mmio);
+	}
+
+	ocmem->memory = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						     "mem");
+	if (!ocmem->memory) {
+		dev_err(dev, "Could not get mem region\n");
+		return -ENXIO;
+	}
+
+	/* The core clock is synchronous with graphics */
+	WARN_ON(clk_set_rate(ocmem_clks[OCMEM_CLK_CORE_IDX].clk, 1000) < 0);
+
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(ocmem_clks), ocmem_clks);
+	if (ret) {
+		dev_info(ocmem->dev, "Failed to enable clocks\n");
+		return ret;
+	}
+
+	if (qcom_scm_restore_sec_cfg_available()) {
+		dev_dbg(dev, "configuring scm\n");
+		ret = qcom_scm_restore_sec_cfg(QCOM_SCM_OCMEM_DEV_ID, 0);
+		if (ret) {
+			dev_err(dev, "Could not enable secure configuration\n");
+			goto err_clk_disable;
+		}
+	}
+
+	reg = ocmem_read(ocmem, OCMEM_REG_HW_PROFILE);
+	ocmem->num_ports = OCMEM_HW_PROFILE_NUM_PORTS(reg);
+	ocmem->num_macros = OCMEM_HW_PROFILE_NUM_MACROS(reg);
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
+	clk_bulk_disable_unprepare(ARRAY_SIZE(ocmem_clks), ocmem_clks);
+	return ret;
+}
+
+static int ocmem_dev_remove(struct platform_device *pdev)
+{
+	clk_bulk_disable_unprepare(ARRAY_SIZE(ocmem_clks), ocmem_clks);
+
+	return 0;
+}
+
+static const struct ocmem_config ocmem_8974_config = {
+	.num_regions = 3,
+	.macro_size = SZ_128K,
+};
+
+static const struct of_device_id ocmem_of_match[] = {
+	{ .compatible = "qcom,msm8974-ocmem", .data = &ocmem_8974_config },
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
+
+MODULE_DESCRIPTION("On Chip Memory (OCMEM) allocator for some Snapdragon SoCs");
+MODULE_LICENSE("GPL");
diff --git a/include/soc/qcom/ocmem.h b/include/soc/qcom/ocmem.h
new file mode 100644
index 000000000000..a0ae336ba78b
--- /dev/null
+++ b/include/soc/qcom/ocmem.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * The On Chip Memory (OCMEM) allocator allows various clients to allocate
+ * memory from OCMEM based on performance, latency and power requirements.
+ * This is typically used by the GPU, camera/video, and audio components on
+ * some Snapdragon SoCs.
+ *
+ * Copyright (C) 2019 Brian Masney <masneyb@onstation.org>
+ * Copyright (C) 2015 Red Hat. Author: Rob Clark <robdclark@gmail.com>
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
+#if IS_ENABLED(CONFIG_QCOM_OCMEM)
+
+struct ocmem *of_get_ocmem(struct device *dev);
+struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem, enum ocmem_client client,
+				 unsigned long size);
+void ocmem_free(struct ocmem *ocmem, enum ocmem_client client,
+		struct ocmem_buf *buf);
+
+#else /* IS_ENABLED(CONFIG_QCOM_OCMEM) */
+
+static inline struct ocmem *of_get_ocmem(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem,
+					       enum ocmem_client client,
+					       unsigned long size)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline void ocmem_free(struct ocmem *ocmem, enum ocmem_client client,
+			      struct ocmem_buf *buf)
+{
+}
+
+#endif /* IS_ENABLED(CONFIG_QCOM_OCMEM) */
+
+#endif /* __OCMEM_H__ */
-- 
2.20.1

