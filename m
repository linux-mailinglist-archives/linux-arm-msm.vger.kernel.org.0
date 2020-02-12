Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B01215AE65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 18:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgBLRKO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 12:10:14 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42841 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728921AbgBLRKN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 12:10:13 -0500
Received: by mail-lj1-f196.google.com with SMTP id d10so3184068ljl.9;
        Wed, 12 Feb 2020 09:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I+NQgjmMsmFtLG1PUD69gXmQ8NgXiKUXUcIf+0EOQyg=;
        b=JNaFNUrXFNK1D9ddpj3KXYX3CCbExmbbeXCvPpdpQTcVdiDxi4WnRq7vGKBNLXmK/O
         adug5pB9M+ZWrIPwPUQBq1o5kqSv7pbcaQHGYZ/fG+CAKhvV2S9mNteyN4IJETfOJ8nk
         j0PNHkBlpTu4I683i+DY1ymluZH+vG2LGxMycW/7KZqB5yb1Kc0sFtVTaZjTpfY58KM7
         CrQOkSBvDNHSgQH3VpPkjwsMT9O+fx8/t0JiT6jE0PXl4ku9WyIFZxt0StSR0LNyiaXt
         D8CiXHA2mDS0glCtwzLBdNL0rXYr+ebwluOzXi1HiclKPY9k6LIhbO083iNqZE5Pzm5j
         qdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I+NQgjmMsmFtLG1PUD69gXmQ8NgXiKUXUcIf+0EOQyg=;
        b=HYKb2ylVVSlVJiT/cfEabTnU6qTMcch49SWx4o3qGB9NNVVzd1XkVmPgWd0VIqqzDp
         v46lzV0jY7tHrw0Tf5h9sDI8Fui7vMhk1YGgORXsrP7+3JRYmXmps5yUMEecfNrANTUd
         EpuJ1WlkG7zFp2mFxlHB6/8Ycib0nYlIFvklfhGABsezi0vD6Qzc00AGwKxVsD8q9E95
         SpKcEAxeV8+IcnRW25FimAikO8vgEaesqjOKg1SKW/nJBXGF1p3Wx9KiBSqJ6uREb2Ol
         8eiMjo3/5XrSkAonQJNgL1OYLeDb/V3B9VSXzV5pgPvl/v4AuegF7aBNWZV/zYBTjh2n
         DXCQ==
X-Gm-Message-State: APjAAAUaDnKgasglSuwWjYD+XBr9elxnyBgQitHuyKF2dMoi9ls2IRQV
        Oomvdr7L0tFwogNoGkkK5tk=
X-Google-Smtp-Source: APXvYqxc5tYINuZ0RNgTAI63YJ89etc0uLE4lKjO1MtgR6vEsLzoMqch6+OSOMKUqyH0zCulR/RhpA==
X-Received: by 2002:a2e:e12:: with SMTP id 18mr8544521ljo.123.1581527410646;
        Wed, 12 Feb 2020 09:10:10 -0800 (PST)
Received: from emb-minnehanov-OptiPlex-7060.collabio.net ([77.244.21.162])
        by smtp.gmail.com with ESMTPSA id b20sm607955ljp.20.2020.02.12.09.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 09:10:10 -0800 (PST)
From:   Alexey Minnekhanov <alexey.min@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Alexey Minnekhanov <alexey.min@gmail.com>,
        Craig Tatlor <ctatlor97@gmail.com>
Subject: [PATCH 4/5] arm64: dts: qcom: Add SDM660 SoC support
Date:   Wed, 12 Feb 2020 20:09:15 +0300
Message-Id: <20200212170916.7494-5-alexey.min@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212170916.7494-1-alexey.min@gmail.com>
References: <20200212170916.7494-1-alexey.min@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initial device tree support for Qualcomm SDM660 SoC.

SDM660 is based off MSM8998 and uses some of its drivers.
SDM630/636 are based off SDM660 SoC and they are pin
and software compatible.

The device tree is based on the CAF 4.4 kernel tree.

Features:
 * CPU nodes
 * Timer nodes
 * Interrupt controller
 * Global Clock Controller
 * Top Level Mode Multiplexer (pin controller)
 * UART node

