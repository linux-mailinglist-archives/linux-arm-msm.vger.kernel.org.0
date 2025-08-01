Return-Path: <linux-arm-msm+bounces-67286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FDEB17AC4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 03:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 184EE583FEE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 01:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D347549659;
	Fri,  1 Aug 2025 01:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aFSwQNMj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0A715A8
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 01:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754011195; cv=none; b=j/xE5eOBczlb0JpdsrP9HHQ2YUAAJdUu62RXLhKmCp7u5t7Z8Vowo5g0KDpS8RnvghciM0F/6uY2g32nVXVDTDqwW1GIb8Bvfxc+TnCm2FYfZ7g3TjoWPAycqOrYsqzmNa/gE7PTKFIPueqPgO6kBjxQ23h3tkzSR2SH/2YMrnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754011195; c=relaxed/simple;
	bh=YUQA+ZxHt9fj/lg7SpY1Pt1C9T6/y/qdphwfGNfQ7e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WyK0rsfg/Fy+ww/BGtSvrO2i0KNizp4bAjTROaf4iYMgSa6A8MYH8ZHIsw+cTmbll/Ua67GlCp7RNaOYdIKhcCf4oXTcRX6E+8Os053I1BbaHH+13mnLx5MP3HstXgCgKPdPa/AMzVmcfL9KOSXoVKwgSRIGzJF9Z0mGj6TJ5LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aFSwQNMj; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e8dfa190de4so1052124276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 18:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754011192; x=1754615992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXUiw9bAmvFij/Xs2oriGu47rDApjJHReezfEKz8cZk=;
        b=aFSwQNMjYOAudqUy9lGWoMnX7IFMvFB0xSBq2KML9CwEud8ii2+LTYPL/90DkOsRqf
         whbgejVdKZlHX/xM8JiYbKKSpVC+KiRZCI00YEYTK6S42mR3CQji2BH33X7S54jcxT8Z
         TqzRg8xOJGpEbK5cTwHRLPBtWUbqnK+FbiTyMAueH9rIeKF+szbPvAARPLpxh9f+YbQp
         TdR3x7oSdACsqIebuykLTT2ha0Og3fDDt0LsagnMpIFTU6fwT5/YFc1KGSpxDl6ogyH/
         vzrZeS/hc0Nk4lWYCYFsFFJO5paG/BWIwbWJyAyZ/JvITIWtRWF4tecPjpI/QoLjhXMh
         c8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754011192; x=1754615992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXUiw9bAmvFij/Xs2oriGu47rDApjJHReezfEKz8cZk=;
        b=Wou43R+ptmOnT2axMGb4YLihELLkbZWFLJyQD4UJOhIhmeGXry51eidYSSabVd+rJ4
         w8VpIpJQQ7qTuu+t128Otgrc442HnxeTVjbqTyZOJXQfYtzT0uMDs7KaMxTiLDxclM8v
         BZShUf5Uf3hJaQ5TdlqrHTaf0IDNgY/NaXuJlldRHnC9CWni/1xjv4wDBnBJWKDM5uUF
         dAK40tffDwwFPpLcPZu56AFfRtyCRXeNtPgavKZJUgxyEqdWKgR7k/fC7pkZhhnPE058
         OFvsXechuAzXY5ucHuVnZR6M0boNGpbwqQnH5TYI6+dnPd3xvN6SskcPDnXv50spd3M4
         gEQA==
X-Forwarded-Encrypted: i=1; AJvYcCWUKWWF5PftNEL250lo4MLjK6KByuter84yUSXSuKNeIKnSiihWvC/4XL+asirNE7uPqgKYSQF41VSl1MF1@vger.kernel.org
X-Gm-Message-State: AOJu0YzylyKNLU3iEjR33aom0t3OkEDCEfAjU9n78O9oNcRaMp+ewjSs
	Dy8sQmn/qhJtMdSCbtprsqi9VXTuj5thYExN+JM9/LacCK5ztQ8ZdLQsxSRqUsrubr0LUU/e1HI
	qEATKHpjoodnEk7STSUS9G+8JnCOU0KyS0+aDDjCoRg==
