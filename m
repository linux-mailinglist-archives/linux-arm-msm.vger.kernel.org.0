Return-Path: <linux-arm-msm+bounces-4780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1AF813516
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 16:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E998B20D8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 15:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7D85D8F4;
	Thu, 14 Dec 2023 15:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1HbXFA6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23625D8E4;
	Thu, 14 Dec 2023 15:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D31BC433C8;
	Thu, 14 Dec 2023 15:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702568664;
	bh=XBqa/1I+JHuWGz1jvrpWZgqtc0G2D3jLjnviRzFB300=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1HbXFA6KBPaAeDskIWyUusDha+Tj/GoqkRvGesnO53UHQ+ywSZaKmoYN9+Rrg7ir
	 U2KyDjP+GZRFXHKOLzXrbUN56opS7XpA8Taslo1Kui4vLx97EXO2rDWDMmcD7eCOgV
	 ZV4CnGzuaJ1BFEBrPF1o+4JPFS+RUN1kgf5FrdcB6VG/5bu+WHXGX3VyrvWRRAaN03
	 wKCGpXZejVQstBE1o7g6AmYFCOP9kNkFYzNAqzl767YS/c07KCHgKL4OklWK3q+NsE
	 7yObj2/Sutnzx5BQo5m6saXZAZLUeKtz5CMMckxCTYdzo5T6hPDnb9AfoECMBRFq2p
	 P32G5SX2JDdlA==
Date: Thu, 14 Dec 2023 15:44:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
	sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 03/16] dt-bindings: clock: qcom: Add missing UFS QREF
 clocks
Message-ID: <20231214-doormat-divinity-a3075c35ad13@spud>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
 <20231214091101.45713-4-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YD1SRurG6FcYRAfF"
Content-Disposition: inline
In-Reply-To: <20231214091101.45713-4-manivannan.sadhasivam@linaro.org>


--YD1SRurG6FcYRAfF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 02:40:48PM +0530, Manivannan Sadhasivam wrote:
> Add missing QREF clocks for UFS MEM and UFS CARD controllers.
>=20
> Fixes: 0fadcdfdcf57 ("dt-bindings: clock: Add SC8180x GCC binding")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  include/dt-bindings/clock/qcom,gcc-sc8180x.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bi=
ndings/clock/qcom,gcc-sc8180x.h
> index e893415ae13d..90c6e021a035 100644
> --- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
> +++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
> @@ -246,6 +246,8 @@
>  #define GCC_PCIE_3_CLKREF_CLK					236
>  #define GCC_USB3_PRIM_CLKREF_CLK				237
>  #define GCC_USB3_SEC_CLKREF_CLK					238
> +#define GCC_UFS_MEM_CLKREF_EN					239
> +#define GCC_UFS_CARD_CLKREF_EN					240
> =20
>  #define GCC_EMAC_BCR						0
>  #define GCC_GPU_BCR						1
> --=20
> 2.25.1
>=20

--YD1SRurG6FcYRAfF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXsi0wAKCRB4tDGHoIJi
0pBnAP4lCEUnoDhuz+rT6c8a+4OyViA4Yn29QqeYkVxQEbHBWwEAoL2PGPrEe67K
0Tqm1woma0AIcYjuS2n/3Jh6F+rFQQw=
=F89W
-----END PGP SIGNATURE-----

--YD1SRurG6FcYRAfF--

