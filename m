Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD82E533E0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 15:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235701AbiEYNlV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 09:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233713AbiEYNlT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 09:41:19 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DD4633B4;
        Wed, 25 May 2022 06:41:17 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id o29-20020a05600c511d00b00397697f172dso1130705wms.0;
        Wed, 25 May 2022 06:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+Rn9yjKh215bpY7auwukJu0S8qK5W3YXbK+MSktpduU=;
        b=EOjPQPW0mcEnepIFbzBmobZ2A70gO1Sr44nK0FBTKb5DS8IJzLQ8cYWZX2XZ/Nynx/
         mQIpCeQm8ThG4yRlCuseiVNlPeRdNkEEAXVcbrKjGq8ao1Phzr8ZAEE/XnnjBL69f9P2
         YddhgIPz2YDikWKYJz54hKQNF90s86XkwO5PoBVkQT8yW2TCEYUxgHAYICFoWaQq0biY
         +9InBO3O4ZvPKXia/SxgEJ0wihVsAzg1tTgbbmBKbcAoHWuo/62F3TXVRaP0VgfMhye2
         5KDM77UVpNki43MQX6s1XUMeXoK/Q4AvpPVq5vgRNtjECzVtUJXgH5NBBHI7y+PNG6yG
         UvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+Rn9yjKh215bpY7auwukJu0S8qK5W3YXbK+MSktpduU=;
        b=gvmVDm81ZZmnKj4bnKugK/Yf3U0jsX5LSD3kU9bRau8iaSYEkReBG+WhRQnmzJq6nB
         E663C4MTqbhAQVqZ8OC3KOgHRJJLI7iCvQ4Q001rHW8lLI+aiDAYkNX4Ix3SjUQSHmbA
         LrEVL8fGDZmhVVssMgaXQdcS83qPn1A/juM/l6ZsBWTVBrLcwv8WrukQrdp6SH5KpHjb
         vPdOvCuw8ZkriJS01+xU8msbe/v5x+YWiYnrtnFEPiT4ifpTtGXQaY+C07g8yVyQhow5
         c/1u/aPtVGhMR+9gi9hkkJVKCNrekYa2irGULtm3kne6YIOHUtvbcE9DpM0gIRqWFh5c
         qOAg==
X-Gm-Message-State: AOAM532cUJarhz2C3/sV1bftm3nbOJ6Enf5XfLrL6DeDdFquFzc9MP+t
        xG89iCdS1m6Ixkdfd54VyRUZW7zNimPl7YI+Z1M=
X-Google-Smtp-Source: ABdhPJzF87lAe8rfLoVNj8H1nmHxKAUsJmB0ezdqMtSTV4cj2PiMVVJufheJsxrWKfETg3BdugFWee/9MerkP/cJP/8=
X-Received: by 2002:a05:600c:3d89:b0:397:104:b1c9 with SMTP id
 bi9-20020a05600c3d8900b003970104b1c9mr8481489wmb.84.1653486076174; Wed, 25
 May 2022 06:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210728010632.2633470-1-robdclark@gmail.com> <20210728010632.2633470-13-robdclark@gmail.com>
 <84e03c5f-a3af-6592-d19a-a2f5d20b92fb@linux.intel.com> <CAJs_Fx6Nc337LPNh=p2GT2d2yDTdLWH934o4Cof3urDGhUJB6A@mail.gmail.com>
 <904ae104-1c30-d130-129f-ccae381261d5@linux.intel.com> <CAF6AEGsH=K1Hut7QBmF1kX40xS+9px=BrtZecAXVQopNs67Feg@mail.gmail.com>
 <1cd913da-6e51-509c-a6e6-83bf79cae20b@linux.intel.com>
In-Reply-To: <1cd913da-6e51-509c-a6e6-83bf79cae20b@linux.intel.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 25 May 2022 06:41:13 -0700
Message-ID: <CAF6AEGs_+mhY9x1HG=jHmpwGU6jUS1G4mF6bJCd3yN0JRhocsQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] drm/msm: Utilize gpu scheduler priorities
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
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

