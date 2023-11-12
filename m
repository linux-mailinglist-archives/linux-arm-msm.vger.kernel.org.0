Return-Path: <linux-arm-msm+bounces-527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A1D7E914E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Nov 2023 16:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A49D71F20F6F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Nov 2023 15:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C79EAFB;
	Sun, 12 Nov 2023 15:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZzVLV5F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EC27487;
	Sun, 12 Nov 2023 15:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58BBC433C8;
	Sun, 12 Nov 2023 15:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699801493;
	bh=xjsZoDZ0W9UtbEQOSnDZi3V6oxIzfxCJHWjNEppeXIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cZzVLV5F1FwznVoi7w94rFihHG6RUnbGptJNsvs4Ht9+DNUn2awi+zEftWFI4SpHj
	 daBb8KBr/Xu1s8GCh8ExkgeP0zLGbABdGidd6A3IGDvR/EmA/FPWxl9D/R2znpH+aL
	 in5HOI7q7oC4+vKFAq6/p/ULX3HE8oBHmrZAh6kBinX5ViNe2CAJOSU10C23FppEBf
	 9czvx4V6Vv56v6SlBTa/Lu897UbD6Pag6W8xH4SF3PuMX1jcPFUZ1DU3AoUvhHdBDL
	 vaY2DI4dUPR50uv6KN/d1GmhafzxvE4KSxTeZzEpy14uGCODIDduW+j5Qa7GXrDSs+
	 d5JmTGRMeNXXw==
Date: Sun, 12 Nov 2023 15:04:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: qcom,apcs-kpss-global: drop
 duplicated qcom,ipq8074-apcs-apps-global
Message-ID: <20231112-buccaneer-kung-f9a4360281e7@squawk>
References: <20231111204916.35835-1-krzysztof.kozlowski@linaro.org>
 <20231111204916.35835-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qO9/DoL7wxoLPXrC"
Content-Disposition: inline
In-Reply-To: <20231111204916.35835-2-krzysztof.kozlowski@linaro.org>


--qO9/DoL7wxoLPXrC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2023 at 09:49:14PM +0100, Krzysztof Kozlowski wrote:
> qcom,ipq8074-apcs-apps-global compatible is listed in two places: with
> and without fallback.  Drop the second case to match DTS.
>=20
> Fixes: 34d8775a0edc ("dt-bindings: mailbox: qcom,apcs-kpss-global: use fa=
llbacks for few variants")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-glo=
bal.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.=
yaml
> index a38413f8d132..a22c8640dc0e 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -41,7 +41,6 @@ properties:
>            - const: syscon
>        - enum:
>            - qcom,ipq6018-apcs-apps-global
> -          - qcom,ipq8074-apcs-apps-global
>            - qcom,msm8996-apcs-hmss-global
>            - qcom,msm8998-apcs-hmss-global
>            - qcom,qcm2290-apcs-hmss-global
> --=20
> 2.34.1
>=20

--qO9/DoL7wxoLPXrC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVDpjwAKCRB4tDGHoIJi
0pjUAP9D4ZO22K7yr8fIsLrdytz2mHtSp4GclYCEAQOy8hNOiQEAzVgK3F2pSVCW
oU2FQF8Lmrr7PSw6r/AOB10GhQeUcgg=
=91u/
-----END PGP SIGNATURE-----

--qO9/DoL7wxoLPXrC--

