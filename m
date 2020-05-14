Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC6C1D2EF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 13:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgENL6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 07:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgENL6q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 07:58:46 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714A3C061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 04:58:46 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id d191so3994340oib.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 04:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fpk0hNsCOglL/2RiZ/taM4Uob0Oi6tgMAZ91Mdpcrng=;
        b=R8aBBc58S+9LAVSoMXBmxC2JYUMMKiCiceCU5rzSKbMQgEDD/XcSdAaCAyB+5xN0Q7
         JEFnTn0Wpu//X7QHhXVtHdrx5Yq20uJzu01dazx6xQ7yHo0HT4ZDi9mODO7ajUpUg81m
         zdIMxCuilazsLiwQWimD65Sdx7rcttUUZ/8vTw+ujaEnHKeF87r5/fg6fe10Zekjo6lw
         QoC7WXRjHL7iP/qiCWL7cmEuIOfQz6HhlOeDfkB+2JpaeZC0OFyQ9q4F+PGCPc8z+XvP
         wLycdPa6GnyEI54C2ZNCRE3Fs4fMRmqNtCFRBC19a2u1CgTWMbaDB1/IXS+IQXv5X7u3
         j+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fpk0hNsCOglL/2RiZ/taM4Uob0Oi6tgMAZ91Mdpcrng=;
        b=Gp/CUI2U9iXXVLINt/X4xdSGWxLRvyS/s/5ONQkMmbw5ecIc8Xg3q2W0e+JufGLG0Q
         Aw9c4903MW5tEVisb3srUeD9WIa1495uy6lklH/7wU+BwcJS5Q1/CoiLgxN/lQltrdsc
         KSue+hGDv0e+r1Y0xIGwXKAb1PgFPWlMlgpfokHBSf9cX1zNXx9LKq58xCJmW4+rsoaY
         JR3lr7Cu+HAiX56aQ2dzZb1dr4q+Iv43VqfALL3wv+uReP39LeWkjka976g7K7Ua+q9I
         1ndR40fW9h1KyTrHm80AMOo3e1iv62aAROMLi3G/XSyLZjzlgHWHSK4xYz1MNIMo9pEX
         +d+w==
X-Gm-Message-State: AOAM5300glJj6T522qdj90vaoGEmsHoSfYLnwxPZyWq6xeZYolt8quSf
        xZ4aLLIAnEqGMuWH+z3v7Vzmlrs4MhppOwduhERV1Q==
X-Google-Smtp-Source: ABdhPJzCX0TOx5vID9im/1aJ65Mt6GUohvi8QeVvhJ3wVsZfBSVKGX53DsP3qe/J+Me4/N9Vp86rNizuUZgFe2kFwps=
X-Received: by 2002:a05:6808:9ab:: with SMTP id e11mr4695683oig.119.1589457525751;
 Thu, 14 May 2020 04:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200508204200.13481-1-sumit.semwal@linaro.org>
 <20200508204200.13481-5-sumit.semwal@linaro.org> <20200512052541.GF1302550@yoga>
In-Reply-To: <20200512052541.GF1302550@yoga>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 14 May 2020 17:28:34 +0530
Message-ID: <CAO_48GHuuRZwbkDr7b0Rp1_hTfw05qh0hSmjnnsiVsTfVBrARw@mail.gmail.com>
Subject: Re: [v2 4/4] regulator: qcom: labibb: Add SC interrupt handling
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

Thanks for the review comments.

