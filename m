Return-Path: <linux-arm-msm+bounces-44511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568BA06D32
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85DBD7A0470
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC992080C3;
	Thu,  9 Jan 2025 04:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ieNRq1GV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E362F2F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 04:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736397636; cv=none; b=RljDlf7yt7zuKB901YfjDX0leCsi/xkP2Do5uHrXth1y7gwHeIHTCWZxYrkUniVjj/vtlDsi5Vg6zwiCBlK/vGl4Cl1Q4q79SnnUAazk35so4NOqzWUxYvyQ8zDrEnZN3hwG91DFuL5rSgveoE/bpEhBv2VZRPrmbzdbLdS68/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736397636; c=relaxed/simple;
	bh=ceoKCMo71x1aT9pleQBxL6AF8HHceg1zyk2GK3gKSRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJkxkIjdSAg4U8XVCy/8mGvFkiPjZL9x4aXzkS67fkRp+pBpoodIyc/kGHRNbZkuWMBcVqdhQc08ljzGepeeb5xaxtyl1BOwyh3zRnQ6sW8y6fwNa5MeFWrS8uqcCpSZRY7cOwe9d2EPLibAvINYIwGJLq7dRGYBa/m1j4v0low=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ieNRq1GV; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so579632276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 20:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736397634; x=1737002434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvs/mHJQMOdYczLfBV45iYS0W7vmpZ9giDxDReXGotg=;
        b=ieNRq1GVE5OZb7cOO56QZbQuAj67bLQgbFe0N6mpQiazQ5U/mMLdPssfuVgYInjY9R
         tk6mc3wU1HEog1ryKERjOCbP5apablUA+w9bLXkzzF1N8/mXzxMTTrDmP/WCOozXJU6r
         to8wXbhcNJjBCuK8Xu1KLrtHR0C2VeB8zAziyJFx2cnLzIBvG+N5ejlNrz7YGHMDbKXK
         BPUssjWDGErGSOUGeVSUnLxSBVntHGODOJzrMa5osEGzzH6yC7VAfN+zideEgqW2IOx8
         BjrheJk5V6El7jd/4WZSHu735CIDHV72r9u7O4NHWD1MurAmFOhSWpxPyQ0S1aH1kln8
         bKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736397634; x=1737002434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvs/mHJQMOdYczLfBV45iYS0W7vmpZ9giDxDReXGotg=;
        b=DyjNhOnp6a2BBYHDUzgw14NbaGdT5VyxsASFlUNb/JIknIBjWQN2V778QhwmfqiL08
         N3oOdLdDnB1VCFrX07PgnSz8xsme2xVoeiSE6OYEPY5UIrFsfzmVqeX5YZsUPbdSCWqX
         d06m8mFVYO7mNHXcnHD2ID591PNhp80EgbUpAgHX0par9XsNaBEoT62ojk7erJYIzHYP
         yECcYkaS1/Jd8paChKBfQEl6wL4h2Jt5vJBrnLdjW4pkITTqd1yfM2V4lWjIcWkurnxw
         BCH8dPAW5meXktHuGTwDYTwqVlbBEicH1nBFqJX28BEFtVCtkrXlcyrBnCqEDX5851kj
         4q5g==
X-Forwarded-Encrypted: i=1; AJvYcCXj0twZiYcEnEx/EZXZmqcZy5Nsq9gywcj0urbEL/w7jfqIhlQ2jMY1XLTDY4hDGyr+YbXYmlBPm368I4gt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ZiXaoW50G6VvwFO1i37UbtHEOoF8I9PijU5HTSYDaPMfeq4k
	nprJO3BarYODFFRDo3xpEYQ36wFIwG44H6D2l/SDKVs1ut3d85LwPKSShyKM52dLr4lV2y9LkOo
	ZWyXd8rm7gisb69I5be64vKp/YQaWkAPslS/ZEg==
X-Gm-Gg: ASbGncvLphEQXoiIYPfOe9UIwyYBdSzDmq6Z1pRqxrgO/BJd0axq6FY5WIBR32CtxDF
	Zli1vnx12zcdi0QXTP5DhfF1CH2T9FOqvBMhfyb4=
X-Google-Smtp-Source: AGHT+IF9s2GUSi5T7LK6WS13hidqzx5TqfDPAlAGk/Zzi1kAOlWEP/BP72Us2yTqrtLnalb/C5PfgG3qgZc/bEjeS/A=
X-Received: by 2002:a05:690c:f84:b0:6f2:8e62:d8f0 with SMTP id
 00721157ae682-6f5312ae9e9mr43943667b3.30.1736397634058; Wed, 08 Jan 2025
 20:40:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
 <da270bd6-3f7a-4100-8352-acbf14b62db5@quicinc.com>
In-Reply-To: <da270bd6-3f7a-4100-8352-acbf14b62db5@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 9 Jan 2025 12:40:23 +0800
X-Gm-Features: AbW1kvbKKm8DJYo0dAIIJoPHVvNkrDYDyz7Pf_4o6XMiCwe4OMdmxohhw0h99BA
Message-ID: <CABymUCPm-+RYVGx6aXXPqgEcg+x7vhrN_HanJvvNrFkJj6o5Aw@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] drm/msm/dpu: fix mixer number counter on allocation
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jessica Zhang <quic_jesszhan@quicinc.com> =E4=BA=8E2025=E5=B9=B41=E6=9C=889=
=E6=97=A5=E5=91=A8=E5=9B=9B 09:29=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 12/18/2024 11:49 PM, Jun Nie wrote:
> > Add the case to reserve multiple pairs mixers for high resolution.
> > Current code only supports one pair of mixer usage case. To support
> > quad-pipe usage case, two pairs of mixers are needed.
> >
> > Current code resets number of mixer on failure of pair's peer test and
> > retry on another pair. If two pairs are needed, the failure on the test
> > of 2nd pair results clearing to the 1st pair. This patch only clear the
> > bit for the 2nd pair allocation before retry on another pair.
>
> Hi Jun,
>
> I think the commit message wording is a bit unclear. Maybe something
> like "Reset the current lm_count to an even number instead of completely
> clearing it. This prevents all pairs from being cleared in cases where
> multiple LM pairs are needed"

Thanks for the suggestion! Will adopt it.
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_rm.c
> > index cde3c5616f9bc..a8b01b78c02c7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -316,7 +316,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >               if (!rm->mixer_blks[i])
> >                       continue;
> >
> > -             lm_count =3D 0;
> > +             /*
> > +              * Clear the last bit to drop the previous primary mixer =
if
> > +              * fail to find its peer.
>
> Same here can we reword it to something like "Reset lm_count to an even
> index. This will drop the previous primary mixer if ..."

Will do.

>
> > +              */
> > +             lm_count &=3D 0xfe;
>
> Nit: Can we directly clear the first bit instead of doing an 8-bit bitmas=
k?

Could you elaborate on it? Or you are suggesting to mask 0xFFFFFFFE?

- Jun

>
> Thanks,
>
> Jessica Zhang
>
> >               lm_idx[lm_count] =3D i;
> >
> >               if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_s=
tate,
> >
> > --
> > 2.34.1
> >
>

