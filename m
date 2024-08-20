Return-Path: <linux-arm-msm+bounces-29105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B63D6958522
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 12:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7262D2848F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 10:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B23518C32E;
	Tue, 20 Aug 2024 10:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jURa0YCt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3E2178376;
	Tue, 20 Aug 2024 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724150928; cv=none; b=O8Nlec0dD+jbkZIRbkRvW2ThDlJvUiG4mBexXVgOwD8Tu57FmI0UtdRkT40y3AaWG3JddSppq8fOn+OcjzVG/ZCVbVpNdIQGgCdDTusH80GAMAz7Q0YjgK6ghrjdlAsxu2rxjq8uX6bqswOdJZ1gWH7Xd4c591aSxiDwO35sz+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724150928; c=relaxed/simple;
	bh=73/WCryTOnaLketaWiwEIWfdVvNjwhGibaBdp9xJ4q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UmiMWkhut+8JYh9kWClR8a0YhePYq2yPNJMmxDyBc65STG9zcFP9KbMifzvK2xL7ZtntGw4tmIlvsZGVOFF8H012pvMjNXzNj05Fu+xSFyvg6AW638Kv8+RiBTvUOO0lh2iVqT9PuglzUvXs6u//y3eGEj2J/WJLepzAHYo8D8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jURa0YCt; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2d427fb7c92so1552828a91.1;
        Tue, 20 Aug 2024 03:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724150926; x=1724755726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHozHS2Z5KlQ/nEnJ4FIOFQCi2BYEVkICQui/aYg9Y4=;
        b=jURa0YCtj9uSeHZLdITP5zifjMcyMGW53K3OzuIbEkJzxahSKa6GVb4WLQvY+R8D6O
         Ddo1pyCfkXA0zaqdhlhl4RQV/TSqObDk7RV8zJ/xuONact4L5J6vvcB8Dfw1e0SnQi5S
         IT8/WawFNMTODWxaHxkCvybe55nUHqm5B5XazpyP3dC80ww/VESNKWtppm4pVxLDA21h
         rjM9otsF0Ujfz7+Lblqsit6aWdx8GiPOz3hiPd9WqyOKaBEC1YjVXo/5DNSWOTNy3n3i
         GzUZfjhpphx5RhHKmCLSSsPE7Hr76C/UZ7c/YQSb+yTGSyNyHYOYOGym74LR6zcWO5m6
         WyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724150926; x=1724755726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHozHS2Z5KlQ/nEnJ4FIOFQCi2BYEVkICQui/aYg9Y4=;
        b=XeX1rdlVtfyqxf7OE0gb5qZjzs4PEP8VlSiPRk4k8IeuQkkzcXid/itQSRy8EhGDRJ
         dRBKPR/GaYzgu//zHpCYfKwHkiNmHpKqcU/gcwtDJYXif5PPwldcamBFZhemNTc5iUnx
         rbaV7eFoSyHA30FBSPq4xKr+7b3vel6A99fyNaBH2ciMrFHaDY2zUs8JP/i7S2unqxJu
         LGCPicF30Z/SXT8DdsF2SH4q4NGJ0wkJhpjSFQDgoZ+3e7ymOfCUdX7joa1pN1OP2i42
         kouYodt6263Fqs+c1nyljF2R52TI4jnk3CZIvUS7IUTWuQSIXd4z7hIyoalgvVVRVOWW
         Bj2A==
X-Forwarded-Encrypted: i=1; AJvYcCWz9SFKiX+WphTksq02WM5f4gTU2yOq1bM7KCSUEyYltCuw9mQE6L6o1TfGOKFWXqfpzK9trklPdxTp2AfP@vger.kernel.org, AJvYcCX9UandHXENNWnDnZAuZuFR17oZG+kPoE74QrbeUMB0ne2X+Bv+omZxst50cL28hMHVYc0ioXTcetywC3sO@vger.kernel.org
X-Gm-Message-State: AOJu0YwS8JbU7/UpHlsrjt9yQ3eH76NIW49qgWwKcKi9N5vVZpaEEUbu
	pYGAkeaRqCpIKzPNNNMwyJNVTTxDTUb1WSHdIMk+YMf47LzwV6kCWTHc5JQWIva5NoIuhKfkf0W
	AA6Y26jUbdBhSCCjFwtNlk0jLFms=
X-Google-Smtp-Source: AGHT+IEisKinF3iVS7neNg7As2gXSCSo9FnUNLT+WaDRg+VngACC0dp8/ePn2UZ3VfV5sHWMAIpYdwMu7ABuow2QTg4=
X-Received: by 2002:a17:90a:34cc:b0:2c9:6278:27c9 with SMTP id
 98e67ed59e1d1-2d3e0409761mr12762164a91.38.1724150926144; Tue, 20 Aug 2024
 03:48:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com> <20240819203128.hit2csdpbbsybkoq@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240819203128.hit2csdpbbsybkoq@hu-akhilpo-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 Aug 2024 11:48:33 +0100
Message-ID: <CACu1E7GnwjS3Hv140emJ_-yJKDd+FB75upF9z3pDTj7Ey7zWRA@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 9:31=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Thu, Aug 15, 2024 at 08:26:16PM +0200, Antonino Maniscalco wrote:
> > Some userspace changes are necessary so add a flag for userspace to
> > advertise support for preemption.
>
> So the intention is to fallback to level 0 preemption until user moves
> to Mesa libs with level 1 support for each new GPU? Please elaborate a bi=
t.
>
> -Akhil.

Yes, that's right. My Mesa series fixes L1 preemption and
skipsaverestore by changing some of the CP_SET_MARKER calls and
register programming and introducing CP_SET_AMBLE calls and then
enables the flag on a7xx.

Connor

>
> >
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
> >  include/uapi/drm/msm_drm.h            |  5 ++++-
> >  2 files changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 1a90db5759b8..86357016db8d 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -453,8 +453,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struc=
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
> > @@ -485,8 +487,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struc=
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
> >

