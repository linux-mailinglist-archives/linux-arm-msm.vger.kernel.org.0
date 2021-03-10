Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE096334C65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 00:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233603AbhCJXUM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 18:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233271AbhCJXTk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 18:19:40 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B19C061761
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 15:19:40 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id e45so18163907ote.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 15:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rQVZRuv7v9HNpbXdcvf4GyZAZLaOLOz+BRqgqExhf04=;
        b=NlHdOF4qXRnnUjaZVDrn5FPVj4g6PzjNBSMwmEv9krULKYVPe58sndKLwJDux+AyOP
         Wrp4j82M5yBiuzt8WMRjN+oDE9kzU3Y0WYNWquLs9oRW2czzRh9QoI8ntsmd16xRdR8W
         aslPjR7zyBngqDzpBK74KqGqmgkUuZH0xOx68Dn1ZHvW0FxOSISzIUgpP/SITJnyCtcn
         UJfrGEhPtxP3kwP+EFQuvUwR8HywfehkcNXvj1gAbFHjeAlKbZ5NF5Uw14a8DuSJNxcE
         rGWi5laff3MWOxfAN39opXZ58IRcH9nIONxMPnGuEOowA5SONr7X2RyPdvj0XsF89BcZ
         T3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rQVZRuv7v9HNpbXdcvf4GyZAZLaOLOz+BRqgqExhf04=;
        b=eI5O/Giv49V0zPPiODMB61pFBclRW5h14AcvfVPUz7T/Z97k80sIHRLCZa77R2S5QC
         VklLS9edzCh7nIXnHDM7GPL4wiFAPMnjOMuxjmkWIK9iZHiTmZrHS+tH1qzMe/gbQXaW
         gHlcTaJ6v7IEQqHEaA4BS2QnVHzs8eZMKpPjQiXGS1AaXCFzF1LzRXTbGOlIR3sqtyvE
         q3JvX9e5qqXThl2IZlMYs7RzIODg3vl7rEgqF+SOCzhl2irFDXFtYM3+3mC4PvIaNqnh
         usf2yqEdWOS0kXMt3u/2ZZYOybTKAHQ8ODKutk+vGvLIjG0EWQNtCZGMk7XVuE0K3GzX
         6BgQ==
X-Gm-Message-State: AOAM533uLYPpgKdPHCgIDiU4iBy2uz7Lz9xlK4qtFeHTgBX8NE5DR1j4
        x0YchH8PWt5WIa9RToiNBOSB0Q==
X-Google-Smtp-Source: ABdhPJyjKkut+Edx72bAxRpaWLi7CfGhH+ocAsBNc3kV8ABgiaGznmsRVVKfkkKF/KpahTa/hoAB2Q==
X-Received: by 2002:a9d:7e8d:: with SMTP id m13mr4506749otp.54.1615418379266;
        Wed, 10 Mar 2021 15:19:39 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v3sm186816oix.48.2021.03.10.15.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 15:19:38 -0800 (PST)
Date:   Wed, 10 Mar 2021 17:19:37 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
Subject: Re: [PATCH V1 2/6] soc: qcom: dcc: Add driver support for Data
 Capture and Compare unit(DCC)
Message-ID: <YElUCaBUOx7hEuIh@builder.lan>
References: <cover.1615393454.git.schowdhu@codeaurora.org>
 <48556129a02c9f7cd0b31b2e8ee0f168e6d211b7.1615393454.git.schowdhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48556129a02c9f7cd0b31b2e8ee0f168e6d211b7.1615393454.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Mar 10:46 CST 2021, Souradeep Chowdhury wrote:

> The DCC is a DMA Engine designed to capture and store data
> during system crash or software triggers. The DCC operates
> based on link list entries which provides it with data and
> addresses and the function it needs to perform. These
> functions are read, write and loop. Added the basic driver
> in this patch which contains a probe method which instantiates
> the resources needed by the driver. DCC has it's own SRAM which
> needs to be instantiated at probe time as well.
> 

So to summarize, the DCC will upon a crash copy the configured region
into the dcc-ram, where it can be retrieved either by dumping the memory
over USB or from sysfs on the next boot?

> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig  |   8 +
>  drivers/soc/qcom/Makefile |   1 +
>  drivers/soc/qcom/dcc.c    | 388 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 397 insertions(+)
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
> index 0000000..89816bf
> --- /dev/null
> +++ b/drivers/soc/qcom/dcc.c
> @@ -0,0 +1,388 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/bitfield.h>
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
> +#define dcc_readl(drvdata, off)						\
> +	readl(drvdata->base + dcc_offset_conv(drvdata, off))

