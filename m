Return-Path: <linux-arm-msm+bounces-84885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB50CB22E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 08:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F7D3306B51E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 07:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DA82F7442;
	Wed, 10 Dec 2025 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bpUOAx9z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E7E244694
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 07:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765351400; cv=none; b=q4UnMXFz8sZ5xtJSnu4iP0sS17PdXb1pI4pfIn43+VwkNklUjRLlhW4zvdrjD468l9x9g+eShbqM+JnGeAAKpAL6JF8Z9MeyxPxstpXe02gG+1DzcUyg+e0ZjnntrK/eGlqN0aAMs7kxOZNCwZjmfhOovcSgRwkx2TT+mg4VrRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765351400; c=relaxed/simple;
	bh=bVoNKoANIG7q10JDhOmNKhsvQTLBx4R95XOF/EenAe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oz89lnPjkUgOLRVGF9JqjIg6NuBNgLSEzwODW1V/IJtBq4QQCoDS6aK22O0lKUfy5Tx4w2uhSfHX5Wh4AuNmm3MbBz2AKjrfBScDRwEpczuUzZs8fzpGiywX8Sx3c6prYilde1fQppxakHx7oiHkQq/MAVIUlWeajYxjcaup1TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bpUOAx9z; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37b8aa5adf9so42082041fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765351397; x=1765956197; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E6rTqaNhoHV8bDh9ZGSpURt9oVyaThNhpt0aYUd4hF4=;
        b=bpUOAx9zGaRZ2v2SgGWH72nal9vHd7y+2zI9FjLfwKjgsNedMQby7jB3LynWuRRn+N
         Rwv+3BXcM36N6qqKLa/gIkaMD9AsoeEiVF2uLzeZ9TtGmb667FBJNOk8kirZpawlHPaw
         tSje2iztoVEAlN/Q7vDpZTfwOGLLyhcUDifLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765351397; x=1765956197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6rTqaNhoHV8bDh9ZGSpURt9oVyaThNhpt0aYUd4hF4=;
        b=FHE1SmH9mo+VfjRicQAxTHrptwv56D2zR+wdAUPOnK4RBZHKFxpwF8v6/DKQLt3a1b
         Y6grbwGi+d5haEq6j7FA/BhlO1TqO6upqmK7UqnOv+g58jIlRyZgQgKQe2pIgAJLJS9t
         DG+QJ2G55Jrx1UhMsUoqcOcMXWsOT39i7EstnsrxGSxaphigcjHQ79++bb7aLbfVIp8H
         mvcSEAFynDI6vWBcZRevechKZGWGwMfVEBVGMreRr11ir2tCm41+5b9dxpRVExjLr89w
         zhU8+bxUXy+AfWiy4np+e1P12CcLkQWusbEDIttf1m7dX7knarhlSm3SQS2O4dIsN2eG
         PiQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6jtVK/wz3tY7x0DcPn5/ahIoX9bZ6T4f/KVBMRx4EpERkVH7Q3sisSVTGxiOkyUBgWdKgdFYnQeMD9/c4@vger.kernel.org
X-Gm-Message-State: AOJu0YwawVOQiZJCAwmQWC3x+XRR/sstKCqxAJHdTzzzZrJmOWYQYnmy
	jqBLegUy5P4+4hWfynjjOn+T0vqyS+CXFsQ3B3HjvleR5aU2QY4dApwRQIcjQaEbyP0OUO5GBTz
	LPKZTMw==
X-Gm-Gg: AY/fxX680FMEYvzAjWHogIizzKfh+0+IorgK3qekFb+XxM/r2dN5hviEN55LagEjCLy
	Ye2M3LMa2mvb8zHIsDCzOjFsgBsNpm7v6X+s9fcLbg4NCbvmZIrJyR9T5wJU4ATfO3hQmAjM8re
	mUuwCXOdeQSDGvhYvBPVzBekflu9KGglo3y+z+1rxLJ9DT3IZpmeuJYaA6hv7DlmJLpN0zYZ5wp
	gL7FfPEEBzt7F627phSdMu7p3rjlWledoA9hsIbjawg3KjqKwr4MJdOOAegyTY0GnpvcEliDEB2
	bRNsnJCeGeKqAjr8r37hSWrUZ9RrM5VjRBO13BTcNSHE+0apnkByiwkdMLi5y8RBtbyMv6am0MW
	miJpMigPjTvnRLJFDyUPyFq2pElOhuBmmKTMsrjjAWNKaH9cH/osmZ+2hYRo4F6jPAjVTW4jxqv
	zRqWa8MB24QwlIVw2wMYlErG7LqSlDvNe6ggjfGVWyI5Fvh4sT
