Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5959D25C492
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 17:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbgICPMn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 11:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729509AbgICPMY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 11:12:24 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86035C061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 08:12:24 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id j188so1937453vsd.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uHHFcLkNIiLQVYAmzZVXK/8zYSVt92+5Mj2OyGqnr44=;
        b=f5lXKRIfpN00TGVuZxIfdV9H3qnF8TmP65/poNjN0T9TDjw7nQcbCflqOuFJlLmpQz
         0Y50XwJ36wb0Ulw8l1sk6RZ2MYbYtp83gX4mKir2BKvubnvcTrJ/veh4yaWdNl2WPQAZ
         N4p+/n8J/cxtR6uioKGnXQIcjSdtXZZ4Y+two=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uHHFcLkNIiLQVYAmzZVXK/8zYSVt92+5Mj2OyGqnr44=;
        b=OnE0739XkZwPeAA9iPaACtu1MT1K9+tEVNdITKMiJ/t+cClPasu257XNeIQ55NUOwa
         2Xm6e7hkVTFlIF8SzhTVGlEB6OpiKqNAGpkuVMi37mLsaES6Jw6GdIfRilnYkU4OBap2
         pVtnDEs/1/YEIItiuUjy18Xy56yBDP5BKPLiX7IugeiH3E/J/0ObdUqK5OdgekwN0woc
         d4JZ0q0k+myb2adbOaVk8UolA0fGxS7NAMtkSK7uaaT60XE+2h8B4O+P6aAvL2pfLm1y
         hqGOnq8sWWHV6ZQguGZ6O1ppPdMOFwXFDmy6CnPs9ySuBLhUY7tpUJESq1plZr3jgO8x
         mN5g==
X-Gm-Message-State: AOAM5313N7y93UYNLR8GnJH5kTy9FQvctB7QNdHG0064kFBamwsy+8KU
        RJHOWn3hB3qBFMfjy1L9i7MACQZrvn0Q4g==
X-Google-Smtp-Source: ABdhPJy1WBPMau3o+i9sX4nFm/V4pwQKd+39V1PYV7OoiSMWCosON+QzdyHVipA81bJU5woWQJx9eQ==
X-Received: by 2002:a67:f517:: with SMTP id u23mr1715717vsn.90.1599145943210;
        Thu, 03 Sep 2020 08:12:23 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 62sm340269uas.18.2020.09.03.08.12.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 08:12:21 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id s62so1913396vsc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 08:12:21 -0700 (PDT)
X-Received: by 2002:a67:c595:: with SMTP id h21mr1856369vsk.12.1599145941020;
 Thu, 03 Sep 2020 08:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200813113030.1.I89c33c4119eaffb986b1e8c1bc6f0e30267089cd@changeid>
 <20200901170745.GA3419728@google.com> <CAD=FV=Xv0FLtWWcQcRy7p2LPNdDtSjdarsvNHRHaLkWwABnwJw@mail.gmail.com>
 <8ad0589e-102d-7523-899f-0ebe85b7d2b8@codeaurora.org> <CAD=FV=XKUEQP3gyE8E2UOE12qKYwzgMp0eNeYjCp0DxPDACSMQ@mail.gmail.com>
 <6693eed6-9a6b-48c8-e56e-acdde9cf9ffe@codeaurora.org> <f77d9b24-dbca-cea0-2ef8-3c5cf0c2f2dd@codeaurora.org>
 <20200903121710.GG3419728@google.com>
