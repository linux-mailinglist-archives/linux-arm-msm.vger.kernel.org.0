Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD921C0B87
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 03:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgEABNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 21:13:21 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:19053 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727114AbgEABNU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 21:13:20 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 30 Apr 2020 18:13:19 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg05-sd.qualcomm.com with ESMTP; 30 Apr 2020 18:13:19 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 593334CF9; Thu, 30 Apr 2020 18:13:19 -0700 (PDT)
Date:   Thu, 30 Apr 2020 18:13:19 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] mfd: Introduce QTI I2C PMIC controller
Message-ID: <20200501011319.GA28441@codeaurora.org>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <cover.1588115326.git.gurus@codeaurora.org>
 <5644dea146f8b49a5b827c56392ff916bfb343e9.1588115326.git.gurus@codeaurora.org>
 <20200429075010.GX3559@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429075010.GX3559@dell>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 29, 2020 at 08:50:10AM +0100, Lee Jones wrote:
> On Tue, 28 Apr 2020, Guru Das Srinagesh wrote:
> 
> > The Qualcomm Technologies, Inc. I2C PMIC Controller is used by
> > multi-function PMIC devices which communicate over the I2C bus.  The
> > controller enumerates all child nodes as platform devices, and
> > instantiates a regmap interface for them to communicate over the I2C
> > bus.
> > 
> > The controller also controls interrupts for all of the children platform
> > devices.  The controller handles the summary interrupt by deciphering
> > which peripheral triggered the interrupt, and which of the peripheral
> > interrupts were triggered.  Finally, it calls the interrupt handlers for
> > each of the virtual interrupts that were registered.
> > 
> > Nicholas Troast is the original author of this driver.
> > 
> > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > ---
> >  drivers/mfd/Kconfig         |  11 +
> >  drivers/mfd/Makefile        |   1 +
> >  drivers/mfd/qcom-i2c-pmic.c | 737 ++++++++++++++++++++++++++++++++++++++++++++
> 
> The vast majority of this driver deals with IRQ handling.  Why can't
> this be split out into its own IRQ Chip driver and moved to
> drivers/irqchip?

There appear to be quite a few in-tree MFD drivers that register IRQ
controllers, like this driver does:

$ grep --exclude-dir=.git -rnE "irq_domain_(add|create).+\(" drivers/mfd | wc -l
23

As a further example, drivers/mfd/stpmic1.c closely resembles this
driver in that it uses both devm_regmap_add_irq_chip() as well as
devm_of_platform_populate().

As such, it seems like this driver is in line with some of the
architectural choices that have been accepted in already-merged drivers.
Could you please elaborate on your concerns?

> 
> >  3 files changed, 749 insertions(+)
> >  create mode 100644 drivers/mfd/qcom-i2c-pmic.c
> 
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 54b6aa4..bf112eb 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -1002,6 +1002,17 @@ config MFD_PM8XXX
> >  	  Say M here if you want to include support for PM8xxx chips as a
> >  	  module. This will build a module called "pm8xxx-core".
> >  
> > +config MFD_I2C_PMIC
> 
> Too generic.  This should identify the vendor too.

Will change to MFD_QCOM_I2C_PMIC.

> 
> > +	tristate "QTI I2C PMIC support"
> 
> Why aren't you using QCOM?
> 
> Actually, this should be expanded here anyway.

Will expand this to "Qualcomm Technologies, Inc. I2C PMIC support".

> 
> > +	depends on I2C && OF
> > +	select IRQ_DOMAIN
> > +	select REGMAP_I2C
> > +	help
> > +	  This enables support for controlling Qualcomm Technologies, Inc.
> > +	  PMICs over I2C. The driver controls interrupts, and provides register
> > +	  access for all of the device's peripherals.  Some QTI PMIC chips
> > +	  support communication over both I2C and SPMI.
> > +
> >  config MFD_QCOM_RPM
> >  	tristate "Qualcomm Resource Power Manager (RPM)"
> >  	depends on ARCH_QCOM && OF
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 7761f84..26f0b80 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -199,6 +199,7 @@ obj-$(CONFIG_MFD_SI476X_CORE)	+= si476x-core.o
> >  obj-$(CONFIG_MFD_CS5535)	+= cs5535-mfd.o
> >  obj-$(CONFIG_MFD_OMAP_USB_HOST)	+= omap-usb-host.o omap-usb-tll.o
> >  obj-$(CONFIG_MFD_PM8XXX) 	+= qcom-pm8xxx.o ssbi.o
> > +obj-$(CONFIG_MFD_I2C_PMIC)     += qcom-i2c-pmic.o
> >  obj-$(CONFIG_MFD_QCOM_RPM)	+= qcom_rpm.o
> >  obj-$(CONFIG_MFD_SPMI_PMIC)	+= qcom-spmi-pmic.o
> >  obj-$(CONFIG_TPS65911_COMPARATOR)	+= tps65911-comparator.o
> > diff --git a/drivers/mfd/qcom-i2c-pmic.c b/drivers/mfd/qcom-i2c-pmic.c
> > new file mode 100644
> > index 0000000..d0f600a
> > --- /dev/null
> > +++ b/drivers/mfd/qcom-i2c-pmic.c
> > @@ -0,0 +1,737 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> 
> This is very out of date.

It is internal company policy to update the copyright year only for
those years when a change was made to the driver. Since this driver hasn't
been modified since 2018, the copyright year has also been static since
then. Otherwise, the driver is very much current functionality-wise.

What modification would you suggest for the copyright year?

> 
> > + */
> > +
> > +#define pr_fmt(fmt) "I2C PMIC: %s: " fmt, __func__
> 
> Please don't role your own debug helpers.
> 
> The ones the kernel provides are suitably proficient.

Sure. Would this be acceptable instead, with the custom string replaced by a
macro that the kernel provides?

	#define pr_fmt(fmt) "%s: %s: " fmt, KBUILD_MODNAME, __func__

> 
> > +#include <linux/bitops.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/pinctrl/consumer.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +
> > +#define I2C_INTR_STATUS_BASE	0x0550
> > +#define INT_RT_STS_OFFSET	0x10
> > +#define INT_SET_TYPE_OFFSET	0x11
> > +#define INT_POL_HIGH_OFFSET	0x12
> > +#define INT_POL_LOW_OFFSET	0x13
> > +#define INT_LATCHED_CLR_OFFSET	0x14
> > +#define INT_EN_SET_OFFSET	0x15
> > +#define INT_EN_CLR_OFFSET	0x16
> > +#define INT_LATCHED_STS_OFFSET	0x18
> > +#define INT_PENDING_STS_OFFSET	0x19
> > +#define INT_MID_SEL_OFFSET	0x1A
> > +#define INT_MID_SEL_MASK	GENMASK(1, 0)
> > +#define INT_PRIORITY_OFFSET	0x1B
> > +#define INT_PRIORITY_BIT	BIT(0)
> > +
> > +enum {
> > +	IRQ_SET_TYPE = 0,
> > +	IRQ_POL_HIGH,
> > +	IRQ_POL_LOW,
> > +	IRQ_LATCHED_CLR, /* not needed but makes life easy */
> 
> "Not"
> 
> It doesn't matter if the value is not used.
> 
> I think you can drop the comment.

Done.

> 
> > +	IRQ_EN_SET,
> > +	IRQ_MAX_REGS,
> > +};
> 
> Going to stop here for a second, as the vast majority of the remainder
> of the driver appears to surround IRQ management.

(Please see my first comment above.)

Thank you.

Guru Das.
