Return-Path: <linux-arm-msm+bounces-63936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A98AFB835
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 18:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D773189F53E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 16:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D70D224AF0;
	Mon,  7 Jul 2025 16:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDTVQqBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C64211491;
	Mon,  7 Jul 2025 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751904234; cv=none; b=B6l1bdRVsnoak83uZldmGLPThFhwV4ItTTeasEx1vkgx4iqzv5hCczsmycr+/3DQ6Uelna1viK3ImPv4ezmW1DeZ3Qd6ThdQX0CHi0RRmuTJ8KFjB82NQShcPNnc7GbdMmQRU6h2sAnwcCEhBfPJFs4NU9FMZap/WRcROR8tx1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751904234; c=relaxed/simple;
	bh=aZEPBLhWLDylJXiAN1NSvtRKJNAlYSaZS3t4Hq+XDHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHAxxiSb4AqsmW02LxQoQNnaElS2wCCvv8xB/QKT9gcx7Pm4pbDjM7PGrvafwJXRM/hI3MCeV31Wfjd5crg208iMWEA05HahLhSTaJydSZVy60MY5aInQg3f+4ABbCbNPMboklN1THR8h+ayDLIdQbfJtmPyySQsUxb2/EcymWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDTVQqBu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7703FC4CEE3;
	Mon,  7 Jul 2025 16:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751904232;
	bh=aZEPBLhWLDylJXiAN1NSvtRKJNAlYSaZS3t4Hq+XDHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDTVQqBurYrAo+NLimemlUd8FtEPxKSyh82B0IOZEVZEtXdfRC/9JZDbpJvrf+6+0
	 SxNBXKImMbaVbaDpWy35+07u1aV5hn35zLgTKomLDyPPWeK45cJwaFzqYajMpFWGI7
	 dM6cYR9s//2S1emQgQkA+9blvi06RBnqtUh01GxU2qluk3LreNZbvL/pGsGIshHgg+
	 Y27uCyGfHoyMVxIZK9rqJdgt7CLeyiHFu9gayleOHQFo3YYTUfkQfNdPtcVEVoEdM+
	 +hXo/tNeiTDHIkncjHVBb3w4sQOmZ2Yx+s1dL1MmdAwfc2XVywU8Uyer01Xa+OJGLg
	 3sGxro2u8CvJg==
Date: Mon, 7 Jul 2025 17:03:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ASoC: codecs: Add Awinic AW8898 amplifier driver
Message-ID: <9a2880e7-36eb-42c5-9ded-d171e0e6179f@sirena.org.uk>
References: <20250705-aw8898-v2-0-9c3adb1fc1a2@lucaweiss.eu>
 <20250705-aw8898-v2-2-9c3adb1fc1a2@lucaweiss.eu>
 <57472ea1-a9c1-472b-a178-eae1cb207468@sirena.org.uk>
 <cb84e711-1169-4c12-b866-9dd4f06ea3d3@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bFIL1ym+eouHtr/R"
Content-Disposition: inline
In-Reply-To: <cb84e711-1169-4c12-b866-9dd4f06ea3d3@lucaweiss.eu>
X-Cookie: We are what we are.


--bFIL1ym+eouHtr/R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 07, 2025 at 05:52:08PM +0200, Luca Weiss wrote:
> On 07-07-2025 2:02 p.m., Mark Brown wrote:
> > On Sat, Jul 05, 2025 at 02:03:06PM +0200, Luca Weiss wrote:

> > > +	aw8898_cfg_write(aw8898, aw8898_cfg);

> > The "firmware" here is just a list of arbatrary register writes with no
> > validation of addresses or anything...

> Yes... Got any suggestions how to make it better? This "firmware" file is
> the one that's also usable with the original driver from the amplifier
> vendor.

> I honestly haven't really checked whether all the registers that are written
> there are documented well enough in the datasheet I have, so that this
> sequence could be replaced by proper DT values. But for sure already I know
> that some registers which are used and functional, are not documented at all
> unfortunately.

So this probably isn't actually firmware but rather tuning.  At the very
least it'd be good to check for and handle attempts to configure
registers that the driver manages itself.

You'll also need to make the naming system specific so people can have
different tunings for different machines.

> > > +	err = regmap_read_poll_timeout(aw8898->regmap, AW8898_SYSST,
> > > +				       val, val & AW8898_SYSST_PLLS,
> > > +				       2000, 1 * USEC_PER_SEC);

> > What's this actually checking?  You shouldn't rely on I2S being clocked
> > prior to trigger...

> I've also taken this from the original driver, so I do not know the original
> purpose of it.

> The register description is "System Status Register" "PLL locked status. 1:
> locked, 0: unlocked", so presumably waiting for the amplifier itself to get
> ready for playing audio.

That sounds like it needs to be much later in proceedings then, you
can't rely on all the clocks being ready that early in proceedings.
Some devices will only start clocking when they start audio.  I'm going
to guess the clocking configuration is part of the "firmware" here which
is rather a mess.

--bFIL1ym+eouHtr/R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhr7+EACgkQJNaLcl1U
h9DsWgf9HpzTmK6p5zNczJxUTM0vdREBZpO52i4S1jXjj2/ktfZP4KU9eIQtUdNQ
ItadH6P5VBzibnfxyXgE7Wu4fdFzkCLlffkH6GNNepqYWk3haa63nfkLqBuJz7us
oEDU0e7Rs6kXM10IRGSbtPRpN1hhdMVhA2T81evjy4fAga2yZ214FcSGf2+vYzHr
VbkfDF1+vdxnHFS8ytT8ZQ+S4iTw8z7BoMrfd64KwQBaSi4OPnxzt20tRXOCbhnO
X8z6YhiyEA4RbXqINIoc7+PhPE83ndW+8p8KCjYTH0uPkYag6/KHZ1q0Y29s27Se
rfOXKmX2/UEvjnw+GN3nL/zDsXkTgg==
=GzED
-----END PGP SIGNATURE-----

--bFIL1ym+eouHtr/R--

