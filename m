Return-Path: <linux-arm-msm+bounces-48759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB649A3E4D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 20:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DE103BA1A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 19:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2499D2641C3;
	Thu, 20 Feb 2025 19:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWQfxdYU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A23263F34;
	Thu, 20 Feb 2025 19:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740078777; cv=none; b=Y26nrNsXgjm7FCbmSlpX0FXvLxuB02Avrjw9Ue6tPNOcQcByScZIsKaCLAVFr6AXS+6mrT6V22Gtc2Xzcf+XaSoMOmk6poGP+DIWiwHm3ebxAFo5alSypjLxjgfe6D/dF1OGOtAlNoZiqieA0SSpUSitaU6J9Yx+i5nZ2TWao4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740078777; c=relaxed/simple;
	bh=BuMTyTLXR4MRZyUMFcKuSToR5dt/ByaCDZyeKkp3kHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3jeeHPc+OkHYoy5EiB2zqwMdA98TvsKmzs8zkIMmN6iGrriiZhYtsSkZWn08R8i+5WwSi93drjVQ5eP+iwj2hDihoHX/FNsxNTIs5w4+BGwtTQKf+lqcfOCQswp3fUppPzjD7XbNvtaZBDuoCIkKtHluezXFhS4nWpa2P33qb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWQfxdYU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3785C4CEE8;
	Thu, 20 Feb 2025 19:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740078776;
	bh=BuMTyTLXR4MRZyUMFcKuSToR5dt/ByaCDZyeKkp3kHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWQfxdYUfxrYr+FUhQRt6IHJN20e1FxG3UzmNzerYbQuDHjEPhmMyLjcBRV6mEGcM
	 BlKxDrv0vl2jW3z8WHYAYXfI5gLoLKm6O27+TrvSlRCEch+5Qey4dfd44KNJEolSEC
	 QFgcslODdq0YlDfEmWihdHaXuUteFnKbiJTi/iKHcnrgw3kBwCicVdjZMtWifVByx7
	 uK1Cz1ySHMsVYa/KO7r64uvFgHkkcEO4vTGSHaTiiwP0DbjLbX/lu22lWMJc8OcIF+
	 pHFbk9kwE0kWgRPCVq/UGnxlDP3Chvfo4hCqnQXTIwjoJ30K/pSa2C2P48I0ziQb1X
	 6tgTClLj3sWnA==
Date: Thu, 20 Feb 2025 19:12:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] nvmem: core: verify cell's raw_len
Message-ID: <Z7d-tCcq9G52oJrJ@finisterre.sirena.org.uk>
References: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
 <20250109-sar2130p-nvmem-v4-2-633739fe5f11@linaro.org>
 <Z7Xv9lNc6ckJVtKc@finisterre.sirena.org.uk>
 <CAA8EJpp-mE2w_c3K08+8AR3Mn1r8X58FRXvAUFALQ-u2ppoKgw@mail.gmail.com>
 <Z7c5niuwR3TVTQrj@finisterre.sirena.org.uk>
 <scmsm6wsgspieamsjqftjfdswfmfh5cemiebb6k66qzetdovy5@oa677gskzst4>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GhFvxpkpNQfKlLuF"
Content-Disposition: inline
In-Reply-To: <scmsm6wsgspieamsjqftjfdswfmfh5cemiebb6k66qzetdovy5@oa677gskzst4>
X-Cookie: Editing is a rewording activity.


--GhFvxpkpNQfKlLuF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2025 at 05:50:39PM +0200, Dmitry Baryshkov wrote:

> A quick grep shows that there are enough drivers using word size greater
> than 1. Would you mind checking if the following patch fixes an issue
> for you? (Note, compile-tested only.)

That fixes at least some of the platforms (my lab's quite busy right
now) and looks like it should fix all of them:

Tested-by: Mark Brown <broonie@kernel.org>

Thanks!

--GhFvxpkpNQfKlLuF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme3frEACgkQJNaLcl1U
h9BziAf/TgoYYsnbQig+DLS0/6m6fQnifzK3xHsJiE4VSdJuJYavkxt/6oZYqa60
m0UN78kDO4n44RJib3aktIBmF5jSTSjBACoWSWHa2MIgQqcZx8kUm40wDVjL42E/
mNLeu1WXmebtvk6ya1g3bchdSE2Aj4sjgWwOZKicX0z2Zk1nmQI1jDnRpPASaG8Y
6MK4tM7/QvCNizAFHKrLyE2BfWKsjHZcUIaYJGIKO9yBXAD2jK6LDkqAXUTi2mbz
Bxa8FNjgU53PauIWHowDIRX+kKK9dhcb+VW+23RmWaijS6bJ2zJN0ub7uxAguYdE
zoVxmw5lLapOPkbSvAPhV3BdPB5/WA==
=JRss
-----END PGP SIGNATURE-----

--GhFvxpkpNQfKlLuF--

