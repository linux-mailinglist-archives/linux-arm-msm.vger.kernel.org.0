Return-Path: <linux-arm-msm+bounces-22518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECD8905CA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 22:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C91C21F23422
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 20:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B0E80BF8;
	Wed, 12 Jun 2024 20:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iV+zO8I/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D61182AF;
	Wed, 12 Jun 2024 20:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718223513; cv=none; b=T308emVT8Wmt8Amv9DIPWhy4qGdNXdYThGHCcNc/31oCxK+jzxJ6Us0MZp12Wm+GSMLqxAlHqDAC2XDnUrlXKeUM4D7WJCGrWwaR1a9Sv9G8ThzI28RTVTjdpp/e1N0DYlcfkzLRKsTmEnjjD0d8h5z9SYG2v4GQ1xvrodxYw5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718223513; c=relaxed/simple;
	bh=njGhKPnNqXDaLAWemur/lSMydRb9BaPJzA7YroBJXy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ET5GdY+euNsEkLn28WVQBT6TYW027tphr9mZQJFEjL8BCtx4R8uwSfTMFdO6WNPz0bXL7WHCt23kIt2vWRp1jXsLOUAG4+rfQbUngsKHvlWmUMcUNm9o1Vn7irKxFa/fpmeZGl5X9oQMIii2MZGYqX7OaVmAJDIIH0rqa5eoeC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iV+zO8I/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2478C116B1;
	Wed, 12 Jun 2024 20:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718223513;
	bh=njGhKPnNqXDaLAWemur/lSMydRb9BaPJzA7YroBJXy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iV+zO8I/CZs5wVgnGn3iLOpGco8Aw44kDAKoN8T8ukmZ+WjHSHIR2Iimg8WXrxe6v
	 GR/8Aytc0zwIbIfe4fxBz1lqBShMyACZbrcOGkLPqwVJwO14IbQBK8ucBiJDjU2rDZ
	 qu7a6P9Hbfzh0fNxgM7K7uVBSPYTXqV9LGvQkW2Nn4G1jKEAWyARIupKdrUD13k6SZ
	 7PXkHf0cB14H/DBklsZFDV367YpLBg+mxCidFtEVmopFamOeGGQNDPAEl/X1QHILi6
	 I2JB3ev4uy/z39IubhRxgPs5uad69IDt8nZR8xkVx9dEdrIHktuNdpfcaHK9OhOwJv
	 ovMzTgm4UjlUw==
Date: Wed, 12 Jun 2024 21:18:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Banajit Goswami <bgoswami@quicinc.com>, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 1/3] ASoC: codecs: lpass-macro: add helpers to get
 codec version
Message-ID: <ZmoCl16mACdJU5Qt@finisterre.sirena.org.uk>
References: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
 <20240612-lpass-codec-v25-v1-1-9f40611a1370@linaro.org>
 <jowqhnspiai4ydp7m7mn3p654kufg4ufbm2iexjg5dqbcxqatu@jfex2rnes5vu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xapvb1KMCPCdZk/7"
Content-Disposition: inline
In-Reply-To: <jowqhnspiai4ydp7m7mn3p654kufg4ufbm2iexjg5dqbcxqatu@jfex2rnes5vu>
X-Cookie: Your love life will be... interesting.


--Xapvb1KMCPCdZk/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2024 at 09:15:21PM +0300, Dmitry Baryshkov wrote:
> On Wed, Jun 12, 2024 at 05:57:21PM +0100, Srinivas Kandagatla wrote:
> > LPASS Digital codec have changes in register layout across multiple
> > versions. Add a proper way read the codec version allowint all the lpass
> > macro drivers (tx, rx, wsa, va) to configure the registers correctly.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--Xapvb1KMCPCdZk/7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZqApQACgkQJNaLcl1U
h9CpnAf/Sl3IB3d6N7vAnrXggB6qM/9ur6uBFSna4TVicmPaBDqdKWmW70JbgFiQ
UXqpmmTwqtSi5kYlBBJlCzvWO2hftIyp2uLokrWDU34hjb7QuKnBGRTK7ULPabd1
ZtzQ9NlPXFeV1bWI2UfJz/x1glSSUzEeQOodpH0JdBKkUf7GFNgfCGEiXJ32qm55
FNRQkSrg4ZjVZIx0uvkuERG+kOVobl5qxZTrL+7qnR+KBf45avv4x4ygdLtTtt/C
q84Ij7bm+7qtzH+c9YSIIhE3B48iV2caBc7sGLh8va671JUsRdVNaL8x/VglZvEr
QZ7FtzG4tzNzIe93tzJBOvk+RffeMA==
=d1jY
-----END PGP SIGNATURE-----

--Xapvb1KMCPCdZk/7--

