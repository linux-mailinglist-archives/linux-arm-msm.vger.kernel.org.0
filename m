Return-Path: <linux-arm-msm+bounces-20584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ADC8CFD7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 11:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 216A3B21CC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D333413A895;
	Mon, 27 May 2024 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNH9o6s+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBE313A3EE;
	Mon, 27 May 2024 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716803449; cv=none; b=Rq0slFNBZCN2QjWnYCfgx++5uQ7Mp+diiqxBcSoJxqdr5DIyWLGN747h1W82QRpNOMmD+4eKyl+LVAcIPW2MFe9F5y+jYbqibzRLLZOGKQrtw07L8EnRDrdDqvlJTi22pebVNp+1rDoBTHOoInMm02A9zUrOk1iHAdztex/7cGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716803449; c=relaxed/simple;
	bh=siXMFcd/YZJ/krD1ElQNCMZYcM6Cs/xuMd+BVeICYQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHBtWjhWlXzvCIWfvomTi/bBcJrPTwW1WZ2RT25kCXAbtD7J2oiE/Faw6IvS7VaWMJzPNyYkiCviNG+/5LrL2grdFwQolilUsG87MuIQgf/StBFonpya1qBYSM0p3Xq0Bd0W7Sh3XsEjaktSWwywzv+P2s5Bv46s2HYc4RZSdxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sNH9o6s+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6674C2BBFC;
	Mon, 27 May 2024 09:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716803449;
	bh=siXMFcd/YZJ/krD1ElQNCMZYcM6Cs/xuMd+BVeICYQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sNH9o6s+Q1kmd8WNsDNbk5w8UiLJ7Y5W4l9dTvGR/YJawYoFhQevC5EN46i5dkEba
	 UjlXSOdtAPoMP3Emf/japi6wch2CYakoaRRURmEdMF2Y48Xoogw5jaiEmThfmlz3j8
	 exROQHgp/rRTl78+H4bCTEZsJ7i/p4AhrmS1kW2cp1rwezfP10W9ubQb8aPLawk6wX
	 qV0FJK5rYaHNaI5d+R8kn1pnK11BckEeMrbGWtqclxIES03fReerX6LHDKQr/El57v
	 xxKMYt4Rbk5TRP2q5g/nqYDwpJ0uiKbRMpkCg3qnrNLkmcD9Wmpew35+jLcPL1v1of
	 3YBfiSrLiuX0g==
Date: Mon, 27 May 2024 10:50:42 +0100
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
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd
 QCS6490 sound card
Message-ID: <091aa382-32fe-4f5c-8ebb-440afaf37827@sirena.org.uk>
References: <20240524035350.3118981-1-quic_mohs@quicinc.com>
 <20240524035350.3118981-2-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QlFvzjBH2dX8pMN1"
Content-Disposition: inline
In-Reply-To: <20240524035350.3118981-2-quic_mohs@quicinc.com>
X-Cookie: Teutonic:


--QlFvzjBH2dX8pMN1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 24, 2024 at 09:23:49AM +0530, Mohammad Rafi Shaik wrote:
> Document the bindings for the Qualcomm QCM6490 IDP and QCS6490 RB3Gen2
> soc platforms sound card.

This doesn't apply against current code, please check and resend.

--QlFvzjBH2dX8pMN1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZUV3IACgkQJNaLcl1U
h9Bv5Qf/RC/79S61kz29d+HPO0dv1aYHxWJa9jdbC6za/XxQjXzCqxwmH9Iwl5qp
u9a60OfG9lV2kVFsr38Eo0Gzp60n3ILfLQ2noRN4QtWDeM4Z3iVA9aYeXvxzGD+T
YKNQZZAiEaSPL0/yu9rjpZNukGumbB1ZrIkziy2JtxdrYF871n3XM5yJPJxo6AwZ
ECxwvmPt6QE9jwGhnuUK4dApotHFSC14GG3cuotymq5GKv+5tKpxGYvcbW5ukI3Y
wEuWMtDErIr8X6Xstk4U8F8smKh4Tw3KjLTL6M4NKZO5hSReesnOe5dZipPjpA5j
V5vlHp5uPs3a4sXBwXYVlWbM2ICK1g==
=b4rM
-----END PGP SIGNATURE-----

--QlFvzjBH2dX8pMN1--

