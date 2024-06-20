Return-Path: <linux-arm-msm+bounces-23412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 048F1910E82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 19:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84DD0B2539F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 17:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A9C1B3754;
	Thu, 20 Jun 2024 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lh5s59ea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1681AB8F0;
	Thu, 20 Jun 2024 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904553; cv=none; b=f9AfwxFP1rzfLKapLihzNdm/c6hjEdc6yL8veR/dPO8KZzXwTvKBdpFN6aQQIBUZ5wYk7ImyDNOEIIHSfVoANBG4BkF2+nhYMP0ZjusGG3U7k29V6pbDnh4WoZEe/TNaiMVgjPaU2Y4h5rXYnRjY7mdot/mm5vnR/wGFvbzXLc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904553; c=relaxed/simple;
	bh=MFhmUKjvDtTBlQ9Bn+GX9qD5W1UERPoEYpFB4l7lIEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKpLxGBtv0fF0KqUA6yKJFvp/0EpKcXT0St8p8RPLVJqm9fTcT5GhSzz6OUaIRsHtgMTrnZcmKKgc5DFIONXg1ntYnCP1PiYc8kz8LCehuvS0RXVorvifGqFi0W+5w0yevflKxE2PXOg91aJj/s7J0iared5BtqS8OCd+cINvwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lh5s59ea; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-43ff9d1e0bbso5199471cf.3;
        Thu, 20 Jun 2024 10:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718904551; x=1719509351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0iu5V6CVJ2htaSZURuMvsIrPmxFYUDGGtOzfJvtWgk=;
        b=lh5s59eaCJJIz53N1csZb+6Wqs3X2Jxp2X2PAl0RS8h5UzNKB0xU4fnNOC1ZCGpehK
         HdML4rIcU8OAQgS3ucByVHGaT+jTWKnekMSxD2+swAjd23TR+BlBdDrDdV5TAueJYKt/
         +JI6GDsBdlNLUZFytTN62K+dOj6ppR1s1Me7XRrlZucn8B93i0pQmZxh0SAHg7NUbo6H
         7W8Lz7nPGNCQrqGF2RI/C9HqTlFe//v5JVT7NgC9qP9AngOlaAjhIvdaMd8l5nbk+rQ9
         jgiUUH0GmlB0pAslRMscRL/ieALVXv605sbiLNQB9wykRLPSfaYPyjv10rOQ013QuLOf
         HrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718904551; x=1719509351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0iu5V6CVJ2htaSZURuMvsIrPmxFYUDGGtOzfJvtWgk=;
        b=n89rsQDiroWMnTpflwQ4AlugWJgsqIycJb3yunXhlzKDKdsVTWyjIE6oJi9XR2gBK3
         oNskcU3lGmStW3aWx6ZrRFPuZvAKhEXVz2ZF1kyjCZRcc5RoImr4FW20Vn7QrEdoezU4
         Fob1OSepMVTpxG1gjMR1wj7mAAsy55AVi2QSFC3x7uiJQR4wIdzMj74YQUlF4ClJI6CC
         4mRfycbyl+4HpaAWeif8W0KxqZUCANIfe+x156upHQmiRO5sIPoMFkjAr8yMgZLtU/nd
         9KUIrYWLpAjkQ7Z570LBMcbaRpio5sCVrg5eZt/qrI7Ej8zPxsE0VP2Rn2DC5a2oenjK
         qlVg==
X-Forwarded-Encrypted: i=1; AJvYcCVoUHcxvGoJ6wAU96c6Yb9SzMlHS+psuVJYL6AfuzLZYluafWZpOBHFHwuiQlMCSwluVBIObeHhC/8nWl6M7Mj0GW4bGLfRp3qK2zDbP5CbfvZnZUQY7mxzbLL12Y4P0eTZLMivVZ0AherE4w==
X-Gm-Message-State: AOJu0Yyf2ETsUmjA8XeBrQe+agNT9thhWHSzcSzS57Qcez99HRNIgzI/
	KckN3w1YbE0i0RscrcsUEKURj7FaHE+lg81bIwG+yB6jfgxhvwK4YOQ9H8wNfc5cI1hgt+FuEOl
	QSPps/BlSThmoHkyb+DL3RbT0+PY=
X-Google-Smtp-Source: AGHT+IHnU4Kfz0hQPXXVFIATrwZUVqfWopwRtu2bkf4SRPQCq8ZqbWpdRu8EZFIAv5Jal3eFR36wqu1MCkoHLXxZDIg=
X-Received: by 2002:ac8:5709:0:b0:441:575a:786d with SMTP id
 d75a77b69052e-444a79c2f7bmr65856181cf.26.1718904550945; Thu, 20 Jun 2024
 10:29:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528-a306a-v1-1-03a66dacd8c7@gmail.com> <76a124b6-8cc3-4060-866c-03f47da450cc@linaro.org>
In-Reply-To: <76a124b6-8cc3-4060-866c-03f47da450cc@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Jun 2024 10:28:57 -0700
Message-ID: <CAF6AEGuHSG0t6CH=+JGzZqiZa_JsOgPkcgO_UhCbO3vAgFZK_g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add A306A support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 3:41=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 28.05.2024 9:43 PM, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> > From: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> >
> > Add support for Adreno 306A GPU what is found in MSM8917 SoC.
> > This GPU marketing name is Adreno 308.
> >
> > Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> > [use internal name of the GPU, reword the commit message]
> > Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> > ---
>
> [...]
>
>
> >
> > +static inline bool adreno_is_a306a(const struct adreno_gpu *gpu)
> > +{
> > +     /* a306a marketing name is a308 */
> > +     return adreno_is_revn(gpu, 308);
> > +}
>
> The .c changes look good. Rob, do we still want .rev nowadays?

mostly I just want to avoid revn for newer GPUs, but I suppose we
should be consistent and drop it for "new old" GPUs..

Also, it would be nice to rebase on
https://patchwork.freedesktop.org/series/127393/

BR,
-R

