Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F9737A162
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 10:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhEKIIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 04:08:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:47236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230126AbhEKIIw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 04:08:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76A526144F;
        Tue, 11 May 2021 08:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620720466;
        bh=c0WX+Q2zDCMkemj3dDiX/gfAUX6TAb30bTF5FuxmDwk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=POY4yLga2f0wtkByqhc3YV39ysoOjkdfHb7Mu0E/Lt8mRiFwKmvjdgh1emOqVFb8e
         qzAOocSTdOyj+EX887NgAXvRIZo/3GbxJMEJorTnQzgTgUbsXqwzfkMpnM2T0D36MX
         leRHwC8+CQ9ERHXT9UVhYCMK8JRv4wSjecjaCPWmVVMusRlsY/MsnA4VEJmrNiNf4u
         qv8QBLWKVANEJEu01h8ZCE/vyNFYxpqEp9HZGF7Ha+JghOdqM8p733QkFzqM8XsfiS
         j7ovI7A7e+bZYbY4LogY4bq+cLP2Rd6mZISF1jjwF3ErrI7RZUM0E6GoBbAKorzzIF
         8OXyebJ5yVZ2A==
From:   Felipe Balbi <balbi@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH] arm64: dts: qcom: add initial device-tree for Microsoft
 Surface Duo
In-Reply-To: <20210511044312.GK2484@yoga>
References: <20210510120547.1315536-1-balbi@kernel.org>
 <20210511044312.GK2484@yoga>
Date:   Tue, 11 May 2021 11:07:37 +0300
Message-ID: <87wns5g0c6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Bjorn Andersson <bjorn.andersson@linaro.org> writes:
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b=
/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
>> new file mode 100644
>> index 000000000000..f53d4b3dd482
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
>> @@ -0,0 +1,545 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (C) 2021, Microsoft Corporation
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include "sm8150.dtsi"
>> +#include "pm8150.dtsi"
>> +#include "pm8150b.dtsi"
>> +#include "pm8150l.dtsi"
>> +
>> +/ {
>> +	model =3D "Microsoft Surface Duo";
>> +	compatible =3D "microsoft,surface-duo", "qcom,sm8150-mtp";
>> +
>> +	aliases {
>> +		serial0 =3D &uart2;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D "serial0:115200n8";
>> +	};
>> +
>> +	vph_pwr: vph-pwr-regulator {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "vph_pwr";
>> +		regulator-min-microvolt =3D <3700000>;
>> +		regulator-max-microvolt =3D <3700000>;
>> +	};
>> +
>> +	/*
>> +	 * Apparently RPMh does not provide support for PM8150 S4 because it
>> +	 * is always-on; model it as a fixed regulator.
>> +	 */
>> +	vreg_s4a_1p8: pm8150-s4 {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "vreg_s4a_1p8";
>> +
>> +		regulator-min-microvolt =3D <1800000>;
>> +		regulator-max-microvolt =3D <1800000>;
>> +
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +
>> +		vin-supply =3D <&vph_pwr>;
>> +	};
>> +
>> +	gpio_keys {
>> +		compatible =3D "gpio-keys";
>> +
>> +		vol_up {
>> +			label =3D "Volume Up";
>> +			gpios =3D <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
>> +			linux,code =3D <KEY_VOLUMEUP>;
>> +		};
>> +	};
>> +};
>> +
>> +&tlmm {
>
> Please sort all nodes alphabetically.

will do.

>> +&remoteproc_adsp {
>> +	status =3D "okay";
>> +	firmware-name =3D "qcom/sm8150/adsp.mdt";
>
> For platforms where we have a Dragonboard or similar we push the
> test-signed firmware to qcom/<platform>/. I presume that the Duo
> wouldn't run on the test-signed firmware.
>
> So I think it's better to make this qcom/sm8150/ms-duo/adsp.mdt...from
> the start.

ms-duo would look odd. How about qcom/sm8150/microsoft/adsp.mdt?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCaO0kRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUgUlwf+MWdUsv0ChHOlIx72IUCvPAg9JCAeEutg
r7XS5kdyLISwIN1B66lo7ARd7JEEhD1JL9r7Ui9ctdAG2lOPHNCUcBmqN7bJ8uCY
HxTzsINpcOK9sh1edK71vJKJ0sIYxpgTFeEzt/bcPgMw11YbSMqW3Yxy2i2QvRFP
W0PleeMfPzHJbFRm7NQZ2a8a0mYEBp11GX0VtJS7Ez7SD4wKN9Iu3Sdyk9iCJwiK
gSWbBY35PaFeudLnUNcKK/a89vFSNLDTO4ZrTtGzSjaVjxS+ZiSSJzwoQ4sJa12s
ptNH9fvgyQdLOyQSQ50QK6bVRuMZhpWcEqRz9ycq5/Y5CwWgdx/22Q==
=BGbh
-----END PGP SIGNATURE-----
--=-=-=--
