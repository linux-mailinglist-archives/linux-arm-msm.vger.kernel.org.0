Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCB7407059
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Sep 2021 19:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbhIJRPi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Sep 2021 13:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbhIJRPi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Sep 2021 13:15:38 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9FAC061574;
        Fri, 10 Sep 2021 10:14:27 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id g16so3652481wrb.3;
        Fri, 10 Sep 2021 10:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ECe+aP8GlByGFzXgaD0C2iedycpmqMk8h4mAhvXdWJw=;
        b=O8Gki5ybtBEla/sBKtBCrHndI7fwisew1eOn6Lqthw4E0mPl6UACjbMXL456nF1z1v
         sFJU96piX3j+957pqio2XG+LxHv+Pv/u5VZA/WjnR0PF2aRLV//oBlG9nlx+a3wVTDwe
         1z2Njy9dwkHBoYGCfrMcte3FHgHtqENJr9zIiSrJYL0Bdssim6b4fiU3eihhXWh62Cbk
         Z4l4wLDucLp9iTFZ9fOzL8ihiYH21Hd57eIKXaJcVdOxziOWtpKd4a8b5/VNBi2QqQjF
         uO4bG6LzF1MBpD2NbCus9exjTGpwz0Ve1E5z8gzcYXXLnw11WPXiAoUhuGKLd9j2u0x3
         /WAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ECe+aP8GlByGFzXgaD0C2iedycpmqMk8h4mAhvXdWJw=;
        b=oTHIXrCr+49jd4V0AtbMsQTC1VGyYU09aMvSUEHj7bAcrtz5JW7IJbQs3YXezeZVvf
         KcXr+H3/7ftzUw3FMPAp6HbXZtolnuxDsYvI6APQKQ/qGa7SbmIEvO5QMomIL90VzOKv
         KSLlZNJ+kzZm0JhyOe3bqzaBEeY6Y1FaMyoRl4bl8kIfE3UhjNZGcu7TJVJ1b/SDgSwB
         DMDzlzVjclnxDtc1Av+OuptWqb6nqdnXUfZZOt1ZV333P3lDMj/874kZgQPaCI56dq+S
         7zo5QEkSbQXQPjSSxCV0kHr4jmkF3p9jP+l6gQsjHKJwjjeloaJkH66tI4NZPsiULpUc
         xtjg==
X-Gm-Message-State: AOAM5335UG4+EmxRsAoblcWMkMoPnovd3YZ2HWTXhPS/O9dHdy/PzxRG
        mA7A6Vc60xTb8XYXtB9XTkQAMr1u+UGJHdHFvRU=
X-Google-Smtp-Source: ABdhPJzkpO6p14WF+dyNq4gfagXI6lwls9aScw/TuEZXv5bfemK8KoMGdQYf9uP/IxaevG/gM3MYwLRA5kUAAE7QUWQ=
X-Received: by 2002:a5d:4803:: with SMTP id l3mr11111785wrq.61.1631294065520;
 Fri, 10 Sep 2021 10:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
 <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <b7334a1a-c4ad-da90-03b4-0d19e1811b13@linaro.org> <CAF6AEGv0WWB3Z1hmXf8vxm1_-d7fsNBRcaQF35aE2JXcJn8-cA@mail.gmail.com>
 <8aa590be-6a9f-9343-e897-18e86ea48202@linaro.org> <CAF6AEGtd_5jKhixp6h+NnN8-aqjBHTLopRozASE73oT3rfnFHA@mail.gmail.com>
 <6eefedb2-9e59-56d2-7703-2faf6cb0ca3a@codeaurora.org> <CAF6AEGvhqPHWNK=6GYz+Mu5aKe8+iE4_Teem6o=X6eiANhWsPg@mail.gmail.com>
 <83ecbe74-caf0-6c42-e6f5-4887b3b534c6@linaro.org> <53d3e5b7-9dc0-a806-70e9-b9b5ff877462@codeaurora.org>
 <YTgeIuwumPoR9ZTE@ripper>
