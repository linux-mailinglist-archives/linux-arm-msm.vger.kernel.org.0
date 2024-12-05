Return-Path: <linux-arm-msm+bounces-40505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 392379E5593
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 13:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86B9282931
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 12:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBDC20CCDC;
	Thu,  5 Dec 2024 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olSZGDcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2021D9A7E;
	Thu,  5 Dec 2024 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733402020; cv=none; b=WGPHQEbps0MeQVyTBGejtuQWKR6qrxlL/Wp9kEprm0CSU03s7VuOJcJjZqA/toTF/WPc4ijqs9FI3QPbFxDlvUTI/iHK0U0XXgFiiqTNX3QEyXtbp79oqRsWYIU8BLFyJE2VCU5GGH2uo/P/WlVpzYEKo/kQgsA0yqkFJ9W4CNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733402020; c=relaxed/simple;
	bh=DPWF0QzJrvS7JQpnkmlzj4hwnHS8dY44UCJdxS0wVkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6kPVE4IMHX9mdcCyduOANyz4QPfXVVVjra8LxtvU3JrraTA64iO4qwnubfbLxs2BS5mjz2L3A5wtDAKok6uNLpKJluX2VV7a61iIUp93+DoihsZBjLdcN95H5WOTop0DoxmIExNcKooL3rb454B5Ppq2jgCgb5hscgN3Es+kaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olSZGDcB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E4EC4CED1;
	Thu,  5 Dec 2024 12:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733402019;
	bh=DPWF0QzJrvS7JQpnkmlzj4hwnHS8dY44UCJdxS0wVkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olSZGDcBNNrdtuuBMIVzRRQyIfM7IG88RLi+5isbjipCJC9UgMejzOst6a96SGdBd
	 DsoliPFcMwV50SudXtcFjyqlAOrcPNBszzKt01dcnHES9NnEMi91U+OKaeq0ZECGUh
	 7LYdddhWdRzA9BybIAUhS1kZQmkAlujDGaHQjlYca/YlSMRu8+Tz4AF4ZqoOmk57Y5
	 PvCEr6pUpebyghKSPvCEv4P6ffChRpH/vy+jpQM2mo/zCdSmsSb/HFhyZ7rFMdQ2wh
	 QMQNXXBIPwAOxiB5HdBTL86Pfm8Jr3BsvVYr4yvwGUjGWjsVn9hSncWwwCrUC7hWU+
	 PdbGXSmaFlgJA==
Date: Thu, 5 Dec 2024 12:33:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dzmitry Sankouski <dsankouski@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: wcd9335: Add define for number of DAIs
Message-ID: <c3d2477b-f12a-47dd-bf95-927e6c0d8fd5@sirena.org.uk>
References: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gWl0fQ2wqvAOxyCX"
Content-Disposition: inline
In-Reply-To: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
X-Cookie: You can't push on a string.


--gWl0fQ2wqvAOxyCX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2024 at 09:40:20AM +0100, Krzysztof Kozlowski wrote:
> Number of DAIs in the codec is not really a binding, because it could
> grow, e.g. when we implement missing features.  Add the define to the
> driver, which will replace the one in the binding header.

This breaks an allmodconfig build:

/build/stage/linux/sound/soc/codecs/wcd9335.c:162: error: "NUM_CODEC_DAIS" =
redef
ined [-Werror]
  162 | #define NUM_CODEC_DAIS          (AIF4_PB + 1)
      |=20
In file included from /build/stage/linux/sound/soc/codecs/wcd9335.c:28:
/build/stage/linux/include/dt-bindings/sound/qcom,wcd9335.h:13: note: this =
is th
e location of the previous definition
   13 | #define NUM_CODEC_DAIS          7
      |=20

--gWl0fQ2wqvAOxyCX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdRnZ0ACgkQJNaLcl1U
h9DfXwf+NRemZpBZfSFc/oGs/hewnY39uNjSyfHgecrP0VUv5ov02TPnnEF06vPj
lX1lzz+3bYKOoCLOAllUwiSCLYUd75OaZqHbbURkitAcoxeoxX8HEJzZ04aJcZAk
cbiMag390on78R/GRWQng+lTzPxSmw7vgmInHdG0J7u1Watm1B6cw05gvzMYs4qg
Eer95W9TC2+f1damedi9nURt6HcqkWfQssYv5R4Q4VhcATq8fgWaJG8w42DWBuUf
Z25LmCwucpVvYsTnirx3GYae2+8HJUS61yyYbJPTT4uT9oNcHU7ZQj4i1krt/p67
V6vuGUnlSznppy/FoR9/ElVpHz7yjg==
=XNkr
-----END PGP SIGNATURE-----

--gWl0fQ2wqvAOxyCX--

