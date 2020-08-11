Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795E3241D6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 17:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729039AbgHKPmz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 11:42:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:47560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728957AbgHKPmH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 11:42:07 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3269F20771;
        Tue, 11 Aug 2020 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597160523;
        bh=z7A9+EgWYPnFO/YD+2oT/WBIrF0Ty+/b3ie8nvrTe4s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hyx1v7bszzxiTWlczsGSSpgd2PaxHvUbTcpX+IgH2AvFJMbn/BhvORJA2rRmGodeM
         VpmkcqV1Z/8A20WvOKxnJcnuJicoxJkzGLwEinwj2Qiyimns0xhWE/7SE40yADuUut
         4KGxjB1UrNELvIZLcfCYoSfFo6ueWDhYPhT00Qx4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1k5WPZ-004bmK-79; Tue, 11 Aug 2020 17:42:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mayulong <mayulong1@huawei.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 02/33] spmi, regulator, mfd: add drivers for hikey970 SPMI PMIC
Date:   Tue, 11 Aug 2020 17:41:28 +0200
Message-Id: <36a548c10ea8c75d13c3e796c4cee65132819ef1.1597160086.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597160086.git.mchehab+huawei@kernel.org>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Mayulong <mayulong1@huawei.com>

Add the SPMI controller code and the MFD/regulator drivers needed
to support the PMIC used at the Hikey970 board.

[mchehab+huawei@kernel.org: keep just the sources, removing Kbuild changes]

Signed-off-by: Mayulong <mayulong1@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/mfd/hisi_pmic_spmi.c            | 759 ++++++++++++++++++++++++
 drivers/regulator/hisi_regulator_spmi.c | 741 +++++++++++++++++++++++
 drivers/spmi/hisi-spmi-controller.c     | 390 ++++++++++++
 include/linux/mfd/hisi_pmic.h           | 165 ++++++
 4 files changed, 2055 insertions(+)
 create mode 100644 drivers/mfd/hisi_pmic_spmi.c
 create mode 100644 drivers/regulator/hisi_regulator_spmi.c
 create mode 100644 drivers/spmi/hisi-spmi-controller.c
 create mode 100644 include/linux/mfd/hisi_pmic.h

