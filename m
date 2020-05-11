Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6531CD770
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 13:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgEKLPJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 07:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725993AbgEKLPI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 07:15:08 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED8FC061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 04:15:06 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id h15so5285778edv.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 04:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yf6Fgwz0TBfxr37ADXmX4uJ/e/GQxDcvOu2sIk21wIk=;
        b=oIqYFLJ6taukedc9Yf2iHuympHdWdio0/TIjf0ElH6MKuu5db0Cdi3x1KgqHJFlWDi
         QNVXqenRluAi/GIJTtbliLn6jeTLsSt5S1LAokRwQYsvySLbZRGW0zD85Tt1mds7XD3N
         UA5UcK81beu2kYUYDKOC7FdfHCt+jomF6/JaGuwlEc4QEVtdIc+ZL2NF5YJX3yAuhgO4
         L7WrCLwHB5Nmo+UjbpoMUjsxwO0qgjhnjCpUCzvDEzL9Qhj9Zox1kO2liJqBjdZ5xohL
         N2ndKDOC9HOoH5GZsv7OEBfX3PHhGLoCbMaORS4lIGOvelIN35PFO+RJDDvtxToTJdDg
         5fOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yf6Fgwz0TBfxr37ADXmX4uJ/e/GQxDcvOu2sIk21wIk=;
        b=HCAGWtjkvwtoMKadtr0IZxn8znojMzmo98gmU9s247JOKye/XH9h7H3Ii9m+fU0dDC
         nCeXEfiZcsTKY6S2BWpSsH4d4sd+RHp/tyr41GTPQxN3MkGOim1ZevRHUb3EDa6lS0tg
         PIArZZRmdbXXIpkhe9DFWlrRE3SzKCbvB31AccxsO6t/aPmMnwLad396MlUdjQxlikAc
         xWoh84kcp/cJTzHPOyNVuoCpYozr/fJLlm96mrjGJawxwwJ7qtzCXPxc5knJj+kjK/93
         uvY0e18RLeYiVRX2TfqPAcTxipLAYQHEyIZKSOCbNN9N94PjjDaLDhoQuMdI3pD9bL5l
         ARVA==
X-Gm-Message-State: AGi0PuYGuOfnwZeGF/i7Nvyhgw6SkDSFOOM0Rc85NsLhi7CZ90gINpR4
        uBk1AvHNNyKp0wyW8qDPzjQ80A+c/IevaDZHYvprCA==
X-Google-Smtp-Source: APiQypKZpI0Su/Nan4QydtdBoW2dC+0/pVJModGirvjBu8VI7zpyWVT+A294xWUAF4jIRGyK8v81H9B60bOLdQHD+LI=
X-Received: by 2002:aa7:cf0e:: with SMTP id a14mr12665125edy.188.1589195705213;
 Mon, 11 May 2020 04:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200426143725.18116-1-saiprakash.ranjan@codeaurora.org>
 <cf5852e9-c3c1-3d31-46f0-0370719947ab@arm.com> <CAJ9a7VgF3-Hdc7KSw9gVBeXSDHNguhqVhp60oK2XhCtr3DhDqg@mail.gmail.com>
 <84918e7d-c933-3fa1-a61e-0615d4b3cf2c@arm.com> <668ea1283a6dd6b34e701972f6f71034@codeaurora.org>
 <5b0f5d77c4eec22d8048bb0ffa078345@codeaurora.org> <759d47de-2101-39cf-2f1c-cfefebebd548@arm.com>
 <7d343e96cf0701d91152fd14c2fdec42@codeaurora.org> <CAJ9a7VgEiX19ukjwakNHBHDeZJ05f5Z7pAYG9iEnpXCuuDfBqg@mail.gmail.com>
 <a4bba03d41a2b0145b3c6c19d48698eb@codeaurora.org> <CAJ9a7Vj4eyv1n=RxuqfV=pdBN3SDG+ShYS5J4s40KJtqOnR7vw@mail.gmail.com>
 <ae0fe2050be01cc1403c7d53a0da8cb8@codeaurora.org> <b8c1cc35846d425a1677c73fddf5874d@codeaurora.org>
 <eee1b9a90266eed9a9c75401f0679777@codeaurora.org>
In-Reply-To: <eee1b9a90266eed9a9c75401f0679777@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Mon, 11 May 2020 12:14:54 +0100
Message-ID: <CAJ9a7Vjd0XG+rAvHptAAjGtE6xRhYsPaOSC_Bf9B-w-FZFu_Qw@mail.gmail.com>
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple connections
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

HI,