On Tue, 12 May 2020 at 10:55, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 08 May 13:42 PDT 2020, Sumit Semwal wrote:
>
> > From: Nisha Kumari <nishakumari@codeaurora.org>
> >
> > Add Short circuit interrupt handling and recovery for the lab and
> > ibb regulators on qcom platforms.
> >
> > The client panel drivers need to register for REGULATOR_EVENT_OVER_CURRENT
> > notification which will be triggered on short circuit. They should
> > try to enable the regulator once, and if it doesn't get enabled,
> > handle shutting down the panel accordingly.
> >
> > Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> >
> > --
> > v2: sumits: reworked handling to user regmap_read_poll_timeout, and handle it
> >     per-regulator instead of clearing both lab and ibb errors on either irq
> >     triggering. Also added REGULATOR_EVENT_OVER_CURRENT handling and
> >     notification to clients.
> > ---
> >  drivers/regulator/qcom-labibb-regulator.c | 103 +++++++++++++++++++++-
> >  1 file changed, 100 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
> > index a9dc7c060375..3539631c9f96 100644
> > --- a/drivers/regulator/qcom-labibb-regulator.c
> > +++ b/drivers/regulator/qcom-labibb-regulator.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  // Copyright (c) 2019, The Linux Foundation. All rights reserved.
> >
> > +#include <linux/interrupt.h>
> >  #include <linux/module.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/of.h>
> > @@ -18,11 +19,15 @@
> >  #define REG_LABIBB_ENABLE_CTL                0x46
> >  #define LABIBB_STATUS1_VREG_OK_BIT   BIT(7)
> >  #define LABIBB_CONTROL_ENABLE                BIT(7)
> > +#define LABIBB_STATUS1_SC_DETECT_BIT BIT(6)
> >
> >  #define LAB_ENABLE_CTL_MASK          BIT(7)
> >  #define IBB_ENABLE_CTL_MASK          (BIT(7) | BIT(6))
> >
> >  #define POWER_DELAY                  8000
> > +#define POLLING_SCP_DONE_INTERVAL_US 5000
> > +#define POLLING_SCP_TIMEOUT          16000
> > +
> >
> >  struct labibb_regulator {
> >       struct regulator_desc           desc;
> > @@ -30,6 +35,8 @@ struct labibb_regulator {
> >       struct regmap                   *regmap;
> >       struct regulator_dev            *rdev;
> >       u16                             base;
> > +     int                             sc_irq;
> > +     int                             vreg_enabled;
> >       u8                              type;
> >  };
> >
> > @@ -112,9 +119,10 @@ static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
> >               return ret;
> >       }
> >
> > -     if (ret)
> > +     if (ret) {
> > +             reg->vreg_enabled = 1;
> >               return 0;
> > -
> > +     }
> >
> >       dev_err(reg->dev, "Can't enable %s\n", reg->desc.name);
> >       return -EINVAL;
> > @@ -140,8 +148,10 @@ static int qcom_labibb_regulator_disable(struct regulator_dev *rdev)
> >               return ret;
> >       }
> >
> > -     if (!ret)
> > +     if (!ret) {
> > +             reg->vreg_enabled = 0;
> >               return 0;
> > +     }
> >
> >       dev_err(reg->dev, "Can't disable %s\n", reg->desc.name);
> >       return -EINVAL;
> > @@ -153,6 +163,70 @@ static struct regulator_ops qcom_labibb_ops = {
> >       .is_enabled             = qcom_labibb_regulator_is_enabled,
> >  };
> >
> > +
> > +static irqreturn_t labibb_sc_err_handler(int irq, void *_reg)
> > +{
> > +     int ret, count;
> > +     u16 reg;
> > +     u8 sc_err_mask;
> > +     unsigned int val;
> > +     struct labibb_regulator *labibb_reg = (struct labibb_regulator *)_reg;
>
> No need to explicitly typecast a void *.
ok.
>
> > +     bool in_sc_err, reg_en, scp_done = false;
>
> reg_en is unused.
>
Yes, will remove.
> > +
> > +     if (irq == labibb_reg->sc_irq)
>
> When is this false?
Shouldn't be; will remove the check.
>
> > +             reg = labibb_reg->base + REG_LABIBB_STATUS1;
> > +     else
> > +             return IRQ_HANDLED;
> > +
> > +     sc_err_mask = LABIBB_STATUS1_SC_DETECT_BIT;
> > +
> > +     ret = regmap_bulk_read(labibb_reg->regmap, reg, &val, 1);
>
> Just inline reg->base + REG_LABIBB_STATUS1 in this call.
Ok.
>
> > +     if (ret < 0) {
> > +             dev_err(labibb_reg->dev, "Read failed, ret=%d\n", ret);
> > +             return IRQ_HANDLED;
> > +     }
> > +     dev_dbg(labibb_reg->dev, "%s SC error triggered! STATUS1 = %d\n",
> > +             labibb_reg->desc.name, val);
> > +
> > +     in_sc_err = !!(val & sc_err_mask);
> > +
> > +     /*
> > +      * The SC(short circuit) fault would trigger PBS(Portable Batch
> > +      * System) to disable regulators for protection. This would
> > +      * cause the SC_DETECT status being cleared so that it's not
> > +      * able to get the SC fault status.
> > +      * Check if the regulator is enabled in the driver but
> > +      * disabled in hardware, this means a SC fault had happened
> > +      * and SCP handling is completed by PBS.
> > +      */
> > +     if (!in_sc_err) {
>
>         if (!(val & LABIBB_STATUS1_SC_DETECT_BIT)) {
>
> > +
> > +             reg = labibb_reg->base + REG_LABIBB_ENABLE_CTL;
> > +
> > +             ret = regmap_read_poll_timeout(labibb_reg->regmap,
> > +                                     reg, val,
> > +                                     !(val & LABIBB_CONTROL_ENABLE),
> > +                                     POLLING_SCP_DONE_INTERVAL_US,
> > +                                     POLLING_SCP_TIMEOUT);
> > +
> > +             if (!ret && labibb_reg->vreg_enabled) {
>
> Wouldn't be fine to assume that if you get a short circuit IRQ the
> regulator is enabled?
So this is from my understanding of the previous patchset by the
author, as documented in the comment: I understood it to mean that if
we aren't able to read back the 'ENABLE' bit from the hardware (so
it's disabled in hw?) but the driver has it's vreg->enabled set, that
means the SC fault had happened but was handled by the PBS?
>
> If you are worried about racing with a disable this won't work anyways,
> and you better enable_irq()/disable_irq() in regulator enable/disable,
> respectively.
>
It didn't seem to be about the disable race, but being handled by the PBS.

> > +                     dev_dbg(labibb_reg->dev,
> > +                             "%s has been disabled by SCP\n",
> > +                             labibb_reg->desc.name);
> > +                     scp_done = true;
> > +             }
>
> If you flip the poll check around you will get here by not being in an
> short-circuit condition and you conclude that the regulator is still on;
> in which case you can just return here.
>
> That way you can drop in_sc_err and scp_done and flatten below
> conditional section.
Yeah I think that's related to the PBS v/s regulator's handling of the
short-circuit, afaiu.
>
> > +     }
> > +
> > +     if (in_sc_err || scp_done) {
> > +             regulator_lock(labibb_reg->rdev);
> > +             regulator_notifier_call_chain(labibb_reg->rdev,
> > +                                             REGULATOR_EVENT_OVER_CURRENT,
> > +                                             NULL);
> > +             regulator_unlock(labibb_reg->rdev);
> > +     }
> > +     return IRQ_HANDLED;
> > +}
> > +
> >  static int register_labibb_regulator(struct qcom_labibb *labibb,
> >                               const struct labibb_regulator_data *reg_data,
> >                               struct device_node *of_node)
> > @@ -181,6 +255,29 @@ static int register_labibb_regulator(struct qcom_labibb *labibb,
> >       reg->desc.type = REGULATOR_VOLTAGE;
> >       reg->desc.ops = &qcom_labibb_ops;
> >
> > +     reg->sc_irq = -EINVAL;
> > +     ret = of_irq_get_byname(of_node, reg_data->irq_name);
> > +     if (ret < 0)
> > +             dev_dbg(labibb->dev,
>
> Isn't this an error?
yes, will change.
>
> > +                     "Unable to get %s, ret = %d\n",
> > +                     reg_data->irq_name, ret);
> > +     else
> > +             reg->sc_irq = ret;
> > +
> > +     if (reg->sc_irq > 0) {
> > +             ret = devm_request_threaded_irq(labibb->dev,
> > +                                             reg->sc_irq,
> > +                                             NULL, labibb_sc_err_handler,
> > +                                             IRQF_ONESHOT |
> > +                                             IRQF_TRIGGER_RISING,
>
> Omit IRQF_TRIGGER_RISING and let that come from DT.
Ok. That's anyways coming from the DT.

>
> > +                                             reg_data->irq_name, labibb);
> > +             if (ret) {
> > +                     dev_err(labibb->dev, "Failed to register '%s' irq ret=%d\n",
> > +                             reg_data->irq_name, ret);
> > +                     return ret;
> > +             }
> > +     }
> > +
>
> Regards,
> Bjorn
>
> >       cfg.dev = labibb->dev;
> >       cfg.driver_data = reg;
> >       cfg.regmap = labibb->regmap;
> > --
> > 2.26.2
> >
Best,
Sumit.
