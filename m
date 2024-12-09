Return-Path: <linux-arm-msm+bounces-41158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1899EA0A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 21:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C606164BFD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 20:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4D519C54A;
	Mon,  9 Dec 2024 20:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="T1lxVTIi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F4B19ABAC
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 20:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733777684; cv=none; b=ORqF6wTFBLrX55UjcHWKR+U1CH9ZatYMofBxe6ghAODYWuBye5d1DciZ6/NZkWfSeMygMVqrbkYKroYtYYKONOfa+/Z+gXQNoWZsDcCFNrudy87bOYQmmf8eEiS+iav/d5Oefrr8NcZ8KRHI2cmLCIdKW1TY80oZ+4OLCHKzBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733777684; c=relaxed/simple;
	bh=5KfXBcVbCvfr+zrx2MV66aEVn1+Z1mtFmhLoEyn9t3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q1oL5k/IXGRxMpDA83lwbJvnNldLFSQ8Wji0IpzDhwb3Pu4IY/yWsR6VilnMS5xgjCkyLwqC4u4BKnNqIgo+6gN9HCGjTVN3Pmdvx28iLyjkEH93E1sYSQkBhHsC7qBIR50teCuEgFFw2buLY4J6k04FG3sRbh7JjmD0DE+9Kx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=T1lxVTIi; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so1200441e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 12:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733777681; x=1734382481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9Vfs2kNt+4OobuLk6Y8aaQXjBCfT1i0vXOy9GUUiJ8=;
        b=T1lxVTIiEGHDd5gbjBsl/DQpohaTM5UDFmBuQAOBf1nYi8VTyxPsxPnTlv6M43HwRO
         5EwLHd7F+9GyU1RbmnSM9sLlh7H0s/txzcpqQ35IVfdSZ0FfMh1iFDK/dXVwtMC24o0d
         LKz3BatPSQ/vJQLf2YM+qjEOD+tI+SIbUoaxOWgOFveOKe5Cq3HeDAyRa+Xtv8GC2yQL
         PBlgECVrYxMX02K42Sv005YTEM3pIRzQo0dpBmEOwIUx9xR0QWXz0DW0bYPiBFcMG7r1
         xp/5HEw5xy3Vh1I60qGq0B7uQ/Z3X9E6Pay3gCjbpXf1i9O8u3Kk1NEfXeqAUts7zxep
         X45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733777681; x=1734382481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9Vfs2kNt+4OobuLk6Y8aaQXjBCfT1i0vXOy9GUUiJ8=;
        b=LIarII4lDBOQsNA4vgtYCac7Lu4MRzv1KAKPARBojTYwPoxSiM5xUaxo5C4DJWahxz
         Kad5qqgCJYbUHRSoPFk+9M/D8l+iKHmBn0rilDEl8zo4ErzEl570vPyOV6991wWlbiuF
         Ku/OQu4p35E0S7W5O8PYw1lPfqpwS17R+G8L1AR77WX2SheYGeYtbk/yksFDpb0A0a1B
         DXArwJli07Fj7e0BBP21BoKxyKZ6ROlW0TYioJ+5oOgjGqaq5Bykrg8vBlMgUsLv3GkX
         C3yzwsDNDA+gU0MhwAb7lNVWRC4WZIBjwwQqWeMVKxumL1QAHlIMGkO67PAPGYxAYclr
         q1aA==
X-Forwarded-Encrypted: i=1; AJvYcCWZAe+tMGAnRv7CMmqjs1UUku1wZDgb3GsXies6PJXikoPwRt13wSAtDxx2W92FJBME497/XP9bWs4X+qoe@vger.kernel.org
X-Gm-Message-State: AOJu0YxkR/J8KRHP89UnWd4vgAnmRMbsd01JyrmXGZxZGrdEGfnCgOXK
	g8TsDWo0NkA7xfvlUBY3bZlxvXtg8xNtdtNsCZpni43n5b5CsgnoV48OIg+hJ+4LaTsRT+XcXgo
	zUSRzDoM9TE6hnNiB2FQZab/LWsDZCkHePw/STw==
