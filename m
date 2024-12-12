Return-Path: <linux-arm-msm+bounces-41802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 053EB9EF5E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CDDE1897E91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CCC223327;
	Thu, 12 Dec 2024 17:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YP1I15gC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA922333E;
	Thu, 12 Dec 2024 17:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734023346; cv=none; b=EopenDYf8dfVMi49nyacUGUmT+BoqnCyH+sOSOYwGpavqL3xlQJlJBCJZCPx3SFK/WN/fsoqCeFtymGfJHUibnMOkhB5IeT2pVElhKqYkZbR3Xl2Hubsqpqz0F0F88sjP6o+d1Gxt7TOx6Mu3TDbwRarrUvo8i6faSeooNrtZHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734023346; c=relaxed/simple;
	bh=gVhKPzyRDKzdYIaxDYQRP38ERruIyeTvxBckaT9u8xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N27gXkdnufrSUTLWJrTVLCfVGx5cAOW9/001vbVEPcmANAzZKZgLfCeJUgP6u3lGrO/MyZtj8Kmyf4prgqUzI4YfkBpaN8jaf7rBfOLZy/+736LrUXAukVKmfJiTXONExlxCiVVQPI7bu5ZCPoFxUuSfyRoekf4C/g/hrBk8IHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YP1I15gC; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a77bd62fdeso5710755ab.2;
        Thu, 12 Dec 2024 09:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734023343; x=1734628143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wh2zFlYirOEce8wHvqNzCPR9OxzcDGMsRZId2rDGIFg=;
        b=YP1I15gC/5BwsH1Rt+uFb7pJuTy9tfxySFDmK7KppqIC7aMuVn/oZwWjueXO1VNA3l
         8etUCdCLXaAmA1VnwtUdnSoQcwjRjnmf+LGMw55rG2vzH+ufTf160o8Wh+oPJSvn+f/h
         Jv7Up0m09gagmaDwka7/UK38kLBFxdhP+VGwt3UCHArnLsgf4CWb0BD5HkCpXLc60WxK
         b5CXfQ8cJ4cy5XQAXv4rlMtjC1uZoXJonOve/rfJN2TnmVm4RMQgnjUbqrpMzJWFJBwR
         AMjbjxVLdho7x97PbIlEVrhoSsM1x3NNCFfHzUEpAizbZJGPgi8m7vxbuexM8CsEuC3D
         pyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734023343; x=1734628143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wh2zFlYirOEce8wHvqNzCPR9OxzcDGMsRZId2rDGIFg=;
        b=IOifcMhSuQNyGEz9wYHxf+KEtmLMvr/AXUmElHUviC4XB6x8EoDdJzoHO4u5gXUpj1
         jUMmjMC1zEocmYxLXbgkIIJioxH7L+UyZUrkgeOX9K4i6mc0ayPa+gFhbdNg0+mUiux3
         mPC964ZijAF6qfnNTUDFOUQyyighjHsNlKM/+HCSg4eIyUhD7eTIDiTj/tYrEvAZXo4l
         wRe8bhGQruScMeR/sfADfzK+uGJoj2oFNIWcxIEg3FQoHKR75GQvCXUAIXfa6rNcQ1NL
         tRAl8eiOuF8zfl3rVQLafTDx+vmOXyDUOLINxNgDS66EG211fIi5v9nirV3sawTJnFBI
         07AA==
X-Forwarded-Encrypted: i=1; AJvYcCWUlQN83qZ4oVwqj1KbUORjKRRJDUsWaTaaHETVX+BegTEt/Ijbcv5BLT7FeXtsTSfUgSUW263ggcI61gVw@vger.kernel.org, AJvYcCXPx8kDXcxS4JC3RzkWBMCGvbB3nAeVlBIRisgzZH0dC3lhEqRUhH82xxo+CBxhHM9t6S6PI70v4hZTvbg5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8OD+n43CnEnbHno0LWOhwYrAyZw42/Thg0ToXrsdYad7HzQVr
	6Pd2MZQDJVSN4OQhNOQrj/plTWWgliPsCFBe43XdVg23L3TIQm7aRAN2MY8yD8x1wJHhpxqdefC
	NGRfJLDKWvOZ+fVkmZPVRAn4Ctl4=
X-Gm-Gg: ASbGncv6V/Iqu8xFcKeKTsE+rcI/zb0dWNMvOQkWJCvPHZhSqAPcuy+Dwd0/w/bRXFB
	9joN9CcJYwxhnadto9KR3cUkphP4soZHuiw/uCmgSxp9ebvMI+zCygY+HRaf/RYhLhW8=
X-Google-Smtp-Source: AGHT+IHOBEcHwVM1L/KwA0czMrrqFBDeYsTizttyCsGI/gpxEaBww5BPzG3hTX5xxyfSq4+baRCj9nzL8F4tOLytWj4=
X-Received: by 2002:a05:6e02:1568:b0:3a7:e452:db4 with SMTP id
 e9e14a558f8ab-3ae57ef8300mr10030475ab.16.1734023343067; Thu, 12 Dec 2024
 09:09:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205165419.54080-1-robdclark@gmail.com> <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
