Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 879D91AD41F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 03:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgDQB3A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 21:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725858AbgDQB27 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 21:28:59 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8EAFC061A0C;
        Thu, 16 Apr 2020 18:28:57 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q19so321064ljp.9;
        Thu, 16 Apr 2020 18:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kegUU5VgkjtYREF8L3IaadE8MfOPhRXWgi4ROwBjgt0=;
        b=i3EnZsmT8zqHAOJZPfGcH23ykDWCWUYabeS40LevqCRUjZsn9esnSqZM5UZQRjk844
         ZJ4adEYYA9xEdIALUjk9oQ8JFgBEn1jOR1qd4wPVg2WF+YkCT8ZENonPgF1vy7/UrQ/Z
         6I9ScsM8Yk0VF9dAvRAfFvfFry16jZw1jo8KVDifajprwxNvg1HMXaVtqwk2jAnreSoh
         9ZyvWpvKqwtAsoXR7x45EoRAaazVirt8d1hzKyto3McOk7RJA4lACCQIfOIWUUUqjp/0
         Wu1Xfose1mA4XRtv+pONS98w/1vZHcKLD4k/+dgCasjPFO5D0yH8Wf23GsiYvFiupYfV
         cP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kegUU5VgkjtYREF8L3IaadE8MfOPhRXWgi4ROwBjgt0=;
        b=ic6yovKMWpMArd9XPWbPZU5V416cxuP1B9KyGQuCx5/fieHESO4XUmVJCk/IjHr0zu
         LVwaEYjJ4fbaYtn7lvVjvV1ukj+vxe+lLzcFnm03SW0mPMPh5jHs/kJRnnuKP36Gn9L/
         kZ0dNXqX5yor2vzSVAeaqktj9fJXKRRwYvAkmCByGb/55Cbky0HmLfcH8J68cvKlh7mp
         Lu12+XRiljFwZVfKN/Ytlj8tEkuG34+NjFzri2cTc/MSBgpDs1/MsaG2jKyxQAYrh4wO
         RxlT1xts4Zp9y/L+OkeC1mdlKV08JJsP4sloCP0apV6WQOushMz2uVRlCdH6H8UQbtaJ
         7AJw==
X-Gm-Message-State: AGi0PuaEmdELojV9QOAvMD5tyiiwV/3B1yPQhwJ9S2JfpOK6eq66Qt2F
        gNH11sxu/ACjoxySExv4yr0=
X-Google-Smtp-Source: APiQypJ60S7NBfzmnWrEMKfDVyZQG9TO35qmmIva1YpKJtkYKVGClhewWP8kIq/2l45QV6y4aW8vdw==
X-Received: by 2002:a2e:9bc4:: with SMTP id w4mr570263ljj.178.1587086936110;
        Thu, 16 Apr 2020 18:28:56 -0700 (PDT)
Received: from localhost.localdomain ([94.229.111.13])
        by smtp.gmail.com with ESMTPSA id w25sm14644650ljo.78.2020.04.16.18.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 18:28:55 -0700 (PDT)
From:   Alexey Minnekhanov <alexey.min@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        Alexey Minnekhanov <alexey.min@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: Add SDM660 SoC support
Date:   Fri, 17 Apr 2020 04:26:29 +0300
Message-Id: <20200417012630.222352-3-alexey.min@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200417012630.222352-1-alexey.min@gmail.com>
References: <20200417012630.222352-1-alexey.min@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Craig Tatlor <ctatlor97@gmail.com>

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
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 372 +++++++++++++++++++++++++++
 1 file changed, 372 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
new file mode 100644
index 000000000000..4abbdd03d1e7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -0,0 +1,372 @@
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
2.25.3

