Return-Path: <linux-arm-msm+bounces-42364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE929F36F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 18:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 841FC16F850
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 17:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B182149C57;
	Mon, 16 Dec 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLMSODDk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A00E20626D;
	Mon, 16 Dec 2024 16:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734368344; cv=none; b=rozrB1p/w4vuMXRm878svbCNXeCxRIpaPBB2Q9O28Tcc2hDdBQRtans4Y523XGmf+hnVZ16zK+fMMav3wzDCDyxnlpdwfxhkYI4wyi98yxNicg4iHsQk1qNRkkG2CG4kEw7JM572BWPmNE9IRC6R0vRuHksCs8m19ntnz6etGSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734368344; c=relaxed/simple;
	bh=dX7We7X0CogR804w8YJPNkFBIT6fj2U9BpyCnooXzz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4c4WGB00LQcX1y/MLN+3YG2NkhUbMrtzqQD/izZXKrAGLWsAjuFFDm6gbQKGPHoy874j2ToCnuMhBvaeNAKjabo9DGoJ/0OA1GlPq1559tbSuK6UqzGQb/uBzkqhHdqqPHC7X3gGzKc7zy2uNy90qBLFHFzeHdPOJPUETHRClI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLMSODDk; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fd44f1e5faso468966a12.2;
        Mon, 16 Dec 2024 08:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734368342; x=1734973142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+YJnxqmK04Pa80TxUjlUx8bfVnXNIJ0Z7Fk3CmLaqs=;
        b=GLMSODDks84ipiJ9Fw4Ba7pfQqAjOhZzuYwjbmqM4DnG8dcc91711L88KLfSF42tYA
         J4HkfSm52xSVe/AxuZhYpp5Bl6XF8z35nfzJJtI8SdqD3zkgGNB5IQx4KYQozw8PTGFz
         4IYc76AaB6o/kn6ZVOBX/KiXyw5oowm4IZcHx/b/9xg1uFo1f95ZxaqaZOAu8pWHfix5
         qkgRtl2lyQTGY02qsWK1b9Hkj+5tHTcnNSaf/Py482e66BdSuhVpSObdGVkogDxlT3or
         QLUptMfl3qziRfvHtmbNjmne9hKUFe7io0uKOUEX4fAejhUd1juYmU3hH4PcgO7Vvu8b
         GIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734368342; x=1734973142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+YJnxqmK04Pa80TxUjlUx8bfVnXNIJ0Z7Fk3CmLaqs=;
        b=EW8e7p/rVG+c2sTxRounzbK8iKvNpv0XpfSeCm7Z9EkVRpmRSmRhl3yyYK9pFU6RwE
         u+3QlNReg3vprmFppD7EJsUb+3JK23kjLB7Uu2Js9IRylURpy0vAxEIRUiJIjw0056Fv
         OqbWkaEBtgZUZpy3Sced5vAPDpVXQorJjw390B5GOQapa/xsUTI0/w0pGYKj5gP83sUI
         6cc8JAhcvfZLUruyZ/IDN2F+YAfKjTm/EHsNARG+g1DDbXaTA8FulDGOegzmWADRbpva
         4x0yJ0GtHPneGABZGAoEdTS7JU23vsQqtHhlrUbu3aZwGTA9HiT4oeRPKYntwR4FOS4C
         T5KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN3Ep99UBJIC4ouMTNDoEFY9NnvFJxpOjvmNd8qup1gDtQYDvSJ+x7L7cuG+TstQ5H9gQ//L4iTbGAjqTM@vger.kernel.org, AJvYcCW1ApPPlANJv54IlIQnRef48lyO8NxCgx3115o4751Bx6r17RWi5BgKsoxz2kdKi4W1y90b4tAiR5Kimltd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi4VGCHhRcKZMiz025RiGKk2cm86JrAmtKR3n64kWWjH5Q1IDL
	yTAfqGmz5qfeuJqiYOY80UnNwSiz8jpkIG0R+8vKBMmwIAKrWcfm/QBM9kIQShv+sENlmcR9JBc
	x4Ry5wnl084fTkFQj6uB1PcrNnMk=
