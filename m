Return-Path: <linux-arm-msm+bounces-63231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AD7AEFB7E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6B2616BC61
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 14:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA59275AF9;
	Tue,  1 Jul 2025 13:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HfD9ep41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46DF2749C9
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378322; cv=none; b=JRPycI24NIgUz+/lECmo68fs1oFkJdlgqGZ/nTypItQYTJft30gnid1P3qgEiONB/D/ixHHsNtfIOujdiaDCHOztSGFoFnD5DLrJhPYrTZ48r+PNT6bv2e/WstF0654+fpZScy2WeURwD96PWCwPaZa22uHrue1m6lFPV0q6Sxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378322; c=relaxed/simple;
	bh=LAJx6orkCDOYtySCgavN0b29eXKWDYf2ZDwlrOBZFWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksdVjI6aBKwG+LxDhe/LL5N5VKtz0k9vTEMnCI/vFCWKxep57oDkLw3d8Qbn4n8aqgLxt50oFFdrV6H2eloIYOKSxmkBgPp4CsouJBRoM7ydjZrS4IUapxW5XdOeZ3XiS6SJMxJEh6rPWAjUB+CRnOv96EWVurHNhlbpNi3wLtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HfD9ep41; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so4148161a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751378318; x=1751983118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LAJx6orkCDOYtySCgavN0b29eXKWDYf2ZDwlrOBZFWg=;
        b=HfD9ep41EZ2K48tldagWmkSGYZYIGZE84ao+oDsMUHHqKv7lyHop2RhOfB4D6ZKV+y
         sHN+z6sR8MMkYzZDc0GZybPWwniHXsCsSU/yMTHWPyfri4flsbsCojulCFGHpqSeOJZz
         7f07XLEdts83gojGJNRl9YgNjQTt12qTL7bzQ2r32q1EY6JJLXCVeaHEt7yrssNEAhDU
         1ybGv5TAv/PSpwVzMV9RkTrAMKS2u3HUSDZLWp8JngxGw6RjWrBKEkmPev0I2AIAmaLS
         Mi30E+GrjtW3VCKEkT9vbAaqxTdVOCrvdfEtg09wlr006KPUp+w7KQjBYNf+25199HUI
         HQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751378318; x=1751983118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAJx6orkCDOYtySCgavN0b29eXKWDYf2ZDwlrOBZFWg=;
        b=IbBVS4yPhdkis5wEplme1EZAvkoa9jN2hQ/wmFc7u0VJ/5YVfh42nIokgm6Z3m+gyw
         4d1YuprCDOHCKlQnH+5enACCV/nPzc1P3KWJlsr2htpQM3FyMdnNj8E8VHpJkA8VFbg0
         QCjbcawKrhAiMEPtM3yeXYQanSZA4XYsdJxR+tBLDrYpY+PTOUUrnBgIpY/m6EjnSIo7
         KWbLVRM+gwqF8O6PnkxJjNdfdKyZMxWQpEVghU7Tdq50T4Vk463QXBPa6lSf76ZCR9dG
         ysHgIEwXF7IcEADdNCkwCIXDoKH0r/Orwf/4dxWrlN7VQ2g5g2ae8K1zthiH7Gyhtznp
         3lMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf3a6UiqXHV3BcVUVg5CxfYurMJZX+d9fKBCw+m6ptblCDH41KUDnAUGaqDsQcpLVwiaJqnBgj4NAsytxc@vger.kernel.org
X-Gm-Message-State: AOJu0YwT5y+wnEGkNaZhlc8KT2Kpj5bBAvmU/dil+F8FIwiwqrM9QlrT
	bHH4xAEBwWI1zstvwOGVRYC47s9CmwpgdeLm9GhHMD7iQ5vBkIVJEf8R22cAGjjHxpI=
X-Gm-Gg: ASbGncsr7FrQU55c+IPuZh8sAm8UiJf/d9COwbS9BgLMRSOmiUA+kN494NY8wVEogmO
	UO70OECZ4FqDt3GD95N6uBlxKTxGWxNUf+BdxIBoe7c1QMqEEDsytzrpgI7nT5BRb9f6fVBW4Jh
	Bgg17o2gJ3/GRsnN30/qspoyX1PNwbOLltIcERaX9DIfrtvmUEMfZYrIQtGchoqeqEcDOwyk+Qp
	jordhJXLeZ18wXJErK81aJ6b5OcUqwPrLm6p2rdNhmBhDBBFlPWVSfi0Y5QYG2savmd6UHSF/t2
	TIuvwDi2IeXm6JoaGGhYzjyacAG9fVFN/I04yBQ3cHqjJp185DphaBRK6g9pAUTvu8uAYVd4eF6
	ShPE3nYz1cgEUwOKjWMhDC3+dgNW+
