Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104392C385F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 06:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgKYFMk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 00:12:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgKYFMk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 00:12:40 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8042FC061A4E
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 21:12:30 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id s63so1316591pgc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 21:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qIcnxeLhce95Uv+KhCLKMlfCMV9F3JHOyprf/Xcp1eo=;
        b=OE+OUcThsX+S59Ts7cwuO5lz+ygquatQiNlW9TLBDbGjvYuz+6AssrMBikDYoIBgse
         bLmmUGBgbfPKojEBCMeiQ+6t+1tTF93TK6F7Vg/laX7KoRC8wGJn18F0sHdlTEMzNROA
         NrccnAuiIxVRJ39sqh6nS7LFOmO7KUxkp/wivUfxGMVbblE9+tP44psjsPA3n48wrsNb
         KqcbzW1lsG900miSsd8rAnkmku8nFKsZXezbRG3HHLcQmozg0srljyJVEj15+kg7doSb
         QAqzI25JkJXhgjXY/tvH2G5NRvDt578LRzJQdNQexsiXGaiuQ/OMW09ydDCyuZHTF/KT
         94RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qIcnxeLhce95Uv+KhCLKMlfCMV9F3JHOyprf/Xcp1eo=;
        b=ItVZyQnRrC9bilZJsmGmWEN54rkM2rC99tPVlz02EiSfhFo1U9pW1aR5c0SwhnAaUY
         bXvPOer2+aNFWJUMbPSQjeF9dTgf/RmMK4+eewPTfO9ryzzhzfaQnWPBanaOi4W/gY7I
         pV8mRk97IndhOhrFxuRwQoRH//RMgqQhkf8RzcKl0K2LMrOcqMC5fKfH047iANorTX81
         vR+9m/qvb1a9j/pu0hJtpVp+RQn8Ry1tbF8ESc3SbJsVxylLupbjhjh+IZFnuiDhE9Yj
         kwUEa8C/Q85TemmCcXiUMrB8EIfNnVpuREj3XtQUcgX0hXxD8vpYYU04P8QI0DtDqNKc
         3fRw==
X-Gm-Message-State: AOAM531E/FV/fxYe5b8LMvaEZ4DWgqUE1V7iqb0ec9hkgjZ8KVzLuhhg
        IFVB1eCK1MyoJq5TFtf8Zf6yUrR4W/Tk
X-Google-Smtp-Source: ABdhPJxpoKQLU+SCdluZ51cnmwskxC1fgm/W0p10/LnUs77SfB5wu04uQ2m6cqAXr8M5+WIdnKh3vA==
X-Received: by 2002:aa7:85c4:0:b029:197:d9b9:cd47 with SMTP id z4-20020aa785c40000b0290197d9b9cd47mr1659596pfn.44.1606281149996;
        Tue, 24 Nov 2020 21:12:29 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id x30sm763612pgc.86.2020.11.24.21.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 21:12:29 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/2] ARM: dts: qcom: Add SDX55 platform and MTP board support
Date:   Wed, 25 Nov 2020 10:42:11 +0530
Message-Id: <20201125051211.8089-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125051211.8089-1-manivannan.sadhasivam@linaro.org>
References: <20201125051211.8089-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add basic devicetree support for SDX55 platform and MTP board from
Qualcomm. The SDX55 platform features an ARM Cortex A7 CPU which forms
the Application Processor Sub System (APSS) along with standard Qualcomm
peripherals like GCC, TLMM, BLSP, QPIC, and BAM etc... Also, there
exists the networking parts such as IPA, MHI, PCIE-EP, EMAC, and Modem
etc..

Currently, this basic devicetree support includes GCC, RPMh clock, INTC
and Debug UART.

Co-developed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/Makefile           |   3 +-
 arch/arm/boot/dts/qcom-sdx55-mtp.dts |  27 ++++
 arch/arm/boot/dts/qcom-sdx55.dtsi    | 201 +++++++++++++++++++++++++++
 3 files changed, 230 insertions(+), 1 deletion(-)
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
index 000000000000..262660e6dd11
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
+	compatible = "qcom,sdx55-mtp", "qcom,sdx55";
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
index 000000000000..fbe5d51c1120
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * SDX55 SoC device tree source
+ *
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020, Linaro Ltd.
+ */
+
+#include <dt-bindings/clock/qcom,gcc-sdx55.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
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
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <19200000>;
+	};
+};
-- 
2.25.1