In-Reply-To: <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 12 Dec 2024 09:08:51 -0800
Message-ID: <CAF6AEGtqSW1mpN14S8ffyV=tUG=0GTmNWq_oVEXo+0RYDJfOnA@mail.gmail.com>
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

On Thu, Dec 12, 2024 at 7:59=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 12/5/2024 10:24 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Performance counter usage falls into two categories:
> >
> > 1. Local usage, where the counter configuration, start, and end read
> >    happen within (locally to) a single SUBMIT.  In this case, there is
> >    no dependency on counter configuration or values between submits, an=
d
> >    in fact counters are normally cleared on context switches, making it
> >    impossible to rely on cross-submit state.
> >
> > 2. Global usage, where a single privilaged daemon/process is sampling
> >    counter values across all processes for profiling.
> >
> > The two categories are mutually exclusive.  While you can have many
> > processes making local counter usage, you cannot combine global and
> > local usage without the two stepping on each others feet (by changing
> > counter configuration).
> >
> > For global counter usage, there is already a SYSPROF param (since globa=
l
> > counter usage requires disabling counter clearing on context switch).
> > This patch adds a REQ_CNTRS param to request local counter usage.  If
> > one or more processes has requested counter usage, then a SYSPROF
> > request will fail with -EBUSY.  And if SYSPROF is active, then REQ_CNTR=
S
> > will fail with -EBUSY, maintaining the mutual exclusivity.
> >
> > This is purely an advisory interface to help coordinate userspace.
> > There is no real means of enforcement, but the worst that can happen if
> > userspace ignores a REQ_CNTRS failure is that you'll get nonsense
> > profiling data.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > kgsl takes a different approach, which involves a lot more UABI for
> > assigning counters to different processes.  But I think by taking
> > advantage of the fact that mesa (freedreno+turnip) reconfigure the
> > counters they need in each SUBMIT, for their respective gl/vk perf-
> > counter extensions, we can take this simpler approach.
>
> KGSL's approach is preemption and ifpc safe (also whatever HW changes
> that will come up in future generations). How will we ensure that here?
>
> I have plans to bring up IFPC support in near future. Also, I brought up
> this point during preemption series. But from the responses, I felt that
> profiling was not considered a serious usecase. Still I wonder how the
> perfcounter extensions work accurately with preemption.

Re: IFPC, I think initially we have to inhibit IFPC when SYSPROF is active

Longer term, I think we want to just save and restore all of the SEL
regs as well as the counters themselves on preemption.  AFAIU
currently only the counters themselves are saved/restored.  But there
is only one 32b SEL reg for each 64b counter, so I'm not sure that you
save that many cycles by not just saving/restoring the SEL regs as
well.  (And of course with REQ_CNTRS the kernel knows which processes
need counter save/restore and which do not, so you are only taking the
extra context switch overhead if a process is actually using the
perfcntrs.)

Alternatively, I think we could just declare this as a userspace
problem, and solve it with CP_SET_AMBLE PREAMBLE/POSTAMBLE?

Just for background, rendernode UABI is exposed to all processes that
can use the GPU, ie. basically everything.  Which makes it an
attractive attack surface.  This is why I prefer minimalism when it
comes to UABI, and not adding new ioctls and complexity in the kernel
when it is not essential ;-)

BR,
-R

