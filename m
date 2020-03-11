Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE2EB18258C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 00:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731364AbgCKXGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 19:06:53 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:34685 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729739AbgCKXGx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 19:06:53 -0400
Received: by mail-ua1-f65.google.com with SMTP id g21so1411629uaj.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0uWB+pxxZbNo6qA/C4PwKcSNSZ7NnZYfVCh6f+YbMN8=;
        b=lPI6DqsKFMOTFSffS7P3z1svL6xrq6CLSjmv1vEp1W/Giea3oK0d2Ie/usTxCUKnDa
         GyLw460HyppwqOM2ckNIPPRwogzLD5cO04JfcHykWPuUU42uEozo30RI2Jd/7g08AP89
         kFmTdJOiZRifxmwf2XVAR8ctYv6rrETdhpa4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0uWB+pxxZbNo6qA/C4PwKcSNSZ7NnZYfVCh6f+YbMN8=;
        b=orVRfQDqIkbskE97NmLW5fa+h9JXL621O/pD09wzxrKv+Oj2dz7odUijNXBmZ7IbpN
         F+/XOBvlMOTarCvQZ5WKoUvtqZWzf/twFwul5vd0z87jsu5uq8rhQTb8gHrfITc9Xkxw
         264RJOlF6Z0RoGcieI8zIPQiYywuiZm1ulOLpO7N3rTtL1t3ARwT163JvTIXP4qQ2gIK
         d6f0dwtTef24HMOTo/JCt4oJpH2cMnoyAnDBuyuF4/4OZezV6eG/QJlu6Pk/qWruejsJ
         29xxkQTKDyE4UUrXgPZvb8GiqL/RHkAvgcsF8yiy4et1wqEznBICWHLP0B0q8QZwlz0/
         1jBQ==
X-Gm-Message-State: ANhLgQ2vV9iAk1Nv64BQjAFAnYRtkZdZCzQww1N/wR9ohnAyqbV9Ax2k
        sk17UDvyZVEFr8vWb+mHJgZ3q3gxdi4=
X-Google-Smtp-Source: ADFU+vvD25rvOqS2qCnpaqkzv8Um2TmFziH19E3V5ZJVVIiQsIZsUWJF8d0yIA99SR9iJ5o//myg1A==
X-Received: by 2002:ab0:32d1:: with SMTP id f17mr3239911uao.84.1583968009603;
        Wed, 11 Mar 2020 16:06:49 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id s17sm3127971vss.32.2020.03.11.16.06.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 16:06:48 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id y6so1408261ual.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:06:47 -0700 (PDT)
X-Received: by 2002:a9f:300a:: with SMTP id h10mr3039015uab.91.1583968006890;
 Wed, 11 Mar 2020 16:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org>
 <1583746236-13325-5-git-send-email-mkshah@codeaurora.org> <CAD=FV=VknUHs8R6pu3pBCR-D50ibeuSVVp9=_t7NLa4U+06XKQ@mail.gmail.com>
 <8810b558-f552-19dc-a5dc-4e64b37f35d8@codeaurora.org> <CAD=FV=XajZ5V_uZryghaBkH=4jv4T-ifuQE2NKbU4RgNVho_9A@mail.gmail.com>
 <e7723b03-ce7e-ff4b-e2b4-3d93f970748c@codeaurora.org>
In-Reply-To: <e7723b03-ce7e-ff4b-e2b4-3d93f970748c@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Mar 2020 16:06:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFL9UZ44Q0xjMVsuok+CK9iWs4X3fkWXFHZrkw-ptfXw@mail.gmail.com>
Message-ID: <CAD=FV=XFL9UZ44Q0xjMVsuok+CK9iWs4X3fkWXFHZrkw-ptfXw@mail.gmail.com>
Subject: Re: [PATCH v13 4/5] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
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

