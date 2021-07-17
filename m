Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7796F3CC1AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 09:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhGQHgl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jul 2021 03:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhGQHgk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jul 2021 03:36:40 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C56C06175F
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 00:33:44 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id q190so11181274qkd.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 00:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=azMEpLf7aWNZhUtboA/PAANf5wrHSqPwOi1720U3HMA=;
        b=qifAS0gWjKt872h30Y8rv2xtydbJ+y2/r/KDHjnuVsptxsdQ6Zyjq/7dlnZzQvqLcy
         GFwPdLt3xv4aQNfoSw0ofMQCDIJBN6OCMlWjdBsTV4HHBavPgvjzqK4lUzggqFeiVZye
         GCtzjMyzkAB9BK19oXFgRoRUX3K6nnRhjR1V+tm8vgp3PhbeYDzWTiOjt9PtTMR2l49A
         ortMsTb8nbRKQEY3DZyp38SgyDGs75Z3Xown4qBzeK4RLvggSCuTLA2CD9fDpW90ckJK
         AjbRdTOVxka+QPXoX4lD04u2y1BocLo538pjK2hKoE6jtIk4ulVEkYBj5gj9rVguDZZa
         4HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=azMEpLf7aWNZhUtboA/PAANf5wrHSqPwOi1720U3HMA=;
        b=QlA3UYn++uoYdgjfmpVpoJbIxLQDcxFmAaQf4NVDoyKzJoGArRHkXwDjfRWBL14xbx
         V/zUWos6Oqc0sAyiYN6Q3OjLJSvz+CDlSfxY/wewkWlEbeWBEswdBwqoqA+qCPtiQKLh
         8ExwRA/S0m1HoHiFiFuAsIiTW5O68eLLueA0yiAUdiLIwdDv6mSroYCvwBapTf90+oDU
         LlwuyGyKx8gvs1gYgKOST165hItE6n6W9IYPAEH/AvwqnabMwbP/EojcXjK4pYntPDRU
         ZhjlGFr3LZlV+NKhmcWbdfgxNwaszqFkYb2T6BGVugB0xni6bcP+zd62FdalwnZpFjkx
         e0zw==
X-Gm-Message-State: AOAM533Y0tfb7+6gBl6WsaQxYap38Wcb2K2T6J3g+Fd72ESe3Vi8wXa8
        /fGUBGTgdwtRRpVonDtzqbjMFX0QJUe3ZIznE6WPIw==
X-Google-Smtp-Source: ABdhPJxTsmNohBWRkHmue6ROVCTM07S7/HjA3rW1NDPpfPaNgAietFiK2+kN2vezU7wkSDb/IWLoVIpMLPyNMg/SnMc=
X-Received: by 2002:ae9:e309:: with SMTP id v9mr13989354qkf.138.1626507223759;
 Sat, 17 Jul 2021 00:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210710140130.1176657-1-dmitry.baryshkov@linaro.org>
 <20210710140130.1176657-3-dmitry.baryshkov@linaro.org> <YPIVwgAjb/JdTowQ@yoga>
