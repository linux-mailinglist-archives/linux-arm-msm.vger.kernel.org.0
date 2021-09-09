Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675CE405E39
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 22:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235679AbhIIUvM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 16:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234786AbhIIUvL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 16:51:11 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013F3C061574;
        Thu,  9 Sep 2021 13:50:01 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d6so4377869wrc.11;
        Thu, 09 Sep 2021 13:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aaLbY2Tz0R78gM5UFyzV3LES/psE8wo8ewJyYFtaGmE=;
        b=M3sRkj5UCFFxWHbtvRCrqQogUWXztMX+umO/Fg+EG1xChVQpXicgxu7gvlC9YY2bTk
         JbMKLpuNoijQ1Kj9gEbQxrNYKJDwjpjkXIjmTEKdd65hOcdjs3YA6SzoHLYl4kVS/K7U
         wvBZ/yO3gsUyIvnHcgs0AqT6TMLDp++0yr1NJGHXqgf1eTaXqcUhK5DK5FUy46JtvUgS
         2T+a5IVMxYE4lM2sr1YpH9jtzgsuRXD0oLap47Yd+rZPXBZvAAJtOFvch5aqzhoRas/8
         zBeohRfEYcUdiuoduv0JESigNg7lYZIzAByKfaE6NXp9YbAhr/TAYIN94NUm2XYKjnz+
         CxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aaLbY2Tz0R78gM5UFyzV3LES/psE8wo8ewJyYFtaGmE=;
        b=tNsoR6BZUT73DbthRCq+OnLgmapaxoMXb+6QgDMQLKPCEHM9iSRzhWe+ABEZGnrB1a
         enArxDMoePaDHf+DuLzl5dPAP7bA2/urEyvnMJxAuJouAEL6RXdTcbOCwMP8OlCwcAe1
         HMMzucoFwR4L9Tz66X7OPnn9BPpu1zJp/tHx7L8Ivemz0VNIOef11weFd0NvdPEZOfYX
         tkVqeG7e+BWYJfNLhzepM3ILwk0Z2jJPzDpCKXfoLYKNDV3VcVaJ+965lzMI+MVseYW2
         HFJ4hSD5QCKvK4VfFecitTxKMDQkO6i2tU6WMRs/FFEZlkyJFjZwA2BkBZkW4qjuWlLW
         RBcw==
X-Gm-Message-State: AOAM531E+FnEUWJkGAyuuBPFMMKo3IccoPjFsdy5LAuBv9ZdutTz+Tux
        HvYa28Pamui/TTqMTmKQ3A1don05aVHeW4zuoYY=
X-Google-Smtp-Source: ABdhPJx/Ub7e1GmbjPXeYixhcXbC0J+o/GQmR9fJDlfxq9p1WW/IYvC8I8ePRPlX6Yd9TfwCCOlcoo0G92X2v9QjjUE=
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr5852512wrn.251.1631220599548;
 Thu, 09 Sep 2021 13:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
 <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <b7334a1a-c4ad-da90-03b4-0d19e1811b13@linaro.org> <CAF6AEGv0WWB3Z1hmXf8vxm1_-d7fsNBRcaQF35aE2JXcJn8-cA@mail.gmail.com>
 <8aa590be-6a9f-9343-e897-18e86ea48202@linaro.org> <CAF6AEGtd_5jKhixp6h+NnN8-aqjBHTLopRozASE73oT3rfnFHA@mail.gmail.com>
 <6eefedb2-9e59-56d2-7703-2faf6cb0ca3a@codeaurora.org> <CAF6AEGvhqPHWNK=6GYz+Mu5aKe8+iE4_Teem6o=X6eiANhWsPg@mail.gmail.com>
 <83ecbe74-caf0-6c42-e6f5-4887b3b534c6@linaro.org> <53d3e5b7-9dc0-a806-70e9-b9b5ff877462@codeaurora.org>
 <YTgeIuwumPoR9ZTE@ripper> <CAMi1Hd1TOFj5USToEhuvZz8vgboQbMWco7gN413-jHJp-A7Ozg@mail.gmail.com>
 <CAMi1Hd2gmo-qzDSDpi1hwpX=N1eGM+Q5HqPSvdbq9LdqwNuK+w@mail.gmail.com> <ea5c23cb-0de4-3f1d-3052-c41fa9317984@codeaurora.org>
In-Reply-To: <ea5c23cb-0de4-3f1d-3052-c41fa9317984@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 9 Sep 2021 13:54:26 -0700
Message-ID: <CAF6AEGtTNK0t6HVvL8284E4RGnNn=wtDXjT=8DK2dXUuRF+gBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
        open list <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 9, 2021 at 12:50 PM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> On 9/9/2021 9:42 PM, Amit Pundir wrote:
> > On Thu, 9 Sept 2021 at 17:47, Amit Pundir <amit.pundir@linaro.org> wrote:
> >>
> >> On Wed, 8 Sept 2021 at 07:50, Bjorn Andersson
> >> <bjorn.andersson@linaro.org> wrote:
> >>>
> >>> On Mon 09 Aug 10:26 PDT 2021, Akhil P Oommen wrote:
> >>>
> >>>> On 8/9/2021 9:48 PM, Caleb Connolly wrote:
> >>>>>
> >>>>>
> >>>>> On 09/08/2021 17:12, Rob Clark wrote:
> >>>>>> On Mon, Aug 9, 2021 at 7:52 AM Akhil P Oommen
> >>>>>> <akhilpo@codeaurora.org> wrote:
> >>> [..]
> >>>>>>> I am a bit confused. We don't define a power domain for gpu in dt,
> >>>>>>> correct? Then what exactly set_opp do here? Do you think this usleep is
> >>>>>>> what is helping here somehow to mask the issue?
> >>>>> The power domains (for cx and gx) are defined in the GMU DT, the OPPs in
> >>>>> the GPU DT. For the sake of simplicity I'll refer to the lowest
> >>>>> frequency (257000000) and OPP level (RPMH_REGULATOR_LEVEL_LOW_SVS) as
> >>>>> the "min" state, and the highest frequency (710000000) and OPP level
> >>>>> (RPMH_REGULATOR_LEVEL_TURBO_L1) as the "max" state. These are defined in
> >>>>> sdm845.dtsi under the gpu node.
> >>>>>
> >>>>> The new devfreq behaviour unmasks what I think is a driver bug, it
> >>>>> inadvertently puts much more strain on the GPU regulators than they
> >>>>> usually get. With the new behaviour the GPU jumps from it's min state to
> >>>>> the max state and back again extremely rapidly under workloads as small
> >>>>> as refreshing UI. Where previously the GPU would rarely if ever go above
> >>>>> 342MHz when interacting with the device, it now jumps between min and
> >>>>> max many times per second.
> >>>>>
> >>>>> If my understanding is correct, the current implementation of the GMU
> >>>>> set freq is the following:
> >>>>>    - Get OPP for frequency to set
> >>>>>    - Push the frequency to the GMU - immediately updating the core clock
> >>>>>    - Call dev_pm_opp_set_opp() which triggers a notify chain, this winds
> >>>>> up somewhere in power management code and causes the gx regulator level
> >>>>> to be updated
> >>>>
> >>>> Nope. dev_pm_opp_set_opp() sets the bandwidth for gpu and nothing else. We
> >>>> were using a different api earlier which got deprecated -
> >>>> dev_pm_opp_set_bw().
> >>>>
> >>>
> >>> On the Lenovo Yoga C630 this is reproduced by starting alacritty and if
> >>> I'm lucky I managed to hit a few keys before it crashes, so I spent a
> >>> few hours looking into this as well...
> >>>
> >>> As you say, the dev_pm_opp_set_opp() will only cast a interconnect vote.
> >>> The opp-level is just there for show and isn't used by anything, at
> >>> least not on 845.
> >>>
> >>> Further more, I'm missing something in my tree, so the interconnect
> >>> doesn't hit sync_state, and as such we're not actually scaling the
> >>> buses. So the problem is not that Linux doesn't turn on the buses in
> >>> time.
> >>>
> >>> So I suspect that the "AHB bus error" isn't saying that we turned off
> >>> the bus, but rather that the GPU becomes unstable or something of that
> >>> sort.
> >>>
> >>>
> >>> Lastly, I reverted 9bc95570175a ("drm/msm: Devfreq tuning") and ran
> >>> Aquarium for 20 minutes without a problem. I then switched the gpu
> >>> devfreq governor to "userspace" and ran the following:
> >>>
> >>> while true; do
> >>>    echo 257000000 > /sys/class/devfreq/5000000.gpu/userspace/set_freq
> >>>    echo 710000000 > /sys/class/devfreq/5000000.gpu/userspace/set_freq
> >>> done
> >>>
> >>> It took 19 iterations of this loop to crash the GPU.
> >>
> >> Ack. With your above script, I can reproduce a crash too on db845c
> >> (A630) running v5.14. I didn't get any crash log though and device
> >> just rebooted to USB crash mode.
> >>
> >> And same crash on RB5 (A650) too https://hastebin.com/raw/ejutetuwun
>
> Are we sure this is the same issue? It could be, but I thought we were
> seeing a bunch of random gpu errors (which may eventually hit device crash).

In the sense that async-serror often seems to be a clk issue, it
*could* be related.. but this would have to be triggered by CPU
access.  The symptom does seem very different.

BR,
-R

> -Akhil
>
> >
> > fwiw I can't reproduce this crash on RB5 so far with v5.15-rc1 merge
> > window (HEAD: 477f70cd2a67)
> >
> >>
> >>>
> >>> So the problem doesn't seem to be Rob's change, it's just that prior to
> >>> it the chance to hitting it is way lower. Question is still what it is
> >>> that we're triggering.
> >>>
> >>> Regards,
> >>> Bjorn
>
