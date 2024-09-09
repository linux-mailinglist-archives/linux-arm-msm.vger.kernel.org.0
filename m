Return-Path: <linux-arm-msm+bounces-31351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE764971DA1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 17:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAC7D1C226BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783BC1B27D;
	Mon,  9 Sep 2024 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pi0osoIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488CC1CD0C;
	Mon,  9 Sep 2024 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725894636; cv=none; b=Z7aWSZ8vRy0WmfeXv2L9mQdDXNV8AnGkFGHK1FXtc12kKsnpGKaLguc5ij9IO6uihybx2d33MwMbFrsXkXtW+LeevRYMEMupHINmbFrK05gWIYB/kFOcLd3aejhR/lhav4wCTBxLWGnskWs4QQJsy6/2ZYaqtqmOnMXnP4F5Uzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725894636; c=relaxed/simple;
	bh=+iq8ZuR0xNfhMb6f8AZQy5xUVme4rLtghqLGlbhb6LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DArp4kEm9JuoLtz+uozYLLas6bGdIE997to2u5ATfFean5Pg4AtkH4Wdol9QO1thg89CMvhHralOgHN4Y/Nm+k4MpxklA1U2qZfAZiHoGVxkLh8Ayl4RlFZ23SraZVYbEqJgy8PFNYyjKA/gg8PSxzQbncQ+Cz8zeGv772/dCN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pi0osoIL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0608C4CEC7;
	Mon,  9 Sep 2024 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725894635;
	bh=+iq8ZuR0xNfhMb6f8AZQy5xUVme4rLtghqLGlbhb6LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pi0osoILqDfQAZmIUTrsSAIV/aKtDdNvbWcXzcx7nl3NC0WX+PYB075uPOwwRS1hR
	 VYWy/gqeeF3XYKLdYaHZTCVuwJSWVsxbLidm8thp+q6OqltvvYt0NjsjIjrN52IlKO
	 GJtcyIQiWegtjExazp3FS3oP6u8QKDJ+S9nTOPw1e61kj1tKEodXVHnPfvk5bOJjXV
	 DDGTSGQPCbGn620sFJGLJPQeQ790MpHBwE1vgiyuLGlYzZBjamAlG4hdJrOz5oSr1Z
	 82TaHkrqlFCeajdf94jPTmc9rNbsh6TF7wZDcZSG/wYwH1J1/okQlijxvMl3ou0llk
	 G9qKJtWhURwYg==
Date: Mon, 9 Sep 2024 16:10:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
	kernel@quicinc.com, quic_pkumpatl@quicinc.com
Subject: Re: [PATCH v1 0/4] Add static channel mapping between soundwire
 master and slave
Message-ID: <fb137d59-c8ef-4e02-89f6-9abf8a3f12e5@sirena.org.uk>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
 <Zt8LC4IY7DGq8Qom@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0VQUlaAE/r6Fm+ww"
Content-Disposition: inline
In-Reply-To: <Zt8LC4IY7DGq8Qom@opensource.cirrus.com>
X-Cookie: Anything is possible, unless it's not.


--0VQUlaAE/r6Fm+ww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2024 at 03:49:47PM +0100, Charles Keepax wrote:
> On Mon, Sep 09, 2024 at 04:25:43PM +0530, Mohammad Rafi Shaik wrote:

> > Add static channel map support between soundwire master and slave.
> > This patch series will resolve channel mask mismatch between master and=
 slave.

=2E..

> > For AMIC2 usecase, The Slave need to configure TX2 Port with channel ma=
sk 1 and
> > for Master required PORT1 with channel mask 2,
> >=20
> > In existing design master and slave configured with same channel mask, =
it will fail
> > AMIC2 usecase.

> Apologies but I am not really following what exactly the issue is
> here? How do these ports map to DAI links? It looks like you are
> attempting to have AMIC2 produced by one DAI link, but consumed
> by another?

Yes, and it's also not clear to me why this is device specific.

--0VQUlaAE/r6Fm+ww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbfD+AACgkQJNaLcl1U
h9Au7wf/U9b5eAsInNOjUnuTMx81qHdkNyxcwOyRGo9BnLIEeY6WEzH5BIgSkVVj
kHf250hHlRGglWrR8zCVesc1yH0X66KZ9+rTH+7cW4SH/V9CiWHy1Z69VZie2N3Z
wi8TPB6W+Zq9m2BrIu+8BUs+UBuwMuVfAkZnrkZhclRJceOkm/wL2dHXSJ+xfFdJ
cFFYNNsri7IJ4M/+DtefOnrEcvvYEy9mWAO2tEvIYEYT+6pk1wy5Hbeqv9s9BF62
Mj1DoIUb3iRlKGk/717jqIEXSHoR7Hx9UDphrXZAumPxb0uw5rWYI2l8dmqwKpxL
wc9eUX2wlWjnRnKGP+2G8j/lMSa/4g==
=eard
-----END PGP SIGNATURE-----

--0VQUlaAE/r6Fm+ww--

