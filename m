Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECED642271F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 14:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233666AbhJEM4D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 08:56:03 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42532 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbhJEM4C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 08:56:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633438452; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DFOQEpDY1dT56+uHR/OIQHPigOs3hAlH3nd1nr4Apus=;
 b=AzN6rTYzp7jIhPv73nrf2PXBT23cgN3927Y72tSzPDR+Yv6N/MAy6hRx5tPwrtaXsGuiMHci
 3ARehBUZek5NeihtkHFotgv95BJNGHhAiG6hxrjYh1FXkbNQbXbtdH5nYdQmnVG8EGE14ajj
 FlX+9R0bLH2GTbgev2AwC177rJc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 615c4aefb62327f2cb56e584 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 12:54:07
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A6D65C43616; Tue,  5 Oct 2021 12:54:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 22282C43460;
        Tue,  5 Oct 2021 12:54:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Oct 2021 18:24:04 +0530
From:   schowdhu@codeaurora.org
To:     Greg KH <greg@kroah.com>
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
In-Reply-To: <YVrmFfnSx4oMAqTg@kroah.com>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <e6df4a21a283e822d15dedb7ffb3ae62c241999c.1633343547.git.schowdhu@codeaurora.org>
 <YVrmFfnSx4oMAqTg@kroah.com>
