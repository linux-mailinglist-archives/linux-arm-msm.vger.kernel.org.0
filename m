Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A88E0707B85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 10:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjERIAu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 04:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjERIAs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 04:00:48 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E22026BB
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 01:00:41 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso1567457a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 01:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684396840; x=1686988840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TgYSnMvA6ezwyyP8eCZTJXYpJzBXYDRQ57YFla6122E=;
        b=v1AjnKj/ROhgb72wjEOK4l0EkscR9zKahVAFiz7Eqzo3NBmIw/d75o/qY+GaAHMCx1
         4CX6PPkTGRyWikgyJ/U5JQo7w3NjDwVe/LbvKpmsP3kiOwlqC/t0cS61Uv7tFjkrqgjH
         A3NZxc4vUUlPe0HyiVZAzm7FdbyZv1s8s1RJbP9Pr+qwP34OLl7j3NZ0WdPBMcuXGlxU
         9E2M2PoE/SKh5FW4DhzWTOY/s9tF4Aiv2LsKKEpZ5HOwRhHAOVeUGn3lkBgMvj3GQh6f
         V5Uw5rQuy6PfFTveoZXc4Z2o0H6F29HwcUvOq7J1T98WRBkOQG8dbwPS21NR4+kFRsLI
         yxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684396840; x=1686988840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgYSnMvA6ezwyyP8eCZTJXYpJzBXYDRQ57YFla6122E=;
        b=XRJLmjovbN6zYX5mvgmKmAwe9d2owzPF0IDbZ87RcL0m6SF+8rx3xl4MsMx9xBjoTu
         2wddJkCBEjJyK2M7/bVAw1Mg3qcvYS6B9DRiKEoA5bA0ixjx8Y28Q3GFIuGzQKvSkfa/
         paat+57oceKmT4yz9DVHZA6Dy+PGb3Od1qtBC0XMWqSyvbd/o5Ez6OQzP6RB4+16vYda
         O9iEK5/jXaC87d3xXgVrvuYxZTqx5RZaXbxpzbK1DAlNVAYkzMVkbvkxRAvm9r1+D2EM
         DK2roTzH9CzRj4vQEb666xsUTx+uGw36O762Uz+Qa7ENuknh+lSEhfr2dm1vzxscShyT
         5mvA==
X-Gm-Message-State: AC+VfDx3QqekXLdaxrzrFYuprWuXqPZpNpCjS4w8WcynMQrRfSgDKm0N
        qlNp+eMjpSlL+pZSAX2+IMYyjrA7u5XcUrIyHB0=
X-Google-Smtp-Source: ACHHUZ4ZG2/MI8h24ZuyOpvIlhFgQbAxt+8I+M88Y/0QT+7HPVi8prftrMVpU7oHQ9VJeHaauwrnCA==
X-Received: by 2002:a05:6a20:4409:b0:101:2ad0:134c with SMTP id ce9-20020a056a20440900b001012ad0134cmr1543687pzb.45.1684396840408;
        Thu, 18 May 2023 01:00:40 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:d309:883d:817e:8e91:be39])
        by smtp.gmail.com with ESMTPSA id t14-20020a63444e000000b0051b36aee4f6sm659358pgk.83.2023.05.18.01.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 01:00:40 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/1] arm64: dts: qcom: sm6115: Add CPU idle-states
Date:   Thu, 18 May 2023 13:30:31 +0530
Message-Id: <20230518080031.2509250-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add CPU idle-state nodes and power-domains in Qualcomm sm6115 SoC dtsi.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---

Changes since v2:
- v2 can be viewed here: https://lore.kernel.org/linux-arm-msm/20230330193303.612475-1-bhupesh.sharma@linaro.org/
- v2 has no functional change, except I tested using debugfs/sysfs and
  the idle states looked sane to me.

