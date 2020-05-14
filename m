Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A571B1D2EB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 13:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgENLrr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 07:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENLrq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 07:47:46 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D96BC061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 04:47:46 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id r25so24265537oij.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 04:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8VhPOcX/YG/xDd11JGojADleD4pmQ/W7UZw5TAje7hI=;
        b=awjRKSMNQTza5RyEL6/a/xIfs1St8oN36Nx3KVg0pNC2Tgg3AoN/GTWp1/772dVKNh
         dTGL/PXCq/f0ruwa4RZYRVfXfCAinFxZ6y79RppvbrWViVOW9Lq4Ck+KLHojZ13Tb4dx
         96gJhCMlKCwadIHg8epwWhY/lzoPV3YO4xEC62M2gzdEU2oaFWOm2M5jshkLY4WGwlIX
         +wczSerVVertY81MwB+r61ygfEhbpymGRKgUPeXj971kwwzFDS0nOAeGATG008JrAh+A
         ifDbApTyor6UmTjy1r2k8zJ0fxdq2nyPjkdbKzPlJPC6Jf97xXQrXZtbXB33naSHJ6Yt
         0V2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8VhPOcX/YG/xDd11JGojADleD4pmQ/W7UZw5TAje7hI=;
        b=XkWZ+hFkFd5uFTg3TPVuS+F3L8BgmUEAc0Ttw80t1EA294191/UFIVqD/W47lxQx12
         pnIHCDwPPnpcfjU/a5yHwIa21yEgDQ8w5H9i4Sp0jHFJK8IXAGFmgoWCtETiswuHfYko
         ykw31ZZ8XobmdUJ4dujlsltaJ4kaCORO+STN9BnoLfgwd7GQODZADxHhpwtFIXFKviQV
         vMbbVU3L4rw1bRgmRuHVCgU4PJ8o0r5ukixR+gRvRyb3duHrxrkuc4L01EFhIYl4wDZE
         e7PDH8C/gxiMqIVdrfx0L05yrAN5SLPBcnGkv9uhLKit/Ozf0uUbgrxGW7PMk+imuH55
         BMcQ==
X-Gm-Message-State: AGi0PuYW+Lu8jW4uqrTSxF6XhT5G77GDOpohOYGVrzZOP87xvYtMyDMM
        sSj/TQFK7H2JrddRTw0E+jx/KH2t+lcDTnTyvUj0Kw==
X-Google-Smtp-Source: APiQypIIZirr0mlhp5xpy4rSvQu/jhtqn7g+5dNO1sunRU6rtxi09cQ2veO8qCl8xhb9IhpMUgn8Cnffs91qq6dcaz8=
X-Received: by 2002:aca:403:: with SMTP id 3mr31487698oie.166.1589456865611;
 Thu, 14 May 2020 04:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200508204200.13481-1-sumit.semwal@linaro.org>
 <20200508204200.13481-4-sumit.semwal@linaro.org> <20200512021509.GF57962@builder.lan>
In-Reply-To: <20200512021509.GF57962@builder.lan>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 14 May 2020 17:17:33 +0530
Message-ID: <CAO_48GHBgfVrs8Nn954rKayhKHFb3u0heXu0hTeXN=ENvfgK0Q@mail.gmail.com>
Subject: Re: [v2 3/4] regulator: qcom: Add labibb driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, lgirdwood@gmail.com,
        Mark Brown <broonie@kernel.org>, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Bjorn,

Thanks very much for the review.

