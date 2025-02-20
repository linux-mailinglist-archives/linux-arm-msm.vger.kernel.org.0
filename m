Return-Path: <linux-arm-msm+bounces-48724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E3A3DF3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E630A3A6B8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14661F63EA;
	Thu, 20 Feb 2025 15:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ix/yXYtC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFF01FDA62
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066538; cv=none; b=EAx0SZdVJrJhXrjAdLfL6IHdg4eXq36qzBewLJikNf6fWJ5f1YYZ16tR56V452r2biHKgJ+7EKqhDQbxk1kSQKMeZ0t/auoyIIbw81ol6wmXzfd8eRNJCdqS1rRD53G0vDbJ+RdiYSwkkQXpzba/1NYI/sGvoPuvi1czbj41djs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066538; c=relaxed/simple;
	bh=pMn+Sb/4cN2ZatHeaaPXsSlik7qP+CAwTRM00oVajiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3NrjOV5QD8FnK+jG4qX+Gr8CHHNbUIHrLZg8a6TM7GiI/6dhl42Lw7u82su1hdb5P9oygjOItjHKSfYa3rU03n7wwvLQJteEXKC+B+V80kUX0NN4FYdIVdymvsuwVgbxnmJpWpX0IRvll303g5Or1VIaS2sOXBkJsJgfmj9UI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ix/yXYtC; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6f88509dad2so9201817b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740066536; x=1740671336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fh0EaNA0zw/hRkImk8Oe4KJxiffWQ08yNobqQkyfoS8=;
        b=ix/yXYtC+HaDPvQF1Hq35R2rzd9j3qTkGjXMR6erk5ZVd6VhOD93VTw7k7mgOm6icS
         XmHtvIP+qNdYiPUSF3HSDA5HcfKQu+eKDtQ7BNvCMeIk00XVuhlQcz0xLdqq/YGt91Oa
         U0NnXfOAwe8/1N0Q1RNn1j3xbTvBEevk+quEQKyoubAc+e2GlPOZQGye+YyVDoitIO8c
         KnUkacFvZDObZwZqrkiY8lTOA/HOqwNtaPtg8/EuG2GBIlYSUL4pKhPl75NhVkzbuq/a
         nTUX+PHWBA+UdGsemv9835LS//nZQs2AQWr2995jYkiN8PIaZrnZDkx/kvqbDn7vmdOf
         7EoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066536; x=1740671336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fh0EaNA0zw/hRkImk8Oe4KJxiffWQ08yNobqQkyfoS8=;
        b=Yyi6OxfAQIRUsQPxPmRdeSYzeB94pA1cyHTuHl4UBeTZX94mupLt3r1krDr0vMwj2z
         Y3z7n6bsBkDUbs8dc4S94gs4Bztz1JDilQOvLI+5O6QtzbFUzf1E+fWKV0QdOmjzCkzM
         oSuQesIXlGDN92r8qyXmzShhl3TFn2Q8Bkhd0MNHuLs4wpIUiIOQkm3if3sBozpdKWBr
         yfYE3bFPzpl2QpRr+8i/0F1GCrKB7S9BOh2CJ12ulR5bt5mTA5sKUYniVFxR7ctLC17M
         YEQlJlrzTndBS48btNusrkrbOwH8NbGbnOuwdrKS6ibFf6jSl4G2LnTBnAR3tm7FFnNi
         D4Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUTmRRY2PoDG+39LSQeMa3pLuAFpfWjxYYgNnSh4NwhaelOtSWOPByQ67mY/Z1TVrps2MGqJcJl0oalcLdm@vger.kernel.org
X-Gm-Message-State: AOJu0YyMbyKZldPHsl7yoVUZY4G7WxBnOGEIrIUj3ZADdBfF6MOSpn1d
	/X+WiDqjxiW4W/4tYDM5eAEGMswcUdDh6m65EDojGwa2L7Loelw/sMcB7cOyUXRJTluaHQERv1Q
	sgH6NYvQsFR4vsXV5xTIu2w3VOyHMLDH3x7okVQ==
X-Gm-Gg: ASbGncvoqJ4t2L5igAE8TWsr4ucCyQjkQptbfvTNKZGiGMkWDr0WTf5dnAcLpHp2YMG
	OEk6BRSt+nwxik1z3sriPq7HhrnKU8gyJyaNI0ql3Y5KelgTqDQKDs3lJFmNZpmnW2ULfulRVgC
	gk
