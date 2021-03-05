Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91E5D32F557
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 22:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhCEVgV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 16:36:21 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:25500 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbhCEVf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 16:35:59 -0500
Date:   Fri, 05 Mar 2021 21:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1614980157;
        bh=+SBABWBIKMDYORQcBuRJh6o5xp6e6HWvH10j5/ENmDM=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=l0UVX1iMI/WlG8Na0l5QVu+LBb6zN+9s1q1CQtAIDST5gWwm62/3FPIUPDJIqWi6C
         TOPjEe3lxUDZiezK9KpOQ9hZ+qFn3pulqxNjrTvzC7EtJ7Xs1vOIC3Pb1uAbdhHob2
         WCsMXujISnOY/mdSE0pMhzWOPBuaBCNKPIa3iua8=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH] arm64: dts: add support for the Pixel 2 XL
Message-ID: <20210305213235.398252-1-caleb@connolly.tech>
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

Add a minimal devicetree capable of booting on the Pixel 2 XL MSM8998
device.

It's currently possible to boot the device into postmarketOS with USB
networking, however the display panel depends on Display Stream
Compression which is not yet supported in the kernel.

The bootloader also requires that the dtbo partition contains a device
tree overlay with a particular id which has to be overlayed onto the
existing dtb. It's possible to use a specially crafted dtbo partition to
workaround this, more information is available here:

    https://gitlab.com/calebccff/dtbo-google-wahoo-mainline

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
It's possible to get wifi working by running Bjorns diag-router in the
background, without this the wifi firmware crashes every 10 seconds or
so. This is the same issue encountered on the OnePlus 5.

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8998-google-taimen.dts   |  14 +
 .../boot/dts/qcom/msm8998-google-wahoo.dtsi   | 391 ++++++++++++++++++
 3 files changed, 406 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-google-taimen.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-google-wahoo.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/M=
