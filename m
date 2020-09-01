Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8C7259FE6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 22:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbgIAUT2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 16:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728889AbgIAUTZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 16:19:25 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC7F0C061244
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 13:19:24 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id q13so1339937vsj.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 13:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1VKBcJEVgXpEQSE9Kzd33ZLKO0VljC636ojqCeo9h3I=;
        b=WrzkXZQzZQCBi4vGkTcaDxbln+mO7AxjXs64AxTU2AjQFV0rCNb9yjm24G3Ycyy6No
         KwICKhDbCYDvGwDlSr6ExEhUkc4wzaKMzSJSaggEc/r4j3fAWQPmnoJicfyGuQZ3HSme
         Oh7LP9j6tRCprXEtoEjaK+rWcDifd5VJ5S/NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1VKBcJEVgXpEQSE9Kzd33ZLKO0VljC636ojqCeo9h3I=;
        b=H4uQbQrXRkFfjDTOSrcXInZIrUoRJLj580AvDwzyfh8ZufUwTpPKEWYHlZhBOTreiq
         uX0uJPbGKiLrkRdHhlxKeBlW0nAJYejabWUrWXwHU0afi1B85FHgOzvkGLncHOYPjFs8
         xYlG/7tlGmKVM++f9hg9E5KMzS9pIjC9lDidoC3v47GeTabB7mmpXNSHVE+byh0oyu6P
         4vpUqu6Nd9Mmp9od6LryXPR2KMTMjeQSQG++E6VTHly/m3VLJyu/C+iNtotbixaJcaw6
         EQXfCx6qeLIKcasvkbXOooRqlOUJoPZnaML+bQJBbM+W5t3ed6jGnJhwAUI8LU+VYkay
         g6JA==
X-Gm-Message-State: AOAM532y9CjSeZ9qncrkBDVwEx2WBKdkFvqhHoZYilEdk/Ewow/CvzXO
        D5uxY6VIsxSMbYhX9tv34LISDQfXkPdRqw==
X-Google-Smtp-Source: ABdhPJyKjSBGm2G9xc1Qc2a9N5iaUDRXBBnB4n7wVaqPv90qFMyP2trJyXRWmKNFD4U8phtQm2IjlA==
X-Received: by 2002:a67:31c3:: with SMTP id x186mr3196449vsx.139.1598991563722;
        Tue, 01 Sep 2020 13:19:23 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id j15sm410102vki.8.2020.09.01.13.19.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 13:19:22 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id b123so1351856vsd.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 13:19:22 -0700 (PDT)
X-Received: by 2002:a67:ecd4:: with SMTP id i20mr3418843vsp.68.1598991561827;
 Tue, 01 Sep 2020 13:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200813113030.1.I89c33c4119eaffb986b1e8c1bc6f0e30267089cd@changeid>
 <20200901170745.GA3419728@google.com>
In-Reply-To: <20200901170745.GA3419728@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 1 Sep 2020 13:19:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xv0FLtWWcQcRy7p2LPNdDtSjdarsvNHRHaLkWwABnwJw@mail.gmail.com>
Message-ID: <CAD=FV=Xv0FLtWWcQcRy7p2LPNdDtSjdarsvNHRHaLkWwABnwJw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add 'sustainable_power' for CPU
 thermal zones
To:     Matthias Kaehlcke <mka@chromium.org>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Sep 1, 2020 at 10:07 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Thu, Aug 13, 2020 at 11:30:33AM -0700, Matthias Kaehlcke wrote:
> > The 'sustainable_power' attribute provides an estimate of the sustained
> > power that can be dissipated at the desired control temperature. One
> > could argue that this value is not necessarily the same for all devices
> > with the same SoC, which may have different form factors or thermal
> > designs. However there are reasons to specify a (default) value at SoC
> > level for SC7180: most importantly, if no value is specified at all the
> > power_allocator thermal governor (aka 'IPA') estimates a value, using the
> > minimum power of all cooling devices of the zone, which can result in
> > overly aggressive thermal throttling. For most devices an approximate
> > conservative value should be more useful than the minimum guesstimate
> > of power_allocator. Devices that need a different value can overwrite
> > it in their <device>.dts. Also the thermal zones for SC7180 have a high
> > level of granularity (essentially one for each function block), which
> > makes it more likely that the default value just works for many devices.
> >
> > The values correspond to 1901 MHz for the big cores, and 1804 MHz for
> > the small cores. The values were determined by limiting the CPU
> > frequencies to different max values and launching a bunch of processes
> > that cause high CPU load ('while true; do true; done &' is simple and
> > does a good job). A frequency is deemed sustainable if the CPU
> > temperatures don't rise (consistently) above the second trip point
> > ('control temperature', 95 degC in this case). Once the highest
> > sustainable frequency is found, the sustainable power can be calculated
> > by multiplying the energy consumption per core at this frequency (which
> > can be found in /sys/kernel/debug/energy_model/) with the number of
> > cores that are specified as cooling devices.
> >
> > The sustainable frequencies were determined at room temperature
> > on a device without heat sink or other passive cooling elements.

I'm curious: was this a bare board, or a device in a case?  Hrm, I'm
not sure which one would be worse at heat dissipation, but I would
imagine that being inside a plastic case might be worse?


> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > If maintainers think 'sustainable_power' should be specified at
> > device level (with which I conceptually agree) I'm fine with
> > doing that, just seemed it could be useful to have a reasonable
> > 'default' at SoC level in this case.
>
> Any comments on this?

I'm not massively familiar with this area of the code, but I guess I
shouldn't let that stop me from having an opinion!  :-P

* I would agree that it seems highly unlikely that someone would put
one of these chips in a device that could only dissipate the heat from
the lowest OPP, so having some higher estimate definitely makes sense.

* In terms of the numbers here, I believe that you're claiming that we
can dissipate 768 mW * 6 + 1202 mW * 2 = ~7 Watts of power.  My memory
of how much power we could dissipate in previous laptops I worked on
is a little fuzzy, but that doesn't seem insane for a passively-cooled
laptop.  However, I think someone could conceivably put this chip in a
smaller form factor.  In such a case, it seems like we'd want these
things to sum up to ~2000 (if it would ever make sense for someone to
put this chip in a phone) or ~4000 (if it would ever make sense for
someone to put this chip in a small tablet).  It seems possible that,
to achieve this, we might have to tweak the
"dynamic-power-coefficient".  I don't know how much thought was put
into those numbers, but the fact that the little cores have a super
round 100 for their dynamic-power-coefficient makes me feel like they
might have been more schwags than anything.  Rajendra maybe knows?

* I'm curious about the fact that there are two numbers here: one for
littles and one for bigs.  If I had to guess I'd say that since all
the cores are in one package so the contributions kinda need to be
thought of together, right?  If we're sitting there thermally
throttled then we'd want to pick the best perf-per-watt for the
overall package.  This is why your patch says we can sustain the
little cores at max and the big cores get whatever is left over,
right?

* Should we be leaving some room in here for the GPU?  ...or I guess
once we list it as a cooling device we'll have to decrease the amount
the CPUs can use?


So I guess the tl; dr is:

a) We should check "dynamic-power-coefficient" and possibly adjust.

b) I don't think the "conservative" by-default numbers should add up
to 7 Watts.  I could be convinced that this chip is not intended for
phones and thus we could have it add up to 4 Watts, but 7 Watts seems
too much.


-Doug
