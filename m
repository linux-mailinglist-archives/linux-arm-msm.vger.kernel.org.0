Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D85F2C28DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 15:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgKXOAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 09:00:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727561AbgKXOAc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 09:00:32 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DA9C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 06:00:32 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id j19so17540497pgg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 06:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=36AEB1rwNe87QDGbY2/Cf7e7Ac1bW6ZIJO1z3ra7FVU=;
        b=ncV99D/EUHvVFYTNWdZC1sp46l5SUrOHESNHCQMo95JoPr+LlA0eYZHx5N2M0DLRO1
         GU/Gy1Ogi6g4hmbEEWIgGito40l0nxT2s6nhlIlZf8DxZo1hQ1YpSPeQI8/aPheHCjQz
         tz5U+L+dTN9Od2FwYPPeeLEy43ltqjza0PYns3Tj60nqVIykd0QTWBrztSMJLZeqgbPj
         pUAdTR2fjYHzJku7p3qitvEEdvqvKcCiSPVQT5qx6ONX3kiNMe01iifBRk4vhzZDg8yL
         E/gFCO4+vtBzSxL5OC4C4W+weHwaUdR1tonhKrIWrfScNbW/5vb1pjh4Mw0n2VBJOqbH
         wC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=36AEB1rwNe87QDGbY2/Cf7e7Ac1bW6ZIJO1z3ra7FVU=;
        b=QvZzT9It3zAFX1rh8/26xy7jLOaiddlbOieEmBe3GgTbU/KDJe34GNEe2OOTRYJvod
         hPGyN2BGxRwpOS48M6XxAdnP70DqFqISXzgZjgV4jAE/3MIORE4Of04RhTboBk/eyppt
         StxmzzCccFYlRsIf7iLC+WdC56aqsuKIEjsIO2Zron/DT8KLxwprKKoy8K5r3cNs11t4
         TzmuI0h9yGc3/D68Ur1fe9QSD22ys2aliLee7+709c1OwC5okTfBrTvTbaYs8EG2rq4f
         Jx4hRElNh9qa0jVE2boPxh0rWiImDL+ylxry4LLqlpE+79oLZYnGcOtlO+ls2Avp9qqX
         PRXQ==
X-Gm-Message-State: AOAM530Wg10Nbai3MHCAzW5FSfMtP5XTyFXSuZptqHFBhLAzzUTtHLmp
        hPEGO6lhKP7BtuNj05buXDPZ
X-Google-Smtp-Source: ABdhPJxfN98dVwT1ejejKtPzJuI2QN3Z6h8cgKCq6iWHY+3rgmBUsnT+FwV+iLzwR9RlLI1cZ/Mb3w==
X-Received: by 2002:a17:90a:4687:: with SMTP id z7mr5037417pjf.168.1606226432115;
        Tue, 24 Nov 2020 06:00:32 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id u3sm14485937pfu.47.2020.11.24.06.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 06:00:31 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] ARM: dts: qcom: Add SDX55 Modem and MTP board support
Date:   Tue, 24 Nov 2020 19:30:11 +0530
Message-Id: <20201124140011.134751-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124140011.134751-1-manivannan.sadhasivam@linaro.org>
References: <20201124140011.134751-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add basic devicetree support for SDX55 Modem and MTP board from
Qualcomm. The SDX55 modem features an ARM Cortex A7 CPU which forms the
Application Processor Sub System (APSS) along with standard Qualcomm
peripherals like GCC, TLMM, BLSP, QPIC, BAM etc... Along with these,
there exists the networking parts such as IPA, MHI, PCIE-EP, EMAC
etc..

Currently, this basic devicetree support includes GCC, RPMh clock, INTC
and Debug UART.

Co-developed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/Makefile           |   3 +-
 arch/arm/boot/dts/qcom-sdx55-mtp.dts |  27 ++++
 arch/arm/boot/dts/qcom-sdx55.dtsi    | 205 +++++++++++++++++++++++++++
 3 files changed, 234 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-mtp.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx55.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index ce66ffd5a1bb..1505c6cdc5ca 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -917,7 +917,8 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-msm8974-sony-xperia-amami.dtb \
 	qcom-msm8974-sony-xperia-castor.dtb \
 	qcom-msm8974-sony-xperia-honami.dtb \
