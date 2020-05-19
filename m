Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D0D1D946A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 12:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgESKeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 06:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgESKeA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 06:34:00 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF91C05BD09
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 03:33:59 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f13so2498021wmc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 03:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yhYwMplwaedErSloP0W67eXhMkoDhq8klaezQCPn2dg=;
        b=ImA/TGm67JZ9hjGEr8NJoSRybbdXZeoF/VUNjeU5I3sCxTpqcvKh68z7nbRJ38LSyo
         YIBSYCkLedGTuNkeRqjanWcHAFODBCI9tWj3xBV1Wp/xY7YzWsDoyKNEwQ3QPfQzbthJ
         A7h29PG8MqvEAf3o59eHHhTwla3urytevhjdFTHbTKLMzfFkXv1bgY0lrDAah4rWgtYj
         n5BuLwMAw58Sq4WDt2WUQwElHX5PqRHdhDeIgAEx6hnOdMBL9OKCYvGwOLNG/QJez72c
         LphjV4wNJYXqpgKIN9jvsXfVrVfAmfDbhAZrBxK5z7fR5lY4RuchM2ix3J1/HPIXhc0N
         fT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yhYwMplwaedErSloP0W67eXhMkoDhq8klaezQCPn2dg=;
        b=lKpITbkUssDzkQjuXoZwWcfHVs+fMwFtyBR+ET921XEXCt8aQst0+hiiTAsOaRFt4K
         hcfHoOssnuK/w5Zo/pbMwtrMmPcKqn6TdiAYFW6PBg1NksJf7BVlWxvaeOgmEgR8B92j
         /f0GcmnxWdrD9s0Wf7m/wFjbFDbvehUrjWdGgcfzH3+K6iNFlY/1DZIT27tpcDnxhxip
         FkxV0q3oe99uJ5n31RbtD/eDyhRNtqZ97QlGApN+0Kqa6dh6fnCn9+bLXBEzhQ3DidYY
         h3UBrqi56IZ2v1jiBFdP+iZcWsChipR42ncuIzBQ3p8ebikXxo/MP6LTmzyJrK7uBA8E
         bBWQ==
X-Gm-Message-State: AOAM530BdMNuQQ/gTpd8m3e1DjL0gGyS+NxVJe25Gh8PmoQhOG+CND/0
        UCksqvP0dnU5mM99AU4AhsLVXQ==
X-Google-Smtp-Source: ABdhPJxm1AWDhRx/G5tDFGTV6mLDCOhbgcggU8uIYSSRNFX/avdqn5R3mA1jIXiDPMLCyBP0RYPcTQ==
X-Received: by 2002:a7b:cc92:: with SMTP id p18mr4877566wma.174.1589884438166;
        Tue, 19 May 2020 03:33:58 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id r9sm10830750wra.52.2020.05.19.03.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 03:33:57 -0700 (PDT)
Date:   Tue, 19 May 2020 11:33:55 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org
Subject: Re: [PATCH 2/2] mfd: Introduce QTI I2C PMIC controller
Message-ID: <20200519103355.GU271301@dell>
References: <cover.1588037638.git.gurus@codeaurora.org>
 <041dd80e01d1bf86da2edc2747e922c473b50509.1588037638.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <041dd80e01d1bf86da2edc2747e922c473b50509.1588037638.git.gurus@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[Adding IRQ chaps]

Seeing as a vast portion of this driver is IRQ domain related, I see
good reason to separate it out into a driver in its own right.  At the
very least it will require an IRQ *-by tag.

On Mon, 27 Apr 2020, Guru Das Srinagesh wrote:

> The Qualcomm Technologies, Inc. I2C PMIC Controller is used by
> multi-function PMIC devices which communicate over the I2C bus.  The
> controller enumerates all child nodes as platform devices, and
> instantiates a regmap interface for them to communicate over the I2C
> bus.
> 
> The controller also controls interrupts for all of the children platform
> devices.  The controller handles the summary interrupt by deciphering
> which peripheral triggered the interrupt, and which of the peripheral
> interrupts were triggered.  Finally, it calls the interrupt handlers for
> each of the virtual interrupts that were registered.

> Nicholas Troast is the original author of this driver.
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  drivers/mfd/Kconfig         |  11 +
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/qcom-i2c-pmic.c | 737 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 749 insertions(+)
>  create mode 100644 drivers/mfd/qcom-i2c-pmic.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 54b6aa4..bf112eb 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1002,6 +1002,17 @@ config MFD_PM8XXX
>  	  Say M here if you want to include support for PM8xxx chips as a
>  	  module. This will build a module called "pm8xxx-core".
>  
> +config MFD_I2C_PMIC

