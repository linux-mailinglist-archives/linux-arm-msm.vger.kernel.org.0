Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F28D272B21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgIUQK0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:10:26 -0400
Received: from foss.arm.com ([217.140.110.172]:46088 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727386AbgIUQKZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:10:25 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7956F147A;
        Mon, 21 Sep 2020 09:10:24 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com [10.1.195.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D50D3F73B;
        Mon, 21 Sep 2020 09:10:23 -0700 (PDT)
Date:   Mon, 21 Sep 2020 17:10:21 +0100
From:   Qais Yousef <qais.yousef@arm.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, timmurray@google.com,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
Message-ID: <20200921161020.pjd6v6ul3beljwot@e107158-lin.cambridge.arm.com>
References: <20200919193727.2093945-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200919193727.2093945-1-robdclark@gmail.com>
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/19/20 12:37, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The android userspace treats the display pipeline as a realtime problem.
> And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> that I found.)
> 
> But this presents a problem with using workqueues for non-blocking
> atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> preempt the worker.  Which is not really the outcome you want.. once
> the required fences are scheduled, you want to push the atomic commit
> down to hw ASAP.
> 
> But the decision of whether commit_work should be RT or not really
> depends on what userspace is doing.  For a pure CFS userspace display
> pipeline, commit_work() should remain SCHED_NORMAL.

Just a side note; this RT vs CFS inter-operatability is an issue that
creeps up every now and again.

https://lore.kernel.org/lkml/1567048502-6064-1-git-send-email-jing-ting.wu@mediatek.com/

Does the UI thread in Android ever run as RT by the way? I always suspected it
is one susceptible to such potential delays since it is part of the application
thread and thought it can't be trusted to become RT.

Those 120MHz displays will stress the pipeline :-)

> 
> To handle this, convert non-blocking commit_work() to use per-CRTC
> kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> used to avoid serializing commits when userspace is using a per-CRTC
> update loop.
> 
> A client-cap is introduced so that userspace can opt-in to SCHED_FIFO
> priority commit work.
> 
> A potential issue is that since 616d91b68cd ("sched: Remove
> sched_setscheduler*() EXPORTs") we have limited RT priority levels,
> meaning that commit_work() ends up running at the same priority level
> as vblank-work.  This shouldn't be a big problem *yet*, due to limited
> use of vblank-work at this point.  And if it could be arranged that
> vblank-work is scheduled before signaling out-fences and/or sending
> pageflip events, it could probably work ok to use a single priority
> level for both commit-work and vblank-work.

This is a function of num_cpus too. As long as nr_cpus > nr_running_rt_tasks
you should be fine.

Cheers

--
Qais Yousef
