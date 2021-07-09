Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47AC53C20CA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 10:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbhGII2W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 04:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbhGII2W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 04:28:22 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36A8C0613E7
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 01:25:37 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id e20so3286944ual.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t3RLL9HO+hRks/PkaZVZzTRgr7UF7nIkarU/0lU2gW0=;
        b=xa8EcFrdSBerofKAu49UyccOsdgMTavqkP72/U4wlhtzAU56H3Rj/hASqT7/iblaWc
         PbO8qb28TkXHozsJ33GCYE6az0gFPuHBFfxBylnqMfX6TBGzPmBFARb2AtVnjYr2CyYW
         WI/3eah8ups/diSTfsx7Fb05cOyK1pM1WTarPOWDq1QB3bvNIseuTE7y+RiyVK9bl/fE
         NFu5Je+z/+mJ61795+jV1DmJR+9q+EfGkuBMxUmaTirZEmxLkVHatsUcZUgZXWk5thzb
         hyCcxgtcHbWlOZe0vhbrlTTqoqzMyrRWEAoKwAMBwuOc4RjZ50F9w+xIcpP8sUNbhkBL
         N92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t3RLL9HO+hRks/PkaZVZzTRgr7UF7nIkarU/0lU2gW0=;
        b=uhdEjO+fR6eepUOwbmPPlxxWHBBpTsDAJ8OzJV+YvIO3MdJSkZX5BKWA2Wrbx5xHD5
         Ig69FFBt1ALl0Obm2CRlWQqGUcN6ciETqYPcWUzDhEncBBnkoy9YqXqdvwAwsseIl4bJ
         DDbKMDfB+tQi8DUr8kkhqQ5P3fD6Qe+rXw8bLzYEBgn2M9cxMTAQE5FNNFGAkH4X9Jvn
         ZXNOV8SpqeaCfqjpupMyez3ZO7BNXMdp7dKCe8goQJCdK81bvjlhCZoOe3lKQWCOSfQV
         ykCquE+BeROpvahNKWiUaGryLNNSy6w9UUcHrFnoVrbrLUpihHTiHSb05B/CbJc4eRZF
         GlnQ==
X-Gm-Message-State: AOAM530fM0Ej9KXl4Fva1RM4yL1zDnQdRpCcDqfowDf4Z0Ahu5u4EKVt
        qBFH5Ch1SGCSBgF1CMidXEV5Okeh74OB3RW6/zRi7g==
X-Google-Smtp-Source: ABdhPJzMQyl6scM8lSRI3/3VcQLnb3dWbPw/GE5McGGy4qkNZvJw1LohG72KEsgcTXGV4e7TibVDqyBgR2zflxu3At4=
X-Received: by 2002:a9f:2f14:: with SMTP id x20mr36234489uaj.104.1625819136865;
 Fri, 09 Jul 2021 01:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org> <20210709043136.533205-4-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210709043136.533205-4-dmitry.baryshkov@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 9 Jul 2021 10:24:59 +0200
Message-ID: <CAPDyKFoNPkFqGMvR=JGXNVXp-UfWLUqReZ0DGP8+0PBh+7dCRg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 3/7] PM: domains: Add support for runtime PM
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Fri, 9 Jul 2021 at 06:32, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Registers for some genpds can be located in the SoC area, powered up by
> another power domain. To enabled access to those registers, respective
> domain should be turned on.
>
> This patch adds basic infrastructure to the genpd code to allow
> implementing drivers for such genpd. PM domain can provide the parent
> device through the genpd->dev.parent pointer. If its provided at the
> pm_genpd_init() call time and if it is pm-enabled, genpd power_on and
> power_off operations will call pm_runtime_get_sync() before powering up
> the domain and pm_runtime_put_sync() after powering it down.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Dmitry,

Using runtime PM for the genpd provider device, is not the correct
approach. If the provider domain needs another domain to be powered on
to work correctly, that per definition means that it has a parent
domain.

I suggest you try to build the correct PM domain topology, via using
pm_genpd_add_subdomain() or of_genpd_add_subdomain(), then genpd will
manages the power on/off for parent/child domain internally.

Kind regards
Uffe

> ---
>  drivers/base/power/domain.c | 33 +++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h   |  6 ++++++
>  2 files changed, 39 insertions(+)
>
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index e5d97174c254..7d49531c9731 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -482,6 +482,30 @@ void dev_pm_genpd_set_next_wakeup(struct device *dev, ktime_t next)
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_genpd_set_next_wakeup);
>
> +static int _genpd_pm_runtime_get(struct generic_pm_domain *genpd)
> +{
> +       int ret;
> +
> +       if (!(genpd->flags & _GENPD_FLAG_RPM_ENABLED))
> +               return 0;
> +
> +       ret = pm_runtime_get_sync(genpd->dev.parent);
> +       if (ret < 0) {
> +               pm_runtime_put_noidle(genpd->dev.parent);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void _genpd_pm_runtime_put(struct generic_pm_domain *genpd)
> +{
> +       if (!(genpd->flags & _GENPD_FLAG_RPM_ENABLED))
> +               return;
> +
> +       pm_runtime_put_sync(genpd->dev.parent);
> +}
> +
>  static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
>  {
>         unsigned int state_idx = genpd->state_idx;
> @@ -497,6 +521,10 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
>         if (ret)
>                 return ret;
>
> +       ret = _genpd_pm_runtime_get(genpd);
> +       if (ret)
> +               return ret;
> +
>         if (!genpd->power_on)
>                 goto out;
>
> @@ -526,6 +554,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
>         return 0;
>  err:
> +       _genpd_pm_runtime_put(genpd);
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
>                                 NULL);
>         return ret;
> @@ -572,6 +601,7 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
>                  genpd->name, "off", elapsed_ns);
>
>  out:
> +       _genpd_pm_runtime_put(genpd);
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
>                                 NULL);
>         return 0;
> @@ -1986,6 +2016,9 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>         genpd->domain.ops.complete = genpd_complete;
>         genpd->domain.start = genpd_dev_pm_start;
>
> +       if (genpd->dev.parent && pm_runtime_enabled(genpd->dev.parent))
> +               genpd->flags |= _GENPD_FLAG_RPM_ENABLED;
> +
>         if (genpd->flags & GENPD_FLAG_PM_CLK) {
>                 genpd->dev_ops.stop = pm_clk_suspend;
>                 genpd->dev_ops.start = pm_clk_resume;
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 21a0577305ef..e86cd7cfc9ec 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -60,6 +60,10 @@
>   * GENPD_FLAG_MIN_RESIDENCY:   Enable the genpd governor to consider its
>   *                             components' next wakeup when determining the
>   *                             optimal idle state.
> + *
> + * _GENPD_FLAG_RPM_ENABLED:    Use genpd's parent dev for runtime power
> + *                             management. There is no need to set this flag,
> + *                             it will be detected automatically.
>   */
>  #define GENPD_FLAG_PM_CLK       (1U << 0)
>  #define GENPD_FLAG_IRQ_SAFE     (1U << 1)
> @@ -69,6 +73,8 @@
>  #define GENPD_FLAG_RPM_ALWAYS_ON (1U << 5)
>  #define GENPD_FLAG_MIN_RESIDENCY (1U << 6)
>
> +#define _GENPD_FLAG_RPM_ENABLED         (1U << 31)
> +
>  enum gpd_status {
>         GENPD_STATE_ON = 0,     /* PM domain is on */
>         GENPD_STATE_OFF,        /* PM domain is off */
> --
> 2.30.2
>