X-Gm-Gg: ASbGncsJN5cK2AbNl7ccCKIoXv3TWD065Bz87CbqyV9wXs44p/gzdP2ywMRlXfDdCZl
	gCAsgS9zFriy5BTQ/qBGwgSmHPZV+Jo0JtPYmQldu0Aqk8AB9hAqN/TIuAHoXwDniqh4CjFdI29
	glZjjjzJH6U7qtW8naEelYKT/MmGsjrUmbXOqc+9T2Xz4zucpieU2/6Xim1i9PTwcDtlXW90YOb
	NGzhRc/mO5ExQEWqg==
X-Google-Smtp-Source: AGHT+IEKt+ZT0pexcO15N/b7Q9t7zFCWvynIZkq2ZL8JrZr8XHCjFwlbmL9fDBuc1oF57Go+UCki+q53Mf7Rd7P3+vU=
X-Received: by 2002:a05:690c:3581:b0:70e:1771:c165 with SMTP id
 00721157ae682-71b6d7f8699mr11775427b3.29.1754011192243; Thu, 31 Jul 2025
 18:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
 <20250728-v6-16-rc2-quad-pipe-upstream-v13-10-954e4917fe4f@linaro.org>
 <4dpeif7wynynbsccbhc253wkshuylnsjslsosmrnyld3bmot5l@yqrmpln44qe2>
 <CABymUCMa06E0zavQsKeDw_rjTW5F9o4ancxWuQynMO3wsHKFwA@mail.gmail.com>
 <4c492060-cdde-43c6-8351-d969b0f9322b@oss.qualcomm.com> <CABymUCO63-V7MoWpgCTEV_8R_4rVHM-1=eyRP34=OdKGpYSLDQ@mail.gmail.com>
 <c7346b52-c5a0-4aa2-a8d4-92761e33b011@oss.qualcomm.com>
