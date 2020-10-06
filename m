Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4672852DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 22:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgJFUEy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 16:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgJFUEy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 16:04:54 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF2DC061755;
        Tue,  6 Oct 2020 13:04:54 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g12so9414983wrp.10;
        Tue, 06 Oct 2020 13:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tRQODXhkyMhqAiuDJZNlm3kG1yqPZ4LhCnBerXa8fy0=;
        b=td8u0u1o74xCYga/sRU1+8vHTRNjSWwKN2PLZ90aKdgGqbCJ1hrq6btcIWp7yow+Xc
         CeIAgoVj0nFYVeb1EXO9pHuZQuJhr1uf2+DkNODPw3btErnMMOkJNGPoq38y1Fcvdfli
         JHzAP33DLHlyGK65pmfkbgXg8o+USgzJShbel+je1NsEcmgGGm6yA41xq1d1jeB1X5E/
         Jq0kurRhzNpBdRmly3pB1AqsvukzGZgaXU+Ql8w7B19vNmHGNHBdSSng6V/ukARoGoBP
         TsKiK9nRKjh8NYd1RIfhgyzieuo6uVwrVNnBUlNNGnQvLhyL15WYeUCHpKf2JjGh7f5s
         1ZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tRQODXhkyMhqAiuDJZNlm3kG1yqPZ4LhCnBerXa8fy0=;
        b=RRng9c7fJrPjLLCbs+WSh9wQjBWmXNFC+hdxpy1WZ8ucD27gZxvT91m3Vf/a13tVdH
         ONW32Tcb9jFPhoqSNOF5K03brrSC6srY9xXe3KEgSeCwqBGf3gOi0NlAZRV9WbyS83Bg
         f71lOZIydSIAbIhikQmAImu1RCzjuNZ+JaF9PqQyTt9Un0iAGH4zENzcu2HZB+bKwWhw
         49wGCA04XV2K9bjWqFAA8vaz8T48N/F3thznivq7b6RiRIMFmDTONjeSo26MioRu2y0q
         c8aO5vvtV7Rs6XJOsDbGS8ytQCURCyncgqzvLjXz4o8LrA0acPKOekAbHGZnesvdG4Ci
         O7cQ==
X-Gm-Message-State: AOAM533y7Oun6iFiRMyfIOhAhlDbDS9BNqTTHcIsNsXEpNZ5O/GnLMV2
        JD7gJ/9W/4kO1vAqeUskGQ+5N4eWqs8l7FcCP7k=
X-Google-Smtp-Source: ABdhPJz6PyYjI7Gkv9sBVYYCB7DNANoIBBXN/TCg8JGdbEBBV9HtFkEtzpKF789VkS2hz0b5+WA85x+C1C1okZzorps=
X-Received: by 2002:a5d:4987:: with SMTP id r7mr6412093wrq.327.1602014692564;
 Tue, 06 Oct 2020 13:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211723.3028059-1-robdclark@gmail.com> <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
 <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
 <20201005150024.mchfdtd62rlkuh4s@e107158-lin.cambridge.arm.com>
 <CAF6AEGs7NmCPyLdg+gg5jTTe-wgi2myRQ80tum6odv6tLLQ0DQ@mail.gmail.com> <20201006105918.v3xspb6xasjyy5ky@e107158-lin.cambridge.arm.com>
In-Reply-To: <20201006105918.v3xspb6xasjyy5ky@e107158-lin.cambridge.arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 6 Oct 2020 13:04:40 -0700
Message-ID: <CAF6AEGu_V_EGcPQ+F_Z73cMCAcFPoM-GuiGWUPr+=6GD4Om=zg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
To:     Qais Yousef <qais.yousef@arm.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Tejun Heo <tj@kernel.org>, Tim Murray <timmurray@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 6, 2020 at 3:59 AM Qais Yousef <qais.yousef@arm.com> wrote:
>
> On 10/05/20 16:24, Rob Clark wrote:
>
> [...]
>
> > > RT planning and partitioning is not easy task for sure. You might want to
> > > consider using affinities too to get stronger guarantees for some tasks and
> > > prevent cross-talking.
> >
> > There is some cgroup stuff that is pinning SF and some other stuff to
> > the small cores, fwiw.. I think the reasoning is that they shouldn't
> > be doing anything heavy enough to need the big cores.
>
> Ah, so you're on big.LITTLE type of system. I have done some work which enables
> biasing RT tasks towards big cores and control the default boost value if you
> have util_clamp and schedutil enabled. You can use util_clamp in general to
> help with DVFS related response time delays.
>
> I haven't done any work to try our best to pick a small core first but fallback
> to big if there's no other alternative.
>
> It'd be interesting to know how often you end up on a big core if you remove
> the affinity. The RT scheduler picks the first cpu in the lowest priority mask.
> So it should have this bias towards picking smaller cores first if they're
> in the lower priority mask (ie: not running higher priority RT tasks).

fwiw, the issue I'm looking at is actually at the opposite end of the
spectrum, less demanding apps that let cpus throttle down to low
OPPs.. which stretches out the time taken at each step in the path
towards screen (which seems to improve the odds that we hit priority
inversion scenarios with SCHED_FIFO things stomping on important CFS
things)

