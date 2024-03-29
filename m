Return-Path: <linux-arm-msm+bounces-15655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E507A8911C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 03:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7D7B289C42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 02:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB852E821;
	Fri, 29 Mar 2024 02:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ePUTI/l2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ED6A47
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 02:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711680459; cv=none; b=ssHjROdD7aklq//218NZldTHjE72iQvghGpdM4CyAEObzF47AuxnssBPpz5iXyfPZYT3XidUe+cMLoUZkEj+4OG5THLuu6dF2xleTllAKc5NjQYf74SU62HtpHJyebqD5Rl3BfeduDskM4GPh0lM5DnIrvmVNZRS8VqxHu2kLYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711680459; c=relaxed/simple;
	bh=JcUlEBF0Uv9a/XmjG4SVUjUXRSCAaEzJPk5xjGT+c8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mAggWikOHFt3cv9R8RwGdfvDYwiazdvhJx7zml45DKWNRocEoCfZ7bF0RzuTh4qaFlohuG55gt6W/zjnnP0R6VFLOZMNuKE9VuIlJd33JrpMtEzq0UeqfH51zYTK/hWffA4+SzvIGoPwPoyJDaFZ1GKB+5IaR8MiFjY0DxSX4UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ePUTI/l2; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so18320661fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 19:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711680456; x=1712285256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSETHpMqQALVwCbYm94Jc+2S/pi/8MN4MsDFLYYekkU=;
        b=ePUTI/l2sVg14Bts8QlIm97x2JpvhLc3QTmcBNbAHKvZkMho1f4MdAnjG94YmVbyA8
         ZJ5gN1BpHEwRao7WHrcg0zJP5bWIVEiM2CnvL9nHN65ncC974n1ltvkHybnZVFI5vljR
         iCMa0DYdq8Ve/w3Rs6btUnNW8Y2gjrivPOAEF41NNsbhqorUvl5lcgvtd3GEZutxYi57
         sh6PpsWoTvxWIxJHQVJ8nu3rohXm+82g1jqEuAPWwtMBmGhmGFuHcMazUCdB9jCz9AEi
         uxoXoiMHl2AX66MN6Kh83oPkD2BHAUtwRWkiqwxxM+6xzjBBrsbvM4p/mtkeBJRDEa7/
         VWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711680456; x=1712285256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSETHpMqQALVwCbYm94Jc+2S/pi/8MN4MsDFLYYekkU=;
        b=NDMI64sLpKvmyad9mUeIGEKrhqo/iA2e44va+S/0JY9Ka89LMVebmwceFJWdHUSb8W
         i0vZ7pqueZk3GEF7cT6OCGsjRv+U4v9rPvVjUgcuFVJVcRDfObCjmV18sxRW2ojY7hZY
         /J8626Slu6K8je/4sPJIILNf4A1gK62Jy8/PcK/unAInOYvam94Pm1cBvoBneN7hJFSE
         8uUgZXFyX37cios7s+yQoUoLzm51Z9u73hp9XmNVxD/o62t8RXU40B73XPTfM7/wphXX
         Lqa6CRLUxpPsAybHEO72Ze7k3JOBIbTEdFMvYqXa79NK8K224dfSvO1pCoTXgSiDo052
         Dl+A==
X-Forwarded-Encrypted: i=1; AJvYcCUl4KnMHJMdhpO5PvZZ/dNJmdoVQqI4FpCLX4bXWnBpUtJsgKRxPEcQ0yBaPLqWUWx/JiBtcAfUFhApMonCj9zoi8DHRemmVqf3i/hTeQ==
X-Gm-Message-State: AOJu0YwAKnsEj/YbRLDx/84I4bUfEQ8tmzzg8uHrUVXMQ398JL8DBMbd
	iHSJYA6eoptE6bsK5/CJDnesmmbGf6rSu3hVaTPOO14PP7BXCHLMvWylPZAa6BMI1WxjW6O9Wki
	dhIfHHL5K88yTSvgnnRbhgp2ki7bfFKCZgVowbg==
X-Google-Smtp-Source: AGHT+IGkPfHE2Cb4ujRPE2lteIEJE/6vhbAkZFZyGBXNMNjknZyJOjV3GSO913me8KPFw4nJCc4SYzvo3L5pLLRwgX4=
X-Received: by 2002:a2e:bc21:0:b0:2d6:a699:4bae with SMTP id
 b33-20020a2ebc21000000b002d6a6994baemr603365ljf.6.1711680455712; Thu, 28 Mar
 2024 19:47:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328111158.2074351-1-jun.nie@linaro.org> <CAA8EJpq7eHgryrNnnR=Yh46PdkAQA-YNzTz_0gaWbr_g9CWSxA@mail.gmail.com>
In-Reply-To: <CAA8EJpq7eHgryrNnnR=Yh46PdkAQA-YNzTz_0gaWbr_g9CWSxA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 29 Mar 2024 10:47:24 +0800
Message-ID: <CABymUCOdZO7K1F3FMR_KD5sgCUCSKreSYr3BWbNdYMO==+AErA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: fix DSC for DSI video mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com, 
	daniel@ffwll.ch, quic_parellan@quicinc.com, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, sean@poorly.run
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B43=E6=
=9C=8828=E6=97=A5=E5=91=A8=E5=9B=9B 23:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 28 Mar 2024 at 13:12, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Fix DSC timing and control configurations in DPU for DSI video mode.
> > Only compression ratio 3:1 is handled and tested.
> >
> > This patch is modified from patchs of Jonathan Marek.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
>
> This almost looks like a joke, except it isn't the 1st of April yet.
> The patch lacks proper Author / Sign-off tags from Jonathan.
> This is pretty close to copyright infringement. I'm sorry, but I'd
> have to ask you to abstain from sending patches w/o prior internal
> review.

Thanks for pointing me the previous version. I am not aware of it actually.
The only version I knew is from internal repo. It is my fault. I see the sl=
ides
says that Jonathan does not want to disturbed, so only his name is
mentioned in the commit message.

What's the patch set status? I do not see it in mainline yet. If it is
in pipeline,
I can just forget the DPU side change.

Thanks!
Jun

>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
> >  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
> >  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 12 +++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 10 +++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 +
> >  drivers/gpu/drm/msm/dsi/dsi.xml.h             |  1 +
> >  drivers/gpu/drm/msm/dsi/dsi_host.c            | 48 +++++++++++--------
> >  include/drm/display/drm_dsc.h                 |  4 ++
>
> Ok. The feedback for the original patchset [1]  was that it should be
> split logically. Instead you pile everything together into a single
> patch. This is a complete no-go.
>
> Also, this patchset lacks changelog in comparison to the previous
> patchseris. I don't think I'll continue the review of this patch.
> Please rework it properly and add corresponding changelog.
>
> [1] https://patchwork.freedesktop.org/patch/567518/?series=3D126430&rev=
=3D1
>
> >  8 files changed, 56 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 6a4b489d44e5..c1b9da06dde2 100644
>
> --
> With best wishes
> Dmitry

