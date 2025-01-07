Return-Path: <linux-arm-msm+bounces-44210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A895A04B8C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 22:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B4FD7A1927
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 21:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248F41F7545;
	Tue,  7 Jan 2025 21:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CbF+sIj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521531E1C22
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 21:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285207; cv=none; b=PSkQQEqHFBJHZiVSA2715hS086ZdSuXRycmT3JMLkvVnl9yodqXTfcG5vQnHWSxdAdx7YnTRP7Rbj6GlM7Nvf0nlC8e12RBN8UzgQ2TfkQmOW8vK4IYBOOuNtetnp6TQ1FJEtMV2zl2IuYTjG/MsEU7jniCevfZuN28o4KdNKLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285207; c=relaxed/simple;
	bh=Pzz6EqojEC3qlXAQaeyiAn+6opzV9iw4YULOj6h0n6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kX6Pln+uawiG8G1AHCHAsmPwGbbJGO/lHEfQ4H2GyiUuTPb5NwWE3LnEcHg0M4ObUdWb5gSMP7lpt4F6FmeEVn2FgqEH8Ug9sxd/28bNuNOIeTkJH3eNTj3rtF0imQKrponx1OV1HHUwrQPiTIB5nQCI6LkEp7IBheIy3Ll+vuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CbF+sIj2; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3047818ac17so141656121fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 13:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736285203; x=1736890003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvvXiEYDhlrGJfNxULnehjz8DMuZTc4BsGHcaaJjRC8=;
        b=CbF+sIj2P8Yds13qvK5sNfJ3InBe4O0xdEmvtAfF2DNE6ykgBHtZpbMJntAY5Puctm
         fylc4qffMNrBB2C4EAnE1fISE/UyqfhBo81hopW0JW8Sijp51rcVGXxh+V6XLRmiQ0ju
         YnBkFdAIYypOi2XyzJTxDoeKwc9XPnQHjOJUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736285203; x=1736890003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvvXiEYDhlrGJfNxULnehjz8DMuZTc4BsGHcaaJjRC8=;
        b=vhmo57FPPltn5ppje6U1k2BICuEe9UqMmJG/GrBPp/vV8GcLBuMC31SIbgDfhfHow5
         RNZPmJkc0LIeeghGmuO+3sLQc1oVjsV6VJe6gohaVoW7f7d2a9ug3nKXpNPEkIGvInFt
         JJp5CKXwk6kjgdtzI4ApIGMoMN7WD0A7+JvlHdYX6k1Ag7grlYtY9nt33wTsMEqonU2/
         9oPKQcznqvtiZoICdHPd/tlc9bdRP64L6u1k7414fV3ZlALfXSbS0ThwwIOZNQH2tE3w
         6IYH1XzWNc+/JlRA3r8WMZ3aYnBDsXttFDKJqZGN2w7HgXs4bDsi5i7rDb5A2YvFHNHM
         8xiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKT7O3lXrR7aT8QkCkIEn6w6DwmhQWF3KRnHGKyeWRDJPuyloGsJ6cI1wpLA3CoBDsiY92TdodH/x3zUcx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr5WGXF55dnysLRz1LAdGwM1me4lYQlg5ZZsqzeOxxca977jAf
	jJFsQVsk+zNvbfAzSg5WwMGdEqI3UPKRdCeJlQwK71TUkp/ZcTkGiYn+Gx+c/pksoSp1jYF+m/z
	NPA==
X-Gm-Gg: ASbGncs66PiMv+3jp963VKQ55kLF4EDnlMsUfhlk6abiY6WW6rUpSUkrRO2lQCWk+Ky
	X0vPLzdCxQalue1/X8p67H5ixtm67I7yNpn/zPh8g7YWg6J6qlpH4qarilkP7RgmHNAVOF3G/Ot
	yYFlqyvOrrLlJ1tJdYdIegTN3KbleiRUH49yI61iamY462G1OsCdR0MG+nicYtqGS/+vSUDxM2a
	WWOJAVxUSvGrAE4ifZ63euBvu54a14FLf1Q20Z/fFLwmOhvr8w1ud9bcTMZtwFZcOo4lMYcJVS6
	bSReyTbq7XGHTrkVl90=
