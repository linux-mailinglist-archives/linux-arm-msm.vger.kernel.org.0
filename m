Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 967364162EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 18:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242057AbhIWQXs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 12:23:48 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:36767 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242055AbhIWQXr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 12:23:47 -0400
Received: from localhost.localdomain (83.6.166.81.neoplus.adsl.tpnet.pl [83.6.166.81])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 85AA63F5F8;
        Thu, 23 Sep 2021 18:22:12 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/17] arm64: dts: qcom: Add SM6350 device tree
Date:   Thu, 23 Sep 2021 18:21:48 +0200
Message-Id: <20210923162204.21752-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923162204.21752-1-konrad.dybcio@somainline.org>
References: <20210923162204.21752-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a base DT for SM6350 SoC

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v2:
- Contain all the cpus within one cluster, as this SoC uses ARM's DynamIQ

 arch/arm64/boot/dts/qcom/sm6350.dtsi | 485 +++++++++++++++++++++++++++
 1 file changed, 485 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6350.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
new file mode 100644
index 000000000000..d718ecf7d74e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -0,0 +1,485 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+/ {
+	interrupt-parent = <&intc>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <76800000>;
+			clock-output-names = "xo_board";
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "qcom,kryo560";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+			L2_0: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+				L3_0: l3-cache {
+					compatible = "cache";
+				};
+			};
+		};
+
+		CPU1: cpu@100 {
+			device_type = "cpu";
+			compatible = "qcom,kryo560";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			next-level-cache = <&L2_100>;
+			#cooling-cells = <2>;
+			L2_100: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU2: cpu@200 {
+			device_type = "cpu";
+			compatible = "qcom,kryo560";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			next-level-cache = <&L2_200>;
+			#cooling-cells = <2>;
+			L2_200: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU3: cpu@300 {
+			device_type = "cpu";
+			compatible = "qcom,kryo560";
+			reg = <0x0 0x300>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			next-level-cache = <&L2_300>;
+			#cooling-cells = <2>;
+			L2_300: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU4: cpu@400 {
+			device_type = "cpu";
+			compatible = "qcom,kryo560";
+			reg = <0x0 0x400>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			next-level-cache = <&L2_400>;
+			#cooling-cells = <2>;
+			L2_400: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU5: cpu@500 {
+			device_type = "cpu";
+			compatible = "qcom,kryo560";
+			reg = <0x0 0x500>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			next-level-cache = <&L2_500>;
+			#cooling-cells = <2>;
+			L2_500: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+
+		};
+
+		CPU6: cpu@600 {
+			device_type = "cpu";
+			compatible = "qcom,kryo560";
+			reg = <0x0 0x600>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1894>;
+			dynamic-power-coefficient = <703>;
+			next-level-cache = <&L2_600>;
+			#cooling-cells = <2>;
+			L2_600: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU7: cpu@700 {
+			device_type = "cpu";
+			compatible = "qcom,kryo560";
+			reg = <0x0 0x700>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1894>;
+			dynamic-power-coefficient = <703>;
+			next-level-cache = <&L2_700>;
+			#cooling-cells = <2>;
+			L2_700: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+
+				core1 {
+					cpu = <&CPU1>;
+				};
+
+				core2 {
+					cpu = <&CPU2>;
+				};
+
+				core3 {
+					cpu = <&CPU3>;
+				};
+
+				core4 {
+					cpu = <&CPU4>;
+				};
+
+				core5 {
+					cpu = <&CPU5>;
+				};
+
+				core6 {
+					cpu = <&CPU6>;
+				};
+
+				core7 {
+					cpu = <&CPU7>;
+				};
+			};
+		};
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm-sm6350", "qcom,scm";
+			#reset-cells = <1>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hyp_mem: memory@80000000 {
+			reg = <0 0x80000000 0 0x600000>;
+			no-map;
+		};
+
+		xbl_aop_mem: memory@80700000 {
+			reg = <0 0x80700000 0 0x160000>;
+			no-map;
+		};
+
+		cmd_db: memory@80860000 {
+			compatible = "qcom,cmd-db";
+			reg = <0 0x80860000 0 0x20000>;
+			no-map;
+		};
+
+		sec_apps_mem: memory@808ff000 {
+			reg = <0 0x808ff000 0 0x1000>;
+			no-map;
+		};
+
+		smem_mem: memory@80900000 {
+			reg = <0 0x80900000 0 0x200000>;
+			no-map;
+		};
+
+		cdsp_sec_mem: memory@80b00000 {
+			reg = <0 0x80b00000 0 0x1e00000>;
+			no-map;
+		};
+
+		pil_camera_mem: memory@86000000 {
+			reg = <0 0x86000000 0 0x500000>;
+			no-map;
+		};
+
+		pil_npu_mem: memory@86500000 {
+			reg = <0 0x86500000 0 0x500000>;
+			no-map;
+		};
+
+		pil_video_mem: memory@86a00000 {
+			reg = <0 0x86a00000 0 0x500000>;
+			no-map;
+		};
+
+		pil_cdsp_mem: memory@86f00000 {
+			reg = <0 0x86f00000 0 0x1e00000>;
+			no-map;
+		};
+
+		pil_adsp_mem: memory@88d00000 {
+			reg = <0 0x88d00000 0 0x2800000>;
+			no-map;
+		};
+
+		wlan_fw_mem: memory@8b500000 {
+			reg = <0 0x8b500000 0 0x200000>;
+			no-map;
+		};
+
+		pil_ipa_fw_mem: memory@8b700000 {
+			reg = <0 0x8b700000 0 0x10000>;
+			no-map;
+		};
+
+		pil_ipa_gsi_mem: memory@8b710000 {
+			reg = <0 0x8b710000 0 0x5400>;
+			no-map;
+		};
+
+		pil_gpu_mem: memory@8b715400 {
+			reg = <0 0x8b715400 0 0x2000>;
+			no-map;
+		};
+
+		pil_modem_mem: memory@8b800000 {
+			reg = <0 0x8b800000 0 0xf800000>;
+			no-map;
+		};
+
+		cont_splash_memory: memory@a0000000 {
+			reg = <0 0xa0000000 0 0x2300000>;
+			no-map;
+		};
+
+		dfps_data_memory: memory@a2300000 {
+			reg = <0 0xa2300000 0 0x100000>;
+			no-map;
+		};
+
+		removed_region: memory@c0000000 {
+			reg = <0 0xc0000000 0 0x3900000>;
+			no-map;
+		};
+
+		debug_region: memory@ffb00000 {
+			reg = <0 0xffb00000 0 0xc0000>;
+			no-map;
+		};
+
+		last_log_region: memory@ffbc0000 {
+			reg = <0 0xffbc0000 0 0x40000>;
+			no-map;
+		};
+
+		ramoops: ramoops@ffc00000 {
+			compatible = "removed-dma-pool", "ramoops";
+			reg = <0 0xffc00000 0 0x00100000>;
+			record-size = <0x1000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x0>;
+			msg-size = <0x20000 0x20000>;
+			cc-size = <0x0>;
+			no-map;
+		};
+
+		cmdline_region: memory@ffd00000 {
+			reg = <0 0xffd00000 0 0x1000>;
+			no-map;
+		};
+	};
+
+	smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem_mem>;
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
+	soc: soc@0 {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0 0 0 0x10 0>;
+		dma-ranges = <0 0 0 0 0x10 0>;
+		compatible = "simple-bus";
+
+		ipcc: mailbox@408000 {
+			compatible = "qcom,sm6350-ipcc", "qcom,ipcc";
+			reg = <0 0x00408000 0 0x1000>;
+			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#mbox-cells = <2>;
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x40000>;
+			#hwlock-cells = <1>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sm6350-pdc", "qcom,pdc";
+			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x64>;
+			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
+					  <125 63 1>, <126 655 12>, <138 139 15>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		intc: interrupt-controller@17a00000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
+			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
+			interrupts = <GIC_PPI 8 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		watchdog@17c10000 {
+			compatible = "qcom,apss-wdt-sm6350", "qcom,kpss-wdt";
+			reg = <0 0x17c10000 0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		timer@17c20000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x17c20000 0x0 0x1000>;
+			clock-frequency = <19200000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			frame@17c21000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0 0x17c21000 0x0 0x1000>,
+				      <0x0 0x17c22000 0x0 0x1000>;
+			};
+
+			frame@17c23000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0 0x17c23000 0x0 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c25000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0 0x17c25000 0x0 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c27000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0 0x17c27000 0x0 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c29000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0 0x17c29000 0x0 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2b000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0 0x17c2b000 0x0 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2d000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0 0x17c2d000 0x0 0x1000>;
+				status = "disabled";
+			};
+		};
+
+		apps_rsc: rsc@18200000 {
+			compatible = "qcom,rpmh-rsc";
+			label = "apps_rsc";
+			reg = <0x0 0x18200000 0x0 0x10000>,
+				<0x0 0x18210000 0x0 0x10000>,
+				<0x0 0x18220000 0x0 0x10000>;
+			reg-names = "drv-0", "drv-1", "drv-2";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS 2>, <SLEEP_TCS 3>,
+					  <WAKE_TCS 3>, <CONTROL_TCS 1>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		clock-frequency = <19200000>;
+		interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 0 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
-- 
2.33.0

