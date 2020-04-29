Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDA01BD689
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 09:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgD2HuQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 03:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726175AbgD2HuP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 03:50:15 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE93C03C1AD
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 00:50:15 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g13so1256759wrb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 00:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zK0JgSazAWJ2DYzIpBrk5SuXGsVgafJjJrHjjjF4QEI=;
        b=q8hFA/yZXii6r1TMX0TgCgORl7m1G8odWD97j7WJHg+WZga+OmVbxDM3y4VZAQNEZA
         wfY9AqyYrsmt3fxW531SYmzJijAbLfW5WXcX5e+UAVSWtljgwWUjVFVlfGIAXUQh02RP
         FjKuW1LNfl0fJ/QpL7Jfe3CxGVJHJaV9pQ20mr8nDfjVCq5vrQOGye2XUwFWbWKqCqrU
         7btV9uhmQ0h7QDmHVWXcF8qVaJRXeKZp2aLPEqRhT2JgjWya6glR404kfjD447gBpEMO
         3OUL0jLvRDTctKhknf/TnsAc/KoEKLEG6lfQrLRfowjQcPdLxOWQOIp0G7e2FEEQUntw
         NWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zK0JgSazAWJ2DYzIpBrk5SuXGsVgafJjJrHjjjF4QEI=;
        b=Axick15wXQlpf4ldP1/zIxwPKvpHMKOmbnbospM5PULTK8iMoAn+RQB50teaiS79QH
         b2txaj3DOGtss2omxSVNbFCTTcQhGaMNMGBOx5NDTKL26cy6VbMYzauxda15yba42pwp
         BF3rYnkwNPX2G7Z/YnoYHWb90SS/zaedweTll7uNEbFbvvyxeL9KS+QwwqRYMNbIbkLA
         uBH1ecihxhfdqp9CmNDYnR8t3SGDZ34PVm8RhI9nnYkkTzvdIURzhtRsy8iJIGnYMHhL
         JbK3hgXKhZycnX8Gf7xtSa0ScpiQvvQDPGSb8Qer/vZ7VLrJU0zZ61AFEnQyHP0VBrBH
         VZJA==
X-Gm-Message-State: AGi0PuY6/IIKM2x8bj3rR5vfetK5sCZ4ojkIMIfAPiEx9BUBeQ2ty8pZ
        ivsZdN2yby4mwOuJ94dYCHjAAQ==
X-Google-Smtp-Source: APiQypLM3lN3rGdfSMrJGzuhpRRPiDBdyd3CgLxNoIeBVXjlM1CuGYLMJlf+uDFnYw5bbKjL1Kjhog==
X-Received: by 2002:a5d:480b:: with SMTP id l11mr40964935wrq.25.1588146613874;
        Wed, 29 Apr 2020 00:50:13 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id u188sm6727365wmg.37.2020.04.29.00.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 00:50:12 -0700 (PDT)
Date:   Wed, 29 Apr 2020 08:50:10 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] mfd: Introduce QTI I2C PMIC controller
Message-ID: <20200429075010.GX3559@dell>
References: <cover.1588115326.git.gurus@codeaurora.org>
 <5644dea146f8b49a5b827c56392ff916bfb343e9.1588115326.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5644dea146f8b49a5b827c56392ff916bfb343e9.1588115326.git.gurus@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 28 Apr 2020, Guru Das Srinagesh wrote:

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
> 
> Nicholas Troast is the original author of this driver.
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  drivers/mfd/Kconfig         |  11 +
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/qcom-i2c-pmic.c | 737 ++++++++++++++++++++++++++++++++++++++++++++

The vast majority of this driver deals with IRQ handling.  Why can't
this be split out into its own IRQ Chip driver and moved to
drivers/irqchip?

>  3 files changed, 749 insertions(+)
>  create mode 100644 drivers/mfd/qcom-i2c-pmic.c

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 54b6aa4..bf112eb 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1002,6 +1002,17 @@ config MFD_PM8XXX
>  	  Say M here if you want to include support for PM8xxx chips as a
>  	  module. This will build a module called "pm8xxx-core".
>  
> +config MFD_I2C_PMIC

Too generic.  This should identify the vendor too.

> +	tristate "QTI I2C PMIC support"

Why aren't you using QCOM?

Actually, this should be expanded here anyway.

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

This is very out of date.

> + */
> +
> +#define pr_fmt(fmt) "I2C PMIC: %s: " fmt, __func__

Please don't role your own debug helpers.

The ones the kernel provides are suitably proficient.

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
> +
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

"Not"

It doesn't matter if the value is not used.

I think you can drop the comment.

> +	IRQ_EN_SET,
> +	IRQ_MAX_REGS,
> +};

Going to stop here for a second, as the vast majority of the remainder
of the driver appears to surround IRQ management.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