This is only used in probe, please just inline it, and use (a) local
variable(s) to avoid the lengthy lines.

> +
> +/* DCC registers */
> +#define DCC_HW_INFO			0x04
> +#define DCC_LL_NUM_INFO			0x10
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
> +#define DCC_MAX_LINK_LIST		8
> +#define DCC_INVALID_LINK_LIST		GENMASK(7, 0)
> +
> +#define DCC_VER_MASK1			GENMASK(6, 0)
> +#define DCC_VER_MASK2			GENMASK(5, 0)
> +
> +#define DCC_RD_MOD_WR_ADDR		0xC105E
> +
> +struct qcom_dcc_config {
> +	const int dcc_ram_offset;
> +};
> +
> +enum dcc_mem_map_ver {
> +	DCC_MEM_MAP_VER1,

As these are just integers, I would suggest skipping them. If you really
like them I would like to see VER1 = 1, to make any future debugging
easier.

> +	DCC_MEM_MAP_VER2,
> +	DCC_MEM_MAP_VER3
> +};
> +
> +enum dcc_descriptor_type {
> +	DCC_ADDR_TYPE,
> +	DCC_LOOP_TYPE,
> +	DCC_READ_WRITE_TYPE,
> +	DCC_WRITE_TYPE
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
> +static u32 dcc_offset_conv(struct dcc_drvdata *drvdata, u32 off)

I don't see a reason for specifying that the parameter and return value
are 32-bit unsigned ints, please use a generic data type...Like size_t

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
> +static void dcc_config_reset(struct dcc_drvdata *drvdata)
> +{
> +	struct dcc_config_entry *entry, *temp;
> +	int curr_list;
> +
> +	mutex_lock(&drvdata->mutex);
> +
> +	for (curr_list = 0; curr_list < drvdata->nr_link_list; curr_list++) {
> +

Unnecessary newline.

> +		list_for_each_entry_safe(entry, temp,
> +			&drvdata->cfg_head[curr_list], list) {
> +			list_del(&entry->list);
> +			devm_kfree(drvdata->dev, entry);
> +			drvdata->nr_config[curr_list]--;
> +		}
> +	}
> +	drvdata->ram_start = 0;
> +	drvdata->ram_cfg = 0;
> +	mutex_unlock(&drvdata->mutex);
> +}
> +
> +static int dcc_sram_open(struct inode *inode, struct file *file)
> +{
> +	struct dcc_drvdata *drvdata = container_of(inode->i_cdev,
> +		struct dcc_drvdata,
> +		sram_dev);
> +	file->private_data = drvdata;
> +
> +	return	0;
> +}
> +
> +static ssize_t dcc_sram_read(struct file *file, char __user *data,
> +						size_t len, loff_t *ppos)
> +{
> +	unsigned char *buf;
> +	struct dcc_drvdata *drvdata = file->private_data;
> +
> +	/* EOF check */
> +	if (drvdata->ram_size <= *ppos)

"Is ppos beyond the EOF" is better expressed as:

	if (*ppos >= drvdata->ram_size)

> +		return 0;
> +
> +	if ((*ppos + len) > drvdata->ram_size)
> +		len = (drvdata->ram_size - *ppos);
> +
> +	buf = kzalloc(len, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	memcpy_fromio(buf, (drvdata->ram_base + *ppos), len);

Parenthesis are unnecessary.

> +
> +	if (copy_to_user(data, buf, len)) {
> +		dev_err(drvdata->dev, "DCC: Couldn't copy all data to user\n");
> +		kfree(buf);
> +		return -EFAULT;
> +	}
> +
> +	*ppos += len;
> +
> +	kfree(buf);
> +
> +	return len;
> +}
> +
> +static const struct file_operations dcc_sram_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= dcc_sram_open,
> +	.read		= dcc_sram_read,
> +	.llseek		= no_llseek,
> +};
> +
> +static int dcc_sram_dev_register(struct dcc_drvdata *drvdata)
> +{
> +	int ret;
> +	struct device *device;
> +	dev_t dev;
> +
> +	ret = alloc_chrdev_region(&dev, 0, 1, drvdata->sram_node);
> +	if (ret)
> +		goto err_alloc;
> +
> +	cdev_init(&drvdata->sram_dev, &dcc_sram_fops);

How about implementing this using pstore instead of exposing it through
a custom /dev/dcc_sram (if I read the code correclty)

> +
> +	drvdata->sram_dev.owner = THIS_MODULE;
> +	ret = cdev_add(&drvdata->sram_dev, dev, 1);
> +	if (ret)
> +		goto err_cdev_add;
> +
> +	drvdata->sram_class = class_create(THIS_MODULE, drvdata->sram_node);
> +	if (IS_ERR(drvdata->sram_class)) {
> +		ret = PTR_ERR(drvdata->sram_class);
> +		goto err_class_create;
> +	}
> +
> +	device = device_create(drvdata->sram_class, NULL,
> +						drvdata->sram_dev.dev, drvdata,
> +						drvdata->sram_node);
> +	if (IS_ERR(device)) {
> +		ret = PTR_ERR(device);
> +		goto err_dev_create;
> +	}
> +
> +	return 0;
> +err_dev_create:
> +	class_destroy(drvdata->sram_class);
> +err_class_create:
> +	cdev_del(&drvdata->sram_dev);
> +err_cdev_add:
> +	unregister_chrdev_region(drvdata->sram_dev.dev, 1);
> +err_alloc:
> +	return ret;
> +}
> +
> +static void dcc_sram_dev_deregister(struct dcc_drvdata *drvdata)
> +{
> +	device_destroy(drvdata->sram_class, drvdata->sram_dev.dev);
> +	class_destroy(drvdata->sram_class);
> +	cdev_del(&drvdata->sram_dev);
> +	unregister_chrdev_region(drvdata->sram_dev.dev, 1);
> +}
> +
> +static int dcc_sram_dev_init(struct dcc_drvdata *drvdata)
> +{
> +	int ret = 0;
> +	size_t node_size;
> +	char *node_name = "dcc_sram";
> +	struct device *dev = drvdata->dev;
> +
> +	node_size = strlen(node_name) + 1;
> +
> +	drvdata->sram_node = devm_kzalloc(dev, node_size, GFP_KERNEL);

kzalloc + strlcpy can be replaced by kstrdup(), but that said...all this
does seems to be to copy a const string to the heap and lugging it
around. Use a define instead.

> +	if (!drvdata->sram_node)
> +		return -ENOMEM;
> +
> +	strlcpy(drvdata->sram_node, node_name, node_size);
> +	ret = dcc_sram_dev_register(drvdata);
> +	if (ret)
> +		dev_err(drvdata->dev, "DCC: sram node not registered.\n");
> +
> +	return ret;
> +}
> +
> +static void dcc_sram_dev_exit(struct dcc_drvdata *drvdata)
> +{
> +	dcc_sram_dev_deregister(drvdata);
> +}
> +
> +static int dcc_probe(struct platform_device *pdev)
> +{
> +	int ret = 0, i;
> +	struct device *dev = &pdev->dev;
> +	struct dcc_drvdata *drvdata;

I think "dcc" would be a better name than "drvdata"...

> +	struct resource *res;
> +	const struct qcom_dcc_config *cfg;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, drvdata);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dcc-base");

platform_get_resource_byname() + devm_ioremap() is done in one go using
devm_platform_ioremap_resource_byname()

> +	if (!res)
> +		return -EINVAL;
> +
> +	drvdata->reg_size = resource_size(res);

reg_size is unused outside this assignment, no need to lug it around in
drvdata.

> +	drvdata->base = devm_ioremap(dev, res->start, resource_size(res));

drvdata->base is only accessed from this function, use a local variable
instead.

> +	if (!drvdata->base)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +							"dcc-ram-base");

