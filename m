Return-Path: <linux-arm-msm+bounces-42366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B209F373E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 18:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D932B7A5CC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 17:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2CB204573;
	Mon, 16 Dec 2024 17:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbK19xuN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87FC53E23;
	Mon, 16 Dec 2024 17:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734369400; cv=none; b=mFmeQssh9Jo+A2NGqqVGDJHxucOV1o7BWhZBnoYNXdzJMy/NwSzLQUGKBuVYJMucrvcDybu484tnoB9jQ4B5saq7AXvXmq4setYfvy8K8YHZSjXCuwvShRs2H+sVkzlhNIgYkEFdekcmwXlO+P2gyuHOwKedEJYBG6DZ/nQnUFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734369400; c=relaxed/simple;
	bh=4JHPGpA38WOZsGPTLBNCLLby+8EoY+d1gP52px0G9WY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBhHX0hniQOwdzwT4blEV2mwoolez+yNJeDizC3EstnBFd8H/PmcRoec3vIDXSv5dUFQGbdlFhAzqN7nD+SNGNT1k0sKN1rUukjiH1pWrwKPiMg7qC0CejmvqUH4z4HcfYHMH8IFGmKQL4On5VtyjNW21TAIdfccxKA4JgBPVpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbK19xuN; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a814831760so13366595ab.1;
        Mon, 16 Dec 2024 09:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734369398; x=1734974198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDT6AtCaej5iLDcBpJoiNcUJya9EiPCQcvDwSRHq2nk=;
        b=gbK19xuNBEmiFx4oFHF8ce+h8dWbM9otoT7KKyeroFOfVJrPLuHB1W03qBwOpstCmh
         sOvqXXu0Fy3lzZJGkVl2t1aVvfPm2sVJDfWzNCWeMtPG6BOSxDuNgOCRlpmwA8jSopVi
         8tggfUqcG2aNGA9bp+fE6E+Mh58Gdc2TdHyh22PGAEdKgsMTqNXbFAXVl4XAXtgqFR4i
         MG36oa2r85BMrQdpvO1cPrvtSizJ+S8xM/QTtse9cmcHl5qYhGG2RLO1NWQ73mXtCD6s
         /T+MVo77K9PzV5wpkXr7xSF+geKAvlHvn8F8YIeMsKVyJ6bEfmGUF8thmqU383xhW9V0
         ak0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734369398; x=1734974198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDT6AtCaej5iLDcBpJoiNcUJya9EiPCQcvDwSRHq2nk=;
        b=NEx4vjfzKPQPEvoBIYcHncmE3Fq7R5J/FM9qwWv81nNuVCYdzxPPiwXg1SBNYJnB6l
         xpaLIDFQkEuSgx8/1aKjOwkRKR1n9IWhoH3sHtvpOF9S8A1Cxw78+MEX+d/KNR54jXWm
         Vy0OAcz1otSGNKYeyr25JpBy48aGSsX/VPVN4vaigg7rfmYqSwnM08RZy2QoGQddm6W/
         ANqUzzVcJwR+Jn+tzx0mkm8BWXdj2j3zx58xnfEN7Xs+8QmcJoQM97YS+79rZR7TMPS1
         +i4d6pYVu+bCQBs5tRBQqQwj8rouQOSrO2JvQHzk1qXOktkNE3CC1GMSVpshLyoRngSl
         U/tg==
X-Forwarded-Encrypted: i=1; AJvYcCVgmqW5YGyTVpt+Yks1GsT1LeHF5/tebdQK+Lt36cqT7ZamQdYxqy1YlAMqa12e0Z5KGxvMHkM7mPSyXRO7@vger.kernel.org, AJvYcCXXp1vr8QQxfKfh/4R27qpnOMYy+5X7/UeOYUrxzLOdOHLJnOIYyq5nGgnKaTCA7/qqNAKLFAPbbFik0gjJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxUadxb5rwRyQy8oyACx365xKKpImsJ9LZmtZLmhKXyOO9l0PQj
	p4bWUmJZ5Gm3rvvH3bhg1i6WV5SD4rQ1oQJlDtfoOuuL7SdlqvydQVuBz6crRnlOwIOfmLiCbWB
	q9dunInOhJvWH5sFGvA8pZy5Kw9I=