On Wed, May 25, 2022 at 2:46 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 24/05/2022 15:50, Rob Clark wrote:
> > On Tue, May 24, 2022 at 6:45 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 23/05/2022 23:53, Rob Clark wrote:
> >>> On Mon, May 23, 2022 at 7:45 AM Tvrtko Ursulin
> >>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>
> >>>>
> >>>> Hi Rob,
> >>>>
> >>>> On 28/07/2021 02:06, Rob Clark wrote:
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> The drm/scheduler provides additional prioritization on top of that
> >>>>> provided by however many number of ringbuffers (each with their own
> >>>>> priority level) is supported on a given generation.  Expose the
> >>>>> additional levels of priority to userspace and map the userspace
> >>>>> priority back to ring (first level of priority) and schedular prior=
ity
> >>>>> (additional priority levels within the ring).
> >>>>>
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>> ---
> >>>>>     drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +-
> >>>>>     drivers/gpu/drm/msm/msm_gem_submit.c    |  4 +-
> >>>>>     drivers/gpu/drm/msm/msm_gpu.h           | 58 ++++++++++++++++++=
++++++-
> >>>>>     drivers/gpu/drm/msm/msm_submitqueue.c   | 35 +++++++--------
> >>>>>     include/uapi/drm/msm_drm.h              | 14 +++++-
> >>>>>     5 files changed, 88 insertions(+), 27 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/=
drm/msm/adreno/adreno_gpu.c
> >>>>> index bad4809b68ef..748665232d29 100644
> >>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>>> @@ -261,8 +261,8 @@ int adreno_get_param(struct msm_gpu *gpu, uint3=
2_t param, uint64_t *value)
> >>>>>                         return ret;
> >>>>>                 }
> >>>>>                 return -EINVAL;
> >>>>> -     case MSM_PARAM_NR_RINGS:
> >>>>> -             *value =3D gpu->nr_rings;
> >>>>> +     case MSM_PARAM_PRIORITIES:
> >>>>> +             *value =3D gpu->nr_rings * NR_SCHED_PRIORITIES;
> >>>>>                 return 0;
> >>>>>         case MSM_PARAM_PP_PGTABLE:
> >>>>>                 *value =3D 0;
> >>>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm=
/msm/msm_gem_submit.c
> >>>>> index 450efe59abb5..c2ecec5b11c4 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> >>>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> >>>>> @@ -59,7 +59,7 @@ static struct msm_gem_submit *submit_create(struc=
t drm_device *dev,
> >>>>>         submit->gpu =3D gpu;
> >>>>>         submit->cmd =3D (void *)&submit->bos[nr_bos];
> >>>>>         submit->queue =3D queue;
> >>>>> -     submit->ring =3D gpu->rb[queue->prio];
> >>>>> +     submit->ring =3D gpu->rb[queue->ring_nr];
> >>>>>         submit->fault_dumped =3D false;
> >>>>>
> >>>>>         INIT_LIST_HEAD(&submit->node);
> >>>>> @@ -749,7 +749,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev=
, void *data,
> >>>>>         /* Get a unique identifier for the submission for logging p=
urposes */
> >>>>>         submitid =3D atomic_inc_return(&ident) - 1;
> >>>>>
> >>>>> -     ring =3D gpu->rb[queue->prio];
> >>>>> +     ring =3D gpu->rb[queue->ring_nr];
> >>>>>         trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
> >>>>>                 args->nr_bos, args->nr_cmds);
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/ms=
m_gpu.h
> >>>>> index b912cacaecc0..0e4b45bff2e6 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
> >>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> >>>>> @@ -250,6 +250,59 @@ struct msm_gpu_perfcntr {
> >>>>>         const char *name;
> >>>>>     };
> >>>>>
> >>>>> +/*
> >>>>> + * The number of priority levels provided by drm gpu scheduler.  T=
he
> >>>>> + * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially i=
n some
> >>>>> + * cases, so we don't use it (no need for kernel generated jobs).
> >>>>> + */
> >>>>> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCH=
ED_PRIORITY_MIN)
> >>>>> +
> >>>>> +/**
> >>>>> + * msm_gpu_convert_priority - Map userspace priority to ring # and=
 sched priority
> >>>>> + *
> >>>>> + * @gpu:        the gpu instance
> >>>>> + * @prio:       the userspace priority level
> >>>>> + * @ring_nr:    [out] the ringbuffer the userspace priority maps t=
o
> >>>>> + * @sched_prio: [out] the gpu scheduler priority level which the u=
serspace
> >>>>> + *              priority maps to
> >>>>> + *
> >>>>> + * With drm/scheduler providing it's own level of prioritization, =
our total
> >>>>> + * number of available priority levels is (nr_rings * NR_SCHED_PRI=
ORITIES).
> >>>>> + * Each ring is associated with it's own scheduler instance.  Howe=
ver, our
> >>>>> + * UABI is that lower numerical values are higher priority.  So ma=
pping the
> >>>>> + * single userspace priority level into ring_nr and sched_prio tak=
es some
> >>>>> + * care.  The userspace provided priority (when a submitqueue is c=
reated)
> >>>>> + * is mapped to ring nr and scheduler priority as such:
> >>>>> + *
> >>>>> + *   ring_nr    =3D userspace_prio / NR_SCHED_PRIORITIES
> >>>>> + *   sched_prio =3D NR_SCHED_PRIORITIES -
> >>>>> + *                (userspace_prio % NR_SCHED_PRIORITIES) - 1
> >>>>> + *
> >>>>> + * This allows generations without preemption (nr_rings=3D=3D1) to=
 have some
> >>>>> + * amount of prioritization, and provides more priority levels for=
 gens
> >>>>> + * that do have preemption.
> >>>>
> >>>> I am exploring how different drivers handle priority levels and this
> >>>> caught my eye.
> >>>>
> >>>> Is the implication of the last paragraphs that on hw with nr_rings >=
 1,
> >>>> ring + 1 preempts ring?
> >>>
> >>> Other way around, at least from the uabi standpoint.  Ie. ring[0]
> >>> preempts ring[1]
> >>
> >> Ah yes, I figure it out from the comments but then confused myself whe=
n
> >> writing the email.
> >>
> >>>> If so I am wondering does the "spreading" of
> >>>> user visible priorities by NR_SCHED_PRIORITIES creates a non-preempt=
able
> >>>> levels within every "bucket" or how does that work?
> >>>
> >>> So, preemption is possible between any priority level before run_job(=
)
> >>> gets called, which writes the job into the ringbuffer.  After that
> >>
> >> Hmm how? Before run_job() the jobs are not runnable, sitting in the
> >> scheduler queues, right?
> >
> > I mean, if prio[0]+prio[1]+prio[2] map to a single ring, submit A on
> > prio[1] could be executed after submit B on prio[2] provided that
> > run_job(submitA) hasn't happened yet.  So I guess it isn't "really"
> > preemption because the submit hasn't started running on the GPU yet.
> > But rather just scheduling according to priority.
> >
> >>> point, you only have "bucket" level preemption, because
> >>> NR_SCHED_PRIORITIES levels of priority get mapped to a single FIFO
> >>> ringbuffer.
> >>
> >> Right, and you have one GPU with four rings, which means you expose 12
> >> priority levels to userspace, did I get that right?
> >
> > Correct
> >
> >> If so how do you convey in the ABI that not all there priority levels
> >> are equal? Like userspace can submit at prio 4 and expect prio 3 to
> >> preempt, as would prio 2 preempt prio 3. While actual behaviour will n=
ot
> >> match - 3 will not preempt 4.
> >
> > It isn't really exposed to userspace, but perhaps it should be..
> > Userspace just knows that, to the extent possible, the kernel will try
> > to execute prio 3 before prio 4.
> >
> >> Also, does your userspace stack (EGL/Vulkan) use the priorities? I had=
 a
> >> quick peek in Mesa but did not spot it - although I am not really at
> >> home there yet so maybe I missed it.
> >
> > Yes, there is an EGL extension:
> >
> > https://www.khronos.org/registry/EGL/extensions/IMG/EGL_IMG_context_pri=
ority.txt
> >
> > It is pretty limited, it only exposes three priority levels.
>
> Right, is that wired up on msm? And if it is, or could be, how do/would
> you map the three priority levels for GPUs which expose 3 priority
> levels versus the one which exposes 12?

We don't yet, but probably should, expose a cap to indicate to
userspace the # of hw rings vs # of levels of sched priority

> Is it doable properly without leaking the fact drm/sched internal
> implementation detail of three priority levels? Or if you went the other
> way and only exposed up to max 3 levels, then you lose one priority
> level your hardware suppose which is also not good.
>
> It is all quite interesting because your hardware is completely
> different from ours in this respect. In our case i915 decides when to
> preempt, hardware has no concept of priority (*).

It is really pretty much all in firmware.. a6xx is the first gen that
could do actual (non-cooperative) preemption (but that isn't
implemented yet in upstream driver)

BR,
-R

> Regards,
>
> Tvrtko
>
> (*) Almost no concept of priority in hardware - we do have it on new
> GPUs and only on a subset of engine classes where render and compute
> share the EUs. But I think it's way different from Ardenos.
