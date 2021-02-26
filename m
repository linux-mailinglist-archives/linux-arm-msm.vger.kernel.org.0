Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A2F32680D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 21:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhBZUKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 15:10:40 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:34653 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbhBZUKU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 15:10:20 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 37EBF1FC51;
        Fri, 26 Feb 2021 21:06:28 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 25/41] arm64: dts: qcom: sdm660: Make the DTS an overlay on top of 630
Date:   Fri, 26 Feb 2021 21:03:55 +0100
Message-Id: <20210226200414.167762-26-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210226200414.167762-1-konrad.dybcio@somainline.org>
References: <20210226200414.167762-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is SO MUCH common code between these two SoCs that it makes
no sense to keep what is essentially a duplicate of 630.dtsi. Instead,
it's better to just change the things that differ.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  |   2 -
 arch/arm64/boot/dts/qcom/sdm660.dtsi          | 448 +++++-------------
 2 files changed, 117 insertions(+), 333 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 76533e8b2092..3e677fb7cfea 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -37,8 +37,6 @@ ramoops@a0000000 {
 
 &blsp1_uart2 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart_console_active>;
 };
 
 &tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 4abbdd03d1e7..13467e2c708a 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -2,371 +2,157 @@
 /*
  * Copyright (c) 2018, Craig Tatlor.
  * Copyright (c) 2020, Alexey Minnekhanov <alexey.min@gmail.com>
+ * Copyright (c) 2020, AngeloGioacchino Del Regno <kholk11@gmail.com>
+ * Copyright (c) 2020, Konrad Dybcio <konradybcio@gmail.com>
+ * Copyright (c) 2020, Martin Botka <martin.botka1@gmail.com>
  */
 
-#include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/clock/qcom,gcc-sdm660.h>
+#include "sdm630.dtsi"
 
