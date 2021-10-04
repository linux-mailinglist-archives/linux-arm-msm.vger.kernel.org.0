Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149BA420A21
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 13:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233029AbhJDLdZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 07:33:25 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:59677 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232978AbhJDLdZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 07:33:25 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 01DB658046F;
        Mon,  4 Oct 2021 07:31:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 04 Oct 2021 07:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=huE1skr6IBIpRFUeCW+oO+hQ5YC
        wcBxJqfJ8uJPS8IU=; b=BQhV1VHR8Prj3fO24qDdubTGRXHvmOwjSldbo1zuqjk
        F88W7bk6J3U11hDSnCNMcu8UKg35899s7+6KM2LheHq3S0i/oF3Nk6kkTISVBhTy
        nACMJq+/nav/AeUXlNokvyc0ZHRbjLhA4j94BvDCF84qkjPFPXrEWrNLCEbpnMUF
        ZTfnmSMMsCQB17WjHLKzof6HgLFxVWj/kHiynTmudvWnnrpCeiseqMW82FHXFmFE
        5Y2svbb5WYo8IM4X7fIl1uWpiwAOjlODZQHP9OPQ69MyP6RCr3oqiUyK/+IjVdXc
        nLUEWr+8A11MXLK6RndVUDBN1cEDnSQMWA3kiqIiRVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=huE1sk
        r6IBIpRFUeCW+oO+hQ5YCwcBxJqfJ8uJPS8IU=; b=ALn2gPnktDp5ltd5ONMtEu
        IkWwg9Puqy2SJ/0tp7u7sjFBF2DdUVS+rvHzUnUhbJaq6cVjbCF1rMU/Q33ig6ui
        mwsopzLu6JGEMXovb0d5pzfIpggeGhsamEUCHd40r8VMCZdugoQdKlmyi/W4Tdvz
        y3zCpMZZxBamkNliwh9Gm9f7z8fOG35egApJtKctHKv2XCNq5w61c37nyLcMgsuh
        55LgwGvUcOvvNoiYhF2NxnOEVU9BhQxIZt6oVXoln8B+Y5swCzAaCt6HdaQ5CaDS
        u0jDoHnYGExJfcrchQt5wu0ETTvpvMrhe4YwwtOXsUwJTSFz7vYLq8Fmqxhb4xNg
        ==
X-ME-Sender: <xms:F-ZaYdkKhLlOQp5pTad0gTPBcy8S2oAa75ziP9UTJ3jsfOyecYzzYQ>
    <xme:F-ZaYY2w-RSCNEnKuTGJ5bOm46tJErum2PAW46U7OoE5gLB5qv9Nbk74L39ECi6Dp
    wZrO1ycVKOoAQ>
X-ME-Received: <xmr:F-ZaYToyS0I5XlIf9q74RGFT9ZOGsmUyequMbQQaVk0TklCIKBsIj838ade9e3kkVK0n-tqsA1VP3IpdutXbh3Luf7_6uHzi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:F-ZaYdnqf6c-fu2YzSsM8Sv1d1xZ5EmlXQEVH0EDpNazS9HWG6ZbKg>
    <xmx:F-ZaYb24xSgZzNKeRvoro3cj_UVw1tlD1Yx2VCGrcUO1GRJm_n6wfA>
    <xmx:F-ZaYcsSTLUb8apRhJ-W4TB9XcFUey61-Mq9_o37n0t48a7kGfEDYQ>
    <xmx:F-ZaYeA69iOpha-jBnTvh4YS0f9FPX5IQmPxoCE5OAD03FNHKFSZ8Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Oct 2021 07:31:34 -0400 (EDT)
Date:   Mon, 4 Oct 2021 13:31:33 +0200
From:   Greg KH <greg@kroah.com>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, ckadabi@codeaurora.org,
        tsoni@codeaurora.org, bryanh@codeaurora.org,
        psodagud@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 4/7] usb: common: eud: Added the driver support for
 Embedded USB Debugger(EUD)
Message-ID: <YVrmFfnSx4oMAqTg@kroah.com>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <e6df4a21a283e822d15dedb7ffb3ae62c241999c.1633343547.git.schowdhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6df4a21a283e822d15dedb7ffb3ae62c241999c.1633343547.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 04, 2021 at 04:46:22PM +0530, Souradeep Chowdhury wrote:
> Add support for control peripheral of EUD (Embedded USB Debugger) to
> listen to events such as USB attach/detach, pet EUD to indicate software
> is functional.Reusing the platform device kobj, sysfs entry 'enable' is
> created to enable or disable EUD.
> 
> To enable the eud the following needs to be done
> echo 1 > /sys/bus/platform/.../enable
> 
> To disable eud, following is the command
> echo 0 > /sys/bus/platform/.../enable
> 
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  Documentation/ABI/testing/sysfs-driver-eud |   7 +
>  drivers/usb/common/Kconfig                 |   9 +
>  drivers/usb/common/Makefile                |   1 +
>  drivers/usb/common/qcom_eud.c              | 256 +++++++++++++++++++++++++++++
>  4 files changed, 273 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-eud
>  create mode 100644 drivers/usb/common/qcom_eud.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
> new file mode 100644
> index 0000000..14a02da
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-eud
> @@ -0,0 +1,7 @@
> +What:		/sys/bus/platform/.../enable