There is a *big* difference in # of cpu cycles per frame between
highest and lowest OPP..

BR,
-R

> So unless you absolutely don't want any RT tasks on a big cores, it'd be worth
> removing this affinity and check the percentage of time you spend on little
> cores. This should help with your worst case scenario as you make more cpus
> available.
>
> > > > run ASAP once fences are signalled, and vblank_work to run at a
> > > > slightly higher priority still.  But the correct choice for priorities
> > > > here depends on what userspace is using, it all needs to fit together
> > > > properly.
> > >
> > > By userspace here I think you mean none display pipeline related RT tasks that
> > > you need to coexit with and could still disrupt your pipeline?
> >
> > I mean, commit_work should be higher priority than the other (display
> > related) RT tasks.  But the kernel doesn't know what those priorities
> > are.
>
> So if you set commit_work to sched_set_fifo(), it'd be at a reasonably high
> priority (50) by default. Which means you just need to manage your SF
> priorities without having to change commit_work priority itself?
>
> >
> > > Using RT on Gerneral Purpose System is hard for sure. One of the major
> > > challenge is that there's no admin that has full view of the system to do
> > > proper RT planning.
> > >
> > > We need proper RT balancer daemon that helps partitioning the system for
> > > multiple RT apps on these systems..
> > >
> > > >
> > > > >
> > > > > I do appreciate that maybe some of these tasks have varying requirements during
> > > > > their life time. e.g: they have RT property during specific critical section
> > > > > but otherwise are CFS tasks. I think the UI thread in Android behaves like
> > > > > that.
> > > > >
> > > > > It's worth IMO trying that approach I pointed out earlier to see if making RT
> > > > > try to pick an idle CPU rather than preempt CFS helps. Not sure if it'd be
> > > > > accepted but IMHO it's a better direction to consider and discuss.
> > > >
> > > > The problem I was seeing was actually the opposite..  commit_work
> > > > becomes runnable (fences signalled) but doesn't get a chance to run
> > > > because a SCHED_FIFO SF thread is running.  (Maybe I misunderstood and
> > > > you're approach would help this case too?)
> > >
> > > Ah okay. Sorry I got it the wrong way around for some reason. I thought this
> > > task is preempting other CFS-based pipelined tasks.
> > >
> > > So your system seems to be overcomitted. Is SF short for SufraceFlinger? Under
> > > what scenarios do you have many SurfaceFlinger tasks? On Android I remember
> > > seeing they have priority of 1 or 2.
> >
> > yeah, SF==SurfaceFlinger, and yeah, 1 and 2..
> >
> > > sched_set_fifo() will use priority 50. If you set all your pipeline tasks
> > > to this priority, what happens?
> >
> > I think this would work.. drm/msm doesn't use vblank work, so I
> > wouldn't really have problems with commit_work preempting vblank_work.
> > But I think the best option (and to handle the case if android changes
> > the RT priorties around in the future) is to let userspace set the
> > priorities.
>
> I don't really mind. But it seems better for me if we know that two kernel
> threads need to have a specific relative priorities to each others then to
> handle this in the kernel properly. Userspace will only need then to worry
> about managing its *own* priorities relative to that.
>
> Just seen Peter suggesting in another email to use SCHED_DEADLINE for vblank
> work. Which I think achieves the above if commit_work uses sched_set_fifo().
>
> >
> > > >
> > > > > Or maybe you can wrap userspace pipeline critical section lock such that any
> > > > > task holding it will automatically be promoted to SCHED_FIFO and then demoted
> > > > > to CFS once it releases it.
> > > >
> > > > The SCHED_DEADLINE + token passing approach that the lwn article
> > > > mentioned sounds interesting, if that eventually becomes possible.
> > > > But doesn't really help today..
> > >
> > > We were present in the room with Alessio when he gave that talk :-)
> > >
> > > You might have seen Valentin's talk in LPC where he's trying to get
> > > proxy-execution into shape. Which is a pre-requisite to enable using of
> > > SCHED_DEADLINE for these scenarios. IIRC it should allow all dependent tasks to
> > > run from the context of the deadline task during the display pipeline critical
> > > section.
> > >
> > > By the way, do you have issues with SoftIrqs delaying your RT tasks execution
> > > time?
> >
> > I don't *think* so, but I'm not 100% sure if they are showing up in
>
> If you ever get a chance to run a high network throughput test, it might help
> to see if softirqs are affecting you. I know Android has issues with this under
> some circumstances.
>
> > traces.  So far it seems like SF stomping on commit_work.  (There is
> > the added complication that there are some chrome gpu-process tasks in
> > between SF and the display, including CrGpuMain (which really doesn't
> > want to be SCHED_FIFO when executing gl commands on behalf of
> > something unrelated to the compositor.. the deadline approach, IIUC,
> > might be the better option eventually for this?)
>
> If you meant sched_deadline + token approach, then yeah I think it'd be better.
> But as you said, we can't do this yet :/
>
> But as Peter pointed out, this doesn't mean you can't use SCHED_DEADLINE at all
> if it does make sense.
>
> Thanks
>
> --
> Qais Yousef
