Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B6A31EAE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 15:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBROXL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 09:23:11 -0500
Received: from z11.mailgun.us ([104.130.96.11]:37789 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230465AbhBRLxB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 06:53:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613649145; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0BpJCvNz5u2Fsr5nrvwowLd7MOweWhUjizn/9vy9guk=;
 b=PMKRzctPEpmXegIt/gRCwmV7mapi/vf4r3h3RlDgboXT5GBgvVbb0b6R/TosQmVdNUaoSjIH
 U2Di3qhoE6toZbUvVZzMTYGQdITmkECP9vd/Hc2N78LSRe1Bp4AI5p3vqebMDwJs2frNOc7R
 +v4hDAb2CTaGox+udeUXhnD5VIM=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 602e54d9eb4f89cdf8be5ee2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Feb 2021 11:51:53
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CF4ECC433CA; Thu, 18 Feb 2021 11:51:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00604C433CA;
        Thu, 18 Feb 2021 11:51:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 18 Feb 2021 17:21:50 +0530
From:   schowdhu@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 3/6] soc: qcom: dcc:Add driver support for Data Capture
 and Compare unit(DCC)
In-Reply-To: <20210218065912.GV2774@vkoul-mobl.Dlink>
References: <cover.1613541226.git.schowdhu@codeaurora.org>
 <f182b10f318db7cb09216c0176a5b26656d9ef49.1613541226.git.schowdhu@codeaurora.org>
 <20210218065912.GV2774@vkoul-mobl.Dlink>
Message-ID: <80a0bc496ede7c55893ad3eb41837bef@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-18 12:29, Vinod Koul wrote:
> On 17-02-21, 12:18, Souradeep Chowdhury wrote:
>> The DCC is a DMA Engine designed to capture and store data
>> during system crash or software triggers.The DCC operates
>                                         ^^^
> Space after . (quite a few here, pls fix them)

Ack

> 
>> based on link list entries which provides it with data and
>> addresses and the function it needs to perform.These functions
>> are read,write and loop.Added the basic driver in this patch
>> which contains a probe method which instantiates all the link
>> list data specific to a SoC.Methods have also been added to
>> handle all the functionalities specific to a linked list.Each
>> DCC has it's own SRAM which needs to be instantiated at probe
>> time as well.
> 
> So help me understand, in case of system crash how will this be used..?

In case of system crashes like secure WDog bite, the DCC hardware 
captures
and stores the values at the configured register addresses in it's 
dedicated SRAM.
The driver only enables the DCC hardware during probe time and 
configures
register addresses via user space.

> 
>> 
>> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
>> ---
>>  drivers/soc/qcom/Kconfig  |    8 +
>>  drivers/soc/qcom/Makefile |    1 +
>>  drivers/soc/qcom/dcc.c    | 1055 
>> +++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 1064 insertions(+)
>>  create mode 100644 drivers/soc/qcom/dcc.c
>> 
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 79b568f..8819e0b 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -69,6 +69,14 @@ config QCOM_LLCC
>>  	  SDM845. This provides interfaces to clients that use the LLCC.
>>  	  Say yes here to enable LLCC slice driver.
>> 
>> +config QCOM_DCC
>> +	tristate "Qualcomm Technologies, Inc. Data Capture and Compare 
>> engine driver"
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	help
>> +	  This option enables driver for Data Capture and Compare engine. 
>> DCC
>> +	  driver provides interface to configure DCC block and read back
>> +	  captured data from DCC's internal SRAM.
>> +
>>  config QCOM_KRYO_L2_ACCESSORS
>>  	bool
>>  	depends on ARCH_QCOM && ARM64 || COMPILE_TEST
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index ad675a6..1b00870 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -26,3 +26,4 @@ obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>>  obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
>>  obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
>>  obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
>> +obj-$(CONFIG_QCOM_DCC) += dcc.o
>> diff --git a/drivers/soc/qcom/dcc.c b/drivers/soc/qcom/dcc.c
>> new file mode 100644
>> index 0000000..d67452b
>> --- /dev/null
>> +++ b/drivers/soc/qcom/dcc.c
>> @@ -0,0 +1,1055 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2015-2021, The Linux Foundation. All rights 
>> reserved.
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/cdev.h>
>> +#include <linux/delay.h>
>> +#include <linux/fs.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +#include <linux/uaccess.h>
>> +
>> +#define TIMEOUT_US		100
>> +
>> +#define BM(lsb, msb)		((BIT(msb) - BIT(lsb)) + BIT(msb))
>> +#define BMVAL(val, lsb, msb)	((val & BM(lsb, msb)) >> lsb)
>> +#define BVAL(val, n)		((val & BIT(n)) >> n)
> 
> Pls use macros available in bitfield.h rather than inventing your own..

