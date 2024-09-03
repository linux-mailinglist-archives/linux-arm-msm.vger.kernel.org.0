Return-Path: <linux-arm-msm+bounces-30479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 221FF969608
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D31C4282BA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15DC820010F;
	Tue,  3 Sep 2024 07:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K32MuV0S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400481CE6E6
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 07:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725349780; cv=none; b=MvtpDwi8Go8DzFrvMZfrBA5gBwMkfuNcFlVn/LbuZyVt3AveNVNenoMDQBLNl0YbhG6lwgOgX878CDUkcpkNJ5yyvXr4hvteHTnu5NypbOwvVVih0+FE1acY3RXAEfAuhrV2KHWa3Wa6tMxNZpfoW7PZkoiRjqqdZDN2w9T0Uhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725349780; c=relaxed/simple;
	bh=U5drsDdYj+WE/VngI/7977qZ3EiFomP9hav4ksR5Eis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgGKPWbfQtyWLxkmRV2DGy3OwU0TWDMPM9cMIDfWtFFMIV/R6amu8ObcuGxejJuUWnfogC0sJJkoGDyzXPL0qr6SRGPL4UBUBXPjD62v2/yn9+GhfvLvLKYvbPBm7mIQZf5o+ms2XFPhA4fmb8LfSu6VN8d+BZaSGwrs4gKJADU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K32MuV0S; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f50966c469so57164851fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 00:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725349776; x=1725954576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OstJSsZLDkrrd7yh8fzrQVQgwgOpUkY7Kn1i4f+Lsj8=;
        b=K32MuV0SEmSpEcZwFriGhaZmd+o6bWj1oyLX4tqbgp8VsQmWtizhvrSAwZYUJzbFVT
         IOw4/AFAbCu/sEYtNs09W0q+wjOW4JYN3CZ8pFPDjn6l99vFJ3dk6BtpVHyckw68+9a1
         cyBJPojHdlP9qUBqd8PIFnDza58ZrPLMLrWyMJ5Kw8srQCIr19GCsh6wP8B2D2KsaaZC
         EhNeJj0XkQRzk145BcGOvANfynXhtagg50dDj1UivOhA+olbKyCn21d+FznDkjaDRcUK
         CA6H018oIiv2EQG2Q2SwQkMg+fpJ88G3KHFtdgqCtURRHmIaxmibxPYSt0Gd4naL8+MQ
         sbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725349776; x=1725954576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OstJSsZLDkrrd7yh8fzrQVQgwgOpUkY7Kn1i4f+Lsj8=;
        b=Pumc1Tv3a+r7YwlBsFwxRR7eiSBNl0MDqXvXY2vzuG28MJFS3hM3BgoVO7atgtP6RM
         JEoyqIBXXucQhzAgTq2cucfb6hTsTOJB9b9u5aiIW7bD9/Ur2WRXinv6DGig9A94So3W
         JJgwQRzG+Cf5ji8x7tmZE0OVI50gulQllvPfCTuclZTfL+aDmAzvyIfPrakbXWL2nAyE
         xOayR0vMeOo69DzBErR9gsOsfhrTjBaTCy4tAJbjnOOoROnY4HCTnAOtJjrmf92WvCHp
         gbojxjBBOGnkhzIWTgUQu9HtICNSbsM1XXaljwEnDWpXwBTcox5RWVwEDMYtupQbWNT1
         LRiw==
X-Forwarded-Encrypted: i=1; AJvYcCWc9tAk/Rpe/KCGyugmpC6extsECIz1YQtOq/6gZGQB/+efJO3pe5VsYJGVsZlAX1sqdn+jpovAUFDASTuu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0MdRXXP/eAewZgDGvX47EL8QGq/zc9SYM2rjgADXqPVw8HYvL
	tJNkbkvZUDANG1kXecQC58xVU8CxJIUVgB2RPToL7ePm5AC1lLbMUfdhyZuJ1bp14Qsy54zKtKN
	ByojCIMm3ETvX07/XMtpaGc0JPPFOt23wmzFv1w==
X-Google-Smtp-Source: AGHT+IHZTmC8S+kG9iip3sLPfabh0C79/xWqZy7wFuhEn+n4AL7xKCJk4/ercF5tgsgzV0a8uyNtQqdEtz/mAEA2f1U=
X-Received: by 2002:a05:651c:502:b0:2f6:1424:6e70 with SMTP id
 38308e7fff4ca-2f62906faa0mr65498301fa.26.1725349776160; Tue, 03 Sep 2024
 00:49:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-9-bdb05b4b5a2e@linaro.org>
 <CAA8EJppAaHtwaDLQVG6f4zTmhpkpuuF0-NK9-iB7UzFcwO3hdw@mail.gmail.com>
In-Reply-To: <CAA8EJppAaHtwaDLQVG6f4zTmhpkpuuF0-NK9-iB7UzFcwO3hdw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:49:24 +0800
Message-ID: <CABymUCPdX6fdM4-qEAs5P__hauTUKQSpSeo6hrs0eZrrTi+Rzw@mail.gmail.com>
Subject: Re: [PATCH 09/21] drm/msm/dpu: request more mixer for 4K+ DSC case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:12=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > request more mixer for the case that hdisplay exceeding 4096
> > and DSC enabled.
>
> This doesn't seem to match the code. And it misses the _reason_ to do it.

Right. The DSC limitation should be 2560. And the reason is to support 4:4:=
2
quad-pipe topology. Because we prefer to use 4 layer mixer for dual DSI cas=
e.
The resolution is always higher and more DSC is power optimal. That's my
understanding.

> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++++++++++++++++++++-=
---
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 05b203be2a9bc..33cfd94badaba 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -59,6 +59,7 @@
> >  #define IDLE_SHORT_TIMEOUT     1
> >
> >  #define MAX_HDISPLAY_SPLIT 1080
> > +#define MAX_HDISPLAY_DSC_SPLIT 2560
> >
> >  /* timeout in frames waiting for frame done */
> >  #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
> > @@ -588,15 +589,19 @@ static struct msm_display_topology dpu_encoder_ge=
t_topology(
> >
> >         /* Datapath topology selection
> >          *
> > -        * Dual display
> > +        * Dual display without DSC
> >          * 2 LM, 2 INTF ( Split display using 2 interfaces)
> >          *
> > +        * Dual display with DSC
> > +        * 4 LM, 2 INTF ( Split display using 2 interfaces)
>
> This doesn't match the code
>
Yeah, just use 4:4:2 case for DSC+dualDSI case is a simpler logic. I
can skip the DSC limitation
test in next version.

