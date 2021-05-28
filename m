Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867E3394088
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 12:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236352AbhE1KCE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 06:02:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:41922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236384AbhE1KB7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 06:01:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A365F611AE;
        Fri, 28 May 2021 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622196025;
        bh=vFC77e6cBo4D2bTAcg8O9B2o/quVqI9xdDY/kaoZ8GQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=cQ499YPWIYjH9tRROUeEi6/EA1O4HzFbq9T2faEa6R2YERlah1MKHY1e0ufz14+yo
         rIRLECaHnzsSCPcI5Y9V/rpdLwK5hFSUWdv5hF4DN9CmE/f1y3Ue9PXLhgikdkYYpg
         CAFlyzYMvPsiSopXsQgeG9m22aIT+iMJKYA6Iv3XwZtey0MESVHJolJmibkyIBtTxE
         dW4QYe+TN6ZjOU1ami0UsdxiylNVIfrHN+8RBRNjj/c1Gbv1xe2niI0Ar0Fj6wveiZ
         pae8kDHlRiFhhymtJjk6hcgqbv9sMmvzC0+z7lq7wAaO8w2HBJfhgZiyrHMgPWpa1J
         yM4pOYSYzPUpA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH] arm64: dts: qcom: add initial device-tree for Microsoft
 Surface Duo
In-Reply-To: <397b7def-99fb-1084-f0bd-6da81066af17@somainline.org>
References: <20210510120547.1315536-1-balbi@kernel.org>
 <397b7def-99fb-1084-f0bd-6da81066af17@somainline.org>
Date:   Fri, 28 May 2021 13:00:15 +0300
Message-ID: <871r9rb2kw.fsf@kernel.org>
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

(please break lines at 80-columns)

Konrad Dybcio <konrad.dybcio@somainline.org> writes:
>> +	model =3D "Microsoft Surface Duo";
>> +	compatible =3D "microsoft,surface-duo", "qcom,sm8150-mtp";
>> +
> Please remove the -mtp compatible, as the phone is not 1:1 compatible
> with the MTP design and replace it with the platform-generic
> "qcom,sm8150" (otherwise things like CPUFreq won't work!).

will do

>> +	aliases {
>> +		serial0 =3D &uart2;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D "serial0:115200n8";
>> +	};
>> +
>
> Is the serial port exposed and enabled on production hardware?

nope, but we also use the same DTS for devBoards.

>> +	bq27742@55 {
>> +		compatible =3D "ti,bq27742";
>> +		reg =3D <0x55>;
>> +	};
>> +
>> +	da7280@4a {
>> +		compatible =3D "dlg,da7280";
>> +		reg =3D <0x4a>;
>> +		interrupts-extended =3D <&tlmm 42 IRQ_TYPE_LEVEL_LOW>;
>> +		pinctrl-names =3D "da7280_default";
>> +		pinctrl-0 =3D <&da7280_intr_default>;
>> +
>> +		dlg,actuator-type =3D "LRA";
>> +		dlg,dlg,const-op-mode =3D <1>;
>> +		dlg,dlg,periodic-op-mode =3D <1>;
>> +		dlg,nom-microvolt =3D <2000000>;
>> +		dlg,abs-max-microvolt =3D <2000000>;
>> +		dlg,imax-microamp =3D <129000>;
>> +		dlg,resonant-freq-hz =3D <180>;
>> +		dlg,impd-micro-ohms =3D <14300000>;
>> +		dlg,freq-track-enable;
>> +		dlg,bemf-sens-enable;
>> +		dlg,mem-array =3D <
>> +		  0x06 0x08 0x10 0x11 0x12 0x13 0x14 0x15 0x1c 0x2a
>> +		  0x33 0x3c 0x42 0x4b 0x4c 0x4e 0x17 0x19 0x27 0x29
>> +		  0x17 0x19 0x03 0x84 0x5e 0x04 0x08 0x84 0x5d 0x01
>> +		  0x84 0x5e 0x02 0x00 0xa4 0x5d 0x03 0x84 0x5e 0x06
>> +		  0x08 0x84 0x5d 0x05 0x84 0x5d 0x06 0x84 0x5e 0x08
>> +		  0x84 0x5e 0x05 0x8c 0x5e 0x24 0x84 0x5f 0x10 0x84
>> +		  0x5e 0x05 0x84 0x5e 0x08 0x84 0x5f 0x01 0x8c 0x5e
>> +		  0x04 0x84 0x5e 0x08 0x84 0x5f 0x11 0x19 0x88 0x00
>> +		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
>> +		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
>> +		>;
>> +	};
>> +
>> +	/* SMB1381 @ 0x44 */
>> +	/* MAX34417 @ 0x1c */
>> +};
>
> Please add generic labels to these peripherals, such as "vibrator: " or s=
o.

why? They haven't been added yet, they don't even have drivers
available. What extra information will a comment bring?

>> +&i2c17 {
>> +	status =3D "okay";
>> +	clock-frequency =3D <400000>;
>> +
>> +	bq27742@55 {
>> +		compatible =3D "ti,bq27742";
>> +		reg =3D <0x55>;
>> +	};
>> +};
>
> Are there actually two of these TI ICs, presumably for the

yes

> dual-batteries? If that's the case, could you add a comment specifying
> which one is in charge (pun intended) of which cell?

that's detected, and reported, by the HW itself. Also, what's the point
if SW isn't really doing anything with the batteries other than checking
charge level and such?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCwvy8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUgucQgAqETvymEmggCN5Wkxco6GQ8LDcX8Sdg5x
QtxzbBvBYsimKMaBlx6WCK0qF5IRUmzvfT5/ZIAs4sDTe2sU5pcWWbFSoyl5r/sh
MjXsByWPDAmbuiC90xSf2EBor1Vk406KQjXHkSuyoYqE8VDG53be/DRX39IzyNGV
eTfBZxXeYRYl0d8POlmu6gcRQkULax/G6++wAyMIjZP9y7AKO3bIIstj1ptzF4rw
yYBBFkbL4Aq4GXQWhX6YztKddXgjwk/YPVlVLiPjP1qRj/C4kmh9CRGOdMDnkr1f
EHs/bekfH6Z4rC5yKRzF5pYWse/CEa97FDhPelS9fKajlkKsLryr9w==
=Urzq
-----END PGP SIGNATURE-----
--=-=-=--