Ack

> 
>> +
>> +#define dcc_writel(drvdata, val, off)					\
>> +	writel((val), drvdata->base + dcc_offset_conv(drvdata, off))
>> +#define dcc_readl(drvdata, off)						\
>> +	readl(drvdata->base + dcc_offset_conv(drvdata, off))
>> +
>> +#define dcc_sram_readl(drvdata, off)					\
>> +	readl(drvdata->ram_base + off)
>> +
>> +/* DCC registers */
>> +#define DCC_HW_INFO					0x04
>> +#define DCC_LL_NUM_INFO					0x10
>> +#define DCC_STATUS					0x1C
>> +#define DCC_LL_LOCK(m)					(0x34 + 0x80 * m)
>> +#define DCC_LL_CFG(m)					(0x38 + 0x80 * m)
>> +#define DCC_LL_BASE(m)					(0x3c + 0x80 * m)
>> +#define DCC_FD_BASE(m)					(0x40 + 0x80 * m)
>> +#define DCC_LL_TIMEOUT(m)				(0x44 + 0x80 * m)
>> +#define DCC_LL_INT_ENABLE(m)				(0x4C + 0x80 * m)
>> +#define DCC_LL_INT_STATUS(m)				(0x50 + 0x80 * m)
>> +#define DCC_LL_SW_TRIGGER(m)				(0x60 + 0x80 * m)
>> +#define DCC_LL_BUS_ACCESS_STATUS(m)			(0x64 + 0x80 * m)
>> +
>> +#define DCC_MAP_LEVEL1			0x18
>> +#define DCC_MAP_LEVEL2			0x34
>> +#define DCC_MAP_LEVEL3			0x4C
>> +
>> +#define DCC_MAP_OFFSET1			0x10
>> +#define DCC_MAP_OFFSET2			0x18
>> +#define DCC_MAP_OFFSET3			0x1C
>> +#define DCC_MAP_OFFSET4			0x8
>> +
>> +#define DCC_FIX_LOOP_OFFSET		16
>> +#define DCC_VER_INFO_BIT		9
>> +
>> +#define DCC_READ        0
>> +#define DCC_WRITE       1
>> +#define DCC_LOOP        2
>> +#define DCC_READ_WRITE  3
>> +
>> +#define MAX_DCC_OFFSET				(0xFF * 4)
>> +#define MAX_DCC_LEN				0x7F
>> +#define MAX_LOOP_CNT				0xFF
>> +
>> +#define DCC_ADDR_DESCRIPTOR			0x00
>> +#define DCC_LOOP_DESCRIPTOR			(BIT(30))
>> +#define DCC_RD_MOD_WR_DESCRIPTOR		(BIT(31))
>> +#define DCC_LINK_DESCRIPTOR			(BIT(31) | BIT(30))
> 
> we have GENMASK() for this

Ack

> 
>> +
>> +#define DCC_READ_IND				0x00
>> +#define DCC_WRITE_IND				(BIT(28))
>> +
>> +#define DCC_AHB_IND				0x00
>> +#define DCC_APB_IND				BIT(29)
>> +
>> +#define DCC_MAX_LINK_LIST			8
>> +#define DCC_INVALID_LINK_LIST			0xFF
>> +
>> +#define DCC_VER_MASK1				0x7F
>> +#define DCC_VER_MASK2				0x3F
> 
> Genmask for these too...

Ack

> 
>> +
>> +#define DCC_RD_MOD_WR_ADDR                      0xC105E
>> +
>> +struct qcom_dcc_config {
>> +	const int dcc_ram_offset;
>> +};
>> +
>> +static const struct qcom_dcc_config sm8150_cfg = {
>> +	.dcc_ram_offset				= 0x5000,
>> +};
> 
> maybe move it down near compatible table?

Ack

