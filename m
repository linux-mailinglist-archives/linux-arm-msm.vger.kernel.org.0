Return-Path: <linux-arm-msm+bounces-32111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B315997D904
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 19:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D70D21C20A0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 17:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76354154C12;
	Fri, 20 Sep 2024 17:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwqjsRU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1CA1EF1D;
	Fri, 20 Sep 2024 17:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726853398; cv=none; b=IOybWUe3q0/dT5gAqrEqZ54UkQosWnR7lk9w8MIN1Flo2O3I43LEKxd72hYdAwjjBjrQWc7OF/RCkG7Ptowb7c90o1C2XSrKmyGlxtyWa9RlOgOL8qgC63xF3vzKrBy49FcLVeepjOM58qyNY2/hsO+bCIoYqWcqCwrRRGKaAlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726853398; c=relaxed/simple;
	bh=ToBempyJO52rcaZf9WT2IgoRwbXZC2bQrV7/ZpLdDJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBbetF1UFjV56upFsyIgxSAadATZPiGRDHVQBT0TDk94UiCmWzjMRnGmSEt8Es9yr4z2v2kUp5e/Vf7grtI5isSewB+zBfNSEdfXKzolo8T0YP6SyBdI68P3gR0nDiRj7a7Fh3YC4vPONee6p2uRV7ciE4f5W5mzvbvDU8PjD4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwqjsRU9; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a0c874547cso5765235ab.2;
        Fri, 20 Sep 2024 10:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726853396; x=1727458196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vlHUoHs0FcmxQf+gRGeqkvknNNXsHGuxyDqS9sJWsg=;
        b=CwqjsRU9LJLw0F/Mc4I6Nv00Y+Jv74Du1L60PiCgwpGNGtPj/SWlbAp/BBHqryv9wf
         wGa/UPk2AOGLD3UGNYWbRKshUXNNdAGRCDmKSs+80Q+ckFyiXHDu9UCb48bTU/E1ubs0
         AdNOohMbT0mBMeBz3XGU60nWPJyl7/y16M4sRrnuhYjw1Wbfnp/wK8VWeuI5YGy2IXC5
         B/PAZskrYro8vQP3hG4fcPh4oo/iENN1XHGp+BhI4VIpDgUUffQZreLxIE3coCmmukg0
         fp2njXmUirJfJJLbxmxqbD53Iz+kIEPZUSOfzAqQJg+DKvK7Q+94Y7NprlmQcGHhsmgV
         6xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726853396; x=1727458196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vlHUoHs0FcmxQf+gRGeqkvknNNXsHGuxyDqS9sJWsg=;
        b=eB2VjM4AIef+bQiGaYyiA7wueZi72MY7O+Wkfuy43Dqnq3DXRT0gTQK5YlMhNizmij
         I6arKCohRIbiuD8+EAYF7Fbqb85nvZWhWbD96OIMy+xsl19hnHimBvPX4HRxNKPWAQpY
         SNlM68lw1PA5NyLRrYrK3dNKb4SZ3Sotr4y3VxfET2O28GHvaBPDIrLH+OQ3Iadg6Vdi
         gO2CeUjvCEZSqhWNEp3TGuXj8AmuxNUbOnsOawHG7qEFEQ8hj8xBG1eX+cF3zMIgv6yH
         orhV5O9cTiLtAHhWoziC5RQhDNe88byovJR7kZPPfBu22gZiQFY9fgWn1p+W6/f1u8oI
         Dd3A==
X-Forwarded-Encrypted: i=1; AJvYcCUJHNP1RfZQ5HH9Oe0B2UjpgBI+XPJFk/bhRlitxAjQGf3j+7tM4JH818qB/Rtrwato7IqKcLgcEGZUAzV2@vger.kernel.org, AJvYcCUdSWepr1ofd3WfjgHJXG2fWWIKETIWvlf17/3yvlFA3i3bVAafh/ZfDJePTiZtXPIWLSTLNUifwSWT@vger.kernel.org, AJvYcCXpjwat7VUA/FIm9qqDG1jdiRXB1kB+ZZmIMPPbz0LUQ349lxn/VKUjMUaWoRaS8gfZfIqUltjiHvlkM6X9@vger.kernel.org
X-Gm-Message-State: AOJu0YwAj7imSMeevOy+d2U5HqsJlwEdK869XdYQcvvwk5a7dq7Gkvi/
	aJ79A1a2QAztTPcEcsM4NaaNOzwd5/g/pTYyBRxLf6CvgsDYHP9hncGz7im4A+lau361kfJZDHV
	4CsOMUUSBnpDjAV5nyq3nKGkp/CQ=
