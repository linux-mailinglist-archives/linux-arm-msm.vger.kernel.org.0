Return-Path: <linux-arm-msm+bounces-48794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E44BDA3EB8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 04:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8FB919C3B19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 03:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CAC1FA14E;
	Fri, 21 Feb 2025 03:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jv0O6I6w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF211F8690
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 03:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740110148; cv=none; b=LaKnMTh3gH7CNbWKbXxi/eHq8uldk6q2w/2acOi3A/8Vn93dm2XkZTnDaKFkiABUpFY9cyhd2WeKqziqo+4mkJTBx57oduIO/p2slhog/COemHTeKWXOwB9YCkohnvICDQWBWqpDCimGMiNqAVZt8w0L69ngG5xvTDS2QrmvI1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740110148; c=relaxed/simple;
	bh=iG5MA668VIkZx6yw4F2E1Ql8r5D0wiJ2sdzgkM+jrnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uO1FVXfuF++gQGzcI88ggC0OQlWyQaKTdKR91ZfpByE2u4yghgQDKVgknZoF1+M0C4sGObTy2bnBETkxrpjZyJQ6VGQz7WLjB92LWqVFEb73T0oFFZtg2ZaUFUQdU0EvvJ7o9yPBfLRx+B49JU++ypgTm6JzsZZNQsebJ4XHYC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jv0O6I6w; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso2339364a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 19:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740110144; x=1740714944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw0vw5qDfG2Y5RQUA0J555gJarSraMWbJS4+ci/UW8k=;
        b=jv0O6I6wv0+jO8HD56/QFcWOgD7HIMCWdR8DpFM4W7HM6DgeEKIi8p1ZsjNJTAUQyH
         wCHe7TwoimRY0GRk6weHX4nwolsEdi4ghSqx7VKGLQg6TIbDu8l7zgxMnbqTpkYAPxmd
         D83FKZZFvu7DwbQLbM5cNvgK/TBczCu2/Kl+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740110144; x=1740714944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fw0vw5qDfG2Y5RQUA0J555gJarSraMWbJS4+ci/UW8k=;
        b=Gv3akF1IEViG0e6znI0tKY2/+BhJJdPbWHMUjGWRTv3CsQqdWLlJWN7HG0IL2GCDIM
         y6nHTc++8swamBfr7wvhh9CKk/uh+EbTu974CNDTgDonaUwoHbkfLUs2gLA+iwkWf949
         qeYZxsPqyVR6jGnc++yJOHZFvS19q1lW7Zj4TMiQLI6rOgwv9D4rIw+jPVxMpKmv7gBi
         tXHP4tcgnauQWz+00pr1dsHU1kwx1c717pAjfMmIVvQ0IPmVneBa5cJkVj1vEPbIenQY
         UDNI01SOhWOFK0fyFniwdQU6wDPkxS61GrWjxV+qDA+TPNa052D6YeODy3fdI1Va52sy
         jUMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvIZowN5gY3j5bDgWqupU0K2y8Ps3KGJIPfjT/i0NUIlJDhd39J2d4u5tcCH/uqZUL0LIKODU9GQCMglan@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0xLd/F5OtN5eaqqQ+LTCCldhaBAiIt0OuJmxCeDu+ggUV9esb
	caZW5zjpIjEDOEqrbdJ76tuUOZ9Fn5Hx3jOymI2nSZ7lcXnYhnUhFCKsrgnlKPwsZWlKG8B7cfM
	=
X-Gm-Gg: ASbGncsTRMW6HV3unzUA7/xbYu59L2QNEgbdstrZf4NZZzUzS0dhonSxR1Egjdl6jCf
	T95pJTzLEoBJQhxA1AdSlsvo1zcQr9G07tGr6yYYgbbpvyZ+trP7hD12N4cHhnsjy5WPSWjOoh5
	fXIbF7EffaUbLr9VRiwyvEivUll75LiQ1BBOeIsCLsTShZYNNHSv5jKKf5HBUIgzZKuBhQCNg7v
	YCtnlP6gH8GdCsH37WiXKParVs312p6tRBy/dYiFHP3pAuMz5PuxeZkAiY2hx2TyEQFZj2RFYHx
	iUPhQXUtMHwCFI7wfI8juKtv5pO7jlsx2cDw4PmgQBUlmcT0flrc6B0djcjNMw==
