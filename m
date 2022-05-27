Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A23B053586C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 May 2022 06:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbiE0EZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 May 2022 00:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242988AbiE0EZv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 May 2022 00:25:51 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF9A7A83D;
        Thu, 26 May 2022 21:25:49 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id z15so4321129wrg.11;
        Thu, 26 May 2022 21:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0YfkumMYtOv3LXjR9mdMq/y8AVIXM/okiBqtDnqbSnw=;
        b=Zhr9ORuSk4gMWSSy8BkgzVEDOcc2f98wdAfg/WvZm9dqiFcddFjljo3VrzaOvy5sZQ
         Pb+1s+ZUA40BcYe38NXZ1x7uLJmK5OG1ZgAyVmNkytn/w5+kIojAiIpQk6BwCsElL6wO
         +P+I2dzBoz4JU+T4G89uBVSe6CjDKrXG6rLpbtcR2QcAFOebXyrsWgCpYMDH8ar8ECP7
         UIAdHKwPWQ5XYyOQ2ZgEJJdJxnQzh+qY84/OGAsWQZUMndcuhXA2VQgAfhEkXsIVOGtd
         U68KxiGj0Oryfu8AVo4C1Lijz64k3usi+1P5fbWK9eezxY5IprENM+zy71toksfy34ij
         4MDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0YfkumMYtOv3LXjR9mdMq/y8AVIXM/okiBqtDnqbSnw=;
        b=U6meM9eGFa+MHMxd2A/m+N1hEjfidr4iUEyk6KWHRzKLzLWF9i+fquVI0DG5StOT3A
         iryZBbQRBl30WjVWhrBY22ZvpWdvGsLK9lY9LN/kuCLJllr9LFusO6MtpNCGrdt9JUp5
         AoGsAAN94WeRFhijSs+OEDQIENi07NXL52bFZ9kKqdKaOGXaP5JQbm3E2yBT91/vMB5D
         QnZYOnbitw1zDayRqhgeXM8GTbyaM2UoJgxRrt6GtlQx4y3PHrO+JzhauFAMivk1ZCZ4
         PsTWn0+z/Ri+3o3QYv88zDHE31a9eD0nQu1KjZ56E2Mb7c+iiABOyNjA7PVTTHMQKJBl
         GugQ==
X-Gm-Message-State: AOAM533z8SQgT8e09lamCaBSoJErUmfU13gyvBDNp3TA7FxmbSmb+cm9
        6Kh9MSJW1qXf15BC7iE2+aV6uUtK067SCiJfiF1WoL0E
X-Google-Smtp-Source: ABdhPJzpbskOfiBre8YaB0MjcWzZZuvFSHszk5ZJDQf1lOs8LF942QEAGRGrp9kfG7FaiyoVlaPaYSxqf1whS+DmDI8=
X-Received: by 2002:adf:f491:0:b0:20e:615a:d7d9 with SMTP id
 l17-20020adff491000000b0020e615ad7d9mr31810376wro.52.1653625547651; Thu, 26
 May 2022 21:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210728010632.2633470-1-robdclark@gmail.com> <20210728010632.2633470-13-robdclark@gmail.com>
 <84e03c5f-a3af-6592-d19a-a2f5d20b92fb@linux.intel.com> <CAJs_Fx6Nc337LPNh=p2GT2d2yDTdLWH934o4Cof3urDGhUJB6A@mail.gmail.com>
 <904ae104-1c30-d130-129f-ccae381261d5@linux.intel.com> <CAF6AEGsH=K1Hut7QBmF1kX40xS+9px=BrtZecAXVQopNs67Feg@mail.gmail.com>
 <1cd913da-6e51-509c-a6e6-83bf79cae20b@linux.intel.com> <CAF6AEGs_+mhY9x1HG=jHmpwGU6jUS1G4mF6bJCd3yN0JRhocsQ@mail.gmail.com>
 <046f2d0f-5e61-7d24-1b40-006f2377c974@linux.intel.com> <CAF6AEGtcZ=rcVeFCRdj2gF0=4OV0B4EJ51FuZY0sge3EEgSgzg@mail.gmail.com>
 <423c1077-191d-000c-2f3b-f60277a8f3f1@linux.intel.com>
