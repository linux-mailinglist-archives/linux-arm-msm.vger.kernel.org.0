Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D27611A886D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 20:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407754AbgDNSEQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 14:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407749AbgDNSEM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 14:04:12 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF95C061A0E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 11:04:11 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id j16so11220469oih.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 11:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6WqmSXSi9EdVJyFZFkXzA4X6BZbIOZ3xG02QGAejBsY=;
        b=uBZIsx99MMBmy+lddwV3dkMiuJoKO4iwRC/K0drY2Ru57sHJqoFjZS5V6u9Z2jM/sW
         xhw+PCne2XC6a52HUOMAlDTAuWrHU68HOilG+DNG0dRXYUZJ6snc96yc1nB5iYPziS10
         SRITIA5cEmV2c7Q+ra2dCgSrEaKf5WAuKvhBpV7XhRTlHKGM18nXJL+EE+fpI1wv0OO6
         nZJGWyN7Hhy+2zShom+GvVcgzJgTEbHH0BcioMZSI1s9l9coCfN6TTt19Rv7LyNsFNby
         l/85fXhyinOzoi7He2YOgM0rBhZC0qRLLhuHrajMIH+UjY/u97SmHmZd5B4RXH/pq0vH
         n96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6WqmSXSi9EdVJyFZFkXzA4X6BZbIOZ3xG02QGAejBsY=;
        b=iWgNg/DoAjCa4rb/IGz+L5nDTRMoSY8ci1jpEIoBRsRFGo+nToB0Yz4Z8xcqjTa1l+
         EXPtwSmYiEHCmZvGb5r54yaPpE+OOKRa7fCxwKVEAWJybIdGlUP0rBhJZ3JKAEt4kzNU
         l01GONtu6YX3xWeZa+8SPiBzIzYYesiAo2+Gpx6mxQ025wn3aDRCDgX7mvM61/DU9Cs7
         JlNXwVL0Zrn7yhvUblQN9VNSQHps1C5JUgpvDlsrl+xQQ1WiqBl0b+rjcITnhPj1l3oA
         RDLq7b9mGvFy5NZI74tfxziOQY0vzPrz590B9gV19cWasZW4k8uUA4EVSASVH2N0odbG
         JyuQ==
X-Gm-Message-State: AGi0PuaR7AM6kTeQwLUmMNIjKSiMFk1f/4VAORG8V9adDEb2ry/zRb+X
        GGpUFO79rUJxhwkQ23QW3krAYfPte19hZHklloeSXg==
X-Google-Smtp-Source: APiQypJ8H9xEtyyrsY14CYAiWoUS1tzgTzFMTb8Q5PVdJHfi1xbdy2wkHnYJh5zwto9tnYh1yS8GFrHPELRdRXKDixk=
X-Received: by 2002:aca:d684:: with SMTP id n126mr10926536oig.173.1586887450723;
 Tue, 14 Apr 2020 11:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200413170107.246509-1-robert.marko@sartura.hr> <20200413184219.GH557892@lunn.ch>
