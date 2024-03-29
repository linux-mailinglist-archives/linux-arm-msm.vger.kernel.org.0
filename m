Return-Path: <linux-arm-msm+bounces-15657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A488911F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 04:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 236561C243A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 03:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE76D39FD7;
	Fri, 29 Mar 2024 03:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s9IQ64ti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8539ADB
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 03:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711682715; cv=none; b=uNazv0p8/okNNuOxaStQ5UZ+QhJZtyT0gsBMeWxgIi2qJqp2fQljosrP4ctUKxidNNN/RJMT2Tx7+HkqAEESMYweT9dcRC8U6dd9r9DQn4/68USO33hr/PXRlZGXipE47ql5Rq5NRUhD4Kqp9By7awgYQW+hABH0nIAFayO/p8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711682715; c=relaxed/simple;
	bh=HIHZi15/B+9ff+rMeFzO1Jio69/kqCX4x4NypErnZEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3RE4v8ahQAx+ypbSn26pXAjyvxqNZme5j1xRO6wTuaM4+ciwHnVls8uQWxo10HcUJQxAWz6XU3PvwZk7nJAkkMClZpnSPVchsE6pH9l4tONhcIceSEkuu51IBcAJl48OhCmVLsb5ooTCIOp5bcjvru9QOM9PPzFVi+qIGZwGFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s9IQ64ti; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6143fd4c182so2228947b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 20:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711682713; x=1712287513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nr/8twKi35UpzKCD9xLfs3GqmEy6CId1PaFPiyuBquw=;
        b=s9IQ64tiNH5jF7cc4Onyp7CBDKZVFc+H2bmNRotouzMoxsVtTJSsdGjPmEuGnkfM1e
         p+MDjOk4tqK1ya+XAGn/SSqTa2vokeQS+gls1vs0Zsezr+mfwcU4t6yve7TpgnjKOXA8
         /zsxcsPM1juYNpym0abJqmAXoGrdXgP2ADSNg/g+t8Nk/cukhzPDeP5OELDlfNkS8Kjb
         NbPgEUgkS7HMHx9OgueEWYS5IeAjXgGzMpWxpEa8d4qHn9BVKLcv5+fCNjc7XNZxsnO+
         JfQl6gPI6Y66DOSHZqtWx3ZmiDGPTJ+y7mE9ygDsPMiZquM0EJINSGi6EEwX2UNyTvFe
         ZrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711682713; x=1712287513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nr/8twKi35UpzKCD9xLfs3GqmEy6CId1PaFPiyuBquw=;
        b=MSCn8zVhB6ImkQ1Fa/FF4aLM0WjAlP6157LhK51OvfXxsM5HZmKTY8AskqOFyHKLxI
         JB7Wfjp47GbCXWNqgWsLcdA6/qYamDwK1cxwWey6QRInIwUt2G7tqCYKSFN0NPNgZSr/
         TtQfC5h1woRWQx5qMBfndKb2JI91zF6DFGAxuXZSeY0SfV1OjCd2uc4sThzDssAtZPIZ
         TUthVqQ2S9tS9sABf/2CJEL9mqY90qYuqJyP6vSyYoLgqfG8q2WclWu3LFNfKZCASNtl
         A/HiB3iSx38shnKdKJr/r/CG5j8lcQJ0GPVsQvATbT0Zps16jyhhe+B9MEw8pY8o3Oqm
         eFyg==
X-Forwarded-Encrypted: i=1; AJvYcCWFgurnHbjtg1exAXyUhGWYjqlNCusKQ49Txv3O9NSwHL2LgB/YSMItUd8IJZ6l/POwcaD3TCD+9uB36EYlHi6i4Q7eajYyjl9kr94gbg==
X-Gm-Message-State: AOJu0Yy2vHqIuBF328sLvL2kkpNJj1jqIcxwXOaJV60zs2T7VTm9gurK
	Yx08HS5p08+NKqCZvAWn48wUqJ2VcSdIJOQ0DMo1raL7sbOdB66mh/HBV3pCZAGpxVrO7crpC0M
	2DOiP8sZEo20xYI00L1GjFcRupIQsPFdN9j6sFw==
X-Google-Smtp-Source: AGHT+IEc/spMQTXZC1RG/WUE/vTwyFe2QySMsOuV3o7NaZ652TMmTA3iZU0xZDenXOK8OncbMvR0eeinZOf3A5JMVyc=
X-Received: by 2002:a5b:a08:0:b0:dcf:411a:3d22 with SMTP id
 k8-20020a5b0a08000000b00dcf411a3d22mr1249509ybq.60.1711682713054; Thu, 28 Mar
 2024 20:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328111158.2074351-1-jun.nie@linaro.org> <CAA8EJpq7eHgryrNnnR=Yh46PdkAQA-YNzTz_0gaWbr_g9CWSxA@mail.gmail.com>
 <CABymUCOdZO7K1F3FMR_KD5sgCUCSKreSYr3BWbNdYMO==+AErA@mail.gmail.com>
In-Reply-To: <CABymUCOdZO7K1F3FMR_KD5sgCUCSKreSYr3BWbNdYMO==+AErA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 05:25:02 +0200
Message-ID: <CAA8EJprBAJj8kub0JOk4Dd+-bqgtsrYM15hOKocYbZwrFqOwyg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: fix DSC for DSI video mode
To: Jun Nie <jun.nie@linaro.org>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com, 
	daniel@ffwll.ch, quic_parellan@quicinc.com, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, sean@poorly.run
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Mar 2024 at 04:47, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B43=E6=
=9C=8828=E6=97=A5=E5=91=A8=E5=9B=9B 23:05=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 28 Mar 2024 at 13:12, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Fix DSC timing and control configurations in DPU for DSI video mode.
> > > Only compression ratio 3:1 is handled and tested.
> > >
> > > This patch is modified from patchs of Jonathan Marek.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >
> > This almost looks like a joke, except it isn't the 1st of April yet.
> > The patch lacks proper Author / Sign-off tags from Jonathan.
> > This is pretty close to copyright infringement. I'm sorry, but I'd
> > have to ask you to abstain from sending patches w/o prior internal
> > review.
>
> Thanks for pointing me the previous version. I am not aware of it actuall=
y.
> The only version I knew is from internal repo. It is my fault. I see the =
slides
> says that Jonathan does not want to disturbed, so only his name is
> mentioned in the commit message.
>
> What's the patch set status? I do not see it in mainline yet. If it is
> in pipeline,
> I can just forget the DPU side change.

See https://patchwork.freedesktop.org/series/126430/

Jonathan posted the patches, but he didn't seem to be interested in
following up the review feedback.

>
> Thanks!
> Jun
>
> >
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
> > >  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
> > >  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 12 +++++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 10 +++-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 +
> > >  drivers/gpu/drm/msm/dsi/dsi.xml.h             |  1 +
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c            | 48 +++++++++++------=
--
> > >  include/drm/display/drm_dsc.h                 |  4 ++
> >
> > Ok. The feedback for the original patchset [1]  was that it should be
> > split logically. Instead you pile everything together into a single
> > patch. This is a complete no-go.
> >
> > Also, this patchset lacks changelog in comparison to the previous
> > patchseris. I don't think I'll continue the review of this patch.
> > Please rework it properly and add corresponding changelog.
> >
> > [1] https://patchwork.freedesktop.org/patch/567518/?series=3D126430&rev=
=3D1
> >
> > >  8 files changed, 56 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 6a4b489d44e5..c1b9da06dde2 100644
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

