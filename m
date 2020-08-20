Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15FC524B979
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 13:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgHTLqm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 07:46:42 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35512 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728936AbgHTLpG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 07:45:06 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07KBiLjh034621;
        Thu, 20 Aug 2020 06:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597923861;
        bh=KekPuX5bW5OV7WGA42Ji5+dWGwrpNIKAh0IFJGWPkgw=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=wumWcYu2C1Uab0K7/BhHt6am8WARnusXkgQxTV42cLperHvWAMr73TNd+wDsAw3wy
         hNKVGdTP4DXYch+0pLpm6EayzBWxfb8hWJXgwCbJaBPkYV500cFpib37witpJiU5fe
         I4uAGHEHelb5GRoGXgpVe6o/YlhZ9+BiuU3VMDj8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07KBiLbD128554
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Aug 2020 06:44:21 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 20
 Aug 2020 06:44:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 20 Aug 2020 06:44:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07KBiK7d068400;
        Thu, 20 Aug 2020 06:44:20 -0500
Date:   Thu, 20 Aug 2020 06:44:20 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Rob Herring <robh@kernel.org>
CC:     <soc@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Robert Richter <rrichter@marvell.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Tero Kristo <t-kristo@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: Reformat PCI ranges/dma-ranges entries
Message-ID: <20200820114420.sjlqvn2tbpa7vcbb@akan>
References: <20200819221750.2055932-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jgbt6anitnjafjun"
Content-Disposition: inline
In-Reply-To: <20200819221750.2055932-1-robh@kernel.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--jgbt6anitnjafjun
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16:17-20200819, Rob Herring wrote:
> While bracketing doesn't matter for a DTB, the DT schema checks rely on
[..]
> ---
> SoC maintainers, please apply this directly.
	  [...]
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/d=
ts/ti/k3-am65-main.dtsi
> index 9edfae5944f7..2c762e725d89 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> @@ -678,8 +678,8 @@ pcie0_rc: pcie@5500000 {
>  		power-domains =3D <&k3_pds 120 TI_SCI_PD_EXCLUSIVE>;
>  		#address-cells =3D <3>;
>  		#size-cells =3D <2>;
> -		ranges =3D <0x81000000 0 0          0x0 0x10020000 0 0x00010000
> -			  0x82000000 0 0x10030000 0x0 0x10030000 0 0x07FD0000>;
> +		ranges =3D <0x81000000 0 0          0x0 0x10020000 0 0x00010000>,
> +			 <0x82000000 0 0x10030000 0x0 0x10030000 0 0x07FD0000>;
>  		ti,syscon-pcie-id =3D <&pcie_devid>;
>  		ti,syscon-pcie-mode =3D <&pcie0_mode>;
>  		bus-range =3D <0x0 0xff>;
> @@ -710,8 +710,8 @@ pcie1_rc: pcie@5600000 {
>  		power-domains =3D <&k3_pds 121 TI_SCI_PD_EXCLUSIVE>;
>  		#address-cells =3D <3>;
>  		#size-cells =3D <2>;
> -		ranges =3D <0x81000000 0 0          0x0   0x18020000 0 0x00010000
> -			  0x82000000 0 0x18030000 0x0   0x18030000 0 0x07FD0000>;
> +		ranges =3D <0x81000000 0 0          0x0   0x18020000 0 0x00010000>,
> +			 <0x82000000 0 0x18030000 0x0   0x18030000 0 0x07FD0000>;
>  		ti,syscon-pcie-id =3D <&pcie_devid>;
>  		ti,syscon-pcie-mode =3D <&pcie1_mode>;
>  		bus-range =3D <0x0 0xff>;

For the TI chunk:
Acked-by: Nishanth Menon <nm@ti.com>
--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--jgbt6anitnjafjun
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAl8+YgwACgkQ3bWEnRc2
JJ0WIg//YBZVg8WDT/O8r7i2UkktHsq0s0v55hHAOfcl47v8FQtw84RgUhFCn+9i
U/VpPbU7ZvIUlpbADflEHrnXkYfhikLBFJ90DEde63M1DkFyvjnMXJVImmuiK7E7
WbWZpo21fRKfbFje9l6upMgfiM4ZB7GS/NkKssavEX22oaG5+GTjNjEI1EJijNG/
K0hD2jvRdQ59eyfdvKL8ezXthEaJdCyWuREOKCsE/VUDHC/KgXcpZjLA7BICegYn
J/UeEhSJGtV2UaUkU621yg3gRF2f7on236lG4cs4QnYIzACww4MA2r3UdM+zsOI0
RJR8/LbNzBtfzPUmyQldvvBKQ80HtgMe0jhuFGflT4rjzbMQXYbOdIFR0A2Jhw2/
tt2YH0rmxV3rhRLsPtcmltMQW/2iccVbvHZaz8xQ9HirP2XaAvhTUfG5ayFTD3jb
uxU9HV/SMapoo56gvFRkg09K4vNAtTwc8TZLOo29FbKSv0+PUXFDBODeygVgNYxL
RI8OFjIgAiWTgAow/5CNkPwKLjR7F/dMj5T2hX1WVjwD5ds1bdl6dJP6WejEs3OU
iEYUy5PR23cZoVrH6V4FMcyWv/6D+7C8UzHIqzkUulviPpSofpb8muTAlsyAe9gx
YZPxS3DHyObqDoJbspVmD2acwVGz6KQBvvyEqvsC42qkJ0T5ByA=
=TsAH
-----END PGP SIGNATURE-----

--jgbt6anitnjafjun--
