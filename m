Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746FE3FE324
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 21:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhIATgr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 15:36:47 -0400
Received: from mail-4319.protonmail.ch ([185.70.43.19]:17311 "EHLO
        mail-4319.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbhIATgq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 15:36:46 -0400
Date:   Wed, 01 Sep 2021 19:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630524946;
        bh=je+z5AZAvkj3sTUrgO8gXn1l3mlUmRGdg8rSAYnYRbY=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=GqJVwhtSjUNTAQ3aF+jd0jeopc88pFiE5DgTDmBGdvPYFFWn+zifBULIy7TpGPXLv
         33fZjhHhDgZcDXbWB4XsvXGcTiCSBRyWi+9jZivjF4GqRWc98I/M7DT8afPRbwmf/B
         /nI11CeFSGK2tPd54/tT7LwSqYbepOkMoCcZcvzE=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Yassine Oudjana <y.oudjana@protonmail.com>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 4/4] arm64: dts: qcom: msm8996: xiaomi-gemini: Add support for Xiaomi Mi 5
Message-ID: <20210901193214.250375-5-y.oudjana@protonmail.com>
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

From: Raffaele Tranquillini <raffaele.tranquillini@gmail.com>

Add a device tree for Xiaomi Mi 5 (gemini).

Signed-off-by: Raffaele Tranquillini <raffaele.tranquillini@gmail.com>
Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8996-xiaomi-gemini.dts   | 431 ++++++++++++++++++
 2 files changed, 432 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/M=
