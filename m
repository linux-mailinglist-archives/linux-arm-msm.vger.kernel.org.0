Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A62425A1CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 01:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgIAXJG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 19:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgIAXJE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 19:09:04 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D498AC061245
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 16:09:03 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d19so1512816pgl.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 16:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kMq/w6vV7PeRoQdrs+kqGwGVs1CDfnxBCE3p1wYoNVg=;
        b=V1P48uZbQzTqRK+mHkaAuIuMizn7pXgH0aQWOkjFPyGXl0FHHPPknxf1TJwjrl40An
         6M1J/QfWnfAYZDZSnYxdAuR7FHldln2iW7qMv8ew5h0PQWnuVes4lPXXFIjmDCh2yxqR
         lg46NjvHsr3taqyEb1tFA79mR+PRSFVXcN1L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kMq/w6vV7PeRoQdrs+kqGwGVs1CDfnxBCE3p1wYoNVg=;
        b=Bqto8Ovp2CanCvaiW1PcQv1/u3NnJZs4aWrjfKKHZ5e1xHBbTbruku3tNFaHaOlgY6
         jE9Pz8KZXgHJYsOZtD4Xc+qcndhKn20hh1vcOGT6VMIVcEvMSM6XdlW8Nfe9PVZ8GZY7
         MZTafqxcFX1igQtOe3B+fL3yHwGkdxqmiB4uWCBC0YQ95WCeOGW1yymwXdPrGDCWGbxY
         8GO/DU4YLBQ8SgvV5muz3mC3V59iImj2RimGFwFMwwlp/3fYf0fI+IHvbIJ2ZXNc8yOg
         SyIu6UkyXrZa4ydCe2t7Um/bdmUDHeG84QqiMAVT3/qTZeU756UWaSDhiJz8yMMCM95k
         BYpw==
X-Gm-Message-State: AOAM532Y32xhdfDafmZwtUlPEheHKat7inonuP2dwuPIbwSvUm8I+PoL
        CCN0pjtoaw1XAjuZxTW4lzv1VQ==
X-Google-Smtp-Source: ABdhPJxt0quW2fzHjIRO/84M9Hx0XGzH12Ij1GyHAC/aJYB1PPLmoWH6KgRNc/T1/8VYTolip3gO7A==
X-Received: by 2002:a62:1888:: with SMTP id 130mr469749pfy.220.1599001743063;
        Tue, 01 Sep 2020 16:09:03 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id d5sm2506802pjw.18.2020.09.01.16.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 16:09:02 -0700 (PDT)
Date:   Tue, 1 Sep 2020 16:09:01 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add 'sustainable_power' for
 CPU thermal zones
Message-ID: <20200901230901.GC3419728@google.com>
References: <20200813113030.1.I89c33c4119eaffb986b1e8c1bc6f0e30267089cd@changeid>
 <20200901170745.GA3419728@google.com>
 <CAD=FV=Xv0FLtWWcQcRy7p2LPNdDtSjdarsvNHRHaLkWwABnwJw@mail.gmail.com>
 <20200901213319.GB3419728@google.com>
 <CAD=FV=XDjsg314RGV1e5jRA+qa3s9LQWN8zk-ARZAQEjNeH8Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=XDjsg314RGV1e5jRA+qa3s9LQWN8zk-ARZAQEjNeH8Kw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 01, 2020 at 03:45:52PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Sep 1, 2020 at 2:33 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Hi Doug,
