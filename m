Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 868E22F6A21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 19:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbhANSyz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 13:54:55 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:39339 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbhANSyz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 13:54:55 -0500
Date:   Thu, 14 Jan 2021 18:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1610650447;
        bh=hjqAAEZOw1ci6jFQB+qJAaGGBpAoymTcBiJVZ/cWwlA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=GNOP9DL2zpoJVi6G1lB1DjEpo+22tpCGvuUGwlWABPqCCWqrwWqmHDwsjO0OjkxYq
         AUC0ezkWAQPus6T0yk9oyv5ZvNpCO4uMdQs4ddMiFfCXGGDnCgRYvDj8sRp8riRh2p
         ppBLsdODIqYCmSTSYpLoTon04cWwCLqzQq6xbxNE=
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
Subject: [PATCH v3 1/2] arm64: dts: sdm845: add oneplus6/6t devices
Message-ID: <20210114185227.25265-2-caleb@connolly.tech>
In-Reply-To: <20210114185227.25265-1-caleb@connolly.tech>
References: <20210114185227.25265-1-caleb@connolly.tech>
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

Add initial support for the OnePlus 6 (enchilada) and 6T (fajita) based
on the sdm845-mtp DT with the following functionality:

 * Touch
 * Display
 * GPU
 * Wlan and Bluetooth
 * USB peripheral mode
 * Remoteproc

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
Changes since v1
 * Remove unused pinctrl nodes
 * Properly model touchscreen vio supply GPIO
 * Improve comments
 * Remove bq27541 battery as it doesn't work

Changes since v2
 * Specify clock frequency of touchscreen i2c
 * Remove tri-state-key nodes until a better solution can be found
 * Cleaned up pinctrl nodes
 * Remove unused regulators
 * Improve formatting
 * Address Bjorn's comments
 * Remove unused regulators
---
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 621 ++++++++++++++++++
 .../dts/qcom/sdm845-oneplus-enchilada.dts     |  19 +
 .../boot/dts/qcom/sdm845-oneplus-fajita.dts   |  23 +
 4 files changed, 665 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/M=
