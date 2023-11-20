Return-Path: <linux-arm-msm+bounces-1186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0490D7F1749
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 16:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F0C0B21915
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 15:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3DB1D6AB;
	Mon, 20 Nov 2023 15:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYrQtGZU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EA11D55B;
	Mon, 20 Nov 2023 15:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E5BC433C8;
	Mon, 20 Nov 2023 15:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700494147;
	bh=Ms5XKqtV48T/7UWkSrtXy8BuO4sjZAxUYswyT96cTb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYrQtGZUnR3SRdwudlFE6g0WV/S2aM4KJwrApP6542QsWIezo8ojScYmzsxWGPGf5
	 O0m6Stfksf9vN8HV3vtgUNp232PHwMwV68/l8bM0arNUwlpRn616TWLE60HTyK2yGn
	 JLr14Ny2bY6g5aKWJXOtxYFZtpGl+rvFv7ZlnohaCYf3bXultZxBc23HRtlY+VJLA4
	 Qa5mCUAIdEqdKz4OAUgqMtmQalbKMuOiDpwBL68GFks29AbUNnK+emimIw9IZIG6gg
	 10VgaRoy+TIxeIGZqM3/nRARDiUAWho4F7BbDBz9hlxUREYh5TDNF1D8etnJDXv1qP
	 iom29oMCjOvyg==
Date: Mon, 20 Nov 2023 15:29:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sibi Sankar <quic_sibis@quicinc.com>
Subject: Re: [PATCH] dt-bindings: arm: qcom-soc: extend pattern for matching
 existing SoCs
Message-ID: <20231120-shortness-constrict-1f1120a20229@spud>
References: <20231120100617.47156-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r0bVCTV5dwKUg7bb"
Content-Disposition: inline
In-Reply-To: <20231120100617.47156-1-krzysztof.kozlowski@linaro.org>


--r0bVCTV5dwKUg7bb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 11:06:17AM +0100, Krzysztof Kozlowski wrote:
> Add missing QDU, QRU and SDA platform names to the pattern matching all
> Qualcomm compatibles.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> ---
>=20
> Cc: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  .../devicetree/bindings/arm/qcom-soc.yaml        | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Docume=
ntation/devicetree/bindings/arm/qcom-soc.yaml
> index 97621c92a1ab..09db42456c12 100644
> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> @@ -23,7 +23,7 @@ description: |
>  select:
>    properties:
>      compatible:
> -      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+=
=2E*$"
> +      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm=
)[0-9]+.*$"
>    required:
>      - compatible
> =20
> @@ -31,17 +31,17 @@ properties:
>    compatible:
>      oneOf:
>        # Preferred naming style for compatibles of SoC components:
> -      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+=
(pro)?-.*$"
> +      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm=
)[0-9]+(pro)?-.*$"
>        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
> =20
>        # Legacy namings - variations of existing patterns/compatibles are=
 OK,
>        # but do not add completely new entries to these:
> -      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|s=
dx|sm)[0-9]+.*$"
> -      - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0=
-9]+.*$"
> -      - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[=
0-9]+.*$"
> -      - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[=
0-9]+.*$"
> -      - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0=
-9]+.*$"
> -      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0=
-9]+.*$"
> +      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|s=
c|sd[amx]|sm)[0-9]+.*$"
> +      - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx=
]|sm)[0-9]+.*$"
> +      - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[am=
x]|sm)[0-9]+.*$"
> +      - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[am=
x]|sm)[0-9]+.*$"
> +      - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx=
]|sm)[0-9]+.*$"
> +      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx=
]|sm)[0-9]+.*$"
>        - enum:
>            - qcom,dsi-ctrl-6g-qcm2290
>            - qcom,gpucc-sdm630
> --=20
> 2.34.1
>=20

--r0bVCTV5dwKUg7bb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVt7OgAKCRB4tDGHoIJi
0l1bAQCF5GBmK2eKai9vLgMMx0ff+FQhDKfiJeTeczYIUaFWGwEAp8bmFBFKBnBg
j4ddSuvql8JifMTzf/dPYflQ5I29xw0=
=uBeI
-----END PGP SIGNATURE-----

--r0bVCTV5dwKUg7bb--

