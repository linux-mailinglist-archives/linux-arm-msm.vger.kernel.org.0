Return-Path: <linux-arm-msm+bounces-67727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF078B1AD32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 06:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 915EA18A2765
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 04:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D081A5B84;
	Tue,  5 Aug 2025 04:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYVKYGck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D9554673;
	Tue,  5 Aug 2025 04:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754369143; cv=none; b=oJoA7SybV6cQOq6oZJy8OFKNW12s2ORCDFt5da7OFLvrfJIkILiiiwMRAQoF5IQvj9eWiigBvlC5WuvUzsgbRcg8VM+EXOVzh2g7HObx8DK7sUJJ4K0vl3hnEjw3eOZHgRZ76VVh4t9bStAfoKSAaHlDNLie5xJlmYshAW8UIfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754369143; c=relaxed/simple;
	bh=TAonnqb31CUIOHVN4ZjZ+xKkH5pGUDTZpo++WiRgmIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfbbErF6n+RcXVPj0eq++ryz0QCwArORWCYh4PkPhr1kQJRz1TAbdz2v7/k9qHUZJ8KsSItkKmbJI92CvHWauTwFqU+dai6qBrSGTzwgH/tLpdABBGgNXyibWWBO8frXAITWfjN3RNaV9hk0SsQBmmZaB1y/7zsrFCXZKZ4+4gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYVKYGck; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-458ba079338so19125065e9.1;
        Mon, 04 Aug 2025 21:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754369139; x=1754973939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CLE/nZl0bygFLZDV8sLED9fJokVkH4Ghe8Y768YWTE=;
        b=CYVKYGckike62RemAYPw6eEdJQ0NhtmUPDiIhFbXe2JILcIXz0Fvlp9AIGvKqxuOzD
         w14yQFNLUjHHhtiea9JzzZ0CoCFJ4xYmvCoPyiEfS+RPscXsqTlQ5AaJ2/bKTYNrq2K+
         sme4y8D4je0d62pa22zetkrM6+7HLIBbd7goq8kHPHw0LRXrT30juFnmNaViuFayGWCz
         5Zas54VyZO1BNM36ktFkQmjbD7Jfvpl1RjquxwoUeC2cTZt/5cYjBnt05WjAkvtmrLWE
         jDWn/x/bb40o+nIZ75rAxiV55mfxXKo6ZDkoMN4CkyZnV4qUzBRWrSjf6R5boL41k0GO
         469g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754369139; x=1754973939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CLE/nZl0bygFLZDV8sLED9fJokVkH4Ghe8Y768YWTE=;
        b=luS8L0fxLuri43eoDomBxP2qV4Rwo7ImiH16CQLdazHQk16S4lUrKWeZgHTvMQWpYH
         vO7qaO1cgV4BiQEmc+cqUngFrwi7h6IzuMDFoLTJ7vNoKGidvkTFa4vlK0hLVo22AbA0
         vUGl2j/2ygxn3XTAeTpbt+kND3c6JDETnee6POm+RRwTPkJarHW8AYmbUB1T7qFwA0FG
         aTgnvSQyD/SFEeWdoblWzro6ewheV0qrZP7wUVj5JchOll6MFQpjedYa4Vzb+fRus9wv
         ONHbUO1k2KnA3ao9+mfZrNUAmoOzgn+KU2t1Wkw0x/RKCeoSNKAS9xw+zfE3rOyru60v
         ndSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwaSPQkC9rhavDgRCRz9exdCKQIjrIfTEOVb8HahH5m0VzeEqyurpbr9D6OxTUsTK60Pd1Om58nvx4dGFcEu8=@vger.kernel.org, AJvYcCWZPvFWhly7HM+51q9fTycLK+32jctDe93L68ymOqs9T6zyrw47Rr46iBF3lGJRIzYCSoUyiukOO5UHAOBeJg==@vger.kernel.org, AJvYcCWZSHeXe5EbekUvdygiTFYlARPaaeCGoIuZSnMxNopq2uFz2X+JGWGwdfwSGrzICmWQgQzcUl5KCRwg7qWk@vger.kernel.org, AJvYcCXSo8h8Abo6mOp5+5LxFTvZrVYLgRl23jujVfyXtT89talU5B+YnJHcHFnPZ9up8AsH2c/ehS0T0IIU0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YySHNnbeYRsS8Z2INi5dJr8GXnniyXEhd3KXXPHz3YP1A+9XCND
	Lq8PX+g1hILKWOQgwLTa1WMk8a2STJTk/H4tzO+8702fl2KliEiWxXUqVQe8wdw79a3m11v4LE4
	aJ+RUHmCRHpn+AQdA2PAbXHdQ4ENgk4g=
