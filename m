Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F23531E6AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 08:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhBRHEg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 02:04:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:35510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230505AbhBRG76 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 01:59:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B752660238;
        Thu, 18 Feb 2021 06:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613631556;
        bh=ULroDYjopHH3X1qFlwku0gkTGwFkf/bvd2t3OW5RdiA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W5/bbDrqSvIrLK4rvzC4FDzd0vK9te10nBEiJdnGrbMOK9tA7C09fS95nLEEBAWpL
         M9eHMT2/xxAKjwHWP3azrp07g9b4oLldy6CIH7LOxuOHSiqo/wmYhJ+IVRpqqLnncl
         v+rhfLjDtYRTT4ZWN5YZL/zGt2DKG40iPTC8luccj6tcBYYRPG2a8aZZj2dE+pz5NQ
         c2N7W5pUIUxFsNqeMcFhprg/7svwjA4jUJKkYOYv7g4CAOm6ekvFZa9OxR3qSNK8CX
         TfCGo1wdncw5qHuZpfB1+nmdSV7lDjyEzAnq/RnSpagpW+HILHReXTK1VcxvVQtcGd
         4tibseg5ZQFsw==
Date:   Thu, 18 Feb 2021 12:29:12 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 3/6] soc: qcom: dcc:Add driver support for Data
 Capture and Compare unit(DCC)
Message-ID: <20210218065912.GV2774@vkoul-mobl.Dlink>
References: <cover.1613541226.git.schowdhu@codeaurora.org>
 <f182b10f318db7cb09216c0176a5b26656d9ef49.1613541226.git.schowdhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f182b10f318db7cb09216c0176a5b26656d9ef49.1613541226.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-02-21, 12:18, Souradeep Chowdhury wrote:
> The DCC is a DMA Engine designed to capture and store data
> during system crash or software triggers.The DCC operates
                                        ^^^
Space after . (quite a few here, pls fix them)

> based on link list entries which provides it with data and
> addresses and the function it needs to perform.These functions
> are read,write and loop.Added the basic driver in this patch
> which contains a probe method which instantiates all the link
> list data specific to a SoC.Methods have also been added to
> handle all the functionalities specific to a linked list.Each
> DCC has it's own SRAM which needs to be instantiated at probe
> time as well.

So help me understand, in case of system crash how will this be used..?

> 
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig  |    8 +
>  drivers/soc/qcom/Makefile |    1 +
>  drivers/soc/qcom/dcc.c    | 1055 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1064 insertions(+)
>  create mode 100644 drivers/soc/qcom/dcc.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 79b568f..8819e0b 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -69,6 +69,14 @@ config QCOM_LLCC
>  	  SDM845. This provides interfaces to clients that use the LLCC.
>  	  Say yes here to enable LLCC slice driver.
>  
> +config QCOM_DCC
> +	tristate "Qualcomm Technologies, Inc. Data Capture and Compare engine driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	help
> +	  This option enables driver for Data Capture and Compare engine. DCC
> +	  driver provides interface to configure DCC block and read back
> +	  captured data from DCC's internal SRAM.
> +
>  config QCOM_KRYO_L2_ACCESSORS
>  	bool
>  	depends on ARCH_QCOM && ARM64 || COMPILE_TEST
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index ad675a6..1b00870 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -26,3 +26,4 @@ obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>  obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
>  obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
>  obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
> +obj-$(CONFIG_QCOM_DCC) += dcc.o
> diff --git a/drivers/soc/qcom/dcc.c b/drivers/soc/qcom/dcc.c
> new file mode 100644
> index 0000000..d67452b
> --- /dev/null
> +++ b/drivers/soc/qcom/dcc.c
> @@ -0,0 +1,1055 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/cdev.h>
> +#include <linux/delay.h>
> +#include <linux/fs.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +
> +#define TIMEOUT_US		100
> +
> +#define BM(lsb, msb)		((BIT(msb) - BIT(lsb)) + BIT(msb))
> +#define BMVAL(val, lsb, msb)	((val & BM(lsb, msb)) >> lsb)
> +#define BVAL(val, n)		((val & BIT(n)) >> n)

