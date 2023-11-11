Return-Path: <linux-arm-msm+bounces-499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7F67E8B98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 17:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFDF31C2074C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 16:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A5218E3E;
	Sat, 11 Nov 2023 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ia4YKeMp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55F19BC2;
	Sat, 11 Nov 2023 16:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52ECC433C7;
	Sat, 11 Nov 2023 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699719870;
	bh=GKClXD6GTs5Oe+8N+6T6uTSKxWAvXwwhgME3dE69DWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ia4YKeMpG9rSsEq3hD1a5IKv88nxmCe3BKpAPUdJD+Ya4zgGwkdBHTiJBtzVY9xZB
	 h3GqPZjtaWpzBfyEi8ceV80bQ1VwYje8yKIa1AHBRN88AjxhzwJz5QSf6UL8A40I7v
	 p114zGSA59Fj4i/Ce2ls+JiTywezvTb4XyGW8YSaIYOUz+MuKqvzpZGKbQ3Z8BH5UE
	 4h/vkBws6PVMBfrNyMeKBkX4NJ6hWfdCSMWlma3Hv/0RYi7Azw9pNw5SjJmRtxyOjs
	 xjdjbYKygvIRfcIR19lzll9fOYPn0dN99fQESZ3EhXi4vl2A05LvXCyljNJ2VTiOQH
	 r/HZLocG37oYw==
Date: Sat, 11 Nov 2023 16:24:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: adjust number of interrupts
 on SM6125
Message-ID: <20231111-credible-omnivore-656130622958@squawk>
References: <20231111141953.51841-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Myb6ZhNzaHjc+lW"
Content-Disposition: inline
In-Reply-To: <20231111141953.51841-1-krzysztof.kozlowski@linaro.org>


--8Myb6ZhNzaHjc+lW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2023 at 03:19:53PM +0100, Krzysztof Kozlowski wrote:
> Qualcomm SM6125 DWC3 USB controller comes with two interrupts (verified
> with downstream/vendor code of Trinket DTSI from Xiaomi Laurel device).
> Move the qcom,sm6125-dwc3 to appropriate place in allOf:if:then blocks
> constraining interrupts.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Docum=
entation/devicetree/bindings/usb/qcom,dwc3.yaml
> index 64043b91ffb9..3f41362b2a91 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -375,7 +375,6 @@ allOf:
>                - qcom,sdx65-dwc3
>                - qcom,sdx75-dwc3
>                - qcom,sm4250-dwc3
> -              - qcom,sm6125-dwc3
>                - qcom,sm6350-dwc3
>                - qcom,sm8150-dwc3
>                - qcom,sm8250-dwc3
> @@ -408,6 +407,7 @@ allOf:
>                - qcom,msm8996-dwc3
>                - qcom,msm8998-dwc3
>                - qcom,sm6115-dwc3
> +              - qcom,sm6125-dwc3
>      then:
>        properties:
>          interrupts:
> --=20
> 2.34.1
>=20

--8Myb6ZhNzaHjc+lW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU+quAAKCRB4tDGHoIJi
0r8eAP9enjrVOoi1KjZy3pS4wNk/dw2cmGZGu8BLhIKkrJ/bkAEAqgolF9+SK2Op
6vpVoYMg53Uh4MsnhxTTUEH2xSZC+g0=
=mUHv
-----END PGP SIGNATURE-----

--8Myb6ZhNzaHjc+lW--

