Return-Path: <linux-arm-msm+bounces-22329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4DA904104
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 18:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34A37286E0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 16:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B41F3BB25;
	Tue, 11 Jun 2024 16:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohSHEeJv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D791CFB2;
	Tue, 11 Jun 2024 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718122707; cv=none; b=NdJ1DHcDyheXpwUtyIoQhVfMNlO0ltOsQfxs/K9nRZ2M5DYpTunbPXJeDhukBlBDGu2NWQWGo0YukI1Cs3GTzRe0EkJZ5duRxt+CFi62UP7uB3QK18ctmpIesSKoe8knrG16QQHvxXPpGciOLp/rLTy1bS+tlt+pDZz+PdVHp38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718122707; c=relaxed/simple;
	bh=BXCo5tYRXnp4nFR9iSjOtaso98PV85SmlYISucj3UX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+wLV5ACLh/DPbPR1CpssyZQsHY7se+Z/nXaawAlqyC4keNKfUgD2buGRIqSecQ7uDTUA2AwjJLOUS8k3e7Je5z+upvTfrAYLZESPMl5QuxG6hd+hGL8gqBtMmfQjeKVKjIgJ+U0BhxFsv4rK93PXnZr/hn62GFuPDHQJ5hyMJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohSHEeJv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E1EC32789;
	Tue, 11 Jun 2024 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718122705;
	bh=BXCo5tYRXnp4nFR9iSjOtaso98PV85SmlYISucj3UX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ohSHEeJvbrchG5opz8XOjoL5wWczUKYg/j0J10BezKCKdWUHh+2BGYj+2R2VF18Mi
	 XxjPWUSuAVLzYTuQ4L1Id7Wk/3W+3mvM8csSpYEc2KuP9ce/ryb2HxUA1lkkXJbnAk
	 ycthwzrpLuDUuTuRkh4XlaBNI7nC+cxs+PpO8vDpg/C5wHFcqKDsn8W16QnZi0tH5Z
	 DIW824tseUEYQgmEu7R2mIUAN258cQpMsEFlGEu5cwIdxRTn3rfzKktZUsav89+1o0
	 AvPQP/2fbiglHKN++jvchzmV0lV14dKFjLkz9KQ4wYWeH0PdcZS9myKs7/inZQrZC/
	 7oaaF+7qiwjyw==
Date: Tue, 11 Jun 2024 17:18:23 +0100
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
Subject: Re: [PATCH v5 0/7] ASoC: codecs: wcd937x: add wcd937x audio codec
 support
Message-ID: <Zmh4z2F6Q0Z5tWnz@finisterre.sirena.org.uk>
References: <20240524035535.3119208-1-quic_mohs@quicinc.com>
 <171810116692.177725.17513047102055843084.b4-ty@kernel.org>
 <9a14cb7b-8d6a-14b3-1d3a-b61086e4d4a9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9kuz/Ng8fSpME3+T"
Content-Disposition: inline
In-Reply-To: <9a14cb7b-8d6a-14b3-1d3a-b61086e4d4a9@quicinc.com>
X-Cookie: Your love life will be... interesting.


--9kuz/Ng8fSpME3+T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2024 at 05:43:19PM +0530, Mohammad Rafi Shaik wrote:
> On 6/11/2024 3:49 PM, Mark Brown wrote:

> > If any updates are required or you are submitting further changes they
> > should be sent as incremental updates against current git, existing
> > patches will not be replaced.

> if possible please revert v5 and pick new v6 patch set.

As mentioned above please send incremental fixes for any issues, there's
already other changes on top of these.

--9kuz/Ng8fSpME3+T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZoeM4ACgkQJNaLcl1U
h9Cnawf/fREWTBnC0LJb0pWn2slZjuzkeDdemDwGEzINKR+3GWRSgkj7g8EfveZZ
uhpb4kMAETtZZFdqNipbdCdCn0rykBEAg1htIkvk8aCKlDiMKw18vomFlGCHuMyL
OJU3W0Bdj7gK/9It4OcoR5niYSCX8Qga0y+lanU+7yBgVX/tBlJCWduiQamUwig7
tzbtQB+/w+rIFk8hOTD7YDN2L3meLPqHqLxZxAf2VGFwti3ZazGFdDcQTPwFEGgL
uIPG39uCwDr3g1tmX0mcNgg2mOBnWNLreXER2BxaduXePl3qacANXkFpwD3BxNvn
sC6Abb/j+iurQFMG0e5eZVdgLBc3Pg==
=qvv7
-----END PGP SIGNATURE-----

--9kuz/Ng8fSpME3+T--

