Return-Path: <linux-arm-msm+bounces-49147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B544A41A7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 11:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BE921889070
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0C324A051;
	Mon, 24 Feb 2025 10:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fQJNwoaF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B912A24A072
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740392076; cv=none; b=fZ7jkxXlxaCgVfRStbxvkXsVBPG36e2jQ3J+C81Ty3rA+e4aW8DcHD1nMJxUcFTlohwZlHLRJqNw6pVuIcleHKvS6ylsncBiwP7tmo2IbWkDlO/ZCyF0FGap+ZICtOblDKlvGwJXf7sHtMSdrs+wc+xyjJRVZrn8Purc8AotNT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740392076; c=relaxed/simple;
	bh=vbjKASiWXzboA2sZA1rLnu3UzF7hoa5908pNhKGfpXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3vV58zmOZpR5R5XOp4ZQnx2gRj6ukgxCX7c7lVbxz28FTcbusSY7kYkovr7DNiBXUgK+8/BG6NeFj/IX7QGsxqpq+Hel216lfDPV0bjw0jHd2iqfUbPNoDEhvsW1JuVW672KkLgU3ZL51zfD60feloBFvad0So8gtKBdVxzIiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fQJNwoaF; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6fcdf0980a6so13203817b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 02:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740392074; x=1740996874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BT21T9ZsOx2rQl7hC4pSS3NJ3nW+q3IUFkB1OpRZPQ=;
        b=fQJNwoaF2n7ZkLJm4NiIAQcXapgeTSRhho3norCqkAUZSZekUqRfdWNVRiipkshIIm
         Nsi6evZXtCm1wjx93kyjMdsN2CxxJmY41/4FndnzGP4Krn2MkxTsL5FM6UE/yuU8OSl7
         Pv14k9nN2fsmnzjbQMhiCFwR4B2QTaJTBcISqrYov9WP0Pz2VjiuG4UZJLR54vB/KjTK
         s8i5ob9A2+9MQSHLa9ghsrrW9JyzNkCyZs4LhsQMBOnRLLNU/SFfV3KVDImNmUyBpOzV
         TnVs1ENLImOJaNNljMp4zbCcVmG48ZCE/xD+sI8+u2bIFyWS9r5/I234bdovIE0I2ILr
         u04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740392074; x=1740996874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BT21T9ZsOx2rQl7hC4pSS3NJ3nW+q3IUFkB1OpRZPQ=;
        b=sfIsdRST1t7eW9Fy2DhebiovaYMXcGmFtbRj+fJ/gtGkwrj6axojZy1cNO9ykvTCWa
         5ZZSHYEzKBbywKd7KAWGQDO7EPIdmp3Wh1gUZ2ww+W2KUVO9zpYQWNkDpvWBfqOmi89l
         EXp358UTiaPMM9nq2FuWQsb2wd76NsMxKY/CRNW8n/XsCnmUW6p7E/BAEOu8I2hqB7ex
         lrscHLYvfSyAl3IyEO9D2DvbGybfK52fzpP5ih76DRj4cZ1sT19PnFjBPdOQm45XKwDc
         3KSe5tNI+uMkD6QL8hOpJ4wrIuYfo5Hl4/FG1KLCF0ePl3/7IoTQXcraG1Unu8b+lkDi
         hUfA==
X-Forwarded-Encrypted: i=1; AJvYcCVWSffkpHGQkvs0/h5T+FQldKuWzCWZIW/PkRcV/d7OeRlmVwb9k9jnjYFmS3Oz4AWqUCn1ZLWsPXOQhjDG@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRBOJ0YMIz6c/uje5g94QIGeLL3bWZ3VUogvoel4IBB0qkuee
	RinKS/RVfuzcp8jLa1MAJtqAKfyAgSdm8MSKiwWWmINOkpwD0/q84gKYV2Ns5Z6hPRVb9+eEAr2
	p4sA9NhjRvB7Tenhm+4utK1Qz1zeDXxD+DJLOWg==
X-Gm-Gg: ASbGncv5JkhJPZSc1Go8mq0WB+XrnQLmsTqBALDtl6iJp2K5FCnu+BnnaZWGjitgIpq
	qZiaiED5ZF+5cEN45oTQ+zZhhvAuYZL+SdZvgOmxEN1+Npk2zbLk0TZt2A4rL6jUna1FTu1QGEC
	L59fXgZ/DLjClO
