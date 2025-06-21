Return-Path: <linux-arm-msm+bounces-61919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B80C1AE27AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 09:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79878189F734
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 07:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A4A1A0BC5;
	Sat, 21 Jun 2025 07:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="xeQhI8zc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0A730E841;
	Sat, 21 Jun 2025 07:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750489670; cv=none; b=CD9YBrusjleJ6Kl2k+00lXdJAYHViE1s0RPapHkGjnsSx2othlHr7g+bQQqhM/oHMjyDdN66SEspKaISYVYwgNE+nR5oJ/A07koMNyiwoYfflSuzPSbWIEQiC9Wr/qPDZ7FLs8SPkIyL7gpSDP2WKNjXu+AXE59X7wy3kotsuYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750489670; c=relaxed/simple;
	bh=96zSTCit7Jr8EU5mbUWe0rSqS11+bPPmhWpuoBr06qI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m5qMVM7m1xKj+ETAhcyjjpGsD1KE5RF5G6HctbfGDsvtidEHskSiu+qcumSmey9iR1mJMlBK6ueN89pXWlZrdvDXANBZDWVE3FNbGy6+l0YRt/eHT+7jaPiMIIyOsUyCLf2nC0F6lrK4y/5Mr7WhrZWx2d3qwPKZlLyPyX3ltgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=xeQhI8zc; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1750489656; x=1750748856;
	bh=obItk7XiDSFuvyadkI1YtM3uHao6+KxIagO4SDlclFQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=xeQhI8zclnuRzNshWNH2SVMvCU4GXCv/+q95m0IKNKxqH6tOlyRU28p9iqTdE/8+a
	 yRjlxjQHeVUaESVbnu+M50FsGK+W3NrioPsUYkHEf2A4qtNONa13xIAro5dCpUwWtm
	 3FDDrXSjiteZwSd0PYxZ1nxhac8tawuiJq355+pqmlqFQaCZSQq0egLwGdgVmDvVFr
	 6kLb9XN2yxyRokVv8SRqT6/zn4scd8IdCXZ7N4oydDthUP+BgbtO5L4gkrHwO6Jvk1
	 4IQjQXL9Fp/V1XP1/lMwGKhCQlqeZa7iTceuoJESfDGoL257Kua5xXBZpsUTwmU8ih
	 jFcjqJAE8rEUg==
Date: Sat, 21 Jun 2025 07:07:33 +0000
To: Luca Weiss <luca@lucaweiss.eu>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "andersson@kernel.org" <andersson@kernel.org>, "konradybcio@kernel.org" <konradybcio@kernel.org>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>, "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for Billion Capture+
Message-ID: <bWiyUA5cF4NjzEaUwhpDvfeqs0hEizZKFKxQpsfj6htES5mPGO2Yf2AHZQcUEyR4x7Zx9kVvwenpc2djbCN148IbjtgLh7Gq_1HXicp8kms=@protonmail.com>
In-Reply-To: <d4564d4b-9510-47f8-9930-65d3c4e90e6c@lucaweiss.eu>
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com> <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com> <d4564d4b-9510-47f8-9930-65d3c4e90e6c@lucaweiss.eu>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 5e5c42a87c2bd67bc63aad9df28de1391b9b1ead
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Saturday, June 21st, 2025 at 00:20, Luca Weiss <luca@lucaweiss.eu> wrote=
:

