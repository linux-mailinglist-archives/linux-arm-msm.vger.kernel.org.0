Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29A03B8772
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 19:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbhF3RNj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 13:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232278AbhF3RNi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 13:13:38 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B65C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 10:11:08 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id m6-20020a9d1d060000b029044e2d8e855eso3439793otm.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 10:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9/s9IvEBPNA9pXahfJJfU+n+iGTEfqQ+G3GN/FNfWwM=;
        b=jg0vUelpavcgL1JmD05kfp7WbHop4aDv5uC9w+ad87FMBdzg8+MAW8na+gekTXLMsK
         rDdz/U4HV/DUr6k+8NjJA/F/493Ka+6DItf9mxx5dbe+20TPeMl51GJnjVsDuTc07Far
         UMAbNgrA9PaO9i/WH7XEfPtwjgqS0NOaaDvfYgLpDSy1nsHruMaR71+5fHq/HvqtYNrP
         wvHiaZPuvUbiymFzInoHcSW5fOlZS53c9dMbR8e5LbsnXdX28iX+VWEc0c6K4FHMwSbv
         gfHtcEVfPZB4KUMCcuh3aSozOyFwQlxyWGF+1p8sX1jStDLwcAtGUVETiZvK+HAY8Zzp
         PHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9/s9IvEBPNA9pXahfJJfU+n+iGTEfqQ+G3GN/FNfWwM=;
        b=B9Cj8a5pYXTexIaHxIiU8vvlVQ1YI1O69+UpdlafYXc9weiQxWJfFEnFyKfIEvt/IA
         2PMSIGhqJSmInon6MnDSxQNcIWl3rHQDyUjzIdEOg9YeZzBKBPbUv3AVAGJ901tqhVsp
         H1UEndcEndjIIeVN+XJQz7pYQwMNzyuzSymfa9dNZ4CtPtIPNs1hlvQdpUyGekUdcQJ0
         VjCLfvyDFLNrnTyNj5ux1notrJMVQ4UGKVlQxA3gZRVqQnVgViPfw1MoEtgsGngxtkbu
         CgJT1YxEhKMyuQ1Hg7RmL4gdBZCXsEvyaMj4jnWYvofF3rlwBn+Ytwsze9U2BP7yPNUh
         msTA==
X-Gm-Message-State: AOAM531VtdhIef4fQ8z1Y8QCgOdHZqpM10/1h0ab7nP1nxaAmkcNHyEm
        bCHUoPvCkWP/dZIbgaTOsO55hg==
X-Google-Smtp-Source: ABdhPJzeWO8BkGJl2ov3UJNT5HiOUpwbuncH3s3Bc+2nrQmVYxyQaFGZ4o+e2ng9eEWhO5SICKfrGg==
X-Received: by 2002:a9d:6287:: with SMTP id x7mr9836718otk.339.1625073067903;
        Wed, 30 Jun 2021 10:11:07 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z2sm2492753otm.2.2021.06.30.10.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 10:11:07 -0700 (PDT)
Date:   Wed, 30 Jun 2021 12:11:04 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] clk: qcom: gdsc: enable optional power domain support
Message-ID: <YNylqGEi7Q3tFCgy@yoga>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
 <20210630133149.3204290-4-dmitry.baryshkov@linaro.org>
 <YNyHDAHk6ad/XCGl@yoga>
 <CAA8EJpqf6VyaS7KyhujFgST+S=fua4S-uXia0g7Qh7ogYgWYbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqf6VyaS7KyhujFgST+S=fua4S-uXia0g7Qh7ogYgWYbw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 30 Jun 10:47 CDT 2021, Dmitry Baryshkov wrote:

> Hi,
> 
> On Wed, 30 Jun 2021 at 18:00, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 30 Jun 08:31 CDT 2021, Dmitry Baryshkov wrote:
> >
> > > On sm8250 dispcc and videocc registers are powered up by the MMCX power
> > > domain. Currently we used a regulator to enable this domain on demand,
> > > however this has some consequences, as genpd code is not reentrant.
> > >
> > > Teach Qualcomm clock controller code about setting up power domains and
> > > using them for gdsc control.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > There's a proposal to add a generic binding for statically assigning a
> > performance states here:
> >
> > https://lore.kernel.org/linux-arm-msm/1622095949-2014-1-git-send-email-rnayak@codeaurora.org/
> >
> >
> > But that said, do you really need this?
> >
> > The requirement for driving MMCX to LOW_SVS on SM8250 (and NOM on
> > SM8150/SC8180x) seems to only come from the fact that you push MDP_CLK
> > to 460MHz in &mdss.
> >
> > But then in &mdss_mdp you do the same using an opp-table based on the
> > actual MDP_CLK, which per its power-domains will scale MMCX accordingly.
> 
> MDSS and DSI would bump up MMCX performance state requirements on
> their own, depending on the frequency being selected.
> 

