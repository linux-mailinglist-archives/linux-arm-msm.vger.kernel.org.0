Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D069358990
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 18:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbhDHQVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 12:21:30 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:24837 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbhDHQVa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 12:21:30 -0400
Date:   Thu, 08 Apr 2021 16:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1617898876;
        bh=b9hQpvkZUxM+kqmVyQiHA4m5h2yELLUygGGCvBbyIZk=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=Dg36Q4aXwk2m0mUPfAvDF+92B+VmNqddEzw9TwziemFPXJPj56X3EW1Gcl2Cclkmf
         kkZ6ctx2H3fm1sN9v4/ySMBuy30Ovo2wveb54LT4eyeotfGHtOu6Kq8E00usX9KRJr
         3dWxACdsjnza/0exE/vOOrmhh9kDzu2GJ12gUtSo=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8150: add i2c nodes
Message-ID: <20210408161953.26298-3-caleb@connolly.tech>
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

Tested on the OnePlus 7 Pro (including DMA).

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 521 +++++++++++++++++++++++++++
 1 file changed, 521 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qco=
m/sm8150.dtsi
index 543417d74216..7207a3689d9d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -588,6 +588,111 @@ qupv3_id_0: geniqup@8c0000 {
 =09=09=09#size-cells =3D <2>;
 =09=09=09ranges;
 =09=09=09status =3D "disabled";
+
+=09=09=09i2c0: i2c@880000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00880000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c0_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c1: i2c@884000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00884000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c1_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c2: i2c@888000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00888000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c2_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c3: i2c@88c000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x0088c000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c3_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c4: i2c@890000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00890000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c4_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c5: i2c@894000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00894000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c5_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c6: i2c@898000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00898000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c6_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c7: i2c@89c000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x0089c000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c7_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
 =09=09};
=20
 =09=09qupv3_id_1: geniqup@ac0000 {
@@ -602,6 +707,58 @@ qupv3_id_1: geniqup@ac0000 {
 =09=09=09ranges;
 =09=09=09status =3D "disabled";
=20
+=09=09=09i2c8: i2c@a80000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00a80000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c8_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c9: i2c@a84000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00a84000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c9_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c10: i2c@a88000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00a88000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c10_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c11: i2c@a8c000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00a8c000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c11_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
 =09=09=09uart2: serial@a90000 {
 =09=09=09=09compatible =3D "qcom,geni-debug-uart";
 =09=09=09=09reg =3D <0x0 0x00a90000 0x0 0x4000>;
@@ -610,6 +767,32 @@ uart2: serial@a90000 {
 =09=09=09=09interrupts =3D <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 =09=09=09=09status =3D "disabled";
 =09=09=09};
+
+=09=09=09i2c12: i2c@a90000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00a90000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c12_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c16: i2c@94000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x0094000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c16_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
 =09=09};
=20
 =09=09qupv3_id_2: geniqup@cc0000 {
@@ -624,6 +807,84 @@ qupv3_id_2: geniqup@cc0000 {
 =09=09=09#size-cells =3D <2>;
 =09=09=09ranges;
 =09=09=09status =3D "disabled";
+
+=09=09=09i2c17: i2c@c80000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00c80000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c17_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c18: i2c@c84000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00c84000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c18_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c19: i2c@c88000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00c88000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c19_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c13: i2c@c8c000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00c8c000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c13_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c14: i2c@c90000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00c90000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c14_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
+
+=09=09=09i2c15: i2c@c94000 {
+=09=09=09=09compatible =3D "qcom,geni-i2c";
+=09=09=09=09reg =3D <0 0x00c94000 0 0x4000>;
+=09=09=09=09clock-names =3D "se";
+=09=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+=09=09=09=09pinctrl-names =3D "default";
+=09=09=09=09pinctrl-0 =3D <&qup_i2c15_default>;
+=09=09=09=09interrupts =3D <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09status =3D "disabled";
+=09=09=09};
 =09=09};
=20
 =09=09config_noc: interconnect@1500000 {
@@ -947,6 +1208,266 @@ tlmm: pinctrl@3100000 {
 =09=09=09#gpio-cells =3D <2>;
 =09=09=09interrupt-controller;
 =09=09=09#interrupt-cells =3D <2>;
+
+=09=09=09qup_i2c0_default: qup-i2c0-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio0", "gpio1";
+=09=09=09=09=09function =3D "qup0";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio0", "gpio1";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c1_default: qup-i2c1-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio114", "gpio115";
+=09=09=09=09=09function =3D "qup1";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio114", "gpio115";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c2_default: qup-i2c2-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio126", "gpio127";
+=09=09=09=09=09function =3D "qup2";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio126", "gpio127";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c3_default: qup-i2c3-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio144", "gpio145";
+=09=09=09=09=09function =3D "qup3";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio144", "gpio145";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c4_default: qup-i2c4-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio51", "gpio52";
+=09=09=09=09=09function =3D "qup4";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio51", "gpio52";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c5_default: qup-i2c5-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio121", "gpio122";
+=09=09=09=09=09function =3D "qup5";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio121", "gpio122";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c6_default: qup-i2c6-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio6", "gpio7";
+=09=09=09=09=09function =3D "qup6";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio6", "gpio7";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c7_default: qup-i2c7-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio98", "gpio99";
+=09=09=09=09=09function =3D "qup7";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio98", "gpio99";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c8_default: qup-i2c8-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio88", "gpio89";
+=09=09=09=09=09function =3D "qup8";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio88", "gpio89";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c9_default: qup-i2c9-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio39", "gpio40";
+=09=09=09=09=09function =3D "qup9";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio39", "gpio40";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c10_default: qup-i2c10-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio9", "gpio10";
+=09=09=09=09=09function =3D "qup10";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio9", "gpio10";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c11_default: qup-i2c11-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio94", "gpio95";
+=09=09=09=09=09function =3D "qup11";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio94", "gpio95";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c12_default: qup-i2c12-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio83", "gpio84";
+=09=09=09=09=09function =3D "qup12";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio83", "gpio84";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c13_default: qup-i2c13-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio43", "gpio44";
+=09=09=09=09=09function =3D "qup13";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio43", "gpio44";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c14_default: qup-i2c14-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio47", "gpio48";
+=09=09=09=09=09function =3D "qup14";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio47", "gpio48";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c15_default: qup-i2c15-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio27", "gpio28";
+=09=09=09=09=09function =3D "qup15";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio27", "gpio28";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c16_default: qup-i2c16-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio86", "gpio85";
+=09=09=09=09=09function =3D "qup16";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio86", "gpio85";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c17_default: qup-i2c17-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio55", "gpio56";
+=09=09=09=09=09function =3D "qup17";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio55", "gpio56";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c18_default: qup-i2c18-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio23", "gpio24";
+=09=09=09=09=09function =3D "qup18";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio23", "gpio24";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09qup_i2c19_default: qup-i2c19-default {
+=09=09=09=09mux {
+=09=09=09=09=09pins =3D "gpio57", "gpio58";
+=09=09=09=09=09function =3D "qup19";
+=09=09=09=09};
+
+=09=09=09=09config {
+=09=09=09=09=09pins =3D "gpio57", "gpio58";
+=09=09=09=09=09drive-strength =3D <0x02>;
+=09=09=09=09=09bias-disable;
+=09=09=09=09};
+=09=09=09};
 =09=09};
=20
 =09=09remoteproc_mpss: remoteproc@4080000 {
--=20
2.30.2


