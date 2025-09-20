Return-Path: <linux-arm-msm+bounces-74289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B71F4B8CD65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 18:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719EF7E0B78
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 16:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410B32EA75C;
	Sat, 20 Sep 2025 16:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yS0M+6ww"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB7C21D3E4
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 16:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758386524; cv=none; b=EwXl7BcpJghflv+cKmSVy4+4I7JlxhQBPhNEYbMF0UJT5TmN+QVeTARaHmI7IQSh4Dr/q1gWR8eFrRHvtoQWHXBzyb7WaSje/BvCIoMtJjbYRadMLu7lnaoTmNEmO/a1FLTc9he7T0nmYtqy5D3sXddxdxSPqjCaE5D4zLPF66Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758386524; c=relaxed/simple;
	bh=8yxUmsnX9yOq7CyqhC2sAV111qny6SgsS0lVVp0vL/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBoDTaFDMbUltgu6lQonM8DQX0rEQgnGarJ3Mfa1I4tYutqM0Y0QzP8VkVWWVwTreyj4SIUstG4GJbnDw6XFIKg3K37B8rvHGFNZPP3gXEeIBtHukksY7ke+0u4cMz8ZIxR6/mqIsqsvVeSo3aiCupdKaLNEGh4UDepqHxcPtUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yS0M+6ww; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso3650687a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 09:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758386520; x=1758991320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7uzS/vyKL78XLGJYkf20HiEkzzRuN4BWxhwOr5TgLy8=;
        b=yS0M+6ww/YPK2CkMWuQnHdODGXlQLo0i9T61SmpHCdkjld2vLUZmVnyu/kiIy0QY2V
         MydMXHeLMvKxqoMc4x4RE0oJiLYYiSqx0F745Z5FRv/Zt3GWy9HLFI+vC+6mcU9Zhvg/
         grKxRw83QgKNp1XzH2HIdEM0qT6H7quH8wzWxty5knLNRGuD2FgjfuWLG36LB5WaT13T
         32vGReGV2X6+l4c04XiR7ZpDHRHnys7KSMNBQgUYdKwl9jPJ3wtfxpn+1dGJ9mpYV4QP
         2BjQaY1cTtoVCQK2naL6LciSribJd1i/9vcN6cSiVTyItr7j89bUUB/o62VEvAApkFr5
         1/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758386520; x=1758991320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uzS/vyKL78XLGJYkf20HiEkzzRuN4BWxhwOr5TgLy8=;
        b=dTaLfr4qH1iYMIl9C0QJb4XjLx0cXvpC9Qt9cm6fEl35WJWDnt9jyXR8IVnzqxK8oL
         ZKp//NAZbxo0XsjgcW4DzJPr26kSLUAJtIt1RgSdbKr3AtATFQ3gvhFt1BR1zhzb0gu7
         Ai8UmSZtR+efNcf41s08dok7l1BQlGrd3ND32fJCsU1hCeXTRvgAQJ7oXUeQL5EBOPCT
         fCPUUEpRM4SQaTXhRXrF9ZeNqLwRLdhmfMe4BbnPhU5Etp8/w5vrOIU4zyG+VvpBeq2b
         e8XV5g/Sy+C2INZ/UMH6fnAXjO0xohIwDneO7i/JE9HqO086HbrT+3E0Dz+lDovyU3TT
         G9qw==
X-Forwarded-Encrypted: i=1; AJvYcCWRSfUJFTLQNLcagLsZ3KEwydNwpl/KoYy1o+otBr0mZTCMyf6WNOWwh8SNu0UuVadx1vryRL1++lj3uqbF@vger.kernel.org
X-Gm-Message-State: AOJu0YwGx4DQCqXYd6ROPvuccnfMYCRiHqa691dw3bgumRoFhtAxu3yu
	x9b4yvdnQFWz8C49e1dIfzWBbOm6ZIQNFOdRqGPCfppsjjGZGjyl1pktWz0kqDoY+uk=