Changes since v1:
- v1 can be viewed here: https://lore.kernel.org/lkml/e5cda4cf-5c2a-a7ed-9e1d-1fe9f2cbef40@linaro.org
- Addressed Konrad's comments on v1 and added GDHS and Power Collapse
  cluster power states.

 arch/arm64/boot/dts/qcom/sm6115.dtsi | 136 +++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 631ca327e064..0cfccde38f70 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -47,6 +47,8 @@ CPU0: cpu@0 {
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&CPU_PD0>;
+			power-domain-names = "psci";
 			L2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -63,6 +65,8 @@ CPU1: cpu@1 {
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&CPU_PD1>;
+			power-domain-names = "psci";
 		};
 
 		CPU2: cpu@2 {
@@ -75,6 +79,8 @@ CPU2: cpu@2 {
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&CPU_PD2>;
+			power-domain-names = "psci";
 		};
 
 		CPU3: cpu@3 {
@@ -87,6 +93,8 @@ CPU3: cpu@3 {
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&CPU_PD3>;
+			power-domain-names = "psci";
 		};
 
 		CPU4: cpu@100 {
@@ -99,6 +107,8 @@ CPU4: cpu@100 {
 			dynamic-power-coefficient = <282>;
 			next-level-cache = <&L2_1>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			power-domains = <&CPU_PD4>;
+			power-domain-names = "psci";
 			L2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -115,6 +125,8 @@ CPU5: cpu@101 {
 			enable-method = "psci";
 			next-level-cache = <&L2_1>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			power-domains = <&CPU_PD5>;
+			power-domain-names = "psci";
 		};
 
 		CPU6: cpu@102 {
@@ -127,6 +139,8 @@ CPU6: cpu@102 {
 			enable-method = "psci";
 			next-level-cache = <&L2_1>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			power-domains = <&CPU_PD6>;
+			power-domain-names = "psci";
 		};
 
 		CPU7: cpu@103 {
@@ -139,6 +153,8 @@ CPU7: cpu@103 {
 			enable-method = "psci";
 			next-level-cache = <&L2_1>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			power-domains = <&CPU_PD7>;
+			power-domain-names = "psci";
 		};
 
 		cpu-map {
@@ -178,6 +194,68 @@ core3 {
 				};
 			};
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "silver-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <290>;
+				exit-latency-us = <376>;
+				min-residency-us = <1182>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "gold-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <297>;
+				exit-latency-us = <324>;
+				min-residency-us = <1110>;
+				local-timer-stop;
+			};
+		};
+
+		domain-idle-states {
+			CLUSTER_0_SLEEP_0: cluster-sleep-0-0 {
+				/* GDHS */
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x40000022>;
+				entry-latency-us = <360>;
+				exit-latency-us = <421>;
+				min-residency-us = <782>;
+			};
+
+			CLUSTER_0_SLEEP_1: cluster-sleep-0-1 {
+				/* Power Collapse */
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <800>;
+				exit-latency-us = <2118>;
+				min-residency-us = <7376>;
+			};
+
+			CLUSTER_1_SLEEP_0: cluster-sleep-1-0 {
+				/* GDHS */
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x40000042>;
+				entry-latency-us = <314>;
+				exit-latency-us = <345>;
+				min-residency-us = <660>;
+			};
+
+			CLUSTER_1_SLEEP_1: cluster-sleep-1-1 {
+				/* Power Collapse */
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <640>;
+				exit-latency-us = <1654>;
+				min-residency-us = <8094>;
+			};
+		};
 	};
 
 	firmware {
@@ -201,6 +279,64 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+
+		CPU_PD0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_0_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+		};
+
+		CPU_PD1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_0_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+		};
+
+		CPU_PD2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_0_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+		};
+
+		CPU_PD3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_0_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+		};
+
+		CPU_PD4: power-domain-cpu4 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_1_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+		};
+
+		CPU_PD5: power-domain-cpu5 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_1_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+		};
+
+		CPU_PD6: power-domain-cpu6 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_1_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+		};
+
+		CPU_PD7: power-domain-cpu7 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_1_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+		};
+
+		CLUSTER_0_PD: power-domain-cpu-cluster0 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&CLUSTER_0_SLEEP_0>, <&CLUSTER_0_SLEEP_1>;
+		};
+
+		CLUSTER_1_PD: power-domain-cpu-cluster1 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&CLUSTER_1_SLEEP_0>, <&CLUSTER_1_SLEEP_1>;
+		};
 	};
 
 	reserved_memory: reserved-memory {
-- 
2.38.1

