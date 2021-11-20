Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19054580A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 22:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhKTVv2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 16:51:28 -0500
Received: from mail-4022.proton.ch ([185.70.40.22]:21715 "EHLO
        mail-4022.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhKTVv2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 16:51:28 -0500
Date:   Sat, 20 Nov 2021 21:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1637444902;
        bh=cKd1wPOwmDfx+hIonxgjn5tWTwPyXong80b9ktf3g+s=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=A9Qa5Ctnrx82rLk6CghyXJCOBXYEwE7VqlGxNXnl5H5u/jfiMCPI5HIzsTGr1kDO7
         YHBzHMSAD4v+syXKPAb6V2fXAw3JHpfZZGpwjvceZDORIICzk9DN26igtZDBxKR8eP
         TnfHPBxv35tyc+/TM9gpp/lo24FfRwHP2TaDckNc=
To:     Dang Huynh <danct12@riseup.net>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@gmail.com>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v4 3/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add RPM and fixed regulators
Message-ID: <aa5307c7-47d6-21ad-908a-fc9f452d9ea1@connolly.tech>
In-Reply-To: <20211120214227.779742-4-danct12@riseup.net>
References: <20211120214227.779742-1-danct12@riseup.net> <20211120214227.779742-4-danct12@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20/11/2021 21:42, Dang Huynh wrote:
> Add most of the RPM PM660/PM660L regulators and the fixed ones,
> defining the common electrical part of this platform.
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>   .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 266 ++++++++++++++++++
>   1 file changed, 266 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/a=
rm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 1edc53fd6941..eccbeecef192 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -1,11 +1,14 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2020, Alexey Minnekhanov <alexey.min@gmail.com>
> + * Copyright (c) 2021, Dang Huynh <danct12@riseup.net>
>    */
>
>   /dts-v1/;
>
>   #include "sdm660.dtsi"
> +#include "pm660.dtsi"
> +#include "pm660l.dtsi"
>
>   / {
>   =09model =3D "Xiaomi Redmi Note 7";
> @@ -20,6 +23,16 @@ chosen {
>   =09=09stdout-path =3D "serial0:115200n8";
>   =09};
>
> +=09vph_pwr: vph-pwr-regulator {
> +=09=09compatible =3D "regulator-fixed";
> +=09=09regulator-name =3D "vph_pwr";
> +=09=09regulator-min-microvolt =3D <3700000>;
> +=09=09regulator-max-microvolt =3D <3700000>;
> +
> +=09=09regulator-always-on;
> +=09=09regulator-boot-on;
> +=09};
> +
>   =09reserved-memory {
>   =09=09#address-cells =3D <2>;
>   =09=09#size-cells =3D <2>;
> @@ -40,6 +53,259 @@ &blsp1_uart2 {
>   =09status =3D "okay";
>   };
>
> +&rpm_requests {
> +=09pm660l-regulators {
> +=09=09compatible =3D "qcom,rpm-pm660l-regulators";
> +
> +=09=09vdd_s1-supply =3D <&vph_pwr>;
> +=09=09vdd_s2-supply =3D <&vph_pwr>;
> +=09=09vdd_s3_s4-supply =3D <&vph_pwr>;
> +=09=09vdd_s5-supply =3D <&vph_pwr>;
> +=09=09vdd_s6-supply =3D <&vph_pwr>;
> +
> +=09=09vdd_l1_l9_l10-supply =3D <&vreg_s2b_1p05>;
> +=09=09vdd_l2-supply =3D <&vreg_bob>;
> +=09=09vdd_l3_l5_l7_l8-supply =3D <&vreg_bob>;
> +=09=09vdd_l4_l6-supply =3D <&vreg_bob>;
> +=09=09vdd_bob-supply =3D <&vph_pwr>;
> +
> +=09=09vreg_s1b_1p125: s1 {
> +=09=09=09regulator-min-microvolt =3D <1125000>;
> +=09=09=09regulator-max-microvolt =3D <1125000>;
> +=09=09=09regulator-enable-ramp-delay =3D <200>;
> +=09=09};
> +
> +=09=09vreg_s2b_1p05: s2 {
> +=09=09=09regulator-min-microvolt =3D <1050000>;
> +=09=09=09regulator-max-microvolt =3D <1050000>;
> +=09=09=09regulator-enable-ramp-delay =3D <200>;
> +=09=09};
> +
> +=09=09/* LDOs */
> +=09=09vreg_l1b_0p925: l1 {
> +=09=09=09regulator-min-microvolt =3D <800000>;
> +=09=09=09regulator-max-microvolt =3D <925000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09=09regulator-allow-set-load;
> +=09=09};
> +
> +=09=09/* SDHCI 3.3V signal doesn't seem to be supported. */
> +=09=09vreg_l2b_2p95: l2 {
> +=09=09=09regulator-min-microvolt =3D <1648000>;
> +=09=09=09regulator-max-microvolt =3D <2696000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09=09regulator-allow-set-load;
> +=09=09};
> +
> +=09=09vreg_l3b_3p3: l3 {
> +=09=09=09regulator-min-microvolt =3D <1700000>;
> +=09=09=09regulator-max-microvolt =3D <3300000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09=09regulator-allow-set-load;
> +=09=09};
> +
> +=09=09vreg_l4b_2p95: l4 {
> +=09=09=09regulator-min-microvolt =3D <2944000>;
> +=09=09=09regulator-max-microvolt =3D <2952000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +
> +=09=09=09regulator-min-microamp =3D <200>;
> +=09=09=09regulator-max-microamp =3D <600000>;
> +=09=09=09regulator-system-load =3D <570000>;
> +=09=09=09regulator-allow-set-load;
> +=09=09};
> +
> +=09=09/*
> +=09=09 * Downstream specifies a range of 1721-3600mV,
> +=09=09 * but the only assigned consumers are SDHCI2 VMMC
> +=09=09 * and Coresight QPDI that both request pinned 2.95V.
> +=09=09 * Tighten the range to 1.8-3.328 (closest to 3.3) to
> +=09=09 * make the mmc driver happy.
> +=09=09 */
> +=09=09vreg_l5b_2p95: l5 {
> +=09=09=09regulator-min-microvolt =3D <1800000>;
> +=09=09=09regulator-max-microvolt =3D <3328000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09=09regulator-allow-set-load;
> +=09=09=09regulator-system-load =3D <800000>;
> +=09=09};
> +
> +=09=09vreg_l7b_3p125: l7 {
> +=09=09=09regulator-min-microvolt =3D <2700000>;
> +=09=09=09regulator-max-microvolt =3D <3125000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09};
> +
> +=09=09vreg_l8b_3p3: l8 {
> +=09=09=09regulator-min-microvolt =3D <3200000>;
> +=09=09=09regulator-max-microvolt =3D <3400000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09};
> +
> +=09=09vreg_bob: bob {
> +=09=09=09regulator-min-microvolt =3D <3300000>;
> +=09=09=09regulator-max-microvolt =3D <3600000>;
> +=09=09=09regulator-enable-ramp-delay =3D <500>;
> +=09=09};
> +=09};
> +
> +=09pm660-regulators {
> +=09=09compatible =3D "qcom,rpm-pm660-regulators";
> +
> +=09=09vdd_s1-supply =3D <&vph_pwr>;
> +=09=09vdd_s2-supply =3D <&vph_pwr>;
> +=09=09vdd_s3-supply =3D <&vph_pwr>;
> +=09=09vdd_s4-supply =3D <&vph_pwr>;
> +=09=09vdd_s5-supply =3D <&vph_pwr>;
> +=09=09vdd_s6-supply =3D <&vph_pwr>;
> +
> +=09=09vdd_l1_l6_l7-supply =3D <&vreg_s5a_1p35>;
> +=09=09vdd_l2_l3-supply =3D <&vreg_s2b_1p05>;
> +=09=09vdd_l5-supply =3D <&vreg_s2b_1p05>;
> +=09=09vdd_l8_l9_l10_l11_l12_l13_l14-supply =3D <&vreg_s4a_2p04>;
> +=09=09vdd_l15_l16_l17_l18_l19-supply =3D <&vreg_bob>;
> +
> +=09=09/*
> +=09=09 * S1A (FTAPC0), S2A (FTAPC1), S3A (HFAPC1) are managed
> +=09=09 * by the Core Power Reduction hardened (CPRh) and the
> +=09=09 * Operating State Manager (OSM) HW automatically.
> +=09=09 */
> +
> +=09=09vreg_s4a_2p04: s4 {
> +=09=09=09regulator-min-microvolt =3D <1805000>;
> +=09=09=09regulator-max-microvolt =3D <2040000>;
> +=09=09=09regulator-enable-ramp-delay =3D <200>;
> +=09=09=09regulator-always-on;
> +=09=09};
> +
> +=09=09vreg_s5a_1p35: s5 {
> +=09=09=09regulator-min-microvolt =3D <1224000>;
> +=09=09=09regulator-max-microvolt =3D <1350000>;
> +=09=09=09regulator-enable-ramp-delay =3D <200>;
> +=09=09};
> +
> +=09=09vreg_s6a_0p87: s6 {
> +=09=09=09regulator-min-microvolt =3D <504000>;
> +=09=09=09regulator-max-microvolt =3D <992000>;
> +=09=09=09regulator-enable-ramp-delay =3D <150>;
> +=09=09};
> +
> +=09=09/* LDOs */
> +=09=09vreg_l1a_1p225: l1 {
> +=09=09=09regulator-min-microvolt =3D <1150000>;
> +=09=09=09regulator-max-microvolt =3D <1250000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09=09regulator-allow-set-load;
> +=09=09};
> +
> +=09=09vreg_l2a_1p0: l2 {
> +=09=09=09regulator-min-microvolt =3D <950000>;
> +=09=09=09regulator-max-microvolt =3D <1010000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09};
> +
> +=09=09vreg_l3a_1p0: l3 {
> +=09=09=09regulator-min-microvolt =3D <950000>;
> +=09=09=09regulator-max-microvolt =3D <1010000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09};
> +
> +=09=09vreg_l5a_0p848: l5 {
> +=09=09=09regulator-min-microvolt =3D <525000>;
> +=09=09=09regulator-max-microvolt =3D <950000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09};
> +
> +=09=09vreg_l6a_1p3: l6 {
> +=09=09=09regulator-min-microvolt =3D <1200000>;
> +=09=09=09regulator-max-microvolt =3D <1370000>;
> +=09=09=09regulator-allow-set-load;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09};
> +
> +=09=09vreg_l7a_1p2: l7 {
> +=09=09=09regulator-min-microvolt =3D <1200000>;
> +=09=09=09regulator-max-microvolt =3D <1200000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09};
> +
> +=09=09vreg_l8a_1p8: l8 {
> +=09=09=09regulator-min-microvolt =3D <1750000>;
> +=09=09=09regulator-max-microvolt =3D <1800000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09=09regulator-system-load =3D <325000>;
> +=09=09=09regulator-allow-set-load;
> +=09=09};
> +
> +=09=09vreg_l9a_1p8: l9 {
> +=09=09=09regulator-min-microvolt =3D <1750000>;
> +=09=09=09regulator-max-microvolt =3D <1900000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09=09regulator-allow-set-load;
> +=09=09};
> +
> +=09=09vreg_l10a_1p8: l10 {
> +=09=09=09regulator-min-microvolt =3D <1780000>;
> +=09=09=09regulator-max-microvolt =3D <1950000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09=09regulator-allow-set-load;
> +=09=09};
> +
> +=09=09vreg_l11a_1p8: l11 {
> +=09=09=09regulator-min-microvolt =3D <1780000>;
> +=09=09=09regulator-max-microvolt =3D <1950000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09};
> +
> +=09=09vreg_l12a_1p8: l12 {
> +=09=09=09regulator-min-microvolt =3D <1780000>;
> +=09=09=09regulator-max-microvolt =3D <1950000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09};
> +
> +=09=09/* This gives power to the LPDDR4: never turn it off! */
> +=09=09vreg_l13a_1p8: l13 {
> +=09=09=09regulator-min-microvolt =3D <1780000>;
> +=09=09=09regulator-max-microvolt =3D <1950000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09=09regulator-boot-on;
> +=09=09=09regulator-always-on;
> +=09=09};
> +
> +=09=09vreg_l14a_1p8: l14 {
> +=09=09=09regulator-min-microvolt =3D <1710000>;
> +=09=09=09regulator-max-microvolt =3D <1900000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09};
> +
> +=09=09vreg_l15a_1p8: l15 {
> +=09=09=09regulator-min-microvolt =3D <1650000>;
> +=09=09=09regulator-max-microvolt =3D <2950000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09};
> +
> +=09=09vreg_l16a_2p7: l16 {
> +=09=09=09regulator-min-microvolt =3D <2800000>;
> +=09=09=09regulator-max-microvolt =3D <2800000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09=09regulator-always-on;
> +=09=09};
> +
> +=09=09vreg_l17a_1p8: l17 {
> +=09=09=09regulator-min-microvolt =3D <1648000>;
> +=09=09=09regulator-max-microvolt =3D <2952000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09};
> +
> +=09=09vreg_l19a_3p3: l19 {
> +=09=09=09regulator-min-microvolt =3D <3312000>;
> +=09=09=09regulator-max-microvolt =3D <3400000>;
> +=09=09=09regulator-enable-ramp-delay =3D <250>;
> +=09=09=09regulator-allow-set-load;
> +=09=09};
> +=09};
> +};
> +
>   &tlmm {
>   =09gpio-reserved-ranges =3D <8 4>;
>   };
> --
> 2.33.1
>

Reviewed-by: Caleb Connolly <caleb@connolly.tech>

--
Kind Regards,
Caleb

