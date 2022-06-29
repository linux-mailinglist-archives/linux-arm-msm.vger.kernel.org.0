Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72D3C55F4F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 06:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiF2EMG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 00:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbiF2EME (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 00:12:04 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364E8366A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 21:11:59 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id r82so11331648oig.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 21:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B4FQ+NLl/V38ZrufgJj15J7QoYlS7bsUr8cTBYk1thA=;
        b=RH278QGC/uPo6a5g1QFFXZTgzY6SQbWBl9VtO9V7YL16MFFkdIowMMA1MkDHCT2tBI
         PXCYmw2nsOZ7Bzhjom8+/sGDtjcJzokS7vi/sTkMJ+8XSQpbi5AaTxPa+qHG2Y8k6vm2
         p3nGbvM7Q7oT0UVVDGiMSOJCp2L84mFvpp70UuENpLEyVNmjI2HwbVwPuKzPRVMWLgKn
         UM1OUcbPSVgru4Yvqouh/KRWDEGE49Ikk+vPLInmdtnDij5dcVcfHn4DBJA21FOtVNnP
         v51xnTpsccxcKqTL2bO8L5kftKojOtxpKKH//u5mAPGRE73U1TaQDiownRcNh8zhxP2F
         nVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B4FQ+NLl/V38ZrufgJj15J7QoYlS7bsUr8cTBYk1thA=;
        b=HAeg5QfOciZiLabGDXZPAXguhrpR0m6Jy4Q7WDwYmG/EqKsks7vJ/cBuL8xoV1BMAx
         UEH91Ly0o2q7L3P4qA0Whu6tt93UlsVa8A32K+cdqj7wMDneHu07A1VaLe+1dKjKzJHX
         HHLrGXUL9xwGvZBm2SP6fEBhUE+uAtjnE6cylie+9GaUvPS/zExvCrLKyUg5aECenZzM
         4LtYv47aG1BLLcZ06cd/ebACuc/EPRZUIVyInDoRRHKWZ0bhOwzuq1X5P0RtLlPU4jxc
         XKytzXJQ+EF0FQi4P5+6HKX6ZfQU38VvEu+ZMgWL6cgSSPNgfKGAacYL5HvH15qcwcFw
         6kZg==
X-Gm-Message-State: AJIora8ksnVw/ZruExH/Ydy/XOQa/zdwS1KneoiP592gK6O4zM8T5l4/
        lnOaTjyfO2X9CE3kooQEa79npg==
X-Google-Smtp-Source: AGRyM1tTx4dramu98NxVNMJsZiLwKL7hdeAbpdoKQgAamXwJ2ZzuIOgr3XzBVnCVkJVG/Bg4xJwvZg==
X-Received: by 2002:a54:460a:0:b0:335:34bb:3c4e with SMTP id p10-20020a54460a000000b0033534bb3c4emr855176oip.147.1656475918219;
        Tue, 28 Jun 2022 21:11:58 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p12-20020a9d4e0c000000b00616ec82b29bsm1578692otf.35.2022.06.28.21.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 21:11:57 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/5] arm64: dts: qcom: add SC8280XP platform
Date:   Tue, 28 Jun 2022 21:14:36 -0700
Message-Id: <20220629041438.1352536-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220629041438.1352536-1-bjorn.andersson@linaro.org>
References: <20220629041438.1352536-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce initial support for the Qualcomm SC8280XP platform, aka 8cx
Gen 3. This initial contribution supports SMP, CPUfreq, CPU cluster
idling, GCC, TLMM, SMMU, RPMh regulators, power-domains and clocks,
interconnects, some QUPs, UFS, remoteprocs, USB, watchdog, LLCC and
tsens.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes since v2:
- Fixed include sort order
- Dropped a stray newline in &CPU0
- Renamed reserved-memory regions
- Dropped clock-frequency of the timers node
- Reduced #address-cells and #size-cells to 1 in timer node

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2142 ++++++++++++++++++++++++
 1 file changed, 2142 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
