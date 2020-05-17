Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB14E1D67E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 14:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbgEQMGG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 08:06:06 -0400
Received: from h2.fbrelay.privateemail.com ([131.153.2.43]:48885 "EHLO
        h2.fbrelay.privateemail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727911AbgEQMGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 08:06:03 -0400
X-Greylist: delayed 690 seconds by postgrey-1.27 at vger.kernel.org; Sun, 17 May 2020 08:06:02 EDT
Received: from MTA-05-3.privateemail.com (mta-05.privateemail.com [198.54.127.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 54EE880647;
        Sun, 17 May 2020 07:54:41 -0400 (EDT)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
        by MTA-05.privateemail.com (Postfix) with ESMTP id 2D4156004A;
        Sun, 17 May 2020 07:54:39 -0400 (EDT)
Received: from localhost.localdomain (unknown [10.20.151.204])
        by MTA-05.privateemail.com (Postfix) with ESMTPA id 9610860049;
        Sun, 17 May 2020 11:54:38 +0000 (UTC)
From:   Eli Riggs <eli@rje.li>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Eli Riggs <eli@rje.li>
Subject: [PATCH 2/3] arm64: dts: qcom: Add initial sm6125 SoC support
Date:   Sun, 17 May 2020 04:54:07 -0700
Message-Id: <20200517115410.3374-2-eli@rje.li>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200517115410.3374-1-eli@rje.li>
References: <20200517115410.3374-1-eli@rje.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initial support for SM6125 SoC. CPUs, fixed clocks,
interrupt controller, and UART.

This DTSI is ported from the forked vendor version from
XiaoMi which can be found at [0]. It seems internally
this board is referred to as "Trinket".

Since GCC isn't upstreamed yet, we use dummy clocks for GENI.

[0]: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/willow-p-oss/arch/arm64/boot/dts/qcom/trinket.dtsi

Signed-off-by: Eli Riggs <eli@rje.li>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 201 +++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
new file mode 100644
index 0000000000000..4931402d20c9d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+// Copyright (C) 2019 XiaoMi, Inc.
+// Copyright (C) 2020 Eli Riggs <eli@rje.li>
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
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
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+			clock-output-names = "xo_board";
+		};
+		sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32000>;
+			clock-output-names = "sleep_clk";
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+		CPU0: cpu@100 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1638>;
+			d-cache-size = <0x10000>;
+			i-cache-size = <0x10000>;
+		};
+		CPU1: cpu@101 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x101>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1638>;
+			d-cache-size = <0x10000>;
+			i-cache-size = <0x10000>;
+		};
+		CPU2: cpu@102 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x102>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1638>;
+			d-cache-size = <0x10000>;
+			i-cache-size = <0x10000>;
+		};
+		CPU3: cpu@103 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x103>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1638>;
+			d-cache-size = <0x10000>;
+			i-cache-size = <0x10000>;
+		};
+		CPU4: cpu@0 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			d-cache-size = <0x8000>;
+			i-cache-size = <0x8000>;
+		};
+		CPU5: cpu@1 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			d-cache-size = <0x8000>;
+			i-cache-size = <0x8000>;
+		};
+		CPU6: cpu@2 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x2>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			d-cache-size = <0x8000>;
+			i-cache-size = <0x8000>;
+		};
+		CPU7: cpu@3 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x3>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			d-cache-size = <0x8000>;
+			i-cache-size = <0x8000>;
+		};
+		cpu-map {
+			cluster0 {
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
+			cluster1 {
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
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		/* We expect the bootloader to fill this in */
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
+		clock-frequency = <19200000>;
+	};
+
+	soc: soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0xffffffff>;
+		compatible = "simple-bus";
+
+		intc: interrupt-controller@f200000 {
+			compatible = "arm,gic-v3";
+			reg = <0xf200000 0x10000>,	/* GICD */
+			      <0xf300000 0x100000>;	/* GICR * 8 */
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x20000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		/* This GENI and its children actually use GCC clocks,
+		 * but the bootloader has already set them up for us.
+		 * xo_board is used as a dummy here so the driver doesn't
+		 * give up.
+		 */
+		qupv3_0: geniqup@4ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x4ac0000 0x2000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&xo_board>, <&xo_board>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			qupv3_se4_2uart: serial@4a90000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x4a90000 0x4000>;
+				interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "se";
+				clocks = <&xo_board>;
+			};
+		};
+	};
+};
-- 
2.20.1

