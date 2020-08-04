Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1C723BC23
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 16:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729121AbgHDO3S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 10:29:18 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:38426 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729248AbgHDO1y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 10:27:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596551273; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=AEdtcZ7JJs4el2PjouMu7oeLzSzwOFJrlOEIb8CrJvI=; b=Y0tZrF6U6G4XK4qEUHL4B7OZvfxMkt2iAR/6JuFaNtkNuihtPKOdw/SAAL8larL+K6LinayM
 igBqFWw+WMeNcQIh+tN29YPQv/LEbD1HrPuDfDM2FLGu7C6WNoeTAWZ4SKkTwpQ2wB7PRezC
 BqtzZ1B5yfkqbAZSYBERK5lNRd8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f297039798b1029685e13f5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 14:27:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 786C2C43395; Tue,  4 Aug 2020 14:27:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.4] (unknown [223.230.47.40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gkohli)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B1AEEC433CB;
        Tue,  4 Aug 2020 14:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1AEEC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=gkohli@codeaurora.org
Subject: Re: [PATCH] nvmem: core: add NVMEM_SYSFS Kconfig
To:     will@kernel.org, linux-arm-kernel@lists.infradead.org,
        maz@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        neeraju@codeaurora.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        maxime.ripard@bootlin.com
References: <1596550484-11029-1-git-send-email-gkohli@codeaurora.org>
 <20190415164011.2638-1-srinivas.kandagatla@linaro.org>
From:   Gaurav Kohli <gkohli@codeaurora.org>
Message-ID: <cec2c865-7b46-42ce-d904-f63b597d4f28@codeaurora.org>
Date:   Tue, 4 Aug 2020 19:56:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20190415164011.2638-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please ignore this patch also, sent due to git send mistake.
Apologies for the spam.


On 8/4/2020 7:44 PM, Gaurav Kohli wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Many nvmem providers are not very keen on having default sysfs
> nvmem entry, as most of the usecases for them are inside kernel
> itself. And in some cases read/writes to some areas in nvmem are
> restricted and trapped at secure monitor level, so accessing them
> from userspace would result in board reboots.
> 
> This patch adds new NVMEM_SYSFS Kconfig to make binary sysfs entry
> an optional one. This provision will give more flexibility to users.
> This patch also moves existing sysfs code to a new file so that its
> not compiled in when its not really required.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   Documentation/ABI/stable/sysfs-bus-nvmem |   2 +
>   drivers/nvmem/Kconfig                    |   9 +
>   drivers/nvmem/Makefile                   |   3 +
>   drivers/nvmem/core.c                     | 264 +----------------------
>   drivers/nvmem/nvmem-sysfs.c              | 256 ++++++++++++++++++++++
>   drivers/nvmem/nvmem.h                    |  62 ++++++
>   6 files changed, 336 insertions(+), 260 deletions(-)
>   create mode 100644 drivers/nvmem/nvmem-sysfs.c
>   create mode 100644 drivers/nvmem/nvmem.h
> 
> diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem b/Documentation/ABI/stable/sysfs-bus-nvmem
> index 5923ab4620c5..9ffba8576f7b 100644
> --- a/Documentation/ABI/stable/sysfs-bus-nvmem
> +++ b/Documentation/ABI/stable/sysfs-bus-nvmem
> @@ -6,6 +6,8 @@ Description:
>   		This file allows user to read/write the raw NVMEM contents.
>   		Permissions for write to this file depends on the nvmem
>   		provider configuration.
> +		Note: This file is only present if CONFIG_NVMEM_SYSFS
> +		is enabled
>   
>   		ex:
>   		hexdump /sys/bus/nvmem/devices/qfprom0/nvmem
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index a90e9a1ebe55..e316811e9c04 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -13,6 +13,15 @@ menuconfig NVMEM
>   
>   if NVMEM
>   
> +config NVMEM_SYSFS
> +	bool "/sys/bus/nvmem/devices/*/nvmem (sysfs interface)"
> +	depends on SYSFS
> +	help
> +	 Say Y here to add a sysfs interface for NVMEM.
> +
> +	 This interface is mostly used by userspace applications to
> +	 read/write directly into nvmem.
> +
>   config NVMEM_IMX_IIM
>   	tristate "i.MX IC Identification Module support"
>   	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 4c7ba12a7005..c1fe4768dfef 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -6,6 +6,9 @@
>   obj-$(CONFIG_NVMEM)		+= nvmem_core.o
>   nvmem_core-y			:= core.o
>   
> +obj-$(CONFIG_NVMEM_SYSFS)	+= nvmem_sysfs.o
> +nvmem_sysfs-y			:= nvmem-sysfs.o
> +
>   # Devices
>   obj-$(CONFIG_NVMEM_BCM_OCOTP)	+= nvmem-bcm-ocotp.o
>   nvmem-bcm-ocotp-y		:= bcm-ocotp.o
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 5abebf2128b8..c7892c3da91f 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -17,27 +17,7 @@
>   #include <linux/nvmem-provider.h>
>   #include <linux/of.h>
>   #include <linux/slab.h>
> -
> -struct nvmem_device {
> -	struct module		*owner;
> -	struct device		dev;
> -	int			stride;
> -	int			word_size;
> -	int			id;
> -	struct kref		refcnt;
> -	size_t			size;
> -	bool			read_only;
> -	int			flags;
> -	enum nvmem_type		type;
> -	struct bin_attribute	eeprom;
> -	struct device		*base_dev;
> -	struct list_head	cells;
> -	nvmem_reg_read_t	reg_read;
> -	nvmem_reg_write_t	reg_write;
> -	void *priv;
> -};
> -
> -#define FLAG_COMPAT		BIT(0)
> +#include "nvmem.h"
>   
>   struct nvmem_cell {
>   	const char		*name;
> @@ -61,18 +41,7 @@ static LIST_HEAD(nvmem_lookup_list);
>   
>   static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
>   
> -static const char * const nvmem_type_str[] = {
> -	[NVMEM_TYPE_UNKNOWN] = "Unknown",
> -	[NVMEM_TYPE_EEPROM] = "EEPROM",
> -	[NVMEM_TYPE_OTP] = "OTP",
> -	[NVMEM_TYPE_BATTERY_BACKED] = "Battery backed",
> -};
> -
> -#ifdef CONFIG_DEBUG_LOCK_ALLOC
> -static struct lock_class_key eeprom_lock_key;
> -#endif
>   
> -#define to_nvmem_device(d) container_of(d, struct nvmem_device, dev)
>   static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
>   			  void *val, size_t bytes)
>   {
> @@ -91,187 +60,6 @@ static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
>   	return -EINVAL;
>   }
>   
> -static ssize_t type_show(struct device *dev,
> -			 struct device_attribute *attr, char *buf)
> -{
> -	struct nvmem_device *nvmem = to_nvmem_device(dev);
> -
> -	return sprintf(buf, "%s\n", nvmem_type_str[nvmem->type]);
> -}
> -
> -static DEVICE_ATTR_RO(type);
> -
> -static struct attribute *nvmem_attrs[] = {
> -	&dev_attr_type.attr,
> -	NULL,
> -};
> -
> -static ssize_t bin_attr_nvmem_read(struct file *filp, struct kobject *kobj,
> -				    struct bin_attribute *attr,
> -				    char *buf, loff_t pos, size_t count)
> -{
> -	struct device *dev;
> -	struct nvmem_device *nvmem;
> -	int rc;
> -
> -	if (attr->private)
> -		dev = attr->private;
> -	else
> -		dev = container_of(kobj, struct device, kobj);
> -	nvmem = to_nvmem_device(dev);
> -
> -	/* Stop the user from reading */
> -	if (pos >= nvmem->size)
> -		return 0;
> -
> -	if (count < nvmem->word_size)
> -		return -EINVAL;
> -
> -	if (pos + count > nvmem->size)
> -		count = nvmem->size - pos;
> -
> -	count = round_down(count, nvmem->word_size);
> -
> -	rc = nvmem_reg_read(nvmem, pos, buf, count);
> -
> -	if (rc)
> -		return rc;
> -
> -	return count;
> -}
> -
> -static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
> -				     struct bin_attribute *attr,
> -				     char *buf, loff_t pos, size_t count)
> -{
> -	struct device *dev;
> -	struct nvmem_device *nvmem;
> -	int rc;
> -
> -	if (attr->private)
> -		dev = attr->private;
> -	else
> -		dev = container_of(kobj, struct device, kobj);
> -	nvmem = to_nvmem_device(dev);
> -
> -	/* Stop the user from writing */
> -	if (pos >= nvmem->size)
> -		return -EFBIG;
> -
> -	if (count < nvmem->word_size)
> -		return -EINVAL;
> -
> -	if (pos + count > nvmem->size)
> -		count = nvmem->size - pos;
> -
> -	count = round_down(count, nvmem->word_size);
> -
> -	rc = nvmem_reg_write(nvmem, pos, buf, count);
> -
> -	if (rc)
> -		return rc;
> -
> -	return count;
> -}
> -
> -/* default read/write permissions */
> -static struct bin_attribute bin_attr_rw_nvmem = {
> -	.attr	= {
> -		.name	= "nvmem",
> -		.mode	= 0644,
> -	},
> -	.read	= bin_attr_nvmem_read,
> -	.write	= bin_attr_nvmem_write,
> -};
> -
> -static struct bin_attribute *nvmem_bin_rw_attributes[] = {
> -	&bin_attr_rw_nvmem,
> -	NULL,
> -};
> -
> -static const struct attribute_group nvmem_bin_rw_group = {
> -	.bin_attrs	= nvmem_bin_rw_attributes,
> -	.attrs		= nvmem_attrs,
> -};
> -
> -static const struct attribute_group *nvmem_rw_dev_groups[] = {
> -	&nvmem_bin_rw_group,
> -	NULL,
> -};
> -
> -/* read only permission */
> -static struct bin_attribute bin_attr_ro_nvmem = {
> -	.attr	= {
> -		.name	= "nvmem",
> -		.mode	= 0444,
> -	},
> -	.read	= bin_attr_nvmem_read,
> -};
> -
> -static struct bin_attribute *nvmem_bin_ro_attributes[] = {
> -	&bin_attr_ro_nvmem,
> -	NULL,
> -};
> -
> -static const struct attribute_group nvmem_bin_ro_group = {
> -	.bin_attrs	= nvmem_bin_ro_attributes,
> -	.attrs		= nvmem_attrs,
> -};
> -
> -static const struct attribute_group *nvmem_ro_dev_groups[] = {
> -	&nvmem_bin_ro_group,
> -	NULL,
> -};
> -
> -/* default read/write permissions, root only */
> -static struct bin_attribute bin_attr_rw_root_nvmem = {
> -	.attr	= {
> -		.name	= "nvmem",
> -		.mode	= 0600,
> -	},
> -	.read	= bin_attr_nvmem_read,
> -	.write	= bin_attr_nvmem_write,
> -};
> -
> -static struct bin_attribute *nvmem_bin_rw_root_attributes[] = {
> -	&bin_attr_rw_root_nvmem,
> -	NULL,
> -};
> -
> -static const struct attribute_group nvmem_bin_rw_root_group = {
> -	.bin_attrs	= nvmem_bin_rw_root_attributes,
> -	.attrs		= nvmem_attrs,
> -};
> -
> -static const struct attribute_group *nvmem_rw_root_dev_groups[] = {
> -	&nvmem_bin_rw_root_group,
> -	NULL,
> -};
> -
> -/* read only permission, root only */
> -static struct bin_attribute bin_attr_ro_root_nvmem = {
> -	.attr	= {
> -		.name	= "nvmem",
> -		.mode	= 0400,
> -	},
> -	.read	= bin_attr_nvmem_read,
> -};
> -
> -static struct bin_attribute *nvmem_bin_ro_root_attributes[] = {
> -	&bin_attr_ro_root_nvmem,
> -	NULL,
> -};
> -
> -static const struct attribute_group nvmem_bin_ro_root_group = {
> -	.bin_attrs	= nvmem_bin_ro_root_attributes,
> -	.attrs		= nvmem_attrs,
> -};
> -
> -static const struct attribute_group *nvmem_ro_root_dev_groups[] = {
> -	&nvmem_bin_ro_root_group,
> -	NULL,
> -};
> -
>   static void nvmem_release(struct device *dev)
>   {
>   	struct nvmem_device *nvmem = to_nvmem_device(dev);
> @@ -422,43 +210,6 @@ static int nvmem_add_cells(struct nvmem_device *nvmem,
>   	return rval;
>   }
>   
> -/*
> - * nvmem_setup_compat() - Create an additional binary entry in
> - * drivers sys directory, to be backwards compatible with the older
> - * drivers/misc/eeprom drivers.
> - */
> -static int nvmem_setup_compat(struct nvmem_device *nvmem,
> -			      const struct nvmem_config *config)
> -{
> -	int rval;
> -
> -	if (!config->base_dev)
> -		return -EINVAL;
> -
> -	if (nvmem->read_only)
> -		nvmem->eeprom = bin_attr_ro_root_nvmem;
> -	else
> -		nvmem->eeprom = bin_attr_rw_root_nvmem;
> -	nvmem->eeprom.attr.name = "eeprom";
> -	nvmem->eeprom.size = nvmem->size;
> -#ifdef CONFIG_DEBUG_LOCK_ALLOC
> -	nvmem->eeprom.attr.key = &eeprom_lock_key;
> -#endif
> -	nvmem->eeprom.private = &nvmem->dev;
> -	nvmem->base_dev = config->base_dev;
> -
> -	rval = device_create_bin_file(nvmem->base_dev, &nvmem->eeprom);
> -	if (rval) {
> -		dev_err(&nvmem->dev,
> -			"Failed to create eeprom binary file %d\n", rval);
> -		return rval;
> -	}
> -
> -	nvmem->flags |= FLAG_COMPAT;
> -
> -	return 0;
> -}
> -
>   /**
>    * nvmem_register_notifier() - Register a notifier block for nvmem events.
>    *
> @@ -651,14 +402,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   	nvmem->read_only = device_property_present(config->dev, "read-only") ||
>   			   config->read_only || !nvmem->reg_write;
>   
> -	if (config->root_only)
> -		nvmem->dev.groups = nvmem->read_only ?
> -			nvmem_ro_root_dev_groups :
> -			nvmem_rw_root_dev_groups;
> -	else
> -		nvmem->dev.groups = nvmem->read_only ?
> -			nvmem_ro_dev_groups :
> -			nvmem_rw_dev_groups;
> +	nvmem->dev.groups = nvmem_sysfs_get_groups(nvmem, config);
>   
>   	device_initialize(&nvmem->dev);
>   
> @@ -669,7 +413,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   		goto err_put_device;
>   
>   	if (config->compat) {
> -		rval = nvmem_setup_compat(nvmem, config);
> +		rval = nvmem_sysfs_setup_compat(nvmem, config);
>   		if (rval)
>   			goto err_device_del;
>   	}
> @@ -696,7 +440,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   	nvmem_device_remove_all_cells(nvmem);
>   err_teardown_compat:
>   	if (config->compat)
> -		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
> +		nvmem_sysfs_remove_compat(nvmem, config);
>   err_device_del:
>   	device_del(&nvmem->dev);
>   err_put_device:
> diff --git a/drivers/nvmem/nvmem-sysfs.c b/drivers/nvmem/nvmem-sysfs.c
> new file mode 100644
> index 000000000000..6f303b91f6e7
> --- /dev/null
> +++ b/drivers/nvmem/nvmem-sysfs.c
> @@ -0,0 +1,256 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019, Linaro Limited
> + */
> +#include "nvmem.h"
> +
> +static const char * const nvmem_type_str[] = {
> +	[NVMEM_TYPE_UNKNOWN] = "Unknown",
> +	[NVMEM_TYPE_EEPROM] = "EEPROM",
> +	[NVMEM_TYPE_OTP] = "OTP",
> +	[NVMEM_TYPE_BATTERY_BACKED] = "Battery backed",
> +};
> +
> +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> +static struct lock_class_key eeprom_lock_key;
> +#endif
> +
> +static ssize_t type_show(struct device *dev,
> +			 struct device_attribute *attr, char *buf)
> +{
> +	struct nvmem_device *nvmem = to_nvmem_device(dev);
> +
> +	return sprintf(buf, "%s\n", nvmem_type_str[nvmem->type]);
> +}
> +
> +static DEVICE_ATTR_RO(type);
> +
> +static struct attribute *nvmem_attrs[] = {
> +	&dev_attr_type.attr,
> +	NULL,
> +};
> +
> +static ssize_t bin_attr_nvmem_read(struct file *filp, struct kobject *kobj,
> +				    struct bin_attribute *attr,
> +				    char *buf, loff_t pos, size_t count)
> +{
> +	struct device *dev;
> +	struct nvmem_device *nvmem;
> +	int rc;
> +
> +	if (attr->private)
> +		dev = attr->private;
> +	else
> +		dev = container_of(kobj, struct device, kobj);
> +	nvmem = to_nvmem_device(dev);
> +
> +	/* Stop the user from reading */
> +	if (pos >= nvmem->size)
> +		return 0;
> +
> +	if (count < nvmem->word_size)
> +		return -EINVAL;
> +
> +	if (pos + count > nvmem->size)
> +		count = nvmem->size - pos;
> +
> +	count = round_down(count, nvmem->word_size);
> +
> +	rc = nvmem->reg_read(nvmem->priv, pos, buf, count);
> +
> +	if (rc)
> +		return rc;
> +
> +	return count;
> +}
> +
> +static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
> +				     struct bin_attribute *attr,
> +				     char *buf, loff_t pos, size_t count)
> +{
> +	struct device *dev;
> +	struct nvmem_device *nvmem;
> +	int rc;
> +
> +	if (attr->private)
> +		dev = attr->private;
> +	else
> +		dev = container_of(kobj, struct device, kobj);
> +	nvmem = to_nvmem_device(dev);
> +
> +	/* Stop the user from writing */
> +	if (pos >= nvmem->size)
> +		return -EFBIG;
> +
> +	if (count < nvmem->word_size)
> +		return -EINVAL;
> +
> +	if (pos + count > nvmem->size)
> +		count = nvmem->size - pos;
> +
> +	count = round_down(count, nvmem->word_size);
> +
> +	rc = nvmem->reg_write(nvmem->priv, pos, buf, count);
> +
> +	if (rc)
> +		return rc;
> +
> +	return count;
> +}
> +
> +/* default read/write permissions */
> +static struct bin_attribute bin_attr_rw_nvmem = {
> +	.attr	= {
> +		.name	= "nvmem",
> +		.mode	= 0644,
> +	},
> +	.read	= bin_attr_nvmem_read,
> +	.write	= bin_attr_nvmem_write,
> +};
> +
> +static struct bin_attribute *nvmem_bin_rw_attributes[] = {
> +	&bin_attr_rw_nvmem,
> +	NULL,
> +};
> +
> +static const struct attribute_group nvmem_bin_rw_group = {
> +	.bin_attrs	= nvmem_bin_rw_attributes,
> +	.attrs		= nvmem_attrs,
> +};
> +
> +static const struct attribute_group *nvmem_rw_dev_groups[] = {
> +	&nvmem_bin_rw_group,
> +	NULL,
> +};
> +
> +/* read only permission */
> +static struct bin_attribute bin_attr_ro_nvmem = {
> +	.attr	= {
> +		.name	= "nvmem",
> +		.mode	= 0444,
> +	},
> +	.read	= bin_attr_nvmem_read,
> +};
> +
> +static struct bin_attribute *nvmem_bin_ro_attributes[] = {
> +	&bin_attr_ro_nvmem,
> +	NULL,
> +};
> +
> +static const struct attribute_group nvmem_bin_ro_group = {
> +	.bin_attrs	= nvmem_bin_ro_attributes,
> +	.attrs		= nvmem_attrs,
> +};
> +
> +static const struct attribute_group *nvmem_ro_dev_groups[] = {
> +	&nvmem_bin_ro_group,
> +	NULL,
> +};
> +
> +/* default read/write permissions, root only */
> +static struct bin_attribute bin_attr_rw_root_nvmem = {
> +	.attr	= {
> +		.name	= "nvmem",
> +		.mode	= 0600,
> +	},
> +	.read	= bin_attr_nvmem_read,
> +	.write	= bin_attr_nvmem_write,
> +};
> +
> +static struct bin_attribute *nvmem_bin_rw_root_attributes[] = {
> +	&bin_attr_rw_root_nvmem,
> +	NULL,
> +};
> +
> +static const struct attribute_group nvmem_bin_rw_root_group = {
> +	.bin_attrs	= nvmem_bin_rw_root_attributes,
> +	.attrs		= nvmem_attrs,
> +};
> +
> +static const struct attribute_group *nvmem_rw_root_dev_groups[] = {
> +	&nvmem_bin_rw_root_group,
> +	NULL,
> +};
> +
> +/* read only permission, root only */
> +static struct bin_attribute bin_attr_ro_root_nvmem = {
> +	.attr	= {
> +		.name	= "nvmem",
> +		.mode	= 0400,
> +	},
> +	.read	= bin_attr_nvmem_read,
> +};
> +
> +static struct bin_attribute *nvmem_bin_ro_root_attributes[] = {
> +	&bin_attr_ro_root_nvmem,
> +	NULL,
> +};
> +
> +static const struct attribute_group nvmem_bin_ro_root_group = {
> +	.bin_attrs	= nvmem_bin_ro_root_attributes,
> +	.attrs		= nvmem_attrs,
> +};
> +
> +static const struct attribute_group *nvmem_ro_root_dev_groups[] = {
> +	&nvmem_bin_ro_root_group,
> +	NULL,
> +};
> +
> +const struct attribute_group **nvmem_sysfs_get_groups(
> +					struct nvmem_device *nvmem,
> +					const struct nvmem_config *config)
> +{
> +	if (config->root_only)
> +		return nvmem->read_only ?
> +			nvmem_ro_root_dev_groups :
> +			nvmem_rw_root_dev_groups;
> +
> +	return nvmem->read_only ? nvmem_ro_dev_groups : nvmem_rw_dev_groups;
> +}
> +
> +/*
> + * nvmem_setup_compat() - Create an additional binary entry in
> + * drivers sys directory, to be backwards compatible with the older
> + * drivers/misc/eeprom drivers.
> + */
> +int nvmem_sysfs_setup_compat(struct nvmem_device *nvmem,
> +			      const struct nvmem_config *config)
> +{
> +	int rval;
> +
> +	if (!config->compat)
> +		return 0;
> +
> +	if (!config->base_dev)
> +		return -EINVAL;
> +
> +	if (nvmem->read_only)
> +		nvmem->eeprom = bin_attr_ro_root_nvmem;
> +	else
> +		nvmem->eeprom = bin_attr_rw_root_nvmem;
> +	nvmem->eeprom.attr.name = "eeprom";
> +	nvmem->eeprom.size = nvmem->size;
> +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> +	nvmem->eeprom.attr.key = &eeprom_lock_key;
> +#endif
> +	nvmem->eeprom.private = &nvmem->dev;
> +	nvmem->base_dev = config->base_dev;
> +
> +	rval = device_create_bin_file(nvmem->base_dev, &nvmem->eeprom);
> +	if (rval) {
> +		dev_err(&nvmem->dev,
> +			"Failed to create eeprom binary file %d\n", rval);
> +		return rval;
> +	}
> +
> +	nvmem->flags |= FLAG_COMPAT;
> +
> +	return 0;
> +}
> +
> +void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem,
> +			      const struct nvmem_config *config)
> +{
> +	if (config->compat)
> +		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
> +}
> diff --git a/drivers/nvmem/nvmem.h b/drivers/nvmem/nvmem.h
> new file mode 100644
> index 000000000000..eb8ed7121fa3
> --- /dev/null
> +++ b/drivers/nvmem/nvmem.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _DRIVERS_NVMEM_H
> +#define _DRIVERS_NVMEM_H
> +
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/nvmem-provider.h>
> +
> +struct nvmem_device {
> +	struct module		*owner;
> +	struct device		dev;
> +	int			stride;
> +	int			word_size;
> +	int			id;
> +	struct kref		refcnt;
> +	size_t			size;
> +	bool			read_only;
> +	int			flags;
> +	enum nvmem_type		type;
> +	struct bin_attribute	eeprom;
> +	struct device		*base_dev;
> +	struct list_head	cells;
> +	nvmem_reg_read_t	reg_read;
> +	nvmem_reg_write_t	reg_write;
> +	void *priv;
> +};
> +
> +#define to_nvmem_device(d) container_of(d, struct nvmem_device, dev)
> +#define FLAG_COMPAT		BIT(0)
> +
> +#ifdef CONFIG_NVMEM_SYSFS
> +const struct attribute_group **nvmem_sysfs_get_groups(
> +					struct nvmem_device *nvmem,
> +					const struct nvmem_config *config);
> +int nvmem_sysfs_setup_compat(struct nvmem_device *nvmem,
> +			      const struct nvmem_config *config);
> +void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem,
> +			      const struct nvmem_config *config);
> +#else
> +static inline const struct attribute_group **nvmem_sysfs_get_groups(
> +					struct nvmem_device *nvmem,
> +					const struct nvmem_config *config)
> +{
> +	return NULL;
> +}
> +
> +static inline int nvmem_sysfs_setup_compat(struct nvmem_device *nvmem,
> +				      const struct nvmem_config *config)
> +{
> +	return -ENOSYS;
> +}
> +static inline void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem,
> +			      const struct nvmem_config *config)
> +{
> +}
> +#endif /* CONFIG_NVMEM_SYSFS */
> +
> +#endif /* _DRIVERS_NVMEM_H */
> 

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
