Return-Path: <linux-arm-msm+bounces-28768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 389EC95437C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 09:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C0BE1C20A34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 07:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE1C13E3E7;
	Fri, 16 Aug 2024 07:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2lqTev1o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE6D770FB
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 07:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794781; cv=none; b=C/62zj6aR1xcb8IB5794NmWDxlIr4y3pAZ/9phSrkWWZDDujzMD8i4zZtMoc+qYnB+pxF8BeT0z4gwEWEj3yKlDVdIIoglaDS1TskDdiu4L/gPK6t0TmVVHWqA4mfz7yTZkynd/BfpkXuxwnwGS8Ckx3+xKvjiIdkgcSOpEDNSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794781; c=relaxed/simple;
	bh=3DNsJFXHZiWVqol8W+80o761HSN0vfQtyQOQF7Ei++o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaIx02G0znp3GtscDOKaHp8U5iWHkjTRJYbTplyTWWolYMVoK9/JMbm9+HRjjeuXxcMW7cXtzRJ+6wFiellKNvmiZ7OcvWh+yDqwb8vI45C3Q6ifxB/eTqaELv7QbRSiyRi1cJ1YgOceE850b7mUQSymJkh8LkKjAxNitggnTgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2lqTev1o; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efd08e6d9so2085769e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 00:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723794776; x=1724399576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErZwlSmEcN32B0RWV2Ol77fl/Gtde04C7j9uj1YvMuw=;
        b=2lqTev1o7tlAmWAoOxsAoJvipHIBGLAD4Xu0sMASZl3/Wig31TRANS9mQrrHxCouqu
         8f1jdny+y7SZncJ/fO3a3gz24DpTxj5qw3J0Sc68FPZpUARKCdUx3tP7mcAQyv4YF4hq
         T7MOxraW9Ax/98cQeoKUtgcvDim5wskTLWgY8Vpf2sCgRTkYdlqVG2IZrDFdKjkWTFIF
         VyH+UpAyEkIZPmv+d7BwJjYVTgsHYaTYAk6Hm30mcjCYUJI/2Bmfm/nDsiWqQjQ/NYC7
         +GV1dj+sBE4rFXvAg77HMaoUo0Ai9KZsj4ezhL60DOI+M9KwforCSAKSK+zENcVEjNbd
         w1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794776; x=1724399576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErZwlSmEcN32B0RWV2Ol77fl/Gtde04C7j9uj1YvMuw=;
        b=f25Jh8wNJLQt1lbw1asXpt4loBrYj46oI6UZVmpnQ3BYWkaIEOFUpLfOZqx+BuNOko
         vveX5zBCjX7StnXUbTPG44ekffQcQsx2H1HHvolEkpY8Hiex3a3KmyCr1qDBLbEbU2Bo
         wl4rUKPD4e+FA5cLhPWZ807yNGI2FvMtpsVxLOv2sXlgQKptw8jDA7wO4l0HqKE/c0ud
         XHZl4og0MgpOMAT76+aDdSE77jhOmwKGvKxBFAUMw/dJX1GE8HzmrIuWFVNLvPVaVux+
         A6NYEIjpJ4YavhhroNlzx/bj+JjVVhRbNaaWmcpHvvnXrih1rXS72ncS6TKzZZfvuEVT
         dCMg==
X-Forwarded-Encrypted: i=1; AJvYcCWtSUf0BuIQ6FIcGQVeNr1CQePxYVPfyb3g/KzPystD9hdXXEX61JDCbQCHoXKFC3BClLncEC9o17kouLY+p1Jq1CHFurletuks/xGA1w==
X-Gm-Message-State: AOJu0YxDNXONy+gsynV0MwDb3Lz36VHnGpLcdERZuh86EsteQV1LXrz8
	mi6W//D0ZbzV+AiK/LI5y38b2h7I0ulTYuX052kj6lwpJ5R/aCY0EPqSLeem3mdP7A25AoFql0r
	lJwFB506mDZ881FilbUSebb5tw/M2Y2d1+butGw==
X-Google-Smtp-Source: AGHT+IGxkwcsoXdh3ZtWmOxZwcqV5FpRGZAP6b9hLfyllKOI47JDmAGgxPNvbWaphMy8n72MPeWCpKdxAGzFVTHY0Dc=
X-Received: by 2002:a05:6512:3044:b0:530:ae22:a6f0 with SMTP id
 2adb3069b0e04-5331c6927bemr1549843e87.5.1723794775493; Fri, 16 Aug 2024
 00:52:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730013834.41840-2-mailingradian@gmail.com>
 <CAMRc=MfPjc=QN729tiN3vxvyO_ECeqqODmjqjoea9E5Z1++TJw@mail.gmail.com> <lkfpaovkvkdqrbx5u4rf5nanodymedowyhg2d5wgo5sdrbhupr@i322n4yjgllf>
In-Reply-To: <lkfpaovkvkdqrbx5u4rf5nanodymedowyhg2d5wgo5sdrbhupr@i322n4yjgllf>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 16 Aug 2024 09:52:44 +0200
Message-ID: <CAMRc=Md2pSgtapV1b_e94T64ygfVh_p9m5abuWDaeSVtH3U1Yw@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: tzmem: disable sdm670 platform
To: Bjorn Andersson <andersson@kernel.org>
Cc: Richard Acayan <mailingradian@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 11:58=E2=80=AFPM Bjorn Andersson <andersson@kernel.=
org> wrote:
>
> On Tue, Jul 30, 2024 at 12:27:44PM GMT, Bartosz Golaszewski wrote:
> > On Tue, Jul 30, 2024 at 3:38=E2=80=AFAM Richard Acayan <mailingradian@g=
mail.com> wrote:
> > >
> > > The Pixel 3a returns 4291821499 (-3145797 or 0xFFCFFFBB) when attempt=
ing
> > > to load the GPU firmware if tzmem is allowed. Disable it on SDM670 so
> > > the GPU can successfully probe.
> > >
> > > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > > ---
> > >  drivers/firmware/qcom/qcom_tzmem.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qc=
om/qcom_tzmem.c
> > > index 17948cfc82e7..5767ef210036 100644
> > > --- a/drivers/firmware/qcom/qcom_tzmem.c
> > > +++ b/drivers/firmware/qcom/qcom_tzmem.c
> > > @@ -78,6 +78,7 @@ static bool qcom_tzmem_using_shm_bridge;
> > >  /* List of machines that are known to not support SHM bridge correct=
ly. */
> > >  static const char *const qcom_tzmem_blacklist[] =3D {
> > >         "qcom,sc8180x",
> > > +       "qcom,sdm670", /* failure in GPU firmware loading */
> > >         "qcom,sdm845", /* reset in rmtfs memory assignment */
> > >         "qcom,sm8150", /* reset in rmtfs memory assignment */
> > >         NULL
> > > --
> > > 2.45.2
> > >
> > >
> >
> > Ugh... As the list is growing post mainline merge I'm wondering
> > whether we should make the generic allocator the default in defconfig
> > and SHM Bridge an opt-in option?
> >
>
> Can you confirm that we still need this, and the other entries in this
> list?
>
> Thanks,
> Bjorn

Yes, the fix you picked up was for a different bug. I'm in touch with
Qualcomm about debugging the firmware here but it's not going to be
immediate so let's apply this for now.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bart