Pls use macros available in bitfield.h rather than inventing your own..

> +
> +#define dcc_writel(drvdata, val, off)					\
> +	writel((val), drvdata->base + dcc_offset_conv(drvdata, off))
> +#define dcc_readl(drvdata, off)						\
> +	readl(drvdata->base + dcc_offset_conv(drvdata, off))
> +
> +#define dcc_sram_readl(drvdata, off)					\
> +	readl(drvdata->ram_base + off)
> +
> +/* DCC registers */
> +#define DCC_HW_INFO					0x04
> +#define DCC_LL_NUM_INFO					0x10
> +#define DCC_STATUS					0x1C
> +#define DCC_LL_LOCK(m)					(0x34 + 0x80 * m)
> +#define DCC_LL_CFG(m)					(0x38 + 0x80 * m)
> +#define DCC_LL_BASE(m)					(0x3c + 0x80 * m)
> +#define DCC_FD_BASE(m)					(0x40 + 0x80 * m)
> +#define DCC_LL_TIMEOUT(m)				(0x44 + 0x80 * m)
> +#define DCC_LL_INT_ENABLE(m)				(0x4C + 0x80 * m)
> +#define DCC_LL_INT_STATUS(m)				(0x50 + 0x80 * m)
> +#define DCC_LL_SW_TRIGGER(m)				(0x60 + 0x80 * m)
> +#define DCC_LL_BUS_ACCESS_STATUS(m)			(0x64 + 0x80 * m)
> +
> +#define DCC_MAP_LEVEL1			0x18
> +#define DCC_MAP_LEVEL2			0x34
> +#define DCC_MAP_LEVEL3			0x4C
> +
> +#define DCC_MAP_OFFSET1			0x10
> +#define DCC_MAP_OFFSET2			0x18
> +#define DCC_MAP_OFFSET3			0x1C
> +#define DCC_MAP_OFFSET4			0x8
> +
> +#define DCC_FIX_LOOP_OFFSET		16
> +#define DCC_VER_INFO_BIT		9
> +
> +#define DCC_READ        0
> +#define DCC_WRITE       1
> +#define DCC_LOOP        2
> +#define DCC_READ_WRITE  3
> +
> +#define MAX_DCC_OFFSET				(0xFF * 4)
> +#define MAX_DCC_LEN				0x7F
> +#define MAX_LOOP_CNT				0xFF
> +
> +#define DCC_ADDR_DESCRIPTOR			0x00
> +#define DCC_LOOP_DESCRIPTOR			(BIT(30))
> +#define DCC_RD_MOD_WR_DESCRIPTOR		(BIT(31))
> +#define DCC_LINK_DESCRIPTOR			(BIT(31) | BIT(30))

we have GENMASK() for this

> +
> +#define DCC_READ_IND				0x00
> +#define DCC_WRITE_IND				(BIT(28))
> +
> +#define DCC_AHB_IND				0x00
> +#define DCC_APB_IND				BIT(29)
> +
> +#define DCC_MAX_LINK_LIST			8
> +#define DCC_INVALID_LINK_LIST			0xFF
> +
> +#define DCC_VER_MASK1				0x7F
> +#define DCC_VER_MASK2				0x3F

Genmask for these too...

> +
> +#define DCC_RD_MOD_WR_ADDR                      0xC105E
> +
> +struct qcom_dcc_config {
> +	const int dcc_ram_offset;
> +};
> +
> +static const struct qcom_dcc_config sm8150_cfg = {
> +	.dcc_ram_offset				= 0x5000,
> +};

maybe move it down near compatible table?

