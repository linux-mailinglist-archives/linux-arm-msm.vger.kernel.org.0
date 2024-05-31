Return-Path: <linux-arm-msm+bounces-21200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B045A8D5C87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D38A51C21FA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 08:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5D715E89;
	Fri, 31 May 2024 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sbk1YzW5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093B66FB8
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 08:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717143395; cv=none; b=I0LAXsEcJA+JqeI4wbdAXFma3YeoZ+XqPESYu12rw/GChVLoug0gasF6EVl8a22db77nejv2VR/kMJ3mzvq2yXYsO1qShZ9cfKFZ3hTs1pKUUFzgpLcLu24Fz1iSI2c7PO2TJiykEQFNrhq73rhqI6DQ4kKw7DDJ52Y6JbU7CTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717143395; c=relaxed/simple;
	bh=sAp2XDwK98qb/Wygul0b5LOP82UrWN1tS5xTlGYvFFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnVlEut0o2sNt+PmsMJLfZvWx+YrG96dbNyNrxymZNkysq35wCUAz9ISy1bTpgi8PRzL69RT9b4drg80/krBZW4LDeRMQeT9qTYqEplxi/tuAyHXhs3+lyU8g7V3+W3t2cFjDDSLDgoRXfAiPeVUHavcZMvBwfoR2mR6UOtVP20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sbk1YzW5; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-627ea4e0becso17036887b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 01:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717143393; x=1717748193; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bIrhnunVBUnQyrbNG299hSoNmJr03nYh4HIQ6p7Sw4Q=;
        b=sbk1YzW5Z0MvMJwImhqxo4RfQ+McTgM88QV8dbVTamULLbWagdMo0/29iDh979uwKP
         0qxfe54XYs7acrowu74D/ShBt4xUhqMuJmyIZpifoIbpApNm4zKq2xqjMfQ7j9D3iX6w
         g6yQV+vDehKxFXv033tkfnkGCJZJyF9msU9rIlLmnBqR8ATFaMaiU5JU1N13Jte+X5v0
         2oSXvN9kzrxYcOUol9s5czRJpBZBPWBXCLulE8MDfB0TXktSowhL4vSLj4d3ZYv9bwCo
         WBeMfW4wXEO41vYyhV37zJPsg4dWT0oOYOwt9mY/otQ21FJFFSvFw5MUb8mtA66ndRfR
         OLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717143393; x=1717748193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIrhnunVBUnQyrbNG299hSoNmJr03nYh4HIQ6p7Sw4Q=;
        b=F3AmFN9zl3vGTQHn8/VPOpL/yvUQEr1OyZYKd4WA4K0n4nKj/QfK78a3FFYGLs0hbh
         tPlMryuleu+sgKFcd+6PpSCwUZT7nv01bppkmhAJtblbV9tvEQLm9DZEfuJKE5XNhmGE
         31rjgZu8ZE0EKRCRx3P/1Pgvpqu1mD7PqHwUoQaS3m0TJWmFZm+gGtFl4mqC42eRdL3R
         FcRDehkk71bJ+9OGypxsozGMULHtj8zzIaGxGvtpYGc+q5+IZAyOv47J+iWEk06Ms8PT
         6MtgiV5eoL0se7lb6c5CuBG2nDRLrahaDOB0Yw9Blnl61Hwjpiuoru9VVMyUS2DpO2HE
         vr+w==
X-Forwarded-Encrypted: i=1; AJvYcCXzg7TUXPhx4KoLS1yhn406LbxiGjuLKKj5L4XHjEJdTaQu3ROS/GTRbnceeMh4NDfb772fs/CpyAjIQkekBOOKomO/gQzKZTy3XVGWAw==
X-Gm-Message-State: AOJu0YzbaeXu5IHTXeSv4oPOrDt89XUkcR8aqCTHIGAzmUjTr24LDHH3
	41FuBi6Hf36kXsnFLioFSnZvIABjX2vXFjwJEk0uBSTnOMO4OvBHl1g0/1nG/u6VKWqWx2vV8Gu
	SwQl3ibkSWHtE5c8ymmkmC5pXPyYXDTcQYbZSnpDgg8ptHKGcavc=
