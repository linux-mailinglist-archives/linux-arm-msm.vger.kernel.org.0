Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464733C2303
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 13:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhGILmd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 07:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbhGILmd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 07:42:33 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2867DC0613E7
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 04:39:50 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id i125so8937204qke.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 04:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V80QwRmpVqLUC1/pv95T7LChrvArer3bS4sHJ/jE7pM=;
        b=Mcjrj+EF55gxmaqc6tz/ekD7I3bs3f1Lm68LlK8VTuwLZE/S80ym58HLfCWIU40S2P
         /6pA9l+yCKaWXsASDqXmV9tfCj6PfvOSLgSzFkR9cNTxTLckiK3XECwRkA4OeZJmLdfm
         spqDijNKbfXMffSPvv5Nw6EqQrfHyTI/fIm5+nFauKeUwoCrSsKsootOJO2TgFAGu9CT
         rG0kT7BuO8vvcVOXYAmSIv0+6B6QtHQo7zz3j54JQ3p1ohaSlYj0lUOOPsTVFgikAByZ
         znYtPwnzfWXVV9+DYX25XdSF1l9wx+9wAge9RE02zg0H7be9miB+lHdAVfCLe2tZXuyW
         Wiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V80QwRmpVqLUC1/pv95T7LChrvArer3bS4sHJ/jE7pM=;
        b=HPQ1zP8JSe/X+KmmQsYCyGv65ltEqmaa/KBtPc9Tr88RsQvQGzx058RUkWEHOuo52w
         KDFZTOnWQRUkc4WMcbZbYdXCAz13OBUtx9w768fUDRG+iGpBELbSQSBlLO8X7NdWTnc9
         mcCSIebIwr/DIzbrAySkwu9IacPdHOtNQrKAfxf3nu9V0M2f2KklRXGLE8dixwjp+TE5
         q432D4QVpql6Jts5g3TvtDmBIPXyMXtsjCTd9UFHRzXupjmab72j4VSfXqM98Ics8qzn
         nhgToaYIaUt6Wuw9i0g6x/CY34/zQ513gWMl7ZYMf7pjVB83qbUFvxmXxP8orWbDWfsc
         1dnQ==
X-Gm-Message-State: AOAM532xwDknxvE5Dtd4OgNPIK3c2MYq/RPz3Emoosi9FK9Ux55FdVW7
        5sD+39AiV+zkG00zqMkkNGX+qOgWzP84kNNmMSnYBw==
X-Google-Smtp-Source: ABdhPJyMo2wUMKJXK0KxcB+yRDpiHkai20Amf0pxsUSYlncs5xFeAFIIYQibhXDSSQCVAbQKVd7GDIA5UvRkYIIBUOs=
X-Received: by 2002:a05:620a:651:: with SMTP id a17mr13144418qka.434.1625830789281;
 Fri, 09 Jul 2021 04:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
 <20210709043136.533205-4-dmitry.baryshkov@linaro.org> <CAPDyKFoNPkFqGMvR=JGXNVXp-UfWLUqReZ0DGP8+0PBh+7dCRg@mail.gmail.com>
In-Reply-To: <CAPDyKFoNPkFqGMvR=JGXNVXp-UfWLUqReZ0DGP8+0PBh+7dCRg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 9 Jul 2021 14:39:37 +0300
Message-ID: <CAA8EJpqykAyBKBADuGUQeZjG5-NPC6HgieNQLtWeA+McG_BMqw@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 3/7] PM: domains: Add support for runtime PM
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, 9 Jul 2021 at 11:25, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Fri, 9 Jul 2021 at 06:32, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Registers for some genpds can be located in the SoC area, powered up by
> > another power domain. To enabled access to those registers, respective
> > domain should be turned on.
> >
> > This patch adds basic infrastructure to the genpd code to allow
> > implementing drivers for such genpd. PM domain can provide the parent
> > device through the genpd->dev.parent pointer. If its provided at the
> > pm_genpd_init() call time and if it is pm-enabled, genpd power_on and
> > power_off operations will call pm_runtime_get_sync() before powering up
> > the domain and pm_runtime_put_sync() after powering it down.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Hi Dmitry,
>
> Using runtime PM for the genpd provider device, is not the correct
> approach. If the provider domain needs another domain to be powered on
> to work correctly, that per definition means that it has a parent
> domain.
>
> I suggest you try to build the correct PM domain topology, via using
> pm_genpd_add_subdomain() or of_genpd_add_subdomain(), then genpd will
> manages the power on/off for parent/child domain internally.