X-Gm-Gg: ASbGncvFbr3Ui3x7izA7ttS0tIKn6f36y7LS2afOkQkd3Ui12WTkkNHRXz1pJfFhZPu
	JvoTXAPIlAPzsd0S/RW+wEeq6y5sXGUYCfH0pLR/u70qh7tmCt04T8Xd86llT6u8z78+fTqeQdS
	trlctafmARBze4C14g8fbmgZsEW2ovQpTq6tF9nL0q9PkyUyUoM5PRcbS/7KzGH2sHU+xi8dlHb
	DRxfBGZBI8iFR0VQm4PlunQmxO83qd4EQmmCIsp
X-Google-Smtp-Source: AGHT+IGc6QQ7QtZXv3oXa+s4bGCwd6H8bMMTvoIEqqGcgN+XlG495okJHTRmO9XIJ3QiavGEPE3orL1g2fonQFyeilw=
X-Received: by 2002:a05:600c:190d:b0:439:4b23:9e8e with SMTP id
 5b1f17b1804b1-459e0c84849mr15581045e9.3.1754369139091; Mon, 04 Aug 2025
 21:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-topic-ufs_compile_check-v1-1-5ba9e99dbd52@oss.qualcomm.com>
 <d7093377-a34e-4488-97c6-3d2ffcd13620@suswa.mountain>
In-Reply-To: <d7093377-a34e-4488-97c6-3d2ffcd13620@suswa.mountain>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 5 Aug 2025 06:45:27 +0200
X-Gm-Features: Ac12FXwGrucebm8_mWlgbEw-x_Dxh5fokdtlFvEDHDGn0BX-d4wP9-A2Gqsfb7Y
Message-ID: <CAKXUXMzgABnN3bbV58xVwYNithcUg7fZgW0DxGCngJnNgNzrfw@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: qcom: Drop dead compile guard
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, kernel-janitors@vger.kernel.org, 
	Julia Lawall <julia.lawall@lip6.fr>, Manivannan Sadhasivam <mani@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 5:33=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> This patch removes some dead ifdeffed code because the KConfig has a
> select which ensures that CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND is set.
> Konrad was wondering if there are any tools to detect this sort of
> thing.  I don't think so.  I think the only thing we detect are
> non-existant configs.  But let me add a few more people to the CC who
> might know.
>

I also have a simple script to search for unused configs, but that is
just five lines of bash and then a lot of manual filtering.

If I would attempt to implement such already rather complex analysis,
I would start with looking at this tool:

https://github.com/paulgazz/kmax

Possibly, there is a good way to re-use some parts of it or extend it
to look for the pattern above.

Lukas

> regards,
> dan carpenter
>
> On Thu, Jul 24, 2025 at 02:23:52PM +0200, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > SCSI_UFSHCD already selects DEVFREQ_GOV_SIMPLE_ONDEMAND, drop the
> > check.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> > Is this something that could be discovered by our existing static
> > checkers?
> > ---
> >  drivers/ufs/host/ufs-qcom.c | 8 --------
> >  1 file changed, 8 deletions(-)
> >
> > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > index 4bbe4de1679b908c85e6a3d4035fc9dcafcc0d1a..76fc70503a62eb2e747b2d4=
cd18cc05b6f5526c7 100644
> > --- a/drivers/ufs/host/ufs-qcom.c
> > +++ b/drivers/ufs/host/ufs-qcom.c
> > @@ -1898,7 +1898,6 @@ static int ufs_qcom_device_reset(struct ufs_hba *=
hba)
> >       return 0;
> >  }
> >
> > -#if IS_ENABLED(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)
> >  static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
> >                                       struct devfreq_dev_profile *p,
> >                                       struct devfreq_simple_ondemand_da=
ta *d)
> > @@ -1910,13 +1909,6 @@ static void ufs_qcom_config_scaling_param(struct=
 ufs_hba *hba,
> >
> >       hba->clk_scaling.suspend_on_no_request =3D true;
> >  }
> > -#else
> > -static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
> > -             struct devfreq_dev_profile *p,
> > -             struct devfreq_simple_ondemand_data *data)
> > -{
> > -}
> > -#endif
> >
> >  /* Resources */
> >  static const struct ufshcd_res_info ufs_res_info[RES_MAX] =3D {
> >
> > ---
> > base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
> > change-id: 20250724-topic-ufs_compile_check-3378996f4221
> >
> > Best regards,
> > --
> > Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

