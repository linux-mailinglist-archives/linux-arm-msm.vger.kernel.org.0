Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F324C2838A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgJEPA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:00:29 -0400
Received: from foss.arm.com ([217.140.110.172]:49822 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726530AbgJEPA3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:00:29 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFE17113E;
        Mon,  5 Oct 2020 08:00:28 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com [10.1.195.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5771D3F70D;
        Mon,  5 Oct 2020 08:00:27 -0700 (PDT)
Date:   Mon, 5 Oct 2020 16:00:25 +0100
From:   Qais Yousef <qais.yousef@arm.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Tejun Heo <tj@kernel.org>, Tim Murray <timmurray@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201005150024.mchfdtd62rlkuh4s@e107158-lin.cambridge.arm.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
 <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+CC Steve and Peter - they might be interested.

On 10/02/20 11:07, Rob Clark wrote:
> On Fri, Oct 2, 2020 at 4:01 AM Qais Yousef <qais.yousef@arm.com> wrote:
> >
> > On 09/30/20 14:17, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The android userspace treats the display pipeline as a realtime problem.
> > > And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> > > it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> > > that I found.)
> > >
> > > But this presents a problem with using workqueues for non-blocking
> > > atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> > > preempt the worker.  Which is not really the outcome you want.. once
> > > the required fences are scheduled, you want to push the atomic commit
> > > down to hw ASAP.
> >
> > For me thees 2 properties
> >
> >         1. Run ASAP
> >         2. Finish the work un-interrupted
> >
> > Scream the workers need to be SCHED_FIFO by default. CFS can't give you these
> > guarantees.
> 
> fwiw, commit_work does sleep/block for some time until fences are
> signalled, but then once that happens we want it to run ASAP,
> preempting lower priority SCHED_FIFO.
> 
> >
> > IMO using sched_set_fifo() for these workers is the right thing.
> >
> 
> Possibly, but we still have limited prioritization options (ie. not
> enough) to set these from the kernel.  Giving userspace the control,
> so it can pick sensible priorities for commit_work and vblank_work,
> which fits in with the priorities of the other userspace threads seems
> like the sensible thing.

The problem is that the kernel can run on all types of systems. It's impossible
to pick one value that fits all. Userspace must manage these priorities, and
you can still export the TID to help with that.

But why do you need several priorities in your pipeline? I would have thought
it should execute each stage sequentially and all tasks running at the same RT
priority is fine.

On SMP priorities matter once you've overcomitted the systems. You need to have
more RT tasks running than CPUs for priorities to matter. It seems you have
a high count of RT tasks in your system?

I did some profiles on Android and found that being overcomitted is hard. But
that was a while ago.

> 
> > >
> > > But the decision of whether commit_work should be RT or not really
> > > depends on what userspace is doing.  For a pure CFS userspace display
> > > pipeline, commit_work() should remain SCHED_NORMAL.
> >
> > I'm not sure I agree with this. I think it's better to characterize tasks based
> > on their properties/requirements rather than what the rest of the userspace is
> > using.
> 
> I mean, the issue is that userspace is already using a few different
> rt priority levels for different SF threads.  We want commit_work to

Why are they at different priorities? Different priority levels means that some
of them have more urgent deadlines to meet and it's okay to steal execution
time from lower priority tasks. Is this the case?

RT planning and partitioning is not easy task for sure. You might want to
consider using affinities too to get stronger guarantees for some tasks and
prevent cross-talking.

> run ASAP once fences are signalled, and vblank_work to run at a
> slightly higher priority still.  But the correct choice for priorities
> here depends on what userspace is using, it all needs to fit together
> properly.

By userspace here I think you mean none display pipeline related RT tasks that
you need to coexit with and could still disrupt your pipeline?

Using RT on Gerneral Purpose System is hard for sure. One of the major
challenge is that there's no admin that has full view of the system to do
proper RT planning.

We need proper RT balancer daemon that helps partitioning the system for
multiple RT apps on these systems..

> 
> >
> > I do appreciate that maybe some of these tasks have varying requirements during
> > their life time. e.g: they have RT property during specific critical section
> > but otherwise are CFS tasks. I think the UI thread in Android behaves like
> > that.
> >
> > It's worth IMO trying that approach I pointed out earlier to see if making RT
> > try to pick an idle CPU rather than preempt CFS helps. Not sure if it'd be
> > accepted but IMHO it's a better direction to consider and discuss.
> 
> The problem I was seeing was actually the opposite..  commit_work
> becomes runnable (fences signalled) but doesn't get a chance to run
> because a SCHED_FIFO SF thread is running.  (Maybe I misunderstood and
> you're approach would help this case too?)

Ah okay. Sorry I got it the wrong way around for some reason. I thought this
task is preempting other CFS-based pipelined tasks.

So your system seems to be overcomitted. Is SF short for SufraceFlinger? Under
what scenarios do you have many SurfaceFlinger tasks? On Android I remember
seeing they have priority of 1 or 2.

sched_set_fifo() will use priority 50. If you set all your pipeline tasks
to this priority, what happens?

> 
> > Or maybe you can wrap userspace pipeline critical section lock such that any
> > task holding it will automatically be promoted to SCHED_FIFO and then demoted
> > to CFS once it releases it.
> 
> The SCHED_DEADLINE + token passing approach that the lwn article
> mentioned sounds interesting, if that eventually becomes possible.
> But doesn't really help today..

We were present in the room with Alessio when he gave that talk :-)

You might have seen Valentin's talk in LPC where he's trying to get
proxy-execution into shape. Which is a pre-requisite to enable using of
SCHED_DEADLINE for these scenarios. IIRC it should allow all dependent tasks to
run from the context of the deadline task during the display pipeline critical
section.

By the way, do you have issues with SoftIrqs delaying your RT tasks execution
time?

Thanks

--
Qais Yousef
