Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A08E281A41
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 19:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388198AbgJBR4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 13:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbgJBR4G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 13:56:06 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133D1C0613D0;
        Fri,  2 Oct 2020 10:56:06 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c18so2710449wrm.9;
        Fri, 02 Oct 2020 10:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sDykvbK2l7LUktA/NiMrsHi3eOeHsUBTt6WtvcVHsDY=;
        b=N09JTUu/Nt/0qMN2ji4tbfluL0VPw+AisuR7aO/LSn6OudL9k7y+z5Y/nB/RjjcCXG
         xwmY3Ap7gvJRtWu3GpC4ma9lEaakLD9ibRJBaT7WBPhKtMfLuaLzLZyCdPCmjBQ1Udlq
         WbYcPkJt206ljql2riZk5u/u3cPmGMur/9jqHbST9PwMjpOKyBC1Q8edydLHHPFo2DGA
         Z8cw2OuGUjGpYFjiCLmMzSPDLQTUGJ7aekyUPYPQiiSHqXRtwDaKRQLG+k/s6xWkS1IQ
         eWp7NsTFey2DvsYd2Y+eATr+usG3hdjY938vQxlgBoe2ez98J517TkLFuSxok/jPT3qC
         FBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sDykvbK2l7LUktA/NiMrsHi3eOeHsUBTt6WtvcVHsDY=;
        b=GjP1+iHLHgd0VnFLGuFkbkqO1GEpKSnOZ7N8GjAje/4nzAolRMVxVzBTgLSDRjkJ03
         +kX9Q11/U5XbAB1RxMbyx8WDs6AOX9Exo4KTRY1ntA5fySnWz3yjBICXqEGcRz7bYTCM
         ATQqY+XI/2l9OK6SAqNuRx/Gd9Fl2/4mW+0pOcyAalzAuk2prE4mP0jA9br3fyr54STp
         Ombh5GnlbnVaoawkSV/7FAWm/Wp6n7oU6JQi+/1RLQcTnfIceYi/QPX4F1msYNswm/Dz
         mXI/CZtBnzf0CzqnuG0w7sv6leDzonXM8TNi6Yjdk5zWR+fVBnIlLUJsY1plptejDL+8
         l3dg==
X-Gm-Message-State: AOAM533nLOD0NY8gNzZs9LzTiF4YFR1nEMdPrlOoH1B0AiARGEBYtWWf
        Y4HwUce0cBMFy/RPLpw3sGMVbwG7pugzfOMYgG4=
X-Google-Smtp-Source: ABdhPJyqabUahTC2c5mExHpmCMP/sNSLrS9tVQAZfc0UEeGsTQko60PRoh5s/bXkHSz9NQFWOqyqC7RU2RS3SuTsaCA=
X-Received: by 2002:a5d:4a0c:: with SMTP id m12mr4380696wrq.83.1601661364614;
 Fri, 02 Oct 2020 10:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211723.3028059-1-robdclark@gmail.com> <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
 <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
 <CAKMK7uEd853irzdBMCcaNEMAeOZKVFcFpgNtcYrgQkmHxdT3-w@mail.gmail.com>
 <20201002105256.GA6112@intel.com> <20201002110544.GB6112@intel.com>
In-Reply-To: <20201002110544.GB6112@intel.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 2 Oct 2020 10:55:52 -0700
Message-ID: <CAF6AEGv+UnZJoBj_ELRVr4sQeMs52vAgyw2g+wtabLPBrYDKvw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
To:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tejun Heo <tj@kernel.org>, Qais Yousef <qais.yousef@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 2, 2020 at 4:05 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Oct 02, 2020 at 01:52:56PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Thu, Oct 01, 2020 at 05:25:55PM +0200, Daniel Vetter wrote:
> > > On Thu, Oct 1, 2020 at 5:15 PM Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Thu, Oct 1, 2020 at 12:25 AM Daniel Vetter <daniel@ffwll.ch> wro=
te:
> > > > >
> > > > > On Wed, Sep 30, 2020 at 11:16 PM Rob Clark <robdclark@gmail.com> =
wrote:
> > > > > >
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > The android userspace treats the display pipeline as a realtime=
 problem.