X-Google-Smtp-Source: AGHT+IHHGiZHgy3s+8XmerKKacF1ioGYVr8/i83Pon+/HFCKY/mSb0SsQmhW+azRKtQiXlPjwnGd0WwE37FqCzJtHXw=
X-Received: by 2002:a05:690c:9c05:b0:6f7:5605:c62b with SMTP id
 00721157ae682-6fbcc3673cfmr103922197b3.27.1740392073624; Mon, 24 Feb 2025
 02:14:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-13-c11402574367@linaro.org>
 <khmeegjx5jmu4c32un3gqu7sumkbtdkg6cawwwmwtmkp5gkrag@sklf5tr7qbwv>
In-Reply-To: <khmeegjx5jmu4c32un3gqu7sumkbtdkg6cawwwmwtmkp5gkrag@sklf5tr7qbwv>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 24 Feb 2025 18:14:22 +0800
X-Gm-Features: AWEUYZm42Zh3tL3vnQp2tEApXMrcBNfOORo391vJrlHk1uL8HJBN-be9zH45G4k
Message-ID: <CABymUCOnnWQZpOhgDfENmWrTUuwb76zSN7nSeO+eyNp4k+PKRw@mail.gmail.com>
Subject: Re: [PATCH v6 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
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
=9C=8822=E6=97=A5=E5=91=A8=E5=85=AD 00:36=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Feb 17, 2025 at 10:16:02PM +0800, Jun Nie wrote:
> > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > quad-pipe usage scenarios require four pipes and involve configuring
> > two stages. In quad-pipe case, the first two pipes share a set of
> > mixer configurations and enable multi-rect mode when certain
> > conditions are met. The same applies to the subsequent two pipes.
> >
> > Assign SSPPs to the pipes in each stage using a unified method and
> > to loop the stages accordingly.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 63 +++++++++++++++++++----=
--------
> >  1 file changed, 39 insertions(+), 24 deletions(-)
> >
> > +     for (stage_id =3D 0; stage_id < num_stages; stage_id++) {
> > +             for (i =3D stage_id * PIPES_PER_STAGE; i < (stage_id + 1)=
 * PIPES_PER_STAGE; i++) {

Do you mean define and assign r_pipe / r_pipe_cfg here?

> > +                     pipe =3D &pstate->pipe[i];
> > +                     pipe_cfg =3D &pstate->pipe_cfg[i];
> > +
> > +                     if (drm_rect_width(&pipe_cfg->src_rect) =3D=3D 0)
> > +                             break;
> > +
> > +                     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, =
global_state, crtc, &reqs);
> > +                     if (!pipe->sspp)
> > +                             return -ENODEV;
> > +
> > +                     r_pipe =3D &pstate->pipe[i + 1];
> > +                     r_pipe_cfg =3D &pstate->pipe_cfg[i + 1];
> > +
> > +                     /*
> > +                      * If current pipe is the first pipe in pipe pair=
, check
> > +                      * multi-rect opportunity for the 2nd pipe in the=
 pair.
> > +                      * SSPP multi-rect mode cross mixer pairs is not =
supported.
> > +                      */
> > +                     if ((i % PIPES_PER_STAGE =3D=3D 0) &&
>
> Please move r_pipe / r_pipe_cfg definition and assignment here.

r_pipe / r_pipe_cfg is used in this if(). Please see above question.
>
>
> > +                         drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 =
&&
> > +                         dpu_plane_try_multirect_parallel(pipe, pipe_c=
fg, r_pipe, r_pipe_cfg,
> > +                                                           pipe->sspp,
> > +                                                           msm_framebu=
ffer_format(plane_state->fb),
> > +                                                           dpu_kms->ca=
talog->caps->max_linewidth)) {
> > +                             i++;
> > +                     } else {
> > +                             /* multirect is not possible, use two SSP=
P blocks */
> > +                             pipe->multirect_index =3D DPU_SSPP_RECT_S=
OLO;
> > +                             pipe->multirect_mode =3D DPU_SSPP_MULTIRE=
CT_NONE;
> > +                             DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d=
 for pipe %d.\n",
> > +                                             pipe->sspp->idx - SSPP_NO=
NE, i);
> > +                     }
> > +             }
> >       }
> >
> >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

