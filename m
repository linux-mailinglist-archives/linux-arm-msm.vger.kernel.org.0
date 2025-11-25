Return-Path: <linux-arm-msm+bounces-83327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB97C8749B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 23:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4DF564E30E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 22:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A0333A715;
	Tue, 25 Nov 2025 22:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lweXo9Gj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACC533A6E9;
	Tue, 25 Nov 2025 22:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764108522; cv=none; b=Y0HNaGQaVPvmcpkX4136wW6kfVrKlSwBvYbkN/mz4jcHaF8FgbNgnndgIfXNLwrTMmmynT1LNnUSxeoKWNy+5UWCg+m6Nq8RFw5UFQfwdbtQiVy+qG6lLv+XZ/RsjET1nfk8x4b3L2DM6H5l7zLAOcfgc5udSV861OF7rJa4eTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764108522; c=relaxed/simple;
	bh=2O6sG15Fq7cdAVw0A+6zcgiyimo2hD0OIHor8kxHQ84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WeIF4TRW7cWexG8UrTKGhQKc7v1H0CKF5otX4+n2BVwWL5y9FRLvAwrFLyJZXQRyG/rnUMMqwy1RD4faevEwoF6nUIgOEqTMEwlz1mcEJNlthGTVky1Um4TdJrnfflDwCPHnV6Shr4y6qNlzbV6xUBxYz7Y+gEX2Z8VkQ6gVOyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lweXo9Gj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E835C4CEF1;
	Tue, 25 Nov 2025 22:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764108521;
	bh=2O6sG15Fq7cdAVw0A+6zcgiyimo2hD0OIHor8kxHQ84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lweXo9GjJp3xqdBZhDUpx6sWXh329RLbThA02/DAk3ocyq4RZZl+Xf4w1NQt/B77T
	 KE2xbXWd9iwuooiU/aUwca3ZoQDiRApGJaVCHsV6s1YQmj7uuZjL/oji3lPtzk7PN5
	 gyGmPq+kj2NxY84+nanrqqb5BgoQ/iz9uPnhodFJtmvVYf/l1b1q3Wk8tpjt8VWT4K
	 9Jhj0Mphtoy4cOqdhJits9ihNNSjh3yfU7+00I6EJx7d1PtNjuxuY7sZYY+ymqZ36U
	 vmKTN1K8PpOwaLnore9qOP3qdfk2qk2GXpWIcg6Fx+P03/RtsgnjezkNR96e38+nnz
	 JK/9OWqe6AnpQ==
Date: Tue, 25 Nov 2025 22:08:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ASoC: codecs: lpass-wsa-macro: add RX4/RX5/RX6/RX7/RX8
Message-ID: <9a6ca5eb-bcfa-41f6-b35a-e2831d5a9f02@sirena.org.uk>
References: <20251121060437.26704-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jderwvJI3m3zPnVj"
Content-Disposition: inline
In-Reply-To: <20251121060437.26704-1-jonathan@marek.ca>
X-Cookie: Goodbye, cool world.


--jderwvJI3m3zPnVj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 01:03:30AM -0500, Jonathan Marek wrote:
> This allows playback using the WSA_2CH AIF, which feeds RX4 and RX5 on bo=
th
> WSA and WSA2.
>=20
> RX6/RX7/RX8 can be tested with the regular WSA AIF (the 3rd intf is RX8,
> the 5th intf is RX6/7).

This doesn't apply against current code, please check and resend.

--jderwvJI3m3zPnVj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkmKOQACgkQJNaLcl1U
h9CyZAf+KvFLhOzBQiU9u8XA8Q5Ss5r6Wq/Z7zxHPZuHY+BRD1g5RjGw/jOUb/14
Pfp9Aodl1LR9r5itXDakQvIQICnDYlqzsjKMMFRL8rLhEZL7jxvCWQ+1nA5X8R5z
Zgvchkri8qmNVrn85KUBL4Zl6ZpENKyf9rLr+gEPL6SU/3zd9XJDUslvnePICl/w
QP7rTZaxz39G1fdbjobXIDdtj4JO3so4yGYACMGW7n2kaT1Dx0qwHSD8966jM2Gq
XrHyXRKUEdxYqxbz0JXdG7DPZ6pYAf2uscz44Egm+VKYwnEqtgW/MCfgiz4h9ZpF
A5Hr1j3hA8E1+UcMc8NTEVqdhZoGUQ==
=ul4i
-----END PGP SIGNATURE-----

--jderwvJI3m3zPnVj--

