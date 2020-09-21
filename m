Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF56272BCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbgIUQXv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgIUQXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:23:51 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A325EC061755;
        Mon, 21 Sep 2020 09:23:50 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k15so13436213wrn.10;
        Mon, 21 Sep 2020 09:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GV+zIN6sJJxPejVZB8htxxkYICDKzmVCyZUaXHnp5g4=;
        b=dasbI4zhocNjyUPwfomYAW9onoLwPccSgrQi8tap4RhvutB8a1/agZkei9+nL2NUA7
         STEf4fljwFsbovWCl6LRA/cr9/t5SpRlnVpxpE3N3a94+IAsWoPpuTuLGt4lp1RtLqJV
         r1S32zwpb+B/7I0UIrTI2NJcQM4d42gKi7MVFMaMG6x3U2FAhPW9pJm23pHQW+vPnYT7
         SxvtnDiy4p5uE65mQdF1ORa2Q3p7mhomtEIoM2B/JiOnCS7QgBZsS8QU9TFD6yYAS89C
         psUZdIOQJIbRGJ+f/hDN6cjqEfSWajzsulp2hYsM+E8+X1KncdISmqvqk8IBfIrX77uv
         UAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GV+zIN6sJJxPejVZB8htxxkYICDKzmVCyZUaXHnp5g4=;
        b=YC7Zz4f98mc99kbgSb4RBjExXxA9jOPnFlngrE2lCG5W7fhiMzvkonsXe9vW0s4+64
         6RuJugKjDdru+WHnpeu6BY1aTH+bM7K2u3FptQclAO7QqGUgOFTEot0bmAlxAIaEp8vG
         4LLjyGvI5l2PckJBvAhvl97JPF603DTf1zZglZhl/MGf7DBp2WwnMwdO6IpfmpPcU+GZ
         Bp/Qn8WWJVAdy3qOY9XRkcV5td16HXZJL5id6rhvMzFnhPcdKHtZ3jKdWBTKd5ZfmeXu
         1Szlw3Eq5s0XE0iw8+fLhjdY2J29SdLppYyiTzRKzUU13V8WAOK67LI1R+vNaj1fad48
         p4Kg==
X-Gm-Message-State: AOAM533vmwGiQ1tsIkxXd8jFhYqPYafw04Z5k9CGzfKAdnFRRlO6k2B/
        0FP0m7ELuV3hElN4P9BxpkQyI0L3LqvvX9sWP2HmoNFc
X-Google-Smtp-Source: ABdhPJx911Aw5XJoH0FHLZ+BtstzWpG2MMi4tjv4LMT5e184l4ts5ETwRI5ps/eE+scP3HaiwEz2lW2tgtla49J0v80=
X-Received: by 2002:adf:e6c7:: with SMTP id y7mr521596wrm.147.1600705429283;
 Mon, 21 Sep 2020 09:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200919193727.2093945-1-robdclark@gmail.com> <20200921161020.pjd6v6ul3beljwot@e107158-lin.cambridge.arm.com>
In-Reply-To: <20200921161020.pjd6v6ul3beljwot@e107158-lin.cambridge.arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 21 Sep 2020 09:23:37 -0700
Message-ID: <CAF6AEGvyFTDaftbjny=FvC7kfDZQFFBiCPv+tJ8v9KDUmV8tJg@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
To:     Qais Yousef <qais.yousef@arm.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, Tim Murray <timmurray@google.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 9:10 AM Qais Yousef <qais.yousef@arm.com> wrote:
>
> On 09/19/20 12:37, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The android userspace treats the display pipeline as a realtime problem.
> > And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> > it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> > that I found.)
> >
> > But this presents a problem with using workqueues for non-blocking
> > atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> > preempt the worker.  Which is not really the outcome you want.. once
> > the required fences are scheduled, you want to push the atomic commit
> > down to hw ASAP.
> >
> > But the decision of whether commit_work should be RT or not really
> > depends on what userspace is doing.  For a pure CFS userspace display
> > pipeline, commit_work() should remain SCHED_NORMAL.
>
> Just a side note; this RT vs CFS inter-operatability is an issue that
> creeps up every now and again.
>
> https://lore.kernel.org/lkml/1567048502-6064-1-git-send-email-jing-ting.wu@mediatek.com/
>
> Does the UI thread in Android ever run as RT by the way? I always suspected it
> is one susceptible to such potential delays since it is part of the application
> thread and thought it can't be trusted to become RT.

The application itself is not RT, since there is no good way to know
what other things the app may be doing.  Although that is mentioned in
the lwn article (ie. the hypothetical SCHED_DEADLINE + token passing
part)

But at least once the app / ui thread is done, then it is all (or at
least in theory "all" if atomic-helper doesn't gum up the works ;-))
SCHED_FIFO from there to the display.

> Those 120MHz displays will stress the pipeline :-)

indeed

BR,
-R

> >
> > To handle this, convert non-blocking commit_work() to use per-CRTC
> > kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> > used to avoid serializing commits when userspace is using a per-CRTC
> > update loop.
> >
> > A client-cap is introduced so that userspace can opt-in to SCHED_FIFO
> > priority commit work.
> >
> > A potential issue is that since 616d91b68cd ("sched: Remove
> > sched_setscheduler*() EXPORTs") we have limited RT priority levels,
> > meaning that commit_work() ends up running at the same priority level
> > as vblank-work.  This shouldn't be a big problem *yet*, due to limited
> > use of vblank-work at this point.  And if it could be arranged that
> > vblank-work is scheduled before signaling out-fences and/or sending
> > pageflip events, it could probably work ok to use a single priority
> > level for both commit-work and vblank-work.
>
> This is a function of num_cpus too. As long as nr_cpus > nr_running_rt_tasks
> you should be fine.
>
> Cheers
>
> --
> Qais Yousef
