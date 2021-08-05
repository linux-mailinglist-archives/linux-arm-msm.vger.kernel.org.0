Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485663E1E9D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 00:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239260AbhHEW2f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 18:28:35 -0400
Received: from relay01.th.seeweb.it ([5.144.164.162]:57831 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231725AbhHEW2f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 18:28:35 -0400
Received: from localhost.localdomain (83.6.167.155.neoplus.adsl.tpnet.pl [83.6.167.155])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id C546D200D9;
        Fri,  6 Aug 2021 00:28:17 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] ARM: dts: Add MDM9607, PM8019 and Quectel EG25-G DTS files
Date:   Fri,  6 Aug 2021 00:28:10 +0200
Message-Id: <20210805222812.40731-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add base DTS files for MDM9607 SoC, PM8019 PMIC and Quectel
EG25-G USB LTE modem, used in devices like the Pine64 PinePhone.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/qcom-mdm9607-quectel-eg25-g.dts  | 186 ++++
 arch/arm/boot/dts/qcom-mdm9607.dtsi           | 889 ++++++++++++++++++
 arch/arm/boot/dts/qcom-pm8019.dtsi            | 100 ++
 4 files changed, 1176 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-mdm9607-quectel-eg25-g.dts
 create mode 100644 arch/arm/boot/dts/qcom-mdm9607.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-pm8019.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 863347b6b65e..f309490f74ec 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -933,6 +933,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-ipq4019-ap.dk07.1-c2.dtb \
 	qcom-ipq8064-ap148.dtb \
 	qcom-ipq8064-rb3011.dtb \
+	qcom-mdm9607-quectel-eg25-g.dtb \
 	qcom-msm8660-surf.dtb \
 	qcom-msm8960-cdp.dtb \
 	qcom-msm8974-fairphone-fp2.dtb \
