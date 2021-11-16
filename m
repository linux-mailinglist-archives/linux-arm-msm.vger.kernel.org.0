Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E68B453C1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 23:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhKPWIB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 17:08:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbhKPWIB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 17:08:01 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A203C061570;
        Tue, 16 Nov 2021 14:05:04 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so3464821pja.1;
        Tue, 16 Nov 2021 14:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nTpcWMwSXaygMQ4EjDDaHCb2+I8WxS2EofMS4e7/Klg=;
        b=iQwQH9g+mKXSnbKE/QoRHxK3ey5fyXIJRNaJdLamal3tjcdMwf1ihuWRUrSclR14/R
         4nnDGuJrEeFn3unibj+NJKIReT3PT0Erg4Fa6KLioyF1AolVcrSeTkI4I8fmV7zTBnYv
         usuLUumcsguqxVu1H9z3g3NY9U1QcDQhFcbycH0bOTN1sOl1fMAOlqO5g7XQjpIANbEw
         tXbz6WqcUl1MJQYhIngC68Kzex9xmqHIImHXmgL3JNVf/nB1Bb2XrvKYB/4efDJ5m2iZ
         D5nVw1QAboUhMuA58AXpTQ9pfGy5HRPRQn/efE0lxnm55OdTzbZWWrO60og0TuUbvGX3
         8OiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nTpcWMwSXaygMQ4EjDDaHCb2+I8WxS2EofMS4e7/Klg=;
        b=wWjX6Z+CiwbxVavx9rmAj+yaG/5krdgwgQ5sgIUHMVewKzH7ItRQZFTp6uz2+9ZQhv
         +G5xb0GPA5UpPcNgamJOJ2CLh2cWtHBKMckmeFMJjANrvBeKSpwbp4Lu2TMkYHYKn6W+
         ngu0S/afwKjcLwwTliYJ2eEJruAD5rx9p1yvxDUMbFl+kXwxQIF5wu0yiucDq5p2Vj91
         MY/I7hFy1vZLKB7FJcc8Rwa+RKw40CBfbiz46CkATfnfIOzT6mXW/QadyjZb3GwVfVtH
         wc0gi0jdN5lqE5+Ko1Qweq0KtaoeDxQtUbIabZrCYodB7O9yO1d/ko851aUtcJvURXcN
         fqGg==
X-Gm-Message-State: AOAM532HtR9Ss/cGEPNkRuxHFvbGdXTvEu6TBovzcIgSns2rSn/QKNxr
        sV3Phw4B/hmPrtxQbyfExPPibeDZ2I8=
X-Google-Smtp-Source: ABdhPJzZNrEvCTk1m2Iv+PDMsqzmWJPjC2wNyzp7FC9JSavXtgXmJ9ouvv4K3sOIlGzD0m8PWbk/tA==
X-Received: by 2002:a17:90b:33d0:: with SMTP id lk16mr2973814pjb.66.1637100303508;
        Tue, 16 Nov 2021 14:05:03 -0800 (PST)
Received: from jaschultz-Thelio-Major ([2001:4898:80e8:b:9571:5a5d:56f2:a842])
        by smtp.gmail.com with ESMTPSA id h194sm19139728pfe.156.2021.11.16.14.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 14:05:02 -0800 (PST)
From:   Jarrett Schultz <jaschultzms@gmail.com>
X-Google-Original-From: Jarrett Schultz <jaschultzMS@gmail.com>
Date:   Tue, 16 Nov 2021 14:05:01 -0800
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: Re: [PATCH v2 3/5] platform: surface: Add surface xbl
Message-ID: <20211116220501.GA432529@jaschultz-Thelio-Major>
References: <20211108164449.3036210-1-jaschultz@microsoft.com>
 <20211108164449.3036210-4-jaschultz@microsoft.com>
 <YYlu+HqTJ/ZY1C2+@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYlu+HqTJ/ZY1C2+@ripper>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 08, 2021 at 10:39:52AM -0800, Bjorn Andersson wrote:
> On Mon 08 Nov 08:44 PST 2021, Jarrett Schultz wrote:
> 
> > Introduce support for the Extensible Boot Loader driver found on the
> > Surface Duo. Makes device information available to users via sysfs.
> > 
> > Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> > 
> > ---
> > 
> > Changes in v2:
> >  - Added types.h inclusion and removed unused inclusions
> >  - Minor updates to code and acronym style
> >  - Remove __packed attribute on driver struct
> >  - Use .dev_groups for sysfs
> >  - Added more in-depth description of driver in Kconfig
> >  - Changed target KernelVersion in sysfs documentation
> > 
> > ---
> > 
> >  .../ABI/testing/sysfs-platform-surface-xbl    |  78 +++++++
> >  MAINTAINERS                                   |   2 +
> >  drivers/platform/surface/Kconfig              |  12 +
> >  drivers/platform/surface/Makefile             |   1 +
> >  drivers/platform/surface/surface-xbl.c        | 215 ++++++++++++++++++
> >  5 files changed, 308 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-platform-surface-xbl
> >  create mode 100644 drivers/platform/surface/surface-xbl.c
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-platform-surface-xbl b/Documentation/ABI/testing/sysfs-platform-surface-xbl
> > new file mode 100644
> > index 000000000000..2ae047b884d3
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-platform-surface-xbl
> > @@ -0,0 +1,78 @@
> > +What:		/sys/devices/platform/146bfa94.xbl/battery_present
> > +Date:		October 2021
> > +KernelVersion:	5.16
> > +Contact:	jaschultz@microsoft.com
> > +Description:
> > +		Read only. It returns whether the battery is present. Valid
> > +		values are:
> > +			0 - battery absent
> > +			1 - battery present
> 
> Would this information not be available from some battery driver, under
> /sys/class/power_supply?
> 

See below under touch_fw_version.

> > +
> > +What:		/sys/devices/platform/146bfa94.xbl/board_id
> > +Date:		October 2021
> > +KernelVersion:	5.16
> > +Contact:	jaschultz@microsoft.com
> > +Description:
> > +		Read only. It returns the board id.
> 
> Is this a Microsoft-specific board id, or does it relate to the Qualcomm
> socinfo property with the same name?
> 

Microsoft-specific board id. I will include this in the new description.

> > +
> > +What:		/sys/devices/platform/146bfa94.xbl/hw_init_retries
> > +Date:		October 2021
> > +KernelVersion:	5.16
> > +Contact:	jaschultz@microsoft.com
> > +Description:
> > +		Read only. It returns retries attempted to initialize the
> > +		discrete hardware circuit.
> 
> Which description hardware circuit?
> 

This is a Microsoft specific value for the battery charging subsystem. I
will include this in the new description.

> > +
> > +What:		/sys/devices/platform/146bfa94.xbl/is_act_mode
> > +Date:		October 2021
> > +KernelVersion:	5.16
> > +Contact:	jaschultz@microsoft.com
> > +Description:
> > +		Read only. It returns whether ACT mode is enabled. Valid values
> > +		are:
> > +			0 - ACT disabled
> > +			1 - ACT enabled
> > +
> > +		ACT mode is used to run checks and put the device to shipmode
> > +		at factory.
> > +
> > +What:		/sys/devices/platform/146bfa94.xbl/is_customer_mode
> > +Date:		October 2021
> > +KernelVersion:	5.16
> > +Contact:	jaschultz@microsoft.com
> > +Description:
> > +		Read only. It returns whether the device is in manufacturing
> > +		mode. Valid values are:
> > +			0 - Not in manufacturing mode
> > +			1 - In manufacturing mode
> > +
> > +What:		/sys/devices/platform/146bfa94.xbl/ocp_error_location
> > +Date:		October 2021
> > +KernelVersion:	5.16
> > +Contact:	jaschultz@microsoft.com
> > +Description:
> > +		Read only. It returns 0 or which power rail has the OCP error.
> 
> Sounds like the reason is singular, so why is this a bitmask?
> 

There are multiple power rails so if there is an error, the value will
be the power rail which had the error.

> > +		Valid values are:
> > +			Bit(s)		Meaning
> > +			15		More than one OCP error occurred
> > +			14-12		PMIC
> > +			11-7		SMPS
> > +			6-2		LDO
> > +			1-0		BOB
> > +
> > +What:		/sys/devices/platform/146bfa94.xbl/pmic_reset_reason
> > +Date:		October 2021
> > +KernelVersion:	5.16
> > +Contact:	jaschultz@microsoft.com
> > +Description:
> > +		Read only. It returns the reason for the reset. Valid values
> > +		are:
> 
> Is this different from the PMIC reset reason that we read from the PMIC?
> Could we make sure to expose this generically for all Qualcomm PMICs?
> 

