Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5B6269F74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgIOHN6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:13:58 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.173]:26124 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgIOHNv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600153986;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=As2WRSoiab1j7cW0+8BDFVv41SHbOY0qH+gglk5q1nc=;
        b=W54+4B+a94iKOhGKBOjJgw7vMC6/9YZjfeMpmSwd72wXAKOjTMaa5JrOB4jNoOoQTP
        6CNs2lbfmv/lPHf51nlWikUgnbYiFuUXogxHu3wa48hhuYRHsqfJjEVsYjudBggL+RrO
        ZBOMy47fv5vebfn5/z+P5mMBqecCR+YInTDQpa0siS1krOOSJftuaihxON37mgZubJN2
        tmkwgqBMr8rjX+cAcUwUwEPdDwk96rfls4ckhJoFxWPiGAwQJL1SIYQg0RHsay5OEDxf
        AndMurPvMc6AScLeynIjLVxPLoKl4JxZRgO9ukZJkn0HxG20EWzowQuNKq0MMvJFeir8
        WTrA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6FOVM="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7D3rdz
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:13:03 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 12/14] arm64: dts: qcom: msm8916: Sort nodes
Date:   Tue, 15 Sep 2020 09:12:19 +0200
Message-Id: <20200915071221.72895-13-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915071221.72895-1-stephan@gerhold.net>
References: <20200915071221.72895-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Just like in commit 50aa72ccb30b ("arm64: dts: qcom: msm8996:
Sort all nodes in msm8996.dtsi"), sort all the nodes by unit address,
then alphabetically by their name.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2540 ++++++++++++-------------
 1 file changed, 1270 insertions(+), 1270 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9af528b9979b..aaa21899f1a6 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -4,11 +4,11 @@
  */
 
 #include <dt-bindings/arm/coresight-cti-dt.h>
+#include <dt-bindings/clock/qcom,gcc-msm8916.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/interconnect/qcom,msm8916.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/clock/qcom,gcc-msm8916.h>
 #include <dt-bindings/reset/qcom,gcc-msm8916.h>
-#include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -94,6 +94,20 @@ mba_mem: mba@8ea00000 {
 		};
 	};
 
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -189,6 +203,42 @@ CLUSTER_PWRDN: cluster-gdhs {
 		};
 	};
 
+	cpu_opp_table: cpu-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+		};
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+		};
+		opp-998400000 {
+			opp-hz = /bits/ 64 <998400000>;
+		};
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm-msm8916", "qcom,scm";
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
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -223,183 +273,114 @@ CLUSTER_PD: power-domain-cluster {
 		};
 	};
 