X-Google-Smtp-Source: AGHT+IEDqlqtNavpCsSQaMY35WsL2vZaBk95c9keE2YPwfuZniekuY5OdXzJRDi+Bve9kKzJAhNKNA==
X-Received: by 2002:a05:6512:282b:b0:540:1d0a:581e with SMTP id 2adb3069b0e04-542845d8a0emr64144e87.28.1736285202885;
        Tue, 07 Jan 2025 13:26:42 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238215e7sm5264371e87.196.2025.01.07.13.26.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 13:26:41 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54252789365so9734504e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 13:26:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGUhqeji4Wtzus2UK6rtTTN0DCrSTHKHqF29Ca8Sy0hIWkofDyyLp7xDZ5YH2bvHo+ckJfMElToAzf0Kgn@vger.kernel.org
X-Received: by 2002:a05:6512:220c:b0:542:241e:75ae with SMTP id
 2adb3069b0e04-542845b17b4mr91145e87.9.1736285200398; Tue, 07 Jan 2025
 13:26:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
 <20250107-fix-cocci-v5-1-b26da641f730@chromium.org> <CAJvEA4nC8-2aMHUg+iJ8qMNuQKYnmpbpK_iZMhoivOQX14G5DQ@mail.gmail.com>
In-Reply-To: <CAJvEA4nC8-2aMHUg+iJ8qMNuQKYnmpbpK_iZMhoivOQX14G5DQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 7 Jan 2025 22:26:27 +0100
X-Gmail-Original-Message-ID: <CANiDSCt900xLuroAkBhkpVDrz9Y9Eixdn544=uYZd6RnB2Ve3w@mail.gmail.com>
X-Gm-Features: AbW1kvbmVZcz0XhN8C92sN1HNLAf1XzwRGUzZw1xAZfEGwFaTrkttLZuAAID2KY
Message-ID: <CANiDSCt900xLuroAkBhkpVDrz9Y9Eixdn544=uYZd6RnB2Ve3w@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] media: dvb-frontends: tda10048: Make the range of
 z explicit.
To: Kosta Stefanov <costa.stephanoff@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Kosta!

On Tue, 7 Jan 2025 at 18:28, Kosta Stefanov <costa.stephanoff@gmail.com> wr=
ote:
>
> hi Ricardo, according to the datasheet the recommended sampling
> frequency is 55 MHz (BTW, if you look at the definitions in the source
> code and make the calculations that is exactly the sampling frequency
> all currently supported in Linux devices are using as well).
>
> also, I spent few minutes time to make the calculations based on the
> restrains of the PLL build-in tda10048 and in theory the maximum is 69
> MHz. so, if you make next revision of this patch, feel free to update
> the comment accordingly, in short - recommended sampling frequency of
> 55 MHz, theoretical maximum of 69 MHz.
>
> in any case, your assumption is correct and in reality is away less
> than the maximum value you assumed.

I have updated the comments in my local copy. I will resend after a
couple of days in case there are more reviews.

May I ask if you could share the datasheet?

Thanks!

>
> Reviewed-by: Kosta Stefanov <costa.stephanoff@gmail.com>
>
> --Kosta
>
>
> On Tue, Jan 7, 2025 at 12:54=E2=80=AFPM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > We have not been able to find the relevant datahsheet, but it seems rar=
e
> > that the device will have a sampling frequency over 613MHz.
> >
> > Nonetheless, this patch does not introduce any change in behaviour, it
> > just adds a comment to make explicit the current limit: div by 32 bits.
> >
> > Found by cocci:
> > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does =
a 64-by-32 division, please consider using div64_u64 instead.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb=
-frontends/tda10048.c
> > index 3e725cdcc66b..1886f733dbbf 100644
> > --- a/drivers/media/dvb-frontends/tda10048.c
> > +++ b/drivers/media/dvb-frontends/tda10048.c
> > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *f=
e, u32 sample_freq_hz,
> >                              u32 bw)
> >  {
> >         struct tda10048_state *state =3D fe->demodulator_priv;
> > -       u64 t, z;
> > +       u32 z;
> > +       u64 t;
> >
> >         dprintk(1, "%s()\n", __func__);
> >
> > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *f=
e, u32 sample_freq_hz,
> >         /* t *=3D 2147483648 on 32bit platforms */
> >         t *=3D (2048 * 1024);
> >         t *=3D 1024;
> > +       /* Sample frequency is under 613MHz */
> >         z =3D 7 * sample_freq_hz;
> >         do_div(t, z);
> >         t +=3D 5;
> >
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
> >



--=20
Ricardo Ribalda

