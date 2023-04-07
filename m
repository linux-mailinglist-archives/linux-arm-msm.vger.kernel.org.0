Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0776DB46B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 21:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbjDGTt1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 15:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbjDGTtT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 15:49:19 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985A7729F
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 12:49:13 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id l10-20020a05600c1d0a00b003f04bd3691eso10779010wms.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 12:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680896952; x=1683488952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKQe4CnQIUUyPfDyoZ5Ge7B8pr20uiVA+i+1jWCO9BI=;
        b=nHh370oNfFvW+RsZG1bOSVGWn62eFOnvuXzC5eJ5PRm4dXJh6DBwHfrbcp7S/BtsUh
         wXYU5tvOotrsrZpSer2Z92UGohoe9x+HrJR3esXKm0XtuN3xUrpfKgLW8xvsDlqIc/6W
         nwJDJDldm7wGeEyO43HNljDaU4Un3u11nBMmsP/FHlrRIRvUCWV/mdADDfspizARTWd0
         VYTMep0FXdySogRU/gJOg6iFzwPXDD5yVJhPVLf1o3G1bZLpXQ7WQXCUemqNX2Ht+zpX
         DsgbtdPJkdggjRaKcDXZcnif59IbLfmhQ8cOCx4RX9BTBdQ4Zf/pU7Eubp7OGW/VZWqp
         kXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680896952; x=1683488952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKQe4CnQIUUyPfDyoZ5Ge7B8pr20uiVA+i+1jWCO9BI=;
        b=p+7/7QxEwQ3V6I7gNL2wVWCuVjO3R43VdSwm3dEjm0TI/2F2xIbyHMkRFJVsUkx59t
         aupZeG5ySln7YtSnx6MJAdirIu//u5PME2ifbdHmFvMRhEuOIAsYYRdzZj8JavS9FfFQ
         e6Usg7jqdwewe4fdQSj5Pz3njJ/gdTbZY30Y2oM6cbfZ3w9kozLja9dNh93P2DB6sgLj
         cfZK7vHNa82nsRYjFwfOUi4SM/UfrMXb0Tuw7VYL3PfO6gLi5CWp5pywD4lAzlTOpbzq
         uJiCgsS18wL9K3atFfbjXPj+pxJu68A+aONHmOsKJRW8YX5odCaBGMSj3J9ZZ6+7gb4z
         dTRw==
X-Gm-Message-State: AAQBX9cf33tmQR8SK4ZnlT+4CqU4WabwioUQiw/HlWezE0/P5TeLEHwJ
        mlbhqtJwAxID7Smy1/o2KrH58A==
X-Google-Smtp-Source: AKy350YP/OJcPPfSyxNNBFZ346e4jh0GY9eUkJUyOEW9Y0ix0RUEu8Bi/hjKpJFHnRXWmsnXcoj7eA==
X-Received: by 2002:a1c:f30e:0:b0:3eb:2b88:a69a with SMTP id q14-20020a1cf30e000000b003eb2b88a69amr1858370wmq.14.1680896951733;
        Fri, 07 Apr 2023 12:49:11 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r15-20020a05600c458f00b003f03d483966sm9429551wmo.44.2023.04.07.12.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 12:49:11 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        djakov@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, benl@squareup.com,
        shawn.guo@linaro.org, fabien.parent@linaro.org, leo.yan@linaro.org,
        dmitry.baryshkov@linaro.org, stephan@gerhold.net,
        Jun Nie <jun.nie@linaro.org>,
        James Willcox <jwillcox@squareup.com>,
        Joseph Gates <jgates@squareup.com>,
        Max Chen <mchen@squareup.com>, Zac Crosby <zac@squareup.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>
Subject: [PATCH v9 2/5] arm64: dts: qcom: Add msm8939 SoC
Date:   Fri,  7 Apr 2023 20:49:02 +0100
Message-Id: <20230407194905.611461-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407194905.611461-1-bryan.odonoghue@linaro.org>
References: <20230407194905.611461-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add msm8939 a derivative SoC of msm8916. This SoC contains a number of key
differences to msm8916.

- big.LITTLE Octa Core - quad 1.5GHz + quad 1.0GHz
- DRAM 1x800 LPDDR3
- Camera 4+4 lane CSI
- Venus @ 1080p60 HEVC
- DSI x 2
- Adreno A405
- WiFi wcn3660/wcn3680b 802.11ac

Co-developed-by: Shawn Guo <shawn.guo@linaro.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Co-developed-by: Jun Nie <jun.nie@linaro.org>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Co-developed-by: Benjamin Li <benl@squareup.com>
Signed-off-by: Benjamin Li <benl@squareup.com>
Co-developed-by: James Willcox <jwillcox@squareup.com>
Signed-off-by: James Willcox <jwillcox@squareup.com>
Co-developed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
Co-developed-by: Joseph Gates <jgates@squareup.com>
Signed-off-by: Joseph Gates <jgates@squareup.com>
Co-developed-by: Max Chen <mchen@squareup.com>
Signed-off-by: Max Chen <mchen@squareup.com>
Co-developed-by: Zac Crosby <zac@squareup.com>
Signed-off-by: Zac Crosby <zac@squareup.com>
Co-developed-by: Vincent Knecht <vincent.knecht@mailoo.org>
Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
Co-developed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 2452 +++++++++++++++++++++++++
 1 file changed, 2452 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