> +
> +enum dcc_descriptor_type {
> +	DCC_ADDR_TYPE,
> +	DCC_LOOP_TYPE,
> +	DCC_READ_WRITE_TYPE,
> +	DCC_WRITE_TYPE
> +};
> +
> +enum dcc_mem_map_ver {
> +	DCC_MEM_MAP_VER1,
> +	DCC_MEM_MAP_VER2,
> +	DCC_MEM_MAP_VER3
> +};
> +
> +struct dcc_config_entry {
> +	u32				base;
> +	u32				offset;
> +	u32				len;
> +	u32				index;
> +	u32				loop_cnt;
> +	u32				write_val;
> +	u32				mask;
> +	bool				apb_bus;
> +	enum dcc_descriptor_type	desc_type;
> +	struct list_head		list;
> +};
> +
> +struct dcc_drvdata {
> +	void __iomem		*base;
> +	u32			reg_size;
> +	struct device		*dev;
> +	struct mutex		mutex;
> +	void __iomem		*ram_base;
> +	u32			ram_size;
> +	u32			ram_offset;
> +	enum dcc_mem_map_ver	mem_map_ver;
> +	u32			ram_cfg;
> +	u32			ram_start;
> +	bool			*enable;
> +	bool			*configured;
> +	bool			interrupt_disable;
> +	char			*sram_node;
> +	struct cdev		sram_dev;
> +	struct class		*sram_class;
> +	struct list_head	*cfg_head;
> +	u32			*nr_config;
> +	u32			nr_link_list;
> +	u8			curr_list;
> +	u8			loopoff;
> +};
> +
> +struct dcc_cfg_attr {
> +	u32	addr;
> +	u32	prev_addr;
> +	u32	prev_off;
> +	u32	link;
> +	u32	sram_offset;
> +};
> +
> +struct dcc_cfg_loop_attr {
> +	u32	loop;
> +	bool	loop_start;
> +	u32	loop_cnt;
> +	u32	loop_len;
> +	u32	loop_off;
> +};
> +
> +static u32 dcc_offset_conv(struct dcc_drvdata *drvdata, u32 off)
> +{
> +	if (drvdata->mem_map_ver == DCC_MEM_MAP_VER1) {
> +		if ((off & DCC_VER_MASK1) >= DCC_MAP_LEVEL3)
> +			return (off - DCC_MAP_OFFSET3);
> +		if ((off & DCC_VER_MASK1) >= DCC_MAP_LEVEL2)
> +			return (off - DCC_MAP_OFFSET2);
> +		else if ((off & DCC_VER_MASK1) >= DCC_MAP_LEVEL1)
> +			return (off - DCC_MAP_OFFSET1);
> +	} else if (drvdata->mem_map_ver == DCC_MEM_MAP_VER2) {
> +		if ((off & DCC_VER_MASK1) >= DCC_MAP_LEVEL2)
> +			return (off - DCC_MAP_OFFSET4);
> +	}
> +	return off;
> +}
> +
> +static int dcc_sram_writel(struct dcc_drvdata *drvdata,
> +					u32 val, u32 off)
> +{
> +	if (unlikely(off > (drvdata->ram_size - 4)))
> +		return -EINVAL;
> +
> +	writel((val), drvdata->ram_base + off);
> +
> +	return 0;
> +}
> +
> +static int _dcc_ll_cfg_read_write(struct dcc_drvdata *drvdata,
> +struct dcc_config_entry *entry, struct dcc_cfg_attr *cfg)

this looks a bit hard to read, can you make it better (also you can go
upto 100 chars now), do you checkpatch with --strict option to get
better alignment of code


> +{
> +	int ret = 0;

Superfluous init?

> +
> +	if (cfg->link) {
> +		/* write new offset = 1 to continue
> +		 * processing the list

kernel uses:
        /*
         * this is a 
         * multi line comment style
         */

> +		 */
> +
> +		ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
> +		if (ret)
> +			return ret;
> +		cfg->sram_offset += 4;
> +		/* Reset link and prev_off */
> +		cfg->addr = 0x00;
> +		cfg->link = 0;
> +		cfg->prev_off = 0;

memset cfg first?

> +		cfg->prev_addr = cfg->addr;
> +	}
> +
> +	cfg->addr = DCC_RD_MOD_WR_DESCRIPTOR;
> +
> +	ret = dcc_sram_writel(drvdata, cfg->addr, cfg->sram_offset);
> +

drop this empty line

> +	if (ret)
> +		return ret;
> +
> +	cfg->sram_offset += 4;
> +
> +	ret = dcc_sram_writel(drvdata, entry->mask, cfg->sram_offset);
> +
> +	if (ret)
> +		return ret;
> +
> +	cfg->sram_offset += 4;
> +
> +	ret = dcc_sram_writel(drvdata, entry->write_val, cfg->sram_offset);
> +
> +	if (ret)
> +		return ret;
> +
> +	cfg->sram_offset += 4;
> +
> +	cfg->addr = 0;
> +
> +	return ret;
> +}
> +
> +static int _dcc_ll_cfg_loop(struct dcc_drvdata *drvdata, struct dcc_config_entry *entry,
> +struct dcc_cfg_attr *cfg, struct dcc_cfg_loop_attr *cfg_loop, u32 *total_len)

