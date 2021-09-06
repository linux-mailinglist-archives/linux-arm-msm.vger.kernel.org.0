Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4021440177E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 10:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240500AbhIFIGG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 04:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240513AbhIFIEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 04:04:23 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD161C0617A8
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Sep 2021 01:02:33 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id b7so7629402iob.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Sep 2021 01:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WZ2JrZUxjomDnhpkXV3UkUZoXyQGVexwecJgXeES0JE=;
        b=RkEBMsUcqXWVba6jg6GNyX1QSg9Z2w6C+7dlrHeO/RDBP0nWKvHew1z1Sbhi1QwMeC
         4SxnoCW+llDiw/b0TnXGbaw1wXwgwmiSVC+inI6f1Frkaln1CFkeK2/bMtpAGA40kC/T
         TedqOSDulzE/wi0uLU5gVLrO6XNn7XFwm4cA8iO+klEcs58lR4MXXTLwxIcP5QwWTjmb
         XvRFXqtzcirpnP8WzMxsBgCBPDB1LQ97mUcFHiGJnV2pWnUvbXCBMPSH21UcZgErHv/q
         le/eKFXaASV2+709G+8GA7ECFAdIJumjFUUYek5/Fl1I09oftcDCmuoxJs7kNiwx+1Gi
         18nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WZ2JrZUxjomDnhpkXV3UkUZoXyQGVexwecJgXeES0JE=;
        b=TbcEHJ2NYsLGVSElBwujgl5qBMqlfs8n4/lEmum42lgaXZniGyKm4di2BJj/1Sy8pr
         /mrpS8kW2IKJm5fXeVqvuWRSBPjgzJb+yGeYnml4ItMBFgQ8KXcy46Ml3B7HVJRvWPhg
         YqZuBnbHyMLUUCxgOTuHF9QaGKM4N4iOzptwvLw9hF+kJAFAwMKZfoKngrkNCnb3cll7
         YFZd0S9OnQa5/ohxUTl+tBqhxFOb98rb0xXpa4yEGcxAGOzWlvYslaUN+qAWoLmkWier
         L+78G4iPhgktNiPQGF7vasarCChR28abimcErYk+hqcW0/I0uTd2L6uXXndNVQaG+5yD
         8pOg==
X-Gm-Message-State: AOAM533nFPOIhRqjUSj8Re5bJmJPtYsHL1NOwn3KGP9OPrNfdIlgS+Pp
        flgvIJKtPKaT02GJVPVvsDfOZt5dgyzFiejtijQWCA==
X-Google-Smtp-Source: ABdhPJyTvUQQpstrXnLI1vn4QAa5MprOCKyEKtqMUvuMXUR0YaUtyc1jLZkxnD+RRhbjYl/pF4jE3czU1Qh0ZEaYGtw=
X-Received: by 2002:a6b:8bcf:: with SMTP id n198mr8922767iod.178.1630915353263;
 Mon, 06 Sep 2021 01:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210729183942.2839925-1-robdclark@gmail.com> <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
 <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
 <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org> <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <CALAqxLUkyXK2gqNMBbtJFfh01ZpcG46dZaM7Zq4jG3OngvFREg@mail.gmail.com> <CAF6AEGsACLcDuszcgmHHs04GghLPiRfei3tGo161yBXsg7Y-YA@mail.gmail.com>