This is inspired by and based on the work of Craig Tatlor in
https://patchwork.kernel.org/patch/10563667/

Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
Signed-off-by: Alexey Minnekhanov <alexey.min@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 373 +++++++++++++++++++++++++++
 1 file changed, 373 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm660.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
new file mode 100644
index 000000000000..1187f2f98bd0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2018, Craig Tatlor.
+ * Copyright (c) 2020, Alexey Minnekhanov <alexey.min@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-sdm660.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen { };
+
+	clocks {
+		xo_board: xo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+			clock-output-names = "xo_board";
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
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		CPU0: cpu@100 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_1>;
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+			};
+			L1_I_100: l1-icache {
+				compatible = "cache";
+			};
+			L1_D_100: l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU1: cpu@101 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x101>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_1>;
+			L1_I_101: l1-icache {
+				compatible = "cache";
+			};
+			L1_D_101: l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU2: cpu@102 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x102>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_1>;
+			L1_I_102: l1-icache {
+				compatible = "cache";
+			};
+			L1_D_102: l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU3: cpu@103 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x103>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_1>;
+			L1_I_103: l1-icache {
+				compatible = "cache";
+			};
+			L1_D_103: l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU4: cpu@0 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <640>;
+			next-level-cache = <&L2_0>;
+			L2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+			};
+			L1_I_0: l1-icache {
+				compatible = "cache";
+			};
+			L1_D_0: l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU5: cpu@1 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <640>;
+			next-level-cache = <&L2_0>;
+			L1_I_1: l1-icache {
+				compatible = "cache";
+			};
+			L1_D_1: l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU6: cpu@2 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x2>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <640>;
+			next-level-cache = <&L2_0>;
+			L1_I_2: l1-icache {
+				compatible = "cache";
+			};
+			L1_D_2: l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		CPU7: cpu@3 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x3>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <640>;
+			next-level-cache = <&L2_0>;
+			L1_I_3: l1-icache {
+				compatible = "cache";
+			};
+			L1_D_3: l1-dcache {
+				compatible = "cache";
+			};
+		};
+
+		cpu-map {
+			cluster0 {
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
+
+			cluster1 {
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
+		};
+	};
+
+	firmware {
+		scm {
+			compatible = "qcom,scm";
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0 0 0>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	soc: soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0xffffffff>;
+		compatible = "simple-bus";
+
+		gcc: clock-controller@100000 {
+			compatible = "qcom,gcc-sdm660";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0x00100000 0x94000>;
+		};
+
+		tlmm: pinctrl@3100000 {
+			compatible = "qcom,sdm660-pinctrl";
+			reg = <0x03100000 0x400000>,
+			      <0x03500000 0x400000>,
+			      <0x03900000 0x400000>;
+			reg-names = "south", "center", "north";
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 114>;
+			gpio-reserved-ranges = <8 4>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			uart_console_active: uart_console_active {
+				pinmux {
+					pins = "gpio4", "gpio5";
+					function = "blsp_uart2";
+				};
+
+				pinconf {
+					pins = "gpio4", "gpio5";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+		};
+
+		spmi_bus: spmi@800f000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0800f000 0x1000>,
+			      <0x08400000 0x1000000>,
+			      <0x09400000 0x1000000>,
+			      <0x0a400000 0x220000>,
+			      <0x0800a000 0x3000>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			cell-index = <0>;
+		};
+
+		blsp1_uart2: serial@c170000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x0c170000 0x1000>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
+		timer@17920000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x17920000 0x1000>;
+
+			frame@17921000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17921000 0x1000>,
+				      <0x17922000 0x1000>;
+			};
+
+			frame@17923000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17923000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17924000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17924000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17925000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17925000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17926000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17926000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17927000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17927000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17928000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17928000 0x1000>;
+				status = "disabled";
+			};
+		};
+
+		intc: interrupt-controller@17a00000 {
+			compatible = "arm,gic-v3";
+			reg = <0x17a00000 0x10000>,
+			      <0x17b00000 0x100000>;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x20000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+};
-- 
2.20.1

