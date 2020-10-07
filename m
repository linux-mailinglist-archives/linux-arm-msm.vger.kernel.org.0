Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1BB72863FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 18:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgJGQaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Oct 2020 12:30:15 -0400
Received: from foss.arm.com ([217.140.110.172]:46648 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726348AbgJGQaP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Oct 2020 12:30:15 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63A661FB;
        Wed,  7 Oct 2020 09:30:14 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com [10.1.195.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 094943F66B;
        Wed,  7 Oct 2020 09:30:12 -0700 (PDT)
Date:   Wed, 7 Oct 2020 17:30:10 +0100
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
Message-ID: <20201007163010.bfgst6xfvkn2lzrk@e107158-lin.cambridge.arm.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
 <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
 <20201005150024.mchfdtd62rlkuh4s@e107158-lin.cambridge.arm.com>
 <CAF6AEGs7NmCPyLdg+gg5jTTe-wgi2myRQ80tum6odv6tLLQ0DQ@mail.gmail.com>
 <20201006105918.v3xspb6xasjyy5ky@e107158-lin.cambridge.arm.com>
 <CAF6AEGu_V_EGcPQ+F_Z73cMCAcFPoM-GuiGWUPr+=6GD4Om=zg@mail.gmail.com>
 <20201007103653.qjohhta7douhlb22@e107158-lin.cambridge.arm.com>
 <CAF6AEGsA_enFOUkV4Rw=Sxyjf=_oFLjwbz-Y4jTO=TUraOCzVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAF6AEGsA_enFOUkV4Rw=Sxyjf=_oFLjwbz-Y4jTO=TUraOCzVQ@mail.gmail.com>
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/07/20 08:57, Rob Clark wrote:
> Yeah, I think we will end up making some use of uclamp.. there is
> someone else working on that angle
> 
> But without it, this is a case that exposes legit prioritization
> problems with commit_work which we should fix ;-)

I wasn't suggesting this as an alternative to fixing the other problem. But it
seemed you had a different problem here that I thought I could help with :-)

I did give my opinion about how to handle that priority issue. If the 2 threads
are kernel threads and by design they need relative priorities IMO the kernel
need to be taught to set this relative priority. It seemed the vblank worker
could run as SCHED_DEADLINE. If this works, then the priority problem for
commit_work disappears as SCHED_DEADLINE will preempt RT. If commit_work uses
sched_set_fifo(), its priority will be 50, hence your SF threads can no longer
preempt it. And you can manage the SF threads to be any value you want relative
to 50 anyway without having to manage commit_work itself.

I'm not sure if you have problems with RT tasks preempting important CFS
tasks. My brain registered two conflicting statements.

Thanks

--
Qais Yousef
