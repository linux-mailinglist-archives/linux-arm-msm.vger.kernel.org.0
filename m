Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEA2A17871A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 01:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbgCDAkc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 19:40:32 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:43210 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727864AbgCDAkc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 19:40:32 -0500
Received: by mail-vs1-f66.google.com with SMTP id 7so43452vsr.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 16:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CK5Jlz1A5OJnYpPacpgEc1DpNLjBDwrpuxqvMyaaKmw=;
        b=DaxJDru+x+T7YSXz89W4lWrN9GVjSeKZyNJyzTshCQTzWVgHPevbth4re/xYOFBXi9
         FHKGCeELMSu2JJ8Li1kz4mWQwqkiS62HwxNFAhPX2rPRbBqSI7tohQYEVbeI5ssrJh0M
         jOxO9uJoyeuynWhvakzzXkPdg594dSI5NmK/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CK5Jlz1A5OJnYpPacpgEc1DpNLjBDwrpuxqvMyaaKmw=;
        b=YPy+L3obVwQFECF5zEJ6CSbyMX4FPgi71eZlSJOfyqoTh+I3qQWvuamziBPBIe8hbw
         vI8M+9L0qCr8/pIQgy4BW8HfHVe1o/N+j82gQINEmPNSFVn4nDDcMNzLAcco21irJSiT
         Ty12SSaloXYLm4PkAHYs83+byUPw34uFUZ6NRf32oMD4AR+tpdXNfjW41jDtMXuQu19N
         NWxvfIingc1ibdqlT7H2hYXDjseld1hXaz3TBmo6a76uC+Q+O66XEEOBLvSZlCZj26pg
         I+lYK4j+wvJSNLW7vKujwrJnDua3NRJBv6P+1ZdVbtc/w0J30M9GsrYqieBhjivy7Tv4
         VZNQ==
X-Gm-Message-State: ANhLgQ3FCa33pL8t0EYLck3V4XzkIEAfPs46QOuqpqZZpISC0MEK0/SL
        YMaFh400J9KjcBDy9v/AW02YZBfueRE=
X-Google-Smtp-Source: ADFU+vvjhzdp4Ajw1IAStlBNlT0uSR+6q8uqgnxQNVJXqrJXJo9dcPxr9XiCbKmZ/JwcZhURTA/ImA==
X-Received: by 2002:a67:f886:: with SMTP id h6mr355676vso.98.1583282429514;
        Tue, 03 Mar 2020 16:40:29 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 126sm5793692vsz.19.2020.03.03.16.40.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2020 16:40:28 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id z26so56937uap.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 16:40:28 -0800 (PST)
X-Received: by 2002:ab0:2006:: with SMTP id v6mr192452uak.22.1583282428083;
 Tue, 03 Mar 2020 16:40:28 -0800 (PST)
MIME-Version: 1.0
References: <1582889903-12890-1-git-send-email-mkshah@codeaurora.org>
 <1582889903-12890-4-git-send-email-mkshah@codeaurora.org> <CAD=FV=V92fFH8q+yvMk2sWdgi_xjFyvt3rMu14O+sO5zLp2kGg@mail.gmail.com>
 <7704638e-b473-d0cf-73ab-2bdb67b636ba@codeaurora.org>
