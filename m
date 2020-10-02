Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD9D2810EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 13:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387748AbgJBLF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 07:05:56 -0400
Received: from mga02.intel.com ([134.134.136.20]:46925 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbgJBLFu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 07:05:50 -0400
IronPort-SDR: vSJx8f92fhTWlIEHqmLC9+6yks/cWVFVY7GkSxACCAfV1o5yEREUAwHvDYhde+KLHjkoHJ6bvN
 /e9GFbeQh1tw==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="150597608"
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; 
   d="scan'208";a="150597608"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 04:05:50 -0700
IronPort-SDR: QxNZ2X+JL+y0DoAQRWUbBFRyiidnIV2PWCnd36xj8LCNCcIwk1QTSzujYdAY3hmkdypBK6bMIa
 e+bKX4WRG1gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; 
   d="scan'208";a="313473301"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga006.jf.intel.com with SMTP; 02 Oct 2020 04:05:43 -0700
Received: by stinkbox (sSMTP sendmail emulation); Fri, 02 Oct 2020 14:05:44 +0300
Date:   Fri, 2 Oct 2020 14:05:44 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tejun Heo <tj@kernel.org>, Qais Yousef <qais.yousef@arm.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201002110544.GB6112@intel.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
 <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
 <CAKMK7uEd853irzdBMCcaNEMAeOZKVFcFpgNtcYrgQkmHxdT3-w@mail.gmail.com>
 <20201002105256.GA6112@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201002105256.GA6112@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 02, 2020 at 01:52:56PM +0300, Ville Syrjälä wrote:
> On Thu, Oct 01, 2020 at 05:25:55PM +0200, Daniel Vetter wrote:
> > On Thu, Oct 1, 2020 at 5:15 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Thu, Oct 1, 2020 at 12:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Wed, Sep 30, 2020 at 11:16 PM Rob Clark <robdclark@gmail.com> wrote:
> > > > >
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > The android userspace treats the display pipeline as a realtime problem.
> > > > > And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> > > > > it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> > > > > that I found.)
> > > > >
> > > > > But this presents a problem with using workqueues for non-blocking
> > > > > atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> > > > > preempt the worker.  Which is not really the outcome you want.. once
> > > > > the required fences are scheduled, you want to push the atomic commit
> > > > > down to hw ASAP.
> > > > >
> > > > > But the decision of whether commit_work should be RT or not really
> > > > > depends on what userspace is doing.  For a pure CFS userspace display
> > > > > pipeline, commit_work() should remain SCHED_NORMAL.
> > > > >
> > > > > To handle this, convert non-blocking commit_work() to use per-CRTC
> > > > > kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> > > > > used to avoid serializing commits when userspace is using a per-CRTC
> > > > > update loop.  And the last patch exposes the task id to userspace as
> > > > > a CRTC property, so that userspace can adjust the priority and sched
> > > > > policy to fit it's needs.
> > > > >
> > > > >
> > > > > v2: Drop client cap and in-kernel setting of priority/policy in
> > > > >     favor of exposing the kworker tid to userspace so that user-
> > > > >     space can set priority/policy.
> > > >
> > > > Yeah I think this looks more reasonable. Still a bit irky interface,
> > > > so I'd like to get some kworker/rt ack on this. Other opens:
> > > > - needs userspace, the usual drill
> > >
> > > fwiw, right now the userspace is "modetest + chrt".. *probably* the
> > > userspace will become a standalone helper or daemon, mostly because
> > > the chrome gpu-process sandbox does not allow setting SCHED_FIFO.  I'm
> > > still entertaining the possibility of switching between rt and cfs
> > > depending on what is in the foreground (ie. only do rt for android
> > > apps).
> > >
> > > > - we need this also for vblank workers, otherwise this wont work for
> > > > drivers needing those because of another priority inversion.
> > >
> > > I have a thought on that, see below..
> > 
> > Hm, not seeing anything about vblank worker below?
> > 
> > > > - we probably want some indication of whether this actually does
> > > > something useful, not all drivers use atomic commit helpers. Not sure
> > > > how to do that.
> > >
> > > I'm leaning towards converting the other drivers over to use the
> > > per-crtc kwork, and then dropping the 'commit_work` from atomic state.
> > > I can add a patch to that, but figured I could postpone that churn
> > > until there is some by-in on this whole idea.
> > 
> > i915 has its own commit code, it's not even using the current commit
> > helpers (nor the commit_work). Not sure how much other fun there is.
> 
> I don't think we want per-crtc threads for this in i915. Seems
> to me easier to guarantee atomicity across multiple crtcs if
> we just commit them from the same thread.

Oh, and we may have to commit things in a very specific order
to guarantee the hw doesn't fall over, so yeah definitely per-crtc
thread is a no go.

I don't even understand the serialization argument. If the commits
are truly independent then why isn't the unbound wq enough to avoid
the serialization? It should just spin up a new thread for each commit
no?

-- 
Ville Syrjälä
Intel
