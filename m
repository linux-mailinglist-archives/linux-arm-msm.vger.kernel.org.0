Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408643EA26B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 11:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236379AbhHLJtF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 05:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235658AbhHLJtE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 05:49:04 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0385EC0613D3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 02:48:40 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id i1so3450757vsk.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 02:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IbLr+U6kbsLYPUHrhyJnM589L4UyonbadE9DVH0+ERM=;
        b=Cb1sc9wxSCmOmvEr0naKHwOEBQxsRJPZzXPY3/30OAHVmVCC9Vd+9EgJ8M7WgwXSOY
         EIUvz7kwNMVBTuy9adl70cTdScJP2o1dFdxsz79HUbpNXAJcLBZSdwXLEj9pNBoaW9cv
         cRL3NljtNs9Po1aUE/SfslCaGQSm6yYHn4+bNQjgLgccop1khDwIXk1+NrP9ZJmuonbe
         287hUz+rLBAHrOcxQEAIDDIneYpPorv3svSztRTsu2l3s+rKoRDfq1d7IkEHBkXZgJe2
         SizruHQsupdtvrM/6zThCvvMEauOoYyzLxfZwDbsCyg3HYM0tAoj8mg0NL9+fPq4eLdf
         QMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IbLr+U6kbsLYPUHrhyJnM589L4UyonbadE9DVH0+ERM=;
        b=EIDA1EefMMHlDXxYMljyeqSl7msRHG9zunzPItH+L69Hm5m1oCFxUayyoWBV/7vYC3
         5kGzODdmrYLUiyZYSI5G0ZCCW0R9oZhabHTwM7wiaq8XFoUW7egeAlwEJJ+WbyAHm+MQ
         cyI4KztKJoj6gZMB/w10Owak3v4Dhk75b0ENFWSxqgVCrSczJFuXoPIq6fMHlpnRKLgC
         aHeQMWfTVS0hB7Iye34rur7umLphwi4Ne/SatlhcrnRYMBj+gXdVT2zQYh0Nle+dVuMG
         KTFT8brIzh3ScWJqujSop9DWWmd4fpDpEBX+wKxvgXJuYdBlhCXkTpZtiXDii149YVpf
         0Bug==
X-Gm-Message-State: AOAM533GX26t20RIuJnsZhk9AC13HwfC89lVSLauloPzarCm5yFKejKt
        SmnfjWdINx5TsY23pxVHpJt00jdnCe5KRYWgW4fK6w==
X-Google-Smtp-Source: ABdhPJw51I5gnHwWq9GYyg15yW0e53urVKvvJQwgKLtCH00UUmyJOKAlXZJoRACLd3glOR57D91YqvUcYvoEz5EYcW4=
X-Received: by 2002:a67:3212:: with SMTP id y18mr1412234vsy.19.1628761718985;
 Thu, 12 Aug 2021 02:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
 <20210621223141.1638189-3-dmitry.baryshkov@linaro.org> <CAPDyKFo6dmjw0TnaK7=35dq5Si_6YYpeeSa=gU++1od7WkQZ7A@mail.gmail.com>
 <20210706115517.GB4529@sirena.org.uk> <CAPDyKFr=8spZBD+bTe3SjS=nATL-ByFu_epnT2Z4chSuQNke2w@mail.gmail.com>
 <CAA8EJppSV--TBjnGxGhaTHeKWdpM6uz70bg7diU3_K7OHoka4g@mail.gmail.com>
 <20210714164710.GC2719790@robh.at.kernel.org> <CAPDyKFokvTFSpbnhhKeCmZzAjqvSpUiwz7QjjQNdcd3Sd3T0rQ@mail.gmail.com>
 <YRKjQJc0yiQXFqCD@builder.lan>