In-Reply-To: <7704638e-b473-d0cf-73ab-2bdb67b636ba@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 3 Mar 2020 16:40:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XL631dpEY8iB=gzjnh1cZVk6AKRafkQ7ke++AfXtuHNA@mail.gmail.com>
Message-ID: <CAD=FV=XL631dpEY8iB=gzjnh1cZVk6AKRafkQ7ke++AfXtuHNA@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 2, 2020 at 9:47 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
>
> On 2/29/2020 5:15 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Feb 28, 2020 at 3:38 AM Maulik Shah <mkshah@codeaurora.org> wro=
te:
> >> Add changes to invoke rpmh flush() from within cache_lock when the dat=
a
> >> in cache is dirty.
> >>
> >> This is done only if OSI is not supported in PSCI. If OSI is supported
> >> rpmh_flush can get invoked when the last cpu going to power collapse
> >> deepest low power mode.
> >>
> >> Also remove "depends on COMPILE_TEST" for Kconfig option QCOM_RPMH so =
the
> >> driver is only compiled for arm64 which supports psci_has_osi_support(=
)
> >> API.
> >>
> >> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> >> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
> >> ---
> >>   drivers/soc/qcom/Kconfig |  2 +-
> >>   drivers/soc/qcom/rpmh.c  | 33 ++++++++++++++++++++++-----------
> >>   2 files changed, 23 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> >> index d0a73e7..2e581bc 100644
> >> --- a/drivers/soc/qcom/Kconfig
> >> +++ b/drivers/soc/qcom/Kconfig
> >> @@ -105,7 +105,7 @@ config QCOM_RMTFS_MEM
> >>
> >>   config QCOM_RPMH
> >>          bool "Qualcomm RPM-Hardened (RPMH) Communication"
> >> -       depends on ARCH_QCOM && ARM64 || COMPILE_TEST
> >> +       depends on ARCH_QCOM && ARM64
> >>          help
> >>            Support for communication with the hardened-RPM blocks in
> >>            Qualcomm Technologies Inc (QTI) SoCs. RPMH communication us=
es an
> >> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> >> index f28afe4..6a5a60c 100644
> >> --- a/drivers/soc/qcom/rpmh.c
> >> +++ b/drivers/soc/qcom/rpmh.c
> >> @@ -12,6 +12,7 @@
> >>   #include <linux/module.h>
> >>   #include <linux/of.h>
> >>   #include <linux/platform_device.h>
> >> +#include <linux/psci.h>
> >>   #include <linux/slab.h>
> >>   #include <linux/spinlock.h>
> >>   #include <linux/types.h>
> >> @@ -158,6 +159,13 @@ static struct cache_req *cache_rpm_request(struct=
 rpmh_ctrlr *ctrlr,
> >>          }
> >>
> >>   unlock:
> >> +       if (ctrlr->dirty && !psci_has_osi_support()) {
> >> +               if (rpmh_flush(ctrlr)) {
> >> +                       spin_unlock_irqrestore(&ctrlr->cache_lock, fla=
gs);
> >> +                       return ERR_PTR(-EINVAL);
> >> +               }
> >> +       }
> > It's been a long time since I looked in depth at RPMH, but upon a
> > first glance this seems like it's gonna be terrible for performance.
> > You're going to send every entry again and again, aren't you?  In
> > other words in pseudo-code:
> >
> > 1. rpmh_write(addr=3D0x10, data=3D0x99);
> > =3D=3D> writes on the bus (0x10, 0x99)
> >
> > 2. rpmh_write(addr=3D0x11, data=3D0xaa);
> > =3D=3D> writes on the bus (0x10, 0x99)
> > =3D=3D> writes on the bus (0x11, 0xaa)
> >
> > 3. rpmh_write(addr=3D0x10, data=3D0xbb);
> > =3D=3D> writes on the bus (0x10, 0xbb)
> > =3D=3D> writes on the bus (0x11, 0xaa)
> >
> > 4. rpmh_write(addr=3D0x12, data=3D0xcc);
> > =3D=3D> writes on the bus (0x10, 0xbb)
> > =3D=3D> writes on the bus (0x11, 0xaa)
> > =3D=3D> writes on the bus (0x12, 0xcc)
> >
> > That seems bad.
>
> Hi Doug,
>
> No this is NOT how data is sent to RPMh/AOSS.
> The rpmh_flush() fills up DRV-2 (HLOS) TCSes, makes it ready and The HW
> takes care of
> sending data of Sleep TCSes for each of the EL/ DRV(s) when Last cpu is
> going to deepest
> low power mode and of WAKE TCSes while first cpu is waking up.

Ah, I see.  So for sleep / wake commands we never directly wait for
them to go out on the bus while the system is awake.  We just program
them all to the RPMH hardware and they'll set there and all get sent
automatically when the last CPU goes into deepest low power mode.

...so actually the whole point of OSI mode (from an RPMH perspective)
is not to avoid transactions on the bus.  It's just avoiding
programming RPMH over and over again.  Is that correct?

