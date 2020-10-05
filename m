Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695F02842B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 00:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgJEW6Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 18:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgJEW6Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 18:58:24 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E58EC0613CE;
        Mon,  5 Oct 2020 15:58:24 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 13so1068869wmf.0;
        Mon, 05 Oct 2020 15:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PmVPJacZ2iGQwEIFvM5bhYtTbtltGyPpBhaCiI2XPz8=;
        b=sDjr34j/jNQTjPP9l7fqx/XHG8hJBhV5pxOMtV0y18U9ZsnAL/JpQo8VELCWJYKLvp
         y6WMLkrxDT2NKUi4JZTEWn3zo/AGNdke8tqar6hYaG1xzDUEhZqRHYbOCcR1CMPrl/mx
         BbY48z7lk0qXqsTNbLudXt4+7F8hN1dbS1mbZp8jETPExmDLf2V00GvUuhyQKpSNCFuQ
         8NY4OkMm/+3dK4fV+O0Zkehn0IbPuBResmDSx010RFk/HVjvR6CSPa6tpTYHMHvCRTpj
         aH3VdN9RTCDVS58QD3kmudOKx79QTHlbVc+gxlBbjjk7TXRz3aJajVGa4Ho+yuIFMPjZ
         RWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PmVPJacZ2iGQwEIFvM5bhYtTbtltGyPpBhaCiI2XPz8=;
        b=Fwr4zRPgBWzukImbxspX8w8izKOcFaEGdmUQPpqGW04lRCAQOojxEQamB3NCQm5fsy
         FnRJsIVG2AgKZBcIog/QwUju9yf40iVgYZC6Vqlu8rD4BN60qA67Q6+SXmE8ct27lk+V
         q6gCuuW+wONjj8zolvDxpeOzsU6YfpRvqdrC5v2eV7l5Wgh4PohX+gumvEM9a1KmMSQj
         9fvsJlhdjM9gsyav95ftiWqL4g6Qo09EBV3q35XJLIAjEW8SaQZ9t7OVYZWAFon8dXJN
         kb5n4VwNXdJoe9P4FyKaamvMpCH1jRWX88pCtrelCoy3zuAzxC2Ne6GfGZl+h6qHaEmz
         vIbA==
X-Gm-Message-State: AOAM531NgHNboFw71KgFqF3fRVo51B1LnclYQtyVf2f9oyB4hzDKrJPx
        aCidkDbv4w7kbHYvSKo0y/qBKFxt+xit92dLWkc=
X-Google-Smtp-Source: ABdhPJwCotoj6478CF9jE/JNzm0S8z/Hl9PS4I1EbP1IPcr0ODeEED1bko+18kULnCg5D40w+v1pPuKyEML2vy7MGX0=
X-Received: by 2002:a1c:2486:: with SMTP id k128mr1518874wmk.164.1601938702691;
 Mon, 05 Oct 2020 15:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211723.3028059-1-robdclark@gmail.com> <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
 <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
 <CAKMK7uEd853irzdBMCcaNEMAeOZKVFcFpgNtcYrgQkmHxdT3-w@mail.gmail.com>
 <20201002105256.GA6112@intel.com> <20201002110544.GB6112@intel.com>
 <CAF6AEGv+UnZJoBj_ELRVr4sQeMs52vAgyw2g+wtabLPBrYDKvw@mail.gmail.com>
 <20201005121524.GI6112@intel.com> <20201005141515.GV438822@phenom.ffwll.local>
In-Reply-To: <20201005141515.GV438822@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 5 Oct 2020 15:58:10 -0700
Message-ID: <CAF6AEGvsEzsAQp6umSN5-mH3onuXDj+_uK=jrwHk7U95x0PeFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
To:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tejun Heo <tj@kernel.org>, Qais Yousef <qais.yousef@arm.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 5, 2020 at 7:15 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Oct 05, 2020 at 03:15:24PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Fri, Oct 02, 2020 at 10:55:52AM -0700, Rob Clark wrote:
> > > On Fri, Oct 2, 2020 at 4:05 AM Ville Syrj=C3=A4l=C3=A4
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Fri, Oct 02, 2020 at 01:52:56PM +0300, Ville Syrj=C3=A4l=C3=A4 w=
rote:
> > > > > On Thu, Oct 01, 2020 at 05:25:55PM +0200, Daniel Vetter wrote:
> > > > > > On Thu, Oct 1, 2020 at 5:15 PM Rob Clark <robdclark@gmail.com> =
wrote:
> > > > > > >
> > > > > > > On Thu, Oct 1, 2020 at 12:25 AM Daniel Vetter <daniel@ffwll.c=
h> wrote:
> > > > > > > >
> > > > > > > > On Wed, Sep 30, 2020 at 11:16 PM Rob Clark <robdclark@gmail=
.com> wrote:
> > > > > > > > >
> > > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > > >
> > > > > > > > > The android userspace treats the display pipeline as a re=
altime problem.
> > > > > > > > > And arguably, if your goal is to not miss frame deadlines=
 (ie. vblank),
> > > > > > > > > it is.  (See https://lwn.net/Articles/809545/ for the bes=
t explaination
> > > > > > > > > that I found.)
> > > > > > > > >
> > > > > > > > > But this presents a problem with using workqueues for non=
-blocking
> > > > > > > > > atomic commit_work(), because the SCHED_FIFO userspace th=
read(s) can
> > > > > > > > > preempt the worker.  Which is not really the outcome you =
want.. once
> > > > > > > > > the required fences are scheduled, you want to push the a=
tomic commit
> > > > > > > > > down to hw ASAP.
> > > > > > > > >
> > > > > > > > > But the decision of whether commit_work should be RT or n=
ot really
> > > > > > > > > depends on what userspace is doing.  For a pure CFS users=
pace display
> > > > > > > > > pipeline, commit_work() should remain SCHED_NORMAL.
> > > > > > > > >
> > > > > > > > > To handle this, convert non-blocking commit_work() to use=
 per-CRTC