X-Gm-Gg: ASbGncvVAoA6kb51sD5oeh+45z22exseQ6PHbcLuxSU+mHW18H9RATeCaxmydJ0i5RJ
	Ad71Qe5GkaRyM7n/mZbgz2WoPGHEW3beVi9gajZLfdNdDX5T/H+Krnaihp3eu3eX/UNtg
X-Google-Smtp-Source: AGHT+IHnw172+OBLMauq5RpYf5769qfvNNUBwlui0b746a3Vf7AEBohjTzzV55n6c7JeedCFyia0m4GEYxQQhs2YOLA=
X-Received: by 2002:a05:6e02:152e:b0:3a7:6c5c:9aa4 with SMTP id
 e9e14a558f8ab-3aff039a391mr146698655ab.12.1734369397606; Mon, 16 Dec 2024
 09:16:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205165419.54080-1-robdclark@gmail.com> <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
 <de6cfac6-84a0-4160-b279-c23e10f96872@gmail.com> <96e918d7-6e29-4d0a-8e9d-b77232c37ef0@quicinc.com>
 <30fadc96-d531-4cde-a717-c5983908ea04@gmail.com> <ae351364-7590-4080-baea-80133c79c86f@quicinc.com>
 <CACu1E7E4Ege0VgsSmjzqPDYg7eWwRWQOjPyyCT-ty5tEYKP-bg@mail.gmail.com>
In-Reply-To: <CACu1E7E4Ege0VgsSmjzqPDYg7eWwRWQOjPyyCT-ty5tEYKP-bg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 16 Dec 2024 09:16:25 -0800
Message-ID: <CAF6AEGtvie_DCUpesjYj8ozFpGUD9f0rLtQ6JdihSOV_S_LcWA@mail.gmail.com>
Subject: Re: [RFC] drm/msm: Add UABI to request perfcntr usage
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Antonino Maniscalco <antomani103@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 8:59=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Mon, Dec 16, 2024 at 11:55=E2=80=AFAM Akhil P Oommen
> <quic_akhilpo@quicinc.com> wrote:
> >
> > On 12/13/2024 10:40 PM, Antonino Maniscalco wrote:
> > > On 12/13/24 5:50 PM, Akhil P Oommen wrote:
> > >> On 12/12/2024 9:44 PM, Antonino Maniscalco wrote:
> > >>> On 12/12/24 4:58 PM, Akhil P Oommen wrote:
> > >>>> On 12/5/2024 10:24 PM, Rob Clark wrote:
> > >>>>> From: Rob Clark <robdclark@chromium.org>
> > >>>>>
> > >>>>> Performance counter usage falls into two categories:
> > >>>>>
> > >>>>> 1. Local usage, where the counter configuration, start, and end r=
ead
> > >>>>>      happen within (locally to) a single SUBMIT.  In this case,
> > >>>>> there is
> > >>>>>      no dependency on counter configuration or values between sub=
mits,
> > >>>>> and
> > >>>>>      in fact counters are normally cleared on context switches,
> > >>>>> making it
> > >>>>>      impossible to rely on cross-submit state.
> > >>>>>
> > >>>>> 2. Global usage, where a single privilaged daemon/process is samp=
ling
> > >>>>>      counter values across all processes for profiling.
> > >>>>>
> > >>>>> The two categories are mutually exclusive.  While you can have ma=
ny
> > >>>>> processes making local counter usage, you cannot combine global a=
nd
> > >>>>> local usage without the two stepping on each others feet (by chan=
ging
> > >>>>> counter configuration).
> > >>>>>
> > >>>>> For global counter usage, there is already a SYSPROF param (since
> > >>>>> global
> > >>>>> counter usage requires disabling counter clearing on context swit=
ch).
> > >>>>> This patch adds a REQ_CNTRS param to request local counter usage.=
  If
> > >>>>> one or more processes has requested counter usage, then a SYSPROF
> > >>>>> request will fail with -EBUSY.  And if SYSPROF is active, then
> > >>>>> REQ_CNTRS
> > >>>>> will fail with -EBUSY, maintaining the mutual exclusivity.
> > >>>>>
> > >>>>> This is purely an advisory interface to help coordinate userspace=
.
> > >>>>> There is no real means of enforcement, but the worst that can
> > >>>>> happen if
> > >>>>> userspace ignores a REQ_CNTRS failure is that you'll get nonsense
> > >>>>> profiling data.
> > >>>>>
> > >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> > >>>>> ---
> > >>>>> kgsl takes a different approach, which involves a lot more UABI f=
or
> > >>>>> assigning counters to different processes.  But I think by taking
> > >>>>> advantage of the fact that mesa (freedreno+turnip) reconfigure th=
e
> > >>>>> counters they need in each SUBMIT, for their respective gl/vk per=
f-
> > >>>>> counter extensions, we can take this simpler approach.
> > >>>>
> > >>>> KGSL's approach is preemption and ifpc safe (also whatever HW chan=
ges
> > >>>> that will come up in future generations). How will we ensure that =
here?
> > >>>>
> > >>>> I have plans to bring up IFPC support in near future. Also, I
> > >>>> brought up
> > >>>> this point during preemption series. But from the responses, I fel=
t
> > >>>> that
> > >>>> profiling was not considered a serious usecase. Still I wonder how=
 the