...and the reason we have all these data structures in the kernel is
to keep track of auxiliary information about the things in the
sleep/wake TCSs and make it easier to update bits of them?


> > Why can't you just send the new request itself and
> > forget adding it to the cache?  In other words don't even call
> > cache_rpm_request() in the non-OSI case and then in __rpmh_write()
> > just send right away...
>
> This won=E2=80=99t work out. Let me explain why=E2=80=A6
>
> We have 3 SLEEP and 3 WAKE TCSes from below config..
>                          qcom,tcs-config =3D <ACTIVE_TCS  2>,
>                                            <SLEEP_TCS   3>,
>                                            <WAKE_TCS    3>,
> Each TCS has total 16 commands so total 48 commands(16*3) for each SLEEP
> and WAKE TCSes,
> that can be filled up.
>
> Now Lets take a example in pseudo-code on what could happen if we don=E2=
=80=99t
> cache and
> immediately fill up TCSes commands. The triggering part doesn=E2=80=99t h=
appen
> as explained above
> it fills up TCSes and makes them ready..
>
> Time-t0 (from client_x invoking rpmh_write_batch() for SLEEP SET, a
> batch of 3 commands)
>
> rpmh_write_batch(
> addr=3D0x10, data=3D0x99,  -> fills up CMD0 in SLEEP TCS_0
> addr=3D0x11, data=3D0xaa,  -> fills up CMD1 in SLEEP TCS_0
> addr=3D0x10, data=3D0xbb); -> fills up CMD2 in SLEEP TCS_0
>
> Time-t1 (from client_y invoking rpmh_write(), a single command)
>
> rpmh_write(
> addr=3D0x12, data=3D0xcc,  -> fills up CMD3 in SLEEP TCS_0
> );
>
> Time-t2 (from client_x invokes rpmh_invalidate() which invalidates all
> previous *batch requests* only)
>
> At this point, it should have CMD3 only in TCS while CMD 0,1,2 needs to
> be freed up, since we expect
> a new batch request now.
>
> Since driver didn=E2=80=99t cache anything in the first place, it doesn=
=E2=80=99t know
> details about previous batch request
> like how many commands it had, what were the commands of those batches
> when filling up in TCSes, and so on=E2=80=A6
> (basically all the data required to free up only CMD 0,1,2, and don=E2=80=
=99t
> disturb CMD3)
>
> Whats more?
>
> The new batch request could be of let say 5 commands after invalidation,
> instead of 3 commands in previous batch.
> So it will not fit in CMD-0,1,2 and we might want to allocate from
> CMD-4,5,6,7,8 now.
>
> This will leave a hole in TCS CMDs (each TCS has 16 total commands)
> unless we re-arrange everything.
> Also we may want to fill up batch request first and then single
> requests, by not caching anything, driver don=E2=80=99t
> know which one is batch and which one is single request.

OK, I got it now.  I'll try to spend some time tomorrow looking over
everything / testing with my new understanding.


> There are other cases like below which also gets impacted if driver
> don't cache anything...
>
> for example, when we don=E2=80=99t have dedicated ACTIVE TCS ( if we have=
 below
> config with ACTIVE TCS count 0)
>      qcom,tcs-config =3D <ACTIVE_TCS  0>,
>                            <SLEEP_TCS   3>,
>                            <WAKE_TCS    3>,
>
> Now to send active data, driver may re-use/ re-purpose few of the sleep
> or wake TCS, to be used as ACTIVE TCS and once work is done,
> it will be re-allocated in SLEEP/ WAKE TCS pool accordingly. If driver
> don=E2=80=99t cache, all the SLEEP and WAKE data is lost when one
> of TCS is repurposed to use as ACTIVE TCS.

Ah, interesting.  I'll read the code more, but are you expecting this
type of situation to work today, or is it theoretical for the future?


> Hope above explanation clears why caching is important and gives clear
> view of caching v/s not caching.
>
> Thanks,
> Maulik
>
> > I tried to test this and my printouts didn't show anything actually
> > happening in rpmh_flush().  Maybe I just don't have the write patches
> > to exercise this properly...
>
> it may be due to missing interconnect patches series
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=3D247175

