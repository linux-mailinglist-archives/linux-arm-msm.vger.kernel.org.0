Return-Path: <linux-arm-msm+bounces-68050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ABDB1DC97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 19:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 588A63AC61A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 17:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7721273D84;
	Thu,  7 Aug 2025 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="py81cQlr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7D725B2FA;
	Thu,  7 Aug 2025 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754588632; cv=none; b=tXwKtY0/IutkKDi8li3tcR+1plYilgYEUB789gI3dJtNbwenkHoNe8ZWnCB+sJUuT6jHQ6QuEfUV8bs0AVG2u/mFOGgR86mrYkToSvno8ZkarNrdK6PXe9xIgbfg8M9mHwv9kbuV7wsLuO3NGuem8hFLRmtsxQyFqNGfT5Bfwzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754588632; c=relaxed/simple;
	bh=hsJ20AJl02FZvdjaBaFD/7kmVr1aVFSkgrbL9mdgx8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLmBvmBCTZjW3kKfy4nhW98zKOB9epyRrQz1eUWMHZwTj4bHgd9WbGZwO1xmfBUTatK5Q9rVCRJ0lgX96MliQ6Eq4OHj8xrK3AeTIfork5Ue3LG9Kf76jB4kigyh2eEsDbw4meeSA9EgbCMudLAJ6OfqY9tgRTbggyaluw5qsSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=py81cQlr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25837C4CEEB;
	Thu,  7 Aug 2025 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754588632;
	bh=hsJ20AJl02FZvdjaBaFD/7kmVr1aVFSkgrbL9mdgx8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=py81cQlrN4yMFMilgTcUb9828p9+/sKb8uMKTBcuF4nfljeMZsqBFLzGdNgHgC69Y
	 Xo6lFkl6Qi+2oZIqVqJxoykTjWRQMsLGN95tEQHgyoARmBaZb65jt9Hel2my6rJ1O8
	 EoZupmAzmcBK1Sr9S2xwpcdoCLIJp2/uSueQL64+erED5ZOvFeGBDpdMdCUneC3hh6
	 2ji7Z+fSsAzlEuMf2ySVBvxE2Mlj9q9VxUGu9AcpBTGIItWwOKzEULRxfeO6gv3KwD
	 vex19T/MYYcvPH5yecJUUxFsOGOcQ+/8mZmxgCRmoS0KYbKcB0MvraAH8f4NUIa4rq
	 G4kozVdG2i75Q==
Date: Thu, 7 Aug 2025 18:43:46 +0100
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
Message-ID: <c1435858-6288-4525-8c92-e27ed86cb55e@sirena.org.uk>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-5-quic_nitirawa@quicinc.com>
 <f368b6da-1aa3-4b8e-9106-3c29d4ab5c5e@oss.qualcomm.com>
 <fe2bc07c-8fe9-47fd-bcd7-c2f0ebbd596f@sirena.org.uk>
 <aed1de56-fafe-4ccc-b542-69400b574def@oss.qualcomm.com>
 <acf89420-743b-4178-ac05-d4ca492bfee3@sirena.org.uk>
 <599b8a4b-324a-4543-ba27-0451f05c3dfd@quicinc.com>
 <3aa82f65-4812-4bf0-9323-96f40824a004@sirena.org.uk>
 <685e3d36-c0e3-4faa-b817-aecc15976a25@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UswwCFe1kiMt6NyH"
Content-Disposition: inline
In-Reply-To: <685e3d36-c0e3-4faa-b817-aecc15976a25@quicinc.com>
X-Cookie: Real Users hate Real Programmers.


--UswwCFe1kiMt6NyH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 11:05:08PM +0530, Nitin Rawat wrote:
> On 8/7/2025 10:56 PM, Mark Brown wrote:

> > The issue isn't using regulator_set_load(), that's perfectly fine and
> > expected.  The issue is either reading the value to use from the
> > constraint information (which is just buggy) or adding a generic
> > property for this (which I'm not convinced is a good idea, I'd expect a
> > large propoprtion of drivers should just know what their requirements
> > are and that a generic property would just get abused).

> > > These drivers also define corresponding binding properties, as seen i=
n the
> > > UFS instances documented here:

> > > UFS Common DT Binding ((link - https://git.kernel.org/pub/scm/linux/k=
ernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/ufs/uf=
s-common.yaml?h=3Dnext-20250807)

> > Note that that's specifying OPPs which is different...

> Sorry for the confusion .Instead, I meant the following three properties
> defined in the link to ufs-common.yaml binding, which specify the maximum
> load that can be drawn from the respective power supplies.

>   vcc-max-microamp:
>     description:
>       Specifies max. load that can be drawn from VCC supply.
>=20
>   vccq-max-microamp:
>     description:
>       Specifies max. load that can be drawn from VCCQ supply.
>=20
>   vccq2-max-microamp:
>     description:
>       Specifies max. load that can be drawn from VCCQ2 supply.

OK, but that's still not motivating putting things in DT (the properties
are there but don't explain why) and having this for some devices
doesn't really address the why make it a generic rather than device
specific part of things like Konrad was suggesting.  Perhaps there's
enough board specific variation that it does make sense to put something
specific to this consumer in DT, but it'd be another step to make it a
generic thing that applies to all regulators.

--UswwCFe1kiMt6NyH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiU5dEACgkQJNaLcl1U
h9Dm9gf/czgCATFH8mHfsPQL7Jgte8mnqHdX8h7kP9EPNkqEGeVXbPEFYvflgjDn
DG0TXYgKYTC7xK4KbyOHNW4s5xaF6l5vQaLI3Aqzgu8vjGtosl3wW+SB25Ndiq+k
nYplTOOtPb5chlqkoZVzzcLAaJgniCDslLi3rcegCbWq6+E+QgFRKPhlWNaidizi
M5RCpyrno7rTaOZ/cFSnRGStemFTWPdw9N79hJabWESTK4+M9dYQciM0yTanMfhf
cvbNZnMqBp4CVEGl+e5l8p9MjUeyBKFkCY0rPHlPHRX3kKKpq68E6eQu8EoRjJly
u7+Oq3myiTklfSI/f3sAD6iQwdlhVA==
=dtCN
-----END PGP SIGNATURE-----

--UswwCFe1kiMt6NyH--

