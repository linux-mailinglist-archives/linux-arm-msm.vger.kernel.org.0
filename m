Return-Path: <linux-arm-msm+bounces-21648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F108FB95D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 18:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7347B1C211F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 16:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5863813D607;
	Tue,  4 Jun 2024 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWu1WPYQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE69168D0;
	Tue,  4 Jun 2024 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717519532; cv=none; b=Vqkvzq1anEvHWRRfUzZeaYapDTUGBZrKjOpRnQ1SE2lWUU6FkfwTnQWMP45UBXMamc05lTTFyc5JanzIjr04/owCC1mRLkN9AxDOxb/iO2kUb6bpYC1fqbWTRLLXCwafUW2KtWW3nZNuZUGGrkr39dAVoiDCLoiDaQLgSJ7NqHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717519532; c=relaxed/simple;
	bh=Zhw+hnOzFnrffRZ/Lm3uKtUSBRgK6wbi9BdZLz/gxRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E12C4ZrMnaXQ5Un7PTOxQdKpmieQu3vhoE/y3m9V6f6ThOwfJZNCPN32+HT/qnow8IE6ep4gYiczshDzgv3VmerLO1EszfXz9plS+kPBxn9pr+8nd9aPnEdHzsAF5Vo4o13HETW5sjkV4vwHTOLUGzxry1MHscaOhCDufzL0/f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWu1WPYQ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c1a99b75d8so4344828a91.3;
        Tue, 04 Jun 2024 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717519530; x=1718124330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QecifVAR+tvBUqTJQdxCWnDSVIat9xStXa2bm/K4Dng=;
        b=cWu1WPYQCDx6b88gTuGqJtEOsZsqU+J1BeJiK2m9lEOyC6+uZV28VnvC/4Pm8zcBBM
         X5wdcaIP9RIcaJ1Q1pE7mu0z+wUrPETIFevxro21Bmaqvv74DOhPm+zSplEXeQRi0pBG
         BLGYWEXA+n78HK77wuj23JKk1IJUCmQ/PrQN3VB5MWOMuj0gl7uJL7V7x71y/U/Hh66k
         pwtm12vC1dMQX0l0haAZRp4XY+U4v7zM3o0MAs7imbUz+09CLn7vh1XwvvhLFzVUIoCG
         ACpQ3ygJVqgj7vi95wtRy6VA+UwW+bcZtHGWoDIR+ULTEcg59WLZDJEIQtIk4Pa1hf/c
         GDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717519530; x=1718124330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QecifVAR+tvBUqTJQdxCWnDSVIat9xStXa2bm/K4Dng=;
        b=D0dRJCezJkLat6VrkBHlbJJ72xcOauXQgETMZdTJ5MSg/h4cm8fLgyQEeYKdb2Rlgx
         qwU1Yuu+aOFdAzdAaJvQU4dji36z+f+PGMdEZ7qgrMxCYp63GATSO+7BnZxdAeipnReS
         X5UZmtcxTfnDeLiCn3XD5h9ncs1izfXoyxNzUxf1M1xFwJv1wUb53tiGEBBPfaNwV/0b
         vJ7ac0LbAT3anfLo+FmI1EH7Y1C5PwoovcUd12gxqQ5MPKCs8jjkTiAThSsrsQDE+Nhp
         q+t6H4VIXVEkNN4is9NR7izmUjiDPpTjMciGc1dt1cVxDBxUw0hybWY07Ve2+o0MH9RO
         JTMg==
X-Forwarded-Encrypted: i=1; AJvYcCWPqtbuGGr1N12cYiag7kHV8uGQHaFUX1wdqXKwn7thROqDjN0P1n3kquNYRg7GNVQ2mjm6b2Zg8a5b1hZRMrGjxn3MS4SermWxj8nhMvog0bqJldkoDBxXC9+9NvYWB+AppoCEGbCGPq+wuA==
X-Gm-Message-State: AOJu0YwGwHAb+y5aN7caMaVmDlUktSOOIgKCppqlTdUYwt4Y9Q84E2ip
	DaCiPEisED8j5ESpU+oC+7Uq/TqxIGneS6bed/HApaYEnY+nHisvtu7zExJlNiQe24ODdmfXuSY
	8aXyBmHn6eyQ0xVjeW0DNP6yqaBI=
X-Google-Smtp-Source: AGHT+IFCTYi81ohxmB4GHF8R5ig10gXlGw/VXeg6Zyu7SRlO2MnRd3LHAj40rLREbkSJw9Vw999N2GkMUnudzwyOxwY=
X-Received: by 2002:a17:90b:30c2:b0:2bf:9566:7c58 with SMTP id
 98e67ed59e1d1-2c1dc5d2962mr11454075a91.41.1717519530143; Tue, 04 Jun 2024
 09:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604-a505-v1-1-82ee1c04d200@gmail.com> <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
 <CAGsSOWV=i2JHsYNvi5EC6q=NoD8v7SiTjbVQhTDLNw35+irTCQ@mail.gmail.com>
In-Reply-To: <CAGsSOWV=i2JHsYNvi5EC6q=NoD8v7SiTjbVQhTDLNw35+irTCQ@mail.gmail.com>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Tue, 4 Jun 2024 18:45:19 +0200
Message-ID: <CAGsSOWV9SRK1VUJiQfavEM1hL0PapxUBG6CNeD+Q=0qPT5ZnSA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add support for Adreno 505 GPU
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 2:27=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trab=
arni@gmail.com> wrote:
>
> On Tue, Jun 4, 2024 at 1:55=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linar=
o.org> wrote:
> >
> >
> >
> > On 6/4/24 02:20, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> > > From: Daniil Titov <daniilt971@gmail.com>
> > >
> > > This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MHz=
),
> > > SDM439 (650 MHz).
> > >
> > > Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> > > Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> > > ---
> >
> > This all looks very good, just a nit
> >
> > [...]
> >
> > > +             /*
> > > +              * Increase inactive period to 250 to avoid bouncing
> > > +              * the GDSC which appears to make it grumpy
> > > +              */
> > > +             .inactive_period =3D 250,
> >
> > Are you sure this is actually necessary?
> Every A5XX GPU is using the same value, but i have never tried with
> DRM_MSM_INACTIVE_PERIOD.
This was the original patch
https://lore.kernel.org/all/20180507224750.9383-1-jcrouse@codeaurora.org/
where the inactive period was increased for a530. I cannot test
suspend on msm8937 yet.
I can check on msm8953 with a506 maybe if a506 works fine with
DRM_MSM_INACTIVE_PERIOD
then a505 would be fine with it also.
>
> >
> > Konrad

