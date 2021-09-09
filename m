Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86C734058B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 16:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353244AbhIIOMf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 10:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350321AbhIIOMb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 10:12:31 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2911C08EB2C
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Sep 2021 05:17:52 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id b200so1950258iof.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Sep 2021 05:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rYmN9+Vy/Zm7v0RZi8m78PsGaMbXCo9rwM4fXnlFa0A=;
        b=jw+iTpcLGi33/KUcEaVR3lYwDq9++0Zt56YuT9/orXgQXI25hLKmgRmzW2toJi7myz
         JPbld8zzLLon+cNCj7SMJHWAl067f8z7RD/RvROUFdI3Ou9HjZc9T162pgu15ZOYJZWf
         8l6XWBvHQpCKJinTzZt7rdtsbGzQav/fEejvqKQbrPDpfyb0sFGaBk0BRRnT7PFZbdPv
         yDVqfSiMT2ie32yRsY5ei1vNEx8mK2qHqgyP2v9nXFZ+u09F6NjF7dVD9o9Dow2NTDdo
         xk3EumusBusF2wvolA+8go4RMKS8aOVH48wEZotYmp2DTIahIZFdmmYTDp8UB7F2vQc+
         wEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rYmN9+Vy/Zm7v0RZi8m78PsGaMbXCo9rwM4fXnlFa0A=;
        b=NkS4PKZFBS701JnWvVb+xoDoIHlIx9dXLdbBzIMcaevbQc8ry0L2qQQ5xnsbqcIs8L
         PL7/nDT7fxwo1p7ZUHo+2D9gTAXqsGYOSANpe9U8oEhkh8bmJkQ7Ch/rn+1Gb4oNB4Al
         F+EZzNv64A4plPzwluPT8BLQdjvFrXemIpTdelolPLCx9L1a7uF4gzChJOSIYhsTn+8P
         cxq7GIMNBL6JzwTnfmrZgMpN2x4CtiV59X58uXccjd7i4Tumr5njbq6ApB3PBjJATYzW
         GCf0Yjpa555WlJ8ToScYSYLEvSjeSZasDouAm8hNMmDh2yaNd4w+UxqJFd3O5loeMH2x
         aB6Q==
X-Gm-Message-State: AOAM5302ZF/bVr3RJsAYdoZeHBUr2h90VwzMGJzk25IBOhI0A7t176tv
        YliuBUVWu0aBKu80+j1Jk5fFaizo024dEzgHXCKVfw==
X-Google-Smtp-Source: ABdhPJzzGnEJRhZfFJ5kL+XJ9LhYV5UeHMmZWo/JVUq5RLvA5TfAvwZJL681YJ5O4yJaKOgNEx7M/kGJZcKwTSrjL5c=
X-Received: by 2002:a6b:3f02:: with SMTP id m2mr2358919ioa.136.1631189872259;
 Thu, 09 Sep 2021 05:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
 <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <b7334a1a-c4ad-da90-03b4-0d19e1811b13@linaro.org> <CAF6AEGv0WWB3Z1hmXf8vxm1_-d7fsNBRcaQF35aE2JXcJn8-cA@mail.gmail.com>
 <8aa590be-6a9f-9343-e897-18e86ea48202@linaro.org> <CAF6AEGtd_5jKhixp6h+NnN8-aqjBHTLopRozASE73oT3rfnFHA@mail.gmail.com>
 <6eefedb2-9e59-56d2-7703-2faf6cb0ca3a@codeaurora.org> <CAF6AEGvhqPHWNK=6GYz+Mu5aKe8+iE4_Teem6o=X6eiANhWsPg@mail.gmail.com>
 <83ecbe74-caf0-6c42-e6f5-4887b3b534c6@linaro.org> <53d3e5b7-9dc0-a806-70e9-b9b5ff877462@codeaurora.org>
 <YTgeIuwumPoR9ZTE@ripper>
In-Reply-To: <YTgeIuwumPoR9ZTE@ripper>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Thu, 9 Sep 2021 17:47:16 +0530
Message-ID: <CAMi1Hd1TOFj5USToEhuvZz8vgboQbMWco7gN413-jHJp-A7Ozg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
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

On Wed, 8 Sept 2021 at 07:50, Bjorn Andersson
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

Ack. With your above script, I can reproduce a crash too on db845c
(A630) running v5.14. I didn't get any crash log though and device
just rebooted to USB crash mode.

And same crash on RB5 (A650) too https://hastebin.com/raw/ejutetuwun

>
> So the problem doesn't seem to be Rob's change, it's just that prior to
> it the chance to hitting it is way lower. Question is still what it is
> that we're triggering.
>
> Regards,
> Bjorn
