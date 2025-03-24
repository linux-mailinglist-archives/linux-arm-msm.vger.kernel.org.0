Return-Path: <linux-arm-msm+bounces-52301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C980A6D7E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 10:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4E283AF844
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 09:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493C525D919;
	Mon, 24 Mar 2025 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="spfymTR+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4481411DE
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742810289; cv=none; b=gS4pjYxd7/MvRmEaWAmiAhGJF3KcPYb7UiOsGRZCrR6yEYhScRTgCSOw1Zv9kHi91jwyh8H/W/EgL+0grTH6huqiwbjKubKIv4pw88pF1G8Bow+Egne/s+/Z6efC4HTub2I+cbIYFEcf8gf3b3rRUhMoScbEtNP3dNEpcmKnFqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742810289; c=relaxed/simple;
	bh=OHg1Gocf3MVAxryxLA/xQ+5RT7slspVi+KujcHZqyMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+G79IKvymw6vLqXJfmbvZj3KK4UxAIG7aZ9jaQetz78mKOIH20kmQwzgEuDvKHVx1GvmegNoGBmD0mkZzE7d4o6IrvQ1WD5BNJTSDW3ehM5pICWJ2nCSDrorzBL3chM7ScIE1lwOlkzpCCzkeyu+YiwmjS072t2HbsLIVo9y3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=spfymTR+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549644ae382so5270362e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 02:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742810285; x=1743415085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPGPUbUSiYN5rbP1AyBJpFJROiY6lURz5npYEhG7kPM=;
        b=spfymTR+q2YO9IXeQV8zJTlk/fIsFgVaMze6osPrwJPUQ0qDzci/WNcZtknTp12fJO
         F3jFAwmvfmlkscYBJaySGc70Q75XTj00+5/ujXBHBYyd6y2g2mhUeMMYnnWvINbGpbdZ
         PJbJsPQhzW3uRb+4YjmsQOTPXzhRGgk/GLfsuPa3wjUiNvYJU+bsWjsNpH6KF5zAuxea
         FwOeEHRHY8/YeD0Uqdx5/CafvuYb0B7OCPaTvjLgrKIlHN8lLHCGadzkavwC9U79I68j
         cfLuNgXM7FEMHolTvlHx3IWDG7nQ/2mklNASV1V7s5BGGrlIsMN360hcbElSD5/OZtTt
         s69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742810285; x=1743415085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPGPUbUSiYN5rbP1AyBJpFJROiY6lURz5npYEhG7kPM=;
        b=IPqAANKQEjw0g0c2IU4SHGKbEqXKykXeQcqc+JLI8uuVIqRpLWutxXRoaERC1wN2/m
         o2OGKJpiu2BdEtcbkVqVTZonJ5lBAFUlsjNQhef2r7jrhLC7SmwCQpqmIZNd+F8HuduP
         r60r7LbG4YVMUlcxekGWJYhmzYYPDM2XlhruLrfUQsA2wxeN0qYrDNH1sRX0+wrjKvMq
         ndyOHSnXBzT2eyga5gflRiQ2zNPHQ/Tgl2xjlH0lQNvz5dktBBNDretiBagwwRFZALhA
         DBwgDBC8TbHpSxPrLbQ49+6jStOMU0ozf0IgwFkZffRyxjGXJHyEVjihYtj6IJcI1lri
         B9Ow==
X-Forwarded-Encrypted: i=1; AJvYcCX/DUO9XxttbCRs2qGsONo9ej1tY2nysG9O9eJVtO9DXCHC+i8fsxsi4HcDxzt8hKovSdcESOivvbNJd0U4@vger.kernel.org
X-Gm-Message-State: AOJu0YykXScl9r3tQkPHoMeassxC/4v7qCnB0cu6+SOUGUD/QE1uemX2
	O90dPUeNPGCIFqYfbZj2QAvTz5QTzQLq3lhydWsbxcIZ43ntQml8fZ50jqiAsp7hzH2jf7U/pv3
	farJbYPrt6vhK9/KWSuO4eRbbbHTN7/uo2L2lLQ==
X-Gm-Gg: ASbGncvrN0gvvLpWZOwF5evcng00Lo4fmgWaX26UQMWzRXcEGeWmK8xUbJH08gnXriO
	29EkI9WZGake+cGvF0QH8sbRLDco1pIvl8iGQqhQUPvM3nHRBlhe4c8yVE5e3glSZT7xQFwuwM5
	dantIPPE5HUJWfkHR0Sapa+wk=