On Tue, Mar 10, 2020 at 11:36 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi,
>
> On 3/10/2020 9:16 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Mar 10, 2020 at 4:19 AM Maulik Shah <mkshah@codeaurora.org> wro=
te:
> >>
> >> On 3/10/2020 5:13 AM, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Mon, Mar 9, 2020 at 2:31 AM Maulik Shah <mkshah@codeaurora.org> wr=
ote:
> >>>> Add changes to invoke rpmh flush() from within cache_lock when the d=
ata in
> >>>> cache is dirty.
> >>>>
> >>>> Introduce two new APIs for this. Clients can use rpmh_start_transact=
ion()
> >>>> before any rpmh transaction once done invoke rpmh_end_transaction() =
which
> >>>> internally invokes rpmh_flush() if the caches has become dirty.
> >>>>
> >>>> Add support to control this with flush_dirty flag.
> >>>>
> >>>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> >>>> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
> >>>> ---
> >>>>  drivers/soc/qcom/rpmh-internal.h |  4 +++
> >>>>  drivers/soc/qcom/rpmh-rsc.c      |  6 +++-
> >>>>  drivers/soc/qcom/rpmh.c          | 64 +++++++++++++++++++++++++++++=
+++--------
> >>>>  include/soc/qcom/rpmh.h          | 10 +++++++
> >>>>  4 files changed, 71 insertions(+), 13 deletions(-)
> >>> As mentioned previously but not addressed [3], I believe your series
> >>> breaks things if there are zero ACTIVE TCSs and you're using the
> >>> immediate-flush solution.  Specifically any attempt to set something'=
s
> >>> "active" state will clobber the sleep/wake.  I believe this is hard t=
o
> >>> fix, especially if you want rpmh_write_async() to work properly and
> >>> need to be robust to the last man going down while rpmh_write_async()
> >>> is running but hasn't finished.  My suggestion was to consider it to
> >>> be an error at probe time for now.
> >>>
> >>> Actually, though, I'd be super surprised if the "active =3D=3D 0" cas=
e
> >>> works anyway.  Aside from subtle problems of not handling -EAGAIN (se=
e
> >>> another previous message that you didn't respond to [2]), I think
> >>> you'll also get failures because you never enable interrupts in
> >>> RSC_DRV_IRQ_ENABLE for anything other than the ACTIVE_TCS.  Thus
> >>> you'll never get interrupts saying when your transactions on the
> >>> borrowed "wake" TCS finish.
> >> No, it shouldn=E2=80=99t effect even with "non-OSI-mode + 0 ACTIVE TCS=
"
> >>
> >> i just replied on v9, pasting same on v13 as well.
> >>
> >> After taking your suggestion to do rpmh start/end transaction() in v13=
, rpmh_end_transaction()
> >> invokes rpmh_flush() only for the last client and by this time expecti=
ng all of rpmh_write()
> >> and rpmh_write_batch() will be already =E2=80=9Cfinished=E2=80=9D as c=
lient first waits for them to finish
> >> and then only invokes end.
> >>
> >> So driver is good to handle rpmh_write() and rpmh_write_batch() calls.
> > Ah, right.  In the previous version of the patch it was a problem
> > because you flushed in cache_rpm_request() and then clobbered it right
> > away in __rpmh_write() when you did rpmh_rsc_send_data().  With v13
> > that is not the case anymore.  So this case should be OK.
> >
> >
> >> Regarding rpmh_write_async() call, which is a fire-n-forget request fr=
om SW and client driver
> >> may immediately invoke rpmh_end_transaction() after this.
> >>
> >> this case is also handled properly=E2=80=A6
> >> Lets again take an example for understanding this..
> >>
> >> 1.    Client invokes rpmh_write_async() to send ACTIVE cmds for target=
s which has zero ACTIVE TCS
> >>
> >>     Rpmh driver Re-purposes one of SLEEP/WAKE TCS to use as ACTIVE, in=
ternally this also sets
> >>     drv->tcs_in_use to true for respective SLEEP/WAKE TCS.
> >>
> >> 2.    Client now without waiting for above to finish, goes ahead and i=
nvokes rpmh_end_transaction()
> >>     which calls rpmh_flush() (in case cache become dirty)
> > I guess we'd have to confirm that there's no way for the cache to
> > _not_ become dirty but you do an "active" transaction.  Let's imagine
> > this case:
> >
> > start transaction
> > rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=3D0x10, data=3D0x99);
> > rpmh_write(RPMH_SLEEP_STATE, addr=3D0x10, data=3D0x11);
> > rpmh_write(RPMH_WAKE_ONLY_STATE, addr=3D0x10, data=3D0x99);
> > end transaction
> >
> > start transaction
> > rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=3D0x10, data=3D0x99);
> > rpmh_write(RPMH_SLEEP_STATE, addr=3D0x10, data=3D0x11);
> > rpmh_write(RPMH_WAKE_ONLY_STATE, addr=3D0x10, data=3D0x99);
> > end transaction
> >
> > In other words the client does the same sequence twice in a row with
> > no change in data.  After the first set I think you'd be fine.  ...but
> > after the second set you'll be in trouble.  That's because none of the
> > calls in the second set would cause the "dirty" to be set.  ...but for
> > "active only" calls we don't have any sort of cache--we just fire it
> > off.  When we fire off the active only we'll clobber the sleep/wake
> > TCS.  ...and then nothing will write them again because the cache
> > isn't dirty.
> Agree with above scenario, but i don't see a reason why would a rpmh clie=
nt send the same request twice.
>
> Let me explain...
>
> while first request is a proper one (already handled in rpmh driver), sec=
ond is again duplicate
> of first without any change.
>
> when this duplicate request is triggered, resource may be in its own low =
power mode, when this
> extra/duplicate command is sent, it needs to come out of low power mode a=
nd apply the newly requested
> level but it is already at that level, so it will immediatly ack back wit=
hout doing any real level
> transition, and it will again go back to sleep. so there can be a small p=
ower hit.
>
> and also for "ACTIVE" we need to handle this unnecessary ack interrupt at=
 CPU, so CPU