-	qcom-mdm9615-wp8548-mangoh-green.dtb
+	qcom-mdm9615-wp8548-mangoh-green.dtb \
+	qcom-sdx55-mtp.dtb
 dtb-$(CONFIG_ARCH_RDA) += \
 	rda8810pl-orangepi-2g-iot.dtb \
 	rda8810pl-orangepi-i96.dtb
diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
new file mode 100644
index 000000000000..8c39db4ae792
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020, Linaro Ltd.
+ */
+
+/dts-v1/;
+
+#include "qcom-sdx55.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SDX55 MTP";
+	compatible = "qcom,sdx55-mtp", "qcom,sdx55", "qcom,mtp";
+	qcom,board-id = <0x5010008 0x0>;
+
+	aliases {
+		serial0 = &blsp1_uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&blsp1_uart3 {
+	status = "ok";
+};
diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
new file mode 100644
index 000000000000..9e0b964e4c57
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * SDX55 SoC device tree source
+ *
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020, Linaro Ltd.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/clock/qcom,gcc-sdx55.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	model = "Qualcomm Technologies, Inc. SDX55";
+	compatible = "qcom,sdx55";
+	qcom,msm-id = <357 0x10000>, <368 0x10000>, <418 0x10000>;
+	interrupt-parent = <&intc>;
+
+	memory {
+		device_type = "memory";
+		reg = <0 0>;
+	};
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <38400000>;
+			clock-output-names = "xo_board";
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32000>;
+		};
+
+		pll_test_clk: pll-test-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <400000000>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	soc: soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		compatible = "simple-bus";
+
+		timer {
+			compatible = "arm,armv7-timer";
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+			clock-frequency = <19200000>;
+		};
+
+		gcc: clock-controller@100000 {
+			compatible = "qcom,gcc-sdx55";
+			reg = <0x100000 0x1f0000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clock-names = "bi_tcxo", "sleep_clk", "core_bi_pll_test_se";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>, <&pll_test_clk>;
+		};
+
+		blsp1_uart3: serial@831000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x00831000 0x200>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
+		pdc: interrupt-controller@b210000 {
+			compatible = "qcom,sdx55-pdc", "qcom,pdc";
+			reg = <0x0b210000 0x30000>;
+			qcom,pdc-ranges = <0 179 52>;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		intc: interrupt-controller@17800000 {
+			compatible = "qcom,msm-qgic2";
+			interrupt-controller;
+			interrupt-parent = <&intc>;
+			#interrupt-cells = <3>;
+			reg = <0x17800000 0x1000>,
+			      <0x17802000 0x1000>;
+		};
+
+		timer@17820000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x17820000 0x1000>;
+			clock-frequency = <19200000>;
+
+			frame@17821000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 7 0x4>,
+					     <GIC_SPI 6 0x4>;
+				reg = <0x17821000 0x1000>,
+				      <0x17822000 0x1000>;
+			};
+
+			frame@17823000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 8 0x4>;
+				reg = <0x17823000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17824000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 9 0x4>;
+				reg = <0x17824000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17825000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 10 0x4>;
+				reg = <0x17825000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17826000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 11 0x4>;
+				reg = <0x17826000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17827000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 12 0x4>;
+				reg = <0x17827000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17828000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 13 0x4>;
+				reg = <0x17828000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17829000 {
+				frame-number = <7>;
+				interrupts = <GIC_SPI 14 0x4>;
+				reg = <0x17829000 0x1000>;
+				status = "disabled";
+			};
+		};
+
+		apps_rsc: rsc@17840000 {
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x17830000 0x10000>, <0x17840000 0x10000>;
+			reg-names = "drv-0", "drv-1";
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <1>;
+			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   2>,
+					  <WAKE_TCS    2>, <CONTROL_TCS 1>;
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,sdx55-rpmh-clk";
+				#clock-cells = <1>;
+				clock-names = "xo";
+				clocks = <&xo_board>;
+			};
+		};
+	};
+};
-- 
2.25.1

