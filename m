Return-Path: <linux-arm-msm+bounces-87209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5628CCEE498
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5363D300CBA8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED55E2E7BCA;
	Fri,  2 Jan 2026 11:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E+DJ2rP6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F12E093F
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352423; cv=none; b=hzKuU4PGl+83VMZAWFHL7XnpbxTdj9uj4I9wOHE0qUYsHlVJdPkHS/G0oEyJvpSdto/5BYWuBJI5rKeFb/AoDlpwVePjqVlcI6ie7dsCSiZ/C/+1pSvzQ7POkc7Sjw47yf/Ii0e2h1WKPxF3U9UU2PeTDhpbOGCDNxkFbIAMiHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352423; c=relaxed/simple;
	bh=nXFZwZZBKquh8LmMNfYlo2E6H3yvO66kM3Z2AGIucRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VO6bRbneTubwJY8lU//b1vfT92OuzfZt+naa/T8SQtD1GawgV/2nyTtVDEQA09ppNLDVpamXqbfohXfcQfV7cgne56CaxCnD/IwYUdMycvDSGnp+jjTQeq05gRkhMJV7gIwaDgaRiLemdXPjX+1PZJJQ4BtHtCDyV71N+CzCmzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E+DJ2rP6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so12815026e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 03:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1767352420; x=1767957220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsSijJtpaI/oDSTtzaUkeXToSyfCr4FMo1aTrP8qZaU=;
        b=E+DJ2rP6MxVUCdmBqZoI8P0tCI2IXXRTYgVdh+t0wtuN5qhCvwC8gsXod6vw7KkFDh
         FX0G8uZKwAKwhcZpD9fB0YcUqH7AYcatZ0IVw7+OSkhch+6ID6Y0kLwrn/R+CRqgVOyD
         tpN3Dc2+4KHitrxseeIxY9cratYQyTnVB13uoPBYdWVGsqBSkVZ3vCa6OkigVNmpp3fv
         5m7yPUiqflkZGIPCNgqdLBbFxbNi5+APmnzvs+69Ca5UOHYui3zP27LzMpqQDjSXaz0l
         +le3YqGnrtn5GgRi2URtYCVep5lwkpa3u3/8tI+TAFBALnLY32FvPFm/rDNuKieBMvCj
         Ee4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767352420; x=1767957220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FsSijJtpaI/oDSTtzaUkeXToSyfCr4FMo1aTrP8qZaU=;
        b=C+ceJvOWIohfRt0rHleon+JS00hVGMRa4rQ+IpdO4+w0ugPVEjRDePkHb+vWcY8fog
         WB9T/EQfDH7/yBg9C4Rn7sVQ/NbluRJrUoYDvdFKUT54aosP/6H0J+VCC50PlzAAjxOg
         lZvzYkacsvcienIRdPc4WZHAZ1uVPIH9RT9NLPtI7XqYUhlR+7qLaw2Nos6d2+gMQYUC
         xR1fNk5fobxgoUqysH6P7QGbm2MW5ZJjQwAYzIrxEWZDX2nqNwcNkHpM1NOfVt6RWvgT
         qmGda+KwGSTCsuzgk4lvTrj9rxefZQjvCRx65wil5iQzGkOQCDBQ8ZQDl4ZgC+e06c2V
         XzFg==
X-Forwarded-Encrypted: i=1; AJvYcCUTdXQZEpEMJjqtuZdK2GJJzVuQZWTXTvVsExqrfYGi2fAyOnaDt/kCHDKomLkJMFrc/70EsIK3N8csEAlT@vger.kernel.org
X-Gm-Message-State: AOJu0YxGHyHSMw3MwvKYI+yUUqD0Rf+TzqKRBbAGUtCv73URr46+Eh8X
	erW8zsK52OdI9L/VpKWe+B5jaavFKLyeUjGFs3fJ9ijxxD93OmeykbljcQf6mRA0FXiCVq9NfM6
	llDpDUgyQU1FVQfM0ztrotkkhh7Hx09ZmFEItzBw50w==
X-Gm-Gg: AY/fxX69RioRkTP04xAmm9GWoZfP5Rg3JzPh7OPQBEAKgYPP863RGGBhxmkR/hxDNVJ
	HC5GS5RAMTnuYBCHM0cYO45N1+dHEB302BAYF3BH40bfd7BBip3fgxivm4Hq5Np7uoH3aIvZrN/
	bxVtD//3Q7u5jjRt/cfgaZ0Pqh6II5jmFWcw1B/JKxg/tMJlBnTXONul+bn9JqD3rugx55dzt1t
	mnpiaorg9NsQFPOqJjA9Hsm0xSOK/xaqoQuEym/tbG9X+bKAVJVeGKPbvDG7cPTH5uqSZ+quhbr
	sEZ4oox1d6/EuNPouW/U5tH5AxI=
