Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D916248CC5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jan 2022 20:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356992AbiALTuu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jan 2022 14:50:50 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:33172 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346255AbiALTuo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jan 2022 14:50:44 -0500
Received: from localhost.localdomain (ip-213-127-106-2.ip.prioritytelecom.net [213.127.106.2])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id A2D42CDFE7;
        Wed, 12 Jan 2022 19:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1642016554; bh=RltE20ID/6pkCtnooumc5WJU+rrBKAHaL7NWuWL2tlA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=wPN0WN6vbGD125CkX/3wRThh8w9Eaa5bTFX20Tq4No/lDcWiwn2JxFKJVi96/8VBJ
         vN6PJsXLGcGBX/AFvp0kBZZ4/3r5Ozzo6ggNu6xODpqbeV37CtrQYS6AfeW0UISf4x
         rR/AY/9/61+Mu5aqGXM0nFm7eJYpf7nmqy80Q3h8=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/15] arm64: dts: qcom: Add MSM8953 device tree
Date:   Wed, 12 Jan 2022 20:40:59 +0100
Message-Id: <20220112194118.178026-11-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112194118.178026-1-luca@z3ntu.xyz>
References: <20220112194118.178026-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add a base DT for MSM8953 SoC.

Co-developed-by: Luca Weiss <luca@z3ntu.xyz>
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 1337 +++++++++++++++++++++++++
 1 file changed, 1337 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