> 
>> +
>> +enum dcc_descriptor_type {
>> +	DCC_ADDR_TYPE,
>> +	DCC_LOOP_TYPE,
>> +	DCC_READ_WRITE_TYPE,
>> +	DCC_WRITE_TYPE
>> +};
>> +
>> +enum dcc_mem_map_ver {
>> +	DCC_MEM_MAP_VER1,
>> +	DCC_MEM_MAP_VER2,
>> +	DCC_MEM_MAP_VER3
>> +};
>> +
>> +struct dcc_config_entry {
>> +	u32				base;
>> +	u32				offset;
>> +	u32				len;
>> +	u32				index;
>> +	u32				loop_cnt;
>> +	u32				write_val;
>> +	u32				mask;
>> +	bool				apb_bus;
>> +	enum dcc_descriptor_type	desc_type;
>> +	struct list_head		list;
>> +};
>> +
>> +struct dcc_drvdata {
>> +	void __iomem		*base;
>> +	u32			reg_size;
>> +	struct device		*dev;
>> +	struct mutex		mutex;
>> +	void __iomem		*ram_base;
>> +	u32			ram_size;
>> +	u32			ram_offset;
>> +	enum dcc_mem_map_ver	mem_map_ver;
>> +	u32			ram_cfg;
>> +	u32			ram_start;
>> +	bool			*enable;
>> +	bool			*configured;
>> +	bool			interrupt_disable;
>> +	char			*sram_node;
>> +	struct cdev		sram_dev;
>> +	struct class		*sram_class;
>> +	struct list_head	*cfg_head;
>> +	u32			*nr_config;
>> +	u32			nr_link_list;
>> +	u8			curr_list;
>> +	u8			loopoff;
>> +};
>> +
>> +struct dcc_cfg_attr {
>> +	u32	addr;
>> +	u32	prev_addr;
>> +	u32	prev_off;
>> +	u32	link;
>> +	u32	sram_offset;
>> +};
>> +
>> +struct dcc_cfg_loop_attr {
>> +	u32	loop;
>> +	bool	loop_start;
>> +	u32	loop_cnt;
>> +	u32	loop_len;
>> +	u32	loop_off;
>> +};
>> +
>> +static u32 dcc_offset_conv(struct dcc_drvdata *drvdata, u32 off)
>> +{
>> +	if (drvdata->mem_map_ver == DCC_MEM_MAP_VER1) {
>> +		if ((off & DCC_VER_MASK1) >= DCC_MAP_LEVEL3)
>> +			return (off - DCC_MAP_OFFSET3);
>> +		if ((off & DCC_VER_MASK1) >= DCC_MAP_LEVEL2)
>> +			return (off - DCC_MAP_OFFSET2);
>> +		else if ((off & DCC_VER_MASK1) >= DCC_MAP_LEVEL1)
>> +			return (off - DCC_MAP_OFFSET1);
>> +	} else if (drvdata->mem_map_ver == DCC_MEM_MAP_VER2) {
>> +		if ((off & DCC_VER_MASK1) >= DCC_MAP_LEVEL2)
>> +			return (off - DCC_MAP_OFFSET4);
>> +	}
>> +	return off;
>> +}
>> +
>> +static int dcc_sram_writel(struct dcc_drvdata *drvdata,
>> +					u32 val, u32 off)
>> +{
>> +	if (unlikely(off > (drvdata->ram_size - 4)))
>> +		return -EINVAL;
>> +
>> +	writel((val), drvdata->ram_base + off);
>> +
>> +	return 0;
>> +}
>> +
>> +static int _dcc_ll_cfg_read_write(struct dcc_drvdata *drvdata,
>> +struct dcc_config_entry *entry, struct dcc_cfg_attr *cfg)
> 
> this looks a bit hard to read, can you make it better (also you can go
> upto 100 chars now), do you checkpatch with --strict option to get
> better alignment of code

Ack

> 
> 
>> +{
>> +	int ret = 0;
> 
> Superfluous init?

Ack

> 
>> +
>> +	if (cfg->link) {
>> +		/* write new offset = 1 to continue
>> +		 * processing the list
> 
> kernel uses:
>         /*
>          * this is a
>          * multi line comment style
>          */

Ack

> 
>> +		 */
>> +
>> +		ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
>> +		if (ret)
>> +			return ret;
>> +		cfg->sram_offset += 4;
>> +		/* Reset link and prev_off */
>> +		cfg->addr = 0x00;
>> +		cfg->link = 0;
>> +		cfg->prev_off = 0;
> 
> memset cfg first?

Ack

> 
>> +		cfg->prev_addr = cfg->addr;
>> +	}
>> +
>> +	cfg->addr = DCC_RD_MOD_WR_DESCRIPTOR;
>> +
>> +	ret = dcc_sram_writel(drvdata, cfg->addr, cfg->sram_offset);
>> +
> 
> drop this empty line

Ack

> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	cfg->sram_offset += 4;
>> +
>> +	ret = dcc_sram_writel(drvdata, entry->mask, cfg->sram_offset);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	cfg->sram_offset += 4;
>> +
>> +	ret = dcc_sram_writel(drvdata, entry->write_val, cfg->sram_offset);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	cfg->sram_offset += 4;
>> +
>> +	cfg->addr = 0;
>> +
>> +	return ret;
>> +}
>> +
>> +static int _dcc_ll_cfg_loop(struct dcc_drvdata *drvdata, struct 
>> dcc_config_entry *entry,
>> +struct dcc_cfg_attr *cfg, struct dcc_cfg_loop_attr *cfg_loop, u32 
>> *total_len)
> 
> here as well

