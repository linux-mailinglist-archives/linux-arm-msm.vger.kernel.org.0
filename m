Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F4B3B867C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 17:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235775AbhF3Pt7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 11:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235864AbhF3Pt6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 11:49:58 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78699C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 08:47:28 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id f5so1310693qvu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VxezOHsPVxs+xB6BVTLLYf2XI/Gpz28qXdqPvfvuUuY=;
        b=swaiBn8GrCoTmoRBrySgqREVdAql6hqiSVM2EWhkYOjNdx1uYvOEZKtm6LuGTYKbNe
         C6Y8HhXzvumyE55ctUhCymF4q7GKDLoD09ByN5GMlkH/J5e5MwpwSS37xdKzsIOYpW7j
         WwiXv2C7tgQz8bS3v4kQhzF9AiN88YZt91YjpOc8Wp18kp/I5e+npykGyw4AzSR6SP4V
         ywTkN21gsgbMydOL+WiGbLey/rCKJh3rXNe5keH9lsX+/57XWfJ8ssOTtf6Fe4AfV4SB
         yynX3BebGV2NgYkLi+8eipvZ9s5UTQybGMOpDgWtRjtAo+4w87pxvaTAY4R+AY1eljjN
         eFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VxezOHsPVxs+xB6BVTLLYf2XI/Gpz28qXdqPvfvuUuY=;
        b=ShFCXLXhVL/+WnjrRd1PUAbSDc5v/g913fGkUW3lK91InRBF6jb43sMHt7ps0RP6hq
         IssgyIV5TcHgbuqeepdiPD54BiX51maY+C3twnzhhRP4esoLRWmxuPToBjnrVI+27U7F
         bJE7YriDolF/YqwUEIIxUSwEEWDmYuJIW+gaw50fd/t2mxVbp3Xh0YxdPFMrwngmFwvn
         gK8UZAbQM0xCUm+9frQgHze57q0bQK0iOPxfM19tsQe6JsizbkJaFoEK7VgcCLY10frU
         RFD8tbGG97TM7K/jHnmoq3Qr9Yo8nzdB7ThXGHyvHRPtwbTs8oT34Az29rCvlZLpovBS
         JD2w==
X-Gm-Message-State: AOAM532+8UsSs33Z+TcaDqPvD2OKsxzHZ7mzZXN08g0ajKc00c662Puc
        hdRbtZmCEpD8KoH61Kzmq3/rno/7zy8erpNkuggdVA==
X-Google-Smtp-Source: ABdhPJzYqNwD4zU1M2ImlWlNP0d/DQxxzoAQ8IpRwQtALWrSM6WyNllcw8r40MR4AOeIs+TXf/dbsGl9oWW1vyky/+o=
X-Received: by 2002:a05:6214:1021:: with SMTP id k1mr37760978qvr.4.1625068047671;
 Wed, 30 Jun 2021 08:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
 <20210630133149.3204290-4-dmitry.baryshkov@linaro.org> <YNyHDAHk6ad/XCGl@yoga>
In-Reply-To: <YNyHDAHk6ad/XCGl@yoga>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Jun 2021 18:47:16 +0300
Message-ID: <CAA8EJpqf6VyaS7KyhujFgST+S=fua4S-uXia0g7Qh7ogYgWYbw@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: qcom: gdsc: enable optional power domain support
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

Hi,

On Wed, 30 Jun 2021 at 18:00, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 30 Jun 08:31 CDT 2021, Dmitry Baryshkov wrote:
>
> > On sm8250 dispcc and videocc registers are powered up by the MMCX power
> > domain. Currently we used a regulator to enable this domain on demand,
> > however this has some consequences, as genpd code is not reentrant.
> >
> > Teach Qualcomm clock controller code about setting up power domains and
> > using them for gdsc control.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> There's a proposal to add a generic binding for statically assigning a
> performance states here:
>
> https://lore.kernel.org/linux-arm-msm/1622095949-2014-1-git-send-email-rnayak@codeaurora.org/
>
>
> But that said, do you really need this?
>
> The requirement for driving MMCX to LOW_SVS on SM8250 (and NOM on
> SM8150/SC8180x) seems to only come from the fact that you push MDP_CLK
> to 460MHz in &mdss.
>
> But then in &mdss_mdp you do the same using an opp-table based on the
> actual MDP_CLK, which per its power-domains will scale MMCX accordingly.

MDSS and DSI would bump up MMCX performance state requirements on
their own, depending on the frequency being selected.

> So wouldn't it be sufficient to ensure that MDSS_GDSC is parented by
> MMCX and then use opp-tables associated with the devices that scales the
> clock and thereby actually carries the "required-opps".

Actually no. I set the performance state in the qcom_cc_map, so that
further register access is possible. Initially I was doing this in the
qcom_cc_really_probe() and it was already too late.
Just to remind: this patchset is not about MDSS_GDSC being parented by
MMCX, it is about dispcc/videocc registers being gated with MMCX.

> I presume your testing indicates that it doesn't matter on sm8250, but
> as stated above, 460MHz on sm8150/sc8180x requires nominal, so per your
> suggestion we'd have to vote nominal in &mdss, which means that if the
> DPU decides to go to 200MHz the &mdss will still keep the voltage at
> NOM, even though the DPU's opp-table says that LOW_SVS is sufficient.