> > >>>> perfcounter extensions work accurately with preemption.
> > >>>
> > >>> So back then I implemented the postamble IB to clear perf counters =
and
> > >>> that gets disabled when sysprof (so global usage) is happening. The
> > >>> kernel is oblivious to "Local isage" of profiling but in that case
> > >>> really what we want to do is disable preemption which in my
> > >>> understanding can be done from userspace with a PKT. In my understa=
nding
> > >>> this had us covered for all usecases.
> > >>
> > >> I think this wasn't mentioned at that time. Which UMD PKT in a6x+ di=
d
> > >> you mean?
> > >
> > > Ah, I thought it wasmentioned, sorry.
> > > The packet I was referring to is:
> > >     <doc> Make next dword 1 to disable preemption, 0 to re-enable it.=
 </
> > > doc>
> > >     <value name=3D"CP_PREEMPT_DISABLE" value=3D"0x6c" variants=3D"A6X=
X"/>
> >
> > Ah! Okay. I think this packet is not used by the downstream blob. IMO,
> > disabling preemption is still a suboptimal solution.
>
> Downstream doesn't expose userspace perfcounters (i.e.
> VK_KHR_performance_query) at all. My understanding is that Android
> requires you not to expose them for security reasons, but I could be
> wrong there. In any case, Qualcomm clearly hasn't really thought
> through what it would take to make everything work well with userspace
> perfcounters and hasn't implemented the necessary firmware bits for
> that, so we're left muddling through and doing what we can.

That is correct, VK_KHR_performance_query is disallowed on android.
There is an android CTS test for that.

BR,
-R

>
> Connor
>
> >
> > >
> > > BTW you mentioned wanting to look into IFPC. Since I too wanted to lo=
ok
> > > into implementing it wonder if you could let me know when you planned=
 on
