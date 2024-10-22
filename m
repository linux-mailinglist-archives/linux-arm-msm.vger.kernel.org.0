Return-Path: <linux-arm-msm+bounces-35468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 036BD9AB436
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 18:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A03221F24BC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 16:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAEC1BC07B;
	Tue, 22 Oct 2024 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cATx8RbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB021BC06C;
	Tue, 22 Oct 2024 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729615146; cv=none; b=AovoGxjPfGVkVL+33SKMUViztHUI4apvd4/dt8sljm/1WVJS09VBWKyNnrsnns6UmINgP8Rb9GXpkODUFXXxy2+XyHNYip9OYq6ILysZ8OdHGLKGH6NLGRdWQkaY5lPX7JadpNCRYd0U5JKW4ZGBYXX1Qe6S3OC0xCPiilB/F/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729615146; c=relaxed/simple;
	bh=1W0o1boI38T6xH20Op/FwrC5u2sfzoI2AuC5Ia4sSK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dntylIyw147rJS2TNn9Km7ic9TcFmoth4EZ2xwWE/gWasP52iKX9Tz4u6unykPc7Y3mU5VwagHiB4Ra09oDMVwEa/K84dLyUC7LNM/4hZ9BbLONXcySkRiuqo73bXd/J11cRH4dhVOzvy/MylDXLZzyW9SOBewmHExUxSKb7uKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cATx8RbE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0D2C4CEC3;
	Tue, 22 Oct 2024 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729615146;
	bh=1W0o1boI38T6xH20Op/FwrC5u2sfzoI2AuC5Ia4sSK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cATx8RbExfoeUThHzOi8DWG9VU3cqeulVOccx97L/ZFIcGxkEuHYALMnIOoa/vm0q
	 mZ3FcDB0CvoY50wm3SFeMa6apnFxsGcxGenmnGlTcupXzJZIQJ0pgUCppW/v0y8jQ9
	 MppPjcGoY+Wu6wgOd4sCx0BoY69uKJIhlI8Yf1J0gJzs7rbbc6TlslGQ+gG6ZcMUHr
	 Vkrqb9fsZZj44S0gqt1AiBX5u7GjqYDnhpSrjm/gPJGgxwNscjvFnfRg8ucyAhzxDS
	 e1XngucmtmPeWx27GKXzq90TqO4Yf5Eyg4eP9NS+y17fD/6dnsQjjCMPSaMZFPX2K1
	 jHQ6SClS4nypA==
Date: Tue, 22 Oct 2024 17:39:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Melody Olvera <quic_molvera@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom: Add SM8750 LPASS macro codecs
Message-ID: <20241022-duly-geometry-4b99f14926e9@spud>
References: <20241022064155.22800-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="am31B1u8bFQKB1sg"
Content-Disposition: inline
In-Reply-To: <20241022064155.22800-1-krzysztof.kozlowski@linaro.org>


--am31B1u8bFQKB1sg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 08:41:55AM +0200, Krzysztof Kozlowski wrote:
> Document compatibles for Qualcomm SM8750 SoC macro digital codecs (RX,
> TX, VA and WSA), compatible with previous generation (SM8550 and
> SM8650).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--am31B1u8bFQKB1sg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxfVJQAKCRB4tDGHoIJi
0jSZAP0QJ7geSOzEjOmNnbmf4W+1+y8wS1WyDR7QvS+ZDVpeLwD+Ip57APW2rAPD
pEWhF/+MYwNQicuWXM4RVDGzdCN8ew0=
=vYih
-----END PGP SIGNATURE-----

--am31B1u8bFQKB1sg--