Message-ID: <e2113bf7902ae40bd6e49292e67faba7@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-04 17:01, Greg KH wrote:
> On Mon, Oct 04, 2021 at 04:46:22PM +0530, Souradeep Chowdhury wrote:
>> Add support for control peripheral of EUD (Embedded USB Debugger) to
>> listen to events such as USB attach/detach, pet EUD to indicate 
>> software
>> is functional.Reusing the platform device kobj, sysfs entry 'enable' 
>> is
>> created to enable or disable EUD.
>> 
>> To enable the eud the following needs to be done
>> echo 1 > /sys/bus/platform/.../enable
>> 
>> To disable eud, following is the command
>> echo 0 > /sys/bus/platform/.../enable
>> 
>> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
>> ---
>>  Documentation/ABI/testing/sysfs-driver-eud |   7 +
>>  drivers/usb/common/Kconfig                 |   9 +
>>  drivers/usb/common/Makefile                |   1 +
>>  drivers/usb/common/qcom_eud.c              | 256 
>> +++++++++++++++++++++++++++++
>>  4 files changed, 273 insertions(+)
>>  create mode 100644 Documentation/ABI/testing/sysfs-driver-eud
>>  create mode 100644 drivers/usb/common/qcom_eud.c
>> 
>> diff --git a/Documentation/ABI/testing/sysfs-driver-eud 
>> b/Documentation/ABI/testing/sysfs-driver-eud
>> new file mode 100644
>> index 0000000..14a02da
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-eud
>> @@ -0,0 +1,7 @@
>> +What:		/sys/bus/platform/.../enable
> 
> Um, that's a _very_ generic regex, you just matched with any platform
> device that might have a "enable" sysfs entry :(
> 
> Please use the dwc's name in here to help out with figuring this out.

Ack

> 
>> +Date:           October 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> 
> No tabs?
> 
>> +Description:
>> +		The Enable/Disable sysfs interface for Embedded
>> +		USB Debugger(EUD).This enables and disables the
>> +		EUD based on a 1 or a 0 value.
> 
> What does enabling or disabling actually do?
> 
> And please use a ' ' after a '.'.

Ack. On enabling, the debug mode is set for EUD. EUD is a mux, that sits 
between the connector and the
controller, routing UTMI signals to an internal USB hub, which in-turn 
has debug functions attached to
the hub. On disabling, this routing stops as EUD gets disabled.

> 
>> diff --git a/drivers/usb/common/Kconfig b/drivers/usb/common/Kconfig
>> index 5e8a04e..669b3fe 100644
>> --- a/drivers/usb/common/Kconfig
>> +++ b/drivers/usb/common/Kconfig
>> @@ -50,3 +50,12 @@ config USB_CONN_GPIO
>> 
>>  	  To compile the driver as a module, choose M here: the module will
>>  	  be called usb-conn-gpio.ko
>> +
>> +config USB_QCOM_EUD
>> +	tristate "USB EUD Driver"
>> +	select USB_ROLE_SWITCH
>> +	help
>> +	  This module enables support for Qualcomm Technologies, Inc.
>> +	  Embedded USB Debugger (EUD). The EUD is a control peripheral
>> +	  which reports VBUS attach/detach events and has USB-based
>> +	  debug and trace capabilities.
> 
> What is the module name if this is built?

Ack. The module name for this is same as the driver name qcom_eud.ko, 
will update the same here.

> 
>> diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
>> index 8ac4d21..eb66045 100644
>> --- a/drivers/usb/common/Makefile
>> +++ b/drivers/usb/common/Makefile
>> @@ -11,3 +11,4 @@ usb-common-$(CONFIG_USB_LED_TRIG) += led.o
>>  obj-$(CONFIG_USB_CONN_GPIO)	+= usb-conn-gpio.o
>>  obj-$(CONFIG_USB_OTG_FSM) += usb-otg-fsm.o
>>  obj-$(CONFIG_USB_ULPI_BUS)	+= ulpi.o
>> +obj-$(CONFIG_USB_QCOM_EUD)      += qcom_eud.o
>> diff --git a/drivers/usb/common/qcom_eud.c 
>> b/drivers/usb/common/qcom_eud.c
>> new file mode 100644
>> index 0000000..7a92fff
>> --- /dev/null
>> +++ b/drivers/usb/common/qcom_eud.c
>> @@ -0,0 +1,256 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2015-2021, The Linux Foundation. All rights 
>> reserved.
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/usb/role.h>
>> +
>> +#define EUD_REG_INT1_EN_MASK	0x0024
>> +#define EUD_REG_INT_STATUS_1	0x0044
>> +#define EUD_REG_CTL_OUT_1	0x0074
>> +#define EUD_REG_VBUS_INT_CLR	0x0080
>> +#define EUD_REG_CSR_EUD_EN	0x1014
>> +#define EUD_REG_SW_ATTACH_DET	0x1018
>> +#define EUD_REG_EUD_EN2         0x0000
>> +
>> +#define EUD_ENABLE		BIT(0)
>> +#define EUD_INT_PET_EUD		BIT(0)
>> +#define EUD_INT_VBUS		BIT(2)
>> +#define EUD_INT_SAFE_MODE	BIT(4)
>> +#define EUD_INT_ALL		(EUD_INT_VBUS|EUD_INT_SAFE_MODE)
>> +
>> +struct eud_chip {
>> +	struct device			*dev;
>> +	struct usb_role_switch		*role_sw;
>> +	void __iomem			*eud_reg_base;
>> +	void __iomem			*eud_mode_mgr2_phys_base;
>> +	unsigned int			int_status;
>> +	int				enable;
> 
> bool?

Ack.

> 
>> +	int				eud_irq;
>> +	bool				usb_attach;
>> +
> 
> No need for a blank line.

Ack

> 
>> +};
>> +
>> +static int enable_eud(struct eud_chip *priv)
>> +{
>> +	writel(EUD_ENABLE, priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
>> +	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
>> +			priv->eud_reg_base + EUD_REG_INT1_EN_MASK);
>> +	writel(1, priv->eud_mode_mgr2_phys_base + EUD_REG_EUD_EN2);
>> +
>> +	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
>> +}
>> +
>> +static void disable_eud(struct eud_chip *priv)
>> +{
>> +	writel(0, priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
>> +	writel(0, priv->eud_mode_mgr2_phys_base + EUD_REG_EUD_EN2);
>> +}
>> +
>> +static ssize_t enable_show(struct device *dev,
>> +		struct device_attribute *attr, char *buf)
>> +{
>> +	struct eud_chip *chip = dev_get_drvdata(dev);
>> +
>> +	return sprintf(buf, "%d", chip->enable);
> 
> sysfs_emit() please.

Ack

> 
>> +}
>> +
>> +static ssize_t enable_store(struct device *dev,
>> +		struct device_attribute *attr,
>> +		const char *buf, size_t count)
>> +{
>> +	struct eud_chip *chip = dev_get_drvdata(dev);
>> +	unsigned long enable;
>> +	int ret;
>> +
>> +	if (kstrtoul(buf, 16, &enable))
>> +		return -EINVAL;
> 
> Use the default sysfs function to parse 0/1/y/n/Y/N please.

Ack

> 
>> +
>> +	if (enable == 1) {
>> +		ret = enable_eud(chip);
>> +		if (!ret)
>> +			chip->enable = enable;
>> +	} else if (enable == 0) {
>> +		disable_eud(chip);
>> +	} else {
>> +		return -EINVAL;
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(enable);
>> +
>> +static const struct device_attribute *eud_attrs[] = {
>> +	&dev_attr_enable,
>> +	NULL,
>> +};
> 
> You create a list of attributes and then never use it?
> 
> Who reviewed this thing?
> 
> You were so close in getting this right, see below...

Ack

> 
>> +
>> +static void usb_attach_detach(struct eud_chip *chip)
>> +{
>> +	u32 reg;
>> +
>> +	/* read ctl_out_1[4] to find USB attach or detach event */
>> +	reg = readl(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
>> +	if (reg & EUD_INT_SAFE_MODE)
>> +		chip->usb_attach = true;
>> +	else
>> +		chip->usb_attach = false;
>> +
>> +	/* set and clear vbus_int_clr[0] to clear interrupt */
>> +	writel(BIT(0), chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
>> +	writel(0, chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
>> +}
>> +
>> +static void pet_eud(struct eud_chip *chip)
>> +{
>> +	u32 reg;
>> +	int ret;
>> +
>> +	/* read sw_attach_det[0] to find attach/detach event */
>> +	reg = readl(chip->eud_reg_base +  EUD_REG_SW_ATTACH_DET);
>> +	if (reg & EUD_INT_PET_EUD) {
>> +		/* Detach & Attach pet for EUD */
>> +		writel(0, chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
>> +		/* Delay to make sure detach pet is done before attach pet */
>> +		ret = readl_poll_timeout(chip->eud_reg_base + 
>> EUD_REG_SW_ATTACH_DET,
>> +					reg, (reg == 0), 1, 100);
>> +		if (ret) {
>> +			dev_err(chip->dev, "Detach pet failed\n");
>> +			return;
>> +		}
>> +
>> +		writel(EUD_INT_PET_EUD, chip->eud_reg_base +
>> +				EUD_REG_SW_ATTACH_DET);
>> +	} else {
>> +		/* Attach pet for EUD */
>> +		writel(EUD_INT_PET_EUD, chip->eud_reg_base +
>> +				EUD_REG_SW_ATTACH_DET);
>> +	}
>> +}
>> +
>> +static irqreturn_t handle_eud_irq(int irq, void *data)
>> +{
>> +	struct eud_chip *chip = data;
>> +	u32 reg;
>> +
>> +	/* read status register and find out which interrupt triggered */
>> +	reg = readl(chip->eud_reg_base +  EUD_REG_INT_STATUS_1);
>> +	switch (reg & EUD_INT_ALL) {
>> +	case EUD_INT_VBUS:
>> +		chip->int_status = EUD_INT_VBUS;
>> +		usb_attach_detach(chip);
>> +		return IRQ_WAKE_THREAD;
>> +	case EUD_INT_SAFE_MODE:
>> +		pet_eud(chip);
>> +		break;
>> +	default:
>> +		return IRQ_NONE;
>> +	}
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>> +{
>> +	struct eud_chip *chip = data;
>> +	int ret;
>> +
>> +	if (chip->int_status == EUD_INT_VBUS) {
>> +		if (chip->usb_attach)
>> +			ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
>> +		else
>> +			ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
>> +		if (ret)
>> +			dev_err(chip->dev, "failed to set role switch\n");
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int eud_probe(struct platform_device *pdev)
>> +{
>> +	struct eud_chip *chip;
>> +	int ret;
>> +
>> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
>> +	if (!chip)
>> +		return -ENOMEM;
>> +
>> +	chip->dev = &pdev->dev;
>> +
>> +	chip->role_sw = usb_role_switch_get(chip->dev);
>> +	if (IS_ERR(chip->role_sw)) {
>> +		if (PTR_ERR(chip->role_sw) != -EPROBE_DEFER)
>> +			dev_err(chip->dev, "failed to get role switch\n");
>> +
>> +		return PTR_ERR(chip->role_sw);
>> +	}
>> +
>> +	chip->eud_reg_base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(chip->eud_reg_base))
>> +		return PTR_ERR(chip->eud_reg_base);
>> +
>> +	chip->eud_mode_mgr2_phys_base = devm_platform_ioremap_resource(pdev, 
>> 1);
>> +	if (IS_ERR(chip->eud_mode_mgr2_phys_base))
>> +		return PTR_ERR(chip->eud_mode_mgr2_phys_base);
>> +
>> +	chip->eud_irq = platform_get_irq(pdev, 0);
>> +	ret = devm_request_threaded_irq(&pdev->dev, chip->eud_irq, 
>> handle_eud_irq,
>> +			handle_eud_irq_thread, IRQF_ONESHOT, NULL, chip);
>> +	if (ret)
>> +		return ret;
>> +
>> +	device_init_wakeup(&pdev->dev, true);
>> +	enable_irq_wake(chip->eud_irq);
>> +
>> +	platform_set_drvdata(pdev, chip);
>> +
>> +	ret = device_create_file(&pdev->dev, eud_attrs[0]);
> 
> You raced with userspace and lost :(
> 
> Please properly attach the sysfs file to the platform driver to have 
> the
> driver core register this correctly.

Ok.

> 
>> +
>> +	return ret;
>> +}
>> +
>> +static int eud_remove(struct platform_device *pdev)
>> +{
>> +	struct eud_chip *chip = platform_get_drvdata(pdev);
>> +
>> +	if (chip->enable)
>> +		disable_eud(chip);
>> +
>> +	device_remove_file(&pdev->dev, eud_attrs[0]);
> 
> No need for this if you do the above correctly.

Ack.

> 
>> +	device_init_wakeup(&pdev->dev, false);
> 
> Why is this needed?

This is already handled in device_unregister() path so will remove this.

> 
> thanks,
> 
> greg k-h
