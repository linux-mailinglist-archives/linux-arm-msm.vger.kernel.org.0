Return-Path: <linux-arm-msm+bounces-35467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7590B9AB433
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 18:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 294CD1F248A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 16:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2D51BC076;
	Tue, 22 Oct 2024 16:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUIuk7UP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE851BBBEA;
	Tue, 22 Oct 2024 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729615127; cv=none; b=nBhApeJXqnTJ0kyk8BbYXrlTPeN8/Gb/9PwIg53cBvHXRKOH1RhpV039mrY69wI1fHq9eHyNgtuypIVZAT12BiPaPf7RGeVO436003ooW+ypmaDRlX3jGV1DWHE6nkhLXbXtHbKI9r/e5+ZVoYMLGT4+zqnMka9QJVvgkMyJs+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729615127; c=relaxed/simple;
	bh=bM/fKg9t03Z4+zT0ZZhvnjUC5EO5NSRvfarBGK5PEE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQPqr2LSLGlcUVgChIsPsgZFzu/El4/3v69sY/PfUJ+pkUcYwu+TMCvm/+QBTTiO/4ySe6YU0wa/RAEMlPCYJeZor+hKfjBrlINPN2w6fsmN/3bw74PQp6TQr7isFu+TCz9taoId554TVey7V37XTr/Z3bIgUu04MINu19Vxrek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUIuk7UP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E16AC4CEC7;
	Tue, 22 Oct 2024 16:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729615126;
	bh=bM/fKg9t03Z4+zT0ZZhvnjUC5EO5NSRvfarBGK5PEE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUIuk7UPWwMa6IRSWKYNGnrJrzYBkFkD/Et/SKpjf7LIHMcLgCA08fc57dGzTD3uD
	 ANVxoZx/pLxjI4/KXK42OozB+sWoxZ/Q5IL+Pobnmi6e4fR5134PXvnF3o4pqK6NaA
	 No0hfG+ZZ/Rbm6T+1Ncb2piP6PZehKUX5H5UYIGz8nKrJVviv/YWGzZl7xzRH2YxO9
	 RTQxawWz0RYNVatz4K9Fbg2ZYqSOxhrURUrCJtlTT/7BJxmXbalbM79yb9fC9Xv1sn
	 XH/FnMNhWMrvyyFGvYkGfKB48v8hZGMsVCYh+rm6Uo7ijcTNFCLk9+6Fj36EqgxBmy
	 aFX7GKMv2jekw==
Date: Tue, 22 Oct 2024 17:38:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Melody Olvera <quic_molvera@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] dt-bindings: soc: qcom: aoss-qmp: Add SM8750
Message-ID: <20241022-backroom-blank-3dcda425f276@spud>
References: <20241022064214.22868-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5H/IGmsCSo61JaCN"
Content-Disposition: inline
In-Reply-To: <20241022064214.22868-1-krzysztof.kozlowski@linaro.org>


--5H/IGmsCSo61JaCN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 08:42:14AM +0200, Krzysztof Kozlowski wrote:
> Document compatible for Qualcomm SM8750 SoC Always-on SubSystem (AOSS),
> compatible with existing generic fallback.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--5H/IGmsCSo61JaCN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxfVEgAKCRB4tDGHoIJi
0uMzAQDN2CKEN0OjmkOuqVBR8Km3Kh8kjipV9ZaAV4iLaBBfSQEArIKTXFoG+Wo5
UV53SKOzDMMhlxsIh6xq9o0bz2S0Ngg=
=i2VE
-----END PGP SIGNATURE-----

--5H/IGmsCSo61JaCN--

