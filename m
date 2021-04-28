Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B719436DB5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 17:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239050AbhD1POU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 11:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239888AbhD1POS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 11:14:18 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203F8C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 08:13:32 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id k19so18929383vsg.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 08:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=va17hEIN1gMI5572/Bu5U8n1TthGJNzz9MlZ0qjXfQ8=;
        b=FOvCAHtdrpa64fWJjd2v8zhbrkxe2XjDlU8BFhSO+gr1TeRV8kbnzathFB0byuVTmR
         JcfKaygmgp4SXfmNo5T2JVNViCAbS9k9C9RtAmufWpKDeqh6BVZiuGN2tic9W1V19bbr
         7b+j3+4IRbOolxOeedhwnIa/VVQd2Z6KjHe4ePfGt8QJc6/VvxWcDG4jeOvQP/UDSe+2
         sDbIZ4wdD+I0mfhb4ZKVUQ5tO4E8LpPspFniSY2oxEPqWmlfebUm+bj+J1vsXrSnp31S
         IDWTMIuOOnjbs/l3MRn0x5I2u6x+LlCmdw341+JLwNzvmcdz8NXz5jMDYG/fIQMj+HuW
         qdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=va17hEIN1gMI5572/Bu5U8n1TthGJNzz9MlZ0qjXfQ8=;
        b=V+GlzMnliNY4juP6XhqwNFyIeVCqkwWwGq79WEhSaIR7/2m7QPxwHV7kvU5WvEsjRt
         x4QAUfi00mc0LFOjdxyn2QySQWfmsaxZS/2u7eJn5o1mjpD8g6KDyrF6Y0Q3NKL1bsnd
         NDOk5U3bByEUm20nkv+4nSslXKQQVbi+EzWU+ZVcdXyFVmItoK3B13th9MUcYHOXJjhQ
         jNxXxA7JKT337+Kgxbs92zKW0fZR9n/nNKz6Bx3AaT9rRXiU/W3N6eQDLT7KdKES4Jki
         Z/Gbjqcxb4GG6cwps4EJ6Ff4WxabLVMEO0cKR1z81nC2XnzUbXMMWwvqL0lx4cMQdmbk
         8GBg==
X-Gm-Message-State: AOAM532PzIFRPAILiuWXqnf2FgusXghJ07cL5jxRNst8bl5Anr6wcZjB
        GBM9YnmwX/9D2o4j8496hIZRQ47HD2ho4ZzHXUEdmQ==
X-Google-Smtp-Source: ABdhPJzWCsSOiCbEfusfgq4XxUrrYUu6eiejQ1dbIOPGeJVq5NDbusaXUpTSUd+FBBrrZ7R4t66BAiFanTN3I3naU+o=
X-Received: by 2002:a67:bb0f:: with SMTP id m15mr24995139vsn.43.1619622810897;
 Wed, 28 Apr 2021 08:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <1616264220-25825-1-git-send-email-sbhanu@codeaurora.org>
 <CAD=FV=WLZCSd6D5VFyD+1KBp5n1qyszER2EVaEMwYjQfPSSDnA@mail.gmail.com>
 <b77f207b-2d90-3c8b-857f-625bd3867ed1@codeaurora.org> <6fdf704c4716f5873d413229ca8adc57@codeaurora.org>
 <CAD=FV=Wa4fT5wZgd0==8kLy_tzTLgdZ-HwdfOEAM9pMeMjjFyg@mail.gmail.com>
 <8126e130e5c0ea1e7ea867414f0510c0@codeaurora.org> <CAD=FV=XavWbf_b7-=JT6V5_RNA8CjdK4oRu7H719AaPDJ5tsqQ@mail.gmail.com>
 <32096a375966e1fcc149016df012c445@codeaurora.org> <CAD=FV=U0zEDi1Xn3OmVFA3h3maVWS_o2FXOW9qDEzTf1Moja=A@mail.gmail.com>
 <7c6805abf9c1f590bc4d66d625152f22@codeaurora.org>
