Return-Path: <linux-arm-msm+bounces-73748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F0DB59BCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 608B218993B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93713451BF;
	Tue, 16 Sep 2025 15:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fARFydGW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601BF320A38
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758035474; cv=none; b=W7qgQOJ3Xo83pkoOw3myf0QlgjaMTc8GQyQAKZqF8QJiJrMvRF4GdKLOUAoac5bkfYwfwvd3x/+tBZfOS2FvDSC7jdbIA9sYSJ+4WvL837scsZBZ3RmeqMfJIkxj8+gspGGOjXZlWeK9HxwAWchJIXAGqBXDosSaQgRVdUxSSxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758035474; c=relaxed/simple;
	bh=rmOaDep9iDvIkVV5SOO3btdvNEg4fjn3ZIsqxvgs9l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTRPbHsS1xNn5HWdY9IXtGAyLDqyzCSydp93CQbWzLHvzGTlfjtjg/S0+lsHh3KJWRvlybRg+WqonwUxxpurof3HuJx063/V+wLb5f1ZxhoXrUNTmTndUOjkUVnW56xSV3Pl8f43dm9Lm8nkuy3o9Eb59pJ/EzKUpgzZe6YEgQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fARFydGW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45f2c9799a3so17147095e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758035471; x=1758640271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rmOaDep9iDvIkVV5SOO3btdvNEg4fjn3ZIsqxvgs9l0=;
        b=fARFydGWUDs3Y1yIu9PeJvgd9JeExzEDi0HEQ3gzKF7bRe7OC5iIjm8aeOVBS1lJ73
         k+stB81Cnwgt0KMjGGxj1F28HgeCc6wyYirwWIhI/CBqrGJevPQ9v5sMo6yCM4wyEhB7
         xBzhqVMyCwgpc6Tm9Nz7dtOVPIKwq7IyRRQDYrq2uvoGtklHivAzYuD0zz1uOBtCtk7i
         2uzEExAYgGUQTPx8LfDfjAUF6QxieX4CpS0Mrnt1ftjM+bb+mcfvRJaKFD/kCVD5yWcY
         W/JnSUvYy2vIOACce4BTthGLdKKjt4Nsyp/20TM8aZ/doWkpdpY9dTNc3KxcZrFSwUSO
         BW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758035471; x=1758640271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmOaDep9iDvIkVV5SOO3btdvNEg4fjn3ZIsqxvgs9l0=;
        b=FbujBaZYBYKInddSvTuSa9olaWd5qVq4UMmq67xwFdfOVNLtNhmznVKTwLvm25gdEk
         HbguGwfz5FlPkSsx6jMQ4u+gq3cvnaf5JeJA9TcqRFmKtb88od3G2t57a2blp6B1yixz
         oTVQtxvi48UXSmtBZmvQPwiIceIAR5BekbwVRrd/yKE0zqBJ1Jv7E7lVvUtQ9ghMOz7d
         yo7a1mXXZybg4P4UhyiMgRrFppT08QZ35vjTxMxt8inmSP1HCxbTUZHgcRa/QqbplGcV
         CcuKwbL0iC+cCFHRTSJFD3MP+yyu9HRBSUwFzI/BOOF/XCPLLjQH+UyhMibHqBp4tKvn
         KY7w==
X-Forwarded-Encrypted: i=1; AJvYcCXz2a4K8Tb1ai0gIapwptA+wDYC8xE8GFHCSMEFW86/9vraq+QF8vqhWLl2wSV0K1wrUc5aREnyX7hq/anB@vger.kernel.org
X-Gm-Message-State: AOJu0Yycd+RByqL3kpqB0TMsaS7eChzFr3IjmhNgTZXurVISOEVGDddD
	pQmG0uFzeMn55z7qjbTSgDwdJWGFo/oNfgNR/2UvuhM6i4CHY/Nq97LfyCwOKxLGX60=