> (if it is in some low power mode where this interrupt is affined to) need=
 to wake up and
> handle this interrupt, again taking possible power hit from CPU point.
>
> whats more?
>
> while this whole unnecessary ping-pong happens in HW and SW, client may b=
e waiting if its a blocking call.
>
> rpmh client is expected to "aggregate" and finally do rpmh transaction "o=
nly if"
> aggregated final level differs from what resource is already having.
>
> if they are not doing this, then IMO, this is something to be addressed f=
rom client side.

It feels like "rpmh.c" needs to add "active_val" to its 'struct
cache_req' or truly enforce that "active_val =3D=3D wake_val" all the time
(in other words if someone sets "wake_val" in rpmh_write() /
rpmh_write_async() you should also set "active_val").  Now you can
skip the call to rpmh-rsc if the active doesn't change and the problem
is solved.

Specifically I wouldn't trust all callers of rpmh_write() /
rpmh_write_async() to never send the same data.  If it was just an
speed/power optimization then sure you could trust them, but this is
for correctness.


> >>     Now if re-purposed TCS is still in use in HW (transaction in progr=
ess), we still have
> >>     drv->tcs_in_use set. So the rpmh_rsc_invalidate() (invoked from rp=
mh_flush()) will keep on
> >>     returning -EAGAIN until that TCS becomes free to use and then goes=
 ahead to finish its job.
> > Ah, interesting.  I still think you have problems I pointed out in
> > another response because you never enable interrupts for the "WAKE
> > TCS", but I can see how this could be made to work.  In this case
> > "async" becomes a little silly here because the flush will essentially
> > be forced to wait until the transaction is totally done (so the TCS is
> > free again), but it should be able to work.
> Agree, but i guess, this is a hit expected with non-OSI to do rpm_flush()=
 immediately.

Right, though the hit is much much more if there is no active TCS.
Said another way: if there is an active TCS than non-OSI mode just
causes a bunch of extra register writes.  ...but if there is no active
TCS then non-OSI mode essentially makes rpmh_write_async() useless.

