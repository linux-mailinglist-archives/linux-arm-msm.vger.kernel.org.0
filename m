Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942212810DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 13:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgJBLBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 07:01:10 -0400
Received: from foss.arm.com ([217.140.110.172]:60582 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbgJBLBK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 07:01:10 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A73451063;
        Fri,  2 Oct 2020 04:01:09 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com [10.1.195.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D8C93F73B;
        Fri,  2 Oct 2020 04:01:08 -0700 (PDT)
Date:   Fri, 2 Oct 2020 12:01:06 +0100
From:   Qais Yousef <qais.yousef@arm.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Tejun Heo <tj@kernel.org>, timmurray@google.com,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200930211723.3028059-1-robdclark@gmail.com>
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/30/20 14:17, Rob Clark wrote:
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

For me thees 2 properties

	1. Run ASAP
	2. Finish the work un-interrupted

Scream the workers need to be SCHED_FIFO by default. CFS can't give you these
guarantees.

IMO using sched_set_fifo() for these workers is the right thing.

> 
> But the decision of whether commit_work should be RT or not really
> depends on what userspace is doing.  For a pure CFS userspace display
> pipeline, commit_work() should remain SCHED_NORMAL.

I'm not sure I agree with this. I think it's better to characterize tasks based
on their properties/requirements rather than what the rest of the userspace is
using.

I do appreciate that maybe some of these tasks have varying requirements during
their life time. e.g: they have RT property during specific critical section
but otherwise are CFS tasks. I think the UI thread in Android behaves like
that.

It's worth IMO trying that approach I pointed out earlier to see if making RT
try to pick an idle CPU rather than preempt CFS helps. Not sure if it'd be
accepted but IMHO it's a better direction to consider and discuss.

Or maybe you can wrap userspace pipeline critical section lock such that any
task holding it will automatically be promoted to SCHED_FIFO and then demoted
to CFS once it releases it.

Haven't worked with display pipelines before, so hopefully this makes sense :-)

Thanks

--
Qais Yousef

> 
> To handle this, convert non-blocking commit_work() to use per-CRTC
> kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> used to avoid serializing commits when userspace is using a per-CRTC
> update loop.  And the last patch exposes the task id to userspace as
> a CRTC property, so that userspace can adjust the priority and sched
> policy to fit it's needs.
> 
> 
> v2: Drop client cap and in-kernel setting of priority/policy in
>     favor of exposing the kworker tid to userspace so that user-
>     space can set priority/policy.
> 
> Rob Clark (3):
>   drm/crtc: Introduce per-crtc kworker
>   drm/atomic: Use kthread worker for nonblocking commits
>   drm: Expose CRTC's kworker task id
> 
>  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++++----
>  drivers/gpu/drm/drm_crtc.c          | 14 +++++++++++++
>  drivers/gpu/drm/drm_mode_config.c   | 14 +++++++++++++
>  drivers/gpu/drm/drm_mode_object.c   |  4 ++++
>  include/drm/drm_atomic.h            | 31 +++++++++++++++++++++++++++++
>  include/drm/drm_crtc.h              |  8 ++++++++
>  include/drm/drm_mode_config.h       |  9 +++++++++
>  include/drm/drm_property.h          |  9 +++++++++
>  8 files changed, 98 insertions(+), 4 deletions(-)
> 
> -- 
> 2.26.2
> 