Here you're actually carrying the resource size, so it makes sense.

But it's okay not to wrap this line.

> +	if (!res)
> +		return -EINVAL;
> +
> +	drvdata->ram_size = resource_size(res);
> +	drvdata->ram_base = devm_ioremap(dev, res->start, resource_size(res));
> +	if (!drvdata->ram_base)
> +		return -ENOMEM;
> +	cfg = of_device_get_match_data(&pdev->dev);
> +	drvdata->ram_offset = cfg->dcc_ram_offset;
> +
> +	if (FIELD_GET(BIT(DCC_VER_INFO_BIT), dcc_readl(drvdata, DCC_HW_INFO))) {
> +		drvdata->mem_map_ver = DCC_MEM_MAP_VER3;
> +		drvdata->nr_link_list = dcc_readl(drvdata, DCC_LL_NUM_INFO);
> +		if (drvdata->nr_link_list == 0)
> +			return	-EINVAL;

Replace the \t in the middle

> +	} else if ((dcc_readl(drvdata, DCC_HW_INFO) & DCC_VER_MASK2) == DCC_VER_MASK2) {
> +		drvdata->mem_map_ver = DCC_MEM_MAP_VER2;
> +		drvdata->nr_link_list = dcc_readl(drvdata, DCC_LL_NUM_INFO);
> +		if (drvdata->nr_link_list == 0)
> +			return	-EINVAL;
> +	} else {
> +		drvdata->mem_map_ver = DCC_MEM_MAP_VER1;
> +		drvdata->nr_link_list = DCC_MAX_LINK_LIST;
> +	}
> +
> +	if ((dcc_readl(drvdata, DCC_HW_INFO) & BIT(6)) == BIT(6))
> +		drvdata->loopoff = DCC_FIX_LOOP_OFFSET;
> +	else
> +		drvdata->loopoff = get_bitmask_order((drvdata->ram_size +
> +				drvdata->ram_offset) / 4 - 1);
> +	mutex_init(&drvdata->mutex);
> +
> +	drvdata->enable = devm_kzalloc(dev, drvdata->nr_link_list *
> +			sizeof(bool), GFP_KERNEL);