-/ {
-	interrupt-parent = <&intc>;
+&adreno_gpu {
+	compatible = "qcom,adreno-512.0", "qcom,adreno";
+	operating-points-v2 = <&gpu_sdm660_opp_table>;
 
-	#address-cells = <2>;
-	#size-cells = <2>;
+	gpu_sdm660_opp_table: opp-table {
+		compatible  = "operating-points-v2";
 
-	chosen { };
+		/*
+		 * 775MHz is only available on the highest speed bin
+		 * Though it cannot be used for now due to interconnect
+		 * framework not supporting multiple frequencies
+		 * at the same opp-level
 
-	clocks {
-		xo_board: xo_board {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <19200000>;
-			clock-output-names = "xo_board";
+		opp-750000000 {
+			opp-hz = /bits/ 64 <750000000>;
+			opp-level = <RPM_SMD_LEVEL_TURBO>;
+			opp-peak-kBps = <5412000>;
+			opp-supported-hw = <0xCHECKME>;
 		};
 
-		sleep_clk: sleep_clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32764>;
-			clock-output-names = "sleep_clk";
-		};
-	};
-
-	cpus {
-		#address-cells = <2>;
-		#size-cells = <0>;
+		* These OPPs are correct, but we are lacking support for the
+		* GPU regulator. Hence, disable them for now to prevent the
+		* platform from hanging on high graphics loads.
 
-		CPU0: cpu@100 {
-			device_type = "cpu";
-			compatible = "qcom,kryo260";
-			reg = <0x0 0x100>;
-			enable-method = "psci";
-			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&L2_1>;
-			L2_1: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-			};
-			L1_I_100: l1-icache {
-				compatible = "cache";
-			};
-			L1_D_100: l1-dcache {
-				compatible = "cache";
-			};
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-level = <RPM_SMD_LEVEL_TURBO>;
+			opp-peak-kBps = <5184000>;
+			opp-supported-hw = <0xFF>;
 		};
 
-		CPU1: cpu@101 {
-			device_type = "cpu";
-			compatible = "qcom,kryo260";
-			reg = <0x0 0x101>;
-			enable-method = "psci";
-			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&L2_1>;
-			L1_I_101: l1-icache {
-				compatible = "cache";
-			};
-			L1_D_101: l1-dcache {
-				compatible = "cache";
-			};
+		opp-647000000 {
+			opp-hz = /bits/ 64 <647000000>;
+			opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+			opp-peak-kBps = <4068000>;
+			opp-supported-hw = <0xFF>;
 		};
 
-		CPU2: cpu@102 {
-			device_type = "cpu";
-			compatible = "qcom,kryo260";
-			reg = <0x0 0x102>;
-			enable-method = "psci";
-			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&L2_1>;
-			L1_I_102: l1-icache {
-				compatible = "cache";
-			};
-			L1_D_102: l1-dcache {
-				compatible = "cache";
-			};
+		opp-588000000 {
+			opp-hz = /bits/ 64 <588000000>;
+			opp-level = <RPM_SMD_LEVEL_NOM>;
+			opp-peak-kBps = <3072000>;
+			opp-supported-hw = <0xFF>;
 		};
 
-		CPU3: cpu@103 {
-			device_type = "cpu";
-			compatible = "qcom,kryo260";
-			reg = <0x0 0x103>;
-			enable-method = "psci";
-			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&L2_1>;
-			L1_I_103: l1-icache {
-				compatible = "cache";
-			};
-			L1_D_103: l1-dcache {
-				compatible = "cache";
-			};
+		opp-465000000 {
+			opp-hz = /bits/ 64 <465000000>;
+			opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
+			opp-peak-kBps = <2724000>;
+			opp-supported-hw = <0xFF>;
 		};
 
-		CPU4: cpu@0 {
-			device_type = "cpu";
-			compatible = "qcom,kryo260";
-			reg = <0x0 0x0>;
-			enable-method = "psci";
-			capacity-dmips-mhz = <640>;
-			next-level-cache = <&L2_0>;
-			L2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-			};
-			L1_I_0: l1-icache {
-				compatible = "cache";
-			};
-			L1_D_0: l1-dcache {
-				compatible = "cache";
-			};
+		opp-370000000 {
+			opp-hz = /bits/ 64 <370000000>;
+			opp-level = <RPM_SMD_LEVEL_SVS>;
+			opp-peak-kBps = <2188000>;
+			opp-supported-hw = <0xFF>;
 		};
+		*/
 
-		CPU5: cpu@1 {
-			device_type = "cpu";
-			compatible = "qcom,kryo260";
-			reg = <0x0 0x1>;
-			enable-method = "psci";
-			capacity-dmips-mhz = <640>;
-			next-level-cache = <&L2_0>;
-			L1_I_1: l1-icache {
-				compatible = "cache";
-			};
-			L1_D_1: l1-dcache {
-				compatible = "cache";
-			};
+		opp-266000000 {
+			opp-hz = /bits/ 64 <266000000>;
+			opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+			opp-peak-kBps = <1648000>;
+			opp-supported-hw = <0xFF>;
 		};
 
-		CPU6: cpu@2 {
-			device_type = "cpu";
-			compatible = "qcom,kryo260";
-			reg = <0x0 0x2>;
-			enable-method = "psci";
-			capacity-dmips-mhz = <640>;
-			next-level-cache = <&L2_0>;
-			L1_I_2: l1-icache {
-				compatible = "cache";
-			};
-			L1_D_2: l1-dcache {
-				compatible = "cache";
-			};
+		opp-160000000 {
+			opp-hz = /bits/ 64 <160000000>;
+			opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
+			opp-peak-kBps = <1200000>;
+			opp-supported-hw = <0xFF>;
 		};
-
-		CPU7: cpu@3 {
-			device_type = "cpu";
-			compatible = "qcom,kryo260";
-			reg = <0x0 0x3>;
-			enable-method = "psci";
-			capacity-dmips-mhz = <640>;
-			next-level-cache = <&L2_0>;
-			L1_I_3: l1-icache {
-				compatible = "cache";
-			};
-			L1_D_3: l1-dcache {
-				compatible = "cache";
-			};
-		};
-
-		cpu-map {
-			cluster0 {
-				core0 {
-					cpu = <&CPU4>;
-				};
-
-				core1 {
-					cpu = <&CPU5>;
-				};
-
-				core2 {
-					cpu = <&CPU6>;
-				};
-
-				core3 {
-					cpu = <&CPU7>;
-				};
-			};
-
-			cluster1 {
-				core0 {
-					cpu = <&CPU0>;
-				};
-
-				core1 {
-					cpu = <&CPU1>;
-				};
-
-				core2 {
-					cpu = <&CPU2>;
-				};
-
-				core3 {
-					cpu = <&CPU3>;
-				};
-			};
-		};
-	};
-
-	firmware {
-		scm {
-			compatible = "qcom,scm";
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		/* We expect the bootloader to fill in the reg */
-		reg = <0 0 0 0>;
-	};
-
-	psci {
-		compatible = "arm,psci-1.0";
-		method = "smc";
-	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
 	};
+};
 
-	soc: soc {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0 0 0xffffffff>;
-		compatible = "simple-bus";
-
-		gcc: clock-controller@100000 {
-			compatible = "qcom,gcc-sdm660";
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-			reg = <0x00100000 0x94000>;
-		};
-
-		tlmm: pinctrl@3100000 {
-			compatible = "qcom,sdm660-pinctrl";
-			reg = <0x03100000 0x400000>,
-			      <0x03500000 0x400000>,
-			      <0x03900000 0x400000>;
-			reg-names = "south", "center", "north";
-			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-controller;
-			gpio-ranges = <&tlmm 0 0 114>;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-
-			uart_console_active: uart_console_active {
-				pinmux {
-					pins = "gpio4", "gpio5";
-					function = "blsp_uart2";
-				};
+&CPU0 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <1024>;
+	/delete-property/ operating-points-v2;
+};
 
-				pinconf {
-					pins = "gpio4", "gpio5";
-					drive-strength = <2>;
-					bias-disable;
-				};
-			};
-		};
+&CPU1 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <1024>;
+	/delete-property/ operating-points-v2;
+};
 
-		spmi_bus: spmi@800f000 {
-			compatible = "qcom,spmi-pmic-arb";
-			reg = <0x0800f000 0x1000>,
-			      <0x08400000 0x1000000>,
-			      <0x09400000 0x1000000>,
-			      <0x0a400000 0x220000>,
-			      <0x0800a000 0x3000>;
-			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
-			interrupt-names = "periph_irq";
-			interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>;
-			qcom,ee = <0>;
-			qcom,channel = <0>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-			interrupt-controller;
-			#interrupt-cells = <4>;
-			cell-index = <0>;
-		};
+&CPU2 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <1024>;
+	/delete-property/ operating-points-v2;
+};
 
-		blsp1_uart2: serial@c170000 {
-			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
-			reg = <0x0c170000 0x1000>;
-			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
-				 <&gcc GCC_BLSP1_AHB_CLK>;
-			clock-names = "core", "iface";
-			status = "disabled";
-		};
+&CPU3 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <1024>;
+	/delete-property/ operating-points-v2;
+};
 
-		timer@17920000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			compatible = "arm,armv7-timer-mem";
-			reg = <0x17920000 0x1000>;
+&CPU4 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <640>;
+	/delete-property/ operating-points-v2;
+};
 