Ack

> 
>> +{
>> +
>> +	int ret = 0;
>> +
>> +	/* Check if we need to write link of prev entry */
>> +	if (cfg->link) {
>> +		ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
>> +		if (ret)
>> +			return ret;
>> +		cfg->sram_offset += 4;
>> +	}
>> +
>> +	if (cfg_loop->loop_start) {
>> +		cfg_loop->loop = (cfg->sram_offset - cfg_loop->loop_off) / 4;
>> +		cfg_loop->loop |= (cfg_loop->loop_cnt << drvdata->loopoff) &
>> +		BM(drvdata->loopoff, 27);
>> +		cfg_loop->loop |= DCC_LOOP_DESCRIPTOR;
>> +		*total_len += (*total_len - cfg_loop->loop_len) * 
>> cfg_loop->loop_cnt;
>> +
>> +		ret = dcc_sram_writel(drvdata, cfg_loop->loop, cfg->sram_offset);
>> +
>> +		if (ret)
>> +			return ret;
>> +		cfg->sram_offset += 4;
>> +
>> +		cfg_loop->loop_start = false;
>> +		cfg_loop->loop_len = 0;
>> +		cfg_loop->loop_off = 0;
> 
> seems quite similar to last one..? Maybe a helper for common code

Ack

> 
>> +	} else {
>> +		cfg_loop->loop_start = true;
>> +		cfg_loop->loop_cnt = entry->loop_cnt - 1;
>> +		cfg_loop->loop_len = *total_len;
>> +		cfg_loop->loop_off = cfg->sram_offset;
>> +	}
>> +
>> +	/* Reset link and prev_off */
>> +
>> +	cfg->addr = 0x00;
>> +	cfg->link = 0;
>> +	cfg->prev_off = 0;
>> +	cfg->prev_addr = cfg->addr;
>> +
>> +	return ret;
>> +}
>> +
>> +static int _dcc_ll_cfg_write(struct dcc_drvdata *drvdata,
>> +struct dcc_config_entry *entry, struct dcc_cfg_attr *cfg, u32 
>> *total_len)
>> +{
>> +	u32 off;
>> +	int ret = 0;
>> +
>> +	if (cfg->link) {
>> +		/* write new offset = 1 to continue
>> +		 * processing the list
>> +		 */
>> +		ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
>> +
>> +		if (ret)
>> +			return ret;
>> +
>> +		cfg->sram_offset += 4;
>> +		/* Reset link and prev_off */
>> +		cfg->addr = 0x00;
>> +		cfg->prev_off = 0;
>> +		cfg->prev_addr = cfg->addr;
>> +	}
>> +
>> +	off = entry->offset/4;
>> +	/* write new offset-length pair to correct position */
>> +	cfg->link |= ((off & BM(0, 7)) | BIT(15) | ((entry->len << 8) & 
>> BM(8, 14)));
>> +	cfg->link |= DCC_LINK_DESCRIPTOR;
>> +
>> +	/* Address type */
>> +	cfg->addr = (entry->base >> 4) & BM(0, 27);
>> +	if (entry->apb_bus)
>> +		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_WRITE_IND | DCC_APB_IND;
>> +	else
>> +		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_WRITE_IND | DCC_AHB_IND;
>> +	ret = dcc_sram_writel(drvdata, cfg->addr, cfg->sram_offset);
>> +
>> +	if (ret)
>> +		return ret;
>> +	cfg->sram_offset += 4;
>> +
>> +	ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
>> +	if (ret)
>> +		return ret;
>> +	cfg->sram_offset += 4;
>> +
>> +	ret = dcc_sram_writel(drvdata, entry->write_val, cfg->sram_offset);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	cfg->sram_offset += 4;
>> +	cfg->addr = 0x00;
>> +	cfg->link = 0;
>> +	return ret;
>> +}
>> +
>> +static int _dcc_ll_cfg_default(struct dcc_drvdata *drvdata,
>> +struct dcc_config_entry *entry, struct dcc_cfg_attr *cfg, u32 *pos, 
>> u32 *total_len)
>> +{
>> +	int ret = 0;
>> +	u32 off;
>> +
>> +	cfg->addr = (entry->base >> 4) & BM(0, 27);
>> +
>> +	if (entry->apb_bus)
>> +		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_READ_IND | DCC_APB_IND;
>> +	else
>> +		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_READ_IND | DCC_AHB_IND;
>> +
>> +	off = entry->offset/4;
>> +
>> +	*total_len += entry->len * 4;
>> +
>> +	if (!cfg->prev_addr || cfg->prev_addr != cfg->addr || cfg->prev_off 
>> > off) {
>> +		/* Check if we need to write prev link entry */
>> +		if (cfg->link) {
>> +			ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
>> +			if (ret)
>> +				return ret;
>> +				cfg->sram_offset += 4;
>> +		}
>> +		dev_dbg(drvdata->dev, "DCC: sram address 0x%x\n", 
>> cfg->sram_offset);
>> +
>> +		/* Write address */
>> +		ret = dcc_sram_writel(drvdata, cfg->addr, cfg->sram_offset);
>> +
>> +		if (ret)
>> +			return ret;
>> +
>> +		cfg->sram_offset += 4;
>> +
>> +		/* Reset link and prev_off */
>> +		cfg->link = 0;
>> +		cfg->prev_off = 0;
>> +	}
>> +
>> +	if ((off - cfg->prev_off) > 0xFF || entry->len > MAX_DCC_LEN) {
>> +		dev_err(drvdata->dev, "DCC: Programming error Base: 0x%x, offset 
>> 0x%x\n",
>> +		entry->base, entry->offset);
>> +		ret = -EINVAL;
>> +		return ret;
>> +	}
>> +
>> +	if (cfg->link) {
>> +		/*
>> +		 * link already has one offset-length so new
>> +		 * offset-length needs to be placed at
>> +		 * bits [29:15]
>> +		 */
>> +		*pos = 15;
>> +
>> +		/* Clear bits [31:16] */
>> +		cfg->link &= BM(0, 14);
>> +	} else {
>> +		/*
>> +		 * link is empty, so new offset-length needs
>> +		 * to be placed at bits [15:0]
>> +		 */
>> +		*pos = 0;
>> +		cfg->link = 1 << 15;
>> +	}
>> +
>> +	/* write new offset-length pair to correct position */
>> +	cfg->link |= (((off-cfg->prev_off) & BM(0, 7)) | ((entry->len << 8) 
>> & BM(8, 14))) << *pos;
>> +
>> +	cfg->link |= DCC_LINK_DESCRIPTOR;
>> +
>> +	if (*pos) {
>> +		ret = dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
>> +		if (ret)
>> +			return ret;
>> +		cfg->sram_offset += 4;
>> +		cfg->link = 0;
>> +	}
>> +
>> +	cfg->prev_off  = off + entry->len - 1;
>> +	cfg->prev_addr = cfg->addr;
>> +	return ret;
>> +}
>> +
>> +static int __dcc_ll_cfg(struct dcc_drvdata *drvdata, int curr_list)
>> +{
>> +	int ret = 0;
>> +	u32 total_len, pos;
>> +	struct dcc_config_entry *entry;
>> +	struct dcc_cfg_attr cfg;
>> +	struct dcc_cfg_loop_attr cfg_loop;
>> +
>> +	cfg.sram_offset = drvdata->ram_cfg * 4;
>> +	cfg.prev_off = 0;
>> +	cfg_loop.loop_off = 0;
>> +	total_len = 0;
>> +	cfg_loop.loop_len = 0;
>> +	cfg_loop.loop_cnt = 0;
>> +	cfg_loop.loop_start = false;
>> +	cfg.prev_addr = 0;
>> +	cfg.addr = 0;
>> +	cfg.link = 0;
> 
> again use memset for these

Ack

> 
>> +
>> +	list_for_each_entry(entry, &drvdata->cfg_head[curr_list], list) {
>> +		switch (entry->desc_type) {
>> +		case DCC_READ_WRITE_TYPE:
>> +		{
> 
> checkpatch should have told you this is not typical kernel style, pls
> fix this and many other things before we process further

Checkpatch with --strict option has been run for these patches but it 
seems to
be not detecting these. They have been fixed now.