X-Google-Smtp-Source: AGHT+IFHsm6vo+9AElj5zVqBefqt4z2edZZae8XnAWkNhbRMAZwt7HW3MPRkVzsnvu4jwnr3+bTtxQ==
X-Received: by 2002:a05:6402:278e:b0:5dc:7fbe:7313 with SMTP id 4fb4d7f45d1cf-5e0b70bf405mr1234434a12.6.1740110144031;
        Thu, 20 Feb 2025 19:55:44 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece2709ffsm12927001a12.60.2025.02.20.19.55.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 19:55:41 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so5521a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 19:55:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiAvx3VT6SNTwe9C8Irf/Z/aRZXRCa3GkM4uFsObGzgzINWYtycez8RE0mDrZmOs4UdOYsUNwhqtEdtXQW@vger.kernel.org
X-Received: by 2002:aa7:d5cb:0:b0:5e0:815d:4e0a with SMTP id
 4fb4d7f45d1cf-5e0b871d417mr35634a12.5.1740110140496; Thu, 20 Feb 2025
 19:55:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
 <20250207-venus_oob_2-v4-4-522da0b68b22@quicinc.com> <e794c047-ab0e-4589-a1d2-0f73b813eacc@xs4all.nl>
 <b1721d46-ffbf-e21c-ce18-e96e3e8ee35f@quicinc.com>
In-Reply-To: <b1721d46-ffbf-e21c-ce18-e96e3e8ee35f@quicinc.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 21 Feb 2025 12:55:23 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ABR8BwG_9JVPzzp+HZv6O=B9r-ipjKQHku7DdTGASetQ@mail.gmail.com>
X-Gm-Features: AWEUYZmeIjhMEJHyZ3B3-kUW6g12qVNZHewpqyjHWwiKCgJTNAXvvTwbb0Hd1Ik
Message-ID: <CAAFQd5ABR8BwG_9JVPzzp+HZv6O=B9r-ipjKQHku7DdTGASetQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] media: venus: hfi: add a check to handle OOB in
 sfr region
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hans.verkuil@cisco.com>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 12:56=E2=80=AFAM Vikash Garodia
<quic_vgarodia@quicinc.com> wrote:
>
>
> On 2/20/2025 8:53 PM, Hans Verkuil wrote:
> > On 2/7/25 09:24, Vikash Garodia wrote:
> >> sfr->buf_size is in shared memory and can be modified by malicious use=
r.
> >> OOB write is possible when the size is made higher than actual sfr dat=
a
> >> buffer. Cap the size to allocated size for such cases.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> >> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >> ---
> >>  drivers/media/platform/qcom/venus/hfi_venus.c | 9 +++++++--
> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/m=
edia/platform/qcom/venus/hfi_venus.c
> >> index 6b615270c5dae470c6fad408c9b5bc037883e56e..c3113420d266e61fcab446=
88580288d7408b50f4 100644
> >> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> >> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> >> @@ -1041,18 +1041,23 @@ static void venus_sfr_print(struct venus_hfi_d=
evice *hdev)
> >>  {
> >>      struct device *dev =3D hdev->core->dev;
> >>      struct hfi_sfr *sfr =3D hdev->sfr.kva;
> >> +    u32 size;
> >>      void *p;
> >>
> >>      if (!sfr)
> >>              return;
> >>
> >> -    p =3D memchr(sfr->data, '\0', sfr->buf_size);
> >> +    size =3D sfr->buf_size;
> >
> > If this is ever 0...
> >
> >> +    if (size > ALIGNED_SFR_SIZE)
> >> +            size =3D ALIGNED_SFR_SIZE;
> >> +
> >> +    p =3D memchr(sfr->data, '\0', size);
> >>      /*
> >>       * SFR isn't guaranteed to be NULL terminated since SYS_ERROR ind=
icates
> >>       * that Venus is in the process of crashing.
> >>       */
> >>      if (!p)
> >> -            sfr->data[sfr->buf_size - 1] =3D '\0';
> >> +            sfr->data[size - 1] =3D '\0';
> >
> > ...then this will overwrite memory. It probably can't be 0, but a check=
 or perhaps
> > just a comment might be good. It looks a bit scary.
> Thats correct, it would not be 0 as its a prefixed one [1]. I can put up =
a
> comment here.

Couldn't a bug (or vulnerability) in the firmware actually still cause
it to write 0 there?

>
> [1]
> https://elixir.bootlin.com/linux/v6.14-rc3/source/drivers/media/platform/=
qcom/venus/hfi_venus.c#L836
> >
> > Regards,
> >
> >       Hans
> >
> >>
> >>      dev_err_ratelimited(dev, "SFR message from FW: %s\n", sfr->data);
> >>  }
> >>
> Regards,
> Vikash