In-Reply-To: <c7346b52-c5a0-4aa2-a8d4-92761e33b011@oss.qualcomm.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 1 Aug 2025 09:19:41 +0800
X-Gm-Features: Ac12FXzDFQAwvQWbG77uzpAUTLkbkRxIduTGvtusB4QM0I09WiqTGVfPaX3PXmk
Message-ID: <CABymUCPgXAaJCLTiN1XxK1JEjxnr9qPye_E6gMLSMvEhgXJk6w@mail.gmail.com>
Subject: Re: [PATCH v13 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
8=E6=9C=881=E6=97=A5=E5=91=A8=E4=BA=94 01:08=E5=86=99=E9=81=93=EF=BC=9A
>
> On 31/07/2025 18:37, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=
=B9=B47=E6=9C=8831=E6=97=A5=E5=91=A8=E5=9B=9B 22:22=E5=86=99=E9=81=93=EF=BC=
=9A
> >>
> >> On 31/07/2025 13:52, Jun Nie wrote:
> >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=
=B9=B47=E6=9C=8831=E6=97=A5=E5=91=A8=E5=9B=9B 02:52=E5=86=99=E9=81=93=EF=BC=
=9A
> >>>>
> >>>> On Mon, Jul 28, 2025 at 09:14:34PM +0800, Jun Nie wrote:
> >>>>> Currently, SSPPs are assigned to a maximum of two pipes. However,
> >>>>> quad-pipe usage scenarios require four pipes and involve configurin=
g
> >>>>> two stages. In quad-pipe case, the first two pipes share a set of
> >>>>> mixer configurations and enable multi-rect mode when certain
> >>>>> conditions are met. The same applies to the subsequent two pipes.
> >>>>>
> >>>>> Assign SSPPs to the pipes in each stage using a unified method and
> >>>>> to loop the stages accordingly.
> >>>>>
> >>>>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >>>>> ---
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 160 ++++++++++++++++=
++------------
> >>>>>    1 file changed, 99 insertions(+), 61 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_plane.c
> >>>>> index 55429f29a4b95594771d930efe42aaa4126f6f07..e1e16a8d5ac55ba52a0=
f460d62901dced65e3a9e 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>>>> @@ -959,6 +959,30 @@ static int dpu_plane_is_multirect_parallel_cap=
able(struct dpu_hw_sspp *sspp,
> >>>>>    }
> >>>>>
> >>>>>
> >>>>> +static bool dpu_plane_get_single_pipe_in_stage(struct dpu_plane_st=
ate *pstate,
> >>>>> +                                            struct dpu_sw_pipe **s=
ingle_pipe,
> >>>>> +                                            struct dpu_sw_pipe_cfg=
 **single_pipe_cfg,
> >>>>> +                                            int stage_index)
> >>>>> +{
> >>>>> +     int pipe_idx, i, valid_pipe =3D 0;
> >>>>> +
> >>>>> +     for (i =3D 0; i < PIPES_PER_STAGE; i++) {
> >>>>
> >>>> Why do you need to loop here? Is there a case when pipe 0 is not
> >>>> assigned, but pipe 1 is?
> >>>
> >>> Loop the pipe in a stage to count the valid pipes. If there are 2 val=
id
> >>> pipes in stage of the current plane, this function will return false.
> >>> Or you prefer the below coding?
> >>>
> >>> 1029         pipe_idx =3D stage_index * PIPES_PER_STAGE;
> >>> 1030         if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect)=
 !=3D 0 &&
> >>> 1031             drm_rect_width(&pstate->pipe_cfg[pipe_idx +
> >>> 1].src_rect) =3D=3D 0) {
> >>
> >> Yes, this is better from my POV. But the bigger question is why do you
> >> need it at all? What is wrong with the existing check? Can it be that
> >> pipe0 is not used, but pipe1 is used?
> >
> > There is no case that pipe0 is not used, but pipe1 is used. Existing ch=
eck
> > does not filter the plane which contains single pipe in a stage, which =
can
> > be a candidate for SSPP sharing. If the stage contains 2 valid pipes or
> > no valid pipes, it is skipped in dpu_plane_try_multirect_shared(), or i=
t is
> > skipped to be stored in prev_adjacent_plane_state[].
>
> Oh, I see, you need to check both pipes because you might need to skip
> it completely. I'd really prefer to have more explicit code:
>
> - check for pipe0, skip this part of the plane if there is none
> - check for pipe1, if there is none, it's a candidate for sharing.

Yeah, this is the logic of the current implementation. So the your only
concern is the loop. Will remove the loop as above code.

>
> If that becomes too ugly, then yes, explicit check for pipe0 and pipe1
> are better than a loop.
>
> >
> >>
> >>> 1032                         if (single_pipe)
> >>
> >> You don't need these ifs. You always pass a valid pointer.
> >
> > OK, a valid pointer can be passed though the return value may not be ne=
eded.
>
> You are always passing a valid pointer there. If at any point we add
> other usage, then we'd need to add this if.
>
> >>
> >>> 1033                                 *single_pipe =3D &pstate->pipe[p=
ipe_idx];
> >>> 1034                         if (single_pipe_cfg)
> >>> 1035                                 *single_pipe_cfg =3D
> >>> &pstate->pipe_cfg[pipe_idx];
> >>> 1036                 return true;
> >>> 1037         }
> >>> 1038
> >>> 1039         return false;
> >>>
> >>>>
> >>>>> +             pipe_idx =3D stage_index * PIPES_PER_STAGE + i;
> >>>>> +             if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_re=
ct) !=3D 0) {
> >>>>> +                     valid_pipe++;
> >>>>> +                     if (valid_pipe > 1)
> >>>>> +                             return false;
> >>>>> +
> >>>>> +                     if (single_pipe)
> >>>>> +                             *single_pipe =3D &pstate->pipe[pipe_i=
dx];
> >>>>> +                     if (single_pipe_cfg)
> >>>>> +                             *single_pipe_cfg =3D &pstate->pipe_cf=
g[pipe_idx];
> >>>>> +             }
> >>>>> +     }
> >>>>> +
> >>>>> +     return valid_pipe =3D=3D 1;
> >>>>> +}
> >>>>> +
> >>>>>    static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >>>>>                                        struct drm_atomic_state *sta=
te,
> >>>>>                                        const struct drm_crtc_state =
*crtc_state)
> >>>>> @@ -1023,17 +1047,20 @@ static bool dpu_plane_try_multirect_paralle=
l(struct dpu_sw_pipe *pipe, struct dp
> >>>>>    static int dpu_plane_try_multirect_shared(struct dpu_plane_state=
 *pstate,
> >>>>>                                           struct dpu_plane_state *p=
rev_adjacent_pstate,
> >>>>>                                           const struct msm_format *=
fmt,
> >>>>> -                                       uint32_t max_linewidth)
> >>>>> +                                       uint32_t max_linewidth, int=
 stage_index)
