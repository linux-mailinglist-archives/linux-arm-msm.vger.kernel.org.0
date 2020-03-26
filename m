Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2481E19460F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 19:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgCZSIc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 14:08:32 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34766 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbgCZSIc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 14:08:32 -0400
Received: by mail-vs1-f68.google.com with SMTP id b5so4532218vsb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 11:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ngNG7FcAFdi6qUqXDItDrlIQbQkclatNBvHZIWasQ8Y=;
        b=jrNkkzuvx/B254D8dXPyhZA5O4yNe6rB//gmliu8UXNwykzFIPCicNqhY8aQgQYnpf
         QZte8ATjde4jYUUqroMYKhMlr7410iGYXmPyeTynBC+GDVpEO3r+6vnEbt1qhmuOMw5W
         WWmevbhe/J2napAEbfd160TEn2hcABJeO31UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ngNG7FcAFdi6qUqXDItDrlIQbQkclatNBvHZIWasQ8Y=;
        b=JCZYyDzejlPl2cwV82ww9DzWid6S0hVs5DRdsVH7qZEPiwQDmHwVP3zBcj8IU/6hPf
         8WZAv1gYCorisJDYAMxqxivI+kBmtJeExrW8Yk5mCSwpSc7wqbp5EvTFxHNBO4q6dwHQ
         HP5bKhxg01432OOAe/t+qPh4Qj6pWRSIY0sKkYI/Xui/pxsrtyRj59lifeMo9RDqI1Ej
         /GqgIjmSwTji/3ZktAyjrsFhQYIiiKZDfAQWliPK8RJ4DfzhOVu/o8j1aVqqH/+iijwg
         sqKVu9gZmPWJRjXjqrL8BPI6/MGnhymv2u9UFf4WD3F4KSfL0suBNDLOU4KhAbla/W7b
         tJ3A==
X-Gm-Message-State: ANhLgQ1Vtk22z5dXQXK4jvtkrFczcN6jWy7bbzCaWR9+Fh6We54fY1Er
        LRHch190GvAPRwFyaT2Axg3m1MR3aVw=
X-Google-Smtp-Source: ADFU+vt6EeP1gSSW/Dhogm/tlyNDCpqH3SWvZdDstOFHO4Bzj+eQwONGsWBDodHjvEkuhTjLkL1ALQ==
X-Received: by 2002:a67:f24d:: with SMTP id y13mr7648001vsm.72.1585246107795;
        Thu, 26 Mar 2020 11:08:27 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id q128sm1344885vkh.54.2020.03.26.11.08.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 11:08:27 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id l18so2493752uak.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 11:08:27 -0700 (PDT)
X-Received: by 2002:a9f:300a:: with SMTP id h10mr7546050uab.91.1585246105256;
 Thu, 26 Mar 2020 11:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org>
 <1583746236-13325-5-git-send-email-mkshah@codeaurora.org> <CAD=FV=VknUHs8R6pu3pBCR-D50ibeuSVVp9=_t7NLa4U+06XKQ@mail.gmail.com>
 <8810b558-f552-19dc-a5dc-4e64b37f35d8@codeaurora.org> <CAD=FV=XajZ5V_uZryghaBkH=4jv4T-ifuQE2NKbU4RgNVho_9A@mail.gmail.com>
 <e7723b03-ce7e-ff4b-e2b4-3d93f970748c@codeaurora.org> <CAD=FV=XFL9UZ44Q0xjMVsuok+CK9iWs4X3fkWXFHZrkw-ptfXw@mail.gmail.com>
 <5a5274ac-41f4-b06d-ff49-c00cef67aa7f@codeaurora.org> <CAD=FV=VPSahhK71k_D+nfL1=5QE5sKMQT=6zzyEF7+JWMcTxsg@mail.gmail.com>
 <3247c8d1-2222-e05a-e14f-41966a29fda0@codeaurora.org>
