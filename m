Return-Path: <linux-arm-msm+bounces-26205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D663C93183F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 18:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1DC81C20383
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 16:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDCF1CD31;
	Mon, 15 Jul 2024 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQbgNNid"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2581BF24;
	Mon, 15 Jul 2024 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721059914; cv=none; b=W6TaYV0+rvqlbgL9g+97hS+YQrGDqgJTR0qWm/d5p/7h3kst4phnPFd+Ca/wh5Mx8lsmJdEk7VfNSwf4Uv/h5zPGCVf3ulb4TmBGzyd5brgMZgwsocHftNGkv39/fkybVyXA6oSvmZQM6paGRiWw+1hrayjA5IxXpNHuicrhoO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721059914; c=relaxed/simple;
	bh=KAWXfYtRXoroPXTdDPVF1jYnxaN+2UeJY5lgyg2ouj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3V1mPIDQuHtL0ockMVQQ52bOa4Q2/fItq/BtquUBW/fvCHRUdGi41CS302m6deDH3I5JCe0Y2JxvE5+ORbHviO0ZOj3Jc1hBVEmDH6/dvGSLZq9gRf7Zw1fYWizQRQbIcU+Y3n7QceXK0qHz9qBSui2VRYpBIsvhFkqhjs9+jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQbgNNid; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE85C32782;
	Mon, 15 Jul 2024 16:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721059913;
	bh=KAWXfYtRXoroPXTdDPVF1jYnxaN+2UeJY5lgyg2ouj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQbgNNid0ud9NJ2CyMLe84gGaDHiukFhtpseoTIcw7QAXMt3C4bTW63IuFEbxazJ4
	 qaPiBJsnKM9aQt9UUM62Pzl2QhHLvACHsfVQKuyxZcuvsjQMLoXpXCt8yNEwPV0eil
	 xgGmlCC10vqKjOZzvH2gPb3hzoGiV7sD+tOdm5DKXdJmdnboifWPaykWuV1epkXrhz
	 rYEg3/QGEwWDLGw80owH8mHgE5nJBUoj/ZDhyOxyxF/25UymSiO2nzjh8ITmLoApoO
	 OFOsmXdY0jz2ZcPf52J7mC3sW0ZbDTx8PwGzvk3xbgdsOqt40PT4wXYKYElcHY/QF7
	 3b/rjmMZqt9fA==
Date: Mon, 15 Jul 2024 17:11:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: qcom,turingcc: convert to dtschema
Message-ID: <20240715-spoiled-corroding-4e288446829d@spud>
References: <20240715084313.14098-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ds0T2ivQi1ZswXGA"
Content-Disposition: inline
In-Reply-To: <20240715084313.14098-1-rayyan.ansari@linaro.org>


--ds0T2ivQi1ZswXGA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 09:43:10AM +0100, Rayyan Ansari wrote:
> Convert the bindings for the Turing Clock Controller, currently only
> used for QCS404, from the old text format to yaml.
>=20
> Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
> ---
>  .../bindings/clock/qcom,turingcc.txt          | 19 --------
>  .../bindings/clock/qcom,turingcc.yaml         | 47 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,turingcc=
=2Etxt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,turingcc=
=2Eyaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,turingcc.txt b/=
Documentation/devicetree/bindings/clock/qcom,turingcc.txt
> deleted file mode 100644
> index 126517de5f9a..000000000000
> --- a/Documentation/devicetree/bindings/clock/qcom,turingcc.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Qualcomm Turing Clock & Reset Controller Binding
> -------------------------------------------------
> -
> -Required properties :
> -- compatible: shall contain "qcom,qcs404-turingcc".
> -- reg: shall contain base register location and length.
> -- clocks: ahb clock for the TuringCC
> -- #clock-cells: from common clock binding, shall contain 1.
> -- #reset-cells: from common reset binding, shall contain 1.
> -
> -Example:
> -	turingcc: clock-controller@800000 {
> -		compatible =3D "qcom,qcs404-turingcc";
> -		reg =3D <0x00800000 0x30000>;
> -		clocks =3D <&gcc GCC_CDSP_CFG_AHB_CLK>;
> -
> -		#clock-cells =3D <1>;
> -		#reset-cells =3D <1>;
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/qcom,turingcc.yaml b=
/Documentation/devicetree/bindings/clock/qcom,turingcc.yaml
> new file mode 100644
> index 000000000000..0a57e42fb4d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,turingcc.yaml

filename should match the compatible in the binding.

> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,turingcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Turing Clock & Reset Controller
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +
> +properties:
> +  compatible:
> +    const: qcom,qcs404-turingcc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
> +    turingcc: clock-controller@800000 {

nit: drop the label

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +        compatible =3D "qcom,qcs404-turingcc";
> +        reg =3D <0x00800000 0x30000>;
> +        clocks =3D <&gcc GCC_CDSP_CFG_AHB_CLK>;
> +
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +    };
> --=20
> 2.45.2
>=20

--ds0T2ivQi1ZswXGA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpVKRQAKCRB4tDGHoIJi
0tm3AP0ZaHe3RfopftyjdDG8HYnbvowVHRxhSkp9XSngm8h8YgD8CxJfhwu8W92d
tfzu3VKpyuiBh5UCsffBGBEZ65E3tA8=
=pJcP
-----END PGP SIGNATURE-----

--ds0T2ivQi1ZswXGA--

