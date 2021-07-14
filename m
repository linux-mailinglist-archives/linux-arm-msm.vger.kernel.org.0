Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB313C8964
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 19:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbhGNRNH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 13:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237299AbhGNRNH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 13:13:07 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929C7C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 10:10:14 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso3205187otu.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 10:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WljVwMgt8MmNIHRKgOl9FuBOXN9yb1WIc0SSJd8F1g8=;
        b=FRGUPPRXo0hHbuF+jBDSkTQ4iqndt8V5NTcAOFVGAThqMwCCzwZk5K8tPXv3w7BSxc
         H5vHHmNXht7h/k2YbrL+cC8dTSSkBgo6nEBu2xjeHv1RPfS+t7+iqImknJVDQKz2wLuq
         z2XZBihUpbHe/UwEuBhXIAe0ml1gyRDe8jz7738KOq3L6iBOE01PXMIkqrbT4iBwZGdf
         aVE30AmAd+7LTLpUY10fj8M/x2ACQAkIr45arQ6F/oeE5EVqHVD4/6J2cvvRt1/ZwD9r
         korpQK4VwcptZsV0WXhyUOZ/IM/s6yBarr6tYxHfiNmb/EoVAA4dSbGJVGZHK5gro/OA
         YblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WljVwMgt8MmNIHRKgOl9FuBOXN9yb1WIc0SSJd8F1g8=;
        b=J3yK/kusQnq1MD6cDcb6QK4yIKAt+mFxx0Bw54bLYMefVMI0CcHFbWL5u5Sad4VxNs
         h4ih/WyB5xfPn6U7s7+BtP1jJECBaQdrP3o+Cj8SUzXh+Q7548LorzjiojE4e995bnXh
         mKpFGBSOpPXi2uBulkM7rFBn559X0fpY3BBoP34Pr5am4cqvYwAOXMEt/V1VoWg2k9Be
         klYN0CQtJih4y3RM7ZdOBMPk+cl9EBtzn4AIddeKznKiS/2tsxz3+1sd1JEYhDYy5seD
         3Sxdko2ca+FgWX49xyfJAAVM76Ky0nO7QkoMGWa2xYUF0UIAgErYwVIPKMPetQ89S2If
         IHIw==
X-Gm-Message-State: AOAM533VPBLi/HR5s4Lib/ONE0CbstAvJ2F165sVnNpvjUk3Su1Gj7qT
        p5M5LcbVTcuHkw42YtGPY4Ta1Q==
X-Google-Smtp-Source: ABdhPJzj4XrbFecWv5la+KvE6ks1sWoks2nxcoBXwLoxijbRm2q4j+1XJjRlx6BCSdTVX6lyGC7ESg==
X-Received: by 2002:a05:6830:1118:: with SMTP id w24mr9162120otq.89.1626282613845;
        Wed, 14 Jul 2021 10:10:13 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i188sm615879oih.7.2021.07.14.10.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 10:10:13 -0700 (PDT)
Date:   Wed, 14 Jul 2021 12:10:10 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
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
Subject: Re: [PATCH v3 2/7] regulator: qca6390: add support for QCA639x
 powerup sequence
Message-ID: <YO8ackdFtbGhAqtM@yoga>
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
 <20210621223141.1638189-3-dmitry.baryshkov@linaro.org>
 <CAPDyKFo6dmjw0TnaK7=35dq5Si_6YYpeeSa=gU++1od7WkQZ7A@mail.gmail.com>
 <20210706115517.GB4529@sirena.org.uk>
 <CAPDyKFr=8spZBD+bTe3SjS=nATL-ByFu_epnT2Z4chSuQNke2w@mail.gmail.com>
 <CAA8EJppSV--TBjnGxGhaTHeKWdpM6uz70bg7diU3_K7OHoka4g@mail.gmail.com>
 <20210714164710.GC2719790@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714164710.GC2719790@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 14 Jul 11:47 CDT 2021, Rob Herring wrote:

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
> 

But what do you want to see?

We have a single piece of hardware that needs a specific power sequence,
which is interacted with using both UART and PCIe.

> If pwrseq works as a kernel library/api, then I have no issue with that.
> 
> > 
> > > Therefore, I think it would be worth having a common solution for
> > > this, rather than a solution per subsystem or even worse, per device.
> 
> Power sequencing requirements are inheritently per device unless we're 
> talking about standard connectors. 
> 

Do you mean "device" as in the IC or device as in struct device? Because
we do have one physical IC, that has a need for a specific power on
sequence, but we have two struct device, on two different busses in
Linux interacting with this thing.

> This is a solved problem on MDIO. It's quite simple. If there's a DT 
> node for a device you haven't discovered, then probe it anyways.
> 

Okay, so DT tells us that there's actually a WiFi thing on the PCIe bus,
even though we can't find it, so we probe something...then what?

Regards,
Bjorn
