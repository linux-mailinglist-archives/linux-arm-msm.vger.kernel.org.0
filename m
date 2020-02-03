Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5316151057
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 20:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgBCTfi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 14:35:38 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44904 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgBCTfi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 14:35:38 -0500
Received: by mail-pf1-f195.google.com with SMTP id y5so8058963pfb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 11:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7YpQxLX4U2GQICWgq80GxBdSsHfJwYraOcMspQmkaJ0=;
        b=bg3fYC3RKmgV/sMcfmvy1pggK34Ib5VpRewrB0Mi9lfNDp7rPMEVJYKYtR1ljj7MyQ
         2372WDE0bcx4LBrx9UNo+Cd+eTdGA1zMEygaiz6jPMKNinxRwXLVS5rK8QfhaHs52G9z
         EAVeLiASBPUMv/m3fRYGZLs+dabTOvp6Y1GzWU92IQi2wvSEEYtltk9cQU6GtrRKYrr0
         njwqIAthBzuOVbgk4NPkQqmBuzKfYNBk/U6nAHccCR/NnPI8gFLYh64O5fAQuCRoC2MU
         0uM+Rl7lT340ZzqiQrDIvp6l7Rk1p+OCUnOY8zhFbGt0OWRSdLWW9C2QogsBhxYKPTda
         4Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7YpQxLX4U2GQICWgq80GxBdSsHfJwYraOcMspQmkaJ0=;
        b=LvDXf8tZPt9OxzoMMc05Ybtlo08+IapoxOtCna2hBdRDCFFW4a4li3p/9wgp2kp9a5
         nHY3fCWs7PeCUGw2Bi/8ANY0ULO5/hQqlepVIpM+XWIJREn4ntvq7lJNC1WkoewMjJnp
         wgPTFadjE5SsAMDDUYCD0GCzLAHHMu5Ad75YVyuHO3BxT+7uUtGiJCNuFvTGZ3WMVh21
         Bah9NhJ3DSKadSaJfJvGrRrZBfH9gE0gLkIZrDNg8vaj44hx5ZzadDfdz9cbHKQPgOxY
         531MDRFqZR/mORWcibmDlkEOoieP2Vd8mTchU5jxx1pzd9iPUaoWYD4y+uXXqAzM3NRV
         A4kg==
X-Gm-Message-State: APjAAAWbYjh1a+b1QqTO/Tlz8tZpjp2470Ca1jIJoa6aBD+5LfoI+rVp
        NHkf+aB2msea4QqLe+1hOtTeLg==
X-Google-Smtp-Source: APXvYqx33SiywJBS8WUBgtOsFbiFeFhOY3NEGlPquTjtqr8k4+o2FiX22dJlysQXLts2+O+Augxa2Q==
X-Received: by 2002:a62:be0a:: with SMTP id l10mr27375113pff.110.1580758536897;
        Mon, 03 Feb 2020 11:35:36 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h10sm20820459pfo.181.2020.02.03.11.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 11:35:36 -0800 (PST)
Date:   Mon, 3 Feb 2020 11:35:33 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        rnayak@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org
Subject: Re: [PATCH v4 2/2] Embedded USB Debugger (EUD) driver
Message-ID: <20200203193533.GL3948@builder>
References: <1580445811-15948-1-git-send-email-akdwived@codeaurora.org>
 <1580445811-15948-3-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580445811-15948-3-git-send-email-akdwived@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 30 Jan 20:43 PST 2020, Avaneesh Kumar Dwivedi wrote:

> Add support for control peripheral of EUD (Embedded USB Debugger) to
> listen to events such as USB attach/detach, charger enable/disable, pet
> EUD to indicate software is functional. Reusing the platform device kobj,
> sysfs entry 'enable' is created to enable or disable EUD.
> 
> Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
> Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>

Either ensure Satya is the author, or add some Co-developed-by to
indicate that all three of you have authored the patch.

