Return-Path: <linux-arm-msm+bounces-41803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B329EF6DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83779189C251
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250E11F2381;
	Thu, 12 Dec 2024 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qr7vC1yc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4253365;
	Thu, 12 Dec 2024 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734023564; cv=none; b=Jvk87b9rvcWvA+HcEzJFyG3cvmwPwzvYRgtHwZWTAGq5Jb7H2fH5MEnctP9W0WaI65puKn5AjVeEE5f/IsGToZtN/JMg5/FN9mmeGXuEVODkmMTi19enWRmvjfZk/vsSzAgPZkOyz9nEeHyFOsmee8elLqG/jqJYFU9UGBLE+/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734023564; c=relaxed/simple;
	bh=utXqolpPYhnlygWvETdUoKVZYPP36FfqK+v3eVXfUrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puIJlVXEreRGNxhx3oJJJ5cekwC6DJeK8KJ9ph1L01GbFZkatLeRNXamezmZCoXzHVrmYSGimAg7OBuL44pXGzkhL1T8os+7IWIRt663qWLs/zvJH/R8bWr7cradLWKbXw0OIDGH972GPejCZGwL9R5vjBJcRaKpbyA6EYjIp6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qr7vC1yc; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a7d690479eso6918895ab.0;
        Thu, 12 Dec 2024 09:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734023561; x=1734628361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0fRwQnBqs424zaulDp4I7McdiEztUjLXQgRfKoU/UY=;
        b=Qr7vC1ycalURKyBMi+1i/kdAsLfWhppAtmFVF/0BkCbRtvX2gw7LGE7YiEneJzUIHH
         wFlMexoO6yBH2Hlh+hVEIbWhlmp08UWkqnDf3uP0YsqAs60i3JhoDaf7SqYgFdGLWEJL
         Ez0qEoEyEsAeXHvDJU1GZT/5g4t35E/QAlT0P7MonygsppujNgTWkqhucYtnGWpDPNMf
         0oiZ40yE/s0ECy+Lg9epx7jWdJO4Nt1voXqO57jgQ7j6ZG5zcTyFu/6zg/+pZ4H83P6Z
         aQTMKqg4buEcr1d79vjAxoKXxzF97vUrYJvQPvAaecuPWS+Q9m1mKiHgKw8TRgNJCbmp
         E5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734023561; x=1734628361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0fRwQnBqs424zaulDp4I7McdiEztUjLXQgRfKoU/UY=;
        b=sH812hr1M9hMJFtupCToW/RmvIQHuBTjB4yn91epNb200MUzuut57VSZHgKXZuRRvE
         b+b4zYteEOeP9O6hTOD7CxEwC9XaW7scBxg0uxqMEhOimbfx8kAPcKg7GPUjPwrdcIoy
         /aVvYzDx5oA5xC7fdQB67oiCWqucDRQZ4FJw7DvYNCAgiy1+K/LEDA8Whi3eHv2kOfdq
         aaAzF41g2+DD5tYm2OdNb/SDd5Yspes1YgUDN9lR9o7FYCO8QmbEhKKvmfQxiQvctKXW
         1CDVNR/LxxTJKSUKX46boc7vVcJSyOHtJ22nG8S/1Bigh1Ws5K9bVKVBaWg7s2V/dhbS
         Lb1A==
X-Forwarded-Encrypted: i=1; AJvYcCUhdt323RHWY1YxTnpMRSwbbuXUIYUqKT0GpJAlUuUyQH7IlBOfFBE/7DljoEI4fiX7CstPbIkbZoZ0cS4W@vger.kernel.org, AJvYcCWOYQWI23RGJ/IBTzSKj9TagBarhRURijTks3Ny0cxZ+1KBOWN5cuCIYtBb6f28pcQOJDPqxucMZ1oJkZKw@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQvy4UQkHC5MljUI5wGmCwd4ZISIbKptO0feac07ryeQHmZkz
	0JV9Vs8BD+jPwxU7FIVMypZGK4ssymgQNqtCIb8Um+VV5wgfOUJBK9Q5KTuXpiNOokZca9eFFR3
	jePf+WvvWiIBXk9mspyqnRby+4ag=
