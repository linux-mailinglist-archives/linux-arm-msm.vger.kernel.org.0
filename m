Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEC11604CC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2020 17:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgBPQWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Feb 2020 11:22:40 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:45942 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728293AbgBPQWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Feb 2020 11:22:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581870159; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=z5I5zS6zumjhWa7snoKGqo4MqOgClmCxSgr84mzSxM4=; b=bfSIkzPNnqFnpwYuQeKViT+9aOmFKCrMND/vF6/5WYjT2kfUNXf1T29oqirQToKSuiVaSVfF
 5KhNcriq2Gj+EZGt4eFMNTGz2RCJVgTDFXXOkjUtuh1tIXAB5A85FK4BkMnLFW1MQ+UfT4ZE
 cw/Ei/u+XKvpw0O1l3IGW290fSw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e496c44.7fb78347e6c0-smtp-out-n03;
 Sun, 16 Feb 2020 16:22:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 17D1CC433A2; Sun, 16 Feb 2020 16:22:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [103.140.231.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akdwived)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 53F98C43383;
        Sun, 16 Feb 2020 16:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 53F98C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akdwived@codeaurora.org
Subject: Re: [PATCH v4 2/2] Embedded USB Debugger (EUD) driver
To:     Greg KH <greg@kroah.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        rnayak@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org
References: <1580445811-15948-1-git-send-email-akdwived@codeaurora.org>
 <1580445811-15948-3-git-send-email-akdwived@codeaurora.org>
 <20200207100438.GA627905@kroah.com>
