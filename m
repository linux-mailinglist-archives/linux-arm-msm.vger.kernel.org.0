Return-Path: <linux-arm-msm+bounces-38674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A089D4E3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 15:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 565F1B232B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 14:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE431D86C7;
	Thu, 21 Nov 2024 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pW1jKepJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D9C1D79B0;
	Thu, 21 Nov 2024 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732197789; cv=none; b=s7NGYA5f2yfditsJuZ4kJmEU+wvCS67Wcz5j+p4UXBoULu9rqNinHc1uSV0/aa2YPNi3jaoB0mtSLr1rESDmUP2qdTAdHBRol1DyIKARG+yPPd+xpEhDVO2HUuP/c39CJQIyZLeazb03dG4iIk5N+uorRNV2AeHJ/tw2kuGzh4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732197789; c=relaxed/simple;
	bh=EqoX93a7SSSutDSrjFHpMZeVK/vypQ6MnjJTLZXO/IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJTECjH0NF2ULKfivMv6BZ2yzc0xsatGyEEriGuhxOL9Lr0DgBEd6/1TcXdp5h4h12tPNDLz197ao9hZMHQDBkJnoBYmvFtYaW6zRGq6dkV1fgyQQ3DSVkUp489jucV/sq/adf+5E2qWm980zTs/CgMcqNdhDOpyMxKHh3qO9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pW1jKepJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C56C4CED0;
	Thu, 21 Nov 2024 14:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732197788;
	bh=EqoX93a7SSSutDSrjFHpMZeVK/vypQ6MnjJTLZXO/IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pW1jKepJgOpBBBEEItFDTaXkV9FaIP2tlsyxiTZWrMQ/M3SXodJdqtyVipI9mepc3
	 1BfUi2k94k+W8epnfmcIt5APqxW5//gHUvzgiEKQu1oIVcAmABsCSlRYUHPXFjMXM9
	 2EcPgCTYH2MckodRKgshyh0Ex8AarCVNx6YXjkgIGSLmsEfuqJgjpFPbMOxjux6Xlm
	 jk9srdRE9XX6fmmeWNBylz4eQn1HX1+uBHgxH55gXmBcUL7HH/4UDNzA9FFZO+dn8d
	 sR4MnLdWouSihaOX60ni0lccvUgFeUagbbVALjHdjskbFYBDnl4mS7kq7rEEIpfLde
	 ljd5HLRZusgyg==
Date: Thu, 21 Nov 2024 14:03:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: qcom: apq8016_sbc: Fix second argument of
 apq8016_dai_init()
Message-ID: <387c84aa-dab1-44ca-8d42-bc19abc79434@sirena.org.uk>
References: <20241117232100.23760-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BVF4aMiMiHWSAYi5"
Content-Disposition: inline
In-Reply-To: <20241117232100.23760-1-spasswolf@web.de>
X-Cookie: Remember the... the... uhh.....


--BVF4aMiMiHWSAYi5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 12:20:58AM +0100, Bert Karwatzki wrote:
> Since commit a78a42fb48b8 the second argument of apq8016_dai_init() has
> to be an lpass id returned by qdsp6_dai_get_lpass_id().

This breaks the build:

/build/stage/linux/sound/soc/qcom/apq8016_sbc.c: In function =E2=80=98apq80=
16_sbc_dai_in
it=E2=80=99:
/build/stage/linux/sound/soc/qcom/apq8016_sbc.c:153:38: error: implicit dec=
larat
ion of function =E2=80=98qdsp6_dai_get_lpass_id=E2=80=99 [-Werror=3Dimplici=
t-function-declaration]
  153 |         return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai=
));
      |                                      ^~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/apq8016_sbc.c: At top level:
/build/stage/linux/sound/soc/qcom/apq8016_sbc.c:165:12: error: static decla=
ratio
n of =E2=80=98qdsp6_dai_get_lpass_id=E2=80=99 follows non-static declaration
  165 | static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
      |            ^~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/apq8016_sbc.c:153:38: note: previous impl=
icit=20
declaration of =E2=80=98qdsp6_dai_get_lpass_id=E2=80=99 with type =E2=80=98=
int()=E2=80=99
  153 |         return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai=
));
      |                                      ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

--BVF4aMiMiHWSAYi5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmc/PZYACgkQJNaLcl1U
h9D/Swf/d78eojqXzZ5VOkYr+QjU1ZK0Dbvd72wJ41o23kHzspDvY5OCw/NIU1RP
OGkyFIDnLqEsJ6bNy05h7HdR5gGNDzYBHN+DsvVpGstCmVIZ8JRC3R/Iwym9e8th
tMvCj/I9tsezLwOa9esB5gvQDjLNLKrt/DPyI2ORKEnoS0G1xWwoA0gvldD0iwNa
fIz71HhzFfGCwDqTGIwhqnfggnnNLLYONsiocDIaWIHMWcQzznRuy7kKM8IRgUaS
cDVQt7QFGInhOpIE7mAH5iPq797YnQ05pen+hoGV8DQsGvfkFAZIrhgA/KcyTWrt
PojNfqnAOvOLurJzoA11kK+hvDzaNg==
=LL8L
-----END PGP SIGNATURE-----

--BVF4aMiMiHWSAYi5--