> >>>>>    {
> >>>>> -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> >>>>> -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> >>>>> -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> >>>>> -     struct dpu_sw_pipe *prev_pipe =3D &prev_adjacent_pstate->pipe=
[0];
> >>>>> -     struct dpu_sw_pipe_cfg *prev_pipe_cfg =3D &prev_adjacent_psta=
te->pipe_cfg[0];
> >>>>> +     struct dpu_sw_pipe *pipe, *prev_pipe;
> >>>>> +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
> >>>>>         const struct msm_format *prev_fmt =3D msm_framebuffer_forma=
t(prev_adjacent_pstate->base.fb);
> >>>>>         u16 max_tile_height =3D 1;
> >>>>>
> >>>>> -     if (prev_adjacent_pstate->pipe[1].sspp !=3D NULL ||
> >>>>> +     if (!dpu_plane_get_single_pipe_in_stage(pstate, &pipe,
> >>>>> +                                             &pipe_cfg, stage_inde=
x))
> >>>>> +             return false;

The current stage is tested with a single valid pipe, skipped if false.

> >>>>> +
> >>>>> +     if (!dpu_plane_get_single_pipe_in_stage(prev_adjacent_pstate,
> >>>>> +                                             &prev_pipe, &prev_pip=
e_cfg,
> >>>>> +                                             stage_index) ||
> >>>>>             prev_pipe->multirect_mode !=3D DPU_SSPP_MULTIRECT_NONE)
> >>>>>                 return false;
> >>>>>
> >>>>> @@ -1048,11 +1075,6 @@ static int dpu_plane_try_multirect_shared(st=
ruct dpu_plane_state *pstate,
> >>>>>         if (MSM_FORMAT_IS_UBWC(prev_fmt))
> >>>>>                 max_tile_height =3D max(max_tile_height, prev_fmt->=
tile_height);
> >>>>>
> >>>>> -     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>>>> -     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> >>>>> -
> >>>>> -     r_pipe->sspp =3D NULL;
> >>>>> -
> >>>>>         if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewi=
dth) &&
> >>>>>             dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, =
max_linewidth) &&
> >>>>>             (pipe_cfg->dst_rect.x1 >=3D prev_pipe_cfg->dst_rect.x2 =
||
> >>>>> @@ -1181,36 +1203,69 @@ static int dpu_plane_virtual_atomic_check(s=
truct drm_plane *plane,
> >>>>>         return 0;
> >>>>>    }
> >>>>>
> >>>>> +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *=
pipe,
> >>>>> +                                           struct dpu_sw_pipe_cfg =
*pipe_cfg,
> >>>>> +                                           struct drm_plane_state =
*plane_state,
> >>>>> +                                           struct dpu_global_state=
 *global_state,
> >>>>> +                                           struct drm_crtc *crtc,
> >>>>> +                                           struct dpu_rm_sspp_requ=
irements *reqs)
> >>>>> +{
> >>>>> +     struct drm_plane *plane =3D plane_state->plane;
> >>>>> +     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> >>>>> +     struct dpu_sw_pipe *r_pipe =3D pipe + 1;
> >>>>> +     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D pipe_cfg + 1;
> >>>>> +
> >>>>> +     if (drm_rect_width(&pipe_cfg->src_rect) !=3D 0) {
> >>>>> +             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, glob=
al_state, crtc, reqs);
> >>>>> +             if (!pipe->sspp)
> >>>>> +                     return -ENODEV;
> >>>>> +             pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>>>> +             pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> >>>>> +     }
> >>>>> +
> >>>>> +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 &&
> >>>>> +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, =
r_pipe_cfg,
> >>>>> +                                           pipe->sspp,
> >>>>> +                                           msm_framebuffer_format(=
plane_state->fb),
> >>>>> +                                           dpu_kms->catalog->caps-=
>max_linewidth))
> >>>>> +             goto stage_assinged;
> >>>>> +
> >>>>> +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0) {
> >>>>> +             r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, gl=
obal_state, crtc, reqs);
> >>>>> +             if (!r_pipe->sspp)
> >>>>> +                     return -ENODEV;
> >>>>> +             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>>>> +             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> >>>>> +     }
> >>>>> +
> >>>>> +stage_assinged:
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>>    static int dpu_plane_virtual_assign_resources(struct drm_crtc *c=
rtc,
> >>>>>                                               struct dpu_global_sta=
te *global_state,
> >>>>>                                               struct drm_atomic_sta=
te *state,
> >>>>>                                               struct drm_plane_stat=
e *plane_state,
> >>>>> -                                           struct drm_plane_state =
*prev_adjacent_plane_state)
> >>>>> +                                           struct drm_plane_state =
**prev_adjacent_plane_state)
> >>>>>    {
> >>>>>         const struct drm_crtc_state *crtc_state =3D NULL;
> >>>>>         struct drm_plane *plane =3D plane_state->plane;
> >>>>>         struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> >>>>>         struct dpu_rm_sspp_requirements reqs;
> >>>>> -     struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> >>>>> +     struct dpu_plane_state *pstate, *prev_adjacent_pstate[STAGES_=
PER_PLANE];
> >>>>>         struct dpu_sw_pipe *pipe;
> >>>>> -     struct dpu_sw_pipe *r_pipe;
> >>>>>         struct dpu_sw_pipe_cfg *pipe_cfg;
> >>>>> -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> >>>>>         const struct msm_format *fmt;
> >>>>> -     int i;
> >>>>> +     int i, ret;
> >>>>>
> >>>>>         if (plane_state->crtc)
> >>>>>                 crtc_state =3D drm_atomic_get_new_crtc_state(state,
> >>>>>                                                            plane_st=
ate->crtc);
> >>>>>
> >>>>>         pstate =3D to_dpu_plane_state(plane_state);
> >>>>> -     prev_adjacent_pstate =3D prev_adjacent_plane_state ?
> >>>>> -             to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> >>>>> -
> >>>>> -     pipe =3D &pstate->pipe[0];
> >>>>> -     r_pipe =3D &pstate->pipe[1];
> >>>>> -     pipe_cfg =3D &pstate->pipe_cfg[0];
> >>>>> -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> >>>>> +     for (i =3D 0; i < STAGES_PER_PLANE; i++)
> >>>>> +             prev_adjacent_pstate[i] =3D prev_adjacent_plane_state=
[i] ?
> >>>>> +                     to_dpu_plane_state(prev_adjacent_plane_state[=
i]) : NULL;
> >>>>>
> >>>>>         for (i =3D 0; i < PIPES_PER_PLANE; i++)
> >>>>>                 pstate->pipe[i].sspp =3D NULL;
> >>>>> @@ -1225,42 +1280,27 @@ static int dpu_plane_virtual_assign_resourc=
es(struct drm_crtc *crtc,
> >>>>>
> >>>>>         reqs.rot90 =3D drm_rotation_90_or_270(plane_state->rotation=
);
> >>>>>
> >>>>> -     if (drm_rect_width(&r_pipe_cfg->src_rect) =3D=3D 0) {
> >>>>> -             if (!prev_adjacent_pstate ||
> >>>>> -                 !dpu_plane_try_multirect_shared(pstate, prev_adja=
cent_pstate, fmt,
> >>>>> -                                                 dpu_kms->catalog-=
>caps->max_linewidth)) {
> >>>>> -                     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->=
rm, global_state, crtc, &reqs);
> >>>>> -                     if (!pipe->sspp)
> >>>>> -                             return -ENODEV;
> >>>>> -
> >>>>> -                     r_pipe->sspp =3D NULL;
> >>>>> +     for (i =3D 0; i < STAGES_PER_PLANE; i++) {
> >>>>> +             if (!prev_adjacent_pstate[i])
> >>>>> +                     goto assignment;
> >>>>>
> >>>>> -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>>>> -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> >>>>> -
> >>>>> -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOL=
O;
> >>>>> -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT=
_NONE;
> >>>>> -             }
> >>>>> -     } else {
> >>>>> -             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, glob=
al_state, crtc, &reqs);
> >>>>> -             if (!pipe->sspp)
> >>>>> -                     return -ENODEV;
> >>>>> -
> >>>>> -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg,=
 r_pipe, r_pipe_cfg,
> >>>>> -                                                   pipe->sspp,
> >>>>> -                                                   msm_framebuffer=
_format(plane_state->fb),
> >>>>> -                                                   dpu_kms->catalo=
g->caps->max_linewidth)) {
> >>>>> -                     /* multirect is not possible, use two SSPP bl=
ocks */
> >>>>> -                     r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms=
->rm, global_state, crtc, &reqs);
> >>>>> -                     if (!r_pipe->sspp)
> >>>>> -                             return -ENODEV;
> >>>>> +             if (dpu_plane_try_multirect_shared(pstate, prev_adjac=
ent_pstate[i], fmt,
> >>>>> +                                                dpu_kms->catalog->=
caps->max_linewidth,
> >>>>> +                                                i))
> >>>>> +                     continue;
> >>>>
> >>>>
> >>>> if (prev_adjacent_pstate[i] &&
> >>>>       dpu_plane_try_multirect_shared())
> >>>>           continue;
> >>>>
> >>>> No need for the goto.
> >>>
> >>> Right, it will be simpler.
> >>>>
> >>>>>
> >>>>> -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>>>> -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> >>>>> +assignment:
> >>>>> +             if (dpu_plane_get_single_pipe_in_stage(pstate, NULL, =
NULL, i))
> >>>>> +                     prev_adjacent_plane_state[i] =3D plane_state;