On Fri, 8 May 2020 at 09:53, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Suzuki, Mike,
>
> On 2020-05-06 13:05, Sai Prakash Ranjan wrote:
> [...]
>
> >>>>
> >>> OK - sorry I read your statement saying that replicator1 was 0 after
> >>> the reset in probe(), rather than look at the logs.
> >>>
> >>> From the logs it is working at the time probe() occurs, but by the
> >>> time we come to enable the replicator later, something has reset
> >>> these
> >>> registers / hardware outside the control of the replicator driver.
> >>>
> >>
> >> Yes, I will try to get some more information from the firmware side if
> >> there is anything messing up.
> >>
> >
> > This turned out to be a clock/pm issue. To confirm, I just marked clk
> > as critical
> > so that it won't be gated and I saw the replicator1(swao_replicator)
> > registers
> > intact after probe. Also alternatively, I tried to comment out
> > disabling pclk
> > to check if there is something wrong in amba pm and this keeps the
> > registers
> > intact as well.
> >
> > @@ -288,7 +295,7 @@ static int amba_probe(struct device *dev)
> >                 pm_runtime_set_suspended(dev);
> >                 pm_runtime_put_noidle(dev);
> >
> > -               amba_put_disable_pclk(pcdev);
> > +               //amba_put_disable_pclk(pcdev);
> >                 dev_pm_domain_detach(dev, true);
> >         } while (0);
> >
>
> I checked with the debug team and there is a limitation with
> the replicator(swao_replicator) in the AOSS group where it
> loses the idfilter register context when the clock is disabled.
> This is not just in SC7180 SoC but also reported on some latest
> upcoming QCOM SoCs as well and will need to be taken care in
> order to enable coresight on these chipsets.
>
> Here's what's happening -  After the replicator is initialized,
> the clock is disabled in amba_pm_runtime_suspend() as a part of
> pm runtime workqueue with the assumption that there will be no
> loss of context after the replicator is initialized. But it doesn't
> hold good with the replicators with these unfortunate limitation
> and the idfilter register context is lost.
>
> [    5.889406] amba_pm_runtime_suspend devname=3D6b06000.replicator ret=
=3D0
> [    5.914516] Workqueue: pm pm_runtime_work
> [    5.918648] Call trace:
> [    5.921185]  dump_backtrace+0x0/0x1d0
> [    5.924958]  show_stack+0x2c/0x38
> [    5.928382]  dump_stack+0xc0/0x104
> [    5.931896]  amba_pm_runtime_suspend+0xd8/0xe0
> [    5.936469]  __rpm_callback+0xe0/0x140
> [    5.940332]  rpm_callback+0x38/0x98
> [    5.943926]  rpm_suspend+0xec/0x618
> [    5.947522]  rpm_idle+0x5c/0x3f8
> [    5.950851]  pm_runtime_work+0xa8/0xc0
> [    5.954718]  process_one_work+0x1f8/0x4c0
> [    5.958848]  worker_thread+0x50/0x468
> [    5.962623]  kthread+0x12c/0x158
> [    5.965957]  ret_from_fork+0x10/0x1c
>
> This is a platform/SoC specific replicator issue, so we can either
> introduce some DT property for replicators to identify which replicator
> has this limitation, check in replicator_enable() and reset the
> registers
> or have something like below diff to check the idfilter registers in
> replicator_enable() and then reset with clear comment specifying it=E2=80=
=99s
> the
> hardware limitation on some QCOM SoCs. Please let me know your thoughts
> on
> this?
>

1) does this replicator part have a unique ID that differs from the
standard ARM designed replicators?
If so perhaps link the modification into this. (even if the part no in
PIDR0/1 is the same the UCI should be different for a different
implementation)

2) We have used DT properties in the past - (e.g. scatter gather in
TMC) where hardware compatibility issues have impacted on the
operation of a coresight component. This is further complicated by the
fact that an ACPI property would be needed as well.

3) The sysfs access to FILTERID0/1 on this replicator is going to show
different values than on a standard replicator (0x00 instead of 0xFF).
Does this need to be addressed?

4 ) An alternative approach could be to model the driver on the ETM /
CTI drivers where the register values are held in the driver structure
and only applied on enable / disable.

Thoughts?

Regards

Mike



> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c
> b/drivers/hwtracing/coresight/coresight-replicator.c
> index e7dc1c31d20d..a9c039c944eb 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -68,6 +68,17 @@ static int dynamic_replicator_enable(struct
> replicator_drvdata *drvdata,
>          int rc =3D 0;
>          u32 reg;
>
> +       /*
> +        * On some QCOM SoCs with replicators in Always-On domain,
> disabling
> +        * clock will result in replicator losing its context. Currently
> +        * as a part of pm_runtime workqueue, amba_pm_runtime_suspend
> disables
> +        * clock assuming the context is not lost which is not true for
> cases
> +        * with hardware limitations as the above.
> +        */
> +       if ((readl_relaxed(drvdata->base + REPLICATOR_IDFILTER0) =3D=3D 0=
)
> &&
> +           (readl_relaxed(drvdata->base + REPLICATOR_IDFILTER1) =3D=3D 0=
))
> +               dynamic_replicator_reset(drvdata);
> +
>          switch (outport) {
>          case 0:
>                  reg =3D REPLICATOR_IDFILTER0;
>
>
>
> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation



--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
