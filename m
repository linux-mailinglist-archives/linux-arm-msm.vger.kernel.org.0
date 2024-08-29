Return-Path: <linux-arm-msm+bounces-30059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBBC964B7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 18:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5DB81F21622
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 16:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DE51B81D7;
	Thu, 29 Aug 2024 16:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAGJi+B9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69171922FE;
	Thu, 29 Aug 2024 16:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724948302; cv=none; b=AelYCvUiSgdYSsA13uQI/YGNpStmFAeHm9PW264dl9aBGXqOZCyhxKCx6g4V0ntdmqJfgJmYUEvTcxui/oIm+gp1oUNYeF/BjUnhOA2iwZMgNjOLWDg9bXob5yLkUh8jT5Q8/kt1hQWDq5ZPj8vxyMAeEvT3Gi/MiWBt1bUwpsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724948302; c=relaxed/simple;
	bh=0DFCIEnpEsAW/SjC51AnwDz3RJhoIFR9GB8cHGV8p5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGWN7ouoZWtgi/n3+9NSUASNGsvGB3tD6UoLgls9YyXrQ19uDbIJis99sM7jje1kiqWQnqk0ZrPaxfMxlhmOTWGwKf9U5tSDL1F1TCnxxCclTSyuknj02uM4s5WCqyIZ7g4z6Kh3U5cuczs1XAKHcuQZe11aOqtnzqpbWfpGkJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAGJi+B9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1F8C4CEC5;
	Thu, 29 Aug 2024 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724948301;
	bh=0DFCIEnpEsAW/SjC51AnwDz3RJhoIFR9GB8cHGV8p5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UAGJi+B9G7+ByyYTIff3xkkjmNTvtXetrK7MraXov7GbqBK4stVR39FvWENtwLR2y
	 DiS6pkiibezMP1HXyHh0jQvBRZcUNV216gv7u55c+LduKII9t7gur38dgEwaaTc0WJ
	 6IMawqXsQvaRLr8ynXiHoRLOSW/X3LJKZmY7kj0jb6uJ2EkN8dCRz8oZ6e8jJaWeo+
	 Me8/i22BFG48bmjL5K9LF6vXvbNzrgUcN3ms38IQPVzEqtTt3HKp9gWZSFOd9nDabb
	 FUQ74IrtCj095vhYzPK6hUgnn1pSQsVeAi+4JER9g0V9hm9A/4/S4V8GaAadxBUhpL
	 MietOEiOgq9rA==
Date: Thu, 29 Aug 2024 17:18:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: add NXP PTN3222 eUSB2 to USB2
 redriver
Message-ID: <20240829-dandy-jingle-1002fb99b900@spud>
References: <20240829-nxp-ptn3222-v1-0-46906bc4747a@linaro.org>
 <20240829-nxp-ptn3222-v1-1-46906bc4747a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lb2JHJxD1qBMGfou"
Content-Disposition: inline
In-Reply-To: <20240829-nxp-ptn3222-v1-1-46906bc4747a@linaro.org>


--lb2JHJxD1qBMGfou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 11:21:13AM +0300, Dmitry Baryshkov wrote:
> The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that performs
> translation between eUSB2 and USB2 signalling schemes. It supports all
> three data rates: Low Speed, Full Speed and High Speed.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/phy/nxp,ptn3222.yaml       | 55 ++++++++++++++++=
++++++
>  1 file changed, 55 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/nxp,ptn3222.yaml b/Doc=
umentation/devicetree/bindings/phy/nxp,ptn3222.yaml
> new file mode 100644
> index 000000000000..acec5bb2391d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/nxp,ptn3222.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/nxp,ptn3222.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP PTN3222 1-port eUSB2 to USB2 redriver
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,ptn3222
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  vdd1v8-supply:
> +    description: power supply (1.8V)

As a nit, these descriptions could just be ": true" like the
reset-gpios, they're equally obvious.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +
> +  vdd3v3-supply:
> +    description: power supply (3.3V)
> +
> +  reset-gpios: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#phy-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        redriver@4f {
> +            compatible =3D "nxp,ptn3222";
> +            reg =3D <0x4f>;
> +            #phy-cells =3D <0>;
> +            vdd3v3-supply =3D <&vreg_3p3>;
> +            vdd1v8-supply =3D <&vreg_1p8>;
> +            reset-gpios =3D <&gpio_reset GPIO_ACTIVE_LOW>;
> +        };
> +    };
> +...
>=20
> --=20
> 2.39.2
>=20

--lb2JHJxD1qBMGfou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtCfSAAKCRB4tDGHoIJi
0g0vAP0ULmArYvwsKhDXcZT3/4k+oqLJV5IRg5A/j6KAIiP0kAEA3keLUf3OdneN
T8XD0nEmiPfqLNo/YVZtsIw/VcqqsQ4=
=tE0b
-----END PGP SIGNATURE-----

--lb2JHJxD1qBMGfou--

