Return-Path: <linux-arm-msm+bounces-73913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BE3B7E801
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A13546772A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 12:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D07C302774;
	Wed, 17 Sep 2025 12:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xl0pRa4B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4ED7FBA2
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113250; cv=none; b=RPnqB7A+KJgBqeRfkPGIzIlFHIKwT+3uPHPPc0HN9LA6Aw5XFnvMBpuGkUWAbsx26S3ebgSG5vEjWqAmLODy22e8993mBb+BM/MLC4Wl0c2BkHj7DKZ1omANH3Qd4t6qCjbuPB3C3p/A5fukqpIDmoAlVynGzA959W3Mf3ndM7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113250; c=relaxed/simple;
	bh=OpFjrz8zqyAOuDDEavL83RJ8Trpvvw84g1TSZSRsq/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQL20+VVdA0B+ZEpjHvj5SU3WjqSBCSL1qhlxGaOiiJhymEKp21HHapnkNneIoUuEijdqgt/suiGx1KlriHMFlMaqbGaPa242bD4upW1zxH+f+CO/pekNO97nrxtRGE4yw/Ps75EVEWHMd8TgEAjvJ4ZG/i7avxXuHvk94mvJLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xl0pRa4B; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b0787fc3008so937264166b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 05:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758113246; x=1758718046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OpFjrz8zqyAOuDDEavL83RJ8Trpvvw84g1TSZSRsq/o=;
        b=xl0pRa4BIirS0C0dFTJ/dW+xk8U5t6HlNa1G/ySOuv+k0h/p7O4dLGjFTF/MGExHAW
         TPzml1vDfNLBlCqwa/UBJwzmgP2Sdy83nOUA8zBHQtqIazy0D2PaM2A3RPhLlXcr/BKr
         DG2HJ6bFsq2b6395UWCEjRYKyqmw0xFNcBzKYnfxRYQbd0uyglQZ98AtCHVCL1qQm3gz
         tiTvJPReFqvyGJKGAOmnPEd4bnpdA+9+pFXcclg3XCyYKXe+SiAH4Jnl5J28WPE5DEUs
         n0IPqIvc4z9rDp835TH3OafrV66TqAtQBZeChXtqORbqLLoDXt4HWcy1vXkfPF6NX6fh
         lpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758113246; x=1758718046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpFjrz8zqyAOuDDEavL83RJ8Trpvvw84g1TSZSRsq/o=;
        b=oQuWDsZAfO3jaXi1yqI8XFHzqx9Saao0YJ+TzL9L/itk+j6p6gBJsvVfqKofpFE3as
         ibGGMVUr4hweDzFtNV4Gj7ZtcJLZJjpfNTwWEP8WdiI6AaCDCwIDxH9FmXt/Ec5REVDG
         7dH0BvIrHmHS8zgyVx0b3CJTDoi1FZVJa4OLO0B2MlgWwS5zOBjg86sWaF1wKFNEn+JW
         bqiahN+QvXEv3+zxfr0HCT0/54fCXZad82xD3Upsx8MGvz0ADt5RSBB48MPYSqMdSlk1
         pk11ExYggAwi/FX8BbqrA1QM/8G0liQt+dkJp6H24lIFR8upgrqHLtAgIPxkJb2dMwuJ
         nj6A==
X-Forwarded-Encrypted: i=1; AJvYcCVmyRMBPdV225lG3UAIcCt2+ek4MVzXYwR98GujWw5pb2X2SCWhrpmzCOg+WxnLpEnv7tsIgAtIY1FKUfBr@vger.kernel.org
X-Gm-Message-State: AOJu0YwuS+7pmgQ2Kwfam2S9JRflic2p5DyYOC3Uq6fcIuADt+lyJLUM
	ZfuPD8ITXV3QK/pmrJ56XTzvNrtLaCjJLvVhBfOjsNvSYdWcOAyjVtJOmQwSxvr9160=
X-Gm-Gg: ASbGncvQQ6LeyOc/s6049VrCDrcvG5KVTAyWHTBUPjmgbJxBUysZGFn6dQk4IpsXDhg
	oKCbBSWk24N4GJ9ECcgTca01lssSINP+LYFz2LFls8wSkTb2vVhsTJnrHtAYbpeCphv7xZqbibb
	l/yPl6D9KBnfTsuxNVfBSQkmlpdZvM+VAJP8/ny/CVh9B4mrRLWzRDd4OD6QCRs1duk3OGJRYNz
	R2kgdLVWXE345AoHTP0WfJlN95y6e1N07pQESxmqrsoQlowG77bAcLiCGMSlD57axZpAFSXlbtl
	m9sEtIfFdsSPvnPKz+2W7PEnrzFayn35SjE7zouGxQJFPp8u3lapDXthdIIdHCVip5LMFQ56jI1
	WQvozKYxbVh33b4ai87nsWJ40tkM=
X-Google-Smtp-Source: AGHT+IHgG+feaLFS5lYK61xigE0As4f8SIEZukBQyUiZyyvMqVLGwJC7y1Bl5VWs3fMe9SZIDZZJTw==
X-Received: by 2002:a17:906:f591:b0:b07:c905:af33 with SMTP id a640c23a62f3a-b1bc02f669dmr228527266b.65.1758113246285;
        Wed, 17 Sep 2025 05:47:26 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b30da289sm1339567666b.17.2025.09.17.05.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 05:47:25 -0700 (PDT)