Only plane with a stage that contains a single valid pipe will be the
candidate for later
planes. Since it is current plane to be allocated with SSPP, and it
fails to share SSPP
with the previous plane in above code, so there is no need to get the
valid pipe here.
Thus the pointer for dpu_plane_get_single_pipe_in_stage() is NULL.

> >>>>>
> >>>>> -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOL=
O;
> >>>>> -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT=
_NONE;
> >>>>> -             }
> >>>>> +             pipe =3D &pstate->pipe[i * PIPES_PER_STAGE];
> >>>>> +             pipe_cfg =3D &pstate->pipe_cfg[i * PIPES_PER_STAGE];
> >>>>> +             ret =3D dpu_plane_assign_resource_in_stage(pipe, pipe=
_cfg,
> >>>>> +                                                      plane_state,
> >>>>> +                                                      global_state=
,
> >>>>> +                                                      crtc, &reqs)=
;
> >>>>> +             if (ret)
> >>>>> +                     return ret;
> >>>>>         }
> >>>>>
> >>>>>         return dpu_plane_atomic_check_sspp(plane, state, crtc_state=
);
> >>>>> @@ -1273,7 +1313,7 @@ int dpu_assign_plane_resources(struct dpu_glo=
bal_state *global_state,
> >>>>>                                unsigned int num_planes)
> >>>>>    {
> >>>>>         unsigned int i;
> >>>>> -     struct drm_plane_state *prev_adjacent_plane_state =3D NULL;
> >>>>> +     struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_=
PLANE] =3D { NULL };
> >>>>>
> >>>>>         for (i =3D 0; i < num_planes; i++) {
> >>>>>                 struct drm_plane_state *plane_state =3D states[i];
> >>>>> @@ -1284,11 +1324,9 @@ int dpu_assign_plane_resources(struct dpu_gl=
obal_state *global_state,
> >>>>>
> >>>>>                 int ret =3D dpu_plane_virtual_assign_resources(crtc=
, global_state,
> >>>>>                                                              state,=
 plane_state,
> >>>>> -                                                          prev_adj=
acent_plane_state);
> >>>>> +                                                          &prev_ad=
jacent_plane_state[0]);
> >>>>
> >>>> It's exactly the prev_adjacent_plane_state.
> >>>
> >>> Yes, I will change it.
> >>>
> >>>>
> >>>>>                 if (ret)
> >>>>>                         break;
> >>>>> -
> >>>>> -             prev_adjacent_plane_state =3D plane_state;
> >>>>>         }
> >>>>>
> >>>>>         return 0;
> >>>>>
> >>>>> --
> >>>>> 2.34.1
> >>>>>
> >>>>
> >>>> --
> >>>> With best wishes
> >>>> Dmitry
> >>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
>
> --
> With best wishes
> Dmitry