In-Reply-To: <YRKjQJc0yiQXFqCD@builder.lan>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 12 Aug 2021 11:48:02 +0200
Message-ID: <CAPDyKFo+O34rvP7gbsC+ktd-p5QB9QAsbb+QEkWbiVqszChZJA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] regulator: qca6390: add support for QCA639x
 powerup sequence
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 10 Aug 2021 at 18:03, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 10 Aug 06:55 CDT 2021, Ulf Hansson wrote:
>
> > On Wed, 14 Jul 2021 at 18:47, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Thu, Jul 08, 2021 at 02:37:44PM +0300, Dmitry Baryshkov wrote:
> > > > Hi,
> > > >
> > > > On Thu, 8 Jul 2021 at 13:10, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > >
> > > > > - Peter (the email was bouncing)
> > > >
> > > > + Peter's kernel.org address
> > > >
> > > > >
> > > > > On Tue, 6 Jul 2021 at 13:55, Mark Brown <broonie@kernel.org> wrote:
> > > > > >
> > > > > > On Tue, Jul 06, 2021 at 09:54:03AM +0200, Ulf Hansson wrote:
> > > > > > > On Tue, 22 Jun 2021 at 00:32, Dmitry Baryshkov
> > > > > >
> > > > > > > > Qualcomm QCA6390/1 is a family of WiFi + Bluetooth SoCs, with BT part
> > > > > > > > being controlled through the UART and WiFi being present on PCIe
> > > > > > > > bus. Both blocks share common power sources. Add device driver handling
> > > > > > > > power sequencing of QCA6390/1.
> > > > > >
> > > > > > > Power sequencing of discoverable buses have been discussed several
> > > > > > > times before at LKML. The last attempt [1] I am aware of, was in 2017
> > > > > > > from Peter Chen. I don't think there is a common solution, yet.
> > > > > >
> > > > > > This feels a bit different to the power sequencing problem - it's not
> > > > > > exposing the individual inputs to the device but rather is a block that
> > > > > > manages everything but needs a bit of a kick to get things going (I'd
> > > > > > guess that with ACPI it'd be triggered via AML).  It's in the same space
> > > > > > but it's not quite the same issue I think, something that can handle
> > > > > > control of the individual resources might still struggle with this.
> > > > >
> > > > > Well, to me it looks very similar to those resouses we could manage
> > > > > with the mmc pwrseq, for SDIO. It's also typically the same kind of
> > > > > combo-chips that moved from supporting SDIO to PCIe, for improved
> > > > > performance I guess. More importantly, the same constraint to
> > > > > pre-power on the device is needed to allow it to be discovered/probed.
> > > >
> > > > In our case we'd definitely use pwrseq for PCIe bus and we can also
> > > > benefit from using pwrseq for serdev and for platform busses also (for
> > > > the same story of WiFi+BT chips).
> > > >
> > > > I can take a look at rewriting pwrseq code to also handle the PCIe
> > > > bus. Rewriting it to be a generic lib seems like an easy task,
> > > > plugging it into PCIe code would be more fun.
> > > >
> > > > Platform and serdev... Definitely even more fun.
> > >
> > > I don't want to see pwrseq (the binding) expanded to other buses. If
> > > that was the answer, we wouldn't be having this discussion. It was a
> > > mistake for MMC IMO.
> >
> > Let's make sure we get your point correctly. I think we have discussed
> > this in the past, but let's refresh our memories.
> >
> > If I recall correctly, you are against the mmc pwrseq DT bindings
> > because we are using a separate pwrseq OF node, that we point to via a
> > "mmc-pwrseq" property that contains a phandle from the mmc controller
> > device node. Is that correct?
> >
> > If we would have encoded the power sequence specific properties, from
> > within a child node for the mmc controller node, that would have been
> > okay for you, right?
> >
>
> In Dmitry's case, we have an external chip with that needs to be powered
> on per a specific sequence, at which point the WiFi driver on PCIe and
> BT driver on serdev will be able to communicate with the device.

Thanks for sharing more details.

So, not only do we have a discoverable device that needs to be powered
on in a device specific way before probing, but in fact we have two
consumers of that "combo chip", one (PCIe) for Wifi and one (serdev)
for Bluetooth.

>
> The extended case of this is where we have an SDX55 modem soldered onto
> the pcb next to the SoC, in which case the power sequencing is even more
> complex and additionally there are incoming gpios used to detect things
> such as the firmware of the modem has crashed and Linux needs to toggle
> power and rescan the PCIe bus.

That sounds very similar to what we manage for the SDIO bus already.

We have a mmc pwrseq node to describe what resources that are needed
to power on/off the external chip. The driver for the functional
device (Wifi chip for example) may then call SDIO APIs provided by the
mmc core to power on/off the device, in case some kind of reset would
be needed.

Additionally, we have a child node below the mmc controller node,
allowing us to describe device specific things for the SDIO functional
device, like an out-of-band IRQ line for example.

Overall, this seems to work fine, even if the DT bindings may be questionable.

>
> In both of these cases it seems quite reasonable to represent that
> external chip (and it's power needs) as a separate DT node. But we need
> a way to link the functional devices to that thing.

Don't get me wrong, I am not suggesting we should re-use the
mmc-pwrseq DT bindings - but just trying to share our experience
around them.

In the cases you describe, it certainly sounds like we need some kind
of minimal description in DT for these functional external devices.
For GPIO pins, for example.

How to describe this in DT is one thing, let's see if Rob can help to
point us in some direction of what could make sense.

When it comes to implementing a library/interface to manage these
functional devices, I guess we just have to continue to explore
various options. Perhaps just start simple with another subsystem,
like PCIe and see where this brings us.

>
> Regards,
> Bjorn
>

[...]

Kind regards
Uffe
