Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2750180239
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 16:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgCJPqj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 11:46:39 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:35173 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgCJPqj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 11:46:39 -0400
Received: by mail-ua1-f66.google.com with SMTP id y6so2942957ual.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 08:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8wrf2m7hJDfuF/vGS6wihINC7WIV4sn9O+/p6IYsXB4=;
        b=czU9hKTxIPR59ucftIhaxKyo8Y/1SH3UaybGchoYfJrblk6zJF01ph+m1+Ew05yZby
         z4l0WBzkSEA8MzNmi3XLHmFwEF8jqrPjA/hKHkuU1FOsPkbn/xPap9vKlHLTd+4lzG58
         o9NnUHVllPlgLeEzu1JR27/BOBQQx2cm/e8+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8wrf2m7hJDfuF/vGS6wihINC7WIV4sn9O+/p6IYsXB4=;
        b=MlHUwvphDNHiJ9184etoXY24xYLTpb3uedmdi1VueytCTDZ2eZSYq1DtO2bKBf/hYm
         f/+T0/Ec+kmN+BYlqf2hxFP06snHLMIJ7oNHOlh4uqTKzJtp6paKR+Z162/R227Jio+2
         7XYEZYoIZeTRYUuT3XpFx/eGcl90431inmq9MtJJeSWdY+EkJyeE/13EnOdRQ1f6HmKW
         Cst81Bhxq0oUNDW1ycsWtPtOnQmMU3pjA4M4yYIhp2q97489g2mJgqX9BDyI3e47uP2M
         07x4/m/dHXlTdiaIiV+z8UFsugT0z/uRaAgIaDfN3FCGSwc0uys+rfHDfGhqITK3cvA7
         HWLQ==
X-Gm-Message-State: ANhLgQ3nJCLK8AJ9mgg2+ocQGBrTj80tvWGlRmUrJJl2DW9R263UwMTf
        9GxOkuyDP+zZ147RTzjEM7F2xIJUxco=
X-Google-Smtp-Source: ADFU+vvSkFYSDiMg+nwFOyFj+jgplJRtbn0OL8hAydvQMot/3NUKZHaZcIWKhQBAVi2EQjaY1dWa2A==
X-Received: by 2002:a9f:3311:: with SMTP id o17mr12413497uab.30.1583855197537;
        Tue, 10 Mar 2020 08:46:37 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id v22sm272689vsa.2.2020.03.10.08.46.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 08:46:33 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id k26so8716137vso.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 08:46:33 -0700 (PDT)
X-Received: by 2002:a67:e98e:: with SMTP id b14mr14020534vso.106.1583855192743;
 Tue, 10 Mar 2020 08:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <1583238415-18686-1-git-send-email-mkshah@codeaurora.org>
 <1583238415-18686-3-git-send-email-mkshah@codeaurora.org> <CAD=FV=VOARbQzY_p-SyDFu0mzFROp8nV9E=sraNrykWiySwEpw@mail.gmail.com>
 <8e307595-7758-6eb5-ab2d-73ab1ac1029c@codeaurora.org> <CAD=FV=VzNnRdDN5uPYskJ6kQHq2bAi2ysEqt0=taagdd_qZb-g@mail.gmail.com>
 <26b17bf5-7aa0-5853-a1b5-b6f6496aea13@codeaurora.org>
In-Reply-To: <26b17bf5-7aa0-5853-a1b5-b6f6496aea13@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 10 Mar 2020 08:46:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UmhdXV20Kf2TtsADs3gi7i14pH6ATmoNexkCDBMH_bhA@mail.gmail.com>
Message-ID: <CAD=FV=UmhdXV20Kf2TtsADs3gi7i14pH6ATmoNexkCDBMH_bhA@mail.gmail.com>
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


On Tue, Mar 10, 2020 at 4:03 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
>
> On 3/6/2020 3:52 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Mar 5, 2020 at 3:10 AM Maulik Shah <mkshah@codeaurora.org> wrot=
e:
> >>> To summarize:
> >>>
> >>> a) If the only allowable use of "WAKE_ONLY" is to undo "SLEEP_ONLY"
> >>> then we should re-think the API and stop letting callers to
> >>> rpmh_write(), rpmh_write_async(), or rpmh_write_batch() ever specify
> >>> "WAKE_ONLY".  The code should just assume that "wake_only =3D
> >>> active_only if (active_only !=3D sleep_only)".  In other words, RPMH
> >>> should programmatically figure out the "wake" state based on the
> >>> sleep/active state and not force callers to do this.
> >>>
> >>> b) If "WAKE_ONLY" is allowed to do other things (or if it's not RPMH'=
s
> >>> job to enforce/assume this) then we should fully skip calling
> >>> cache_rpm_request() for RPMH_ACTIVE_ONLY_STATE.
> >>>
> >>>
> >>> NOTE: this discussion also makes me wonder about the is_req_valid()
> >>> function.  That will skip sending a sleep/wake entry if the sleep and
> >>> wake entries are equal to each other.  ...but if sleep and wake are
> >>> both different than "active" it'll be a problem.
> >> Hi Doug,
> >>
> >> To answer above points, yes in general it=E2=80=99s the understanding =
that wake is
> >> almost always need to be equal to active. However, there can be valid =
reasons
> >> for which the callers are enforced to call them differently in the fir=
st place.
> >>
> >> At present caller send 3 types of request.
> >> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=3D0x10, data=3D0x99);
> >> rpmh_write(RPMH_SLEEP_STATE, addr=3D0x10, data=3D0x0);
> >> rpmh_write(RPMH_WAKE_ONLY_STATE, addr=3D0x10, data=3D0x99);
> >>
> >> Now, Lets assume we handle this in rpmh driver since wake=3Dactive and=
 the caller