Right, but as I copied things from the sm8250.dtsi to come up with
sm8150/sc8180x.dtsi I concluded that as soon as the assigned-clockrate
in &mdss kicks in I need the performance state to be at NOM.

So keeping the assigned-clockrate in &mdss means that MMCX will never go
below NOM.

> > So wouldn't it be sufficient to ensure that MDSS_GDSC is parented by
> > MMCX and then use opp-tables associated with the devices that scales the
> > clock and thereby actually carries the "required-opps".
> 
> Actually no. I set the performance state in the qcom_cc_map, so that
> further register access is possible. Initially I was doing this in the
> qcom_cc_really_probe() and it was already too late.
> Just to remind: this patchset is not about MDSS_GDSC being parented by
> MMCX, it is about dispcc/videocc registers being gated with MMCX.
> 

So you're saying that just enabling MMCX isn't enough to touch the
dispcc/videocc registers? If that's the case it seems like MMCX's
definition of "on" needs to be adjusted - because just specifying MMCX
as the power-domain for dispcc/videocc and enabling pm_runtime should
ensure that MMCX is enabled when the clock registers are accessed (I
don't see anything like that for the GDSC part though).

I thought our problem you had was that you need to set a
performance_state in order to clock up some of the clocks - e.g.
MDP_CLK.

> > I presume your testing indicates that it doesn't matter on sm8250, but
> > as stated above, 460MHz on sm8150/sc8180x requires nominal, so per your
> > suggestion we'd have to vote nominal in &mdss, which means that if the
> > DPU decides to go to 200MHz the &mdss will still keep the voltage at
> > NOM, even though the DPU's opp-table says that LOW_SVS is sufficient.
> 
> Let me check whether LOW_SVS is really a requirement or if setting
> MIN_SVS would also be sufficient for that. Interesting enough, from
> the downstream drivers it looks like dispcc should be able to work
> with MIN_SVS, while videocc would require LOW_SVS.
> 

LOW_SVS is the documented requirement for ticking MDP_CLK at 460MHz on
SM8250. But I would expect we don't need LOW_SVS in order to poke the
registers in dispcc/videocc.

Regards,
Bjorn

> >
> > Regards,
> > Bjorn
> >
> > > ---
> > >  drivers/clk/qcom/common.c | 55 ++++++++++++++++++++++++++++++++++-----
> > >  drivers/clk/qcom/gdsc.c   |  6 +++++
> > >  2 files changed, 55 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> > > index 60d2a78d1395..eeb5b8c93032 100644
> > > --- a/drivers/clk/qcom/common.c
> > > +++ b/drivers/clk/qcom/common.c
> > > @@ -10,6 +10,8 @@
> > >  #include <linux/clk-provider.h>
> > >  #include <linux/reset-controller.h>
> > >  #include <linux/of.h>
> > > +#include <linux/pm_opp.h>
> > > +#include <linux/pm_runtime.h>
> > >
> > >  #include "common.h"
> > >  #include "clk-rcg.h"
> > > @@ -76,6 +78,16 @@ qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
> > >       struct resource *res;
> > >       struct device *dev = &pdev->dev;
> > >
> > > +     if (of_find_property(dev->of_node, "required-opps", NULL)) {
> > > +             int pd_opp;
> > > +
> > > +             pd_opp = of_get_required_opp_performance_state(dev->of_node, 0);
> > > +             if (pd_opp < 0)
> > > +                     return ERR_PTR(pd_opp);
> > > +
> > > +             dev_pm_genpd_set_performance_state(dev, pd_opp);
> > > +     }
> > > +
> > >       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > >       base = devm_ioremap_resource(dev, res);
> > >       if (IS_ERR(base))
> > > @@ -224,6 +236,11 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
> > >       return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
> > >  }
> > >
> > > +static void qcom_cc_pm_runtime_disable(void *data)
> > > +{
> > > +     pm_runtime_disable(data);
> > > +}
> > > +
> > >  int qcom_cc_really_probe(struct platform_device *pdev,
> > >                        const struct qcom_cc_desc *desc, struct regmap *regmap)
> > >  {
> > > @@ -236,11 +253,28 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> > >       struct clk_regmap **rclks = desc->clks;
> > >       size_t num_clk_hws = desc->num_clk_hws;
> > >       struct clk_hw **clk_hws = desc->clk_hws;
> > > +     bool use_pm = false;
> > >
> > >       cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
> > >       if (!cc)
> > >               return -ENOMEM;
> > >
> > > +     if (of_find_property(dev->of_node, "required-opps", NULL)) {
> > > +             use_pm = true;
> > > +
> > > +             pm_runtime_enable(dev);
> > > +             ret = pm_runtime_get_sync(dev);
> > > +             if (ret < 0) {
> > > +                     pm_runtime_put(dev);
> > > +                     pm_runtime_disable(dev);
> > > +                     return ret;
> > > +             }
> > > +
> > > +             ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > > +
> > >       reset = &cc->reset;
> > >       reset->rcdev.of_node = dev->of_node;
> > >       reset->rcdev.ops = &qcom_reset_ops;
> > > @@ -251,7 +285,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> > >
> > >       ret = devm_reset_controller_register(dev, &reset->rcdev);
> > >       if (ret)
> > > -             return ret;
> > > +             goto err;
> > >
> > >       if (desc->gdscs && desc->num_gdscs) {
> > >               scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
> > > @@ -262,11 +296,11 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> > >               scd->num = desc->num_gdscs;
> > >               ret = gdsc_register(scd, &reset->rcdev, regmap);
> > >               if (ret)
> > > -                     return ret;
> > > +                     goto err;
> > >               ret = devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister,
> > >                                              scd);
> > >               if (ret)
> > > -                     return ret;
> > > +                     goto err;
> > >       }
> > >
> > >       cc->rclks = rclks;
> > > @@ -277,7 +311,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> > >       for (i = 0; i < num_clk_hws; i++) {
> > >               ret = devm_clk_hw_register(dev, clk_hws[i]);
> > >               if (ret)
> > > -                     return ret;
> > > +                     goto err;
> > >       }
> > >
> > >       for (i = 0; i < num_clks; i++) {
> > > @@ -286,14 +320,23 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> > >
> > >               ret = devm_clk_register_regmap(dev, rclks[i]);
> > >               if (ret)
> > > -                     return ret;
> > > +                     goto err;
> > >       }
> > >
> > >       ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
> > >       if (ret)
> > > -             return ret;
> > > +             goto err;
> > > +
> > > +     if (use_pm)
> > > +             pm_runtime_put(dev);
> > >
> > >       return 0;
> > > +
> > > +err:
> > > +     if (use_pm)
> > > +             pm_runtime_put(dev);
> > > +
> > > +     return ret;
> > >  }
> > >  EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
> > >
> > > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > > index 51ed640e527b..40c384bda4fc 100644
> > > --- a/drivers/clk/qcom/gdsc.c
> > > +++ b/drivers/clk/qcom/gdsc.c
> > > @@ -11,6 +11,7 @@
> > >  #include <linux/kernel.h>
> > >  #include <linux/ktime.h>
> > >  #include <linux/pm_domain.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/regulator/consumer.h>
> > >  #include <linux/reset-controller.h>
> > > @@ -237,6 +238,8 @@ static int gdsc_enable(struct generic_pm_domain *domain)
> > >       struct gdsc *sc = domain_to_gdsc(domain);
> > >       int ret;
> > >
> > > +     pm_runtime_get_sync(domain->dev.parent);
> > > +
> > >       if (sc->pwrsts == PWRSTS_ON)
> > >               return gdsc_deassert_reset(sc);
> > >
> > > @@ -326,6 +329,8 @@ static int gdsc_disable(struct generic_pm_domain *domain)
> > >       if (sc->flags & CLAMP_IO)
> > >               gdsc_assert_clamp_io(sc);
> > >
> > > +     pm_runtime_put(domain->dev.parent);
> > > +
> > >       return 0;
> > >  }
> > >
> > > @@ -427,6 +432,7 @@ int gdsc_register(struct gdsc_desc *desc,
> > >                       continue;
> > >               scs[i]->regmap = regmap;
> > >               scs[i]->rcdev = rcdev;
> > > +             scs[i]->pd.dev.parent = desc->dev;
> > >               ret = gdsc_init(scs[i]);
> > >               if (ret)
> > >                       return ret;
> > > --
> > > 2.30.2
> > >
> 
> 
> 
> -- 
> With best wishes
> Dmitry