X-Gm-Gg: ASbGncv9yLF8q4VWfjDIkn2DSLNHh6uQoRlNnWKTHwMbnxIUa5G0Bxs6nlH1I6NAGLF
	Ig3l0vhBgXJ3Qq81VqrhT0Tq/o27KcwCEXOJTVn9TDD42uMUSoQchLmcDHD5/51Y=
X-Google-Smtp-Source: AGHT+IHhJNAanpwKh12pYprytEHbQW5ap5zMyZnkI1wPUFNQzwQaF/kkIIwmpFjtqd5lM1j3pLC/ZYN/wl08sYxohj4=
X-Received: by 2002:a05:6512:114c:b0:53e:3c47:4215 with SMTP id
 2adb3069b0e04-540251d01e0mr300875e87.2.1733777680622; Mon, 09 Dec 2024
 12:54:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209045530.507833-1-ebiggers@kernel.org> <CAMRc=MfLzuNjRqURpVwLzVTsdr8OmtK+NQZ6XU4hUsawKWTcqQ@mail.gmail.com>
 <20241209201516.GA1742@sol.localdomain> <CAMRc=Me7kEBHW1BTDkJ6w+3GjucCfC+GNZBch3kX=gsZniFHvA@mail.gmail.com>
In-Reply-To: <CAMRc=Me7kEBHW1BTDkJ6w+3GjucCfC+GNZBch3kX=gsZniFHvA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Dec 2024 21:54:29 +0100
Message-ID: <CAMRc=MeFHpB5ckWLToSF8woEpKmGU92K+qFY14HjB8NN_TrBPA@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Support for hardware-wrapped inline encryption keys
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Gaurav Kashyap <quic_gaurkash@quicinc.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Jens Axboe <axboe@kernel.dk>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 9:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Mon, 9 Dec 2024 21:15:16 +0100, Eric Biggers <ebiggers@kernel.org> sai=
d:
> > On Mon, Dec 09, 2024 at 04:00:18PM +0100, Bartosz Golaszewski wrote:
> >>
> >> I haven't gotten to the bottom of this yet but the
> >> FS_IOC_ADD_ENCRYPTION_KEY ioctl doesn't work due to the SCM call
> >> returning EINVAL. Just FYI. I'm still figuring out what's wrong.
> >>
> >> Bart
> >>
> >
> > Can you try the following?
> >
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/q=
com_scm.c
> > index 180220d663f8b..36f3ddcb90207 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -1330,11 +1330,11 @@ int qcom_scm_derive_sw_secret(const u8 *eph_key=
, size_t eph_key_size,
> >                                                                 sw_secr=
et_size,
> >                                                                 GFP_KER=
NEL);
> >       if (!sw_secret_buf)
> >               return -ENOMEM;
> >
> > -     memcpy(eph_key_buf, eph_key_buf, eph_key_size);
> > +     memcpy(eph_key_buf, eph_key, eph_key_size);
> >       desc.args[0] =3D qcom_tzmem_to_phys(eph_key_buf);
> >       desc.args[1] =3D eph_key_size;
> >       desc.args[2] =3D qcom_tzmem_to_phys(sw_secret_buf);
> >       desc.args[3] =3D sw_secret_size;
> >
> >
>
> That's better, thanks. Now it's fscryptctl set_policy that fails like thi=
s:
>
> ioctl(3, FS_IOC_SET_ENCRYPTION_POLICY, 0xffffcaf8bb20) =3D -1 EINVAL (Inv=
alid argument)
>
> Bartosz

FYI: It fails the: `if (!fscrypt_supported_policy(policy, inode))`
check in set_encryption_policy() in fs/crypto/policy.c.

Bartosz