> >> send only 2 type of request (lets call it active and sleep, since we h=
ave assumption
> >> of wake=3Dactive, and we don=E2=80=99t want 3rd request as its handled=
 in rpmh driver)
> >> So callers will now invoke 2 types of request.
> >>
> >> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=3D0x10, data=3D0x99);
> >> rpmh_write(RPMH_SLEEP_STATE, addr=3D0x10, data=3D0x0);
> >>
> >> with first type request, it now needs to serve 2 purpose
> >> (a)    cache ACTIVE request votes as WAKE votes
> >> (b)    trigger it out immediately (in ACTIVE TCS) as it need to be als=
o complete immediately.
> >>
> >> For SLEEP, nothing changes. Now when entering to sleep we do rpmh_flus=
h() to program all
> >> WAKE and SLEEP request=E2=80=A6so far so good=E2=80=A6
> >>
> >> Now consider a corner case,
> >>
> >> There is something called a solver mode in RSC where HW could be in au=
tonomous mode executing
> >> low power modes. For this it may want to =E2=80=9Conly=E2=80=9D progra=
m WAKE and SLEEP votes and then controller
> >> would be in solver mode entering and exiting sleep autonomously.
> >>
> >> There is no ACTIVE set request and hence no requirement to send it rig=
ht away as ACTIVE vote.
> >>
> >> If we have only 2 type of request, caller again need to differentiate =
to tell rpmh driver that
> >> when it invoke
> >>
> >> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=3D0x10, data=3D0x99);
> >>
> >> with this caching it as WAKE is fine  ((a) in above) but do not trigge=
r it ((b) in above)
> >>
> >> so we need to again modify this API and pass another argument saying w=
hether to do (a + b) or only (a).
> >> but caller can already differentiate by using RPMH_ACTIVE_ONLY_STATE o=
r RPMH_WAKE_ONLY_STATE.
> >>
> >> i think at least for now, leave it as it is, unless we really see any =
impact by caller invoking all
> >> 3 types of request and take in account all such corner cases before i =
make any such change.
> >> we can take it separate if needed along with optimization pointed in v=
9 series discussions.
> > I totally don't understand what solver mode is for and when it's used,
> > but I'm willing to set that aside for now I guess.  From looking at
> > what you did for v12 it looks like the way you're expecting things to
> > function is this:
> >
> > * ACTIVE: set wake state and trigger active change right away.
> >
> > * SLEEP: set only sleep state
> >
> > * WAKE: set only wake state, will take effect after next sleep/wake
> > unless changed again before that happens.
> >
> >
> > ...I'll look at the code with this understanding, now.  Presumably also=
:
> >
> > * We should document this.
> Okay, i will document above.
> > * If we see clients that are explicitly setting _both_ active and wake
> > to the same thing then we can change the clients.  That means the only
> > people using "WAKE" mode would be those clients that explicitly want
> > the deferred action (presumably those using "solver" mode).
> >
> > Do those seem correct?
> Correct. but i suggest to change clients only once solver mode changes go=
 in.
> until then leave clients to call ACTIVE and WAKE request separately (even=
 with same data)

If you want to leave clients to call ACTIVE and WAKE requests
separately for now, then please change your patch ("soc: qcom: rpmh:
Update dirty flag only when data changes"), which (from v13) has this
in cache_rpm_request():

switch (state) {
  case RPMH_ACTIVE_ONLY_STATE:
  case RPMH_WAKE_ONLY_STATE:
    req->wake_val =3D cmd->data;

...that bit of code is what led me to request that you document that
setting the active-only state also sets the wake-only state, so either
change that code or add the documentation.


> > If that's correct, I guess one subtle corner-case bug in
> > is_req_valid().  Specifically if it's ever valid to do this:
> >
> > rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=3D0x10, data=3D0x99);
> > rpmh_write(RPMH_SLEEP_STATE, addr=3D0x10, data=3D0x0);
> > rpmh_write(RPMH_WAKE_ONLY_STATE, addr=3D0x10, data=3D0x0);
> This scenario will never hit in solver mode.
> when in solver, only WAKE and SLEEP requests are allowed to go through.

OK, I guess this stems from me not understanding solver mode.  I guess
for now it's unlikely to cause problems given the current usage, so we
can ignore for now.


> > ...then it won't work.
> will work out just fine, as said above.
> > You'll transition between sleep/wake and stay
> > with "data=3D0x99".  Since "sleep =3D=3D wake" then is_req_valid() will
> > return "false" and we won't bother programming the commands for
> > sleep/wake.  One simple way to solve this is remove the
> > "req->sleep_val !=3D req->wake_val" optimization in is_req_valid().
>
> This will still need to keep check.
>
> the clients may invoke with below example data...
>
> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=3D0x10, data=3D0x99);
> rpmh_write(RPMH_SLEEP_STATE, addr=3D0x10, data=3D0x99);
> rpmh_write(RPMH_WAKE_ONLY_STATE, addr=3D0x10, data=3D0x99); (we assume wa=
ke=3Dactive)
>
> while ACTIVE is immediatly sent, and resource already came to 0x99 level.
>
> Now while flushing, there is no point in programming in SLEEP TCS as such=
 when cmd triggers
> from SLEEP TCS then it won't make any real level transition since its alr=
eady brought up to
> 0x99 level with previous ACTIVE cmd. same reason goes for not programming=
 it in WAKE TCS.

"Need" is perhaps too strong of a word if I understand things.  The
example above would still work even if we didn't check "sleep =3D=3D wake"
it would just program an extra (but pointless) command.  Right?

...but I guess we can debate about it later.  For now I'm not aware of
anyone setting WAKE to something other than ACTIVE.


-Doug
