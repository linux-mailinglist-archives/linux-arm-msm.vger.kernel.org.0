Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B39F31EAEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 15:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbhBROYR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 09:24:17 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33466 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhBRNl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 08:41:58 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EBE5D1C0B81; Thu, 18 Feb 2021 14:41:15 +0100 (CET)
Date:   Thu, 18 Feb 2021 14:41:15 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustave Monce <gustave.monce@outlook.com>
Subject: Re: [PATCH 11/18] arm64: dts: qcom: msm8994-octagon: Add uSD card
 and disable HS400 on eMMC
Message-ID: <20210218134115.GA14087@duo.ucw.cz>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
 <20210131013853.55810-12-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <20210131013853.55810-12-konrad.dybcio@somainline.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2021-01-31 02:38:42, Konrad Dybcio wrote:
> From: Gustave Monce <gustave.monce@outlook.com>
>=20
> Lumia 950/XL, like other phones, ship with different storage chips.
> Some of them are not capable of stable operation at HS400. Disable it.
>=20
> Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/a=
rch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
> index bf6e63a23600..004a42261cef 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
> @@ -684,6 +684,27 @@ vph_pwr_bbyp: boost-bypass {
> =20
>  &sdhc1 {
>  	status =3D "okay";
> +
> +	/*
> +	 * This device is shipped with HS400 capabable eMMCs

Typo, should be "capable"?

> +	 * However various brands have been used in various product batches,
> +	 * including a Samsung eMMC (BGND3R) which features a quirk with HS400.
> +	 * Set the speed to HS200 as a safety measure.
> +	 */

And this makes little sense. "This device is often shipped..."?

Best regards,
									Pavel

--=20
http://www.livejournal.com/~pavelmachek

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC5uewAKCRAw5/Bqldv6
8uLgAKCNV5n0XRhWpoPUEPInRxB89pd5FgCcCx84tBFtuG21PzYbnAc4tRkuB7w=
=hfLT
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