In-Reply-To: <20200903121710.GG3419728@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Sep 2020 08:12:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WgR6wniyMGkPS3FJVXiHGCdubpELo01zYHYQ6oS-dL7g@mail.gmail.com>
Message-ID: <CAD=FV=WgR6wniyMGkPS3FJVXiHGCdubpELo01zYHYQ6oS-dL7g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add 'sustainable_power' for CPU
 thermal zones
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 3, 2020 at 5:17 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Hi Rajendra,
>
> On Thu, Sep 03, 2020 at 11:00:52AM +0530, Rajendra Nayak wrote:
> >
> > On 9/3/2020 10:14 AM, Rajendra Nayak wrote:
> > >
> > > On 9/2/2020 9:02 PM, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Tue, Sep 1, 2020 at 10:36 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
> > > > >
> > > > >
> > > > > > * In terms of the numbers here, I believe that you're claiming that we
> > > > > > can dissipate 768 mW * 6 + 1202 mW * 2 = ~7 Watts of power.  My memory
> > > > > > of how much power we could dissipate in previous laptops I worked on
> > > > > > is a little fuzzy, but that doesn't seem insane for a passively-cooled
> > > > > > laptop.  However, I think someone could conceivably put this chip in a
> > > > > > smaller form factor.  In such a case, it seems like we'd want these
> > > > > > things to sum up to ~2000 (if it would ever make sense for someone to
> > > > > > put this chip in a phone) or ~4000 (if it would ever make sense for
> > > > > > someone to put this chip in a small tablet).  It seems possible that,
> > > > > > to achieve this, we might have to tweak the
> > > > > > "dynamic-power-coefficient".
> > > > >
> > > > > DPC values are calculated (at a SoC) by actually measuring max power at various
> > > > > frequency/voltage combinations by running things like dhrystone.
> > > > > How would the max power a SoC can generate depend on form factors?
> > > > > How much it can dissipate sure is, but then I am not super familiar how
> > > > > thermal frameworks end up using DPC for calculating power dissipated,
> > > > > I am guessing they don't.
> > > > >
> > > > > > I don't know how much thought was put
> > > > > > into those numbers, but the fact that the little cores have a super
> > > > > > round 100 for their dynamic-power-coefficient makes me feel like they
> > > > > > might have been more schwags than anything.  Rajendra maybe knows?
> > > > >
> > > > > FWIK, the values are always scaled and normalized to 100 for silver and
> > > > > then used to derive the relative DPC number for gold. If you see the DPC
> > > > > for silver cores even on sdm845 is a 100.
> > > > > Again these are not estimations but based on actual power measurements.
> > > >
> > > > The scaling to 100 doesn't seem to match how the thermal framework is
> > > > using them.  Take a look at of_cpufreq_cooling_register().  It takes
> > > > the "dynamic-power-coefficient" and passes it as "capacitance" into
> > > > __cpufreq_cooling_register().  That's eventually used to compute
> > > > power, which is documented in the code to be in mW.
> > > >
> > > > power = (u64)capacitance * freq_mhz * voltage_mv * voltage_mv;
> > > > do_div(power, 1000000000);
> > > >
> > > > /* power is stored in mW */
> > > > freq_table[i].power = power;
> > > >
> > > > That's used together with "sustainable-power", which is the attribute
> > > > that Matthias is trying to set.  That value is documented to be in mW
> > > > as well.
> > > >
> > > > ...so if the silver cores are always scaled to 100 regardless of how
> > > > much power they actually draw then it'll be impossible to actually
> > > > think about "sustainable-power" as a mW value.  Presumably we either
> > > > need to accept that fact (and ideally document it) or we need to
> > > > change the values for silver / gold cores (we could still keep the
> > > > relative values the same and just scale them).
> > >
> > > That sounds reasonable (still keep the relative values and scale them)
> > > I'll get back on what those scaled numbers would look like, and try to
> > > get some sense of why this scaling to 100 was done (like you said
> > > I don't see any documentation on this), but I see atleast a few other non-qcom
> > > SoCs doing this too in mainline (like rockchip/rk3399)

I don't think I was too closely involved in these numbers on rk3399,
but as far as I can tell the 100 number came from:

https://crrev.com/c/364003

...interestingly enough the number _wasn't_ scaled to 100 (but was a
number close to 100) and then was changed to scale to 100.  That makes
it seem like 100, though awfully round, was at least based loosely on
fact for rk3399.

In any case, the devicetree bindings make it pretty clear that this
value should be based in reality and not some bogus number.


> > On second thoughts, why wouldn't a relative 'sustainable-power' value work?
> > On every device, one would need to do the exercise that Matthias did to come
> > up with the OPP at which we can sustain max CPU/GPU loads anyway.
>
> You assume that a thermal zone only has cooling devices of a the same type (or
> with the same fake unit for power consumption). This falls apart when multiple
> types are used, which is common.
>
> Also sustainable power is only a derived value, the lying already starts in
> the energy model, which is used by EAS, so a fake unit could cause further
> problems.
>
> > I mean even if we do change the DPC values to match actual power, Matthias would
> > still observe that we can sustain at the very same OPP and not any different.
> > Its just that the mW values that are passed to kernel are relative and not
> > absolute. My worry is that perhaps no SoC vendor wants to put these absolute numbers
> > out.
>
> This is pretty much 'security' by obscurity. It would be relatively easy to
> measure actual power consumption at different CPU speeds and derive the DPC
> values from that.

Right, I was going to say that.  Specifically:

* Anyone that actually gets one of these chips can just measure it
pretty trivially.  Run the core at a certain speed and measure with
the smart battery.  Run at a different speed and measure again.

* Presumably the power consumption of different types of cores in
Qualcomm SoCs of the same generation is roughly equivalent.  So I
could go and grab a Pixel 4a and put AOSP on it and measure the power
consumption and presumably get pretty close numbers for big and little
power coefficients.  I don't know for sure if Pixel 4a's SoC is
officially the same generation but I'd bet it's close.

* Presumably someone would be able to get a pretty good guess by
figuring out the form factor and working backwards.  It sounds as if
thermal dissipation (in terms of Watts) for various form factor
devices is somewhat standard.  Maybe this is more so for phones /
tablets than laptops which might have bigger heat pipes or active
cooling, but still.  Someone could do the math pretty easily.

I guess if you're really worried about protecting this then you can
delay posting it for brand new chipsets using a new type of technology
until product is almost ready to ship, but for sc7180 it doesn't feel
like this is something worth fighting about.

-Doug
