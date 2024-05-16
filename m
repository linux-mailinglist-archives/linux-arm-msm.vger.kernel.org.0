Return-Path: <linux-arm-msm+bounces-19929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F408C7571
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 13:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A80361C20D1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 11:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E424145A12;
	Thu, 16 May 2024 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcnJO5Gz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFEE1459E2;
	Thu, 16 May 2024 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715860027; cv=none; b=WOT6hwKBtAfpl5ErCS2vL4Q4lJZ4VUzjXBMW2WG3ZowIFMIACDNQZuUbhhMCJ8grb0g6r+PTk4Tmmk+qoUJZRkb0fEM146xmSq4uQdI+mrvXunYGRMAxKvye4SM3xrIRmHQXlMr15sv3UgUaXJWq5HrXmIBK52rqXNIcKLJEgTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715860027; c=relaxed/simple;
	bh=wu41wYwUT3ZQ/LMwpK4vTqW07C2TaCMbGkW8wWLqctM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dom6qXzgUq5l0jyqZYh/97lh4U1q7wmfQTp28irbWD53kWkForKfOBDqvvmStsXAb3qqIsXn7i1zwW6tTwJJV14uV5tHlU7cxsrbIIC1d2x2t/T2bVACvNgANgL08YabrPMdTAcb1DJCo8CvFFZVz1QGeTnzfAkZTWn897o78uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcnJO5Gz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E24EC113CC;
	Thu, 16 May 2024 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715860026;
	bh=wu41wYwUT3ZQ/LMwpK4vTqW07C2TaCMbGkW8wWLqctM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QcnJO5Gze6rEySLsD5MoX2CcuqLtdZ8oTEU6W7LJ4ME+mJm6XdQUy3uUAlk37Oyuj
	 Wpqb9DkM7lhXwG5H1qnM9RPO4tLeD8Y4FzzKOzUC8WS7Ob4h96Ymg+MPoz4wUu1Q2I
	 AXK4zi2mL5jPQ3jAbhbV/p+TUgB5a5UjcnomXQjHy/XDgBZxNvGGunD620k/qwsitZ
	 yzbPLR17N5pzcEhv+iOG5vDg4AJm00f+KY6Cs3b0AKxr5QimIQgj9fl2JRKS3mYC+k
	 jycmvVl9DdjnVr9NqVI9N0TVL68NjRqrsgrKgZnYZBidC8sLf6EJFSIrPEEG3WQsVF
	 zUk6nkFH8Wikw==
Date: Thu, 16 May 2024 12:47:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
	quic_pkumpatl@quicinc.com
Subject: Re: [PATCH v4 2/7] ASoC: codecs: wcd937x-sdw: add SoundWire driver
Message-ID: <91f581ef-58ea-4b98-80e2-dd9b14a61c60@sirena.org.uk>
References: <20240516044801.1061838-1-quic_mohs@quicinc.com>
 <20240516044801.1061838-3-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6TMXXQ4QPf3seqeB"
Content-Disposition: inline
In-Reply-To: <20240516044801.1061838-3-quic_mohs@quicinc.com>
X-Cookie: I'm having a MID-WEEK CRISIS!


--6TMXXQ4QPf3seqeB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2024 at 10:17:56AM +0530, Mohammad Rafi Shaik wrote:

> +static const struct reg_default wcd937x_defaults[] = {

> +	{ WCD937X_DIGITAL_EFUSE_REG_0,				0x00 },
> +	{ WCD937X_DIGITAL_EFUSE_REG_1,				0xff },
> +	{ WCD937X_DIGITAL_EFUSE_REG_2,				0xff },
> +	{ WCD937X_DIGITAL_EFUSE_REG_3,				0xff },

Given the name I'd expect these to vary per device so not have default
values.  In general ID, status or volatile registers probably shouldn't
have defaults since they should be read from the device.

> +static bool wcd937x_readonly_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {

> +	case WCD937X_DIGITAL_CHIP_ID0:
> +	case WCD937X_DIGITAL_CHIP_ID1:
> +	case WCD937X_DIGITAL_CHIP_ID2:
> +	case WCD937X_DIGITAL_CHIP_ID3:

> +	case WCD937X_DIGITAL_EFUSE_REG_0:
> +	case WCD937X_DIGITAL_EFUSE_REG_1:
> +	case WCD937X_DIGITAL_EFUSE_REG_2:

> +	.readable_reg = wcd937x_readable_register,
> +	.writeable_reg = wcd937x_rdwr_register,
> +	.volatile_reg = wcd937x_readonly_register,

It's not a bug per se since things will work but you should probably
have separate volatile and read only checks, things like the ID and
efuse registers are read only but they shouldn't vary at runtime so
could be cached and not volatile.

--6TMXXQ4QPf3seqeB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZF8jMACgkQJNaLcl1U
h9C/Agf/dxl2QvSF6O91HT9LEA+eXsV+RD+If0rb6NqB7TD6GqF4NT8biCZgRABj
+5j0XCauKqigxtMYyzxxdJE80SL5L9z93e7OLemzzOfxpspvFbNcnktzgCN2zPTc
HNDtykLiV7SvrRm8e2J7aU3aqhSBBp1d2e970CmaOnVuyvfbyZVoPjsvicMgHZP9
3CB0Pa1C1+By8DrFR7vI6yembohfU4wFeB/66qzYovFSCI/hOuMYo2usgNhsaT8d
hUjon+Xz5e9/yaNPVIRjWuOsEa2yL1lo21HwR9drPjRtZNeTlxxhKrXoDd3goJLS
EdleAlXH/IcsXx7gjcdXQDal8syQPg==
=W/m3
-----END PGP SIGNATURE-----

--6TMXXQ4QPf3seqeB--

