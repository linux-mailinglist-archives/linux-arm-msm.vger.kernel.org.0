Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D44017B159
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 23:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgCEWW3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 17:22:29 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44755 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbgCEWW3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 17:22:29 -0500
Received: by mail-vs1-f66.google.com with SMTP id u24so258643vso.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 14:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PEWESvvWwpim3ir+IdcWqEyheUQ9bGdHqQ7W44KO964=;
        b=LyepxGFC82FfUE+1J2lVQWWyuqVVp2z5tVSjuhGBRsTtHVafF7bDmh0fL2MZHw4exc
         H+AtuxARcuXS/r4EyKg9tRrldm+tMXz0v1TGYiOQpfBmskWwJlaxzCw6PH50usJBcGjM
         z9jC9FKpN4it0S+uzDbSHvQl+RDS3bOOD1n78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PEWESvvWwpim3ir+IdcWqEyheUQ9bGdHqQ7W44KO964=;
        b=sppHh1RMZwfq9zfFWPeRvkCx8QmepFg9X+UQE/eXBAHPLDeqImvS9K/hgo9cYk8LqM
         ly7d44f4eJn9ozxf7pm7nNGhuWhU3pa4SG6mx7/6D+XcNwc0P8q+l5zK1nqblPoGG2w8
         j5e7oLGD2AD219q5HTK+3RpDJyQ8IBgWYYyvagpiTxYuMWUH8dbrSbVfTqQZukvs33d5
         kW5ETMdKsB605cf2ID3mgMvIdCyf+UZMlofjcfem8tuXCt0BSckLO+WttW1qiezbcHe5
         Exn08IcpeKueJlNosF2HS7sd8dil5UwVkSwLw10rqrx1JMGnGcCVXp5cvB+MDsNHnkaU
         5IWg==
X-Gm-Message-State: ANhLgQ2j0mWK69IgLSxigw3HYZM1IjAeSMhSibCm+8HG66WTWnxBU98G
        04KVrqLhZ5HqXBn47k4u+R6KZyeUBxg=
X-Google-Smtp-Source: ADFU+vtZi9EdAGJdJgWCxpIDgGMkLEauzJFZ51txLjVjN2KmNTJtIDn3BIubHwZUYPrguWwiOUwHIg==
X-Received: by 2002:a67:c30d:: with SMTP id r13mr418150vsj.12.1583446947929;
        Thu, 05 Mar 2020 14:22:27 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id n196sm7192695vkn.27.2020.03.05.14.22.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2020 14:22:27 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id x194so256033vsc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 14:22:27 -0800 (PST)
X-Received: by 2002:a67:e98e:: with SMTP id b14mr408848vso.106.1583446946520;
 Thu, 05 Mar 2020 14:22:26 -0800 (PST)
MIME-Version: 1.0
References: <1583238415-18686-1-git-send-email-mkshah@codeaurora.org>
 <1583238415-18686-3-git-send-email-mkshah@codeaurora.org> <CAD=FV=VOARbQzY_p-SyDFu0mzFROp8nV9E=sraNrykWiySwEpw@mail.gmail.com>
 <8e307595-7758-6eb5-ab2d-73ab1ac1029c@codeaurora.org>
In-Reply-To: <8e307595-7758-6eb5-ab2d-73ab1ac1029c@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 5 Mar 2020 14:22:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VzNnRdDN5uPYskJ6kQHq2bAi2ysEqt0=taagdd_qZb-g@mail.gmail.com>
Message-ID: <CAD=FV=VzNnRdDN5uPYskJ6kQHq2bAi2ysEqt0=taagdd_qZb-g@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] soc: qcom: rpmh: Update dirty flag only when data changes
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