Let me check whether LOW_SVS is really a requirement or if setting
MIN_SVS would also be sufficient for that. Interesting enough, from
the downstream drivers it looks like dispcc should be able to work
with MIN_SVS, while videocc would require LOW_SVS.

>
> Regards,
> Bjorn
>
> > ---
> >  drivers/clk/qcom/common.c | 55 ++++++++++++++++++++++++++++++++++-----
> >  drivers/clk/qcom/gdsc.c   |  6 +++++
> >  2 files changed, 55 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> > index 60d2a78d1395..eeb5b8c93032 100644
> > --- a/drivers/clk/qcom/common.c
> > +++ b/drivers/clk/qcom/common.c
> > @@ -10,6 +10,8 @@
> >  #include <linux/clk-provider.h>
> >  #include <linux/reset-controller.h>
> >  #include <linux/of.h>
> > +#include <linux/pm_opp.h>
> > +#include <linux/pm_runtime.h>
> >
> >  #include "common.h"
> >  #include "clk-rcg.h"
> > @@ -76,6 +78,16 @@ qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
> >       struct resource *res;
> >       struct device *dev = &pdev->dev;
> >
> > +     if (of_find_property(dev->of_node, "required-opps", NULL)) {
> > +             int pd_opp;
> > +
> > +             pd_opp = of_get_required_opp_performance_state(dev->of_node, 0);
> > +             if (pd_opp < 0)
> > +                     return ERR_PTR(pd_opp);
> > +
> > +             dev_pm_genpd_set_performance_state(dev, pd_opp);
> > +     }
> > +
> >       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >       base = devm_ioremap_resource(dev, res);
> >       if (IS_ERR(base))
> > @@ -224,6 +236,11 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
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
> > @@ -236,11 +253,28 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> >       struct clk_regmap **rclks = desc->clks;
> >       size_t num_clk_hws = desc->num_clk_hws;
> >       struct clk_hw **clk_hws = desc->clk_hws;
> > +     bool use_pm = false;
> >
> >       cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
> >       if (!cc)
> >               return -ENOMEM;
> >
> > +     if (of_find_property(dev->of_node, "required-opps", NULL)) {
> > +             use_pm = true;
> > +
> > +             pm_runtime_enable(dev);
> > +             ret = pm_runtime_get_sync(dev);
> > +             if (ret < 0) {
> > +                     pm_runtime_put(dev);
> > +                     pm_runtime_disable(dev);
> > +                     return ret;
> > +             }
> > +
> > +             ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >       reset = &cc->reset;
> >       reset->rcdev.of_node = dev->of_node;
> >       reset->rcdev.ops = &qcom_reset_ops;
> > @@ -251,7 +285,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> >
> >       ret = devm_reset_controller_register(dev, &reset->rcdev);
> >       if (ret)
> > -             return ret;
> > +             goto err;
> >
> >       if (desc->gdscs && desc->num_gdscs) {
> >               scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
> > @@ -262,11 +296,11 @@ int qcom_cc_really_probe(struct platform_device *pdev,
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
> > @@ -277,7 +311,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> >       for (i = 0; i < num_clk_hws; i++) {
> >               ret = devm_clk_hw_register(dev, clk_hws[i]);
> >               if (ret)
> > -                     return ret;
> > +                     goto err;
> >       }
> >
> >       for (i = 0; i < num_clks; i++) {
> > @@ -286,14 +320,23 @@ int qcom_cc_really_probe(struct platform_device *pdev,
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
> > +     if (use_pm)
> > +             pm_runtime_put(dev);
> >
> >       return 0;
> > +
> > +err:
> > +     if (use_pm)
> > +             pm_runtime_put(dev);
> > +
> > +     return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
> >
> > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > index 51ed640e527b..40c384bda4fc 100644
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
> > @@ -237,6 +238,8 @@ static int gdsc_enable(struct generic_pm_domain *domain)
> >       struct gdsc *sc = domain_to_gdsc(domain);
> >       int ret;
> >
> > +     pm_runtime_get_sync(domain->dev.parent);
> > +
> >       if (sc->pwrsts == PWRSTS_ON)
> >               return gdsc_deassert_reset(sc);
> >
> > @@ -326,6 +329,8 @@ static int gdsc_disable(struct generic_pm_domain *domain)
> >       if (sc->flags & CLAMP_IO)
> >               gdsc_assert_clamp_io(sc);
> >
> > +     pm_runtime_put(domain->dev.parent);
> > +
> >       return 0;
> >  }
> >
> > @@ -427,6 +432,7 @@ int gdsc_register(struct gdsc_desc *desc,
> >                       continue;
> >               scs[i]->regmap = regmap;
> >               scs[i]->rcdev = rcdev;
> > +             scs[i]->pd.dev.parent = desc->dev;
> >               ret = gdsc_init(scs[i]);
> >               if (ret)
> >                       return ret;
> > --
> > 2.30.2
> >



-- 
With best wishes
Dmitry