In-Reply-To: <YTgeIuwumPoR9ZTE@ripper>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 10 Sep 2021 10:18:52 -0700
Message-ID: <CAF6AEGt2f16=WWpKgGiWw1OJLrWMSunzrm853H+mGxPQuf2Xug@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 7, 2021 at 7:20 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 09 Aug 10:26 PDT 2021, Akhil P Oommen wrote:
>
> > On 8/9/2021 9:48 PM, Caleb Connolly wrote:
> > >
> > >
> > > On 09/08/2021 17:12, Rob Clark wrote:
> > > > On Mon, Aug 9, 2021 at 7:52 AM Akhil P Oommen
> > > > <akhilpo@codeaurora.org> wrote:
> [..]
> > > > > I am a bit confused. We don't define a power domain for gpu in dt,
> > > > > correct? Then what exactly set_opp do here? Do you think this usleep is
> > > > > what is helping here somehow to mask the issue?
> > > The power domains (for cx and gx) are defined in the GMU DT, the OPPs in
> > > the GPU DT. For the sake of simplicity I'll refer to the lowest
> > > frequency (257000000) and OPP level (RPMH_REGULATOR_LEVEL_LOW_SVS) as
> > > the "min" state, and the highest frequency (710000000) and OPP level
> > > (RPMH_REGULATOR_LEVEL_TURBO_L1) as the "max" state. These are defined in
> > > sdm845.dtsi under the gpu node.
> > >
> > > The new devfreq behaviour unmasks what I think is a driver bug, it
> > > inadvertently puts much more strain on the GPU regulators than they
> > > usually get. With the new behaviour the GPU jumps from it's min state to
> > > the max state and back again extremely rapidly under workloads as small
> > > as refreshing UI. Where previously the GPU would rarely if ever go above
> > > 342MHz when interacting with the device, it now jumps between min and
> > > max many times per second.
> > >
> > > If my understanding is correct, the current implementation of the GMU
> > > set freq is the following:
> > >   - Get OPP for frequency to set
> > >   - Push the frequency to the GMU - immediately updating the core clock
> > >   - Call dev_pm_opp_set_opp() which triggers a notify chain, this winds
> > > up somewhere in power management code and causes the gx regulator level
> > > to be updated
> >
> > Nope. dev_pm_opp_set_opp() sets the bandwidth for gpu and nothing else. We
> > were using a different api earlier which got deprecated -
> > dev_pm_opp_set_bw().
> >
>
> On the Lenovo Yoga C630 this is reproduced by starting alacritty and if
> I'm lucky I managed to hit a few keys before it crashes, so I spent a
> few hours looking into this as well...
>
> As you say, the dev_pm_opp_set_opp() will only cast a interconnect vote.
> The opp-level is just there for show and isn't used by anything, at
> least not on 845.
>
> Further more, I'm missing something in my tree, so the interconnect
> doesn't hit sync_state, and as such we're not actually scaling the
> buses. So the problem is not that Linux doesn't turn on the buses in
> time.
>
> So I suspect that the "AHB bus error" isn't saying that we turned off
> the bus, but rather that the GPU becomes unstable or something of that
> sort.
>
>
> Lastly, I reverted 9bc95570175a ("drm/msm: Devfreq tuning") and ran
> Aquarium for 20 minutes without a problem. I then switched the gpu
> devfreq governor to "userspace" and ran the following:
>
> while true; do
>   echo 257000000 > /sys/class/devfreq/5000000.gpu/userspace/set_freq
>   echo 710000000 > /sys/class/devfreq/5000000.gpu/userspace/set_freq
> done
>
> It took 19 iterations of this loop to crash the GPU.

I assume you still had aquarium running, to keep the gpu awake while
you ran that loop?

Fwiw, I modified this slightly to match sc7180's min/max gpu freq and
could not trigger any issue.. interestingly sc7180 has a lower min
freq (180) and higher max freq (800) so it was toggling over a wider
freq range.  I also tried on a device that  had the higher 825MHz opp
(since I noticed that was the only opp that used
RPMH_REGULATOR_LEVEL_TURBO_L1 and wanted to rule that out), but could
not reproduce.

I guess a630 (sdm845) should have higher power draw (it is 2x # of
shader cores and 2x GMEM size, but lower max freq).. the question is,
is this the reason we see this on sdm845 and not sc7180?  Or is there
some other difference.  On the gpu side of this, they are both closely
related (ie. the same "sub-generation" of a6xx, same gmu fw, etc)..
I'm less sure about the other parts (icc, rpmh, etc)

BR,
-R

> So the problem doesn't seem to be Rob's change, it's just that prior to
> it the chance to hitting it is way lower. Question is still what it is
> that we're triggering.
>
> Regards,
> Bjorn
