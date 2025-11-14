Return-Path: <linux-arm-msm+bounces-81871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EB7C5D5A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:29:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2141234A7A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9466315D23;
	Fri, 14 Nov 2025 13:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="An0Ki4z5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF89237707
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126688; cv=none; b=QLhk5eBx/2+g0C1/4d7FLIgG4MVy70v6D5KvsqfwJentJl71dI6APn85S+ACXUHF07xj3hHYVOw/uNtCzSis07Z0ksC/esNdJiAa+uEn+bKpg8rS8HO40KgR43Ug1qJ1QJSmwYWxn45yds/LxFaiCDxyi36Doh33nS/+iWormfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126688; c=relaxed/simple;
	bh=/MfNmCaMbBpwAOzkjJvB9GOQKWmOcsbFnthRP3WrP4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEfN12U8S85jkacYrDwaCDhfTfIYZJasGqURSkvjCeIZTluaIiOnM+nAPJgFJiDj3vMUUibWLhAQV/CzXbbBhMOxWsSAfcDkYYS44PT4OFkwCEgCv3JJF3KiQJAoyB1z9x6OrVPN/NNfTTfR7TTlOAXAbOOLJmFTFBVYMeJtVfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=An0Ki4z5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47755a7652eso14071565e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 05:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763126685; x=1763731485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9tFYx+r0LtpX/2l5hmodetJ2Wuc+Oih4VLt/Zf0jWOY=;
        b=An0Ki4z5M41xmXqsKse7t1kP32LyH7afmW0YlcG9Klz4WF2Qx46YDfpOj9RcO8CIW9
         f8efAj6aNHro8mPQWwq81DAj64i0kZRyu87XRwFl0qsvaDUW0vE7DzGLHl7CTqkpF8cB
         RBuTx/0HmQ+ZYpJotrbnDXqLaCZFTiycAX58s0n649VTxK2Lw1+OmXloblDS4EynSQeh
         zYKoVclD7t4CU9KkLLfS4mJ4oK49bGhGV6eIqqTlPrKW/uKBy3IvcxdrDTU1Mc6NblsK
         ByrgavWKyOE8tH68P8SfojNr4pMgMWJrBUDZjexZwzoxjXBw2o2kLowBzdJ/f4HwwtK3
         SFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763126685; x=1763731485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tFYx+r0LtpX/2l5hmodetJ2Wuc+Oih4VLt/Zf0jWOY=;
        b=SQgFNM/QHnn0E5rMWiAFlhtNuIklAf24mq6bkBoa8ceahUH95xTs83LBJVdMGkMZ82
         jyghqwR+DFUjnh9Pvhz4LO41hunGy6AbpF2j/CjOgsDIev6DAOsB0sPZI//BkY3qUR7r
         XI28cWU4YtWCfFkGZw1clH1y2X4AjT5mV8SNwM2orfC+Ivrx0Z2Bn7cvA5KnQ3/Sa2e2
         JEzCxJov+4xvyrzXHiN9hZjrfhJar5MAQE8i6Ns6HMxvACMr8LS813UNQfphsOfycSEY
         FTT/ipM9R1PZ0iHgs63EF9L9xf1UO1mfj95g1waTvFOi6N08CPuJCjJG5DPOmKuo7+v6
         7TLw==
X-Forwarded-Encrypted: i=1; AJvYcCUCjOVZeI/DohOLnZQcU9H0DuxVdYRY61TSJTzcV9lGxNkSwcJ6XOkMNt5tCjiHlOxGiLBWv/eLl+5w41Ro@vger.kernel.org
X-Gm-Message-State: AOJu0YySl6Gn+W8457rzIn6JybrdB+KTWfflEaAQUQ7kedJR+8L6JwnM
	x9iNM6B+1TAACpmSxE/vWm9EZ7luq7jmKnEoytqDJyMx33zF++MLeigk
