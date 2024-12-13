Return-Path: <linux-arm-msm+bounces-42109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 275F39F145A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 18:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64958188D5BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E62818A6BA;
	Fri, 13 Dec 2024 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcAjOe/L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03251188A08;
	Fri, 13 Dec 2024 17:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112250; cv=none; b=I/hgyhKndd9C3wun0I2lkawNnuGh9ZWqPO9YJdv8j9MssGr81UBTzUwdNAL9JTEVoS5bAtMlv3Fi3fX5rEC+psSv7KgJ3+fgqaVqgjc5vEk2DhakW8iOM0kGDAetPR0LjzHJv+juj+pK1i4vFbWq8wED8w1t4sEpqmkWfPgC9B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112250; c=relaxed/simple;
	bh=09dwMiFN1bJIDdiz0P0LsyDPEnKq02Cnt4JGmg+tp8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5veHC1m9F1Gt0uALL2OLwSWKIaPqJEpxRStnm0EROE83YKVOLFqn7NZW5ddd3B37Brra2y62xswswQ/nE2Z3T/pmjutFgU8RSt92oM2b4Z5G7lb//Pv0Uf1OyJILKznY1fGSxrdgryXbBauGEkPAUzebXAvRBpQ7IO+rdfIhdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcAjOe/L; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a761a622dcso15597765ab.0;
        Fri, 13 Dec 2024 09:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734112247; x=1734717047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoT3CdV9DzlGXKlTClGK1n+oQrqyglDEDa5xoQzVrpk=;
        b=UcAjOe/Ll2sjdbRw/oIpdKXFRP1+K7vtGx5TOXaypHFUAHah5bMAId/GzKuU9PL5mj
         Uo+N4pfZMjCr3iG+I0LQqL84+AdFLoHZw0s/YoPTR8YBuxP5rOGNQngxU+0w0F97QDsa
         XM6PvnvQzykoPs1s/XwdPeeFFxVvlS+7sQ/l0qEZdRBl3Ev0jw3Q7d0ig4++PZv4xdjY
         N/uw+xoUZKBeLW4rtljuaFKcXMc4KHxWleWaPu1O6FhNwb1yY93rgqLDcbOwhHOv2PM+
         YC45uYt1b9U1JpD+4voL8gtVxb8ONWHn6RKa/KfT/kpOxYwvtezEDteC2/BRgZWoMW3F
         Krww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112247; x=1734717047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KoT3CdV9DzlGXKlTClGK1n+oQrqyglDEDa5xoQzVrpk=;
        b=MMe8OOB2uE6umTPwa4JrL8IzgVFZplm7U2waA6lp9MBg9krC8QDRPcqRZ26n2m9A+p
         E/8IwGgiFGEuOMvs7jjhDl5ZHqYZlD+8PVBl+q1H/Y5Blce0H4sqcfvtOTKLQV8NSBI3
         K9Bs8vsissVhJK6vkkcw+25lMOYXjsaeHdh8Kezygdvw9bh7dxtCySPBWRL1SF+0kqmA
         vJV9KecztCfy5XTEfmKZEhj+oQXn7NSwSmuD+YKtNCm7rcU1rCzxnu7Cy1aZhUf8kJ8B
         mhg60NYKJzvErfTS9zh0Wo7YsRKP3gwhmdupzFqqB/bRkBWaxeD9PlkUO+IKnJ9mp15o
         6ZBw==
X-Forwarded-Encrypted: i=1; AJvYcCWBY4pRGj2ASMMYfXxz7VxVuMQ3/jmfiVO7raKQakECCl660Wt6zrZVn9WTfEiuj9qBo+INsa6cBheQBFPW@vger.kernel.org, AJvYcCWx46ee504iuZesI6ef35WXBNEM5gmdJ73pfej2k7PlYvkOp2ZM551UbIGa28lDBsrr17OclEcJlxAhoero@vger.kernel.org
X-Gm-Message-State: AOJu0YweJV1abALH+jvpQSS8W6ge146r9abeaDcjYmpaofEb+jdOW+0r
	CFYy0oLvIVgXln4kIqcvWTwZmOWoVfo1Rnar3LnmmO+/fsUtOe+IBZu/a7NRL0viiqSkS3iGYIc
	iK78FYyNb03JSP5jkMWt6pcU7opI=
