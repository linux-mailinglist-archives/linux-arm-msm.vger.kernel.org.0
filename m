Return-Path: <linux-arm-msm+bounces-62111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 476F2AE4B92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 19:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D91CD167391
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 17:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6981A279DB3;
	Mon, 23 Jun 2025 17:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpoSlcQn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400C524DCE8;
	Mon, 23 Jun 2025 17:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750698237; cv=none; b=OkgpjD0uDmVoXgyZA986q0xoksU+8ymKi/pvs2vnHIp6f6aOYfd19zu5mH9hJ2IvdQ21No4suk1ErLtRJL8QxJOWHUxA13WgoiujMSMcWiI60bIXGYdWQrEvnyVK+NGmcF6t44LKqk9ARXc8h4bn4YS5yydB2f8GwWq+JaKYvmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750698237; c=relaxed/simple;
	bh=VJtHuJLEUhBFnRrOxtJBI+YxHnFBD3QL/YwOaV5kthk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYiiNI0mCIYjLa6l6GxAmowXa+PPaodymeFWlb8PAZ6TzXuJXRyHI17QUx/iy8pBYKuw28cRmlgG2mEL08KpuYWbQ+71DbBpXi92ELQtXb92oUVq/d1m5JNle/wwCG/LeqSheSXpfiR5v8N9Og9K/Feo1KsgTxoXgFPFIfmAndc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpoSlcQn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C2BC4CEEA;
	Mon, 23 Jun 2025 17:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750698236;
	bh=VJtHuJLEUhBFnRrOxtJBI+YxHnFBD3QL/YwOaV5kthk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IpoSlcQn7pVP7h8JUuHvBeg6O8wdX+PVzEQOJVvlhliPIKKhC32/KYNlLT8GMOSzd
	 NQcPDL+sSSyjlbSKoPDXMfQwNqLveYMNdnYKbq6d6o2z+6+/8x2H7uRqPDkKwb6Rvn
	 sMniFXODALmt23e6ahz7KTi8hkWuV2YaVGouPghS8chV20KFtXvYhAq3Kk1vW/ORce
	 YpFrpoUC8T1ZTsN2jaEq+wZdnL+sa+/pGIxbSM0TEkXxctDaYOsq3QO/+8/hBMPNt1
	 uJymS4yDjucjGzElauvvB82gs/wxuxYfS4HSRXEbhvP4eshq78uUrDW/a2+ZCbnaen
	 srBE3Wu+r1c6A==
Date: Mon, 23 Jun 2025 18:03:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Collins <david.collins@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] regulator: qcom-rpmh: Add support to read regulator
 settings
Message-ID: <e5a44c70-e64a-47e7-8e45-3e1ae4f0ceb0@sirena.org.uk>
References: <20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com>
 <20250623-add-rpmh-read-support-v1-2-ae583d260195@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yCYMz5lKYgpRu4Db"
Content-Disposition: inline
In-Reply-To: <20250623-add-rpmh-read-support-v1-2-ae583d260195@oss.qualcomm.com>
X-Cookie: Do not write in this space.


--yCYMz5lKYgpRu4Db
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 23, 2025 at 10:13:41PM +0530, Kamal Wadhwa wrote:

> To address this issue, enhance the `get_voltage_sel()`,
> `get_mode()`, and `is_enabled()` callbacks to read the regulator
> settings directly from the RPMH hardware using the `rpmh_read()`

Two things here.  One is that my understanding was that at least some of
the firmwares simply do not provide read functionality - this new code
will turn that into an error if it's the case.  The other is that
there's an expectation that the read operations will return the value
that was configured by the host, we might get confused if that's not the
case.  I'm not sure if there's paths that are currently implemented
that'd have issues, but it's a concern.

For the enable there's a separate status callback that should be
implemented, and you could bootstrap the state.  For the voltage
readback it's a range that's configured so it should be fine to just do
this I think, though I'd need to go double check the code for keeping
multiple supplies tied within a range.

--yCYMz5lKYgpRu4Db
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhZiPcACgkQJNaLcl1U
h9CkIQf/YE1g/XPEBBBYmNjbNjf9wEH7CtBDZpStqCxQ62nhWwmin/0Esh90U1E1
3RmFgCx3Z2ulkSbnxZZfEHfsPXqLFjriAA6IZhn6SiOVnm7csPLNSPY7tNNWUC6d
pmvIgbPHPvgwPArpioiJdwocx6ZmHly8lha5AECk/YKjLNLp0dTRiD+y0430uqq/
aGNMA8aWBX+Q44Bb2cNEmp53GB2Kn6Nug4dhXmtZxSXjmToMFz40ZIrehejJUSQp
ptQ6r0dJM52AWt4CUJsbVwtoNUu6jD42UB435p6+jXql44LpQZpiGMCpigPzMqK0
500DabBSkuv7SK7Km0oAeRwPVY2sUw==
=3oO9
-----END PGP SIGNATURE-----

--yCYMz5lKYgpRu4Db--