In-Reply-To: <7c6805abf9c1f590bc4d66d625152f22@codeaurora.org>
From:   Doug Anderson <dianders@google.com>
Date:   Wed, 28 Apr 2021 08:13:18 -0700
Message-ID: <CAD=FV=W8z2VgbP6mepVNXJ8ZO_Enb+ftwG1HQhq8HtEyG1ppOA@mail.gmail.com>
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD card
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        sartgarg@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Odelu Kukatla <okukatla@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 28, 2021 at 3:47 AM <sbhanu@codeaurora.org> wrote:
>
> On 2021-04-21 01:44, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Apr 20, 2021 at 10:21 AM <sbhanu@codeaurora.org> wrote:
> >>
> >> On 2021-04-15 01:55, Doug Anderson wrote:
> >> > Hi,
> >> >
> >> > On Tue, Apr 13, 2021 at 3:59 AM <sbhanu@codeaurora.org> wrote:
> >> >>
> >> >> >> >>> +                                       required-opps =
> >> >> >> >>> <&rpmhpd_opp_low_svs>;
> >> >> >> >>> +                                       opp-peak-kBps = <1200000
> >> >> >> >>> 76000>;
> >> >> >> >>> +                                       opp-avg-kBps = <1200000
> >> >> >> >>> 50000>;
> >> >> >> >> Why are the kBps numbers so vastly different than the ones on sc7180
> >> >> >> >> for the same OPP point. That implies:
> >> >> >> >>
> >> >> >> >> a) sc7180 is wrong.
> >> >> >> >>
> >> >> >> >> b) This patch is wrong.
> >> >> >> >>
> >> >> >> >> c) The numbers are essentially random and don't really matter.
> >> >> >> >>
> >> >> >> >> Can you identify which of a), b), or c) is correct, or propose an
> >> >> >> >> alternate explanation of the difference?
> >> >> >> >>
> >> >> >>
> >> >> >> We calculated bus votes values for both sc7180 and sc7280 with ICB
> >> >> >> tool,
> >> >> >> above mentioned values we got for sc7280.
> >> >> >
> >> >> > I don't know what an ICB tool is. Please clarify.
> >> >> >
> >> >> > Also: just because a tool spits out numbers that doesn't mean it's
> >> >> > correct. Presumably the tool could be wrong or incorrectly configured.
> >> >> > We need to understand why these numbers are different.
> >> >> >
> >> >> we checked with ICB tool team on this they conformed as Rennell &
> >> >> Kodiak
> >> >> are different chipsets,
> >> >> we might see delta in ib/ab values due to delta in scaling factors.
> >> >
> >> > ...but these numbers are in kbps, aren't they? As I understand it
> >> > these aren't supposed to be random numbers spit out by a tool but are
> >> > supposed to be understandable by how much bandwidth an IP block (like
> >> > MMC) needs from the busses it's connected to. Since the MMC IP block
> >> > on sc7180 and sc7280 is roughly the same there shouldn't be a big
> >> > difference in numbers.
> >> >
> >> > Something smells wrong.
> >> >
> >> > Adding a few people who understand interconnects better than I do,
> >> > though.
> >> >
> >>
> >> ICB team has re-checked the Rennell ICB tool and they confirmed that
> >> some configs were wrong in Rennell ICB tool and they corrected it.With
> >> the new updated Rennell ICB tool below are the values :
> >>
> >>
> >> Rennell LC:(Sc7180)
> >>
> >> opp-384000000 {
> >>               opp-hz = /bits/ 64 <384000000>;
> >>               required-opps = <&rpmhpd_opp_nom>;
> >>               opp-peak-kBps = <5400000 490000>;
> >>               opp-avg-kBps = <6600000 300000>;
> >> };
> >>
> >>
> >> And now, these values are near to Kodaik LC values:
> >>
> >> Kodaik LC:(SC7280)
> >>
> >> opp-384000000 {
> >>             opp-hz = /bits/ 64 <384000000>;
> >>             required-opps = <&rpmhpd_opp_nom>;
> >>             opp-peak-kBps = <5400000 399000>;
> >>             opp-avg-kBps = <6000000 300000>;
> >> };
> >
> > This still isn't making sense to me.
> >
> > * sc7180 and sc7280 are running at the same speed. I'm glad the
> > numbers are closer now, but I would have thought they'd be exactly the
> > same.
> >
> > * Aren't these supposed to be sensible? This is eMMC that does max
> > transfer rates of 400 megabytes / second to the external device. You
> > have bandwidths listed here of 5,400,000 kBps = 5,400,000 kilobytes /
> > second = 5400 megabytes / second. I can imagine there being some
> > overhead where an internal bus might need to be faster but that seems
> > excessive. This is 13.5x!
> >
>
> These numbers are not related to SDCC bandwidth, these are the values
> needed for the NOC's to run in nominal voltage corners (internal to
> hardware) and
> thus it helps SDCC to run in nominal to get required through put
> (384MBps).So above calculation mentioned by you is not applicable here.

OK. I guess if everyone else understands this and it's just me that
doesn't then I won't stand in the way. In general, though, the device
tree is supposed to be describing the hardware in a way that makes
sense on its own. It's not a place to just dump in magic numbers.
These numbers must be somehow related to the transfer rate of the SD
card since otherwise they wouldn't scale up with faster card clocks.
Given that these numbers are expressed in "kBps" (since you're storing
them in a property that has "kBps" in the name), I would expect that
these numbers are expressing some type of bandwidth. I still haven't
really understood why you have to scale some bandwidth at over 10x the
card clock speed.

Said another way: you're saying that you need these numbers because
they make a whole bunch of math work out. I'm saying that these aren't
just supposed to be magic numbers. They're supposed to make sense on
their own and you should be able to describe to me how you arrived at
these numbers in a way that I could do the math on my own. Saying "we
plugged this into some program and it spit out these numbers" isn't
good enough.


> > * I can't see how it can make sense that "average" values are higher
> > than "peak" values.
>
>
> Here actual peak = peak number * 2
> actual average = average number
>
> and this multiplication is taken care by ICC driver, so technically
> actual peak is still high than average.

Sorry, but that is really counter-intuitive. Georgi: is that how this
is normally expected to work?

-Doug