In-Reply-To: <CAF6AEGsACLcDuszcgmHHs04GghLPiRfei3tGo161yBXsg7Y-YA@mail.gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Mon, 6 Sep 2021 13:31:57 +0530
Message-ID: <CAMi1Hd0dniDXPNOuh05ywqHKY+cGvAsd-cnD91K1GLppfO=x0w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To:     Rob Clark <robdclark@gmail.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 4 Sept 2021 at 01:55, Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Sep 3, 2021 at 12:39 PM John Stultz <john.stultz@linaro.org> wrote:
> >
> > On Thu, Jul 29, 2021 at 1:49 PM Rob Clark <robdclark@gmail.com> wrote:
> > > On Thu, Jul 29, 2021 at 1:28 PM Caleb Connolly
> > > <caleb.connolly@linaro.org> wrote:
> > > > On 29/07/2021 21:24, Rob Clark wrote:
> > > > > On Thu, Jul 29, 2021 at 1:06 PM Caleb Connolly
> > > > > <caleb.connolly@linaro.org> wrote:
> > > > >>
> > > > >> Hi Rob,
> > > > >>
> > > > >> I've done some more testing! It looks like before that patch ("drm/msm: Devfreq tuning") the GPU would never get above
> > > > >> the second frequency in the OPP table (342MHz) (at least, not in glxgears). With the patch applied it would more
> > > > >> aggressively jump up to the max frequency which seems to be unstable at the default regulator voltages.
> > > > >
> > > > > *ohh*, yeah, ok, that would explain it
> > > > >
> > > > >> Hacking the pm8005 s1 regulator (which provides VDD_GFX) up to 0.988v (instead of the stock 0.516v) makes the GPU stable
> > > > >> at the higher frequencies.
> > > > >>
> > > > >> Applying this patch reverts the behaviour, and the GPU never goes above 342MHz in glxgears, losing ~30% performance in
> > > > >> glxgear.
> > > > >>
> > > > >> I think (?) that enabling CPR support would be the proper solution to this - that would ensure that the regulators run
> > > > >> at the voltage the hardware needs to be stable.
> > > > >>
> > > > >> Is hacking the voltage higher (although ideally not quite that high) an acceptable short term solution until we have
> > > > >> CPR? Or would it be safer to just not make use of the higher frequencies on a630 for now?
> > > > >>
> > > > >
> > > > > tbh, I'm not sure about the regulator stuff and CPR.. Bjorn is already
> > > > > on CC and I added sboyd, maybe one of them knows better.
> > > > >
> > > > > In the short term, removing the higher problematic OPPs from dts might
> > > > > be a better option than this patch (which I'm dropping), since there
> > > > > is nothing stopping other workloads from hitting higher OPPs.
> > > > Oh yeah that sounds like a more sensible workaround than mine .
> > > > >
> > > > > I'm slightly curious why I didn't have problems at higher OPPs on my
> > > > > c630 laptop (sdm850)
> > > > Perhaps you won the sillicon lottery - iirc sdm850 is binned for higher clocks as is out of the factory.
> > > >
> > > > Would it be best to drop the OPPs for all devices? Or just those affected? I guess it's possible another c630 might
> > > > crash where yours doesn't?
> > >
> > > I've not heard any reports of similar issues from the handful of other
> > > folks with c630's on #aarch64-laptops.. but I can't really say if that
> > > is luck or not.
> > >
> > > Maybe just remove it for affected devices?  But I'll defer to Bjorn.
> >
> > Just as another datapoint, I was just marveling at how suddenly smooth
> > the UI was performing on db845c and Caleb pointed me at the "drm/msm:
> > Devfreq tuning" patch as the likely cause of the improvement, and
> > mid-discussion my board crashed into USB crash mode:
> > [  146.157696][    C0] adreno 5000000.gpu: CP | AHB bus error
> > [  146.163303][    C0] adreno 5000000.gpu: CP | AHB bus error
> > [  146.168837][    C0] adreno 5000000.gpu: RBBM | ATB bus overflow
> > [  146.174960][    C0] adreno 5000000.gpu: CP | HW fault | status=0x00000000
> > [  146.181917][    C0] adreno 5000000.gpu: CP | AHB bus error
> > [  146.187547][    C0] adreno 5000000.gpu: CP illegal instruction error
> > [  146.194009][    C0] adreno 5000000.gpu: CP | AHB bus error
> > [  146.308909][    T9] Internal error: synchronous external abort:
> > 96000010 [#1] PREEMPT SMP
> > [  146.317150][    T9] Modules linked in:
> > [  146.320941][    T9] CPU: 3 PID: 9 Comm: kworker/u16:1 Tainted: G
> >     W         5.14.0-mainline-06795-g42b258c2275c #24
> > [  146.331974][    T9] Hardware name: Thundercomm Dragonboar
> > Format: Log Type - Time(microsec) - Message - Optional Info
> > Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
> > S - QC_IMAGE_VERSION_STRING=BOOT.XF.2.0-00371-SDM845LZB-1
> > S - IMAGE_VARIANT_STRING=SDM845LA
> > S - OEM_IMAGE_VERSION_STRING=TSBJ-FA-PC-02170
> >
> > So Caleb sent me to this thread. :)
> >
> > I'm still trying to trip it again, but it does seem like db845c is
> > also seeing some stability issues with Linus' HEAD.
> >
>
> Caleb's original pastebin seems to have expired (or at least require
> some sort of ubuntu login to access).. were the crashes he was seeing
> also 'AHB bus error'?

I can reproduce this hard crash
https://www.irccloud.com/pastebin/Cu6UJntE/ and a gpu lockup
https://www.irccloud.com/pastebin/6Ryd2Pug/ at times reliably, by
running antutu benchmark on pocof1.

Reverting 9bc95570175a ("drm/msm: Devfreq tuning") helps and I no
longer see these errors.

Complete dmesg for hardcrash https://pastebin.com/raw/GLZVQFQN

Regards,
Amit Pundir

>
> If you have a reliable reproducer, I guess it would be worth seeing if
> increasing the min_freq (ie. to limit how far we jump the freq in one
> shot) "fixes" it?
>
> I guess I could check downstream kgsl to see if they were doing
> something to increase freq in smaller increments.. I don't recall that
> they were but it has been a while since I dug thru that code.  And I
> suppose downstream it could also be done in their custom tz governor.
>
> BR,
> -R
