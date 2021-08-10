Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334AA3E597C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 13:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238532AbhHJL4K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 07:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237632AbhHJL4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 07:56:08 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECA3C0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 04:55:46 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id g1so2757237vsq.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 04:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F7xu/bBnCf8IofdJc86gnO8/ycUPqIN8iSkmT0WuVQk=;
        b=l4Ceei4KMRjCvuuh2dEJXRgD7arZhfm9zTdC0UuddCXFyjoQ6R8qwWj2cfcM4Xb3NU
         iQgkHohQsJ/B52fCulLHrMjkeSm6n1KrOphOeYTaIq3wc1onp8T7VYUl3EFgtLLqf1/b
         pbFnJhrcZMzBUb9AqqW5lgfPzlsDORldw65Y5z+C4zz+G0D0P7shxhHHScEJA7rnEMpi
         If2YF6+YhSoadfey74zwnhRL8vLIb91zw/4tKiCfMNEctKWHk96NJ7MVgQZcbd3XBYw+
         8mPL3MVamWCkmBY7DWi23EqOOpOmABzfSlUlbY3Nq1bQltYxlrR9CFZCW1jCTu/lTSiw
         th0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F7xu/bBnCf8IofdJc86gnO8/ycUPqIN8iSkmT0WuVQk=;
        b=mtuhI7kFD+8MqKaCojrx5+q1LBxg6xPrTakpjQFTXiWyF2Z/+22wCSeuCotOpegbAB
         doTkJwZthx+2R7B5EWZIMxA31a/DSm3COJv2qnXNkSbi1hVk65ANICPHyZ7U0v7N/vFt
         bKzcfFytedJSmWDSgwncA9YPt/qsA5m1kEfHn1sDyz4g/5m+KjVbwcDxFh/H0OlTnX+C
         9EaTwD754aAY1VqMOAI7A2uLYqJm4IXfXqFnxmfU9pNZPGuVjAlDVHilsNsAjb47lkrT
         niMtZr4o380G23OSQd3T04UhJmpOChwuCwwPznerXKmiQo0hlqM95cQzCkFv//94yRV6
         kkjg==
X-Gm-Message-State: AOAM532Xr3oyAYNNUoQ6EYI68J0WxGC7+I1m1lhisFvW/Yo60gTTqBun
        TdvwQvVSvqD+g1rFLm62fyNFRu5VrnYBs8HM/pKxsA==
X-Google-Smtp-Source: ABdhPJzs5hioDbWm1Xnso+x3JzEaN9qdFPUT/HFC1aBPmwjgDn/+SCnR6iNy/JdyXVCbu99bZqbGsOKUbdGC0egdpl8=
X-Received: by 2002:a67:f6d8:: with SMTP id v24mr21612180vso.48.1628596545956;
 Tue, 10 Aug 2021 04:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
 <20210621223141.1638189-3-dmitry.baryshkov@linaro.org> <CAPDyKFo6dmjw0TnaK7=35dq5Si_6YYpeeSa=gU++1od7WkQZ7A@mail.gmail.com>
 <20210706115517.GB4529@sirena.org.uk> <CAPDyKFr=8spZBD+bTe3SjS=nATL-ByFu_epnT2Z4chSuQNke2w@mail.gmail.com>
 <CAA8EJppSV--TBjnGxGhaTHeKWdpM6uz70bg7diU3_K7OHoka4g@mail.gmail.com> <20210714164710.GC2719790@robh.at.kernel.org>
In-Reply-To: <20210714164710.GC2719790@robh.at.kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 10 Aug 2021 13:55:09 +0200
Message-ID: <CAPDyKFokvTFSpbnhhKeCmZzAjqvSpUiwz7QjjQNdcd3Sd3T0rQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] regulator: qca6390: add support for QCA639x
 powerup sequence
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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

On Wed, 14 Jul 2021 at 18:47, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Jul 08, 2021 at 02:37:44PM +0300, Dmitry Baryshkov wrote:
> > Hi,
> >
> > On Thu, 8 Jul 2021 at 13:10, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > - Peter (the email was bouncing)
> >
> > + Peter's kernel.org address
> >
> > >
> > > On Tue, 6 Jul 2021 at 13:55, Mark Brown <broonie@kernel.org> wrote:
> > > >
> > > > On Tue, Jul 06, 2021 at 09:54:03AM +0200, Ulf Hansson wrote:
> > > > > On Tue, 22 Jun 2021 at 00:32, Dmitry Baryshkov
> > > >
> > > > > > Qualcomm QCA6390/1 is a family of WiFi + Bluetooth SoCs, with BT part
> > > > > > being controlled through the UART and WiFi being present on PCIe
> > > > > > bus. Both blocks share common power sources. Add device driver handling
> > > > > > power sequencing of QCA6390/1.
> > > >
> > > > > Power sequencing of discoverable buses have been discussed several
> > > > > times before at LKML. The last attempt [1] I am aware of, was in 2017
> > > > > from Peter Chen. I don't think there is a common solution, yet.
> > > >
> > > > This feels a bit different to the power sequencing problem - it's not
> > > > exposing the individual inputs to the device but rather is a block that
> > > > manages everything but needs a bit of a kick to get things going (I'd
> > > > guess that with ACPI it'd be triggered via AML).  It's in the same space
> > > > but it's not quite the same issue I think, something that can handle
> > > > control of the individual resources might still struggle with this.
> > >
> > > Well, to me it looks very similar to those resouses we could manage
> > > with the mmc pwrseq, for SDIO. It's also typically the same kind of
> > > combo-chips that moved from supporting SDIO to PCIe, for improved
> > > performance I guess. More importantly, the same constraint to
> > > pre-power on the device is needed to allow it to be discovered/probed.
> >
> > In our case we'd definitely use pwrseq for PCIe bus and we can also
> > benefit from using pwrseq for serdev and for platform busses also (for
> > the same story of WiFi+BT chips).
> >
> > I can take a look at rewriting pwrseq code to also handle the PCIe
> > bus. Rewriting it to be a generic lib seems like an easy task,
> > plugging it into PCIe code would be more fun.
> >
> > Platform and serdev... Definitely even more fun.
>
> I don't want to see pwrseq (the binding) expanded to other buses. If
> that was the answer, we wouldn't be having this discussion. It was a
> mistake for MMC IMO.

Let's make sure we get your point correctly. I think we have discussed
this in the past, but let's refresh our memories.

If I recall correctly, you are against the mmc pwrseq DT bindings
because we are using a separate pwrseq OF node, that we point to via a
"mmc-pwrseq" property that contains a phandle from the mmc controller
device node. Is that correct?

If we would have encoded the power sequence specific properties, from
within a child node for the mmc controller node, that would have been
okay for you, right?

>
> If pwrseq works as a kernel library/api, then I have no issue with that.

That's what Peter Chen was trying to do. A generic interface, flexible
enough so it can be used for many similar configurations (but not
exactly the same).

Perhaps it was too generic though.

>
> >
> > > Therefore, I think it would be worth having a common solution for
> > > this, rather than a solution per subsystem or even worse, per device.
>
> Power sequencing requirements are inheritently per device unless we're
> talking about standard connectors.

The requirements are certainly per device, but the way to manage them
doesn't have to be.

As you said above, a generic library that subsystems/drivers can call
to power on/off a discoverable device, before trying to probe it would
be a good start.

>
> This is a solved problem on MDIO. It's quite simple. If there's a DT
> node for a device you haven't discovered, then probe it anyways.

A child OF node?

Then what do you think about some common power sequence properties
that we can use in such node?

>
> Rob

Kind regards
Uffe
