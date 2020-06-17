Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5D41FD336
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 19:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgFQROK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 13:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgFQROJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 13:14:09 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2579C06174E
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 10:14:07 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id n22so751012vkm.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 10:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JOY1l8xgfbg/yocZCf5EyJ50x3P+Us55PL0tdjs++n0=;
        b=Gtxn+CfkAztV5LlGzlR68soPB+aRgFZF/cnYvVs2szVoBHaWPBRtFXbmz6+GvH2Ld2
         5f8+WT8zbMutCEKd02SGi34c05t5ex4cNi2yDXV3i3SQ1XuS4Soh4IQ7pIa4OEJDiG4u
         bG2qi+/HLzUaE2Haot+oLolqO/z/YGCYaDR0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JOY1l8xgfbg/yocZCf5EyJ50x3P+Us55PL0tdjs++n0=;
        b=nGdrQ5hAn/t//7glvgUB06mYL4AOd/xyq0Kugja3F+LixUQJE6LkBbdf2u2TvqBByT
         GIPEhTLfoNBG2PCeA/Zif1ZNGT84+Vkx8yliojeyNBBD7QrckRq/ZFdh0eJB36dSNjm1
         x2mmwpJKpPXq31YV9CxS6hYzHy7vPpsh6Ude6uI4UbNlXV2GnXGIbETgmv3YsRvGHCSv
         Ss/fpAEokqn70ZHXgAiojxsfnxnTyqPNil539RI6oCN1jz+OPui950hopPCreWIrGiyS
         6AVLRhcTsY2uzvU7U6+Wee2aidxE/zwsBCGErcMy+bLdNsOIT7DEyeD9jYqspzEijFrA
         AV7Q==
X-Gm-Message-State: AOAM532CXVow96rIA5fR8J08ABFHd26k/2xXRILC8g0ugwRSTOa/DNSH
        bPv0JcF0SAFB1YAWn7jJxN+yba9PFnw=
X-Google-Smtp-Source: ABdhPJwiG9zwJeZg7MfiII4WvRgcIRR34nzg8PwJlaLf/AvIZqfKPahWBjtjqEReAZyJmng9qJ2nyQ==
X-Received: by 2002:ac5:ccf0:: with SMTP id k16mr343480vkn.95.1592414046249;
        Wed, 17 Jun 2020 10:14:06 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id i2sm35514vkp.22.2020.06.17.10.14.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 10:14:05 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id o2so1851890vsr.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 10:14:05 -0700 (PDT)
X-Received: by 2002:a67:1703:: with SMTP id 3mr128094vsx.169.1592414044517;
 Wed, 17 Jun 2020 10:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.3.I68222d0b5966f652f29dd3a73ab33551a6e3b7e0@changeid> <ca00ca5c-eb8b-5662-d73a-e222735347eb@linaro.org>
In-Reply-To: <ca00ca5c-eb8b-5662-d73a-e222735347eb@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Jun 2020 10:13:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9xZH9Sj6hE-T=hz64XeaEVOHjP40cj-koXpE5KCHDSQ@mail.gmail.com>
Message-ID: <CAD=FV=X9xZH9Sj6hE-T=hz64XeaEVOHjP40cj-koXpE5KCHDSQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] nvmem: qfprom: Add fuse blowing support
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, dhavalp@codeaurora.org,
        mturney@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 17, 2020 at 8:18 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Thanks Doug,