From:   "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <06d21fa5-0115-9478-5cf1-e710446f8311@codeaurora.org>
Date:   Sun, 16 Feb 2020 21:52:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200207100438.GA627905@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/7/2020 3:34 PM, Greg KH wrote:
> On Fri, Jan 31, 2020 at 10:13:31AM +0530, Avaneesh Kumar Dwivedi wrote:
>> Add support for control peripheral of EUD (Embedded USB Debugger) to
>> listen to events such as USB attach/detach, charger enable/disable, pet
>> EUD to indicate software is functional. Reusing the platform device kobj,
>> sysfs entry 'enable' is created to enable or disable EUD.
>>
>> Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
>> Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
>>   Documentation/ABI/stable/sysfs-driver-msm-eud |   5 +
>>   drivers/soc/qcom/Kconfig                      |  12 +
>>   drivers/soc/qcom/Makefile                     |   1 +
>>   drivers/soc/qcom/eud.c                        | 329 ++++++++++++++++++++++++++
>>   4 files changed, 347 insertions(+)
>>   create mode 100644 Documentation/ABI/stable/sysfs-driver-msm-eud
>>   create mode 100644 drivers/soc/qcom/eud.c
>>
>> diff --git a/Documentation/ABI/stable/sysfs-driver-msm-eud b/Documentation/ABI/stable/sysfs-driver-msm-eud
>> new file mode 100644
>> index 0000000..d96ae05
>> --- /dev/null
>> +++ b/Documentation/ABI/stable/sysfs-driver-msm-eud
>> @@ -0,0 +1,5 @@
>> +What:           /sys/bus/platform/drivers/msm-eud/enable
>> +Date:           Jan 2020
>> +Contact:        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> +Description:    Enable/Disable use of eud device.
> What are valid values to be used here?
it should be bool variable relying on 0 or 1.
>
>> +Users:          User space debug application which intend to use EUD h/w block.
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index d0a73e7..6b7c9d0 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -202,4 +202,16 @@ config QCOM_APR
>>   	  application processor and QDSP6. APR is
>>   	  used by audio driver to configure QDSP6
>>   	  ASM, ADM and AFE modules.
>> +
>> +config QCOM_EUD
>> +       tristate "QTI Embedded USB Debugger (EUD)"
>> +       depends on ARCH_QCOM
> Why not let everyone test build this?
EUD is Qualcomm IP, shall not it be associated with ARCH_QCOM?
>
>> +       help
>> +         The Embedded USB Debugger (EUD) driver is a driver for the
>> +         control peripheral which waits on events like USB attach/detach
>> +         and charger enable/disable. The control peripheral further helps
>> +         support the USB-based debug and trace capabilities.
>> +         This module enables support for Qualcomm Technologies, Inc.
>> +         Embedded USB Debugger (EUD).
>> +         If unsure, say N.
>>   endmenu
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index 9fb35c8..c15be68 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -25,3 +25,4 @@ obj-$(CONFIG_QCOM_APR) += apr.o
>>   obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>>   obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
>>   obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
>> +obj-$(CONFIG_QCOM_EUD) += eud.o
>> diff --git a/drivers/soc/qcom/eud.c b/drivers/soc/qcom/eud.c
>> new file mode 100644
>> index 0000000..e6c3604
>> --- /dev/null
>> +++ b/drivers/soc/qcom/eud.c
>> @@ -0,0 +1,329 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/err.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/extcon.h>
>> +#include <linux/extcon-provider.h>
>> +#include <linux/delay.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/io.h>
>> +#include <linux/bitops.h>
>> +#include <linux/workqueue.h>
>> +#include <linux/power_supply.h>
>> +
>> +#define EUD_ENABLE_CMD 1
>> +#define EUD_DISABLE_CMD 0
> Don't need these.
OK
>
>> +
>> +#define EUD_REG_INT1_EN_MASK	0x0024
>> +#define EUD_REG_INT_STATUS_1	0x0044
>> +#define EUD_REG_CTL_OUT_1	0x0074
>> +#define EUD_REG_VBUS_INT_CLR	0x0080
>> +#define EUD_REG_CHGR_INT_CLR	0x0084
>> +#define EUD_REG_CSR_EUD_EN	0x1014
>> +#define EUD_REG_SW_ATTACH_DET	0x1018
>> +
>> +#define EUD_INT_VBUS		BIT(2)
>> +#define EUD_INT_CHGR		BIT(3)
>> +#define EUD_INT_SAFE_MODE	BIT(4)
>> +#define EUD_INT_ALL		(EUD_INT_VBUS|EUD_INT_CHGR|\
>> +				EUD_INT_SAFE_MODE)
>> +
>> +struct eud_chip {
>> +	struct device			*dev;
>> +	int				eud_irq;
>> +	unsigned int			extcon_id;
>> +	unsigned int			int_status;
>> +	bool				usb_attach;
>> +	bool				chgr_enable;
>> +	void __iomem			*eud_reg_base;
>> +	struct extcon_dev		*extcon;
>> +	int				enable;
>> +	struct work_struct		eud_work;
>> +};
>> +
>> +static const unsigned int eud_extcon_cable[] = {
>> +	EXTCON_USB,
>> +	EXTCON_CHG_USB_SDP,
>> +	EXTCON_NONE,
>> +};
>> +
>> +static int enable_eud(struct eud_chip *priv)
>> +{
>> +	int ret;
>> +
>> +	/* write into CSR to enable EUD */
>> +	writel_relaxed(BIT(0), priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
>> +	/* Enable vbus, chgr & safe mode warning interrupts */
>> +	writel_relaxed(EUD_INT_VBUS | EUD_INT_CHGR | EUD_INT_SAFE_MODE,
>> +			priv->eud_reg_base + EUD_REG_INT1_EN_MASK);
>> +
>> +	/* Ensure Register Writes Complete */
>> +	wmb();
>> +
>> +	/*
>> +	 * Set the default cable state to usb connect and charger
>> +	 * enable
>> +	 */
>> +	ret = extcon_set_state_sync(priv->extcon, EXTCON_USB, true);
>> +	if (ret)
>> +		return ret;
>> +	ret = extcon_set_state_sync(priv->extcon,
>> +			EXTCON_CHG_USB_SDP, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static void disable_eud(struct eud_chip *priv)
>> +{
>> +	/* write into CSR to disable EUD */
>> +	writel_relaxed(0, priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
>> +}
>> +
>> +static ssize_t enable_show(struct device *dev,
>> +				struct device_attribute *attr, char *buf)
>> +{
>> +	struct eud_chip *chip = dev_get_drvdata(dev);
>> +
>> +	return snprintf(buf, sizeof(int), "%d", chip->enable);
>> +}
>> +
>> +static ssize_t enable_store(struct device *dev,
>> +				struct device_attribute *attr,
>> +				const char *buf, size_t count)
>> +{
>> +	struct eud_chip *chip = dev_get_drvdata(dev);
>> +	int enable = 0;
>> +	int ret = 0;
>> +
>> +	if (sscanf(buf, "%du", &enable) != 1)
>> +		return -EINVAL;
> No, use the built-in kernel function to handle reading y/n/Y/N/0/1 from
> sysfs files, do not try to roll your own.  As you have seen, you will
> get it wrong :)
ok
>
>
>
>> +
>> +	if (enable == EUD_ENABLE_CMD)
>> +		ret = enable_eud(chip);
>> +	else if (enable == EUD_DISABLE_CMD)
>> +		disable_eud(chip);
>> +	if (!ret)
>> +		chip->enable = enable;
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(enable);
>> +
>> +static struct attribute *attrs[] = {
>> +	&dev_attr_enable.attr,
>> +	NULL
>> +};
>> +
>> +static struct attribute_group attr_group = {
>> +	.attrs = attrs,
>> +};
>> +
>> +static const struct attribute_group *attr_groups[] = {
>> +	&attr_group,
>> +	NULL
>> +};
> ATTRIBUTE_GROUPS()?
OK.
>
>> +
>> +static void eud_event_notifier(struct work_struct *eud_work)
>> +{
>> +	struct eud_chip *chip = container_of(eud_work, struct eud_chip,
>> +					eud_work);
>> +	int ret;
>> +
>> +	if (chip->int_status == EUD_INT_VBUS) {
>> +		ret = extcon_set_state_sync(chip->extcon, chip->extcon_id,
>> +					chip->usb_attach);
>> +		if (ret)
>> +			return;
>> +	} else if (chip->int_status == EUD_INT_CHGR) {
>> +		ret = extcon_set_state_sync(chip->extcon, chip->extcon_id,
>> +					chip->chgr_enable);
>> +		if (ret)
>> +			return;
>> +	}
>> +}
>> +
>> +static void usb_attach_detach(struct eud_chip *chip)
>> +{
>> +	u32 reg;
>> +
>> +	chip->extcon_id = EXTCON_USB;
>> +	/* read ctl_out_1[4] to find USB attach or detach event */
>> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
>> +	if (reg & BIT(4))
>> +		chip->usb_attach = true;
>> +	else
>> +		chip->usb_attach = false;
>> +
>> +	schedule_work(&chip->eud_work);
>> +
>> +	/* set and clear vbus_int_clr[0] to clear interrupt */
>> +	writel_relaxed(BIT(0), chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
>> +	/* Ensure Register Writes Complete */
>> +	wmb();
>> +	writel_relaxed(0, chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
>> +}
>> +
>> +static void chgr_enable_disable(struct eud_chip *chip)
>> +{
>> +	u32 reg;
>> +
>> +	chip->extcon_id = EXTCON_CHG_USB_SDP;
>> +	/* read ctl_out_1[6] to find charger enable or disable event */
>> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
>> +	if (reg & BIT(6))
>> +		chip->chgr_enable = true;
>> +	else
>> +		chip->chgr_enable = false;
>> +
>> +	schedule_work(&chip->eud_work);
>> +
>> +	/* set and clear chgr_int_clr[0] to clear interrupt */
>> +	writel_relaxed(BIT(0), chip->eud_reg_base + EUD_REG_CHGR_INT_CLR);
>> +	/* Ensure Register Writes Complete */
>> +	wmb();
>> +	writel_relaxed(0, chip->eud_reg_base + EUD_REG_CHGR_INT_CLR);
>> +}
>> +
>> +static void pet_eud(struct eud_chip *chip)
>> +{
>> +	u32 reg;
>> +
>> +	/* read sw_attach_det[0] to find attach/detach event */
>> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
>> +	if (reg & BIT(0)) {
>> +		/* Detach & Attach pet for EUD */
>> +		writel_relaxed(0, chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
>> +		/* Ensure Register Writes Complete */
>> +		wmb();
>> +		/* Delay to make sure detach pet is done before attach pet */
>> +		udelay(100);
>> +		writel_relaxed(BIT(0), chip->eud_reg_base +
>> +					EUD_REG_SW_ATTACH_DET);
>> +		/* Ensure Register Writes Complete */
>> +		wmb();
>> +	} else {
>> +		/* Attach pet for EUD */
>> +		writel_relaxed(BIT(0), chip->eud_reg_base +
>> +					EUD_REG_SW_ATTACH_DET);
>> +		/* Ensure Register Writes Complete */
>> +		wmb();
>> +	}
>> +}
>> +
>> +static irqreturn_t handle_eud_irq(int irq, void *data)
>> +{
>> +	struct eud_chip *chip = data;
>> +	u32 reg;
>> +
>> +	/* read status register and find out which interrupt triggered */
>> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_INT_STATUS_1);
>> +	switch (reg & EUD_INT_ALL) {
>> +	case EUD_INT_VBUS:
>> +		chip->int_status = EUD_INT_VBUS;
>> +		usb_attach_detach(chip);
>> +		break;
>> +	case EUD_INT_CHGR:
>> +		chip->int_status = EUD_INT_CHGR;
>> +		chgr_enable_disable(chip);
>> +		break;
>> +	case EUD_INT_SAFE_MODE:
>> +		pet_eud(chip);
>> +		break;
>> +	default:
>> +		return IRQ_NONE;
>> +	}
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int msm_eud_probe(struct platform_device *pdev)
>> +{
>> +	struct eud_chip *chip;
>> +	struct resource *res;
>> +	int ret;
>> +
>> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
>> +	if (!chip)
>> +		return -ENOMEM;
>> +
>> +	chip->dev = &pdev->dev;
> No reference counting???
you mean get/put_device?
>
> thanks,
>
> greg k-h

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