X-Gm-Gg: ASbGncvJmHVsz5Nvf+5GjyURZnRXBl5FxlCCy1rW6+kbviB28KCkjcZNk5Td89h2/R7
	mi+UDkXVA0/U+SKB1x+yz37+6GZZBaF0r3ZxQdRJ0qGwdr2laAJv6kjfBNArRDQpSY/c=
X-Google-Smtp-Source: AGHT+IEmswyd6ISDCvchzyloWP85gYK+P4nivngZhJTM/ix1v833jeMLlihcMLtvuOrejmj3LTvR4BxaPzaPEFibDuc=
X-Received: by 2002:a05:6e02:1f83:b0:3a7:44d9:c7dd with SMTP id
 e9e14a558f8ab-3ae54db1f2bmr13259565ab.6.1734023560805; Thu, 12 Dec 2024
 09:12:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205165419.54080-1-robdclark@gmail.com> <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
 <CAF6AEGtqSW1mpN14S8ffyV=tUG=0GTmNWq_oVEXo+0RYDJfOnA@mail.gmail.com>
In-Reply-To: <CAF6AEGtqSW1mpN14S8ffyV=tUG=0GTmNWq_oVEXo+0RYDJfOnA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 12 Dec 2024 09:12:28 -0800
Message-ID: <CAF6AEGssTcO=qhXPVTd54=jQv8dke=JY0Qm3C96JMKDsgT3==g@mail.gmail.com>
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

On Thu, Dec 12, 2024 at 9:08=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Thu, Dec 12, 2024 at 7:59=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quic=
inc.com> wrote:
> >
> > On 12/5/2024 10:24 PM, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Performance counter usage falls into two categories:
> > >
> > > 1. Local usage, where the counter configuration, start, and end read
> > >    happen within (locally to) a single SUBMIT.  In this case, there i=
s
> > >    no dependency on counter configuration or values between submits, =
and
> > >    in fact counters are normally cleared on context switches, making =
it
> > >    impossible to rely on cross-submit state.
> > >
> > > 2. Global usage, where a single privilaged daemon/process is sampling
> > >    counter values across all processes for profiling.
> > >
> > > The two categories are mutually exclusive.  While you can have many
> > > processes making local counter usage, you cannot combine global and
> > > local usage without the two stepping on each others feet (by changing
> > > counter configuration).
> > >
> > > For global counter usage, there is already a SYSPROF param (since glo=
bal
> > > counter usage requires disabling counter clearing on context switch).
> > > This patch adds a REQ_CNTRS param to request local counter usage.  If
> > > one or more processes has requested counter usage, then a SYSPROF
> > > request will fail with -EBUSY.  And if SYSPROF is active, then REQ_CN=
TRS
> > > will fail with -EBUSY, maintaining the mutual exclusivity.
> > >
> > > This is purely an advisory interface to help coordinate userspace.
> > > There is no real means of enforcement, but the worst that can happen =
if
> > > userspace ignores a REQ_CNTRS failure is that you'll get nonsense
> > > profiling data.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > > kgsl takes a different approach, which involves a lot more UABI for
> > > assigning counters to different processes.  But I think by taking
> > > advantage of the fact that mesa (freedreno+turnip) reconfigure the
> > > counters they need in each SUBMIT, for their respective gl/vk perf-
> > > counter extensions, we can take this simpler approach.
> >
> > KGSL's approach is preemption and ifpc safe (also whatever HW changes
> > that will come up in future generations). How will we ensure that here?
> >
> > I have plans to bring up IFPC support in near future. Also, I brought u=
p
> > this point during preemption series. But from the responses, I felt tha=
t
> > profiling was not considered a serious usecase. Still I wonder how the
> > perfcounter extensions work accurately with preemption.
>
> Re: IFPC, I think initially we have to inhibit IFPC when SYSPROF is activ=
e
>
> Longer term, I think we want to just save and restore all of the SEL
> regs as well as the counters themselves on preemption.  AFAIU
> currently only the counters themselves are saved/restored.  But there
> is only one 32b SEL reg for each 64b counter, so I'm not sure that you
> save that many cycles by not just saving/restoring the SEL regs as
> well.  (And of course with REQ_CNTRS the kernel knows which processes
> need counter save/restore and which do not, so you are only taking the
> extra context switch overhead if a process is actually using the
> perfcntrs.)

