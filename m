Return-Path: <linux-arm-msm+bounces-34729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44889A2065
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 12:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 118341C22346
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 10:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7DC1DAC9F;
	Thu, 17 Oct 2024 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDHoX9Nb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8216F1D517A;
	Thu, 17 Oct 2024 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729162783; cv=none; b=UzZ42zhKmVgBfzUX5/rb/Qx3DDc3p2nqtagHZ+ROcprcj65U2Jny+y2OFlgDpDxc5GwGrEF8M5R1Xztm7D7lvm0d10zOYC9zgNqEqZiBvi+F6F33s26Qs3Vc/ndvTOCLQtpv8p2h4tGIJ7RMTWy7BjVh3VEBo141BS+jA6C4h2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729162783; c=relaxed/simple;
	bh=XhkxeKR67k/H/6xZZUYqc3A+4NyHmk68WKAnJ8aXEuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eH3nxoqrupSUPNhLqvSM0YAzNrZYvX9WWN73MCfnHrLhLxuoxV006WM6KBqns4/U1aRE7yBmR9bkQk6MQPyAL0TZPtPvID5yWtcg1ozKOCbhk3Uq74ZR6EeB51MLFL+olD3jSM5hQaz/al8JiFHZbCJ+Mzj3jv6iI3n6xNQRkoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDHoX9Nb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5014DC4CEC3;
	Thu, 17 Oct 2024 10:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729162783;
	bh=XhkxeKR67k/H/6xZZUYqc3A+4NyHmk68WKAnJ8aXEuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDHoX9NbdBoGBfvrnuszF/NVTCzNO2wMDHsKvCVr0r6jFBEB0/qVjmR/H8HusqWD3
	 6Q4dpx0MIi0mQMgkFPIDYOlCr/SwAvLY5FIJO+Gau0Es410PkyypKK337JBmeSZKbG
	 OYtdypx1n9c9IsgYIrg/GENTHI1BSJYHU1rWqbDK5KWFdKvKHimI3M2Wn5uXpWfDwm
	 Jrif0Xo6OtoLjtbyak21n1ITdbQiS6+H4A52fUrrNEaO3N9GQD0SllapL6fkvJuYQF
	 L+6qkaomTMrxM/hoHAaUvyb1PZc8NjWCelS4U3K2LLCsrHFVS6Izs55aRqB1oecyFe
	 fPmlWLlCRjX0Q==
Date: Thu, 17 Oct 2024 11:59:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
Message-ID: <cde15d83-6059-47bc-94d6-2a88ba95e5ae@sirena.org.uk>
References: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
 <20241007-x1e80100-pwrseq-qcp-v1-3-f7166510ab17@linaro.org>
 <ZweftESPrJNEsqGE@hovoldconsulting.com>
 <Zwj539cN2DJ7nd3A@linaro.org>
 <Zw5fzNZ_xCwPyw4G@hovoldconsulting.com>
 <Zw_dE1rQ-Ljsh-sY@linaro.org>
 <CAMRc=MfUEfKHkAVvtGODxvJ-BdL+kX7uDgW+1y4QW3Kc5mpX+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rBHfmTlXKIjpSods"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfUEfKHkAVvtGODxvJ-BdL+kX7uDgW+1y4QW3Kc5mpX+w@mail.gmail.com>
X-Cookie: One picture is worth 128K words.


--rBHfmTlXKIjpSods
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 17, 2024 at 11:28:18AM +0200, Bartosz Golaszewski wrote:

> How do others deal with it? I'm asking because I've been seeing these
> warnings for years on many platforms which makes me think they are not
> a high priority for anyone.

> The best approach would be to provide an optional bulk get for the
> regulator API. Or extend struct regulator_bulk_data with bool optional
> and take this into account.

> Mark: Any thoughts on this?

Fix your driver to request the supplies that actually exist on the
device rather than just some random supplies you hope will work?

--rBHfmTlXKIjpSods
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcQ7hgACgkQJNaLcl1U
h9Ci9gf/f+gbtL98BfY+EJiIAxVPWn0hxT/VgVKz2EM4rpu6GnK+Tg3r11PB8jSa
ZGj+rygs+0MwxNtWj+DsNYK5IkISba8ZbxbJ3Gh7b5tb+zwdFrj+a+o5+CIzShi0
rh5Ozp0jqq/zhQzBN/meE+klSIidwnZWYp4Gjm/zAmEH5CxvZ0CTmxWKBeMl0gVH
4A+lkMIVTtpeXhDKqoTFO60YJ/nM+CSR/5qvPZh3u2DqwHYMRasdhSWhO87zCiiE
Tjv6Y2CqgCI+b2p2POii4DsMbKFuddlWS5sYHDearIYEer78xO3ZTuBrRzq5mntD
WRE/1mUUU8KupzjI/xAZXsrNMhTOWw==
=NXPx
-----END PGP SIGNATURE-----

--rBHfmTlXKIjpSods--