In-Reply-To: <3247c8d1-2222-e05a-e14f-41966a29fda0@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 26 Mar 2020 11:08:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWD0jyLU0H4CkEr5d+tZs8+NrVS-4my61rUds8dEjvng@mail.gmail.com>
Message-ID: <CAD=FV=XWD0jyLU0H4CkEr5d+tZs8+NrVS-4my61rUds8dEjvng@mail.gmail.com>
Subject: Re: Re: [PATCH v13 4/5] soc: qcom: rpmh: Invoke rpmh_flush() for
 dirty caches
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
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 25, 2020 at 10:16 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi,
>
> On 3/12/2020 8:41 PM, Doug Anderson wrote:
> > Hi,
> >
> > Quoting below may look funny since you replied with HTML mail and all
> > old quoting was lost.  :(  I tried my best.
> >
> > On Thu, Mar 12, 2020 at 3:32 AM Maulik Shah <mkshah@codeaurora.org> wrote:
> >>> Specifically I wouldn't trust all callers of rpmh_write() /
> >>> rpmh_write_async() to never send the same data.  If it was just an
> >>> speed/power optimization then sure you could trust them, but this is
> >>> for correctness.
> >> yes we should trust callers not to send duplicate data.
> > I guess we'll see how this works out.  Since this only affects the
> > "zero active-only" case and I'm pretty sure that case has more
> > important issues, I'm OK w/ ignoring for now.
> >
> >
> >>> Hrmm, thinking about this again, though, I'm still not convinced I
> >>> understand what prevents the firmware from triggering "sleep mode"
> >>> while the sleep/wake TCS is being borrowed for an active-only
> >>> transaction.  If we're sitting in rpmh_write() and sleeping in
> >>> wait_for_completion_timeout() couldn't the system go idle and trigger
> >>> sleep mode?  In OSI-mode (with last man down) you'll always have a
> >>> rpmh_flush() called by the last man down so you know you can make sure
> >>> you're in a consistent state (one final flush and no more active-only
> >> transactions will happen).  Without last man down you have to assume
> >>> it can happen at any time don't you?
> >>>
> >>> ...so I guess I'll go back to asserting that zero-active-TCS is
> >>> incompatible with non-OSI unless you have some way to prevent the
> >>> sleep mode from being triggered while you've borrowed the wake TCS.
> >> i had change for this in v4 to handle same.
> >>
> >> Link: https://patchwork.kernel.org/patch/11366205/
> >>
> >> + /*
> >> + * RPMh domain can not be powered off when there is pending ACK for
> >> + * ACTIVE_TCS request. Exit when controller is busy.
> >> + */
> >>
> >> before calling rpmh_flush() we check ctrlr is idle (ensuring
> >>
> >> tcs_is_free() check passes)  this will ensure that
> >>
> >> previous active transaction is completed before going ahead.
> >>
> >> i will add this check in v14.
> >>
> >> since this curretntly check for ACTIVE TCS only, i will update it to check the repurposed "WAKE TCS" is also free.
> > The difficulty isn't in adding a simple check, it's in adding a check
> > that is race free and handles locking properly.  Specifically looking
> > at your the v4 you pointed to, I see things like this:
> >
> >   if (!rpmh_rsc_ctrlr_is_idle(drv))
> >     return -EBUSY;
> >   return rpmh_flush(&drv->client);
> >
> > The rpmh_rsc_ctrlr_is_idle() grabs a spin lock implying that there
> > could be other people acting on RPMh at the same time (otherwise, why
> > do you even need locks?).  ...but when it returns the lock is
> > released.  Once the lock is dropped then other clients are free to
> > start using RPMH because nothing prevents them.  ...then you go ahead
> > and start flushing.
> >
> > Said another way: due to the way you've structured locking in that
> > patch rpmh_rsc_ctrlr_is_idle() is inherently dangerous because it
> > returns an instantaneous state that may well have changed between the
> > spin_unlock_irqrestore() at the end of the function and when the
> > function returns.
> >
> > You could, of course, fix this by requiring that the caller hold the
> > 'drv->lock' for both the calls to rpmh_rsc_ctrlr_is_idle() and
> > rpmh_flush() (ignoring the fact the drv->lock is nominally part of
> > rpmh-rsc.c and not rpmh.c).  Now it would be safe from the problem I
> > described.  ...but now you get into a new problem.  If you ever hold
> > two locks you always need to make sure you grab them in the same order
> > any time you grab them both.  ...but tcs_write() we first grab a
> > tcs_lock and _then_ drv->lock.  That means the "fix" of holding
> > drv->lock for both the calls to rpmh_rsc_ctrlr_is_idle() and
> > rpmh_flush() won't work because rpmh_flush() will need to grab a
> > tcs_lock.  Possibly we could make this work by eliminating the "tcs
> > lock" and just having the one big "drv->lock" protect everything (or
> > introducing a new "super lock" making the other two meaningless).  It
> > would certainly be easier to reason about...
> Thanks Doug.
>
> Agree, a simple check won't help here.
>
> From above discussions, summarizing out 3 items that gets impacted when using rpmh_start/end_transaction().
>
> 1. rpmh_write_async() becomes of little use since drivers may need to wait for rpmh_flush() to finish
> if caches becomes dirty in between.

