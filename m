Return-Path: <linux-arm-msm+bounces-498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3A37E8B96
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 17:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93F19B20AE8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 16:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B4D14277;
	Sat, 11 Nov 2023 16:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pS+4nXjE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE418E34;
	Sat, 11 Nov 2023 16:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711F6C433C8;
	Sat, 11 Nov 2023 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699719784;
	bh=5ApyJFLP36dXfmFHh7CpSrZFu9/cV8AIr8fMVRrW0j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pS+4nXjE01DaLYcI3BzoTy7ROuV7ZjJuf9sU7AFjCuONU1cMYhz4hj2InxpGGaScv
	 y628VcTDA5JPQbKgL5oBTj+oLlxcr0xTHyahhoxXR8ZE5TVuZT/ee3noAUc2c62pFI
	 jeJ7+QuQD0xGvEufBOAvJJqbfAoLadDwmiXoo5AafafkEeytyRjl/1l13uX6KQJUum
	 zh5NFTVvg++CnybV4YFJhcj0fFfmofbytNbM5RERiTDKHNLSiNk/DylJMndLgbrfPg
	 6TYsjJFnptSOzHx0Iq2VgpbMd0gOIqtPgAfKCGEb/q5AViFOO8g9VqGTqH2dbr8PBZ
	 8JD2Whb9Ce52A==
Date: Sat, 11 Nov 2023 16:23:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,sm8150-mdss: correct DSI
 PHY compatible
Message-ID: <20231111-underwear-elf-17d4a88f5332@squawk>
References: <20231111142017.51922-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lcK6iluwpXLPr5CJ"
Content-Disposition: inline
In-Reply-To: <20231111142017.51922-1-krzysztof.kozlowski@linaro.org>


--lcK6iluwpXLPr5CJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2023 at 03:20:17PM +0100, Krzysztof Kozlowski wrote:
> Qualcomm SM8150 MDSS comes with a bit different 7nm DSI PHY with its own
> compatible.  DTS already use it:
>=20
>   sa8155p-adp.dtb: display-subsystem@ae00000: phy@ae94400:compatible:0: '=
qcom,dsi-phy-7nm' was expected
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml   | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.ya=
ml
> index a2a8be7f64a9..c0d6a4fdff97 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
> @@ -69,7 +69,7 @@ patternProperties:
> =20
>      properties:
>        compatible:
> -        const: qcom,dsi-phy-7nm
> +        const: qcom,dsi-phy-7nm-8150
> =20
>  unevaluatedProperties: false
> =20
> @@ -247,7 +247,7 @@ examples:
>          };
> =20
>          dsi0_phy: phy@ae94400 {
> -            compatible =3D "qcom,dsi-phy-7nm";
> +            compatible =3D "qcom,dsi-phy-7nm-8150";
>              reg =3D <0x0ae94400 0x200>,
>                    <0x0ae94600 0x280>,
>                    <0x0ae94900 0x260>;
> @@ -318,7 +318,7 @@ examples:
>          };
> =20
>          dsi1_phy: phy@ae96400 {
> -            compatible =3D "qcom,dsi-phy-7nm";
> +            compatible =3D "qcom,dsi-phy-7nm-8150";
>              reg =3D <0x0ae96400 0x200>,
>                    <0x0ae96600 0x280>,
>                    <0x0ae96900 0x260>;
> --=20
> 2.34.1
>=20

--lcK6iluwpXLPr5CJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU+qYQAKCRB4tDGHoIJi
0pNbAQC10CbyYHGczoldMb1DAzsqaJQkprUd25qRJzlQcGnX9gD9HeEvukvY6AyL
iTOIv+rcLmiuz0PVJXyBzl3XhKQi2gs=
=yiQ2
-----END PGP SIGNATURE-----

--lcK6iluwpXLPr5CJ--

