Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE47B3622FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 16:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245040AbhDPOlr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 10:41:47 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:24008 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245336AbhDPOlC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 10:41:02 -0400
Date:   Fri, 16 Apr 2021 14:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1618584033;
        bh=M/ta0FanWS/zet3WBOIBv9BZxEXKIPt4tPHo1IWT23w=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=qU22oeu7Unijy4bl4VRndjO/nZLlBqfzkXfHxckn1zUk0pSwY6ggTH+2lK3JU+AVm
         VAyZb/5xZw78+Q/JzxeMw3W7P4s/GtwOb0YQEbmY/JnpXgi0+gyr3R07RLQo7UpKpK
         AxbNv5sQy6Ax8TXcQAP+ZXbX5DgsWfWzyeiKIjZM=
To:     Felipe Balbi <balbi@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Felipe Balbi <felipe.balbi@microsoft.com>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v3] arm64: boot: dts: qcom: sm8150: add SPI nodes
Message-ID: <0688f0cc-55f1-4450-c86a-5e661a85310b@connolly.tech>
In-Reply-To: <20210416103225.1872145-1-balbi@kernel.org>
References: <20210416103225.1872145-1-balbi@kernel.org>
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

Hi Felipe,

On 16/04/2021 11:32 am, Felipe Balbi wrote:
> From: Felipe Balbi <felipe.balbi@microsoft.com>
>
> Add missing SPI nodes for SM8150.
>
> Signed-off-by: Felipe Balbi <felipe.balbi@microsoft.com>
> ---
>
> changes since v2:
> =09- switch to new pinctrl format
>
> Changes since v1:
>
> =09- avoid modifying drive strength on i2c. No functional
>            changes, just keeping 0x02 instead of 2
>
>   arch/arm64/boot/dts/qcom/sm8150.dtsi | 439 +++++++++++++++++++++++++++
>   1 file changed, 439 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 7207a3689d9d..c563f381a138 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -602,6 +602,21 @@ i2c0: i2c@880000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi0: spi@880000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0x880000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";

I don't think we need the reg-names property on any of these.

Otherwise,

Reviewed-by: Caleb Connolly <caleb@connolly.tech>

> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi0_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c1: i2c@884000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x00884000 0 0x4000>;
> @@ -615,6 +630,21 @@ i2c1: i2c@884000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi1: spi@884000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0x884000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi1_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c2: i2c@888000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x00888000 0 0x4000>;
> @@ -628,6 +658,21 @@ i2c2: i2c@888000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi2: spi@888000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0x888000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi2_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c3: i2c@88c000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x0088c000 0 0x4000>;
> @@ -641,6 +686,21 @@ i2c3: i2c@88c000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi3: spi@88c000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0x88c000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi3_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c4: i2c@890000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x00890000 0 0x4000>;
> @@ -654,6 +714,21 @@ i2c4: i2c@890000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi4: spi@890000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0x890000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi4_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c5: i2c@894000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x00894000 0 0x4000>;
> @@ -667,6 +742,21 @@ i2c5: i2c@894000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi5: spi@894000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0x894000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi5_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c6: i2c@898000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x00898000 0 0x4000>;
> @@ -680,6 +770,21 @@ i2c6: i2c@898000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi6: spi@898000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0x898000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi6_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c7: i2c@89c000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x0089c000 0 0x4000>;
> @@ -693,6 +798,20 @@ i2c7: i2c@89c000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi7: spi@89c000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0x89c000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi7_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
>   =09=09};
>
>   =09=09qupv3_id_1: geniqup@ac0000 {
> @@ -720,6 +839,21 @@ i2c8: i2c@a80000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi8: spi@a80000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0xa80000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi8_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c9: i2c@a84000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x00a84000 0 0x4000>;
> @@ -733,6 +867,21 @@ i2c9: i2c@a84000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi9: spi@a84000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0xa84000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi9_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c10: i2c@a88000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x00a88000 0 0x4000>;
> @@ -746,6 +895,21 @@ i2c10: i2c@a88000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi10: spi@a88000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0xa88000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi10_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c11: i2c@a8c000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x00a8c000 0 0x4000>;
> @@ -759,6 +923,21 @@ i2c11: i2c@a8c000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi11: spi@a8c000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0xa8c000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi11_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09uart2: serial@a90000 {
>   =09=09=09=09compatible =3D "qcom,geni-debug-uart";
>   =09=09=09=09reg =3D <0x0 0x00a90000 0x0 0x4000>;
> @@ -781,6 +960,21 @@ i2c12: i2c@a90000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi12: spi@a90000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0xa90000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi12_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c16: i2c@94000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x0094000 0 0x4000>;
> @@ -793,6 +987,21 @@ i2c16: i2c@94000 {
>   =09=09=09=09#size-cells =3D <0>;
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
> +
> +=09=09=09spi16: spi@a94000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0xa94000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi16_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
>   =09=09};
>
>   =09=09qupv3_id_2: geniqup@cc0000 {
> @@ -821,6 +1030,21 @@ i2c17: i2c@c80000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi17: spi@c80000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0xc80000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi17_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c18: i2c@c84000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x00c84000 0 0x4000>;
> @@ -834,6 +1058,21 @@ i2c18: i2c@c84000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi18: spi@c84000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0xc84000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi18_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c19: i2c@c88000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x00c88000 0 0x4000>;
> @@ -847,6 +1086,21 @@ i2c19: i2c@c88000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi19: spi@c88000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0xc88000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi19_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c13: i2c@c8c000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x00c8c000 0 0x4000>;
> @@ -860,6 +1114,21 @@ i2c13: i2c@c8c000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi13: spi@c8c000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0xc8c000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi13_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c14: i2c@c90000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x00c90000 0 0x4000>;
> @@ -873,6 +1142,21 @@ i2c14: i2c@c90000 {
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09spi14: spi@c90000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0xc90000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi14_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
> +
>   =09=09=09i2c15: i2c@c94000 {
>   =09=09=09=09compatible =3D "qcom,geni-i2c";
>   =09=09=09=09reg =3D <0 0x00c94000 0 0x4000>;
> @@ -885,6 +1169,21 @@ i2c15: i2c@c94000 {
>   =09=09=09=09#size-cells =3D <0>;
>   =09=09=09=09status =3D "disabled";
>   =09=09=09};
> +
> +=09=09=09spi15: spi@c94000 {
> +=09=09=09=09compatible =3D "qcom,geni-spi";
> +=09=09=09=09reg =3D <0 0xc94000 0 0x4000>;
> +=09=09=09=09reg-names =3D "se";
> +=09=09=09=09clock-names =3D "se";
> +=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
> +=09=09=09=09pinctrl-names =3D "default";
> +=09=09=09=09pinctrl-0 =3D <&qup_spi15_default>;
> +=09=09=09=09interrupts =3D <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09=09spi-max-frequency =3D <50000000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
>   =09=09};
>
>   =09=09config_noc: interconnect@1500000 {
> @@ -1222,6 +1521,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi0_default: qup-spi0-default {
> +=09=09=09=09pins =3D "gpio0", "gpio1", "gpio2", "gpio3";
> +=09=09=09=09function =3D "qup0";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c1_default: qup-i2c1-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio114", "gpio115";
> @@ -1235,6 +1541,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi1_default: qup-spi1-default {
> +=09=09=09=09pins =3D "gpio114", "gpio115", "gpio116", "gpio117";
> +=09=09=09=09function =3D "qup1";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c2_default: qup-i2c2-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio126", "gpio127";
> @@ -1248,6 +1561,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi2_default: qup-spi2-default {
> +=09=09=09=09pins =3D "gpio126", "gpio127", "gpio128", "gpio129";
> +=09=09=09=09function =3D "qup2";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c3_default: qup-i2c3-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio144", "gpio145";
> @@ -1261,6 +1581,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi3_default: qup-spi3-default {
> +=09=09=09=09pins =3D "gpio144", "gpio145", "gpio146", "gpio147";
> +=09=09=09=09function =3D "qup3";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c4_default: qup-i2c4-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio51", "gpio52";
> @@ -1274,6 +1601,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi4_default: qup-spi4-default {
> +=09=09=09=09pins =3D "gpio51", "gpio52", "gpio53", "gpio54";
> +=09=09=09=09function =3D "qup4";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c5_default: qup-i2c5-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio121", "gpio122";
> @@ -1287,6 +1621,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi5_default: qup-spi5-default {
> +=09=09=09=09pins =3D "gpio119", "gpio120", "gpio121", "gpio122";
> +=09=09=09=09function =3D "qup5";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c6_default: qup-i2c6-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio6", "gpio7";
> @@ -1300,6 +1641,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi6_default: qup-spi6_default {
> +=09=09=09=09pins =3D "gpio4", "gpio5", "gpio6", "gpio7";
> +=09=09=09=09function =3D "qup6";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c7_default: qup-i2c7-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio98", "gpio99";
> @@ -1313,6 +1661,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi7_default: qup-spi7_default {
> +=09=09=09=09pins =3D "gpio98", "gpio99", "gpio100", "gpio101";
> +=09=09=09=09function =3D "qup7";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c8_default: qup-i2c8-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio88", "gpio89";
> @@ -1326,6 +1681,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi8_default: qup-spi8-default {
> +=09=09=09=09pins =3D "gpio88", "gpio89", "gpio90", "gpio91";
> +=09=09=09=09function =3D "qup8";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c9_default: qup-i2c9-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio39", "gpio40";
> @@ -1339,6 +1701,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi9_default: qup-spi9-default {
> +=09=09=09=09pins =3D "gpio39", "gpio40", "gpio41", "gpio42";
> +=09=09=09=09function =3D "qup9";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c10_default: qup-i2c10-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio9", "gpio10";
> @@ -1352,6 +1721,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi10_default: qup-spi10-default {
> +=09=09=09=09pins =3D "gpio9", "gpio10", "gpio11", "gpio12";
> +=09=09=09=09function =3D "qup10";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c11_default: qup-i2c11-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio94", "gpio95";
> @@ -1365,6 +1741,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi11_default: qup-spi11-default {
> +=09=09=09=09pins =3D "gpio92", "gpio93", "gpio94", "gpio95";
> +=09=09=09=09function =3D "qup11";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c12_default: qup-i2c12-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio83", "gpio84";
> @@ -1378,6 +1761,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi12_default: qup-spi12-default {
> +=09=09=09=09pins =3D "gpio83", "gpio84", "gpio85", "gpio86";
> +=09=09=09=09function =3D "qup12";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c13_default: qup-i2c13-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio43", "gpio44";
> @@ -1391,6 +1781,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi13_default: qup-spi13-default {
> +=09=09=09=09pins =3D "gpio43", "gpio44", "gpio45", "gpio46";
> +=09=09=09=09function =3D "qup13";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c14_default: qup-i2c14-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio47", "gpio48";
> @@ -1404,6 +1801,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi14_default: qup-spi14-default {
> +=09=09=09=09pins =3D "gpio47", "gpio48", "gpio49", "gpio50";
> +=09=09=09=09function =3D "qup14";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c15_default: qup-i2c15-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio27", "gpio28";
> @@ -1417,6 +1821,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi15_default: qup-spi15-default {
> +=09=09=09=09pins =3D "gpio27", "gpio28", "gpio29", "gpio30";
> +=09=09=09=09function =3D "qup15";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c16_default: qup-i2c16-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio86", "gpio85";
> @@ -1430,6 +1841,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi16_default: qup-spi16-default {
> +=09=09=09=09pins =3D "gpio83", "gpio84", "gpio85", "gpio86";
> +=09=09=09=09function =3D "qup16";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c17_default: qup-i2c17-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio55", "gpio56";
> @@ -1443,6 +1861,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi17_default: qup-spi17-default {
> +=09=09=09=09pins =3D "gpio55", "gpio56", "gpio57", "gpio58";
> +=09=09=09=09function =3D "qup17";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c18_default: qup-i2c18-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio23", "gpio24";
> @@ -1456,6 +1881,13 @@ config {
>   =09=09=09=09};
>   =09=09=09};
>
> +=09=09=09qup_spi18_default: qup-spi18-default {
> +=09=09=09=09pins =3D "gpio23", "gpio24", "gpio25", "gpio26";
> +=09=09=09=09function =3D "qup18";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09qup_i2c19_default: qup-i2c19-default {
>   =09=09=09=09mux {
>   =09=09=09=09=09pins =3D "gpio57", "gpio58";
> @@ -1468,6 +1900,13 @@ config {
>   =09=09=09=09=09bias-disable;
>   =09=09=09=09};
>   =09=09=09};
> +
> +=09=09=09qup_spi19_default: qup-spi19-default {
> +=09=09=09=09pins =3D "gpio55", "gpio56", "gpio57", "gpio58";
> +=09=09=09=09function =3D "qup19";
> +=09=09=09=09drive-strength =3D <6>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
>   =09=09};
>
>   =09=09remoteproc_mpss: remoteproc@4080000 {
> --
> 2.31.1
>