X-Google-Smtp-Source: AGHT+IHNXGCljUfMLJx6sCLO4++HQZjQ/FOVgWDT41eOWzzfjs+TkV2rqYcXQef9v8l+9n/cftti5MrlsII4SNy0Vq0=
X-Received: by 2002:a05:6e02:1a2d:b0:3a0:9fa5:8f2 with SMTP id
 e9e14a558f8ab-3a0c8d15e27mr38885115ab.18.1726853395783; Fri, 20 Sep 2024
 10:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <20240917-preemption-a750-t-v4-9-95d48012e0ac@gmail.com> <20240920165427.wikjsywhbcb2kz7h@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240920165427.wikjsywhbcb2kz7h@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 20 Sep 2024 10:29:44 -0700
Message-ID: <CAF6AEGv95t=ioPGYLi6CdEuQzx9GC9ehMaTyG03ucbdVHx3eEg@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 9:54=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Tue, Sep 17, 2024 at 01:14:19PM +0200, Antonino Maniscalco wrote:
> > Some userspace changes are necessary so add a flag for userspace to
> > advertise support for preemption when creating the submitqueue.
> >
> > When this flag is not set preemption will not be allowed in the middle
> > of the submitted IBs therefore mantaining compatibility with older
> > userspace.
> >
> > The flag is rejected if preemption is not supported on the target, this
> > allows userspace to know whether preemption is supported.
>
> Just curious, what is the motivation behind informing userspace about
> preemption support?

I think I requested that, as a "just in case" (because it would
otherwise be awkward if we later needed to know the difference btwn
drm/sched "preemption" which can only happen before submit is written
to ring and "real" preemption)

BR,
-R

> -Akhil
>
> >
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
> >  drivers/gpu/drm/msm/msm_submitqueue.c |  3 +++
> >  include/uapi/drm/msm_drm.h            |  5 ++++-
> >  3 files changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 736f475d696f..edbcb6d229ba 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -430,8 +430,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struc=
t msm_gem_submit *submit)
> >       OUT_PKT7(ring, CP_SET_MARKER, 1);
> >       OUT_RING(ring, 0x101); /* IFPC disable */
> >
> > -     OUT_PKT7(ring, CP_SET_MARKER, 1);
> > -     OUT_RING(ring, 0x00d); /* IB1LIST start */
> > +     if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
> > +             OUT_PKT7(ring, CP_SET_MARKER, 1);
> > +             OUT_RING(ring, 0x00d); /* IB1LIST start */
> > +     }
> >
> >       /* Submit the commands */
> >       for (i =3D 0; i < submit->nr_cmds; i++) {
> > @@ -462,8 +464,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struc=
t msm_gem_submit *submit)
> >                       update_shadow_rptr(gpu, ring);
> >       }
> >
> > -     OUT_PKT7(ring, CP_SET_MARKER, 1);
> > -     OUT_RING(ring, 0x00e); /* IB1LIST end */
> > +     if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
> > +             OUT_PKT7(ring, CP_SET_MARKER, 1);
> > +             OUT_RING(ring, 0x00e); /* IB1LIST end */
> > +     }
> >
> >       get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
> >               rbmemptr_stats(ring, index, cpcycles_end));
> > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/ms=
m/msm_submitqueue.c
> > index 0e803125a325..9b3ffca3f3b4 100644
> > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > @@ -170,6 +170,9 @@ int msm_submitqueue_create(struct drm_device *drm, =
struct msm_file_private *ctx,
> >       if (!priv->gpu)
> >               return -ENODEV;
> >
> > +     if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && priv->gpu->nr_rings =
=3D=3D 1)
> > +             return -EINVAL;
> > +
> >       ret =3D msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sche=
d_prio);
> >       if (ret)
> >               return ret;
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index 3fca72f73861..f37858db34e6 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -345,7 +345,10 @@ struct drm_msm_gem_madvise {
> >   * backwards compatibility as a "default" submitqueue
> >   */
> >
> > -#define MSM_SUBMITQUEUE_FLAGS (0)
> > +#define MSM_SUBMITQUEUE_ALLOW_PREEMPT        0x00000001
> > +#define MSM_SUBMITQUEUE_FLAGS                    ( \
> > +             MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
> > +             0)
> >
> >  /*
> >   * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITI=
ES-1,
> >
> > --
> > 2.46.0
> >

