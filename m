Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6686453AAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 21:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbhKPUMM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 15:12:12 -0500
Received: from mout.gmx.net ([212.227.15.18]:54461 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240441AbhKPULu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 15:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637093321;
        bh=uAG+D63V5JJv6JbVHM8XoWktFfvPnzrPAkc82zLEVXE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=A3hzkWi3V452yXfB3cp6bFufKqkhvcPoFPNQFAyF2uZJ+5ngKD6hcfPqwzmSzcOt1
         6yGTEh+ZR4TdOwWP5ek9Gc8hqraN+7id7yW/yfBb/vKGxo9qS1SHzQBGn3+UU/VKrD
         3sePH86VeTGN/oRpih8KOrPYkreb4uJtCA9oAsvw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from x1-yoga-arch.speedport.ip ([93.243.64.255]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MIx3I-1n7TxC3OX4-00KMrm; Tue, 16 Nov 2021 21:08:40 +0100
From:   Julian Ribbeck <julian.ribbeck@gmx.de>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Julian Ribbeck <julian.ribbeck@gmx.de>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] arm64: dts: qcom: Add device tree for Samsung J5 2015 (samsung-j5)
Date:   Tue, 16 Nov 2021 21:07:34 +0100
Message-Id: <20211116200734.73920-1-julian.ribbeck@gmx.de>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WIqNp2HfBaNd1fGUfl4FLZcEnr/7sjvWQwZBDVEkZduYN+V0RQN
 i0RNN8Cnm05nNvmhHRu7ULJnJWv8X7lXO89Yi7+gjl857CHA09dEydBwsuXEIQ/IOG3T3aG
 oiLbsWKxff7VxUMU+EmS9QR6ypVDF2duwjoF4KSw00MBpUD8Ic0GgdwLiQ2KIQRLvsv+8+z
 kaouarwCE5hB+RSk5d4sA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p5Z7bTd5bq4=:pmXRCTX/pN1c3uqj4s1Tax
 uOWeUX0Hyk1sYUmM1pLerH0trnSGfrMI8vRXQbnm1a+Wi77y7MV3YMl/UrE4kYI/IIyJ1/+w0
 Teh0vZCpaeDN62g3Ng21l0PDYx3vQxXGFPZtbrjuDrrWl8WEBsQB53TPw3oaWxfv8ogzWBM30
 AFVj4T6726ggN6HBaEgm+Jt8zXEYpGPzjnj2z5TXXKWm/07bZN2UtKLyWaM6Xx1wYNKMX+XlE
 rVOAY0811y/VQdMCs8DyEq0xpoUNREq8T6rRdGElOMh+7L9SISht1MAyCDEDhiDipjncLzs0S
 bfF6r8biuSotTTTtmjyhFYTe52F4KnqGLmti3xtUrcuXe8dISYCc/Zc5ui1y3686gc7kb/BZz
 yich0CaWDI5NeTc6AwkcnbbGjRgCCmsajdJqJ7Lhf3AzcrnOThEOu/l0ZfkrtuVvDVkY7qnLj
 vDwPchPSU7C+rCePdWCGg3nQhw/WLtDcsSVSfwvEI8+/rua9APdVqjjkvv5rgtiyIYKbrJa4h
 A14Das3UEnfndbj1SOZB+S4MUsAkpESlY7/6+OdY7yZFP/a0vbhvPoQlxuBP6Shac43KGF4ui
 FFbMIFWT8gQpbAsoBnsLE3Yhth+hYmDm+0HnLNQeAPZLwFyvXB0BTHynm5yiBCGP3tbmGsMz0
 Ru3rtmjixXt1kHy89ron3BO01Vi8drUnxWfx8sF1xLH5JbzvddOmv0Xf3wkMADzOBogXd4k8o
 bPMmsQHh/96JXQF17i2GO3Q4Mri6XeAxrUUyyhlEj9S6Mz7dKw9ZwxpaDHd2IT048Da9VZIFS
 pe9x5D/4tsRY2Ka8iJMEMh9aU4ooIZP2dTYDJe1Sc/FcK3Qqyhsy4q7L8sWzq3f5Nn4CQsd4g
 7NC+vcrBOCud+EwXSLMlq6FxyT3zsF218j9FKIdO3FEN2Ei1bfjXgohEVWjjbZQF8Ug8UWeVB
 GrpIG1emnOLQeRY3uMJ9TwfjSjoBFXqUwLLoa/MRmXXfGNmYWn4OyIMJUYJt9Zmu2ebSYGGsg
 UA6ubBgAoqyQXuv5vOuPElv1zgXAdwIz6zn5sorYXhQdc9SiQW6bkst0xl8U5+mmC7CRT3nU1
 4DoFvsKhBrIAw4=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Samsung J5 2015 is a MSM8916 based Smartphone. It is similar to some of th=
e
other MSM8916 devices, especially the Samsung ones.

With this patch initial support for the following is added:
  - eMMC/SD card
  - Buttons
  - USB (although no suiting MUIC driver currently)
  - UART (untested for lack of equipment)
  - WiFi/Bluetooth (WCNSS)

It is worth noting that Samsung J5 with MSM8916 exists in different
generations (e.g Samsung J5 2015 and Samsung J5 2016) which each have
different models (e.g. samsung-j5nlte, samsung-j5xnlte, etc). This patch
is only regarding the 2015 generation, but should work with all of it's
models, as far as we could test.

Co-developed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Julian Ribbeck <julian.ribbeck@gmx.de>
=2D--
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8916-samsung-j5.dts      | 209 ++++++++++++++++++
 2 files changed, 210 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/=
Makefile
index 6b816eb33309..08bfccb0daeb 100644
=2D-- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-longcheer-l8910.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-samsung-a5u-eur.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-samsung-j5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-samsung-serranove.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8992-bullhead-rev-101.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts b/arch/arm64/=
boot/dts/qcom/msm8916-samsung-j5.dts
new file mode 100644
index 000000000000..687bea438a57
=2D-- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-pm8916.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model =3D "Samsung Galaxy J5 (2015)";
+	compatible =3D "samsung,j5", "qcom,msm8916";
+	chassis-type =3D "handset";
+
+	aliases {
+		serial0 =3D &blsp1_uart2;
+	};
+
+	chosen {
+		stdout-path =3D "serial0";
+	};
+
+	reserved-memory {
+		/* Additional memory used by Samsung firmware modifications */
+		tz-apps@85500000 {
+			reg =3D <0x0 0x85500000 0x0 0xb00000>;
+			no-map;
+		};
+	};
+
+	gpio-keys {
+		compatible =3D "gpio-keys";
+
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&gpio_keys_default>;
+
+		label =3D "GPIO Buttons";
+
+		volume-up {
+			label =3D "Volume Up";
+			gpios =3D <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			linux,code =3D <KEY_VOLUMEUP>;
+		};
+
+		home-key {
+			lable =3D "Home Key";
+			gpios =3D <&msmgpio 109 GPIO_ACTIVE_LOW>;
+			linux,code =3D <KEY_HOMEPAGE>;
+		};
+	};
+};
+
+&blsp1_uart2 {
+	status =3D "okay";
+};
+
+&pm8916_resin {
+	status =3D "okay";
+	linux,code =3D <KEY_VOLUMEDOWN>;
+};
+
+/* FIXME: Replace with SM5703 MUIC when driver is available */
+&pm8916_usbin {
+	status =3D "okay";
+};
+
+&pronto {
+	status =3D "okay";
+};
+
+&sdhc_1 {
+	status =3D "okay";
+
+	pinctrl-names =3D "default", "sleep";
+	pinctrl-0 =3D <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
+	pinctrl-1 =3D <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
+};
+
+&sdhc_2 {
+	status =3D "okay";
+
+	pinctrl-names =3D "default", "sleep";
+	pinctrl-0 =3D <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+	pinctrl-1 =3D <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+
+	cd-gpios =3D <&msmgpio 38 GPIO_ACTIVE_LOW>;
+};
+
+&usb {
+	status =3D "okay";
+	dr_mode =3D "peripheral";
+	extcon =3D <&pm8916_usbin>;
+};
+
+&usb_hs_phy {
+	extcon =3D <&pm8916_usbin>;
+	qcom,init-seq =3D /bits/ 8 <0x1 0x19 0x2 0x0b>;
+};
+
+&smd_rpm_regulators {
+	vdd_l1_l2_l3-supply =3D <&pm8916_s3>;
+	vdd_l4_l5_l6-supply =3D <&pm8916_s4>;
+	vdd_l7-supply =3D <&pm8916_s4>;
+
+	s3 {
+		regulator-min-microvolt =3D <1200000>;
+		regulator-max-microvolt =3D <1300000>;
+	};
+
+	s4 {
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <2100000>;
+	};
+
+	l1 {
+		regulator-min-microvolt =3D <1225000>;
+		regulator-max-microvolt =3D <1225000>;
+	};
+
+	l2 {
+		regulator-min-microvolt =3D <1200000>;
+		regulator-max-microvolt =3D <1200000>;
+	};
+
+	l4 {
+		regulator-min-microvolt =3D <2050000>;
+		regulator-max-microvolt =3D <2050000>;
+	};
+
+	l5 {
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <1800000>;
+	};
+
+	l6 {
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <1800000>;
+	};
+
+	l7 {
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <1800000>;
+	};
+
+	l8 {
+		regulator-min-microvolt =3D <2850000>;
+		regulator-max-microvolt =3D <2900000>;
+	};
+
+	l9 {
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+	};
+
+	l10 {
+		regulator-min-microvolt =3D <2700000>;
+		regulator-max-microvolt =3D <2800000>;
+	};
+
+	l11 {
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <2950000>;
+		regulator-allow-set-load;
+		regulator-system-load =3D <200000>;
+	};
+
+	l12 {
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <2950000>;
+	};
+
+	l13 {
+		regulator-min-microvolt =3D <3075000>;
+		regulator-max-microvolt =3D <3075000>;
+	};
+
+	l14 {
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <3300000>;
+	};
+
+	l15 {
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <3300000>;
+	};
+
+	l16 {
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <3300000>;
+	};
+
+	l17 {
+		regulator-min-microvolt =3D <3000000>;
+		regulator-max-microvolt =3D <3000000>;
+	};
+
+	l18 {
+		regulator-min-microvolt =3D <2700000>;
+		regulator-max-microvolt =3D <2700000>;
+	};
+};
+
+&msmgpio {
+	gpio_keys_default: gpio-keys-default {
+		pins =3D "gpio107", "gpio109";
+		function =3D "gpio";
+
+		drive-strength =3D <2>;
+		bias-pull-up;
+	};
+};
=2D-
2.33.1