akefile
index 7e33d492bf26..2c252844356c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -33,6 +33,7 @@ dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8996-pmi8996-sony-xperi=
a-tone-keyaki.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8996-sony-xperia-tone-dora.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8996-sony-xperia-tone-kagura.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8996-sony-xperia-tone-keyaki.dtb
+dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8996-xiaomi-gemini.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8996-xiaomi-scorpio.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-asus-novago-tp370ql.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-hp-envy-x2.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm6=
4/boot/dts/qcom/msm8996-xiaomi-gemini.dts
new file mode 100644
index 000000000000..fe950be0a722
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -0,0 +1,431 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Raffaele Tranquillini <raffaele.tranquillini@gmail.=
com>
+ */
+
+/dts-v1/;
+
+#include "msm8996-xiaomi-common.dtsi"
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/input/ti-drv260x.h>
+
+/ {
+=09model =3D "Xiaomi Mi 5";
+=09compatible =3D "xiaomi,gemini", "qcom,msm8996";
+=09qcom,msm-id =3D <246 0x30001>;
+=09qcom,pmic-id =3D <0x20009 0x2000a 0x00 0x00>;
+=09qcom,board-id =3D <31 0>;
+
+=09clocks {
+=09=09divclk2_haptics: divclk2 {
+=09=09=09compatible =3D "fixed-clock";
+=09=09=09#clock-cells =3D <0>;
+=09=09=09clock-frequency =3D <32768>;
+=09=09=09clock-output-names =3D "divclk2";
+
+=09=09=09pinctrl-names =3D "default";
+=09=09=09pinctrl-0 =3D <&divclk2_pin_a>;
+=09=09};
+=09};
+};
+
+&adsp_pil {
+=09firmware-name =3D "qcom/msm8996/gemini/adsp.mbn";
+};
+
+&blsp2_i2c3 {
+=09haptics: drv2604@5a {
+=09=09compatible =3D "ti,drv2604";
+=09=09reg =3D <0x5a>;
+=09=09enable-gpio =3D <&tlmm 93 0x00>;
+=09=09mode =3D <DRV260X_LRA_MODE>;
+=09=09library-sel =3D <DRV260X_LIB_LRA>;
+=09=09pinctrl-names =3D "default","sleep";
+=09=09pinctrl-0 =3D <&vibrator_default>;
+=09=09pinctrl-1 =3D <&vibrator_sleep>;
+=09};
+
+=09lp5562@30 {
+=09=09compatible =3D "ti,lp5562";
+=09=09reg =3D <0x30>;
+=09=09#address-cells =3D <1>;
+=09=09#size-cells =3D <0>;
+=09=09enable-gpio =3D <&pm8994_gpios 7 1>;
+=09=09clock-mode =3D /bits/8 <2>;
+=09=09label =3D "button-backlight";
+
+=09=09led@0 {
+=09=09=09reg =3D <0>;
+=09=09=09chan-name =3D "button-backlight";
+=09=09=09led-cur =3D /bits/ 8 <0x32>;
+=09=09=09max-cur =3D /bits/ 8 <0xC8>;
+=09=09};
+
+=09=09led@1 {
+=09=09=09reg =3D <0>;
+=09=09=09chan-name =3D "button-backlight1";
+=09=09=09led-cur =3D /bits/ 8 <0x32>;
+=09=09=09max-cur =3D /bits/ 8 <0xC8>;
+=09=09};
+=09};
+};
+
+&blsp2_i2c6 {
+=09synaptics@20 {
+=09=09compatible =3D "syna,rmi4-i2c";
+=09=09reg =3D <0x20>;
+=09=09#address-cells =3D <1>;
+=09=09#size-cells =3D <0>;
+=09=09interrupt-parent =3D <&tlmm>;
+=09=09interrupts =3D <125 IRQ_TYPE_LEVEL_LOW>;
+=09=09vdda-supply =3D <&vreg_l6a_1p8>;
+=09=09vdd-supply =3D <&vdd_3v2_tp>;
+=09=09reset-gpios =3D <&tlmm 89 GPIO_ACTIVE_LOW>;
+
+=09=09pinctrl-names =3D "default", "sleep";
+=09=09pinctrl-0 =3D <&touchscreen_default>;
+=09=09pinctrl-1 =3D <&touchscreen_sleep>;
+=09};
+
+};
+
+&gpu {
+=09zap-shader {
+=09=09firmware-name =3D "qcom/msm8996/gemini/a530_zap.mbn";
+=09};
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
+=09model =3D "gemini";
+=09audio-routing =3D=09"RX_BIAS", "MCLK",
+=09=09"MM_DL1",  "MultiMedia1 Playback",
+=09=09"MM_DL2",  "MultiMedia2 Playback",
+=09=09"MultiMedia3 Capture", "MM_UL3";
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
+=09firmware-name =3D "qcom/msm8996/gemini/venus.mbn";
+};
+
+&rpm_requests {
+=09pm8994-regulators {
+=09=09vreg_l17a_2p8: l17 {
+=09=09=09regulator-name =3D "vreg_l17a_2p8";
+=09=09=09regulator-min-microvolt =3D <2500000>;
+=09=09=09regulator-max-microvolt =3D <2500000>;
+=09=09};
+=09=09vreg_l29a_2p7: l29 {
+=09=09=09regulator-name =3D "vreg_l29a_2p7";
+=09=09=09regulator-min-microvolt =3D <2800000>;
+=09=09=09regulator-max-microvolt =3D <2800000>;
+=09=09};
+=09};
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
+=09=09"KEYPAD_LED_EN",=09/* GPIO_7  */
+=09=09"WL_EN",=09=09/* GPIO_8  */
+=09=09"3P3_ENABLE",=09=09/* GPIO_9  */
+=09=09"FP_ID",=09=09/* GPIO_10 */
+=09=09"NC", =09=09=09/* GPIO_11 */
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
+
+=09divclk2_pin_a: divclk2 {
+=09=09pins =3D "gpio16";
+=09=09function =3D PMIC_GPIO_FUNC_FUNC2;
+=09=09bias-disable;
+=09=09power-source =3D <PM8994_GPIO_S4>;
+=09};
+};
+
+&pm8994_mpps {
+=09gpio-line-names =3D
+=09=09"NC",=09=09=09/* MPP_1 */
+=09=09"CCI_TIMER1",=09=09/* MPP_2 */
+=09=09"PMIC_SLB",=09=09/* MPP_3 */
+=09=09"EXT_FET_WLED_PWR_EN_N",/* MPP_4 */
+=09=09"NC",=09=09=09/* MPP_5 */
+=09=09"NC",=09=09=09/* MPP_6 */
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
+=09=09"ERR_INT_N",=09=09/* GPIO_2   */
+=09=09"ESE_SPI_CLK",=09=09/* GPIO_3   */
+=09=09"MSM_UART_TX",=09=09/* GPIO_4   */
+=09=09"MSM_UART_RX",=09=09/* GPIO_5   */
+=09=09"NFC_I2C_SDA",=09=09/* GPIO_6   */
+=09=09"NFC_I2C_SCL",=09=09/* GPIO_7   */
+=09=09"LCD0_RESET_N",=09=09/* GPIO_8   */
+=09=09"NFC_IRQ",=09=09/* GPIO_9   */
+=09=09"LCD_TE",=09=09/* GPIO_10  */
+=09=09"LCD_ID_DET1", =09=09/* GPIO_11  */
+=09=09"NFC_DISABLE",=09=09/* GPIO_12  */
+=09=09"CAM_MCLK0",=09=09/* GPIO_13  */
+=09=09"NC",=09=09=09/* GPIO_14  */
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
+=09=09"NC",=09=09=09/* GPIO_29  */
+=09=09"CAM1_RST_N",=09=09/* GPIO_30  */
+=09=09"NC",=09=09=09/* GPIO_31  */
+=09=09"NC",=09=09=09/* GPIO_32  */
+=09=09"NC",=09=09=09/* GPIO_33  */
+=09=09"FP_DOME_SW",=09=09/* GPIO_34  */
+=09=09"PCI_E0_RST_N",=09=09/* GPIO_35  */
+=09=09"PCI_E0_CLKREQ_N",=09/* GPIO_36  */
+=09=09"PCI_E0_WAKE",=09=09/* GPIO_37  */
+=09=09"FM_INT_N",=09=09/* GPIO_38  */
+=09=09"FM_RESET_N",=09=09/* GPIO_39  */
+=09=09"NC",=09=09=09/* GPIO_40  */
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
+=09=09"HIFI_CLK",=09=09/* GPIO_69  */
+=09=09"SLIMBUS_CLK",=09=09/* GPIO_70  */
+=09=09"SLIMBUS_DATA0",=09/* GPIO_71  */
+=09=09"SLIMBUS_DATA1",=09/* GPIO_72  */
+=09=09"LDO_5V_IN_EN",=09=09/* GPIO_73  */
+=09=09"NC",=09=09=09/* GPIO_74  */
+=09=09"FM_I2S_CLK",=09=09/* GPIO_75  */
+=09=09"FM_I2S_SYNC",=09=09/* GPIO_76  */
+=09=09"FM_I2S_DATA",=09=09/* GPIO_77  */
+=09=09"FM_STATUS",=09=09/* GPIO_78  */
+=09=09"NC",=09=09=09/* GPIO_79  */
+=09=09"SENSOR_RESET_N",=09/* GPIO_80  */
+=09=09"FP_SPI_MOSI",=09=09/* GPIO_81  */
+=09=09"FP_SPI_MISO",=09=09/* GPIO_82  */
+=09=09"FP_SPI_CS_N",=09=09/* GPIO_83  */
+=09=09"FP_SPI_CLK",=09=09/* GPIO_84  */
+=09=09"NC",=09=09=09/* GPIO_85  */
+=09=09"CAM_VDD_1P05_EN",=09/* GPIO_86  */
+=09=09"MSM_TS_I2C_SDA",=09/* GPIO_87  */
+=09=09"MSM_TS_I2C_SCL",=09/* GPIO_88  */
+=09=09"TS_RESOUT_N",=09=09/* GPIO_89  */
+=09=09"ESE_SPI_CS_N",=09=09/* GPIO_90  */
+=09=09"NC",=09=09=09/* GPIO_91  */
+=09=09"NC",=09=09=09/* GPIO_92  */
+=09=09"HAPTICS_EN",=09=09/* GPIO_93  */
+=09=09"NC",=09=09=09/* GPIO_94  */
+=09=09"NC",=09=09=09/* GPIO_95  */
+=09=09"NC",=09=09=09/* GPIO_96  */
+=09=09"NC",=09=09=09/* GPIO_97  */
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
+=09=09"ACCEL_INT",=09=09/* GPIO_117 */
+=09=09"GYRO_INT",=09=09/* GPIO_118 */
+=09=09"COMPASS_INT",=09=09/* GPIO_119 */
+=09=09"PROXIMITY_INT_N",=09/* GPIO_120 */
+=09=09"FP_IRQ",=09=09/* GPIO_121 */
+=09=09"NC",=09=09=09/* GPIO_122 */
+=09=09"HALL_INTR2",=09=09/* GPIO_123 */
+=09=09"HALL_INTR1",=09=09/* GPIO_124 */
+=09=09"TS_INT_N",=09=09/* GPIO_125 */
+=09=09"NC",=09=09=09/* GPIO_126 */
+=09=09"GRFC_11",=09=09/* GPIO_127 */
+=09=09"NC",=09=09=09/* GPIO_128 */
+=09=09"EXT_GPS_LNA_EN",=09/* GPIO_129 */
+=09=09"NC",=09=09=09/* GPIO_130 */
+=09=09"NC",=09=09=09/* GPIO_131 */
+=09=09"NC",=09=09=09/* GPIO_132 */
+=09=09"GRFC_14",=09=09/* GPIO_133 */
+=09=09"GSM_TX2_PHASE_D",=09/* GPIO_134 */
+=09=09"NC",=09=09=09/* GPIO_135 */
+=09=09"NC",=09=09=09/* GPIO_136 */
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
+=09=09pins =3D "gpio89", "gpio125";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <10>;
+=09=09bias-pull-up;
+=09};
+
+=09touchscreen_sleep: touchscreen_sleep {
+=09=09pins =3D "gpio89", "gpio125";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
+=09vibrator_default: vibrator_default {
+=09=09pins =3D "gpio93";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <8>;
+=09=09bias-pull-up;
+=09};
+
+=09vibrator_sleep: vibrator_sleep {
+=09=09pins =3D "gpio93";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+};
--=20
2.33.0