X-Gm-Gg: ASbGncu0ccdaSSRc3QkIy8ZizmFxBvyDELwufEAUrD/mhwO8y/hpSoAROf1k0ul0KU/
	b1kJcHvREJBOMeO7LPCRkqrAeP57QdEno3i+2Ca37Z6dGqgADIV0hPkWbjannoigFH47G
X-Google-Smtp-Source: AGHT+IHhbgTLDzEGVC+JxMSDn13inm7KukLU1cnovvUjtiY26cjroUqNsrD7d27uvsZKQiwA1rSWnDmG+OivvDJI+lE=
X-Received: by 2002:a05:6e02:156a:b0:3a7:a3a4:2cb3 with SMTP id
 e9e14a558f8ab-3aff8c92298mr37621935ab.15.1734112246892; Fri, 13 Dec 2024
 09:50:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205165419.54080-1-robdclark@gmail.com> <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
 <CAF6AEGtqSW1mpN14S8ffyV=tUG=0GTmNWq_oVEXo+0RYDJfOnA@mail.gmail.com>
 <CAF6AEGssTcO=qhXPVTd54=jQv8dke=JY0Qm3C96JMKDsgT3==g@mail.gmail.com> <7293c3f6-d1d8-4397-8f31-a456cd06c7cb@quicinc.com>
In-Reply-To: <7293c3f6-d1d8-4397-8f31-a456cd06c7cb@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 13 Dec 2024 09:50:35 -0800
Message-ID: <CAF6AEGt1u29Rorf7oYB85xPcO+TdxYzB7aYzMxsxLaYtD8Q7cA@mail.gmail.com>
Subject: Re: [RFC] drm/msm: Add UABI to request perfcntr usage
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Antonino Maniscalco <antomani103@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 8:47=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 12/12/2024 10:42 PM, Rob Clark wrote:
> > On Thu, Dec 12, 2024 at 9:08=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>
> >> On Thu, Dec 12, 2024 at 7:59=E2=80=AFAM Akhil P Oommen <quic_akhilpo@q=
uicinc.com> wrote:
> >>>
> >>> On 12/5/2024 10:24 PM, Rob Clark wrote:
> >>>> From: Rob Clark <robdclark@chromium.org>
> >>>>
> >>>> Performance counter usage falls into two categories:
> >>>>
> >>>> 1. Local usage, where the counter configuration, start, and end read
> >>>>    happen within (locally to) a single SUBMIT.  In this case, there =
is
> >>>>    no dependency on counter configuration or values between submits,=
 and
> >>>>    in fact counters are normally cleared on context switches, making=
 it
> >>>>    impossible to rely on cross-submit state.
> >>>>
> >>>> 2. Global usage, where a single privilaged daemon/process is samplin=
g
> >>>>    counter values across all processes for profiling.
> >>>>
> >>>> The two categories are mutually exclusive.  While you can have many
> >>>> processes making local counter usage, you cannot combine global and
> >>>> local usage without the two stepping on each others feet (by changin=
g
> >>>> counter configuration).
>
> As such the HW doesn't have any limitation, unless you run out of
> counters in a group. We just need an arbitration between processes (UMD
> or KMD based).

True.. but is this actually needed?  Are there real-life use-cases?
Or is it just something that someone wrote down in a requirements
document because they could?

An app _can_ query the counters itself, although in isolation they
aren't super useful.  What a user/developer would actually find useful
are the derived counters that the global/system profiler provides.
The local counters are useful to get per-shader cycle counts, but I've
never found myself looking at that _and_ global/system profiler at the
same time.  Getting accurate local counter values involves inserting
extra WFI's breaking the GPU pipelining, making global profiling kinda
useless.

> Also, KGSL exposes an ioctl to directly read the counter with a fixed
> minimal latency. Because inline reads via submission may have huge
> latency spikes based on workload especially when compute shaders are
> involved. Isn't a low latency counter reads desirable in a fullfledged
> system profiler?

For system profiler, we read back the counters from the cpu[1].
Although we might need to revisit that for android.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/freedreno/perf=
cntrs/freedreno_dt.c?ref_type=3Dheads#L223

