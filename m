Return-Path: <linux-arm-msm+bounces-4253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C3680D428
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 18:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47E2E1F219EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 17:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564054E61B;
	Mon, 11 Dec 2023 17:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dr1tUscW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAF44E601;
	Mon, 11 Dec 2023 17:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAB1C433C8;
	Mon, 11 Dec 2023 17:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702316370;
	bh=O6AOhUXq8XE/FHy4bPs9tLe8C7adGEEQpi6qHeKwxvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dr1tUscWRDFTAj58M2+OjPEC0HEZ/kAi6sHKEk24hQ2XyZBlKHO8vrVOZt3N+0znC
	 n/G2QIuH6lJtUFPvfBfBKIS0m+kJCjCmnIItUEztD31mT60ezJrEjOXluhigcPeVR3
	 1CxSuiB51PXHJwn2AS0wTLRUcD/+FEB/s2k1AzoJfyDB1U49pibrM7d5NKmpZdoz7t
	 pMLIiY+III374wx1Ji+BZpS9BlkG+e0dW/kiS7z3/KvHpfeRnczOGqgyNaRVu70+Cv
	 GBh/bDhh09tnJ3CBdTv+qSKXgYVQ4j7ndooxAtzWhg9Yv2BwlJmm6A71q1RGd9Q0KJ
	 0GW/yvOWLp/iA==
Date: Mon, 11 Dec 2023 17:39:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mmc: sdhci-msm: document dedicated
 IPQ4019 and IPQ8074
Message-ID: <20231211-blurb-colonist-af57c8c74ff2@spud>
References: <20231211085830.25380-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y3JNkiG3IRiGRNIN"
Content-Disposition: inline
In-Reply-To: <20231211085830.25380-1-krzysztof.kozlowski@linaro.org>


--y3JNkiG3IRiGRNIN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 09:58:28AM +0100, Krzysztof Kozlowski wrote:
> Add dedicated compatibles for the Qualcomm IPQ4019 and IPQ8074 SoCs,
> because usage of generic qcom,sdhci-msm-v4 compatible alone is
> deprecated.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Docum=
entation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 86fae733d9a0..c24c537f62b1 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -22,6 +22,8 @@ properties:
>        - items:
>            - enum:
>                - qcom,apq8084-sdhci
> +              - qcom,ipq4019-sdhci
> +              - qcom,ipq8074-sdhci
>                - qcom,msm8226-sdhci
>                - qcom,msm8953-sdhci
>                - qcom,msm8974-sdhci
> --=20
> 2.34.1
>=20

--y3JNkiG3IRiGRNIN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXdJTQAKCRB4tDGHoIJi
0tXvAQC0yIMoEs0QjZaKYhKOM/7LGjW+c2GpVAf8yCG/qgw8wQEAxw3wwBBHVtsK
VUjNIMFzAEUlM5nFZyczrZIYAKoZCQ8=
=0Z1o
-----END PGP SIGNATURE-----

--y3JNkiG3IRiGRNIN--