X-Gm-Gg: ASbGncuOr1rzL9oqfxF9PSj8FSIVkP6R+isr0lMUoADJU3szCe8sbp4PJFCjrpwbHfQ
	ypcIsLniu5naXPLHGKCcXnqdyRxlaTpTQs/vrhoHyHYDQnZFyKEmE8eUK2qYappB0Q/9T6gIQqC
	IeEGGnMuQRrxOtV7JI6sqP40bAtKnBD43Hzeh58+IwhjMYtxC5oJU0yY9ChEcowgY/N+BH4vHl9
	X2BOpYcudrVocZIeffnOVx9PZkG6mWkHvAsg51bI0cuVyNGXMn82CRJv2/P+erkHLiXo3PqbVes
	iEi6vO8CqX9tHEX5+mI8+VSzxnbeaMjvOwfL8L6JnsxkdtAqMja54+OgLTgSzEJIk7+Oe1veRvI
	ZE0Oe8LwXlNZTuAIhf08vz6vmYUQ=
X-Google-Smtp-Source: AGHT+IGKt39UQn5jzBEhjnHbjhGMHaeA/VyK514j5LVq6YZ3WWPLFkMfByunXzny8uptDg8fNtpVnA==
X-Received: by 2002:a05:6402:3202:b0:61c:bfa7:5d0 with SMTP id 4fb4d7f45d1cf-62fc0a78f7fmr7798031a12.30.1758386520260;
        Sat, 20 Sep 2025 09:42:00 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62fa5f28672sm5489248a12.43.2025.09.20.09.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 09:41:59 -0700 (PDT)
Date: Sat, 20 Sep 2025 18:41:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, sboyd@kernel.org, jic23@kernel.org, nuno.sa@analog.com, 
	andy@kernel.org, arnd@arndb.de, srini@kernel.org, vkoul@kernel.org, 
	kishon@kernel.org, sre@kernel.org, krzysztof.kozlowski@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, kernel@collabora.com, 
	wenst@chromium.org, casey.connolly@linaro.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/7] nvmem: qcom-spmi-sdam: Migrate to
 devm_spmi_subdevice_alloc_and_add()
Message-ID: <x5ot622jqzz67imvswtdacqeeclqaw7my3pj6ne7tureec6ufg@fuzltifrkcae>
References: <aMlnp4x-1MUoModr@smile.fi.intel.com>
 <mknxgesog6aghc6cjzm63g63zqbqvysxf6ktmnbrbtafervveg@uoiohk3yclso>
 <CAHp75Vf7KrsN7Ec9zOvJoRuKvkbrJ5sMv7pVv6+88tPX-j_9ZA@mail.gmail.com>
 <er7dkmzutsu3ooegeihjzngi6l3hol5iaohecr3n5bolfse3tj@xeedlx2utwym>
 <aMxWzTxvMLsVWbDB@smile.fi.intel.com>
 <2025091925-thirsting-underuse-14ab@gregkh>
 <f16ea5eb-cbda-4788-956b-d41c2af51745@baylibre.com>
 <2025091918-glancing-uptown-7d63@gregkh>
 <8702fd35-945a-4d20-bc37-410c74c70da6@baylibre.com>
 <2025091902-dwelled-calculate-c755@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7d2frku4wfk7wjvb"
Content-Disposition: inline
In-Reply-To: <2025091902-dwelled-calculate-c755@gregkh>


--7d2frku4wfk7wjvb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/7] nvmem: qcom-spmi-sdam: Migrate to
 devm_spmi_subdevice_alloc_and_add()
MIME-Version: 1.0

Hello Greg,

it seems we agree on the advantage of module namespaces that the pool of
global symbols is reduced, right? That is given with and without the
module import in a header.