Hrmm, thinking about this again, though, I'm still not convinced I
understand what prevents the firmware from triggering "sleep mode"
while the sleep/wake TCS is being borrowed for an active-only
transaction.  If we're sitting in rpmh_write() and sleeping in
wait_for_completion_timeout() couldn't the system go idle and trigger
sleep mode?  In OSI-mode (with last man down) you'll always have a
rpmh_flush() called by the last man down so you know you can make sure
you're in a consistent state (one final flush and no more active-only
transactions will happen).  Without last man down you have to assume
it can happen at any time don't you?

...so I guess I'll go back to asserting that zero-active-TCS is
incompatible with non-OSI unless you have some way to prevent the
sleep mode from being triggered while you've borrowed the wake TCS.


> > This might actually point
> > out something that needs to be changed in my "clean up" series since I
> > guess "tcs_in_use" could sometimes be present in a wake TCS now.
> yes this still need to keep.

As I've looked at this more, I now believe that "tcs_in_use" is not
sufficient for that case.  Specifically nothing prevents another
thread writing the sleep/wake TCS right after it was invalidated but
before the active-only command is programmed into it.  Specifically:

- write sleep/wake
- write active only
-> see zero-active only and invalidate sleep/wake
-> another thread comes in and write sleep/wake
   ...NOTE: "tcs_in_use" isn't updated for sleep/wake
-> thread writing active_only will then program active_only
   atop the sleep/wake requests.

Maybe it's not a huge deal in the "OSI" case because you only ever
write sleep/wake in the last man down and there can be no new active
transactions when you're doing this.  ...but it seems like it'd be a
problem for non-OSI.

This whole "no active TCS" is really quite a mess.  Given how broken
it seems to me it almost feels like we should remove "no active TCS"
from the driver for now and then re-add it in a later patch when we
can really validate everything.  I tried addressing this in my
rpmh-rsc cleanup series and every time I thought I had a good solution
I could find another way to break it.

Do you actually have the "no active TCS" case working on the current
code, or does it only work on some downstream variant of the driver?


> >>>> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc=
.c
> >>>> index e278fc1..b6391e1 100644
> >>>> --- a/drivers/soc/qcom/rpmh-rsc.c
> >>>> +++ b/drivers/soc/qcom/rpmh-rsc.c
> >>>> @@ -61,6 +61,8 @@
> >>>>  #define CMD_STATUS_ISSUED              BIT(8)
> >>>>  #define CMD_STATUS_COMPL               BIT(16)
> >>>>
> >>>> +#define FLUSH_DIRTY                    1
> >>>> +
> >>>>  static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, i=
nt cmd_id)
> >>>>  {
> >>>>         return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSE=
T * tcs_id +
> >>>> @@ -670,13 +672,15 @@ static int rpmh_rsc_probe(struct platform_devi=
ce *pdev)
> >>>>         INIT_LIST_HEAD(&drv->client.cache);
> >>>>         INIT_LIST_HEAD(&drv->client.batch_cache);
> >>>>
> >>>> +       drv->client.flush_dirty =3D device_get_match_data(&pdev->dev=
);
> >>>> +
> >>>>         dev_set_drvdata(&pdev->dev, drv);
> >>>>
> >>>>         return devm_of_platform_populate(&pdev->dev);
> >>>>  }
> >>>>
> >>>>  static const struct of_device_id rpmh_drv_match[] =3D {
> >>>> -       { .compatible =3D "qcom,rpmh-rsc", },
> >>>> +       { .compatible =3D "qcom,rpmh-rsc", .data =3D (void *)FLUSH_D=
IRTY },
> >>> Ick.  This is just confusing.  IMO better to set
> >>> 'drv->client.flush_dirty =3D true' directly in probe with a comment
> >>> saying that it could be removed if we had OSI.
> >> Done.
> >> i will keep this bit earlier in probe with commet, so later if we dete=
ct rsc to be in hierarchy
> >> from [1], we can override this to be 0 within rpmh_probe_power_domain(=
).
> >>
> >> [1] https://patchwork.kernel.org/patch/11391229/
> > I don't really understand, but maybe it'll be obvious when I see the co=
de.
> okay.
> >
> >
> >
> >>> ...and while you're at it, why not fire off a separate patch (not in
> >>> your series) adding the stub to 'include/linux/psci.h'.  Then when we
> >>> revisit this in a year it'll be there and it'll be super easy to set
> >>> the value properly.
> >> With above approch to set it in probe accordingly PSCI change won't be=
 required.
