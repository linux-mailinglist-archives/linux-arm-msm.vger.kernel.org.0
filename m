Return-Path: <linux-arm-msm+bounces-1935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CECBE7F8A0F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 12:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B5E41C20B4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 11:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66467CA43;
	Sat, 25 Nov 2023 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzQAqc91"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373882106;
	Sat, 25 Nov 2023 11:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A55C433C7;
	Sat, 25 Nov 2023 11:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700910378;
	bh=a10BKOzNP25vy7u3Wr900/nhqUYn6t0HQHvCMFsPHXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GzQAqc91AzXTfJr0YMNQk4Fb8ANi3UGp7ws1OpgA134zeMmi16feg/71FpWu/RRad
	 hgEimPRXrCBFQPja2QUhaktDDe0g3JTP7Lo6sH9/6GXqTybrAoNZWQgTPqocAWw2fR
	 xKpaN6KhvfkenJnRasNXc+kpv4jHsOpPhVY1FVzjEJd1tKA3A/K2P7enxMj4c18BuT
	 tP1yhNA8lq5FHA/nmG1RTwfrAROJVllv6hM6Zy7Y+WDjCqFF2YaROv+/jgV6bjtTmH
	 4JDccMs4Puqv94kUHM+nK/wfz90JM/BkkbRmxra8goAAA6NCb6to4+fU9GVktRb6RR
	 yv5TIhyGpq7aQ==
Date: Sat, 25 Nov 2023 11:06:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Luka Panio <lukapanio@gmail.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v10 1/2] Add a compatible for Xiaomi Pad 6.
Message-ID: <20231125-scientist-autograph-a574e56ea955@spud>
References: <20231124212732.731419-1-lukapanio@gmail.com>
 <2023112529-fetch-unwritten-bdbd@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZAE8VA0RYnei4ICF"
Content-Disposition: inline
In-Reply-To: <2023112529-fetch-unwritten-bdbd@gregkh>


--ZAE8VA0RYnei4ICF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2023 at 06:53:05AM +0000, Greg KH wrote:
> On Fri, Nov 24, 2023 at 10:27:31PM +0100, Luka Panio wrote:
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Luka Panio <lukapanio@gmail.com>
> >=20
> > ---
> > v2:
> > Update commit message
>=20
> What commit message?  I know I can't take patches without any changelog
> text, maybe other maintainers are more loose?

It had one when I acked it.

--ZAE8VA0RYnei4ICF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWHVJQAKCRB4tDGHoIJi
0u6wAQDJyRyc1NwXIbDW0Y1VdQakWopuCXfjrBNh84wm0Zyt7AD/QNDxBjigVIUH
AoGUgSjTd+6ukjv5UhZUnzuMhVXs3gs=
=xDZq
-----END PGP SIGNATURE-----

--ZAE8VA0RYnei4ICF--