> > > > > > > > > kthread workers, instead of system_unbound_wq.  Per-CRTC =
workers are
> > > > > > > > > used to avoid serializing commits when userspace is using=
 a per-CRTC
> > > > > > > > > update loop.  And the last patch exposes the task id to u=
serspace as
> > > > > > > > > a CRTC property, so that userspace can adjust the priorit=
y and sched
> > > > > > > > > policy to fit it's needs.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > v2: Drop client cap and in-kernel setting of priority/pol=
icy in
> > > > > > > > >     favor of exposing the kworker tid to userspace so tha=
t user-
> > > > > > > > >     space can set priority/policy.
> > > > > > > >
> > > > > > > > Yeah I think this looks more reasonable. Still a bit irky i=
nterface,
> > > > > > > > so I'd like to get some kworker/rt ack on this. Other opens=
:
> > > > > > > > - needs userspace, the usual drill
> > > > > > >
> > > > > > > fwiw, right now the userspace is "modetest + chrt".. *probabl=
y* the
> > > > > > > userspace will become a standalone helper or daemon, mostly b=
ecause
> > > > > > > the chrome gpu-process sandbox does not allow setting SCHED_F=
IFO.  I'm
> > > > > > > still entertaining the possibility of switching between rt an=
d cfs
> > > > > > > depending on what is in the foreground (ie. only do rt for an=
droid
> > > > > > > apps).
> > > > > > >
> > > > > > > > - we need this also for vblank workers, otherwise this wont=
 work for
> > > > > > > > drivers needing those because of another priority inversion=
.
> > > > > > >
> > > > > > > I have a thought on that, see below..
> > > > > >
> > > > > > Hm, not seeing anything about vblank worker below?
> > > > > >
> > > > > > > > - we probably want some indication of whether this actually=
 does
> > > > > > > > something useful, not all drivers use atomic commit helpers=
. Not sure
> > > > > > > > how to do that.
> > > > > > >
> > > > > > > I'm leaning towards converting the other drivers over to use =
the
> > > > > > > per-crtc kwork, and then dropping the 'commit_work` from atom=
ic state.
> > > > > > > I can add a patch to that, but figured I could postpone that =
churn
> > > > > > > until there is some by-in on this whole idea.
> > > > > >
> > > > > > i915 has its own commit code, it's not even using the current c=
ommit
> > > > > > helpers (nor the commit_work). Not sure how much other fun ther=
e is.
> > > > >
> > > > > I don't think we want per-crtc threads for this in i915. Seems
> > > > > to me easier to guarantee atomicity across multiple crtcs if
> > > > > we just commit them from the same thread.
> > > >
> > > > Oh, and we may have to commit things in a very specific order
> > > > to guarantee the hw doesn't fall over, so yeah definitely per-crtc
> > > > thread is a no go.
> > >
> > > If I'm understanding the i915 code, this is only the case for modeset
> > > commits?  I suppose we could achieve the same result by just deciding
> > > to pick the kthread of the first CRTC for modeset commits.  I'm not
> > > really so much concerned about parallelism for modeset.
> >
> > I'm not entirely happy about the random differences between modesets
> > and other commits. Ideally we wouldn't need any.
> >
> > Anyways, even if we ignore modesets we still have the issue with
> > atomicity guarantees across multiple crtcs. So I think we still
> > don't want per-crtc threads, rather it should be thread for each
> > commit.
> >
> > Well, if the crtcs aren't running in lockstep then maybe we could
> > shove them off to separate threads, but that'll just complicate things
> > needlessly I think since we'd need yet another way to iterate
> > the crtcs in each thread. With the thread-per-commit apporach we
> > can just use the normal atomic iterators.
> >
> > >
> > > > I don't even understand the serialization argument. If the commits
> > > > are truly independent then why isn't the unbound wq enough to avoid
> > > > the serialization? It should just spin up a new thread for each com=
mit
> > > > no?
> > >
> > > The problem with wq is prioritization and SCHED_FIFO userspace
> > > components stomping on the feet of commit_work. That is the entire
> > > motivation of this series in the first place, so no we cannot use
> > > unbound wq.
> >
> > This is a bit dejavu of the vblank worker discussion, where I actually
> > did want a per-crtc RT kthread but people weren't convinced they
> > actually help. The difference is that for vblank workers we actually
> > tried to get some numbers, here I've not seen any.
>
> The problem here is priority inversion, not latency: Android runs
> surface-flinger as SCHED_FIFO, so when surfaceflinger does something it
> can preempt the kernel's commit work, and we miss a frame. Apparently
> otherwise the soft-rt of just having a normal worker (with maybe elevated
> niceness) seems nice enough.

yes, exactly, this is about priority inversion.

Not sure if this is clear (you can't really fit all the relevant parts
of the trace in one screenshot), but here is an example of commit_work
preempted by SF EventThread and missing a deadline:

https://usercontent.irccloud-cdn.com/file/Awgp8Sdj/image.png

BR,
-R

>
> Aside: I just double-checked, and vblank work has a per-crtc kthread.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