"I2C PMIC" is too generic.

> +	tristate "QTI I2C PMIC support"

I don't see QTI used very often.

What's the difference between "QTI" and "QCOM"?

> +	depends on I2C && OF
> +	select IRQ_DOMAIN
> +	select REGMAP_I2C
> +	help
> +	  This enables support for controlling Qualcomm Technologies, Inc.
> +	  PMICs over I2C. The driver controls interrupts, and provides register
> +	  access for all of the device's peripherals.  Some QTI PMIC chips
> +	  support communication over both I2C and SPMI.
> +
>  config MFD_QCOM_RPM
>  	tristate "Qualcomm Resource Power Manager (RPM)"
>  	depends on ARCH_QCOM && OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 7761f84..26f0b80 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -199,6 +199,7 @@ obj-$(CONFIG_MFD_SI476X_CORE)	+= si476x-core.o
>  obj-$(CONFIG_MFD_CS5535)	+= cs5535-mfd.o
>  obj-$(CONFIG_MFD_OMAP_USB_HOST)	+= omap-usb-host.o omap-usb-tll.o
>  obj-$(CONFIG_MFD_PM8XXX) 	+= qcom-pm8xxx.o ssbi.o
> +obj-$(CONFIG_MFD_I2C_PMIC)     += qcom-i2c-pmic.o
>  obj-$(CONFIG_MFD_QCOM_RPM)	+= qcom_rpm.o
>  obj-$(CONFIG_MFD_SPMI_PMIC)	+= qcom-spmi-pmic.o
>  obj-$(CONFIG_TPS65911_COMPARATOR)	+= tps65911-comparator.o
> diff --git a/drivers/mfd/qcom-i2c-pmic.c b/drivers/mfd/qcom-i2c-pmic.c
> new file mode 100644
> index 0000000..d0f600a
> --- /dev/null
> +++ b/drivers/mfd/qcom-i2c-pmic.c
> @@ -0,0 +1,737 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.

This is out of date.

No author tag?

> + */
> +
> +#define pr_fmt(fmt) "I2C PMIC: %s: " fmt, __func__

Outside of in-development code I don't see a reason for adding the
function name to system log entries.  IMHO, it just dirties the log on
production/released H/W.  Please considering removing this
altogether in from plain device drivers.

> +#include <linux/bitops.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>

I'm going to skip all of the IRQ code until we know what we're doing
with it.

 #########
<-- IRQ -->
 #########

