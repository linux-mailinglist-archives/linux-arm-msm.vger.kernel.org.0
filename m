Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D173C3465
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 13:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbhGJLxE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 07:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbhGJLxE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 07:53:04 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102F5C0613DD
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 04:50:19 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id j14so5879596qvu.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 04:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YNMd6MJyjmh08xXrzbcA8eXz649vxPO5S+YQXkff1Y0=;
        b=SKmBUGMeUgVnMeL3IcwZISttrVfHMbJYsIK8LOKQ4IXnr1l0qloj5i8yrAnPPV5jNq
         WHJOc9nBefFHbXM1wdpzWLPRJIAWn0W7KGAFQrURx0XqpZWjrm6TAOLXGTZxzSZLNuKv
         YUk3xWIu2hMxTc4h/coByi55oD+48hiTz9jbAuk16AH9PChL0YE1+wIun39vIe1oX3yo
         bZ/RJaKL8WWho3qqXfXpP7K9K/MMNdO9qaOvk7xDepZhzVAkL7zZQS7L+cRs26gndF2e
         8mx06OBCj57XTNAym6xM7iDgeZ5r/i0rEnIQvPWyO5Dw30qvK+MTZdSH/DQWJ1LhYhzQ
         laJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YNMd6MJyjmh08xXrzbcA8eXz649vxPO5S+YQXkff1Y0=;
        b=GOnQEk/mD+gPfakChSEMMjSPuoAmZjliJ3PU4nLmxsdf5kVCaS9vMrX9IDJx8mHISR
         a0WKKiDb5xI7bJwSA3VY/D1HQAtAB5O1C2EQQZqHiEtkWaEomt1PpIauv+pGo5Fahefw
         ksOvIRuq8oJBjOGpd8vNQD6ScoK9ohZZ2CLDuRPckWkI0Q4D+TYnhrBPuRRYaBjBfs9P
         9D+9QHZk5Y2FLxqKlxl1kITosdlDKtYVQPrL2EOzMWRJveS83xznCdj+UT4F+OuaJYmM
         9O8Y9To2562L8aZh8X9rMm5szC+EudAvDl0l7ZcxATfKhjykMuRqbQkJrvsck9rnupAs
         USlw==
X-Gm-Message-State: AOAM530fyaDZZYdBgxNYHNc5rwETMa6e9o2wJKEDdrzCo8gGlY8I1gcd
        9toQkfbXtuA6mrT7o6SBdY8x0+AuSD5RePJn4OI1Ng==
X-Google-Smtp-Source: ABdhPJzGimfyI0sKw7sTJBTExsdE3Zl8g1S2XW6BFhFecgKI3L/Zqa+xr0qz/YTRS56WaeeYbjYjdrX61Qih1IHmMFM=
X-Received: by 2002:a05:6214:1cb:: with SMTP id c11mr41581537qvt.47.1625917818072;
 Sat, 10 Jul 2021 04:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
 <20210710013253.1134341-4-dmitry.baryshkov@linaro.org> <YOkXnEVshAy0qmPm@yoga>