> >>
> >> it will be simple, cleaner and without any resistance from PSCI perspe=
ctive.
> >>
> >>>>         { }
> >>>>  };
> >>>>
> >>>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> >>>> index 5bed8f4..9d40209 100644
> >>>> --- a/drivers/soc/qcom/rpmh.c
> >>>> +++ b/drivers/soc/qcom/rpmh.c
> >>>> @@ -297,12 +297,10 @@ static int flush_batch(struct rpmh_ctrlr *ctrl=
r)
> >>>>  {
> >>>>         struct batch_cache_req *req;
> >>>>         const struct rpmh_request *rpm_msg;
> >>>> -       unsigned long flags;
> >>>>         int ret =3D 0;
> >>>>         int i;
> >>>>
> >>>>         /* Send Sleep/Wake requests to the controller, expect no res=
ponse */
> >>>> -       spin_lock_irqsave(&ctrlr->cache_lock, flags);
> >>>>         list_for_each_entry(req, &ctrlr->batch_cache, list) {
> >>>>                 for (i =3D 0; i < req->count; i++) {
> >>>>                         rpm_msg =3D req->rpm_msgs + i;
> >>>> @@ -312,7 +310,6 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
> >>>>                                 break;
> >>>>                 }
> >>>>         }
> >>>> -       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> >>>>
> >>>>         return ret;
> >>>>  }
> >>>> @@ -433,16 +430,63 @@ static int send_single(struct rpmh_ctrlr *ctrl=
r, enum rpmh_state state,
> >>>>  }
> >>>>
> >>>>  /**
> >>>> + * rpmh_start_transaction: Indicates start of rpmh transactions, th=
is
> >>>> + * must be ended by invoking rpmh_end_transaction().
> >>>> + *
> >>>> + * @dev: the device making the request
> >>>> + */
> >>>> +void rpmh_start_transaction(const struct device *dev)
> >>>> +{
> >>>> +       struct rpmh_ctrlr *ctrlr =3D get_rpmh_ctrlr(dev);
> >>>> +       unsigned long flags;
> >>>> +
> >>>> +       if (!ctrlr->flush_dirty)
> >>>> +               return;
> >>>> +
> >>>> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
> >>>> +       ctrlr->active_clients++;
> >>> Wouldn't hurt to have something like:
> >>>
> >>> /*
> >>>  * Detect likely leak; we shouldn't have 1000
> >>>  * people making in-flight changes at the same time.
> >>>  */
> >>> WARN_ON(ctrlr->active_clients > 1000)
> >> Not necessary change.
> > Yes, but it will catch buggy clients much more quickly.  What are the d=
ownsides?
> IMO, its uncessary warning that too with arbitrary number (1000).
> rpmh clients are not expected to bombard it with thousands of requests, a=
s i explained
> above, they need to aggregate and make rpmh request only when real level =
transistion
> needed.

I'm not saying we should limit the total number of requests to 1000.
I'm saying that if there are 1000 active clients then that's a
problem.  Right now there are something like 4 clients.  It doesn't
matter how fast those clients are sending, active_clients will only be
at most 4 and that would only be if they were all running their code
at the exact same time.

I want to be able to quickly detect this type of bug:

start_transaction()
ret =3D rpmh_write()
if (ret)
  return ret;
ret =3D rpmh_write()
end_transaction()
return ret;

...in other words: someone has a code path where start_transaction()
is called but never end_transaction().  I'm proposing that if we ever
see the ridiculous value of 1000 active clients the only way it could
happen is if one of the clients started more times than they ended.


I guess maybe by the time there were 1000 it would be too late,
though, because we'd have skipped A LOT of flushes by then?  Maybe
instead we should add something where if RPMH is "ditry" for more than
a certain amount of time we put a warning?


-Doug