> >>>>
> >>>> For global counter usage, there is already a SYSPROF param (since gl=
obal
> >>>> counter usage requires disabling counter clearing on context switch)=
.
> >>>> This patch adds a REQ_CNTRS param to request local counter usage.  I=
f
> >>>> one or more processes has requested counter usage, then a SYSPROF
> >>>> request will fail with -EBUSY.  And if SYSPROF is active, then REQ_C=
NTRS
> >>>> will fail with -EBUSY, maintaining the mutual exclusivity.
> >>>>
> >>>> This is purely an advisory interface to help coordinate userspace.
> >>>> There is no real means of enforcement, but the worst that can happen=
 if
> >>>> userspace ignores a REQ_CNTRS failure is that you'll get nonsense
> >>>> profiling data.
> >>>>
> >>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>> ---
> >>>> kgsl takes a different approach, which involves a lot more UABI for
> >>>> assigning counters to different processes.  But I think by taking
> >>>> advantage of the fact that mesa (freedreno+turnip) reconfigure the
> >>>> counters they need in each SUBMIT, for their respective gl/vk perf-
> >>>> counter extensions, we can take this simpler approach.
> >>>
> >>> KGSL's approach is preemption and ifpc safe (also whatever HW changes
> >>> that will come up in future generations). How will we ensure that her=
e?
> >>>
> >>> I have plans to bring up IFPC support in near future. Also, I brought=
 up
> >>> this point during preemption series. But from the responses, I felt t=
hat
> >>> profiling was not considered a serious usecase. Still I wonder how th=
e
> >>> perfcounter extensions work accurately with preemption.
> >>
> >> Re: IFPC, I think initially we have to inhibit IFPC when SYSPROF is ac=
tive
> >>
> >> Longer term, I think we want to just save and restore all of the SEL
> >> regs as well as the counters themselves on preemption.  AFAIU
> >> currently only the counters themselves are saved/restored.  But there
> >> is only one 32b SEL reg for each 64b counter, so I'm not sure that you
> >> save that many cycles by not just saving/restoring the SEL regs as
> >> well.  (And of course with REQ_CNTRS the kernel knows which processes
> >> need counter save/restore and which do not, so you are only taking the
> >> extra context switch overhead if a process is actually using the
> >> perfcntrs.)
> >
> > Actually I'm maybe blending two different, but similar cases.
> > PREAMBLE/POSTAMBLE, I think, cover us for preemption
> >
> > For IFPC, we'd need a way to tell GMU that SYSPROF is active, so it
> > could save/restore all the counters and selectors  (IFPC shouldn't
> > matter for local profiling / REQ_CNTRS case, since you wouldn't go
> > into IFPC mid-submit.)
> >
> > BR,
> > -R
> >
> >> Alternatively, I think we could just declare this as a userspace
> >> problem, and solve it with CP_SET_AMBLE PREAMBLE/POSTAMBLE?
> >>
> >> Just for background, rendernode UABI is exposed to all processes that
> >> can use the GPU, ie. basically everything.  Which makes it an
> >> attractive attack surface.  This is why I prefer minimalism when it
> >> comes to UABI, and not adding new ioctls and complexity in the kernel
> >> when it is not essential ;-)
>
> I fully agree with you about maintaining minimalism in KMD. Here all we
> need is a way for UMD to ask "give me a counter offset with 'x'
> countable from 'y' group". And let KMD do the arbitration of counters
> between userspace processes and also within KMD. And we can cut down on
> some of the related things present in kgsl which are unnecessary at the
> moment.

I'm not completely ruling it out.. just trying to figure out if we
actually need it.  Maybe android forces us to switch to something
other than devmem for reading counters?  That is the most plausible
reason I could think of to add UABI for this.

(OTOH we could alternatively just give privileged userspace a way to
mmap the mmio for percntrs via drm instead of devmem)

> More importantly, I am not sure if we should really fight hard against
> something that is basically an architectur spec. Future HW evolution
> happens based on this architecture. So is it really wise to build things
> in the opposite direction. FYI, all other GPU KMD drivers which Qcom
> uses are aligned on this.

Sure, but future hw is going to need future userspace.  It isn't
really problematic to introduce a new UABI for future hw, because
there is no "new kernel + old userspace" scenario.

BR,
-R