-	pmu {
-		compatible = "arm,cortex-a53-pmu";
-		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
-	};
-
-	thermal-zones {
-		cpu0-1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+	smd {
+		compatible = "qcom,smd";
 
-			thermal-sensors = <&tsens 5>;
+		rpm {
+			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+			qcom,ipc = <&apcs 8 0>;
+			qcom,smd-edge = <15>;
 
-			trips {
-				cpu0_1_alert0: trip-point0 {
-					temperature = <75000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-				cpu0_1_crit: cpu_crit {
-					temperature = <110000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
+			rpm_requests: rpm-requests {
+				compatible = "qcom,rpm-msm8916";
+				qcom,smd-channels = "rpm_requests";
 
-			cooling-maps {
-				map0 {
-					trip = <&cpu0_1_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				rpmcc: clock-controller {
+					compatible = "qcom,rpmcc-msm8916";
+					#clock-cells = <1>;
 				};
 			};
 		};
+	};
 
-		cpu2-3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
-			thermal-sensors = <&tsens 4>;
+	smem {
+		compatible = "qcom,smem";
 
-			trips {
-				cpu2_3_alert0: trip-point0 {
-					temperature = <75000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-				cpu2_3_crit: cpu_crit {
-					temperature = <110000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
+		memory-region = <&smem_mem>;
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
 
-			cooling-maps {
-				map0 {
-					trip = <&cpu2_3_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
-		};
+		hwlocks = <&tcsr_mutex 3>;
+	};
 
-		gpu-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+	smp2p-hexagon {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
 
-			thermal-sensors = <&tsens 2>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
 
-			trips {
-				gpu_alert0: trip-point0 {
-					temperature = <75000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-				gpu_crit: gpu_crit {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-		};
+		qcom,ipc = <&apcs 8 14>;
 
-		camera-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
 
-			thermal-sensors = <&tsens 1>;
+		hexagon_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
 
-			trips {
-				cam_alert0: trip-point0 {
-					temperature = <75000>;
-					hysteresis = <2000>;
-					type = "hot";
-				};
-			};
+			#qcom,smem-state-cells = <1>;
 		};
 
-		modem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
-			thermal-sensors = <&tsens 0>;
+		hexagon_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
 
-			trips {
-				modem_alert0: trip-point0 {
-					temperature = <85000>;
-					hysteresis = <2000>;
-					type = "hot";
-				};
-			};
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
-
 	};
 
-	cpu_opp_table: cpu-opp-table {
-		compatible = "operating-points-v2";
-		opp-shared;
+	smp2p-wcnss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <451>, <431>;
 
-		opp-200000000 {
-			opp-hz = /bits/ 64 <200000000>;
-		};
-		opp-400000000 {
-			opp-hz = /bits/ 64 <400000000>;
-		};
-		opp-800000000 {
-			opp-hz = /bits/ 64 <800000000>;
-		};
-		opp-998400000 {
-			opp-hz = /bits/ 64 <998400000>;
-		};
-	};
+		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
 
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
-	};
+		qcom,ipc = <&apcs 8 18>;
 
-	clocks {
-		xo_board: xo-board {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <19200000>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <4>;
+
+		wcnss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+
+			#qcom,smem-state-cells = <1>;
 		};
 
-		sleep_clk: sleep-clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
+		wcnss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 	};
 
-	smem {
-		compatible = "qcom,smem";
+	smsm {
+		compatible = "qcom,smsm";
 
-		memory-region = <&smem_mem>;
-		qcom,rpm-msg-ram = <&rpm_msg_ram>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		hwlocks = <&tcsr_mutex 3>;
-	};
+		qcom,ipc-1 = <&apcs 8 13>;
+		qcom,ipc-3 = <&apcs 8 19>;
 
-	firmware {
-		scm: scm {
-			compatible = "qcom,scm-msm8916", "qcom,scm";
-			clocks = <&gcc GCC_CRYPTO_CLK>,
-				 <&gcc GCC_CRYPTO_AXI_CLK>,
-				 <&gcc GCC_CRYPTO_AHB_CLK>;
-			clock-names = "core", "bus", "iface";
-			#reset-cells = <1>;
+		apps_smsm: apps@0 {
+			reg = <0>;
 
-			qcom,dload-mode = <&tcsr 0x6100>;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		hexagon_smsm: hexagon@1 {
+			reg = <1>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		wcnss_smsm: wcnss@6 {
+			reg = <6>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 	};
 
@@ -409,6 +390,36 @@ soc: soc {
 		ranges = <0 0 0 0xffffffff>;
 		compatible = "simple-bus";
 
+		rng@22000 {
+			compatible = "qcom,prng";
+			reg = <0x00022000 0x200>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
+		restart@4ab000 {
+			compatible = "qcom,pshold";
+			reg = <0x004ab000 0x4>;
+		};
+
+		qfprom: qfprom@5c000 {
+			compatible = "qcom,qfprom";
+			reg = <0x0005c000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			tsens_caldata: caldata@d0 {
+				reg = <0xd0 0x8>;
+			};
+			tsens_calsel: calsel@ec {
+				reg = <0xec 0x4>;
+			};
+		};
+
+		rpm_msg_ram: memory@60000 {
+			compatible = "qcom,rpm-msg-ram";
+			reg = <0x00060000 0x8000>;
+		};
+
 		bimc: interconnect@400000 {
 			compatible = "qcom,msm8916-bimc";
 			reg = <0x00400000 0x62000>;
@@ -418,9 +429,16 @@ bimc: interconnect@400000 {
 				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
 		};
 
-		restart@4ab000 {
-			compatible = "qcom,pshold";
-			reg = <0x004ab000 0x4>;
+		tsens: thermal-sensor@4a9000 {
+			compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";
+			reg = <0x004a9000 0x1000>, /* TM */
+			      <0x004a8000 0x1000>; /* SROT */
+			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
+			nvmem-cell-names = "calib", "calib_sel";
+			#qcom,sensors = <5>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
+			#thermal-sensor-cells = <1>;
 		};
 
 		pcnoc: interconnect@500000 {
@@ -441,602 +459,429 @@ snoc: interconnect@580000 {
 				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
 		};
 
-		msmgpio: pinctrl@1000000 {
-			compatible = "qcom,msm8916-pinctrl";
-			reg = <0x01000000 0x300000>;
-			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-controller;
-			gpio-ranges = <&msmgpio 0 0 122>;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
+		/* System CTIs */
+		/* CTI 0 - TMC connections */
+		cti0: cti@810000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x00810000 0x1000>;
 
-		gcc: clock-controller@1800000 {
-			compatible = "qcom,gcc-msm8916";
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-			reg = <0x01800000 0x80000>;
-		};
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
 
-		tcsr_mutex: hwlock@1905000 {
-			compatible = "qcom,tcsr-mutex";
-			reg = <0x01905000 0x20000>;
-			#hwlock-cells = <1>;
+			status = "disabled";
 		};
 
-		tcsr: syscon@1937000 {
-			compatible = "qcom,tcsr-msm8916", "syscon";
-			reg = <0x01937000 0x30000>;
-		};
+		/* CTI 1 - TPIU connections */
+		cti1: cti@811000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x00811000 0x1000>;
 
-		rpm_msg_ram: memory@60000 {
-			compatible = "qcom,rpm-msg-ram";
-			reg = <0x00060000 0x8000>;
-		};
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
 
-		blsp1_uart1: serial@78af000 {
-			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
-			reg = <0x078af000 0x200>;
-			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
-			clock-names = "core", "iface";
-			dmas = <&blsp_dma 1>, <&blsp_dma 0>;
-			dma-names = "rx", "tx";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_uart1_default>;
-			pinctrl-1 = <&blsp1_uart1_sleep>;
 			status = "disabled";
 		};
 
-		a53pll: clock@b016000 {
-			compatible = "qcom,msm8916-a53pll";
-			reg = <0x0b016000 0x40>;
-			#clock-cells = <0>;
-		};
+		/* CTIs 2-11 - no information - not instantiated */
 
-		apcs: mailbox@b011000 {
-			compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
-			reg = <0x0b011000 0x1000>;
-			#mbox-cells = <1>;
-			clocks = <&a53pll>, <&gcc GPLL0_VOTE>;
-			clock-names = "pll", "aux";
-			#clock-cells = <0>;
-		};
+		tpiu: tpiu@820000 {
+			compatible = "arm,coresight-tpiu", "arm,primecell";
+			reg = <0x00820000 0x1000>;
 
-		blsp1_uart2: serial@78b0000 {
-			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
-			reg = <0x078b0000 0x200>;
-			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
-			clock-names = "core", "iface";
-			dmas = <&blsp_dma 3>, <&blsp_dma 2>;
-			dma-names = "rx", "tx";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_uart2_default>;
-			pinctrl-1 = <&blsp1_uart2_sleep>;
-			status = "disabled";
-		};
+			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
 
-		blsp_dma: dma@7884000 {
-			compatible = "qcom,bam-v1.7.0";
-			reg = <0x07884000 0x23000>;
-			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
-			clock-names = "bam_clk";
-			#dma-cells = <1>;
-			qcom,ee = <0>;
 			status = "disabled";
-		};
 
-		blsp_spi1: spi@78b5000 {
-			compatible = "qcom,spi-qup-v2.2.1";
-			reg = <0x078b5000 0x500>;
-			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
-				 <&gcc GCC_BLSP1_AHB_CLK>;
-			clock-names = "core", "iface";
-			dmas = <&blsp_dma 5>, <&blsp_dma 4>;
-			dma-names = "rx", "tx";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&spi1_default>;
-			pinctrl-1 = <&spi1_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
+			in-ports {
+				port {
+					tpiu_in: endpoint {
+						remote-endpoint = <&replicator_out1>;
+					};
+				};
+			};
 		};
 
-		blsp_spi2: spi@78b6000 {
-			compatible = "qcom,spi-qup-v2.2.1";
-			reg = <0x078b6000 0x500>;
-			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
-				 <&gcc GCC_BLSP1_AHB_CLK>;
-			clock-names = "core", "iface";
-			dmas = <&blsp_dma 7>, <&blsp_dma 6>;
-			dma-names = "rx", "tx";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&spi2_default>;
-			pinctrl-1 = <&spi2_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
+		funnel0: funnel@821000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x00821000 0x1000>;
 
-		blsp_spi3: spi@78b7000 {
-			compatible = "qcom,spi-qup-v2.2.1";
-			reg = <0x078b7000 0x500>;
-			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>,
-				 <&gcc GCC_BLSP1_AHB_CLK>;
-			clock-names = "core", "iface";
-			dmas = <&blsp_dma 9>, <&blsp_dma 8>;
-			dma-names = "rx", "tx";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&spi3_default>;
-			pinctrl-1 = <&spi3_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
+			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
 
-		blsp_spi4: spi@78b8000 {
-			compatible = "qcom,spi-qup-v2.2.1";
-			reg = <0x078b8000 0x500>;
-			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_QUP4_SPI_APPS_CLK>,
-				 <&gcc GCC_BLSP1_AHB_CLK>;
-			clock-names = "core", "iface";
-			dmas = <&blsp_dma 11>, <&blsp_dma 10>;
-			dma-names = "rx", "tx";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&spi4_default>;
-			pinctrl-1 = <&spi4_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
-		};
 
-		blsp_spi5: spi@78b9000 {
-			compatible = "qcom,spi-qup-v2.2.1";
-			reg = <0x078b9000 0x500>;
-			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_QUP5_SPI_APPS_CLK>,
-				 <&gcc GCC_BLSP1_AHB_CLK>;
-			clock-names = "core", "iface";
-			dmas = <&blsp_dma 13>, <&blsp_dma 12>;
-			dma-names = "rx", "tx";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&spi5_default>;
-			pinctrl-1 = <&spi5_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-		blsp_spi6: spi@78ba000 {
-			compatible = "qcom,spi-qup-v2.2.1";
-			reg = <0x078ba000 0x500>;
-			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_QUP6_SPI_APPS_CLK>,
-				 <&gcc GCC_BLSP1_AHB_CLK>;
-			clock-names = "core", "iface";
-			dmas = <&blsp_dma 15>, <&blsp_dma 14>;
-			dma-names = "rx", "tx";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&spi6_default>;
-			pinctrl-1 = <&spi6_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
+				/*
+				 * Not described input ports:
+				 * 0 - connected to Resource and Power Manger CPU ETM
+				 * 1 - not-connected
+				 * 2 - connected to Modem CPU ETM
+				 * 3 - not-connected
+				 * 5 - not-connected
+				 * 6 - connected trought funnel to Wireless CPU ETM
+				 * 7 - connected to STM component
+				 */
 
-		blsp_i2c1: i2c@78b5000 {
-			compatible = "qcom,i2c-qup-v2.2.1";
-			reg = <0x078b5000 0x500>;
-			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&i2c1_default>;
-			pinctrl-1 = <&i2c1_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
+				port@4 {
+					reg = <4>;
+					funnel0_in4: endpoint {
+						remote-endpoint = <&funnel1_out>;
+					};
+				};
+			};
 
-		blsp_i2c2: i2c@78b6000 {
-			compatible = "qcom,i2c-qup-v2.2.1";
-			reg = <0x078b6000 0x500>;
-			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&i2c2_default>;
-			pinctrl-1 = <&i2c2_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
+			out-ports {
+				port {
+					funnel0_out: endpoint {
+						remote-endpoint = <&etf_in>;
+					};
+				};
+			};
 		};
 
-		blsp_i2c4: i2c@78b8000 {
-			compatible = "qcom,i2c-qup-v2.2.1";
-			reg = <0x078b8000 0x500>;
-			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&i2c4_default>;
-			pinctrl-1 = <&i2c4_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
+		replicator: replicator@824000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x00824000 0x1000>;
 
-		blsp_i2c5: i2c@78b9000 {
-			compatible = "qcom,i2c-qup-v2.2.1";
-			reg = <0x078b9000 0x500>;
-			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&i2c5_default>;
-			pinctrl-1 = <&i2c5_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
+			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
 
-		blsp_i2c6: i2c@78ba000 {
-			compatible = "qcom,i2c-qup-v2.2.1";
-			reg = <0x078ba000 0x500>;
-			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&i2c6_default>;
-			pinctrl-1 = <&i2c6_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
-		};
 
-		sound: sound@7702000 {
-			status = "disabled";
-			compatible = "qcom,apq8016-sbc-sndcard";
-			reg = <0x07702000 0x4>, <0x07702004 0x4>;
-			reg-names = "mic-iomux", "spkr-iomux";
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					replicator_out0: endpoint {
+						remote-endpoint = <&etr_in>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					replicator_out1: endpoint {
+						remote-endpoint = <&tpiu_in>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					replicator_in: endpoint {
+						remote-endpoint = <&etf_out>;
+					};
+				};
+			};
 		};
 
-		lpass: audio-controller@7708000 {
-			status = "disabled";
-			compatible = "qcom,lpass-cpu-apq8016";
-			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
-				 <&gcc GCC_ULTAUDIO_PCNOC_MPORT_CLK>,
-				 <&gcc GCC_ULTAUDIO_PCNOC_SWAY_CLK>,
-				 <&gcc GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK>,
-				 <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
-				 <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
-				 <&gcc GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK>;
+		etf: etf@825000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x00825000 0x1000>;
 
-			clock-names = "ahbix-clk",
-					"pcnoc-mport-clk",
-					"pcnoc-sway-clk",
-					"mi2s-bit-clk0",
-					"mi2s-bit-clk1",
-					"mi2s-bit-clk2",
-					"mi2s-bit-clk3";
-			#sound-dai-cells = <1>;
+			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
 
-			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "lpass-irq-lpaif";
-			reg = <0x07708000 0x10000>;
-			reg-names = "lpass-lpaif";
+			status = "disabled";
 
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
+			in-ports {
+				port {
+					etf_in: endpoint {
+						remote-endpoint = <&funnel0_out>;
+					};
+				};
+			};
 
-		lpass_codec: audio-codec@771c000 {
-			compatible = "qcom,msm8916-wcd-digital-codec";
-			reg = <0x0771c000 0x400>;
-			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
-				 <&gcc GCC_CODEC_DIGCODEC_CLK>;
-			clock-names = "ahbix-clk", "mclk";
-			#sound-dai-cells = <1>;
+			out-ports {
+				port {
+					etf_out: endpoint {
+						remote-endpoint = <&replicator_in>;
+					};
+				};
+			};
 		};
 
-		sdhc_1: sdhci@7824000 {
-			compatible = "qcom,sdhci-msm-v4";
-			reg = <0x07824900 0x11c>, <0x07824000 0x800>;
-			reg-names = "hc_mem", "core_mem";
+		etr: etr@826000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x00826000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
 
-			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hc_irq", "pwr_irq";
-			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
-				 <&gcc GCC_SDCC1_AHB_CLK>,
-				 <&xo_board>;
-			clock-names = "core", "iface", "xo";
-			mmc-ddr-1_8v;
-			bus-width = <8>;
-			non-removable;
 			status = "disabled";
+
+			in-ports {
+				port {
+					etr_in: endpoint {
+						remote-endpoint = <&replicator_out0>;
+					};
+				};
+			};
 		};
 
-		sdhc_2: sdhci@7864000 {
-			compatible = "qcom,sdhci-msm-v4";
-			reg = <0x07864900 0x11c>, <0x07864000 0x800>;
-			reg-names = "hc_mem", "core_mem";
+		funnel1: funnel@841000 {	/* APSS funnel only 4 inputs are used */
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x00841000 0x1000>;
 
-			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hc_irq", "pwr_irq";
-			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
-				 <&gcc GCC_SDCC2_AHB_CLK>,
-				 <&xo_board>;
-			clock-names = "core", "iface", "xo";
-			bus-width = <4>;
-			status = "disabled";
-		};
+			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
 
-		usb: usb@78d9000 {
-			compatible = "qcom,ci-hdrc";
-			reg = <0x078d9000 0x200>,
-			      <0x078d9200 0x200>;
-			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_USB_HS_AHB_CLK>,
-				 <&gcc GCC_USB_HS_SYSTEM_CLK>;
-			clock-names = "iface", "core";
-			assigned-clocks = <&gcc GCC_USB_HS_SYSTEM_CLK>;
-			assigned-clock-rates = <80000000>;
-			resets = <&gcc GCC_USB_HS_BCR>;
-			reset-names = "core";
-			phy_type = "ulpi";
-			dr_mode = "otg";
-			hnp-disable;
-			srp-disable;
-			adp-disable;
-			ahb-burst-config = <0>;
-			phy-names = "usb-phy";
-			phys = <&usb_hs_phy>;
 			status = "disabled";
-			#reset-cells = <1>;
 
-			ulpi {
-				usb_hs_phy: phy {
-					compatible = "qcom,usb-hs-phy-msm8916",
-						     "qcom,usb-hs-phy";
-					#phy-cells = <0>;
-					clocks = <&xo_board>, <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
-					clock-names = "ref", "sleep";
-					resets = <&gcc GCC_USB2A_PHY_BCR>, <&usb 0>;
-					reset-names = "phy", "por";
-					qcom,init-seq = /bits/ 8 <0x0 0x44
-						0x1 0x6b 0x2 0x24 0x3 0x13>;
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					funnel1_in0: endpoint {
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					funnel1_in1: endpoint {
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+				port@2 {
+					reg = <2>;
+					funnel1_in2: endpoint {
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+				port@3 {
+					reg = <3>;
+					funnel1_in3: endpoint {
+						remote-endpoint = <&etm3_out>;
+					};
 				};
 			};
-		};
 
-		intc: interrupt-controller@b000000 {
-			compatible = "qcom,msm-qgic2";
-			interrupt-controller;
-			#interrupt-cells = <3>;
-			reg = <0x0b000000 0x1000>, <0x0b002000 0x1000>;
+			out-ports {
+				port {
+					funnel1_out: endpoint {
+						remote-endpoint = <&funnel0_in4>;
+					};
+				};
+			};
 		};
 
-		timer@b020000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			compatible = "arm,armv7-timer-mem";
-			reg = <0x0b020000 0x1000>;
-			clock-frequency = <19200000>;
+		debug0: debug@850000 {
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
+			reg = <0x00850000 0x1000>;
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&CPU0>;
+			status = "disabled";
+		};
 
-			frame@b021000 {
-				frame-number = <0>;
-				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0b021000 0x1000>,
-				      <0x0b022000 0x1000>;
-			};
+		debug1: debug@852000 {
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
+			reg = <0x00852000 0x1000>;
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&CPU1>;
+			status = "disabled";
+		};
 
-			frame@b023000 {
-				frame-number = <1>;
-				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0b023000 0x1000>;
-				status = "disabled";
-			};
+		debug2: debug@854000 {
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
+			reg = <0x00854000 0x1000>;
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&CPU2>;
+			status = "disabled";
+		};
 
-			frame@b024000 {
-				frame-number = <2>;
-				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0b024000 0x1000>;
-				status = "disabled";
-			};
+		debug3: debug@856000 {
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
+			reg = <0x00856000 0x1000>;
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&CPU3>;
+			status = "disabled";
+		};
 
-			frame@b025000 {
-				frame-number = <3>;
-				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0b025000 0x1000>;
-				status = "disabled";
-			};
+		/* Core CTIs; CTIs 12-15 */
+		/* CTI - CPU-0 */
+		cti12: cti@858000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0x00858000 0x1000>;
 
-			frame@b026000 {
-				frame-number = <4>;
-				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0b026000 0x1000>;
-				status = "disabled";
-			};
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
 
-			frame@b027000 {
-				frame-number = <5>;
-				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0b027000 0x1000>;
-				status = "disabled";
-			};
+			cpu = <&CPU0>;
+			arm,cs-dev-assoc = <&etm0>;
 
-			frame@b028000 {
-				frame-number = <6>;
-				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x0b028000 0x1000>;
-				status = "disabled";
-			};
+			status = "disabled";
 		};
 
-		spmi_bus: spmi@200f000 {
-			compatible = "qcom,spmi-pmic-arb";
-			reg = <0x0200f000 0x001000>,
-			      <0x02400000 0x400000>,
-			      <0x02c00000 0x400000>,
-			      <0x03800000 0x200000>,
-			      <0x0200a000 0x002100>;
-			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
-			interrupt-names = "periph_irq";
-			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
-			qcom,ee = <0>;
-			qcom,channel = <0>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-			interrupt-controller;
-			#interrupt-cells = <4>;
-		};
+		/* CTI - CPU-1 */
+		cti13: cti@859000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0x00859000 0x1000>;
 
-		rng@22000 {
-			compatible = "qcom,prng";
-			reg = <0x00022000 0x200>;
-			clocks = <&gcc GCC_PRNG_AHB_CLK>;
-			clock-names = "core";
-		};
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
 
-		qfprom: qfprom@5c000 {
-			compatible = "qcom,qfprom";
-			reg = <0x0005c000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			tsens_caldata: caldata@d0 {
-				reg = <0xd0 0x8>;
-			};
-			tsens_calsel: calsel@ec {
-				reg = <0xec 0x4>;
-			};
-		};
+			cpu = <&CPU1>;
+			arm,cs-dev-assoc = <&etm1>;
 
-		tsens: thermal-sensor@4a9000 {
-			compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";
-			reg = <0x004a9000 0x1000>, /* TM */
-			      <0x004a8000 0x1000>; /* SROT */
-			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
-			nvmem-cell-names = "calib", "calib_sel";
-			#qcom,sensors = <5>;
-			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
-			#thermal-sensor-cells = <1>;
+			status = "disabled";
 		};
 
-		apps_iommu: iommu@1ef0000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			#iommu-cells = <1>;
-			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
-			ranges = <0 0x01e20000 0x40000>;
-			reg = <0x01ef0000 0x3000>;
-			clocks = <&gcc GCC_SMMU_CFG_CLK>,
-				 <&gcc GCC_APSS_TCU_CLK>;
-			clock-names = "iface", "bus";
-			qcom,iommu-secure-id = <17>;
+		/* CTI - CPU-2 */
+		cti14: cti@85a000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0x0085a000 0x1000>;
 
-			// vfe:
-			iommu-ctx@3000 {
-				compatible = "qcom,msm-iommu-v1-sec";
-				reg = <0x3000 0x1000>;
-				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-			};
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
 
-			// mdp_0:
-			iommu-ctx@4000 {
-				compatible = "qcom,msm-iommu-v1-ns";
-				reg = <0x4000 0x1000>;
-				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-			};
+			cpu = <&CPU2>;
+			arm,cs-dev-assoc = <&etm2>;
 
-			// venus_ns:
-			iommu-ctx@5000 {
-				compatible = "qcom,msm-iommu-v1-sec";
-				reg = <0x5000 0x1000>;
-				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-			};
+			status = "disabled";
 		};
 
-		gpu_iommu: iommu@1f08000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			#iommu-cells = <1>;
-			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
-			ranges = <0 0x01f08000 0x10000>;
-			clocks = <&gcc GCC_SMMU_CFG_CLK>,
-				 <&gcc GCC_GFX_TCU_CLK>;
-			clock-names = "iface", "bus";
-			qcom,iommu-secure-id = <18>;
+		/* CTI - CPU-3 */
+		cti15: cti@85b000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0x0085b000 0x1000>;
 
-			// gfx3d_user:
-			iommu-ctx@1000 {
-				compatible = "qcom,msm-iommu-v1-ns";
-				reg = <0x1000 0x1000>;
-				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			cpu = <&CPU3>;
+			arm,cs-dev-assoc = <&etm3>;
+
+			status = "disabled";
+		};
+
+		etm0: etm@85c000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0085c000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+			arm,coresight-loses-context-with-cpu;
+
+			cpu = <&CPU0>;
+
+			status = "disabled";
+
+			out-ports {
+				port {
+					etm0_out: endpoint {
+						remote-endpoint = <&funnel1_in0>;
+					};
+				};
 			};
+		};
 
-			// gfx3d_priv:
-			iommu-ctx@2000 {
-				compatible = "qcom,msm-iommu-v1-ns";
-				reg = <0x2000 0x1000>;
-				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+		etm1: etm@85d000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0085d000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+			arm,coresight-loses-context-with-cpu;
+
+			cpu = <&CPU1>;
+
+			status = "disabled";
+
+			out-ports {
+				port {
+					etm1_out: endpoint {
+						remote-endpoint = <&funnel1_in1>;
+					};
+				};
 			};
 		};
 
-		gpu@1c00000 {
-			compatible = "qcom,adreno-306.0", "qcom,adreno";
-			reg = <0x01c00000 0x20000>;
-			reg-names = "kgsl_3d0_reg_memory";
-			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "kgsl_3d0_irq";
-			clock-names =
-			    "core",
-			    "iface",
-			    "mem",
-			    "mem_iface",
-			    "alt_mem_iface",
-			    "gfx3d";
-			clocks =
-			    <&gcc GCC_OXILI_GFX3D_CLK>,
-			    <&gcc GCC_OXILI_AHB_CLK>,
-			    <&gcc GCC_OXILI_GMEM_CLK>,
-			    <&gcc GCC_BIMC_GFX_CLK>,
-			    <&gcc GCC_BIMC_GPU_CLK>,
-			    <&gcc GFX3D_CLK_SRC>;
-			power-domains = <&gcc OXILI_GDSC>;
-			operating-points-v2 = <&gpu_opp_table>;
-			iommus = <&gpu_iommu 1>, <&gpu_iommu 2>;
+		etm2: etm@85e000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0085e000 0x1000>;
 
-			gpu_opp_table: opp-table {
-				compatible = "operating-points-v2";
+			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+			arm,coresight-loses-context-with-cpu;
 
-				opp-400000000 {
-					opp-hz = /bits/ 64 <400000000>;
+			cpu = <&CPU2>;
+
+			status = "disabled";
+
+			out-ports {
+				port {
+					etm2_out: endpoint {
+						remote-endpoint = <&funnel1_in2>;
+					};
 				};
-				opp-19200000 {
-					opp-hz = /bits/ 64 <19200000>;
+			};
+		};
+
+		etm3: etm@85f000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0085f000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+			arm,coresight-loses-context-with-cpu;
+
+			cpu = <&CPU3>;
+
+			status = "disabled";
+
+			out-ports {
+				port {
+					etm3_out: endpoint {
+						remote-endpoint = <&funnel1_in3>;
+					};
 				};
 			};
 		};
 
+		msmgpio: pinctrl@1000000 {
+			compatible = "qcom,msm8916-pinctrl";
+			reg = <0x01000000 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 122>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,gcc-msm8916";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0x01800000 0x80000>;
+		};
+
+		tcsr_mutex: hwlock@1905000 {
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
 		mdss: mdss@1a00000 {
 			compatible = "qcom,mdss";
 			reg = <0x01a00000 0x1000>,
@@ -1161,42 +1006,284 @@ dsi_phy0: dsi-phy@1a98300 {
 			};
 		};
 
-		mpss: remoteproc@4080000 {
-			compatible = "qcom,msm8916-mss-pil", "qcom,q6v5-pil";
-			reg = <0x04080000 0x100>,
-			      <0x04020000 0x040>;
-
-			reg-names = "qdsp6", "rmb";
-
-			interrupts-extended = <&intc GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
-					      <&hexagon_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&hexagon_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&hexagon_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&hexagon_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog", "fatal", "ready",
-					  "handover", "stop-ack";
-
-			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
-				 <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
-				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
-				 <&xo_board>;
-			clock-names = "iface", "bus", "mem", "xo";
-
-			qcom,smem-states = <&hexagon_smp2p_out 0>;
-			qcom,smem-state-names = "stop";
-
-			resets = <&scm 0>;
-			reset-names = "mss_restart";
-
-			qcom,halt-regs = <&tcsr 0x18000 0x19000 0x1a000>;
-
+		camss: camss@1b00000 {
+			compatible = "qcom,msm8916-camss";
+			reg = <0x01b0ac00 0x200>,
+				<0x01b00030 0x4>,
+				<0x01b0b000 0x200>,
+				<0x01b00038 0x4>,
+				<0x01b08000 0x100>,
+				<0x01b08400 0x100>,
+				<0x01b0a000 0x500>,
+				<0x01b00020 0x10>,
+				<0x01b10000 0x1000>;
+			reg-names = "csiphy0",
+				"csiphy0_clk_mux",
+				"csiphy1",
+				"csiphy1_clk_mux",
+				"csid0",
+				"csid1",
+				"ispif",
+				"csi_clk_mux",
+				"vfe0";
+			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csiphy0",
+				"csiphy1",
+				"csid0",
+				"csid1",
+				"ispif",
+				"vfe0";
+			power-domains = <&gcc VFE_GDSC>;
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				<&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+				<&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				<&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				<&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+				<&gcc GCC_CAMSS_CSI0_CLK>,
+				<&gcc GCC_CAMSS_CSI0PHY_CLK>,
+				<&gcc GCC_CAMSS_CSI0PIX_CLK>,
+				<&gcc GCC_CAMSS_CSI0RDI_CLK>,
+				<&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+				<&gcc GCC_CAMSS_CSI1_CLK>,
+				<&gcc GCC_CAMSS_CSI1PHY_CLK>,
+				<&gcc GCC_CAMSS_CSI1PIX_CLK>,
+				<&gcc GCC_CAMSS_CSI1RDI_CLK>,
+				<&gcc GCC_CAMSS_AHB_CLK>,
+				<&gcc GCC_CAMSS_VFE0_CLK>,
+				<&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+				<&gcc GCC_CAMSS_VFE_AHB_CLK>,
+				<&gcc GCC_CAMSS_VFE_AXI_CLK>;
+			clock-names = "top_ahb",
+				"ispif_ahb",
+				"csiphy0_timer",
+				"csiphy1_timer",
+				"csi0_ahb",
+				"csi0",
+				"csi0_phy",
+				"csi0_pix",
+				"csi0_rdi",
+				"csi1_ahb",
+				"csi1",
+				"csi1_phy",
+				"csi1_pix",
+				"csi1_rdi",
+				"ahb",
+				"vfe0",
+				"csi_vfe0",
+				"vfe_ahb",
+				"vfe_axi";
+			iommus = <&apps_iommu 3>;
 			status = "disabled";
-
-			mba {
-				memory-region = <&mba_mem>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 			};
+		};
 
-			mpss {
+		cci: cci@1b0c000 {
+			compatible = "qcom,msm8916-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x01b0c000 0x1000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				<&gcc GCC_CAMSS_CCI_AHB_CLK>,
+				<&gcc GCC_CAMSS_CCI_CLK>,
+				<&gcc GCC_CAMSS_AHB_CLK>;
+			clock-names = "camss_top_ahb", "cci_ahb",
+					  "cci", "camss_ahb";
+			assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+					  <&gcc GCC_CAMSS_CCI_CLK>;
+			assigned-clock-rates = <80000000>, <19200000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&cci0_default>;
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		gpu@1c00000 {
+			compatible = "qcom,adreno-306.0", "qcom,adreno";
+			reg = <0x01c00000 0x20000>;
+			reg-names = "kgsl_3d0_reg_memory";
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "kgsl_3d0_irq";
+			clock-names =
+			    "core",
+			    "iface",
+			    "mem",
+			    "mem_iface",
+			    "alt_mem_iface",
+			    "gfx3d";
+			clocks =
+			    <&gcc GCC_OXILI_GFX3D_CLK>,
+			    <&gcc GCC_OXILI_AHB_CLK>,
+			    <&gcc GCC_OXILI_GMEM_CLK>,
+			    <&gcc GCC_BIMC_GFX_CLK>,
+			    <&gcc GCC_BIMC_GPU_CLK>,
+			    <&gcc GFX3D_CLK_SRC>;
+			power-domains = <&gcc OXILI_GDSC>;
+			operating-points-v2 = <&gpu_opp_table>;
+			iommus = <&gpu_iommu 1>, <&gpu_iommu 2>;
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+				};
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+				};
+			};
+		};
+
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8916-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&gcc VENUS_GDSC>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>;
+			clock-names = "core", "iface", "bus";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "okay";
+
+			video-decoder {
+				compatible = "venus-decoder";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+			};
+		};
+
+		apps_iommu: iommu@1ef0000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
+			ranges = <0 0x01e20000 0x40000>;
+			reg = <0x01ef0000 0x3000>;
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_APSS_TCU_CLK>;
+			clock-names = "iface", "bus";
+			qcom,iommu-secure-id = <17>;
+
+			// vfe:
+			iommu-ctx@3000 {
+				compatible = "qcom,msm-iommu-v1-sec";
+				reg = <0x3000 0x1000>;
+				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// mdp_0:
+			iommu-ctx@4000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x4000 0x1000>;
+				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// venus_ns:
+			iommu-ctx@5000 {
+				compatible = "qcom,msm-iommu-v1-sec";
+				reg = <0x5000 0x1000>;
+				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpu_iommu: iommu@1f08000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
+			ranges = <0 0x01f08000 0x10000>;
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_GFX_TCU_CLK>;
+			clock-names = "iface", "bus";
+			qcom,iommu-secure-id = <18>;
+
+			// gfx3d_user:
+			iommu-ctx@1000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x1000 0x1000>;
+				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// gfx3d_priv:
+			iommu-ctx@2000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x2000 0x1000>;
+				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		spmi_bus: spmi@200f000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0200f000 0x001000>,
+			      <0x02400000 0x400000>,
+			      <0x02c00000 0x400000>,
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
+		mpss: remoteproc@4080000 {
+			compatible = "qcom,msm8916-mss-pil", "qcom,q6v5-pil";
+			reg = <0x04080000 0x100>,
+			      <0x04020000 0x040>;
+
+			reg-names = "qdsp6", "rmb";
+
+			interrupts-extended = <&intc GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
+					      <&hexagon_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&hexagon_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&hexagon_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&hexagon_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
+				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "iface", "bus", "mem", "xo";
+
+			qcom,smem-states = <&hexagon_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			resets = <&scm 0>;
+			reset-names = "mss_restart";
+
+			qcom,halt-regs = <&tcsr 0x18000 0x19000 0x1a000>;
+
+			status = "disabled";
+
+			mba {
+				memory-region = <&mba_mem>;
+			};
+
+			mpss {
 				memory-region = <&mpss_mem>;
 			};
 
@@ -1225,690 +1312,603 @@ cb@1 {
 			};
 		};
 
-		pronto: remoteproc@a21b000 {
-			compatible = "qcom,pronto-v2-pil", "qcom,pronto";
-			reg = <0x0a204000 0x2000>, <0x0a202000 0x1000>, <0x0a21b000 0x3000>;
-			reg-names = "ccu", "dxe", "pmu";
-
-			memory-region = <&wcnss_mem>;
-
-			interrupts-extended = <&intc GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
-					      <&wcnss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&wcnss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&wcnss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
-
-			qcom,state = <&wcnss_smp2p_out 0>;
-			qcom,state-names = "stop";
-
-			pinctrl-names = "default";
-			pinctrl-0 = <&wcnss_pin_a>;
+		sound: sound@7702000 {
+			status = "disabled";
+			compatible = "qcom,apq8016-sbc-sndcard";
+			reg = <0x07702000 0x4>, <0x07702004 0x4>;
+			reg-names = "mic-iomux", "spkr-iomux";
+		};
 
+		lpass: audio-controller@7708000 {
 			status = "disabled";
+			compatible = "qcom,lpass-cpu-apq8016";
+			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
+				 <&gcc GCC_ULTAUDIO_PCNOC_MPORT_CLK>,
+				 <&gcc GCC_ULTAUDIO_PCNOC_SWAY_CLK>,
+				 <&gcc GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK>,
+				 <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
+				 <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
+				 <&gcc GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK>;
 
-			iris {
-				compatible = "qcom,wcn3620";
+			clock-names = "ahbix-clk",
+					"pcnoc-mport-clk",
+					"pcnoc-sway-clk",
+					"mi2s-bit-clk0",
+					"mi2s-bit-clk1",
+					"mi2s-bit-clk2",
+					"mi2s-bit-clk3";
+			#sound-dai-cells = <1>;
 
-				clocks = <&rpmcc RPM_SMD_RF_CLK2>;
-				clock-names = "xo";
-			};
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "lpass-irq-lpaif";
+			reg = <0x07708000 0x10000>;
+			reg-names = "lpass-lpaif";
 
-			smd-edge {
-				interrupts = <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 
-				qcom,ipc = <&apcs 8 17>;
-				qcom,smd-edge = <6>;
-				qcom,remote-pid = <4>;
-
-				label = "pronto";
-
-				wcnss {
-					compatible = "qcom,wcnss";
-					qcom,smd-channels = "WCNSS_CTRL";
-
-					qcom,mmio = <&pronto>;
-
-					bt {
-						compatible = "qcom,wcnss-bt";
-					};
-
-					wifi {
-						compatible = "qcom,wcnss-wlan";
-
-						interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
-						interrupt-names = "tx", "rx";
-
-						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
-						qcom,smem-state-names = "tx-enable", "tx-rings-empty";
-					};
-				};
-			};
-		};
-
-		tpiu: tpiu@820000 {
-			compatible = "arm,coresight-tpiu", "arm,primecell";
-			reg = <0x00820000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			status = "disabled";
-
-			in-ports {
-				port {
-					tpiu_in: endpoint {
-						remote-endpoint = <&replicator_out1>;
-					};
-				};
-			};
-		};
-
-		funnel0: funnel@821000 {
-			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0x00821000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			status = "disabled";
-
-			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				/*
-				 * Not described input ports:
-				 * 0 - connected to Resource and Power Manger CPU ETM
-				 * 1 - not-connected
-				 * 2 - connected to Modem CPU ETM
-				 * 3 - not-connected
-				 * 5 - not-connected
-				 * 6 - connected trought funnel to Wireless CPU ETM
-				 * 7 - connected to STM component
-				 */
-
-				port@4 {
-					reg = <4>;
-					funnel0_in4: endpoint {
-						remote-endpoint = <&funnel1_out>;
-					};
-				};
-			};
-
-			out-ports {
-				port {
-					funnel0_out: endpoint {
-						remote-endpoint = <&etf_in>;
-					};
-				};
-			};
+		lpass_codec: audio-codec@771c000 {
+			compatible = "qcom,msm8916-wcd-digital-codec";
+			reg = <0x0771c000 0x400>;
+			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
+				 <&gcc GCC_CODEC_DIGCODEC_CLK>;
+			clock-names = "ahbix-clk", "mclk";
+			#sound-dai-cells = <1>;
 		};
 
-		replicator: replicator@824000 {
-			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
-			reg = <0x00824000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
+		sdhc_1: sdhci@7824000 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x07824900 0x11c>, <0x07824000 0x800>;
+			reg-names = "hc_mem", "core_mem";
 
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "core", "iface", "xo";
+			mmc-ddr-1_8v;
+			bus-width = <8>;
+			non-removable;
 			status = "disabled";
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator_out0: endpoint {
-						remote-endpoint = <&etr_in>;
-					};
-				};
-				port@1 {
-					reg = <1>;
-					replicator_out1: endpoint {
-						remote-endpoint = <&tpiu_in>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint = <&etf_out>;
-					};
-				};
-			};
 		};
 
-		etf: etf@825000 {
-			compatible = "arm,coresight-tmc", "arm,primecell";
-			reg = <0x00825000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
+		sdhc_2: sdhci@7864000 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x07864900 0x11c>, <0x07864000 0x800>;
+			reg-names = "hc_mem", "core_mem";
 
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "core", "iface", "xo";
+			bus-width = <4>;
 			status = "disabled";
-
-			in-ports {
-				port {
-					etf_in: endpoint {
-						remote-endpoint = <&funnel0_out>;
-					};
-				};
-			};
-
-			out-ports {
-				port {
-					etf_out: endpoint {
-						remote-endpoint = <&replicator_in>;
-					};
-				};
-			};
 		};
 
-		etr: etr@826000 {
-			compatible = "arm,coresight-tmc", "arm,primecell";
-			reg = <0x00826000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
+		blsp_dma: dma@7884000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07884000 0x23000>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
 			status = "disabled";
-
-			in-ports {
-				port {
-					etr_in: endpoint {
-						remote-endpoint = <&replicator_out0>;
-					};
-				};
-			};
 		};
 
-		funnel1: funnel@841000 {	/* APSS funnel only 4 inputs are used */
-			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0x00841000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
+		blsp1_uart1: serial@78af000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078af000 0x200>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 1>, <&blsp_dma 0>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_uart1_default>;
+			pinctrl-1 = <&blsp1_uart1_sleep>;
 			status = "disabled";
-
-			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					funnel1_in0: endpoint {
-						remote-endpoint = <&etm0_out>;
-					};
-				};
-				port@1 {
-					reg = <1>;
-					funnel1_in1: endpoint {
-						remote-endpoint = <&etm1_out>;
-					};
-				};
-				port@2 {
-					reg = <2>;
-					funnel1_in2: endpoint {
-						remote-endpoint = <&etm2_out>;
-					};
-				};
-				port@3 {
-					reg = <3>;
-					funnel1_in3: endpoint {
-						remote-endpoint = <&etm3_out>;
-					};
-				};
-			};
-
-			out-ports {
-				port {
-					funnel1_out: endpoint {
-						remote-endpoint = <&funnel0_in4>;
-					};
-				};
-			};
 		};
 
-		debug0: debug@850000 {
-			compatible = "arm,coresight-cpu-debug", "arm,primecell";
-			reg = <0x00850000 0x1000>;
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-			cpu = <&CPU0>;
+		blsp1_uart2: serial@78b0000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078b0000 0x200>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 3>, <&blsp_dma 2>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_uart2_default>;
+			pinctrl-1 = <&blsp1_uart2_sleep>;
 			status = "disabled";
 		};
 
-		debug1: debug@852000 {
-			compatible = "arm,coresight-cpu-debug", "arm,primecell";
-			reg = <0x00852000 0x1000>;
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-			cpu = <&CPU1>;
+		blsp_i2c1: i2c@78b5000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b5000 0x500>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c1_default>;
+			pinctrl-1 = <&i2c1_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
-		debug2: debug@854000 {
-			compatible = "arm,coresight-cpu-debug", "arm,primecell";
-			reg = <0x00854000 0x1000>;
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-			cpu = <&CPU2>;
+		blsp_spi1: spi@78b5000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b5000 0x500>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 5>, <&blsp_dma 4>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&spi1_default>;
+			pinctrl-1 = <&spi1_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
-		debug3: debug@856000 {
-			compatible = "arm,coresight-cpu-debug", "arm,primecell";
-			reg = <0x00856000 0x1000>;
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-			cpu = <&CPU3>;
+		blsp_i2c2: i2c@78b6000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b6000 0x500>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c2_default>;
+			pinctrl-1 = <&i2c2_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
-		etm0: etm@85c000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x0085c000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-			arm,coresight-loses-context-with-cpu;
-
-			cpu = <&CPU0>;
-
+		blsp_spi2: spi@78b6000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b6000 0x500>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 7>, <&blsp_dma 6>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&spi2_default>;
+			pinctrl-1 = <&spi2_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
-
-			out-ports {
-				port {
-					etm0_out: endpoint {
-						remote-endpoint = <&funnel1_in0>;
-					};
-				};
-			};
 		};
 
-		etm1: etm@85d000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x0085d000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-			arm,coresight-loses-context-with-cpu;
-
-			cpu = <&CPU1>;
-
+		blsp_spi3: spi@78b7000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b7000 0x500>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 9>, <&blsp_dma 8>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&spi3_default>;
+			pinctrl-1 = <&spi3_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
-
-			out-ports {
-				port {
-					etm1_out: endpoint {
-						remote-endpoint = <&funnel1_in1>;
-					};
-				};
-			};
 		};
 
-		etm2: etm@85e000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x0085e000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-			arm,coresight-loses-context-with-cpu;
-
-			cpu = <&CPU2>;
-
+		blsp_i2c4: i2c@78b8000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b8000 0x500>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c4_default>;
+			pinctrl-1 = <&i2c4_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
-
-			out-ports {
-				port {
-					etm2_out: endpoint {
-						remote-endpoint = <&funnel1_in2>;
-					};
-				};
-			};
 		};
 
-		etm3: etm@85f000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x0085f000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-			arm,coresight-loses-context-with-cpu;
-
-			cpu = <&CPU3>;
-
+		blsp_spi4: spi@78b8000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b8000 0x500>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP4_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 11>, <&blsp_dma 10>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&spi4_default>;
+			pinctrl-1 = <&spi4_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
-
-			out-ports {
-				port {
-					etm3_out: endpoint {
-						remote-endpoint = <&funnel1_in3>;
-					};
-				};
-			};
 		};
 
-		/* System CTIs */
-		/* CTI 0 - TMC connections */
-		cti0: cti@810000 {
-			compatible = "arm,coresight-cti", "arm,primecell";
-			reg = <0x00810000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-
+		blsp_i2c5: i2c@78b9000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b9000 0x500>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c5_default>;
+			pinctrl-1 = <&i2c5_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
-		/* CTI 1 - TPIU connections */
-		cti1: cti@811000 {
-			compatible = "arm,coresight-cti", "arm,primecell";
-			reg = <0x00811000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-
+		blsp_spi5: spi@78b9000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b9000 0x500>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP5_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 13>, <&blsp_dma 12>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&spi5_default>;
+			pinctrl-1 = <&spi5_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
-		/* CTIs 2-11 - no information - not instantiated */
-
-		/* Core CTIs; CTIs 12-15 */
-		/* CTI - CPU-0 */
-		cti12: cti@858000 {
-			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
-				     "arm,primecell";
-			reg = <0x00858000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-
-			cpu = <&CPU0>;
-			arm,cs-dev-assoc = <&etm0>;
-
+		blsp_i2c6: i2c@78ba000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078ba000 0x500>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c6_default>;
+			pinctrl-1 = <&i2c6_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
-		/* CTI - CPU-1 */
-		cti13: cti@859000 {
-			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
-				     "arm,primecell";
-			reg = <0x00859000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-
-			cpu = <&CPU1>;
-			arm,cs-dev-assoc = <&etm1>;
-
+		blsp_spi6: spi@78ba000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078ba000 0x500>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP6_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 15>, <&blsp_dma 14>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&spi6_default>;
+			pinctrl-1 = <&spi6_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
-		/* CTI - CPU-2 */
-		cti14: cti@85a000 {
-			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
-				     "arm,primecell";
-			reg = <0x0085a000 0x1000>;
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
+			assigned-clock-rates = <80000000>;
+			resets = <&gcc GCC_USB_HS_BCR>;
+			reset-names = "core";
+			phy_type = "ulpi";
+			dr_mode = "otg";
+			hnp-disable;
+			srp-disable;
+			adp-disable;
+			ahb-burst-config = <0>;
+			phy-names = "usb-phy";
+			phys = <&usb_hs_phy>;
+			status = "disabled";
+			#reset-cells = <1>;
 
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
+			ulpi {
+				usb_hs_phy: phy {
+					compatible = "qcom,usb-hs-phy-msm8916",
+						     "qcom,usb-hs-phy";
+					#phy-cells = <0>;
+					clocks = <&xo_board>, <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
+					clock-names = "ref", "sleep";
+					resets = <&gcc GCC_USB2A_PHY_BCR>, <&usb 0>;
+					reset-names = "phy", "por";
+					qcom,init-seq = /bits/ 8 <0x0 0x44
+						0x1 0x6b 0x2 0x24 0x3 0x13>;
+				};
+			};
+		};
 
-			cpu = <&CPU2>;
-			arm,cs-dev-assoc = <&etm2>;
+		pronto: remoteproc@a21b000 {
+			compatible = "qcom,pronto-v2-pil", "qcom,pronto";
+			reg = <0x0a204000 0x2000>, <0x0a202000 0x1000>, <0x0a21b000 0x3000>;
+			reg-names = "ccu", "dxe", "pmu";
 
-			status = "disabled";
-		};
+			memory-region = <&wcnss_mem>;
 
-		/* CTI - CPU-3 */
-		cti15: cti@85b000 {
-			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
-				     "arm,primecell";
-			reg = <0x0085b000 0x1000>;
+			interrupts-extended = <&intc GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
 
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
+			qcom,state = <&wcnss_smp2p_out 0>;
+			qcom,state-names = "stop";
 
-			cpu = <&CPU3>;
-			arm,cs-dev-assoc = <&etm3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&wcnss_pin_a>;
 
 			status = "disabled";
-		};
 
-		venus: video-codec@1d00000 {
-			compatible = "qcom,msm8916-venus";
-			reg = <0x01d00000 0xff000>;
-			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&gcc VENUS_GDSC>;
-			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
-				 <&gcc GCC_VENUS0_AHB_CLK>,
-				 <&gcc GCC_VENUS0_AXI_CLK>;
-			clock-names = "core", "iface", "bus";
-			iommus = <&apps_iommu 5>;
-			memory-region = <&venus_mem>;
-			status = "okay";
+			iris {
+				compatible = "qcom,wcn3620";
 
-			video-decoder {
-				compatible = "venus-decoder";
+				clocks = <&rpmcc RPM_SMD_RF_CLK2>;
+				clock-names = "xo";
 			};
 
-			video-encoder {
-				compatible = "venus-encoder";
-			};
-		};
+			smd-edge {
+				interrupts = <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>;
 
-		camss: camss@1b00000 {
-			compatible = "qcom,msm8916-camss";
-			reg = <0x01b0ac00 0x200>,
-				<0x01b00030 0x4>,
-				<0x01b0b000 0x200>,
-				<0x01b00038 0x4>,
-				<0x01b08000 0x100>,
-				<0x01b08400 0x100>,
-				<0x01b0a000 0x500>,
-				<0x01b00020 0x10>,
-				<0x01b10000 0x1000>;
-			reg-names = "csiphy0",
-				"csiphy0_clk_mux",
-				"csiphy1",
-				"csiphy1_clk_mux",
-				"csid0",
-				"csid1",
-				"ispif",
-				"csi_clk_mux",
-				"vfe0";
-			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
-				<GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
-				<GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
-				<GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
-				<GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
-				<GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "csiphy0",
-				"csiphy1",
-				"csid0",
-				"csid1",
-				"ispif",
-				"vfe0";
-			power-domains = <&gcc VFE_GDSC>;
-			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
-				<&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
-				<&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
-				<&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
-				<&gcc GCC_CAMSS_CSI0_AHB_CLK>,
-				<&gcc GCC_CAMSS_CSI0_CLK>,
-				<&gcc GCC_CAMSS_CSI0PHY_CLK>,
-				<&gcc GCC_CAMSS_CSI0PIX_CLK>,
-				<&gcc GCC_CAMSS_CSI0RDI_CLK>,
-				<&gcc GCC_CAMSS_CSI1_AHB_CLK>,
-				<&gcc GCC_CAMSS_CSI1_CLK>,
-				<&gcc GCC_CAMSS_CSI1PHY_CLK>,
-				<&gcc GCC_CAMSS_CSI1PIX_CLK>,
-				<&gcc GCC_CAMSS_CSI1RDI_CLK>,
-				<&gcc GCC_CAMSS_AHB_CLK>,
-				<&gcc GCC_CAMSS_VFE0_CLK>,
-				<&gcc GCC_CAMSS_CSI_VFE0_CLK>,
-				<&gcc GCC_CAMSS_VFE_AHB_CLK>,
-				<&gcc GCC_CAMSS_VFE_AXI_CLK>;
-			clock-names = "top_ahb",
-				"ispif_ahb",
-				"csiphy0_timer",
-				"csiphy1_timer",
-				"csi0_ahb",
-				"csi0",
-				"csi0_phy",
-				"csi0_pix",
-				"csi0_rdi",
-				"csi1_ahb",
-				"csi1",
-				"csi1_phy",
-				"csi1_pix",
-				"csi1_rdi",
-				"ahb",
-				"vfe0",
-				"csi_vfe0",
-				"vfe_ahb",
-				"vfe_axi";
-			iommus = <&apps_iommu 3>;
-			status = "disabled";
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
-		};
+				qcom,ipc = <&apcs 8 17>;
+				qcom,smd-edge = <6>;
+				qcom,remote-pid = <4>;
 
-		cci: cci@1b0c000 {
-			compatible = "qcom,msm8916-cci";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0x01b0c000 0x1000>;
-			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
-				<&gcc GCC_CAMSS_CCI_AHB_CLK>,
-				<&gcc GCC_CAMSS_CCI_CLK>,
-				<&gcc GCC_CAMSS_AHB_CLK>;
-			clock-names = "camss_top_ahb", "cci_ahb",
-					  "cci", "camss_ahb";
-			assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
-					  <&gcc GCC_CAMSS_CCI_CLK>;
-			assigned-clock-rates = <80000000>, <19200000>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&cci0_default>;
-			status = "disabled";
+				label = "pronto";
+
+				wcnss {
+					compatible = "qcom,wcnss";
+					qcom,smd-channels = "WCNSS_CTRL";
 
-			cci_i2c0: i2c-bus@0 {
-				reg = <0>;
-				clock-frequency = <400000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
-		};
-	};
+					qcom,mmio = <&pronto>;
 
-	smd {
-		compatible = "qcom,smd";
+					bt {
+						compatible = "qcom,wcnss-bt";
+					};
 
-		rpm {
-			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
-			qcom,ipc = <&apcs 8 0>;
-			qcom,smd-edge = <15>;
+					wifi {
+						compatible = "qcom,wcnss-wlan";
 
-			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8916";
-				qcom,smd-channels = "rpm_requests";
+						interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+						interrupt-names = "tx", "rx";
 
-				rpmcc: clock-controller {
-					compatible = "qcom,rpmcc-msm8916";
-					#clock-cells = <1>;
+						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
+						qcom,smem-state-names = "tx-enable", "tx-rings-empty";
+					};
 				};
 			};
 		};
-	};
 
-	smp2p-hexagon {
-		compatible = "qcom,smp2p";
-		qcom,smem = <435>, <428>;
+		intc: interrupt-controller@b000000 {
+			compatible = "qcom,msm-qgic2";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x0b000000 0x1000>, <0x0b002000 0x1000>;
+		};
 
-		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
+		apcs: mailbox@b011000 {
+			compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
+			reg = <0x0b011000 0x1000>;
+			#mbox-cells = <1>;
+			clocks = <&a53pll>, <&gcc GPLL0_VOTE>;
+			clock-names = "pll", "aux";
+			#clock-cells = <0>;
+		};
 
-		qcom,ipc = <&apcs 8 14>;
+		a53pll: clock@b016000 {
+			compatible = "qcom,msm8916-a53pll";
+			reg = <0x0b016000 0x40>;
+			#clock-cells = <0>;
+		};
 
-		qcom,local-pid = <0>;
-		qcom,remote-pid = <1>;
+		timer@b020000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0b020000 0x1000>;
+			clock-frequency = <19200000>;
 
-		hexagon_smp2p_out: master-kernel {
-			qcom,entry-name = "master-kernel";
+			frame@b021000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b021000 0x1000>,
+				      <0x0b022000 0x1000>;
+			};
 
-			#qcom,smem-state-cells = <1>;
-		};
+			frame@b023000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b023000 0x1000>;
+				status = "disabled";
+			};
 
-		hexagon_smp2p_in: slave-kernel {
-			qcom,entry-name = "slave-kernel";
+			frame@b024000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b024000 0x1000>;
+				status = "disabled";
+			};
 
-			interrupt-controller;
-			#interrupt-cells = <2>;
+			frame@b025000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b025000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b026000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b026000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b027000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b027000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b028000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b028000 0x1000>;
+				status = "disabled";
+			};
 		};
 	};
 
-	smp2p-wcnss {
-		compatible = "qcom,smp2p";
-		qcom,smem = <451>, <431>;
+	thermal-zones {
+		cpu0-1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
 
-		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
+			thermal-sensors = <&tsens 5>;
 
-		qcom,ipc = <&apcs 8 18>;
+			trips {
+				cpu0_1_alert0: trip-point0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu0_1_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 
-		qcom,local-pid = <0>;
-		qcom,remote-pid = <4>;
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_1_alert0>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
 
-		wcnss_smp2p_out: master-kernel {
-			qcom,entry-name = "master-kernel";
+		cpu2-3-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
 
-			#qcom,smem-state-cells = <1>;
-		};
+			thermal-sensors = <&tsens 4>;
 
-		wcnss_smp2p_in: slave-kernel {
-			qcom,entry-name = "slave-kernel";
+			trips {
+				cpu2_3_alert0: trip-point0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu2_3_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 
-			interrupt-controller;
-			#interrupt-cells = <2>;
+			cooling-maps {
+				map0 {
+					trip = <&cpu2_3_alert0>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
-	};
 
-	smsm {
-		compatible = "qcom,smsm";
+		gpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
 
-		#address-cells = <1>;
-		#size-cells = <0>;
+			thermal-sensors = <&tsens 2>;
 
-		qcom,ipc-1 = <&apcs 8 13>;
-		qcom,ipc-3 = <&apcs 8 19>;
+			trips {
+				gpu_alert0: trip-point0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				gpu_crit: gpu_crit {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
 
-		apps_smsm: apps@0 {
-			reg = <0>;
+		camera-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
 
-			#qcom,smem-state-cells = <1>;
+			thermal-sensors = <&tsens 1>;
+
+			trips {
+				cam_alert0: trip-point0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
 		};
 
-		hexagon_smsm: hexagon@1 {
-			reg = <1>;
-			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+		modem-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
 
-			interrupt-controller;
-			#interrupt-cells = <2>;
+			thermal-sensors = <&tsens 0>;
+
+			trips {
+				modem_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
 		};
 
-		wcnss_smsm: wcnss@6 {
-			reg = <6>;
-			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
+	};
 
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 };
 
-- 
2.28.0