In-Reply-To: <20200413184219.GH557892@lunn.ch>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 14 Apr 2020 20:03:59 +0200
Message-ID: <CA+HBbNE_-Pjr6dZ3qjgk1MiaT3PL9eUgs=XfK-ohkWDCR9yfZA@mail.gmail.com>
Subject: Re: [PATCH 1/3] net: phy: mdio: add IPQ40xx MDIO driver
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     f.fainelli@gmail.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 13, 2020 at 8:42 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > --- a/drivers/net/phy/Makefile
> > +++ b/drivers/net/phy/Makefile
> > @@ -36,6 +36,7 @@ obj-$(CONFIG_MDIO_CAVIUM)   += mdio-cavium.o
> >  obj-$(CONFIG_MDIO_GPIO)              += mdio-gpio.o
> >  obj-$(CONFIG_MDIO_HISI_FEMAC)        += mdio-hisi-femac.o
> >  obj-$(CONFIG_MDIO_I2C)               += mdio-i2c.o
> > +obj-$(CONFIG_MDIO_IPQ40XX)   += mdio-ipq40xx.o
> >  obj-$(CONFIG_MDIO_MOXART)    += mdio-moxart.o
> >  obj-$(CONFIG_MDIO_MSCC_MIIM) += mdio-mscc-miim.o
>
> Hi Robert
>
> That looks odd. What happened to the
>
> obj-$(CONFIG_MDIO_IPQ8064)      += mdio-ipq8064.o
>
Sorry, this was based off kernel 5.6 instead of net-next.
> >  obj-$(CONFIG_MDIO_OCTEON)    += mdio-octeon.o
> > diff --git a/drivers/net/phy/mdio-ipq40xx.c b/drivers/net/phy/mdio-ipq40xx.c
> > new file mode 100644
> > index 000000000000..8068f1e6a077
> > --- /dev/null
> > +++ b/drivers/net/phy/mdio-ipq40xx.c
> > @@ -0,0 +1,180 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> > +/* Copyright (c) 2015, The Linux Foundation. All rights reserved. */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/io.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_mdio.h>
> > +#include <linux/phy.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define MDIO_CTRL_0_REG              0x40
> > +#define MDIO_CTRL_1_REG              0x44
> > +#define MDIO_CTRL_2_REG              0x48
> > +#define MDIO_CTRL_3_REG              0x4c
> > +#define MDIO_CTRL_4_REG              0x50
>
> Can we have better names than as. It seems like 3 is read data, 2 is
> write data, etc.
I agree these ones don't really tell whats the function.
Unfortunately, I don't have access to documentation and this is all based on
GPL code from Qualcomm's SDK.
So I don't really know whats their purpose.
It has been floating around for years, so I thought that it would be good to
clean it up and upstream.
>
> > +#define MDIO_CTRL_4_ACCESS_BUSY              BIT(16)
> > +#define MDIO_CTRL_4_ACCESS_START             BIT(8)
> > +#define MDIO_CTRL_4_ACCESS_CODE_READ         0
> > +#define MDIO_CTRL_4_ACCESS_CODE_WRITE        1
> > +#define CTRL_0_REG_DEFAULT_VALUE     0x150FF
>
> No magic numbers please. Try to explain what each of these bits
> do. I'm guessing they are clock speed, preamble enable, maybe C22/C45?
Fortunately, it seems that this is a leftover from early preproduction HW as
my test boards work without it.
Something similar was the case in other Qualcomm SDK drivers.
So, this will be dropped in v2.
>
> > +
> > +#define IPQ40XX_MDIO_RETRY   1000
> > +#define IPQ40XX_MDIO_DELAY   10
> > +
> > +struct ipq40xx_mdio_data {
> > +     struct mii_bus  *mii_bus;
> > +     void __iomem    *membase;
> > +     struct device   *dev;
> > +};
> > +
> > +static int ipq40xx_mdio_wait_busy(struct ipq40xx_mdio_data *am)
> > +{
> > +     int i;
> > +
> > +     for (i = 0; i < IPQ40XX_MDIO_RETRY; i++) {
> > +             unsigned int busy;
> > +
> > +             busy = readl(am->membase + MDIO_CTRL_4_REG) &
> > +                     MDIO_CTRL_4_ACCESS_BUSY;
> > +             if (!busy)
> > +                     return 0;
> > +
> > +             /* BUSY might take to be cleard by 15~20 times of loop */
> > +             udelay(IPQ40XX_MDIO_DELAY);
> > +     }
> > +
> > +     dev_err(am->dev, "%s: MDIO operation timed out\n", am->mii_bus->name);
>
> dev_err() should give you enough to identify the device. No need to
> print am->mii_bus->name as well.
It will be fixed in v2, thanks.
>
> > +
> > +     return -ETIMEDOUT;
> > +}
> > +
> > +static int ipq40xx_mdio_read(struct mii_bus *bus, int mii_id, int regnum)
> > +{
> > +     struct ipq40xx_mdio_data *am = bus->priv;
> > +     int value = 0;
> > +     unsigned int cmd = 0;
> > +
> > +     lockdep_assert_held(&bus->mdio_lock);
>
> Do you think the core is broken?
No, this is also an old relic from the SDK driver.
It works without this perfectly fine, so I will drop it from v2.
>
> Please check if the request is for a C45 read, and return -EOPNOTSUPP
> if so.
It will be added to v2, thanks.
>
>
> > +
> > +     if (ipq40xx_mdio_wait_busy(am))
> > +             return -ETIMEDOUT;
> > +
> > +     /* issue the phy address and reg */
> > +     writel((mii_id << 8) | regnum, am->membase + MDIO_CTRL_1_REG);
> > +
> > +     cmd = MDIO_CTRL_4_ACCESS_START | MDIO_CTRL_4_ACCESS_CODE_READ;
> > +
> > +     /* issue read command */
> > +     writel(cmd, am->membase + MDIO_CTRL_4_REG);
> > +
> > +     /* Wait read complete */
> > +     if (ipq40xx_mdio_wait_busy(am))
> > +             return -ETIMEDOUT;
> > +
> > +     /* Read data */
> > +     value = readl(am->membase + MDIO_CTRL_3_REG);
> > +
> > +     return value;
> > +}
> > +
> > +static int ipq40xx_mdio_write(struct mii_bus *bus, int mii_id, int regnum,
> > +                                                      u16 value)
> > +{
> > +     struct ipq40xx_mdio_data *am = bus->priv;
> > +     unsigned int cmd = 0;
> > +
> > +     lockdep_assert_held(&bus->mdio_lock);
> > +
> > +     if (ipq40xx_mdio_wait_busy(am))
> > +             return -ETIMEDOUT;
> > +
> > +     /* issue the phy address and reg */
> > +     writel((mii_id << 8) | regnum, am->membase + MDIO_CTRL_1_REG);
> > +
> > +     /* issue write data */
> > +     writel(value, am->membase + MDIO_CTRL_2_REG);
> > +
> > +     cmd = MDIO_CTRL_4_ACCESS_START | MDIO_CTRL_4_ACCESS_CODE_WRITE;
> > +     /* issue write command */
> > +     writel(cmd, am->membase + MDIO_CTRL_4_REG);
> > +
> > +     /* Wait write complete */
> > +     if (ipq40xx_mdio_wait_busy(am))
> > +             return -ETIMEDOUT;
> > +
> > +     return 0;
> > +}
> > +
> > +static int ipq40xx_mdio_probe(struct platform_device *pdev)
> > +{
> > +     struct ipq40xx_mdio_data *am;
>
> Why the name am? Generally priv is used. I could also understand bus,
> or even data, but am?
Like most stuff in this driver, its a leftover from the SDK driver.
I have changed it to priv in v2, also I switched the driver to
devm_mdiobus_alloc_size() to
try and simplify/modernize the driver also.

Thanks for the suggestions.
I will send a v2 soon.

Best regards,
Andrew
>
>    Andrew