X-Gm-Gg: ASbGncv9Qm70zitMzAD/JthyQKOS/54Kv8U28jYVgcLSsHLK4eOSArJ8Nllv3XxUgu9
	gbGKM161tBtphMBdZmsIZe4YhT/hTA84vt7RbWQ==
X-Google-Smtp-Source: AGHT+IFso+//RTcmJRYzalZhkuD/c0CFBeKBCX29yQOWo/dbDDaOyPZqXbDmDZ0j3QhoUOoIGBkilQy41KGWOvYRmJU=
X-Received: by 2002:a17:90b:3c51:b0:2ee:d372:91bd with SMTP id
 98e67ed59e1d1-2f28fa4b6f6mr7199215a91.2.1734368341543; Mon, 16 Dec 2024
 08:59:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205165419.54080-1-robdclark@gmail.com> <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
 <de6cfac6-84a0-4160-b279-c23e10f96872@gmail.com> <96e918d7-6e29-4d0a-8e9d-b77232c37ef0@quicinc.com>
 <30fadc96-d531-4cde-a717-c5983908ea04@gmail.com> <ae351364-7590-4080-baea-80133c79c86f@quicinc.com>
In-Reply-To: <ae351364-7590-4080-baea-80133c79c86f@quicinc.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 16 Dec 2024 11:58:50 -0500
Message-ID: <CACu1E7E4Ege0VgsSmjzqPDYg7eWwRWQOjPyyCT-ty5tEYKP-bg@mail.gmail.com>
Subject: Re: [RFC] drm/msm: Add UABI to request perfcntr usage
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Rob Clark <robdclark@gmail.com>, 
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

On Mon, Dec 16, 2024 at 11:55=E2=80=AFAM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On 12/13/2024 10:40 PM, Antonino Maniscalco wrote:
> > On 12/13/24 5:50 PM, Akhil P Oommen wrote:
> >> On 12/12/2024 9:44 PM, Antonino Maniscalco wrote:
> >>> On 12/12/24 4:58 PM, Akhil P Oommen wrote:
> >>>> On 12/5/2024 10:24 PM, Rob Clark wrote:
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> Performance counter usage falls into two categories:
> >>>>>
> >>>>> 1. Local usage, where the counter configuration, start, and end rea=
d
> >>>>>      happen within (locally to) a single SUBMIT.  In this case,
> >>>>> there is
> >>>>>      no dependency on counter configuration or values between submi=
ts,
> >>>>> and
> >>>>>      in fact counters are normally cleared on context switches,
> >>>>> making it
> >>>>>      impossible to rely on cross-submit state.
> >>>>>
> >>>>> 2. Global usage, where a single privilaged daemon/process is sampli=
ng
> >>>>>      counter values across all processes for profiling.
> >>>>>
> >>>>> The two categories are mutually exclusive.  While you can have many
> >>>>> processes making local counter usage, you cannot combine global and
> >>>>> local usage without the two stepping on each others feet (by changi=
ng
> >>>>> counter configuration).
> >>>>>
> >>>>> For global counter usage, there is already a SYSPROF param (since
> >>>>> global
> >>>>> counter usage requires disabling counter clearing on context switch=
).
> >>>>> This patch adds a REQ_CNTRS param to request local counter usage.  =
If
> >>>>> one or more processes has requested counter usage, then a SYSPROF
> >>>>> request will fail with -EBUSY.  And if SYSPROF is active, then
> >>>>> REQ_CNTRS
> >>>>> will fail with -EBUSY, maintaining the mutual exclusivity.
> >>>>>
> >>>>> This is purely an advisory interface to help coordinate userspace.
> >>>>> There is no real means of enforcement, but the worst that can
> >>>>> happen if
> >>>>> userspace ignores a REQ_CNTRS failure is that you'll get nonsense
> >>>>> profiling data.
> >>>>>
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> ---
> >>>>> kgsl takes a different approach, which involves a lot more UABI for
> >>>>> assigning counters to different processes.  But I think by taking
> >>>>> advantage of the fact that mesa (freedreno+turnip) reconfigure the
> >>>>> counters they need in each SUBMIT, for their respective gl/vk perf-
> >>>>> counter extensions, we can take this simpler approach.
> >>>>
> >>>> KGSL's approach is preemption and ifpc safe (also whatever HW change=
s
> >>>> that will come up in future generations). How will we ensure that he=
re?
> >>>>
> >>>> I have plans to bring up IFPC support in near future. Also, I
> >>>> brought up
> >>>> this point during preemption series. But from the responses, I felt
> >>>> that
> >>>> profiling was not considered a serious usecase. Still I wonder how t=
he
> >>>> perfcounter extensions work accurately with preemption.
> >>>
> >>> So back then I implemented the postamble IB to clear perf counters an=
d
> >>> that gets disabled when sysprof (so global usage) is happening. The
> >>> kernel is oblivious to "Local isage" of profiling but in that case
> >>> really what we want to do is disable preemption which in my
> >>> understanding can be done from userspace with a PKT. In my understand=
ing
> >>> this had us covered for all usecases.
> >>
> >> I think this wasn't mentioned at that time. Which UMD PKT in a6x+ did
> >> you mean?
> >
> > Ah, I thought it wasmentioned, sorry.
> > The packet I was referring to is:
> >     <doc> Make next dword 1 to disable preemption, 0 to re-enable it. <=
/
> > doc>
> >     <value name=3D"CP_PREEMPT_DISABLE" value=3D"0x6c" variants=3D"A6XX"=
/>
>
> Ah! Okay. I think this packet is not used by the downstream blob. IMO,
> disabling preemption is still a suboptimal solution.

