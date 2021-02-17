Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E13731D582
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 07:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbhBQGuN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 01:50:13 -0500
Received: from z11.mailgun.us ([104.130.96.11]:36346 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231585AbhBQGuK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 01:50:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613544590; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=N3dYpG65EOnxTxHoYF3vxMlnP3niHhxSlYeRXJUQY44=; b=w6FQfy2C+5nlOw421XW0TzuQA4yCzWjwI61PVoeWE+sdV5VcMbc3QKGe838viJuBnHDJuknY
 yOiyMkFSCzEJ6ZSju7kvuouImulik0JvJM2Ck2xJyYpUV3LYk12wdwvHO1p6kF6OJoOvBpsr
 ddODAHN8mD9U6xjvLgRZxxFSINs=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 602cbc662d3aa2c7089a4e92 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 06:49:10
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 40EEAC433CA; Wed, 17 Feb 2021 06:49:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C8935C433C6;
        Wed, 17 Feb 2021 06:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C8935C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=schowdhu@codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V0 3/6] soc: qcom: dcc:Add driver support for Data Capture and Compare unit(DCC)
Date:   Wed, 17 Feb 2021 12:18:24 +0530
Message-Id: <f182b10f318db7cb09216c0176a5b26656d9ef49.1613541226.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1613541226.git.schowdhu@codeaurora.org>
References: <cover.1613541226.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1613541226.git.schowdhu@codeaurora.org>
References: <cover.1613541226.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DCC is a DMA Engine designed to capture and store data
during system crash or software triggers.The DCC operates
based on link list entries which provides it with data and
addresses and the function it needs to perform.These functions
are read,write and loop.Added the basic driver in this patch
which contains a probe method which instantiates all the link
list data specific to a SoC.Methods have also been added to
handle all the functionalities specific to a linked list.Each
DCC has it's own SRAM which needs to be instantiated at probe
time as well.

Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
---
 drivers/soc/qcom/Kconfig  |    8 +
 drivers/soc/qcom/Makefile |    1 +
 drivers/soc/qcom/dcc.c    | 1055 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 1064 insertions(+)
 create mode 100644 drivers/soc/qcom/dcc.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 79b568f..8819e0b 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -69,6 +69,14 @@ config QCOM_LLCC
 	  SDM845. This provides interfaces to clients that use the LLCC.
 	  Say yes here to enable LLCC slice driver.
 
+config QCOM_DCC
+	tristate "Qualcomm Technologies, Inc. Data Capture and Compare engine driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	help
+	  This option enables driver for Data Capture and Compare engine. DCC
+	  driver provides interface to configure DCC block and read back
+	  captured data from DCC's internal SRAM.
+
 config QCOM_KRYO_L2_ACCESSORS
 	bool
 	depends on ARCH_QCOM && ARM64 || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index ad675a6..1b00870 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -26,3 +26,4 @@ obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
 obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
 obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
 obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
