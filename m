Return-Path: <linux-arm-msm+bounces-29502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE3095F41A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 16:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FE441C21BFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 14:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71781186619;
	Mon, 26 Aug 2024 14:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNr8ah+d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429AD153BF0;
	Mon, 26 Aug 2024 14:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683440; cv=none; b=CFBYUA4BRGaoie6dI1aN44nO6s0ttr+op6m568jaoyWiDvskFcpoMlcPMeFNtO/iX4zT8DYFpvV+o+xqtL9F9hLsZ4/ShMKN/PAi1151DBvO7423sbgC7tyViko148lrTvlUT5lxeOrVh98JJ2cy6T082w4WVXQaWff0DgcWOxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683440; c=relaxed/simple;
	bh=O4VWrKxp1GWleAFRVAxqHzy0zSP81EZGnrExzVJHOAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVdHVlA904+etu6TplnShIdbgNVsZTtT+uxZDGhI/3cMv1sdrTsqAd6Bu8YrpzKOBejnhzv4zHOr8/9jVg0lAFGlB+QLCAX/iiatVRx89zu1jDdEshv3oQkEar5S+oiIVOUmYsfiV/0xcWdMvMio1z4BU7B2QMHwviJ8OhunkiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNr8ah+d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85267C52FC5;
	Mon, 26 Aug 2024 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724683438;
	bh=O4VWrKxp1GWleAFRVAxqHzy0zSP81EZGnrExzVJHOAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNr8ah+d2rnHKo5ptAt7ViZdR6b97bEObIGd0mmnJnD8ey1SkGzYkkOHwG+MbfLUI
	 HC5MPhHqZsodRItK8wh6rBH1gxQPBexlDFCEkpbQt6tLO4A5pmQ6IuhjfZe53GrR9W
	 y6w/HhLO9RvXa3pmYvgxBdFEBdfhddMW5dpXTNWvq5a8Zu2reges2NnUhxTtoQVc9e
	 FnXSrmy/bqjx7SrUhdPr1ORB2b9vpBQTKFWzTHOe4nWIxJHJOdvl8OnCOzg1FXBcKk
	 e9044U/8LOsl9pigtAgpvSDPKNcG5Bnkid2ppKoCXdWVORJflx+OEJAKZx8rc1Cyin
	 G87eByZIxc1KA==
Date: Mon, 26 Aug 2024 15:43:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Reidel <adrian@travitia.xyz>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@mainlining.org
Subject: Re: [PATCH 0/1] Add support for primary mi2s on SM8250
Message-ID: <ZsyUqk0JcDxXzzgf@finisterre.sirena.org.uk>
References: <20240826134920.55148-1-adrian@travitia.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2OhJqBqwzjud+qPO"
Content-Disposition: inline
In-Reply-To: <20240826134920.55148-1-adrian@travitia.xyz>
X-Cookie: Your love life will be... interesting.


--2OhJqBqwzjud+qPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 03:49:19PM +0200, Jens Reidel wrote:
> This patch adds support for the primary mi2s interface on devices using S=
M8250
> audio drivers. Tested on SM7150 (xiaomi-davinci). SM7150 sound is close to
> SM8250 and we intend to use it as a fallback in the future.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--2OhJqBqwzjud+qPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbMlKcACgkQJNaLcl1U
h9BauQf/dE/c4FhAbkfP0xa3ksmISKFIrlSbZmMy8d1cWAT3qmTScAjvv9eMd7Zx
Xkesa4LM25NfrDwsDY50GvPFB4h/y71WidUYl78t3av7ZSP/B90UsMuZ+0MtybWK
TTPZP/oO3GzZ85qLU+zxHxGUJPB4trmKE+zCZRJ4ri23AFpQNIw8AQOjg080NGrw
6yTuLYbvaG4VHMWJQn4yw83vCFpk0ms3Zw6JnCPb8fTJYokDUVAaeCbPYU4U7Gc/
ugYbsGdCuXK8/eOdH2l927CnMcYlwhUMVEd0C0ZfI+yh0j3RjhYp3xVNs98N0Vh7
Uyt0CEVxZph4bHWFA2HGiNI6YTpNtQ==
=lS+U
-----END PGP SIGNATURE-----

--2OhJqBqwzjud+qPO--

