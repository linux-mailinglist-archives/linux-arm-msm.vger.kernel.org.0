Return-Path: <linux-arm-msm+bounces-11953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F66985CC39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 00:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDDFC282361
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC22154C05;
	Tue, 20 Feb 2024 23:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+3DPmsh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DD51EF19;
	Tue, 20 Feb 2024 23:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708472756; cv=none; b=skVcNUZV5DypAfZDGVtsO3n+4D0JViTJorKOmmzaWlRIO5QCAaC6zq6kczQtV7fLwg7UvyODW23yvDBd9wZ5snqL/DO3HOavI1vCTTHK/+D4U2qLala7NjFbu/vKPezTfB/12A9MBswIXkwXwDb2cI0K4Ov9aRJD+4oO3RTaTd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708472756; c=relaxed/simple;
	bh=L2QVjkZNMqhds2Vn+7nDa/OeZVsjV6Ipu7u1w+s06lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgU/hDCzLEYm8UGJwYZsMuZGiZ2MggpFz7IEMiDkqutwCXVH///zvZR+XPU6LIonVF/nwbLikDONZdLZBzNOHUqFfBNPZgk8bQuYevrthDA82Vc5N+qoLkUGSPQ1x3KzohO1xa4vDk3IzMp5FC/lLGutatZ8BB4+/W6NyDIEeMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+3DPmsh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CC2C433C7;
	Tue, 20 Feb 2024 23:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708472756;
	bh=L2QVjkZNMqhds2Vn+7nDa/OeZVsjV6Ipu7u1w+s06lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+3DPmsh3Se2Bp1Id6QgKV7kTHL7SMyvG5I0oguFULzp3SNouTaPc513M+K4gDoAW
	 9EiCrIvQQT8dicB02MN7qpg4E0FPtq0HX2gp20gcZ+aWA+OpEc+YkvjLWBWTJK1BRa
	 4K+g9dj2Pqh1f4DkHtutjXRG6QyhWoWOKgOkFP0z4e1+24RupCFfJhgreIYZMD5eLI
	 juCe9wiAbYVeEQOhk/FSS43gjC94N+TxXWUyG5ilh8L3DYEIeNWrJzCO7WMGu04q4E
	 +dF5eoCJPZjdQRlsFrChmOHkHjNlmSaBWXClA0Cba6u4KZH3oB69y2DY8vfw1sfM+3
	 F2oj8z8xChiog==
Date: Tue, 20 Feb 2024 23:45:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: qrb2210-rb1: enable Type-C
 support
Message-ID: <b72042b7-a500-460f-803a-c6f178bd9cb1@sirena.org.uk>
References: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
 <CAA8EJpoUHi8FDAKa+LO+2t7fXxXaFYhXAJzkUUPs_uJH9pvZWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="se6umII3fO6mWC3n"
Content-Disposition: inline
In-Reply-To: <CAA8EJpoUHi8FDAKa+LO+2t7fXxXaFYhXAJzkUUPs_uJH9pvZWw@mail.gmail.com>
X-Cookie: E = MC ** 2 +- 3db


--se6umII3fO6mWC3n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 21, 2024 at 12:40:32AM +0200, Dmitry Baryshkov wrote:
> > Dmitry Baryshkov (4):
> >       dt-bindings: regulator: qcom,usb-vbus-regulator: add support for PM4125
> >       dt-bindings: usb: qcom,pmic-typec: add support for the PM4125 block
> >       arm64: dts: qcom: pm4125: define USB-C related blocks
> >       arm64: dts: qcom: qrb2210-rb1: enable USB-C port handling

> Mark, Greg, granted that the dependency has landed, could you please
> pick up patches 1 and 2 correspondingly.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.

--se6umII3fO6mWC3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXVOa0ACgkQJNaLcl1U
h9DRJAf/R0Il0YfhwvTX7aFOwzsq9d3ydqAl/+6oHDJnB4EkxLrpio3DXwlwVP7U
Xxd8FqHFi1aedGu6VtigivmPThso2YeaXwm8wi8HJu0JgTw+IqczW/SZYfHInQUj
1Nthjx8YeBwkKXegFyK9+opa3bjqN58hAJQRicLq4Kodc6xNslikuQOaHcxeccvU
ANN1/5fIrGW++zcOGBjBrt3f/jOKOulzNCU9ASrECAdtzwu6wnC/4RJ51M95N+s6
gZLAg63KYmbA4jTelWGmsHepWVR8pAI0EelmXd28Z7CbwyfgOr/hWCqKjCqAjLTr
yPa8Xc00XzR2Cr3s+JGMlb18ccYucw==
=5S1A
-----END PGP SIGNATURE-----

--se6umII3fO6mWC3n--