In-Reply-To: <YOkXnEVshAy0qmPm@yoga>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 10 Jul 2021 14:50:06 +0300
Message-ID: <CAA8EJpo7MBm1EA9gjYkCOu=kuac7QvGD8fx3H=SN-41sm5gyYQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] clk: qcom: gdsc: enable optional power domain support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 10 Jul 2021 at 06:44, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 09 Jul 20:32 CDT 2021, Dmitry Baryshkov wrote:
>
> > On sm8250 dispcc and videocc registers are powered up by the MMCX power
> > domain. Currently we use a regulator to enable this domain on demand,
> > however this has some consequences, as genpd code is not reentrant.
> >
> > Teach Qualcomm clock controller code about setting up runtime PM and
> > using specified genpd for gdsc powerup. Clock core will use runtime_pm
> > calls to ensure that clock registers are accessible. The genpd code will
> > powerup the parent domain when gdsc is powered, thus ensuring that the
> > power stays on. Make gdsc code also use pm_runtime calls to ensure that
> > registers are accessible during the gdsc_enable/gdsc_disable operations.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/common.c | 37 +++++++++++++++++----
> >  drivers/clk/qcom/gdsc.c   | 67 +++++++++++++++++++++++++++++++++++++--
> >  drivers/clk/qcom/gdsc.h   |  2 ++
> >  3 files changed, 97 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> > index 60d2a78d1395..43d8f8feeb3c 100644
> > --- a/drivers/clk/qcom/common.c
> > +++ b/drivers/clk/qcom/common.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/clk-provider.h>
> >  #include <linux/reset-controller.h>
> >  #include <linux/of.h>
> > +#include <linux/pm_runtime.h>
> >
> >  #include "common.h"
> >  #include "clk-rcg.h"
> > @@ -224,6 +225,11 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
> >       return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
> >  }
> >
> > +static void qcom_cc_pm_runtime_disable(void *data)
> > +{
> > +     pm_runtime_disable(data);
> > +}
> > +
> >  int qcom_cc_really_probe(struct platform_device *pdev,
> >                        const struct qcom_cc_desc *desc, struct regmap *regmap)
> >  {
> > @@ -241,6 +247,18 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> >       if (!cc)
> >               return -ENOMEM;
> >
> > +     pm_runtime_enable(dev);
>
> As I said in v3, this will result in double pm_runtime_enable(), which
> is not allowed. What I didn't remember is that we have 6 drivers that
> rely on pm_runtime to keep their iface clock enabled during clock
> operations, so it's not only isolated to the turingcc driver.

This quickly becomes more than just mmcx.

As we have 6 drivers using pm_runtime, let's do it another way. I'd
send a patch moving
pm_runtime_enable/pm_clk_add to qcom_cc_map(). If it is accepted, we
can proceed with mmcx.

Bonus points if it would become logical to rewrite lpass-gfm-sm8250 to
use qcom_cc framework

>
> > +     ret = pm_runtime_get_sync(dev);
>
> And I still think that you should add this to gdsc_init(), like you do
> in gdsc_enable() and gdsc_disable.

I do not think so. clk_FOO_pll_configure, clk gating, setting up
always-on CLKs would not use pm_runtime calls, but will do register
writes. So I think it simpler to get the device for the whole _probe
time rather than micro-managing it for this and that events.

In the end (see above), I think we will pm_runtime_get in the
qcom_cc_map and pm_runtime_put in qcom_cc_really_probe.

>
> Combined, there are no longer any changes to common.c
>
>
> The rest of this looks good now!
>
> Regards,
> Bjorn
>
> > +     if (ret < 0) {
> > +             pm_runtime_put(dev);
> > +             pm_runtime_disable(dev);
> > +             return ret;
> > +     }
> > +
> > +     ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);
> > +     if (ret)
> > +             goto err;
> > +
> >       reset = &cc->reset;
> >       reset->rcdev.of_node = dev->of_node;
> >       reset->rcdev.ops = &qcom_reset_ops;
> > @@ -251,7 +269,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> >
> >       ret = devm_reset_controller_register(dev, &reset->rcdev);
> >       if (ret)
> > -             return ret;
> > +             goto err;
> >
> >       if (desc->gdscs && desc->num_gdscs) {
> >               scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
> > @@ -262,11 +280,11 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> >               scd->num = desc->num_gdscs;
> >               ret = gdsc_register(scd, &reset->rcdev, regmap);
> >               if (ret)
> > -                     return ret;
> > +                     goto err;
> >               ret = devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister,
> >                                              scd);
> >               if (ret)
> > -                     return ret;
> > +                     goto err;
> >       }
> >
> >       cc->rclks = rclks;
> > @@ -277,7 +295,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> >       for (i = 0; i < num_clk_hws; i++) {
> >               ret = devm_clk_hw_register(dev, clk_hws[i]);
> >               if (ret)
> > -                     return ret;
> > +                     goto err;
> >       }
> >
> >       for (i = 0; i < num_clks; i++) {
> > @@ -286,14 +304,21 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> >
> >               ret = devm_clk_register_regmap(dev, rclks[i]);
> >               if (ret)
> > -                     return ret;
> > +                     goto err;
> >       }
> >
> >       ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
> >       if (ret)
> > -             return ret;
> > +             goto err;
> > +
> > +     pm_runtime_put(dev);
> >
> >       return 0;
> > +
> > +err:
> > +     pm_runtime_put(dev);
> > +
> > +     return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
> >
> > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > index 51ed640e527b..cfe875f87efe 100644
> > --- a/drivers/clk/qcom/gdsc.c
> > +++ b/drivers/clk/qcom/gdsc.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/ktime.h>
> >  #include <linux/pm_domain.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/reset-controller.h>
> > @@ -50,6 +51,30 @@ enum gdsc_status {
> >       GDSC_ON
> >  };
> >
> > +static int gdsc_pm_runtime_get(struct gdsc *sc)
> > +{
> > +     int ret;
> > +
> > +     if (!sc->dev)
> > +             return 0;
> > +
> > +     ret = pm_runtime_get_sync(sc->dev);
> > +     if (ret < 0) {
> > +             pm_runtime_put_noidle(sc->dev);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int gdsc_pm_runtime_put(struct gdsc *sc)
> > +{
> > +     if (!sc->dev)
> > +             return 0;
> > +
> > +     return pm_runtime_put_sync(sc->dev);
> > +}
> > +
> >  /* Returns 1 if GDSC status is status, 0 if not, and < 0 on error */
> >  static int gdsc_check_status(struct gdsc *sc, enum gdsc_status status)
> >  {
> > @@ -232,9 +257,8 @@ static void gdsc_retain_ff_on(struct gdsc *sc)
> >       regmap_update_bits(sc->regmap, sc->gdscr, mask, mask);
> >  }
> >
> > -static int gdsc_enable(struct generic_pm_domain *domain)
> > +static int _gdsc_enable(struct gdsc *sc)
> >  {
> > -     struct gdsc *sc = domain_to_gdsc(domain);
> >       int ret;
> >
> >       if (sc->pwrsts == PWRSTS_ON)
> > @@ -290,11 +314,26 @@ static int gdsc_enable(struct generic_pm_domain *domain)
> >       return 0;
> >  }
> >
> > -static int gdsc_disable(struct generic_pm_domain *domain)
> > +static int gdsc_enable(struct generic_pm_domain *domain)
> >  {
> >       struct gdsc *sc = domain_to_gdsc(domain);
> >       int ret;
> >
> > +     ret = gdsc_pm_runtime_get(sc);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = _gdsc_enable(sc);
> > +
> > +     gdsc_pm_runtime_put(sc);
> > +
> > +     return ret;
> > +}
> > +
> > +static int _gdsc_disable(struct gdsc *sc)
> > +{
> > +     int ret;
> > +
> >       if (sc->pwrsts == PWRSTS_ON)
> >               return gdsc_assert_reset(sc);
> >
> > @@ -329,6 +368,22 @@ static int gdsc_disable(struct generic_pm_domain *domain)
> >       return 0;
> >  }
> >
> > +static int gdsc_disable(struct generic_pm_domain *domain)
> > +{
> > +     struct gdsc *sc = domain_to_gdsc(domain);
> > +     int ret;
> > +
> > +     ret = gdsc_pm_runtime_get(sc);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = _gdsc_disable(sc);
> > +
> > +     gdsc_pm_runtime_put(sc);
> > +
> > +     return ret;
> > +}
> > +
> >  static int gdsc_init(struct gdsc *sc)
> >  {
> >       u32 mask, val;
> > @@ -425,6 +480,8 @@ int gdsc_register(struct gdsc_desc *desc,
> >       for (i = 0; i < num; i++) {
> >               if (!scs[i])
> >                       continue;
> > +             if (pm_runtime_enabled(dev))
> > +                     scs[i]->dev = dev;
> >               scs[i]->regmap = regmap;
> >               scs[i]->rcdev = rcdev;
> >               ret = gdsc_init(scs[i]);
> > @@ -439,6 +496,8 @@ int gdsc_register(struct gdsc_desc *desc,
> >                       continue;
> >               if (scs[i]->parent)
> >                       pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> > +             else if (!IS_ERR_OR_NULL(dev->pm_domain))
> > +                     pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> >       }
> >
> >       return of_genpd_add_provider_onecell(dev->of_node, data);
> > @@ -457,6 +516,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
> >                       continue;
> >               if (scs[i]->parent)
> >                       pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
> > +             else if (!IS_ERR_OR_NULL(dev->pm_domain))
> > +                     pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> >       }
> >       of_genpd_del_provider(dev->of_node);
> >  }
> > diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> > index 5bb396b344d1..702d47a87af6 100644
> > --- a/drivers/clk/qcom/gdsc.h
> > +++ b/drivers/clk/qcom/gdsc.h
> > @@ -25,6 +25,7 @@ struct reset_controller_dev;
> >   * @resets: ids of resets associated with this gdsc
> >   * @reset_count: number of @resets
> >   * @rcdev: reset controller
> > + * @dev: the device holding the GDSC, used for pm_runtime calls
> >   */
> >  struct gdsc {
> >       struct generic_pm_domain        pd;
> > @@ -58,6 +59,7 @@ struct gdsc {
> >
> >       const char                      *supply;
> >       struct regulator                *rsupply;
> > +     struct device                   *dev;
> >  };
> >
> >  struct gdsc_desc {
> > --
> > 2.30.2
> >



-- 
With best wishes
Dmitry
