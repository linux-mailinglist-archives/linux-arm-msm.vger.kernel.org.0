Return-Path: <linux-arm-msm+bounces-27402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E879940FAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 12:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804091C22BB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 10:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12441A3BB6;
	Tue, 30 Jul 2024 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kS5KfIM9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F2E19CD17;
	Tue, 30 Jul 2024 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335742; cv=none; b=PCyq1qEv/dX5iJ8hYKL9lxeIJSiTTmUcDP4dbZTHu9J1dkX5S1vW8r3tRn8wk7/BuXhxm57Vq6ZxBxVRzoFrsXOkABqziqLtYtmjjkyBcdgzYOWJI+3QjJW1wD0BZQ/7LPtCpKZ4/eITYSwUvwcE16ArUI1bL0ROnCzB9AaiSOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335742; c=relaxed/simple;
	bh=qu2Pv08OrvKfaJH5pTaBnMemTX9a+jS+z+H+/i7Jqjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DA05miOa4c6r9FNNiTyN2wQoYXRahNBQIGA4GRuwiQycnUMEoR2cWmvM9galYinJUZV26gdnuwX8QCmBeGkKQSnz+yrXy18xtdscr0Gskjq1LfcJGHRuRtmatKUWUcB3SN8bQXBeZeIFmQZmZzFDX5y7rvPBni9CNBCnAT1tGa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kS5KfIM9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30199C4AF09;
	Tue, 30 Jul 2024 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722335742;
	bh=qu2Pv08OrvKfaJH5pTaBnMemTX9a+jS+z+H+/i7Jqjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kS5KfIM91AFndH8uSyBHWVcJBgKpUSq1m2v9SK/lS9nranqql+fX7fySfhDzTepRp
	 0o4Btxlh7n18zvBrlG8w1tYy422Zlh1JmFk2Fj/z1Qb/cWKuzPdsz22eXHUsZKS8VH
	 gI8H2fUoUpg6LACblBYlQct8HEh7xpiS9OWiXcgcHAMZ+H+7Fci/eavvPxkCA7SVv8
	 BwFlm4PJKRj9MlRw89b0Zfc6JkKqE1FpCuJIaS5l4Sjj+gCV9XAMrJ9XVgPGNJor03
	 uw9M0Q6teETOkytUioyg4A3Wc40xIqhwNXogAjBN/czj/8obNh59yNMG4LEFXfsQ2D
	 zRDoCaIsdrpNA==
Date: Tue, 30 Jul 2024 11:35:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adam Skladowski <a39.skl@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,apq8016-sbc-sndcard: move to
 separate binding
Message-ID: <d7067720-5524-4f8d-82fa-b2636be79676@sirena.org.uk>
References: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>
 <ZqVXUI37fNB5D0DM@gerhold.net>
 <3d9f76c1-2e14-43dc-b438-5fac94ffc73e@kernel.org>
 <ZqjAzgoKo-5vaCtK@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S6y8uV4MuB6RROEa"
Content-Disposition: inline
In-Reply-To: <ZqjAzgoKo-5vaCtK@linaro.org>
X-Cookie: Don't SANFORIZE me!!


--S6y8uV4MuB6RROEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2024 at 12:30:38PM +0200, Stephan Gerhold wrote:
> On Sun, Jul 28, 2024 at 12:30:12PM +0200, Krzysztof Kozlowski wrote:

> > This was added to the common driver code but it does not mean it is
> > reasonable binding. I don't understand why for example we even accept
> > here aux-devs, instead of putting them into one of DAI links.

> The auxiliary devices (typically analog audio components) are not
> necessarily related to one particular digital audio interface link. It
> is typically the case (e.g. an analog speaker amplifier connected in
> parallel to the headphone output of one of the codecs), but I don't
> think we can assume that as a general rule. There are often multiple DAI
> links that go to one codec and then it might be tricky to decide which
> of the DAI links the aux-dev belongs to.

Right, aux devices may cover more than one DAI link (eg, if there's a
CODEC that can do mixing and they're connected to an analog output) or
may in rare cases not fit with one at all (there's use cases where you
have a sound card that has no DAIs and is all analog bypass).

> > The pin-switches and widgets could be used, but are they? The only valid
> > argument to keep them is that you added them to common driver code.

> These go hand in hand with the aux-devs property. If you have multiple
> analog audio components connected to a codec output (e.g. an analog
> speaker amplifier connected to the codec headphone output) then the
> pin-switches/widgets describe that the output paths (speaker and
> headphones) should be separately controllable.

Plus the above cases where you don't have a direct mapping with aux devs
and DAIs also apply to pin switches since they're in the analog domain.

--S6y8uV4MuB6RROEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaowfcACgkQJNaLcl1U
h9DMeQf+JjZ3Zel23S9ESTi6xAdBKDTMAIMzoNtWk1WtyW5Ckxp1zdhqAqsxcSbF
JUO9AtiCUxts+cG6rulPJunQzZGzVAxN916GHlwd+eeQH3YJCcIZ/Pc/iaMmNKUr
4qR4I+hNFITFB8NmL2PAImPBiHIhc838R7zu3Nuf4vmbKqpMArc0VFRMNURTYswf
qFyxJ+PMHilhp2rNtvonTwRNAUu5POT11PblCLkqLM/t2lfLiaUbBW3lLCruTi3G
XeYGSUzSWTxT1zr7uNuw47iE+eVfCMegJ7OVK9TZ1Be/4buOeYIEP7h84YYZ+pv7
6KMc/28yL1Y8dgAis4b2Kz/uhp1XSQ==
=/e6J
-----END PGP SIGNATURE-----

--S6y8uV4MuB6RROEa--