I ended up pulling those in but I was still not seeing things work as
I expected.  I'll debug more tomorrow to see if it was my expectations
that were wrong or if there was a real issue.


> >>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> >>
> >>          return req;
> >> @@ -285,26 +293,35 @@ int rpmh_write(const struct device *dev, enum rp=
mh_state state,
> >>   }
> >>   EXPORT_SYMBOL(rpmh_write);
> >>
> >> -static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_=
req *req)
> >> +static int cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_r=
eq *req)
> >>   {
> >>          unsigned long flags;
> >>
> >>          spin_lock_irqsave(&ctrlr->cache_lock, flags);
> >> +
> >>          list_add_tail(&req->list, &ctrlr->batch_cache);
> >>          ctrlr->dirty =3D true;
> >> +
> >> +       if (!psci_has_osi_support()) {
> >> +               if (rpmh_flush(ctrlr)) {
> >> +                       spin_unlock_irqrestore(&ctrlr->cache_lock, fla=
gs);
> >> +                       return -EINVAL;
> >> +               }
> >> +       }
> >> +
> >>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> >> +
> >> +       return 0;
> >>   }
> >>
> >>   static int flush_batch(struct rpmh_ctrlr *ctrlr)
> >>   {
> >>          struct batch_cache_req *req;
> >>          const struct rpmh_request *rpm_msg;
> >> -       unsigned long flags;
> >>          int ret =3D 0;
> >>          int i;
> >>
> >>          /* Send Sleep/Wake requests to the controller, expect no resp=
onse */
> >> -       spin_lock_irqsave(&ctrlr->cache_lock, flags);
> >>          list_for_each_entry(req, &ctrlr->batch_cache, list) {
> >>                  for (i =3D 0; i < req->count; i++) {
> >>                          rpm_msg =3D req->rpm_msgs + i;
> >> @@ -314,7 +331,6 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
> >>                                  break;
> >>                  }
> >>          }
> >> -       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> >>
> >>          return ret;
> >>   }
> >> @@ -386,10 +402,8 @@ int rpmh_write_batch(const struct device *dev, en=
um rpmh_state state,
> >>                  cmd +=3D n[i];
> >>          }
> >>
> >> -       if (state !=3D RPMH_ACTIVE_ONLY_STATE) {
> >> -               cache_batch(ctrlr, req);
> >> -               return 0;
> >> -       }
> >> +       if (state !=3D RPMH_ACTIVE_ONLY_STATE)
> >> +               return cache_batch(ctrlr, req);
> > I'm curious: why not just do:
> >
> > if (state !=3D RPMH_ACTIVE_ONLY_STATE && psci_has_osi_support()) {
> >    cache_batch(ctrlr, req);
> >    return 0;
> > }
> >
> > ...AKA don't even cache it up if we're not in OSI mode.  IIUC this
> > would be a huge deal because with your code you're doing the whole
> > RPMH transfer under "spin_lock_irqsave", right?  And presumably RPMH
> > transfers are somewhat slow, otherwise why did anyone come up with
> > this whole caching / last-man-down scheme to start with?
> >
> > OK, it turned out to be at least slightly more complex because it
> > appears that we're supposed to use rpmh_rsc_write_ctrl_data() for
> > sleep/wake stuff and that they never do completions, but it really
> > wasn't too hard.  I prototyped it at <http://crrev.com/c/2080916>.
> > Feel free to hijack that change if it looks like a starting point and
> > if it looks like I'm not too confused.
> I looked at this change and thought of it earlier but it won=E2=80=99t wo=
rk out
> for the reasons in above example.
> I have thought of few optimizations in rpmh_flush() to reduce its time,
> if we *really* see any performance impact=E2=80=A6
>
> below is high level idea=E2=80=A6
> When  rpmh_write_batch() is invoked for SLEEP_SETs, currently
> rpmh_flush() will update both SLEEP and WAKE TCS contents,
> However we may change it to update only SLEEP TCS, and when
> rpmh_write_batch() is invoked for WAKE SETs, update only WAKE TCS content=
s.
> This way it may reduce time by roughly ~50%.

OK, that's something to keep in mind.  Agree that it doesn't have the
be part of the initial change.

-Doug