> +#define I2C_INTR_STATUS_BASE	0x0550
> +#define INT_RT_STS_OFFSET	0x10
> +#define INT_SET_TYPE_OFFSET	0x11
> +#define INT_POL_HIGH_OFFSET	0x12
> +#define INT_POL_LOW_OFFSET	0x13
> +#define INT_LATCHED_CLR_OFFSET	0x14
> +#define INT_EN_SET_OFFSET	0x15
> +#define INT_EN_CLR_OFFSET	0x16
> +#define INT_LATCHED_STS_OFFSET	0x18
> +#define INT_PENDING_STS_OFFSET	0x19
> +#define INT_MID_SEL_OFFSET	0x1A
> +#define INT_MID_SEL_MASK	GENMASK(1, 0)
> +#define INT_PRIORITY_OFFSET	0x1B
> +#define INT_PRIORITY_BIT	BIT(0)
> +
> +enum {
> +	IRQ_SET_TYPE = 0,
> +	IRQ_POL_HIGH,
> +	IRQ_POL_LOW,
> +	IRQ_LATCHED_CLR, /* not needed but makes life easy */
> +	IRQ_EN_SET,
> +	IRQ_MAX_REGS,
> +};
> +
> +struct i2c_pmic_periph {
> +	void		*data;
> +	u16		addr;
> +	u8		cached[IRQ_MAX_REGS];
> +	u8		synced[IRQ_MAX_REGS];
> +	u8		wake;
> +	struct mutex	lock;
> +};
> +
> +struct i2c_pmic {
> +	struct device		*dev;
> +	struct regmap		*regmap;
> +	struct irq_domain	*domain;
> +	struct i2c_pmic_periph	*periph;
> +	struct pinctrl		*pinctrl;
> +	struct mutex		irq_complete;
> +	const char		*pinctrl_name;
> +	int			num_periphs;
> +	int			summary_irq;
> +	bool			resume_completed;
> +	bool			irq_waiting;
> +};
> +
> +static void i2c_pmic_irq_bus_lock(struct irq_data *d)
> +{
> +	struct i2c_pmic_periph *periph = irq_data_get_irq_chip_data(d);
> +
> +	mutex_lock(&periph->lock);
> +}
> +
> +static void i2c_pmic_sync_type_polarity(struct i2c_pmic *chip,
> +			       struct i2c_pmic_periph *periph)
> +{
> +	int rc;
> +
> +	/* did any irq type change? */
> +	if (periph->cached[IRQ_SET_TYPE] ^ periph->synced[IRQ_SET_TYPE]) {
> +		rc = regmap_write(chip->regmap,
> +				  periph->addr | INT_SET_TYPE_OFFSET,
> +				  periph->cached[IRQ_SET_TYPE]);
> +		if (rc < 0) {
> +			pr_err("Couldn't set periph 0x%04x irqs 0x%02x type rc=%d\n",
> +				periph->addr, periph->cached[IRQ_SET_TYPE], rc);
> +			return;
> +		}
> +
> +		periph->synced[IRQ_SET_TYPE] = periph->cached[IRQ_SET_TYPE];
> +	}
> +
> +	/* did any polarity high change? */
> +	if (periph->cached[IRQ_POL_HIGH] ^ periph->synced[IRQ_POL_HIGH]) {
> +		rc = regmap_write(chip->regmap,
> +				  periph->addr | INT_POL_HIGH_OFFSET,
> +				  periph->cached[IRQ_POL_HIGH]);
> +		if (rc < 0) {
> +			pr_err("Couldn't set periph 0x%04x irqs 0x%02x polarity high rc=%d\n",
> +				periph->addr, periph->cached[IRQ_POL_HIGH], rc);
> +			return;
> +		}
> +
> +		periph->synced[IRQ_POL_HIGH] = periph->cached[IRQ_POL_HIGH];
> +	}
> +
> +	/* did any polarity low change? */
> +	if (periph->cached[IRQ_POL_LOW] ^ periph->synced[IRQ_POL_LOW]) {
> +		rc = regmap_write(chip->regmap,
> +				  periph->addr | INT_POL_LOW_OFFSET,
> +				  periph->cached[IRQ_POL_LOW]);
> +		if (rc < 0) {
> +			pr_err("Couldn't set periph 0x%04x irqs 0x%02x polarity low rc=%d\n",
> +				periph->addr, periph->cached[IRQ_POL_LOW], rc);
> +			return;
> +		}
> +
> +		periph->synced[IRQ_POL_LOW] = periph->cached[IRQ_POL_LOW];
> +	}
> +}
> +
> +static void i2c_pmic_sync_enable(struct i2c_pmic *chip,
> +				 struct i2c_pmic_periph *periph)
> +{
> +	u8 en_set, en_clr;
> +	int rc;
> +
> +	/* determine which irqs were enabled and which were disabled */
> +	en_clr = periph->synced[IRQ_EN_SET] & ~periph->cached[IRQ_EN_SET];
> +	en_set = ~periph->synced[IRQ_EN_SET] & periph->cached[IRQ_EN_SET];
> +
> +	/* were any irqs disabled? */
> +	if (en_clr) {
> +		rc = regmap_write(chip->regmap,
> +				  periph->addr | INT_EN_CLR_OFFSET, en_clr);
> +		if (rc < 0) {
> +			pr_err("Couldn't disable periph 0x%04x irqs 0x%02x rc=%d\n",
> +				periph->addr, en_clr, rc);
> +			return;
> +		}
> +	}
> +
> +	/* were any irqs enabled? */
> +	if (en_set) {
> +		rc = regmap_write(chip->regmap,
> +				  periph->addr | INT_EN_SET_OFFSET, en_set);
> +		if (rc < 0) {
> +			pr_err("Couldn't enable periph 0x%04x irqs 0x%02x rc=%d\n",
> +				periph->addr, en_set, rc);
> +			return;
> +		}
> +	}
> +
> +	/* irq enabled status was written to hardware */
> +	periph->synced[IRQ_EN_SET] = periph->cached[IRQ_EN_SET];
> +}
> +
> +static void i2c_pmic_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct i2c_pmic_periph *periph = irq_data_get_irq_chip_data(d);
> +	struct i2c_pmic *chip = periph->data;
> +
> +	i2c_pmic_sync_type_polarity(chip, periph);
> +	i2c_pmic_sync_enable(chip, periph);
> +	mutex_unlock(&periph->lock);
> +}
> +
> +static void i2c_pmic_irq_disable(struct irq_data *d)
> +{
> +	struct i2c_pmic_periph *periph = irq_data_get_irq_chip_data(d);
> +
> +	periph->cached[IRQ_EN_SET] &= ~d->hwirq & 0xFF;
> +}
> +
> +static void i2c_pmic_irq_enable(struct irq_data *d)
> +{
> +	struct i2c_pmic_periph *periph = irq_data_get_irq_chip_data(d);
> +
> +	periph->cached[IRQ_EN_SET] |= d->hwirq & 0xFF;
> +}
> +
> +static int i2c_pmic_irq_set_type(struct irq_data *d, unsigned int irq_type)
> +{
> +	struct i2c_pmic_periph *periph = irq_data_get_irq_chip_data(d);
> +
> +	switch (irq_type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		periph->cached[IRQ_SET_TYPE] |= d->hwirq & 0xFF;
> +		periph->cached[IRQ_POL_HIGH] |= d->hwirq & 0xFF;
> +		periph->cached[IRQ_POL_LOW] &= ~d->hwirq & 0xFF;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		periph->cached[IRQ_SET_TYPE] |= d->hwirq & 0xFF;
> +		periph->cached[IRQ_POL_HIGH] &= ~d->hwirq & 0xFF;
> +		periph->cached[IRQ_POL_LOW] |= d->hwirq & 0xFF;
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		periph->cached[IRQ_SET_TYPE] |= d->hwirq & 0xFF;
> +		periph->cached[IRQ_POL_HIGH] |= d->hwirq & 0xFF;
> +		periph->cached[IRQ_POL_LOW] |= d->hwirq & 0xFF;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		periph->cached[IRQ_SET_TYPE] &= ~d->hwirq & 0xFF;
> +		periph->cached[IRQ_POL_HIGH] |= d->hwirq & 0xFF;
> +		periph->cached[IRQ_POL_LOW] &= ~d->hwirq & 0xFF;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		periph->cached[IRQ_SET_TYPE] &= ~d->hwirq & 0xFF;
> +		periph->cached[IRQ_POL_HIGH] &= ~d->hwirq & 0xFF;
> +		periph->cached[IRQ_POL_LOW] |= d->hwirq & 0xFF;
> +		break;
> +	default:
> +		pr_err("irq type 0x%04x is not supported\n", irq_type);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int i2c_pmic_irq_set_wake(struct irq_data *d, unsigned int on)
> +{
> +	struct i2c_pmic_periph *periph = irq_data_get_irq_chip_data(d);
> +
> +	if (on)
> +		periph->wake |= d->hwirq & 0xFF;
> +	else
> +		periph->wake &= ~d->hwirq & 0xFF;
> +
> +	return 0;
> +}
> +#else
> +#define i2c_pmic_irq_set_wake NULL
> +#endif
> +
> +static struct irq_chip i2c_pmic_irq_chip = {
> +	.name			= "i2c_pmic_irq_chip",
> +	.irq_bus_lock		= i2c_pmic_irq_bus_lock,
> +	.irq_bus_sync_unlock	= i2c_pmic_irq_bus_sync_unlock,
> +	.irq_disable		= i2c_pmic_irq_disable,
> +	.irq_enable		= i2c_pmic_irq_enable,
> +	.irq_set_type		= i2c_pmic_irq_set_type,
> +	.irq_set_wake		= i2c_pmic_irq_set_wake,
> +};
> +
> +static struct i2c_pmic_periph *i2c_pmic_find_periph(struct i2c_pmic *chip,
> +						    irq_hw_number_t hwirq)
> +{
> +	int i;
> +
> +	for (i = 0; i < chip->num_periphs; i++)
> +		if (chip->periph[i].addr == (hwirq & 0xFF00))
> +			return &chip->periph[i];
> +
> +	pr_err_ratelimited("Couldn't find periph struct for hwirq 0x%04lx\n",
> +			   hwirq);
> +	return NULL;
> +}
> +
> +static int i2c_pmic_domain_map(struct irq_domain *d, unsigned int virq,
> +			irq_hw_number_t hwirq)
> +{
> +	struct i2c_pmic *chip = d->host_data;
> +	struct i2c_pmic_periph *periph = i2c_pmic_find_periph(chip, hwirq);
> +
> +	if (!periph)
> +		return -ENODEV;
> +
> +	irq_set_chip_data(virq, periph);
> +	irq_set_chip_and_handler(virq, &i2c_pmic_irq_chip, handle_level_irq);
> +	irq_set_nested_thread(virq, 1);
> +	irq_set_noprobe(virq);
> +	return 0;
> +}
> +
> +static int i2c_pmic_domain_xlate(struct irq_domain *d,
> +				 struct device_node *ctrlr, const u32 *intspec,
> +				 unsigned int intsize, unsigned long *out_hwirq,
> +				 unsigned int *out_type)
> +{
> +	if (intsize != 3)
> +		return -EINVAL;
> +
> +	if (intspec[0] > 0xFF || intspec[1] > 0x7 ||
> +					intspec[2] > IRQ_TYPE_SENSE_MASK)
> +		return -EINVAL;
> +
> +	/*
> +	 * Interrupt specifiers are triplets
> +	 * <peripheral-address, irq-number, IRQ_TYPE_*>
> +	 *
> +	 * peripheral-address - The base address of the peripheral
> +	 * irq-number	      - The zero based bit position of the peripheral's
> +	 *			interrupt registers corresponding to the irq
> +	 *			where the LSB is 0 and the MSB is 7
> +	 * IRQ_TYPE_*	      - Please refer to linux/irq.h
> +	 */
> +	*out_hwirq = intspec[0] << 8 | BIT(intspec[1]);
> +	*out_type = intspec[2] & IRQ_TYPE_SENSE_MASK;
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops i2c_pmic_domain_ops = {
> +	.map	= i2c_pmic_domain_map,
> +	.xlate	= i2c_pmic_domain_xlate,
> +};
> +
> +static void i2c_pmic_irq_ack_now(struct i2c_pmic *chip, u16 hwirq)
> +{
> +	int rc;
> +
> +	rc = regmap_write(chip->regmap,
> +			  (hwirq & 0xFF00) | INT_LATCHED_CLR_OFFSET,
> +			  hwirq & 0xFF);
> +	if (rc < 0)
> +		pr_err_ratelimited("Couldn't ack 0x%04x rc=%d\n", hwirq, rc);
> +}
> +
> +static void i2c_pmic_irq_disable_now(struct i2c_pmic *chip, u16 hwirq)
> +{
> +	struct i2c_pmic_periph *periph = i2c_pmic_find_periph(chip, hwirq);
> +	int rc;
> +
> +	if (!periph)
> +		return;
> +
> +	mutex_lock(&periph->lock);
> +	periph->cached[IRQ_EN_SET] &= ~hwirq & 0xFF;
> +
> +	rc = regmap_write(chip->regmap,
> +			  (hwirq & 0xFF00) | INT_EN_CLR_OFFSET,
> +			  hwirq & 0xFF);
> +	if (rc < 0) {
> +		pr_err_ratelimited("Couldn't disable irq 0x%04x rc=%d\n",
> +				   hwirq, rc);
> +		goto unlock;
> +	}
> +
> +	periph->synced[IRQ_EN_SET] = periph->cached[IRQ_EN_SET];
> +
> +unlock:
> +	mutex_unlock(&periph->lock);
> +}
> +
> +static void i2c_pmic_periph_status_handler(struct i2c_pmic *chip,
> +					   u16 periph_address, u8 periph_status)
> +{
> +	unsigned int hwirq, virq;
> +	int i;
> +
> +	while (periph_status) {
> +		i = ffs(periph_status) - 1;
> +		periph_status &= ~BIT(i);
> +		hwirq = periph_address | BIT(i);
> +		virq = irq_find_mapping(chip->domain, hwirq);
> +		if (virq == 0) {
> +			pr_err_ratelimited("Couldn't find mapping; disabling 0x%04x\n",
> +					   hwirq);
> +			i2c_pmic_irq_disable_now(chip, hwirq);
> +			continue;
> +		}
> +
> +		handle_nested_irq(virq);
> +		i2c_pmic_irq_ack_now(chip, hwirq);
> +	}
> +}
> +
> +static void i2c_pmic_summary_status_handler(struct i2c_pmic *chip,
> +					    struct i2c_pmic_periph *periph,
> +					    u8 summary_status)
> +{
> +	unsigned int periph_status;
> +	int rc, i;
> +
> +	while (summary_status) {
> +		i = ffs(summary_status) - 1;
> +		summary_status &= ~BIT(i);
> +
> +		rc = regmap_read(chip->regmap,
> +				 periph[i].addr | INT_LATCHED_STS_OFFSET,
> +				 &periph_status);
> +		if (rc < 0) {
> +			pr_err_ratelimited("Couldn't read 0x%04x | INT_LATCHED_STS rc=%d\n",
> +					   periph[i].addr, rc);
> +			continue;
> +		}
> +
> +		i2c_pmic_periph_status_handler(chip, periph[i].addr,
> +					       periph_status);
> +	}
> +}
> +
> +static irqreturn_t i2c_pmic_irq_handler(int irq, void *dev_id)
> +{
> +	struct i2c_pmic *chip = dev_id;
> +	struct i2c_pmic_periph *periph;
> +	unsigned int summary_status;
> +	int rc, i;
> +
> +	mutex_lock(&chip->irq_complete);
> +	chip->irq_waiting = true;
> +	if (!chip->resume_completed) {
> +		pr_debug("IRQ triggered before device-resume\n");
> +		disable_irq_nosync(irq);
> +		mutex_unlock(&chip->irq_complete);
> +		return IRQ_HANDLED;
> +	}
> +	chip->irq_waiting = false;
> +
> +	for (i = 0; i < DIV_ROUND_UP(chip->num_periphs, BITS_PER_BYTE); i++) {
> +		rc = regmap_read(chip->regmap, I2C_INTR_STATUS_BASE + i,
> +				&summary_status);
> +		if (rc < 0) {
> +			pr_err_ratelimited("Couldn't read I2C_INTR_STATUS%d rc=%d\n",
> +					   i, rc);
> +			continue;
> +		}
> +
> +		if (summary_status == 0)
> +			continue;
> +
> +		periph = &chip->periph[i * 8];
> +		i2c_pmic_summary_status_handler(chip, periph, summary_status);
> +	}
> +
> +	mutex_unlock(&chip->irq_complete);
> +
> +	return IRQ_HANDLED;
> +}

 #########
<-- IRQ -->
 #########

> +static int i2c_pmic_parse_dt(struct i2c_pmic *chip)
> +{
> +	struct device_node *node = chip->dev->of_node;

s/node/np/

> +	int rc, i;
> +	u32 temp;

Temp is seldom good nomenclature.

"periph_addr"

> +	if (!node) {
> +		pr_err("missing device tree\n");

Why are you using pr_err() over dev_err()?

Please use proper grammar (less full-stops) in prints and comments.

The above goes for all - I won't mention it again.

> +		return -EINVAL;
> +	}

Can this happen.

> +	chip->num_periphs = of_property_count_u32_elems(node,
> +							"qcom,periph-map");

Prefer the break after the '='.

If you change 's/node/np' you don't need to break at all.

> +	if (chip->num_periphs < 0) {
> +		pr_err("missing qcom,periph-map property rc=%d\n",

Prefer it if you use plain English for user facing comments.

  "Peripheral map not defined"

> +			chip->num_periphs);
> +		return chip->num_periphs;
> +	}
> +
> +	if (chip->num_periphs == 0) {
> +		pr_err("qcom,periph-map must contain at least one address\n");

"Peripheral map is empty"

> +		return -EINVAL;
> +	}
> +
> +	chip->periph = devm_kcalloc(chip->dev, chip->num_periphs,
> +				     sizeof(*chip->periph), GFP_KERNEL);
> +	if (!chip->periph)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < chip->num_periphs; i++) {
> +		rc = of_property_read_u32_index(node, "qcom,periph-map",
> +						i, &temp);
> +		if (rc < 0) {
> +			pr_err("Couldn't read qcom,periph-map[%d]
> rc=%d\n",

"Peripheral map entry %d is invalid"

> +			       i, rc);
> +			return rc;
> +		}
> +
> +		chip->periph[i].addr = (u16)(temp << 8);

Worth a comment I think.

> +		chip->periph[i].data = chip;

'data' is also not a great variable name, if you can avoid it.

> +		mutex_init(&chip->periph[i].lock);
> +	}
> +
> +	of_property_read_string(node, "pinctrl-names", &chip->pinctrl_name);
> +
> +	return rc;

Why return rc here?

> +}
> +
> +#define MAX_I2C_RETRIES	3

Why 3?

> +static int i2c_pmic_read(struct regmap *map, unsigned int reg, void *val,
> +			size_t val_count)
> +{
> +	int rc, retries = 0;
> +
> +	do {
> +		rc = regmap_bulk_read(map, reg, val, val_count);
> +	} while (rc == -ENOTCONN && retries++ < MAX_I2C_RETRIES);
> +
> +	if (retries > 1)
> +		pr_err("i2c_pmic_read failed for %d retries, rc = %d\n",
> +			retries - 1, rc);

Is this always an error?

Why would the user care if it failed once, then succeeded?

> +	return rc;
> +}
> +
> +static int i2c_pmic_determine_initial_status(struct i2c_pmic *chip)
> +{
> +	int rc, i;
> +
> +	for (i = 0; i < chip->num_periphs; i++) {
> +		rc = i2c_pmic_read(chip->regmap,
> +				chip->periph[i].addr | INT_SET_TYPE_OFFSET,
> +				chip->periph[i].cached, IRQ_MAX_REGS);
> +		if (rc < 0) {
> +			pr_err("Couldn't read irq data rc=%d\n", rc);

"IRQ"

> +			return rc;
> +		}
> +
> +		memcpy(chip->periph[i].synced, chip->periph[i].cached,
> +		       IRQ_MAX_REGS * sizeof(*chip->periph[i].synced));
> +	}
> +
> +	return 0;
> +}
> +
> +static struct regmap_config i2c_pmic_regmap_config = {
> +	.reg_bits	= 16,
> +	.val_bits	= 8,
> +	.max_register	= 0xFFFF,
> +};
> +
> +static int i2c_pmic_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	struct i2c_pmic *chip;

We usually call this ddata.  Especially relevant as you are storing it
in *driver_data for reclaim in the functions above.

> +	int rc = 0;

'ret' is by far the more common name for this.

$ git grep "int ret[;\|,]" | wc -l
39365
$ git grep "int rc[;\|,]" | wc -l
6761

Let's keep things as consistent as possible please.

> +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev = &client->dev;
> +	chip->regmap = devm_regmap_init_i2c(client, &i2c_pmic_regmap_config);
> +	if (!chip->regmap)
> +		return -ENODEV;
> +
> +	i2c_set_clientdata(client, chip);

'\n'

> +	if (!of_property_read_bool(chip->dev->of_node, "interrupt-controller"))
> +		goto probe_children;
> +
> +	chip->domain = irq_domain_add_tree(client->dev.of_node,
> +					   &i2c_pmic_domain_ops, chip);
> +	if (!chip->domain) {
> +		rc = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	rc = i2c_pmic_parse_dt(chip);
> +	if (rc < 0) {

If you return an error or 0 here, you can change this to:

if (rc)

> +		pr_err("Couldn't parse device tree rc=%d\n", rc);

Looks like you already have prints in i2c_pmic_parse_dt().

No need for an additional one.

> +		goto cleanup;
> +	}
> +
> +	rc = i2c_pmic_determine_initial_status(chip);
> +	if (rc < 0) {
> +		pr_err("Couldn't determine initial status rc=%d\n", rc);

As above.

> +		goto cleanup;
> +	}
> +
> +	if (chip->pinctrl_name) {
> +		chip->pinctrl = devm_pinctrl_get_select(chip->dev,
> +							chip->pinctrl_name);
> +		if (IS_ERR(chip->pinctrl)) {
> +			pr_err("Couldn't select %s pinctrl rc=%ld\n",
> +				chip->pinctrl_name, PTR_ERR(chip->pinctrl));
> +			rc = PTR_ERR(chip->pinctrl);

Do this before the print, then you only need to do it once.

> +			goto cleanup;
> +		}
> +	}
> +
> +	chip->resume_completed = true;

Why can't you disable interrupts before suspending?

> +	mutex_init(&chip->irq_complete);
> +
> +	rc = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> +				       i2c_pmic_irq_handler,
> +				       IRQF_ONESHOT | IRQF_SHARED,
> +				       "i2c_pmic_stat_irq", chip);
> +	if (rc < 0) {
> +		pr_err("Couldn't request irq %d rc=%d\n", client->irq, rc);

"IRQ"

> +		goto cleanup;
> +	}
> +
> +	chip->summary_irq = client->irq;
> +	enable_irq_wake(client->irq);
> +
> +probe_children:
> +	of_platform_populate(chip->dev->of_node, NULL, NULL, chip->dev);

devm_*?

> +	pr_info("I2C PMIC probe successful\n");

This is superfluous, please remove it.

'\n' here.

> +	return rc;
> +
> +cleanup:
> +	if (chip->domain)
> +		irq_domain_remove(chip->domain);
> +	i2c_set_clientdata(client, NULL);

'\n' here.

> +	return rc;
> +}
> +
> +static int i2c_pmic_remove(struct i2c_client *client)
> +{
> +	struct i2c_pmic *chip = i2c_get_clientdata(client);
> +
> +	of_platform_depopulate(chip->dev);

If you use devm_* this becomes superfluous.

> +	if (chip->domain)
> +		irq_domain_remove(chip->domain);

'\n' here.

> +	i2c_set_clientdata(client, NULL);

'\n' here.

> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int i2c_pmic_suspend_noirq(struct device *dev)
> +{
> +	struct i2c_pmic *chip = dev_get_drvdata(dev);
> +
> +	if (chip->irq_waiting) {
> +		pr_err_ratelimited("Aborting suspend, an interrupt was detected while suspending\n");
> +		return -EBUSY;

I haven't seen this before.  Why does this platform require it?

What happens when you return early from .suspend_noirq?

Does this system just resume?

> +	}

'\n' here.

> +	return 0;
> +}
> +
> +static int i2c_pmic_suspend(struct device *dev)
> +{
> +	struct i2c_pmic *chip = dev_get_drvdata(dev);
> +	struct i2c_pmic_periph *periph;
> +	int rc = 0, i;
> +
> +	for (i = 0; i < chip->num_periphs; i++) {
> +		periph = &chip->periph[i];
> +
> +		rc = regmap_write(chip->regmap,
> +				  periph->addr | INT_EN_CLR_OFFSET, 0xFF);
> +		if (rc < 0) {
> +			pr_err_ratelimited("Couldn't clear 0x%04x irqs rc=%d\n",

"IRQs"

Same goes for all the other mentions of it.

> +				periph->addr, rc);
> +			continue;
> +		}
> +
> +		rc = regmap_write(chip->regmap,
> +				  periph->addr | INT_EN_SET_OFFSET,
> +				  periph->wake);
> +		if (rc < 0)
> +			pr_err_ratelimited("Couldn't enable 0x%04x wake irqs 0x%02x rc=%d\n",
> +			       periph->addr, periph->wake, rc);
> +	}

'\n' here.

> +	if (!rc) {
> +		mutex_lock(&chip->irq_complete);
> +		chip->resume_completed = false;
> +		mutex_unlock(&chip->irq_complete);
> +	}
> +
> +	return rc;
> +}
> +
> +static int i2c_pmic_resume(struct device *dev)
> +{
> +	struct i2c_pmic *chip = dev_get_drvdata(dev);
> +	struct i2c_pmic_periph *periph;
> +	int rc = 0, i;
> +
> +	for (i = 0; i < chip->num_periphs; i++) {
> +		periph = &chip->periph[i];
> +
> +		rc = regmap_write(chip->regmap,
> +				  periph->addr | INT_EN_CLR_OFFSET, 0xFF);
> +		if (rc < 0) {
> +			pr_err("Couldn't clear 0x%04x irqs rc=%d\n",
> +				periph->addr, rc);
> +			continue;
> +		}
> +
> +		rc = regmap_write(chip->regmap,
> +				  periph->addr | INT_EN_SET_OFFSET,
> +				  periph->synced[IRQ_EN_SET]);
> +		if (rc < 0)
> +			pr_err("Couldn't restore 0x%04x synced irqs 0x%02x rc=%d\n",
> +			       periph->addr, periph->synced[IRQ_EN_SET], rc);
> +	}
> +
> +	mutex_lock(&chip->irq_complete);
> +	chip->resume_completed = true;

'\n' here.

> +	if (chip->irq_waiting) {
> +		mutex_unlock(&chip->irq_complete);

Move this above the if(), then you can remove it from the else too.

> +		/* irq was pending, call the handler */
> +		i2c_pmic_irq_handler(chip->summary_irq, chip);
> +		enable_irq(chip->summary_irq);
> +	} else {
> +		mutex_unlock(&chip->irq_complete);
> +	}
> +
> +	return rc;
> +}
> +#else
> +static int i2c_pmic_suspend(struct device *dev)
> +{
> +	return 0;
> +}
> +static int i2c_pmic_resume(struct device *dev)
> +{
> +	return 0;
> +}
> +static int i2c_pmic_suspend_noirq(struct device *dev)
> +{
> +	return 0
> +}
> +#endif
> +static const struct dev_pm_ops i2c_pmic_pm_ops = {
> +	.suspend	= i2c_pmic_suspend,
> +	.suspend_noirq	= i2c_pmic_suspend_noirq,
> +	.resume		= i2c_pmic_resume,
> +};

See how drivers/mfd/arizona-core.c removes all of this boilerplate.

> +static const struct of_device_id i2c_pmic_match_table[] = {
> +	{ .compatible = "qcom,i2c-pmic", },
> +	{ },
> +};
> +static const struct i2c_device_id i2c_pmic_id[] = {
> +	{ "i2c-pmic", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, i2c_pmic_id);

If you use probe_new, you can remove this table altogether.

> +static struct i2c_driver i2c_pmic_driver = {
> +	.driver		= {
> +		.name		= "i2c_pmic",
> +		.pm		= &i2c_pmic_pm_ops,
> +		.of_match_table	= i2c_pmic_match_table,
> +	},
> +	.probe		= i2c_pmic_probe,
> +	.remove		= i2c_pmic_remove,
> +	.id_table	= i2c_pmic_id,
> +};
> +

Remove this line.

> +module_i2c_driver(i2c_pmic_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("i2c:i2c_pmic");

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