In-Reply-To: <423c1077-191d-000c-2f3b-f60277a8f3f1@linux.intel.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 26 May 2022 21:25:45 -0700
Message-ID: <CAF6AEGt7qY1UL65AAntoc1eUQYGH_w5fVLR0xP-aU6T6mj614g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v4 12/13] drm/msm: Utilize gpu scheduler priorities
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sean Paul <sean@poorly.run>,
        freedreno <freedreno@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 26, 2022 at 4:38 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 26/05/2022 04:37, Rob Clark wrote:
> > On Wed, May 25, 2022 at 9:22 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 25/05/2022 14:41, Rob Clark wrote:
> >>> On Wed, May 25, 2022 at 2:46 AM Tvrtko Ursulin
> >>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>
> >>>>
> >>>> On 24/05/2022 15:50, Rob Clark wrote:
> >>>>> On Tue, May 24, 2022 at 6:45 AM Tvrtko Ursulin
> >>>>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 23/05/2022 23:53, Rob Clark wrote:
> >>>>>>> On Mon, May 23, 2022 at 7:45 AM Tvrtko Ursulin
> >>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> Hi Rob,
> >>>>>>>>
> >>>>>>>> On 28/07/2021 02:06, Rob Clark wrote:
> >>>>>>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>>>>>
> >>>>>>>>> The drm/scheduler provides additional prioritization on top of =
that
> >>>>>>>>> provided by however many number of ringbuffers (each with their=
 own
> >>>>>>>>> priority level) is supported on a given generation.  Expose the
> >>>>>>>>> additional levels of priority to userspace and map the userspac=
e
> >>>>>>>>> priority back to ring (first level of priority) and schedular p=
riority
> >>>>>>>>> (additional priority levels within the ring).
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>>>>>> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>>>>>> ---
> >>>>>>>>>       drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +-
> >>>>>>>>>       drivers/gpu/drm/msm/msm_gem_submit.c    |  4 +-
> >>>>>>>>>       drivers/gpu/drm/msm/msm_gpu.h           | 58 ++++++++++++=
++++++++++++-
> >>>>>>>>>       drivers/gpu/drm/msm/msm_submitqueue.c   | 35 +++++++-----=
---
> >>>>>>>>>       include/uapi/drm/msm_drm.h              | 14 +++++-
> >>>>>>>>>       5 files changed, 88 insertions(+), 27 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/=
gpu/drm/msm/adreno/adreno_gpu.c
> >>>>>>>>> index bad4809b68ef..748665232d29 100644
> >>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>>>>>>> @@ -261,8 +261,8 @@ int adreno_get_param(struct msm_gpu *gpu, u=
int32_t param, uint64_t *value)
> >>>>>>>>>                           return ret;
> >>>>>>>>>                   }
> >>>>>>>>>                   return -EINVAL;
> >>>>>>>>> -     case MSM_PARAM_NR_RINGS:
> >>>>>>>>> -             *value =3D gpu->nr_rings;
> >>>>>>>>> +     case MSM_PARAM_PRIORITIES:
> >>>>>>>>> +             *value =3D gpu->nr_rings * NR_SCHED_PRIORITIES;
> >>>>>>>>>                   return 0;
> >>>>>>>>>           case MSM_PARAM_PP_PGTABLE:
> >>>>>>>>>                   *value =3D 0;
> >>>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu=
/drm/msm/msm_gem_submit.c
> >>>>>>>>> index 450efe59abb5..c2ecec5b11c4 100644
> >>>>>>>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> >>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> >>>>>>>>> @@ -59,7 +59,7 @@ static struct msm_gem_submit *submit_create(s=
truct drm_device *dev,
> >>>>>>>>>           submit->gpu =3D gpu;
> >>>>>>>>>           submit->cmd =3D (void *)&submit->bos[nr_bos];
> >>>>>>>>>           submit->queue =3D queue;
> >>>>>>>>> -     submit->ring =3D gpu->rb[queue->prio];
> >>>>>>>>> +     submit->ring =3D gpu->rb[queue->ring_nr];
> >>>>>>>>>           submit->fault_dumped =3D false;
> >>>>>>>>>
> >>>>>>>>>           INIT_LIST_HEAD(&submit->node);
> >>>>>>>>> @@ -749,7 +749,7 @@ int msm_ioctl_gem_submit(struct drm_device =
*dev, void *data,
> >>>>>>>>>           /* Get a unique identifier for the submission for log=
ging purposes */
> >>>>>>>>>           submitid =3D atomic_inc_return(&ident) - 1;
> >>>>>>>>>
> >>>>>>>>> -     ring =3D gpu->rb[queue->prio];
> >>>>>>>>> +     ring =3D gpu->rb[queue->ring_nr];
> >>>>>>>>>           trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
> >>>>>>>>>                   args->nr_bos, args->nr_cmds);
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/ms=
m/msm_gpu.h
> >>>>>>>>> index b912cacaecc0..0e4b45bff2e6 100644
> >>>>>>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
> >>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> >>>>>>>>> @@ -250,6 +250,59 @@ struct msm_gpu_perfcntr {
> >>>>>>>>>           const char *name;
> >>>>>>>>>       };
> >>>>>>>>>
> >>>>>>>>> +/*
> >>>>>>>>> + * The number of priority levels provided by drm gpu scheduler=
.  The
> >>>>>>>>> + * DRM_SCHED_PRIORITY_KERNEL priority level is treated special=
ly in some
> >>>>>>>>> + * cases, so we don't use it (no need for kernel generated job=
s).
> >>>>>>>>> + */
> >>>>>>>>> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM=
_SCHED_PRIORITY_MIN)
> >>>>>>>>> +
> >>>>>>>>> +/**
> >>>>>>>>> + * msm_gpu_convert_priority - Map userspace priority to ring #=
 and sched priority
> >>>>>>>>> + *
> >>>>>>>>> + * @gpu:        the gpu instance
> >>>>>>>>> + * @prio:       the userspace priority level
> >>>>>>>>> + * @ring_nr:    [out] the ringbuffer the userspace priority ma=
ps to
> >>>>>>>>> + * @sched_prio: [out] the gpu scheduler priority level which t=
he userspace
> >>>>>>>>> + *              priority maps to
> >>>>>>>>> + *
> >>>>>>>>> + * With drm/scheduler providing it's own level of prioritizati=
on, our total
> >>>>>>>>> + * number of available priority levels is (nr_rings * NR_SCHED=
_PRIORITIES).
> >>>>>>>>> + * Each ring is associated with it's own scheduler instance.  =
However, our
> >>>>>>>>> + * UABI is that lower numerical values are higher priority.  S=
o mapping the
> >>>>>>>>> + * single userspace priority level into ring_nr and sched_prio=
 takes some
> >>>>>>>>> + * care.  The userspace provided priority (when a submitqueue =
is created)
> >>>>>>>>> + * is mapped to ring nr and scheduler priority as such:
> >>>>>>>>> + *
> >>>>>>>>> + *   ring_nr    =3D userspace_prio / NR_SCHED_PRIORITIES
> >>>>>>>>> + *   sched_prio =3D NR_SCHED_PRIORITIES -
> >>>>>>>>> + *                (userspace_prio % NR_SCHED_PRIORITIES) - 1
> >>>>>>>>> + *
> >>>>>>>>> + * This allows generations without preemption (nr_rings=3D=3D1=
) to have some
> >>>>>>>>> + * amount of prioritization, and provides more priority levels=
 for gens
> >>>>>>>>> + * that do have preemption.
> >>>>>>>>
> >>>>>>>> I am exploring how different drivers handle priority levels and =
this
> >>>>>>>> caught my eye.
> >>>>>>>>
> >>>>>>>> Is the implication of the last paragraphs that on hw with nr_rin=
gs > 1,
> >>>>>>>> ring + 1 preempts ring?
> >>>>>>>
> >>>>>>> Other way around, at least from the uabi standpoint.  Ie. ring[0]
> >>>>>>> preempts ring[1]
> >>>>>>
> >>>>>> Ah yes, I figure it out from the comments but then confused myself=
 when
> >>>>>> writing the email.
> >>>>>>
> >>>>>>>> If so I am wondering does the "spreading" of
> >>>>>>>> user visible priorities by NR_SCHED_PRIORITIES creates a non-pre=
emptable
> >>>>>>>> levels within every "bucket" or how does that work?
> >>>>>>>
> >>>>>>> So, preemption is possible between any priority level before run_=
job()
> >>>>>>> gets called, which writes the job into the ringbuffer.  After tha=
t
> >>>>>>
> >>>>>> Hmm how? Before run_job() the jobs are not runnable, sitting in th=
e
> >>>>>> scheduler queues, right?
> >>>>>
> >>>>> I mean, if prio[0]+prio[1]+prio[2] map to a single ring, submit A o=
n
> >>>>> prio[1] could be executed after submit B on prio[2] provided that
> >>>>> run_job(submitA) hasn't happened yet.  So I guess it isn't "really"
> >>>>> preemption because the submit hasn't started running on the GPU yet=
.
> >>>>> But rather just scheduling according to priority.
> >>>>>
> >>>>>>> point, you only have "bucket" level preemption, because
> >>>>>>> NR_SCHED_PRIORITIES levels of priority get mapped to a single FIF=
O
> >>>>>>> ringbuffer.
> >>>>>>
> >>>>>> Right, and you have one GPU with four rings, which means you expos=
e 12
> >>>>>> priority levels to userspace, did I get that right?
> >>>>>
> >>>>> Correct
> >>>>>
> >>>>>> If so how do you convey in the ABI that not all there priority lev=
els
> >>>>>> are equal? Like userspace can submit at prio 4 and expect prio 3 t=
o
> >>>>>> preempt, as would prio 2 preempt prio 3. While actual behaviour wi=
ll not
> >>>>>> match - 3 will not preempt 4.
> >>>>>
> >>>>> It isn't really exposed to userspace, but perhaps it should be..
> >>>>> Userspace just knows that, to the extent possible, the kernel will =
try
> >>>>> to execute prio 3 before prio 4.
> >>>>>
> >>>>>> Also, does your userspace stack (EGL/Vulkan) use the priorities? I=
 had a
> >>>>>> quick peek in Mesa but did not spot it - although I am not really =
at
> >>>>>> home there yet so maybe I missed it.
> >>>>>
> >>>>> Yes, there is an EGL extension:
> >>>>>
> >>>>> https://www.khronos.org/registry/EGL/extensions/IMG/EGL_IMG_context=
_priority.txt
> >>>>>
> >>>>> It is pretty limited, it only exposes three priority levels.
> >>>>
> >>>> Right, is that wired up on msm? And if it is, or could be, how do/wo=
uld
> >>>> you map the three priority levels for GPUs which expose 3 priority
> >>>> levels versus the one which exposes 12?
> >>>
> >>> We don't yet, but probably should, expose a cap to indicate to
> >>> userspace the # of hw rings vs # of levels of sched priority
> >>
> >> What bothers me is the question of whether this setup provides a
> >> consistent benefit. Why would userspace use other than "real" (hardwar=
e)
> >> priority levels on chips where they are available?
> >
> > yeah, perhaps we could decide that userspace doesn't really need more
> > than 3 prio levels, and that on generations which have better
> > preemption than what drm/sched provides, *only* expose those priority
> > levels.  I've avoided that so far because it seems wrong for the
> > kernel to assume that a single EGL extension is all there is when it
> > comes to userspace context priority.. the other option is to expose
> > more information to userspace and let it decide.
>
> Maybe in msm you could reserve 0 for kernel submissions (if you have
> such use cases) and expose levels 1-3 via drm/sched? If you could wire
> that up, and if four levels is most your hardware will have.

we fortunately don't need kernel submission for anything... that said,
the limited # of priorities for drm/sched seems a bit arbitrary
(although perhaps catering to the existing egl extension)

> Although with that option it seems drm/sched could starve lower
> priorities, I mean not give anything to the hw/fw scheduler on higher
> rings as longs as there is work on lower. Which if those chips have some
> smarter algorithm would defeat it.

So the thing is the (existing) gpu scheduling is strictly priority
based, and not "nice" based like CPU scheduling.  Those two schemes
are completely different paradigms, the latter giving some boost to
processes that have been blocked on I/O (which, I'm not sure there is
an equiv thing for GPU) or otherwise haven't had a chance to run for a
while.

> So perhaps there is no way but improving drm/sched. Backend controlled
> number of priorities and backend control for whether "in flight" job s
> limit is global vs per priority level (per run queue).
>
> Btw my motivation looking into all this is that we have CPU nice and
> ionice supporting more levels and I'd like to tie that all together into
> one consistent user friendly story (see
> https://patchwork.freedesktop.org/series/102348/). In a world of
> heterogenous compute pipelines I think that is the way forward. I even
> demonstrated this from within ChromeOS, since the compositor uses nice
> -5 is automatically gives it more GPU bandwith compared to for instance
> Android VM.

But this can be achieved with a simple priority based scheme, ie.
compositor is higher priority than app.

The situation changes a bit, and becomes more cpu like perhaps, when
you add long running compute and cpu-offload stuff

> I know of other hardware supporting more than three levels, but I need
> to study more drm drivers to gain a complete picture. I only started
> with msm since it looked simple. :)

even in msm the # of priority levels is somewhat arbitrary.. but
roughly it is that we tell the hw there is something higher priority
to run, it waits a bit for a cooperative yield point (since force
preemption is rather expensive for 3d, ie. there is a lot of state to
save/restore, not just a few cpu registers), and then eventually if a
cooperative yield point isn't hit it triggers a forced preemption.
(Only on newer things, older gens only had cooperative yield points to
work with.)

> > Honestly, the combination of the fact that a6xx is the first gen
> > shipping in consumer products with upstream driver (using drm/sched),
> > and not having had time yet to implement hw preemption for a6xx yet,
> > means not a whole lot of thought has gone into the current arrangement
> > ;-)
>
> :)
>
> What kind of scheduling algorithm does your hardware have between those
> priority levels?

Like I said, it is strictly "thing A is higher priority than thing
B".. there is no CSF or io-nice type thing.  I guess since it is still
the kernel that initiates the preemption, we could in theory implement
something more clever.  But I'm not entirely sure something more
clever makes sense given the relatively high cost of forced preemption
compared to CPU.  Ofc I could be wrong, I've not given a lot of
thought to it other than more limited scenarios (ie. compositor should
be higher priority than app)

BR,
-R

> >> For instance if you exposed 4 instead of 12 on a respective platform,
> >> would that be better or worse? Yes you could only map three directly
> >> drm/sched and one would have to be "fake". Like:
> >>
> >> hw prio 0 -> drm/sched 2
> >> hw prio 1 -> drm/sched 1
> >> hw prio 2 -> drm/sched 0
> >> hw prio 3 -> drm/sched 0
> >>
> >> Not saying that's nice either. Perhaps the answer is that drm/sched
> >> needs more flexibility for instance if it wants to be widely used.
> >
> > I'm not sure what I'd add to drm/sched.. once it calls run_job()
> > things are out of its hands, so really all it can do is re-order
> > things prior to calling run_job() according to it's internal priority
> > levels.  And that is still better than no re-ordering so it adds some
> > value, even if not complete.
>
> Not sure about the value there - as mentioned before I see problems on
> the uapi front with not all priorities being equal.
>
> Besides, priority order scheduling is kind of meh to me. Especially if
> it only applies in the scheduling frontend. If frontend and backend
> algorithms do not even match then it's even more weird.
>
> IMO sooner or later GPU scheduling will have to catchup with state of
> the art from the CPU world and use priority as a hint for time sharing
> decisions.

Maybe.. that is a lot more sophisticated than the current situation of
"queue A should have higher priority than queue B"

OTOH actual preemption of GPU work is a lot more expensive than
preempting a CPU thread, so not even sure if we should try and look at
GPU and CPU scheduling the same way.  (But so far I've only looked at
it as "compositor should have higher priority than app")

BR,
-R

> >> For instance in i915 uapi we have priority as int -1023 - +1023. And
> >> matching implementation on some platforms, until the new ones which ar=
e
> >> GuC firmware based, where we need to squash that to low/normal/high.
> >
> > hmm, that is a more awkward problem, since it sounds like you are
> > mapping many more priority levels into a much smaller set of hw
> > priority levels.  Do you have separate drm_sched instances per hw
> > priority level?  If so you can do the same thing of using drm_sched
> > priority levels to multiply # of hw priority levels, but ofc that is
> > not perfect (and won't get you to 2k).
>
> We don't use drm/sched yet, I was just mentioning what we have in uapi.
> But yes, our current scheduling backend can handle more than three levels=
.
>
> > But is there anything that actually *uses* that many levels of priority=
?
>
>  From userspace no, there are only a few internal priority levels for
> things like heartbeats the driver is sending to check engine health and
> page flip priority boosts.
>
> Regards,
>
> Tvrtko