> > > working on it.
> >
> > I have few patches in progress. Nothing final yet and need verification
> > on the hw side. Also, I need to do some housekeeping here to debug gmu
> > issues since IFPC increases the probability of those a lot.
> >
> > I will try to send out the patches very soon.
> >
> > -Akhil.
> >
> > >
> > >>
> > >> -Akhil.
> > >>
> > >>>
> > >>> So what would you expect instead we should do kernel side to make
> > >>> profiling preemption safe?
> > >>>
> > >>>>
> > >>>> -Akhil
> > >>>>
> > >>>>>
> > >>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
> > >>>>>    drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
> > >>>>>    drivers/gpu/drm/msm/msm_gpu.c           |  1 +
> > >>>>>    drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
> > >>>>>    drivers/gpu/drm/msm/msm_submitqueue.c   | 52 +++++++++++++++++=
++
> > >>>>> +++++-
> > >>>>>    include/uapi/drm/msm_drm.h              |  1 +
> > >>>>>    6 files changed, 85 insertions(+), 5 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gp=
u/
> > >>>>> drm/msm/adreno/adreno_gpu.c
> > >>>>> index 31bbf2c83de4..f688e37059b8 100644
> > >>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > >>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > >>>>> @@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, str=
uct
> > >>>>> msm_file_private *ctx,
> > >>>>>            if (!capable(CAP_SYS_ADMIN))
> > >>>>>                return UERR(EPERM, drm, "invalid permissions");
> > >>>>>            return msm_file_private_set_sysprof(ctx, gpu, value);
> > >>>>> +    case MSM_PARAM_REQ_CNTRS:
> > >>>>> +        return msm_file_private_request_counters(ctx, gpu, value=
);
> > >>>>>        default:
> > >>>>>            return UERR(EINVAL, drm, "%s: invalid param: %u", gpu-
> > >>>>>> name, param);
> > >>>>>        }
> > >>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/
> > >>>>> msm_drv.c
> > >>>>> index 6416d2cb4efc..bf8314ff4a25 100644
> > >>>>> --- a/drivers/gpu/drm/msm/msm_drv.c
> > >>>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
> > >>>>> @@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device
> > >>>>> *dev, struct drm_file *file)
> > >>>>>         * It is not possible to set sysprof param to non-zero if =
gpu
> > >>>>>         * is not initialized:
> > >>>>>         */
> > >>>>> -    if (priv->gpu)
> > >>>>> +    if (ctx->sysprof)
> > >>>>>            msm_file_private_set_sysprof(ctx, priv->gpu, 0);
> > >>>>>    +    if (ctx->counters_requested)
> > >>>>> +        msm_file_private_request_counters(ctx, priv->gpu, 0);
> > >>>>> +
> > >>>>>        context_close(ctx);
> > >>>>>    }
> > >>>>>    diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/m=
sm/
> > >>>>> msm_gpu.c
> > >>>>> index 82f204f3bb8f..013b59ca3bb1 100644
> > >>>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
> > >>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > >>>>> @@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, stru=
ct
> > >>>>> platform_device *pdev,
> > >>>>>        gpu->nr_rings =3D nr_rings;
> > >>>>>          refcount_set(&gpu->sysprof_active, 1);
> > >>>>> +    refcount_set(&gpu->local_counters_active, 1);
> > >>>>>          return 0;
> > >>>>>    diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/m=
sm/
> > >>>>> msm_gpu.h
> > >>>>> index e25009150579..83c61e523b1b 100644
> > >>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
> > >>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > >>>>> @@ -195,12 +195,28 @@ struct msm_gpu {
> > >>>>>        int nr_rings;
> > >>>>>          /**
> > >>>>> -     * sysprof_active:
> > >>>>> +     * @sysprof_active:
> > >>>>>         *
> > >>>>> -     * The count of contexts that have enabled system profiling.
> > >>>>> +     * The count of contexts that have enabled system profiling =
plus
> > >>>>> one.
> > >>>>> +     *
> > >>>>> +     * Note: refcount_t does not like 0->1 transitions.. we want=
 to
> > >>>>> keep
> > >>>>> +     * the under/overflow checks that refcount_t provides, but a=
llow
> > >>>>> +     * multiple on/off transitions so we track the logical value
> > >>>>> plus one.)
> > >>>>>         */
> > >>>>>        refcount_t sysprof_active;
> > >>>>>    +    /**
> > >>>>> +     * @local_counters_active:
> > >>>>> +     *
> > >>>>> +     * The count of contexts that have requested local (intra-su=
bmit)
> > >>>>> +     * performance counter usage plus one.
> > >>>>> +     *
> > >>>>> +     * Note: refcount_t does not like 0->1 transitions.. we want=
 to
> > >>>>> keep
> > >>>>> +     * the under/overflow checks that refcount_t provides, but a=
llow
> > >>>>> +     * multiple on/off transitions so we track the logical value
> > >>>>> plus one.)
> > >>>>> +     */
> > >>>>> +    refcount_t local_counters_active;
> > >>>>> +
> > >>>>>        /**
> > >>>>>         * lock:
> > >>>>>         *
> > >>>>> @@ -383,6 +399,13 @@ struct msm_file_private {
> > >>>>>         */
> > >>>>>        int sysprof;
> > >>>>>    +    /**
> > >>>>> +     * @counters_requested:
> > >>>>> +     *
> > >>>>> +     * Has the context requested local perfcntr usage.
> > >>>>> +     */
> > >>>>> +    bool counters_requested;
> > >>>>> +
> > >>>>>        /**
> > >>>>>         * comm: Overridden task comm, see MSM_PARAM_COMM
> > >>>>>         *
> > >>>>> @@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kre=
f);
> > >>>>>      int msm_file_private_set_sysprof(struct msm_file_private *ct=
x,
> > >>>>>                     struct msm_gpu *gpu, int sysprof);
> > >>>>> +int msm_file_private_request_counters(struct msm_file_private *c=
tx,
> > >>>>> +                      struct msm_gpu *gpu, int reqcntrs);
> > >>>>>    void __msm_file_private_destroy(struct kref *kref);
> > >>>>>      static inline void msm_file_private_put(struct msm_file_priv=
ate
> > >>>>> *ctx)
> > >>>>> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/=
drm/
> > >>>>> msm/msm_submitqueue.c
> > >>>>> index 7fed1de63b5d..1e1e21e6f7ae 100644
> > >>>>> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > >>>>> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > >>>>> @@ -10,6 +10,15 @@
> > >>>>>    int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> > >>>>>                     struct msm_gpu *gpu, int sysprof)
> > >>>>>    {
> > >>>>> +    int ret =3D 0;
> > >>>>> +
> > >>>>> +    mutex_lock(&gpu->lock);
> > >>>>> +
> > >>>>> +    if (sysprof && (refcount_read(&gpu->local_counters_active) >
> > >>>>> 1)) {
> > >>>>> +        ret =3D UERR(EBUSY, gpu->dev, "Local counter usage activ=
e");
> > >>>>> +        goto out_unlock;
> > >>>>> +    }
> > >>>>> +
> > >>>>>        /*
> > >>>>>         * Since pm_runtime and sysprof_active are both refcounts,=
 we
> > >>>>>         * call apply the new value first, and then unwind the pre=
vious
> > >>>>> @@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct
> > >>>>> msm_file_private *ctx,
> > >>>>>          switch (sysprof) {
> > >>>>>        default:
> > >>>>> -        return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d",
> > >>>>> sysprof);
> > >>>>> +        ret =3D UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sy=
sprof);
> > >>>>> +        goto out_unlock;
> > >>>>>        case 2:
> > >>>>>            pm_runtime_get_sync(&gpu->pdev->dev);
> > >>>>>            fallthrough;
> > >>>>> @@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct
> > >>>>> msm_file_private *ctx,
> > >>>>>          ctx->sysprof =3D sysprof;
> > >>>>>    -    return 0;
> > >>>>> +out_unlock:
> > >>>>> +    mutex_unlock(&gpu->lock);
> > >>>>> +
> > >>>>> +    return ret;
> > >>>>> +}
> > >>>>> +
> > >>>>> +int msm_file_private_request_counters(struct msm_file_private *c=
tx,
> > >>>>> +                      struct msm_gpu *gpu, int reqctrs)
> > >>>>> +{
> > >>>>> +    int ret =3D 0;
> > >>>>> +
> > >>>>> +    mutex_lock(&gpu->lock);
> > >>>>> +
> > >>>>> +    if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
> > >>>>> +        ret =3D UERR(EBUSY, gpu->dev, "System profiling active")=
;
> > >>>>> +        goto out_unlock;
> > >>>>> +    }
> > >>>>> +
> > >>>>> +    if (reqctrs) {
> > >>>>> +        if (ctx->counters_requested) {
> > >>>>> +            ret =3D UERR(EINVAL, gpu->dev, "Already requested");
> > >>>>> +            goto out_unlock;
> > >>>>> +        }
> > >>>>> +
> > >>>>> +        ctx->counters_requested =3D true;
> > >>>>> +        refcount_inc(&gpu->local_counters_active);
> > >>>>> +    } else {
> > >>>>> +        if (!ctx->counters_requested) {
> > >>>>> +            ret =3D UERR(EINVAL, gpu->dev, "Not requested");
> > >>>>> +            goto out_unlock;
> > >>>>> +        }
> > >>>>> +        refcount_dec(&gpu->local_counters_active);
> > >>>>> +        ctx->counters_requested =3D false;
> > >>>>> +    }
> > >>>>> +
> > >>>>> +out_unlock:
> > >>>>> +    mutex_unlock(&gpu->lock);
> > >>>>> +
> > >>>>> +    return ret;
> > >>>>>    }
> > >>>>>      void __msm_file_private_destroy(struct kref *kref)
> > >>>>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_dr=
m.h
> > >>>>> index 2342cb90857e..ae7fb355e4a1 100644
> > >>>>> --- a/include/uapi/drm/msm_drm.h
> > >>>>> +++ b/include/uapi/drm/msm_drm.h
> > >>>>> @@ -91,6 +91,7 @@ struct drm_msm_timespec {
> > >>>>>    #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
> > >>>>>    #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> > >>>>>    #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
> > >>>>> +#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-
> > >>>>> submit) perfcntr usage  */
> > >>>>>      /* For backwards compat.  The original support for preemptio=
n was
> > >>>>> based on
> > >>>>>     * a single ring per priority level so # of priority levels eq=
uals
> > >>>>> the #
> > >>>>
> > >>>
> > >>>
> > >>> Best regards,
> > >>
> > >
> > >
> > > Best regards,
> >