Indeed, this patch seems redundant now, with the
pm_genpd_add_subdomain call in place.
Would you like me to resend a v3 just dropping this patch?

>
> Kind regards
> Uffe
>
> > ---
> >  drivers/base/power/domain.c | 33 +++++++++++++++++++++++++++++++++
> >  include/linux/pm_domain.h   |  6 ++++++
> >  2 files changed, 39 insertions(+)
> >
> > diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> > index e5d97174c254..7d49531c9731 100644
> > --- a/drivers/base/power/domain.c
> > +++ b/drivers/base/power/domain.c
> > @@ -482,6 +482,30 @@ void dev_pm_genpd_set_next_wakeup(struct device *dev, ktime_t next)
> >  }
> >  EXPORT_SYMBOL_GPL(dev_pm_genpd_set_next_wakeup);
> >
> > +static int _genpd_pm_runtime_get(struct generic_pm_domain *genpd)
> > +{
> > +       int ret;
> > +
> > +       if (!(genpd->flags & _GENPD_FLAG_RPM_ENABLED))
> > +               return 0;
> > +
> > +       ret = pm_runtime_get_sync(genpd->dev.parent);
> > +       if (ret < 0) {
> > +               pm_runtime_put_noidle(genpd->dev.parent);
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static void _genpd_pm_runtime_put(struct generic_pm_domain *genpd)
> > +{
> > +       if (!(genpd->flags & _GENPD_FLAG_RPM_ENABLED))
> > +               return;
> > +
> > +       pm_runtime_put_sync(genpd->dev.parent);
> > +}
> > +
> >  static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
> >  {
> >         unsigned int state_idx = genpd->state_idx;
> > @@ -497,6 +521,10 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
> >         if (ret)
> >                 return ret;
> >
> > +       ret = _genpd_pm_runtime_get(genpd);
> > +       if (ret)
> > +               return ret;
> > +
> >         if (!genpd->power_on)
> >                 goto out;
> >
> > @@ -526,6 +554,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
> >         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
> >         return 0;
> >  err:
> > +       _genpd_pm_runtime_put(genpd);
> >         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
> >                                 NULL);
> >         return ret;
> > @@ -572,6 +601,7 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
> >                  genpd->name, "off", elapsed_ns);
> >
> >  out:
> > +       _genpd_pm_runtime_put(genpd);
> >         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
> >                                 NULL);
> >         return 0;
> > @@ -1986,6 +2016,9 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
> >         genpd->domain.ops.complete = genpd_complete;
> >         genpd->domain.start = genpd_dev_pm_start;
> >
> > +       if (genpd->dev.parent && pm_runtime_enabled(genpd->dev.parent))
> > +               genpd->flags |= _GENPD_FLAG_RPM_ENABLED;
> > +
> >         if (genpd->flags & GENPD_FLAG_PM_CLK) {
> >                 genpd->dev_ops.stop = pm_clk_suspend;
> >                 genpd->dev_ops.start = pm_clk_resume;
> > diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> > index 21a0577305ef..e86cd7cfc9ec 100644
> > --- a/include/linux/pm_domain.h
> > +++ b/include/linux/pm_domain.h
> > @@ -60,6 +60,10 @@
> >   * GENPD_FLAG_MIN_RESIDENCY:   Enable the genpd governor to consider its
> >   *                             components' next wakeup when determining the
> >   *                             optimal idle state.
> > + *
> > + * _GENPD_FLAG_RPM_ENABLED:    Use genpd's parent dev for runtime power
> > + *                             management. There is no need to set this flag,
> > + *                             it will be detected automatically.
> >   */
> >  #define GENPD_FLAG_PM_CLK       (1U << 0)
> >  #define GENPD_FLAG_IRQ_SAFE     (1U << 1)
> > @@ -69,6 +73,8 @@
> >  #define GENPD_FLAG_RPM_ALWAYS_ON (1U << 5)
> >  #define GENPD_FLAG_MIN_RESIDENCY (1U << 6)
> >
> > +#define _GENPD_FLAG_RPM_ENABLED         (1U << 31)
> > +
> >  enum gpd_status {
> >         GENPD_STATE_ON = 0,     /* PM domain is on */
> >         GENPD_STATE_OFF,        /* PM domain is off */
> > --
> > 2.30.2
> >



-- 
With best wishes
Dmitry
