Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9769B405A8C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 18:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhIIQOl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 12:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbhIIQOj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 12:14:39 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1319C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Sep 2021 09:13:29 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id j18so2988543ioj.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Sep 2021 09:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pACnzJlHMR2izPaEcZdZJlVxKc2mAvyrU+PyfYWuqjY=;
        b=t6b96zprUu+yVzDHJupCAH73jnub/kQdWCLt5XJgNoL33Oiellv9B1ido23G4XTORY
         7k9Hh37OLWFfZcZlwIJVrbE2YWyDirMOczoUQ6/EofSVVgQ+Ol8mrcRsTmFdzvzRv6wF
         elvTuv8Ea4SJP+CKYRit3qTfis4np14DXqIbiqW0B8J1mYwUI23q1FdzYQ+guyA4My+6
         O00/IyGfcO6QP6VZc9+6jh//JSE2zz4WxNMOQPfZV8j0r9Zfgvxm5mHfBzyEKvoKGZdQ
         KD8m6joLHqL4VV3E3b0GgqeIETpWKbSItcDG/lvtFdw8lzZ9vAtF7VxS5rioJduy6ztD
         J3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pACnzJlHMR2izPaEcZdZJlVxKc2mAvyrU+PyfYWuqjY=;
        b=qez3OXRsc5pRDuL+NKUta4fqfHopfHjWbK5qNNDuzXXP3RgcerQTN/LEFHOkMyLGGF
         OddK3j9x2tXW3uLHoT8+8Frq/CqY+N1q4Nu4b5ZjQYSPgRLn45M2T7Wvm7xDvYGUMXbV
         zzPxqUmwF4ZaE4yx8L0NzT3vs6jSZeMH6N8HPhe1XO73gXpuiiUJRmCuN1r4dupaoIEn
         GJFrcyCGSDa1Yxen6fU+7LBaX+V3zfqwSjQKyMzyceXiHnblV7MOM4xOda9KFYXz1LiD
         bICOLUIjhGKZMAkYRwzOaDo6MTFmfoUWuh2d54ux0rAkqZ0vBfZ5F2+TN7HW1uMYofe4
         9+5A==
X-Gm-Message-State: AOAM532sAe9Iuk6i4Pq+6yVnROGazI9fNkrlvCotpTRKM1b8gkX2D6lp
        uoXSyPAdpP9Sho0F2uobRWhuFPxAWGB8dyXvsDU3WA==
X-Google-Smtp-Source: ABdhPJxt/WFs4KqqqwMz/AgcK0MKJvBdp6ymGY5KAiQiTL/VZpyvs3S9RKg1jPGlq525uKKkkgkmSwOdN7n8iEtOMo0=
X-Received: by 2002:a02:9204:: with SMTP id x4mr523733jag.45.1631204009109;
 Thu, 09 Sep 2021 09:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
 <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <b7334a1a-c4ad-da90-03b4-0d19e1811b13@linaro.org> <CAF6AEGv0WWB3Z1hmXf8vxm1_-d7fsNBRcaQF35aE2JXcJn8-cA@mail.gmail.com>
 <8aa590be-6a9f-9343-e897-18e86ea48202@linaro.org> <CAF6AEGtd_5jKhixp6h+NnN8-aqjBHTLopRozASE73oT3rfnFHA@mail.gmail.com>
 <6eefedb2-9e59-56d2-7703-2faf6cb0ca3a@codeaurora.org> <CAF6AEGvhqPHWNK=6GYz+Mu5aKe8+iE4_Teem6o=X6eiANhWsPg@mail.gmail.com>
 <83ecbe74-caf0-6c42-e6f5-4887b3b534c6@linaro.org> <53d3e5b7-9dc0-a806-70e9-b9b5ff877462@codeaurora.org>
 <YTgeIuwumPoR9ZTE@ripper> <CAMi1Hd1TOFj5USToEhuvZz8vgboQbMWco7gN413-jHJp-A7Ozg@mail.gmail.com>
In-Reply-To: <CAMi1Hd1TOFj5USToEhuvZz8vgboQbMWco7gN413-jHJp-A7Ozg@mail.gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Thu, 9 Sep 2021 21:42:52 +0530
Message-ID: <CAMi1Hd2gmo-qzDSDpi1hwpX=N1eGM+Q5HqPSvdbq9LdqwNuK+w@mail.gmail.com>
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
        open list <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 9 Sept 2021 at 17:47, Amit Pundir <amit.pundir@linaro.org> wrote:
>
> On Wed, 8 Sept 2021 at 07:50, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 09 Aug 10:26 PDT 2021, Akhil P Oommen wrote:
> >
> > > On 8/9/2021 9:48 PM, Caleb Connolly wrote:
> > > >
> > > >
> > > > On 09/08/2021 17:12, Rob Clark wrote:
> > > > > On Mon, Aug 9, 2021 at 7:52 AM Akhil P Oommen
> > > > > <akhilpo@codeaurora.org> wrote:
> > [..]
> > > > > > I am a bit confused. We don't define a power domain for gpu in dt,
> > > > > > correct? Then what exactly set_opp do here? Do you think this usleep is
> > > > > > what is helping here somehow to mask the issue?
> > > > The power domains (for cx and gx) are defined in the GMU DT, the OPPs in
> > > > the GPU DT. For the sake of simplicity I'll refer to the lowest
> > > > frequency (257000000) and OPP level (RPMH_REGULATOR_LEVEL_LOW_SVS) as
> > > > the "min" state, and the highest frequency (710000000) and OPP level
> > > > (RPMH_REGULATOR_LEVEL_TURBO_L1) as the "max" state. These are defined in
> > > > sdm845.dtsi under the gpu node.
> > > >
> > > > The new devfreq behaviour unmasks what I think is a driver bug, it
> > > > inadvertently puts much more strain on the GPU regulators than they
> > > > usually get. With the new behaviour the GPU jumps from it's min state to
> > > > the max state and back again extremely rapidly under workloads as small
> > > > as refreshing UI. Where previously the GPU would rarely if ever go above
> > > > 342MHz when interacting with the device, it now jumps between min and
> > > > max many times per second.
> > > >
> > > > If my understanding is correct, the current implementation of the GMU
> > > > set freq is the following:
> > > >   - Get OPP for frequency to set
> > > >   - Push the frequency to the GMU - immediately updating the core clock
> > > >   - Call dev_pm_opp_set_opp() which triggers a notify chain, this winds
> > > > up somewhere in power management code and causes the gx regulator level
> > > > to be updated
> > >
> > > Nope. dev_pm_opp_set_opp() sets the bandwidth for gpu and nothing else. We
> > > were using a different api earlier which got deprecated -
> > > dev_pm_opp_set_bw().
> > >
> >
> > On the Lenovo Yoga C630 this is reproduced by starting alacritty and if
> > I'm lucky I managed to hit a few keys before it crashes, so I spent a
> > few hours looking into this as well...
> >
> > As you say, the dev_pm_opp_set_opp() will only cast a interconnect vote.
> > The opp-level is just there for show and isn't used by anything, at
> > least not on 845.
> >
> > Further more, I'm missing something in my tree, so the interconnect
> > doesn't hit sync_state, and as such we're not actually scaling the
> > buses. So the problem is not that Linux doesn't turn on the buses in
> > time.
> >
> > So I suspect that the "AHB bus error" isn't saying that we turned off
> > the bus, but rather that the GPU becomes unstable or something of that
> > sort.
> >
> >
> > Lastly, I reverted 9bc95570175a ("drm/msm: Devfreq tuning") and ran
> > Aquarium for 20 minutes without a problem. I then switched the gpu
> > devfreq governor to "userspace" and ran the following:
> >
> > while true; do
> >   echo 257000000 > /sys/class/devfreq/5000000.gpu/userspace/set_freq
> >   echo 710000000 > /sys/class/devfreq/5000000.gpu/userspace/set_freq
> > done
> >
> > It took 19 iterations of this loop to crash the GPU.
>
> Ack. With your above script, I can reproduce a crash too on db845c
> (A630) running v5.14. I didn't get any crash log though and device
> just rebooted to USB crash mode.
>
> And same crash on RB5 (A650) too https://hastebin.com/raw/ejutetuwun

fwiw I can't reproduce this crash on RB5 so far with v5.15-rc1 merge
window (HEAD: 477f70cd2a67)

>
> >
> > So the problem doesn't seem to be Rob's change, it's just that prior to
> > it the chance to hitting it is way lower. Question is still what it is
> > that we're triggering.
> >
> > Regards,
> > Bjorn
