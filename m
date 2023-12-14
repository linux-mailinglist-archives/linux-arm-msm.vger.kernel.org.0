Return-Path: <linux-arm-msm+bounces-4782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF64181357D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 16:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BF911F21A23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 15:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7A85E0B9;
	Thu, 14 Dec 2023 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxTmwLJX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66655E0AE;
	Thu, 14 Dec 2023 15:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D91C433C7;
	Thu, 14 Dec 2023 15:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702569531;
	bh=colVxJZGu2M1qpIiH155RF1LfudJwQRVdNr3PNYQ6WA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZxTmwLJXcO7/6ns+VgTHU2lymexTWWzRiF5DruIkE7luNr4dHfsRoS25p16xeliBM
	 zb3HGQrlUMIq+umt+IIcPR3nPipx0TfqK04H7WYOJ5be6JLbLoQ8rJTl8BJgUg71Rt
	 QEqLjKWNAWgbivBMVnk0a+Cv4uTTIAeTA2g0bvSNUVWc7DqtuF6b9pL8HhW+AKXlWI
	 f0L3Lkl2Oz9Bu2cqi9yo9Z4YAVp6Frt2mGyjnIDEO7/JwxpWafV+FE0R1Aamc+w59b
	 BHUWsntST5AbE3HO23jK9CxKDmarr988t9C1Lk05SFj0xR/D923piBCj7KGT2Z1z/L
	 W4M4Y0wNaBLhg==
Date: Thu, 14 Dec 2023 15:58:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
	robert.marko@sartura.hr, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH v3 5/5] dt-bindings: net: ipq4019-mdio: Document ipq5332
 platform
Message-ID: <20231214-crafty-ride-b238a32c2f6f@spud>
References: <20231214090304.16884-1-quic_luoj@quicinc.com>
 <20231214090304.16884-6-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OPjTojH4wDE5tT+1"
Content-Disposition: inline
In-Reply-To: <20231214090304.16884-6-quic_luoj@quicinc.com>


--OPjTojH4wDE5tT+1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 05:03:04PM +0800, Luo Jie wrote:
> Update the yaml file for the new DTS properties.
>=20
> 1. cmn-reference-clock for the CMN PLL source clock select.
> 2. clock-frequency for MDIO clock frequency config.
> 3. add uniphy AHB & SYS GCC clocks.
> 4. add reset-gpios for MDIO bus level reset.
>=20
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>

Can you please wait until discussion has finished on a patchset before
sending another version? I had not yet got a chance to look at the
reply you sent to my comments on v2.

Thanks,
Conor.

> ---
>  .../bindings/net/qcom,ipq4019-mdio.yaml       | 143 +++++++++++++++++-
>  1 file changed, 139 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml=
 b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