Date: Wed, 17 Sep 2025 14:47:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, sboyd@kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	srini@kernel.org, vkoul@kernel.org, kishon@kernel.org, sre@kernel.org, 
	krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	kernel@collabora.com, wenst@chromium.org, casey.connolly@linaro.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/7] nvmem: qcom-spmi-sdam: Migrate to
 devm_spmi_subdevice_alloc_and_add()
Message-ID: <er7dkmzutsu3ooegeihjzngi6l3hol5iaohecr3n5bolfse3tj@xeedlx2utwym>
References: <20250916084445.96621-1-angelogioacchino.delregno@collabora.com>
 <20250916084445.96621-3-angelogioacchino.delregno@collabora.com>
 <t3uk3k4h3l53yajoe3xog2njmdn3jhkmdphv3c4wnpvcqniz4n@opgigzazycot>
 <aMlnp4x-1MUoModr@smile.fi.intel.com>
 <mknxgesog6aghc6cjzm63g63zqbqvysxf6ktmnbrbtafervveg@uoiohk3yclso>
 <CAHp75Vf7KrsN7Ec9zOvJoRuKvkbrJ5sMv7pVv6+88tPX-j_9ZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ah6qgcyytq6i6rrs"
Content-Disposition: inline
In-Reply-To: <CAHp75Vf7KrsN7Ec9zOvJoRuKvkbrJ5sMv7pVv6+88tPX-j_9ZA@mail.gmail.com>


--ah6qgcyytq6i6rrs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/7] nvmem: qcom-spmi-sdam: Migrate to
 devm_spmi_subdevice_alloc_and_add()
MIME-Version: 1.0

Hello Andy,

On Tue, Sep 16, 2025 at 07:20:20PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 16, 2025 at 6:11=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> > On Tue, Sep 16, 2025 at 04:35:35PM +0300, Andy Shevchenko wrote:
> > > On Tue, Sep 16, 2025 at 03:24:56PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > > On Tue, Sep 16, 2025 at 10:44:40AM +0200, AngeloGioacchino Del Regn=
o wrote:
>=20
> ...
>=20
> > > > > +MODULE_IMPORT_NS("SPMI");
> > > >
> > > > If it's exactly the files that #include <linux/spmi.h> should have =
that
> > > > namespace import, you can put the MODULE_IMPORT_NS into that header.
> > >
> > > Which makes anyone to import namespace even if they just want to use =
some types
> > > out of the header.
> >
> > Notice that I carefully formulated my suggestion to cope for this case.
>=20
> And I carefully answered.

I tend to disagree. If that anyone only wants some type from the header
but not the namespace, the if part of my statement isn't given any more.
Still your reply felt like objection while logically it's not.

> Your proposal won't prevent _other_ files to
> use the same header in the future without needing a namespace to be
> imported.

Oh yes. But that's true for every change: If you change it further you
have to cope for what is already there.

> > > This is not good solution generally speaking. Also this will
> > > diminish one of the purposes of _NS variants of MODULE*/EXPORT*, i.e.=
 make it
> > > invisible that some of the code may become an abuser of the API just =
by someone
> > > include the header (for a reason or by a mistake).
> >
> > Yeah, opinions differ. In my eyes it's quite elegant.
>=20
> It's not a pure opinion,

That's your opinion :-)

> it has a technical background that I
> explained. The explicit usage of MODULE_IMPORT_NS() is better than
> some header somewhere that might even be included by another and be
> proxied to the code that doesn't need / want to have this namespace to
> be present. Puting MODULE_IMPORT_NS() into a _header_ is a minefield
> for the future.

Well, for a deliberate abuser the hurdle to have to add the explicit
MODULE_IMPORT_NS() isn't that big. And a mistaken abuser won't explode,
just generate a few bytes overhead that can be fixed when noticed.

In my opinion that is an ok cost for the added elegance.

Best regards
Uwe

--ah6qgcyytq6i6rrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjKrdcACgkQj4D7WH0S
/k5EEgf8CdFx6+6iEV1AE4GeSJAKaBL6T9A2o7N08nLq8lg9b0873yxBoHXcU5fC
aJjF55sEwR98xGntE7kk39pH49RCG8ugwvBfJUnq75LJiKU4gyhg9P3OPFnLShiJ
I6m5bqGNDlAwq3dSuYSiDSr/4wi/Rq4mPKqRZoCT0WHQz9CWes6CdQPuRMSKYeJF
5VvswQqZGx5s73s0oi9UinWZ1/t/tX8KTjVeEgkmosNDtXb8rSwQbmfIUqnuCv0m
ZjvuFwKtei8Q90Ro1LSW+QP0R1bN1ydWluw6cGH65qE7Yqpb/P49Yupan3C0YEsr
nJJjRh4HIIADYdzeEZWvvrOcN8LC8Q==
=NvWc
-----END PGP SIGNATURE-----

--ah6qgcyytq6i6rrs--

