Return-Path: <linux-arm-msm+bounces-25868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F0F92D6EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 18:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 893001F210C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 16:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B818194AF7;
	Wed, 10 Jul 2024 16:53:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E6A1922DC;
	Wed, 10 Jul 2024 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720630426; cv=none; b=qAQGcvZ693tk7qH+hurAyvmGMOXPuQlckfVE0joLe4MvFxzkoH5YNI7Rw1CpB1rnCHDVn9sy7Gb527gqF6JS7PBaspgF39oBA0igRqEWxY8f1KXSP+TfAq5W3C3pZSHWzo+nzBHC0eZLKydTobp9aowR4XzRh/XYWuDI/NzeVr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720630426; c=relaxed/simple;
	bh=yXIFSh5lnPGvTePfPUmjGwXfH2aiY6Jdg/YeOXwdkyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agH0cd/ytoDrqTJyYcNxmkOlP7yXDU1aU+geEfoPDEsxKhzx/EPRLgU0aN6j5VhwNm8s0gZ/cVvm3hWcEWfc9k6KX37IM33heYtcB/Z3Kax+b2smEcL9Wrk/XzehphEcWMUIKtVYtMi/Tk03bSFDESLcaSlCTlIi0jHoGNxKt5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ea33671ffso6155797e87.3;
        Wed, 10 Jul 2024 09:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720630420; x=1721235220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpiULvgBKLSjZABIaTgqmq90IKC/N4ETs7/rDViqHSU=;
        b=hnT5G505zJRGLqlSaikM2G7gnipeAHFCHsZWNncHklDC1EN/AUFUMy0xr1x+37wJu7
         4X1WKLJI6i3cCXULY2I4qz2UVRnxUgll6c99Cr28JgqTLQ1A4RU/TpgCHqO/5I+YRZuP
         eJsUnO04gNCuD9CJvMF05R6j0l+n3vzR5XzYxKS6qvocoFb5RSq+2GFVzbA1jqy28khq
         zGMJzbXMmySfGhLjw0mv++mPGBEsjj7cRRscM5L5EhlLJzmwMdQR4pS3cqencH2PmLO3
         bBhS7IXsnyNnVrL4hFaoXWLUmEMYVXjLmRK/ogCixlw8/iSnuT3sjA/5L6o51A/gowt+
         BCAg==
X-Forwarded-Encrypted: i=1; AJvYcCWl5Ou0I+/er4C/N323DhZnOdrVe+3junbAp+r2LCuiZxLJO/e+TzaUsWwlqA3TL8rTCrdOMg84upNV0sgCZPnWCpyKBWQccXYRDYJEgxl9aOewaW/jKY453N5D38BTFLVJ0I0AE6SE2XBMT96EHVFgSXamOZbdRg3+wbHUoARJY2L72Ju/6g==
X-Gm-Message-State: AOJu0YwmS0BPa7x9wqkB++PXJPibXwBS9H7V3ylDVM384zoASta8rhz8
	eFx7yDqyuaJFupn8l8C3Y0kNcOO6mKR/t89ke6VHqx/JmDBtAPnQ9+d1/GAcNAQ=
X-Google-Smtp-Source: AGHT+IGctMZyIpt80a6oFsVDy+CJ5enmWlm166NBsI5hSCDrroyjZQS+lKWSJ9VKHLHnpFV8mgZjUA==
X-Received: by 2002:a05:6512:5d6:b0:52e:941d:7039 with SMTP id 2adb3069b0e04-52eb99d6c88mr3157402e87.59.1720630419854;
        Wed, 10 Jul 2024 09:53:39 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb8e4913csm663255e87.86.2024.07.10.09.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 09:53:39 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so32466971fa.0;
        Wed, 10 Jul 2024 09:53:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQx242p/8frZCBsiVaf+etTfLkZhje35FfQ5PcPSZetFOz0PZ2Ik5z3Pw6a3YTD69+5kpjnw5bNpVOoqcC8PeiUFnhPl/WTeE2NMv/qSl2E51PmDXBpf8oZtXIhsuFCNNLTzTghsZ0uzDRx9e3M2CjJxaL4Dmmzqm+dDQdqDFf5ng+YUhshg==
X-Received: by 2002:a2e:9016:0:b0:2ee:7a3e:4721 with SMTP id
 38308e7fff4ca-2eeb318a3b2mr39735341fa.39.1720630418140; Wed, 10 Jul 2024
 09:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com> <20240703121750.0dc2eb3a@donnerap.manchester.arm.com>
In-Reply-To: <20240703121750.0dc2eb3a@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 11 Jul 2024 00:53:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66ox-vu2T=CnBkV70k5E=aVBGm6Sg4pcK5kYB+t9uSvxA@mail.gmail.com>
Message-ID: <CAGb2v66ox-vu2T=CnBkV70k5E=aVBGm6Sg4pcK5kYB+t9uSvxA@mail.gmail.com>
Subject: Re: [PATCH 09/10] clk: sunxi-ng r40: Constify struct regmap_config
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 7:19=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Wed, 03 Jul 2024 11:50:22 +0200
> Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:
>
> > `sun8i_r40_ccu_regmap_config` is not modified and can be declared as
> > const to move its data to a read-only section.
> >
> > Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> Looks alright, we indeed don't change it, and the only user takes a const
> pointer. Also the compiler seems happy.
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

Stephen, can you merge this one directly? It doesn't look like we'll
have any more stuff to send for this cycle.

ChenYu


> Cheers,
> Andre
>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-n=
g/ccu-sun8i-r40.c
> > index 984ad3f76b18..2f51ceab8016 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
> > @@ -1292,7 +1292,7 @@ static bool sun8i_r40_ccu_regmap_accessible_reg(s=
truct device *dev,
> >       return false;
> >  }
> >
> > -static struct regmap_config sun8i_r40_ccu_regmap_config =3D {
> > +static const struct regmap_config sun8i_r40_ccu_regmap_config =3D {
> >       .reg_bits       =3D 32,
> >       .val_bits       =3D 32,
> >       .reg_stride     =3D 4,
> >
>

