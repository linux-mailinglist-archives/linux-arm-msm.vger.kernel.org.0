Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25FB43FE322
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 21:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344767AbhIATew (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 15:34:52 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:34519 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344705AbhIATev (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 15:34:51 -0400
Date:   Wed, 01 Sep 2021 19:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630524829;
        bh=ibCv1IMzH6Dk98novLBvEIHS6nd/oDLUENJ1HWbt/XM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=wdTW5t/oJyfSEhF6WMmtoJKY3HDRZ4p2Ip9Imyh4uhqJa2q3WpzExmN2LnKsxL9hp
         yyLGS/9Ua8fREmcy21qTxLLXmiNJSC7JUrSJNKrZoJaoVaE+mvkq5UhCYxlnS5ChMa
         BL+wazX+8qZCAPBQxNSIQqCFqtO3bbwnGL28KLFU=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 3/4] arm64: dts: qcom: Add support for the Xiaomi MSM8996 platform
Message-ID: <20210901193214.250375-4-y.oudjana@protonmail.com>
In-Reply-To: <20210901193214.250375-1-y.oudjana@protonmail.com>
References: <20210901193214.250375-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are 5 Xiaomi devices with the MSM8996 SoC:

 - Mi 5 (gemini): MSM8996 + PMI8994
 - Mi Note 2 (scorpio): MSM8996 Pro + PMI8996
 - Mi 5s (capricorn): MSM8996 Pro + PMI8996
 - Mi Mix (lithium): MSM8996 Pro + PMI8996
 - Mi 5s Plus (natrium): MSM8996 Pro + PMI8996

These devices share a common board design with only a few differences.
Add support for the common board, as well as support for the Mi Note 2.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  | 673 ++++++++++++++++++
 .../boot/dts/qcom/msm8996-xiaomi-scorpio.dts  | 431 +++++++++++
 3 files changed, 1105 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/M=
akefile
index 70516508be56..7e33d492bf26 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -33,6 +33,7 @@ dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8996-pmi8996-sony-xperi=
a-tone-keyaki.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8996-sony-xperia-tone-dora.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8996-sony-xperia-tone-kagura.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8996-sony-xperia-tone-keyaki.dtb
+dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8996-xiaomi-scorpio.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-asus-novago-tp370ql.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-hp-envy-x2.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-lenovo-miix-630.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm=
64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
new file mode 100644
index 000000000000..d239b01b8505
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -0,0 +1,673 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Yassine Oudjana <y.oudjana@protonmail.com>
+ */
+
+/dts-v1/;
+
+#include "msm8996.dtsi"
+#include "pm8994.dtsi"
+#include "pmi8994.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+/ {
+=09clocks {
+=09=09compatible =3D "simple-bus";
+
+=09=09divclk1_cdc: divclk1 {
+=09=09=09compatible =3D "gpio-gate-clock";
+=09=09=09clocks =3D <&rpmcc RPM_SMD_DIV_CLK1>;
+=09=09=09#clock-cells =3D <0>;
+=09=09=09enable-gpios =3D <&pm8994_gpios 15 GPIO_ACTIVE_HIGH>;
+
+=09=09=09pinctrl-names =3D "default";
+=09=09=09pinctrl-0 =3D <&divclk1_default>;
+=09=09};
+
+=09=09divclk4: divclk4 {
+=09=09=09compatible =3D "fixed-clock";
+=09=09=09#clock-cells =3D <0>;
+=09=09=09clock-frequency =3D <32768>;
+=09=09=09clock-output-names =3D "divclk4";
+
+=09=09=09pinctrl-names =3D "default";
+=09=09=09pinctrl-0 =3D <&divclk4_pin_a>;
+=09=09};
+=09};
+
+=09gpio_keys {
+=09=09compatible =3D "gpio-keys";
+
+=09=09vol_up {
+=09=09=09label =3D "Volume Up";
+=09=09=09gpios =3D <&pm8994_gpios 2 GPIO_ACTIVE_LOW>;
+=09=09=09linux,code =3D <KEY_VOLUMEUP>;
+=09=09=09wakeup-source;
+=09=09=09debounce-interval =3D <15>;
+=09=09};
+
+=09=09dome {
+=09=09=09label =3D "Home";
+=09=09=09gpios =3D <&tlmm 34 GPIO_ACTIVE_LOW>;
+=09=09=09linux,code =3D <KEY_HOME>;
+=09=09=09wakeup-source;
+=09=09=09debounce-interval =3D <15>;
+=09=09};
+=09};
+
+=09reserved-memory {
+=09=09memory@88800000 {
+=09=09=09reg =3D <0x0 0x88800000 0x0 0x1400000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09/* This platform has all PIL regions offset by 0x1400000 */
+=09=09/delete-node/ mpss@88800000;
+=09=09mpss_region: mpss@89c00000 {
+=09=09=09reg =3D <0x0 0x89c00000 0x0 0x6200000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09/delete-node/ adsp@8ea00000;
+=09=09adsp_region: adsp@8ea00000 {
+=09=09=09reg =3D <0x0 0x8fe00000 0x0 0x1b00000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09/delete-node/ slpi@90b00000;
+=09=09slpi_region: slpi@91900000 {
+=09=09=09reg =3D <0x0 0x91900000 0x0 0xa00000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09/delete-node/ gpu@8f200000;
+=09=09zap_shader_region: gpu@92300000 {
+=09=09=09compatible =3D "shared-dma-pool";
+=09=09=09reg =3D <0x0 0x92300000 0x0 0x2000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09/delete-node/ venus@91000000;
+=09=09venus_region: venus@90400000 {
+=09=09=09reg =3D <0x0 0x92400000 0x0 0x500000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09ramoops@92900000 {
+=09=09=09compatible =3D "ramoops";
+=09=09=09reg =3D <0x0 0x92900000 0x0 0x100000>;
+=09=09=09no-map;
+
+=09=09=09record-size =3D <0x8000>;
+=09=09=09console-size =3D <0x80000>;
+=09=09=09ftrace-size =3D <0x20000>;
+=09=09=09pmsg-size =3D <0x40000>;
+=09=09};
+
+=09=09/delete-node/ rmtfs@86700000;
+=09=09rmtfs@f6c00000 {
+=09=09=09compatible =3D "qcom,rmtfs-mem";
+=09=09=09reg =3D <0 0xf6c00000 0 0x200000>;
+=09=09=09no-map;
+
+=09=09=09qcom,client-id =3D <1>;
+=09=09=09qcom,vmid =3D <15>;
+=09=09};
+
+=09=09/delete-node/ mba@91500000;
+=09=09mba_region: mba@f6f00000 {
+=09=09=09reg =3D <0x0 0xf6f00000 0x0 0x100000>;
+=09=09=09no-map;
+=09=09};
+=09};
+
+=09vph_pwr: vph-pwr-regulator {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vph_pwr";
+=09=09regulator-min-microvolt =3D <3800000>;
+=09=09regulator-max-microvolt =3D <3800000>;
+=09=09regulator-always-on;
+=09=09regulator-boot-on;
+=09};
+
+=09vdd_3v2_tp: vdd-3v2-tp {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vdd_3v2_tp";
+=09=09regulator-min-microvolt =3D <3200000>;
+=09=09regulator-max-microvolt =3D <3200000>;
+=09=09startup-delay-us =3D <4000>;
+=09=09vin-supply =3D <&vph_pwr>;
+
+=09=09gpio =3D <&tlmm 73 0>;
+=09=09enable-active-high;
+=09};
+
+=09vdd_3v3: rome-vreg {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vdd_3v3";
+=09=09regulator-min-microvolt =3D <3300000>;
+=09=09regulator-max-microvolt =3D <3300000>;
+=09=09startup-delay-us =3D <4000>;
+=09=09vin-supply =3D <&vph_pwr_bbyp>;
+
+=09=09gpio =3D <&pm8994_gpios 9 0>;
+=09=09enable-active-high;
+=09=09pinctrl-names =3D "default";
+=09=09pinctrl-0 =3D <&rome_enable_default>;
+
+=09=09/* Required by QCA6174a - vddpe-3v3 */
+=09=09regulator-always-on;
+=09};
+
+=09/* WL_EN pin defined as a fixed regulator */
+=09wlan_en: wlan-en-1-8v {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "wlan-en-regulator";
+=09=09regulator-min-microvolt =3D <1800000>;
+=09=09regulator-max-microvolt =3D <1800000>;
+
+=09=09gpio =3D <&pm8994_gpios 8 0>;
+=09=09/* WLAN card specific delay */
+=09=09startup-delay-us =3D <70000>;
+=09=09enable-active-high;
+=09=09pinctrl-names =3D "default";
+=09=09pinctrl-0 =3D <&wlan_en_default>;
+=09};
+};
+
+&adsp_pil {
+=09status =3D "okay";
+};
+
+&blsp2_i2c2 {
+=09status =3D "okay";
+=09label =3D "NFC_I2C";
+
+=09nfc: pn548@28 {
+=09=09compatible =3D "nxp,nxp-nci-i2c";
+
+=09=09reg =3D <0x28>;
+=09=09clock-frequency =3D <400000>;
+
+=09=09interrupt-parent =3D <&tlmm>;
+=09=09interrupts =3D <9 IRQ_TYPE_LEVEL_HIGH>;
+
+=09=09enable-gpios =3D <&tlmm 12 GPIO_ACTIVE_HIGH>;
+=09=09firmware-gpios =3D <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+=09=09pinctrl-names =3D "default";
+=09=09pinctrl-0 =3D <&nfc_default>;
+=09};
+};
+
+&blsp2_i2c3 {
+=09status =3D "okay";
+=09label =3D "TYPEC_I2C";
+
+=09typec: tusb320@47 {
+=09=09compatible =3D "ti,tusb320";
+=09=09reg =3D <0x47>;
+=09=09interrupt-parent =3D <&tlmm>;
+=09=09interrupts =3D <63 IRQ_TYPE_EDGE_RISING>;
+=09};
+};
+
+&blsp2_i2c6 {
+=09status =3D "okay";
+=09label =3D "MSM_TS_I2C";
+};
+
+&blsp1_uart2 {
+=09status =3D "okay";
+=09label =3D "QCA_UART";
+
+=09bluetooth: qca6174a {
+=09=09compatible =3D "qcom,qca6174-bt";
+
+=09=09enable-gpios =3D <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
+=09=09clocks =3D <&divclk4>;
+=09};
+};
+
+&dsi0 {
+=09status =3D "okay";
+
+=09vdd-supply =3D <&vreg_l2a_1p25>;
+=09vddio-supply =3D <&vreg_l14a_1p8>;
+
+=09pinctrl-names =3D "default", "sleep";
+=09pinctrl-0 =3D <&mdss_dsi_default &mdss_te_default>;
+=09pinctrl-1 =3D <&mdss_dsi_sleep &mdss_te_sleep>;
+};
+
+&dsi0_out {
+=09status =3D "okay";
+
+=09data-lanes =3D <0 1 2 3>;
+};
+
+&dsi0_phy {
+=09status =3D "okay";
+
+=09vcca-supply =3D <&vreg_l28a_0p925>;
+};
+
+&gpu {
+=09status =3D "okay";
+};
+
+&mdss {
+=09status =3D "okay";
+};
+
+&mmcc {
+=09vdd-gfx-supply =3D <&vdd_gfx>;
+};
+
+&pcie0 {
+=09status =3D "okay";
+
+=09/* Supplied by vdd_3v3, but choose wlan_en to drive enable pin high */
+=09vddpe-3v3-supply =3D <&wlan_en>;
+=09vdda-supply =3D <&vreg_l28a_0p925>;
+
+=09perst-gpios =3D <&tlmm 35 GPIO_ACTIVE_LOW>;
+=09wake-gpios =3D <&tlmm 37 GPIO_ACTIVE_HIGH>;
+};
+
+&pcie_phy {
+=09status =3D "okay";
+
+=09vdda-phy-supply =3D <&vreg_l28a_0p925>;
+=09vdda-pll-supply =3D <&vreg_l12a_1p8>;
+};
+
+&pm8994_resin {
+=09status =3D "okay";
+
+=09linux,code =3D <KEY_VOLUMEDOWN>;
+};
+
+&usb3 {
+=09status =3D "okay";
+=09extcon =3D <&typec>;
+
+=09qcom,select-utmi-as-pipe-clk;
+
+=09dwc3@6a00000 {
+=09=09extcon =3D <&typec>;
+
+=09=09/* usb3-phy is not used on this device */
+=09=09phys =3D <&hsusb_phy1>;
+=09=09phy-names =3D "usb2-phy";
+
+=09=09maximum-speed =3D "high-speed";
+=09=09snps,is-utmi-l1-suspend;
+=09=09snps,usb2-gadget-lpm-disable;
+=09=09snps,hird-threshold =3D /bits/ 8 <0>;
+=09};
+};
+
+&hsusb_phy1 {
+=09status =3D "okay";
+=09extcon =3D <&typec>;
+
+=09vdda-pll-supply =3D <&vreg_l12a_1p8>;
+=09vdda-phy-dpdm-supply =3D <&vreg_l24a_3p075>;
+};
+
+&ufshc {
+=09status =3D "okay";
+
+=09vcc-supply =3D <&vreg_l20a_2p95>;
+=09vccq-supply =3D <&vreg_l25a_1p2>;
+=09vccq2-supply =3D <&vreg_s4a_1p8>;
+
+=09vcc-max-microamp =3D <600000>;
+=09vccq-max-microamp =3D <450000>;
+=09vccq2-max-microamp =3D <450000>;
+};
+
+&ufsphy {
+=09status =3D "okay";
+
+=09vdda-phy-supply =3D <&vreg_l28a_0p925>;
+=09vdda-pll-supply =3D <&vreg_l12a_1p8>;
+
+=09vdda-phy-max-microamp =3D <18380>;
+=09vdda-pll-max-microamp =3D <9440>;
+
+=09vddp-ref-clk-supply =3D <&vreg_l25a_1p2>;
+=09vddp-ref-clk-max-microamp =3D <100>;
+=09vddp-ref-clk-always-on;
+};
+
+&venus {
+=09status =3D "okay";
+};
+
+&wcd9335 {
+=09clock-names =3D "mclk", "slimbus";
+=09clocks =3D <&divclk1_cdc>,
+=09=09 <&rpmcc RPM_SMD_BB_CLK1>;
+
+=09vdd-buck-supply =3D <&vreg_s4a_1p8>;
+=09vdd-buck-sido-supply =3D <&vreg_s4a_1p8>;
+=09vdd-rx-supply =3D <&vreg_s4a_1p8>;
+=09vdd-tx-supply =3D <&vreg_s4a_1p8>;
+=09vdd-vbat-supply =3D <&vph_pwr>;
+=09vdd-micbias-supply =3D <&vph_pwr_bbyp>;
+=09vdd-io-supply =3D <&vreg_s4a_1p8>;
+};
+
+&rpm_requests {
+=09pm8994-regulators {
+=09=09compatible =3D "qcom,rpm-pm8994-regulators";
+
+=09=09vdd_s1-supply =3D <&vph_pwr>;
+=09=09vdd_s2-supply =3D <&vph_pwr>;
+=09=09vdd_s3-supply =3D <&vph_pwr>;
+=09=09vdd_s4-supply =3D <&vph_pwr>;
+=09=09vdd_s5-supply =3D <&vph_pwr>;
+=09=09vdd_s6-supply =3D <&vph_pwr>;
+=09=09vdd_s7-supply =3D <&vph_pwr>;
+=09=09vdd_s8-supply =3D <&vph_pwr>;
+=09=09vdd_s9-supply =3D <&vph_pwr>;
+=09=09vdd_s10-supply =3D <&vph_pwr>;
+=09=09vdd_s11-supply =3D <&vph_pwr>;
+=09=09vdd_s12-supply =3D <&vph_pwr>;
+=09=09vdd_l1-supply =3D <&vreg_s1b_1p025>;
+=09=09vdd_l2_l26_l28-supply =3D <&vreg_s3a_1p3>;
+=09=09vdd_l3_l11-supply =3D <&vreg_s3a_1p3>;
+=09=09vdd_l4_l27_l31-supply =3D <&vreg_s3a_1p3>;
+=09=09vdd_l5_l7-supply =3D <&vreg_s5a_2p15>;
+=09=09vdd_l6_l12_l32-supply =3D <&vreg_s5a_2p15>;
+=09=09vdd_l8_l16_l30-supply =3D <&vph_pwr>;
+=09=09vdd_l9_l10_l18_l22-supply =3D <&vph_pwr_bbyp>;
+=09=09vdd_l13_l19_l23_l24-supply =3D <&vph_pwr_bbyp>;
+=09=09vdd_l14_l15-supply =3D <&vreg_s5a_2p15>;
+=09=09vdd_l17_l29-supply =3D <&vph_pwr_bbyp>;
+=09=09vdd_l20_l21-supply =3D <&vph_pwr_bbyp>;
+=09=09vdd_l25-supply =3D <&vreg_s3a_1p3>;
+=09=09vdd_lvs1_2-supply =3D <&vreg_s4a_1p8>;
+
+=09=09vreg_s3a_1p3: s3 {
+=09=09=09regulator-name =3D "vreg_s3a_1p3";
+=09=09=09regulator-min-microvolt =3D <1300000>;
+=09=09=09regulator-max-microvolt =3D <1300000>;
+
+=09=09=09/* Required by QCA6174a - vdd-core */
+=09=09=09regulator-always-on;
+=09=09};
+=09=09vreg_s4a_1p8: s4 {
+=09=09=09regulator-name =3D "vreg_s4a_1p8";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-allow-set-load;
+
+=09=09=09/* Required by QCA6174a - vddio */
+=09=09=09regulator-always-on;
+=09=09};
+=09=09vreg_s5a_2p15: s5 {
+=09=09=09regulator-name =3D "vreg_s5a_2p15";
+=09=09=09regulator-min-microvolt =3D <2150000>;
+=09=09=09regulator-max-microvolt =3D <2150000>;
+=09=09};
+=09=09vreg_s7a_0p8: s7 {
+=09=09=09regulator-name =3D "vreg_s7a_0p8";
+=09=09=09regulator-min-microvolt =3D <800000>;
+=09=09=09regulator-max-microvolt =3D <800000>;
+=09=09};
+=09=09vreg_l1a_1p0: l1 {
+=09=09=09regulator-name =3D "vreg_l1a_1p0";
+=09=09=09regulator-min-microvolt =3D <1000000>;
+=09=09=09regulator-max-microvolt =3D <1000000>;
+=09=09};
+=09=09vreg_l2a_1p25: l2 {
+=09=09=09regulator-name =3D "vreg_l2a_1p25";
+=09=09=09regulator-min-microvolt =3D <1250000>;
+=09=09=09regulator-max-microvolt =3D <1250000>;
+=09=09};
+=09=09vreg_l4a_1p225: l4 {
+=09=09=09regulator-name =3D "vreg_l4a_1p225";
+=09=09=09regulator-min-microvolt =3D <1225000>;
+=09=09=09regulator-max-microvolt =3D <1225000>;
+=09=09};
+=09=09vreg_l6a_1p8: l6 {
+=09=09=09regulator-name =3D "vreg_l6a_1p8";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+=09=09vreg_l8a_1p8: l8 {
+=09=09=09regulator-name =3D "vreg_l8a_1p8";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+=09=09vreg_l9a_1p8: l9 {
+=09=09=09regulator-name =3D "vreg_l9a_1p8";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+=09=09vreg_l10a_1p8: l10 {
+=09=09=09regulator-name =3D "vreg_l10a_1p8";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+=09=09vreg_l12a_1p8: l12 {
+=09=09=09regulator-name =3D "vreg_l12a_1p8";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-allow-set-load;
+=09=09};
+=09=09vreg_l13a_2p95: l13 {
+=09=09=09regulator-name =3D "vreg_l13a_2p95";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <2950000>;
+=09=09};
+=09=09vreg_l14a_1p8: l14 {
+=09=09=09regulator-name =3D "vreg_l14a_1p8";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+=09=09vreg_l15a_1p8: l15 {
+=09=09=09regulator-name =3D "vreg_l15a_1p8";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+=09=09vreg_l16a_2p7: l16 {
+=09=09=09regulator-name =3D "vreg_l16a_2p7";
+=09=09=09regulator-min-microvolt =3D <2700000>;
+=09=09=09regulator-max-microvolt =3D <2700000>;
+=09=09};
+=09=09vreg_l19a_3p3: l19 {
+=09=09=09regulator-name =3D "vreg_l19a_3p3";
+=09=09=09regulator-min-microvolt =3D <3000000>;
+=09=09=09regulator-max-microvolt =3D <3000000>;
+=09=09};
+=09=09vreg_l20a_2p95: l20 {
+=09=09=09regulator-name =3D "vreg_l20a_2p95";
+=09=09=09regulator-min-microvolt =3D <2950000>;
+=09=09=09regulator-max-microvolt =3D <2950000>;
+=09=09=09regulator-allow-set-load;
+=09=09};
+=09=09vreg_l21a_2p95: l21 {
+=09=09=09regulator-name =3D "vreg_l21a_2p95";
+=09=09=09regulator-min-microvolt =3D <3300000>;
+=09=09=09regulator-max-microvolt =3D <3300000>;
+=09=09=09regulator-always-on;
+=09=09};
+=09=09vreg_l23a_2p8: l23 {
+=09=09=09regulator-name =3D "vreg_l23a_2p8";
+=09=09=09regulator-min-microvolt =3D <2800000>;
+=09=09=09regulator-max-microvolt =3D <2800000>;
+=09=09};
+=09=09vreg_l24a_3p075: l24 {
+=09=09=09regulator-name =3D "vreg_l24a_3p075";
+=09=09=09regulator-min-microvolt =3D <3075000>;
+=09=09=09regulator-max-microvolt =3D <3075000>;
+=09=09};
+=09=09vreg_l25a_1p2: l25 {
+=09=09=09regulator-name =3D "vreg_l25a_1p2";
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09=09regulator-allow-set-load;
+=09=09};
+=09=09vreg_l27a_1p2: l27 {
+=09=09=09regulator-name =3D "vreg_l27a_1p2";
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09};
+=09=09vreg_l28a_0p925: l28 {
+=09=09=09regulator-name =3D "vreg_l28a_0p925";
+=09=09=09regulator-min-microvolt =3D <925000>;
+=09=09=09regulator-max-microvolt =3D <925000>;
+=09=09=09regulator-allow-set-load;
+=09=09};
+=09=09vreg_l30a_1p8: l30 {
+=09=09=09regulator-name =3D "vreg_l30a_1p8";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+
+=09=09=09/* Required by QCA6174a - vddio-xtal */
+=09=09=09regulator-always-on;
+=09=09};
+=09=09vreg_l32a_1p8: l32 {
+=09=09=09regulator-name =3D "vreg_l32a_1p8";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+=09=09vreg_lvs1a_1p8: lvs1 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+=09=09vreg_lvs2a_1p8: lvs2 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+=09};
+
+=09pmi8994-regulators {
+=09=09compatible =3D "qcom,rpm-pmi8994-regulators";
+
+=09=09vdd_s1-supply =3D <&vph_pwr>;
+=09=09vdd_s2-supply =3D <&vph_pwr>;
+=09=09vdd_s3-supply =3D <&vph_pwr>;
+=09=09vdd_bst_byp-supply =3D <&vph_pwr>;
+
+=09=09vreg_s1b_1p025: s1 {
+=09=09=09regulator-name =3D "vreg_s1b_1p025";
+=09=09=09regulator-min-microvolt =3D <1025000>;
+=09=09=09regulator-max-microvolt =3D <1025000>;
+=09=09};
+
+=09=09vph_pwr_bbyp: boost-bypass {
+=09=09=09regulator-name =3D "vph_pwr_bbyp";
+=09=09=09regulator-min-microvolt =3D <3150000>;
+=09=09=09regulator-max-microvolt =3D <3600000>;
+=09=09};
+=09};
+};
+
+&pm8994_spmi_regulators {
+=09qcom,saw-reg =3D <&saw3>;
+=09s8 {
+=09=09qcom,saw-slave;
+=09};
+=09s9 {
+=09=09qcom,saw-slave;
+=09};
+=09s10 {
+=09=09qcom,saw-slave;
+=09};
+=09vreg_apc_0p8: s11 {
+=09=09qcom,saw-leader;
+=09=09regulator-name =3D "vreg_apc_0p8";
+=09=09regulator-min-microvolt =3D <470000>;
+=09=09regulator-max-microvolt =3D <1140000>;
+=09=09regulator-max-step-microvolt =3D <150000>;
+=09=09regulator-always-on;
+=09};
+};
+
+&pmi8994_spmi_regulators {
+=09vdd_gfx: s2 {
+=09=09regulator-name =3D "vdd_gfx";
+=09=09regulator-min-microvolt =3D <400000>;
+=09=09regulator-max-microvolt =3D <1015000>;
+=09=09regulator-enable-ramp-delay =3D <500>;
+=09};
+};
+
+&pm8994_gpios {
+=09wlan_en_default: wlan-en-default {
+=09=09pins =3D "gpio8";
+=09=09function =3D PMIC_GPIO_FUNC_NORMAL;
+=09=09output-low;
+=09=09qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_LOW>;
+=09=09power-source =3D <PM8994_GPIO_S4>;
+=09=09bias-disable;
+=09};
+
+=09rome_enable_default: rome-enable-default {
+=09=09pins =3D "gpio9";
+=09=09function =3D PMIC_GPIO_FUNC_NORMAL;
+=09=09output-high;
+=09=09qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_LOW>;
+=09=09power-source =3D <PM8994_GPIO_VPH>;
+=09};
+
+=09divclk1_default: divclk1_default {
+=09=09pins =3D "gpio15";
+=09=09function =3D PMIC_GPIO_FUNC_FUNC1;
+=09=09bias-disable;
+=09=09power-source =3D <PM8994_GPIO_S4>;
+=09=09qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_LOW>;
+=09};
+
+=09divclk4_pin_a: divclk4 {
+=09=09pins =3D "gpio18";
+=09=09function =3D PMIC_GPIO_FUNC_FUNC2;
+=09=09bias-disable;
+=09=09power-source =3D <PM8994_GPIO_S4>;
+=09};
+};
+
+&tlmm {
+=09mdss_dsi_default: mdss_dsi_default {
+=09=09pins =3D "gpio8";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <8>;
+=09=09bias-disable;
+=09};
+
+=09mdss_dsi_sleep: mdss_dsi_sleep {
+=09=09pins =3D "gpio8";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-down;
+=09};
+
+=09mdss_te_default: mdss_te_default {
+=09=09pins =3D "gpio10";
+=09=09function =3D "mdp_vsync";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-down;
+=09};
+
+=09mdss_te_sleep: mdss_te_sleep {
+=09=09pins =3D "gpio10";
+=09=09function =3D "mdp_vsync";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-down;
+=09};
+
+=09nfc_default: nfc_default {
+=09=09pins =3D "gpio12", "gpio21";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <16>;
+=09=09bias-pull-up;
+=09};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts b/arch/arm=
64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
new file mode 100644
index 000000000000..b5c1dc24ce43
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
@@ -0,0 +1,431 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Yassine Oudjana <y.oudjana@protonmail.com>
+ */
+
+/dts-v1/;
+
+#include "msm8996-xiaomi-common.dtsi"
+#include "pmi8996.dtsi"
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+
+/ {
+=09model =3D "Xiaomi Mi Note 2";
+=09compatible =3D "xiaomi,scorpio", "qcom,msm8996";
+=09qcom,msm-id =3D <305 0x10000>;
+=09qcom,board-id =3D <34 0>;
+
+=09chosen {
+=09=09#address-cells =3D <2>;
+=09=09#size-cells =3D <2>;
+=09=09ranges;
+
+=09=09framebuffer0: framebuffer@83401000 {
+=09=09=09compatible =3D "simple-framebuffer";
+=09=09=09reg =3D <0x00 0x83401000 0x00 (1080 * 1920 * 3)>;
+=09=09=09width =3D <1080>;
+=09=09=09height =3D <1920>;
+=09=09=09stride =3D <(1080 * 3)>;
+=09=09=09format =3D "r8g8b8";
+
+=09=09=09/* DSI0 and MDP SMMU clocks */
+=09=09=09clocks =3D <&mmcc MDSS_MDP_CLK>,
+=09=09=09=09 <&mmcc MMSS_MMAGIC_AHB_CLK>,
+=09=09=09=09 <&mmcc MDSS_AHB_CLK>,
+=09=09=09=09 <&mmcc MDSS_AXI_CLK>,
+=09=09=09=09 <&mmcc MMSS_MISC_AHB_CLK>,
+=09=09=09=09 <&mmcc MDSS_BYTE0_CLK>,
+=09=09=09=09 <&mmcc MDSS_PCLK0_CLK>,
+=09=09=09=09 <&mmcc MDSS_ESC0_CLK>,
+=09=09=09=09 <&mmcc SMMU_MDP_AHB_CLK>,
+=09=09=09=09 <&mmcc SMMU_MDP_AXI_CLK>;
+
+=09=09=09/* MDSS power domain */
+=09=09=09power-domains =3D <&mmcc MDSS_GDSC>;
+=09=09};
+=09};
+
+=09reserved-memory {
+=09=09cont_splash_mem: memory@83401000 {
+=09=09=09reg =3D <0x0 0x83401000 0x0 (1080 * 1920 * 3)>;
+=09=09=09no-map;
+=09=09};
+=09};
+};
+
+&adsp_pil {
+=09firmware-name =3D "qcom/msm8996/scorpio/adsp.mbn";
+};
+
+&blsp2_i2c6 {
+=09touchscreen: atmel-mxt-ts@4a {
+=09=09compatible =3D "atmel,maxtouch";
+=09=09reg =3D <0x4a>;
+=09=09interrupt-parent =3D <&tlmm>;
+=09=09interrupts =3D <125 IRQ_TYPE_LEVEL_LOW>;
+=09=09vdda-supply =3D <&vreg_l6a_1p8>;
+=09=09vdd-supply =3D <&vdd_3v2_tp>;
+=09=09reset-gpios =3D <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+=09=09pinctrl-names =3D "default", "sleep";
+=09=09pinctrl-0 =3D <&touchscreen_default>;
+=09=09pinctrl-1 =3D <&touchscreen_sleep>;
+=09};
+};
+
+&gpu {
+=09zap-shader {
+=09=09firmware-name =3D "qcom/msm8996/scorpio/a530_zap.mbn";
+=09};
+};
+
+&mdp_smmu {
+=09/*
+=09 * Probing this SMMU causes a crash due to writing to some secure
+=09 * registers. Disable it for now.
+=09 */
+=09status =3D "disabled";
+};
+
+&mdss {
+=09/*
+=09 * MDSS depends on the MDP SMMU, and probing it alters the bootloader
+=09 * configured framebuffer used by simplefb. Disable it for now.
+=09 */
+=09status =3D "disabled";
+};
+
+&q6asmdai {
+=09dai@0 {
+=09=09reg =3D <0>;
+=09};
+
+=09dai@1 {
+=09=09reg =3D <1>;
+=09};
+
+=09dai@2 {
+=09=09reg =3D <2>;
+=09};
+};
+
+&sound {
+=09compatible =3D "qcom,apq8096-sndcard";
+=09model =3D "scorpio";
+=09audio-routing =3D=09"RX_BIAS", "MCLK";
+
+=09mm1-dai-link {
+=09=09link-name =3D "MultiMedia1";
+=09=09cpu {
+=09=09=09sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+=09=09};
+=09};
+
+=09mm2-dai-link {
+=09=09link-name =3D "MultiMedia2";
+=09=09cpu {
+=09=09=09sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+=09=09};
+=09};
+
+=09mm3-dai-link {
+=09=09link-name =3D "MultiMedia3";
+=09=09cpu {
+=09=09=09sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+=09=09};
+=09};
+
+=09slim-dai-link {
+=09=09link-name =3D "SLIM Playback";
+=09=09cpu {
+=09=09=09sound-dai =3D <&q6afedai SLIMBUS_6_RX>;
+=09=09};
+
+=09=09platform {
+=09=09=09sound-dai =3D <&q6routing>;
+=09=09};
+
+=09=09codec {
+=09=09=09sound-dai =3D <&wcd9335 6>;
+=09=09};
+=09};
+
+=09slimcap-dai-link {
+=09=09link-name =3D "SLIM Capture";
+=09=09cpu {
+=09=09=09sound-dai =3D <&q6afedai SLIMBUS_0_TX>;
+=09=09};
+
+=09=09platform {
+=09=09=09sound-dai =3D <&q6routing>;
+=09=09};
+
+=09=09codec {
+=09=09=09sound-dai =3D <&wcd9335 1>;
+=09=09};
+=09};
+};
+
+&venus {
+=09firmware-name =3D "qcom/msm8996/scorpio/venus.mbn";
+};
+
+&rpm_requests {
+=09pm8994-regulators {
+=09=09vreg_l3a_0p875: l3 {
+=09=09=09regulator-name =3D "vreg_l3a_0p875";
+=09=09=09regulator-min-microvolt =3D <850000>;
+=09=09=09regulator-max-microvolt =3D <1300000>;
+=09=09};
+=09=09vreg_l11a_1p1: l11 {
+=09=09=09regulator-name =3D "vreg_l11a_1p1";
+=09=09=09regulator-min-microvolt =3D <1100000>;
+=09=09=09regulator-max-microvolt =3D <1100000>;
+=09=09};
+=09=09vreg_l17a_2p8: l17 {
+=09=09=09regulator-name =3D "vreg_l17a_2p8";
+=09=09=09regulator-min-microvolt =3D <2800000>;
+=09=09=09regulator-max-microvolt =3D <2800000>;
+=09=09};
+=09=09vreg_l18a_2p8: l18 {
+=09=09=09regulator-name =3D "vreg_l18a_2p8";
+=09=09=09regulator-min-microvolt =3D <2800000>;
+=09=09=09regulator-max-microvolt =3D <2800000>;
+=09=09};
+=09=09vreg_l22a_3p0: l22 {
+=09=09=09regulator-name =3D "vreg_l22a_3p0";
+=09=09=09regulator-min-microvolt =3D <2950000>;
+=09=09=09regulator-max-microvolt =3D <3500000>;
+=09=09};
+=09=09vreg_l29a_2p7: l29 {
+=09=09=09regulator-name =3D "vreg_l29a_2p7";
+=09=09=09regulator-min-microvolt =3D <2700000>;
+=09=09=09regulator-max-microvolt =3D <2700000>;
+=09=09};
+=09};
+};
+
+&vdd_gfx {
+=09regulator-max-microvolt =3D <1065000>;
+};
+
+&pm8994_gpios {
+=09gpio-line-names =3D
+=09=09"NC",=09=09=09/* GPIO_1  */
+=09=09"VOL_UP_N",=09=09/* GPIO_2  */
+=09=09"SPKR_ID",=09=09/* GPIO_3  */
+=09=09"PWM_HAPTICS",=09=09/* GPIO_4  */
+=09=09"INFARED_DRV",=09=09/* GPIO_5  */
+=09=09"NC",=09=09=09/* GPIO_6  */
+=09=09"KEYPAD_LED_EN_A",=09/* GPIO_7  */
+=09=09"WL_EN",=09=09/* GPIO_8  */
+=09=09"3P3_ENABLE",=09=09/* GPIO_9  */
+=09=09"KEYPAD_LED_EN_B",=09/* GPIO_10 */
+=09=09"FP_ID", =09=09/* GPIO_11 */
+=09=09"NC",=09=09=09/* GPIO_12 */
+=09=09"NC",=09=09=09/* GPIO_13 */
+=09=09"NC",=09=09=09/* GPIO_14 */
+=09=09"DIVCLK1_CDC",=09=09/* GPIO_15 */
+=09=09"DIVCLK2_HAPTICS",=09/* GPIO_16 */
+=09=09"NC",=09=09=09/* GPIO_17 */
+=09=09"32KHz_CLK_IN",=09=09/* GPIO_18 */
+=09=09"BT_EN",=09=09/* GPIO_19 */
+=09=09"PMIC_SLB",=09=09/* GPIO_20 */
+=09=09"UIM_BATT_ALARM",=09/* GPIO_21 */
+=09=09"NC";=09=09=09/* GPIO_22 */
+};
+
+&pm8994_mpps {
+=09gpio-line-names =3D
+=09=09"VREF_SDC_UIM_APC",=09/* MPP_1 */
+=09=09"NC",=09=09=09/* MPP_2 */
+=09=09"VREF_DACX",=09=09/* MPP_3 */
+=09=09"NC",=09=09=09/* MPP_4 */
+=09=09"NC",=09=09=09/* MPP_5 */
+=09=09"STAT_SMB1351",=09=09/* MPP_6 */
+=09=09"NC",=09=09=09/* MPP_7 */
+=09=09"NC";=09=09=09/* MPP_8 */
+};
+
+&pmi8994_gpios {
+=09gpio-line-names =3D
+=09=09"NC",=09=09=09/* GPIO_1  */
+=09=09"SPKR_PA_RST",=09=09/* GPIO_2  */
+=09=09"NC",=09=09=09/* GPIO_3  */
+=09=09"NC",=09=09=09/* GPIO_4  */
+=09=09"NC",=09=09=09/* GPIO_5  */
+=09=09"NC",=09=09=09/* GPIO_6  */
+=09=09"NC",=09=09=09/* GPIO_7  */
+=09=09"NC",=09=09=09/* GPIO_8  */
+=09=09"NC",=09=09=09/* GPIO_9  */
+=09=09"NC";=09=09=09/* GPIO_10 */
+};
+
+&tlmm {
+=09gpio-line-names =3D
+=09=09"ESE_SPI_MOSI",=09=09/* GPIO_0   */
+=09=09"ESE_SPI_MISO",=09=09/* GPIO_1   */
+=09=09"NC",=09=09=09/* GPIO_2   */
+=09=09"ESE_SPI_CLK",=09=09/* GPIO_3   */
+=09=09"MSM_UART_TX",=09=09/* GPIO_4   */
+=09=09"MSM_UART_RX",=09=09/* GPIO_5   */
+=09=09"NFC_I2C_SDA",=09=09/* GPIO_6   */
+=09=09"NFC_I2C_SCL",=09=09/* GPIO_7   */
+=09=09"OLED_RESET_N",=09=09/* GPIO_8   */
+=09=09"NFC_IRQ",=09=09/* GPIO_9   */
+=09=09"OLED_TE",=09=09/* GPIO_10  */
+=09=09"OLED_ID_DET1", =09/* GPIO_11  */
+=09=09"NFC_DISABLE",=09=09/* GPIO_12  */
+=09=09"CAM_MCLK0",=09=09/* GPIO_13  */
+=09=09"OLED_ID_DET2",=09=09/* GPIO_14  */
+=09=09"CAM_MCLK2",=09=09/* GPIO_15  */
+=09=09"ESE_PWR_REQ",=09=09/* GPIO_16  */
+=09=09"CCI_I2C_SDA0",=09=09/* GPIO_17  */
+=09=09"CCI_I2C_SCL0",=09=09/* GPIO_18  */
+=09=09"CCI_I2C_SDA1",=09=09/* GPIO_19  */
+=09=09"CCI_I2C_SCL1",=09=09/* GPIO_20  */
+=09=09"NFC_DWL_REQ",=09=09/* GPIO_21  */
+=09=09"CCI_TIMER1",=09=09/* GPIO_22  */
+=09=09"WEBCAM1_RESET_N",=09/* GPIO_23  */
+=09=09"ESE_IRQ",=09=09/* GPIO_24  */
+=09=09"NC",=09=09=09/* GPIO_25  */
+=09=09"WEBCAM1_STANDBY",=09/* GPIO_26  */
+=09=09"NC",=09=09=09/* GPIO_27  */
+=09=09"NC",=09=09=09/* GPIO_28  */
+=09=09"OLED_ERR_FG",=09=09/* GPIO_29  */
+=09=09"CAM1_RST_N",=09=09/* GPIO_30  */
+=09=09"HIFI_SW_MUTE",=09=09/* GPIO_31  */
+=09=09"NC",=09=09=09/* GPIO_32  */
+=09=09"NC",=09=09=09/* GPIO_33  */
+=09=09"FP_DOME_SW",=09=09/* GPIO_34  */
+=09=09"PCI_E0_RST_N",=09=09/* GPIO_35  */
+=09=09"PCI_E0_CLKREQ_N",=09/* GPIO_36  */
+=09=09"PCI_E0_WAKE",=09=09/* GPIO_37  */
+=09=09"OV_PWDN",=09=09/* GPIO_38  */
+=09=09"NC",=09=09=09/* GPIO_39  */
+=09=09"VDDR_1P6_EN",=09=09/* GPIO_40  */
+=09=09"QCA_UART_TXD",=09=09/* GPIO_41  */
+=09=09"QCA_UART_RXD",=09=09/* GPIO_42  */
+=09=09"QCA_UART_CTS",=09=09/* GPIO_43  */
+=09=09"QCA_UART_RTS",=09=09/* GPIO_44  */
+=09=09"MAWC_UART_TX",=09=09/* GPIO_45  */
+=09=09"MAWC_UART_RX",=09=09/* GPIO_46  */
+=09=09"NC",=09=09=09/* GPIO_47  */
+=09=09"NC",=09=09=09/* GPIO_48  */
+=09=09"AUDIO_SWITCH_EN",=09/* GPIO_49  */
+=09=09"FP_SPI_RST",=09=09/* GPIO_50  */
+=09=09"TYPEC_I2C_SDA",=09/* GPIO_51  */
+=09=09"TYPEC_I2C_SCL",=09/* GPIO_52  */
+=09=09"CODEC_INT2_N",=09=09/* GPIO_53  */
+=09=09"CODEC_INT1_N",=09=09/* GPIO_54  */
+=09=09"APPS_I2C7_SDA",=09/* GPIO_55  */
+=09=09"APPS_I2C7_SCL",=09/* GPIO_56  */
+=09=09"FORCE_USB_BOOT",=09/* GPIO_57  */
+=09=09"SPKR_I2S_BCK",=09=09/* GPIO_58  */
+=09=09"SPKR_I2S_WS",=09=09/* GPIO_59  */
+=09=09"SPKR_I2S_DOUT",=09/* GPIO_60  */
+=09=09"SPKR_I2S_DIN",=09=09/* GPIO_61  */
+=09=09"ESE_RSTN",=09=09/* GPIO_62  */
+=09=09"TYPEC_INT",=09=09/* GPIO_63  */
+=09=09"CODEC_RESET_N",=09/* GPIO_64  */
+=09=09"PCM_CLK",=09=09/* GPIO_65  */
+=09=09"PCM_SYNC",=09=09/* GPIO_66  */
+=09=09"PCM_DIN",=09=09/* GPIO_67  */
+=09=09"PCM_DOUT",=09=09/* GPIO_68  */
+=09=09"CDC_44K1_CLK",=09=09/* GPIO_69  */
+=09=09"SLIMBUS_CLK",=09=09/* GPIO_70  */
+=09=09"SLIMBUS_DATA0",=09/* GPIO_71  */
+=09=09"SLIMBUS_DATA1",=09/* GPIO_72  */
+=09=09"LDO_5V_IN_EN",=09=09/* GPIO_73  */
+=09=09"NC",=09=09=09/* GPIO_74  */
+=09=09"TSP_RST_N",=09=09/* GPIO_75  */
+=09=09"NC",=09=09=09/* GPIO_76  */
+=09=09"TOUCHKEY_INT",=09=09/* GPIO_77  */
+=09=09"SPKR_I2S_MCLK",=09/* GPIO_78  */
+=09=09"SPKR_PA_INT",=09=09/* GPIO_79  */
+=09=09"SENSOR_RESET_N",=09/* GPIO_80  */
+=09=09"FP_SPI_MOSI",=09=09/* GPIO_81  */
+=09=09"FP_SPI_MISO",=09=09/* GPIO_82  */
+=09=09"FP_SPI_CS_N",=09=09/* GPIO_83  */
+=09=09"FP_SPI_CLK",=09=09/* GPIO_84  */
+=09=09"HIFI_SD",=09=09/* GPIO_85  */
+=09=09"CAM_VDD_1P05_EN",=09/* GPIO_86  */
+=09=09"MSM_TS_I2C_SDA",=09/* GPIO_87  */
+=09=09"MSM_TS_I2C_SCL",=09/* GPIO_88  */
+=09=09"NC",=09=09=09/* GPIO_89  */
+=09=09"ESE_SPI_CS_N",=09=09/* GPIO_90  */
+=09=09"NC",=09=09=09/* GPIO_91  */
+=09=09"NC",=09=09=09/* GPIO_92  */
+=09=09"NC",=09=09=09/* GPIO_93  */
+=09=09"NC",=09=09=09/* GPIO_94  */
+=09=09"NC",=09=09=09/* GPIO_95  */
+=09=09"NC",=09=09=09/* GPIO_96  */
+=09=09"GRFC_0",=09=09/* GPIO_97  */
+=09=09"GRFC_1",=09=09/* GPIO_98  */
+=09=09"NC",=09=09=09/* GPIO_99  */
+=09=09"GRFC_3",=09=09/* GPIO_100 */
+=09=09"GRFC_4",=09=09/* GPIO_101 */
+=09=09"NC",=09=09=09/* GPIO_102 */
+=09=09"NC",=09=09=09/* GPIO_103 */
+=09=09"GRFC_7",=09=09/* GPIO_104 */
+=09=09"UIM2_DATA",=09=09/* GPIO_105 */
+=09=09"UIM2_CLK",=09=09/* GPIO_106 */
+=09=09"UIM2_RESET",=09=09/* GPIO_107 */
+=09=09"UIM2_PRESENT",=09=09/* GPIO_108 */
+=09=09"UIM1_DATA",=09=09/* GPIO_109 */
+=09=09"UIM1_CLK",=09=09/* GPIO_110 */
+=09=09"UIM1_RESET",=09=09/* GPIO_111 */
+=09=09"UIM1_PRESENT",=09=09/* GPIO_112 */
+=09=09"UIM_BATT_ALARM",=09/* GPIO_113 */
+=09=09"GRFC_8",=09=09/* GPIO_114 */
+=09=09"GRFC_9",=09=09/* GPIO_115 */
+=09=09"TX_GTR_THRES",=09=09/* GPIO_116 */
+=09=09"ACC_INT",=09=09/* GPIO_117 */
+=09=09"GYRO_INT",=09=09/* GPIO_118 */
+=09=09"COMPASS_INT",=09=09/* GPIO_119 */
+=09=09"PROXIMITY_INT_N",=09/* GPIO_120 */
+=09=09"FP_IRQ",=09=09/* GPIO_121 */
+=09=09"TSP_TA",=09=09/* GPIO_122 */
+=09=09"HALL_INTR2",=09=09/* GPIO_123 */
+=09=09"HALL_INTR1",=09=09/* GPIO_124 */
+=09=09"TS_INT_N",=09=09/* GPIO_125 */
+=09=09"NC",=09=09=09/* GPIO_126 */
+=09=09"GRFC_11",=09=09/* GPIO_127 */
+=09=09"HIFI_PWR_EN",=09=09/* GPIO_128 */
+=09=09"EXT_GPS_LNA_EN",=09/* GPIO_129 */
+=09=09"NC",=09=09=09/* GPIO_130 */
+=09=09"NC",=09=09=09/* GPIO_131 */
+=09=09"NC",=09=09=09/* GPIO_132 */
+=09=09"GRFC_14",=09=09/* GPIO_133 */
+=09=09"GSM_TX2_PHASE_D",=09/* GPIO_134 */
+=09=09"HIFI_SW_SEL",=09=09/* GPIO_135 */
+=09=09"GRFC_15",=09=09/* GPIO_136 */
+=09=09"RFFE3_DATA",=09=09/* GPIO_137 */
+=09=09"RFFE3_CLK",=09=09/* GPIO_138 */
+=09=09"NC",=09=09=09/* GPIO_139 */
+=09=09"NC",=09=09=09/* GPIO_140 */
+=09=09"RFFE5_DATA",=09=09/* GPIO_141 */
+=09=09"RFFE5_CLK",=09=09/* GPIO_142 */
+=09=09"NC",=09=09=09/* GPIO_143 */
+=09=09"COEX_UART_TX",=09=09/* GPIO_144 */
+=09=09"COEX_UART_RX",=09=09/* GPIO_145 */
+=09=09"RFFE2_DATA",=09=09/* GPIO_146 */
+=09=09"RFFE2_CLK",=09=09/* GPIO_147 */
+=09=09"RFFE1_DATA",=09=09/* GPIO_148 */
+=09=09"RFFE1_CLK";=09=09/* GPIO_149 */
+
+=09touchscreen_default: touchscreen_default {
+=09=09pins =3D "gpio75", "gpio125";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <10>;
+=09=09bias-pull-up;
+=09};
+
+=09touchscreen_sleep: touchscreen_sleep {
+=09=09pins =3D "gpio75", "gpio125";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+};
--=20
2.33.0


