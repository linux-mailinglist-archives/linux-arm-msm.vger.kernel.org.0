Return-Path: <linux-arm-msm+bounces-500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ACB7E8BA2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 17:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 740091F20EF8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 16:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2175101DF;
	Sat, 11 Nov 2023 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0YgOD50"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED0A8821;
	Sat, 11 Nov 2023 16:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B1EC433C7;
	Sat, 11 Nov 2023 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699720318;
	bh=N4eJORdtlqjk4Cwso9ZXK77iVw8ec8lYE0PGsvPkPBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0YgOD50dpSUrRk9oAOF7CzFTENh2qk5pm/cGFPS7mc5Rc5Ph7nMDFyVXDmJNO1ws
	 x0qH+bMoeZd0V/swxrJWTv82D3UCMIdwNdtTzDG43anFa5FtEe0wWkjx8emNkNNMif
	 n1qVEk14wx1F6wpPu8VQgUPdxyhSHEG5Rzk9jAd4yyyMcxV2ouiKiqtXca7ngf97j1
	 RI7QCl9wWQLH50JZRg2TiI2sf3rUXN9RXEexnyylxLVf9xSi4KJnAk33rrEKFM+RVt
	 +z+e3SM26p49Ru+a+NC5Fd5TJPchBFZrM/LsmhD7BsxAoe0Z876el/59oV3ydbdSU/
	 OLeSfkVwuwdLA==
Date: Sat, 11 Nov 2023 16:31:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: PCI: qcom: Correct reset-names property
Message-ID: <20231111-unenvied-riot-5203bd2ea685@squawk>
References: <20231111142006.51883-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u7srXMTkl7pfa03y"
Content-Disposition: inline
In-Reply-To: <20231111142006.51883-1-krzysztof.kozlowski@linaro.org>


--u7srXMTkl7pfa03y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2023 at 03:20:06PM +0100, Krzysztof Kozlowski wrote:
> There is no "resets-names" property, but "reset-names".
>=20
> Fixes: 075a9d55932e ("dt-bindings: PCI: qcom: Convert to YAML")

The original text binding did in fact use reset not resets.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Docum=
entation/devicetree/bindings/pci/qcom,pcie.yaml
> index eadba38171e1..8bfae8eb79a3 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -88,7 +88,7 @@ properties:
>      minItems: 1
>      maxItems: 12
> =20
> -  resets-names:
> +  reset-names:
>      minItems: 1
>      maxItems: 12
> =20
> --=20
> 2.34.1
>=20

--u7srXMTkl7pfa03y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU+sdAAKCRB4tDGHoIJi
0uomAQDyCLq9m9qUDaFBJF/w18Szow4VuL9mIlwQk/lpPkNoFwD/T2m6YDFljKTI
BUD0mnOCmcWZ9t/Ld7y769itwch4JQY=
=fLVh
-----END PGP SIGNATURE-----

--u7srXMTkl7pfa03y--

