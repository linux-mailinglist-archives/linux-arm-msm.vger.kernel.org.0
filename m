Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A453243F357
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 01:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbhJ1XPX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 19:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbhJ1XPW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 19:15:22 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB608C061570;
        Thu, 28 Oct 2021 16:12:54 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id k7so12857088wrd.13;
        Thu, 28 Oct 2021 16:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hKYcRqHq1+Te+TTtYqy9QynvD4ID9iEaHncjHJYCs94=;
        b=HJPZ4LaZI+cAjBBgy685AOHSZ9C6uG4rrsrjIBCDWiQhteXVjayDv+dPZJqZz5nqDM
         XbWPhe+EtUOSdl7lcg+pib4hp9Br5KiNvMgSr73o+6nYGiCkVZGbFQiafZGXGbpEVYPb
         xU6okGn+TwFDXC20oXEkbo+OHXf90XgvzRUkKDxkUSDx5uJe2JKlN18NO8Kii2weLkbE
         zyDte0cpOKg2aaR/mY0MhpHowwBrqLAvseMKnFmuDcJimRbiFgZVe2XoEEYYZ1UI/CJ3
         IMjR7IoGoVPohlHCENJHseecl9zHi/9ZIjkobTZYg/jaOt1qT605Zklza06L4Xy4AT6C
         SJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hKYcRqHq1+Te+TTtYqy9QynvD4ID9iEaHncjHJYCs94=;
        b=c4oKtv4/kozvFGEDswph75qxNE/yNdPK6KeuoBw31iZCtAnknZVJ8zA6AifMfDKjtX
         enSHyj4/za/5BFQk4xgBS+SVVsoAvoitQF85Wfc/2gwhsUqdw8kfUzCVWM6IxdyrzF19
         GviKvSsAGOACrk3wgNIedAdSmw4bJbq5sc46HM0xf+H3IzPaSZqV5AUL6EHotj4Y3FGy
         6Ojg7dw6VXovRt1gyvCmAw3s1v5ETqDvHsiLiHnkaoZi5I+EKAGqls+ENpkg8YB9BLnW
         fd14YsYFe/hELUPcSSwue+q0zv/GXX2vB/5R+HBQufmenB3nGfAz2RuLsY01JTf+hFlf
         qTCg==
X-Gm-Message-State: AOAM53293171DRVMgeXhGrVpgp8es5xVutuzE71y/FipWVWllTs/i1gY
        /juwGXRhVh8O1/kMKC4d/ONGYoF0y/0=
X-Google-Smtp-Source: ABdhPJz/QfZ5mflDHra7m/1YfefgWIw1Jrydl4zv8/mxa7QhgrFcIMmPqlpKRI7gI9Bu6VfAvJTx8Q==
X-Received: by 2002:adf:f291:: with SMTP id k17mr9350717wro.34.1635462773393;
        Thu, 28 Oct 2021 16:12:53 -0700 (PDT)
Received: from [192.168.2.202] (pd9e5a5e1.dip0.t-ipconnect.de. [217.229.165.225])
        by smtp.gmail.com with ESMTPSA id u20sm3098385wmq.3.2021.10.28.16.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 16:12:53 -0700 (PDT)
Message-ID: <fd367719-425b-a22d-d0a2-213e62310a89@gmail.com>
Date:   Fri, 29 Oct 2021 01:12:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/3] platform: surface: Add surface xbl
Content-Language: en-US
To:     Jarrett Schultz <jaschultzms@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
References: <20211028211753.573480-1-jaschultzMS@gmail.com>
 <20211028211753.573480-3-jaschultzMS@gmail.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20211028211753.573480-3-jaschultzMS@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/28/21 23:17, Jarrett Schultz wrote:
> Introduce support for the Extensible Boot Loader driver found on the
> Surface Duo. Makes device information available to users via sysfs.
> 
> Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>

In addition to the comments of Andy and Randy:

  - Your S-o-b address doesn't match the address you've sent this from.

  - Are you aware that the platform/surface directory as a whole depends
    on CONFIG_ACPI? As I understand it this patch is intended for an ARM
    device with DT/OF, so you might want to add a patch that moves the
    CONFIG_ACPI dependency to the individual drivers. A dependency of
    CONFIG_ACPI for the XBL driver seems rather unnecessary.