> index 3407e909e8a7..79f8513739e7 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
> @@ -20,6 +20,8 @@ properties:
>            - enum:
>                - qcom,ipq6018-mdio
>                - qcom,ipq8074-mdio
> +              - qcom,ipq9574-mdio
> +              - qcom,ipq5332-mdio
>            - const: qcom,ipq4019-mdio
> =20
>    "#address-cells":
> @@ -30,19 +32,77 @@ properties:
> =20
>    reg:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 5
>      description:
> -      the first Address and length of the register set for the MDIO cont=
roller.
> -      the second Address and length of the register for ethernet LDO, th=
is second
> -      address range is only required by the platform IPQ50xx.
> +      the first Address and length of the register set for the MDIO cont=
roller,
> +      the optional second, third and fourth address and length of the re=
gister
> +      for ethernet LDO, these three address range are required by the pl=
atform
> +      IPQ50xx/IPQ5332, the last address and length is for the CMN clock =
to
> +      select the reference clock.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 5
> =20
>    clocks:
> +    minItems: 1
>      items:
>        - description: MDIO clock source frequency fixed to 100MHZ
> +      - description: UNIPHY0 AHB clock source frequency fixed to 100MHZ
> +      - description: UNIPHY1 AHB clock source frequency fixed to 100MHZ
> +      - description: UNIPHY0 SYS clock source frequency fixed to 24MHZ
> +      - description: UNIPHY1 SYS clock source frequency fixed to 24MHZ
> =20
>    clock-names:
> +    minItems: 1
>      items:
>        - const: gcc_mdio_ahb_clk
> +      - const: uniphy0_ahb
> +      - const: uniphy1_ahb
> +      - const: uniphy0_sys
> +      - const: uniphy1_sys
> +
> +  cmn-reference-clock:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - items:
> +          - enum:
> +              - 0   # CMN PLL reference internal 48MHZ
> +              - 1   # CMN PLL reference external 25MHZ
> +              - 2   # CMN PLL reference external 31250KHZ
> +              - 3   # CMN PLL reference external 40MHZ
> +              - 4   # CMN PLL reference external 48MHZ
> +              - 5   # CMN PLL reference external 50MHZ
> +              - 6   # CMN PLL reference internal 96MHZ
> +
> +  clock-frequency:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - 12500000
> +              - 6250000
> +              - 3125000
> +              - 1562500
> +              - 781250
> +              - 390625
> +    description:
> +      The MDIO bus clock that must be output by the MDIO bus hardware,
> +      only the listed frequencies above can be supported, other frequency
> +      will cause malfunction. If absent, the default hardware value 0xff
> +      is used, which means the default MDIO clock frequency 390625HZ, The
> +      MDIO clock frequency is MDIO_SYS_CLK/(MDIO_CLK_DIV + 1), the SoC
> +      MDIO_SYS_CLK is fixed to 100MHZ, the MDIO_CLK_DIV is from MDIO con=
trol
> +      register, there is higher clock frequency requirement on the normal
> +      working case where the MDIO slave devices support high clock frequ=
ency.
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  reset-assert-us:
> +    maxItems: 1
> +
> +  reset-deassert-us:
> +    maxItems: 1
> =20
>  required:
>    - compatible
> @@ -61,6 +121,8 @@ allOf:
>                - qcom,ipq5018-mdio
>                - qcom,ipq6018-mdio
>                - qcom,ipq8074-mdio
> +              - qcom,ipq5332-mdio
> +              - qcom,ipq9574-mdio
>      then:
>        required:
>          - clocks
> @@ -70,6 +132,20 @@ allOf:
>          clocks: false
>          clock-names: false
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq5332-mdio
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +        reg-names:
> +          minItems: 4
> +
>  unevaluatedProperties: false
> =20
>  examples:
> @@ -100,3 +176,62 @@ examples:
>          reg =3D <4>;
>        };
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    mdio@90000 {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +      compatible =3D "qcom,ipq5332-mdio",
> +                   "qcom,ipq4019-mdio";
> +      cmn-reference-clock =3D <0>;
> +      clock-frequency =3D <6250000>;
> +
> +      reset-gpios =3D <&tlmm 51 GPIO_ACTIVE_LOW>;
> +      reset-assert-us =3D <100000>;
> +      reset-deassert-us =3D <100000>;
> +
> +      reg =3D <0x90000 0x64>,
> +            <0x9B000 0x800>,
> +            <0x7A00610 0x4>,
> +            <0x7A10610 0x4>;
> +
> +      reg-names =3D "mdio",
> +                  "cmn_blk",
> +                  "eth_ldo1",
> +                  "eth_ldo2";
> +
> +      clocks =3D <&gcc GCC_MDIO_AHB_CLK>,
> +               <&gcc GCC_UNIPHY0_AHB_CLK>,
> +               <&gcc GCC_UNIPHY1_AHB_CLK>,
> +               <&gcc GCC_UNIPHY0_SYS_CLK>,
> +               <&gcc GCC_UNIPHY1_SYS_CLK>;
> +
> +      clock-names =3D "gcc_mdio_ahb_clk",
> +                    "uniphy0_ahb",
> +                    "uniphy1_ahb",
> +                    "uniphy0_sys",
> +                    "uniphy1_sys";
> +
> +      qca8kphy0: ethernet-phy@1 {
> +        compatible =3D "ethernet-phy-id004d.d180";
> +        reg =3D <1>;
> +      };
> +
> +      qca8kphy1: ethernet-phy@2 {
> +        compatible =3D "ethernet-phy-id004d.d180";
> +        reg =3D <2>;
> +      };
> +
> +      qca8kphy2: ethernet-phy@3 {
> +        compatible =3D "ethernet-phy-id004d.d180";
> +        reg =3D <3>;
> +      };
> +
> +      qca8kphy3: ethernet-phy@4 {
> +        compatible =3D "ethernet-phy-id004d.d180";
> +        reg =3D <4>;
> +      };
> +    };
> --=20
> 2.42.0
>=20

--OPjTojH4wDE5tT+1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXsmNQAKCRB4tDGHoIJi
0u1BAQDUZA4XxZBjkN3W+Yk91os42qv0uGTg8hBT+cEDrl2qGwEAnc/NLwOJ06xE
xkm97BpJMJO/GJMgQdZ9Tv+iCu7VLw0=
=ix5f
-----END PGP SIGNATURE-----

--OPjTojH4wDE5tT+1--