On Tue, 12 May 2020 at 07:46, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 08 May 13:41 PDT 2020, Sumit Semwal wrote:
>
> > From: Nisha Kumari <nishakumari@codeaurora.org>
> >
> > Qualcomm platforms have LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost)
> > Regulators, labibb for short, which are used as power supply for
>
> lowercase Regulators
ok.
>
> > LCD Mode displays.
> >
> > This patch adds labibb regulator driver for pmi8998 pmic, found on
>
> Uppercase PMIC
>
ok.
> > SDM845 platforms.
> >
> > Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> >
> > --
> > v2: sumits: reworked the driver for more common code, and addressed
> >     review comments from v1. This includes merging regulator_ops into
> >     one, and allowing for future labibb variations.
> > ---
> >  drivers/regulator/Kconfig                 |  10 +
> >  drivers/regulator/Makefile                |   1 +
> >  drivers/regulator/qcom-labibb-regulator.c | 288 ++++++++++++++++++++++
> >  3 files changed, 299 insertions(+)
> >  create mode 100644 drivers/regulator/qcom-labibb-regulator.c
> >
> > diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> > index f4b72cb098ef..58704a9fd05d 100644
> > --- a/drivers/regulator/Kconfig
> > +++ b/drivers/regulator/Kconfig
> > @@ -1167,5 +1167,15 @@ config REGULATOR_WM8994
> >         This driver provides support for the voltage regulators on the
> >         WM8994 CODEC.
> >
> > +config REGULATOR_QCOM_LABIBB
> > +     tristate "QCOM LAB/IBB regulator support"
> > +     depends on SPMI || COMPILE_TEST
> > +     help
> > +       This driver supports Qualcomm's LAB/IBB regulators present on the
> > +       Qualcomm's PMIC chip pmi8998. QCOM LAB and IBB are SPMI
> > +       based PMIC implementations. LAB can be used as positive
> > +       boost regulator and IBB can be used as a negative boost regulator
> > +       for LCD display panel.
> > +
> >  endif
> >
> > diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> > index 6610ee001d9a..5b313786c0e8 100644
> > --- a/drivers/regulator/Makefile
> > +++ b/drivers/regulator/Makefile
> > @@ -87,6 +87,7 @@ obj-$(CONFIG_REGULATOR_MT6323)      += mt6323-regulator.o
> >  obj-$(CONFIG_REGULATOR_MT6358)       += mt6358-regulator.o
> >  obj-$(CONFIG_REGULATOR_MT6380)       += mt6380-regulator.o
> >  obj-$(CONFIG_REGULATOR_MT6397)       += mt6397-regulator.o
> > +obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
> >  obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
> >  obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
> >  obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
> > diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
> > new file mode 100644
> > index 000000000000..a9dc7c060375
> > --- /dev/null
> > +++ b/drivers/regulator/qcom-labibb-regulator.c
> > @@ -0,0 +1,288 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2019, The Linux Foundation. All rights reserved.
> > +
> > +#include <linux/module.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/driver.h>
> > +#include <linux/regulator/of_regulator.h>
> > +
> > +#define REG_PERPH_TYPE                  0x04
> > +#define QCOM_LAB_TYPE                        0x24
> > +#define QCOM_IBB_TYPE                        0x20
> > +
> > +#define REG_LABIBB_STATUS1           0x08
> > +#define REG_LABIBB_ENABLE_CTL                0x46
> > +#define LABIBB_STATUS1_VREG_OK_BIT   BIT(7)
> > +#define LABIBB_CONTROL_ENABLE                BIT(7)
> > +
> > +#define LAB_ENABLE_CTL_MASK          BIT(7)
> > +#define IBB_ENABLE_CTL_MASK          (BIT(7) | BIT(6))
> > +
> > +#define POWER_DELAY                  8000
> > +
> > +struct labibb_regulator {
> > +     struct regulator_desc           desc;
> > +     struct device                   *dev;
> > +     struct regmap                   *regmap;
> > +     struct regulator_dev            *rdev;
> > +     u16                             base;
> > +     u8                              type;
> > +};
> > +
> > +struct qcom_labibb {
>
> You pretty much use this as a local variable within probe, and then you
> use labibb_regulator in runtime. Perhaps you can just drop it?
>
Yes, you're right. It's probably a leftover from the re-design. I will drop it.
> > +     struct device                   *dev;
> > +     struct regmap                   *regmap;
> > +     struct labibb_regulator         lab;
> > +     struct labibb_regulator         ibb;
> > +};
> > +
> > +struct labibb_regulator_data {
> > +     u16                             base;
> > +     const char                      *name;
> > +     const char                      *irq_name;
> > +     u8                              type;
> > +};
> > +
> > +static int qcom_labibb_regulator_is_enabled(struct regulator_dev *rdev)
> > +{
> > +     int ret;
> > +     u8 val;
> > +     struct labibb_regulator *reg = rdev_get_drvdata(rdev);
> > +
> > +     ret = regmap_bulk_read(reg->regmap, reg->base +
> > +                            REG_LABIBB_STATUS1, &val, 1);
> > +     if (ret < 0) {
> > +             dev_err(reg->dev, "Read register failed ret = %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     if (val & LABIBB_STATUS1_VREG_OK_BIT)
> > +             return 1;
> > +     else
> > +             return 0;
>
>         return !!(val & LABIBB_STATUS1_VREG_OK_BIT);
>
> > +}
> > +
> > +static int _check_enabled_with_retries(struct regulator_dev *rdev,
> > +                     int retries, int enabled)
> > +{
> > +     int ret;
> > +     struct labibb_regulator *reg = rdev_get_drvdata(rdev);
> > +
> > +     while (retries--) {
>
> Mark's suggestion of extending _regulator_enable_delay() to support
> polling is_enable() seems reasonable.
>
> The only complication I can see is that code path currently doesn't have
> any expectations of the regulator not being operational at the end -
> this seems to offer that possibility. So some care needs to be taken
> there.
>
I think when I try Mark's suggestion, there will be a need to
communicate an error if we don't get a successful check of status
after the requested number of retries. So yes, I will try and take
care in the next iteration.
>
> But doing that would allow you to use regulator_enable_regmap() as your
> .enable function directly and you can drop
> qcom_labibb_regulator_enable()
>
Agreed.
> > +             /* Wait for a small period before checking REG_LABIBB_STATUS1 */
> > +             usleep_range(POWER_DELAY, POWER_DELAY + 200);
> > +
> > +             ret = qcom_labibb_regulator_is_enabled(rdev);
> > +
> > +             if (ret < 0) {
> > +                     dev_err(reg->dev, "Can't read %s regulator status\n",
> > +                             reg->desc.name);
> > +                     return ret;
> > +             }
> > +
> > +             if (ret == enabled)
> > +                     return ret;
> > +
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
> > +{
> > +     int ret, retries = 10;
> > +     struct labibb_regulator *reg = rdev_get_drvdata(rdev);
> > +
> > +     ret = regulator_enable_regmap(rdev);
> > +
> > +     if (ret < 0) {
> > +             dev_err(reg->dev, "Write failed: enable %s regulator\n",
> > +                     reg->desc.name);
> > +             return ret;
> > +     }
> > +
> > +     ret = _check_enabled_with_retries(rdev, retries, 1);
> > +     if (ret < 0) {
> > +             dev_err(reg->dev, "retries exhausted: enable %s regulator\n",
> > +                     reg->desc.name);
> > +             return ret;
> > +     }
> > +
> > +     if (ret)
> > +             return 0;
>
> This looks weird; check for timeout, check for errors and then return
> success.

Yes, it does look weird - that's because the
_check_enabled_with_retries returns 1 if it matches what you asked to
check (enable or disable via last argument). That should've been coded
differently.

It should go away with the above mentioned rework.
>
> > +
> > +
> > +     dev_err(reg->dev, "Can't enable %s\n", reg->desc.name);
> > +     return -EINVAL;
> > +}
> > +
> > +static int qcom_labibb_regulator_disable(struct regulator_dev *rdev)
> > +{
> > +     int ret, retries = 2;
> > +     struct labibb_regulator *reg = rdev_get_drvdata(rdev);
> > +
> > +     ret = regulator_disable_regmap(rdev);
> > +
> > +     if (ret < 0) {
> > +             dev_err(reg->dev, "Write failed: disable %s regulator\n",
> > +                     reg->desc.name);
> > +             return ret;
> > +     }
> > +
> > +     ret = _check_enabled_with_retries(rdev, retries, 0);
>
> I don't think we care about waiting for the regulator to turning off,
> might be nice to ensure that an off/on cycle really is allowed to take
> its time though. So specifying an desc->off_on_delay of 8200 * 2 (the
> worst case usleep_range() * retries) should take care of this.

Oh, that's neat. Will update.
>
> And then you should be able to just use regulator_disable_regmap() as
> your .disable function.
+1.
>
> > +     if (ret < 0) {
> > +             dev_err(reg->dev, "retries exhausted: disable %s regulator\n",
> > +                     reg->desc.name);
> > +             return ret;
> > +     }
> > +
> > +     if (!ret)
> > +             return 0;
> > +
> > +     dev_err(reg->dev, "Can't disable %s\n", reg->desc.name);
> > +     return -EINVAL;
> > +}
> > +
> > +static struct regulator_ops qcom_labibb_ops = {
> > +     .enable                 = qcom_labibb_regulator_enable,
> > +     .disable                = qcom_labibb_regulator_disable,
> > +     .is_enabled             = qcom_labibb_regulator_is_enabled,
> > +};
> > +
> > +static int register_labibb_regulator(struct qcom_labibb *labibb,
> > +                             const struct labibb_regulator_data *reg_data,
> > +                             struct device_node *of_node)
> > +{
> > +     int ret;
> > +     struct labibb_regulator *reg;
> > +     struct regulator_config cfg = {};
> > +
> > +     if (reg_data->type == QCOM_LAB_TYPE) {
> > +             reg = &labibb->lab;
> > +             reg->desc.enable_mask = LAB_ENABLE_CTL_MASK;
> > +     } else {
> > +             reg = &labibb->ibb;
> > +             reg->desc.enable_mask = IBB_ENABLE_CTL_MASK;
> > +     }
> > +
> > +     reg->dev = labibb->dev;
> > +     reg->base = reg_data->base;
> > +     reg->type = reg_data->type;
> > +     reg->regmap = labibb->regmap;
> > +     reg->desc.enable_reg = reg->base + REG_LABIBB_ENABLE_CTL;
> > +     reg->desc.enable_val = LABIBB_CONTROL_ENABLE;
> > +     reg->desc.of_match = reg_data->name;
> > +     reg->desc.name = reg_data->name;
> > +     reg->desc.owner = THIS_MODULE;
> > +     reg->desc.type = REGULATOR_VOLTAGE;
> > +     reg->desc.ops = &qcom_labibb_ops;
> > +
> > +     cfg.dev = labibb->dev;
> > +     cfg.driver_data = reg;
> > +     cfg.regmap = labibb->regmap;
> > +     cfg.of_node = of_node;
> > +
> > +     reg->rdev = devm_regulator_register(labibb->dev, &reg->desc,
> > +                                                     &cfg);
>
> Do you really need to wrap this line?
No :) - rework leftover. Will correct.
>
> > +     if (IS_ERR(reg->rdev)) {
> > +             ret = PTR_ERR(reg->rdev);
> > +             dev_err(labibb->dev,
> > +                     "unable to register %s regulator\n", reg_data->name);
> > +             return ret;
> > +     }
> > +     return 0;
>
>         return PTR_ERR_OR_ZERO(reg->rdev);
>
> > +}
> > +
> > +static const struct labibb_regulator_data pmi8998_labibb_data[] = {
> > +     {0xde00, "lab", "lab-sc-err", QCOM_LAB_TYPE},
>
> Please shorten the interrupt to just "sc-err".
Ok. And actually then I can remove it off from the
labibb_regulotor_data too, since it will be the same for both the
regulators.
>
> > +     {0xdc00, "ibb", "ibb-sc-err", QCOM_IBB_TYPE},
> > +     { },
> > +};
> > +
> > +static const struct of_device_id qcom_labibb_match[] = {
> > +     { .compatible = "qcom,pmi8998-lab-ibb", .data = &pmi8998_labibb_data},
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(of, qcom_labibb_match);
> > +
> > +static int qcom_labibb_regulator_probe(struct platform_device *pdev)
> > +{
> > +     struct qcom_labibb *labibb;
> > +     struct device_node *child;
> > +     const struct of_device_id *match;
> > +     const struct labibb_regulator_data *reg;
> > +     u8 type;
> > +     int ret;
> > +
> > +     labibb = devm_kzalloc(&pdev->dev, sizeof(*labibb), GFP_KERNEL);
> > +     if (!labibb)
> > +             return -ENOMEM;
> > +
> > +     labibb->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> > +     if (!labibb->regmap) {
> > +             dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     labibb->dev = &pdev->dev;
> > +
> > +     match = of_match_device(qcom_labibb_match, &pdev->dev);
> > +     if (!match)
> > +             return -ENODEV;
> > +
> > +     for (reg = match->data; reg->name; reg++) {
> > +             child = of_get_child_by_name(pdev->dev.of_node, reg->name);
> > +
> > +             /* TODO: This validates if the type of regulator is indeed
> > +              * what's mentioned in DT.
> > +              * I'm not sure if this is needed, but we'll keep it for now.
> > +              */
> > +             ret = regmap_bulk_read(labibb->regmap,
> > +                                     reg->base + REG_PERPH_TYPE,
> > +                                     &type, 1);
> > +             if (ret < 0) {
> > +                     dev_err(labibb->dev,
> > +                             "Peripheral type read failed ret=%d\n",
> > +                             ret);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             if ((type != QCOM_LAB_TYPE) && (type != QCOM_IBB_TYPE)) {
> > +                     dev_err(labibb->dev,
> > +                             "qcom_labibb: unknown peripheral type\n");
> > +                     return -EINVAL;
> > +             } else if (type != reg->type) {
> > +                     dev_err(labibb->dev,
> > +                             "qcom_labibb: type read %x doesn't match DT %x\n",
> > +                             type, reg->type);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             ret = register_labibb_regulator(labibb, reg, child);
> > +             if (ret < 0) {
> > +                     dev_err(&pdev->dev,
> > +                             "qcom_labibb: error registering %s regulator: %d\n",
> > +                             child->full_name, ret);
>
> You already printed in register_labibb_regulator() so no need to print
> again.
Got it.
>
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     dev_set_drvdata(&pdev->dev, labibb);
>
> rdev_get_drvdata() returns cfg.driver_data, so you don't need this one.
Got it, and it ties to your other comment about struct qcom_labibb. Will update.
>
> Regards,
> Bjorn
>
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver qcom_labibb_regulator_driver = {
> > +     .driver         = {
> > +             .name           = "qcom-lab-ibb-regulator",
> > +             .of_match_table = qcom_labibb_match,
> > +     },
> > +     .probe          = qcom_labibb_regulator_probe,
> > +};
> > +module_platform_driver(qcom_labibb_regulator_driver);
> > +
> > +MODULE_DESCRIPTION("Qualcomm labibb driver");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.26.2
> >

Best,
Sumit.
