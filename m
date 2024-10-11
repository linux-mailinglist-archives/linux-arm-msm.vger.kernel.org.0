Return-Path: <linux-arm-msm+bounces-34034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B40E999D33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB78A285C69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7141C1ABE;
	Fri, 11 Oct 2024 06:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zUjWwqVD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDB311187
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 06:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728629642; cv=none; b=L2pbff0neSKl3bMIjZd5uSyq1cEPvUbOd66bCEt0xtKPCT9/kE/4DtOp/FxddsZPGGX06aBYZV+4b+lBaLxWYJDZAcn77b/mQwnzivrQnLZN1VZX5nh86/XOtBzOIdA9ohM4pf83BMXCmNJDx9epk9Xic6ay4lxWB5LvPxKvC9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728629642; c=relaxed/simple;
	bh=RhOyCcD+p6NcNr11PB1lLFi9WZWY8FM8KzdFrOo0HEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KuThBhLeYlexR6oKtStZKCvCUv1E8G2wUxMjrm/tAlU8sNjbjaZusK5RFYcLSqvQ1nSRnghje4DX/PbbOx4goKrc7e8XluywjqnEnewc5EEccZnAoJ4xahC24OdsuRh70BvUog+HfxcfwPaj5IsPGLYSSdUYj4aCapFk6xzlyqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zUjWwqVD; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso1507052276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 23:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728629640; x=1729234440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17oCjGzef/2UE8bCOde+fsQlgIs92oMXKbycZ1wrAZI=;
        b=zUjWwqVD6qxHI23mPyMI7Z1ACR1SObW3bHWlEEqIclsgKEvnz7Em9/0cl/NBHzalgN
         m3mnRwqonrl+LvCFh0sSVldtJZ9HJtuXjqCngIsS6jlfr39eDAgl76O+vPo1DXbnfAWK
         6AjRs3IbEvkycmsEsdWah6DbgvVc72jHpn2zr8zqZil6tZcV+nPl6n2LcVZghjIC49mb
         DwdCtuDGPJRQ8weWY+9U4Tnm4aMeYU9lFjE/bGtuU50Fg6AVPqYR0RGlaDzZ6e9x0Huh
         Mow0bHYcc1og4OBlDy4aa/zxaKlBRZmgglPNgXCDt5c85xWRzzPyjaoTXEvfq6w0Wu79
         wkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728629640; x=1729234440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17oCjGzef/2UE8bCOde+fsQlgIs92oMXKbycZ1wrAZI=;
        b=Yuf9GBxwrbHftTGs4PvKWW4+7i/MDW6o8wxBHUGcClkgd+jfmwVq1yrYHp4UpIpfb8
         XLn/hwEkHsvny5pU9G61ftjt3exrYCrHHb8S5GMx6J49s8ryfdDmk9EMPbbETDao1u5B
         ub3ktMg7q24xWBpWBAkGBHBREekUBwpK8enaVUyjfy+GEKSAm2IiGHN8XmPHiiQAJTUi
         zQr53qA/w1CFrlWdcqluzt8CvlZwuhg3+awr46RbvdTDQGQ8KTm+hRoCWC9E5R3nWP/4
         HpnF4+pq0ncZi4ThiUfrZoVWjM6v+02a4Ei2XpHJqKQI8VObfWXWdPmXXBDtOr9OHvVn
         BSyg==
X-Forwarded-Encrypted: i=1; AJvYcCV1gAo2RNryIkO9Qo2KlVrLVaZIWWLq6Xc0rZVVm/XocFaVnWwRTdhqsFe05EihP7TOQtDf717wgbly9Fyv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1AQ0uNE/bL+lcwZA+C9X1Q9Lpx7PKl70pM/RPBzOFMJyjfjZ+
	W9NBYJHvW1V4c7o1OeoLAumtvgfBHlcOQxsShF0Sxr04t1ump2rh4A552fJfjAKeulyYR2Tfn4o
	QoSLxdCFgXBENhYtlB/QqZaIXto6YGqC4bMQsnQ==
X-Google-Smtp-Source: AGHT+IEcKrVhYkTlegrRYlks5vwNXkS8Zs44m1DY8Xw3QedwmulZZ7MGGC1XpVbTOaR1CUfuKx1qdvJf7YjcaChKFkY=
X-Received: by 2002:a05:6902:e06:b0:e28:e5e8:5e3d with SMTP id
 3f1490d57ef6-e2918e5e2dcmr1023240276.0.1728629640142; Thu, 10 Oct 2024
 23:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-11-76d4f5d413bf@linaro.org>
 <olzxobeurhyi76tdn7mq3wegxth4c7a2ys7dikajkx4d5y5z7i@3vkyjy3hg57s>
In-Reply-To: <olzxobeurhyi76tdn7mq3wegxth4c7a2ys7dikajkx4d5y5z7i@3vkyjy3hg57s>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 11 Oct 2024 14:53:49 +0800
Message-ID: <CABymUCO0u8hOLtie7typUQ3XV4AAds3RhT_hF23WB5Ruiz9AnQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] drm/msm/dpu: Share SSPP info for multi-rect case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=E6=
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:21=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 09, 2024 at 04:50:24PM GMT, Jun Nie wrote:
> > Share SSPP info for multi-rect case if virtual plane is not enabled.
> > Otherwise, the 2nd half of DMA content is not displayed due to sspp
> > pointer of r_pipe is null.
>
> Fixes?

Yeah. It is to fix bug in non virtual plane mode. Do you suggest to split
to another patch set?
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 904ebec1c8a18..898fc2937954e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1042,6 +1042,11 @@ static int dpu_plane_atomic_check(struct drm_pla=
ne *plane,
> >               pipe->multirect_index =3D DPU_SSPP_RECT_0;
> >               pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_PARALLEL;
> >
> > +             /*
> > +              * Signifies that r_pipe is to be used if the width of th=
e 2nd
> > +              * pipe is not 0. This does not apply to virtual plane ca=
se.
> > +              */
> > +             r_pipe->sspp =3D pipe->sspp;
> >               r_pipe->multirect_index =3D DPU_SSPP_RECT_1;
> >               r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_PARALLEL;
> >       }
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