kzalloc(, items * sizeof(), ...) is kcalloc()

> +	if (!drvdata->enable)
> +		return -ENOMEM;

Add a newline between each check and the subsequent allocation, or do
all the allocation then do a
	if (!dcc->enable || !dcc->configured ...)
		return -ENOMEM;

> +	drvdata->configured = devm_kzalloc(dev, drvdata->nr_link_list *
> +			sizeof(bool), GFP_KERNEL);
> +	if (!drvdata->configured)
> +		return -ENOMEM;
> +	drvdata->nr_config = devm_kzalloc(dev, drvdata->nr_link_list *
> +			sizeof(u32), GFP_KERNEL);
> +	if (!drvdata->nr_config)
> +		return -ENOMEM;
> +	drvdata->cfg_head = devm_kzalloc(dev, drvdata->nr_link_list *
> +			sizeof(struct list_head), GFP_KERNEL);
> +	if (!drvdata->cfg_head)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < drvdata->nr_link_list; i++) {
> +		INIT_LIST_HEAD(&drvdata->cfg_head[i]);
> +		drvdata->nr_config[i] = 0;

kzalloc() already initialized nr_config.

> +	}
> +
> +	memset_io(drvdata->ram_base, 0, drvdata->ram_size);
> +
> +	drvdata->curr_list = DCC_INVALID_LINK_LIST;
> +
> +	ret = dcc_sram_dev_init(drvdata);
> +	if (ret)
> +		goto err;
> +
> +	return ret;

We know ret is 0 here, but if you rename "err" to "out" and move it
above this line you can reuse return.

> +err:
> +	return ret;
> +}
> +
> +static int dcc_remove(struct platform_device *pdev)
> +{
> +	struct dcc_drvdata *drvdata = platform_get_drvdata(pdev);
> +
> +	dcc_sram_dev_exit(drvdata);
> +
> +	dcc_config_reset(drvdata);
> +
> +	return 0;
> +}
> +
> +static const struct qcom_dcc_config sm8150_cfg = {
> +	.dcc_ram_offset                         = 0x5000,
> +};
> +
> +static const struct of_device_id dcc_match_table[] = {
> +	{ .compatible = "qcom,sm8150-dcc", .data = &sm8150_cfg },
> +};

MODULE_DEVICE_TABLE(of, dcc_match_table);

> +
> +static struct platform_driver dcc_driver = {
> +	.probe					= dcc_probe,

The indentation here is excessive, feel free to use a single space.

> +	.remove					= dcc_remove,
> +	.driver					= {
> +		.name		= "msm-dcc",

We tend to not use "msm" anymore, so how about "qcom-dcc"?


PS. It's hard to comment on some of the things in this patch, as they
are not used until the next patch...

Regards,
Bjorn

> +		.of_match_table	= dcc_match_table,
> +	},
> +};
> +
> +module_platform_driver(dcc_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Qualcomm Technologies Inc. DCC driver");
> +
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