> -Akhil
>
> >>
> >> BR,
> >> -R
> >>
> >>> -Akhil
> >>>
> >>>>
> >>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
> >>>>  drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
> >>>>  drivers/gpu/drm/msm/msm_gpu.c           |  1 +
> >>>>  drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
> >>>>  drivers/gpu/drm/msm/msm_submitqueue.c   | 52 ++++++++++++++++++++++=
++-
> >>>>  include/uapi/drm/msm_drm.h              |  1 +
> >>>>  6 files changed, 85 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/d=
rm/msm/adreno/adreno_gpu.c
> >>>> index 31bbf2c83de4..f688e37059b8 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>> @@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct=
 msm_file_private *ctx,
> >>>>               if (!capable(CAP_SYS_ADMIN))
> >>>>                       return UERR(EPERM, drm, "invalid permissions")=
;
> >>>>               return msm_file_private_set_sysprof(ctx, gpu, value);
> >>>> +     case MSM_PARAM_REQ_CNTRS:
> >>>> +             return msm_file_private_request_counters(ctx, gpu, val=
ue);
> >>>>       default:
> >>>>               return UERR(EINVAL, drm, "%s: invalid param: %u", gpu-=
>name, param);
> >>>>       }
> >>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm=
_drv.c
> >>>> index 6416d2cb4efc..bf8314ff4a25 100644
> >>>> --- a/drivers/gpu/drm/msm/msm_drv.c
> >>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
> >>>> @@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device *de=
v, struct drm_file *file)
> >>>>        * It is not possible to set sysprof param to non-zero if gpu
> >>>>        * is not initialized:
> >>>>        */
> >>>> -     if (priv->gpu)
> >>>> +     if (ctx->sysprof)
> >>>>               msm_file_private_set_sysprof(ctx, priv->gpu, 0);
> >>>>
> >>>> +     if (ctx->counters_requested)
> >>>> +             msm_file_private_request_counters(ctx, priv->gpu, 0);
> >>>> +
> >>>>       context_close(ctx);
> >>>>  }
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm=
_gpu.c
> >>>> index 82f204f3bb8f..013b59ca3bb1 100644
> >>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >>>> @@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, struct =
platform_device *pdev,
> >>>>       gpu->nr_rings =3D nr_rings;
> >>>>
> >>>>       refcount_set(&gpu->sysprof_active, 1);
> >>>> +     refcount_set(&gpu->local_counters_active, 1);
> >>>>
> >>>>       return 0;
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm=
_gpu.h
> >>>> index e25009150579..83c61e523b1b 100644
> >>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
> >>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> >>>> @@ -195,12 +195,28 @@ struct msm_gpu {
> >>>>       int nr_rings;
> >>>>
> >>>>       /**
> >>>> -      * sysprof_active:
> >>>> +      * @sysprof_active:
> >>>>        *
> >>>> -      * The count of contexts that have enabled system profiling.
> >>>> +      * The count of contexts that have enabled system profiling pl=
us one.
> >>>> +      *
> >>>> +      * Note: refcount_t does not like 0->1 transitions.. we want t=
o keep
> >>>> +      * the under/overflow checks that refcount_t provides, but all=
ow
> >>>> +      * multiple on/off transitions so we track the logical value p=
lus one.)
> >>>>        */
> >>>>       refcount_t sysprof_active;
> >>>>
> >>>> +     /**
> >>>> +      * @local_counters_active:
> >>>> +      *
> >>>> +      * The count of contexts that have requested local (intra-subm=
it)
> >>>> +      * performance counter usage plus one.
> >>>> +      *
> >>>> +      * Note: refcount_t does not like 0->1 transitions.. we want t=
o keep
> >>>> +      * the under/overflow checks that refcount_t provides, but all=
ow
> >>>> +      * multiple on/off transitions so we track the logical value p=
lus one.)
> >>>> +      */
> >>>> +     refcount_t local_counters_active;
> >>>> +
> >>>>       /**
> >>>>        * lock:
> >>>>        *
> >>>> @@ -383,6 +399,13 @@ struct msm_file_private {
> >>>>        */
> >>>>       int sysprof;
> >>>>
> >>>> +     /**
> >>>> +      * @counters_requested:
> >>>> +      *
> >>>> +      * Has the context requested local perfcntr usage.
> >>>> +      */
> >>>> +     bool counters_requested;
> >>>> +
> >>>>       /**
> >>>>        * comm: Overridden task comm, see MSM_PARAM_COMM
> >>>>        *
> >>>> @@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kref);
> >>>>
> >>>>  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> >>>>                                struct msm_gpu *gpu, int sysprof);
> >>>> +int msm_file_private_request_counters(struct msm_file_private *ctx,
> >>>> +                                   struct msm_gpu *gpu, int reqcntr=
s);
> >>>>  void __msm_file_private_destroy(struct kref *kref);
> >>>>
> >>>>  static inline void msm_file_private_put(struct msm_file_private *ct=
x)
> >>>> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm=
/msm/msm_submitqueue.c
> >>>> index 7fed1de63b5d..1e1e21e6f7ae 100644
> >>>> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> >>>> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> >>>> @@ -10,6 +10,15 @@
> >>>>  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> >>>>                                struct msm_gpu *gpu, int sysprof)
> >>>>  {
> >>>> +     int ret =3D 0;
> >>>> +
> >>>> +     mutex_lock(&gpu->lock);
> >>>> +
> >>>> +     if (sysprof && (refcount_read(&gpu->local_counters_active) > 1=
)) {
> >>>> +             ret =3D UERR(EBUSY, gpu->dev, "Local counter usage act=
ive");
> >>>> +             goto out_unlock;
> >>>> +     }
> >>>> +
> >>>>       /*
> >>>>        * Since pm_runtime and sysprof_active are both refcounts, we
> >>>>        * call apply the new value first, and then unwind the previou=
s
> >>>> @@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct msm_file_p=
rivate *ctx,
> >>>>
> >>>>       switch (sysprof) {
> >>>>       default:
> >>>> -             return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", s=
ysprof);
> >>>> +             ret =3D UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", =
sysprof);
> >>>> +             goto out_unlock;
> >>>>       case 2:
> >>>>               pm_runtime_get_sync(&gpu->pdev->dev);
> >>>>               fallthrough;
> >>>> @@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct msm_file_=
private *ctx,
> >>>>
> >>>>       ctx->sysprof =3D sysprof;
> >>>>
> >>>> -     return 0;
> >>>> +out_unlock:
> >>>> +     mutex_unlock(&gpu->lock);
> >>>> +
> >>>> +     return ret;
> >>>> +}
> >>>> +
> >>>> +int msm_file_private_request_counters(struct msm_file_private *ctx,
> >>>> +                                   struct msm_gpu *gpu, int reqctrs=
)
> >>>> +{
> >>>> +     int ret =3D 0;
> >>>> +
> >>>> +     mutex_lock(&gpu->lock);
> >>>> +
> >>>> +     if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
> >>>> +             ret =3D UERR(EBUSY, gpu->dev, "System profiling active=
");
> >>>> +             goto out_unlock;
> >>>> +     }
> >>>> +
> >>>> +     if (reqctrs) {
> >>>> +             if (ctx->counters_requested) {
> >>>> +                     ret =3D UERR(EINVAL, gpu->dev, "Already reques=
ted");
> >>>> +                     goto out_unlock;
> >>>> +             }
> >>>> +
> >>>> +             ctx->counters_requested =3D true;
> >>>> +             refcount_inc(&gpu->local_counters_active);
> >>>> +     } else {
> >>>> +             if (!ctx->counters_requested) {
> >>>> +                     ret =3D UERR(EINVAL, gpu->dev, "Not requested"=
);
> >>>> +                     goto out_unlock;
> >>>> +             }
> >>>> +             refcount_dec(&gpu->local_counters_active);
> >>>> +             ctx->counters_requested =3D false;
> >>>> +     }
> >>>> +
> >>>> +out_unlock:
> >>>> +     mutex_unlock(&gpu->lock);
> >>>> +
> >>>> +     return ret;
> >>>>  }
> >>>>
> >>>>  void __msm_file_private_destroy(struct kref *kref)
> >>>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> >>>> index 2342cb90857e..ae7fb355e4a1 100644
> >>>> --- a/include/uapi/drm/msm_drm.h
> >>>> +++ b/include/uapi/drm/msm_drm.h
> >>>> @@ -91,6 +91,7 @@ struct drm_msm_timespec {
> >>>>  #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
> >>>>  #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> >>>>  #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
> >>>> +#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-sub=
mit) perfcntr usage  */
> >>>>
> >>>>  /* For backwards compat.  The original support for preemption was b=
ased on
> >>>>   * a single ring per priority level so # of priority levels equals =
the #
> >>>
>