akefile
index 5113fac80b7a..19f18af3ecff 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -44,6 +44,8 @@ dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-cheza-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-db845c.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-xiaomi-beryllium.dtb
+dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-oneplus-enchilada.dtb
+dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-oneplus-fajita.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sm8150-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sm8150-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
new file mode 100644
index 000000000000..9efa38c9f1c2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -0,0 +1,621 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SDM845 OnePlus 6(T) (enchilada / fajita) common device tree source
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "sdm845.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
+
+/delete-node/ &rmtfs_mem;
+
+/ {
+
+=09aliases {
+=09=09hsuart0 =3D &uart6;
+=09};
+
+=09reserved-memory {
+=09=09/*
+=09=09 * The rmtfs memory region in downstream is 'dynamically allocated'
+=09=09 * but given the same address every time. Hard code it as this addre=
ss is
+=09=09 * where the modem firmware expects it to be.
+=09=09 */
+=09=09rmtfs_mem: memory@f5b01000 {
+=09=09=09compatible =3D "qcom,rmtfs-mem";
+=09=09=09reg =3D <0 0xf5b01000 0 0x200000>;
+=09=09=09no-map;
+
+=09=09=09qcom,client-id =3D <1>;
+=09=09=09qcom,vmid =3D <15>;
+=09=09};
+
+=09=09/*
+=09=09 * It seems like reserving the old rmtfs_mem region is also needed t=
o prevent
+=09=09 * random crashes which are most likely modem related, more testing =
needed.
+=09=09 */
+=09=09removed_region: memory@88f00000 {
+=09=09=09no-map;
+=09=09=09reg =3D <0 0x88f00000 0 0x200000>;
+=09=09};
+
+=09=09ramoops: ramoops@ac300000 {
+=09=09=09compatible =3D "ramoops";
+=09=09=09reg =3D <0 0xac300000 0 0x400000>;
+=09=09=09record-size =3D <0x40000>;
+=09=09=09console-size =3D <0x40000>;
+=09=09=09ftrace-size =3D <0x40000>;
+=09=09=09pmsg-size =3D <0x200000>;
+=09=09=09devinfo-size =3D <0x1000>;
+=09=09=09ecc-size =3D <16>;
+=09=09};
+=09};
+
+=09vph_pwr: vph-pwr-regulator {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vph_pwr";
+=09=09regulator-min-microvolt =3D <3700000>;
+=09=09regulator-max-microvolt =3D <3700000>;
+=09};
+
+=09/*
+=09 * Apparently RPMh does not provide support for PM8998 S4 because it
+=09 * is always-on; model it as a fixed regulator.
+=09 */
+=09vreg_s4a_1p8: pm8998-smps4 {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vreg_s4a_1p8";
+
+=09=09regulator-min-microvolt =3D <1800000>;
+=09=09regulator-max-microvolt =3D <1800000>;
+
+=09=09regulator-always-on;
+=09=09regulator-boot-on;
+
+=09=09vin-supply =3D <&vph_pwr>;
+=09};
+
+=09/*
+=09 * The touchscreen regulator seems to be controlled somehow by a gpio.
+=09 * Model it as a fixed regulator and keep it on. Without schematics we
+=09 * don't know how this is actually wired up...
+=09 */
+=09ts_1p8_supply: ts-1p8-regulator {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "ts_1p8_supply";
+
+=09=09regulator-min-microvolt =3D <1800000>;
+=09=09regulator-max-microvolt =3D <1800000>;
+
+=09=09gpio =3D <&tlmm 88 0>;
+=09=09enable-active-high;
+=09=09regulator-boot-on;
+=09};
+
+=09gpio-keys {
+=09=09compatible =3D "gpio-keys";
+=09=09label =3D "Volume keys";
+=09=09autorepeat;
+
+=09=09pinctrl-names =3D "default";
+=09=09pinctrl-0 =3D <&volume_down_gpio &volume_up_gpio>;
+
+=09=09vol-down {
+=09=09=09label =3D "Volume down";
+=09=09=09linux,code =3D <KEY_VOLUMEDOWN>;
+=09=09=09gpios =3D <&pm8998_gpio 5 GPIO_ACTIVE_LOW>;
+=09=09=09debounce-interval =3D <15>;
+=09=09};
+
+=09=09vol-up {
+=09=09=09label =3D "Volume up";
+=09=09=09linux,code =3D <KEY_VOLUMEUP>;
+=09=09=09gpios =3D <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
+=09=09=09debounce-interval =3D <15>;
+=09=09};
+=09};
+};
+
+&apps_rsc {
+=09pm8998-rpmh-regulators {
+=09=09compatible =3D "qcom,pm8998-rpmh-regulators";
+=09=09qcom,pmic-id =3D "a";
+
+=09=09vdd-s1-supply =3D <&vph_pwr>;
+=09=09vdd-s2-supply =3D <&vph_pwr>;
+=09=09vdd-s3-supply =3D <&vph_pwr>;
+=09=09vdd-s4-supply =3D <&vph_pwr>;
+=09=09vdd-s5-supply =3D <&vph_pwr>;
+=09=09vdd-s6-supply =3D <&vph_pwr>;
+=09=09vdd-s7-supply =3D <&vph_pwr>;
+=09=09vdd-s8-supply =3D <&vph_pwr>;
+=09=09vdd-s9-supply =3D <&vph_pwr>;
+=09=09vdd-s10-supply =3D <&vph_pwr>;
+=09=09vdd-s11-supply =3D <&vph_pwr>;
+=09=09vdd-s12-supply =3D <&vph_pwr>;
+=09=09vdd-s13-supply =3D <&vph_pwr>;
+=09=09vdd-l1-l27-supply =3D <&vreg_s7a_1p025>;
+=09=09vdd-l2-l8-l17-supply =3D <&vreg_s3a_1p35>;
+=09=09vdd-l3-l11-supply =3D <&vreg_s7a_1p025>;
+=09=09vdd-l4-l5-supply =3D <&vreg_s7a_1p025>;
+=09=09vdd-l6-supply =3D <&vph_pwr>;
+=09=09vdd-l7-l12-l14-l15-supply =3D <&vreg_s5a_2p04>;
+=09=09vdd-l9-supply =3D <&vreg_bob>;
+=09=09vdd-l10-l23-l25-supply =3D <&vreg_bob>;
+=09=09vdd-l13-l19-l21-supply =3D <&vreg_bob>;
+=09=09vdd-l16-l28-supply =3D <&vreg_bob>;
+=09=09vdd-l18-l22-supply =3D <&vreg_bob>;
+=09=09vdd-l20-l24-supply =3D <&vreg_bob>;
+=09=09vdd-l26-supply =3D <&vreg_s3a_1p35>;
+=09=09vin-lvs-1-2-supply =3D <&vreg_s4a_1p8>;
+
+=09=09vreg_s3a_1p35: smps3 {
+=09=09=09regulator-min-microvolt =3D <1352000>;
+=09=09=09regulator-max-microvolt =3D <1352000>;
+=09=09};
+
+=09=09vreg_s5a_2p04: smps5 {
+=09=09=09regulator-min-microvolt =3D <1904000>;
+=09=09=09regulator-max-microvolt =3D <2040000>;
+=09=09};
+
+=09=09vreg_s7a_1p025: smps7 {
+=09=09=09regulator-min-microvolt =3D <900000>;
+=09=09=09regulator-max-microvolt =3D <1028000>;
+=09=09};
+
+=09=09vdda_mipi_dsi0_pll:
+=09=09vdda_qlink_lv:
+=09=09vdda_ufs1_core:
+=09=09vdda_usb1_ss_core:
+=09=09vreg_l1a_0p875: ldo1 {
+=09=09=09regulator-min-microvolt =3D <880000>;
+=09=09=09regulator-max-microvolt =3D <880000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l2a_1p2: ldo2 {
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09=09regulator-always-on;
+=09=09};
+
+=09=09vreg_l5a_0p8: ldo5 {
+=09=09=09regulator-min-microvolt =3D <800000>;
+=09=09=09regulator-max-microvolt =3D <800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l7a_1p8: ldo7 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vdda_qusb_hs0_1p8:
+=09=09vreg_l12a_1p8: ldo12 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l14a_1p88: ldo14 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09=09regulator-always-on;
+=09=09};
+
+=09=09vreg_l17a_1p3: ldo17 {
+=09=09=09regulator-min-microvolt =3D <1304000>;
+=09=09=09regulator-max-microvolt =3D <1304000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l20a_2p95: ldo20 {
+=09=09=09regulator-min-microvolt =3D <2704000>;
+=09=09=09regulator-max-microvolt =3D <2960000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vdda_qusb_hs0_3p1:
+=09=09vreg_l24a_3p075: ldo24 {
+=09=09=09regulator-min-microvolt =3D <3088000>;
+=09=09=09regulator-max-microvolt =3D <3088000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l25a_3p3: ldo25 {
+=09=09=09regulator-min-microvolt =3D <3300000>;
+=09=09=09regulator-max-microvolt =3D <3312000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+=09=09vdda_mipi_dsi0_1p2:
+=09=09vdda_ufs1_1p2:
+=09=09vreg_l26a_1p2: ldo26 {
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l28a_3p0: ldo28 {
+=09=09=09regulator-min-microvolt =3D <2856000>;
+=09=09=09regulator-max-microvolt =3D <3008000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+=09};
+
+=09pmi8998-rpmh-regulators {
+=09=09compatible =3D "qcom,pmi8998-rpmh-regulators";
+=09=09qcom,pmic-id =3D "b";
+
+=09=09vdd-bob-supply =3D <&vph_pwr>;
+
+=09=09vreg_bob: bob {
+=09=09=09regulator-min-microvolt =3D <3312000>;
+=09=09=09regulator-max-microvolt =3D <3600000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_AUTO>;
+=09=09=09regulator-allow-bypass;
+=09=09};
+=09};
+
+=09pm8005-rpmh-regulators {
+=09=09compatible =3D "qcom,pm8005-rpmh-regulators";
+=09=09qcom,pmic-id =3D "c";
+
+=09=09vdd-s1-supply =3D <&vph_pwr>;
+=09=09vdd-s2-supply =3D <&vph_pwr>;
+=09=09vdd-s3-supply =3D <&vph_pwr>;
+=09=09vdd-s4-supply =3D <&vph_pwr>;
+
+=09=09vreg_s3c_0p6: smps3 {
+=09=09=09regulator-min-microvolt =3D <600000>;
+=09=09=09regulator-max-microvolt =3D <600000>;
+=09=09};
+=09};
+};
+
+&adsp_pas {
+=09status =3D "okay";
+=09firmware-name =3D "qcom/sdm845/oneplus6/adsp.mbn";
+};
+
+&cdsp_pas {
+=09status =3D "okay";
+=09firmware-name =3D "qcom/sdm845/oneplus6/cdsp.mbn";
+};
+
+&dsi0 {
+=09status =3D "okay";
+=09vdda-supply =3D <&vdda_mipi_dsi0_1p2>;
+
+=09#address-cells =3D <1>;
+=09#size-cells =3D <0>;
+
+=09/*
+=09 * Both devices use different panels but all other properties
+=09 * are common. Compatible line is declared in device dts.
+=09 */
+=09display_panel: panel@0 {
+=09=09status =3D "disabled";
+
+=09=09#address-cells =3D <1>;
+=09=09#size-cells =3D <0>;
+=09=09reg =3D <0>;
+
+=09=09vddio-supply =3D <&vreg_l14a_1p88>;
+
+=09=09reset-gpios =3D <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+=09=09pinctrl-names =3D "default";
+=09=09pinctrl-0 =3D <&panel_reset_pins &panel_te_pin &panel_esd_pin>;
+
+=09=09port {
+=09=09=09panel_in: endpoint {
+=09=09=09=09remote-endpoint =3D <&dsi0_out>;
+=09=09=09};
+=09=09};
+=09};
+};
+
+&dsi0_out {
+=09remote-endpoint =3D <&panel_in>;
+=09data-lanes =3D <0 1 2 3>;
+};
+
+&dsi0_phy {
+=09status =3D "okay";
+=09vdds-supply =3D <&vdda_mipi_dsi0_pll>;
+};
+
+&gcc {
+=09protected-clocks =3D <GCC_QSPI_CORE_CLK>,
+=09=09=09=09<GCC_QSPI_CORE_CLK_SRC>,
+=09=09=09=09<GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+=09=09=09=09<GCC_LPASS_Q6_AXI_CLK>,
+=09=09=09=09<GCC_LPASS_SWAY_CLK>;
+};
+
+&gpu {
+=09zap-shader {
+=09=09memory-region =3D <&gpu_mem>;
+=09=09firmware-name =3D "qcom/sdm845/oneplus6/a630_zap.mbn";
+=09};
+};
+
+&i2c12 {
+=09status =3D "okay";
+=09clock-frequency =3D <400000>;
+
+=09synaptics-rmi4-i2c@20 {
+=09=09compatible =3D "syna,rmi4-i2c";
+=09=09reg =3D <0x20>;
+=09=09#address-cells =3D <1>;
+=09=09#size-cells =3D <0>;
+=09=09interrupts-extended =3D <&tlmm 125 IRQ_TYPE_EDGE_FALLING>;
+
+=09=09pinctrl-names =3D "default";
+=09=09pinctrl-0 =3D <&ts_default_pins>;
+
+=09=09vdd-supply =3D <&vreg_l28a_3p0>;
+=09=09vio-supply =3D <&ts_1p8_supply>;
+
+=09=09syna,reset-delay-ms =3D <200>;
+=09=09syna,startup-delay-ms =3D <200>;
+
+=09=09rmi4-f01@1 {
+=09=09=09reg =3D <0x01>;
+=09=09=09syna,nosleep-mode =3D <1>;
+=09=09};
+
+=09=09rmi4-f12@12 {
+=09=09=09reg =3D <0x12>;
+=09=09=09touchscreen-x-mm =3D <68>;
+=09=09=09touchscreen-y-mm =3D <144>;
+=09=09=09syna,sensor-type =3D <1>;
+=09=09=09syna,rezero-wait-ms =3D <200>;
+=09=09};
+=09};
+};
+
+&mdss {
+=09status =3D "okay";
+};
+
+&mdss_mdp {
+=09status =3D "okay";
+};
+
+/* Modem/wifi*/
+&mss_pil {
+=09status =3D "okay";
+=09firmware-name =3D "qcom/sdm845/oneplus6/mba.mbn", "qcom/sdm845/oneplus6=
/modem.mbn";
+};
+
+&pm8998_gpio {
+=09volume_down_gpio: pm8998_gpio5 {
+=09=09pinconf {
+=09=09=09pins =3D "gpio5";
+=09=09=09function =3D "normal";
+=09=09=09input-enable;
+=09=09=09bias-pull-up;
+=09=09=09qcom,drive-strength =3D <0>;
+=09=09};
+=09};
+
+=09volume_up_gpio: pm8998_gpio6 {
+=09=09pinconf {
+=09=09=09pins =3D "gpio6";
+=09=09=09function =3D "normal";
+=09=09=09input-enable;
+=09=09=09bias-pull-up;
+=09=09=09qcom,drive-strength =3D <0>;
+=09=09};
+=09};
+};
+
+&qupv3_id_1 {
+=09status =3D "okay";
+};
+
+&qupv3_id_0 {
+=09status =3D "okay";
+};
+
+&qup_i2c12_default {
+=09mux {
+=09=09pins =3D "gpio49", "gpio50";
+=09=09function =3D "qup12";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+};
+
+&qup_i2c10_default {
+=09pinconf {
+=09=09pins =3D "gpio55", "gpio56";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+};
+
+&qup_uart9_default {
+=09pinconf-tx {
+=09=09pins =3D "gpio4";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
+=09pinconf-rx {
+=09=09pins =3D "gpio5";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-up;
+=09};
+};
+
+// Prevent garbage data on bluetooth UART lines
+&qup_uart6_default {
+=09pinmux {
+=09=09pins =3D "gpio45", "gpio46", "gpio47", "gpio48";
+=09=09function =3D "qup6";
+=09};
+
+=09cts {
+=09=09pins =3D "gpio45";
+=09=09bias-pull-down;
+=09};
+
+=09rts-tx {
+=09=09pins =3D "gpio46", "gpio47";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
+=09rx {
+=09=09pins =3D "gpio48";
+=09=09bias-pull-up;
+=09};
+};
+
+&uart6 {
+=09status =3D "okay";
+
+=09bluetooth {
+=09=09compatible =3D "qcom,wcn3990-bt";
+
+=09=09/*
+=09=09 * This path is relative to the qca/
+=09=09 * subdir under lib/firmware.
+=09=09 */
+=09=09firmware-name =3D "oneplus6/crnv21.bin";
+
+=09=09vddio-supply =3D <&vreg_s4a_1p8>;
+=09=09vddxo-supply =3D <&vreg_l7a_1p8>;
+=09=09vddrf-supply =3D <&vreg_l17a_1p3>;
+=09=09vddch0-supply =3D <&vreg_l25a_3p3>;
+=09=09max-speed =3D <3200000>;
+=09};
+};
+
+&ufs_mem_hc {
+=09status =3D "okay";
+
+=09reset-gpios =3D <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+=09vcc-supply =3D <&vreg_l20a_2p95>;
+=09vcc-max-microamp =3D <600000>;
+};
+
+&ufs_mem_phy {
+=09status =3D "okay";
+
+=09vdda-phy-supply =3D <&vdda_ufs1_core>;
+=09vdda-pll-supply =3D <&vdda_ufs1_1p2>;
+};
+
+&usb_1 {
+=09status =3D "okay";
+
+=09/*
+=09 * disable USB3 clock requirement as the device only supports
+=09 * USB2.
+=09 */
+=09qcom,select-utmi-as-pipe-clk;
+};
+
+&usb_1_dwc3 {
+=09/*
+=09 * We don't have the capability to switch modes yet.
+=09 */
+=09dr_mode =3D "peripheral";
+
+=09/* fastest mode for USB 2 */
+=09maximum-speed =3D "high-speed";
+
+=09/* Remove USB3 phy as it's unused on this device. */
+=09phys =3D <&usb_1_hsphy>;
+=09phy-names =3D "usb2-phy";
+};
+
+&usb_1_hsphy {
+=09status =3D "okay";
+
+=09vdd-supply =3D <&vdda_usb1_ss_core>;
+=09vdda-pll-supply =3D <&vdda_qusb_hs0_1p8>;
+=09vdda-phy-dpdm-supply =3D <&vdda_qusb_hs0_3p1>;
+
+=09qcom,imp-res-offset-value =3D <8>;
+=09qcom,hstx-trim-value =3D <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+=09qcom,preemphasis-level =3D <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+=09qcom,preemphasis-width =3D <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+};
+
+&tlmm {
+=09gpio-reserved-ranges =3D <0 4>, <81 4>;
+
+=09tri_state_key_default: tri_state_key_default {
+=09=09mux {
+=09=09=09pins =3D "gpio40", "gpio42", "gpio26";
+=09=09=09function =3D "gpio";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-disable;
+=09=09};
+=09};
+
+=09ts_default_pins: ts-int {
+=09=09mux {
+=09=09=09pins =3D "gpio99", "gpio125";
+=09=09=09function =3D "gpio";
+=09=09=09drive-strength =3D <16>;
+=09=09=09bias-pull-up;
+=09=09};
+=09};
+
+=09panel_reset_pins: panel-reset {
+=09=09mux {
+=09=09=09pins =3D "gpio6", "gpio25", "gpio26";
+=09=09=09function =3D "gpio";
+=09=09=09drive-strength =3D <8>;
+=09=09=09bias-disable =3D <0>;
+=09=09};
+=09};
+
+=09panel_te_pin: panel-te {
+=09=09mux {
+=09=09=09pins =3D "gpio10";
+=09=09=09function =3D "mdp_vsync";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-disable;
+=09=09=09input-enable;
+=09=09};
+=09};
+
+=09panel_esd_pin: panel-esd {
+=09=09mux {
+=09=09=09pins =3D "gpio30";
+=09=09=09function =3D "gpio";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-pull-down;
+=09=09=09input-enable;
+=09=09};
+=09};
+};
+
+&wifi {
+=09status =3D "okay";
+=09vdd-0.8-cx-mx-supply =3D <&vreg_l5a_0p8>;
+=09vdd-1.8-xo-supply =3D <&vreg_l7a_1p8>;
+=09vdd-1.3-rfa-supply =3D <&vreg_l17a_1p3>;
+=09vdd-3.3-ch0-supply =3D <&vreg_l25a_3p3>;
+
+=09qcom,snoc-host-cap-8bit-quirk;
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/a=
rm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
new file mode 100644
index 000000000000..72842c887617
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SDM845 OnePlus 6 (enchilada) device tree.
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include "sdm845-oneplus-common.dtsi"
+
+/ {
+=09model =3D "OnePlus 6";
+=09compatible =3D "oneplus,enchilada", "qcom,sdm845";
+};
+
+&display_panel {
+=09status =3D "okay";
+
+=09compatible =3D "samsung,sofef00";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm6=
4/boot/dts/qcom/sdm845-oneplus-fajita.dts
new file mode 100644
index 000000000000..969b36dc9e2c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SDM845 OnePlus 6T (fajita) device tree.
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include "sdm845-oneplus-common.dtsi"
+
+/ {
+=09model =3D "OnePlus 6T";
+=09compatible =3D "oneplus,fajita", "qcom,sdm845";
+};
+
+&display_panel {
+=09status =3D "okay";
+
+=09compatible =3D "samsung,s6e3fc2x01";
+};
+
+&rmi4_f12 {
+=09touchscreen-y-mm =3D <148>;
+};
--=20
2.29.2