new file mode 100644
index 000000000000..59918b527750
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -0,0 +1,1337 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/* Copyright (c) 2022, The Linux Foundation. All rights reserved. */
+
+#include <dt-bindings/clock/qcom,gcc-msm8953.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		i2c1 = &i2c_1;
+		i2c2 = &i2c_2;
+		i2c3 = &i2c_3;
+		i2c4 = &i2c_4;
+		i2c5 = &i2c_5;
+		i2c6 = &i2c_6;
+		i2c7 = &i2c_7;
+		i2c8 = &i2c_8;
+	};
+
+	chosen { };
+
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+			clock-output-names = "xo";
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+
+			l1-icache {
+				compatible = "cache";
+			};
+			l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+
+			l1-icache {
+				compatible = "cache";
+			};
+			l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+
+			l1-icache {
+				compatible = "cache";
+			};
+			l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+
+			l1-icache {
+				compatible = "cache";
+			};
+			l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_1>;
+			#cooling-cells = <2>;
+
+			l1-icache {
+				compatible = "cache";
+			};
+			l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_1>;
+			#cooling-cells = <2>;
+
+			l1-icache {
+				compatible = "cache";
+			};
+			l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU6: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_1>;
+			#cooling-cells = <2>;
+
+			l1-icache {
+				compatible = "cache";
+			};
+			l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU7: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_1>;
+			#cooling-cells = <2>;
+
+			l1-icache {
+				compatible = "cache";
+			};
+			l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+				core1 {
+					cpu = <&CPU1>;
+				};
+				core2 {
+					cpu = <&CPU2>;
+				};
+				core3 {
+					cpu = <&CPU3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&CPU4>;
+				};
+				core1 {
+					cpu = <&CPU5>;
+				};
+				core2 {
+					cpu = <&CPU6>;
+				};
+				core3 {
+					cpu = <&CPU7>;
+				};
+			};
+		};
+
+		L2_0: l2-cache_0 {
+			compatible = "cache";
+			cache-level = <2>;
+		};
+
+		L2_1: l2-cache_1 {
+			compatible = "cache";
+			cache-level = <2>;
+		};
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm-msm8953";
+			clocks = <&gcc GCC_CRYPTO_CLK>,
+				 <&gcc GCC_CRYPTO_AXI_CLK>,
+				 <&gcc GCC_CRYPTO_AHB_CLK>;
+			clock-names = "core", "bus", "iface";
+			#reset-cells = <1>;
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0 0 0>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		zap_shader_region: memory@81800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x81800000 0x0 0x2000>;
+			no-map;
+		};
+
+		memory@85b00000 {
+			reg = <0x0 0x85b00000 0x0 0x800000>;
+			no-map;
+		};
+
+		smem_mem: memory@86300000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x86300000 0x0 0x100000>;
+			qcom,rpm-msg-ram = <&rpm_msg_ram>;
+			hwlocks = <&tcsr_mutex 3>;
+			no-map;
+		};
+
+		memory@86400000 {
+			reg = <0x0 0x86400000 0x0 0x400000>;
+			no-map;
+		};
+
+		mpss_mem: memory@86c00000 {
+			reg = <0x0 0x86c00000 0x0 0x6a00000>;
+			no-map;
+		};
+
+		adsp_fw_mem: memory@8d600000 {
+			reg = <0x0 0x8d600000 0x0 0x1100000>;
+			no-map;
+		};
+
+		wcnss_fw_mem: memory@8e700000 {
+			reg = <0x0 0x8e700000 0x0 0x700000>;
+			no-map;
+		};
+
+		memory@90000000 {
+			reg = <0 0x90000000 0 0x1000>;
+			no-map;
+		};
+
+		memory@90001000 {
+			reg = <0x0 0x90001000 0x0 0x13ff000>;
+			no-map;
+		};
+
+		venus_mem: memory@90400000 {
+			reg = <0x0 0x91400000 0x0 0x700000>;
+			no-map;
+		};
+
+		mba_mem: memory@92000000 {
+			reg = <0x0 0x92000000 0x0 0x100000>;
+			no-map;
+		};
+
+		memory@f2d00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0xf2d00000 0x0 0x180000>;
+			no-map;
+
+			qcom,client-id = <1>;
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
+			rpm_requests: rpm_requests {
+				compatible = "qcom,rpm-msm8953";
+				qcom,smd-channels = "rpm_requests";
+
+				rpmcc: rpmcc {
+					compatible = "qcom,rpmcc-msm8953";
+					clocks = <&xo_board>;
+					clock-names = "xo";
+					#clock-cells = <1>;
+				};
+
+				rpmpd: power-controller {
+					compatible = "qcom,msm8953-rpmpd";
+					#power-domain-cells = <1>;
+					operating-points-v2 = <&rpmpd_opp_table>;
+
+					clocks = <&xo_board>;
+					clock-names = "ref";
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
+	smsm {
+		compatible = "qcom,smsm";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		qcom,ipc-1 = <&apcs 8 13>;
+		qcom,ipc-3 = <&apcs 8 19>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+
+			#qcom,smem-state-cells = <1>;
+		};
+	};
+
+	soc: soc@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0xffffffff>;
+		compatible = "simple-bus";
+
+		rpm_msg_ram: sram@60000 {
+			compatible = "qcom,rpm-msg-ram";
+			reg = <0x60000 0x8000>;
+		};
+
+		hsusb_phy: phy@79000 {
+			compatible = "qcom,msm8953-qusb2-phy";
+			reg = <0x79000 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_QUSB_REF_CLK>;
+			clock-names = "cfg_ahb", "ref";
+
+			qcom,tcsr-syscon = <&tcsr_phy_clk_scheme_sel>;
+
+			resets = <&gcc GCC_QUSB2_PHY_BCR>;
+
+			status = "disabled";
+		};
+
+		rng@e3000 {
+			compatible = "qcom,prng";
+			reg = <0x000e3000 0x1000>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
+		tsens0: thermal-sensor@4a9000 {
+			compatible = "qcom,msm8953-tsens", "qcom,tsens-v2";
+			reg = <0x4a9000 0x1000>, /* TM */
+			      <0x4a8000 0x1000>; /* SROT */
+			#qcom,sensors = <16>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		restart@4ab000 {
+			compatible = "qcom,pshold";
+			reg = <0x4ab000 0x4>;
+		};
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,msm8953-pinctrl";
+			reg = <0x1000000 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 155>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			uart_console_active: uart-console-active-pins {
+				pins = "gpio4", "gpio5";
+				function = "blsp_uart2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			uart_console_sleep: uart-console-sleep-pins {
+				pins = "gpio4", "gpio5";
+				function = "blsp_uart2";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			sdc1_clk_on: sdc1-clk-on-pins {
+				pins = "sdc1_clk";
+				bias-disable;
+				drive-strength = <16>;
+			};
+
+			sdc1_clk_off: sdc1-clk-off-pins {
+				pins = "sdc1_clk";
+				bias-disable;
+				drive-strength = <2>;
+			};
+
+			sdc1_cmd_on: sdc1-cmd-on-pins {
+				pins = "sdc1_cmd";
+				bias-disable;
+				drive-strength = <10>;
+			};
+
+			sdc1_cmd_off: sdc1-cmd-off-pins {
+				pins = "sdc1_cmd";
+				bias-disable;
+				drive-strength = <2>;
+			};
+
+			sdc1_data_on: sdc1-data-on-pins {
+				pins = "sdc1_data";
+				bias-pull-up;
+				drive-strength = <10>;
+			};
+
+			sdc1_data_off: sdc1-data-off-pins {
+				pins = "sdc1_data";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+
+			sdc1_rclk_on: sdc1-rclk-on-pins {
+				pins = "sdc1_rclk";
+				bias-pull-down;
+			};
+
+			sdc1_rclk_off: sdc1-rclk-off-pins {
+				pins = "sdc1_rclk";
+				bias-pull-down;
+			};
+
+			sdc2_clk_on: sdc2-clk-on-pins {
+				pins = "sdc2_clk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			sdc2_clk_off: sdc2-clk-off-pins {
+				pins = "sdc2_clk";
+				bias-disable;
+				drive-strength = <2>;
+			};
+
+			sdc2_cmd_on: sdc2-cmd-on-pins {
+				pins = "sdc2_cmd";
+				bias-pull-up;
+				drive-strength = <10>;
+			};
+
+			sdc2_cmd_off: sdc2-cmd-off-pins {
+				pins = "sdc2_cmd";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+
+			sdc2_data_on: sdc2-data-on-pins {
+				pins = "sdc2_data";
+				bias-pull-up;
+				drive-strength = <10>;
+			};
+
+			sdc2_data_off: sdc2-data-off-pins {
+				pins = "sdc2_data";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+
+			sdc2_cd_on: cd-on-pins {
+				pins = "gpio133";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			sdc2_cd_off: cd-off-pins {
+				pins = "gpio133";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			gpio_key_default: gpio-key-default-pins {
+				pins = "gpio85";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			i2c_1_default: i2c-1-default-pins {
+				pins = "gpio2", "gpio3";
+				function = "blsp_i2c1";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_1_sleep: i2c-1-sleep-pins {
+				pins = "gpio2", "gpio3";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_2_default: i2c-2-default-pins {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_2_sleep: i2c-2-sleep-pins {
+				pins = "gpio6", "gpio7";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_3_default: i2c-3-default-pins {
+				pins = "gpio10", "gpio11";
+				function = "blsp_i2c3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_3_sleep: i2c-3-sleep-pins {
+				pins = "gpio10", "gpio11";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_4_default: i2c-4-default-pins {
+				pins = "gpio14", "gpio15";
+				function = "blsp_i2c4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_4_sleep: i2c-4-sleep-pins {
+				pins = "gpio14", "gpio15";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_5_default: i2c-5-default-pins {
+				pins = "gpio18", "gpio19";
+				function = "blsp_i2c5";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_5_sleep: i2c-5-sleep-pins {
+				pins = "gpio18", "gpio19";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_6_default: i2c-6-default-pins {
+				pins = "gpio22", "gpio23";
+				function = "blsp_i2c6";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_6_sleep: i2c-6-sleep-pins {
+				pins = "gpio22", "gpio23";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_7_default: i2c-7-default-pins {
+				pins = "gpio135", "gpio136";
+				function = "blsp_i2c7";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_7_sleep: i2c-7-sleep-pins {
+				pins = "gpio135", "gpio136";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_8_default: i2c-8-default-pins {
+				pins = "gpio98", "gpio99";
+				function = "blsp_i2c8";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_8_sleep: i2c-8-sleep-pins {
+				pins = "gpio98", "gpio99";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,gcc-msm8953";
+			reg = <0x1800000 0x80000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			clocks = <&xo_board>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "xo",
+				      "sleep",
+				      "dsi0pll",
+				      "dsi0pllbyte",
+				      "dsi1pll",
+				      "dsi1pllbyte";
+		};
+
+		tcsr_mutex: hwlock@1905000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x1905000 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-msm8953", "syscon";
+			reg = <0x1937000 0x30000>;
+		};
+
+		tcsr_phy_clk_scheme_sel: syscon@193f044 {
+			compatible = "syscon";
+			reg = <0x193f044 0x4>;
+		};
+
+		spmi_bus: spmi@200f000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x200f000 0x1000>,
+			      <0x2400000 0x800000>,
+			      <0x2c00000 0x800000>,
+			      <0x3800000 0x200000>,
+			      <0x200a000 0x2100>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			interrupt-controller;
+
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		usb3: usb@70f8800 {
+			compatible = "qcom,msm8953-dwc3", "qcom,dwc3";
+			reg = <0x70f8800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq", "ss_phy_irq";
+
+			clocks = <&gcc GCC_USB_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB30_MASTER_CLK>,
+				 <&gcc GCC_PCNOC_USB3_AXI_CLK>,
+				 <&gcc GCC_USB30_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB30_SLEEP_CLK>;
+			clock-names = "cfg_noc", "core", "iface",
+				      "mock_utmi", "sleep";
+
+			assigned-clocks = <&gcc GCC_USB30_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <133330000>;
+
+			power-domains = <&gcc USB30_GDSC>;
+
+			qcom,select-utmi-as-pipe-clk;
+
+			status = "disabled";
+
+			usb3_dwc3: usb@7000000 {
+				compatible = "snps,dwc3";
+				reg = <0x07000000 0xcc00>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&hsusb_phy>;
+				phy-names = "usb2-phy";
+
+				snps,usb2-gadget-lpm-disable;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
+				snps,is-utmi-l1-suspend;
+				snps,hird-threshold = /bits/ 8 <0x00>;
+
+				maximum-speed = "high-speed";
+				phy_mode = "utmi";
+			};
+		};
+
+		sdhc_1: sdhci@7824900 {
+			compatible = "qcom,msm8953-sdhci", "qcom,sdhci-msm-v4";
+
+			reg = <0x7824900 0x500>, <0x7824000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&xo_board>;
+			clock-names = "iface", "core", "xo";
+
+			power-domains = <&rpmpd MSM8953_VDDCX>;
+			operating-points-v2 = <&sdhc1_opp_table>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on &sdc1_rclk_on>;
+			pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off &sdc1_rclk_off>;
+
+			mmc-hs400-1_8v;
+			mmc-hs200-1_8v;
+			mmc-ddr-1_8v;
+			bus-width = <8>;
+			non-removable;
+
+			status = "disabled";
+
+			sdhc1_opp_table: opp-table-sdhc1 {
+				compatible = "operating-points-v2";
+
+				opp-25000000 {
+					opp-hz = /bits/ 64 <25000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-192000000 {
+					opp-hz = /bits/ 64 <192000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
+		sdhc_2: sdhci@7864900 {
+			compatible = "qcom,msm8953-sdhci", "qcom,sdhci-msm-v4";
+
+			reg = <0x7864900 0x500>, <0x7864000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&xo_board>;
+			clock-names = "iface", "core", "xo";
+
+			power-domains = <&rpmpd MSM8953_VDDCX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
+			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
+
+			bus-width = <4>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table-sdhc2 {
+				compatible = "operating-points-v2";
+
+				opp-25000000 {
+					opp-hz = /bits/ 64 <25000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-177770000 {
+					opp-hz = /bits/ 64 <177770000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
+		uart_0: serial@78af000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x78af000 0x200>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+
+			status = "disabled";
+		};
+
+		i2c_1: i2c@78b5000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x78b5000 0x600>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c_1_default>;
+			pinctrl-1 = <&i2c_1_sleep>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2c_2: i2c@78b6000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x78b6000 0x600>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c_2_default>;
+			pinctrl-1 = <&i2c_2_sleep>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2c_3: i2c@78b7000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x78b7000 0x600>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c_3_default>;
+			pinctrl-1 = <&i2c_3_sleep>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2c_4: i2c@78b8000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x78b8000 0x600>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c_4_default>;
+			pinctrl-1 = <&i2c_4_sleep>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2c_5: i2c@7af5000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x7af5000 0x600>;
+			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				 <&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c_5_default>;
+			pinctrl-1 = <&i2c_5_sleep>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2c_6: i2c@7af6000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x7af6000 0x600>;
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				 <&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c_6_default>;
+			pinctrl-1 = <&i2c_6_sleep>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2c_7: i2c@7af7000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x7af7000 0x600>;
+			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				 <&gcc GCC_BLSP2_QUP3_I2C_APPS_CLK>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c_7_default>;
+			pinctrl-1 = <&i2c_7_sleep>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2c_8: i2c@7af8000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x7af8000 0x600>;
+			interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				 <&gcc GCC_BLSP2_QUP4_I2C_APPS_CLK>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c_8_default>;
+			pinctrl-1 = <&i2c_8_sleep>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		intc: interrupt-controller@b000000 {
+			compatible = "qcom,msm-qgic2";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x0b000000 0x1000>, <0x0b002000 0x1000>;
+		};
+
+		apcs: mailbox@b011000 {
+			compatible = "qcom,msm8953-apcs-kpss-global", "syscon";
+			reg = <0xb011000 0x1000>;
+			#mbox-cells = <1>;
+		};
+
+		timer@b120000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0xb120000 0x1000>;
+			#address-cells = <0x01>;
+			#size-cells = <0x01>;
+			ranges;
+
+			frame@b121000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb121000 0x1000>,
+				      <0xb122000 0x1000>;
+			};
+
+			frame@b123000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb123000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b124000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb124000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b125000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb125000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b126000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb126000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b127000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb127000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b128000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb128000 0x1000>;
+				status = "disabled";
+			};
+		};
+	};
+
+	thermal-zones {
+		cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 9>;
+			trips {
+				cpu0_alert: trip-point0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu0_crit: crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_alert>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+		cpu1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 10>;
+			trips {
+				cpu1_alert: trip-point0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu1_crit: crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu1_alert>;
+					cooling-device = <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+		cpu2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 11>;
+			trips {
+				cpu2_alert: trip-point0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu2_crit: crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu2_alert>;
+					cooling-device = <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+		cpu3-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 12>;
+			trips {
+				cpu3_alert: trip-point0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu3_crit: crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu3_alert>;
+					cooling-device = <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+		cpu4-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 4>;
+			trips {
+				cpu4_alert: trip-point0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu4_crit: crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu4_alert>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+		cpu5-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 5>;
+			trips {
+				cpu5_alert: trip-point0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu5_crit: crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu5_alert>;
+					cooling-device = <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+		cpu6-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 6>;
+			trips {
+				cpu6_alert: trip-point0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu6_crit: crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu6_alert>;
+					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+		cpu7-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 7>;
+			trips {
+				cpu7_alert: trip-point0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu7_crit: crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu7_alert>;
+					cooling-device = <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
-- 
2.34.1

