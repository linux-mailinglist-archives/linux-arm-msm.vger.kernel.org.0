Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACB7EAE97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 12:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfJaLQ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 07:16:57 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54589 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbfJaLQ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 07:16:57 -0400
Received: by mail-wm1-f67.google.com with SMTP id c12so947329wml.4;
        Thu, 31 Oct 2019 04:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g4/kVxzWSUN/29NH4tVZTQM9aHes+Zvv6wiLA+SX2xY=;
        b=Pvxe32X+mQelRw9ZtQcLqVRba/PESQtjQ48o2V/BLdtYNYY+Ho4quhBwSqFIhLTrYR
         xuafIA3nYeB75fqcHJXEvCcDpv7NIlrARz5sDSFt72Cl86tg2xx2Su4K3o7G0ocqjBPY
         BKZWpyy7CdnVZSLkP65RdCTB4Zgpn687XYT1iE6lRC53BAwEz1v4dSwn11sEYMMarHWl
         PESyKEJxDnoMSpfZB+acO3lQF/mSYKHDb6gqY0vpZlwO7IHyM4dhHensrarumTDh66bC
         78ZgfN0zIcFZM9v/Nf8ss2iPxlMpnsApLzPFwjMQlcLApUStCkLzK6HultBjysvT7LtA
         BXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g4/kVxzWSUN/29NH4tVZTQM9aHes+Zvv6wiLA+SX2xY=;
        b=GEZLf/GmvCRWqDQcQOUEqvHAwM1Mxqo10E6Ye7FLWyx+UHKOWtvwJe3PZpSWp4jDDi
         PUVc8ATiQB0wRIyBmm1XyIFwMMPTKhzD//i/9i5Ooic8v+bEbGTXSfvtrBlk40cU9AQK
         etFe8hWOnS8luLplLSEenr68Aoqq4QWegIlwwQO+74fdglp/EeuagsJeRTM7oasYqNRT
         9rXukzVuUSkf9FjPl+kc3f7/IlQLtcasRKsR6m9Cgz/pBLCwjWSs5pnwIfJKf2pL1txX
         Ub0BDpvdvDm1F5ibq/YYJtm93zMMrYVNGTSqELiJ1YrjUBZij82GJ/R40p5mWoQA5YWf
         olpA==
X-Gm-Message-State: APjAAAWJ7U1iI6hq9D0n5bn38PWBcJCgxlMsqyTpKJmoz5I/wfnJkxeh
        X62DGcyO995B0Ws9KRqYqHAyk6ZkIJQ=
X-Google-Smtp-Source: APXvYqwkfiAANWMO8p59YXu0Tu1QYZZgCwBXDKF27un1JFGkAlxypmAv+D2kR45j+Yd3+ZLcvjkO3w==
X-Received: by 2002:a1c:200f:: with SMTP id g15mr4739571wmg.96.1572520613151;
        Thu, 31 Oct 2019 04:16:53 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id s17sm3009306wmh.3.2019.10.31.04.16.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 04:16:52 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, ccross@android.com,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH v2 4/5] arm64: dts: qcom: Add MSM8976 SoC support dts files
Date:   Thu, 31 Oct 2019 12:16:44 +0100
Message-Id: <20191031111645.34777-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031111645.34777-1-kholk11@gmail.com>
References: <20191031111645.34777-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

These are the DTs to support the MSM8976 SoC and, with very small
overrides in future ones, also MSM8956 and their APQ variants.

This configuration includes firmware, cpu, psci, idle states,
clocks, smem, rpm and power domains, i2c, spi, thermal sensors,
smsm, smp2p, sdhci, spmi, iommus, gpu, mdss/mdp, hexagon.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 1705 +++++++++++++++++++++++++
 1 file changed, 1705 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8976.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
