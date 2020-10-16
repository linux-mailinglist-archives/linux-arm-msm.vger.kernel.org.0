Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780472909AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 18:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410223AbgJPQ17 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 12:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410170AbgJPQ17 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 12:27:59 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6535EC061755;
        Fri, 16 Oct 2020 09:27:59 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id e23so3008905wme.2;
        Fri, 16 Oct 2020 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bqJ6cpltxwTnwsq73+OiYN2xGD/f9B9jRfFp1KGt6UI=;
        b=Y2tNPKnZr9fQO44h1cf+zQwHseoJrlW7gutss3ya6S9zTcZVNFe1A3jBJz0DL/NKAW
         IwQ/eYvhMEpG+HN6JSwQPt2h6OQbl1EhwXtDcevEfWPXt1S9yqoyYZqbAOmUL5XS0YqN
         c9nvOb6gNCercA4CplsvjKjbB9DKR/Qud70ykPYWNYBj4ElvrSMDDDeP6EG9ODUB5g7Q
         tIvSGn82DN2eBAuV/W0YhWTB0x8N7hiasPDprZyMqtHK6Rk++3NFq77R5uRNQ5xnlap4
         YNvOMxXP+f3xISx4GGrrvTn4wFnRDeFL+NnO/StBmcnd/WVPxLNIYQ8PPKfzWlBn2qEx
         Md7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bqJ6cpltxwTnwsq73+OiYN2xGD/f9B9jRfFp1KGt6UI=;
        b=Q2qMLQzc4FiaNz2hX3eH14c3yPOtBaibZUQ7xxo3D8tCCAdQVfHq6iVqCZFjQ+OKjg
         /eAZ1Sdc13Otvd/ysRgyuaP5ZaB0l2RFaA0T7dMZZOTC2INkIHmzkJ4e1mFMnfLg60Py
         ug64s1kM8PjddAyW/0+LSJLHkYXQBZOHWlcTraF5TQzzQyI4erSUbcFyl2zzVfrPf2Oc
         jo6YnRXU/MZoCvscEro8OPUUBdt53aRGdC5l/NEM7rABbq50RSX9F4hEZmghgDMFwXlf
         OjedGNVK8ZpISwFzPqn/bbfVNNSRwQIEHnlsM9gzXlUjcpULrzW6mWpvGK10OCTWcTH+
         Wgkw==
X-Gm-Message-State: AOAM530gahj8l0InVC7D1OtVpjo8DvFEoYpMmnCVAst6frdhHtpepCqG
        nwVAklcW94lJt6BzN3Aa4n2QlG3CERUfpYMsucs=
X-Google-Smtp-Source: ABdhPJzJkPFecDBFsY79AfS2LNDY9p2gH7e8Xe9V7Yf7RlJcRPY0jEwBFQKXrWPTceBBoRFfTmHrlcNLIvxb4Fo1X5Y=
X-Received: by 2002:a1c:6488:: with SMTP id y130mr4493560wmb.94.1602865672712;
 Fri, 16 Oct 2020 09:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211723.3028059-1-robdclark@gmail.com> <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
 <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
 <CAKMK7uEd853irzdBMCcaNEMAeOZKVFcFpgNtcYrgQkmHxdT3-w@mail.gmail.com>
 <20201002105256.GA6112@intel.com> <20201002110544.GB6112@intel.com>
 <CAF6AEGv+UnZJoBj_ELRVr4sQeMs52vAgyw2g+wtabLPBrYDKvw@mail.gmail.com>
 <20201005121524.GI6112@intel.com> <CAF6AEGtgTb-1YQpL4CV2A=CQxkSxjn-FxDybrzSitTDSmCY_GA@mail.gmail.com>
 <20201008082411.GE6112@intel.com>
In-Reply-To: <20201008082411.GE6112@intel.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 16 Oct 2020 09:27:39 -0700
Message-ID: <CAF6AEGvC+t8RvFRrpWaZGNMNMyz8oY0Y3LzGANHJ-SeDYoXw7Q@mail.gmail.com>
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

On Thu, Oct 8, 2020 at 1:24 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Oct 07, 2020 at 09:44:09AM -0700, Rob Clark wrote:
> > On Mon, Oct 5, 2020 at 5:15 AM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Fri, Oct 02, 2020 at 10:55:52AM -0700, Rob Clark wrote:
> > > > On Fri, Oct 2, 2020 at 4:05 AM Ville Syrj=C3=A4l=C3=A4
> > > > <ville.syrjala@linux.intel.com> wrote:
> > > > >
> > > > > On Fri, Oct 02, 2020 at 01:52:56PM +0300, Ville Syrj=C3=A4l=C3=A4=
 wrote:
> > > > > > On Thu, Oct 01, 2020 at 05:25:55PM +0200, Daniel Vetter wrote:
> > > > > > > On Thu, Oct 1, 2020 at 5:15 PM Rob Clark <robdclark@gmail.com=
> wrote:
> > > > > > > >
> > > > > > > > I'm leaning towards converting the other drivers over to us=
e the
> > > > > > > > per-crtc kwork, and then dropping the 'commit_work` from at=
omic state.
> > > > > > > > I can add a patch to that, but figured I could postpone tha=
t churn
> > > > > > > > until there is some by-in on this whole idea.
> > > > > > >
> > > > > > > i915 has its own commit code, it's not even using the current=
 commit
> > > > > > > helpers (nor the commit_work). Not sure how much other fun th=
ere is.
> > > > > >
> > > > > > I don't think we want per-crtc threads for this in i915. Seems
> > > > > > to me easier to guarantee atomicity across multiple crtcs if
> > > > > > we just commit them from the same thread.
> > > > >
> > > > > Oh, and we may have to commit things in a very specific order
> > > > > to guarantee the hw doesn't fall over, so yeah definitely per-crt=
c
> > > > > thread is a no go.
> > > >
> > > > If I'm understanding the i915 code, this is only the case for modes=
et
> > > > commits?  I suppose we could achieve the same result by just decidi=
ng
> > > > to pick the kthread of the first CRTC for modeset commits.  I'm not
> > > > really so much concerned about parallelism for modeset.
> > >
> > > I'm not entirely happy about the random differences between modesets
> > > and other commits. Ideally we wouldn't need any.
> > >
> > > Anyways, even if we ignore modesets we still have the issue with
> > > atomicity guarantees across multiple crtcs. So I think we still
> > > don't want per-crtc threads, rather it should be thread for each
> > > commit.
> >
> > I don't really see any other way to solve the priority inversion other
> > than per-CRTC kthreads.
>
> What's the problem with just something like a dedicated commit
> thread pool?

partly, I was trying to avoid re-implementing workqueue.  And partly
the thread-pool approach seems like it would be harder for userspace
to find the tasks which need priority adjustment.

But each CRTC is essentially a FIFO, pageflip N+1 on a given CRTC will
happen after pageflip N.

BR,
-R

> > I've been thinking about it a bit more, and
> > my conclusion is:
> >
> > (1) There isn't really any use for the N+1'th commit to start running
> > before the kthread_work for the N'th commit completes, so I don't mind
> > losing the unbound aspect of the workqueue approach
> > (2) For cases where there does need to be serialization between
> > commits on different CRTCs, since there is a per-CRTC kthread, you
> > could achieve this with locking
> >
> > Since i915 isn't using the atomic helpers here, I suppose it is an
> > option for i915 to just continue doing what it is doing.
> >
> > And I could ofc just stop using the atomic commit helper and do the
> > kthreads thing in msm. But my first preference would be that the
> > commit helper does generally the right thing.
> >
> > BR,
> > -R
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