> ---
>  Documentation/ABI/stable/sysfs-driver-msm-eud |   5 +
>  drivers/soc/qcom/Kconfig                      |  12 +
>  drivers/soc/qcom/Makefile                     |   1 +
>  drivers/soc/qcom/eud.c                        | 329 ++++++++++++++++++++++++++
>  4 files changed, 347 insertions(+)
>  create mode 100644 Documentation/ABI/stable/sysfs-driver-msm-eud
>  create mode 100644 drivers/soc/qcom/eud.c
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-msm-eud b/Documentation/ABI/stable/sysfs-driver-msm-eud
> new file mode 100644
> index 0000000..d96ae05
> --- /dev/null
> +++ b/Documentation/ABI/stable/sysfs-driver-msm-eud
> @@ -0,0 +1,5 @@
> +What:           /sys/bus/platform/drivers/msm-eud/enable
> +Date:           Jan 2020
> +Contact:        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> +Description:    Enable/Disable use of eud device.
> +Users:          User space debug application which intend to use EUD h/w block.
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index d0a73e7..6b7c9d0 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -202,4 +202,16 @@ config QCOM_APR
>  	  application processor and QDSP6. APR is
>  	  used by audio driver to configure QDSP6
>  	  ASM, ADM and AFE modules.
> +
> +config QCOM_EUD

Please aim for keeping the sort order in this file (ignore QCOM_APR
which obviously is in the wrong place)

> +       tristate "QTI Embedded USB Debugger (EUD)"
> +       depends on ARCH_QCOM
> +       help
> +         The Embedded USB Debugger (EUD) driver is a driver for the
> +         control peripheral which waits on events like USB attach/detach
> +         and charger enable/disable. The control peripheral further helps
> +         support the USB-based debug and trace capabilities.
> +         This module enables support for Qualcomm Technologies, Inc.
> +         Embedded USB Debugger (EUD).
> +         If unsure, say N.
>  endmenu
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 9fb35c8..c15be68 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -25,3 +25,4 @@ obj-$(CONFIG_QCOM_APR) += apr.o
>  obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>  obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
>  obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
> +obj-$(CONFIG_QCOM_EUD) += eud.o
> diff --git a/drivers/soc/qcom/eud.c b/drivers/soc/qcom/eud.c
> new file mode 100644
> index 0000000..e6c3604
> --- /dev/null
> +++ b/drivers/soc/qcom/eud.c
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/interrupt.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/extcon.h>
> +#include <linux/extcon-provider.h>
> +#include <linux/delay.h>
> +#include <linux/sysfs.h>
> +#include <linux/io.h>
> +#include <linux/bitops.h>
> +#include <linux/workqueue.h>
> +#include <linux/power_supply.h>

Please sort these.

> +
> +#define EUD_ENABLE_CMD 1
> +#define EUD_DISABLE_CMD 0

These defines doesn't add much value.

> +
> +#define EUD_REG_INT1_EN_MASK	0x0024
> +#define EUD_REG_INT_STATUS_1	0x0044
> +#define EUD_REG_CTL_OUT_1	0x0074
> +#define EUD_REG_VBUS_INT_CLR	0x0080
> +#define EUD_REG_CHGR_INT_CLR	0x0084
> +#define EUD_REG_CSR_EUD_EN	0x1014
> +#define EUD_REG_SW_ATTACH_DET	0x1018
> +
> +#define EUD_INT_VBUS		BIT(2)
> +#define EUD_INT_CHGR		BIT(3)
> +#define EUD_INT_SAFE_MODE	BIT(4)
> +#define EUD_INT_ALL		(EUD_INT_VBUS|EUD_INT_CHGR|\
> +				EUD_INT_SAFE_MODE)
> +
> +struct eud_chip {
> +	struct device			*dev;
> +	int				eud_irq;
> +	unsigned int			extcon_id;
> +	unsigned int			int_status;
> +	bool				usb_attach;
> +	bool				chgr_enable;
> +	void __iomem			*eud_reg_base;
> +	struct extcon_dev		*extcon;
> +	int				enable;
> +	struct work_struct		eud_work;
> +};
> +
> +static const unsigned int eud_extcon_cable[] = {
> +	EXTCON_USB,
> +	EXTCON_CHG_USB_SDP,
> +	EXTCON_NONE,
> +};
> +
> +static int enable_eud(struct eud_chip *priv)
> +{
> +	int ret;
> +
> +	/* write into CSR to enable EUD */

Make up a define for BIT(0) and the next line is self explanatory - i.e.
drop the comment..

> +	writel_relaxed(BIT(0), priv->eud_reg_base + EUD_REG_CSR_EUD_EN);

Don't use _relaxed version of writel/readl unless you have a really good
reason - and if so provide a comment to why this is.

> +	/* Enable vbus, chgr & safe mode warning interrupts */

This just repeats exactly what can be read from the next line.

> +	writel_relaxed(EUD_INT_VBUS | EUD_INT_CHGR | EUD_INT_SAFE_MODE,
> +			priv->eud_reg_base + EUD_REG_INT1_EN_MASK);
> +
> +	/* Ensure Register Writes Complete */

wmb() ensures ordering, it deosn't wait for the operation to complete,
if you need that readl() the register.

> +	wmb();
> +
> +	/*
> +	 * Set the default cable state to usb connect and charger
> +	 * enable
> +	 */
> +	ret = extcon_set_state_sync(priv->extcon, EXTCON_USB, true);
> +	if (ret)
> +		return ret;
> +	ret = extcon_set_state_sync(priv->extcon,
> +			EXTCON_CHG_USB_SDP, true);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void disable_eud(struct eud_chip *priv)
> +{
> +	/* write into CSR to disable EUD */
> +	writel_relaxed(0, priv->eud_reg_base + EUD_REG_CSR_EUD_EN);

Use writel() and drop the comment.

> +}
> +
> +static ssize_t enable_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct eud_chip *chip = dev_get_drvdata(dev);
> +
> +	return snprintf(buf, sizeof(int), "%d", chip->enable);

buf is not sizeof(int) big...Just do sprintf()...

> +}
> +
> +static ssize_t enable_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct eud_chip *chip = dev_get_drvdata(dev);
> +	int enable = 0;