Actually I'm maybe blending two different, but similar cases.
PREAMBLE/POSTAMBLE, I think, cover us for preemption

For IFPC, we'd need a way to tell GMU that SYSPROF is active, so it
could save/restore all the counters and selectors  (IFPC shouldn't
matter for local profiling / REQ_CNTRS case, since you wouldn't go
into IFPC mid-submit.)

BR,
-R

> Alternatively, I think we could just declare this as a userspace
> problem, and solve it with CP_SET_AMBLE PREAMBLE/POSTAMBLE?
>
> Just for background, rendernode UABI is exposed to all processes that
> can use the GPU, ie. basically everything.  Which makes it an
> attractive attack surface.  This is why I prefer minimalism when it
> comes to UABI, and not adding new ioctls and complexity in the kernel
> when it is not essential ;-)
>
> BR,
> -R
>
> > -Akhil
> >
> > >
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
> > >  drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
> > >  drivers/gpu/drm/msm/msm_gpu.c           |  1 +
> > >  drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
> > >  drivers/gpu/drm/msm/msm_submitqueue.c   | 52 +++++++++++++++++++++++=
+-
> > >  include/uapi/drm/msm_drm.h              |  1 +
> > >  6 files changed, 85 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/dr=
m/msm/adreno/adreno_gpu.c
> > > index 31bbf2c83de4..f688e37059b8 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > @@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct =
msm_file_private *ctx,
> > >               if (!capable(CAP_SYS_ADMIN))
> > >                       return UERR(EPERM, drm, "invalid permissions");
> > >               return msm_file_private_set_sysprof(ctx, gpu, value);
> > > +     case MSM_PARAM_REQ_CNTRS:
> > > +             return msm_file_private_request_counters(ctx, gpu, valu=
e);
> > >       default:
> > >               return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->=
name, param);
> > >       }
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_=
drv.c
> > > index 6416d2cb4efc..bf8314ff4a25 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device *dev=
, struct drm_file *file)
> > >        * It is not possible to set sysprof param to non-zero if gpu
> > >        * is not initialized:
> > >        */
> > > -     if (priv->gpu)
> > > +     if (ctx->sysprof)
> > >               msm_file_private_set_sysprof(ctx, priv->gpu, 0);
> > >
> > > +     if (ctx->counters_requested)
> > > +             msm_file_private_request_counters(ctx, priv->gpu, 0);
> > > +
> > >       context_close(ctx);
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_=
gpu.c
> > > index 82f204f3bb8f..013b59ca3bb1 100644
> > > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > > @@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, struct p=
latform_device *pdev,
> > >       gpu->nr_rings =3D nr_rings;
> > >
> > >       refcount_set(&gpu->sysprof_active, 1);
> > > +     refcount_set(&gpu->local_counters_active, 1);
> > >
> > >       return 0;
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_=
gpu.h
> > > index e25009150579..83c61e523b1b 100644
> > > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > > @@ -195,12 +195,28 @@ struct msm_gpu {
> > >       int nr_rings;
> > >
> > >       /**
> > > -      * sysprof_active:
> > > +      * @sysprof_active:
> > >        *
> > > -      * The count of contexts that have enabled system profiling.
> > > +      * The count of contexts that have enabled system profiling plu=
s one.
> > > +      *
> > > +      * Note: refcount_t does not like 0->1 transitions.. we want to=
 keep
> > > +      * the under/overflow checks that refcount_t provides, but allo=
w
> > > +      * multiple on/off transitions so we track the logical value pl=
us one.)
> > >        */
> > >       refcount_t sysprof_active;
> > >
> > > +     /**
> > > +      * @local_counters_active:
> > > +      *
> > > +      * The count of contexts that have requested local (intra-submi=
t)
> > > +      * performance counter usage plus one.
> > > +      *
> > > +      * Note: refcount_t does not like 0->1 transitions.. we want to=
 keep
> > > +      * the under/overflow checks that refcount_t provides, but allo=
w
> > > +      * multiple on/off transitions so we track the logical value pl=
us one.)
> > > +      */
> > > +     refcount_t local_counters_active;
> > > +
> > >       /**
> > >        * lock:
> > >        *
> > > @@ -383,6 +399,13 @@ struct msm_file_private {
> > >        */
> > >       int sysprof;
> > >
> > > +     /**
> > > +      * @counters_requested:
> > > +      *
> > > +      * Has the context requested local perfcntr usage.
> > > +      */
> > > +     bool counters_requested;
> > > +
> > >       /**
> > >        * comm: Overridden task comm, see MSM_PARAM_COMM
> > >        *
> > > @@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kref);
> > >
> > >  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> > >                                struct msm_gpu *gpu, int sysprof);
> > > +int msm_file_private_request_counters(struct msm_file_private *ctx,
> > > +                                   struct msm_gpu *gpu, int reqcntrs=
);
> > >  void __msm_file_private_destroy(struct kref *kref);
> > >
> > >  static inline void msm_file_private_put(struct msm_file_private *ctx=
)
> > > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/=
msm/msm_submitqueue.c
> > > index 7fed1de63b5d..1e1e21e6f7ae 100644
> > > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > > @@ -10,6 +10,15 @@
> > >  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> > >                                struct msm_gpu *gpu, int sysprof)
> > >  {
> > > +     int ret =3D 0;
> > > +
> > > +     mutex_lock(&gpu->lock);
> > > +
> > > +     if (sysprof && (refcount_read(&gpu->local_counters_active) > 1)=
) {
> > > +             ret =3D UERR(EBUSY, gpu->dev, "Local counter usage acti=
ve");
> > > +             goto out_unlock;
> > > +     }
> > > +
> > >       /*
> > >        * Since pm_runtime and sysprof_active are both refcounts, we
> > >        * call apply the new value first, and then unwind the previous
> > > @@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct msm_file_pr=
ivate *ctx,
> > >
> > >       switch (sysprof) {
> > >       default:
> > > -             return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sy=
sprof);
> > > +             ret =3D UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", s=
ysprof);
> > > +             goto out_unlock;
> > >       case 2:
> > >               pm_runtime_get_sync(&gpu->pdev->dev);
> > >               fallthrough;
> > > @@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct msm_file_p=
rivate *ctx,
> > >
> > >       ctx->sysprof =3D sysprof;
> > >
> > > -     return 0;
> > > +out_unlock:
> > > +     mutex_unlock(&gpu->lock);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +int msm_file_private_request_counters(struct msm_file_private *ctx,
> > > +                                   struct msm_gpu *gpu, int reqctrs)
> > > +{
> > > +     int ret =3D 0;
> > > +
> > > +     mutex_lock(&gpu->lock);
> > > +
> > > +     if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
> > > +             ret =3D UERR(EBUSY, gpu->dev, "System profiling active"=
);
> > > +             goto out_unlock;
> > > +     }
> > > +
> > > +     if (reqctrs) {
> > > +             if (ctx->counters_requested) {
> > > +                     ret =3D UERR(EINVAL, gpu->dev, "Already request=
ed");
> > > +                     goto out_unlock;
> > > +             }
> > > +
> > > +             ctx->counters_requested =3D true;
> > > +             refcount_inc(&gpu->local_counters_active);
> > > +     } else {
> > > +             if (!ctx->counters_requested) {
> > > +                     ret =3D UERR(EINVAL, gpu->dev, "Not requested")=
;
> > > +                     goto out_unlock;
> > > +             }
> > > +             refcount_dec(&gpu->local_counters_active);
> > > +             ctx->counters_requested =3D false;
> > > +     }
> > > +
> > > +out_unlock:
> > > +     mutex_unlock(&gpu->lock);
> > > +
> > > +     return ret;
> > >  }
> > >
> > >  void __msm_file_private_destroy(struct kref *kref)
> > > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > > index 2342cb90857e..ae7fb355e4a1 100644
> > > --- a/include/uapi/drm/msm_drm.h
> > > +++ b/include/uapi/drm/msm_drm.h
> > > @@ -91,6 +91,7 @@ struct drm_msm_timespec {
> > >  #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
> > >  #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> > >  #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
> > > +#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-subm=
it) perfcntr usage  */
> > >
> > >  /* For backwards compat.  The original support for preemption was ba=
sed on
> > >   * a single ring per priority level so # of priority levels equals t=
he #
> >

