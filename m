Return-Path: <linux-arm-msm+bounces-30490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C14C596970F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 10:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30760B22B8D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51E81DAC5D;
	Tue,  3 Sep 2024 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9ZCm+Hb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488571A2643
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 08:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352223; cv=none; b=HsH6Xma2f3u0sX5gHJUiIXdZRXfKF+3mcmh0SGkWJpHM/9LhYkQbUhJ4djEl+5GoElJbxr9JFnwHoDyopC5Mr3n1v5FVa/eLQ8qsa+Gs0Mep8ZZImgsRY1QGFYtGatSK+vchkQJyRxez0S0ItANRxIgzDmfsLWy3RJ/ExCH4xEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352223; c=relaxed/simple;
	bh=7JLA6SwNTAG/M4bSvCUM1V19PPQJ03NHMutZLhv2tcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRdjvkxD+goJkU56CdEt+OdmBXZ8UeFzy1v/yi9KDhGpXafrNe67wC8nAIiG2W1YimYQ/EH3RVaqYZ8wf0zQvvKPqWNwxG98ApNdW/zzpYCrpsDAQpHlmlCUxWeYL8q2i9dko6vG9PXQK5lfPYela909pxyAoM9su/KiXKCpmVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9ZCm+Hb; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6bada443ffeso38522067b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 01:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725352221; x=1725957021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JLA6SwNTAG/M4bSvCUM1V19PPQJ03NHMutZLhv2tcE=;
        b=b9ZCm+HbXFGhfPtrZmGqjHRJ4qCpoWV4TkDXBkvsz6hat136XKzTiFGVIDCbWqtKuz
         xOLftlwMhPJ/7nlMT/kWrrMzeQm7llJKugQ8sMHnz/HPMz1Zsj6x8Lw+uY7Q/1VfsH0e
         pFfjB10wT0y1Nr87ujNbS0zkiuXoxn/+Fghb/4psgCtr9+mJOF03MhSPxzWJkPl46Uo3
         /JF5NRpqrxlRab5Q2cocKLTzNhernE8FK2T99EXrG/b3SfiyZrpT6RfTLFogWGMlIL/t
         x1tM6pAE4Qb0BJCOnODvT+IwdwelO8kYOIrIOQuQnLnuXxCQPBo95Z4Tr0YWL0xjtKBV
         UChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725352221; x=1725957021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JLA6SwNTAG/M4bSvCUM1V19PPQJ03NHMutZLhv2tcE=;
        b=K8n1nYREcEMCM45T+uNBueFhG+oTG4QqliuXtAMOZwFArCt5/lIc4T/9IZBUEFX+Ml
         4jdkr61hXdsLeZn2qqrQ0WvlFC5bKMu7M0abL+lALFoj8tRBvHQdkGMImlF/HeLsLqvM
         ZQnb/gbM61VFLLMLRqldKQv3TRQtx/8EU5uET32UibDlkTaALgPDOks295hj4DKjD0uw
         eYksMTJuuf6TJGJpe6S7d5ynjnw4Ev9Gf30XnkQPk+160VLZHoHttU0/khN31sXJWWm3
         hHpz5Yga+v1pMxasoAlW6DXrtZa06ZItR1nx8O07vHjAv3RwABrq3q9QaEBfzDaXCwoG
         daPw==
X-Forwarded-Encrypted: i=1; AJvYcCVPo68cIS6BevqYu7QqRs8aYVjyvPdepu9VUFlFKxL0tD1FoSTGchbb48H08e9f4CV4huRGTzjY/P9+EitD@vger.kernel.org
X-Gm-Message-State: AOJu0YyLEj/o7y+FTX4YSEriPeNE2VF3bIdiT3sQpKcTrdhS0m8/OtAv
	694Adip36o3V55au8ZPt4TXuOIRNx8IRRIU0h10w88ABIGtkDmmCBQC4gFLFz3dDVxuLPDJ1XBP
	6rXrI8ybyFgegQq2ZLx+IH1HDpn+JPx4bph8RFQ==
X-Google-Smtp-Source: AGHT+IE6+IuJbo/Qa4C+ke6jr8gGlhel248tosjzF6z+OPZUMgyyXNzVAr6RoXE16AWMpicsRKxNkqNsZU1ZeXemP1I=
X-Received: by 2002:a05:690c:f02:b0:6c7:a120:e104 with SMTP id
 00721157ae682-6d3f7fabc73mr125792017b3.4.1725352221035; Tue, 03 Sep 2024
 01:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-2-bdb05b4b5a2e@linaro.org>
 <CAA8EJpp_LWmuN8CFuQEAME-O44_wJXUKsR1QwahuigzSss5Rqw@mail.gmail.com> <CABymUCPXDTCVeeC0s+1UyuqYF0XNW55qtOBV9--BOoSjAzVjkg@mail.gmail.com>
In-Reply-To: <CABymUCPXDTCVeeC0s+1UyuqYF0XNW55qtOBV9--BOoSjAzVjkg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 11:30:09 +0300
Message-ID: <CAA8EJppMkd4QmQHiFGNQNRyCh6S3BGqcQ7Deoag25AjH9rJwdA@mail.gmail.com>
Subject: Re: [PATCH 02/21] drm/msm/dsi: fix DSC width for the bonded DSI case
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Sept 2024 at 10:32, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 18:54=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > From: Jonathan Marek <jonathan@marek.ca>
> > >
> > > For the bonded DSI case, DSC pic_width and timing calculations should=
 use
> > > the width of a single panel instead of the total combined width.
> >
> > What is a "single panel"? Please rephrase the commit message so that
> > it reads logically.
>
> Yeah, it is a bit confusing without the usage case explanation. "single D=
SI
> interface" shall be much better here. Because bonded-DSI can work with
> a single panel with 2 DSI, or with 2 panels with one DSI on each panel.

Yes, it sounds much better.

> >
> > >
> > > Bonded DSI can be used to drive a single panel having two input
> > > channels, or to drive two panels with a input channel on every panel =
that
> > > behave like single panel for display controller.
> >
> > Missing actual action. See Documentation/process/submitting-patches.rst
> >
> > >
> > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >
> > As pointed out during internal review, missing Fixes tag. Any reason
> > for ignoring it?
>
> Sorry, it is missed by mistaken. I am just more familiar with
> "Signed-off-by" than
> "Fixes:" tag, so not sensitive to Fixed tag and miss it when you
> mention it. Will
> add it.

Well, the regular rule of reviews applies: if you don't agree or don't
understand, please reply first.

--=20
With best wishes
Dmitry

