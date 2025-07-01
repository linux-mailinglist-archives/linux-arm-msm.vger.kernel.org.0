Return-Path: <linux-arm-msm+bounces-63291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA74AF056D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 23:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32EDD3A7471
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 21:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725B026657B;
	Tue,  1 Jul 2025 21:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlaNoI3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4353F3D69;
	Tue,  1 Jul 2025 21:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403901; cv=none; b=FT2uc+7YkupsHMooM2/th2vKOtaZap7CuJFjSFHdVIfzd0mUN9Rx6oD/GG4TuYJMqiOBJkSWvHeVBnvIiYBIbA/83v9/YPsfIxJ1wrPMCLbdaw8kzyYxTwjHw3a+0gz/X1FnBcywjXOVopH/zymf+QQqu5rrg2iExAdFf5ixkTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403901; c=relaxed/simple;
	bh=kqqT3nNWac2NHRYRDy7Rw3GgPGetnOYigSsJ33KJ2Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVnD3jwx3ZMetWd/YaFGm5fX5uZnwOIboS8imG/rlBHRXSTbn66Z2UZTG0xqZVcFeDxIAay3KAf2+LiSFx4KYLWRPEIq3KDQhYzWqBDMZcVgit2lIR0A2mBoigneCA17jqmW4yNNyC/0YUDQvJAA68Mfa3/GBPzt2eUOpukSEbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlaNoI3U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3F6C4CEEB;
	Tue,  1 Jul 2025 21:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751403900;
	bh=kqqT3nNWac2NHRYRDy7Rw3GgPGetnOYigSsJ33KJ2Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlaNoI3UAyZ6Eiq5HPz5xInwuyFHvHtvZX4XIRxAangejMShQ9iM8NtR4fnn79d0+
	 5utNQzSejkQx3ygCNVmPmduW37dvK6BHsCbxpyT5onbFo1xbukpmTYOOKhwB+2JJih
	 2keFsb3/uxRWL6dVtmPvmy+ozna1Ak6PGzFp99oD8zwUKkPXkYfFOyyDCeM+Glt9Lq
	 OenNRTKfRB8N5aeTnZ8LilxKMkZV63p/FkDe6FoJ72MWSqiGG3ZM1DmZ8nRVTSkKye
	 4iwY2cLZBZkZ9X8cwAa/0cC5RXWQMze06qaXwu1KjZcBee15M+D1Fs1Ro5mJ9JzuZL
	 MzIUTxz5i+S6Q==
Date: Tue, 1 Jul 2025 22:04:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] ASoC: codecs: add new pm4125 audio codec driver
Message-ID: <af605c12-74c1-418e-9fe8-c0aa893a62bd@sirena.org.uk>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-3-e52933c429a0@linaro.org>
 <aF01gRFjsKgy6j4V@finisterre.sirena.org.uk>
 <DB0YYV10UD2Q.M36VAZJOVE7V@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NrR+DzVE2uh2nwUd"
Content-Disposition: inline
In-Reply-To: <DB0YYV10UD2Q.M36VAZJOVE7V@linaro.org>
X-Cookie: No shirt, no shoes, no service.


--NrR+DzVE2uh2nwUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 01, 2025 at 08:35:42PM +0100, Alexey Klimov wrote:
> On Thu Jun 26, 2025 at 12:56 PM BST, Mark Brown wrote:
> > On Thu, Jun 26, 2025 at 12:50:31AM +0100, Alexey Klimov wrote:

> >> +static int pm4125_micbias_control(struct snd_soc_component *component,
> >> +				  int micb_num, int req, bool is_dapm)
> >> +{
> >> +	return 0;
> >> +}

> > Why have this empty function which is only called from within the
> > driver?  At best it's making the callers look like they do something.

> I tried to make a minimal working version that we're going to
> update with more patches during next submission.

Add the callers when you need them, right now this is just noise.
Nobody can tell if the callers make sense since the function does
nothing.

> >> +#if defined(CONFIG_OF)
> >> +static const struct of_device_id pm4125_of_match[] = {
> >> +	{ .compatible = "qcom,pm4125-codec" },
> >> +	{ }
> >> +};
> >> +MODULE_DEVICE_TABLE(of, pm4125_of_match);
> >> +#endif

> > Why does this compatible exist?  If the driver is instantiated from a
> > as a Linux software contruct it shouldn't appear in the DT.

> Could you please elaborate a bit more? Should it be instantiated
> as an MFD device or platform device?

Yes, if it's the child of a MFD then it shouldn't need to be described
separately in the DT.

--NrR+DzVE2uh2nwUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhkTXYACgkQJNaLcl1U
h9BQzQf/Z0OuWDwT+Dt5fWFdAZ4GS1sdkgYhjrAu/KXXJCOlxBoYpC+qRLsJ6sED
UQSYjYHW/cO/ikbjFRFNscVtsS7vqXwAUkseHz2hrExRhHar9nNMLKbhUJJTs/fT
Cfklra0GkKWRjamgMFidePFJjXc+uf7S/6wJyZDmqageMWALWvzVOcp0C4dTEphU
Fzu8NphJxJQCJPWm7p9ArVVVix17ev96cXGqWC1VtNHXz0rwl+w/Qb9NSQgMgZ3m
qO2BwAiV/Rz0lodwvzpGNviz6lLa3aGRSXd6pjv6/AoasbrO30rZV+FHc99FvHPp
H+IALIxAznUvPj7/oAXAZrGJPM5GAA==
=K5hA
-----END PGP SIGNATURE-----

--NrR+DzVE2uh2nwUd--