X-Google-Smtp-Source: AGHT+IGFsn3NoPz0najqV+IyhexXJLWBrCkDs/jIJqPrU8OWba6VOwjZMM5PPRVIKcz1oO7UGeYDUXXGPDpt9IuYXJ4=
X-Received: by 2002:a05:6512:1589:b0:549:7590:ff24 with SMTP id
 2adb3069b0e04-54ad648589amr4088805e87.22.1742810285409; Mon, 24 Mar 2025
 02:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
 <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>
 <PAXPR04MB8459D61091A8BF9ABD94DA7E88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CACRpkdZXG0JC7_-Mg6Dpq08Y=Kr3M+fRWQF_bPG8c-WH8pA9Mg@mail.gmail.com>
 <Z-ER6elHDYtIY0ap@hovoldconsulting.com> <PAXPR04MB8459B60880CC19480C5902B388A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CACRpkdagFrz=5fRUfVuaZJRsBao4UrObNa7VknS_hmOAsWFO+Q@mail.gmail.com> <PAXPR04MB8459F7BE5AD43E0685C74A6C88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459F7BE5AD43E0685C74A6C88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 10:57:53 +0100
X-Gm-Features: AQ5f1Jq7SF51RGQ0IJIEpnbKXCAd1Gopipv6p1fkqvQKEyRcyxOHT8HxFUdiM2Q
Message-ID: <CACRpkdZ_f2EHjTJtkOdAmdAOUsh2Xi0hsToCWuTGkoh1aCZwtA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: Peng Fan <peng.fan@nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 9:34=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> > Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO
> > descriptors
> >
> > On Mon, Mar 24, 2025 at 9:09=E2=80=AFAM Peng Fan <peng.fan@nxp.com>
> > wrote:
> >
> > > ok, then the only suspecting point is
> > > wcd938x->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_ASIS);
> > >
> > > I may need to use GPIOD_OUT_LOW to configure it to output as set
> > raw
> > > set value as 1.
> >
> > I think there may be a bug in gpiod_configure_flags() in gpiolib.c:
> >
> >         /* Process flags */
> >         if (dflags & GPIOD_FLAGS_BIT_DIR_OUT)
> >                 ret =3D gpiod_direction_output_nonotify(desc,
> >                                 !!(dflags & GPIOD_FLAGS_BIT_DIR_VAL));
> >         else
> >                 ret =3D gpiod_direction_input_nonotify(desc);
> >
> > Shouldn't this be:
> >
> >         if (dflags & GPIOD_FLAGS_BIT_DIR_OUT)
> >                 ret =3D gpiod_direction_output_nonotify(desc,
> >                                 !!(dflags & GPIOD_FLAGS_BIT_DIR_VAL));
> >         else if (dflags & GPIOD_FLAGS_BIT_DIR_SET)
> >                 ret =3D gpiod_direction_input_nonotify(desc);
>
> Using GPIO_ASIS should not change direction.
> This change makes sense.

Actually when looking closer at it I was wrong.

From <linux/gpio/consumer.h>:

enum gpiod_flags {
    GPIOD_ASIS    =3D 0,
    GPIOD_IN    =3D GPIOD_FLAGS_BIT_DIR_SET,
    GPIOD_OUT_LOW    =3D GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT,
    GPIOD_OUT_HIGH    =3D GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT=
 |
              GPIOD_FLAGS_BIT_DIR_VAL,
    GPIOD_OUT_LOW_OPEN_DRAIN =3D GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_OPEN_DRAIN=
,
    GPIOD_OUT_HIGH_OPEN_DRAIN =3D GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_OPEN_DRA=
IN,
};

So GPIOD_ASIS does not set GPIOD_FLAGS_BIT_DIR_SET.

Then gpiod_configure_flags() has:

    /* No particular flag request, return here... */
    if (!(dflags & GPIOD_FLAGS_BIT_DIR_SET)) {
        gpiod_dbg(desc, "no flags found for GPIO %s\n", name);
        return 0;
    }

    /* Process flags */
    if (dflags & GPIOD_FLAGS_BIT_DIR_OUT)
        ret =3D gpiod_direction_output_nonotify(desc,
                !!(dflags & GPIOD_FLAGS_BIT_DIR_VAL));
    else
        ret =3D gpiod_direction_input_nonotify(desc);

So the function bails out right above (you could check the debug
print there if in doubt.)

So the behaviour is correct.

So now I have no idea what is going on again :/

But I would suggest trying to set GPIOD_OUT_LOW when requesting
the line and just check if that solves Steev:s problem
(trial-and-error).

Yours,
Linus Walleij

