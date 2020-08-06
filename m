Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 483FA23D514
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 03:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgHFBZI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 21:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbgHFBZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 21:25:04 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1704C061575
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2020 18:25:03 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id t7so21104903otp.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2020 18:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k6pimq7S+VITQhnjcjjKsbMV9B3GCD09apLcTf0EFW4=;
        b=zBjyQ7FqB6dMiThk1hav7gsRnCLpxmI/Fy5uZOtG59LSQ2QsizkGeT9cxRcrrT5uuK
         IN7w9SlXJWWBuojgD/fhVAol+es3RGGs8AmAlc7M3oYZR77TgO837vZj7SBdpFIojDRw
         LTKRa9aTIHhvoQX+4vvpYLQ+yGi/UKZ8Y7EbrZD1x6XS4Bd5efeeHiRAUqKaCUK1vNQK
         lexkbnVoJkHVdOviBHjojnC4qCA6htQXfwn4PGdpQSF16KaqNDXBMqWYqst2HW96Hm7r
         2/VNTA/3gvLGwRTGVyBp9ZBPbKUGDZdXhoY6xue1CEj/Gg4kd1FIAb4SqmnPuO8aJGbY
         6hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k6pimq7S+VITQhnjcjjKsbMV9B3GCD09apLcTf0EFW4=;
        b=lammXUmTJWcQcQb3jjKVAmlvh2ob2IyrhpfKs8ABou36CPY4PppbPaB/gXYprCFPpc
         pOX7shtwQMJuq9eYKLjAbYVZNHV9PXrAZM1lqbIFuOfO8wzL2tTSnsSy0MFtD5l7j+61
         taPKKYJtYrJtYhg+HJIZfm81LZd5knhT469fWaF4PSjo5owydIG7dtZtVbs1dubt4///
         uMgEjJwG3y8NllTUa/1URAHNvtRUh9VRdl8V62y3/ZbBs5G5gUYmKybYdh4/00UwjJIJ
         jEhIVyBSo5q0Mgi9c7y9Mg4A0bVqkbVXDtPM/3K0++rvDBvZc9f4EHFoombaw8ZZl/NG
         5Y8A==
X-Gm-Message-State: AOAM532NaD17PXzs/dkpCqzeaPmXXoJ3i8jg5HPKOy68pma0lEWrjmI1
        uXuDfHsbPKdGiwqJ8IYSvvlH6PLL5HivdnWOacX34w==
X-Google-Smtp-Source: ABdhPJwp1gy6ICxlR+QU+ROR+YJdoXDHLADEqbolalzpss7WqkKehLyLFZYdIvJ/S4ZjbwkZ1sedTzTnZwQb6ihZJxQ=
X-Received: by 2002:a05:6830:3196:: with SMTP id p22mr5524618ots.102.1596677102717;
 Wed, 05 Aug 2020 18:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com> <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
In-Reply-To: <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 5 Aug 2020 18:24:50 -0700
Message-ID: <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To:     Saravana Kannan <saravanak@google.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hanks Chen <hanks.chen@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 5, 2020 at 1:19 PM Saravana Kannan <saravanak@google.com> wrote:
> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
> > On Fri, Jul 17, 2020 at 5:06 PM Saravana Kannan <saravanak@google.com> wrote:
> > >
> > > Switch the driver to use the helper macros. In addition to reducing the
> > > number of lines, this also adds module unload protection (if the driver
> > > is compiled as a module) by switching from module_platform_driver to
> > > builtin_platform_driver.
> > >
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > ---
> > >  drivers/irqchip/qcom-pdc.c | 26 +++-----------------------
> > >  1 file changed, 3 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> > > index 5b624e3295e4..c1c5dfad57cc 100644
> > > --- a/drivers/irqchip/qcom-pdc.c
> > > +++ b/drivers/irqchip/qcom-pdc.c
> > > @@ -432,28 +432,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
> > >         return ret;
> > >  }
> > >
> > > -static int qcom_pdc_probe(struct platform_device *pdev)
> > > -{
> > > -       struct device_node *np = pdev->dev.of_node;
> > > -       struct device_node *parent = of_irq_find_parent(np);
> > > -
> > > -       return qcom_pdc_init(np, parent);
> > > -}
> > > -
> > > -static const struct of_device_id qcom_pdc_match_table[] = {
> > > -       { .compatible = "qcom,pdc" },
> > > -       {}
> > > -};
> > > -MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
> > > -
> > > -static struct platform_driver qcom_pdc_driver = {
> > > -       .probe = qcom_pdc_probe,
> > > -       .driver = {
> > > -               .name = "qcom-pdc",
> > > -               .of_match_table = qcom_pdc_match_table,
> > > -               .suppress_bind_attrs = true,
> > > -       },
> > > -};
> > > -module_platform_driver(qcom_pdc_driver);
> > > +IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
> > > +IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
> > > +IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
> > >  MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
> > >  MODULE_LICENSE("GPL v2");
> >
> > <sigh>
> > So this is where I bashfully admit I didn't get a chance to try this
> > patch series out, as I had success with a much older version of
> > Saravana's macro magic.
> >
> > But unfortunately, now that this has landed in mainline, I'm seeing
> > boot regressions on db845c. :( This is in the non-modular case,
> > building the driver in.
>
> Does that mean the modular version is working? Or you haven't tried
> that yet? I'll wait for your reply before I try to fix it. I don't
> have the hardware, but it should be easy to guess this issue looking
> at the code delta.

I've not yet tested with modules with your patch.

> The only significant change from what your probe function is doing is
> this snippet. But it'd be surprising if this only affects the builtin
> case.
>
> + if (par_np == np)
> +         par_np = NULL;
> +
> + /*
> + * If there's a parent interrupt controller and  none of the parent irq
> + * domains have been registered, that means the parent interrupt
> + * controller has not been initialized yet.  it's not time for this
> + * interrupt controller to initialize. So, defer probe of this
> + * interrupt controller. The actual initialization callback of this
> + * interrupt controller can check for specific domains as necessary.
> + */
> + if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
> +         return -EPROBE_DEFER;

Yep. We're getting caught on the irq_find_matching_host() check. I'm a
little lost as when I look at the qcom,pdc node in the dtsi its not
under a parent controller (instead the soc node).
Not sure if that's an issue in the dtsi or if par_np check needs to
ignore the soc node and pass null?

thanks
-john