> Overall the patch is looking good, I have few minor comments below!
>
> On 17/06/2020 15:51, Douglas Anderson wrote:
> > From: Ravi Kumar Bokka <rbokka@codeaurora.org>
> >
> > This patch adds support for blowing fuses to the qfprom driver if the
> > required properties are defined in the device tree.
> >
> > Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Please double-check that I got the major/minor version logic right
> > here.  I don't have documentation for this, but Srinivas mentioned
> > that it was at address 0x6000 and I happened to find an "8" and a "7"
> > on sc7180 so I assumed that was the major and minor version.
> >
> > Changes in v3:
> > - Don't provide "reset" value for things; just save/restore.
> > - Use the major/minor version read from 0x6000.
> > - Reading should still read "corrected", not "raw".
> > - Added a sysfs knob to allow you to read "raw" instead of "corrected"
> > - Simplified the SoC data structure.
> > - No need for quite so many levels of abstraction for clocks/regulator.
> > - Don't set regulator voltage.  Rely on device tree to make sure it's right.
> > - Properly undo things in the case of failure.
> > - Don't just keep enabling the regulator over and over again.
> > - Enable / disable the clock each time
> > - Polling every 100 us but timing out in 10 us didn't make sense; swap.
> > - No reason for 100 us to be SoC specific.
> > - No need for reg-names.
> > - We shouldn't be creating two separate nvmem devices.
> >
> >   drivers/nvmem/qfprom.c | 314 +++++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 303 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> > index 8a91717600be..486202860f84 100644
> > --- a/drivers/nvmem/qfprom.c
> > +++ b/drivers/nvmem/qfprom.c
> > @@ -3,57 +3,349 @@
> >    * Copyright (C) 2015 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >    */
> >
> > +#include <linux/clk.h>
> >   #include <linux/device.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/kernel.h>
> >   #include <linux/module.h>
> >   #include <linux/mod_devicetable.h>
> > -#include <linux/io.h>
> >   #include <linux/nvmem-provider.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +/* Blow timer clock frequency in Mhz */
> > +#define QFPROM_BLOW_TIMER_OFFSET 0x03c
> > +
> > +/* Amount of time required to hold charge to blow fuse in micro-seconds */
> > +#define QFPROM_FUSE_BLOW_POLL_US     10
> > +#define QFPROM_FUSE_BLOW_TIMEOUT_US  100
> > +
> > +#define QFPROM_BLOW_STATUS_OFFSET    0x048
> > +#define QFPROM_BLOW_STATUS_BUSY              0x1
> > +#define QFPROM_BLOW_STATUS_READY     0x0
> > +
> > +#define QFPROM_ACCEL_OFFSET          0x044
> > +
> > +#define QFPROM_VERSION_OFFSET                0x0
> > +#define QFPROM_MAJOR_VERSION_SHIFT   28
> > +#define QFPROM_MAJOR_VERSION_MASK    0xf
> > +#define QFPROM_MINOR_VERSION_SHIFT   16
> > +#define QFPROM_MINOR_VERSION_MASK    0xf
>
> Using GENMASK here makes it much readable!
>
> ...
>
> >
> >   static int qfprom_probe(struct platform_device *pdev)
> >   {
> > +     struct nvmem_config econfig = {
> > +             .name = "qfprom",
> > +             .stride = 1,
> > +             .word_size = 1,
> > +             .reg_read = qfprom_reg_read,
> > +     };
> >       struct device *dev = &pdev->dev;
> >       struct resource *res;
> >       struct nvmem_device *nvmem;
> >       struct qfprom_priv *priv;
> > +     int ret;
> >
> >       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >       if (!priv)
> >               return -ENOMEM;
> >
> > +     /* The corrected section is always provided */
> >       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -     priv->base = devm_ioremap_resource(dev, res);
> > -     if (IS_ERR(priv->base))
> > -             return PTR_ERR(priv->base);
> > +     priv->qfpcorrected = devm_ioremap_resource(dev, res);
> > +     if (IS_ERR(priv->qfpcorrected))
> > +             return PTR_ERR(priv->qfpcorrected);
> >
> >       econfig.size = resource_size(res);
> >       econfig.dev = dev;
> >       econfig.priv = priv;
> >
> > +     priv->dev = dev;
> > +
> > +     /*
> > +      * If more than one region is provided then the OS has the ability
> > +      * to write.
> > +      */
> > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +     if (res) {
> > +             u32 version;
> > +             int major_version, minor_version;
> > +
> > +             priv->qfpraw = devm_ioremap_resource(dev, res);
> > +             if (IS_ERR(priv->qfpraw))
> > +                     return PTR_ERR(priv->qfpraw);
> > +             res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> > +             priv->qfpconf = devm_ioremap_resource(dev, res);
> > +             if (IS_ERR(priv->qfpconf))
> > +                     return PTR_ERR(priv->qfpconf);
> > +             res = platform_get_resource(pdev, IORESOURCE_MEM, 3);
> > +             priv->qfpsecurity = devm_ioremap_resource(dev, res);
> > +             if (IS_ERR(priv->qfpsecurity))
> > +                     return PTR_ERR(priv->qfpsecurity);
> > +
> > +             version = readl(priv->qfpsecurity + QFPROM_VERSION_OFFSET);
> > +             major_version = (version >> QFPROM_MAJOR_VERSION_SHIFT) &
> > +                             QFPROM_MAJOR_VERSION_MASK;
> > +             minor_version = (version >> QFPROM_MINOR_VERSION_SHIFT) &
> > +                             QFPROM_MINOR_VERSION_MASK;
> > +
> > +             if (major_version == 7 && minor_version == 8)
> > +                     priv->soc_data = &qfprom_7_8_data;
> > +
> > +             /* Only enable writing if we have SoC data. */
> > +             if (priv->soc_data)
> > +                     econfig.reg_write = qfprom_reg_write;
> > +     }
> > +
>
> <----------snip
> > +     priv->vcc = devm_regulator_get(&pdev->dev, "vcc");
> > +     if (IS_ERR(priv->vcc))
> > +             return PTR_ERR(priv->vcc);
> > +
> > +     priv->secclk = devm_clk_get_optional(dev, "sec");
> > +     if (IS_ERR(priv->secclk)) {
> > +             ret = PTR_ERR(priv->secclk);
> > +             if (ret != -EPROBE_DEFER)
> > +                     dev_err(dev, "sec error getting : %d\n", ret);
> > +             return ret;
> > +     }
> > +
> ----------->
> should you move both clk and regulator into the previous if (res) {}
> block? As I don't see them marked as optional for write cases.

Sure, I'll move them on the next version.  I will note that the
current version actually works fine but I guess since there currently
isn't actually a user of the clock/regulator in the non-write case
then we don't need to make the calls...  Why does it work fine the way
it is too?

* regulator_get() will automatically create a "dummy" regulator if one
isn't specified in the device tree, so there's no harm in the call.
If you actually need to know if a regulator is there you need to call
regulator_get_optional()

* clk_get_optional() will return NULL if a clock isn't specified in
the device tree and clock framework is fine with you passing NULL for
enable/disable/prepare/unprepare.  If you actually need to know if a
clock is there you need to call clk_get().

Amazing but true that the "optional" variants of the regulator and
clock code are effectively opposites of each other.  :-P


-Doug