I think this is really just a problem if there are no dedicated ACTIVE
TCS.  I think rpmh_flush() is pretty quick normally because all it's
doing is writing to register space, not waiting for any transactions
to finish.  The reason it's bad if there are no dedicated ACTIVE TCS
is that now we have to block waiting for the active transaction to
finish.


> 2. It creates more pressure on WAKE TCS when there is no dedicated ACTIVE TCS. Transactions are delayed
> if rpmh_flush() is in progress holding the locks and new request comes in to send Active only data.
> 3. rpmh_rsc_ctrlr_is_idle() needs locking if ANY cpu can be calling this, this may require reordering of
> locks / increase the time for which locks are held during rpmh transactions. On downstream variant we don't
> have locking in this since in OSI, only last CPU is invoking it and it is the only one invoking this function.
>
> Given above impact this approach seem not so simple as i though of earlier. i have alternate solution which
> uses cpu_pm_notifications() and invokes rpmh_flush() for non-OSI targets. This approach should not impact
> above 3 items.

Grepping for "cpu_pm_notifications" finds nothing, but I think you
mean you're going to register for notifications with
register_pm_notifier().

OK.  I guess I'm a bit confused here, though.  Maybe you can help
clear up my understanding.  I thought that one of the things you were
trying to solve with all the "last man down" type solutions was to
handle when RPMH wanted to transition into its sleep mode without a
full system suspend.  I thought that the RPMH sleep mode ran sometimes
when all the CPUs were idle and we were pretty sure they were going to
be idle for a while.

If this whole time all you've needed is to run at suspend time then it
feels like we could have avoided a whole lot of complexity.  ...but
again, maybe I'm just misunderstanding.


> I will soon post out v14 with this, testing in progress.
>
> >
> > NOTE: the only way I'm able to reason about all the above things is
> > because I spent all the time to document what rpmh-rsc is doing and
> > what assumptions the various functions had [1].  It'd be great if that
> > could get a review.
> Sure.
> >
> >
> >>> This whole "no active TCS" is really quite a mess.  Given how broken
> >>> it seems to me it almost feels like we should remove "no active TCS"
> >>> from the driver for now and then re-add it in a later patch when we
> >>> can really validate everything.  I tried addressing this in my
> >>> rpmh-rsc cleanup series and every time I thought I had a good solution
> >>> I could find another way to break it.
> >>>
> >>> Do you actually have the "no active TCS" case working on the current
> >>> code, or does it only work on some downstream variant of the driver?
> >>>
> >>> It works fine on downstream variant. Some checks are still needed like above from v4
> >>>
> >>> since we do rpmh_flush() immediatly for dirty caches now.
> > OK.  So I take it you haven't tested the "zero active" case with the
> > upstream code?  In theory it should be easy to test, right?  Just hack
> > the driver to pretend there are zero active TCSs?
>
> No, it won't work out this way. if we want to test with zero active case, need to pick up [2].
>
> [2] also need follow up fixes to work. This change is also in my to do
> list to get merged. I will include a change in v14 series at the end, it can help test this series
> for zero active tcs as well.

I would just provide a pointer to it in the description.  If it was
already there and I missed it, then sorry.  :(


> Note that it doesn't have any dependency with this series and current series can get merged
> without [2].

Ah, this was a patch I wasn't aware of.  I haven't had time to go scan
for patches that weren't pointed in my direction.  I'll go review it
now.  When I briefly looked at trying to solve this problem myself I
seem to remember it being harder to get all the locking right / races
fixed, so I'm a little surprised that patch is so short...  Maybe I
was overthinking...


> > Which SoCs in specific need the zero active TCSs?  We are spending a
> > lot of time talking about this and reviewing the code with this in
> > mind.  It adds a lot of complexity to the driver.  If nothing under
> > active development needs it I think we should do ourselves a favor and
> > remove it for now, then add it back later.  Otherwise this whole
> > process is just going to take a lot more time.
> >
> There are multiple SoCs having zero active TCSes in downstream code. So we can not remove it.
>
> As i said above we need [2] plus some fixes to have zero active TCS working fine on upstream driver.

If you have it working then no need to remove it.  ...but without that
patch it was clearly not working and it was adding a lot of complexity
to handle it.  In fact, this flushing patch series would have likely
been easy to get finalized / landed if we hadn't needed to deal with
the zero active TCS case.  It still feels like an option to say that
the "zero active TCS" case is only supported when you have OSI mode
unless you know of instances where we need that.


Hrm, I see you just posted v14 while I was writing this.  I guess I'll
go check that out now.  Maybe it will answer some of the questions I
had.


-Doug