+obj-$(CONFIG_QCOM_DCC) += dcc.o
diff --git a/drivers/soc/qcom/dcc.c b/drivers/soc/qcom/dcc.c
new file mode 100644
index 0000000..d67452b
--- /dev/null
+++ b/drivers/soc/qcom/dcc.c
@@ -0,0 +1,1055 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/bitops.h>
+#include <linux/cdev.h>
+#include <linux/delay.h>
+#include <linux/fs.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+#define TIMEOUT_US		100
+
+#define BM(lsb, msb)		((BIT(msb) - BIT(lsb)) + BIT(msb))
+#define BMVAL(val, lsb, msb)	((val & BM(lsb, msb)) >> lsb)
+#define BVAL(val, n)		((val & BIT(n)) >> n)
+
+#define dcc_writel(drvdata, val, off)					\
+	writel((val), drvdata->base + dcc_offset_conv(drvdata, off))
+#define dcc_readl(drvdata, off)						\
+	readl(drvdata->base + dcc_offset_conv(drvdata, off))
+
+#define dcc_sram_readl(drvdata, off)					\
+	readl(drvdata->ram_base + off)
+
+/* DCC registers */
+#define DCC_HW_INFO					0x04
+#define DCC_LL_NUM_INFO					0x10
+#define DCC_STATUS					0x1C
+#define DCC_LL_LOCK(m)					(0x34 + 0x80 * m)
+#define DCC_LL_CFG(m)					(0x38 + 0x80 * m)
+#define DCC_LL_BASE(m)					(0x3c + 0x80 * m)
+#define DCC_FD_BASE(m)					(0x40 + 0x80 * m)
+#define DCC_LL_TIMEOUT(m)				(0x44 + 0x80 * m)
+#define DCC_LL_INT_ENABLE(m)				(0x4C + 0x80 * m)
+#define DCC_LL_INT_STATUS(m)				(0x50 + 0x80 * m)
+#define DCC_LL_SW_TRIGGER(m)				(0x60 + 0x80 * m)
+#define DCC_LL_BUS_ACCESS_STATUS(m)			(0x64 + 0x80 * m)
+
+#define DCC_MAP_LEVEL1			0x18
+#define DCC_MAP_LEVEL2			0x34
+#define DCC_MAP_LEVEL3			0x4C
+
+#define DCC_MAP_OFFSET1			0x10
+#define DCC_MAP_OFFSET2			0x18
+#define DCC_MAP_OFFSET3			0x1C
+#define DCC_MAP_OFFSET4			0x8
+
+#define DCC_FIX_LOOP_OFFSET		16
+#define DCC_VER_INFO_BIT		9
+
+#define DCC_READ        0
+#define DCC_WRITE       1
+#define DCC_LOOP        2
+#define DCC_READ_WRITE  3
+
+#define MAX_DCC_OFFSET				(0xFF * 4)
+#define MAX_DCC_LEN				0x7F
+#define MAX_LOOP_CNT				0xFF
+
+#define DCC_ADDR_DESCRIPTOR			0x00
+#define DCC_LOOP_DESCRIPTOR			(BIT(30))
+#define DCC_RD_MOD_WR_DESCRIPTOR		(BIT(31))
+#define DCC_LINK_DESCRIPTOR			(BIT(31) | BIT(30))
+
+#define DCC_READ_IND				0x00
+#define DCC_WRITE_IND				(BIT(28))
+
+#define DCC_AHB_IND				0x00
+#define DCC_APB_IND				BIT(29)
+
+#define DCC_MAX_LINK_LIST			8
+#define DCC_INVALID_LINK_LIST			0xFF
+
+#define DCC_VER_MASK1				0x7F
+#define DCC_VER_MASK2				0x3F
+
+#define DCC_RD_MOD_WR_ADDR                      0xC105E
+
+struct qcom_dcc_config {
+	const int dcc_ram_offset;
+};
+
+static const struct qcom_dcc_config sm8150_cfg = {
+	.dcc_ram_offset				= 0x5000,
+};
+
+enum dcc_descriptor_type {
+	DCC_ADDR_TYPE,
+	DCC_LOOP_TYPE,
+	DCC_READ_WRITE_TYPE,
+	DCC_WRITE_TYPE
+};
+
+enum dcc_mem_map_ver {
+	DCC_MEM_MAP_VER1,
+	DCC_MEM_MAP_VER2,
+	DCC_MEM_MAP_VER3
+};
+
+struct dcc_config_entry {
+	u32				base;
+	u32				offset;
+	u32				len;
+	u32				index;
+	u32				loop_cnt;
+	u32				write_val;
+	u32				mask;
+	bool				apb_bus;
+	enum dcc_descriptor_type	desc_type;
+	struct list_head		list;
+};
+
+struct dcc_drvdata {
+	void __iomem		*base;
+	u32			reg_size;
+	struct device		*dev;
+	struct mutex		mutex;
+	void __iomem		*ram_base;
+	u32			ram_size;
+	u32			ram_offset;
+	enum dcc_mem_map_ver	mem_map_ver;
+	u32			ram_cfg;
+	u32			ram_start;
+	bool			*enable;
+	bool			*configured;
+	bool			interrupt_disable;
+	char			*sram_node;
+	struct cdev		sram_dev;
+	struct class		*sram_class;
+	struct list_head	*cfg_head;
+	u32			*nr_config;
+	u32			nr_link_list;
+	u8			curr_list;
+	u8			loopoff;
+};
+
+struct dcc_cfg_attr {
+	u32	addr;
+	u32	prev_addr;
+	u32	prev_off;
+	u32	link;
+	u32	sram_offset;
+};
+
+struct dcc_cfg_loop_attr {
+	u32	loop;
+	bool	loop_start;
+	u32	loop_cnt;
+	u32	loop_len;
+	u32	loop_off;
+};
+
+static u32 dcc_offset_conv(struct dcc_drvdata *drvdata, u32 off)
+{
+	if (drvdata->mem_map_ver == DCC_MEM_MAP_VER1) {
+		if ((off & DCC_VER_MASK1) >= DCC_MAP_LEVEL3)
+			return (off - DCC_MAP_OFFSET3);
+		if ((off & DCC_VER_MASK1) >= DCC_MAP_LEVEL2)
+			return (off - DCC_MAP_OFFSET2);
+		else if ((off & DCC_VER_MASK1) >= DCC_MAP_LEVEL1)
+			return (off - DCC_MAP_OFFSET1);
+	} else if (drvdata->mem_map_ver == DCC_MEM_MAP_VER2) {
+		if ((off & DCC_VER_MASK1) >= DCC_MAP_LEVEL2)
+			return (off - DCC_MAP_OFFSET4);
+	}
+	return off;
+}
+
+static int dcc_sram_writel(struct dcc_drvdata *drvdata,
+					u32 val, u32 off)
+{
+	if (unlikely(off > (drvdata->ram_size - 4)))
+		return -EINVAL;
+
+	writel((val), drvdata->ram_base + off);
+
+	return 0;
+}
+
+static int _dcc_ll_cfg_read_write(struct dcc_drvdata *drvdata,
+struct dcc_config_entry *entry, struct dcc_cfg_attr *cfg)
+{
+	int ret = 0;
+
+	if (cfg->link) {
+		/* write new offset = 1 to continue
+		 * processing the list
+		 */
+
+		ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
+		if (ret)
+			return ret;
+		cfg->sram_offset += 4;
+		/* Reset link and prev_off */
+		cfg->addr = 0x00;
+		cfg->link = 0;
+		cfg->prev_off = 0;
+		cfg->prev_addr = cfg->addr;
+	}
+
+	cfg->addr = DCC_RD_MOD_WR_DESCRIPTOR;
+
+	ret = dcc_sram_writel(drvdata, cfg->addr, cfg->sram_offset);
+
+	if (ret)
+		return ret;
+
+	cfg->sram_offset += 4;
+
+	ret = dcc_sram_writel(drvdata, entry->mask, cfg->sram_offset);
+
+	if (ret)
+		return ret;
+
+	cfg->sram_offset += 4;
+
+	ret = dcc_sram_writel(drvdata, entry->write_val, cfg->sram_offset);
+
+	if (ret)
+		return ret;
+
+	cfg->sram_offset += 4;
+
+	cfg->addr = 0;
+
+	return ret;
+}
+
+static int _dcc_ll_cfg_loop(struct dcc_drvdata *drvdata, struct dcc_config_entry *entry,
+struct dcc_cfg_attr *cfg, struct dcc_cfg_loop_attr *cfg_loop, u32 *total_len)
+{
+
+	int ret = 0;
+
+	/* Check if we need to write link of prev entry */
+	if (cfg->link) {
+		ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
+		if (ret)
+			return ret;
+		cfg->sram_offset += 4;
+	}
+
+	if (cfg_loop->loop_start) {
+		cfg_loop->loop = (cfg->sram_offset - cfg_loop->loop_off) / 4;
+		cfg_loop->loop |= (cfg_loop->loop_cnt << drvdata->loopoff) &
+		BM(drvdata->loopoff, 27);
+		cfg_loop->loop |= DCC_LOOP_DESCRIPTOR;
+		*total_len += (*total_len - cfg_loop->loop_len) * cfg_loop->loop_cnt;
+
+		ret = dcc_sram_writel(drvdata, cfg_loop->loop, cfg->sram_offset);
+
+		if (ret)
+			return ret;
+		cfg->sram_offset += 4;
+
+		cfg_loop->loop_start = false;
+		cfg_loop->loop_len = 0;
+		cfg_loop->loop_off = 0;
+	} else {
+		cfg_loop->loop_start = true;
+		cfg_loop->loop_cnt = entry->loop_cnt - 1;
+		cfg_loop->loop_len = *total_len;
+		cfg_loop->loop_off = cfg->sram_offset;
+	}
+
+	/* Reset link and prev_off */
+
+	cfg->addr = 0x00;
+	cfg->link = 0;
+	cfg->prev_off = 0;
+	cfg->prev_addr = cfg->addr;
+
+	return ret;
+}
+
+static int _dcc_ll_cfg_write(struct dcc_drvdata *drvdata,
+struct dcc_config_entry *entry, struct dcc_cfg_attr *cfg, u32 *total_len)
+{
+	u32 off;
+	int ret = 0;
+
+	if (cfg->link) {
+		/* write new offset = 1 to continue
+		 * processing the list
+		 */
+		ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
+
+		if (ret)
+			return ret;
+
+		cfg->sram_offset += 4;
+		/* Reset link and prev_off */
+		cfg->addr = 0x00;
+		cfg->prev_off = 0;
+		cfg->prev_addr = cfg->addr;
+	}
+
+	off = entry->offset/4;
+	/* write new offset-length pair to correct position */
+	cfg->link |= ((off & BM(0, 7)) | BIT(15) | ((entry->len << 8) & BM(8, 14)));
+	cfg->link |= DCC_LINK_DESCRIPTOR;
+
+	/* Address type */
+	cfg->addr = (entry->base >> 4) & BM(0, 27);
+	if (entry->apb_bus)
+		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_WRITE_IND | DCC_APB_IND;
+	else
+		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_WRITE_IND | DCC_AHB_IND;
+	ret = dcc_sram_writel(drvdata, cfg->addr, cfg->sram_offset);
+
+	if (ret)
+		return ret;
+	cfg->sram_offset += 4;
+
+	ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
+	if (ret)
+		return ret;
+	cfg->sram_offset += 4;
+
+	ret = dcc_sram_writel(drvdata, entry->write_val, cfg->sram_offset);
+
+	if (ret)
+		return ret;
+
+	cfg->sram_offset += 4;
+	cfg->addr = 0x00;
+	cfg->link = 0;
+	return ret;
+}
+
+static int _dcc_ll_cfg_default(struct dcc_drvdata *drvdata,
+struct dcc_config_entry *entry, struct dcc_cfg_attr *cfg, u32 *pos, u32 *total_len)
+{
+	int ret = 0;
+	u32 off;
+
+	cfg->addr = (entry->base >> 4) & BM(0, 27);
+
+	if (entry->apb_bus)
+		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_READ_IND | DCC_APB_IND;
+	else
+		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_READ_IND | DCC_AHB_IND;
+
+	off = entry->offset/4;
+
+	*total_len += entry->len * 4;
+
+	if (!cfg->prev_addr || cfg->prev_addr != cfg->addr || cfg->prev_off > off) {
+		/* Check if we need to write prev link entry */
+		if (cfg->link) {
+			ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
+			if (ret)
+				return ret;
+				cfg->sram_offset += 4;
+		}
+		dev_dbg(drvdata->dev, "DCC: sram address 0x%x\n", cfg->sram_offset);
+
+		/* Write address */
+		ret = dcc_sram_writel(drvdata, cfg->addr, cfg->sram_offset);
+
+		if (ret)
+			return ret;
+
+		cfg->sram_offset += 4;
+
+		/* Reset link and prev_off */
+		cfg->link = 0;
+		cfg->prev_off = 0;
+	}
+
+	if ((off - cfg->prev_off) > 0xFF || entry->len > MAX_DCC_LEN) {
+		dev_err(drvdata->dev, "DCC: Programming error Base: 0x%x, offset 0x%x\n",
+		entry->base, entry->offset);
+		ret = -EINVAL;
+		return ret;
+	}
+
+	if (cfg->link) {
+		/*
+		 * link already has one offset-length so new
+		 * offset-length needs to be placed at
+		 * bits [29:15]
+		 */
+		*pos = 15;
+
+		/* Clear bits [31:16] */
+		cfg->link &= BM(0, 14);
+	} else {
+		/*
+		 * link is empty, so new offset-length needs
+		 * to be placed at bits [15:0]
+		 */
+		*pos = 0;
+		cfg->link = 1 << 15;
+	}
+
+	/* write new offset-length pair to correct position */
+	cfg->link |= (((off-cfg->prev_off) & BM(0, 7)) | ((entry->len << 8) & BM(8, 14))) << *pos;
+
+	cfg->link |= DCC_LINK_DESCRIPTOR;
+
+	if (*pos) {
+		ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
+		if (ret)
+			return ret;
+		cfg->sram_offset += 4;
+		cfg->link = 0;
+	}
+
+	cfg->prev_off  = off + entry->len - 1;
+	cfg->prev_addr = cfg->addr;
+	return ret;
+}
+
+static int __dcc_ll_cfg(struct dcc_drvdata *drvdata, int curr_list)
+{
+	int ret = 0;
+	u32 total_len, pos;
+	struct dcc_config_entry *entry;
+	struct dcc_cfg_attr cfg;
+	struct dcc_cfg_loop_attr cfg_loop;
+
+	cfg.sram_offset = drvdata->ram_cfg * 4;
+	cfg.prev_off = 0;
+	cfg_loop.loop_off = 0;
+	total_len = 0;
+	cfg_loop.loop_len = 0;
+	cfg_loop.loop_cnt = 0;
+	cfg_loop.loop_start = false;
+	cfg.prev_addr = 0;
+	cfg.addr = 0;
+	cfg.link = 0;
+
+	list_for_each_entry(entry, &drvdata->cfg_head[curr_list], list) {
+		switch (entry->desc_type) {
+		case DCC_READ_WRITE_TYPE:
+		{
+			ret = _dcc_ll_cfg_read_write(drvdata, entry, &cfg);
+			if (ret)
+				goto overstep;
+			break;
+		}
+
+		case DCC_LOOP_TYPE:
+		{
+
+			ret = _dcc_ll_cfg_loop(drvdata, entry, &cfg, &cfg_loop, &total_len);
+
+			if (ret)
+				goto overstep;
+			break;
+		}
+
+		case DCC_WRITE_TYPE:
+		{
+			ret = _dcc_ll_cfg_write(drvdata, entry, &cfg, &total_len);
+
+			if (ret)
+				goto overstep;
+			break;
+		}
+
+		default:
+		{
+			ret = _dcc_ll_cfg_default(drvdata, entry, &cfg, &pos, &total_len);
+
+
+			if (ret)
+				goto overstep;
+			break;
+		}
+		}
+	}
+
+	if (cfg.link) {
+		ret = dcc_sram_writel(drvdata, cfg.link, cfg.sram_offset);
+		if (ret)
+			goto overstep;
+		cfg.sram_offset += 4;
+	}
+
+	if (cfg_loop.loop_start) {
+		dev_err(drvdata->dev, "DCC: Programming error: Loop unterminated\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	/* Handling special case of list ending with a rd_mod_wr */
+	if (cfg.addr == DCC_RD_MOD_WR_DESCRIPTOR) {
+		cfg.addr = (DCC_RD_MOD_WR_ADDR) & BM(0, 27);
+		cfg.addr |= DCC_ADDR_DESCRIPTOR;
+
+		ret = dcc_sram_writel(drvdata, cfg.addr, cfg.sram_offset);
+		if (ret)
+			goto overstep;
+		cfg.sram_offset += 4;
+	}
+
+	/* Setting zero to indicate end of the list */
+	cfg.link = DCC_LINK_DESCRIPTOR;
+	ret = dcc_sram_writel(drvdata, cfg.link, cfg.sram_offset);
+	if (ret)
+		goto overstep;
+	cfg.sram_offset += 4;
+
+	/* Update ram_cfg and check if the data will overstep */
+
+	drvdata->ram_cfg = (cfg.sram_offset + total_len) / 4;
+
+	if (cfg.sram_offset + total_len > drvdata->ram_size) {
+		cfg.sram_offset += total_len;
+		goto overstep;
+	}
+
+	drvdata->ram_start = cfg.sram_offset/4;
+	return 0;
+overstep:
+	ret = -EINVAL;
+	memset_io(drvdata->ram_base, 0, drvdata->ram_size);
+	dev_err(drvdata->dev, "DCC SRAM oversteps, 0x%x (0x%x)\n",
+	cfg.sram_offset, drvdata->ram_size);
+
+err:
+	return ret;
+}
+
+static int dcc_valid_list(struct dcc_drvdata *drvdata, int curr_list)
+{
+	u32 lock_reg;
+
+	if (list_empty(&drvdata->cfg_head[curr_list]))
+		return -EINVAL;
+
+	if (drvdata->enable[curr_list]) {
+		dev_err(drvdata->dev, "List %d is already enabled\n",
+				curr_list);
+		return -EINVAL;
+	}
+
+	lock_reg = dcc_readl(drvdata, DCC_LL_LOCK(curr_list));
+	if (lock_reg & 0x1) {
+		dev_err(drvdata->dev, "List %d is already locked\n",
+				curr_list);
+		return -EINVAL;
+	}
+
+	dev_err(drvdata->dev, "DCC list passed %d\n", curr_list);
+	return 0;
+}
+
+static bool is_dcc_enabled(struct dcc_drvdata *drvdata)
+{
+	bool dcc_enable = false;
+	int list;
+
+	for (list = 0; list < DCC_MAX_LINK_LIST; list++) {
+		if (drvdata->enable[list]) {
+			dcc_enable = true;
+			break;
+		}
+	}
+
+	return dcc_enable;
+}
+
+static int dcc_enable(struct dcc_drvdata *drvdata)
+{
+	int ret = 0;
+	int list;
+	u32 ram_cfg_base;
+
+	mutex_lock(&drvdata->mutex);
+
+	if (!is_dcc_enabled(drvdata)) {
+		memset_io(drvdata->ram_base,
+			0xDE, drvdata->ram_size);
+	}
+
+	for (list = 0; list < drvdata->nr_link_list; list++) {
+
+		if (dcc_valid_list(drvdata, list))
+			continue;
+
+		/* 1. Take ownership of the list */
+		dcc_writel(drvdata, BIT(0), DCC_LL_LOCK(list));
+
+		/* 2. Program linked-list in the SRAM */
+		ram_cfg_base = drvdata->ram_cfg;
+		ret = __dcc_ll_cfg(drvdata, list);
+		if (ret) {
+			dcc_writel(drvdata, 0, DCC_LL_LOCK(list));
+			dev_info(drvdata->dev, "DCC ram programming failed\n");
+			goto err;
+		}
+
+		/* 3. program DCC_RAM_CFG reg */
+		dcc_writel(drvdata, ram_cfg_base +
+			drvdata->ram_offset/4, DCC_LL_BASE(list));
+		dcc_writel(drvdata, drvdata->ram_start +
+			drvdata->ram_offset/4, DCC_FD_BASE(list));
+		dcc_writel(drvdata, 0xFFF, DCC_LL_TIMEOUT(list));
+
+		/* 4. Clears interrupt status register */
+		dcc_writel(drvdata, 0, DCC_LL_INT_ENABLE(list));
+		dcc_writel(drvdata, (BIT(0) | BIT(1) | BIT(2)),
+					DCC_LL_INT_STATUS(list));
+
+		dev_info(drvdata->dev, "All values written to enable.\n");
+		/* Make sure all config is written in sram */
+		mb();
+
+		drvdata->enable[list] = true;
+
+		/* 5. Configure trigger */
+		dcc_writel(drvdata, BIT(9), DCC_LL_CFG(list));
+	}
+
+err:
+	mutex_unlock(&drvdata->mutex);
+	return ret;
+}
+
+static int dcc_config_add(struct dcc_drvdata *drvdata, unsigned int addr,
+				unsigned int len, int apb_bus)
+{
+	int ret;
+	struct dcc_config_entry *entry, *pentry;
+	unsigned int base, offset;
+
+	mutex_lock(&drvdata->mutex);
+
+	if (drvdata->curr_list >= drvdata->nr_link_list) {
+		dev_err(drvdata->dev, "Select link list to program using curr_list\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (!len || len > (drvdata->ram_size / 8)) {
+		dev_err(drvdata->dev, "DCC: Invalid length\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	base = addr & BM(4, 31);
+
+	if (!list_empty(&drvdata->cfg_head[drvdata->curr_list])) {
+		pentry = list_last_entry(&drvdata->cfg_head[drvdata->curr_list],
+			struct dcc_config_entry, list);
+
+		if (pentry->desc_type == DCC_ADDR_TYPE &&
+				addr >= (pentry->base + pentry->offset) &&
+				addr <= (pentry->base +
+					pentry->offset + MAX_DCC_OFFSET)) {
+
+			/* Re-use base address from last entry */
+			base = pentry->base;
+
+			if ((pentry->len * 4 + pentry->base + pentry->offset)
+					== addr) {
+				len += pentry->len;
+
+				if (len > MAX_DCC_LEN)
+					pentry->len = MAX_DCC_LEN;
+				else
+					pentry->len = len;
+
+				addr = pentry->base + pentry->offset +
+					pentry->len * 4;
+				len -= pentry->len;
+			}
+		}
+	}
+
+	offset = addr - base;
+
+	while (len) {
+		entry = devm_kzalloc(drvdata->dev, sizeof(*entry), GFP_KERNEL);
+		if (!entry) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		entry->base = base;
+		entry->offset = offset;
+		entry->len = min_t(u32, len, MAX_DCC_LEN);
+		entry->index = drvdata->nr_config[drvdata->curr_list]++;
+		entry->desc_type = DCC_ADDR_TYPE;
+		entry->apb_bus = apb_bus;
+		INIT_LIST_HEAD(&entry->list);
+		list_add_tail(&entry->list,
+			&drvdata->cfg_head[drvdata->curr_list]);
+
+		len -= entry->len;
+		offset += MAX_DCC_LEN * 4;
+	}
+
+	mutex_unlock(&drvdata->mutex);
+	return 0;
+err:
+	mutex_unlock(&drvdata->mutex);
+	return ret;
+}
+
+static void dcc_config_reset(struct dcc_drvdata *drvdata)
+{
+	struct dcc_config_entry *entry, *temp;
+	int curr_list;
+
+	mutex_lock(&drvdata->mutex);
+
+	for (curr_list = 0; curr_list < drvdata->nr_link_list; curr_list++) {
+
+		list_for_each_entry_safe(entry, temp,
+			&drvdata->cfg_head[curr_list], list) {
+			list_del(&entry->list);
+			devm_kfree(drvdata->dev, entry);
+			drvdata->nr_config[curr_list]--;
+		}
+	}
+	drvdata->ram_start = 0;
+	drvdata->ram_cfg = 0;
+	mutex_unlock(&drvdata->mutex);
+}
+
+static int dcc_add_loop(struct dcc_drvdata *drvdata, unsigned long loop_cnt)
+{
+	struct dcc_config_entry *entry;
+
+	entry = devm_kzalloc(drvdata->dev, sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->loop_cnt = min_t(u32, loop_cnt, MAX_LOOP_CNT);
+	entry->index = drvdata->nr_config[drvdata->curr_list]++;
+	entry->desc_type = DCC_LOOP_TYPE;
+	INIT_LIST_HEAD(&entry->list);
+	list_add_tail(&entry->list, &drvdata->cfg_head[drvdata->curr_list]);
+
+	return 0;
+}
+
+static int dcc_rd_mod_wr_add(struct dcc_drvdata *drvdata, unsigned int mask,
+				unsigned int val)
+{
+	int ret = 0;
+	struct dcc_config_entry *entry;
+
+	mutex_lock(&drvdata->mutex);
+
+	if (drvdata->curr_list >= drvdata->nr_link_list) {
+		dev_err(drvdata->dev, "Select link list to program using curr_list\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (list_empty(&drvdata->cfg_head[drvdata->curr_list])) {
+		dev_err(drvdata->dev, "DCC: No read address programmed\n");
+		ret = -EPERM;
+		goto err;
+	}
+
+	entry = devm_kzalloc(drvdata->dev, sizeof(*entry), GFP_KERNEL);
+	if (!entry) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	entry->desc_type = DCC_READ_WRITE_TYPE;
+	entry->mask = mask;
+	entry->write_val = val;
+	entry->index = drvdata->nr_config[drvdata->curr_list]++;
+	INIT_LIST_HEAD(&entry->list);
+	list_add_tail(&entry->list, &drvdata->cfg_head[drvdata->curr_list]);
+err:
+	mutex_unlock(&drvdata->mutex);
+	return ret;
+}
+
+static int dcc_add_write(struct dcc_drvdata *drvdata, unsigned int addr,
+				unsigned int write_val, int apb_bus)
+{
+	struct dcc_config_entry *entry;
+
+	entry = devm_kzalloc(drvdata->dev, sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->desc_type = DCC_WRITE_TYPE;
+	entry->base = addr & BM(4, 31);
+	entry->offset = addr - entry->base;
+	entry->write_val = write_val;
+	entry->index = drvdata->nr_config[drvdata->curr_list]++;
+	entry->len = 1;
+	entry->apb_bus = apb_bus;
+	INIT_LIST_HEAD(&entry->list);
+	list_add_tail(&entry->list, &drvdata->cfg_head[drvdata->curr_list]);
+
+	return 0;
+}
+
+static int dcc_sram_open(struct inode *inode, struct file *file)
+{
+	struct dcc_drvdata *drvdata = container_of(inode->i_cdev,
+		struct dcc_drvdata,
+		sram_dev);
+	file->private_data = drvdata;
+
+	return	0;
+}
+
+static ssize_t dcc_sram_read(struct file *file, char __user *data,
+						size_t len, loff_t *ppos)
+{
+	unsigned char *buf;
+	struct dcc_drvdata *drvdata = file->private_data;
+
+	/* EOF check */
+	if (drvdata->ram_size <= *ppos)
+		return 0;
+
+	if ((*ppos + len) > drvdata->ram_size)
+		len = (drvdata->ram_size - *ppos);
+
+	buf = kzalloc(len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	memcpy_fromio(buf, (drvdata->ram_base + *ppos), len);
+
+	if (copy_to_user(data, buf, len)) {
+		dev_err(drvdata->dev, "DCC: Couldn't copy all data to user\n");
+		kfree(buf);
+		return -EFAULT;
+	}
+
+	*ppos += len;
+
+	kfree(buf);
+
+	return len;
+}
+
+static const struct file_operations dcc_sram_fops = {
+	.owner		= THIS_MODULE,
+	.open		= dcc_sram_open,
+	.read		= dcc_sram_read,
+	.llseek		= no_llseek,
+};
+
+static int dcc_sram_dev_register(struct dcc_drvdata *drvdata)
+{
+	int ret;
+	struct device *device;
+	dev_t dev;
+
+	ret = alloc_chrdev_region(&dev, 0, 1, drvdata->sram_node);
+	if (ret)
+		goto err_alloc;
+
+	cdev_init(&drvdata->sram_dev, &dcc_sram_fops);
+
+	drvdata->sram_dev.owner = THIS_MODULE;
+	ret = cdev_add(&drvdata->sram_dev, dev, 1);
+	if (ret)
+		goto err_cdev_add;
+
+	drvdata->sram_class = class_create(THIS_MODULE, drvdata->sram_node);
+	if (IS_ERR(drvdata->sram_class)) {
+		ret = PTR_ERR(drvdata->sram_class);
+		goto err_class_create;
+	}
+
+	device = device_create(drvdata->sram_class, NULL,
+						drvdata->sram_dev.dev, drvdata,
+						drvdata->sram_node);
+	if (IS_ERR(device)) {
+		ret = PTR_ERR(device);
+		goto err_dev_create;
+	}
+
+	return 0;
+err_dev_create:
+	class_destroy(drvdata->sram_class);
+err_class_create:
+	cdev_del(&drvdata->sram_dev);
+err_cdev_add:
+	unregister_chrdev_region(drvdata->sram_dev.dev, 1);
+err_alloc:
+	return ret;
+}
+
+static void dcc_sram_dev_deregister(struct dcc_drvdata *drvdata)
+{
+	device_destroy(drvdata->sram_class, drvdata->sram_dev.dev);
+	class_destroy(drvdata->sram_class);
+	cdev_del(&drvdata->sram_dev);
+	unregister_chrdev_region(drvdata->sram_dev.dev, 1);
+}
+
+static int dcc_sram_dev_init(struct dcc_drvdata *drvdata)
+{
+	int ret = 0;
+	size_t node_size;
+	char *node_name = "dcc_sram";
+	struct device *dev = drvdata->dev;
+
+	node_size = strlen(node_name) + 1;
+
+	drvdata->sram_node = devm_kzalloc(dev, node_size, GFP_KERNEL);
+	if (!drvdata->sram_node)
+		return -ENOMEM;
+
+	strlcpy(drvdata->sram_node, node_name, node_size);
+	ret = dcc_sram_dev_register(drvdata);
+	if (ret)
+		dev_err(drvdata->dev, "DCC: sram node not registered.\n");
+
+	return ret;
+}
+
+static void dcc_sram_dev_exit(struct dcc_drvdata *drvdata)
+{
+	dcc_sram_dev_deregister(drvdata);
+}
+
+static int dcc_probe(struct platform_device *pdev)
+{
+	int ret = 0, i;
+	struct device *dev = &pdev->dev;
+	struct dcc_drvdata *drvdata;
+	struct resource *res;
+	const struct qcom_dcc_config *cfg;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &pdev->dev;
+	platform_set_drvdata(pdev, drvdata);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dcc-base");
+	if (!res)
+		return -EINVAL;
+
+	drvdata->reg_size = resource_size(res);
+	drvdata->base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!drvdata->base)
+		return -ENOMEM;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+							"dcc-ram-base");
+	if (!res)
+		return -EINVAL;
+
+	drvdata->ram_size = resource_size(res);
+	drvdata->ram_base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!drvdata->ram_base)
+		return -ENOMEM;
+	cfg = of_device_get_match_data(&pdev->dev);
+	drvdata->ram_offset = cfg->dcc_ram_offset;
+
+	if (BVAL(dcc_readl(drvdata, DCC_HW_INFO), DCC_VER_INFO_BIT)) {
+		drvdata->mem_map_ver = DCC_MEM_MAP_VER3;
+		drvdata->nr_link_list = dcc_readl(drvdata, DCC_LL_NUM_INFO);
+		if (drvdata->nr_link_list == 0)
+			return	-EINVAL;
+	} else if ((dcc_readl(drvdata, DCC_HW_INFO) & DCC_VER_MASK2) == DCC_VER_MASK2) {
+		drvdata->mem_map_ver = DCC_MEM_MAP_VER2;
+		drvdata->nr_link_list = dcc_readl(drvdata, DCC_LL_NUM_INFO);
+		if (drvdata->nr_link_list == 0)
+			return	-EINVAL;
+	} else {
+		drvdata->mem_map_ver = DCC_MEM_MAP_VER1;
+		drvdata->nr_link_list = DCC_MAX_LINK_LIST;
+	}
+
+	if ((dcc_readl(drvdata, DCC_HW_INFO) & BIT(6)) == BIT(6))
+		drvdata->loopoff = DCC_FIX_LOOP_OFFSET;
+	else
+		drvdata->loopoff = get_bitmask_order((drvdata->ram_size +
+				drvdata->ram_offset) / 4 - 1);
+	mutex_init(&drvdata->mutex);
+
+	drvdata->enable = devm_kzalloc(dev, drvdata->nr_link_list *
+			sizeof(bool), GFP_KERNEL);
+	if (!drvdata->enable)
+		return -ENOMEM;
+	drvdata->configured = devm_kzalloc(dev, drvdata->nr_link_list *
+			sizeof(bool), GFP_KERNEL);
+	if (!drvdata->configured)
+		return -ENOMEM;
+	drvdata->nr_config = devm_kzalloc(dev, drvdata->nr_link_list *
+			sizeof(u32), GFP_KERNEL);
+	if (!drvdata->nr_config)
+		return -ENOMEM;
+	drvdata->cfg_head = devm_kzalloc(dev, drvdata->nr_link_list *
+			sizeof(struct list_head), GFP_KERNEL);
+	if (!drvdata->cfg_head)
+		return -ENOMEM;
+
+	for (i = 0; i < drvdata->nr_link_list; i++) {
+		INIT_LIST_HEAD(&drvdata->cfg_head[i]);
+		drvdata->nr_config[i] = 0;
+	}
+
+	memset_io(drvdata->ram_base, 0, drvdata->ram_size);
+
+	drvdata->curr_list = DCC_INVALID_LINK_LIST;
+
+	ret = dcc_sram_dev_init(drvdata);
+	if (ret)
+		goto err;
+
+	return ret;
+err:
+	return ret;
+}
+
+static int dcc_remove(struct platform_device *pdev)
+{
+	struct dcc_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	dcc_sram_dev_exit(drvdata);
+
+	dcc_config_reset(drvdata);
+
+	return 0;
+}
+
+static const struct of_device_id dcc_match_table[] = {
+	{ .compatible = "qcom,sm8150-dcc", .data = &sm8150_cfg },
+};
+
+static struct platform_driver dcc_driver = {
+	.probe					= dcc_probe,
+	.remove					= dcc_remove,
+	.driver					= {
+		.name		= "msm-dcc",
+		.of_match_table	= dcc_match_table,
+	},
+};
+
+module_platform_driver(dcc_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Qualcomm Technologies Inc. DCC driver");
+
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