> >
> > On Tue, Sep 01, 2020 at 01:19:10PM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Tue, Sep 1, 2020 at 10:07 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > >
> > > > On Thu, Aug 13, 2020 at 11:30:33AM -0700, Matthias Kaehlcke wrote:
> > > > > The 'sustainable_power' attribute provides an estimate of the sustained
> > > > > power that can be dissipated at the desired control temperature. One
> > > > > could argue that this value is not necessarily the same for all devices
> > > > > with the same SoC, which may have different form factors or thermal
> > > > > designs. However there are reasons to specify a (default) value at SoC
> > > > > level for SC7180: most importantly, if no value is specified at all the
> > > > > power_allocator thermal governor (aka 'IPA') estimates a value, using the
> > > > > minimum power of all cooling devices of the zone, which can result in
> > > > > overly aggressive thermal throttling. For most devices an approximate
> > > > > conservative value should be more useful than the minimum guesstimate
> > > > > of power_allocator. Devices that need a different value can overwrite
> > > > > it in their <device>.dts. Also the thermal zones for SC7180 have a high
> > > > > level of granularity (essentially one for each function block), which
> > > > > makes it more likely that the default value just works for many devices.
> > > > >
> > > > > The values correspond to 1901 MHz for the big cores, and 1804 MHz for
> > > > > the small cores. The values were determined by limiting the CPU
> > > > > frequencies to different max values and launching a bunch of processes
> > > > > that cause high CPU load ('while true; do true; done &' is simple and
> > > > > does a good job). A frequency is deemed sustainable if the CPU
> > > > > temperatures don't rise (consistently) above the second trip point
> > > > > ('control temperature', 95 degC in this case). Once the highest
> > > > > sustainable frequency is found, the sustainable power can be calculated
> > > > > by multiplying the energy consumption per core at this frequency (which
> > > > > can be found in /sys/kernel/debug/energy_model/) with the number of
> > > > > cores that are specified as cooling devices.
> > > > >
> > > > > The sustainable frequencies were determined at room temperature
> > > > > on a device without heat sink or other passive cooling elements.
> > >
> > > I'm curious: was this a bare board, or a device in a case?  Hrm, I'm
> > > not sure which one would be worse at heat dissipation, but I would
> > > imagine that being inside a plastic case might be worse?
> >
> > This was with a device in a plastic case.
> >
> > > > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > > > ---
> > > > > If maintainers think 'sustainable_power' should be specified at
> > > > > device level (with which I conceptually agree) I'm fine with
> > > > > doing that, just seemed it could be useful to have a reasonable
> > > > > 'default' at SoC level in this case.
> > > >
> > > > Any comments on this?
> > >
> > > I'm not massively familiar with this area of the code, but I guess I
> > > shouldn't let that stop me from having an opinion!  :-P
> > >
> > > * I would agree that it seems highly unlikely that someone would put
> > > one of these chips in a device that could only dissipate the heat from
> > > the lowest OPP, so having some higher estimate definitely makes sense.
> > >
> > > * In terms of the numbers here, I believe that you're claiming that we
> > > can dissipate 768 mW * 6 + 1202 mW * 2 = ~7 Watts of power.
> >
> > No, I'm claiming it's 768 mW + 1202 mW = ~2 W.
> >
> > SC7180 has a 6 thermal zones for the 6 little cores and 4 zones for the
> > 2 big cores. Each of these thermal zones uses either all little or all big
> > cores as cooling devices, hence the power sustainable power of the
> > individual zones doesn't add up. 768 mW corresponds to 6x 128 mW (aka all
> > little cores at 1.8 GHz), and 1202 mW to 2x 601 mW (both big cores at 1.9 GHz).
> 
> Ah!  Thanks for explaining.
> 
> 
> > > My memory
> > > of how much power we could dissipate in previous laptops I worked on
> > > is a little fuzzy, but that doesn't seem insane for a passively-cooled
> > > laptop.  However, I think someone could conceivably put this chip in a
> > > smaller form factor.  In such a case, it seems like we'd want these
> > > things to sum up to ~2000 (if it would ever make sense for someone to
> > > put this chip in a phone) or ~4000 (if it would ever make sense for
> > > someone to put this chip in a small tablet).
> >
> > See above, the sustainable power with this patch only adds up to ~2000.
> > It is possible though that it would be lower in a smaller form factor
> > device.
> >
> > I'd be ok with posting something lower for SC7180 (it would be a guess
> > though) and use the specific numbers in the device specific DT.
> 
> Given the advice in the bindings it seems like 2W should be fine.
> 
> 
> > > It seems possible that,
> > > to achieve this, we might have to tweak the
> > > "dynamic-power-coefficient".  I don't know how much thought was put
> > > into those numbers, but the fact that the little cores have a super
> > > round 100 for their dynamic-power-coefficient makes me feel like they
> > > might have been more schwags than anything.  Rajendra maybe knows?
> >
> > Yeah, it's possible that that was just an approximation
> >
> > > * I'm curious about the fact that there are two numbers here: one for
> > > littles and one for bigs.  If I had to guess I'd say that since all
> > > the cores are in one package so the contributions kinda need to be
> > > thought of together, right?  If we're sitting there thermally
> > > throttled then we'd want to pick the best perf-per-watt for the
> > > overall package.  This is why your patch says we can sustain the
> > > little cores at max and the big cores get whatever is left over,
> > > right?
> >
> > It's derived from how Qualcomm specified the thermal zones and cooling
> > devices. Any ("cpu") zone is either cooled by (all) big cores or by (all)
> > little cores, but not a mix of them. In my tests I also saw that the big
> > cores seemed to have little impact on the little ones. The little cores
> > are at max because even running at max frequency the temperature in the
> > 'little zones' wouldn't come close to the trip point.
> 
> OK, crazy.  I suppose that this makes sense,especially without a
> heatsink and over a short burst of time.  I'd imagine that with a
> heatsink things might look different, but trying to model everything
> is impossible and seems like what't there works OK until someone can
> say why it doesn't.  :-)

Exactly, they will likely look different, but since we want conservative
numbers for the generic case it's ok/good to use numbers from a
configuration without heatsink.

And 1.9 GHz doesn't even seem horribly slow for a device with a heatsink.
When we have such a device we can evaluate whether there are significant
gains from tweaking the values for the big cores in the device specific DT.

> > > * Should we be leaving some room in here for the GPU?  ...or I guess
> > > once we list it as a cooling device we'll have to decrease the amount
> > > the CPUs can use?
> >
> > I don't know for sure, but judging from the CPU zones I wouldn't be
> > surprised if the GPU was managed exclusively in the dedicated GPU
> > thermal zones (I guess that's what 'gpuss0-thermal' and 'gpuss1-thermal'
> > are). If that's not the case the values in the CPU zones can be
> > adjusted when specific data is available.
> 
> Sounds good.
> 
> 
> > > So I guess the tl; dr is:
> > >
> > > a) We should check "dynamic-power-coefficient" and possibly adjust.
> >
> > ok, lets see if Rajendra can check if there is room for tweaking.
> >
> > > b) I don't think the "conservative" by-default numbers should add up
> > > to 7 Watts.  I could be convinced that this chip is not intended for
> > > phones and thus we could have it add up to 4 Watts, but 7 Watts seems
> > > too much.
> >
> > I suppose this is mostly addressed by my explications above, unless we
> > think that 2 Watts in CPU power might still be too aggressive as a
> > default.
> 
> With all your explanations, I'm happy to add:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!
