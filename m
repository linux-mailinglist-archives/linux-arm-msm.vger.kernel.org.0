Return-Path: <linux-arm-msm+bounces-17368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82E28A3B39
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 08:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C8A9284200
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 06:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E0E1C6AF;
	Sat, 13 Apr 2024 06:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pYhV4jMz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0EB1C6AE
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Apr 2024 06:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712988177; cv=none; b=fQ+PVRN8csQFDObbStPeopqV/w+apjUFMa24AdJySeFfpZQcHr/Vmr7JHsy106O1THgP/LqLHrYRMFVXIR7FFz9+iGEVopWkZ9IWhZ01bl8TYz3Q1Ov87oBPoeZ7mccx6s+VzWfcBwM7Gra0LiLMhbJakqByiH6MBoG0gW4lQe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712988177; c=relaxed/simple;
	bh=igZeNTuoRAE3Vh42SYAOKtPd5L/+xyIXf0CRmYvnXxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REKI0NJN6dmatSvL8/jsviadTsxj5Av486v9PgemJ9UNw78E0OXBflaHkLsuYH6XfuWmDQncQO/VMLGkLXyNy2pnpwgwyniICwtzWaa8hUo4L8qwLoI/ooapqZ3Xo2L9FgxJ31wkEQFQlZ9BaZnHRP3Vs8xASQX7H+k2ZkeNjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pYhV4jMz; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso1489736276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 23:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712988174; x=1713592974; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3p6Jg0iNIK+PAJ8XdMgBNFqaUw3Dj5y6DUftWKBMSqc=;
        b=pYhV4jMz1Zr0dX9BADVAn148XLa5f6+3ZP+QGV+Xpw2eUaZqFlkCr2QnvmcjbTyeO6
         950JgC8NyYEtyT636CJzrS4NdaE5nZ1iXYel1tyQKu/cbCtWvvZt2MimU/fF/eyf1yss
         WMbqy+BqURSuz7m70l31StniJNJUufWkt45p3tuFXLZYst83FCJG3HmYNZ4z1Jij8OG4
         aFcIHSLuUKRJdHP+4S1wtTCfSfeS+pY6pobWPFW8T/qO8htV0EeRfy52bRmNpseHCC+h
         hMHc0oZkSwDaNtGC2WqHPlysJrmmKG9qs3yngPDk4YK+rqQvB1IqvmkKwm4y1CSc2LP4
         FVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712988174; x=1713592974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3p6Jg0iNIK+PAJ8XdMgBNFqaUw3Dj5y6DUftWKBMSqc=;
        b=FG07mboZKeLkezAxpVFboh5arjuRZqTC/P74JlsBuX7wYLQStAFsyCzBc15uo8fjO+
         DodZbvJAz/xz402jZl6KF9VCI5eILkNgcRuMwa10vdnBHzncZ41DbEGpbhRMhajPla6o
         QSJEOyHAEs6iUNM4whX2emD+4S4ZJHbcSJXFy3O6hjYsYkaOLny1281T/lzDBxnkHPDa
         6I0kuvllADOcYymxLQDZnQA4ka/RdXGx5C9VOHVRVzOx6TT5WaMzbAlNfNotRQPxQcnD
         17efwfGg9yqloZye8ATFmK9osghyDdHZhMdbqz4WYuveAz2Qc4KbVqdBh2Ii/knlufY3
         24qA==
X-Forwarded-Encrypted: i=1; AJvYcCXyq4O4jqJ+aFU7E0kGvMImLX7GIW7/viUF2OWPa4/9/8MtkEtwgY7j3COq0O3pJMgfECh/a1J+wgIHH3YIk58Q4ARh3iXDzb7bCIfyog==
X-Gm-Message-State: AOJu0Yy35CD+5vqJJMI8HUjp0kykHuQVH7yBF+JWGEYux/TkXCxR94X2
	xKg+/zUumYm9p8GT9IHNB29iRTx2Tkid4jKDXXu8MxiNiEsT/kzUbH11Kk6zY1KdddVVBvSNFTt
	Wr5zxhZXu8GcmSTHLveN8AlsCAN/ovlUxgu3QSg==
X-Google-Smtp-Source: AGHT+IFwiHasDbNqUmN3FeLVBrKDayEjmne8Pj/l5CVaBDswgbABq+xouKyVSZPrztCGNB9W5w2neAMPfmbgJxATrOY=
X-Received: by 2002:a25:4ec2:0:b0:dcc:1449:71ea with SMTP id
 c185-20020a254ec2000000b00dcc144971eamr4409535ybb.50.1712988174430; Fri, 12
 Apr 2024 23:02:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-12-dmitry.baryshkov@linaro.org> <6ed5bb25-979e-bb48-3dfe-4af581bb5dd1@quicinc.com>
In-Reply-To: <6ed5bb25-979e-bb48-3dfe-4af581bb5dd1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Apr 2024 09:02:43 +0300
Message-ID: <CAA8EJpqgmf=22O44qFEpxBuGiO4LDyOMrNVnksOdJ9G0z=X2Ug@mail.gmail.com>
Subject: Re: [PATCH 11/12] drm/msm: merge dpu format database to MDP formats
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Apr 2024 at 22:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > Finally remove duplication between DPU and generic MDP code by merging
> > DPU format lists to the MDP format database.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   2 +-
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   4 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 602 ------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |  23 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  10 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   3 +-
> >   drivers/gpu/drm/msm/disp/mdp_format.c         | 595 +++++++++++++++--
> >   drivers/gpu/drm/msm/disp/mdp_kms.h            |   2 -
> >   drivers/gpu/drm/msm/msm_drv.h                 |  12 +
> >   10 files changed, 549 insertions(+), 706 deletions(-)
> >
>
> I cross-checked a few macros visually (not each one) and it LGTM in
> terms of just moving it from dpu_formats.c to mdp_format.c
>
> Even in this change I had the same concern about whether to use MDP for
> dpu formats.
>
> But I think even if we make it MSM_*** then we will have to keep them in
> some msm_** header and not mdp_format.c
>
> So lets go ahead with the MDP naming which you have. If we see its not
> working out later on, please be open to a mass renaming that time.

Ack.

>
> <snip>
>
> > index dea6d47854fe..e7651a0e878c 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -267,6 +267,16 @@ enum msm_format_flags {
> >   #define MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB BIT(MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT)
> >   #define MSM_FORMAT_FLAG_ALPHA_ENABLE        BIT(MSM_FORMAT_FLAG_ALPHA_ENABLE_BIT)
> >
> > +/**
> > + * DPU HW,Component order color map
> > + */
> > +enum {
> > +     C0_G_Y = 0,
> > +     C1_B_Cb = 1,
> > +     C2_R_Cr = 2,
> > +     C3_ALPHA = 3
> > +};
> > +
> >   /**
> >    * struct msm_format: defines the format configuration
> >    * @pixel_format: format fourcc
> > @@ -305,6 +315,8 @@ struct msm_format {
> >       (((X)->fetch_mode == MDP_FETCH_UBWC) && \
> >        ((X)->flags & MSM_FORMAT_FLAG_COMPRESSED))
> >
> > +const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
> > +
> >   struct msm_pending_timer;
> >
> >   int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
>
> I am now thinking that do you think it makes sense to move all
> MDP_FORMAT macros to a new mdp_formats.h including the RGB/YUV bitfield
> macros (even though I already acked that change).
>
> Instead of bloating msm_drv.h even more?

Sounds like a good idea, yes. Thank you!

-- 
With best wishes
Dmitry