X-Gm-Gg: ASbGncuCud4oIKwxZpgryW3QcxKuwq9ZLIAk96NNzmsR52XTKROfaBkDVNt83bCqy5c
	DG2l7pJBUbOez+Oz42IIm5fLaIWU0CdxY9jaUN7DVcdKm3djVHuOH9BmV0W02OxmdLLmtU2tl9I
	7q17Xbg4eMUYxHHNb/8oTC4hUwXrnDTw94/1nd4CFB7Cu95dpQEdKRbAmGtovL60ieooDQukMmI
	P8nPsGrN5zemiROklfxhnppbSNZLIZ8MwKbxbF2SQL7iF/EG2eK5g0kvNa7P7QfYTgf2sf5dfCz
	D6RXyMMY5ZWQlXdppqSvA86R7XqVPWa/m2i43uiSi/R0UM4NuFz7mD1a5AAO0Q8dnd82YwpZ7O7
	Sf1jhoSgcnUhIm/gvfJZPplSa6xTGPoF+LRsc/VTDiLoRcTIQ5MOv98oLBU1x7Os3QMlk0/3WWW
	eyhY/3DiFPjH6we69RGygPeDKj6eL7ooM6gVEP5LlyYen2l9fxMJyxZfopzOF+QVrcLYRlmlmbQ
	w==
X-Google-Smtp-Source: AGHT+IGGro6Ab6Q6hQTIcaBq7Nzqv7eihH1X2JDeRvd7W4sKRsUWsSzI35q89svHlSq6wH7pBHiBUw==
X-Received: by 2002:a05:600c:1c20:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4778fe4f635mr29777265e9.5.1763126684877;
        Fri, 14 Nov 2025 05:24:44 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb454a6sm46271815e9.2.2025.11.14.05.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:24:43 -0800 (PST)
Date: Fri, 14 Nov 2025 14:24:41 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/11] of: Add wrappers to match root node with OF
 device ID tables
Message-ID: <kqtjfqkzz3lfnpg7lo5m4dctowsxqxtlcdtktoatpze3hr3tue@ku6p25skb666>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
 <f949c2a6-df24-41bb-aac7-f5567d03c5f5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ntn2juw5rgeaer4c"
Content-Disposition: inline
In-Reply-To: <f949c2a6-df24-41bb-aac7-f5567d03c5f5@collabora.com>


--ntn2juw5rgeaer4c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/11] of: Add wrappers to match root node with OF
 device ID tables
MIME-Version: 1.0

On Wed, Nov 12, 2025 at 12:52:48PM +0100, AngeloGioacchino Del Regno wrote:
> Il 12/11/25 11:28, Krzysztof Kozlowski ha scritto:
> > Changes in v2:
>=20
> Note:
>=20
> Looks ok based on code and based on testing on the following platforms:
>  - tegra: Jetson Xavier NX Development Kit

Thanks for testing, but Xavier NX doesn't run any of the code changed by
this patch. soc_is_tegra() is a legacy function that we need for DT
backwards-compatibility and should only run on 32-bit ARM devices.

Technically there's one case in drivers/soc/tegra/flowctrl.c that runs
this on Tegra210, but it should probably undergo the same treatment as
the PMC and FUSE drivers. The code that needs this is only used for CPU
power management on 32-bit ARM devices.

Thierry

--ntn2juw5rgeaer4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXLZkACgkQ3SOs138+
s6G/cA/+IgP1K3OXIF03hJ/xSNn2a6/dnr1TTFLAUI6Ge13aBNVPxKCDqoxLZCAt
pN2vtjYNWX0Z80+tnCpGdf961hS6OY28OJmABKNotQvlrnzBSn8ggsZ64UlAka80
SRr74Do7F4bWqWrBHEDD4FRjlYR0OVy2/s0i5Zcavhixa1bqN/F9gTWT+kKItZOE
TcV+O8gQF/op9NSShu+oXIZFRcPKdugCNN8w77cE/9B/0o1iII9DzX5uzFYK0Au4
M7rAxBiHHh71czN3ts79Mcyinj9kcC3zGq9wtusv3N18sDRqwZCp+mPP3Y8Up0t4
OotwMzxf59FsoSpNDUh/FgkCNoDoDXbajVzHTig9OQspb/nNis+P5Pbw7FIZb8Q2
3jq8uRvMP3p8gc2pB7nnyQoC6ToofIcHlnhbW0oi1Fi0HovauoN7Vb8/gsJDWY6c
hBe4ABpghzhh0VXFf8CM0vK2MonZYPO0BTyDguUr4nx6QGrrLnBG7S/B2wvaIzgs
UeyUPjbgEhQVdyWALBKf6aK9IXi/Wp+s9w0XJ7qG14q665MqwxIXXIo0ZOIiIe28
e+Ajuapyv0juG6x+mVb44mHgWqZ6bquDTegdCr9PakfF4rDYnDKAcdzOM7/y8/UX
FXAgwJiScvxp/LO7D70bNXMPtYPQ3TVxDJu2I5128N5iNtuaxgE=
=vxrn
-----END PGP SIGNATURE-----

--ntn2juw5rgeaer4c--

