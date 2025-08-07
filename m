Return-Path: <linux-arm-msm+bounces-68053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7160B1DD33
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 20:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9580A7A35CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 18:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA7921D583;
	Thu,  7 Aug 2025 18:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nY1aVFTW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB9B1E0E1F;
	Thu,  7 Aug 2025 18:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754592325; cv=none; b=TxJAyhxQTDB8O6Gmd8+cpFKDy/CtLel793mGRH+nuD9FXYaKpPNldnwwdMoZ9PsZVNNHzVOA7yT6aXSWY8hJzNOZJ9+g1z95CIchtwjGiICVu0nQGVfTgvJlrp9dCDnEBYxvAPodGx+e/X4aKh0SqavqluwrAh1ECwl28Lk/weg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754592325; c=relaxed/simple;
	bh=s41nQYbG9xds3nTMlaUxEfHRA0sbU0VGt9aCqsSBb7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clQTBuixzKEOe8mCMewntqBymtklv3akC/Fpx3wj+BwpkmEz354+M4Sp2/bIGaClNJZzMxAtLiQrIoFXflcLzCx5zv8AYy91Z6iecOwNUN0l0c+VS9DILpd6x/w6smVvEtJgctLCBhozwtTMQ/6LLKRTTM2ClMzNMYiDu9H1T8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nY1aVFTW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1DAC4CEEB;
	Thu,  7 Aug 2025 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754592325;
	bh=s41nQYbG9xds3nTMlaUxEfHRA0sbU0VGt9aCqsSBb7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nY1aVFTWftz8uIWW3hzTH6iKf1k7Sn6FtFu6bEvzRNxapAwmRIsfz7LRrUeulSiWl
	 VlT7fu0Sgni+JHYd0vkQrXkXcirQK3Imop79h5brcHyY2UAy7JtxqNu5HQGi2h4pLO
	 mPj8Eys8Yq1RlUoUwGumtlUurEMFGPYerBqKbg9VMR4dbXSJgvG1ecFzM8DgHvHBJk
	 9LPbk10R/j/Zt28ufc3QJhF6W4pDIKbLgxd4mHF8XNuGw/CwQ3WRl4/TTv8haS6WY5
	 267app3hQkPXN2JCcxSnwELVZdsug9TjBllXDEkrjGEgrR9/4cC6Dpx3fAlP44TXOh
	 lRjTA/gk33zEA==
Date: Thu, 7 Aug 2025 19:45:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, vkoul@kernel.org,
	kishon@kernel.org, mani@kernel.org, conor+dt@kernel.org,
	bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
Message-ID: <4efc8a3a-ceb6-40dc-b877-328b86348e0b@sirena.org.uk>
References: <20250806154340.20122-5-quic_nitirawa@quicinc.com>
 <f368b6da-1aa3-4b8e-9106-3c29d4ab5c5e@oss.qualcomm.com>
 <fe2bc07c-8fe9-47fd-bcd7-c2f0ebbd596f@sirena.org.uk>
 <aed1de56-fafe-4ccc-b542-69400b574def@oss.qualcomm.com>
 <acf89420-743b-4178-ac05-d4ca492bfee3@sirena.org.uk>
 <599b8a4b-324a-4543-ba27-0451f05c3dfd@quicinc.com>
 <3aa82f65-4812-4bf0-9323-96f40824a004@sirena.org.uk>
 <685e3d36-c0e3-4faa-b817-aecc15976a25@quicinc.com>
 <c1435858-6288-4525-8c92-e27ed86cb55e@sirena.org.uk>
 <31461227-3f3a-4316-9c8a-c851209d0278@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G2ENHz2PdHsOQPSQ"
Content-Disposition: inline
In-Reply-To: <31461227-3f3a-4316-9c8a-c851209d0278@quicinc.com>
X-Cookie: Real Users hate Real Programmers.


--G2ENHz2PdHsOQPSQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 11:26:17PM +0530, Nitin Rawat wrote:

> 1. Regulator and PMIC configurations are board-specific, meaning they can
> vary significantly across different platforms. For example, some boards m=
ay
> use different generations of UFS devices =E2=80=94 such as UFS 2.x =E2=80=
=94 which come with
> distinct power and load requirements and some with UFS3.x which has it own
> power/load requirement.

Requirements from generations of UFS devices presumably come from the
UFS spec and should just be known though?

> 2. UFS PHY load and PMIC requirements also varies across targets, dependi=
ng
> on the underlying technology node and the specific PHY capabilities. These
> differences can be influenced by the MIPI version or other implementation
> details.

If you've got non-enumerable PHYs that have a big impact that's a much
clearer use case for putting things in DT.

> Given this variability, expressing these requirements in the device tree
> allows for a flexible and accurate way to describe board-specific
> constraints without hardcoding them into the driver.

There's still the issue with making this a thing for all regulators, not
just for this specific device.

--G2ENHz2PdHsOQPSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiU9D4ACgkQJNaLcl1U
h9Dqwgf+JbIQrV4egEG41IhOo2GykmQdxoZIruBzsUhW9fiW7X/5mVa0iiwvNEtn
HJ1vYBMJsMJPB3NW4tszSqFAAmc0qw8CywTwDzvGNPPot7+E4SAHVGMcoYKQDY63
SiJRyciCV78ASvHAduHElQdln3nVEoA/DAm4nQnn090HTcLpK0lV7M9BqU95PU/+
XuX51rX6hbXcH16FFZNJ9eqEvk5d/x67M3wZeXdFmZZ1Fb4pqFzrFblzQvveOhPF
2z6oQ49XxsTAS5Y4c1ZVDpnXo5t2boRYnQeX1DUnDPZTAWyOCvbJkw694CAlnCX3
F69UdClfNpyEYvrx4YYCSo/clrNe6w==
=L2AK
-----END PGP SIGNATURE-----

--G2ENHz2PdHsOQPSQ--