-			frame@17921000 {
-				frame-number = <0>;
-				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17921000 0x1000>,
-				      <0x17922000 0x1000>;
-			};
+&CPU5 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <640>;
+	/delete-property/ operating-points-v2;
+};
 
-			frame@17923000 {
-				frame-number = <1>;
-				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17923000 0x1000>;
-				status = "disabled";
-			};
+&CPU6 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <640>;
+	/delete-property/ operating-points-v2;
+};
 
-			frame@17924000 {
-				frame-number = <2>;
-				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17924000 0x1000>;
-				status = "disabled";
-			};
+&CPU7 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <640>;
+	/delete-property/ operating-points-v2;
+};
 
-			frame@17925000 {
-				frame-number = <3>;
-				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17925000 0x1000>;
-				status = "disabled";
-			};
+&gcc {
+	compatible = "qcom,gcc-sdm660";
+};
 
-			frame@17926000 {
-				frame-number = <4>;
-				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17926000 0x1000>;
-				status = "disabled";
-			};
+&gpucc {
+	compatible = "qcom,gpucc-sdm660";
+};
 
-			frame@17927000 {
-				frame-number = <5>;
-				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17927000 0x1000>;
-				status = "disabled";
-			};
+&mmcc {
+	compatible = "qcom,mmcc-sdm660";
+	/*
+	 * 660 has one more dsi host/phy, which - when implemented
+	 * and tested - should be added to the clocks property.
+	 */
+};
 
-			frame@17928000 {
-				frame-number = <6>;
-				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17928000 0x1000>;
-				status = "disabled";
-			};
-		};
+&tlmm {
+	compatible = "qcom,sdm660-pinctrl";
+};
 
-		intc: interrupt-controller@17a00000 {
-			compatible = "arm,gic-v3";
-			reg = <0x17a00000 0x10000>,
-			      <0x17b00000 0x100000>;
-			#interrupt-cells = <3>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			interrupt-controller;
-			#redistributor-regions = <1>;
-			redistributor-stride = <0x0 0x20000>;
-			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
-		};
-	};
+&tsens {
+	#qcom,sensors = <14>;
 };
-- 
2.30.1