X-Google-Smtp-Source: AGHT+IEErW/1m6kWJI/QUl1/GgPvWkXJOdlssf+ecP9RtQLtNt2Q/z8dOm0v3kXyntLM7RrDaEuzZQ==
X-Received: by 2002:a17:907:6089:b0:ae0:c092:ee12 with SMTP id a640c23a62f3a-ae3b0b3b182mr228151766b.22.1751378317932;
        Tue, 01 Jul 2025 06:58:37 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae353ca2159sm895363066b.178.2025.07.01.06.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:58:37 -0700 (PDT)
Date: Tue, 1 Jul 2025 15:58:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Agustin Vega-Frias <agustinv@codeaurora.org>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end
 in _driver
Message-ID: <53ugz6qg3rfgpcokrre6sqfr73tdjwiz67dvgvlnbiu6kkyc5u@bapjxdheqrzt>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
 <87ldp9m7la.ffs@tglx>
 <gbjim7wxszmwfvm523bgyfxf5mk5773pafdxnf2wf4mgaebsmz@qfeejv4ilwxv>
 <877c0smgip.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ew7zmkwgcjmemgph"
Content-Disposition: inline
In-Reply-To: <877c0smgip.ffs@tglx>


--ew7zmkwgcjmemgph
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end
 in _driver
MIME-Version: 1.0

On Tue, Jul 01, 2025 at 11:01:18AM +0200, Thomas Gleixner wrote:
> On Mon, Jun 30 2025 at 21:40, Uwe Kleine-K=F6nig wrote:
> > On Mon, Jun 30, 2025 at 08:01:53PM +0200, Thomas Gleixner wrote:
> >> On Mon, Jun 30 2025 at 19:23, Uwe Kleine-K=F6nig wrote:
> >> > The modpost section mismatch checks are more lax for objects that ha=
ve a
> >> > name that ends in "_probe". This is not justified here though, so re=
name
> >>=20
> >> That's a truly bad design or lack of such.
> >>=20
> >> Why can't this muck use foo_driver(name) foo_probe(name) annotations to
> >> make it entirely clear what is tested for instead of oracling it out of
> >> the name itself. That would make it too easy to understand and analyse.
> >
> > I don't understand what you're suggesting here. Either I got it wrong or
> > it is insufficient because every object is checked, not only the driver
> > structs. That would result in more exceptions/special cases than we have
> > now.
> >
> > Anyhow, I agree that depending on the name is unfortunate, maybe we can
> > come up with something more clever?
>=20
> That's what I was referring to. Doing checks based on struct names is a
> bad idea. Having distinct '...driver_probe(name)' and ...driver(name)'
> macros to distinguish the functionality is the proper thing to do and
> way simpler to analyse than names.

A driver struct should have no reference to .init.text (i.e. no callback
to a function marked with __init) no matter if it is registered using
module_platform_driver_probe() or module_platform_driver(). But even if
the requirements for those were different, how do you signal in the
binary if the driver was registered using the normal (i.e
platform_driver_register()) or the platform_driver_probe() way? Or do
you want to check the source file?

And note that if you have that, you covered only platform drivers, with
a bit of luck mostly all drivers (note that console drivers are special
and are allowed to have an __init callback). modpost checks all objects,
not only driver structs.

Best regards
Uwe

--ew7zmkwgcjmemgph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhj6YgACgkQj4D7WH0S
/k6Usgf/VQP7NM8MPg+CfR2etODmmBWc4JfKDQlAng0P/qelWDhiNY9LzE3y8ApZ
Gxx6fIqmcBIU1xHF0+ti0JuOdYyn0baF6SWauNZ+ALSRAYA4HmCJHnnvXzAfWIe8
OzeOfxSjgQLVmfuG2SWsRpjTwYZdQpVBIp6yZVNcf05vBHJfSq8Gywu7kYXCPAs4
0wgGcYfav+7ZadCczVuDd5P5rW2cQzpoSoFaAyGm8Gw3rKu5xEBxUfIATfxWBjTc
nlwkteyoUWXwp3xfWOK5UvKFgg4HA0YaoL5+X3bpn70tVLld/0lp1OWEGEnJvdn9
Fseh/gg5shlM22YYWg5a/+OnxHZLag==
=HqPr
-----END PGP SIGNATURE-----

--ew7zmkwgcjmemgph--

