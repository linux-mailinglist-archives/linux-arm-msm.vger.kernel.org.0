Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13120422747
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 15:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234761AbhJENDS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 09:03:18 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:38846 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233365AbhJENDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 09:03:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633438884; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=LZweFgUzCLruRQSKdctiwYf0bITb8qFZlgKQzicABKY=;
 b=naBOZj48Iqlvho36icnepwl1X2u+P4yMXWCKH7bucoYGSa1BThnCfGlQXsBBDIhB9RGqys3H
 utjmN2aJDNUMewu0YuHEUBexD9XgmYNPKVJsAR+gtzZBaHgnNpokkMypEMpqO5BYg5xZx1pk
 J6JFdlG33SpQDJfSWCfiFpuWtgs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 615c4ca4713d5d6f963bfb58 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 13:01:24
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 687DDC43616; Tue,  5 Oct 2021 13:01:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E95CCC43460;
        Tue,  5 Oct 2021 13:01:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Oct 2021 18:31:21 +0530
From:   schowdhu@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        satyap@codeaurora.org, pheragu@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 4/7] usb: common: eud: Added the driver support for
 Embedded USB Debugger(EUD)
In-Reply-To: <YVsu602phHbZLMOT@ripper>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <e6df4a21a283e822d15dedb7ffb3ae62c241999c.1633343547.git.schowdhu@codeaurora.org>
 <YVsu602phHbZLMOT@ripper>
Message-ID: <aceadaa142a3cb29d7e7069268f19302@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-04 22:12, Bjorn Andersson wrote:
> On Mon 04 Oct 04:16 PDT 2021, Souradeep Chowdhury wrote:
> 
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
>> +Date:           October 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +		The Enable/Disable sysfs interface for Embedded
>> +		USB Debugger(EUD).This enables and disables the
>> +		EUD based on a 1 or a 0 value.
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
>> +	int				eud_irq;
>> +	bool				usb_attach;
>> +
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
> 
> How does this work if I have a Type-C controller wired up to the dwc3
> and it has negotiated that we're supposed to be in device mode?
> 
> Shouldn't this driver somehow work as an override only when EUD is
> enabled, but otherwise let the Type-C controller deal with things?
> 
> Or is this interrupt simply not delivered when EUD is disabled, so that
> it happens to work as expected?

That is correct. When EUD is disabled, the interrupt lines are also 
disabled.

> 
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
> 
> Please use
> 		dev_err_probe(chip->dev, PTR_ERR(chip->role_sw), "failed to...\n");

Ack

> 
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
> 
> This deserved another dev_err_probe()

Ack

> 
> Thanks,
> Bjorn
> 
>> +		return ret;
>> +
>> +	device_init_wakeup(&pdev->dev, true);
>> +	enable_irq_wake(chip->eud_irq);
>> +
>> +	platform_set_drvdata(pdev, chip);
>> +
>> +	ret = device_create_file(&pdev->dev, eud_attrs[0]);
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
>> +	device_init_wakeup(&pdev->dev, false);
>> +	disable_irq_wake(chip->eud_irq);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id eud_dt_match[] = {
>> +	{ .compatible = "qcom,usb-connector-eud" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, eud_dt_match);
>> +
>> +static struct platform_driver eud_driver = {
>> +	.probe		= eud_probe,
>> +	.remove		= eud_remove,
>> +	.driver		= {
>> +		.name		= "eud",
>> +		.of_match_table = eud_dt_match,
>> +	},
>> +};
>> +module_platform_driver(eud_driver);
>> +
>> +MODULE_DESCRIPTION("QTI EUD driver");
>> +MODULE_LICENSE("GPL v2");
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
