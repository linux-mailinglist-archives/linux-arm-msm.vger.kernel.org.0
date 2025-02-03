Return-Path: <linux-arm-msm+bounces-46746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB9FA25AAF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE342188189F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C07204C2C;
	Mon,  3 Feb 2025 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aG69+6X/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B22A20012A;
	Mon,  3 Feb 2025 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588802; cv=none; b=TlNbfH2P1aKckcPdFA/6r4RarrTBz7KMg9Ea66i5bl4nGNGMBWRPd9qHjQa8Q5slaeBli5iuZWMSOV5iz6pvWxDofgTkGcByZlntnVDV7gqB0X7JKiecRyPgyIse8WhEfCy+zBAMEt3uVp2Sa/Dq+fJiy/bOlJSmWHGqBdYVdlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588802; c=relaxed/simple;
	bh=ESQrnKqHCQzgAyhKMYNeFli9rDbnwZV44iLYlscj9QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWXBqnXKI0euDbPEskTZZdAuJx42jo90TitvETa8cidDIgNhM2NDx4xG/5MGq/4x8tNPj9eqzKLgm4ERQ+JH4bnX/xQXv1C/iShr9eNMe0Wfw2u8iBYc1l+KUVe6BUyPIZtfNQ0QC7bgyMDW9pqOiTp/fSXRLOWImlSo/rso72k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aG69+6X/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EA7C4CED2;
	Mon,  3 Feb 2025 13:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738588801;
	bh=ESQrnKqHCQzgAyhKMYNeFli9rDbnwZV44iLYlscj9QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aG69+6X/iEWfwB1ZAmjOn5g6+ZW3GIXxLdzSQ/v2ZtnXRUS5DHZiv2P9MsLslVpuN
	 /+jpmpPJurfWoAkiKlwBL8qzXGBHNFaEjj3pza4wJqjAMN80/DHCndh5Su/7Jggbnm
	 3Adpw9EZi26Ub0P7/+XgzLZLQTrA92zDMdNcNo8Io/sE24fq0egXRBxd2urZAy1qi5
	 r96cQKzJEMtmNBkXNnkupJBr92o2i5fRsPu8+3ZGErVJjvsuBJK9nPexb8TTl5DXP7
	 qt0soNIr0/+80SL4YTM3GkBJ+clzDuas0Z996PS0MKKOw+wVtpZ2Wx0z8rfHffmseA
	 U7RuQVRuywrkQ==
Date: Mon, 3 Feb 2025 13:19:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_pkumpatl@quicinc.com, kernel@quicinc.com
Subject: Re: [RESEND v5 3/4] soundwire: qcom: Add set_channel_map api support
Message-ID: <a82a33a8-d27c-45c8-a39a-58e6357e0d99@sirena.org.uk>
References: <20250123042823.2067740-1-quic_mohs@quicinc.com>
 <20250123042823.2067740-4-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Eq8RTpKzgOkqoEb1"
Content-Disposition: inline
In-Reply-To: <20250123042823.2067740-4-quic_mohs@quicinc.com>
X-Cookie: This is now.  Later is later.


--Eq8RTpKzgOkqoEb1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 09:58:22AM +0530, Mohammad Rafi Shaik wrote:
> Added qcom_swrm_set_channel_map api to set the master channel mask for
> TX and RX paths based on the provided slots.

This breaks an allmodconfig build, and arm64 defconfig:

/build/stage/linux/drivers/soundwire/qcom.c: In function =E2=80=98qcom_swrm=
_set_channel_map=E2=80=99:
/build/stage/linux/drivers/soundwire/qcom.c:1283:36: warning: unused variab=
le =E2=80=98sruntime=E2=80=99 [-Wunused-variable]
 1283 |         struct sdw_stream_runtime *sruntime =3D ctrl->sruntime[dai-=
>id];
      |                                    ^~~~~~~~
/build/stage/linux/drivers/soundwire/qcom.c: At top level:
/build/stage/linux/drivers/soundwire/qcom.c:1335:28: error: initialization =
of =E2=80=98int (*)(struct snd_soc_dai *, unsigned int,  const unsigned int=
 *, unsigned int,  const unsigned int *)=E2=80=99 from incompatible pointer=
 type =E2=80=98int (*)(struct snd_soc_dai *, unsigned int,  unsigned int *,=
 unsigned int,  unsigned int *)=E2=80=99 [-Werror=3Dincompatible-pointer-ty=
pes]
 1335 |         .set_channel_map =3D qcom_swrm_set_channel_map,
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/drivers/soundwire/qcom.c:1335:28: note: (near initializa=
tion for =E2=80=98qcom_swrm_pdm_dai_ops.set_channel_map=E2=80=99)

--Eq8RTpKzgOkqoEb1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmegwnoACgkQJNaLcl1U
h9CZ5gf/RKq0pJYT4jqUxq0eZmJYxqCGtZA8Svl2jSDjDuGfFj9MOEaa3U0QpWgF
ztCgzcHRI9+z1LlH/1oxJiepGEoaFBia7iydAg+cI24aj/hxcHDaoLsY25FYUFmb
iRM+kDYUvS+pxIfay5++L10hh8bPtXCEN4XWTCdrN8pblz75Rz02307QhIEBNe06
GrWKzBMY6ZBDYYyDaFxP8lAzwkcdVIEnDzNuwwZxyb1Ahfg7PCIkvWj8sQSUNjCm
nhgzadft8nhHbCZBlLt5tEwW0RTgggiQdC1qWxthEPoVlko8h7GXtuFwf3zp8b4q
dexHux0LVG3hMuK6ES10mkA5gjBNSw==
=OOHD
-----END PGP SIGNATURE-----

--Eq8RTpKzgOkqoEb1--