new file mode 100644
index 000000000000..6fb917cd48fc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -0,0 +1,1705 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2014-2015, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2016-2019 AngeloGioacchino Del Regno <kholk11@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-msm8976.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	qcom,msm-id = <278 0x10001>; /* MSM8976 */
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		sdhc1 = &sdhc_1; /* SDC1 eMMC slot */
+		sdhc2 = &sdhc_2; /* SDC2 SD card slot */
+		sdhc3 = &sdhc_3; /* SDC3 SDIO card slot */
+		i2c2  = &blsp_i2c2;
+		i2c4  = &blsp_i2c4;
+		i2c6  = &blsp_i2c6;
+		i2c8  = &blsp_i2c8;
+		spi0  = &blsp1_spi0;
+	};
+
+	chosen { };
+
+	memory {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0 0 0>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cont_splash_mem: memory@83000000 {
+			reg = <0x0 0x83000000 0x0 0x2800000>;
+		};
+
+		ext-region@85b00000 {
+			reg = <0x0 0x85b00000 0x0 0x500000>;
+			no-map;
+		};
+
+		msm_imem: memory@86000000 {
+			reg = <0x0 0x86000000 0x0 0x300000>;
+			no-map;
+		};
+
+		smem_mem: memory@86300000 {
+			reg = <0x0 0x86300000 0x0 0x100000>;
+			no-map;
+		};
+
+		reserved@86400000 {
+			reg = <0x0 0x86400000 0x0 0x800000>;
+			no-map;
+		};
+
+		mpss_mem: memory@86c00000 {
+			reg = <0x0 0x86c00000 0x0 0x5600000>;
+			no-map;
+		};
+
+		lpass_mem: memory@8c200000 {
+			reg = <0x0 0x8c200000 0x0 0x1800000>;
+			no-map;
+		};
+
+		venus_mem: memory@8da00000 {
+			reg = <0x0 0x8DA00000 0x0 0x2600000>;
+			no-map;
+		};
+
+		tz_apps: memory@8dd00000 {
+			reg = <0x0 0x8dd00000 0x0 0x1400000>;
+			no-map;
+		};
+
+		rmtfs_mem: memory@dc400000 {
+			compatible = "qcom,rmtfs-mem";
+
+			size = <0x0 0x200000>;
+			alloc-ranges = <0x0 0xdc400000 0x0 0x2000000>;
+			no-map;
+
+			qcom,client-id = <1>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0>;
+			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+			L2_0: l2-cache {
+				compatible = "arm,arch-cache";
+				cache-level = <2>;
+			};
+			L1_I_0: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_0: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x1>;
+			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+			L1_I_1: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_1: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x2>;
+			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+			L1_I_2: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_2: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x3>;
+			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+			L1_I_3: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_3: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x100>;
+			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			capacity-dmips-mhz = <1830>;
+			next-level-cache = <&L2_1>;
+			#cooling-cells = <2>;
+			L2_1: l2-cache {
+				compatible = "arm,arch-cache";
+				cache-level = <2>;
+			};
+			L1_I_100: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_100: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x101>;
+			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			capacity-dmips-mhz = <1830>;
+			next-level-cache = <&L2_1>;
+			#cooling-cells = <2>;
+			L1_I_101: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_101: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU6: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x102>;
+			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			capacity-dmips-mhz = <1830>;
+			next-level-cache = <&L2_1>;
+			#cooling-cells = <2>;
+			L1_I_102: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_102: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU7: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x103>;
+			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			capacity-dmips-mhz = <1830>;
+			next-level-cache = <&L2_1>;
+			#cooling-cells = <2>;
+			L1_I_103: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_103: l1-dcache {
+				compatible = "arm,arch-cache";
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
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&CPU4>;
+				};
+
+				core1 {
+					cpu = <&CPU5>;
+				};
+
+				core2 {
+					cpu = <&CPU6>;
+				};
+
+				core3 {
+					cpu = <&CPU7>;
+				};
+			};
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <181>;
+				exit-latency-us = <149>;
+				min-residency-us = <703>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-retention";
+				arm,psci-suspend-param = <0x00000002>;
+				entry-latency-us = <142>;
+				exit-latency-us = <99>;
+				min-residency-us = <242>;
+			};
+
+			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <158>;
+				exit-latency-us = <144>;
+				min-residency-us = <863>;
+				local-timer-stop;
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <19200000>;
+	};
+
+	clocks {
+		xo_board: xo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+			clock-output-names = "xo_board";
+		};
+
+		cxo: cxo {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+			clock-output-names = "cxo";
+		};
+
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32764>;
+			clock-output-names = "sleep_clk";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm-msm8976", "qcom,scm";
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
+	smem {
+		compatible = "qcom,smem";
+
+		memory-region = <&smem_mem>;
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
+
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
+	rpmpd_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		rpmpd_opp_ret: opp1 {
+			opp-level = <RPM_SMD_LEVEL_RETENTION>;
+		};
+
+		rpmpd_opp_ret_plus: opp2 {
+			opp-level = <RPM_SMD_LEVEL_RETENTION_PLUS>;
+		};
+
+		rpmpd_opp_min_svs: opp3 {
+			opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
+		};
+
+		rpmpd_opp_low_svs: opp4 {
+			opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+		};
+
+		rpmpd_opp_svs: opp5 {
+			opp-level = <RPM_SMD_LEVEL_SVS>;
+		};
+
+		rpmpd_opp_svs_plus: opp6 {
+			opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
+		};
+
+		rpmpd_opp_nom: opp7 {
+			opp-level = <RPM_SMD_LEVEL_NOM>;
+		};
+
+		rpmpd_opp_nom_plus: opp8 {
+			opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+		};
+
+		rpmpd_opp_turbo: opp9 {
+			opp-level = <RPM_SMD_LEVEL_TURBO>;
+		};
+
+		rpmpd_opp_turbo_no_cpr: opp10 {
+			opp-level = <RPM_SMD_LEVEL_TURBO_NO_CPR>;
+		};
+
+		rpmpd_opp_turbo_high: opp111 {
+			opp-level = <RPM_SMD_LEVEL_TURBO_HIGH>;
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
+			rpm_requests: smd-channel {
+				compatible = "qcom,rpm-msm8976";
+				qcom,smd-channels = "rpm_requests";
+
+				rpmcc: clock-controller {
+					compatible = "qcom,rpmcc-msm8976";
+					#clock-cells = <1>;
+				};
+
+				rpmpd: power-controller {
+					compatible = "qcom,msm8976-rpmpd";
+					#power-domain-cells = <1>;
+					operating-points-v2 = <&rpmpd_opp_table>;
+				};
+			};
+		};
+	};
+
+	tcsr_mutex: hwlock {
+		compatible = "qcom,tcsr-mutex";
+		syscon = <&tcsr_mutex_regs 0 0x1000>;
+		#hwlock-cells = <1>;
+	};
+
+	soc: soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0xffffffff>;
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
+		qfprom@a4000 {
+			compatible = "qcom,qfprom";
+			reg = <0x000a4000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			tsens_caldata: caldata@218 {
+				reg = <0x218 0x18>;
+			};
+		};
+
+		tsens0: thermal-sensor@4a9000 {
+			compatible = "qcom,msm8976-tsens";
+			reg = <0x004a9000 0x1000>, /* TM */
+			      <0x004a8000 0x1000>; /* SROT */
+			nvmem-cells = <&tsens_caldata>;
+			nvmem-cell-names = "calib";
+			#qcom,sensors = <11>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,msm8976-pinctrl";
+			reg = <0x01000000 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			blsp1_uart1_default: blsp1_uart1_default {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3";
+				function = "blsp_uart1";
+
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			blsp1_uart2_default: blsp1_uart2_default {
+				pins = "gpio4", "gpio5", "gpio6", "gpio7";
+				function = "blsp_uart2";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp2_uart2_default: blsp2_uart2_default {
+				pins = "gpio20", "gpio21";
+				function = "blsp_uart6";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			spi0_default: spi0_default {
+				bus {
+					/* MOSI, MISO, CLK */
+					pins = "gpio0", "gpio1", "gpio3";
+					function = "blsp_spi1";
+
+					drive-strength = <12>;
+				};
+
+				cs0 {
+					pins = "gpio2";
+					function = "blsp_spi1";
+
+					drive-strength = <2>;
+				};
+			};
+
+			i2c2_default: i2c2_default {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
+
+				drive-strength = <2>;
+			};
+
+			i2c4_default: i2c4_default {
+				pins = "gpio14", "gpio15";
+				function = "blsp_i2c4";
+
+				drive-strength = <2>;
+			};
+
+			i2c6_default: i2c6_default {
+				pins = "gpio22", "gpio23";
+				function = "blsp_i2c6";
+
+				drive-strength = <2>;
+			};
+
+			i2c8_default: i2c8_default {
+				pins = "gpio18", "gpio19";
+				function = "blsp_i2c8";
+
+				drive-strength = <2>;
+			};
+
+			cci0_i2c_default: cci0_i2c_default {
+				pins = "gpio29", "gpio30";
+				function = "cci0_i2c";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cci1_i2c_default: cci1_i2c_default {
+				pins = "gpio103", "gpio104";
+				function = "cci0_i2c";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,gcc-msm8976";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0x01800000 0x80000>;
+		};
+
+		tcsr_mutex_regs: syscon@1905000 {
+			compatible = "syscon";
+			reg = <0x01905000 0x20000>;
+		};
+
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-msm8916", "syscon";
+			reg = <0x01937000 0x30000>;
+		};
+
+		mdss: mdss@1a00000 {
+			compatible = "qcom,mdss";
+			reg = <0x01a00000 0x1000>,
+			      <0x01ac8000 0x3000>;
+			reg-names = "mdss_phys", "vbif_phys";
+
+			power-domains = <&gcc MDSS_GDSC>;
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "vsync";
+
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			mdp: mdp@1a01000 {
+				compatible = "qcom,mdp5";
+				reg = <0x01a01000 0x89000>;
+				reg-names = "mdp_phys";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_VSYNC_CLK>,
+					 <&gcc GCC_MDP_TBU_CLK>,
+					 <&gcc GCC_MDP_RT_TBU_CLK>;
+				clock-names = "iface",
+					      "bus",
+					      "core",
+					      "vsync",
+					      "tbu",
+					      "tbu_rt";
+
+				iommus = <&apps_iommu 22>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdp5_intf1_out: endpoint {
+							remote-endpoint = <&dsi0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdp5_intf2_out: endpoint {
+							remote-endpoint = <&dsi1_in>;
+						};
+					};
+				};
+			};
+
+			dsi0: dsi@1a94000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0x01a94000 0x25c>;
+				reg-names = "dsi_ctrl";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+
+				assigned-clocks =
+					<&gcc GCC_MDSS_BYTE0_CLK_SRC>,
+					<&gcc GCC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy0 0>;
+
+				clocks = <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_BYTE0_CLK>,
+					 <&gcc GCC_MDSS_PCLK0_CLK>,
+					 <&gcc GCC_MDSS_ESC0_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core";
+				phys = <&dsi_phy0>;
+				phy-names = "dsi-phy";
+
+				qcom,mdss-mdp-transfer-time-us = <12000>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi0_in: endpoint {
+							remote-endpoint = <&mdp5_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi_phy0: dsi-phy@1a94a00 {
+				compatible = "qcom,dsi-phy-28nm-hpm-8976";
+				reg = <0x01a94a00 0xd4>,
+				      <0x01a94400 0x280>,
+				      <0x01a94b80 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&xo_board>;
+				clock-names = "iface", "ref";
+			};
+
+			dsi1: dsi@1a96000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0x01a96000 0x300>;
+				reg-names = "dsi_ctrl";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+
+				assigned-clocks =
+					<&gcc GCC_MDSS_BYTE1_CLK_SRC>,
+					<&gcc GCC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy1 0>,
+							 <&dsi_phy1 1>;
+
+				clocks = <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_BYTE1_CLK>,
+					 <&gcc GCC_MDSS_PCLK1_CLK>,
+					 <&gcc GCC_MDSS_ESC1_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core";
+				phys = <&dsi_phy1>;
+				phy-names = "dsi-phy";
+
+				qcom,mdss-mdp-transfer-time-us = <12000>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi1_in: endpoint {
+							remote-endpoint = <&mdp5_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi_phy1: dsi-phy@1a96a00 {
+				compatible = "qcom,dsi-phy-28nm-hpm-8976";
+				reg = <0x01a96a00 0xd4>,
+				      <0x01a96400 0x280>,
+				      <0x01a96b80 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&xo_board>;
+				clock-names = "iface", "ref";
+			};
+		};
+
+		adreno_gpu: gpu@1c00000 {
+			compatible = "qcom,adreno-510.0", "qcom,adreno";
+			#stream-id-cells = <16>;
+
+			reg = <0x01c00000 0x40000>;
+			reg-names = "kgsl_3d0_reg_memory";
+
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "kgsl_3d0_irq";
+
+			clock-names =
+			    "core",
+			    "iface",
+			    "mem",
+			    "rbbmtimer",
+			    "gtcu",
+			    "gtbu",
+			    "alwayson";
+
+			clocks =
+			    <&gcc GCC_GFX3D_OXILI_CLK>,
+			    <&gcc GCC_GFX3D_OXILI_AHB_CLK>,
+			    <&gcc GCC_GFX3D_BIMC_CLK>,
+			    <&gcc GCC_GFX3D_OXILI_TIMER_CLK>,
+			    <&gcc GCC_GFX3D_GTCU_AHB_CLK>,
+			    <&gcc GCC_GFX3D_TBU1_CLK>,
+			    <&gcc GCC_GFX3D_OXILI_AON_CLK>;
+
+			power-domains = <&gcc OXILI_GX_GDSC>;
+			operating-points-v2 = <&gpu_opp_table>;
+			iommus = <&gpu_iommu 0>;
+
+			gpu_opp_table: opp_table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+				};
+
+				opp-160000000 {
+					opp-hz = /bits/ 64 <160000000>;
+				};
+			};
+		};
+
+		apps_iommu: iommu@1e1f000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v1";
+			ranges = <0 0x01e1f000 0x21000>;
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_APSS_TCU_CLK>;
+			clock-names = "iface", "bus";
+			qcom,iommu-secure-id = <17>;
+			status = "ok";
+
+			// adsp_elf:
+			iommu-ctx@1000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x1000 0x1000>;
+				qcom,ctx-num = <1>;
+				interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// adsp_sec_pixel:
+			iommu-ctx@2000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x2000 0x1000>;
+				qcom,ctx-num = <2>;
+				interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// adsp_sec_bitstream:
+			iommu-ctx@3000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x3000 0x1000>;
+				qcom,ctx-num = <3>;
+				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// venus_fw:
+			iommu-ctx@4000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x4000 0x1000>;
+				qcom,ctx-num = <4>;
+				interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// venus_sec_non_pixel:
+			iommu-ctx@5000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x5000 0x1000>;
+				qcom,ctx-num = <5>;
+				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// venus_sec_bitstream:
+			iommu-ctx@6000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x6000 0x1000>;
+				qcom,ctx-num = <6>;
+				interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// venus_sec_pixel:
+			iommu-ctx@7000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x7000 0x1000>;
+				qcom,ctx-num = <7>;
+				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// venus_enc:
+			iommu-ctx@8000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x8000 0x1000>;
+				qcom,ctx-num = <8>;
+				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// mdp_1:
+			iommu-ctx@9000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x9000 0x1000>;
+				qcom,ctx-num = <9>;
+				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// adsp_io:
+			iommu-ctx@10000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x10000 0x1000>;
+				interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <14>;
+			};
+
+			// adsp_opendsp:
+			iommu-ctx@11000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x11000 0x1000>;
+				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <15>;
+			};
+
+			// adsp_shared:
+			iommu-ctx@12000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x12000 0x1000>;
+				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <16>;
+			};
+
+			// lpass_stream:
+			iommu-ctx@13000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x13000 0x1000>;
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <17>;
+			};
+
+			// cpp:
+			iommu-ctx@14000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x14000 0x1000>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <18>;
+			};
+
+			// jpeg_enc0:
+			iommu-ctx@15000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x15000 0x1000>;
+				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <19>;
+			};
+
+			// vfe:
+			iommu-ctx@16000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x16000 0x1000>;
+				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <20>;
+			};
+
+			// venus_ns:
+			iommu-ctx@17000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x17000 0x1000>;
+				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <21>;
+			};
+
+			// mdp_0:
+			iommu-ctx@18000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x18000 0x1000>;
+				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <22>;
+			};
+
+			// pronto_buf:
+			iommu-ctx@19000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x19000 0x1000>;
+				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <23>;
+			};
+
+			// mss_nav:
+			iommu-ctx@1a000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x1a000 0x1000>;
+				interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <24>;
+			};
+
+			// ipa_shared:
+			iommu-ctx@1b000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x1b000 0x1000>;
+				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <25>;
+			};
+
+			// ipa_wlan:
+			iommu-ctx@1c000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x1c000 0x1000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <26>;
+			};
+
+			// ipa_uc:
+			iommu-ctx@1d000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x1d000 0x1000>;
+				interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <27>;
+			};
+		};
+
+		gpu_iommu: iommu@1f08000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v1";
+			ranges = <0 0x01f08000 0x8000>;
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_GFX3D_TCU_CLK>;
+			clock-names = "iface", "bus";
+			qcom,iommu-secure-id = <18>;
+			power-domains = <&gcc OXILI_CX_GDSC>;
+
+			// gfx3d_user:
+			iommu-ctx@0 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x0 0x1000>;
+				qcom,ctx-num = <0>;
+				interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// gfx3d_sec:
+			iommu-ctx@2000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x1000 0x1000>;
+				qcom,ctx-num = <2>;
+				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// gfx3d_priv:
+			iommu-ctx@3000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x2000 0x1000>;
+				qcom,ctx-num = <1>;
+				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+		};
+
+		spmi_bus: qcom,spmi@200f000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0200f000 0x1000>,
+				<0x02400000 0x800000>,
+				<0x02c00000 0x800000>,
+				<0x03800000 0x200000>,
+				<0x0200a000 0x2100>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			cell-index = <0>;
+		};
+
+		sdhc_1: mmc@7824000 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x07824900 0x500>, <0x07824000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "core", "iface", "xo";
+
+			mmc-hs400-1_8v;
+			bus-width = <8>;
+			non-removable;
+			status = "disabled";
+		};
+
+		sdhc_2: sdhci@7864000 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x07864900 0x11c>, <0x07864000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "core", "iface", "xo";
+
+			bus-width = <4>;
+			status = "disabled";
+		};
+
+		blsp_dma: dma@7884000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07884000 0x1f000>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		blsp1_uart1: serial@78af000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078af000 0x200>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 1>, <&blsp_dma 0>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_uart1_default>;
+			status = "disabled";
+		};
+
+		blsp1_uart2: serial@78b0000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078b0000 0x200>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 3>, <&blsp_dma 2>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_uart2_default>;
+			status = "disabled";
+		};
+
+		blsp2_uart2: serial@7af0000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x07af0000 0x200>;
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp2_dma 1>, <&blsp2_dma 0>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp2_uart2_default>;
+			status = "disabled";
+		};
+
+		blsp1_spi0: spi@78b5000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b5000 0x500>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 5>, <&blsp_dma 4>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c2: i2c@78b6000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b6000 0x500>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c4: i2c@78b8000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b8000 0x500>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c4_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		otg: usb@78d9000 {
+			compatible = "qcom,ci-hdrc";
+			reg = <0x078db000 0x200>,
+			      <0x078db200 0x200>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_USB_HS_AHB_CLK>,
+				 <&gcc GCC_USB_HS_SYSTEM_CLK>;
+			clock-names = "iface", "core";
+			assigned-clocks = <&gcc GCC_USB_HS_SYSTEM_CLK>;
+			assigned-clock-rates = <80000000>;
+			resets = <&gcc RST_USB_HS_BCR>;
+			reset-names = "core";
+			phy_type = "ulpi";
+			dr_mode = "peripheral";
+			ahb-burst-config = <0>;
+			status = "disabled";
+			#reset-cells = <1>;
+		};
+
+		sdhc_3: sdhci@7a24000 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x07a24900 0x11c>, <0x07a24000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC3_APPS_CLK>,
+				 <&gcc GCC_SDCC3_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "core", "iface", "xo";
+
+			bus-width = <4>;
+			status = "disabled";
+		};
+
+		blsp2_dma: dma@7ac4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07ac4000 0x1f000>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c6: i2c@7af6000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x07af6000 0x600>;
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				 <&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c6_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c8: i2c@7af8000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x07af8000 0x600>;
+			interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				 <&gcc GCC_BLSP2_QUP4_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c8_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
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
+		apcs: syscon@b011000 {
+			compatible = "syscon";
+			reg = <0x0b011000 0x1000>;
+		};
+
+		timer@b120000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0b120000 0x1000>;
+			clock-frequency = <19200000>;
+
+			frame@b121000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b121000 0x1000>,
+				      <0x0b122000 0x1000>;
+			};
+
+			frame@b123000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b123000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b124000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b124000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b125000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b125000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b126000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b126000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b127000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b127000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b128000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b128000 0x1000>;
+				status = "disabled";
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
+		qcom,ipc-1 = <&apcs 8 12>;
+		qcom,ipc-2 = <&apcs 8 9>;
+		qcom,ipc-3 = <&apcs 8 18>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		hexagon_smsm: hexagon@1 {
+			reg = <1>;
+			interrupts = <0 290 IRQ_TYPE_EDGE_RISING>;
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
+		};
+	};
+
+	modem-smp2p {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
+
+		qcom,ipc = <&apcs 8 13>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+
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
+	wcnss-smp2p {
+		compatible = "qcom,smp2p";
+		qcom,smem = <451>, <431>;
+
+		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
+
+		qcom,ipc = <&apcs 8 17>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <4>;
+
+		wcnss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcnss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	hexagon-smp2p {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+
+		interrupts = <GIC_SPI 291 IRQ_TYPE_EDGE_RISING>;
+
+		qcom,ipc = <&apcs 8 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		adsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+
+			#qcom,smem-state-cells = <1>;
+		};
+
+		adsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	thermal_zones: thermal-zones {
+		aoss0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 0>;
+			trips {
+				aoss0_alert: trip-point@0 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		mdm-core-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 1>;
+			trips {
+				modem_alert: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		qdsp-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 2>;
+			trips {
+				qdsp_alert: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		cam-isp-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 3>;
+			trips {
+				cam_isp_alert: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		apc1-cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				cpu4_alert0: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+				cpu4_alert1: trip-point@1 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu4_crit: trip-point@2 {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		apc1-cpu1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				cpu5_alert0: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+				cpu5_alert1: trip-point@1 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu5_crit: trip-point@2 {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		apc1-cpu2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				cpu6_alert0: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+				cpu6_alert1: trip-point@1 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu6_crit: trip-point@2 {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		apc1-cpu3-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				cpu7_alert0: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+				cpu7_alert1: trip-point@1 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu7_crit: trip-point@2 {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		apc1-l2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				l2_alert0: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+				l2_alert1: trip-point@1 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				l2_crit: trip-point@2 {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		apc0-cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				cpu0_alert0: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+				cpu0_alert1: trip-point@1 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu0_crit: trip-point@2 {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
-- 
2.21.0