You shouldn't need to initialize this as you're checking the return
value of sscanf().

> +	int ret = 0;
> +
> +	if (sscanf(buf, "%du", &enable) != 1)
> +		return -EINVAL;
> +
> +	if (enable == EUD_ENABLE_CMD)
> +		ret = enable_eud(chip);

If ret is !0 you should probably return that, rather than count...

> +	else if (enable == EUD_DISABLE_CMD)
> +		disable_eud(chip);
> +	if (!ret)

...and then you don't need this check, or initialize ret to 0 above.

> +		chip->enable = enable;

So if I write 42 to "enable" nothing will change in the hardware, but
chip->enable will be 42...

> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(enable);
> +
> +static struct attribute *attrs[] = {
> +	&dev_attr_enable.attr,
> +	NULL
> +};
> +
> +static struct attribute_group attr_group = {
> +	.attrs = attrs,
> +};
> +
> +static const struct attribute_group *attr_groups[] = {
> +	&attr_group,
> +	NULL
> +};
> +
> +static void eud_event_notifier(struct work_struct *eud_work)

Why do you need a worker for this? Why not just use a threaded handler
and execute this directly in that context?

> +{
> +	struct eud_chip *chip = container_of(eud_work, struct eud_chip,
> +					eud_work);
> +	int ret;
> +
> +	if (chip->int_status == EUD_INT_VBUS) {

And if you just call this function from the handler, you don't need
chip->int_status to pass parameters between the handler and the worker.

> +		ret = extcon_set_state_sync(chip->extcon, chip->extcon_id,
> +					chip->usb_attach);
> +		if (ret)
> +			return;
> +	} else if (chip->int_status == EUD_INT_CHGR) {
> +		ret = extcon_set_state_sync(chip->extcon, chip->extcon_id,
> +					chip->chgr_enable);
> +		if (ret)
> +			return;
> +	}
> +}
> +
> +static void usb_attach_detach(struct eud_chip *chip)
> +{
> +	u32 reg;
> +
> +	chip->extcon_id = EXTCON_USB;
> +	/* read ctl_out_1[4] to find USB attach or detach event */
> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
> +	if (reg & BIT(4))

Give this bit a define

> +		chip->usb_attach = true;
> +	else
> +		chip->usb_attach = false;
> +
> +	schedule_work(&chip->eud_work);
> +
> +	/* set and clear vbus_int_clr[0] to clear interrupt */
> +	writel_relaxed(BIT(0), chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
> +	/* Ensure Register Writes Complete */
> +	wmb();

Use writel() and you probably don't need the wmb() here.

> +	writel_relaxed(0, chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
> +}
> +
> +static void chgr_enable_disable(struct eud_chip *chip)
> +{
> +	u32 reg;
> +
> +	chip->extcon_id = EXTCON_CHG_USB_SDP;
> +	/* read ctl_out_1[6] to find charger enable or disable event */
> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
> +	if (reg & BIT(6))

Again, this deserves a define

> +		chip->chgr_enable = true;
> +	else
> +		chip->chgr_enable = false;
> +
> +	schedule_work(&chip->eud_work);
> +
> +	/* set and clear chgr_int_clr[0] to clear interrupt */
> +	writel_relaxed(BIT(0), chip->eud_reg_base + EUD_REG_CHGR_INT_CLR);
> +	/* Ensure Register Writes Complete */
> +	wmb();
> +	writel_relaxed(0, chip->eud_reg_base + EUD_REG_CHGR_INT_CLR);
> +}
> +
> +static void pet_eud(struct eud_chip *chip)
> +{
> +	u32 reg;
> +
> +	/* read sw_attach_det[0] to find attach/detach event */
> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
> +	if (reg & BIT(0)) {

define

> +		/* Detach & Attach pet for EUD */

All comments in this driver relates to the very next line, but this
seems to document the next two writes - i.e. this seems to be a proper
comment.

> +		writel_relaxed(0, chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
> +		/* Ensure Register Writes Complete */
> +		wmb();
> +		/* Delay to make sure detach pet is done before attach pet */
> +		udelay(100);

Better read back the value if you want to ensure the length of the delay
between the two writes.

> +		writel_relaxed(BIT(0), chip->eud_reg_base +
> +					EUD_REG_SW_ATTACH_DET);
> +		/* Ensure Register Writes Complete */
> +		wmb();
> +	} else {
> +		/* Attach pet for EUD */
> +		writel_relaxed(BIT(0), chip->eud_reg_base +
> +					EUD_REG_SW_ATTACH_DET);
> +		/* Ensure Register Writes Complete */
> +		wmb();

It will complete, if you need to wait for it to have completed read back
the value.

> +	}
> +}
> +
> +static irqreturn_t handle_eud_irq(int irq, void *data)
> +{
> +	struct eud_chip *chip = data;
> +	u32 reg;
> +
> +	/* read status register and find out which interrupt triggered */
> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_INT_STATUS_1);
> +	switch (reg & EUD_INT_ALL) {

What is the expected outcome if for some reason more than one of these
bits are set?

> +	case EUD_INT_VBUS:
> +		chip->int_status = EUD_INT_VBUS;
> +		usb_attach_detach(chip);
> +		break;
> +	case EUD_INT_CHGR:
> +		chip->int_status = EUD_INT_CHGR;
> +		chgr_enable_disable(chip);
> +		break;
> +	case EUD_INT_SAFE_MODE:
> +		pet_eud(chip);
> +		break;
> +	default:
> +		return IRQ_NONE;
> +	}
> +	return IRQ_HANDLED;
> +}
> +
> +static int msm_eud_probe(struct platform_device *pdev)
> +{
> +	struct eud_chip *chip;
> +	struct resource *res;
> +	int ret;
> +
> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, chip);
> +
> +	chip->extcon = devm_extcon_dev_allocate(&pdev->dev, eud_extcon_cable);

Aren't we moving away from extcon in favor of the usb role switching
thing?

> +	if (IS_ERR(chip->extcon))
> +		return PTR_ERR(chip->extcon);
> +
> +	ret = devm_extcon_dev_register(&pdev->dev, chip->extcon);
> +	if (ret)
> +		return ret;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENOMEM;
> +
> +	chip->eud_reg_base = devm_ioremap_resource(&pdev->dev, res);

Use devm_platform_ioremap_resource() instead

> +	if (IS_ERR(chip->eud_reg_base))
> +		return PTR_ERR(chip->eud_reg_base);
> +
> +	chip->eud_irq = platform_get_irq(pdev, 0);
> +
> +	ret = devm_request_irq(&pdev->dev, chip->eud_irq, handle_eud_irq,
> +				IRQF_TRIGGER_HIGH, NULL, chip);

Omit the irq trigger information here and let it come from devicetree.

> +	if (ret)
> +		return ret;
> +
> +	device_init_wakeup(&pdev->dev, true);
> +	enable_irq_wake(chip->eud_irq);
> +
> +	INIT_WORK(&chip->eud_work, eud_event_notifier);
> +
> +	if (ret)

Duplicate of the same check 8 lines up.

> +		return ret;
> +
> +	/* Enable EUD */
> +	if (chip->enable)

I'm not seeing where this would have been written during probe.

> +		enable_eud(chip);
> +
> +	return 0;
> +}
> +
> +static int msm_eud_remove(struct platform_device *pdev)
> +{
> +	struct eud_chip *chip = platform_get_drvdata(pdev);
> +
> +	if (chip->enable)
> +		disable_eud(chip);
> +	device_init_wakeup(&pdev->dev, false);
> +	disable_irq_wake(chip->eud_irq);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id msm_eud_dt_match[] = {
> +	{.compatible = "qcom,msm-eud"},

Is this the one and only, past and future, version of the EUD hardware
block? Or do we need this compatible to be more specific?

Nit. Please add a space after { and before }

Regards,
Bjorn
