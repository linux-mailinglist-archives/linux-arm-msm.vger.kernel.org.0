Return-Path: <linux-arm-msm+bounces-35466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A77939AB42D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 18:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68DB4284FF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 16:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185D21BC06C;
	Tue, 22 Oct 2024 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbRZXmKV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8F41B654C;
	Tue, 22 Oct 2024 16:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729615110; cv=none; b=W1PmdDqtx4HdeKSoDef1XjEgyzCw9vXKgNGELXGoAXQ2hbq+rUzJ2srtqbUzgW2IfKxHdkHUpor0SBTjbiTH3qm7qZuRTlp3MpC8AGYRJcwwmMTvWazjNjoGHYYSL0jcixR5tChU0IV2eEelgCIVPuRyXvIh6FYcn+AtAUvFKmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729615110; c=relaxed/simple;
	bh=ulqYRIjW1aPwGzaGAX/uf+WdzbdIWEU2x21yuIdzgfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppJFg6FgUL8dxYXVRiW9EWBZpqKXRK9JiLxt5PSQULRa2ctST6JuQLGBiBGy7J+LGsKJkIt1/z1aOarWPEsTshHGC2cchhmgowaFYEvAONNXVbNzbNBAGdrsO22p5WnrN39sAKXRHDI6i74rK7Vr6Anhy+SedIcScWkt3ZEI17A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbRZXmKV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D73BC4CEC3;
	Tue, 22 Oct 2024 16:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729615109;
	bh=ulqYRIjW1aPwGzaGAX/uf+WdzbdIWEU2x21yuIdzgfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbRZXmKV+wOJmGRIeR/WpL/0dAdikIRBfGLNfjmwucW7/tCFuFw/drz7RQhUBibKD
	 Aau9hlgIHqhHJnY5c9ZcH8aVBOfsBurOFqGLkbDuY2CKtaLMAcT3NJefpvBea+8tPI
	 bxMl+p6VQVEXXf4epIFlM/4MOLDCM8hI/oLSVftS3U8WIXqT6KviMLv7mnRkARJH2a
	 yMZ1JvXmynA6p7uRnhb3f1BLOPzBwM6wgrr26iWn7XHeJWsjunXybDuX/jbhbtxUNg
	 dIG94kuJHldS1HC/s7ho+a5vSMkFCouFDpovyaZZQaAG3b3nWsjjeYolIC8GnQqP1H
	 C9ok0cq12mVzw==
Date: Tue, 22 Oct 2024 17:38:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Melody Olvera <quic_molvera@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Add SM8750
Message-ID: <20241022-encode-headwear-2c598eb97db3@spud>
References: <20241022064238.22941-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q2vCaW+jwCnGeI5p"
Content-Disposition: inline
In-Reply-To: <20241022064238.22941-1-krzysztof.kozlowski@linaro.org>


--Q2vCaW+jwCnGeI5p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 08:42:38AM +0200, Krzysztof Kozlowski wrote:
> Document compatible for Qualcomm SM8750 SoC IPCC, compatible with
> existing generic fallback.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Q2vCaW+jwCnGeI5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxfVAAAKCRB4tDGHoIJi
0sm1AP9biigBJYB6eSVuEh02+fLG3dX5hm0FMzvDZkJOQiALRAD+IoTeAOic2OBs
bGOnKH6vo8+eEFynaQodk7Lw8jA5Vwg=
=5ZuV
-----END PGP SIGNATURE-----

--Q2vCaW+jwCnGeI5p--

