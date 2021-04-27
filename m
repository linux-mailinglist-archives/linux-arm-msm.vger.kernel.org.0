Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A13936C50C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 13:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235911AbhD0L20 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 07:28:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:42476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235099AbhD0L20 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 07:28:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CFD3560C3D;
        Tue, 27 Apr 2021 11:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619522863;
        bh=FPYw+5fREObHmocyQgyXFhUexDY82QdXJ/EQGuZCjUk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hF41E7GGZmbL845jqcaGYF8RX6YNCsCke3JZDimbP+mx+j61gl+rXL1U09Yx5FOw4
         nxDUG4l9NBwqasQxDXCXQYgMUIiK8LQ8ZBM9ibCc843Ge8m7iO6/0SvTZp70N71NzV
         SIEFR2Ua61tkaGOSz7s8veY1Hq+jnthDudwAUJNFHxeqUwmbTFXQ3Gr2jOZ0dZOwEH
         Z3stSVh9Xzk46bgG/qzi6cvsvOGBkDvnHBNwekmATond8K3p68eDkbCNMaCzRqvLtk
         Z6xL+dDC0WfxTbZLbFmUckThqSXBFkG6CKW8G3KBRRGVD0NHg/dFlhbfRHGWgSfBzi
         hKixtzxmuKJeg==
Date:   Tue, 27 Apr 2021 12:27:12 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh@kernel.org, devicetree@vger.kernel.org, wcheng@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v2 2/2] arm64: boot: dts: qcom: pm8150b: Add DTS node for
 PMIC VBUS booster
Message-ID: <20210427112712.GG4605@sirena.org.uk>
References: <20210426221446.1852572-1-bryan.odonoghue@linaro.org>
 <20210426221446.1852572-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w2JjAQZceEVGylhD"
Content-Disposition: inline
In-Reply-To: <20210426221446.1852572-3-bryan.odonoghue@linaro.org>
X-Cookie: Don't feed the bats tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--w2JjAQZceEVGylhD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 11:14:46PM +0100, Bryan O'Donoghue wrote:

> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -53,6 +53,14 @@ power-on@800 {
>  			status =3D "disabled";
>  		};
> =20
> +		pm8150b_vbus: dcdc@1100 {
> +			compatible =3D "qcom,pm8150b-vbus-reg";
> +			regulator-min-microamp =3D <500000>;
> +			regulator-max-microamp =3D <3000000>;
> +			status =3D "disabled";
> +			reg =3D <0x1100>;
> +		};

This appears to be a generic .dtsi for any system with this device, it's
very much not idiomatic to be setting regulator constraints that allow
things to be changed like this by default (even though the board does
need to explicitly opt in to having the device).

--w2JjAQZceEVGylhD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCH9Q8ACgkQJNaLcl1U
h9AaVQgAgBs+fUXxel/aSQFoL3oVZRueDQWPp8XDY9D/dBGog+05LogwPXQTKdR4
B+YSdWWKdC8TIDbuEmLQS570sixQYUJAQDqMOomQ0e3kfnhhCfjr1c/2GqqwUzBj
rtW35VxlgXy4Vq/vUslzhrdKyroZinPoE8XAQrD+DLbCI3SGbtyzcErn8Aao/zV3
F984mxvrhwK54iQZj2ZgI1ADuODrxh1fObpReNJxWtSayxPAD+i82MiKbBJoUDFL
T43ssRpfUt3Y1d58oUsYm0kbS29fxCqzLocJ25mzajtc+8D08k6XW2WB+fqgIbK4
d/9/vu0OB2U7VNzK/GIV/7OdcjtauA==
=XCkF
-----END PGP SIGNATURE-----

--w2JjAQZceEVGylhD--
