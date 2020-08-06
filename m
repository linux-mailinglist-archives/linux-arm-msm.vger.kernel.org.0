Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7680E23E020
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 20:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgHFSHT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 14:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbgHFSG2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 14:06:28 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BECDCC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2020 11:06:10 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f193so15131320pfa.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2020 11:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ylCjemrTuNIFJbRktj1/dL7hZ8gSo2npn8SY8jax5gQ=;
        b=W515vg/30bkvIr9ovaD7pallgaeK4PaZItShKIvofk6SkZWY6nxUa0T9Rvg/J6pcDl
         0zhRo5qE3I8oTFFKS/tXbzaoxe3OFiKoDR/FA7LkamHucSt2LNptWQUVQd3tllTu0/Zp
         9IbTsClNA1MXSvr5s/j0Es7uAdCbwNDEe/yjhfq0eatrzS70oPh4ExhsEOmN+m7SyN/6
         ox37RInCzs4p2+I1Fqw96gSAImm2hl6sF3dOFjRToZa+na52lu4uB5LrH4nYMOA3x8uN
         1etbbkyv8uQp5x6Wp6iHTyTwyLobYapujcHbciVaS+35xJ7LuODbDH1R7fP4CNYnLd5v
         qmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ylCjemrTuNIFJbRktj1/dL7hZ8gSo2npn8SY8jax5gQ=;
        b=mNvV2R8bWkalBWZwKkBH3sD3QPR2xSWnLNVgaurKESvgHQd8ro5V+kyvdTl8dZadqM
         cmyyQQBXkcYXI5hm2SpheiyhZD+h5OlUsZO7qO7Fa3FwrYQYP8wH9ogUWAUYSaxRt1sZ
         syFPMeUPox+Q/VY+PKfIAiXHpygLzmW3bM/553t/gwYfGx6PHvoyMz9TyN8DCQ/r9WBb
         gXwaya1p//+fVawLRD5IW1Hs06kRLA73NvyxOUxFe+oSdgnxk6Vdb4G2L8W9nRC0NNp8
         GciDANLRn39mbBtsz1OJ+6h2zBDI1D57uLLhDJL9OiIWEcSlX8PNum1mcPM6eIGmpAGc
         H3Ow==
X-Gm-Message-State: AOAM530/VXfXaPaGbIRKY8L5qsiJ7CpixCuG9fhhosulYnnKitGb9E/9
        dEyi2CbcFfYz0C2E1L+6garxnGP1EAbJkPvO0nEKZw==
X-Google-Smtp-Source: ABdhPJxe86jVj9BTFCBMyCA/7qhgFwu4dSvBhB7qMRfIc9vQCd4mbllXI4drBsZvFenvyPYIcN49oB627PCOsPutoSs=
X-Received: by 2002:a05:6a00:2295:: with SMTP id f21mr9115086pfe.51.1596737168463;
 Thu, 06 Aug 2020 11:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com> <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com> <5e6124390b9e3e7f4d6f6decbdb669ca@kernel.org>
In-Reply-To: <5e6124390b9e3e7f4d6f6decbdb669ca@kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 6 Aug 2020 11:05:32 -0700
Message-ID: <CAGETcx89BRdSP6FKjDPU0zapt0ET9_PUr6bjZb9EA-jYn0maFw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To:     Marc Zyngier <maz@kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
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
        Loda Chou <loda.chou@mediatek.com>, steev@kali.org,
        Nial Peters <uceenpe@ucl.ac.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 6, 2020 at 5:12 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-08-06 02:24, John Stultz wrote:
> > On Wed, Aug 5, 2020 at 1:19 PM Saravana Kannan <saravanak@google.com>
> > wrote:
> >> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org>
> >> wrote:
> >> > On Fri, Jul 17, 2020 at 5:06 PM Saravana Kannan <saravanak@google.com> wrote:
> >> > >
> >> > > Switch the driver to use the helper macros. In addition to reducing the
> >> > > number of lines, this also adds module unload protection (if the driver
> >> > > is compiled as a module) by switching from module_platform_driver to
> >> > > builtin_platform_driver.
> >> > >
> >> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> >> > > ---
> >> > >  drivers/irqchip/qcom-pdc.c | 26 +++-----------------------
> >> > >  1 file changed, 3 insertions(+), 23 deletions(-)
> >> > >
> >> > > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> >> > > index 5b624e3295e4..c1c5dfad57cc 100644
> >> > > --- a/drivers/irqchip/qcom-pdc.c
> >> > > +++ b/drivers/irqchip/qcom-pdc.c
> >> > > @@ -432,28 +432,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
> >> > >         return ret;
> >> > >  }
> >> > >
> >> > > -static int qcom_pdc_probe(struct platform_device *pdev)
> >> > > -{
> >> > > -       struct device_node *np = pdev->dev.of_node;
> >> > > -       struct device_node *parent = of_irq_find_parent(np);
> >> > > -
> >> > > -       return qcom_pdc_init(np, parent);
> >> > > -}
> >> > > -
> >> > > -static const struct of_device_id qcom_pdc_match_table[] = {
> >> > > -       { .compatible = "qcom,pdc" },
> >> > > -       {}
> >> > > -};
> >> > > -MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
> >> > > -
> >> > > -static struct platform_driver qcom_pdc_driver = {
> >> > > -       .probe = qcom_pdc_probe,
> >> > > -       .driver = {
> >> > > -               .name = "qcom-pdc",
> >> > > -               .of_match_table = qcom_pdc_match_table,
> >> > > -               .suppress_bind_attrs = true,
> >> > > -       },
> >> > > -};
> >> > > -module_platform_driver(qcom_pdc_driver);
> >> > > +IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
> >> > > +IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
> >> > > +IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
> >> > >  MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
> >> > >  MODULE_LICENSE("GPL v2");
> >> >
> >> > <sigh>
> >> > So this is where I bashfully admit I didn't get a chance to try this
> >> > patch series out, as I had success with a much older version of
> >> > Saravana's macro magic.
> >> >
> >> > But unfortunately, now that this has landed in mainline, I'm seeing
> >> > boot regressions on db845c. :( This is in the non-modular case,
> >> > building the driver in.
> >>
> >> Does that mean the modular version is working? Or you haven't tried
> >> that yet? I'll wait for your reply before I try to fix it. I don't
> >> have the hardware, but it should be easy to guess this issue looking
> >> at the code delta.
> >
> > I've not yet tested with modules with your patch.
> >
> >> The only significant change from what your probe function is doing is
> >> this snippet. But it'd be surprising if this only affects the builtin
> >> case.
> >>
> >> + if (par_np == np)
> >> +         par_np = NULL;
> >> +
> >> + /*
> >> + * If there's a parent interrupt controller and  none of the parent
> >> irq
> >> + * domains have been registered, that means the parent interrupt
> >> + * controller has not been initialized yet.  it's not time for this
> >> + * interrupt controller to initialize. So, defer probe of this
> >> + * interrupt controller. The actual initialization callback of this
> >> + * interrupt controller can check for specific domains as necessary.
> >> + */
> >> + if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
> >> +         return -EPROBE_DEFER;
> >
> > Yep. We're getting caught on the irq_find_matching_host() check. I'm a
> > little lost as when I look at the qcom,pdc node in the dtsi its not
> > under a parent controller (instead the soc node).
> > Not sure if that's an issue in the dtsi or if par_np check needs to
> > ignore the soc node and pass null?
>
> I think you have nailed it. This checks for a domain attached to
> the driver we are about to probe, and this domain cannot possibly
> exist. Instead, it is the *parent* this should check for, as we
> depend on it for successful probing.

Duh! Looks like I made a copy-paste/typo error. The comment clearly
says I'm trying to check the parent and then I end up checking the
node getting registered. I'm sure this will fix it.

Actually Nial sent an email a few hours after your and he had found
the same issue. He even tested the fix with an irqchip driver and it
fixed the probe issue.

I'm assuming you'll put up the patch yourself. Please let me know if
you need me to send one.

Thanks,
Saravana