Um, that's a _very_ generic regex, you just matched with any platform
device that might have a "enable" sysfs entry :(

Please use the dwc's name in here to help out with figuring this out.

> +Date:           October 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>

No tabs?

> +Description:
> +		The Enable/Disable sysfs interface for Embedded
> +		USB Debugger(EUD).This enables and disables the
> +		EUD based on a 1 or a 0 value.

What does enabling or disabling actually do?

And please use a ' ' after a '.'.

> diff --git a/drivers/usb/common/Kconfig b/drivers/usb/common/Kconfig
> index 5e8a04e..669b3fe 100644
> --- a/drivers/usb/common/Kconfig
> +++ b/drivers/usb/common/Kconfig
> @@ -50,3 +50,12 @@ config USB_CONN_GPIO
> 
>  	  To compile the driver as a module, choose M here: the module will
>  	  be called usb-conn-gpio.ko
> +
> +config USB_QCOM_EUD
> +	tristate "USB EUD Driver"
> +	select USB_ROLE_SWITCH
> +	help
> +	  This module enables support for Qualcomm Technologies, Inc.
> +	  Embedded USB Debugger (EUD). The EUD is a control peripheral
> +	  which reports VBUS attach/detach events and has USB-based
> +	  debug and trace capabilities.

What is the module name if this is built?

> diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
> index 8ac4d21..eb66045 100644
> --- a/drivers/usb/common/Makefile
> +++ b/drivers/usb/common/Makefile
> @@ -11,3 +11,4 @@ usb-common-$(CONFIG_USB_LED_TRIG) += led.o
>  obj-$(CONFIG_USB_CONN_GPIO)	+= usb-conn-gpio.o
>  obj-$(CONFIG_USB_OTG_FSM) += usb-otg-fsm.o
>  obj-$(CONFIG_USB_ULPI_BUS)	+= ulpi.o
> +obj-$(CONFIG_USB_QCOM_EUD)      += qcom_eud.o
> diff --git a/drivers/usb/common/qcom_eud.c b/drivers/usb/common/qcom_eud.c
> new file mode 100644
> index 0000000..7a92fff
> --- /dev/null
> +++ b/drivers/usb/common/qcom_eud.c
> @@ -0,0 +1,256 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>
> +#include <linux/usb/role.h>
> +
> +#define EUD_REG_INT1_EN_MASK	0x0024
> +#define EUD_REG_INT_STATUS_1	0x0044
> +#define EUD_REG_CTL_OUT_1	0x0074
> +#define EUD_REG_VBUS_INT_CLR	0x0080
> +#define EUD_REG_CSR_EUD_EN	0x1014
> +#define EUD_REG_SW_ATTACH_DET	0x1018
> +#define EUD_REG_EUD_EN2         0x0000
> +
> +#define EUD_ENABLE		BIT(0)
> +#define EUD_INT_PET_EUD		BIT(0)
> +#define EUD_INT_VBUS		BIT(2)
> +#define EUD_INT_SAFE_MODE	BIT(4)
> +#define EUD_INT_ALL		(EUD_INT_VBUS|EUD_INT_SAFE_MODE)
> +
> +struct eud_chip {
> +	struct device			*dev;
> +	struct usb_role_switch		*role_sw;
> +	void __iomem			*eud_reg_base;
> +	void __iomem			*eud_mode_mgr2_phys_base;
> +	unsigned int			int_status;
> +	int				enable;

bool?

> +	int				eud_irq;
> +	bool				usb_attach;
> +

No need for a blank line.

> +};
> +
> +static int enable_eud(struct eud_chip *priv)
> +{
> +	writel(EUD_ENABLE, priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
> +	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
> +			priv->eud_reg_base + EUD_REG_INT1_EN_MASK);
> +	writel(1, priv->eud_mode_mgr2_phys_base + EUD_REG_EUD_EN2);
> +
> +	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
> +}
> +
> +static void disable_eud(struct eud_chip *priv)
> +{
> +	writel(0, priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
> +	writel(0, priv->eud_mode_mgr2_phys_base + EUD_REG_EUD_EN2);
> +}
> +
> +static ssize_t enable_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct eud_chip *chip = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%d", chip->enable);

sysfs_emit() please.

> +}
> +
> +static ssize_t enable_store(struct device *dev,
> +		struct device_attribute *attr,
> +		const char *buf, size_t count)
> +{
> +	struct eud_chip *chip = dev_get_drvdata(dev);
> +	unsigned long enable;
> +	int ret;
> +
> +	if (kstrtoul(buf, 16, &enable))
> +		return -EINVAL;

Use the default sysfs function to parse 0/1/y/n/Y/N please.

> +
> +	if (enable == 1) {
> +		ret = enable_eud(chip);
> +		if (!ret)
> +			chip->enable = enable;
> +	} else if (enable == 0) {
> +		disable_eud(chip);
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(enable);
> +
> +static const struct device_attribute *eud_attrs[] = {
> +	&dev_attr_enable,
> +	NULL,
> +};

You create a list of attributes and then never use it?

Who reviewed this thing?

You were so close in getting this right, see below...

> +
> +static void usb_attach_detach(struct eud_chip *chip)
> +{
> +	u32 reg;
> +
> +	/* read ctl_out_1[4] to find USB attach or detach event */
> +	reg = readl(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
> +	if (reg & EUD_INT_SAFE_MODE)
> +		chip->usb_attach = true;
> +	else
> +		chip->usb_attach = false;
> +
> +	/* set and clear vbus_int_clr[0] to clear interrupt */
> +	writel(BIT(0), chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
> +	writel(0, chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
> +}
> +
> +static void pet_eud(struct eud_chip *chip)
> +{
> +	u32 reg;
> +	int ret;
> +
> +	/* read sw_attach_det[0] to find attach/detach event */
> +	reg = readl(chip->eud_reg_base +  EUD_REG_SW_ATTACH_DET);
> +	if (reg & EUD_INT_PET_EUD) {
> +		/* Detach & Attach pet for EUD */
> +		writel(0, chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
> +		/* Delay to make sure detach pet is done before attach pet */
> +		ret = readl_poll_timeout(chip->eud_reg_base + EUD_REG_SW_ATTACH_DET,
> +					reg, (reg == 0), 1, 100);
> +		if (ret) {
> +			dev_err(chip->dev, "Detach pet failed\n");
> +			return;
> +		}
> +
> +		writel(EUD_INT_PET_EUD, chip->eud_reg_base +
> +				EUD_REG_SW_ATTACH_DET);
> +	} else {
> +		/* Attach pet for EUD */
> +		writel(EUD_INT_PET_EUD, chip->eud_reg_base +
> +				EUD_REG_SW_ATTACH_DET);
> +	}
> +}
> +
> +static irqreturn_t handle_eud_irq(int irq, void *data)
> +{
> +	struct eud_chip *chip = data;
> +	u32 reg;
> +
> +	/* read status register and find out which interrupt triggered */
> +	reg = readl(chip->eud_reg_base +  EUD_REG_INT_STATUS_1);
> +	switch (reg & EUD_INT_ALL) {
> +	case EUD_INT_VBUS:
> +		chip->int_status = EUD_INT_VBUS;
> +		usb_attach_detach(chip);
> +		return IRQ_WAKE_THREAD;
> +	case EUD_INT_SAFE_MODE:
> +		pet_eud(chip);
> +		break;
> +	default:
> +		return IRQ_NONE;
> +	}
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t handle_eud_irq_thread(int irq, void *data)
> +{
> +	struct eud_chip *chip = data;
> +	int ret;
> +
> +	if (chip->int_status == EUD_INT_VBUS) {
> +		if (chip->usb_attach)
> +			ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
> +		else
> +			ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
> +		if (ret)
> +			dev_err(chip->dev, "failed to set role switch\n");
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int eud_probe(struct platform_device *pdev)
> +{
> +	struct eud_chip *chip;
> +	int ret;
> +
> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev = &pdev->dev;
> +
> +	chip->role_sw = usb_role_switch_get(chip->dev);
> +	if (IS_ERR(chip->role_sw)) {
> +		if (PTR_ERR(chip->role_sw) != -EPROBE_DEFER)
> +			dev_err(chip->dev, "failed to get role switch\n");
> +
> +		return PTR_ERR(chip->role_sw);
> +	}
> +
> +	chip->eud_reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(chip->eud_reg_base))
> +		return PTR_ERR(chip->eud_reg_base);
> +
> +	chip->eud_mode_mgr2_phys_base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(chip->eud_mode_mgr2_phys_base))
> +		return PTR_ERR(chip->eud_mode_mgr2_phys_base);
> +
> +	chip->eud_irq = platform_get_irq(pdev, 0);
> +	ret = devm_request_threaded_irq(&pdev->dev, chip->eud_irq, handle_eud_irq,
> +			handle_eud_irq_thread, IRQF_ONESHOT, NULL, chip);
> +	if (ret)
> +		return ret;
> +
> +	device_init_wakeup(&pdev->dev, true);
> +	enable_irq_wake(chip->eud_irq);
> +
> +	platform_set_drvdata(pdev, chip);
> +
> +	ret = device_create_file(&pdev->dev, eud_attrs[0]);

You raced with userspace and lost :(

Please properly attach the sysfs file to the platform driver to have the
driver core register this correctly.

> +
> +	return ret;
> +}
> +
> +static int eud_remove(struct platform_device *pdev)
> +{
> +	struct eud_chip *chip = platform_get_drvdata(pdev);
> +
> +	if (chip->enable)
> +		disable_eud(chip);
> +
> +	device_remove_file(&pdev->dev, eud_attrs[0]);

No need for this if you do the above correctly.

> +	device_init_wakeup(&pdev->dev, false);

Why is this needed?

thanks,

greg k-h
