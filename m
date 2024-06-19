Return-Path: <linux-arm-msm+bounces-23252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C5690F59F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4B1A1C22FA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AEE15696F;
	Wed, 19 Jun 2024 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kB4x14j4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61BA15574F;
	Wed, 19 Jun 2024 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718820035; cv=none; b=W/4EOYh6yixDhBwu4hJ2uDjkfjxQilbUL2bYRXPCAcCvzbBd0XBqpzQWVoQ8TceF/3kGYvqGcp9OFWNQ0A9BZHbrZzqDPsHeG/Sqwxyj+HRZzYk7Lb6t5Tz3ou3lNkpZ7bYlfaQRj8S0pY7EpnpDZrmPYZ7WDGYgubbagGe/MdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718820035; c=relaxed/simple;
	bh=37mjy5yVqXRHkWjOzmaL4AQ0ULI3pbZHbuchhXGWk2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZpizFFLsGXfHZwI+0G5/Rv97aszyESJFctLXRSZ9dRYY6x6r6mdu6yRCn4mLHB19HJ6/5IQ4ebQkiar48qmN1ZkZ+7vaE1FxGAH1zUzTYfocZhpXE+rlpaosh+8xvJ04IkxWWS97Y1sAV9fIa5qXlf4BQK9E7trVrmzqtvlmB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kB4x14j4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713CDC2BBFC;
	Wed, 19 Jun 2024 18:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718820035;
	bh=37mjy5yVqXRHkWjOzmaL4AQ0ULI3pbZHbuchhXGWk2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kB4x14j4vR/tXG863iaez+td+23qfDGIXXwBzO95fgOcN/WDYbD6iTLqeG5mfHkOr
	 tRpK8p9o/pYKUH1t2/uSNaVsni++x4+yZ8TqpLeSvcHGuWUtYgf8mQwBCJip+Pfixy
	 ZVVVdFbAXz6orMYTTjc4TnRo7Xx2o796dhAz+ghIv347AO0TurCDSKbCYPskCKceCl
	 q+da4duPBHB8LL+dB+KTdUWNj6ajw80aVY1Sv5RjRyeMuuQ8197Wj3xDm3daeICHyy
	 O0eCEKg36IoitfAVntqOdAC7T6ovTnJNpxx/r1WsPtoagiLRC1hBIAGMx4nT6MvHXj
	 D6iTmhj8PGf6w==
Date: Wed, 19 Jun 2024 19:00:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mukesh Ojha <quic_mojha@quicinc.com>
Subject: Re: [PATCH v2 2/2] Revert "dt-bindings: cache: qcom,llcc: correct
 QDU1000 reg entries"
Message-ID: <20240619-commerce-sustainer-e1372304280a@spud>
References: <20240619061641.5261-1-quic_kbajaj@quicinc.com>
 <20240619061641.5261-3-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VG5pAYf59PjJ9GHT"
Content-Disposition: inline
In-Reply-To: <20240619061641.5261-3-quic_kbajaj@quicinc.com>


--VG5pAYf59PjJ9GHT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 11:46:41AM +0530, Komal Bajaj wrote:
> This reverts commit f0f99f371822c48847e02e56d6e7de507e18f186.
>=20
> QDU1000 has 7 register regions. The earlier commit 8e2506d01231
> ("dt-bindings: cache: qcom,llcc: Add LLCC compatible for QDU1000/QRU1000")
> to add llcc compatible was reflecting the same, but dtsi change for
> QDU1000 was not aligning with its binding. Later, commit f0f99f371822
> ("dt-bindings: cache: qcom,llcc: correct QDU1000 reg entries") was merged
> intended to fix this misalignment.
>=20
> After the LLCC driver refactor, each LLCC bank/channel need to be
> represented as one register space to avoid mapping to the region where
> access is not there. Hence, revert the commit f0f99f371822 ("dt-bindings:
> cache: qcom,llcc: correct QDU1000 reg entries") to align QDU1000 llcc
> binding with its dtsi node.
>=20
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 +-

I assume that Bjorn will apply this, I think I'm probably "meant" to
apply patches for the cache bindings dir, but never added it to
maintainers. I think Bjorn's been taking these via soc or w/e til now?

>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Doc=
umentation/devicetree/bindings/cache/qcom,llcc.yaml
> index 192911696010..68ea5f70b75f 100644
> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> @@ -67,7 +67,6 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - qcom,qdu1000-llcc
>                - qcom,sc7180-llcc
>                - qcom,sm6350-llcc
>      then:
> @@ -132,6 +131,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,qdu1000-llcc
>                - qcom,sc8180x-llcc
>                - qcom,sc8280xp-llcc
>                - qcom,x1e80100-llcc
> --
> 2.42.0
>=20

--VG5pAYf59PjJ9GHT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMcvwAKCRB4tDGHoIJi
0gVzAQCm8ozhkPgAC0dI/aBjyKIYtOYN5xCBkLYQAB554VCqFQEAy7dpuQpPU/PS
afYuoyYXMTUkhc7/HdgMjFlHFZGeVg4=
=hOZ6
-----END PGP SIGNATURE-----

--VG5pAYf59PjJ9GHT--

