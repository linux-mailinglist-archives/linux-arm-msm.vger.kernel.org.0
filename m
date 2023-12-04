Return-Path: <linux-arm-msm+bounces-3330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3ED803A2B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 17:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72D071F20EE2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 16:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1682E3F7;
	Mon,  4 Dec 2023 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZAz5lrX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C7B5395;
	Mon,  4 Dec 2023 16:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FBCC433C7;
	Mon,  4 Dec 2023 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701707237;
	bh=IQD+6ShDGEkoKp0dcPe5eVwpPIHahHs+5LKTlUYoWRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZAz5lrXF0MsmUxmKEUnEnrSGsVQrfEXwAPB2a1IgDjow5aNH8jFQttH/k+IbYv/k
	 BGw8SpLhg9MSOhaf+iz3WFFkFQm72fz7FVFMZuA4KSAzS44CRZ22vyAf92SBCcBD+y
	 cvRpFvkexiT3G/4gZ/reQh4isO78WL5jzBiCRoz2qC7Vt57pA3xgvfJLTvfZOhmMsi
	 ZGi3fQG1OgGbzh3RqXlTri40RwB/Nme1Dkx50n0GP9E5ChoSK235RQT766IVsGEYG7
	 WoEoqdjZ49zI3IrDicthfNo/e6Qpop4jSZ86zNk0oh6vSwgzxZqIXPJny9W1W8R+BI
	 AhPRVa/B4zv4A==
Date: Mon, 4 Dec 2023 16:27:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: qcom,sm8250: Add X1E80100 sound
 card
Message-ID: <20231204-salami-condone-f10b45e09828@spud>
References: <20231204100116.211898-1-krzysztof.kozlowski@linaro.org>
 <20231204100116.211898-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0c/XrDjxI3neAjwL"
Content-Disposition: inline
In-Reply-To: <20231204100116.211898-2-krzysztof.kozlowski@linaro.org>


--0c/XrDjxI3neAjwL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 11:01:16AM +0100, Krzysztof Kozlowski wrote:
> Document bindings for the Qualcomm X1E80100 SoC sound card.  The
> bindings are the same as for other newer Qualcomm ADSP sound cards, thus
> keep them in existing qcom,sm8250.yaml file, even though Linux driver is
> separate.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--0c/XrDjxI3neAjwL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW393wAKCRB4tDGHoIJi
0uSaAP9t10prS2rDvL4Vjq/XD55wIkALOkf52ckItqXbEvt+rAD/YxHy9M/SpJrk
B2I6lPxE3KmwSmHKhi8KV/szOph/YQo=
=5fPr
-----END PGP SIGNATURE-----

--0c/XrDjxI3neAjwL--