On Fri, Sep 19, 2025 at 05:37:03PM +0200, Greg KH wrote:
> On Fri, Sep 19, 2025 at 10:20:29AM -0500, David Lechner wrote:
> > Up to now, my (naive) understanding was that the point module namespaces
> > is to reduce the number of symbols in the global namespace because havi=
ng
> > too many symbols there was starting to cause problems. So moving symbols
> > to another namespace was a "good thing".
>=20
> Yes, it is a "good thing" overall, but by just making all of your
> symbols in a namespace, and then including it in the .h file, that does
> the same exact thing as before (i.e. anyone that includes that .h file
> puts the symbols into the global namespace with that prefix.)

I fail to parse the part in parenthesis. The symbols of the pwm
subsystem are defined in the "PWM" namespace (using `#define
DEFAULT_SYMBOL_NAMESPACE "PWM"` in drivers/pwm/core.c). In <linux/pwm.h>
there is a `MODULE_IMPORT_NS("PWM");`, so a consumer (say
`drivers/regulator/pwm-regulator.c`) only needs

	#include <linux/pwm.h>

to import the "PWM" namespace. So pwm-regulator.c puts the symbols
into the global namespace with that prefix. What symbols? What prefix?

The thing that is different is that the pwm functions are in the "PWM"
namespace, so a module without an import for "PWM" has a smaller pool of
global symbols and so loading that module is a tad more effective,
right?

I agree that for the consumer source it doesn't make a difference if pwm
is using a namespace or not. I'd count that as an advantage of the
"import in a header" approach.

> Ideally, the goal was to be able to easily see in a module, what symbol
> namespaces they depend on, which requires them to put MODULE_IMPORT_NS()
> in the module to get access to those symbols.  dmabuf has done this very
> well, making it obvious to the maintainers of that subsystem that they
> should be paying attention to those users.

For me as pwm maintainer it doesn't matter much if I pay attention to
`MODULE_IMPORT_NS("PWM");` or `#include <linux/pwm.h>`.
=20
> For other "tiny" subsystems, it just slots away their symbols so that no
> one else should ever be using them, and it makes it blindingly obvious
> if they do.  For example, the usb-storage symbols, anyone that does:
> 	MODULE_IMPORT_NS("USB_STORAGE");
> had better be living in drivers/usb/storage/ otherwise I need to have a
> word with those offenders :)

All symbols in the "USB_STORAGE" namespace (apart from
`fill_inquiry_response`) start with `usb_stor_`. If you grep for that
string you find all the (probably illegitimate) users of the usb-storage
symbols, but also those that define their own symbols with that prefix.

Do you actually look out for such offenders, i.e. have a lei mailbox
with `MODULE_IMPORT_NS("USB_STORAGE")` as search string or a cron job
grepping your tree for that?

> So it's a way of "tidying" up things, and to make things more explicit
> than just having to rely on searching a tree and looking for .h include
> usage.=20

For some reason in your eyes grepping for MODULE_IMPORT_NS is superior
to grepping for an #include. Can you explain that?

Best regards
Uwe

--7d2frku4wfk7wjvb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjO2S4ACgkQj4D7WH0S
/k4IhQf/UtPUTnhbxWROvnPeLQVLBT7LYDoSGOyTSyXtAb7AtAQeUqfa7EOc+mbs
9mnVB/2Tv8YaD+bCuGpjvR2UPbbitvNteBfOKlyq/VoLROElZ9C/muciDIkTDqzt
a3u+lJJaxf9nhWtJHj35qZ3OUc5Uq3kLBBW4TGxz021/qFWdfa2FzPXuWkaPN43I
PR7RIvLA7Wn1xzEUYoWCTrHA1oc+iHIwgn1Gisr3dzxVl3ouIEssExI2fULWb/8U
6MjMbiAXkqKXJF9GP7ugR1oyf9Ia+EV+XwWy0h263ozE+LdoqcBRtobGEjMsW/lG
VhUonqtHTK4KWOq7bew5fEBs52y4KA==
=AIm3
-----END PGP SIGNATURE-----

--7d2frku4wfk7wjvb--