Downstream doesn't expose userspace perfcounters (i.e.
VK_KHR_performance_query) at all. My understanding is that Android
requires you not to expose them for security reasons, but I could be
wrong there. In any case, Qualcomm clearly hasn't really thought
through what it would take to make everything work well with userspace
perfcounters and hasn't implemented the necessary firmware bits for
that, so we're left muddling through and doing what we can.

Connor

>
> >
> > BTW you mentioned wanting to look into IFPC. Since I too wanted to look
> > into implementing it wonder if you could let me know when you planned o=
n
> > working on it.
>
> I have few patches in progress. Nothing final yet and need verification
> on the hw side. Also, I need to do some housekeeping here to debug gmu
> issues since IFPC increases the probability of those a lot.
>
> I will try to send out the patches very soon.
>
> -Akhil.
>
> >
> >>
> >> -Akhil.
> >>
> >>>
> >>> So what would you expect instead we should do kernel side to make
> >>> profiling preemption safe?
> >>>
> >>>>
> >>>> -Akhil
> >>>>
> >>>>>
> >>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
> >>>>>    drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
> >>>>>    drivers/gpu/drm/msm/msm_gpu.c           |  1 +
> >>>>>    drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
> >>>>>    drivers/gpu/drm/msm/msm_submitqueue.c   | 52 +++++++++++++++++++
> >>>>> +++++-
> >>>>>    include/uapi/drm/msm_drm.h              |  1 +
> >>>>>    6 files changed, 85 insertions(+), 5 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/
> >>>>> drm/msm/adreno/adreno_gpu.c
> >>>>> index 31bbf2c83de4..f688e37059b8 100644
> >>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>>> @@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, struc=
t
> >>>>> msm_file_private *ctx,
> >>>>>            if (!capable(CAP_SYS_ADMIN))
> >>>>>                return UERR(EPERM, drm, "invalid permissions");
> >>>>>            return msm_file_private_set_sysprof(ctx, gpu, value);
> >>>>> +    case MSM_PARAM_REQ_CNTRS:
> >>>>> +        return msm_file_private_request_counters(ctx, gpu, value);
> >>>>>        default:
> >>>>>            return UERR(EINVAL, drm, "%s: invalid param: %u", gpu-
> >>>>>> name, param);
> >>>>>        }
> >>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/
> >>>>> msm_drv.c
> >>>>> index 6416d2cb4efc..bf8314ff4a25 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_drv.c
> >>>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
> >>>>> @@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device
> >>>>> *dev, struct drm_file *file)
> >>>>>         * It is not possible to set sysprof param to non-zero if gp=
u
> >>>>>         * is not initialized:
> >>>>>         */
> >>>>> -    if (priv->gpu)
> >>>>> +    if (ctx->sysprof)
> >>>>>            msm_file_private_set_sysprof(ctx, priv->gpu, 0);
> >>>>>    +    if (ctx->counters_requested)
> >>>>> +        msm_file_private_request_counters(ctx, priv->gpu, 0);
> >>>>> +
> >>>>>        context_close(ctx);
> >>>>>    }
> >>>>>    diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm=
/
> >>>>> msm_gpu.c
> >>>>> index 82f204f3bb8f..013b59ca3bb1 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >>>>> @@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, struct
> >>>>> platform_device *pdev,
> >>>>>        gpu->nr_rings =3D nr_rings;
> >>>>>          refcount_set(&gpu->sysprof_active, 1);
> >>>>> +    refcount_set(&gpu->local_counters_active, 1);
> >>>>>          return 0;
> >>>>>    diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm=
/
> >>>>> msm_gpu.h
> >>>>> index e25009150579..83c61e523b1b 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
> >>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> >>>>> @@ -195,12 +195,28 @@ struct msm_gpu {
> >>>>>        int nr_rings;
> >>>>>          /**
> >>>>> -     * sysprof_active:
> >>>>> +     * @sysprof_active:
> >>>>>         *
> >>>>> -     * The count of contexts that have enabled system profiling.
> >>>>> +     * The count of contexts that have enabled system profiling pl=
us
> >>>>> one.
> >>>>> +     *
> >>>>> +     * Note: refcount_t does not like 0->1 transitions.. we want t=
o
> >>>>> keep
> >>>>> +     * the under/overflow checks that refcount_t provides, but all=
ow
> >>>>> +     * multiple on/off transitions so we track the logical value
> >>>>> plus one.)
> >>>>>         */
> >>>>>        refcount_t sysprof_active;
> >>>>>    +    /**
> >>>>> +     * @local_counters_active:
> >>>>> +     *
> >>>>> +     * The count of contexts that have requested local (intra-subm=
it)
> >>>>> +     * performance counter usage plus one.
> >>>>> +     *
> >>>>> +     * Note: refcount_t does not like 0->1 transitions.. we want t=
o
> >>>>> keep
> >>>>> +     * the under/overflow checks that refcount_t provides, but all=
ow
> >>>>> +     * multiple on/off transitions so we track the logical value
> >>>>> plus one.)
> >>>>> +     */
> >>>>> +    refcount_t local_counters_active;
> >>>>> +
> >>>>>        /**
> >>>>>         * lock:
> >>>>>         *
> >>>>> @@ -383,6 +399,13 @@ struct msm_file_private {
> >>>>>         */
> >>>>>        int sysprof;
> >>>>>    +    /**
> >>>>> +     * @counters_requested:
> >>>>> +     *
> >>>>> +     * Has the context requested local perfcntr usage.
> >>>>> +     */
> >>>>> +    bool counters_requested;
> >>>>> +
> >>>>>        /**
> >>>>>         * comm: Overridden task comm, see MSM_PARAM_COMM
> >>>>>         *
> >>>>> @@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kref)=
;
> >>>>>      int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> >>>>>                     struct msm_gpu *gpu, int sysprof);
> >>>>> +int msm_file_private_request_counters(struct msm_file_private *ctx=
,
> >>>>> +                      struct msm_gpu *gpu, int reqcntrs);
> >>>>>    void __msm_file_private_destroy(struct kref *kref);
> >>>>>      static inline void msm_file_private_put(struct msm_file_privat=
e
> >>>>> *ctx)
> >>>>> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/dr=
m/
> >>>>> msm/msm_submitqueue.c
> >>>>> index 7fed1de63b5d..1e1e21e6f7ae 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> >>>>> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> >>>>> @@ -10,6 +10,15 @@
> >>>>>    int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> >>>>>                     struct msm_gpu *gpu, int sysprof)
> >>>>>    {
> >>>>> +    int ret =3D 0;
> >>>>> +
> >>>>> +    mutex_lock(&gpu->lock);
> >>>>> +
> >>>>> +    if (sysprof && (refcount_read(&gpu->local_counters_active) >
> >>>>> 1)) {
> >>>>> +        ret =3D UERR(EBUSY, gpu->dev, "Local counter usage active"=
);
> >>>>> +        goto out_unlock;
> >>>>> +    }
> >>>>> +
> >>>>>        /*
> >>>>>         * Since pm_runtime and sysprof_active are both refcounts, w=
e
> >>>>>         * call apply the new value first, and then unwind the previ=
ous
> >>>>> @@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct
> >>>>> msm_file_private *ctx,
> >>>>>          switch (sysprof) {
> >>>>>        default:
> >>>>> -        return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d",
> >>>>> sysprof);
> >>>>> +        ret =3D UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysp=
rof);
> >>>>> +        goto out_unlock;
> >>>>>        case 2:
> >>>>>            pm_runtime_get_sync(&gpu->pdev->dev);
> >>>>>            fallthrough;
> >>>>> @@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct
> >>>>> msm_file_private *ctx,
> >>>>>          ctx->sysprof =3D sysprof;
> >>>>>    -    return 0;
> >>>>> +out_unlock:
> >>>>> +    mutex_unlock(&gpu->lock);
> >>>>> +
> >>>>> +    return ret;
> >>>>> +}
> >>>>> +
> >>>>> +int msm_file_private_request_counters(struct msm_file_private *ctx=
,
> >>>>> +                      struct msm_gpu *gpu, int reqctrs)
> >>>>> +{
> >>>>> +    int ret =3D 0;
> >>>>> +
> >>>>> +    mutex_lock(&gpu->lock);
> >>>>> +
> >>>>> +    if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
> >>>>> +        ret =3D UERR(EBUSY, gpu->dev, "System profiling active");
> >>>>> +        goto out_unlock;
> >>>>> +    }
> >>>>> +
> >>>>> +    if (reqctrs) {
> >>>>> +        if (ctx->counters_requested) {
> >>>>> +            ret =3D UERR(EINVAL, gpu->dev, "Already requested");
> >>>>> +            goto out_unlock;
> >>>>> +        }
> >>>>> +
> >>>>> +        ctx->counters_requested =3D true;
> >>>>> +        refcount_inc(&gpu->local_counters_active);
> >>>>> +    } else {
> >>>>> +        if (!ctx->counters_requested) {
> >>>>> +            ret =3D UERR(EINVAL, gpu->dev, "Not requested");
> >>>>> +            goto out_unlock;
> >>>>> +        }
> >>>>> +        refcount_dec(&gpu->local_counters_active);
> >>>>> +        ctx->counters_requested =3D false;
> >>>>> +    }
> >>>>> +
> >>>>> +out_unlock:
> >>>>> +    mutex_unlock(&gpu->lock);
> >>>>> +
> >>>>> +    return ret;
> >>>>>    }
> >>>>>      void __msm_file_private_destroy(struct kref *kref)
> >>>>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.=
h
> >>>>> index 2342cb90857e..ae7fb355e4a1 100644
> >>>>> --- a/include/uapi/drm/msm_drm.h
> >>>>> +++ b/include/uapi/drm/msm_drm.h
> >>>>> @@ -91,6 +91,7 @@ struct drm_msm_timespec {
> >>>>>    #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
> >>>>>    #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> >>>>>    #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
> >>>>> +#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-
> >>>>> submit) perfcntr usage  */
> >>>>>      /* For backwards compat.  The original support for preemption =
was
> >>>>> based on
> >>>>>     * a single ring per priority level so # of priority levels equa=
ls
> >>>>> the #
> >>>>
> >>>
> >>>
> >>> Best regards,
> >>
> >
> >
> > Best regards,
>