X-Google-Smtp-Source: AGHT+IE283HkiNoKnlwdLhIwXL+FNJ3/H9UtkbP5/J5AxIRPifIzQ9MQECYIapD0xPZLLyOh03xOdw==
X-Received: by 2002:a05:651c:b12:b0:37c:dc91:6287 with SMTP id 38308e7fff4ca-37fb217f3d7mr4575381fa.36.1765351396632;
        Tue, 09 Dec 2025 23:23:16 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70674a60sm56064371fa.49.2025.12.09.23.23.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 23:23:15 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5959105629bso6498235e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:23:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9p/GWmSvH+TJ+0jgkC2fsTtWRDa5WSqFYQgTv82kD75TxVIE7BBxz4cdVOh30KkZFNgYrr33Rt4wvfihK@vger.kernel.org
X-Received: by 2002:a05:6512:3989:b0:594:2d53:545 with SMTP id
 2adb3069b0e04-598ee54ca73mr515132e87.46.1765351394713; Tue, 09 Dec 2025
 23:23:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
 <20251203-warnings-6-19-v1-3-25308e136bca@chromium.org> <7mqgcndlrffm2wczev4s5osza7eg44zonqykfmbxq4z62u2rzf@3ugznlbhqwiu>
In-Reply-To: <7mqgcndlrffm2wczev4s5osza7eg44zonqykfmbxq4z62u2rzf@3ugznlbhqwiu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Dec 2025 16:23:01 +0900
X-Gmail-Original-Message-ID: <CANiDSCvCGX6KaTcVRFvWb=Z8YQNi-Tj5MVp66UjCyH8ZZF5Nmw@mail.gmail.com>
X-Gm-Features: AQt7F2rC3cSdhIoRJTP60japduwuLBoINlP04hCF9LCAJftVAxsEZzrsdCpa0Ko
Message-ID: <CANiDSCvCGX6KaTcVRFvWb=Z8YQNi-Tj5MVp66UjCyH8ZZF5Nmw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: iris: Fix fps calculation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Keke Li <keke.li@amlogic.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Dec 2025 at 13:06, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Dec 03, 2025 at 08:55:36AM +0000, Ricardo Ribalda wrote:
> > iris_venc_s_param() uses do_div to divide two 64 bits operators, this is
> > wrong. Luckily for us, both of the operators fit in 32 bits, so we can use
> > a normal division.
> >
> > Now that we are at it, mark the fps smaller than 1 as invalid, the code
> > does not seem to handle them properly.
> >
> > The following cocci warning is fixed with this patch:
> > ./platform/qcom/iris/iris_venc.c:378:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead
> >
> > Fixes: 4ff586ff28e3 ("media: iris: Add support for G/S_PARM for encoder video device")
> > Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/qcom/iris/iris_venc.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> > index 5830eba93c68b27fa9db87bac63a691eaca338d2..730f2aa1a83b2f4f90227ab9a7e04aee7c2c3cfe 100644
> > --- a/drivers/media/platform/qcom/iris/iris_venc.c
> > +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> > @@ -408,11 +408,10 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
> >       us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
> >       do_div(us_per_frame, timeperframe->denominator);
> >
> > -     if (!us_per_frame)
> > +     if (!us_per_frame || us_per_frame > USEC_PER_SEC)
> >               return -EINVAL;
> >
> > -     fps = (u64)USEC_PER_SEC;
> > -     do_div(fps, us_per_frame);
> > +     fps = USEC_PER_SEC / (u32)us_per_frame;
>
> Can we replace this with:
>
> fps = timeperframe->denominator / timeperframe->numerator ?

Yep, I believe you are correct

I will send a new version soon.

>
> >       if (fps > max_rate) {
> >               ret = -ENOMEM;
> >               goto reset_rate;
> >
> > --
> > 2.52.0.158.g65b55ccf14-goog
> >
>
> --
> With best wishes
> Dmitry



-- 
Ricardo Ribalda