In-Reply-To: <YPIVwgAjb/JdTowQ@yoga>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 17 Jul 2021 10:33:32 +0300
Message-ID: <CAA8EJpood3wOGdS-uK=E0gGg17V-GinO-ypoGggbmanK6H9KaA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: move pm_clk functionality into common code
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 17 Jul 2021 at 02:27, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 10 Jul 09:01 CDT 2021, Dmitry Baryshkov wrote:
>
> > Several Qualcomm clock controller drivers use pm_clk functionality.
> > Instead of having common code in all the drivers, move the pm_clk
> > handling to the qcom_cc_map/qcom_cc_probe.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/camcc-sc7180.c       |  44 ++--------
> >  drivers/clk/qcom/common.c             | 113 +++++++++++++++++++++++---
> >  drivers/clk/qcom/common.h             |   6 ++
> >  drivers/clk/qcom/lpasscorecc-sc7180.c |  56 +++----------
> >  drivers/clk/qcom/mss-sc7180.c         |  40 ++-------
> >  drivers/clk/qcom/q6sstop-qcs404.c     |  36 ++------
> >  drivers/clk/qcom/turingcc-qcs404.c    |  34 ++------
> >  7 files changed, 142 insertions(+), 187 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
> > index 9bcf2f8ed4de..1c6c1b7fab51 100644
> > --- a/drivers/clk/qcom/camcc-sc7180.c
> > +++ b/drivers/clk/qcom/camcc-sc7180.c
> > @@ -9,7 +9,6 @@
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> >  #include <linux/pm_clock.h>
> > -#include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> >
> >  #include <dt-bindings/clock/qcom,camcc-sc7180.h>
> > @@ -1631,8 +1630,12 @@ static const struct regmap_config cam_cc_sc7180_regmap_config = {
> >       .fast_io = true,
> >  };
> >
> > +static const char * const cam_cc_sc7180_pm_clks[] = { "xo", "iface" };
> > +
> >  static const struct qcom_cc_desc cam_cc_sc7180_desc = {
> >       .config = &cam_cc_sc7180_regmap_config,
> > +     .pm_clks = cam_cc_sc7180_pm_clks,
> > +     .num_pm_clks = ARRAY_SIZE(cam_cc_sc7180_pm_clks),
> >       .clk_hws = cam_cc_sc7180_hws,
> >       .num_clk_hws = ARRAY_SIZE(cam_cc_sc7180_hws),
> >       .clks = cam_cc_sc7180_clocks,
> > @@ -1652,33 +1655,9 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
> >       struct regmap *regmap;
> >       int ret;
> >
> > -     pm_runtime_enable(&pdev->dev);
> > -     ret = pm_clk_create(&pdev->dev);
> > -     if (ret < 0)
> > -             return ret;
> > -
> > -     ret = pm_clk_add(&pdev->dev, "xo");
> > -     if (ret < 0) {
> > -             dev_err(&pdev->dev, "Failed to acquire XO clock\n");
> > -             goto disable_pm_runtime;
> > -     }
> > -
> > -     ret = pm_clk_add(&pdev->dev, "iface");
> > -     if (ret < 0) {
> > -             dev_err(&pdev->dev, "Failed to acquire iface clock\n");
> > -             goto disable_pm_runtime;
> > -     }
> > -
> > -     ret = pm_runtime_get(&pdev->dev);
> > -     if (ret)
> > -             goto destroy_pm_clk;
> > -
> >       regmap = qcom_cc_map(pdev, &cam_cc_sc7180_desc);
> > -     if (IS_ERR(regmap)) {
> > -             ret = PTR_ERR(regmap);
> > -             pm_runtime_put(&pdev->dev);
> > -             goto destroy_pm_clk;
> > -     }
> > +     if (IS_ERR(regmap))
> > +             return PTR_ERR(regmap);
> >
> >       clk_fabia_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
> >       clk_fabia_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
> > @@ -1686,21 +1665,12 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
> >       clk_fabia_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
> >
> >       ret = qcom_cc_really_probe(pdev, &cam_cc_sc7180_desc, regmap);
> > -     pm_runtime_put(&pdev->dev);
> >       if (ret < 0) {
> >               dev_err(&pdev->dev, "Failed to register CAM CC clocks\n");
> > -             goto destroy_pm_clk;
> > +             return 0;
> >       }
> >
> >       return 0;
> > -
> > -destroy_pm_clk:
> > -     pm_clk_destroy(&pdev->dev);
> > -
> > -disable_pm_runtime:
> > -     pm_runtime_disable(&pdev->dev);
> > -
> > -     return ret;
> >  }
> >
> >  static const struct dev_pm_ops cam_cc_pm_ops = {
> > diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> > index ed7c516a597a..e1d34561cab7 100644
> > --- a/drivers/clk/qcom/common.c
> > +++ b/drivers/clk/qcom/common.c
> > @@ -7,6 +7,8 @@
> >  #include <linux/module.h>
> >  #include <linux/regmap.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_clock.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/clk-provider.h>
> >  #include <linux/reset-controller.h>
> >  #include <linux/of.h>
> > @@ -69,12 +71,86 @@ int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map, u8 src)
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_find_src_index);
> >
> > +static void qcom_cc_pm_runtime_disable(void *data)
> > +{
> > +     pm_runtime_disable(data);
> > +}
> > +
> > +static void qcom_cc_pm_clk_destroy(void *data)
> > +{
> > +     pm_clk_destroy(data);
> > +}
> > +
> > +static int
> > +qcom_cc_add_pm_clks(struct platform_device *pdev, const struct qcom_cc_desc *desc)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     int ret;
> > +     int i;
> > +
> > +     if (!desc->num_pm_clks)
> > +             return 0;
> > +
> > +     ret = pm_clk_create(dev);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret = devm_add_action_or_reset(dev, qcom_cc_pm_clk_destroy, dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     for (i = 0; i < desc->num_pm_clks; i++) {
> > +             ret = pm_clk_add(dev, desc->pm_clks[i]);
> > +             if (ret < 0) {
> > +                     dev_err(dev, "Failed to acquire %s pm clk\n", desc->pm_clks[i]);
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int
> > +qcom_cc_manage_pm(struct platform_device *pdev, const struct qcom_cc_desc *desc)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     int ret;
> > +
> > +     /* For now enable runtime PM only if we have PM clocks in use */
> > +     if (desc->num_pm_clks && !pm_runtime_enabled(dev)) {
> > +             pm_runtime_enable(dev);
> > +
> > +             ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret = qcom_cc_add_pm_clks(pdev, desc);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Other code might have enabled runtime PM, resume device here */
> > +     if (pm_runtime_enabled(dev)) {
> > +             ret = pm_runtime_get_sync(dev);
>
> As I said previously, don't do this. Look at how clk_pm_runtime_get()
> and clk_pm_runtime_put() are invoked throughout the clock framework.

Please, check what I'm changing here. sc7180/qcs404 Do call
pm_runtime_get/_put in the _probe function. Like most other drivers
do. Do you dislike the pm_runtime_enabled() call? Or the idea of
calling pm_runtime_get_foo()/_put_foo()? I don't think we can get w/o
the latter.

> At best this would be an optimization to ensure that the pm_runtime
> state isn't toggled back and forth between every operation, but this is
> typically not how we deal with that and this is certainly unrelated to
> the rest of what the patch does.
>
> > +             if (ret) {
> > +                     pm_runtime_put_noidle(dev);
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static struct regmap *
> >  qcom_cc_map_by_index(struct platform_device *pdev, const struct qcom_cc_desc *desc, int index)
>
> I really don't like the idea of having a function with a name that
> indicates that it's mapping hardware blocks to under the hood also play
> pm_runtime.
>
> Afaict the reason for this patch is to avoid having to sprinkle
> pm_runtime_enable(), pm_clk_create(), pm_clk_destroy() and
> pm_runtime_disable() in the various clock drivers that needs this.
>
> But as I said previously, there's a lot of drivers in the kernel that
> does exactly and only that, so there's definitely motivation to create
> devm_pm_runtime_enable() and devm_pm_clk_create() and then go back and
> clean up these and a lot of other drivers.

I like the idea of these helpers. Will try adding the devres-managed
helpers and using them from the qcom cc code. I will remove it from
the qcom_cc_map().

>
> Perhaps I'm overly optimistic about getting those interfaces landed, if
> that's the case I would like to have some explicit
> devres-pm_runtime_enable/pm_clk_create/pm_clk_add added in the common
> code, rather than piggy backing the existing map function.
>
> But either way, I would much rather see you land the subdomain setup in
> gdsc_register(), the pm_runtime_enable/disable we need in the
> dispcc-sm8250 and the pm_runtime_get()/put() we need in gdsc_init(),
> gdsc_enable() and gdsc_disable() - before refactoring all this.

Well, after you pointed me to the turingcc driver(and other pm-enabled
qcom cc drivers), it was quite natural to rework this to come up with
the code that would be common to qcs404, sc7180 and sm8250 in terms of
setting up runtime pm. Otherwise we can land the sm8250 code and then
have to rewrite it again to support both gdsc-subdomains and pm_clk
usage.

>
> >  {
> >       void __iomem *base;
> >       struct resource *res;
> >       struct device *dev = &pdev->dev;
> > +     int ret;
> > +
> > +     ret = qcom_cc_manage_pm(pdev, desc);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> >
> >       res = platform_get_resource(pdev, IORESOURCE_MEM, index);
> >       base = devm_ioremap_resource(dev, res);
> > @@ -244,8 +320,10 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> >       struct clk_hw **clk_hws = desc->clk_hws;
> >
> >       cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
> > -     if (!cc)
> > -             return -ENOMEM;
> > +     if (!cc) {
> > +             ret = -ENOMEM;
> > +             goto err;
> > +     }
> >
> >       reset = &cc->reset;
> >       reset->rcdev.of_node = dev->of_node;
> > @@ -257,22 +335,25 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> >
> >       ret = devm_reset_controller_register(dev, &reset->rcdev);
> >       if (ret)
> > -             return ret;
> > +             goto err;
> >
> >       if (desc->gdscs && desc->num_gdscs) {
> >               scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
> > -             if (!scd)
> > -                     return -ENOMEM;
> > +             if (!scd) {
> > +                     ret = -ENOMEM;
> > +                     goto err;
> > +             }
> > +
> >               scd->dev = dev;
> >               scd->scs = desc->gdscs;
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
> > @@ -283,7 +364,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> >       for (i = 0; i < num_clk_hws; i++) {
> >               ret = devm_clk_hw_register(dev, clk_hws[i]);
> >               if (ret)
> > -                     return ret;
> > +                     goto err;
> >       }
> >
> >       for (i = 0; i < num_clks; i++) {
> > @@ -292,14 +373,26 @@ int qcom_cc_really_probe(struct platform_device *pdev,
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
> > +     if (pm_runtime_enabled(dev)) {
> > +             /* for the LPASS on sc7180, which uses autosuspend */
> > +             pm_runtime_mark_last_busy(dev);
> > +             pm_runtime_put(dev);
> > +     }
> >
> >       return 0;
> > +
> > +err:
> > +     if (pm_runtime_enabled(dev))
> > +             pm_runtime_put(dev);
> > +
> > +     return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
> >
> > diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> > index bb39a7e106d8..5b45e2033a92 100644
> > --- a/drivers/clk/qcom/common.h
> > +++ b/drivers/clk/qcom/common.h
> > @@ -19,8 +19,14 @@ struct clk_hw;
> >  #define PLL_VOTE_FSM_ENA     BIT(20)
> >  #define PLL_VOTE_FSM_RESET   BIT(21)
> >
> > +/*
> > + * Note: if pm_clks are used, pm_clk_suspend/resume should be called manually
> > + * from runtime pm callbacks (or just passed to SET_RUNTIME_PM_OPS).
> > + */
>
> I don't like the fact that you're hiding most of the pm_runtime boiler
> plate code, but each driver still needs to do this.

I did not like that too. I have some ideas (like using device_type),
but this can wait.

>
> Perhaps there is merit to have a qcom_cc_pm_enable_and_add_clocks() and
> qcom_cc_pm_ops exposed by common.c, but please let's add the pieces we
> need first.

Ack.

>
> Regards,
> Bjorn



-- 
With best wishes
Dmitry