> > > > > > And arguably, if your goal is to not miss frame deadlines (ie. =
vblank),
> > > > > > it is.  (See https://lwn.net/Articles/809545/ for the best expl=
aination
> > > > > > that I found.)
> > > > > >
> > > > > > But this presents a problem with using workqueues for non-block=
ing
> > > > > > atomic commit_work(), because the SCHED_FIFO userspace thread(s=
) can
> > > > > > preempt the worker.  Which is not really the outcome you want..=
 once
> > > > > > the required fences are scheduled, you want to push the atomic =
commit
> > > > > > down to hw ASAP.
> > > > > >
> > > > > > But the decision of whether commit_work should be RT or not rea=
lly
> > > > > > depends on what userspace is doing.  For a pure CFS userspace d=
isplay
> > > > > > pipeline, commit_work() should remain SCHED_NORMAL.
> > > > > >
> > > > > > To handle this, convert non-blocking commit_work() to use per-C=
RTC
> > > > > > kthread workers, instead of system_unbound_wq.  Per-CRTC worker=
s are
> > > > > > used to avoid serializing commits when userspace is using a per=
-CRTC
> > > > > > update loop.  And the last patch exposes the task id to userspa=
ce as
> > > > > > a CRTC property, so that userspace can adjust the priority and =
sched
> > > > > > policy to fit it's needs.
> > > > > >
> > > > > >
> > > > > > v2: Drop client cap and in-kernel setting of priority/policy in
> > > > > >     favor of exposing the kworker tid to userspace so that user=
-
> > > > > >     space can set priority/policy.
> > > > >
> > > > > Yeah I think this looks more reasonable. Still a bit irky interfa=
ce,
> > > > > so I'd like to get some kworker/rt ack on this. Other opens:
> > > > > - needs userspace, the usual drill
> > > >
> > > > fwiw, right now the userspace is "modetest + chrt".. *probably* the
> > > > userspace will become a standalone helper or daemon, mostly because
> > > > the chrome gpu-process sandbox does not allow setting SCHED_FIFO.  =
I'm
> > > > still entertaining the possibility of switching between rt and cfs
> > > > depending on what is in the foreground (ie. only do rt for android
> > > > apps).
> > > >
> > > > > - we need this also for vblank workers, otherwise this wont work =
for
> > > > > drivers needing those because of another priority inversion.
> > > >
> > > > I have a thought on that, see below..
> > >
> > > Hm, not seeing anything about vblank worker below?
> > >
> > > > > - we probably want some indication of whether this actually does
> > > > > something useful, not all drivers use atomic commit helpers. Not =
sure
> > > > > how to do that.
> > > >
> > > > I'm leaning towards converting the other drivers over to use the
> > > > per-crtc kwork, and then dropping the 'commit_work` from atomic sta=
te.
> > > > I can add a patch to that, but figured I could postpone that churn
> > > > until there is some by-in on this whole idea.
> > >
> > > i915 has its own commit code, it's not even using the current commit
> > > helpers (nor the commit_work). Not sure how much other fun there is.
> >
> > I don't think we want per-crtc threads for this in i915. Seems
> > to me easier to guarantee atomicity across multiple crtcs if
> > we just commit them from the same thread.
>
> Oh, and we may have to commit things in a very specific order
> to guarantee the hw doesn't fall over, so yeah definitely per-crtc
> thread is a no go.

If I'm understanding the i915 code, this is only the case for modeset
commits?  I suppose we could achieve the same result by just deciding
to pick the kthread of the first CRTC for modeset commits.  I'm not
really so much concerned about parallelism for modeset.

> I don't even understand the serialization argument. If the commits
> are truly independent then why isn't the unbound wq enough to avoid
> the serialization? It should just spin up a new thread for each commit
> no?

The problem with wq is prioritization and SCHED_FIFO userspace
components stomping on the feet of commit_work.  That is the entire
motivation of this series in the first place, so no we cannot use
unbound wq.

BR,
-R
