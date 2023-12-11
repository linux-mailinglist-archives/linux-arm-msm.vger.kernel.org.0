Return-Path: <linux-arm-msm+bounces-4249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E480D3CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 18:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 896031C21621
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 17:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736C14E1CE;
	Mon, 11 Dec 2023 17:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ksf5gdIj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455394C3DD;
	Mon, 11 Dec 2023 17:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A324EC433C7;
	Mon, 11 Dec 2023 17:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702315795;
	bh=LG9yC9T7WxDhr+BiUl3Dho2W3NGuanNuq2BwSSb2m7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ksf5gdIjvH4DynRW4uEWQpgrSlQ3E928IhMDsDZtLZ3Dt3HV/7GDqj93NZ+x0Wyeo
	 IurfMVxHjn6t507JQ1NrLC77E6y7MBZECoCktB7XuWMuN7k8VzJ5QVctnj+FsvsDMC
	 rRtse8JR7Z/d7PqqSEzK4b2mmCA99YAWi5dBFkMg+xcGYGWt2RNxa6LzOOwWjVe0U3
	 kZtKleeB2h68a6KhREyltBOM22qHz5e0D0b6+G/FsRDS3sYSw5cDWXl2o6Yr8YnWCp
	 Rusvi/R2boGbUY+iVdFPHeUEaBA1mIPWv5Sd5PsauUcGtoSOWNTpAf9xXfmH1bR/GE
	 mnfShQzYVVHIw==
Date: Mon, 11 Dec 2023 17:29:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100
 LPASS RX
Message-ID: <20231211-cardstock-elevator-3e19f9d41ac2@spud>
References: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2LNFTi2k/ijpYbVF"
Content-Disposition: inline
In-Reply-To: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>


--2LNFTi2k/ijpYbVF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 01:31:01PM +0100, Krzysztof Kozlowski wrote:
> Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
> RX macro codec, which looks like compatible with earlier SM8550.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I wish you'd send cover letters when you send series of trivial patches
like this that could be acked in one go.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.=
yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> index cbc36646100f..b8540b30741e 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> @@ -19,7 +19,9 @@ properties:
>            - qcom,sm8550-lpass-rx-macro
>            - qcom,sc8280xp-lpass-rx-macro
>        - items:
> -          - const: qcom,sm8650-lpass-rx-macro
> +          - enum:
> +              - qcom,sm8650-lpass-rx-macro
> +              - qcom,x1e80100-lpass-rx-macro
>            - const: qcom,sm8550-lpass-rx-macro
> =20
>    reg:
> --=20
> 2.34.1
>=20

--2LNFTi2k/ijpYbVF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXdHDgAKCRB4tDGHoIJi
0nU+AQDVDBF2Ue5mLjfFa/+I6TWQM2yfHXHlsApXW8yIzl//igEAgY0GeYGSN98Z
iBGGvTxVPokVS73NbLliSfIW9xpVwwg=
=MyYY
-----END PGP SIGNATURE-----

--2LNFTi2k/ijpYbVF--