X-Gm-Gg: ASbGncu88TOx5XAle98pEB1kCrVhz9JMD22vp70F4c/aaoFSDHhekmVBrWqtMQe6g3L
	LkxfUauqqahzeGRuZVQwPoDwDhoiXs4+1yJ/cKkLuyL7qYnpuhQAJUwJFWWKOgPejR9SfTlDOx2
	SQ4fiSDzUXlX/AoLQyqYFft0rlQryp0pGeXlugL4GXwKHDJ9JJo2N+fAANBTogBIanepdsI/z7G
	76o6dJCS1ATwJEnA7mLqgSCgHr/tnJfI++NOAbYuGzH7nsZ//2BvdJIK4/wuZELH1r8J76+QAzU
	uCdPq9eDuFwpKiS7mE1fD4vmJOhl+A1H8IRlSuilAF5vBZvcBCq+JJ24GOxepdThGnorD4mDHpc
	V5sPppprt3mYviLj6MduuJhVDPv8uyPhcmETxbSCUMfyX5UmgKf0bYtvDT9zEePnV
X-Google-Smtp-Source: AGHT+IFjwopgYVPo6VKMtYSKedXcVrli8pwqzXpfa37U2o4471Lcz0KQL5QMmQQhJ8xqhKe1X6WGiQ==
X-Received: by 2002:a05:600c:1992:b0:456:fc1:c26d with SMTP id 5b1f17b1804b1-45f211c8437mr143544675e9.2.1758035470631;
        Tue, 16 Sep 2025 08:11:10 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e01578272sm241914915e9.9.2025.09.16.08.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:11:09 -0700 (PDT)
Date: Tue, 16 Sep 2025 17:11:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	sboyd@kernel.org, jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, srini@kernel.org, 
	vkoul@kernel.org, kishon@kernel.org, sre@kernel.org, 
	krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	kernel@collabora.com, wenst@chromium.org, casey.connolly@linaro.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/7] nvmem: qcom-spmi-sdam: Migrate to
 devm_spmi_subdevice_alloc_and_add()
Message-ID: <mknxgesog6aghc6cjzm63g63zqbqvysxf6ktmnbrbtafervveg@uoiohk3yclso>
References: <20250916084445.96621-1-angelogioacchino.delregno@collabora.com>
 <20250916084445.96621-3-angelogioacchino.delregno@collabora.com>
 <t3uk3k4h3l53yajoe3xog2njmdn3jhkmdphv3c4wnpvcqniz4n@opgigzazycot>
 <aMlnp4x-1MUoModr@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cy5a22gjj6esxnjr"
Content-Disposition: inline
In-Reply-To: <aMlnp4x-1MUoModr@smile.fi.intel.com>


--cy5a22gjj6esxnjr
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/7] nvmem: qcom-spmi-sdam: Migrate to
 devm_spmi_subdevice_alloc_and_add()
MIME-Version: 1.0

On Tue, Sep 16, 2025 at 04:35:35PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 16, 2025 at 03:24:56PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Tue, Sep 16, 2025 at 10:44:40AM +0200, AngeloGioacchino Del Regno wr=
ote:
>=20
> ...
>=20
> > > +MODULE_IMPORT_NS("SPMI");
> >=20
> > If it's exactly the files that #include <linux/spmi.h> should have that
> > namespace import, you can put the MODULE_IMPORT_NS into that header.
>=20
> Which makes anyone to import namespace even if they just want to use some=
 types
> out of the header.

Notice that I carefully formulated my suggestion to cope for this case.

> This is not good solution generally speaking. Also this will
> diminish one of the purposes of _NS variants of MODULE*/EXPORT*, i.e. mak=
e it
> invisible that some of the code may become an abuser of the API just by s=
omeone
> include the header (for a reason or by a mistake).

Yeah, opinions differ. In my eyes it's quite elegant.

Best regards
Uwe

--cy5a22gjj6esxnjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjJfgkACgkQj4D7WH0S
/k5bVwgAg+5I7FGikPiLyM6nJF2xieob+ruwdkRFDohxfb7PQp4RA3i332VcbQXW
uPoXcpVKI3rBmxcqdXznCt5nec30ko8fgwZAb31BtOXwOf+VPlXIz5wDU5CdFQs+
35qgGyJnn48yhisyQx02GgDm/7esFho8zJOIaKvERuPGZ391HpLD4+z6Nxavy5JH
ZgxR7eIMcsnuF9vidUZhFi25abs7LFmJ72MF4i2N41OEdA/SMG9rpkEFBk5moBvK
qRRqVUDpCMxyDH6MddhP5CmgVUiW+3ucV17tdWKlnjjxMJx5rFb8BJD+jZx0Iuo+
HRtugRPqfdauF5Que8FvEqOdkDDLIw==
=R2qg
-----END PGP SIGNATURE-----

--cy5a22gjj6esxnjr--

