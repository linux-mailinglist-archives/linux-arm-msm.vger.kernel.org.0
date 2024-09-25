Return-Path: <linux-arm-msm+bounces-32458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE03D9855E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 10:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF6CD1C233B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 08:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78293158D8D;
	Wed, 25 Sep 2024 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Evv4akEb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6C8157A46;
	Wed, 25 Sep 2024 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727254442; cv=none; b=XO8R5RX8/PURueTYqbzf1I457iz299CZzaPZFQXYvsJqXteGEHSp8c/uCmgs/V6UTwpT2tGo85fu7vfEndpnXarKfFDxkee8UxE0UXDBo5SsBeGqI+AdRrV5MIz/fiaGCF2jO36OgAmojsGQHrkz6lhoxVjvHCbmjrMq+U0yaWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727254442; c=relaxed/simple;
	bh=1zWwlFWmFVwYVAzytW6yvqI5W4QRdh3sKMqwLclSRPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdGsmB4u2eT84IVzB0UhQs5dAFBboDJRUTUdhdLI+6qXZdztH8myv9f03wCDW8UlJHaxxpdXnGofXQ0zfhfbZO/5hzOlg1Ne2UCmseIfYWjl1g1LZd29cj4U5lpp0UpLr27vbeiFoC9g4MwEu1gnZA63baQs1fCMsxdqzqAYVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Evv4akEb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D1DC4CEC3;
	Wed, 25 Sep 2024 08:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727254441;
	bh=1zWwlFWmFVwYVAzytW6yvqI5W4QRdh3sKMqwLclSRPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Evv4akEbOILJlNV7aFx1NjrXQX5vMFBvUQXuYWx6lTqjoogKLcK+mJ6vpmFUiGPft
	 hRawpDFDggiD01yqjpHqZKXfhtvKDqcwuwQQoerRyAPAMZVSVHHSlTt2lg7kgZZ3Ol
	 Rce5zTXOiLYjHyNKybBGR4P3gRB72YoWHCIZwlNLoPSi4Qup1HyTlPZeflgMgXbXJS
	 WeRgnlgQgdWIP1eQMwsnJPH39XxnDgF+2j7bz83p0z83SIP7tRURML5qYh6RLlivNS
	 iYlVawl3a0YUDW2dTIRnPi64KNEAwuhrOTc7uvLs5ckmR+bPNnZDwwQls2ADWIARqf
	 h9feHkD2TSU0Q==
Date: Wed, 25 Sep 2024 10:53:57 +0200
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	srinivas.kandagatla@linaro.org, a39.skl@gmail.com,
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org, vkoul@kernel.org,
	klimov.linux@gmail.com
Subject: Re: [PATCH REVIEW 1/2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n)
 macro for DSM_CTL and SEC7 regs
Message-ID: <ZvPPpfobvDmmTCfi@finisterre.sirena.org.uk>
References: <20240925043823.520218-1-alexey.klimov@linaro.org>
 <czlx4thp7thnb6jrauilpbtzgbq637rmnwlpifxq5b5jfa3lqm@toyy3b2viscr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="irEqxi+ka1OxLIPG"
Content-Disposition: inline
In-Reply-To: <czlx4thp7thnb6jrauilpbtzgbq637rmnwlpifxq5b5jfa3lqm@toyy3b2viscr>
X-Cookie: Editing is a rewording activity.


--irEqxi+ka1OxLIPG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 25, 2024 at 11:27:54AM +0300, Dmitry Baryshkov wrote:
> On Wed, Sep 25, 2024 at 05:38:22AM GMT, Alexey Klimov wrote:

> > +#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)		\
> > +	(0x0434 + rx->rxn_reg_stride * n + n * (n - 1) * rx->rxn_reg_stride2)

> This is a nice hack to rule out n=0 and n=1, but maybe we can be more
> obvious here:

> (0x0434 + stride * n + (n > 2) ? stride2 : 0)

Yes.  We could also use some brackets to make the + and * precedence
obvious.

--irEqxi+ka1OxLIPG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbzz6QACgkQJNaLcl1U
h9BAYQf/YgiwTSgbZyHotiHwyPV5y+CGjF1uCjiLDGpUl6fQvcBBXnFs7kg0zBGn
awD0JqOtywgMW7B9hdvskzi9mThnJq4ab8sWB39c9RPvYYKswcsaNj10LxURjxfX
WWmg08RzTKSnqubd5tijYAdg++OfwcAPbU9C8ZxyHs+xPgJOYNveWH9DUDu7p+ga
tQSZkc5OArWpAtPNiQJR2r3b7Ys6YIk9vOZfrPWy2WGGM/duR8bvy0V2yyndEWo0
fA3XF+1HQ4BPmHOVcpvqhBrrGqYunoK2VT1dqhdmWJsu9OS9CedPwbXsx9p7WHbt
FzSoZOaCJJmax5da7Yx2OpdpQjf+XA==
=Xc1o
-----END PGP SIGNATURE-----

--irEqxi+ka1OxLIPG--