> ---
>   .../ABI/testing/sysfs-platform-surface-xbl    |  78 ++++++
>   MAINTAINERS                                   |   9 +
>   drivers/platform/surface/Kconfig              |  10 +
>   drivers/platform/surface/Makefile             |   1 +
>   drivers/platform/surface/surface-xbl.c        | 223 ++++++++++++++++++
>   5 files changed, 321 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-platform-surface-xbl
>   create mode 100644 drivers/platform/surface/surface-xbl.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-surface-xbl b/Documentation/ABI/testing/sysfs-platform-surface-xbl
> new file mode 100644
> index 000000000000..d3104dbbc6c1
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-surface-xbl
> @@ -0,0 +1,78 @@
> +What:		/sys/devices/platform/146bfa94.xbl/battery_present
> +Date:		October 2021
> +KernelVersion:	5.15
> +Contact:	jaschultz@microsoft.com
> +Description:
> +		Read only. It returns whether the battery is present. Valid
> +		values are:
> +			0 - battery absent
> +			1 - battery present
> +
> +What:		/sys/devices/platform/146bfa94.xbl/board_id
> +Date:		October 2021
> +KernelVersion:	5.15
> +Contact:	jaschultz@microsoft.com
> +Description:
> +		Read only. It returns the board id.
> +
> +What:		/sys/devices/platform/146bfa94.xbl/hw_init_retries
> +Date:		October 2021
> +KernelVersion:	5.15
> +Contact:	jaschultz@microsoft.com
> +Description:
> +		Read only. It returns retries attempted to initialize the
> +		discrete hardware circuit.
> +
> +What:		/sys/devices/platform/146bfa94.xbl/is_act_mode
> +Date:		October 2021
> +KernelVersion:	5.15
> +Contact:	jaschultz@microsoft.com
> +Description:
> +		Read only. It returns whether ACT mode is enabled. Valid values
> +		are:
> +			0 - ACT disabled
> +			1 - ACT enabled
> +
> +		ACT mode is used to run checks and put the device to shipmode
> +		at factory.
> +
> +What:		/sys/devices/platform/146bfa94.xbl/is_customer_mode
> +Date:		October 2021
> +KernelVersion:	5.15
> +Contact:	jaschultz@microsoft.com
> +Description:
> +		Read only. It returns whether the device is in manufacturing
> +		mode. Valid values are:
> +			0 - Not in manufacturing mode
> +			1 - In manufacturing mode
> +
> +What:		/sys/devices/platform/146bfa94.xbl/ocp_error_location
> +Date:		October 2021
> +KernelVersion:	5.15
> +Contact:	jaschultz@microsoft.com
> +Description:
> +		Read only. It returns 0 or which power rail has the OCP error.
> +		Valid values are:
> +			Bit(s)		Meaning
> +			15		More than one OCP error occurred
> +			14-12		PMIC
> +			11-7		SMPS
> +			6-2		LDO
> +			1-0		BOB
> +
> +What:		/sys/devices/platform/146bfa94.xbl/pmic_reset_reason
> +Date:		October 2021
> +KernelVersion:	5.15
> +Contact:	jaschultz@microsoft.com
> +Description:
> +		Read only. It returns the reason for the reset. Valid values
> +		are:
> +			0 - no reason lol
> +			9 - Battery driver triggered
> +
> +What:		/sys/devices/platform/146bfa94.xbl/touch_fw_version
> +Date:		October 2021
> +KernelVersion:	5.15
> +Contact:	jaschultz@microsoft.com
> +Description:
> +		Read only. It returns the version of the firmware.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eeb4c70b3d5b..d08b68d626f6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12423,6 +12423,15 @@ F:	Documentation/driver-api/surface_aggregator/clients/dtx.rst
>   F:	drivers/platform/surface/surface_dtx.c
>   F:	include/uapi/linux/surface_aggregator/dtx.h
>   
> +MICROSOFT SURFACE DUO XBL DRIVER
> +M:	Jarrett Schultz <jaschultz@microsoft.com>
> +L:	linux-arm-msm@vger.kernel.org
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	Documentation/ABI/testing/sysfs-platform-surface-xbl
> +F:	Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> +F:	drivers/platform/surface/surface-xbl.c
> +
>   MICROSOFT SURFACE GPE LID SUPPORT DRIVER
>   M:	Maximilian Luz <luzmaximilian@gmail.com>
>   L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
> index 3105f651614f..ca0546397414 100644
> --- a/drivers/platform/surface/Kconfig
> +++ b/drivers/platform/surface/Kconfig
> @@ -180,6 +180,16 @@ config SURFACE_PRO3_BUTTON
>   	help
>   	  This driver handles the power/home/volume buttons on the Microsoft Surface Pro 3/4 tablet.
>   
> +config SURFACE_XBL
> +	tristate "Surface XBL Driver"
> +	depends on ARM64 || COMPILE_TEST
> +	help
> +	  If you say 'Y' to this option, support will be included for the
> +	  Surface XBL Driver.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called surface-xbl.
> +
>   source "drivers/platform/surface/aggregator/Kconfig"
>   
>   endif # SURFACE_PLATFORMS
> diff --git a/drivers/platform/surface/Makefile b/drivers/platform/surface/Makefile
> index 32889482de55..1ed5808301e9 100644
> --- a/drivers/platform/surface/Makefile
> +++ b/drivers/platform/surface/Makefile
> @@ -16,3 +16,4 @@ obj-$(CONFIG_SURFACE_GPE)		+= surface_gpe.o
>   obj-$(CONFIG_SURFACE_HOTPLUG)		+= surface_hotplug.o
>   obj-$(CONFIG_SURFACE_PLATFORM_PROFILE)	+= surface_platform_profile.o
>   obj-$(CONFIG_SURFACE_PRO3_BUTTON)	+= surfacepro3_button.o
> +obj-$(CONFIG_SURFACE_XBL)		+= surface-xbl.o
> diff --git a/drivers/platform/surface/surface-xbl.c b/drivers/platform/surface/surface-xbl.c
> new file mode 100644
> index 000000000000..910287f0c987
> --- /dev/null
> +++ b/drivers/platform/surface/surface-xbl.c
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * surface-xbl.c - Surface E(x)tensible (B)oot(l)oader
> + *
> + * Copyright (C) 2021 Microsoft Corporation
> + * Author: Jarrett Schultz <jaschultz@microsoft.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/kstrtox.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#define SURFACE_XBL_MAX_VERSION_LEN	16
> +#define SURFACE_XBL_BOARD_ID		0
> +#define SURFACE_XBL_BATTERY_PRESENT	1
> +#define SURFACE_XBL_HW_INIT_RETRIES	2
> +#define SURFACE_XBL_IS_CUSTOMER_MODE	3
> +#define SURFACE_XBL_IS_ACT_MODE		4
> +#define SURFACE_XBL_PMIC_RESET_REASON	5
> +#define SURFACE_XBL_TOUCH_FW_VERSION	6
> +#define SURFACE_XBL_OCP_ERROR_LOCATION	((SURFACE_XBL_TOUCH_FW_VERSION) +\
> +					(SURFACE_XBL_MAX_VERSION_LEN))
> +
> +struct surface_xbl {
> +	struct device	*dev;
> +	void __iomem	*regs;
> +
> +	u8		board_id;
> +	u8		battery_present;
> +	u8		hw_init_retries;
> +	u8		is_customer_mode;
> +	u8		is_act_mode;
> +	u8		pmic_reset_reason;
> +	char		touch_fw_version[SURFACE_XBL_MAX_VERSION_LEN];
> +	u16		ocp_error_location;
> +} __packed;
> +
> +static ssize_t
> +board_id_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", sxbl->board_id);
> +}
> +static DEVICE_ATTR_RO(board_id);
> +
> +static ssize_t
> +battery_present_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", sxbl->battery_present);
> +}
> +static DEVICE_ATTR_RO(battery_present);
> +
> +static ssize_t
> +hw_init_retries_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", sxbl->hw_init_retries);
> +}
> +static DEVICE_ATTR_RO(hw_init_retries);
> +
> +static ssize_t
> +is_customer_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", sxbl->is_customer_mode);
> +}
> +static DEVICE_ATTR_RO(is_customer_mode);
> +
> +static ssize_t
> +is_act_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", sxbl->is_act_mode);
> +}
> +static DEVICE_ATTR_RO(is_act_mode);
> +
> +static ssize_t
> +pmic_reset_reason_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", sxbl->pmic_reset_reason);
> +}
> +static DEVICE_ATTR_RO(pmic_reset_reason);
> +
> +static ssize_t
> +touch_fw_version_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "0x%s\n", sxbl->touch_fw_version);
> +}
> +static DEVICE_ATTR_RO(touch_fw_version);
> +
> +static ssize_t
> +ocp_error_location_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", sxbl->ocp_error_location);
> +}
> +static DEVICE_ATTR_RO(ocp_error_location);
> +
> +static struct attribute *inputs_attrs[] = {
> +	&dev_attr_board_id.attr,
> +	&dev_attr_battery_present.attr,
> +	&dev_attr_hw_init_retries.attr,
> +	&dev_attr_is_customer_mode.attr,
> +	&dev_attr_is_act_mode.attr,
> +	&dev_attr_pmic_reset_reason.attr,
> +	&dev_attr_touch_fw_version.attr,
> +	&dev_attr_ocp_error_location.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group inputs_attr_group = {
> +	.attrs = inputs_attrs,
> +};
> +
> +static u8 surface_xbl_readb(void __iomem *base, u32 offset)
> +{
> +	return readb(base + offset);
> +}
> +
> +static u16 surface_xbl_readw(void __iomem *base, u32 offset)
> +{
> +	return readw(base + offset);
> +}
> +
> +static int surface_xbl_probe(struct platform_device *pdev)
> +{
> +	struct surface_xbl	*sxbl;
> +	struct device		*dev;
> +	void __iomem		*regs;
> +	int					index;
> +	int					retval;
> +
> +	dev = &pdev->dev;
> +	sxbl = devm_kzalloc(dev, sizeof(*sxbl), GFP_KERNEL);
> +	if (!sxbl)
> +		return -ENOMEM;
> +
> +	sxbl->dev = dev;
> +
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	sxbl->regs = regs;
> +
> +	platform_set_drvdata(pdev, sxbl);
> +
> +	sxbl->board_id = surface_xbl_readb(sxbl->regs,
> +					   SURFACE_XBL_BOARD_ID);
> +	sxbl->battery_present = surface_xbl_readb(sxbl->regs,
> +						  SURFACE_XBL_BATTERY_PRESENT);
> +	sxbl->hw_init_retries = surface_xbl_readb(sxbl->regs,
> +						  SURFACE_XBL_HW_INIT_RETRIES);
> +	sxbl->is_customer_mode = surface_xbl_readb(sxbl->regs,
> +						   SURFACE_XBL_IS_CUSTOMER_MODE);
> +	sxbl->is_act_mode = surface_xbl_readb(sxbl->regs,
> +					      SURFACE_XBL_IS_ACT_MODE);
> +	sxbl->pmic_reset_reason = surface_xbl_readb(sxbl->regs,
> +						    SURFACE_XBL_PMIC_RESET_REASON);
> +
> +	for (index = 0; index < SURFACE_XBL_MAX_VERSION_LEN; index++)
> +		sxbl->touch_fw_version[index] = surface_xbl_readb(sxbl->regs,
> +							SURFACE_XBL_TOUCH_FW_VERSION + index);
> +
> +	sxbl->ocp_error_location = surface_xbl_readw(sxbl->regs,
> +						     SURFACE_XBL_OCP_ERROR_LOCATION);
> +
> +	retval = sysfs_create_group(&sxbl->dev->kobj, &inputs_attr_group);
> +	if (retval < 0) {
> +		dev_dbg(sxbl->dev,
> +			"Can't register sysfs attr group: %d\n", retval);
> +		return retval;
> +	}
> +
> +	return 0;
> +}
> +
> +static int surface_xbl_remove(struct platform_device *pdev)
> +{
> +	sysfs_remove_group(&pdev->dev.kobj, &inputs_attr_group);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id surface_xbl_of_match[] = {
> +	{
> +		.compatible = "microsoft,sm8150-surface-duo-xbl"
> +	},
> +	{  }, /* Terminating Entry */
> +};
> +MODULE_DEVICE_TABLE(of, surface_xbl_of_match);
> +#endif
> +
> +static struct platform_driver surface_xbl_driver = {
> +	.probe		= surface_xbl_probe,
> +	.remove		= surface_xbl_remove,
> +	.driver		= {
> +		.name	= "surface-xbl",
> +		.of_match_table = of_match_ptr(surface_xbl_of_match),
> +	},
> +};
> +
> +module_platform_driver(surface_xbl_driver);
> +
> +MODULE_AUTHOR("Jarrett Schultz <jaschultz@microsoft.com>");
> +MODULE_DESCRIPTION("Surface Extensible Bootloader");
> +MODULE_LICENSE("GPL");
> 