X-Google-Smtp-Source: AGHT+IG/fn4yvDuVujCLL19BjnG0MrbOU321zzu3JqLux3NA6uPKcuLSf3NhlOeWgVpVZF7pjTgVjR4u1dLQ0MBKfEE=
X-Received: by 2002:a25:ce92:0:b0:de5:1553:4351 with SMTP id
 3f1490d57ef6-dfa73be7b64mr1196776276.15.1717143391373; Fri, 31 May 2024
 01:16:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-6-dmitry.baryshkov@linaro.org> <6a335026-77c1-a112-69af-a8d9d86d5528@quicinc.com>
In-Reply-To: <6a335026-77c1-a112-69af-a8d9d86d5528@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 11:16:20 +0300
Message-ID: <CAA8EJpqKkTOkhrgJexw-D5TbgGYjBoUup3FHC80boR_cAUb2dA@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] drm/msm/dpu: move scaling limitations out of the hw_catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 May 2024 at 04:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> > Max upscale / downscale factors are constant between platforms. In
> > preparation to adding support for virtual planes and allocating SSPP
> > blocks on demand move max scaling factors out of the HW catalog and
> > handle them in the dpu_plane directly. If any of the scaling blocks gets
> > different limitations, this will have to be handled separately, after
> > the plane refactoring.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 16 +++++++++++++---
> >   3 files changed, 13 insertions(+), 19 deletions(-)
> >
>
> <Snip>
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 70d6a8989e1a..6360052523b5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -785,12 +785,15 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
> >       return 0;
> >   }
> >
> > +#define MAX_UPSCALE_RATIO    20
> > +#define MAX_DOWNSCALE_RATIO  4
> > +
> >   static int dpu_plane_atomic_check(struct drm_plane *plane,
> >                                 struct drm_atomic_state *state)
> >   {
> >       struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> >                                                                                plane);
> > -     int ret = 0, min_scale;
> > +     int ret = 0, min_scale, max_scale;
> >       struct dpu_plane *pdpu = to_dpu_plane(plane);
> >       struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> >       u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
> > @@ -822,10 +825,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       pipe_hw_caps = pipe->sspp->cap;
> >       sblk = pipe->sspp->cap->sblk;
> >
> > -     min_scale = FRAC_16_16(1, sblk->maxupscale);
> > +     if (sblk->scaler_blk.len) {
> > +             min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > +             max_scale = MAX_DOWNSCALE_RATIO << 16;
> > +     } else {
> > +             min_scale = 1 << 16;
> > +             max_scale = 1 << 16;
>
> You can use DRM_PLANE_NO_SCALING instead.

Ack

>
> > +     }
> > +
> >       ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> >                                                 min_scale,
> > -                                               sblk->maxdwnscale << 16,
> > +                                               max_scale,
> >                                                 true, true);
>
> I am missing something here.
>
> As per the documentation of this API, min and max are the scaling limits
> of both directions and not max_upscale and max_downscale.
>
> **
> 837  * drm_atomic_helper_check_plane_state() - Check plane state for
> validity
> 838  * @plane_state: plane state to check
> 839  * @crtc_state: CRTC state to check
> 840  * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
> 841  * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
> 842  * @can_position: is it legal to position the plane such that it
>
>
> But this change is passing max_upscale and max_downscale as the min and
> max resp. Isnt that wrong?

First of all, please notice that I'm not changing the values that are
passed to the function. What was being passed beforehand gets passed
after this commit. I just moved it out of the catalog.

Second, if we take a look at drm_calc_scale(), we can see that it
calculates src / dst and checks that it is within the min_scale and
max_scale boundaries, just like documented.
In our case, the boundaries are (I'm omitting 16.16 math):
- upscale 20 times. dst = 20 * src, scale = src/dst = 1/20
- downscale 4 times. dst = 1/4 * src, scale = src/dst = 4

So, from the point of view of drm_calc_scale(), the min_scale is
1/MAX_UPSCALE, max_scale = MAX_DOWNSCALE and the values the code is
passing are correct.

>
>
> >       if (ret) {
> >               DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);



-- 
With best wishes
Dmitry