X-Google-Smtp-Source: AGHT+IF+PQ1WWQBWdkcPuvkCqL7coMFeLRf8jcs/DtX+sd9Xr7WIrf1xi3BhM6cx4LGPieaKIPwIRl9jwUwclibfDNc=
X-Received: by 2002:a05:690c:7308:b0:6f6:d405:7010 with SMTP id
 00721157ae682-6fb5836613fmr197581237b3.29.1740066536213; Thu, 20 Feb 2025
 07:48:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-12-c11402574367@linaro.org>
 <qrwo5jtdj64vu27jn3v2wwyuxu25bjqrybj5jjfc5ifiotgzit@6vx2km46j7b3>
In-Reply-To: <qrwo5jtdj64vu27jn3v2wwyuxu25bjqrybj5jjfc5ifiotgzit@6vx2km46j7b3>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 23:48:45 +0800
X-Gm-Features: AWEUYZkdR7xOqNrmO9nBvI0-veiIvNYYDm4MgDKrlVhrXa2-lt62D6Vtu-sVByk
Message-ID: <CABymUCPEYJTK=gBHcL291qn2zbotC7_8jA4z18sbSZSjRafSsg@mail.gmail.com>
Subject: Re: [PATCH v6 12/15] drm/msm/dpu: blend pipes per mixer pairs config
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=E6=
=9C=8818=E6=97=A5=E5=91=A8=E4=BA=8C 03:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Feb 17, 2025 at 10:16:01PM +0800, Jun Nie wrote:
> > Currently, only 2 pipes are used at most for a plane. A stage structure
> > describes the configuration for a mixer pair. So only one stage is need=
ed
> > for current usage cases. The quad-pipe case will be added in future and=
 2
> > stages are used in the case. So extend the stage to an array with array=
 size
> > STAGES_PER_PLANE and blend pipes per mixer pair with configuration in t=
he
> > stage structure.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++++--=
--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> >  2 files changed, 30 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 81474823e6799132db71c9712046d359e3535d90..50acaf25a3ffcc94354faaa=
816fe74566784844c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -401,7 +401,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_c=
rtc *crtc,
> >                                      struct dpu_hw_stage_cfg *stage_cfg
> >                                     )
> >  {
> > -     uint32_t lm_idx;
> > +     uint32_t lm_idx, lm_in_pair;
> >       enum dpu_sspp sspp_idx;
> >       struct drm_plane_state *state;
> >
> > @@ -426,7 +426,8 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_c=
rtc *crtc,
> >       stage_cfg->multirect_index[stage][stage_idx] =3D pipe->multirect_=
index;
> >
> >       /* blend config update */
> > -     for (lm_idx =3D 0; lm_idx < num_mixers; lm_idx++)
> > +     lm_in_pair =3D num_mixers > 1 ? 2 : 1;
> > +     for (lm_idx =3D 0; lm_idx < lm_in_pair; lm_idx++)
> >               mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer=
[lm_idx].lm_ctl, sspp_idx);
>
> I almost missed this. Why is this necessary?

It is protective code. In case there is only 1 LM, we should not
iterate 2 LM in a stage.
>
> >  }
> >
>
> [...]
>
> > @@ -535,8 +543,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc =
*crtc)
> >                       mixer[i].mixer_op_mode,
> >                       ctl->idx - CTL_0);
> >
> > +             /*
> > +              * call dpu_hw_ctl_setup_blendstage() to blend layers per=
 stage cfg.
> > +              * There are 4 mixers at most. The first 2 are for the le=
ft half, and
> > +              * the later 2 are for the right half.
> > +              */
>
> The comment is invalid until you introduce quad pipe, currently there
> are 2 mixers at most. However you can just say something like 'stage
> data is shared between PIPES_PER_STAGE pipes'.

Accepted.
>
> >               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> > -                     &stage_cfg);
> > +                     &stage_cfg[i / PIPES_PER_STAGE]);
> >       }
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index 5f010d36672cc6440c69779908b315aab285eaf0..64e220987be5682f26d0207=
4505c5474a547a814 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -34,6 +34,7 @@
> >  #define DPU_MAX_PLANES                       4
> >  #endif
> >
> > +#define STAGES_PER_PLANE             2
> >  #define PIPES_PER_PLANE                      2
> >  #define PIPES_PER_STAGE                      2
> >  #ifndef DPU_MAX_DE_CURVES
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