X-Google-Smtp-Source: AGHT+IFAdaCcjUwdY3Ew9NHcwLT11KRJipC8z25Ztoxl2WB+caL1mXRBHlm39ALYwigrxotmoGpHP+uwj2P6/o6YWRA=
X-Received: by 2002:a05:6512:b8b:b0:598:8f92:c33f with SMTP id
 2adb3069b0e04-59a17d77435mr14680425e87.51.1767352419706; Fri, 02 Jan 2026
 03:13:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com>
 <20251125-pci-m2-e-v2-2-32826de07cc5@oss.qualcomm.com> <CAMRc=Mc-WebsQZ3jt2xirioNMticiWj9PJ3fsPTXGCeJ1iTLRg@mail.gmail.com>
 <fwzmob6ez7c6xbakcd4rq2icp7mdwgdvimss3zybb4ivdds3uo@mwguaz7rekjc>
In-Reply-To: <fwzmob6ez7c6xbakcd4rq2icp7mdwgdvimss3zybb4ivdds3uo@mwguaz7rekjc>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Jan 2026 12:13:27 +0100
X-Gm-Features: AQt7F2rD4Vva2u72gj0duDgyvxJiVfI_tVGQktahu3E6VwiSEZFuXnq9LhXUXbk
Message-ID: <CAMRc=MdNTHtzTJ3f3qVHH=qFbK86MzUP0vvx3ogZsXG+iqMUnw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] serdev: Add serdev device based driver match support
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 8:56=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Thu, Nov 27, 2025 at 06:32:04AM -0800, Bartosz Golaszewski wrote:
> > On Tue, 25 Nov 2025 15:45:06 +0100, Manivannan Sadhasivam via B4 Relay
> > <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > >
> > > Add support to match serdev devices with serdev drivers based on the =
serdev
> > > ID table defined in serdev_device_driver::id_table.
> > >
> > > The matching function, serdev_driver_match_device() uses the serdev d=
evice
> > > name to match against the entries in serdev_device_driver::id_table.
> > >
> > > If there is no serdev id_table for the driver, then serdev_device_mat=
ch()
> > > will fallback to ACPI and DT based matching.
> > >
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualc=
omm.com>
> > > ---
> > >  drivers/tty/serdev/core.c         | 23 ++++++++++++++++++++++-
> > >  include/linux/mod_devicetable.h   |  7 +++++++
> > >  include/linux/serdev.h            |  4 ++++
> > >  scripts/mod/devicetable-offsets.c |  3 +++
> > >  4 files changed, 36 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
> > > index b33e708cb245..2b5582cd5063 100644
> > > --- a/drivers/tty/serdev/core.c
> > > +++ b/drivers/tty/serdev/core.c
> > > @@ -85,12 +85,33 @@ static const struct device_type serdev_ctrl_type =
=3D {
> > >     .release        =3D serdev_ctrl_release,
> > >  };
> > >
> > > +static int serdev_driver_match_device(struct device *dev, const stru=
ct device_driver *drv)
> > > +{
> > > +   const struct serdev_device_driver *serdev_drv =3D to_serdev_devic=
e_driver(drv);
> > > +   struct serdev_device *serdev =3D to_serdev_device(dev);
> > > +   const struct serdev_device_id *id;
> > > +
> > > +   if (!serdev_drv->id_table)
> > > +           return 0;
> > > +
> > > +   for (id =3D serdev_drv->id_table; id->name[0]; id++) {
> > > +           if (!strcmp(dev_name(dev), id->name)) {
> > > +                   serdev->id =3D id;
> > > +                   return 1;
> > > +           }
> > > +   }
> > > +
> > > +   return 0;
> > > +}
> > > +
> >
> > I don't know if Rob agrees with me but I would very much prefer to see
> > software-node-based approach instead of an ID table matching.
> >
> > Could you in the pwrseq driver, create a software node for the serdev d=
evice
> > you allocate, set its "compatible" to "qcom,wcn7850-bt" and match again=
st it
> > here?
> >
> > This has several benefits: if you ever need to pass more properties to =
the
> > serdev devices, you already have a medium for that and you can also lea=
ve
> > serdev_device_add() alone. You're comparing the entire name here - what=
 if
> > someone sets device's ID to some value and the name will be "WCN7850.2"=
?
> >
> > You could also drop the serdev_id field from struct serdev_device. For =
matching
> > you could even reuse the of_device_id from the device driver.
> >
>
> I tried this approach and I really liked it since it gets rid of the yet-=
another
> id_table for serdev (which I didn't like it btw). But there is one concer=
n
> though. We need a generic 'device_get_match_data' implementation for swno=
de.
> While trying to implement it, I stumbled upon this patch [1] which does t=
he same
> for other usecase, but there was a disagreement on whether swnode should =
be used
> for driver matching or not. For my usecase, I find it very useful and
> reasonable, but Dmitry Torokhov believes otherwise.
>
> Maybe I'll include this patch in the next version, CC Dmitry and see wher=
e it
> goes.

Thanks for bringing this to my attention. I think that historically
software nodes were meant to always be "secondary" but now we have all
kinds of auxiliary devices that use software nodes as their "primary"
nodes so maybe we can re-discuss this.

Bart

