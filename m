Return-Path: <linux-arm-msm+bounces-22200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A526D902401
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 16:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 590FE1F224F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 14:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DCC84A4A;
	Mon, 10 Jun 2024 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMsgFN04"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C47824BC;
	Mon, 10 Jun 2024 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718029538; cv=none; b=MdkgsGYIUdlGu22cQ3l2t16BqD+pidGZhCqjae2DRvtTKA4F+i8IUJyZROlrTLcoDAjLnLqM4cePDtytIPeOPLBz37FP2lDDQ212t9OIOB4luZH5w9am41I+01VwYFuyQF9OnetenhEUTlHye9dHOJ3ydYIOVjTGsVZQyW90Qik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718029538; c=relaxed/simple;
	bh=2oNIHC1/qajiws6A5qnA832XS8nRceNwT6VYS3zw6hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ay8+TVbGiRvzD7KdlBLANJLWmNvlnPmDPPVKXu1heqvokmjfXaLj2u/l0ZDXHclUJGogNCpxVRUnhwtzWxfbya9KgkP/a/WPhDOwv8BCcTUA/6kp6RU5H1t7fkgU0FSZGVvJyf3q+/Ze5zvgxIQ4cKmJay1fI3mT3HvPIgfTiPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMsgFN04; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9743EC2BBFC;
	Mon, 10 Jun 2024 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718029538;
	bh=2oNIHC1/qajiws6A5qnA832XS8nRceNwT6VYS3zw6hI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AMsgFN04/6zYDUEgta/tqx/wvy22e6q2954Ge7IN7SZBJYplQ/VoYBC9o3ahbfNkD
	 88s0GBrWAYIRjnlmUCe1JpsucKPgK1A8Qcu7RkZcwVKUKyIBXHVaudEoKWyM2mPiwq
	 MAFfFovh5oDJOOLCGB/9RZvBxUmnDEBTk3wgFrYqdkADlME2kbjJuouPWhjozNjEYC
	 wvPvkNh3nwCk9e0NytDHcTFZRbqcm/jYLCjh7wzh6CBfodscXwF5x9Ftyooiys5Ixx
	 641yfrmnEdSaqlWxTvd8jVctvwYc/D8v0hFfyKyCsO5dVtp33mnl14l2zSNdtBr6nH
	 BCIA9iCtr/IjQ==
Date: Mon, 10 Jun 2024 15:25:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/12] regulator: add pm8008 pmic regulator driver
Message-ID: <ZmcM2v02IXHM-xld@finisterre.sirena.org.uk>
References: <20240608155526.12996-1-johan+linaro@kernel.org>
 <20240608155526.12996-12-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nDGQNZhoUiVNni7Y"
Content-Disposition: inline
In-Reply-To: <20240608155526.12996-12-johan+linaro@kernel.org>
X-Cookie: Your love life will be... interesting.


--nDGQNZhoUiVNni7Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 08, 2024 at 05:55:25PM +0200, Johan Hovold wrote:
> The Qualcomm PM8008 is an I2C-controlled PMIC containing seven LDO
> regulators.
>=20
> The driver is based on a driver submitted by Satya Priya, but it has
> been cleaned up and reworked to match the new devicetree binding which
> no longer describes each regulator as a separate device.

Reviewed-by: Mark Brown <broonie@kernel.org>

--nDGQNZhoUiVNni7Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZnDNkACgkQJNaLcl1U
h9DhtQf9FEs9YHno5v2nXIHxCEySbIXyo4E4uiBYgMdUgo2xSADqPu+47muKU0dc
MUMjal9spLFWGwmEZYfeIIZcXy37mqHltnjzb9ukwjkif0XVqG6EiBkYH71CgWoL
Kk7ynxUURlvq/mRcOHxhXo5e3hbJ9sqwTZsPxqWcl11gy8dp5OcyjqxZisueB/3W
e8/Nvb6uEEbvHe0u1fq7pqVq2A9e6kpGVRPlyUDvaRbnFnlAIwbnrGK560TBiyzm
EMP+xJdubQSlxCeAjkyzlcRnD2RkvyYePyEuW541I3B5mZt3KewJEEpq6+HxZzan
c8wP9JrbazrvCvopPADDELl1v/6NSw==
=mFc2
-----END PGP SIGNATURE-----

--nDGQNZhoUiVNni7Y--