This is the same as the one read from PMIC. This information should be
exposed generically for all Qualcomm PMICs. Here is some information
from my colleague about the value:

 - It is provided by QC (ResetRuntimeDxe driver in QComPkg)
 - Protocol GUID: gEfiResetReasonProtocolGuid
 - API: ReadPmicRegisterForResetReason
    * Local Protocol: gQcomPmicPwrOnProtocolGuid
    * Get Value: PmicPwrOnProtocol->GetSpareReg (PRIMARY_PMIC, EFI_PM_PON_SOFT_SPARE, &Value);

> > +			0 - no reason lol
> > +			9 - Battery driver triggered
> > +
> > +What:		/sys/devices/platform/146bfa94.xbl/touch_fw_version
> > +Date:		October 2021
> > +KernelVersion:	5.16
> > +Contact:	jaschultz@microsoft.com
> > +Description:
> > +		Read only. It returns the version of the firmware.
> 
> Why isn't this exposed by the touchscreen driver instead?
> 
> 
> Generally I wonder how you're consuming this information in userspace.
> Is it only for debugging purposes, i.e. would debugfs be a better place?
>

The information exposed through this driver is used in manufacturing
mode when producing the device.

Please let me know if you need additional information. All your other
other comments will be addressed in the next version, thank you for
your continued feedback.

> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8643546f8fab..d08b68d626f6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12428,7 +12428,9 @@ M:	Jarrett Schultz <jaschultz@microsoft.com>
> >  L:	linux-arm-msm@vger.kernel.org
> >  L:	platform-driver-x86@vger.kernel.org
> >  S:	Supported
> > +F:	Documentation/ABI/testing/sysfs-platform-surface-xbl
> >  F:	Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> > +F:	drivers/platform/surface/surface-xbl.c
> >  
> >  MICROSOFT SURFACE GPE LID SUPPORT DRIVER
> >  M:	Maximilian Luz <luzmaximilian@gmail.com>
> > diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
> > index 0d3970e1d144..3a1ced269d96 100644
> > --- a/drivers/platform/surface/Kconfig
> > +++ b/drivers/platform/surface/Kconfig
> > @@ -190,6 +190,18 @@ config SURFACE_PRO3_BUTTON
> >  	help
> >  	  This driver handles the power/home/volume buttons on the Microsoft Surface Pro 3/4 tablet.
> >  
> > +config SURFACE_XBL
> > +        tristate "Surface XBL Driver"
> > +        depends on ARM64 || COMPILE_TEST
> > +        depends on OF
> > +        help
> > +          If you say 'Y' to this option, support will be included for the
> > +          Surface Extensible Boot Loader (XBL) Driver. This driver exposes
> > +          information about the device through sysfs.
> > +
> > +          This driver can also be built as a module.  If so, the module
> > +          will be called surface-xbl.
> > +
> >  source "drivers/platform/surface/aggregator/Kconfig"
> >  
> >  endif # SURFACE_PLATFORMS
> > diff --git a/drivers/platform/surface/Makefile b/drivers/platform/surface/Makefile
> > index 32889482de55..0946266a8a73 100644
> > --- a/drivers/platform/surface/Makefile
> > +++ b/drivers/platform/surface/Makefile
> > @@ -16,3 +16,4 @@ obj-$(CONFIG_SURFACE_GPE)		+= surface_gpe.o
> >  obj-$(CONFIG_SURFACE_HOTPLUG)		+= surface_hotplug.o
> >  obj-$(CONFIG_SURFACE_PLATFORM_PROFILE)	+= surface_platform_profile.o
> >  obj-$(CONFIG_SURFACE_PRO3_BUTTON)	+= surfacepro3_button.o
> > +obj-$(CONFIG_SURFACE_XBL)               += surface-xbl.o
> 
> All other files in this directory are named with an underscore, would be
> nice to carry on with such convention.
> 
> > diff --git a/drivers/platform/surface/surface-xbl.c b/drivers/platform/surface/surface-xbl.c
> > new file mode 100644
> > index 000000000000..9ecec4e55a4d
> > --- /dev/null
> > +++ b/drivers/platform/surface/surface-xbl.c
> > @@ -0,0 +1,215 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Surface eXtensible Boot Loader (XBL)
> > + *
> > + * Copyright (C) 2021 Microsoft Corporation
> > + * Author: Jarrett Schultz <jaschultz@microsoft.com>
> > + */
> > +
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/types.h>
> > +
> > +#define SURFACE_XBL_MAX_VERSION_LEN	16
> > +#define SURFACE_XBL_BOARD_ID		0
> > +#define SURFACE_XBL_BATTERY_PRESENT	1
> > +#define SURFACE_XBL_HW_INIT_RETRIES	2
> > +#define SURFACE_XBL_IS_CUSTOMER_MODE	3
> > +#define SURFACE_XBL_IS_ACT_MODE		4
> > +#define SURFACE_XBL_PMIC_RESET_REASON	5
> > +#define SURFACE_XBL_TOUCH_FW_VERSION	6
> > +#define SURFACE_XBL_OCP_ERROR_LOCATION		\
> > +		(SURFACE_XBL_TOUCH_FW_VERSION +	\
> > +		SURFACE_XBL_MAX_VERSION_LEN)
> > +
> > +struct surface_xbl {
> > +	struct device	*dev;
> > +	void __iomem	*regs;
> > +
> > +	u8		board_id;
> > +	u8		battery_present;
> > +	u8		hw_init_retries;
> > +	u8		is_customer_mode;
> > +	u8		is_act_mode;
> > +	u8		pmic_reset_reason;
> > +	char		touch_fw_version[SURFACE_XBL_MAX_VERSION_LEN];
> > +	u16		ocp_error_location;
> > +};
> > +
> > +static ssize_t
> > +board_id_show(struct device *dev, struct device_attribute *attr, char *buf)
> 
> I think it would be nice to avoid some duplication by putting all these
> integer ones in a single show(), see e.g. soc_info_show()
> 
> > +{
> > +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "%d\n", sxbl->board_id);
> > +}
> > +static DEVICE_ATTR_RO(board_id);
> > +
> > +static ssize_t
> > +battery_present_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "%d\n", sxbl->battery_present);
> > +}
> > +static DEVICE_ATTR_RO(battery_present);
> > +
> > +static ssize_t
> > +hw_init_retries_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "%d\n", sxbl->hw_init_retries);
> > +}
> > +static DEVICE_ATTR_RO(hw_init_retries);
> > +
> > +static ssize_t
> > +is_customer_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "%d\n", sxbl->is_customer_mode);
> > +}
> > +static DEVICE_ATTR_RO(is_customer_mode);
> > +
> > +static ssize_t
> > +is_act_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "%d\n", sxbl->is_act_mode);
> > +}
> > +static DEVICE_ATTR_RO(is_act_mode);
> > +
> > +static ssize_t
> > +pmic_reset_reason_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "%d\n", sxbl->pmic_reset_reason);
> > +}
> > +static DEVICE_ATTR_RO(pmic_reset_reason);
> > +
> > +static ssize_t
> > +touch_fw_version_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "0x%s\n", sxbl->touch_fw_version);
> > +}
> > +static DEVICE_ATTR_RO(touch_fw_version);
> > +
> > +static ssize_t
> > +ocp_error_location_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "%d\n", sxbl->ocp_error_location);
> > +}
> > +static DEVICE_ATTR_RO(ocp_error_location);
> > +
> > +static struct attribute *xbl_attrs[] = {
> > +	&dev_attr_board_id.attr,
> > +	&dev_attr_battery_present.attr,
> > +	&dev_attr_hw_init_retries.attr,
> > +	&dev_attr_is_customer_mode.attr,
> > +	&dev_attr_is_act_mode.attr,
> > +	&dev_attr_pmic_reset_reason.attr,
> > +	&dev_attr_touch_fw_version.attr,
> > +	&dev_attr_ocp_error_location.attr,
> > +	NULL
> > +};
> > +
> > +static const struct attribute_group xbl_attr_group = {
> > +	.attrs = xbl_attrs,
> > +};
> > +
> > +const struct attribute_group *xbl_sysfs_groups[] = {
> > +	&xbl_attr_group,
> > +	NULL
> > +};
> > +
> > +static u8 surface_xbl_readb(void __iomem *base, u32 offset)
> > +{
> > +	return readb(base + offset);
> 
> Instead of having these helpers I think you should just call readb(base
> + offset) directly below.
> 
> The shorter function name (readb vs surface_xbl_readb) means that you
> don't even need to line wrap those lines.
> 
> > +}
> > +
> > +static u16 surface_xbl_readw(void __iomem *base, u32 offset)
> > +{
> > +	return readw(base + offset);
> > +}
> > +
> > +static int surface_xbl_probe(struct platform_device *pdev)
> > +{
> > +	struct surface_xbl	*sxbl;
> > +	struct device		*dev;
> > +	void __iomem		*regs;
> > +	int			index;
> > +
> > +	dev = &pdev->dev;
> > +	sxbl = devm_kzalloc(dev, sizeof(*sxbl), GFP_KERNEL);
> 
> This is the only use of &pdev->dev, so put that here and drop "dev" from
> sxbl (and the stack).
> 
> > +	if (!sxbl)
> > +		return -ENOMEM;
> > +
> > +	sxbl->dev = dev;
> > +
> > +	regs = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(regs))
> > +		return PTR_ERR(regs);
> > +
> > +	sxbl->regs = regs;
> 
> Seems only reason you stash "regs" in sxbl is so that you can pass
> sxbl->regs in below function calls. I.e. it's a local variable and you
> can omit it from struct surface_xbl...
> 
> > +
> > +	platform_set_drvdata(pdev, sxbl);
> > +
> > +	sxbl->board_id = surface_xbl_readb(sxbl->regs,
> > +					   SURFACE_XBL_BOARD_ID);
> > +	sxbl->battery_present = surface_xbl_readb(sxbl->regs,
> > +						  SURFACE_XBL_BATTERY_PRESENT);
> > +	sxbl->hw_init_retries = surface_xbl_readb(sxbl->regs,
> > +						  SURFACE_XBL_HW_INIT_RETRIES);
> > +	sxbl->is_customer_mode = surface_xbl_readb(sxbl->regs,
> > +						   SURFACE_XBL_IS_CUSTOMER_MODE);
> > +	sxbl->is_act_mode = surface_xbl_readb(sxbl->regs,
> > +					      SURFACE_XBL_IS_ACT_MODE);
> > +	sxbl->pmic_reset_reason = surface_xbl_readb(sxbl->regs,
> > +						    SURFACE_XBL_PMIC_RESET_REASON);
> > +
> > +	for (index = 0; index < SURFACE_XBL_MAX_VERSION_LEN; index++)
> 
> "i" is a good succinct variable name for an index.
> 
> > +		sxbl->touch_fw_version[index] = surface_xbl_readb(sxbl->regs,
> > +							SURFACE_XBL_TOUCH_FW_VERSION + index);
> > +
> > +	sxbl->ocp_error_location = surface_xbl_readw(sxbl->regs,
> > +						     SURFACE_XBL_OCP_ERROR_LOCATION);
> > +
> > +	return 0;
> > +}
> > +
> > +static int surface_xbl_remove(struct platform_device *pdev)
> 
> Your remove function is empty, simply omit it...
> 
> Regards,
> Bjorn
> 
> > +{
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id surface_xbl_of_match[] = {
> > +	{
> > +		.compatible = "microsoft,sm8150-surface-duo-xbl"
> > +	},
> > +	{  }
> > +};
> > +MODULE_DEVICE_TABLE(of, surface_xbl_of_match);
> > +
> > +static struct platform_driver surface_xbl_driver = {
> > +	.driver	= {
> > +		.name		= "surface-xbl",
> > +		.of_match_table = surface_xbl_of_match,
> > +		.dev_groups	= xbl_sysfs_groups
> > +	},
> > +	.probe		= surface_xbl_probe,
> > +	.remove		= surface_xbl_remove
> > +};
> > +module_platform_driver(surface_xbl_driver);
> > +
> > +MODULE_AUTHOR("Jarrett Schultz <jaschultz@microsoft.com>");
> > +MODULE_DESCRIPTION("Surface Extensible Bootloader");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.25.1
> > 