diff --git a/drivers/mfd/hisi_pmic_spmi.c b/drivers/mfd/hisi_pmic_spmi.c
new file mode 100644
index 000000000000..6bb0bc4b203b
--- /dev/null
+++ b/drivers/mfd/hisi_pmic_spmi.c
@@ -0,0 +1,759 @@
+/*
+ * Device driver for regulators in HISI PMIC IC
+ *
+ * Copyright (c) 2013 Linaro Ltd.
+ * Copyright (c) 2011 Hisilicon.
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/of_irq.h>
+#include <linux/mfd/hisi_pmic.h>
+#include <linux/irq.h>
+#include <linux/spmi.h>
+#ifndef NO_IRQ
+#define NO_IRQ       0
+#endif
+
+/* 8-bit register offset in PMIC */
+#define HISI_MASK_STATE			0xff
+
+#define HISI_IRQ_KEY_NUM		0
+#define HISI_IRQ_KEY_VALUE		0xc0
+#define HISI_IRQ_KEY_DOWN		7
+#define HISI_IRQ_KEY_UP			6
+
+/*#define HISI_NR_IRQ			25*/
+#define HISI_MASK_FIELD		0xFF
+#define HISI_BITS			8
+#define PMIC_FPGA_FLAG          1
+
+/*define the first group interrupt register number*/
+#define HISI_PMIC_FIRST_GROUP_INT_NUM        2
+
+static struct bit_info g_pmic_vbus = {0};
+#ifndef BIT
+#define BIT(x)		(0x1U << (x))
+#endif
+
+static struct hisi_pmic *g_pmic;
+static unsigned int g_extinterrupt_flag  = 0;
+static struct of_device_id of_hisi_pmic_match_tbl[] = {
+	{
+		.compatible = "hisilicon-hisi-pmic-spmi",
+	},
+	{ /* end */ }
+};
+
+/*
+ * The PMIC register is only 8-bit.
+ * Hisilicon SoC use hardware to map PMIC register into SoC mapping.
+ * At here, we are accessing SoC register with 32-bit.
+ */
+u32 hisi_pmic_read(struct hisi_pmic *pmic, int reg)
+{
+	u32 ret;
+	u8 read_value = 0;
+	struct spmi_device *pdev;
+
+	if (NULL == g_pmic) {
+		pr_err(" g_pmic  is NULL\n");
+		return 0;
+	}
+
+	pdev = to_spmi_device(g_pmic->dev);
+	if (NULL == pdev) {
+		pr_err("%s:pdev get failed!\n", __func__);
+		return 0;
+	}
+
+	ret = spmi_ext_register_readl(pdev, reg, (unsigned char*)&read_value, 1);/*lint !e734 !e732 */
+	if (ret) {
+		pr_err("%s:spmi_ext_register_readl failed!\n", __func__);
+		return ret;
+	}
+	return (u32)read_value;
+}
+EXPORT_SYMBOL(hisi_pmic_read);
+
+void hisi_pmic_write(struct hisi_pmic *pmic, int reg, u32 val)
+{
+	u32 ret;
+	struct spmi_device *pdev;
+
+	if (NULL == g_pmic) {
+		pr_err(" g_pmic  is NULL\n");
+		return;
+	}
+
+	pdev = to_spmi_device(g_pmic->dev);
+	if (NULL == pdev) {
+		pr_err("%s:pdev get failed!\n", __func__);
+		return;
+	}
+
+	ret = spmi_ext_register_writel(pdev, reg, (unsigned char*)&val, 1);/*lint !e734 !e732 */
+	if (ret) {
+		pr_err("%s:spmi_ext_register_writel failed!\n", __func__);
+		return ;
+	}
+}
+EXPORT_SYMBOL(hisi_pmic_write);
+
+#ifdef CONFIG_HISI_DIEID
+u32 hisi_pmic_read_sub_pmu(u8 sid, int reg)
+{
+	u32 ret;
+	u8 read_value = 0;
+	struct spmi_device *pdev;
+
+	if(strstr(saved_command_line, "androidboot.swtype=factory"))
+	{
+		if (NULL == g_pmic) {
+			pr_err(" g_pmic  is NULL\n");
+			return -1;/*lint !e570 */
+		}
+
+		pdev = to_spmi_device(g_pmic->dev);
+		if (NULL == pdev) {
+			pr_err("%s:pdev get failed!\n", __func__);
+			return -1;/*lint !e570 */
+		}
+
+		ret = spmi_ext_register_readl(pdev->ctrl, sid, reg, (unsigned char*)&read_value, 1);/*lint !e734 !e732 */
+		if (ret) {
+			pr_err("%s:spmi_ext_register_readl failed!\n", __func__);
+			return ret;
+		}
+		return (u32)read_value;
+	}
+	return  0;
+}
+EXPORT_SYMBOL(hisi_pmic_read_sub_pmu);
+
+void hisi_pmic_write_sub_pmu(u8 sid, int reg, u32 val)
+{
+	u32 ret;
+	struct spmi_device *pdev;
+	if(strstr(saved_command_line, "androidboot.swtype=factory"))
+	{
+		if (NULL == g_pmic) {
+			pr_err(" g_pmic  is NULL\n");
+			return;
+		}
+
+		pdev = to_spmi_device(g_pmic->dev);
+		if (NULL == pdev) {
+			pr_err("%s:pdev get failed!\n", __func__);
+			return;
+		}
+
+		ret = spmi_ext_register_writel(pdev->ctrl, sid, reg, (unsigned char*)&val, 1);/*lint !e734 !e732 */
+		if (ret) {
+			pr_err("%s:spmi_ext_register_writel failed!\n", __func__);
+			return ;
+		}
+	}
+
+	return ;
+}
+EXPORT_SYMBOL(hisi_pmic_write_sub_pmu);
+#endif
+
+void hisi_pmic_rmw(struct hisi_pmic *pmic, int reg,
+		     u32 mask, u32 bits)
+{
+	u32 data;
+	unsigned long flags;
+
+	if (NULL == g_pmic) {
+		pr_err(" g_pmic  is NULL\n");
+		return;
+	}
+
+	spin_lock_irqsave(&g_pmic->lock, flags);
+	data = hisi_pmic_read(pmic, reg) & ~mask;
+	data |= mask & bits;
+	hisi_pmic_write(pmic, reg, data);
+	spin_unlock_irqrestore(&g_pmic->lock, flags);
+}
+EXPORT_SYMBOL(hisi_pmic_rmw);
+
+unsigned int hisi_pmic_reg_read(int addr)
+{
+	return (unsigned int)hisi_pmic_read(g_pmic, addr);
+}
+EXPORT_SYMBOL(hisi_pmic_reg_read);
+
+void hisi_pmic_reg_write(int addr, int val)
+{
+	hisi_pmic_write(g_pmic, addr, val);
+}
+EXPORT_SYMBOL(hisi_pmic_reg_write);
+
+void hisi_pmic_reg_write_lock(int addr, int val)
+{
+	unsigned long flags;
+
+	if (NULL == g_pmic) {
+		pr_err(" g_pmic  is NULL\n");
+		return;
+	}
+
+	spin_lock_irqsave(&g_pmic->lock, flags);
+	hisi_pmic_write(g_pmic, g_pmic->normal_lock.addr, g_pmic->normal_lock.val);
+	hisi_pmic_write(g_pmic, g_pmic->debug_lock.addr, g_pmic->debug_lock.val);
+	hisi_pmic_write(g_pmic, addr, val);
+	hisi_pmic_write(g_pmic, g_pmic->normal_lock.addr, 0);
+	hisi_pmic_write(g_pmic, g_pmic->debug_lock.addr, 0);
+	spin_unlock_irqrestore(&g_pmic->lock, flags);
+}
+
+int hisi_pmic_array_read(int addr, char *buff, unsigned int len)
+{
+	unsigned int i;
+
+	if ((len > 32) || (NULL == buff)) {
+		return -EINVAL;
+	}
+
+	/*
+	 * Here is a bug in the pmu die.
+	 * the coul driver will read 4 bytes,
+	 * but the ssi bus only read 1 byte, and the pmu die
+	 * will make sampling 1/10669us about vol cur,so the driver
+	 * read the data is not the same sampling
+	 */
+	for (i = 0; i < len; i++)
+	{
+		*(buff + i) = hisi_pmic_reg_read(addr+i);
+	}
+
+	return 0;
+}
+
+int hisi_pmic_array_write(int addr, char *buff, unsigned int len)
+{
+    unsigned int i;
+
+	if ((len > 32) || (NULL == buff)) {
+		return -EINVAL;
+	}
+
+	for (i = 0; i < len; i++)
+	{
+		hisi_pmic_reg_write(addr+i, *(buff + i));
+	}
+
+	return 0;
+}
+
+static irqreturn_t hisi_irq_handler(int irq, void *data)
+{
+	struct hisi_pmic *pmic = (struct hisi_pmic *)data;
+	unsigned long pending;
+	int i, offset;
+
+	for (i = 0; i < pmic->irqarray; i++) {
+		pending = hisi_pmic_reg_read((i + pmic->irq_addr.start_addr));
+		pending &= HISI_MASK_FIELD;
+		if (pending != 0) {
+			pr_info("pending[%d]=0x%lx\n\r", i, pending);
+		}
+
+		hisi_pmic_reg_write((i + pmic->irq_addr.start_addr), pending);
+
+		/*solve powerkey order*/
+		if ((HISI_IRQ_KEY_NUM == i) && ((pending & HISI_IRQ_KEY_VALUE) == HISI_IRQ_KEY_VALUE)) {
+			generic_handle_irq(pmic->irqs[HISI_IRQ_KEY_DOWN]);
+			generic_handle_irq(pmic->irqs[HISI_IRQ_KEY_UP]);
+			pending &= (~HISI_IRQ_KEY_VALUE);
+		}
+
+		if (pending) {
+			for_each_set_bit(offset, &pending, HISI_BITS)
+				generic_handle_irq(pmic->irqs[offset + i * HISI_BITS]);/*lint !e679 */
+		}
+	}
+
+	/*Handle the second group irq if analysis the second group irq from dtsi*/
+	if (1 == g_extinterrupt_flag){
+		for (i = 0; i < pmic->irqarray1; i++) {
+			pending = hisi_pmic_reg_read((i + pmic->irq_addr1.start_addr));
+			pending &= HISI_MASK_FIELD;
+			if (pending != 0) {
+				pr_info("pending[%d]=0x%lx\n\r", i, pending);
+			}
+
+			hisi_pmic_reg_write((i + pmic->irq_addr1.start_addr), pending);
+
+			if (pending) {
+				for_each_set_bit(offset, &pending, HISI_BITS)
+					generic_handle_irq(pmic->irqs[offset + (i+HISI_PMIC_FIRST_GROUP_INT_NUM) * HISI_BITS]);/*lint !e679 */
+			}
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void hisi_irq_mask(struct irq_data *d)
+{
+	struct hisi_pmic *pmic = irq_data_get_irq_chip_data(d);
+	u32 data, offset;
+	unsigned long flags;
+
+	if (NULL == g_pmic) {
+		pr_err(" g_pmic  is NULL\n");
+		return;
+	}
+
+	offset = (irqd_to_hwirq(d) >> 3);
+	if (1==g_extinterrupt_flag){
+		if ( offset < HISI_PMIC_FIRST_GROUP_INT_NUM)
+			offset += pmic->irq_mask_addr.start_addr;
+		else/*Change addr when irq num larger than 16 because interrupt addr is nonsequence*/
+			offset = offset+(pmic->irq_mask_addr1.start_addr)-HISI_PMIC_FIRST_GROUP_INT_NUM;
+	}else{
+		offset += pmic->irq_mask_addr.start_addr;
+	}
+	spin_lock_irqsave(&g_pmic->lock, flags);
+	data = hisi_pmic_reg_read(offset);
+	data |= (1 << (irqd_to_hwirq(d) & 0x07));
+	hisi_pmic_reg_write(offset, data);
+	spin_unlock_irqrestore(&g_pmic->lock, flags);
+}
+
+static void hisi_irq_unmask(struct irq_data *d)
+{
+	struct hisi_pmic *pmic = irq_data_get_irq_chip_data(d);
+	u32 data, offset;
+	unsigned long flags;
+
+	if (NULL == g_pmic) {
+		pr_err(" g_pmic  is NULL\n");
+		return;
+	}
+
+	offset = (irqd_to_hwirq(d) >> 3);
+	if (1==g_extinterrupt_flag){
+		if ( offset < HISI_PMIC_FIRST_GROUP_INT_NUM)
+			offset += pmic->irq_mask_addr.start_addr;
+		else
+			offset = offset+(pmic->irq_mask_addr1.start_addr)-HISI_PMIC_FIRST_GROUP_INT_NUM;
+	}else{
+		offset += pmic->irq_mask_addr.start_addr;
+	}
+	spin_lock_irqsave(&g_pmic->lock, flags);
+	data = hisi_pmic_reg_read(offset);
+	data &= ~(1 << (irqd_to_hwirq(d) & 0x07)); /*lint !e502 */
+	hisi_pmic_reg_write(offset, data);
+	spin_unlock_irqrestore(&g_pmic->lock, flags);
+}
+
+static struct irq_chip hisi_pmu_irqchip = {
+	.name		= "hisi-irq",
+	.irq_mask	= hisi_irq_mask,
+	.irq_unmask	= hisi_irq_unmask,
+	.irq_disable	= hisi_irq_mask,
+	.irq_enable	= hisi_irq_unmask,
+};
+
+static int hisi_irq_map(struct irq_domain *d, unsigned int virq,
+			  irq_hw_number_t hw)
+{
+	struct hisi_pmic *pmic = d->host_data;
+
+	irq_set_chip_and_handler_name(virq, &hisi_pmu_irqchip,
+				      handle_simple_irq, "hisi");
+	irq_set_chip_data(virq, pmic);
+	irq_set_irq_type(virq, IRQ_TYPE_NONE);
+
+	return 0;
+}
+
+static struct irq_domain_ops hisi_domain_ops = {
+	.map	= hisi_irq_map,
+	.xlate	= irq_domain_xlate_twocell,
+};
+
+/*lint -e570 -e64*/
+static int get_pmic_device_tree_data(struct device_node *np, struct hisi_pmic *pmic)
+{
+	int ret = 0;
+
+	/*get pmic irq num*/
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-pmic-irq-num",
+						&(pmic->irqnum), 1);
+	if (ret) {
+		pr_err("no hisilicon,hisi-pmic-irq-num property set\n");
+		ret = -ENODEV;
+		return ret;
+	}
+
+	/*get pmic irq array number*/
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-pmic-irq-array",
+						&(pmic->irqarray), 1);
+	if (ret) {
+		pr_err("no hisilicon,hisi-pmic-irq-array property set\n");
+		ret = -ENODEV;
+		return ret;
+	}
+
+	/*SOC_PMIC_IRQ_MASK_0_ADDR*/
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-pmic-irq-mask-addr",
+						(int *)&pmic->irq_mask_addr, 2);
+	if (ret) {
+		pr_err("no hisilicon,hisi-pmic-irq-mask-addr property set\n");
+		ret = -ENODEV;
+		return ret;
+	}
+
+	/*SOC_PMIC_IRQ0_ADDR*/
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-pmic-irq-addr",
+						(int *)&pmic->irq_addr, 2);
+	if (ret) {
+		pr_err("no hisilicon,hisi-pmic-irq-addr property set\n");
+		ret = -ENODEV;
+		return ret;
+	}
+
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-pmic-vbus",
+						(u32 *)&g_pmic_vbus, 2);
+	if (ret) {
+		pr_err("no hisilicon,hisi-pmic-vbus property\n");
+		ret = -ENODEV;
+		return ret;
+	}
+
+	/*pmic lock*/
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-pmic-lock",
+						(int *)&pmic->normal_lock, 2);
+	if (ret) {
+		pr_err("no hisilicon,hisi-pmic-lock property set\n");
+		ret = -ENODEV;
+		return ret;
+	}
+
+	/*pmic debug lock*/
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-pmic-debug-lock",
+						(int *)&pmic->debug_lock, 2);
+	if (ret) {
+		pr_err("no hisilicon,hisi-pmic-debug-lock property set\n");
+		ret = -ENODEV;
+		return ret;
+	}
+
+	return ret;
+}/*lint -restore*/
+
+
+/*lint -e570 -e64*/
+static int get_pmic_device_tree_data1(struct device_node *np, struct hisi_pmic *pmic)
+{
+	int ret = 0;
+
+	/*get pmic irq num*/
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-pmic-irq-num1",
+						&(pmic->irqnum1), 1);
+	if (ret) {
+		pr_err("no hisilicon,hisi-pmic-irq-num1 property set\n");
+		ret = -ENODEV;
+		pmic->irqnum1 = 0;
+		return ret;
+	}
+
+	/*get pmic irq array number*/
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-pmic-irq-array1",
+						&(pmic->irqarray1), 1);
+	if (ret) {
+		pr_err("no hisilicon,hisi-pmic-irq-array1 property set\n");
+		ret = -ENODEV;
+		return ret;
+	}
+
+	/*SOC_PMIC_IRQ_MASK_0_ADDR*/
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-pmic-irq-mask-addr1",
+						(int *)&pmic->irq_mask_addr1, 2);
+	if (ret) {
+		pr_err("no hisilicon,hisi-pmic-irq-mask-addr1 property set\n");
+		ret = -ENODEV;
+		return ret;
+	}
+
+	/*SOC_PMIC_IRQ0_ADDR*/
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-pmic-irq-addr1",
+						(int *)&pmic->irq_addr1, 2);
+	if (ret) {
+		pr_err("no hisilicon,hisi-pmic-irq-addr1 property set\n");
+		ret = -ENODEV;
+		return ret;
+	}
+
+	g_extinterrupt_flag = 1;
+	return ret;
+}/*lint -restore*/
+
+int hisi_get_pmic_irq_byname(unsigned int pmic_irq_list)
+{
+	if ( NULL == g_pmic ) {
+		pr_err("[%s]g_pmic is NULL\n", __func__);
+		return -1;
+	}
+
+	if (pmic_irq_list > (unsigned int)g_pmic->irqnum) {
+		pr_err("[%s]input pmic irq number is error.\n", __func__);
+		return -1;
+	}
+	pr_info("%s:g_pmic->irqs[%d]=%d\n", __func__, pmic_irq_list, g_pmic->irqs[pmic_irq_list]);
+	return (int)g_pmic->irqs[pmic_irq_list];
+}
+EXPORT_SYMBOL(hisi_get_pmic_irq_byname);
+
+int hisi_pmic_get_vbus_status(void)
+{
+	if (0 == g_pmic_vbus.addr)
+		return -1;
+
+	if (hisi_pmic_reg_read(g_pmic_vbus.addr) & BIT(g_pmic_vbus.bit))
+		return 1;
+
+	return 0;
+}
+EXPORT_SYMBOL(hisi_pmic_get_vbus_status);
+
+static void hisi_pmic_irq_prc(struct hisi_pmic *pmic)
+{
+	int i;
+	for (i = 0 ; i < pmic->irq_mask_addr.array; i++) {
+		hisi_pmic_write(pmic, pmic->irq_mask_addr.start_addr + i, HISI_MASK_STATE);
+	}
+
+	for (i = 0 ; i < pmic->irq_addr.array; i++) {
+		unsigned int pending = hisi_pmic_read(pmic, pmic->irq_addr.start_addr + i);
+		pr_debug("PMU IRQ address value:irq[0x%x] = 0x%x\n", pmic->irq_addr.start_addr + i, pending);
+		hisi_pmic_write(pmic, pmic->irq_addr.start_addr + i, HISI_MASK_STATE);
+	}
+
+}
+
+static void hisi_pmic_irq1_prc(struct hisi_pmic *pmic)
+{
+	int i;
+	if(1 == g_extinterrupt_flag){
+		for (i = 0 ; i < pmic->irq_mask_addr1.array; i++) {
+			hisi_pmic_write(pmic, pmic->irq_mask_addr1.start_addr + i, HISI_MASK_STATE);
+		}
+
+		for (i = 0 ; i < pmic->irq_addr1.array; i++) {
+			unsigned int pending1 = hisi_pmic_read(pmic, pmic->irq_addr1.start_addr + i);
+			pr_debug("PMU IRQ address1 value:irq[0x%x] = 0x%x\n", pmic->irq_addr1.start_addr + i, pending1);
+			hisi_pmic_write(pmic, pmic->irq_addr1.start_addr + i, HISI_MASK_STATE);
+		}
+	}
+}
+
+static int hisi_pmic_probe(struct spmi_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct hisi_pmic *pmic = NULL;
+	enum of_gpio_flags flags;
+	int ret = 0;
+	int i;
+	unsigned int fpga_flag = 0;
+	unsigned int virq;
+
+	pmic = devm_kzalloc(dev, sizeof(*pmic), GFP_KERNEL);
+	if (!pmic) {
+		dev_err(dev, "cannot allocate hisi_pmic device info\n");
+		return -ENOMEM;
+	}
+
+	/*TODO: get pmic dts info*/
+	ret = get_pmic_device_tree_data(np, pmic);
+	if (ret) {
+		dev_err(&pdev->dev, "Error reading hisi pmic dts \n");
+		return ret;
+	}
+
+	/*get pmic dts the second group irq*/
+	ret = get_pmic_device_tree_data1(np, pmic);
+	if (ret) {
+		dev_err(&pdev->dev, "the platform don't support ext-interrupt.\n");
+	}
+
+	/* TODO: get and enable clk request */
+	spin_lock_init(&pmic->lock);
+
+	pmic->dev = dev;
+	g_pmic = pmic;
+	ret = of_property_read_u32_array(np, "hisilicon,pmic_fpga_flag", &fpga_flag, 1);
+	if (ret) {
+		pr_err("no hisilicon,pmic_fpga_flag property set\n");
+	}
+	if (PMIC_FPGA_FLAG == fpga_flag) {
+		goto after_irq_register;
+	}
+
+	pmic->gpio = of_get_gpio_flags(np, 0, &flags);
+	if (pmic->gpio < 0)
+		return pmic->gpio;
+
+	if (!gpio_is_valid(pmic->gpio))
+		return -EINVAL;
+
+	ret = gpio_request_one(pmic->gpio, GPIOF_IN, "pmic");
+	if (ret < 0) {
+		dev_err(dev, "failed to request gpio%d\n", pmic->gpio);
+		return ret;
+	}
+
+	pmic->irq = gpio_to_irq(pmic->gpio);
+
+	/* mask && clear IRQ status */
+	hisi_pmic_irq_prc(pmic);
+	/*clear && mask the new adding irq*/
+	hisi_pmic_irq1_prc(pmic);
+
+	pmic->irqnum += pmic->irqnum1;
+
+	pmic->irqs = (unsigned int *)devm_kmalloc(dev, pmic->irqnum * sizeof(int), GFP_KERNEL);
+	if (!pmic->irqs) {
+		pr_err("%s:Failed to alloc memory for pmic irq number!\n", __func__);
+		goto irq_malloc;
+	}
+	memset(pmic->irqs, 0, pmic->irqnum);
+
+	pmic->domain = irq_domain_add_simple(np, pmic->irqnum, 0,
+					     &hisi_domain_ops, pmic);
+	if (!pmic->domain) {
+		dev_err(dev, "failed irq domain add simple!\n");
+		ret = -ENODEV;
+		goto irq_domain;
+	}
+
+	for (i = 0; i < pmic->irqnum; i++) {
+		virq = irq_create_mapping(pmic->domain, i);
+		if (virq == NO_IRQ) {
+			pr_debug("Failed mapping hwirq\n");
+			ret = -ENOSPC;
+			goto irq_create_mapping;
+		}
+		pmic->irqs[i] = virq;
+		pr_info("[%s]. pmic->irqs[%d] = %d\n", __func__, i, pmic->irqs[i]);
+	}
+
+	ret = request_threaded_irq(pmic->irq, hisi_irq_handler, NULL,
+				IRQF_TRIGGER_LOW | IRQF_SHARED | IRQF_NO_SUSPEND,
+				   "pmic", pmic);
+	if (ret < 0) {
+		dev_err(dev, "could not claim pmic %d\n", ret);
+		ret = -ENODEV;
+		goto request_theaded_irq;
+	}
+
+after_irq_register:
+	return 0;
+
+
+request_theaded_irq:
+irq_create_mapping:
+irq_domain:
+irq_malloc:
+	gpio_free(pmic->gpio);
+	g_pmic = NULL;
+	return ret;
+}
+
+static void hisi_pmic_remove(struct spmi_device *pdev)
+{
+
+	struct hisi_pmic *pmic = dev_get_drvdata(&pdev->dev);
+
+	free_irq(pmic->irq, pmic);
+	gpio_free(pmic->gpio);
+	devm_kfree(&pdev->dev, pmic);
+
+}
+static int hisi_pmic_suspend(struct device *dev, pm_message_t state)
+{
+	struct hisi_pmic *pmic = dev_get_drvdata(dev);
+
+	if (NULL == pmic) {
+		pr_err("%s:pmic is NULL\n", __func__);
+		return -ENOMEM;
+	}
+
+	pr_info("%s:+\n", __func__);
+	pr_info("%s:-\n", __func__);
+
+	return 0;
+}/*lint !e715 */
+
+static int hisi_pmic_resume(struct device *dev)
+{
+	struct hisi_pmic *pmic = dev_get_drvdata(dev);
+
+	if (NULL == pmic) {
+		pr_err("%s:pmic is NULL\n", __func__);
+		return -ENOMEM;
+	}
+
+	pr_info("%s:+\n", __func__);
+	pr_info("%s:-\n", __func__);
+
+	return 0;
+}
+
+MODULE_DEVICE_TABLE(spmi, pmic_spmi_id);
+static struct spmi_driver hisi_pmic_driver = {
+	.driver = {
+		.name	= "hisi_pmic",
+		.owner  = THIS_MODULE,
+		.of_match_table = of_hisi_pmic_match_tbl,
+		.suspend = hisi_pmic_suspend,
+		.resume = hisi_pmic_resume,
+	},
+	.probe	= hisi_pmic_probe,
+	.remove	= hisi_pmic_remove,
+};
+
+static int __init hisi_pmic_init(void)
+{
+	return spmi_driver_register(&hisi_pmic_driver);
+}
+
+static void __exit hisi_pmic_exit(void)
+{
+	spmi_driver_unregister(&hisi_pmic_driver);
+}
+
+
+subsys_initcall_sync(hisi_pmic_init);
+module_exit(hisi_pmic_exit);
+
+MODULE_DESCRIPTION("PMIC driver");
+MODULE_LICENSE("GPL v2");
+
diff --git a/drivers/regulator/hisi_regulator_spmi.c b/drivers/regulator/hisi_regulator_spmi.c
new file mode 100644
index 000000000000..941bfe32bf5b
--- /dev/null
+++ b/drivers/regulator/hisi_regulator_spmi.c
@@ -0,0 +1,741 @@
+/*
+ * Device driver for regulators in Hisi IC
+ *
+ * Copyright (c) 2013 Linaro Ltd.
+ * Copyright (c) 2011 Hisilicon.
+ *
+ * Guodong Xu <guodong.xu@linaro.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/mfd/hisi_pmic.h>
+#include <linux/delay.h>
+#include <linux/time.h>
+#include <linux/version.h>
+#ifdef CONFIG_HISI_PMIC_DEBUG
+#include <linux/debugfs.h>
+#endif
+#include <linux/seq_file.h>
+#include <linux/uaccess.h>
+#include <linux/spmi.h>
+
+#if 1
+#define BRAND_DEBUG(args...) pr_debug(args);
+#else
+#define BRAND_DEBUG(args...)
+#endif
+
+struct hisi_regulator_register_info {
+	u32 ctrl_reg;
+	u32 enable_mask;
+	u32 eco_mode_mask;
+	u32 vset_reg;
+	u32 vset_mask;
+};
+
+struct hisi_regulator {
+	const char *name;
+	struct hisi_regulator_register_info register_info;
+	struct timeval last_off_time;
+	u32 off_on_delay;
+	u32 eco_uA;
+	struct regulator_desc rdesc;
+	int (*dt_parse)(struct hisi_regulator *, struct spmi_device *);
+};
+
+static DEFINE_MUTEX(enable_mutex);
+struct timeval last_enabled;
+
+
+static inline struct hisi_pmic *rdev_to_pmic(struct regulator_dev *dev)
+{
+	/* regulator_dev parent to->
+	 * hisi regulator platform device_dev parent to->
+	 * hisi pmic platform device_dev
+	 */
+	return dev_get_drvdata(rdev_get_dev(dev)->parent->parent);
+}
+
+/* helper function to ensure when it returns it is at least 'delay_us'
+ * microseconds after 'since'.
+ */
+static void ensured_time_after(struct timeval since, u32 delay_us)
+{
+	struct timeval now;
+	u64 elapsed_ns64, delay_ns64;
+	u32 actual_us32;
+
+	delay_ns64 = delay_us * NSEC_PER_USEC;
+	do_gettimeofday(&now);
+	elapsed_ns64 = timeval_to_ns(&now) - timeval_to_ns(&since);
+	if (delay_ns64 > elapsed_ns64) {
+		actual_us32 = ((u32)(delay_ns64 - elapsed_ns64) /
+							NSEC_PER_USEC);
+		if (actual_us32 >= 1000) {
+			mdelay(actual_us32 / 1000); /*lint !e647 */
+			udelay(actual_us32 % 1000);
+		} else if (actual_us32 > 0) {
+			udelay(actual_us32);
+		}
+	}
+	return;
+}
+
+static int hisi_regulator_is_enabled(struct regulator_dev *dev)
+{
+	u32 reg_val;
+	struct hisi_regulator *sreg = rdev_get_drvdata(dev);
+	struct hisi_pmic *pmic = rdev_to_pmic(dev);
+
+	reg_val = hisi_pmic_read(pmic, sreg->register_info.ctrl_reg);
+	BRAND_DEBUG("<[%s]: ctrl_reg=0x%x,enable_state=%d>\n", __func__, sreg->register_info.ctrl_reg,\
+			(reg_val & sreg->register_info.enable_mask));
+
+	return ((reg_val & sreg->register_info.enable_mask) != 0);
+}
+
+static int hisi_regulator_enable(struct regulator_dev *dev)
+{
+	struct hisi_regulator *sreg = rdev_get_drvdata(dev);
+	struct hisi_pmic *pmic = rdev_to_pmic(dev);
+
+	/* keep a distance of off_on_delay from last time disabled */
+	ensured_time_after(sreg->last_off_time, sreg->off_on_delay);
+
+	BRAND_DEBUG("<[%s]: off_on_delay=%dus>\n", __func__, sreg->off_on_delay);
+
+	/* cannot enable more than one regulator at one time */
+	mutex_lock(&enable_mutex);
+	ensured_time_after(last_enabled, HISI_REGS_ENA_PROTECT_TIME);
+
+	/* set enable register */
+	hisi_pmic_rmw(pmic, sreg->register_info.ctrl_reg,
+				sreg->register_info.enable_mask,
+				sreg->register_info.enable_mask);
+	BRAND_DEBUG("<[%s]: ctrl_reg=0x%x,enable_mask=0x%x>\n", __func__, sreg->register_info.ctrl_reg,\
+			sreg->register_info.enable_mask);
+
+	do_gettimeofday(&last_enabled);
+	mutex_unlock(&enable_mutex);
+
+	return 0;
+}
+
+static int hisi_regulator_disable(struct regulator_dev *dev)
+{
+	struct hisi_regulator *sreg = rdev_get_drvdata(dev);
+	struct hisi_pmic *pmic = rdev_to_pmic(dev);
+
+	/* set enable register to 0 */
+	hisi_pmic_rmw(pmic, sreg->register_info.ctrl_reg,
+				sreg->register_info.enable_mask, 0);
+
+	do_gettimeofday(&sreg->last_off_time);
+
+	return 0;
+}
+
+static int hisi_regulator_get_voltage(struct regulator_dev *dev)
+{
+	struct hisi_regulator *sreg = rdev_get_drvdata(dev);
+	struct hisi_pmic *pmic = rdev_to_pmic(dev);
+	u32 reg_val, selector;
+
+	/* get voltage selector */
+	reg_val = hisi_pmic_read(pmic, sreg->register_info.vset_reg);
+	BRAND_DEBUG("<[%s]: vset_reg=0x%x>\n", __func__, sreg->register_info.vset_reg);
+
+	selector = (reg_val & sreg->register_info.vset_mask) >>
+				(ffs(sreg->register_info.vset_mask) - 1);
+
+	return sreg->rdesc.ops->list_voltage(dev, selector);
+}
+
+static int hisi_regulator_set_voltage(struct regulator_dev *dev,
+				int min_uV, int max_uV, unsigned *selector)
+{
+	struct hisi_regulator *sreg = rdev_get_drvdata(dev);
+	struct hisi_pmic *pmic = rdev_to_pmic(dev);
+	u32 vsel;
+	int ret = 0;
+
+	for (vsel = 0; vsel < sreg->rdesc.n_voltages; vsel++) {
+		int uV = sreg->rdesc.volt_table[vsel];
+		/* Break at the first in-range value */
+		if (min_uV <= uV && uV <= max_uV)
+			break;
+	}
+
+	/* unlikely to happen. sanity test done by regulator core */
+	if (unlikely(vsel == sreg->rdesc.n_voltages))
+		return -EINVAL;
+
+	*selector = vsel;
+	/* set voltage selector */
+	hisi_pmic_rmw(pmic, sreg->register_info.vset_reg,
+		sreg->register_info.vset_mask,
+		vsel << (ffs(sreg->register_info.vset_mask) - 1));
+
+	BRAND_DEBUG("<[%s]: vset_reg=0x%x, vset_mask=0x%x, value=0x%x>\n", __func__,\
+			sreg->register_info.vset_reg,\
+			sreg->register_info.vset_mask,\
+			vsel << (ffs(sreg->register_info.vset_mask) - 1)\
+			);
+
+	return ret;
+}
+
+static unsigned int hisi_regulator_get_mode(struct regulator_dev *dev)
+{
+	struct hisi_regulator *sreg = rdev_get_drvdata(dev);
+	struct hisi_pmic *pmic = rdev_to_pmic(dev);
+	u32 reg_val;
+
+	reg_val = hisi_pmic_read(pmic, sreg->register_info.ctrl_reg);
+	BRAND_DEBUG("<[%s]: reg_val=%d, ctrl_reg=0x%x, eco_mode_mask=0x%x>\n", __func__, reg_val,\
+			sreg->register_info.ctrl_reg,\
+			sreg->register_info.eco_mode_mask\
+		   );
+
+	if (reg_val & sreg->register_info.eco_mode_mask)
+		return REGULATOR_MODE_IDLE;
+	else
+		return REGULATOR_MODE_NORMAL;
+}
+
+static int hisi_regulator_set_mode(struct regulator_dev *dev,
+						unsigned int mode)
+{
+	struct hisi_regulator *sreg = rdev_get_drvdata(dev);
+	struct hisi_pmic *pmic = rdev_to_pmic(dev);
+	u32 eco_mode;
+
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+		eco_mode = HISI_ECO_MODE_DISABLE;
+		break;
+	case REGULATOR_MODE_IDLE:
+		eco_mode = HISI_ECO_MODE_ENABLE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* set mode */
+	hisi_pmic_rmw(pmic, sreg->register_info.ctrl_reg,
+		sreg->register_info.eco_mode_mask,
+		eco_mode << (ffs(sreg->register_info.eco_mode_mask) - 1));
+
+	BRAND_DEBUG("<[%s]: ctrl_reg=0x%x, eco_mode_mask=0x%x, value=0x%x>\n", __func__,\
+			sreg->register_info.ctrl_reg,\
+			sreg->register_info.eco_mode_mask,\
+			eco_mode << (ffs(sreg->register_info.eco_mode_mask) - 1)\
+		   );
+	return 0;
+}
+
+
+unsigned int hisi_regulator_get_optimum_mode(struct regulator_dev *dev,
+			int input_uV, int output_uV, int load_uA)
+{
+	struct hisi_regulator *sreg = rdev_get_drvdata(dev);
+
+	if ((load_uA == 0) || ((unsigned int)load_uA > sreg->eco_uA))
+		return REGULATOR_MODE_NORMAL;
+	else
+		return REGULATOR_MODE_IDLE;
+}
+
+static int hisi_dt_parse_common(struct hisi_regulator *sreg,
+					struct spmi_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct regulator_desc *rdesc = &sreg->rdesc;
+	unsigned int register_info[3] = {0};
+	int ret = 0;
+
+	/* parse .register_info.ctrl_reg */
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-ctrl",
+						register_info, 3);
+	if (ret) {
+		dev_err(dev, "no hisilicon,hisi-ctrl property set\n");
+		goto dt_parse_common_end;
+	}
+	sreg->register_info.ctrl_reg = register_info[0];
+	sreg->register_info.enable_mask = register_info[1];
+	sreg->register_info.eco_mode_mask = register_info[2];
+
+	/* parse .register_info.vset_reg */
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-vset",
+						register_info, 2);
+	if (ret) {
+		dev_err(dev, "no hisilicon,hisi-vset property set\n");
+		goto dt_parse_common_end;
+	}
+	sreg->register_info.vset_reg = register_info[0];
+	sreg->register_info.vset_mask = register_info[1];
+
+	/* parse .off-on-delay */
+	ret = of_property_read_u32(np, "hisilicon,hisi-off-on-delay-us",
+						&sreg->off_on_delay);
+	if (ret) {
+		dev_err(dev, "no hisilicon,hisi-off-on-delay-us property set\n");
+		goto dt_parse_common_end;
+	}
+
+	/* parse .enable_time */
+	ret = of_property_read_u32(np, "hisilicon,hisi-enable-time-us",
+				   &rdesc->enable_time);
+	if (ret) {
+		dev_err(dev, "no hisilicon,hisi-enable-time-us property set\n");
+		goto dt_parse_common_end;
+	}
+
+	/* parse .eco_uA */
+	ret = of_property_read_u32(np, "hisilicon,hisi-eco-microamp",
+				   &sreg->eco_uA);
+	if (ret) {
+		sreg->eco_uA = 0;
+		ret = 0;
+	}
+
+dt_parse_common_end:
+	return ret;
+}
+
+static int hisi_dt_parse_ldo(struct hisi_regulator *sreg,
+				struct spmi_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct regulator_desc *rdesc = &sreg->rdesc;
+	unsigned int *v_table;
+	int ret = 0;
+
+	/* parse .n_voltages, and .volt_table */
+	ret = of_property_read_u32(np, "hisilicon,hisi-n-voltages",
+				   &rdesc->n_voltages);
+	if (ret) {
+		dev_err(dev, "no hisilicon,hisi-n-voltages property set\n");
+		goto dt_parse_ldo_end;
+	}
+
+	/* alloc space for .volt_table */
+	v_table = devm_kzalloc(dev, sizeof(unsigned int) * rdesc->n_voltages,
+								GFP_KERNEL);
+	if (unlikely(!v_table)) {
+		ret = -ENOMEM;
+		dev_err(dev, "no memory for .volt_table\n");
+		goto dt_parse_ldo_end;
+	}
+
+	ret = of_property_read_u32_array(np, "hisilicon,hisi-vset-table",
+						v_table, rdesc->n_voltages);
+	if (ret) {
+		dev_err(dev, "no hisilicon,hisi-vset-table property set\n");
+		goto dt_parse_ldo_end1;
+	}
+	rdesc->volt_table = v_table;
+
+	/* parse hisi regulator's dt common part */
+	ret = hisi_dt_parse_common(sreg, pdev);
+	if (ret) {
+		dev_err(dev, "failure in hisi_dt_parse_common\n");
+		goto dt_parse_ldo_end1;
+	}
+
+	return ret;
+
+dt_parse_ldo_end1:
+dt_parse_ldo_end:
+	return ret;
+}
+
+static struct regulator_ops hisi_ldo_rops = {
+	.is_enabled = hisi_regulator_is_enabled,
+	.enable = hisi_regulator_enable,
+	.disable = hisi_regulator_disable,
+	.list_voltage = regulator_list_voltage_table,
+	.get_voltage = hisi_regulator_get_voltage,
+	.set_voltage = hisi_regulator_set_voltage,
+	.get_mode = hisi_regulator_get_mode,
+	.set_mode = hisi_regulator_set_mode,
+	.get_optimum_mode = hisi_regulator_get_optimum_mode,
+};
+
+static const struct hisi_regulator hisi_regulator_ldo = {
+	.rdesc = {
+	.ops = &hisi_ldo_rops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		},
+	.dt_parse = hisi_dt_parse_ldo,
+};
+
+static struct of_device_id of_hisi_regulator_match_tbl[] = {
+	{
+		.compatible = "hisilicon-hisi-ldo",
+		.data = &hisi_regulator_ldo,
+	},
+	{ /* end */ }
+};
+
+#ifdef CONFIG_HISI_PMIC_DEBUG
+extern void get_current_regulator_dev(struct seq_file *s);
+extern void set_regulator_state(char *ldo_name, int value);
+extern void get_regulator_state(char *ldo_name);
+extern int set_regulator_voltage(char *ldo_name, unsigned int vol_value);
+
+u32 pmu_atoi(char *s)
+{
+	char *p = s;
+	char c;
+	u64 ret = 0;
+	if (s == NULL)
+		return 0;
+	while ((c = *p++) != '\0') {
+		if ('0' <= c && c <= '9') {
+			ret *= 10;
+			ret += (u64)((unsigned char)c - '0');
+			if (ret > U32_MAX)
+				return 0;
+		} else {
+			break;
+		}
+	}
+	return (u32)ret;
+}
+static int dbg_hisi_regulator_show(struct seq_file *s, void *data)
+{
+	seq_printf(s, "\n\r");
+	seq_printf(s, "%-13s %-15s %-15s %-15s %-15s\n\r",
+			"LDO_NAME", "ON/OFF", "Use_count", "Open_count", "Always_on");
+	seq_printf(s, "-----------------------------------------"
+			"-----------------------------------------------\n\r");
+	get_current_regulator_dev(s);
+	return 0;
+}
+
+static int dbg_hisi_regulator_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, dbg_hisi_regulator_show, inode->i_private);
+}
+
+static const struct file_operations debug_regulator_state_fops = {
+	.open		= dbg_hisi_regulator_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static int dbg_control_regulator_show(struct seq_file *s, void *data)
+{
+	printk("                                                                             \n\r \
+		---------------------------------------------------------------------------------\n\r \
+		|usage:                                                                         |\n\r \
+		|	S = state	R = read	V = voltage                                         |\n\r \
+		|	set ldo state and voltage                                                   |\n\r \
+		|	get ldo state and current voltage                                           |\n\r \
+		|example:                                                                       |\n\r \
+		|	echo S ldo16 0   > control_regulator	:disable ldo16                      |\n\r \
+		|	echo S ldo16 1   > control_regulator	:enable ldo16                       |\n\r \
+		|	echo R ldo16     > control_regulator	:get ldo16 state and voltage        |\n\r \
+		|	echo V ldo16 xxx > control_regulator	:set ldo16 voltage                  |\n\r \
+		---------------------------------------------------------------------------------\n\r");
+	return 0;
+}
+static ssize_t dbg_control_regulator_set_value(struct file *filp, const char __user *buffer,
+	size_t count, loff_t *ppos)
+{
+	char tmp[128] = {0};
+	char ptr[128] = {0};
+	char *vol = NULL;
+	char num = 0;
+	unsigned int i;
+	int next_flag = 1;
+
+	if (count >= 128) {
+		pr_info("error! buffer size big than internal buffer\n");
+		return -EFAULT;
+	}
+
+	if (copy_from_user(tmp, buffer, count)) {
+		pr_info("error!\n");
+		return -EFAULT;
+	}
+
+	if (tmp[0] == 'R' || tmp[0] == 'r') {
+		for (i = 2; i < (count - 1); i++) {
+			ptr[i - 2] = tmp[i];
+		}
+		ptr[i - 2] = '\0';
+		get_regulator_state(ptr);
+	} else if (tmp[0] == 'S' || tmp[0] == 's') {
+		for (i = 2; i < (count - 1); i++) {
+			if (tmp[i] == ' ') {
+				next_flag = 0;
+				ptr[i - 2] = '\0';
+				continue;
+			}
+			if (next_flag) {
+				ptr[i - 2] = tmp[i];
+			} else {
+				num = tmp[i] - 48;
+			}
+		}
+		set_regulator_state(ptr, num);
+	} else if (tmp[0] == 'V' || tmp[0] == 'v') {
+		for (i = 2; i < (count - 1); i++) {
+			if (tmp[i] == ' ') {
+				next_flag = 0;
+				ptr[i - 2] = '\0';
+				continue;
+			}
+			if (next_flag) {
+				ptr[i - 2] = tmp[i];
+			} else {
+				vol = &tmp[i];
+				break;
+			}
+		}
+		set_regulator_voltage(ptr, pmu_atoi(vol));
+	}
+
+	*ppos += count;
+
+	return count;
+}
+
+static int dbg_control_regulator_open(struct inode *inode, struct file *file)
+{
+	file->private_data = inode->i_private;
+	return single_open(file, dbg_control_regulator_show, &inode->i_private);
+}
+
+static const struct file_operations set_control_regulator_fops = {
+	.open		= dbg_control_regulator_open,
+	.read		= seq_read,
+	.write		= dbg_control_regulator_set_value,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+#endif
+
+static int hisi_regulator_probe(struct spmi_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct regulator_desc *rdesc;
+	struct regulator_dev *rdev;
+	struct hisi_regulator *sreg = NULL;
+	struct regulator_init_data *initdata;
+	struct regulator_config config = { };
+	const struct of_device_id *match;
+	struct regulation_constraints *constraint;
+	const char *supplyname = NULL;
+#ifdef CONFIG_HISI_PMIC_DEBUG
+	struct dentry *d;
+	static int debugfs_flag;
+#endif
+	unsigned int temp_modes;
+
+	const struct hisi_regulator *template = NULL;
+	int ret = 0;
+	/* to check which type of regulator this is */
+	match = of_match_device(of_hisi_regulator_match_tbl, &pdev->dev);
+	if (NULL == match) {
+		pr_err("get hisi regulator fail!\n\r");
+		return -EINVAL;
+	}
+
+	template = match->data;
+#if (LINUX_VERSION_CODE > KERNEL_VERSION(3, 13, 0))
+	initdata = of_get_regulator_init_data(dev, np, NULL);
+#else
+	initdata = of_get_regulator_init_data(dev, np);
+#endif
+	if (NULL == initdata) {
+		pr_err("get regulator init data error !\n");
+		return -EINVAL;
+	}
+
+	/* hisi regulator supports two modes */
+	constraint = &initdata->constraints;
+
+	ret = of_property_read_u32_array(np, "hisilicon,valid-modes-mask",
+						&(constraint->valid_modes_mask), 1);
+	if (ret) {
+		pr_err("no hisilicon,valid-modes-mask property set\n");
+		ret = -ENODEV;
+		return ret;
+	}
+	ret = of_property_read_u32_array(np, "hisilicon,valid-idle-mask",
+						&temp_modes, 1);
+	if (ret) {
+		pr_err("no hisilicon,valid-modes-mask property set\n");
+		ret = -ENODEV;
+		return ret;
+	}
+	constraint->valid_ops_mask |= temp_modes;
+
+	sreg = kmemdup(template, sizeof(*sreg), GFP_KERNEL);
+	if (!sreg) {
+		pr_err("template kememdup is fail. \n");
+		return -ENOMEM;
+	}
+	sreg->name = initdata->constraints.name;
+	rdesc = &sreg->rdesc;
+	rdesc->name = sreg->name;
+	rdesc->min_uV = initdata->constraints.min_uV;
+	supplyname = of_get_property(np, "hisilicon,supply_name", NULL);
+	if (supplyname != NULL) {
+		initdata->supply_regulator = supplyname;
+	}
+
+	/* to parse device tree data for regulator specific */
+	ret = sreg->dt_parse(sreg, pdev);
+	if (ret) {
+		dev_err(dev, "device tree parameter parse error!\n");
+		goto hisi_probe_end;
+	}
+
+	config.dev = &pdev->dev;
+	config.init_data = initdata;
+	config.driver_data = sreg;
+	config.of_node = pdev->dev.of_node;
+
+	/* register regulator */
+	rdev = regulator_register(rdesc, &config);
+	if (IS_ERR(rdev)) {
+		dev_err(dev, "failed to register %s\n",
+			rdesc->name);
+		ret = PTR_ERR(rdev);
+		goto hisi_probe_end;
+	}
+
+	BRAND_DEBUG("[%s]:valid_modes_mask[0x%x], valid_ops_mask[0x%x]\n", rdesc->name,\
+			constraint->valid_modes_mask, constraint->valid_ops_mask);
+
+	dev_set_drvdata(dev, rdev);
+#ifdef CONFIG_HISI_PMIC_DEBUG
+	if (debugfs_flag == 0) {
+		d = debugfs_create_dir("hisi_regulator_debugfs", NULL);
+		if (!d) {
+			dev_err(dev, "failed to create hisi regulator debugfs dir !\n");
+			ret = -ENOMEM;
+			goto hisi_probe_fail;
+		}
+		(void) debugfs_create_file("regulator_state", S_IRUSR,
+						d, NULL, &debug_regulator_state_fops);
+
+		(void) debugfs_create_file("control_regulator", S_IRUSR,
+						d, NULL, &set_control_regulator_fops);
+		debugfs_flag = 1;
+	}
+#endif
+
+#ifdef CONFIG_HISI_PMIC_DEBUG
+hisi_probe_fail:
+	if (ret)
+		regulator_unregister(rdev);
+#endif
+hisi_probe_end:
+	if (ret)
+		kfree(sreg);
+	return ret;
+}
+
+static void hisi_regulator_remove(struct spmi_device *pdev)
+{
+	struct regulator_dev *rdev = dev_get_drvdata(&pdev->dev);
+	struct hisi_regulator *sreg = rdev_get_drvdata(rdev);
+
+	regulator_unregister(rdev);
+
+	/* TODO: should i worry about that? devm_kzalloc */
+	if (sreg->rdesc.volt_table)
+		devm_kfree(&pdev->dev, (unsigned int *)sreg->rdesc.volt_table);
+
+	kfree(sreg);
+}
+static int hisi_regulator_suspend(struct device *dev, pm_message_t state)
+{
+	struct hisi_regulator *hisi_regulator = dev_get_drvdata(dev);
+
+	if (NULL == hisi_regulator) {
+		pr_err("%s:regulator is NULL\n", __func__);
+		return -ENOMEM;
+	}
+
+	pr_info("%s:+\n", __func__);
+	pr_info("%s:-\n", __func__);
+
+	return 0;
+}/*lint !e715 */
+
+static int hisi_regulator_resume(struct device *dev)
+{
+	struct hisi_regulator *hisi_regulator = dev_get_drvdata(dev);
+
+	if (NULL == hisi_regulator) {
+		pr_err("%s:regulator is NULL\n", __func__);
+		return -ENOMEM;
+	}
+
+	pr_info("%s:+\n", __func__);
+	pr_info("%s:-\n", __func__);
+
+	return 0;
+}
+
+static struct spmi_driver hisi_pmic_driver = {
+	.driver = {
+		.name	= "hisi_regulator",
+		.owner  = THIS_MODULE,
+		.of_match_table = of_hisi_regulator_match_tbl,
+		.suspend = hisi_regulator_suspend,
+		.resume = hisi_regulator_resume,
+	},
+	.probe	= hisi_regulator_probe,
+	.remove	= hisi_regulator_remove,
+};
+
+static int __init hisi_regulator_init(void)
+{
+	return spmi_driver_register(&hisi_pmic_driver);
+}
+
+static void __exit hisi_regulator_exit(void)
+{
+	spmi_driver_unregister(&hisi_pmic_driver);
+}
+
+fs_initcall(hisi_regulator_init);
+module_exit(hisi_regulator_exit);
+
+MODULE_DESCRIPTION("Hisi regulator driver");
+MODULE_LICENSE("GPL v2");
+
diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
new file mode 100644
index 000000000000..987526c8b49f
--- /dev/null
+++ b/drivers/spmi/hisi-spmi-controller.c
@@ -0,0 +1,390 @@
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/seq_file.h>
+#include <linux/spmi.h>
+#include <linux/spmi.h>
+
+#define SPMI_CONTROLLER_NAME		"spmi_controller"
+
+/*
+ * SPMI register addr
+ */
+#define SPMI_CHANNEL_OFFSET					0x0300
+#define SPMI_SLAVE_OFFSET						0x20
+
+#define SPMI_APB_SPMI_CMD_BASE_ADDR				0x0100
+/*lint -e750 -esym(750,*)*/
+#define SPMI_APB_SPMI_WDATA0_BASE_ADDR			0x0104
+#define SPMI_APB_SPMI_WDATA1_BASE_ADDR			0x0108
+#define SPMI_APB_SPMI_WDATA2_BASE_ADDR			0x010c
+#define SPMI_APB_SPMI_WDATA3_BASE_ADDR			0x0110
+
+#define SPMI_APB_SPMI_STATUS_BASE_ADDR			0x0200
+
+#define SPMI_APB_SPMI_RDATA0_BASE_ADDR			0x0204
+#define SPMI_APB_SPMI_RDATA1_BASE_ADDR			0x0208
+#define SPMI_APB_SPMI_RDATA2_BASE_ADDR			0x020c
+#define SPMI_APB_SPMI_RDATA3_BASE_ADDR			0x0210
+/*lint +e750 -esym(750,*)*/
+
+#define SPMI_PER_DATAREG_BYTE					4
+/*
+ * SPMI cmd register
+ */
+#define SPMI_APB_SPMI_CMD_EN						(1 << 31)
+#define SPMI_APB_SPMI_CMD_TYPE_OFFSET			24
+#define SPMI_APB_SPMI_CMD_LENGTH_OFFSET			20
+#define SPMI_APB_SPMI_CMD_SLAVEID_OFFSET			16
+#define SPMI_APB_SPMI_CMD_ADDR_OFFSET				0
+
+#define Tranverse32(X)                 ((((u32)(X) & 0xff000000) >> 24) | \
+							   (((u32)(X) & 0x00ff0000) >> 8) | \
+							   (((u32)(X) & 0x0000ff00) << 8) | \
+							   (((u32)(X) & 0x000000ff) << 24))
+
+/* Command Opcodes */
+/*lint -e749 -esym(749,*)*/
+enum spmi_controller_cmd_op_code {
+	SPMI_CMD_REG_ZERO_WRITE = 0,
+	SPMI_CMD_REG_WRITE = 1,
+	SPMI_CMD_REG_READ = 2,
+	SPMI_CMD_EXT_REG_WRITE = 3,
+	SPMI_CMD_EXT_REG_READ = 4,
+	SPMI_CMD_EXT_REG_WRITE_L = 5,
+	SPMI_CMD_EXT_REG_READ_L = 6,
+	SPMI_CMD_REG_RESET = 7,
+	SPMI_CMD_REG_SLEEP = 8,
+	SPMI_CMD_REG_SHUTDOWN = 9,
+	SPMI_CMD_REG_WAKEUP = 10,
+};
+/*lint +e749 -esym(749,*)*/
+
+/*
+ * SPMI status register
+ */
+#define SPMI_APB_TRANS_DONE						(1 << 0)
+#define SPMI_APB_TRANS_FAIL						(1 << 2)
+
+/* Command register fields */
+#define SPMI_CONTROLLER_CMD_MAX_BYTE_COUNT	16
+
+/* Maximum number of support PMIC peripherals */
+#define SPMI_CONTROLLER_TIMEOUT_US		1000
+#define SPMI_CONTROLLER_MAX_TRANS_BYTES	(16)
+
+#define SPMI_WRITEL( dev, reg, addr )	\
+	do { \
+		writel( ( reg ), ( addr ) ); \
+	} while (0)
+
+#define  SPMI_READL( dev, reg, addr )	\
+	do { \
+		reg = readl( addr ); \
+	} while (0)
+
+/*
+ * @base base address of the PMIC Arbiter core registers.
+ * @rdbase, @wrbase base address of the PMIC Arbiter read core registers.
+ *     For HW-v1 these are equal to base.
+ *     For HW-v2, the value is the same in eeraly probing, in order to read
+ *     PMIC_ARB_CORE registers, then chnls, and obsrvr are set to
+ *     PMIC_ARB_CORE_REGISTERS and PMIC_ARB_CORE_REGISTERS_OBS respectivly.
+ * @intr base address of the SPMI interrupt control registers
+ * @ppid_2_chnl_tbl lookup table f(SID, Periph-ID) -> channel num
+ *      entry is only valid if corresponding bit is set in valid_ppid_bitmap.
+ * @valid_ppid_bitmap bit is set only for valid ppids.
+ * @fmt_cmd formats a command to be set into PMIC_ARBq_CHNLn_CMD
+ * @chnl_ofst calculates offset of the base of a channel reg space
+ * @ee execution environment id
+ * @irq_acc0_init_val initial value of the interrupt accumulator at probe time.
+ *      Use for an HW workaround. On handling interrupts, the first accumulator
+ *      register will be compared against this value, and bits which are set at
+ *      boot will be ignored.
+ * @reserved_chnl entry of ppid_2_chnl_tbl that this driver should never touch.
+ *      value is positive channel number or negative to mark it unused.
+ */
+struct spmi_controller_dev {
+	struct spmi_controller	*controller;
+	struct device		*dev;
+	void __iomem		*base;
+	spinlock_t		lock;
+	u32			channel;
+};
+
+static int spmi_controller_wait_for_done(struct spmi_controller_dev *ctrl_dev,
+				  void __iomem *base, u8 sid, u16 addr)
+{
+	u32 status = 0;
+	u32 timeout = SPMI_CONTROLLER_TIMEOUT_US;
+	u32 offset = SPMI_APB_SPMI_STATUS_BASE_ADDR + SPMI_CHANNEL_OFFSET * ctrl_dev->channel
+		+ SPMI_SLAVE_OFFSET * sid;
+
+	while (timeout--) {
+		SPMI_READL(ctrl_dev->dev, status, base + offset);/*lint !e732 */
+
+		if (status & SPMI_APB_TRANS_DONE) {
+			if (status & SPMI_APB_TRANS_FAIL) {
+				dev_err(ctrl_dev->dev,
+					"%s: transaction failed (0x%x)\n",
+					__func__, status);
+				return -EIO;
+			}
+			return 0;
+		}
+		udelay(1);/*lint !e778 !e774 !e747*/
+	}
+
+	dev_err(ctrl_dev->dev,
+		"%s: timeout, status 0x%x\n",
+		__func__, status);
+	return -ETIMEDOUT;/*lint !e438*/
+}/*lint !e715 !e529*/
+
+static int spmi_read_cmd(struct spmi_controller *ctrl,
+				u8 opc, u8 sid, u16 addr, u8 *buf, size_t bc)
+{
+	struct spmi_controller_dev *spmi_controller = dev_get_drvdata(&ctrl->dev);
+	unsigned long flags;
+	u32 cmd, data;
+	int rc;
+	u32 chnl_ofst = SPMI_CHANNEL_OFFSET*spmi_controller->channel;
+	u8 op_code, i;
+
+	if (bc > SPMI_CONTROLLER_MAX_TRANS_BYTES) {
+		dev_err(spmi_controller->dev
+		, "spmi_controller supports 1..%d bytes per trans, but:%ld requested"
+					, SPMI_CONTROLLER_MAX_TRANS_BYTES, bc);
+		return  -EINVAL;
+	}
+
+	/* Check the opcode */
+	if (SPMI_CMD_READ == opc)
+		op_code = SPMI_CMD_REG_READ;
+	else if (SPMI_CMD_EXT_READ == opc)
+		op_code = SPMI_CMD_EXT_REG_READ;
+	else if (SPMI_CMD_EXT_READL == opc)
+		op_code = SPMI_CMD_EXT_REG_READ_L;
+	else {
+		dev_err(spmi_controller->dev, "invalid read cmd 0x%x", opc);
+		return -EINVAL;
+	}
+
+	cmd = SPMI_APB_SPMI_CMD_EN |/*lint !e648 !e701 */								/* cmd_en */
+		 (op_code << SPMI_APB_SPMI_CMD_TYPE_OFFSET) |/*lint !e648 !e701 */			/* cmd_type */
+		 ((bc-1) << SPMI_APB_SPMI_CMD_LENGTH_OFFSET) |/*lint !e648 !e701 */		/* byte_cnt */
+		 ((sid & 0xf) << SPMI_APB_SPMI_CMD_SLAVEID_OFFSET) |						/* slvid */
+		 ((addr & 0xffff)  << SPMI_APB_SPMI_CMD_ADDR_OFFSET);					/* slave_addr */
+
+	spin_lock_irqsave(&spmi_controller->lock, flags);/*lint !e550 */
+
+	SPMI_WRITEL(spmi_controller->dev, cmd, spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_CMD_BASE_ADDR);
+
+
+	rc = spmi_controller_wait_for_done(spmi_controller, spmi_controller->base, sid, addr);
+	if (rc)
+		goto done;
+
+	i = 0;
+	do {
+		SPMI_READL(spmi_controller->dev, data, spmi_controller->base + chnl_ofst + SPMI_SLAVE_OFFSET*sid + SPMI_APB_SPMI_RDATA0_BASE_ADDR + i*SPMI_PER_DATAREG_BYTE);/*lint !e732 */
+		data = Tranverse32(data);
+		if ((bc - i*SPMI_PER_DATAREG_BYTE ) >> 2) {/*lint !e702 */
+			memcpy(buf, &data, sizeof(data));
+			buf += sizeof(data);
+		} else {
+			memcpy(buf, &data, bc%SPMI_PER_DATAREG_BYTE);/*lint !e747 */
+			buf += (bc%SPMI_PER_DATAREG_BYTE);
+		}
+		i++;
+	} while (bc > i*SPMI_PER_DATAREG_BYTE);
+
+done:
+	spin_unlock_irqrestore(&spmi_controller->lock, flags);
+	if (rc)
+		dev_err(spmi_controller->dev, "spmi read wait timeout op:0x%x sid:%d addr:0x%x bc:%ld\n",
+							opc, sid, addr, bc + 1);
+	return rc;
+}/*lint !e550 !e529*/
+
+/*lint -e438 -esym(438,*)*/
+static int spmi_write_cmd(struct spmi_controller *ctrl,
+				u8 opc, u8 sid, u16 addr, const u8 *buf, size_t bc)
+{
+	struct spmi_controller_dev *spmi_controller = dev_get_drvdata(&ctrl->dev);
+	unsigned long flags;
+	u32 cmd;
+	u32 data = 0;
+	int rc;
+	u32 chnl_ofst = SPMI_CHANNEL_OFFSET*spmi_controller->channel;
+	u8 op_code, i;
+
+
+	if (bc > SPMI_CONTROLLER_MAX_TRANS_BYTES) {
+		dev_err(spmi_controller->dev
+		, "spmi_controller supports 1..%d bytes per trans, but:%ld requested"
+					, SPMI_CONTROLLER_MAX_TRANS_BYTES, bc);
+		return  -EINVAL;
+	}
+
+	/* Check the opcode */
+	if (SPMI_CMD_WRITE == opc)
+		op_code = SPMI_CMD_REG_WRITE;
+	else if (SPMI_CMD_EXT_WRITE == opc)
+		op_code = SPMI_CMD_EXT_REG_WRITE;
+	else if (SPMI_CMD_EXT_WRITEL == opc)
+		op_code = SPMI_CMD_EXT_REG_WRITE_L;
+	else {
+		dev_err(spmi_controller->dev, "invalid write cmd 0x%x", opc);
+		return -EINVAL;
+	}
+
+	cmd = SPMI_APB_SPMI_CMD_EN |/*lint !e648 !e701 */								/* cmd_en */
+		 (op_code << SPMI_APB_SPMI_CMD_TYPE_OFFSET) |/*lint !e648 !e701 */			/* cmd_type */
+		 ((bc-1) << SPMI_APB_SPMI_CMD_LENGTH_OFFSET) |/*lint !e648 !e701 */		/* byte_cnt */
+		 ((sid & 0xf) << SPMI_APB_SPMI_CMD_SLAVEID_OFFSET) |						/* slvid */
+		 ((addr & 0xffff)  << SPMI_APB_SPMI_CMD_ADDR_OFFSET);					/* slave_addr */
+
+	/* Write data to FIFOs */
+	spin_lock_irqsave(&spmi_controller->lock, flags);/*lint !e550 */
+
+	i = 0;
+	do {
+		memset(&data, 0, sizeof(data));
+		if ((bc - i*SPMI_PER_DATAREG_BYTE ) >> 2) {/*lint !e702 */
+			memcpy(&data, buf, sizeof(data));
+			buf +=sizeof(data);
+		} else {
+			memcpy(&data, buf, bc%SPMI_PER_DATAREG_BYTE);/*lint !e747 */
+			buf +=(bc%SPMI_PER_DATAREG_BYTE);
+		}
+
+		data = Tranverse32(data);
+		SPMI_WRITEL(spmi_controller->dev, data, spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_WDATA0_BASE_ADDR+SPMI_PER_DATAREG_BYTE*i);
+		i++;
+	} while (bc > i*SPMI_PER_DATAREG_BYTE);
+
+	/* Start the transaction */
+	SPMI_WRITEL(spmi_controller->dev, cmd, spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_CMD_BASE_ADDR);
+
+	rc = spmi_controller_wait_for_done(spmi_controller, spmi_controller->base, sid, addr);
+	spin_unlock_irqrestore(&spmi_controller->lock, flags);
+
+	if (rc)
+		dev_err(spmi_controller->dev, "spmi write wait timeout op:0x%x sid:%d addr:0x%x bc:%ld\n",
+							opc, sid, addr, bc);
+
+	return rc;
+}/*lint !e438 !e550 !e529*/
+/*lint +e438 -esym(438,*)*/
+static int spmi_controller_probe(struct platform_device *pdev)
+{
+	struct spmi_controller_dev *spmi_controller;
+	struct spmi_controller *ctrl;
+	struct resource *iores;
+	int ret = 0;
+
+	printk(KERN_INFO "HISI SPMI probe\n");
+	ctrl = spmi_controller_alloc(&pdev->dev, sizeof(*spmi_controller));
+	if (!ctrl) {
+		dev_err(&pdev->dev, "can not allocate spmi_controller data\n");
+		return -ENOMEM;  /*lint !e429*/
+	}
+	spmi_controller = spmi_controller_get_drvdata(ctrl);
+	spmi_controller->controller = ctrl;
+
+	/* NOTE: driver uses the static register mapping */
+	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!iores) {
+		dev_err(&pdev->dev, "can not get resource! \n");
+		return -EINVAL; /*lint !e429*/
+	}
+
+	spmi_controller->base = ioremap(iores->start, resource_size(iores));
+	if (!spmi_controller->base) {
+		dev_err(&pdev->dev, "can not remap base addr! \n");
+		return -EADDRNOTAVAIL; /*lint !e429*/
+	}
+	dev_dbg(&pdev->dev, "spmi_add_controller base addr=0x%lx!\n", (long unsigned int)spmi_controller->base);/*lint !e774*/
+
+	/* Get properties from the device tree */
+	ret = of_property_read_u32(pdev->dev.of_node, "spmi-channel",
+			&spmi_controller->channel);/*lint !e838*/
+	if (ret) {
+		dev_err(&pdev->dev, "can not get chanel \n");
+		return -ENODEV; /*lint !e429*/
+	}
+
+	platform_set_drvdata(pdev, spmi_controller);
+	dev_set_drvdata(&ctrl->dev, spmi_controller);
+
+	spin_lock_init(&spmi_controller->lock);
+
+	ctrl->nr = spmi_controller->channel;
+	ctrl->dev.parent = pdev->dev.parent;
+	ctrl->dev.of_node = of_node_get(pdev->dev.of_node);
+
+	/* Callbacks */
+	ctrl->read_cmd = spmi_read_cmd;
+	ctrl->write_cmd = spmi_write_cmd;
+
+	ret = spmi_controller_add(ctrl);
+	if (ret) {
+		dev_err(&pdev->dev, "spmi_add_controller failed!\n");
+		goto err_add_controller;
+	}
+err_add_controller:
+	platform_set_drvdata(pdev, NULL);
+	return ret; /*lint !e429*/
+}
+
+static int spmi_del_controller(struct platform_device *pdev)
+{
+	struct spmi_controller *ctrl = platform_get_drvdata(pdev);
+
+	platform_set_drvdata(pdev, NULL);
+	spmi_controller_remove(ctrl);
+	return 0;
+}
+
+static struct of_device_id spmi_controller_match_table[] = {
+	{	.compatible = "hisilicon,spmi-controller",
+	},/*lint !e785*/
+	{}/*lint !e785*/
+};
+
+static struct platform_driver spmi_controller_driver = {
+	.probe		= spmi_controller_probe,
+	.remove		= spmi_del_controller,
+	.driver		= {
+		.name	= SPMI_CONTROLLER_NAME,
+		.owner	= THIS_MODULE,/*lint !e64*/
+		.of_match_table = spmi_controller_match_table,
+	},/*lint !e785*/
+};/*lint !e785*/
+/*lint -e528 -esym(528,*)*/
+static int __init spmi_controller_init(void)
+{
+	return platform_driver_register(&spmi_controller_driver);/*lint !e64*/
+}
+postcore_initcall(spmi_controller_init);
+
+static void __exit spmi_controller_exit(void)
+{
+	platform_driver_unregister(&spmi_controller_driver);
+}
+module_exit(spmi_controller_exit);
+/*lint -e753 -esym(753,*)*/
+MODULE_LICENSE("GPL v2");
+MODULE_VERSION("1.0");/*lint !e785 !e64 !e528*/
+MODULE_ALIAS("platform:spmi_controlller");
+/*lint -e753 +esym(753,*)*/
+/*lint -e528 +esym(528,*)*/
+
diff --git a/include/linux/mfd/hisi_pmic.h b/include/linux/mfd/hisi_pmic.h
new file mode 100644
index 000000000000..939b36f617c1
--- /dev/null
+++ b/include/linux/mfd/hisi_pmic.h
@@ -0,0 +1,165 @@
+/*
+ * Header file for device driver Hi6421 PMIC
+ *
+ * Copyright (c) 2013 Linaro Ltd.
+ * Copyright (C) 2011 Hisilicon.
+ *
+ * Guodong Xu <guodong.xu@linaro.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, write to the Free Software Foundation, Inc.,
+ * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ */
+
+#ifndef	__HISI_PMIC_H
+#define	__HISI_PMIC_H
+
+#include <linux/irqdomain.h>
+
+#define HISI_REGS_ENA_PROTECT_TIME	(0) 	/* in microseconds */
+#define HISI_ECO_MODE_ENABLE		(1)
+#define HISI_ECO_MODE_DISABLE		(0)
+
+typedef int (*pmic_ocp_callback)(char *);
+extern int hisi_pmic_special_ocp_register(char *power_name, pmic_ocp_callback handler);
+
+struct irq_mask_info {
+	int start_addr;
+	int array;
+};
+
+struct irq_info {
+	int start_addr;
+	int array;
+};
+
+struct bit_info {
+	int addr;
+	int bit;
+};
+
+struct write_lock {
+	int addr;
+	int val;
+};
+
+struct hisi_pmic {
+	struct resource		*res;
+	struct device		*dev;
+	void __iomem		*regs;
+	spinlock_t		lock;
+	struct irq_domain	*domain;
+	int			irq;
+	int			gpio;
+	unsigned int	*irqs;
+	int			irqnum;
+	int			irqarray;
+	struct irq_mask_info irq_mask_addr;
+	struct irq_info irq_addr;
+	int			irqnum1;
+	int			irqarray1;
+	struct irq_mask_info irq_mask_addr1;
+	struct irq_info irq_addr1;
+	struct write_lock normal_lock;
+	struct write_lock debug_lock;
+};
+
+/* 0:disable; 1:enable */
+unsigned int get_uv_mntn_status(void);
+void clear_uv_mntn_resered_reg_bit(void);
+void set_uv_mntn_resered_reg_bit(void);
+
+#if defined(CONFIG_HISI_PMIC) || defined(CONFIG_HISI_PMIC_PMU_SPMI)
+/* Register Access Helpers */
+u32 hisi_pmic_read(struct hisi_pmic *pmic, int reg);
+void hisi_pmic_write(struct hisi_pmic *pmic, int reg, u32 val);
+void hisi_pmic_rmw(struct hisi_pmic *pmic, int reg, u32 mask, u32 bits);
+unsigned int hisi_pmic_reg_read(int addr);
+void hisi_pmic_reg_write(int addr, int val);
+void hisi_pmic_reg_write_lock(int addr, int val);
+int hisi_pmic_array_read(int addr, char *buff, unsigned int len);
+int hisi_pmic_array_write(int addr, char *buff, unsigned int len);
+extern int hisi_get_pmic_irq_byname(unsigned int pmic_irq_list);
+extern int hisi_pmic_get_vbus_status(void);
+#if defined(CONFIG_HISI_DIEID)
+u32 hisi_pmic_read_sub_pmu(u8 sid ,int reg);
+void hisi_pmic_write_sub_pmu(u8 sid ,int reg, u32 val);
+#endif
+#else
+static inline u32 hisi_pmic_read(struct hisi_pmic *pmic, int reg) { return 0; }
+static inline void hisi_pmic_write(struct hisi_pmic *pmic, int reg, u32 val) {}
+static inline void hisi_pmic_rmw(struct hisi_pmic *pmic, int reg, u32 mask, u32 bits) {}
+static inline unsigned int hisi_pmic_reg_read(int addr) { return 0; }
+static inline void hisi_pmic_reg_write(int addr, int val) {}
+static inline void hisi_pmic_reg_write_lock(int addr, int val) {}
+static inline int hisi_pmic_array_read(int addr, char *buff, unsigned int len) { return 0; }
+static inline int hisi_pmic_array_write(int addr, char *buff, unsigned int len) { return 0; }
+static inline int hisi_get_pmic_irq_byname(unsigned int pmic_irq_list) { return -1; }
+static inline int hisi_pmic_get_vbus_status(void) { return 1; }
+static inline u32 hisi_pmic_read_sub_pmu(u8 sid ,int reg) { return 0; }
+static inline void hisi_pmic_write_sub_pmu(u8 sid ,int reg, u32 val) {}
+#endif
+
+#ifdef CONFIG_HISI_HI6421V500_PMU
+enum pmic_irq_list {
+	POR_D45MR = 0,
+	VBUS_CONNECT,
+	VBUS_DISCONNECT,
+	ALARMON_R,
+	HOLD_6S,
+	HOLD_1S,
+	POWERKEY_UP,
+	POWERKEY_DOWN,
+	OCP_SCP_R,
+	COUL_R,
+	VSYS_OV,
+	VSYS_UV,
+	VSYS_PWROFF_ABS,
+	VSYS_PWROFF_DEB,
+	THSD_OTMP140,
+	THSD_OTMP125,
+	HRESETN,
+	SIM0_HPD_R = 24,
+	SIM0_HPD_F,
+	SIM0_HPD_H,
+	SIM0_HPD_L,
+	SIM1_HPD_R,
+	SIM1_HPD_F,
+	SIM1_HPD_H,
+	SIM1_HPD_L,
+	PMIC_IRQ_LIST_MAX,
+};
+#else
+enum pmic_irq_list {
+	OTMP = 0,
+	VBUS_CONNECT,
+	VBUS_DISCONNECT,
+	ALARMON_R,
+	HOLD_6S,
+	HOLD_1S,
+	POWERKEY_UP,
+	POWERKEY_DOWN,
+	OCP_SCP_R,
+	COUL_R,
+	SIM0_HPD_R,
+	SIM0_HPD_F,
+	SIM1_HPD_R,
+	SIM1_HPD_F,
+	PMIC_IRQ_LIST_MAX,
+};
+#endif
+
+#ifdef CONFIG_HISI_SR_DEBUG
+extern void get_ip_regulator_state(void);
+#endif
+#endif		/* __HISI_PMIC_H */
+
-- 
2.26.2