diff --git a/arch/arm/boot/dts/qcom-mdm9607-quectel-eg25-g.dts b/arch/arm/boot/dts/qcom-mdm9607-quectel-eg25-g.dts
new file mode 100644
index 000000000000..2d574884e8aa
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-mdm9607-quectel-eg25-g.dts
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+#include "qcom-mdm9607.dtsi"
+#include "qcom-pm8019.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+/ {
+	model = "Quectel EG25-G Modem";
+	compatible = "quectel,eg25-g", "qcom,mdm9607";
+	qcom,msm-id = <290 0x10000>, <296 0x10000>, <297 0x10000>, <298 0x10000>, <299 0x10000>;
+	qcom,board-id = <8 0>;
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x0>;
+	};
+
+	usb_extcon: usb-extcon {
+		compatible = "linux,extcon-usb-gpio";
+		vbus-gpio = <&pm8019_mpps 2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbdet_mpp>;
+	};
+};
+
+&blsp1_i2c2 {
+	status = "okay";
+};
+
+&blsp1_i2c4 {
+	status = "okay";
+
+	/delete-property/ pinctrl-names;
+	/delete-property/ pinctrl-0;
+};
+
+&blsp1_uart2 {
+	status = "okay";
+};
+
+&blsp1_uart3 {
+	status = "okay";
+};
+
+/* Debug UART */
+&blsp1_uart5 {
+	status = "okay";
+};
+
+&nand {
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@27a0000 {
+			label = "recovery";
+			reg = <0x27a0000 0x7c0000>;
+		};
+
+		partition@2f60000 {
+			label = "modem";
+			reg = <0x2f60000 0x3580000>;
+		};
+
+		partition@6580000 {
+			label = "recoveryfs";
+			reg = <0x6580000 0x1440000>;
+		};
+
+		partition@79c0000 {
+			label = "usr_data";
+			reg = <0x79c0000 0x3d80000>;
+		};
+
+		partition@b7c0000 {
+			label = "system";
+			reg = <0xb7c0000 0x4840000>;
+		};
+	};
+};
+
+&pm8019_mpps {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb_mpp>;
+
+	usb_mpp: usb-mpp {
+		pins = "mpp1";
+		function = "digital";
+		bias-pull-up = <10000>;
+
+		power-source = <3>; /* 1.8V (L11) */
+	};
+
+	usbdet_mpp: usbdet-mpp {
+		pins = "mpp2";
+		function = "digital";
+		bias-disable;
+	};
+};
+
+/* NAND ID: 0x1590aaad | 256MiB | 4-bit ECC */
+&qpic_nand {
+	/*
+	 * This can only be enabled after interconnect lands, otherwise the SoC
+	 * absolutely loses its mind and randomly drops registers, leading to
+	 * null pointer exceptions!
+	 */
+	status = "disabled";
+};
+
+&qpic_bam {
+	status = "okay";
+};
+
+&tlmm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&undocumented_tlmm_gpios>;
+
+	undocumented_tlmm_gpios: undocumented-tlmm-gpios {
+		undocumented-gpio18 {
+			pins = "gpio18";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		undocumented-gpio19 {
+			pins = "gpio19";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		undocumented-gpio24 {
+			pins = "gpio24";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wakeup-in-n {
+			pins = "gpio25";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		undocumented-gpio55 {
+			pins = "gpio55";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+			output-low;
+		};
+
+		undocumented-gpio56 {
+			pins = "gpio56";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+			input-low;
+		};
+
+		undocumented-gpio57 {
+			pins = "gpio57";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+			output-low;
+		};
+	};
+};
+
+&usb {
+	status = "okay";
+	extcon = <&usb_extcon>, <&usb_extcon>;
+};
+
+&usb_hs_phy {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/qcom-mdm9607.dtsi b/arch/arm/boot/dts/qcom-mdm9607.dtsi
new file mode 100644
index 000000000000..f1b11af2be8f
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-mdm9607.dtsi
@@ -0,0 +1,889 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Konrad Dybcio
+ */
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-mdm9607.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/gpio/gpio.h>
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&intc>;
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+			clock-output-names = "xo_board";
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+
+		nand_clk_dummy: nand-clk-dummy {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32000>;
+		};
+	};
+
+	chosen { };
+
+	cpus {
+		#size-cells = <0>;
+		#address-cells = <1>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+		};
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm-mdm9607", "qcom,scm";
+			clocks = <&gcc GCC_CRYPTO_CLK>,
+				 <&gcc GCC_CRYPTO_AXI_CLK>,
+				 <&gcc GCC_CRYPTO_AHB_CLK>;
+			clock-names = "core", "bus", "iface";
+			#reset-cells = <1>;
+
+			qcom,dload-mode = <&tcsr 0x6100>;
+		};
+	};
+
+	pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <GIC_PPI 8 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	pps: pps {
+		compatible = "pps-gpio";
+		gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pps_gpio>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mpss_mem: memory@82a00000 {
+			reg = <0x82a00000 0x5000000>;
+			no-map;
+		};
+
+		cnss_debug_mem: memory@87a00000 {
+			reg = <0x87a00000 0x200000>;
+			no-map;
+		};
+
+		external_image_mem: memory@87c00000 {
+			reg = <0x87c00000 0x100000>;
+			no-map;
+		};
+
+		smem_region: smem@87d00000 {
+			reg = <0x87d00000 0x100000>;
+			no-map;
+		};
+
+		/*
+		 * This region is originally a part of external_image_mem
+		 * (which on downstream includes smem, how horrific!) and we
+		 * strictly have to protect it. Not doing so will cause an
+		 * imprecise external abort, probably induced by the firmware.
+		 */
+		firmware_region: memory@87e00000 {
+			reg = <0x87e00000 0x200000>;
+			no-map;
+		};
+
+		qseecom_mem: memory@8f800000 {
+			reg = <0x8f800000 0x100000>;
+			no-map;
+		};
+
+		mba_mem: memory@8f900000 {
+			reg = <0x8f900000 0x100000>;
+			no-map;
+		};
+
+		audio_mem: memory@8fc00000 {
+			reg = <0x8fc00000 0x400000>;
+			no-map;
+		};
+	};
+
+	smd {
+		compatible = "qcom,smd";
+
+		rpm {
+			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+			qcom,ipc = <&apcs 8 0>;
+			qcom,smd-edge = <15>;
+
+			rpm_requests: rpm-requests {
+				compatible = "qcom,rpm-msm8916";
+				qcom,smd-channels = "rpm_requests";
+
+				rpmcc: clock-controller {
+					compatible = "qcom,rpmcc-mdm9607", "qcom,rpmcc";
+					#clock-cells = <1>;
+				};
+
+				rpmpd: power-controller {
+					compatible = "qcom,mdm9607-rpmpd";
+					#power-domain-cells = <1>;
+					operating-points-v2 = <&rpmpd_opp_table>;
+
+					rpmpd_opp_table: opp-table {
+						compatible = "operating-points-v2";
+
+						rpmpd_opp_ret: opp1 {
+							opp-level = <RPM_SMD_LEVEL_RETENTION>;
+						};
+
+						rpmpd_opp_ret_plus: opp2 {
+							opp-level = <RPM_SMD_LEVEL_RETENTION_PLUS>;
+						};
+
+						rpmpd_opp_min_svs: opp3 {
+							opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
+						};
+
+						rpmpd_opp_low_svs: opp4 {
+							opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+						};
+
+						rpmpd_opp_svs: opp5 {
+							opp-level = <RPM_SMD_LEVEL_SVS>;
+						};
+
+						rpmpd_opp_svs_plus: opp6 {
+							opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
+						};
+
+						rpmpd_opp_nom: opp7 {
+							opp-level = <RPM_SMD_LEVEL_NOM>;
+						};
+
+						rpmpd_opp_nom_plus: opp8 {
+							opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+						};
+
+						rpmpd_opp_turbo: opp9 {
+							opp-level = <RPM_SMD_LEVEL_TURBO>;
+						};
+					};
+				};
+			};
+		};
+	};
+
+	smem {
+		compatible = "qcom,smem";
+
+		memory-region = <&smem_region>;
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
+
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
+	soc: soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		compatible = "simple-bus";
+
+		rng@22000 {
+			compatible = "qcom,prng";
+			reg = <0x00022000 0x140>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
+		rpm_msg_ram: memory@60000 {
+			compatible = "qcom,rpm-msg-ram";
+			reg = <0x00060000 0x8000>;
+		};
+
+		usb_hs_phy: phy@6c000 {
+			compatible = "qcom,usb-hs-28nm-mdm9607";
+			reg = <0x0006c000 0x200>;
+			#phy-cells = <0>;
+			clocks = <&xo_board>, <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+					<&gcc GCC_USB2A_PHY_SLEEP_CLK>;
+			clock-names = "ref", "ahb", "sleep";
+			resets = <&gcc QUSB2_PHY_BCR>, <&gcc USB2_HS_PHY_ONLY_BCR>;
+			reset-names = "phy", "por";
+			status = "disabled";
+		};
+
+		qfprom: qfprom@a4000 {
+			compatible = "qcom,qfprom";
+			reg = <0x000a4000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			tsens_caldata: calib@228 {
+				reg = <0x228 0xc>;
+			};
+		};
+
+		tsens: thermal-sensor@4a9000 {
+			compatible = "qcom,mdm9607-tsens", "qcom,tsens-v0_1";
+			reg = <0x004a9000 0x1000>, /* TM */
+			      <0x004a8000 0x1000>; /* SROT */
+			nvmem-cells = <&tsens_caldata>;
+			nvmem-cell-names = "calib";
+			#qcom,sensors = <5>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
+			#thermal-sensor-cells = <1>;
+		};
+
+		cryptobam: dma@704000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x00704000 0x20000>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_CRYPTO_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <1>;
+			qcom,controlled-remotely;
+			status = "disabled";
+		};
+
+		crypto: crypto@73a000 {
+			compatible = "qcom,crypto-v5.1";
+			reg = <0x0073a000 0x20000>;
+			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
+				 <&gcc GCC_CRYPTO_AXI_CLK>,
+				 <&gcc GCC_CRYPTO_CLK>;
+			clock-names = "iface", "bus", "core";
+			dmas = <&cryptobam 2>, <&cryptobam 3>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		restart@4ab000 {
+			compatible = "qcom,pshold";
+			reg = <0x004ab000 0x4>;
+		};
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,mdm9607-pinctrl";
+			reg = <0x01000000 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 80>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			blsp1_uart3_default: blsp1-uart3-default {
+				/* TX, RX, CTS_N, RTS_N */
+				pins = "gpio0", "gpio1", "gpio2", "gpio3";
+				function = "blsp_uart3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_uart3_sleep: blsp1-uart3-sleep {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			blsp1_uart2_default: blsp1-uart2-default {
+				/* TX, RX */
+				pins = "gpio4", "gpio5";
+				function = "blsp_uart2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_uart2_sleep: blsp1-uart2-sleep {
+				pins = "gpio4", "gpio5";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			blsp1_i2c2_default: blsp1-i2c2-default {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_i2c2_sleep: blsp1-i2c2-sleep {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			blsp1_uart5_default: blsp1-uart5-default {
+				/* TX, RX, CTS_N, RTS_N */
+				pins = "gpio8", "gpio9", "gpio10", "gpio11";
+				function = "blsp_uart5";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_uart5_sleep: blsp1-uart5-sleep {
+				pins = "gpio8", "gpio9", "gpio10", "gpio11";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			can_reset_default: can-reset-default {
+				pins = "gpio11";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			can_reset_sleep: can-reset-sleep {
+				pins = "gpio11";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-up;
+				output-high;
+			};
+
+			blsp1_i2c4_default: blsp1-i2c4-default {
+				pins = "gpio18", "gpio19";
+				function = "blsp_i2c4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_i2c4_sleep: blsp1-i2c4-sleep {
+				pins = "gpio18", "gpio19";
+				function = "blsp_i2c4";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			blsp1_spi6_default: blsp1-spi6-default {
+				spi {
+					pins = "gpio20", "gpio21", "gpio23";
+					function = "blsp_spi6";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cs {
+					pins = "gpio22";
+					function = "blsp_spi6";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			blsp1_spi6_sleep: blsp1-spi6-sleep {
+				spi {
+					pins = "gpio20", "gpio21", "gpio23";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cs {
+					pins = "gpio22";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			pmx_pri_mi2s_active: pri-mi2s-active {
+				ws {
+					pins = "gpio20";
+					function = "pri_mi2s_ws_a";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				din {
+					pins = "gpio21";
+					function = "pri_mi2s_data0_a";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				dout {
+					pins = "gpio22";
+					function = "pri_mi2s_data1_a";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				sck {
+					pins = "gpio23";
+					function = "pri_mi2s_sck_a";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			codec_reset_active: codec-reset-default {
+				pins = "gpio26";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			codec_reset_sleep: codec-reset-sleep {
+				pins = "gpio26";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			ntn_rst_default: ntn-rst-default {
+				pins = "gpio30";
+				drive-strength = <16>;
+				bias-pull-up;
+				output-high;
+			};
+
+			sleep_ind_active: sleep-ind-active {
+				pins = "gpio42";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+				output-low;
+			};
+
+			sleep_ind_sleep: sleep-ind-sleep {
+				pins = "gpio42";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+				output-high;
+			};
+
+			pps_gpio: pps-gpio-n {
+				pins = "gpio53";
+				function = "nav_tsync_out_a";
+				bias-pull-down;
+			};
+
+			sdc1_wlan_gpio_active: sdc1-wlan-gpio-active {
+				pins = "gpio54";
+				function = "gpio";
+				drive-strength = <8>;
+				bias-pull-up;
+				output-high;
+			};
+
+			sdc1_wlan_gpio_sleep: sdc1-wlan-gpio-sleep {
+				pins = "gpio54";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+				output-low;
+			};
+
+			pmx_sec_mi2s_active: sec-mi2s-active {
+				din {
+					pins = "gpio76";
+					function = "sec_mi2s";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				dout {
+					pins = "gpio77";
+					function = "sec_mi2s";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				sck {
+					pins = "gpio78";
+					function = "sec_mi2s";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws {
+					pins = "gpio79";
+					function = "sec_mi2s";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+		};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,gcc-mdm9607";
+			reg = <0x01800000 0x80000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			clock-names = "xo",
+				      "sleep_clk";
+			clocks = <&xo_board>, <&sleep_clk>;
+
+			assigned-clocks = <&gcc APSS_AHB_CLK_SRC>,
+							<&gcc PCNOC_BFDCD_CLK_SRC>;
+			assigned-clock-rates = <19200000>, <50000000>;
+		};
+
+		tcsr_mutex: syscon@1905000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x01905000 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-msm8916", "syscon";
+			reg = <0x01937000 0x30000>;
+		};
+
+		spmi_bus: spmi@200f000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0200f000 0x001000>,
+			      <0x02400000 0x800000>,
+			      <0x02c00000 0x800000>,
+			      <0x03800000 0x200000>,
+			      <0x0200a000 0x002100>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
+		blsp1_dma: dma-controller@7884000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07884000 0x23000>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+		};
+
+		blsp1_uart2: serial@78b0000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078b0000 0x200>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_uart2_default>;
+			pinctrl-1 = <&blsp1_uart2_sleep>;
+			/* TODO: no explicit DMA? */
+			status = "disabled";
+		};
+
+		blsp1_uart3: serial@78b1000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078b1000 0x200>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_uart3_default>;
+			pinctrl-1 = <&blsp1_uart3_sleep>;
+			dmas = <&blsp1_dma 4>, <&blsp1_dma 5>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		blsp1_uart5: serial@78b3000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078b3000 0x200>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART5_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_uart5_default>;
+			pinctrl-1 = <&blsp1_uart5_sleep>;
+			dmas = <&blsp1_dma 8>, <&blsp1_dma 9>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		blsp1_i2c2: i2c@78b6000 {
+			compatible = "qcom,i2c-qup-v2.1.1";
+			reg = <0x078b6000 0x600>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_i2c2_default>;
+			pinctrl-1 = <&blsp1_i2c2_sleep>;
+			dmas = <&blsp1_dma 14>, <&blsp1_dma 15>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_i2c4: i2c@78b8000 {
+			compatible = "qcom,i2c-qup-v2.1.1";
+			reg = <0x078b8000 0x600>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_i2c4_default>;
+			pinctrl-1 = <&blsp1_i2c4_sleep>;
+			dmas = <&blsp1_dma 18>, <&blsp1_dma 19>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_spi6: spi@78ba000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078ba000 0x600>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP6_SPI_APPS_CLK>,
+					 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_spi6_default>;
+			pinctrl-1 = <&blsp1_spi6_sleep>;
+			dmas = <&blsp1_dma 22>, <&blsp1_dma 23>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		usb: usb@78d9000 {
+			compatible = "qcom,ci-hdrc";
+			reg = <0x078d9000 0x200>,
+			      <0x078d9200 0x200>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_USB_HS_AHB_CLK>,
+				 <&gcc GCC_USB_HS_SYSTEM_CLK>;
+			clock-names = "iface", "core";
+			assigned-clocks = <&gcc GCC_USB_HS_SYSTEM_CLK>;
+			assigned-clock-rates = <69500000>;
+			resets = <&gcc USB_HS_BCR>;
+			reset-names = "core";
+			phy_type = "ulpi";
+			/* We don't want the modem to be the boss. */
+			dr_mode = "peripheral";
+			hnp-disable;
+			srp-disable;
+			adp-disable;
+			ahb-burst-config = <0>;
+			phy-names = "usb-phy";
+			phys = <&usb_hs_phy>;
+			status = "disabled";
+			#reset-cells = <1>;
+		};
+
+		qpic_bam: dma-controller@7984000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07984000 0x1a000>;
+			interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rpmcc RPM_SMD_QPIC_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		qpic_nand: nand@79b0000 {
+			compatible = "qcom,ipq4019-nand";
+			reg = <0x079b0000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&rpmcc RPM_SMD_QPIC_CLK>, <&nand_clk_dummy>;
+			clock-names = "core", "aon";
+
+			dmas = <&qpic_bam 0>,
+			       <&qpic_bam 1>,
+			       <&qpic_bam 2>;
+			dma-names = "tx", "rx", "cmd";
+			status = "disabled";
+
+			nand: nand@0 {
+				reg = <0>;
+
+				nand-ecc-strength = <4>;
+				nand-ecc-step-size = <512>;
+				nand-bus-width = <8>;
+			};
+		};
+
+		imem: imem@8600000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0x08600000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reboot-mode@65c {
+				compatible = "syscon-reboot-mode";
+				offset = <0x65c>;
+			};
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
+		intc: interrupt-controller@b000000 {
+			compatible = "qcom,msm-qgic2";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x0b000000 0x1000>,
+			      <0x0b002000 0x1000>;
+		};
+
+		/*
+		 * Yeah.. about that.. MDM9607 seems to
+		 * have 2 separate mailboxes: this one for
+		 * the usual IPC things and the one above
+		 * just for ARM frequency voting.
+		 */
+		apcs: syscon@b011000 {
+			compatible = "syscon";
+			reg = <0x0b011000 0x1000>;
+		};
+
+		timer@b020000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0b020000 0x1000>;
+			clock-frequency = <19200000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			frame@b021000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b021000 0x1000>,
+					<0x0b022000 0x1000>;
+			};
+			frame@b023000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b023000 0x1000>;
+				status = "disabled";
+			};
+			frame@b024000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b024000 0x1000>;
+				status = "disabled";
+			};
+			frame@b025000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b025000 0x1000>;
+				status = "disabled";
+			};
+			frame@b026000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b026000 0x1000>;
+				status = "disabled";
+			};
+			frame@b027000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b027000 0x1000>;
+				status = "disabled";
+			};
+			frame@b028000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b028000 0x1000>;
+				status = "disabled";
+			};
+			frame@b029000 {
+				frame-number = <7>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b029000 0x1000>;
+				status = "disabled";
+			};
+		};
+	};
+
+	smp2p-modem {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
+
+		qcom,ipc = <&apcs 8 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smsm {
+		compatible = "qcom,smsm";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		qcom,ipc-1 = <&apcs 8 13>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smsm: modem@1 {
+			reg = <1>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/qcom-pm8019.dtsi b/arch/arm/boot/dts/qcom-pm8019.dtsi
new file mode 100644
index 000000000000..0827d06a1f75
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-pm8019.dtsi
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Konrad Dybcio
+ */
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+
+	pm8019_0: pmic@0 {
+		compatible = "qcom,pm8019", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8019_vadc: adc@3100 {
+			compatible = "qcom,spmi-vadc";
+			reg = <0x3100>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			adc-chan@0 {
+				reg = <VADC_USBIN>;
+				qcom,pre-scaling = <1 10>;
+			};
+			adc-chan@7 {
+				reg = <VADC_VSYS>;
+				qcom,pre-scaling = <1 3>;
+			};
+			adc-chan@8 {
+				reg = <VADC_DIE_TEMP>;
+			};
+			adc-chan@9 {
+				reg = <VADC_REF_625MV>;
+			};
+			adc-chan@a {
+				reg = <VADC_REF_1250MV>;
+			};
+			adc-chan@e {
+				reg = <VADC_GND_REF>;
+			};
+			adc-chan@f {
+				reg = <VADC_VDD_VADC>;
+			};
+		};
+
+		rtc@6000 {
+			compatible = "qcom,pm8941-rtc";
+			reg = <0x6000>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pm8019_mpps: mpps@a000 {
+			compatible = "qcom,pm8019-mpp";
+			reg = <0xa000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
+				     <0 0xa1 0 IRQ_TYPE_NONE>,
+				     <0 0xa2 0 IRQ_TYPE_NONE>,
+				     <0 0xa3 0 IRQ_TYPE_NONE>,
+					 <0 0xa4 0 IRQ_TYPE_NONE>,
+					 <0 0xa5 0 IRQ_TYPE_NONE>;
+		};
+
+		pm8019_gpios: gpios@c000 {
+			compatible = "qcom,pm8019-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
+				     <0 0xc1 0 IRQ_TYPE_NONE>,
+				     <0 0xc2 0 IRQ_TYPE_NONE>,
+				     <0 0xc3 0 IRQ_TYPE_NONE>,
+					 <0 0xc4 0 IRQ_TYPE_NONE>,
+					 <0 0xc5 0 IRQ_TYPE_NONE>;
+		};
+	};
+
+	pm8019_1: pmic@1 {
+		compatible = "qcom,pm8019", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8019_vib: vibrator@c000 {
+			compatible = "qcom,pm8916-vib";
+			reg = <0xc000>;
+			status = "disabled";
+		};
+
+		pm8019_spmi_regulators: regulators {
+			compatible = "qcom,pm8019-regulators";
+		};
+	};
+};
-- 
2.32.0

