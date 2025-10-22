Return-Path: <linux-arm-msm+bounces-78362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BB0BFCDC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 574873AEC0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4085334D4EE;
	Wed, 22 Oct 2025 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="a6BbdlHv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747F34D4C0;
	Wed, 22 Oct 2025 15:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146648; cv=none; b=MnhzE7wddzR9FqTNdc1yXOFrTxCox/qfS1MDjjhwoF9Qqdq6X+dMvs2UHfziDin66LV6EkeRoP8DFinJI12hbIXAlBvSpmaLM1SXON7Su6zuGRh3OPDgUAM6f/n6bhfj+VrFM3ub/l5VYg122ZKFarl6jU0J79uzPlx25rZS4iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146648; c=relaxed/simple;
	bh=ThRd0Hju/WZnbhScjxedBEnP2SUfJrtCg121y8iJWjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAVVHOLimUH8UYD0mZokkFSE5b0m/dMm69QpXiBpCeMMM2RpDvKokWC80AZmQzekPlhUACgjJ2gKxNaDXU3gOAlqSCWUDMKwje9WloXV+4znjYYeunnSZo4IZViGQMAaUJ8O66X64ZjquS9w7UCeHSy+OZFDtqjTJRGVtptV8mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=a6BbdlHv; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 038E61C007C; Wed, 22 Oct 2025 17:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1761146644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eJqutQCEseZmc+xUcSlPQmiSVHrbxJtl/0hVLXSHIwI=;
	b=a6BbdlHvmBCjB5NgnlCGRF+qOX3Q1KSYsbihDUNBiFwQffoTwXntJq1qGa9vEzHQPeP6x/
	tvyIFosHYU3pV0e8kOW7npD6lC3VSQkGTGTGOnfuOPqjJKFyRH0c6Mp5mgxrJOMoh/4jDx
	xgnEnk6tHg8Zm3ErFdcz8YYEeTSS1Gs=
Date: Wed, 22 Oct 2025 17:24:03 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Alexander Martinz <amartinz@shiftphones.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB LED
Message-ID: <aPj3E8eCeBMlS94Y@duo.ucw.cz>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-5-7fe66f653900@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g+KvS9tOZmfpBOHV"
Content-Disposition: inline
In-Reply-To: <20250930-otter-further-bringup-v1-5-7fe66f653900@fairphone.com>


--g+KvS9tOZmfpBOHV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2025-09-30 16:32:23, Luca Weiss wrote:
> From: Luca Weiss <luca@lucaweiss.eu>
>=20
> Enable the RGB LED connected to the PM7350C (PM8350C).
>=20
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

Thanks!
							Pavel

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--g+KvS9tOZmfpBOHV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaPj3EwAKCRAw5/Bqldv6
8sHiAKC5oGt3ydk/2sDKpMikdwc4WVX/nQCfXaX+7lyRN6UbBPxbFMQvrOCVJk0=
=IIpo
-----END PGP SIGNATURE-----

--g+KvS9tOZmfpBOHV--