here as well

> +{
> +
> +	int ret = 0;
> +
> +	/* Check if we need to write link of prev entry */
> +	if (cfg->link) {
> +		ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
> +		if (ret)
> +			return ret;
> +		cfg->sram_offset += 4;
> +	}
> +
> +	if (cfg_loop->loop_start) {
> +		cfg_loop->loop = (cfg->sram_offset - cfg_loop->loop_off) / 4;
> +		cfg_loop->loop |= (cfg_loop->loop_cnt << drvdata->loopoff) &
> +		BM(drvdata->loopoff, 27);
> +		cfg_loop->loop |= DCC_LOOP_DESCRIPTOR;
> +		*total_len += (*total_len - cfg_loop->loop_len) * cfg_loop->loop_cnt;
> +
> +		ret = dcc_sram_writel(drvdata, cfg_loop->loop, cfg->sram_offset);
> +
> +		if (ret)
> +			return ret;
> +		cfg->sram_offset += 4;
> +
> +		cfg_loop->loop_start = false;
> +		cfg_loop->loop_len = 0;
> +		cfg_loop->loop_off = 0;

seems quite similar to last one..? Maybe a helper for common code

> +	} else {
> +		cfg_loop->loop_start = true;
> +		cfg_loop->loop_cnt = entry->loop_cnt - 1;
> +		cfg_loop->loop_len = *total_len;
> +		cfg_loop->loop_off = cfg->sram_offset;
> +	}
> +
> +	/* Reset link and prev_off */
> +
> +	cfg->addr = 0x00;
> +	cfg->link = 0;
> +	cfg->prev_off = 0;
> +	cfg->prev_addr = cfg->addr;
> +
> +	return ret;
> +}
> +
> +static int _dcc_ll_cfg_write(struct dcc_drvdata *drvdata,
> +struct dcc_config_entry *entry, struct dcc_cfg_attr *cfg, u32 *total_len)
> +{
> +	u32 off;
> +	int ret = 0;
> +
> +	if (cfg->link) {
> +		/* write new offset = 1 to continue
> +		 * processing the list
> +		 */
> +		ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
> +
> +		if (ret)
> +			return ret;
> +
> +		cfg->sram_offset += 4;
> +		/* Reset link and prev_off */
> +		cfg->addr = 0x00;
> +		cfg->prev_off = 0;
> +		cfg->prev_addr = cfg->addr;
> +	}
> +
> +	off = entry->offset/4;
> +	/* write new offset-length pair to correct position */
> +	cfg->link |= ((off & BM(0, 7)) | BIT(15) | ((entry->len << 8) & BM(8, 14)));
> +	cfg->link |= DCC_LINK_DESCRIPTOR;
> +
> +	/* Address type */
> +	cfg->addr = (entry->base >> 4) & BM(0, 27);
> +	if (entry->apb_bus)
> +		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_WRITE_IND | DCC_APB_IND;
> +	else
> +		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_WRITE_IND | DCC_AHB_IND;
> +	ret = dcc_sram_writel(drvdata, cfg->addr, cfg->sram_offset);
> +
> +	if (ret)
> +		return ret;
> +	cfg->sram_offset += 4;
> +
> +	ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
> +	if (ret)
> +		return ret;
> +	cfg->sram_offset += 4;
> +
> +	ret = dcc_sram_writel(drvdata, entry->write_val, cfg->sram_offset);
> +
> +	if (ret)
> +		return ret;
> +
> +	cfg->sram_offset += 4;
> +	cfg->addr = 0x00;
> +	cfg->link = 0;
> +	return ret;
> +}
> +
> +static int _dcc_ll_cfg_default(struct dcc_drvdata *drvdata,
> +struct dcc_config_entry *entry, struct dcc_cfg_attr *cfg, u32 *pos, u32 *total_len)
> +{
> +	int ret = 0;
> +	u32 off;
> +
> +	cfg->addr = (entry->base >> 4) & BM(0, 27);
> +
> +	if (entry->apb_bus)
> +		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_READ_IND | DCC_APB_IND;
> +	else
> +		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_READ_IND | DCC_AHB_IND;
> +
> +	off = entry->offset/4;
> +
> +	*total_len += entry->len * 4;
> +
> +	if (!cfg->prev_addr || cfg->prev_addr != cfg->addr || cfg->prev_off > off) {
> +		/* Check if we need to write prev link entry */
> +		if (cfg->link) {
> +			ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
> +			if (ret)
> +				return ret;
> +				cfg->sram_offset += 4;
> +		}
> +		dev_dbg(drvdata->dev, "DCC: sram address 0x%x\n", cfg->sram_offset);
> +
> +		/* Write address */
> +		ret = dcc_sram_writel(drvdata, cfg->addr, cfg->sram_offset);
> +
> +		if (ret)
> +			return ret;
> +
> +		cfg->sram_offset += 4;
> +
> +		/* Reset link and prev_off */
> +		cfg->link = 0;
> +		cfg->prev_off = 0;
> +	}
> +
> +	if ((off - cfg->prev_off) > 0xFF || entry->len > MAX_DCC_LEN) {
> +		dev_err(drvdata->dev, "DCC: Programming error Base: 0x%x, offset 0x%x\n",
> +		entry->base, entry->offset);
> +		ret = -EINVAL;
> +		return ret;
> +	}
> +
> +	if (cfg->link) {
> +		/*
> +		 * link already has one offset-length so new
> +		 * offset-length needs to be placed at
> +		 * bits [29:15]
> +		 */
> +		*pos = 15;
> +
> +		/* Clear bits [31:16] */
> +		cfg->link &= BM(0, 14);
> +	} else {
> +		/*
> +		 * link is empty, so new offset-length needs
> +		 * to be placed at bits [15:0]
> +		 */
> +		*pos = 0;
> +		cfg->link = 1 << 15;
> +	}
> +
> +	/* write new offset-length pair to correct position */
> +	cfg->link |= (((off-cfg->prev_off) & BM(0, 7)) | ((entry->len << 8) & BM(8, 14))) << *pos;
> +
> +	cfg->link |= DCC_LINK_DESCRIPTOR;
> +
> +	if (*pos) {
> +		ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
> +		if (ret)
> +			return ret;
> +		cfg->sram_offset += 4;
> +		cfg->link = 0;
> +	}
> +
> +	cfg->prev_off  = off + entry->len - 1;
> +	cfg->prev_addr = cfg->addr;
> +	return ret;
> +}
> +
> +static int __dcc_ll_cfg(struct dcc_drvdata *drvdata, int curr_list)
> +{
> +	int ret = 0;
> +	u32 total_len, pos;
> +	struct dcc_config_entry *entry;
> +	struct dcc_cfg_attr cfg;
> +	struct dcc_cfg_loop_attr cfg_loop;
> +
> +	cfg.sram_offset = drvdata->ram_cfg * 4;
> +	cfg.prev_off = 0;
> +	cfg_loop.loop_off = 0;
> +	total_len = 0;
> +	cfg_loop.loop_len = 0;
> +	cfg_loop.loop_cnt = 0;
> +	cfg_loop.loop_start = false;
> +	cfg.prev_addr = 0;
> +	cfg.addr = 0;
> +	cfg.link = 0;

again use memset for these

> +
> +	list_for_each_entry(entry, &drvdata->cfg_head[curr_list], list) {
> +		switch (entry->desc_type) {
> +		case DCC_READ_WRITE_TYPE:
> +		{

checkpatch should have told you this is not typical kernel style, pls
fix this and many other things before we process further

-- 
~Vinod