On Thu, Mar 5, 2020 at 3:10 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> > To summarize:
> >
> > a) If the only allowable use of "WAKE_ONLY" is to undo "SLEEP_ONLY"
> > then we should re-think the API and stop letting callers to
> > rpmh_write(), rpmh_write_async(), or rpmh_write_batch() ever specify
> > "WAKE_ONLY".  The code should just assume that "wake_only =3D
> > active_only if (active_only !=3D sleep_only)".  In other words, RPMH
> > should programmatically figure out the "wake" state based on the
> > sleep/active state and not force callers to do this.
> >
> > b) If "WAKE_ONLY" is allowed to do other things (or if it's not RPMH's
> > job to enforce/assume this) then we should fully skip calling
> > cache_rpm_request() for RPMH_ACTIVE_ONLY_STATE.
> >
> >
> > NOTE: this discussion also makes me wonder about the is_req_valid()
> > function.  That will skip sending a sleep/wake entry if the sleep and
> > wake entries are equal to each other.  ...but if sleep and wake are
> > both different than "active" it'll be a problem.
>
> Hi Doug,
>
> To answer above points, yes in general it=E2=80=99s the understanding tha=
t wake is
> almost always need to be equal to active. However, there can be valid rea=
sons
> for which the callers are enforced to call them differently in the first =
place.
>
> At present caller send 3 types of request.
> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=3D0x10, data=3D0x99);
> rpmh_write(RPMH_SLEEP_STATE, addr=3D0x10, data=3D0x0);
> rpmh_write(RPMH_WAKE_ONLY_STATE, addr=3D0x10, data=3D0x99);
>
> Now, Lets assume we handle this in rpmh driver since wake=3Dactive and th=
e caller
> send only 2 type of request (lets call it active and sleep, since we have=
 assumption
> of wake=3Dactive, and we don=E2=80=99t want 3rd request as its handled in=
 rpmh driver)
> So callers will now invoke 2 types of request.
>
> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=3D0x10, data=3D0x99);
> rpmh_write(RPMH_SLEEP_STATE, addr=3D0x10, data=3D0x0);
>
> with first type request, it now needs to serve 2 purpose
> (a)    cache ACTIVE request votes as WAKE votes
> (b)    trigger it out immediately (in ACTIVE TCS) as it need to be also c=
omplete immediately.
>
> For SLEEP, nothing changes. Now when entering to sleep we do rpmh_flush()=
 to program all
> WAKE and SLEEP request=E2=80=A6so far so good=E2=80=A6
>
> Now consider a corner case,
>
> There is something called a solver mode in RSC where HW could be in auton=
omous mode executing
> low power modes. For this it may want to =E2=80=9Conly=E2=80=9D program W=
AKE and SLEEP votes and then controller
> would be in solver mode entering and exiting sleep autonomously.
>
> There is no ACTIVE set request and hence no requirement to send it right =
away as ACTIVE vote.
>
> If we have only 2 type of request, caller again need to differentiate to =
tell rpmh driver that
> when it invoke
>
> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=3D0x10, data=3D0x99);
>
> with this caching it as WAKE is fine  ((a) in above) but do not trigger i=
t ((b) in above)
>
> so we need to again modify this API and pass another argument saying whet=
her to do (a + b) or only (a).
> but caller can already differentiate by using RPMH_ACTIVE_ONLY_STATE or R=
PMH_WAKE_ONLY_STATE.
>
> i think at least for now, leave it as it is, unless we really see any imp=
act by caller invoking all
> 3 types of request and take in account all such corner cases before i mak=
e any such change.
> we can take it separate if needed along with optimization pointed in v9 s=
eries discussions.

I totally don't understand what solver mode is for and when it's used,
but I'm willing to set that aside for now I guess.  From looking at
what you did for v12 it looks like the way you're expecting things to
function is this:

* ACTIVE: set wake state and trigger active change right away.

* SLEEP: set only sleep state

* WAKE: set only wake state, will take effect after next sleep/wake
unless changed again before that happens.


...I'll look at the code with this understanding, now.  Presumably also:

* We should document this.

* If we see clients that are explicitly setting _both_ active and wake
to the same thing then we can change the clients.  That means the only
people using "WAKE" mode would be those clients that explicitly want
the deferred action (presumably those using "solver" mode).

Do those seem correct?


If that's correct, I guess one subtle corner-case bug in
is_req_valid().  Specifically if it's ever valid to do this:

rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=3D0x10, data=3D0x99);
rpmh_write(RPMH_SLEEP_STATE, addr=3D0x10, data=3D0x0);
rpmh_write(RPMH_WAKE_ONLY_STATE, addr=3D0x10, data=3D0x0);

...then it won't work.  You'll transition between sleep/wake and stay
with "data=3D0x99".  Since "sleep =3D=3D wake" then is_req_valid() will
return "false" and we won't bother programming the commands for
sleep/wake.  One simple way to solve this is remove the
"req->sleep_val !=3D req->wake_val" optimization in is_req_valid().


I guess we should also document that "batch" doesn't work like this.
The "batch" API is really designed around having exactly one "batch"
caller (the interconnect code) and we assume that the batch code will
be sending us pre-optimized commands I guess?  Specifically there
doesn't seem to be anything trying to catch batch writes to "active"
and also applying them to "wake".


-Doug