new file mode 100644
index 0000000000000..778d24c8aee52
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -0,0 +1,2452 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020-2023, Linaro Limited
+ */
+
+#include <dt-bindings/clock/qcom,gcc-msm8939.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/interconnect/qcom,msm8939.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/reset/qcom,gcc-msm8939.h>
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	/*
+	 * Stock LK wants address-cells/size-cells = 2
+	 * A number of our drivers want address/size cells = 1
+	 * hence the disparity between top-level and /soc below.
+	 */
+	#address-cells = <2>;
+	#size-cells = <2>;
+
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
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		CPU0: cpu@100 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			reg = <0x100>;
+			next-level-cache = <&L2_1>;
+			qcom,acc = <&acc0>;
+			qcom,saw = <&saw0>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&apcs1_mbox>;
+			#cooling-cells = <2>;
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+			};
+		};
+
+		CPU1: cpu@101 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			reg = <0x101>;
+			next-level-cache = <&L2_1>;
+			qcom,acc = <&acc1>;
+			qcom,saw = <&saw1>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&apcs1_mbox>;
+			#cooling-cells = <2>;
+		};
+
+		CPU2: cpu@102 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			reg = <0x102>;
+			next-level-cache = <&L2_1>;
+			qcom,acc = <&acc2>;
+			qcom,saw = <&saw2>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&apcs1_mbox>;
+			#cooling-cells = <2>;
+		};
+
+		CPU3: cpu@103 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			reg = <0x103>;
+			next-level-cache = <&L2_1>;
+			qcom,acc = <&acc3>;
+			qcom,saw = <&saw3>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&apcs1_mbox>;
+			#cooling-cells = <2>;
+		};
+
+		CPU4: cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			reg = <0x0>;
+			qcom,acc = <&acc4>;
+			qcom,saw = <&saw4>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&apcs0_mbox>;
+			#cooling-cells = <2>;
+			next-level-cache = <&L2_0>;
+			L2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+			};
+		};
+
+		CPU5: cpu@1 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			reg = <0x1>;
+			next-level-cache = <&L2_0>;
+			qcom,acc = <&acc5>;
+			qcom,saw = <&saw5>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&apcs0_mbox>;
+			#cooling-cells = <2>;
+		};
+
+		CPU6: cpu@2 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			reg = <0x2>;
+			next-level-cache = <&L2_0>;
+			qcom,acc = <&acc6>;
+			qcom,saw = <&saw6>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&apcs0_mbox>;
+			#cooling-cells = <2>;
+		};
+
+		CPU7: cpu@3 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			reg = <0x3>;
+			next-level-cache = <&L2_0>;
+			qcom,acc = <&acc7>;
+			qcom,saw = <&saw7>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&apcs0_mbox>;
+			#cooling-cells = <2>;
+		};
+
+		idle-states {
+			CPU_SLEEP_0: cpu-sleep-0 {
+				compatible ="qcom,idle-state-spc", "arm,idle-state";
+				entry-latency-us = <130>;
+				exit-latency-us = <150>;
+				min-residency-us = <2000>;
+				local-timer-stop;
+			};
+		};
+	};
+
+	/*
+	 * MSM8939 has a big.LITTLE heterogeneous computing architecture,
+	 * consisting of two clusters of four ARM Cortex-A53s each. The
+	 * LITTLE cluster runs at 1.0-1.2GHz, and the big cluster runs
+	 * at 1.5-1.7GHz.
+	 *
+	 * The enable method used here is spin-table which presupposes use
+	 * of a 2nd stage boot shim such as lk2nd to have installed a
+	 * spin-table, the downstream non-psci/non-spin-table method that
+	 * default msm8916/msm8936/msm8939 will not be supported upstream.
+	 */
+	cpu-map {
+		/* LITTLE (efficiency) cluster */
+		cluster0 {
+			core0 {
+				cpu = <&CPU4>;
+			};
+
+			core1 {
+				cpu = <&CPU5>;
+			};
+
+			core2 {
+				cpu = <&CPU6>;
+			};
+
+			core3 {
+				cpu = <&CPU7>;
+			};
+		};
+
+		/* big (performance) cluster */
+		/* Boot CPU is cluster 1 core 0 */
+		cluster1 {
+			core0 {
+				cpu = <&CPU0>;
+			};
+
+			core1 {
+				cpu = <&CPU1>;
+			};
+
+			core2 {
+				cpu = <&CPU2>;
+			};
+
+			core3 {
+				cpu = <&CPU3>;
+			};
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
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		tz-apps@86000000 {
+			reg = <0x0 0x86000000 0x0 0x300000>;
+			no-map;
+		};
+
+		smem@86300000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x86300000 0x0 0x100000>;
+			no-map;
+
+			hwlocks = <&tcsr_mutex 3>;
+			qcom,rpm-msg-ram = <&rpm_msg_ram>;
+		};
+
+		hypervisor@86400000 {
+			reg = <0x0 0x86400000 0x0 0x100000>;
+			no-map;
+		};
+
+		tz@86500000 {
+			reg = <0x0 0x86500000 0x0 0x180000>;
+			no-map;
+		};
+
+		reserved@86680000 {
+			reg = <0x0 0x86680000 0x0 0x80000>;
+			no-map;
+		};
+
+		rmtfs@86700000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0x86700000 0x0 0xe0000>;
+			no-map;
+
+			qcom,client-id = <1>;
+		};
+
+		rfsa@867e0000 {
+			reg = <0x0 0x867e0000 0x0 0x20000>;
+			no-map;
+		};
+
+		mpss_mem: mpss@86800000 {
+			reg = <0x0 0x86800000 0x0 0x5500000>;
+			no-map;
+		};
+
+		wcnss_mem: wcnss@8bd00000 {
+			reg = <0x0 0x8bd00000 0x0 0x600000>;
+			no-map;
+		};
+
+		venus_mem: venus@8c300000 {
+			reg = <0x0 0x8c300000 0x0 0x800000>;
+			no-map;
+		};
+
+		mba_mem: mba@8cb00000 {
+			reg = <0x0 0x8cb00000 0x0 0x100000>;
+			no-map;
+		};
+	};
+
+	smd {
+		compatible = "qcom,smd";
+
+		rpm {
+			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+			qcom,ipc = <&apcs1_mbox 8 0>;
+			qcom,smd-edge = <15>;
+
+			rpm_requests: rpm-requests {
+				compatible = "qcom,rpm-msm8936";
+				qcom,smd-channels = "rpm_requests";
+
+				rpmcc: clock-controller {
+					compatible = "qcom,rpmcc-msm8936", "qcom,rpmcc";
+					#clock-cells = <1>;
+					clock-names = "xo";
+					clocks = <&xo_board>;
+				};
+
+				rpmpd: power-controller {
+					compatible = "qcom,msm8939-rpmpd";
+					#power-domain-cells = <1>;
+					operating-points-v2 = <&rpmpd_opp_table>;
+
+					rpmpd_opp_table: opp-table {
+						compatible = "operating-points-v2";
+
+						rpmpd_opp_ret: opp1 {
+							opp-level = <1>;
+						};
+
+						rpmpd_opp_svs_krait: opp2 {
+							opp-level = <2>;
+						};
+
+						rpmpd_opp_svs_soc: opp3 {
+							opp-level = <3>;
+						};
+
+						rpmpd_opp_nom: opp4 {
+							opp-level = <4>;
+						};
+
+						rpmpd_opp_turbo: opp5 {
+							opp-level = <5>;
+						};
+
+						rpmpd_opp_super_turbo: opp6 {
+							opp-level = <6>;
+						};
+					};
+				};
+			};
+		};
+	};
+
+	smp2p-hexagon {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs1_mbox 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		hexagon_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+
+			#qcom,smem-state-cells = <1>;
+		};
+
+		hexagon_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			#size-cells = <0>;
+		};
+	};
+
+	smp2p-wcnss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <451>, <431>;
+
+		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs1_mbox 18>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <4>;
+
+		wcnss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		wcnss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+
+			#qcom,smem-state-cells = <1>;
+		};
+	};
+
+	smsm {
+		compatible = "qcom,smsm";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		qcom,ipc-1 = <&apcs1_mbox 8 13>;
+		qcom,ipc-3 = <&apcs1_mbox 8 19>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+
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
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0xffffffff>;
+
+		rng@22000 {
+			compatible = "qcom,prng";
+			reg = <0x00022000 0x200>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
+		qfprom: qfprom@5c000 {
+			compatible = "qcom,msm8916-qfprom", "qcom,qfprom";
+			reg = <0x0005c000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			tsens_base1: base1@a0 {
+				reg = <0xa0 0x1>;
+				bits = <0 8>;
+			};
+
+			tsens_s6_p1: s6-p1@a1 {
+				reg = <0xa1 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_s6_p2: s6-p2@a1 {
+				reg = <0xa1 0x2>;
+				bits = <6 6>;
+			};
+
+			tsens_s7_p1: s7-p1@a2 {
+				reg = <0xa2 0x2>;
+				bits = <4 6>;
+			};
+
+			tsens_s7_p2: s7-p2@a3 {
+				reg = <0xa3 0x1>;
+				bits = <2 6>;
+			};
+
+			tsens_s8_p1: s8-p1@a4 {
+				reg = <0xa4 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_s8_p2: s8-p2@a4 {
+				reg = <0xa4 0x2>;
+				bits = <6 6>;
+			};
+
+			tsens_s9_p1: s9-p1@a5 {
+				reg = <0xa5 0x2>;
+				bits = <4 6>;
+			};
+
+			tsens_s9_p2: s9-p2@a6 {
+				reg = <0xa6 0x1>;
+				bits = <2 6>;
+			};
+
+			tsens_base2: base2@a7 {
+				reg = <0xa7 0x1>;
+				bits = <0 8>;
+			};
+
+			tsens_mode: mode@d0 {
+				reg = <0xd0 0x1>;
+				bits = <0 3>;
+			};
+
+			tsens_s0_p1: s0-p1@d0 {
+				reg = <0xd0 0x2>;
+				bits = <3 6>;
+			};
+
+			tsens_s0_p2: s0-p1@d1 {
+				reg = <0xd1 0x1>;
+				bits = <1 6>;
+			};
+
+			tsens_s1_p1: s1-p1@d1 {
+				reg = <0xd1 0x2>;
+				bits = <7 6>;
+			};
+
+			tsens_s1_p2: s1-p2@d2 {
+				reg = <0xd2 0x2>;
+				bits = <5 6>;
+			};
+
+			tsens_s2_p1: s2-p1@d3 {
+				reg = <0xd3 0x2>;
+				bits = <3 6>;
+			};
+
+			tsens_s2_p2: s2-p2@d4 {
+				reg = <0xd4 0x1>;
+				bits = <1 6>;
+			};
+
+			tsens_s3_p1: s3-p1@d4 {
+				reg = <0xd4 0x2>;
+				bits = <7 6>;
+			};
+
+			tsens_s3_p2: s3-p2@d5 {
+				reg = <0xd5 0x2>;
+				bits = <5 6>;
+			};
+
+			tsens_s5_p1: s5-p1@d6 {
+				reg = <0xd6 0x2>;
+				bits = <3 6>;
+			};
+
+			tsens_s5_p2: s5-p2@d7 {
+				reg = <0xd7 0x1>;
+				bits = <1 6>;
+			};
+		};
+
+		rpm_msg_ram: sram@60000 {
+			compatible = "qcom,rpm-msg-ram";
+			reg = <0x00060000 0x8000>;
+		};
+
+		bimc: interconnect@400000 {
+			compatible = "qcom,msm8939-bimc";
+			reg = <0x00400000 0x62000>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
+				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
+			#interconnect-cells = <1>;
+		};
+
+		tsens: thermal-sensor@4a9000 {
+			compatible = "qcom,msm8939-tsens", "qcom,tsens-v0_1";
+			reg = <0x004a9000 0x1000>, /* TM */
+			      <0x004a8000 0x1000>; /* SROT */
+			nvmem-cells = <&tsens_mode>,
+				      <&tsens_base1>, <&tsens_base2>,
+				      <&tsens_s0_p1>, <&tsens_s0_p2>,
+				      <&tsens_s1_p1>, <&tsens_s1_p2>,
+				      <&tsens_s2_p1>, <&tsens_s2_p2>,
+				      <&tsens_s3_p1>, <&tsens_s3_p2>,
+				      <&tsens_s5_p1>, <&tsens_s5_p2>,
+				      <&tsens_s6_p1>, <&tsens_s6_p2>,
+				      <&tsens_s7_p1>, <&tsens_s7_p2>,
+				      <&tsens_s8_p1>, <&tsens_s8_p2>,
+				      <&tsens_s9_p1>, <&tsens_s9_p2>;
+			nvmem-cell-names = "mode",
+					   "base1", "base2",
+					   "s0_p1", "s0_p2",
+					   "s1_p1", "s1_p2",
+					   "s2_p1", "s2_p2",
+					   "s3_p1", "s3_p2",
+					   "s5_p1", "s5_p2",
+					   "s6_p1", "s6_p2",
+					   "s7_p1", "s7_p2",
+					   "s8_p1", "s8_p2",
+					   "s9_p1", "s9_p2";
+			#qcom,sensors = <9>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
+			#thermal-sensor-cells = <1>;
+		};
+
+		restart@4ab000 {
+			compatible = "qcom,pshold";
+			reg = <0x004ab000 0x4>;
+		};
+
+		pcnoc: interconnect@500000 {
+			compatible = "qcom,msm8939-pcnoc";
+			reg = <0x00500000 0x11000>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_PCNOC_CLK>,
+				 <&rpmcc RPM_SMD_PCNOC_A_CLK>;
+			#interconnect-cells = <1>;
+		};
+
+		snoc: interconnect@580000 {
+			compatible = "qcom,msm8939-snoc";
+			reg = <0x00580000 0x14080>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
+				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
+			#interconnect-cells = <1>;
+
+			snoc_mm: interconnect-snoc {
+				compatible = "qcom,msm8939-snoc-mm";
+				clock-names = "bus", "bus_a";
+				clocks = <&rpmcc RPM_SMD_SYSMMNOC_CLK>,
+					 <&rpmcc RPM_SMD_SYSMMNOC_A_CLK>;
+				#interconnect-cells = <1>;
+			};
+		};
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,msm8916-pinctrl";
+			reg = <0x01000000 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 122>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			blsp1_uart1_default: blsp1-uart1-default-state {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3";
+				function = "blsp_uart1";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			blsp1_uart1_sleep: blsp1-uart1-sleep-state {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			blsp1_uart2_default: blsp1-uart2-default-state {
+				pins = "gpio4", "gpio5";
+				function = "blsp_uart2";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			blsp1_uart2_sleep: blsp1-uart2-sleep-state {
+				pins = "gpio4", "gpio5";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			camera_front_default: camera-front-default-state {
+				pwdn-pins {
+					pins = "gpio33";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				rst-pins {
+					pins = "gpio28";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				mclk1-pins {
+					pins = "gpio27";
+					function = "cam_mclk1";
+					drive-strength = <16>;
+					bias-disable;
+				};
+			};
+
+			camera_rear_default: camera-rear-default-state {
+				pwdn-pins {
+					pins = "gpio34";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				rst-pins {
+					pins = "gpio35";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				mclk0-pins {
+					pins = "gpio26";
+					function = "cam_mclk0";
+					drive-strength = <16>;
+					bias-disable;
+				};
+			};
+
+			cci0_default: cci0-default-state {
+				pins = "gpio29", "gpio30";
+				function = "cci_i2c";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			cdc_pdm_lines_default: pdm-lines-default-state {
+				pins = "gpio63", "gpio64", "gpio65", "gpio66",
+				       "gpio67", "gpio68";
+				function = "cdc_pdm0";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
+			cdc_pdm_lines_sleep: pdm-lines-suspend-state {
+				pins = "gpio63", "gpio64", "gpio65", "gpio66",
+				       "gpio67", "gpio68";
+				function = "cdc_pdm0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cdc_dmic_lines_act: cdc-dmic-lines-on-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "dmic0_clk";
+					drive-strength = <8>;
+				};
+
+				data-pins {
+					pins = "gpio1";
+					function = "dmic0_data";
+					drive-strength = <8>;
+				};
+			};
+
+			cdc_dmic_lines_sus: cdc-dmic-lines-off-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "dmic0_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1";
+					function = "dmic0_data";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			ext-mclk-tlmm-lines-state {
+				ext_mclk_tlmm_lines_act: mclk-lines-on-pins {
+					pins = "gpio116";
+					function = "pri_mi2s";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ext_mclk_tlmm_lines_sus: mclk-lines-off-pins {
+					pins = "gpio116";
+					function = "pri_mi2s";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			ext-pri-tlmm-lines-state {
+				ext_pri_tlmm_lines_act: ext-pa-on-pins {
+					pins = "gpio113", "gpio114", "gpio115", "gpio116";
+					function = "pri_mi2s";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ext_pri_tlmm_lines_sus: ext-pa-off-pins {
+					pins = "gpio113", "gpio114", "gpio115", "gpio116";
+					function = "pri_mi2s";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			ext-pri-ws-line-state {
+				ext_pri_ws_act: ext-pa-on-pins {
+					pins = "gpio110";
+					function = "pri_mi2s_ws";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ext_pri_ws_sus: ext-pa-off-pins {
+					pins = "gpio110";
+					function = "pri_mi2s_ws";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			/* secondary Mi2S */
+			ext-sec-tlmm-lines-state {
+				ext_sec_tlmm_lines_act: tlmm-lines-on-pins {
+					pins = "gpio112", "gpio117", "gpio118", "gpio119";
+					function = "sec_mi2s";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ext_sec_tlmm_lines_sus: tlmm-lines-off-pins {
+					pins = "gpio112", "gpio117", "gpio118", "gpio119";
+					function = "sec_mi2s";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			i2c1_default: i2c1-default-state {
+				pins = "gpio2", "gpio3";
+				function = "blsp_i2c1";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c1_sleep: i2c1-sleep-state {
+				pins = "gpio2", "gpio3";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c2_default: i2c2-default-state {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c2_sleep: i2c2-sleep-state {
+				pins = "gpio6", "gpio7";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c3_default: i2c3-default-state {
+				pins = "gpio10", "gpio11";
+				function = "blsp_i2c3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c3_sleep: i2c3-sleep-state {
+				pins = "gpio10", "gpio11";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c4_default: i2c4-default-state {
+				pins = "gpio14", "gpio15";
+				function = "blsp_i2c4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c4_sleep: i2c4-sleep-state {
+				pins = "gpio14", "gpio15";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c5_default: i2c5-default-state {
+				pins = "gpio18", "gpio19";
+				function = "blsp_i2c5";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c5_sleep: i2c5-sleep-state {
+				pins = "gpio18", "gpio19";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c6_default: i2c6-default-state {
+				pins = "gpio22", "gpio23";
+				function = "blsp_i2c6";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c6_sleep: i2c6-sleep-state {
+				pins = "gpio22", "gpio23";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			sdc1_default_state: sdc1-default-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+			};
+
+			sdc1_sleep_state: sdc1-sleep-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			sdc2_default_state: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				cd-pins {
+					pins = "gpio38";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep_state: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				cd-pins {
+					pins = "gpio38";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			spi1_default: spi1-default-state {
+				spi-pins {
+					pins = "gpio0", "gpio1", "gpio3";
+					function = "blsp_spi1";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cs-pins {
+					pins = "gpio2";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			spi1_sleep: spi1-sleep-state {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			spi2_default: spi2-default-state {
+				spi-pins {
+					pins = "gpio4", "gpio5", "gpio7";
+					function = "blsp_spi2";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cs-pins {
+					pins = "gpio6";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			spi2_sleep: spi2-sleep-state {
+				pins = "gpio4", "gpio5", "gpio6", "gpio7";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			spi3_default: spi3-default-state {
+				spi-pins {
+					pins = "gpio8", "gpio9", "gpio11";
+					function = "blsp_spi3";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cs-pins {
+					pins = "gpio10";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			spi3_sleep: spi3-sleep-state {
+				pins = "gpio8", "gpio9", "gpio10", "gpio11";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			spi4_default: spi4-default-state {
+				spi-pins {
+					pins = "gpio12", "gpio13", "gpio15";
+					function = "blsp_spi4";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cs-pins {
+					pins = "gpio14";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			spi4_sleep: spi4-sleep-state {
+				pins = "gpio12", "gpio13", "gpio14", "gpio15";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			spi5_default: spi5-default-state {
+				spi-pins {
+					pins = "gpio16", "gpio17", "gpio19";
+					function = "blsp_spi5";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cs-pins {
+					pins = "gpio18";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			spi5_sleep: spi5-sleep-state {
+				pins = "gpio16", "gpio17", "gpio18", "gpio19";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			spi6_default: spi6-default-state {
+				spi-pins {
+					pins = "gpio20", "gpio21", "gpio23";
+					function = "blsp_spi6";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cs-pins {
+					pins = "gpio22";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			spi6_sleep: spi6-sleep-state {
+				pins = "gpio20", "gpio21", "gpio22", "gpio23";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			wcnss_pin_a: wcnss-active-state {
+				pins = "gpio40", "gpio41", "gpio42", "gpio43", "gpio44";
+				function = "wcss_wlan";
+				drive-strength = <6>;
+				bias-pull-up;
+			};
+		};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,gcc-msm8939";
+			reg = <0x01800000 0x80000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <&dsi_phy0 1>,
+				 <&dsi_phy0 0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "xo",
+				      "sleep_clk",
+				      "dsi0pll",
+				      "dsi0pllbyte",
+				      "ext_mclk",
+				      "ext_pri_i2s",
+				      "ext_sec_i2s";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
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
+		mdss: display-subsystem@1a00000 {
+			compatible = "qcom,mdss";
+			reg = <0x01a00000 0x1000>,
+			      <0x01ac8000 0x3000>;
+			reg-names = "mdss_phys", "vbif_phys";
+
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "vsync";
+
+			power-domains = <&gcc MDSS_GDSC>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#interrupt-cells = <1>;
+			ranges;
+
+			status = "disabled";
+
+			mdp: display-controller@1a01000 {
+				compatible = "qcom,mdp5";
+				reg = <0x01a01000 0x89000>;
+				reg-names = "mdp_phys";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_VSYNC_CLK>;
+				clock-names = "iface",
+					      "bus",
+					      "core",
+					      "vsync";
+
+				iommus = <&apps_iommu 4>;
+
+				interconnects = <&snoc_mm MASTER_MDP_PORT0 &bimc SLAVE_EBI_CH0>,
+						<&snoc_mm MASTER_MDP_PORT1 &bimc SLAVE_EBI_CH0>;
+				interconnect-names = "mdp0-mem", "mdp1-mem";
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
+			dsi0: dsi@1a98000 {
+				compatible = "qcom,msm8916-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0x01a98000 0x25c>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
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
+				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
+						  <&gcc PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy0 0>,
+							 <&dsi_phy0 1>;
+
+				phys = <&dsi_phy0>;
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
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
+			dsi_phy0: phy@1a98300 {
+				compatible = "qcom,dsi-phy-28nm-lp";
+				reg = <0x01a98300 0xd4>,
+				      <0x01a98500 0x280>,
+				      <0x01a98780 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface", "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
+			dsi1: dsi@1aa0000 {
+				compatible = "qcom,msm8916-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0x01aa0000 0x25c>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <5>;
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
+				assigned-clocks = <&gcc BYTE1_CLK_SRC>,
+						  <&gcc PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy0 0>,
+							 <&dsi_phy0 1>;
+				phys = <&dsi_phy1>;
+				status = "disabled";
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
+			dsi_phy1: phy@1aa0300 {
+				compatible = "qcom,dsi-phy-28nm-lp";
+				reg = <0x01aa0300 0xd4>,
+				      <0x01aa0500 0x280>,
+				      <0x01aa0780 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface", "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		gpu@1c00000 {
+			compatible = "qcom,adreno-405.0", "qcom,adreno";
+			reg = <0x01c00000 0x10000>;
+			reg-names = "kgsl_3d0_reg_memory";
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "kgsl_3d0_irq";
+			clock-names = "core",
+				      "iface",
+				      "mem",
+				      "mem_iface",
+				      "alt_mem_iface",
+				      "gfx3d",
+				      "rbbmtimer";
+			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
+				 <&gcc GCC_OXILI_AHB_CLK>,
+				 <&gcc GCC_OXILI_GMEM_CLK>,
+				 <&gcc GCC_BIMC_GFX_CLK>,
+				 <&gcc GCC_BIMC_GPU_CLK>,
+				 <&gcc GFX3D_CLK_SRC>,
+				 <&gcc GCC_OXILI_TIMER_CLK>;
+			power-domains = <&gcc OXILI_GDSC>;
+			operating-points-v2 = <&opp_table>;
+			iommus = <&gpu_iommu 1>, <&gpu_iommu 2>;
+
+			opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-550000000 {
+					opp-hz = /bits/ 64 <550000000>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+				};
+
+				opp-220000000 {
+					opp-hz = /bits/ 64 <220000000>;
+				};
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+				};
+			};
+		};
+
+		apps_iommu: iommu@1ef0000 {
+			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
+			reg = <0x01ef0000 0x3000>;
+			ranges = <0 0x01e20000 0x40000>;
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_APSS_TCU_CLK>;
+			clock-names = "iface", "bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			qcom,iommu-secure-id = <17>;
+
+			/* mdp_0: */
+			iommu-ctx@4000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x4000 0x1000>;
+				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* venus_ns: */
+			iommu-ctx@5000 {
+				compatible = "qcom,msm-iommu-v1-sec";
+				reg = <0x5000 0x1000>;
+				interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpu_iommu: iommu@1f08000 {
+			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
+			ranges = <0 0x1f08000 0x10000>;
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_GFX_TCU_CLK>,
+				 <&gcc GCC_GFX_TBU_CLK>;
+			clock-names = "iface", "bus", "tbu";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			qcom,iommu-secure-id = <18>;
+
+			/* gfx3d_user: */
+			iommu-ctx@1000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x1000 0x1000>;
+				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* gfx3d_priv: */
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
+			compatible = "qcom,msm8916-mss-pil";
+			reg = <0x04080000 0x100>, <0x04020000 0x040>;
+			reg-names = "qdsp6", "rmb";
+			interrupts-extended = <&intc GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
+					      <&hexagon_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&hexagon_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&hexagon_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&hexagon_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
+				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface",
+				      "bus",
+				      "mem",
+				      "xo";
+			power-domains = <&rpmpd MSM8939_VDDMDCX>,
+					<&rpmpd MSM8939_VDDMX>;
+			power-domain-names = "cx", "mx";
+			qcom,smem-states = <&hexagon_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+			resets = <&scm 0>;
+			reset-names = "mss_restart";
+			qcom,halt-regs = <&tcsr 0x18000 0x19000 0x1a000>;
+			status = "disabled";
+
+			mba {
+				memory-region = <&mba_mem>;
+			};
+
+			mpss {
+				memory-region = <&mpss_mem>;
+			};
+
+			smd-edge {
+				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
+
+				qcom,smd-edge = <0>;
+				mboxes = <&apcs1_mbox 12>;
+				qcom,remote-pid = <1>;
+
+				label = "hexagon";
+			};
+		};
+
+		sound: sound@7702000 {
+			compatible = "qcom,apq8016-sbc-sndcard";
+			reg = <0x07702000 0x4>,
+			      <0x07702004 0x4>;
+			reg-names = "mic-iomux", "spkr-iomux";
+			status = "disabled";
+		};
+
+		lpass: audio-controller@7708000 {
+			compatible = "qcom,apq8016-lpass-cpu";
+			reg = <0x07708000 0x10000>;
+			reg-names = "lpass-lpaif";
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "lpass-irq-lpaif";
+			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
+				 <&gcc GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK>,
+				 <&gcc GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK>,
+				 <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
+				 <&gcc GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK>,
+				 <&gcc GCC_ULTAUDIO_PCNOC_MPORT_CLK>,
+				 <&gcc GCC_ULTAUDIO_PCNOC_SWAY_CLK>;
+			clock-names = "ahbix-clk",
+				      "mi2s-bit-clk0",
+				      "mi2s-bit-clk1",
+				      "mi2s-bit-clk2",
+				      "mi2s-bit-clk3",
+				      "pcnoc-mport-clk",
+				      "pcnoc-sway-clk";
+			#sound-dai-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		lpass_codec: audio-codec@771c000 {
+			compatible = "qcom,msm8916-wcd-digital-codec";
+			reg = <0x0771c000 0x400>;
+			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
+				 <&gcc GCC_CODEC_DIGCODEC_CLK>;
+			clock-names = "ahbix-clk", "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		sdhc_1: mmc@7824900 {
+			compatible = "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4";
+			reg = <0x07824900 0x11c>, <0x07824000 0x800>;
+			reg-names = "hc", "core";
+
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface", "core", "xo";
+			resets = <&gcc GCC_SDCC1_BCR>;
+			mmc-ddr-1_8v;
+			bus-width = <8>;
+			non-removable;
+			status = "disabled";
+		};
+
+		sdhc_2: mmc@7864900 {
+			compatible = "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4";
+			reg = <0x07864900 0x11c>, <0x07864000 0x800>;
+			reg-names = "hc", "core";
+
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names =  "iface", "core", "xo";
+			resets = <&gcc GCC_SDCC2_BCR>;
+			bus-width = <4>;
+			status = "disabled";
+		};
+
+		blsp_dma: dma-controller@7884000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07884000 0x23000>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+		};
+
+		blsp1_uart1: serial@78af000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078af000 0x200>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 0>, <&blsp_dma 1>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&blsp1_uart1_default>;
+			pinctrl-1 = <&blsp1_uart1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+		};
+
+		blsp1_uart2: serial@78b0000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078b0000 0x200>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 2>, <&blsp_dma 3>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&blsp1_uart2_default>;
+			pinctrl-1 = <&blsp1_uart2_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+		};
+
+		blsp_i2c1: i2c@78b5000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b5000 0x500>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 4>, <&blsp_dma 5>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&i2c1_default>;
+			pinctrl-1 = <&i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_spi1: spi@78b5000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b5000 0x500>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 4>, <&blsp_dma 5>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&spi1_default>;
+			pinctrl-1 = <&spi1_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c2: i2c@78b6000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b6000 0x500>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names =  "core", "iface";
+			dmas = <&blsp_dma 6>, <&blsp_dma 7>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&i2c2_default>;
+			pinctrl-1 = <&i2c2_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_spi2: spi@78b6000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b6000 0x500>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 6>, <&blsp_dma 7>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&spi2_default>;
+			pinctrl-1 = <&spi2_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c3: i2c@78b7000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b7000 0x500>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names =  "core", "iface";
+			dmas = <&blsp_dma 8>, <&blsp_dma 9>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&i2c3_default>;
+			pinctrl-1 = <&i2c3_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_spi3: spi@78b7000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b7000 0x500>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 8>, <&blsp_dma 9>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&spi3_default>;
+			pinctrl-1 = <&spi3_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c4: i2c@78b8000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b8000 0x500>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names =  "core", "iface";
+			dmas = <&blsp_dma 10>, <&blsp_dma 11>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&i2c4_default>;
+			pinctrl-1 = <&i2c4_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_spi4: spi@78b8000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b8000 0x500>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP4_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 10>, <&blsp_dma 11>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&spi4_default>;
+			pinctrl-1 = <&spi4_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c5: i2c@78b9000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b9000 0x500>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names =  "core", "iface";
+			dmas = <&blsp_dma 12>, <&blsp_dma 13>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&i2c5_default>;
+			pinctrl-1 = <&i2c5_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_spi5: spi@78b9000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b9000 0x500>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP5_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 12>, <&blsp_dma 13>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&spi5_default>;
+			pinctrl-1 = <&spi5_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c6: i2c@78ba000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078ba000 0x500>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names =  "core", "iface";
+			dmas = <&blsp_dma 14>, <&blsp_dma 15>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&i2c6_default>;
+			pinctrl-1 = <&i2c6_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_spi6: spi@78ba000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078ba000 0x500>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP6_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 14>, <&blsp_dma 15>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&spi6_default>;
+			pinctrl-1 = <&spi6_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
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
+			#reset-cells = <1>;
+			phy_type = "ulpi";
+			dr_mode = "otg";
+			adp-disable;
+			hnp-disable;
+			srp-disable;
+			ahb-burst-config = <0>;
+			phy-names = "usb-phy";
+			phys = <&usb_hs_phy>;
+			status = "disabled";
+
+			ulpi {
+				usb_hs_phy: phy {
+					compatible = "qcom,usb-hs-phy-msm8916",
+						     "qcom,usb-hs-phy";
+					clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+						 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
+					clock-names = "ref", "sleep";
+					resets = <&gcc GCC_USB2A_PHY_BCR>, <&usb 0>;
+					reset-names = "phy", "por";
+					#phy-cells = <0>;
+					qcom,init-seq = /bits/ 8 <0x0 0x44>,
+								 <0x1 0x6b>,
+								 <0x2 0x24>,
+								 <0x3 0x13>;
+				};
+			};
+		};
+
+		wcnss: remoteproc@a204000 {
+			compatible = "qcom,pronto-v2-pil", "qcom,pronto";
+			interrupts-extended = <&intc GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+			reg = <0x0a204000 0x2000>,
+			      <0x0a202000 0x1000>,
+			      <0x0a21b000 0x3000>;
+			reg-names = "ccu", "dxe", "pmu";
+
+			memory-region = <&wcnss_mem>;
+
+			power-domains = <&rpmpd MSM8939_VDDCX>,
+					<&rpmpd MSM8939_VDDMX>;
+			power-domain-names = "cx", "mx";
+
+			qcom,smem-states = <&wcnss_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&wcnss_pin_a>;
+
+			status = "disabled";
+
+			wcnss_iris: iris {
+				/* Separate chip, compatible is board-specific */
+				clocks = <&rpmcc RPM_SMD_RF_CLK2>;
+				clock-names = "xo";
+			};
+
+			smd-edge {
+				interrupts = <GIC_SPI 142 1>;
+				qcom,ipc = <&apcs1_mbox 8 17>;
+				qcom,smd-edge = <6>;
+				qcom,remote-pid = <4>;
+
+				label = "pronto";
+
+				wcnss {
+					compatible = "qcom,wcnss";
+					qcom,smd-channels = "WCNSS_CTRL";
+
+					qcom,mmio = <&wcnss>;
+
+					wcnss_bt: bluetooth {
+						compatible = "qcom,wcnss-bt";
+					};
+
+					wcnss_wifi: wifi {
+						compatible = "qcom,wcnss-wlan";
+
+						interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+						interrupt-names = "tx", "rx";
+
+						qcom,smem-states = <&apps_smsm 10>,
+								   <&apps_smsm 9>;
+						qcom,smem-state-names = "tx-enable",
+									"tx-rings-empty";
+					};
+				};
+			};
+		};
+
+		intc: interrupt-controller@b000000 {
+			compatible = "qcom,msm-qgic2";
+			reg = <0x0b000000 0x1000>, <0x0b002000 0x2000>,
+			      <0x0b001000 0x1000>, <0x0b004000 0x2000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupts = <GIC_PPI 0 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+		};
+
+		apcs1_mbox: mailbox@b011000 {
+			compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
+			reg = <0x0b011000 0x1000>;
+			clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "pll", "aux", "ref";
+			#clock-cells = <0>;
+			assigned-clocks = <&apcs2>;
+			assigned-clock-rates = <297600000>;
+			#mbox-cells = <1>;
+		};
+
+		a53pll_c1: clock@b016000 {
+			compatible = "qcom,msm8939-a53pll";
+			reg = <0x0b016000 0x40>;
+			#clock-cells = <0>;
+		};
+
+		acc0: clock-controller@b088000 {
+			compatible = "qcom,kpss-acc-v2";
+			reg = <0x0b088000 0x1000>;
+		};
+
+		saw0: power-manager@b089000 {
+			compatible = "qcom,msm8939-saw2-v3.0-cpu", "qcom,saw2";
+			reg = <0x0b089000 0x1000>;
+		};
+
+		acc1: clock-controller@b098000 {
+			compatible = "qcom,kpss-acc-v2";
+			reg = <0x0b098000 0x1000>;
+		};
+
+		saw1: power-manager@b099000 {
+			compatible = "qcom,msm8939-saw2-v3.0-cpu", "qcom,saw2";
+			reg = <0x0b099000 0x1000>;
+		};
+
+		acc2: clock-controller@b0a8000 {
+			compatible = "qcom,kpss-acc-v2";
+			reg = <0x0b0a8000 0x1000>;
+		};
+
+		saw2: power-manager@b0a9000 {
+			compatible = "qcom,msm8939-saw2-v3.0-cpu", "qcom,saw2";
+			reg = <0x0b0a9000 0x1000>;
+		};
+
+		acc3: clock-controller@b0b8000 {
+			compatible = "qcom,kpss-acc-v2";
+			reg = <0x0b0b8000 0x1000>;
+		};
+
+		saw3: power-manager@b0b9000 {
+			compatible = "qcom,msm8939-saw2-v3.0-cpu", "qcom,saw2";
+			reg = <0x0b0b9000 0x1000>;
+		};
+
+		apcs0_mbox: mailbox@b111000 {
+			compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
+			reg = <0x0b111000 0x1000>;
+			clocks = <&a53pll_c0>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "pll", "aux", "ref";
+			#clock-cells = <0>;
+			#mbox-cells = <1>;
+		};
+
+		a53pll_c0: clock@b116000 {
+			compatible = "qcom,msm8939-a53pll";
+			reg = <0x0b116000 0x40>;
+			#clock-cells = <0>;
+		};
+
+		timer@b120000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0b120000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			frame@b121000 {
+				reg = <0x0b121000 0x1000>,
+				      <0x0b122000 0x1000>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <0>;
+			};
+
+			frame@b123000 {
+				reg = <0x0b123000 0x1000>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <1>;
+				status = "disabled";
+			};
+
+			frame@b124000 {
+				reg = <0x0b124000 0x1000>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <2>;
+				status = "disabled";
+			};
+
+			frame@b125000 {
+				reg = <0x0b125000 0x1000>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <3>;
+				status = "disabled";
+			};
+
+			frame@b126000 {
+				reg = <0x0b126000 0x1000>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <4>;
+				status = "disabled";
+			};
+
+			frame@b127000 {
+				reg = <0x0b127000 0x1000>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <5>;
+				status = "disabled";
+			};
+
+			frame@b128000 {
+				reg = <0x0b128000 0x1000>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <6>;
+				status = "disabled";
+			};
+		};
+
+		acc4: clock-controller@b188000 {
+			compatible = "qcom,kpss-acc-v2";
+			reg = <0x0b188000 0x1000>;
+		};
+
+		saw4: power-manager@b189000 {
+			compatible = "qcom,msm8939-saw2-v3.0-cpu", "qcom,saw2";
+			reg = <0x0b189000 0x1000>;
+		};
+
+		acc5: clock-controller@b198000 {
+			compatible = "qcom,kpss-acc-v2";
+			reg = <0x0b198000 0x1000>;
+		};
+
+		saw5: power-manager@b199000 {
+			compatible = "qcom,msm8939-saw2-v3.0-cpu", "qcom,saw2";
+			reg = <0x0b199000 0x1000>;
+		};
+
+		acc6: clock-controller@b1a8000 {
+			compatible = "qcom,kpss-acc-v2";
+			reg = <0x0b1a8000 0x1000>;
+		};
+
+		saw6: power-manager@b1a9000 {
+			compatible = "qcom,msm8939-saw2-v3.0-cpu", "qcom,saw2";
+			reg = <0x0b1a9000 0x1000>;
+		};
+
+		acc7: clock-controller@b1b8000 {
+			compatible = "qcom,kpss-acc-v2";
+			reg = <0x0b1b8000 0x1000>;
+		};
+
+		saw7: power-manager@b1b9000 {
+			compatible = "qcom,msm8939-saw2-v3.0-cpu", "qcom,saw2";
+			reg = <0x0b1b9000 0x1000>;
+		};
+
+		a53pll_cci: clock@b1d0000 {
+			compatible = "qcom,msm8939-a53pll";
+			reg = <0x0b1d0000 0x40>;
+			#clock-cells = <0>;
+		};
+
+		apcs2: mailbox@b1d1000 {
+			compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
+			reg = <0x0b1d1000 0x1000>;
+			clocks = <&a53pll_cci>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "pll", "aux", "ref";
+			#clock-cells = <0>;
+			#mbox-cells = <1>;
+		};
+	};
+
+	thermal_zones: thermal-zones {
+		cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 5>;
+
+			trips {
+				cpu0_alert: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_crit: trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_alert>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 6>;
+
+			trips {
+				cpu1_alert: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_crit: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu1_alert>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 7>;
+
+			trips {
+				cpu2_alert: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_crit: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu2_alert>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu3-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 8>;
+
+			trips {
+				cpu3_alert: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu3_crit: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu3_alert>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu4567-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 9>;
+
+			trips {
+				cpu4567_alert: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu4567_crit: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu4567_alert>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 3>;
+
+			trips {
+				gpu_alert0: trip-point0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu_crit: gpu_crit {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 0>;
+
+			trips {
+				modem1_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		modem2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 2>;
+
+			trips {
+				modem2_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		camera-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 1>;
+
+			trips {
+				cam_alert0: trip-point0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "hot";
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
2.39.2

