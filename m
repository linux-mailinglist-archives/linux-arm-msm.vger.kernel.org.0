Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCFB17E1C7C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 09:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbjKFIjh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 03:39:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbjKFIje (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 03:39:34 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E1F136
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 00:39:22 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50943ccbbaeso5970378e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 00:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699259960; x=1699864760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Swci1LrSSWMOD1trvZoopzM+GJb67j807szKQhSvhQo=;
        b=ZwdBX9PweTG8WrjXQhsEbfp+hgUyZt4fBrYh+QK/WVsEHAK4bUyyKUIo50x6gucyPD
         IpP/BvFTYZCwKuVaxZ9AQSIplbSisOviVrvkl1VzjHdwkOeA3bYSDIKNOcwCf6NndTzc
         z4XfvvlTK1KkYYaZrvEUIzyC3x0r4pY/gBQQa8vxUt7ZL0Z6ih+AXjCmZDegxnuj4DPT
         /JZ8/6pf9HYYZOt1Eiwi/kJHbjifntdjYx+U9WxrsGlXusgqZkpnaWBrqKkGq8xM5HA6
         IeKYzsoLqwU00Psz3uU6Imbcq8f5mwMGXf+/cmJvUStxx4sRkOJH5PuqhfKKGx4pzqTC
         aZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699259960; x=1699864760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Swci1LrSSWMOD1trvZoopzM+GJb67j807szKQhSvhQo=;
        b=HGVQbV4JSJsBMK71a7kG/6TV/SJUjSKEy2Lb+yBuDTYDJ3uDzyaXsvC5TbgcC97TIL
         b6Gwgm0WVYoZw9nJcDTapYlAgBufzV94cLt5Pedf2w3mWe/GvAJWBfMiEAkI9I6CQ74z
         pt9gLTyQzYyLDprxrawz8IIdU8t0NjxOWE1UAxFTedzXzyuPTbqRJqcNLzRbRKbrLbou
         AQtNF3uOJWFclXyEstn+AYbNSk+Btr+Oa/ycO+D8tJgZD67ZnCVvwNhO5PYHP/B3CR+Q
         02+8mJ05/M3GAqmr9Owwk5tos2zSL5Zwfl4GzWQdXk0vCJxYpkSxE6Nuw9U1bku/EWw3
         AJRA==
X-Gm-Message-State: AOJu0YxH6HiI22K4qaA5Beq6fIvKDPzI3SOIivoCN/WN5BGOuqKUe4rA
        cEiu3cklpUjjuhCL5eaqFLyrhA==
X-Google-Smtp-Source: AGHT+IHHwqIxodURgM93vmUOqmJdSXu1hCVx7X/g3yxiRdXgLC5FOIcHcV+5Eh9LME7RMqZfMOK3Vw==
X-Received: by 2002:ac2:4282:0:b0:507:a12c:558c with SMTP id m2-20020ac24282000000b00507a12c558cmr17887523lfh.46.1699259960136;
        Mon, 06 Nov 2023 00:39:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id t5-20020adfe445000000b00323293bd023sm8829830wrm.6.2023.11.06.00.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 00:39:19 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 06 Nov 2023 09:39:10 +0100
Subject: [PATCH v2 2/8] arm64: dts: qcom: add initial SM8650 dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-topic-sm8650-upstream-dt-v2-2-44d6f9710fa7@linaro.org>
References: <20231106-topic-sm8650-upstream-dt-v2-0-44d6f9710fa7@linaro.org>
In-Reply-To: <20231106-topic-sm8650-upstream-dt-v2-0-44d6f9710fa7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=60744;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JhjHjid15bdlyBhYvrjianp7qDE7+tsSUh2gny4vb34=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlSKYyk2m9KIRzZBYWOYXwlPZ+4FN6uqEVFGAzB5SY
 uHpl2LSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUimMgAKCRB33NvayMhJ0SzID/
 4jG8xzUTsd+YINDcWItQ1rj/WLY8CK1EwGsUZqBoi+nX5O5gFtfOmVq328DmwgjbQ37xbyA7Kri2XX
 CEAPIoJLvm6g3VnnnfdK/T9+sVyNAaggcEnSnwYwKWCUi2GhMs+Gy1wCoifzZRj0ksAcuiaX3oYo0R
 O7PpVkSmGyL9V4WMzGO8i/9lZ9SByeqdgJo4TX6T1p1DXCN+peJtZ9NqetoOPX003GKZbWo3gSUTmL
 U2ZAsw9WFxXolPfrcZeKaa/eOwPxb0d09n25RzgxUQomTVQzirq1zPeJ9xOEaKdBQkRZ+Sc500+C8i
 FEoPN40HRYpxgknAoGxaRurnfdc0mCZBbEjJD46AcyCoZug7CF0ZAgpCsDZHY6UaFbkCk0cqkBpfnZ
 sDH7lx8XfvZGUdya3a/FrgeYdXKLc/isxt4R2P9VVPC4WkY6tXTOLVEgk9Qk9qS4hS+npNkksRzAda
 YuISYU48MRO/6sbWgTTrTWaJd99TW96AT7D8rlrxvTwOCAU4+3+p42SflBw+xFXA9/kGNS9cFYXPH+
 pW/iPgWFpQXd+jbLppPx5pzjn96314F0ix/P3Co5GX3cU5Y4Ni0cvGw1cX8AjbO8qJfFGtzCZj5+ok
 FDQtZlBY2nmgG4GAIl2GDvId7ZwIgpK64vKgSa8vl4fa4sWQ+OMogXKPgS2Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add initial DTSI for the Qualcomm SM8650 platform,
only contains nodes which doesn't depend on interconnect.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2665 ++++++++++++++++++++++++++++++++++
 1 file changed, 2665 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
new file mode 100644
index 000000000000..bbebe15437aa
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -0,0 +1,2665 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8650-dispcc.h>
+#include <dt-bindings/clock/qcom,sm8650-gcc.h>
+#include <dt-bindings/clock/qcom,sm8650-gpucc.h>
+#include <dt-bindings/clock/qcom,sm8650-tcsr.h>
+#include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/reset/qcom,sm8650-gpucc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
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
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a520";
+			reg = <0 0>;
+
+			clocks = <&cpufreq_hw 0>;
+
+			power-domains = <&CPU_PD0>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+
+			qcom,freq-domain = <&cpufreq_hw 0>;
+
+			#cooling-cells = <2>;
+
+			L2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3_0>;
+
+				L3_0: l3-cache {
+					compatible = "cache";
+					cache-level = <3>;
+					cache-unified;
+				};
+			};
+		};
+
+		CPU1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a520";
+			reg = <0 0x100>;
+
+			clocks = <&cpufreq_hw 0>;
+
+			power-domains = <&CPU_PD1>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+
+			qcom,freq-domain = <&cpufreq_hw 0>;
+
+			#cooling-cells = <2>;
+		};
+
+		CPU2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a720";
+			reg = <0 0x200>;
+
+			clocks = <&cpufreq_hw 3>;
+
+			power-domains = <&CPU_PD2>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&L2_200>;
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
+
+			qcom,freq-domain = <&cpufreq_hw 3>;
+
+			#cooling-cells = <2>;
+
+			L2_200: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a720";
+			reg = <0 0x300>;
+
+			clocks = <&cpufreq_hw 3>;
+
+			power-domains = <&CPU_PD3>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&L2_200>;
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
+
+			qcom,freq-domain = <&cpufreq_hw 3>;
+
+			#cooling-cells = <2>;
+		};
+
+		CPU4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a720";
+			reg = <0 0x400>;
+
+			clocks = <&cpufreq_hw 3>;
+
+			power-domains = <&CPU_PD4>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&L2_400>;
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
+
+			qcom,freq-domain = <&cpufreq_hw 3>;
+
+			#cooling-cells = <2>;
+
+			L2_400: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a720";
+			reg = <0 0x500>;
+
+			clocks = <&cpufreq_hw 1>;
+
+			power-domains = <&CPU_PD5>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&L2_500>;
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
+
+			qcom,freq-domain = <&cpufreq_hw 1>;
+
+			#cooling-cells = <2>;
+
+			L2_500: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a720";
+			reg = <0 0x600>;
+
+			clocks = <&cpufreq_hw 1>;
+
+			power-domains = <&CPU_PD6>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&L2_600>;
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
+
+			qcom,freq-domain = <&cpufreq_hw 1>;
+
+			#cooling-cells = <2>;
+
+			L2_600: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-x4";
+			reg = <0 0x700>;
+
+			clocks = <&cpufreq_hw 2>;
+
+			power-domains = <&CPU_PD7>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&L2_700>;
+			capacity-dmips-mhz = <1894>;
+			dynamic-power-coefficient = <588>;
+
+			qcom,freq-domain = <&cpufreq_hw 2>;
+
+			#cooling-cells = <2>;
+
+			L2_700: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
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
+
+		idle-states {
+			entry-method = "psci";
+
+			SILVER_CPU_SLEEP_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "silver-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <550>;
+				exit-latency-us = <750>;
+				min-residency-us = <6700>;
+				local-timer-stop;
+			};
+
+			GOLD_CPU_SLEEP_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "gold-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <600>;
+				exit-latency-us = <1300>;
+				min-residency-us = <8136>;
+				local-timer-stop;
+			};
+
+			GOLD_PLUS_CPU_SLEEP_0: cpu-sleep-2-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "gold-plus-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <500>;
+				exit-latency-us = <1350>;
+				min-residency-us = <7480>;
+				local-timer-stop;
+			};
+		};
+
+		domain-idle-states {
+			CLUSTER_SLEEP_0: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <750>;
+				exit-latency-us = <2350>;
+				min-residency-us = <9144>;
+			};
+
+			CLUSTER_SLEEP_1: cluster-sleep-1 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x4100c344>;
+				entry-latency-us = <2800>;
+				exit-latency-us = <4400>;
+				min-residency-us = <10150>;
+			};
+		};
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm-sm8650", "qcom,scm";
+		};
+	};
+
+	memory@a0000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0 0xa0000000 0 0>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		CPU_PD0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&SILVER_CPU_SLEEP_0>;
+		};
+
+		CPU_PD1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&SILVER_CPU_SLEEP_0>;
+		};
+
+		CPU_PD2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&SILVER_CPU_SLEEP_0>;
+		};
+
+		CPU_PD3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&GOLD_CPU_SLEEP_0>;
+		};
+
+		CPU_PD4: power-domain-cpu4 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&GOLD_CPU_SLEEP_0>;
+		};
+
+		CPU_PD5: power-domain-cpu5 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&GOLD_CPU_SLEEP_0>;
+		};
+
+		CPU_PD6: power-domain-cpu6 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&GOLD_CPU_SLEEP_0>;
+		};
+
+		CPU_PD7: power-domain-cpu7 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&GOLD_PLUS_CPU_SLEEP_0>;
+		};
+
+		CLUSTER_PD: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&CLUSTER_SLEEP_0>,
+					     <&CLUSTER_SLEEP_1>;
+		};
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hyp_mem: hyp@80000000 {
+			reg = <0 0x80000000 0 0xe00000>;
+			no-map;
+		};
+
+		cpusys_vm_mem: cpusys-vm@80e00000 {
+			reg = <0 0x80e00000 0 0x400000>;
+			no-map;
+		};
+
+		/* Merged xbl_dtlog, xbl_ramdump and aop_image regions */
+		xbl_dt_log_merged_mem: xbl-dt-log-merged@81a00000 {
+			reg = <0 0x81a00000 0 0x260000>;
+			no-map;
+		};
+
+		aop_cmd_db_mem: aop-cmd-db@81c60000 {
+			compatible = "qcom,cmd-db";
+			reg = <0 0x81c60000 0 0x20000>;
+			no-map;
+		};
+
+		/* Merged aop_config, tme_crash_dump, tme_log and uefi_log regions */
+		aop_tme_uefi_merged_mem: aop-tme-uefi-merged@81c80000 {
+			reg = <0 0x81c80000 0 0x74000>;
+			no-map;
+		};
+
+		/* Secdata region can be reused by apps */
+
+		smem: smem@81d00000 {
+			compatible = "qcom,smem";
+			reg = <0 0x81d00000 0 0x200000>;
+			hwlocks = <&tcsr_mutex 3>;
+			no-map;
+		};
+
+		adsp_mhi_mem: adsp-mhi@81f00000 {
+			reg = <0 0x81f00000 0 0x20000>;
+			no-map;
+		};
+
+		pvmfw_mem: pvmfw@824a0000 {
+			reg = <0 0x824a0000 0 0x100000>;
+			no-map;
+		};
+
+		global_sync_mem: global-sync@82600000 {
+			reg = <0 0x82600000 0 0x100000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat@82700000 {
+			reg = <0 0x82700000 0 0x100000>;
+			no-map;
+		};
+
+		qdss_mem: qdss@82800000 {
+			reg = <0 0x82800000 0 0x2000000>;
+			no-map;
+		};
+
+		mpss_dsm_mem: mpss-dsm@86b00000 {
+			reg = <0 0x86b00000 0 0x4900000>;
+			no-map;
+		};
+
+		mpss_dsm_mem_2: mpss-dsm-2@8b400000 {
+			reg = <0 0x8b400000 0 0x800000>;
+			no-map;
+		};
+
+		mpss_mem: mpss@8bc00000 {
+			reg = <0 0x8bc00000 0 0xf400000>;
+			no-map;
+		};
+
+		q6_mpss_dtb_mem: q6-mpss-dtb@9b000000 {
+			reg = <0 0x9b000000 0 0x80000>;
+			no-map;
+		};
+
+		ipa_fw_mem: ipa-fw@9b080000 {
+			reg = <0 0x9b080000 0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: ipa-gsi@9b090000 {
+			reg = <0 0x9b090000 0 0xa000>;
+			no-map;
+		};
+
+		gpu_micro_code_mem: gpu-micro-code@9b09a000 {
+			reg = <0 0x9b09a000 0 0x2000>;
+			no-map;
+		};
+
+		spss_region_mem: spss@9b0a0000 {
+			reg = <0 0x9b0a0000 0 0x1e0000>;
+			no-map;
+		};
+
+		/* First part of the "SPU secure shared memory" region */
+		spu_tz_shared_mem: spu-tz-shared@9b280000 {
+			reg = <0 0x9b280000 0 0x60000>;
+			no-map;
+		};
+
+		/* Second part of the "SPU secure shared memory" region */
+		spu_modem_shared_mem: spu-modem-shared@9b2e0000 {
+			reg = <0 0x9b2e0000 0 0x20000>;
+			no-map;
+		};
+
+		camera_mem: camera@9b300000 {
+			reg = <0 0x9b300000 0 0x800000>;
+			no-map;
+		};
+
+		video_mem: video@9bb00000 {
+			reg = <0 0x9bb00000 0 0x800000>;
+			no-map;
+		};
+
+		cvp_mem: cvp@9c300000 {
+			reg = <0 0x9c300000 0 0x700000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@9ca00000 {
+			reg = <0 0x9ca00000 0 0x1400000>;
+			no-map;
+		};
+
+		q6_cdsp_dtb_mem: q6-cdsp-dtb@9de00000 {
+			reg = <0 0x9de00000 0 0x80000>;
+			no-map;
+		};
+
+		q6_adsp_dtb_mem: q6-adsp-dtb@9de80000 {
+			reg = <0 0x9de80000 0 0x80000>;
+			no-map;
+		};
+
+		adspslpi_mem: adspslpi@9df00000 {
+			reg = <0 0x9df00000 0 0x4080000>;
+			no-map;
+		};
+
+		rmtfs_mem: rmtfs@d7c00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xd7c00000 0 0x400000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+		};
+
+		/* Merged tz_reserved, xbl_sc, cpucp_fw and qtee regions */
+		tz_merged_mem: tz-merged@d8000000 {
+			reg = <0 0xd8000000 0 0x800000>;
+			no-map;
+		};
+
+		hwfence_shbuf: hwfence-shbuf@e6440000 {
+			reg = <0 0xe6440000 0 0x2dd000>;
+			no-map;
+		};
+
+		trust_ui_vm_mem: trust-ui-vm@f3800000 {
+			reg = <0 0xf3800000 0 0x4400000>;
+			no-map;
+		};
+
+		oem_vm_mem: oem-vm@f7c00000 {
+			reg = <0 0xf7c00000 0 0x4c00000>;
+			no-map;
+		};
+
+		llcc_lpi_mem: llcc-lpi@ff800000 {
+			reg = <0 0xff800000 0 0x600000>;
+			no-map;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-ranges = <0 0 0 0 0x10 0>;
+		ranges = <0 0 0 0 0x10 0>;
+
+		gcc: clock-controller@100000 {
+			compatible = "qcom,sm8650-gcc";
+			reg = <0 0x00100000 0 0x1f4200>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		ipcc: mailbox@406000 {
+			compatible = "qcom,sm8650-ipcc", "qcom,ipcc";
+			reg = <0 0x00406000 0 0x1000>;
+
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			#mbox-cells = <2>;
+		};
+
+		gpi_dma2: dma-controller@800000 {
+			compatible = "qcom,sm8650-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00800000 0 0x60000>;
+
+			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0x3f>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0x436 0>;
+
+			dma-coherent;
+
+			status = "disabled";
+		};
+
+		qupv3_id_1: geniqup@8c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0 0x008c0000 0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+
+			iommus = <&apps_smmu 0x423 0>;
+
+			dma-coherent;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			uart15: serial@89c000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0 0x0089c000 0 0x4000>;
+
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
+				clock-names = "se";
+
+				pinctrl-0 = <&qup_uart15_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+		};
+
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,sm8650-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00a00000 0 0x60000>;
+
+			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0xc>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0xb6 0>;
+			dma-coherent;
+
+			status = "disabled";
+		};
+
+		rng: rng@10c3000 {
+			compatible = "qcom,sm8650-trng", "qcom,trng";
+			reg = <0 0x010c3000 0 0x1000>;
+		};
+
+		ice: crypto@1d88000 {
+			compatible = "qcom,sm8650-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0 0x01d88000 0 0x8000>;
+
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0 0x01f40000 0 0x20000>;
+
+			#hwlock-cells = <1>;
+		};
+
+		tcsr: clock-controller@1fc0000 {
+			compatible = "qcom,sm8650-tcsr", "syscon";
+			reg = <0 0x01fc0000 0 0xa0000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,sm8650-gpucc";
+			reg = <0 0x03d90000 0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8650-dispcc";
+			reg = <0 0x0af00000 0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&gcc GCC_DISP_AHB_CLK>,
+				 <&sleep_clk>,
+				 <0>, /* dsi0 */
+				 <0>,
+				 <0>, /* dsi1 */
+				 <0>,
+				 <0>, /* dp0 */
+				 <0>,
+				 <0>, /* dp1 */
+				 <0>,
+				 <0>, /* dp2 */
+				 <0>,
+				 <0>, /* dp3 */
+				 <0>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			status = "disabled";
+		};
+
+		usb_1_hsphy: phy@88e3000 {
+			compatible = "qcom,sm8650-snps-eusb2-phy",
+				     "qcom,sm8550-snps-eusb2-phy";
+			reg = <0 0x088e3000 0 0x154>;
+
+			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_dp_qmpphy: phy@88e8000 {
+			compatible = "qcom,sm8650-qmp-usb3-dp-phy";
+			reg = <0 0x088e8000 0 0x3000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			power-domains = <&gcc USB3_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
+		usb_1: usb@a6f8800 {
+			compatible = "qcom,sm8650-dwc3", "qcom,dwc3";
+			reg = <0 0x0a6f8800 0 0x400>;
+
+			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_RISING>,
+					      <&pdc 14 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "hs_phy_irq",
+					  "ss_phy_irq",
+					  "dm_hs_phy_irq",
+					  "dp_hs_phy_irq";
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&tcsr TCSR_USB3_CLKREF_EN>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "xo";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			power-domains = <&gcc USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			usb_1_dwc3: usb@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a600000 0 0xcd00>;
+
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+
+				iommus = <&apps_smmu 0x40 0>;
+
+				phys = <&usb_1_hsphy>,
+				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+				phy-names = "usb2-phy",
+					    "usb3-phy";
+
+				snps,hird-threshold = /bits/ 8 <0x0>;
+				snps,usb2-gadget-lpm-disable;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
+				snps,is-utmi-l1-suspend;
+				snps,usb3_lpm_capable;
+				snps,usb2-lpm-disable;
+				snps,has-lpm-erratum;
+				tx-fifo-resize;
+
+				dma-coherent;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+						};
+					};
+				};
+			};
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sm8650-pdc", "qcom,pdc";
+			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+
+			interrupt-parent = <&intc>;
+
+			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
+					  <125 63 1>, <126 716 12>,
+					  <138 251 5>, <143 244 4>;
+
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		tsens0: thermal-sensor@c228000 {
+			compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c228000 0 0x1000>, /* TM */
+			      <0 0x0c222000 0 0x1000>; /* SROT */
+
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <15>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c229000 {
+			compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c229000 0 0x1000>, /* TM */
+			      <0 0x0c223000 0 0x1000>; /* SROT */
+
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <16>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens2: thermal-sensor@c22a000 {
+			compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c22a000 0 0x1000>, /* TM */
+			      <0 0x0c224000 0 0x1000>; /* SROT */
+
+			interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <13>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,sm8650-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0 0x0c300000 0 0x400>;
+
+			interrupt-parent = <&ipcc>;
+			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+
+			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			#clock-cells = <0>;
+		};
+
+		sram@c3f0000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0 0x0c3f0000 0 0x400>;
+		};
+
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0 0x0c400000 0 0x3000>,
+			      <0 0x0c500000 0 0x4000000>,
+			      <0 0x0c440000 0 0x80000>,
+			      <0 0x0c4c0000 0 0x20000>,
+			      <0 0x0c42d000 0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			qcom,bus-id = <0>;
+
+			interrupt-controller;
+			#interrupt-cells = <4>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,sm8650-tlmm";
+			reg = <0 0x0f100000 0 0x300000>;
+
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			gpio-ranges = <&tlmm 0 0 211>;
+
+			wakeup-parent = <&pdc>;
+
+			qup_uart15_default: qup-uart15-default-state {
+				/* TX, RX */
+				pins = "gpio30", "gpio31";
+				function = "qup2_se7";
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
+		apps_smmu: iommu@15000000 {
+			compatible = "qcom,sm8650-smmu-500", "qcom,smmu-500", "arm,mmu-500";
+			reg = <0 0x15000000 0 0x100000>;
+
+			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>;
+
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			dma-coherent;
+		};
+
+		intc: interrupt-controller@17100000 {
+			compatible = "arm,gic-v3";
+			reg = <0 0x17100000 0 0x10000>,		/* GICD */
+			      <0 0x17180000 0 0x200000>;	/* GICR * 8 */
+
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+
+			#interrupt-cells = <3>;
+			interrupt-controller;
+
+			#redistributor-regions = <1>;
+			redistributor-stride = <0 0x40000>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			gic_its: msi-controller@17140000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0 0x17140000 0 0x20000>;
+
+				msi-controller;
+				#msi-cells = <1>;
+			};
+		};
+
+		timer@17420000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0 0x17420000 0 0x1000>;
+
+			ranges = <0 0 0 0x20000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@17421000 {
+				reg = <0x17421000 0x1000>,
+				      <0x17422000 0x1000>;
+
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <0>;
+			};
+
+			frame@17423000 {
+				reg = <0x17423000 0x1000>;
+
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <1>;
+
+				status = "disabled";
+			};
+
+			frame@17425000 {
+				reg = <0x17425000 0x1000>;
+
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <2>;
+
+				status = "disabled";
+			};
+
+			frame@17427000 {
+				reg = <0x17427000 0x1000>;
+
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <3>;
+
+				status = "disabled";
+			};
+
+			frame@17429000 {
+				reg = <0x17429000 0x1000>;
+
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <4>;
+
+				status = "disabled";
+			};
+
+			frame@1742b000 {
+				reg = <0x1742b000 0x1000>;
+
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <5>;
+
+				status = "disabled";
+			};
+
+			frame@1742d000 {
+				reg = <0x1742d000 0x1000>;
+
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <6>;
+
+				status = "disabled";
+			};
+		};
+
+		apps_rsc: rsc@17a00000 {
+			compatible = "qcom,rpmh-rsc";
+			reg = <0 0x17a00000 0 0x10000>,
+			      <0 0x17a10000 0 0x10000>,
+			      <0 0x17a20000 0 0x10000>,
+			      <0 0x17a30000 0 0x10000>;
+			reg-names = "drv-0",
+				    "drv-1",
+				    "drv-2";
+
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&CLUSTER_PD>;
+
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS    3>, <SLEEP_TCS     2>,
+					  <WAKE_TCS      2>, <CONTROL_TCS   0>;
+
+			label = "apps_rsc";
+
+			apps_bcm_voter: bcm-voter {
+				compatible = "qcom,bcm-voter";
+			};
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,sm8650-rpmh-clk";
+
+				clocks = <&xo_board>;
+				clock-names = "xo";
+
+				#clock-cells = <1>;
+			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,sm8650-rpmhpd";
+
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				#power-domain-cells = <1>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp-16 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp-48 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs_d2: opp-52 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					};
+
+					rpmhpd_opp_low_svs_d1: opp-56 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					};
+
+					rpmhpd_opp_low_svs_d0: opp-60 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					};
+
+					rpmhpd_opp_low_svs: opp-64 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_low_svs_l1: opp-80 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					};
+
+					rpmhpd_opp_svs: opp-128 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l0: opp-144 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					};
+
+					rpmhpd_opp_svs_l1: opp-192 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_nom: opp-256 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp-320 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp-336 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp-384 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp-416 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+				};
+			};
+		};
+
+		cpufreq_hw: cpufreq@17d91000 {
+			compatible = "qcom,sm8650-cpufreq-epss", "qcom,cpufreq-epss";
+			reg = <0 0x17d91000 0 0x1000>,
+			      <0 0x17d92000 0 0x1000>,
+			      <0 0x17d93000 0 0x1000>,
+			      <0 0x17d94000 0 0x1000>;
+			reg-names = "freq-domain0",
+				    "freq-domain1",
+				    "freq-domain2",
+				    "freq-domain3";
+
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dcvsh-irq-0",
+					  "dcvsh-irq-1",
+					  "dcvsh-irq-2",
+					  "dcvsh-irq-3";
+
+			clocks = <&bi_tcxo_div2>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
+		};
+
+		system-cache-controller@25000000 {
+			compatible = "qcom,sm8650-llcc";
+			reg = <0 0x25000000 0 0x200000>,
+			      <0 0x25400000 0 0x200000>,
+			      <0 0x25200000 0 0x200000>,
+			      <0 0x25600000 0 0x200000>,
+			      <0 0x25800000 0 0x200000>;
+			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc2_base",
+				    "llcc3_base",
+				    "llcc_broadcast_base";
+
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
+	thermal-zones {
+		aoss0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss3-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu2-top-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-bottom-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				 cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu3-top-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu3-bottom-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-top-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-bottom-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-top-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-bottom-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-top-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-bottom-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 14>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu7-top-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-middle-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-bottom-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-0-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 6>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsphvx-1-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 7>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsphmx-0-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 8>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsphmx-1-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 9>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsphmx-2-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 10>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsphmx-3-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 11>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		video-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 12>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				ddr0-config {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		ddr-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 13>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				ddr0-config {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		camera0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 14>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		camera1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 15>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		aoss2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-1-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-2-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-3-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-4-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-5-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 6>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-6-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 7>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-7-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 8>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		modem0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 9>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				mdmss0-config0 {
+					temperature = <102000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				mdmss0-config1 {
+					temperature = <105000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		modem1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 10>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				mdmss1-config0 {
+					temperature = <102000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				mdmss1-config1 {
+					temperature = <105000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		modem2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 11>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				mdmss2-config0 {
+					temperature = <102000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				mdmss2-config1 {
+					temperature = <105000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		modem3-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 12>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				mdmss3-config0 {
+					temperature = <102000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				mdmss3-config1 {
+					temperature = <105000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};

-- 
2.34.1