> > +
> > + reserved-memory {
> > + qseecom@0 {
>=20
>=20
> qseecom@84a00000 ?
>=20
> > + reg =3D <0x00 0x84a00000 0x00 0x1900000>;
> > + no-map;
> > + };

Looking at downstream devicetree, every reserved-memory nodes with "removed=
-dma-pool" compatible has unit address 0. OTOH, kernel documentation [1] sa=
ys:
"  Following the generic-names recommended practice, node names should
  reflect the purpose of the node (ie. "framebuffer" or "dma-pool").
  Unit address (@<address>) should be appended to the name if the node
  is a static allocation."

In my case, downstream devicetree shows:

=09=09other_ext_region@0 {
=09=09=09compatible =3D "removed-dma-pool";
=09=09=09no-map;
=09=09=09reg =3D <0x00 0x84a00000 0x00 0x1e00000>;
=09=09};

which will be 'qseecom' reserved-memory node in mainline devicetree.

OTOH, 'qseecom' node in downstream devicetree also shows:

=09=09qseecom@84a00000 {
=09=09=09compatible =3D "qcom,qseecom";
=09=09=09reg =3D <0x84a00000 0x1900000>;
                        ...

If you confirm what you suggest, 'qseecom' reserved-memory node will look l=
ike the following:

=09=09qseecom_mem: qseecom@84a00000 {
=09=09=09reg =3D <0x0 0x84a00000 0x0 0x1900000>;
=09=09=09no-map;
=09=09};

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-m=
emory/reserved-memory.yaml

> > + cont_splash_mem: cont-splash@90001000 {
> > + reg =3D <0x0 0x90001000 0x0 (1080 * 1920 * 3)>;
> > + no-map;
> > + };
> > + };
> > +
> > + vph_pwr: vph-pwr-regulator {
> > + compatible =3D "regulator-fixed";
> > + regulator-name =3D "vph_pwr";
> > + regulator-always-on;
> > + regulator-boot-on;
> > + };
> > +};
> > +
> > +
> > +&hsusb_phy {
> > + vdd-supply =3D <&pm8953_l3>;
> > + vdda-pll-supply =3D <&pm8953_l7>;
> > + vdda-phy-dpdm-supply =3D <&pm8953_l13>;
> > +
> > + status =3D "okay";
> > +};
> > +
> > +&pm8953_resin {
> > + linux,code =3D <KEY_VOLUMEDOWN>;
> > + status =3D "okay";
> > +};
> > +
> > +&rpm_requests {
> > + regulators {
> > + compatible =3D "qcom,rpm-pm8953-regulators";
> > + vdd_s1-supply =3D <&vph_pwr>;
> > + vdd_s2-supply =3D <&vph_pwr>;
> > + vdd_s3-supply =3D <&vph_pwr>;
> > + vdd_s4-supply =3D <&vph_pwr>;
> > + vdd_s5-supply =3D <&vph_pwr>;
> > + vdd_s6-supply =3D <&vph_pwr>;
> > + vdd_s7-supply =3D <&vph_pwr>;
> > + vdd_l1-supply =3D <&pm8953_s3>;
> > + vdd_l2_l3-supply =3D <&pm8953_s3>;
> > + vdd_l4_l5_l6_l7_l16_l19-supply =3D <&pm8953_s4>;
> > + vdd_l8_l11_l12_l13_l14_l15-supply =3D <&vph_pwr>;
> > + vdd_l9_l10_l17_l18_l22-supply =3D <&vph_pwr>;
> > + vdd_l23-supply =3D <&pm8953_s3>;
> > +
> > + pm8953_s1: s1 {
> > + regulator-min-microvolt =3D <870000>;
> > + regulator-max-microvolt =3D <1156000>;
> > + };
> > +
> > + pm8953_s3: s3 {
> > + regulator-min-microvolt =3D <1224000>;
> > + regulator-max-microvolt =3D <1224000>;
> > + };
> > +
> > + pm8953_s4: s4 {
> > + regulator-min-microvolt =3D <1900000>;
> > + regulator-max-microvolt =3D <2050000>;
> > + };
> > +
> > + pm8953_l1: l1 {
> > + regulator-min-microvolt =3D <1000000>;
> > + regulator-max-microvolt =3D <1000000>;
> > + };
> > +
> > + pm8953_l2: l2 {
> > + regulator-min-microvolt =3D <975000>;
> > + regulator-max-microvolt =3D <1225000>;
> > + };
> > +
> > + pm8953_l3: l3 {
> > + regulator-min-microvolt =3D <925000>;
> > + regulator-max-microvolt =3D <925000>;
> > + };
> > +
> > + pm8953_l5: l5 {
> > + regulator-min-microvolt =3D <1800000>;
> > + regulator-max-microvolt =3D <1800000>;
> > + };
> > +
> > + pm8953_l6: l6 {
> > + regulator-min-microvolt =3D <1800000>;
> > + regulator-max-microvolt =3D <1800000>;
> > + };
> > +
> > + pm8953_l7: l7 {
> > + regulator-min-microvolt =3D <1800000>;
> > + regulator-max-microvolt =3D <1900000>;
> > + };
> > +
> > + pm8953_l8: l8 {
> > + regulator-min-microvolt =3D <2900000>;
> > + regulator-max-microvolt =3D <2900000>;
> > + };
> > +
> > + pm8953_l9: l9 {
> > + regulator-min-microvolt =3D <3000000>;
> > + regulator-max-microvolt =3D <3300000>;
> > + };
> > +
> > + pm8953_l10: l10 {
> > + regulator-min-microvolt =3D <2850000>;
> > + regulator-max-microvolt =3D <2850000>;
> > + };
> > +
> > + pm8953_l11: l11 {
> > + regulator-min-microvolt =3D <2950000>;
> > + regulator-max-microvolt =3D <2950000>;
> > + };
> > +
> > + pm8953_l12: l12 {
> > + regulator-min-microvolt =3D <1800000>;
> > + regulator-max-microvolt =3D <2950000>;
> > + };
> > +
> > + pm8953_l13: l13 {
> > + regulator-min-microvolt =3D <3125000>;
> > + regulator-max-microvolt =3D <3125000>;
> > + };
> > +
> > + pm8953_l16: l16 {
> > + regulator-min-microvolt =3D <1800000>;
> > + regulator-max-microvolt =3D <1800000>;
> > + };
> > +
> > + pm8953_l17: l17 {
> > + regulator-min-microvolt =3D <2850000>;
> > + regulator-max-microvolt =3D <2850000>;
> > + };
> > +
> > + pm8953_l19: l19 {
> > + regulator-min-microvolt =3D <1200000>;
> > + regulator-max-microvolt =3D <1350000>;
> > + };
> > +
> > + pm8953_l22: l22 {
> > + regulator-min-microvolt =3D <2800000>;
> > + regulator-max-microvolt =3D <2800000>;
> > + };
> > +
> > + pm8953_l23: l23 {
> > + regulator-min-microvolt =3D <975000>;
> > + regulator-max-microvolt =3D <1225000>;
> > + };
> > + };
> > +};
> > +
> > +&sdhc_1 {
> > + vmmc-supply =3D <&pm8953_l8>;
> > + vqmmc-supply =3D <&pm8953_l5>;
> > +
> > + status =3D "okay";
> > +};
> > +
> > +&sdhc_2 {
> > + vmmc-supply =3D <&pm8953_l11>;
> > + vqmmc-supply =3D <&pm8953_l12>;
> > +
> > + cd-gpios =3D <&tlmm 133 GPIO_ACTIVE_HIGH>;
> > +
> > + pinctrl-0 =3D <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
> > + pinctrl-1 =3D <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
> > + pinctrl-names =3D "default", "sleep";
> > +
> > + status =3D "okay";
> > +};
> > +
> > +&tlmm {
> > + gpio-reserved-ranges =3D <0 4>, <135 4>;
>=20
>=20
> Any ideas what's connected to these pins? If you do, good to document
> this like in other devices.
>=20
> Regards
> Luca
>=20

Unfortunately, downstream devicetree's pinctrl (kernel sources not availabl=
e) doesn't mention anywhere 'gpio0', 'gpio1', 'gpio2', 'gpio3', 'gpio135', =
'gpio136', 'gpio137' and 'gpio138' (but, for example, 'gpio4' and 'gpio139'=
 are shown, instead). So, I've no ideas what these reserved gpios are used =
for.