> -Akhil
>
> >
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
> >  drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
> >  drivers/gpu/drm/msm/msm_gpu.c           |  1 +
> >  drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
> >  drivers/gpu/drm/msm/msm_submitqueue.c   | 52 ++++++++++++++++++++++++-
> >  include/uapi/drm/msm_drm.h              |  1 +
> >  6 files changed, 85 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.c
> > index 31bbf2c83de4..f688e37059b8 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct ms=
m_file_private *ctx,
> >               if (!capable(CAP_SYS_ADMIN))
> >                       return UERR(EPERM, drm, "invalid permissions");
> >               return msm_file_private_set_sysprof(ctx, gpu, value);
> > +     case MSM_PARAM_REQ_CNTRS:
> > +             return msm_file_private_request_counters(ctx, gpu, value)=
;
> >       default:
> >               return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->na=
me, param);
> >       }
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index 6416d2cb4efc..bf8314ff4a25 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device *dev, =
struct drm_file *file)
> >        * It is not possible to set sysprof param to non-zero if gpu
> >        * is not initialized:
> >        */
> > -     if (priv->gpu)
> > +     if (ctx->sysprof)
> >               msm_file_private_set_sysprof(ctx, priv->gpu, 0);
> >
> > +     if (ctx->counters_requested)
> > +             msm_file_private_request_counters(ctx, priv->gpu, 0);
> > +
> >       context_close(ctx);
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index 82f204f3bb8f..013b59ca3bb1 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, struct pla=
tform_device *pdev,
> >       gpu->nr_rings =3D nr_rings;
> >
> >       refcount_set(&gpu->sysprof_active, 1);
> > +     refcount_set(&gpu->local_counters_active, 1);
> >
> >       return 0;
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gp=
u.h
> > index e25009150579..83c61e523b1b 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -195,12 +195,28 @@ struct msm_gpu {
> >       int nr_rings;
> >
> >       /**
> > -      * sysprof_active:
> > +      * @sysprof_active:
> >        *
> > -      * The count of contexts that have enabled system profiling.
> > +      * The count of contexts that have enabled system profiling plus =
one.
> > +      *
> > +      * Note: refcount_t does not like 0->1 transitions.. we want to k=
eep
> > +      * the under/overflow checks that refcount_t provides, but allow
> > +      * multiple on/off transitions so we track the logical value plus=
 one.)
> >        */
> >       refcount_t sysprof_active;
> >
> > +     /**
> > +      * @local_counters_active:
> > +      *
> > +      * The count of contexts that have requested local (intra-submit)
> > +      * performance counter usage plus one.
> > +      *
> > +      * Note: refcount_t does not like 0->1 transitions.. we want to k=
eep
> > +      * the under/overflow checks that refcount_t provides, but allow
> > +      * multiple on/off transitions so we track the logical value plus=
 one.)
> > +      */
> > +     refcount_t local_counters_active;
> > +
> >       /**
> >        * lock:
> >        *
> > @@ -383,6 +399,13 @@ struct msm_file_private {
> >        */
> >       int sysprof;
> >
> > +     /**
> > +      * @counters_requested:
> > +      *
> > +      * Has the context requested local perfcntr usage.
> > +      */
> > +     bool counters_requested;
> > +
> >       /**
> >        * comm: Overridden task comm, see MSM_PARAM_COMM
> >        *
> > @@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kref);
> >
> >  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> >                                struct msm_gpu *gpu, int sysprof);
> > +int msm_file_private_request_counters(struct msm_file_private *ctx,
> > +                                   struct msm_gpu *gpu, int reqcntrs);
> >  void __msm_file_private_destroy(struct kref *kref);
> >
> >  static inline void msm_file_private_put(struct msm_file_private *ctx)
> > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/ms=
m/msm_submitqueue.c
> > index 7fed1de63b5d..1e1e21e6f7ae 100644
> > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > @@ -10,6 +10,15 @@
> >  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> >                                struct msm_gpu *gpu, int sysprof)
> >  {
> > +     int ret =3D 0;
> > +
> > +     mutex_lock(&gpu->lock);
> > +
> > +     if (sysprof && (refcount_read(&gpu->local_counters_active) > 1)) =
{
> > +             ret =3D UERR(EBUSY, gpu->dev, "Local counter usage active=
");
> > +             goto out_unlock;
> > +     }
> > +
> >       /*
> >        * Since pm_runtime and sysprof_active are both refcounts, we
> >        * call apply the new value first, and then unwind the previous
> > @@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct msm_file_priv=
ate *ctx,
> >
> >       switch (sysprof) {
> >       default:
> > -             return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysp=
rof);
> > +             ret =3D UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sys=
prof);
> > +             goto out_unlock;
> >       case 2:
> >               pm_runtime_get_sync(&gpu->pdev->dev);
> >               fallthrough;
> > @@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct msm_file_pri=
vate *ctx,
> >
> >       ctx->sysprof =3D sysprof;
> >
> > -     return 0;
> > +out_unlock:
> > +     mutex_unlock(&gpu->lock);
> > +
> > +     return ret;
> > +}
> > +
> > +int msm_file_private_request_counters(struct msm_file_private *ctx,
> > +                                   struct msm_gpu *gpu, int reqctrs)
> > +{
> > +     int ret =3D 0;
> > +
> > +     mutex_lock(&gpu->lock);
> > +
> > +     if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
> > +             ret =3D UERR(EBUSY, gpu->dev, "System profiling active");
> > +             goto out_unlock;
> > +     }
> > +
> > +     if (reqctrs) {
> > +             if (ctx->counters_requested) {
> > +                     ret =3D UERR(EINVAL, gpu->dev, "Already requested=
");
> > +                     goto out_unlock;
> > +             }
> > +
> > +             ctx->counters_requested =3D true;
> > +             refcount_inc(&gpu->local_counters_active);
> > +     } else {
> > +             if (!ctx->counters_requested) {
> > +                     ret =3D UERR(EINVAL, gpu->dev, "Not requested");
> > +                     goto out_unlock;
> > +             }
> > +             refcount_dec(&gpu->local_counters_active);
> > +             ctx->counters_requested =3D false;
> > +     }
> > +
> > +out_unlock:
> > +     mutex_unlock(&gpu->lock);
> > +
> > +     return ret;
> >  }
> >
> >  void __msm_file_private_destroy(struct kref *kref)
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index 2342cb90857e..ae7fb355e4a1 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -91,6 +91,7 @@ struct drm_msm_timespec {
> >  #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
> >  #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> >  #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
> > +#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-submit=
) perfcntr usage  */
> >
> >  /* For backwards compat.  The original support for preemption was base=
d on
> >   * a single ring per priority level so # of priority levels equals the=
 #
>