new file mode 100644
index 000000000000..c9d608ac87fa
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -0,0 +1,2142 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022, Linaro Limited
+ */
+
+#include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interconnect/qcom,sc8280xp.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clocks {
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32764>;
+		};
+	};
+
+	cpu0_opp_table: cpu0-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-403200000 {
+			opp-hz = /bits/ 64 <403200000>;
+		};
+		opp-499200000 {
+			opp-hz = /bits/ 64 <499200000>;
+		};
+		opp-595200000 {
+			opp-hz = /bits/ 64 <595200000>;
+		};
+		opp-691200000 {
+			opp-hz = /bits/ 64 <691200000>;
+		};
+		opp-806400000 {
+			opp-hz = /bits/ 64 <806400000>;
+		};
+		opp-902400000 {
+			opp-hz = /bits/ 64 <902400000>;
+		};
+		opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+		};
+		opp-1113600000 {
+			opp-hz = /bits/ 64 <1113600000>;
+		};
+		opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+		};
+		opp-1324800000 {
+			opp-hz = /bits/ 64 <1324800000>;
+		};
+		opp-1440000000 {
+			opp-hz = /bits/ 64 <1440000000>;
+		};
+		opp-1555200000 {
+			opp-hz = /bits/ 64 <1555200000>;
+		};
+		opp-1670400000 {
+			opp-hz = /bits/ 64 <1670400000>;
+		};
+		opp-1785600000 {
+			opp-hz = /bits/ 64 <1785600000>;
+		};
+		opp-1881600000 {
+			opp-hz = /bits/ 64 <1881600000>;
+		};
+		opp-1996800000 {
+			opp-hz = /bits/ 64 <1996800000>;
+		};
+		opp-2112000000 {
+			opp-hz = /bits/ 64 <2112000000>;
+		};
+		opp-2227200000 {
+			opp-hz = /bits/ 64 <2227200000>;
+		};
+		opp-2342400000 {
+			opp-hz = /bits/ 64 <2342400000>;
+		};
+		opp-2438400000 {
+			opp-hz = /bits/ 64 <2438400000>;
+		};
+	};
+
+	cpu4_opp_table: cpu4-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-825600000 {
+			opp-hz = /bits/ 64 <825600000>;
+		};
+		opp-940800000 {
+			opp-hz = /bits/ 64 <940800000>;
+		};
+		opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+		};
+		opp-1171200000 {
+			opp-hz = /bits/ 64 <1171200000>;
+		};
+		opp-1286400000 {
+			opp-hz = /bits/ 64 <1286400000>;
+		};
+		opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+		};
+		opp-1516800000 {
+			opp-hz = /bits/ 64 <1516800000>;
+		};
+		opp-1632000000 {
+			opp-hz = /bits/ 64 <1632000000>;
+		};
+		opp-1747200000 {
+			opp-hz = /bits/ 64 <1747200000>;
+		};
+		opp-1862400000 {
+			opp-hz = /bits/ 64 <1862400000>;
+		};
+		opp-1977600000 {
+			opp-hz = /bits/ 64 <1977600000>;
+		};
+		opp-2073600000 {
+			opp-hz = /bits/ 64 <2073600000>;
+		};
+		opp-2169600000 {
+			opp-hz = /bits/ 64 <2169600000>;
+		};
+		opp-2284800000 {
+			opp-hz = /bits/ 64 <2284800000>;
+		};
+		opp-2400000000 {
+			opp-hz = /bits/ 64 <2400000000>;
+		};
+		opp-2496000000 {
+			opp-hz = /bits/ 64 <2496000000>;
+		};
+		opp-2592000000 {
+			opp-hz = /bits/ 64 <2592000000>;
+		};
+		opp-2688000000 {
+			opp-hz = /bits/ 64 <2688000000>;
+		};
+		opp-2803200000 {
+			opp-hz = /bits/ 64 <2803200000>;
+		};
+		opp-2899200000 {
+			opp-hz = /bits/ 64 <2899200000>;
+		};
+		opp-2995200000 {
+			opp-hz = /bits/ 64 <2995200000>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <602>;
+			next-level-cache = <&L2_0>;
+			power-domains = <&CPU_PD0>;
+			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+			L2_0: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+				L3_0: l3-cache {
+				      compatible = "cache";
+				};
+			};
+		};
+
+		CPU1: cpu@100 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <602>;
+			next-level-cache = <&L2_100>;
+			power-domains = <&CPU_PD1>;
+			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+			L2_100: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU2: cpu@200 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <602>;
+			next-level-cache = <&L2_200>;
+			power-domains = <&CPU_PD2>;
+			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+			L2_200: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU3: cpu@300 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x300>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <602>;
+			next-level-cache = <&L2_300>;
+			power-domains = <&CPU_PD3>;
+			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+			L2_300: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU4: cpu@400 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x400>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_400>;
+			power-domains = <&CPU_PD4>;
+			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			#cooling-cells = <2>;
+			L2_400: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU5: cpu@500 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x500>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_500>;
+			power-domains = <&CPU_PD5>;
+			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			#cooling-cells = <2>;
+			L2_500: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU6: cpu@600 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x600>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_600>;
+			power-domains = <&CPU_PD6>;
+			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			#cooling-cells = <2>;
+			L2_600: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU7: cpu@700 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x700>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_700>;
+			power-domains = <&CPU_PD7>;
+			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
+			operating-points-v2 = <&cpu4_opp_table>;
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
+
+		idle-states {
+			entry-method = "psci";
+
+			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <355>;
+				exit-latency-us = <909>;
+				min-residency-us = <3934>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <241>;
+				exit-latency-us = <1461>;
+				min-residency-us = <4488>;
+				local-timer-stop;
+			};
+		};
+
+		domain-idle-states {
+			CLUSTER_SLEEP_0: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				idle-state-name = "cluster-power-collapse";
+				arm,psci-suspend-param = <0x4100c344>;
+				entry-latency-us = <3263>;
+				exit-latency-us = <6562>;
+				min-residency-us = <9987>;
+			};
+		};
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm-sc8280xp", "qcom,scm";
+		};
+	};
+
+	aggre1_noc: interconnect-aggre1-noc {
+		compatible = "qcom,sc8280xp-aggre1-noc";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	aggre2_noc: interconnect-aggre2-noc {
+		compatible = "qcom,sc8280xp-aggre2-noc";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	clk_virt: interconnect-clk-virt {
+		compatible = "qcom,sc8280xp-clk-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	config_noc: interconnect-config-noc {
+		compatible = "qcom,sc8280xp-config-noc";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	dc_noc: interconnect-dc-noc {
+		compatible = "qcom,sc8280xp-dc-noc";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	gem_noc: interconnect-gem-noc {
+		compatible = "qcom,sc8280xp-gem-noc";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	lpass_noc: interconnect-lpass-ag-noc {
+		compatible = "qcom,sc8280xp-lpass-ag-noc";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	mc_virt: interconnect-mc-virt {
+		compatible = "qcom,sc8280xp-mc-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	mmss_noc: interconnect-mmss-noc {
+		compatible = "qcom,sc8280xp-mmss-noc";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	nspa_noc: interconnect-nspa-noc {
+		compatible = "qcom,sc8280xp-nspa-noc";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	nspb_noc: interconnect-nspb-noc {
+		compatible = "qcom,sc8280xp-nspb-noc";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	system_noc: interconnect-system-noc {
+		compatible = "qcom,sc8280xp-system-noc";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
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
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		CPU_PD0: cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+		};
+
+		CPU_PD1: cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+		};
+
+		CPU_PD2: cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+		};
+
+		CPU_PD3: cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+		};
+
+		CPU_PD4: cpu4 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+		};
+
+		CPU_PD5: cpu5 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+		};
+
+		CPU_PD6: cpu6 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+		};
+
+		CPU_PD7: cpu7 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+		};
+
+		CLUSTER_PD: cpu-cluster0 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&CLUSTER_SLEEP_0>;
+		};
+	};
+
+	qup_opp_table_100mhz: qup-100mhz-opp-table {
+		compatible = "operating-points-v2";
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		reserved-region@80000000 {
+			reg = <0 0x80000000 0 0x860000>;
+			no-map;
+		};
+
+		cmd_db: cmd-db-region@80860000 {
+			compatible = "qcom,cmd-db";
+			reg = <0 0x80860000 0 0x20000>;
+			no-map;
+		};
+
+		reserved-region@80880000 {
+			reg = <0 0x80880000 0 0x80000>;
+			no-map;
+		};
+
+		smem_mem: smem-region@80900000 {
+			compatible = "qcom,smem";
+			reg = <0 0x80900000 0 0x200000>;
+			no-map;
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
+		reserved-region@80b00000 {
+			reg = <0 0x80b00000 0 0x100000>;
+			no-map;
+		};
+
+		reserved-region@83b00000 {
+			reg = <0 0x83b00000 0 0x1700000>;
+			no-map;
+		};
+
+		reserved-region@85b00000 {
+			reg = <0 0x85b00000 0 0xc00000>;
+			no-map;
+		};
+
+		pil_adsp_mem: adsp-region@86c00000 {
+			reg = <0 0x86c00000 0 0x2000000>;
+			no-map;
+		};
+
+		pil_nsp0_mem: cdsp0-region@8a100000 {
+			reg = <0 0x8a100000 0 0x1e00000>;
+			no-map;
+		};
+
+		pil_nsp1_mem: cdsp1-region@8c600000 {
+			reg = <0 0x8c600000 0 0x1e00000>;
+			no-map;
+		};
+
+		reserved-region@aeb00000 {
+			reg = <0 0xaeb00000 0 0x16600000>;
+			no-map;
+		};
+	};
+
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_LPASS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-nsp0 {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_nsp0_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_nsp0_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-nsp1 {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_NSP1
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_NSP1
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <12>;
+
+		smp2p_nsp1_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_nsp1_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0 0 0 0x10 0>;
+		dma-ranges = <0 0 0 0 0x10 0>;
+
+		gcc: clock-controller@100000 {
+			compatible = "qcom,gcc-sc8280xp";
+			reg = <0x0 0x00100000 0x0 0x1f0000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&usb_0_ssphy>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&usb_1_ssphy>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			power-domains = <&rpmhpd SC8280XP_CX>;
+		};
+
+		ipcc: mailbox@408000 {
+			compatible = "qcom,sc8280xp-ipcc", "qcom,ipcc";
+			reg = <0 0x00408000 0 0x1000>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#mbox-cells = <2>;
+		};
+
+		qup2: geniqup@8c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0 0x008c0000 0 0x2000>;
+			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			iommus = <&apps_smmu 0xa3 0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			qup2_uart17: serial@884000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00884000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				power-domains = <&rpmhpd SC8280XP_CX>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			qup2_i2c5: i2c@894000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00894000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC8280XP_CX>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
+				status = "disabled";
+			};
+		};
+
+		qup0: geniqup@9c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0 0x009c0000 0 0x6000>;
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			iommus = <&apps_smmu 0x563 0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			qup0_i2c4: i2c@990000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00990000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC8280XP_CX>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
+				status = "disabled";
+			};
+		};
+
+		qup1: geniqup@ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0 0x00ac0000 0 0x6000>;
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			iommus = <&apps_smmu 0x83 0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+		};
+
+		ufs_mem_hc: ufs@1d84000 {
+			compatible = "qcom,sc8280xp-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0 0x01d84000 0 0x3000>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufs_mem_phy_lanes>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <2>;
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			power-domains = <&gcc UFS_PHY_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			iommus = <&apps_smmu 0xe0 0x0>;
+
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "rx_lane1_sync_clk";
+			freq-table-hz = <75000000 300000000>,
+					<0 0>,
+					<0 0>,
+					<75000000 300000000>,
+					<0 0>,
+					<0 0>,
+					<0 0>,
+					<0 0>;
+			status = "disabled";
+		};
+
+		ufs_mem_phy: phy@1d87000 {
+			compatible = "qcom,sc8280xp-qmp-ufs-phy";
+			reg = <0 0x01d87000 0 0xe10>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clock-names = "ref",
+				      "ref_aux";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+			status = "disabled";
+
+			ufs_mem_phy_lanes: phy@1d87400 {
+				reg = <0 0x01d87400 0 0x108>,
+				      <0 0x01d87600 0 0x1e0>,
+				      <0 0x01d87c00 0 0x1dc>,
+				      <0 0x01d87800 0 0x108>,
+				      <0 0x01d87a00 0 0x1e0>;
+				#phy-cells = <0>;
+				#clock-cells = <0>;
+			};
+		};
+
+		ufs_card_hc: ufs@1da4000 {
+			compatible = "qcom,sc8280xp-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0 0x01da4000 0 0x3000>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufs_card_phy_lanes>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <2>;
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_CARD_BCR>;
+			reset-names = "rst";
+
+			power-domains = <&gcc UFS_CARD_GDSC>;
+
+			iommus = <&apps_smmu 0x4a0 0x0>;
+
+			clocks = <&gcc GCC_UFS_CARD_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_CARD_AXI_CLK>,
+				 <&gcc GCC_UFS_CARD_AHB_CLK>,
+				 <&gcc GCC_UFS_CARD_UNIPRO_CORE_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_CARD_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_CARD_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_CARD_RX_SYMBOL_1_CLK>;
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "rx_lane1_sync_clk";
+			freq-table-hz = <75000000 300000000>,
+					<0 0>,
+					<0 0>,
+					<75000000 300000000>,
+					<0 0>,
+					<0 0>,
+					<0 0>,
+					<0 0>;
+			status = "disabled";
+		};
+
+		ufs_card_phy: phy@1da7000 {
+			compatible = "qcom,sc8280xp-qmp-ufs-phy";
+			reg = <0 0x01da7000 0 0xe10>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clock-names = "ref",
+				      "ref_aux";
+			clocks = <&gcc GCC_UFS_1_CARD_CLKREF_CLK>,
+				 <&gcc GCC_UFS_CARD_PHY_AUX_CLK>;
+
+			resets = <&ufs_card_hc 0>;
+			reset-names = "ufsphy";
+
+			status = "disabled";
+
+			ufs_card_phy_lanes: phy@1da7400 {
+				reg = <0 0x01da7400 0 0x108>,
+				      <0 0x01da7600 0 0x1e0>,
+				      <0 0x01da7c00 0 0x1dc>,
+				      <0 0x01da7800 0 0x108>,
+				      <0 0x01da7a00 0 0x1e0>;
+				#phy-cells = <0>;
+				#clock-cells = <0>;
+			};
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		usb_0_hsphy: phy@88e5000 {
+			compatible = "qcom,sc8280xp-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088e5000 0 0x400>;
+			clocks = <&gcc GCC_USB2_HS0_CLKREF_CLK>;
+			clock-names = "ref";
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_hsphy0: phy@88e7000 {
+			compatible = "qcom,sc8280xp-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088e7000 0 0x400>;
+			clocks = <&gcc GCC_USB2_HS0_CLKREF_CLK>;
+			clock-names = "ref";
+			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_hsphy1: phy@88e8000 {
+			compatible = "qcom,sc8280xp-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088e8000 0 0x400>;
+			clocks = <&gcc GCC_USB2_HS1_CLKREF_CLK>;
+			clock-names = "ref";
+			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_hsphy2: phy@88e9000 {
+			compatible = "qcom,sc8280xp-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088e9000 0 0x400>;
+			clocks = <&gcc GCC_USB2_HS2_CLKREF_CLK>;
+			clock-names = "ref";
+			resets = <&gcc GCC_QUSB2PHY_HS2_MP_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_hsphy3: phy@88ea000 {
+			compatible = "qcom,sc8280xp-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088ea000 0 0x400>;
+			clocks = <&gcc GCC_USB2_HS3_CLKREF_CLK>;
+			clock-names = "ref";
+			resets = <&gcc GCC_QUSB2PHY_HS3_MP_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_qmpphy0: phy-wrapper@88ef000 {
+			compatible = "qcom,sc8280xp-qmp-usb3-uni-phy";
+			reg = <0 0x088ef000 0 0x1c8>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_MP0_CLKREF_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>;
+			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
+
+			resets = <&gcc GCC_USB3_UNIPHY_MP0_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
+			reset-names = "phy", "common";
+
+			power-domains = <&gcc USB30_MP_GDSC>;
+
+			status = "disabled";
+
+			usb_2_ssphy0: phy@88efe00 {
+				reg = <0 0x088efe00 0 0x160>,
+				      <0 0x088f0000 0 0x1ec>,
+				      <0 0x088ef200 0 0x1f0>;
+				#phy-cells = <0>;
+				#clock-cells = <0>;
+				clocks = <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "usb2_phy0_pipe_clk";
+			};
+		};
+
+		usb_2_qmpphy1: phy-wrapper@88f1000 {
+			compatible = "qcom,sc8280xp-qmp-usb3-uni-phy";
+			reg = <0 0x088f1000 0 0x1c8>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_MP1_CLKREF_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>;
+			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
+
+			resets = <&gcc GCC_USB3_UNIPHY_MP1_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP1_BCR>;
+			reset-names = "phy", "common";
+
+			power-domains = <&gcc USB30_MP_GDSC>;
+
+			status = "disabled";
+
+			usb_2_ssphy1: phy@88f1e00 {
+				reg = <0 0x088f1e00 0 0x160>,
+				      <0 0x088f2000 0 0x1ec>,
+				      <0 0x088f1200 0 0x1f0>;
+				#phy-cells = <0>;
+				#clock-cells = <0>;
+				clocks = <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "usb2_phy1_pipe_clk";
+			};
+		};
+
+		remoteproc_adsp: remoteproc@3000000 {
+			compatible = "qcom,sc8280xp-adsp-pas";
+			reg = <0 0x03000000 0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack", "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SC8280XP_LCX>,
+					<&rpmhpd SC8280XP_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			memory-region = <&pil_adsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			remoteproc_adsp_glink: glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+			};
+		};
+
+		usb_0_qmpphy: phy-wrapper@88ec000 {
+			compatible = "qcom,sc8280xp-qmp-usb43dp-phy";
+			reg = <0 0x088ec000 0 0x1e4>,
+			      <0 0x088eb000 0 0x40>,
+			      <0 0x088ed000 0 0x1c8>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB4_EUD_CLKREF_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
+			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+			reset-names = "phy", "common";
+
+			power-domains = <&gcc USB30_PRIM_GDSC>;
+
+			status = "disabled";
+
+			usb_0_ssphy: usb3-phy@88eb400 {
+				reg = <0 0x088eb400 0 0x100>,
+				      <0 0x088eb600 0 0x3ec>,
+				      <0 0x088ec400 0 0x1f0>,
+				      <0 0x088eba00 0 0x100>,
+				      <0 0x088ebc00 0 0x3ec>,
+				      <0 0x088ec700 0 0x64>;
+				#phy-cells = <0>;
+				#clock-cells = <0>;
+				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "usb0_phy_pipe_clk_src";
+			};
+
+			usb_0_dpphy: dp-phy@88ed200 {
+				reg = <0 0x088ed200 0 0x200>,
+				      <0 0x088ed400 0 0x200>,
+				      <0 0x088eda00 0 0x200>,
+				      <0 0x088ea600 0 0x200>,
+				      <0 0x088ea800 0 0x200>;
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+			};
+		};
+
+		usb_1_hsphy: phy@8902000 {
+			compatible = "qcom,sc8280xp-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x08902000 0 0x400>;
+			#phy-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_1_qmpphy: phy-wrapper@8904000 {
+			compatible = "qcom,sc8280xp-qmp-usb43dp-phy";
+			reg = <0 0x08904000 0 0x1e4>,
+			      <0 0x08903000 0 0x40>,
+			      <0 0x08905000 0 0x1c8>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB4_CLKREF_CLK>,
+				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
+			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
+
+			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
+				 <&gcc GCC_USB4_1_DP_PHY_PRIM_BCR>;
+			reset-names = "phy", "common";
+
+			power-domains = <&gcc USB30_SEC_GDSC>;
+
+			status = "disabled";
+
+			usb_1_ssphy: usb3-phy@8903400 {
+				reg = <0 0x08903400 0 0x100>,
+				      <0 0x08903c00 0 0x3ec>,
+				      <0 0x08904400 0 0x1f0>,
+				      <0 0x08903a00 0 0x100>,
+				      <0 0x08903c00 0 0x3ec>,
+				      <0 0x08904200 0 0x18>;
+				#phy-cells = <0>;
+				#clock-cells = <0>;
+				clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "usb1_phy_pipe_clk_src";
+			};
+
+			usb_1_dpphy: dp-phy@88ed200 {
+				reg = <0 0x08904200 0 0x200>,
+				      <0 0x08904400 0 0x200>,
+				      <0 0x08904a00 0 0x200>,
+				      <0 0x08904600 0 0x200>,
+				      <0 0x08904800 0 0x200>;
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+			};
+		};
+
+		system-cache-controller@9200000 {
+			compatible = "qcom,sc8280xp-llcc";
+			reg = <0 0x09200000 0 0x58000>, <0 0x09600000 0 0x58000>;
+			reg-names = "llcc_base", "llcc_broadcast_base";
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		usb_0: usb@a6f8800 {
+			compatible = "qcom,sc8280xp-dwc3", "qcom,dwc3";
+			reg = <0 0x0a6f8800 0 0x400>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB_NOC_NORTH_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB_NOC_SOUTH_AXI_CLK>,
+				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
+			clock-names = "core", "iface", "bus_aggr", "utmi", "sleep",
+				      "noc_aggr", "noc_aggr_north", "noc_aggr_south", "noc_sys";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
+					  "dm_hs_phy_irq", "ss_phy_irq";
+
+			power-domains = <&gcc USB30_PRIM_GDSC>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			status = "disabled";
+
+			usb_0_dwc3: usb@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a600000 0 0xcd00>;
+				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0x820 0x0>;
+				phys = <&usb_0_hsphy>, <&usb_0_ssphy>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
+
+		usb_1: usb@a8f8800 {
+			compatible = "qcom,sc8280xp-dwc3", "qcom,dwc3";
+			reg = <0 0x0a8f8800 0 0x400>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_USB30_SEC_MASTER_CLK>,
+				 <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
+				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB_NOC_NORTH_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB_NOC_SOUTH_AXI_CLK>,
+				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
+			clock-names = "core", "iface", "bus_aggr", "utmi", "sleep",
+				      "noc_aggr", "noc_aggr_north", "noc_aggr_south", "noc_sys";
+
+			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
+					  "dm_hs_phy_irq", "ss_phy_irq";
+
+			power-domains = <&gcc USB30_SEC_GDSC>;
+
+			resets = <&gcc GCC_USB30_SEC_BCR>;
+
+			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_1 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			status = "disabled";
+
+			usb_1_dwc3: usb@a800000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a800000 0 0xcd00>;
+				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0x860 0x0>;
+				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sc8280xp-pdc", "qcom,pdc";
+			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			qcom,pdc-ranges = <0 480 40>,
+					  <40 140 14>,
+					  <54 263 1>,
+					  <55 306 4>,
+					  <59 312 3>,
+					  <62 374 2>,
+					  <64 434 2>,
+					  <66 438 3>,
+					  <69 86 1>,
+					  <70 520 54>,
+					  <124 609 28>,
+					  <159 638 1>,
+					  <160 720 8>,
+					  <168 801 1>,
+					  <169 728 30>,
+					  <199 416 2>,
+					  <201 449 1>,
+					  <202 89 1>,
+					  <203 451 1>,
+					  <204 462 1>,
+					  <205 264 1>,
+					  <206 579 1>,
+					  <207 653 1>,
+					  <208 656 1>,
+					  <209 659 1>,
+					  <210 122 1>,
+					  <211 699 1>,
+					  <212 705 1>,
+					  <213 450 1>,
+					  <214 643 1>,
+					  <216 646 5>,
+					  <221 390 5>,
+					  <226 700 3>,
+					  <229 240 3>,
+					  <232 269 1>,
+					  <233 377 1>,
+					  <234 372 1>,
+					  <235 138 1>,
+					  <236 857 1>,
+					  <237 860 1>,
+					  <238 137 1>,
+					  <239 668 1>,
+					  <240 366 1>,
+					  <241 949 1>,
+					  <242 815 5>,
+					  <247 769 1>,
+					  <248 768 1>,
+					  <249 663 1>,
+					  <250 799 2>,
+					  <252 798 1>,
+					  <253 765 1>,
+					  <254 763 1>,
+					  <255 454 1>,
+					  <258 139 1>,
+					  <259 786 2>,
+					  <261 370 2>,
+					  <263 158 2>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		tsens0: thermal-sensor@c263000 {
+			compatible = "qcom,sc8280xp-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c263000 0 0x1ff>, /* TM */
+			      <0 0x0c222000 0 0x8>; /* SROT */
+			#qcom,sensors = <14>;
+			interrupts-extended = <&pdc 26 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 28 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c265000 {
+			compatible = "qcom,sc8280xp-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c265000 0 0x1ff>, /* TM */
+			      <0 0x0c223000 0 0x8>; /* SROT */
+			#qcom,sensors = <16>;
+			interrupts-extended = <&pdc 27 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 29 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		aoss_qmp: power-controller@c300000 {
+			compatible = "qcom,sc8280xp-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0 0x0c300000 0 0x400>;
+			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			#clock-cells = <0>;
+		};
+
+		spmi_bus: spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0 0x0c440000 0 0x1100>,
+			      <0 0x0c600000 0 0x2000000>,
+			      <0 0x0e600000 0 0x100000>,
+			      <0 0x0e700000 0 0xa0000>,
+			      <0 0x0c40a000 0 0x26000>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,sc8280xp-tlmm";
+			reg = <0 0x0f100000 0 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 230>;
+		};
+
+		apps_smmu: iommu@15000000 {
+			compatible = "qcom,sc8280xp-smmu-500", "arm,mmu-500";
+			reg = <0 0x15000000 0 0x100000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 711 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 713 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 714 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 912 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 911 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 909 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 908 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 906 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 905 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 904 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 902 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 901 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 900 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 899 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 898 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 896 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 895 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 894 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 893 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 892 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 891 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 890 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		intc: interrupt-controller@17a00000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x0 0x17a00000 0x0 0x10000>,	/* GICD */
+			      <0x0 0x17a60000 0x0 0x100000>;	/* GICR * 8 */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0 0x20000>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			gic-its@17a40000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0 0x17a40000 0 0x20000>;
+				msi-controller;
+				#msi-cells = <1>;
+			};
+		};
+
+		watchdog@17c10000 {
+			compatible = "qcom,apss-wdt-sc8280xp", "qcom,kpss-wdt";
+			reg = <0 0x17c10000 0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		timer@17c20000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x17c20000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@17c21000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c21000 0x1000>,
+				      <0x17c22000 0x1000>;
+			};
+
+			frame@17c23000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c23000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c25000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c25000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c27000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c26000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c29000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c29000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2b000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c2b000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2d000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c2d000 0x1000>;
+				status = "disabled";
+			};
+		};
+
+		apps_rsc: rsc@18200000 {
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x0 0x18200000 0x0 0x10000>,
+				<0x0 0x18210000 0x0 0x10000>,
+				<0x0 0x18220000 0x0 0x10000>;
+			reg-names = "drv-0", "drv-1", "drv-2";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
+					  <WAKE_TCS    3>, <CONTROL_TCS 1>;
+			label = "apps_rsc";
+
+			apps_bcm_voter: bcm-voter {
+				compatible = "qcom,bcm-voter";
+			};
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,sc8280xp-rpmh-clk";
+				#clock-cells = <1>;
+				clock-names = "xo";
+				clocks = <&xo_board_clk>;
+			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,sc8280xp-rpmhpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp1 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp2 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_svs: opp4 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l1: opp5 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_nom: opp6 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp7 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp8 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp9 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp10 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+				};
+			};
+		};
+
+		cpufreq_hw: cpufreq@18591000 {
+			compatible = "qcom,sc8280xp-cpufreq-epss", "qcom,cpufreq-epss";
+			reg = <0 0x18591000 0 0x1000>,
+			      <0 0x18592000 0 0x1000>;
+			reg-names = "freq-domain0", "freq-domain1";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+		};
+
+		remoteproc_nsp0: remoteproc@1b300000 {
+			compatible = "qcom,sc8280xp-nsp0-pas";
+			reg = <0 0x1b300000 0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_nsp0_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_nsp0_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_nsp0_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_nsp0_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SC8280XP_NSP>;
+			power-domain-names = "nsp";
+
+			memory-region = <&pil_nsp0_mem>;
+
+			qcom,smem-states = <&smp2p_nsp0_out 0>;
+			qcom,smem-state-names = "stop";
+
+			interconnects = <&nspa_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "nsp0";
+				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x3181 0x0420>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x3182 0x0420>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x3183 0x0420>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x3184 0x0420>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x3185 0x0420>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x3186 0x0420>;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x3187 0x0420>;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x3188 0x0420>;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu 0x318b 0x0420>;
+					};
+
+					compute-cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+						iommus = <&apps_smmu 0x318b 0x0420>;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&apps_smmu 0x318c 0x0420>;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x318d 0x0420>;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x318e 0x0420>;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x318f 0x0420>;
+					};
+				};
+			};
+		};
+
+		remoteproc_nsp1: remoteproc@21300000 {
+			compatible = "qcom,sc8280xp-nsp1-pas";
+			reg = <0 0x21300000 0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 887 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_nsp1_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_nsp1_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_nsp1_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_nsp1_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SC8280XP_NSP>;
+			power-domain-names = "nsp";
+
+			memory-region = <&pil_nsp1_mem>;
+
+			qcom,smem-states = <&smp2p_nsp1_out 0>;
+			qcom,smem-state-names = "stop";
+
+			interconnects = <&nspb_noc MASTER_CDSP_PROC_B 0 &mc_virt SLAVE_EBI1 0>;
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_NSP1
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_NSP1
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "nsp1";
+				qcom,remote-pid = <12>;
+			};
+		};
+	};
+
+	thermal-zones {
+		cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu3-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cluster0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		mem-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 15>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <19200000>;
+	};
+};
-- 
2.35.1