akefile
index 5113fac80b7a..d942d3ec3928 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8994-msft-lumia-cityman=
.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8994-sony-xperia-kitakami-sumire.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8996-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-asus-novago-tp370ql.dtb
+dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-google-taimen.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-hp-envy-x2.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-lenovo-miix-630.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8998-google-taimen.dts b/arch/arm6=
4/boot/dts/qcom/msm8998-google-taimen.dts
new file mode 100644
index 000000000000..ffaaafe14037
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-google-taimen.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, Caleb Connolly <caleb@connolly.tech>
+ */
+
+/dts-v1/;
+
+#include "msm8998-google-wahoo.dtsi"
+
+/ {
+=09model =3D "Google Pixel 2 XL";
+=09compatible =3D "google,taimen", "google,wahoo", "qcom,msm8998", "qcom,m=
sm8998-mtp";
+=09qcom,msm-id =3D <0x124 0x20001>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8998-google-wahoo.dtsi b/arch/arm6=
4/boot/dts/qcom/msm8998-google-wahoo.dtsi
new file mode 100644
index 000000000000..0c221ead2df7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-google-wahoo.dtsi
@@ -0,0 +1,391 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2020 Caleb Connolly <caleb@connolly.tech> */
+
+#include "msm8998.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
+#include "pm8005.dtsi"
+
+/delete-node/ &mpss_mem;
+/delete-node/ &venus_mem;
+/delete-node/ &mba_mem;
+/delete-node/ &slpi_mem;
+
+/ {
+=09aliases {
+=09};
+
+=09chosen {
+=09=09#address-cells =3D <2>;
+=09=09#size-cells =3D <2>;
+=09=09ranges;
+
+=09=09/* Add "earlycon" intended to be used in combination with UART seria=
l console */
+=09=09bootargs =3D "clk_ignore_unused earlycon console=3DttyGS0,115200";//=
 loglevel=3D10 drm.debug=3D15 debug";
+=09};
+
+=09reserved-memory {
+=09=09#address-cells =3D <2>;
+ =09=09#size-cells =3D <2>;
+ =09=09ranges;
+
+=09=09mpss_mem: memory@8cc00000 {
+=09=09=09reg =3D <0 0x8cc00000 0 0x7800000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09venus_mem: memory@94400000 {
+=09=09=09reg =3D <0 0x94400000 0 0x500000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09mba_mem: memory@94100000 {
+=09=09=09reg =3D <0 0x94900000 0 0x200000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09slpi_mem: memory@94b00000 {
+=09=09=09reg =3D <0 0x94b00000 0 0x700000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09ramoops: ramoops@a1810000 {
+=09=09=09compatible =3D "ramoops";
+=09=09=09reg =3D <0 0xa1810000 0 0x200000>;
+=09=09=09record-size =3D <0x20000>;
+=09=09=09console-size =3D <0x100000>;
+=09=09=09pmsg-size =3D <0x80000>;
+=09=09};
+=09};
+
+=09vph_pwr: vph-pwr-regulator {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vph_pwr";
+=09=09regulator-always-on;
+=09=09regulator-boot-on;
+=09};
+};
+
+&blsp1_uart3 {
+=09status =3D "disabled";
+
+=09bluetooth {
+=09=09compatible =3D "qcom,wcn3990-bt";
+
+=09=09vddio-supply =3D <&vreg_s4a_1p8>;
+=09=09vddxo-supply =3D <&vreg_l7a_1p8>;
+=09=09vddrf-supply =3D <&vreg_l17a_1p3>;
+=09=09vddch0-supply =3D <&vreg_l25a_3p3>;
+=09=09max-speed =3D <3200000>;
+=09};
+};
+
+&pcie0 {
+=09status =3D "disabled";
+};
+
+&pm8005_lsid1 {
+=09pm8005-regulators {
+=09=09compatible =3D "qcom,pm8005-regulators";
+
+=09=09vdd_s1-supply =3D <&vph_pwr>;
+
+=09=09pm8005_s1: s1 { /* VDD_GFX supply */
+=09=09=09regulator-min-microvolt =3D <524000>;
+=09=09=09regulator-max-microvolt =3D <1100000>;
+=09=09=09regulator-enable-ramp-delay =3D <500>;
+
+=09=09=09/* hack until we rig up the gpu consumer */
+=09=09=09regulator-always-on;
+=09=09};
+=09};
+};
+
+&qusb2phy {
+=09status =3D "okay";
+
+=09vdda-pll-supply =3D <&vreg_l12a_1p8>;
+=09vdda-phy-dpdm-supply =3D <&vreg_l24a_3p075>;
+};
+
+&remoteproc_adsp {
+=09status =3D "okay";
+
+=09firmware-name =3D "qcom/pixel2/adsp.mdt";
+};
+
+&remoteproc_mss {
+=09firmware-name =3D "qcom/pixel2/mba.mbn",
+=09                "qcom/pixel2/modem.mdt";
+};
+
+&remoteproc_slpi {
+=09status =3D "okay";
+
+=09firmware-name =3D "qcom/pixel2/slpi_v2.mdt";
+};
+
+&rpm_requests {
+=09pm8998-regulators {
+=09=09compatible =3D "qcom,rpm-pm8998-regulators";
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
+=09=09vdd_s13-supply =3D <&vph_pwr>;
+=09=09vdd_l1_l27-supply =3D <&vreg_s7a_1p025>;
+=09=09vdd_l2_l8_l17-supply =3D <&vreg_s3a_1p35>;
+=09=09vdd_l3_l11-supply =3D <&vreg_s7a_1p025>;
+=09=09vdd_l4_l5-supply =3D <&vreg_s7a_1p025>;
+=09=09vdd_l6-supply =3D <&vreg_s5a_2p04>;
+=09=09vdd_l7_l12_l14_l15-supply =3D <&vreg_s5a_2p04>;
+=09=09vdd_l9-supply =3D <&vreg_bob>;
+=09=09vdd_l10_l23_l25-supply =3D <&vreg_bob>;
+=09=09vdd_l13_l19_l21-supply =3D <&vreg_bob>;
+=09=09vdd_l16_l28-supply =3D <&vreg_bob>;
+=09=09vdd_l18_l22-supply =3D <&vreg_bob>;
+=09=09vdd_l20_l24-supply =3D <&vreg_bob>;
+=09=09vdd_l26-supply =3D <&vreg_s3a_1p35>;
+=09=09vdd_lvs1_lvs2-supply =3D <&vreg_s4a_1p8>;
+
+=09=09vreg_s3a_1p35: s3 {
+=09=09=09regulator-min-microvolt =3D <1352000>;
+=09=09=09regulator-max-microvolt =3D <1352000>;
+=09=09};
+=09=09vreg_s4a_1p8: s4 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-allow-set-load;
+=09=09};
+=09=09vreg_s5a_2p04: s5 {
+=09=09=09regulator-min-microvolt =3D <1904000>;
+=09=09=09regulator-max-microvolt =3D <2040000>;
+=09=09};
+=09=09vreg_s7a_1p025: s7 {
+=09=09=09regulator-min-microvolt =3D <900000>;
+=09=09=09regulator-max-microvolt =3D <1028000>;
+=09=09};
+=09=09vreg_l1a_0p875: l1 {
+=09=09=09regulator-min-microvolt =3D <880000>;
+=09=09=09regulator-max-microvolt =3D <880000>;
+=09=09};
+=09=09vreg_l2a_1p2: l2 {
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09};
+=09=09vreg_l3a_1p0: l3 {
+=09=09=09regulator-min-microvolt =3D <1000000>;
+=09=09=09regulator-max-microvolt =3D <1000000>;
+=09=09};
+=09=09vreg_l5a_0p8: l5 {
+=09=09=09regulator-min-microvolt =3D <800000>;
+=09=09=09regulator-max-microvolt =3D <800000>;
+=09=09};
+=09=09vreg_l6a_1p8: l6 {
+=09=09=09regulator-min-microvolt =3D <1808000>;
+=09=09=09regulator-max-microvolt =3D <1808000>;
+=09=09};
+=09=09vreg_l7a_1p8: l7 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+=09=09vreg_l8a_1p2: l8 {
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09};
+=09=09vreg_l9a_1p8: l9 {
+=09=09=09regulator-min-microvolt =3D <1808000>;
+=09=09=09regulator-max-microvolt =3D <2960000>;
+=09=09};
+=09=09vreg_l10a_1p8: l10 {
+=09=09=09regulator-min-microvolt =3D <1808000>;
+=09=09=09regulator-max-microvolt =3D <2960000>;
+=09=09};
+=09=09vreg_l11a_1p0: l11 {
+=09=09=09regulator-min-microvolt =3D <1000000>;
+=09=09=09regulator-max-microvolt =3D <1000000>;
+=09=09};
+=09=09vreg_l12a_1p8: l12 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+=09=09vreg_l13a_2p95: l13 {
+=09=09=09regulator-min-microvolt =3D <1808000>;
+=09=09=09regulator-max-microvolt =3D <2960000>;
+=09=09};
+=09=09vreg_l14a_1p88: l14 {
+=09=09=09regulator-min-microvolt =3D <1880000>;
+=09=09=09regulator-max-microvolt =3D <1880000>;
+=09=09};
+=09=09vreg_15a_1p8: l15 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+=09=09vreg_l16a_2p7: l16 {
+=09=09=09regulator-min-microvolt =3D <2704000>;
+=09=09=09regulator-max-microvolt =3D <2704000>;
+=09=09};
+=09=09vreg_l17a_1p3: l17 {
+=09=09=09regulator-min-microvolt =3D <1304000>;
+=09=09=09regulator-max-microvolt =3D <1304000>;
+=09=09};
+=09=09vreg_l18a_2p7: l18 {
+=09=09=09regulator-min-microvolt =3D <2704000>;
+=09=09=09regulator-max-microvolt =3D <2704000>;
+=09=09};
+=09=09vreg_l19a_3p0: l19 {
+=09=09=09regulator-min-microvolt =3D <3008000>;
+=09=09=09regulator-max-microvolt =3D <3008000>;
+=09=09};
+=09=09vreg_l20a_2p95: l20 {
+=09=09=09regulator-min-microvolt =3D <2960000>;
+=09=09=09regulator-max-microvolt =3D <2960000>;
+=09=09=09regulator-allow-set-load;
+=09=09};
+=09=09vreg_l21a_2p95: l21 {
+=09=09=09regulator-min-microvolt =3D <2960000>;
+=09=09=09regulator-max-microvolt =3D <2960000>;
+=09=09=09regulator-allow-set-load;
+=09=09=09regulator-system-load =3D <800000>;
+=09=09};
+=09=09vreg_l22a_2p85: l22 {
+=09=09=09regulator-min-microvolt =3D <2864000>;
+=09=09=09regulator-max-microvolt =3D <2864000>;
+=09=09};
+=09=09vreg_l23a_3p3: l23 {
+=09=09=09regulator-min-microvolt =3D <3312000>;
+=09=09=09regulator-max-microvolt =3D <3312000>;
+=09=09};
+=09=09vreg_l24a_3p075: l24 {
+=09=09=09regulator-min-microvolt =3D <3088000>;
+=09=09=09regulator-max-microvolt =3D <3088000>;
+=09=09};
+=09=09vreg_l25a_3p3: l25 {
+=09=09=09regulator-min-microvolt =3D <3104000>;
+=09=09=09regulator-max-microvolt =3D <3312000>;
+=09=09};
+=09=09vreg_l26a_1p2: l26 {
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09=09regulator-allow-set-load;
+=09=09};
+=09=09vreg_l28_3p0: l28 {
+=09=09=09regulator-min-microvolt =3D <3008000>;
+=09=09=09regulator-max-microvolt =3D <3008000>;
+=09=09};
+
+=09=09vreg_lvs1a_1p8: lvs1 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+
+=09=09vreg_lvs2a_1p8: lvs2 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+
+=09};
+
+=09pmi8998-regulators {
+=09=09compatible =3D "qcom,rpm-pmi8998-regulators";
+
+=09=09vdd_bob-supply =3D <&vph_pwr>;
+
+=09=09vreg_bob: bob {
+=09=09=09regulator-min-microvolt =3D <3312000>;
+=09=09=09regulator-max-microvolt =3D <3600000>;
+=09=09};
+=09};
+};
+
+&spmi_bus {
+=09pmic@0 {
+=09=09compatible =3D "qcom,pm8994", "qcom,spmi-pmic";
+=09=09reg =3D <0x0 SPMI_USID>;
+=09=09#address-cells =3D <1>;
+=09=09#size-cells =3D <0>;
+=09=09pon@800 {
+=09=09=09compatible =3D "qcom,pm8916-pon";
+
+=09=09=09reg =3D <0x800>;
+=09=09=09mode-bootloader =3D <0x2>;
+=09=09=09mode-recovery =3D <0x1>;
+
+=09=09=09pwrkey {
+=09=09=09=09compatible =3D "qcom,pm8941-pwrkey";
+=09=09=09=09interrupts =3D <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+=09=09=09=09debounce =3D <15625>;
+=09=09=09=09bias-pull-up;
+=09=09=09=09linux,code =3D <KEY_POWER>;
+=09=09=09};
+=09=09};
+=09};
+};
+
+&tlmm {
+=09gpio-reserved-ranges =3D <0 4>, <81 4>;
+};
+
+/*
+ * The device does contain a USB3 capable type-c port,
+ * however it doesn't seem to work when superspeed mode is
+ * enabled.
+ */
+&usb3 {
+=09status =3D "okay";
+
+=09/* Operate "GCC_USB30_MASTER_CLK" in HS mode (>=3D60 MHz) */
+=09assigned-clock-rates =3D <19200000>, <60000000>;
+
+=09/* Disable USB3 pipe_clk requirement */
+=09qcom,select-utmi-as-pipe-clk;
+};
+
+&usb3_dwc3 {
+=09/* Drop USB 3 SuperSpeed PHY to bring up the "usb0" interface */
+=09phys =3D <&qusb2phy>;
+=09phy-names =3D "usb2-phy";
+
+=09/* We can only operate at USB 2.0 speeds */
+=09maximum-speed =3D "high-speed";
+
+=09/* Force to peripheral until we have Type-C hooked up */
+=09dr_mode =3D "peripheral";
+};
+
+&ufshc {
+=09vcc-supply =3D <&vreg_l20a_2p95>;
+=09vccq-supply =3D <&vreg_l26a_1p2>;
+=09vccq2-supply =3D <&vreg_s4a_1p8>;
+=09vcc-max-microamp =3D <750000>;
+=09vccq-max-microamp =3D <560000>;
+=09vccq2-max-microamp =3D <750000>;
+};
+
+&ufsphy {
+=09vdda-phy-supply =3D <&vreg_l1a_0p875>;
+=09vdda-pll-supply =3D <&vreg_l2a_1p2>;
+=09vddp-ref-clk-supply =3D <&vreg_l26a_1p2>;
+=09vdda-phy-max-microamp =3D <51400>;
+=09vdda-pll-max-microamp =3D <14600>;
+=09vddp-ref-clk-max-microamp =3D <100>;
+=09vddp-ref-clk-always-on;
+};
+
+&wifi {
+=09status =3D "okay";
+
+=09vdd-0.8-cx-mx-supply =3D <&vreg_l5a_0p8>;
+=09vdd-1.8-xo-supply =3D <&vreg_l7a_1p8>;
+=09vdd-1.3-rfa-supply =3D <&vreg_l17a_1p3>;
+=09vdd-3.3-ch0-supply =3D <&vreg_l25a_3p3>;
+};
--=20
2.29.2


