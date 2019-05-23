Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 801AD27812
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 10:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbfEWIgx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 04:36:53 -0400
Received: from ns.iliad.fr ([212.27.33.1]:33786 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbfEWIgx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 04:36:53 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 7861C20B19;
        Thu, 23 May 2019 10:36:51 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 643AF208FF;
        Thu, 23 May 2019 10:36:51 +0200 (CEST)
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Andy Gross <agross@kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v3] arm64: dts: qcom: msm8998: Add PSCI cpuidle low power
 states
Message-ID: <346cd9f0-583d-f467-83d0-e73768bf5aac@free.fr>
Date:   Thu, 23 May 2019 10:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu May 23 10:36:51 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Amit Kucheria <amit.kucheria@linaro.org>

Add device bindings for cpuidle states for cpu devices.

[marc: rebase and fix arm,psci-suspend-param for power-collapse]
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
Bjorn, this is an updated/fixed (as documented above) version of
[PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low power states
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 412195b9794c..224f84e39204 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -78,6 +78,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
 				compatible = "arm,arch-cache";
@@ -96,6 +97,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			next-level-cache = <&L2_0>;
 			L1_I_1: l1-icache {
 				compatible = "arm,arch-cache";
@@ -110,6 +112,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			next-level-cache = <&L2_0>;
 			L1_I_2: l1-icache {
 				compatible = "arm,arch-cache";
@@ -124,6 +127,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			next-level-cache = <&L2_0>;
 			L1_I_3: l1-icache {
 				compatible = "arm,arch-cache";
@@ -138,6 +142,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			next-level-cache = <&L2_1>;
 			L2_1: l2-cache {
 				compatible = "arm,arch-cache";
@@ -156,6 +161,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			next-level-cache = <&L2_1>;
 			L1_I_101: l1-icache {
 				compatible = "arm,arch-cache";
@@ -170,6 +176,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			next-level-cache = <&L2_1>;
 			L1_I_102: l1-icache {
 				compatible = "arm,arch-cache";
@@ -184,6 +191,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			next-level-cache = <&L2_1>;
 			L1_I_103: l1-icache {
 				compatible = "arm,arch-cache";
@@ -230,6 +238,48 @@
 				};
 			};
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-retention";
+				arm,psci-suspend-param = <0x00000002>;
+				entry-latency-us = <43>;
+				exit-latency-us = <86>;
+				min-residency-us = <200>;
+			};
+
+			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <100>;
+				exit-latency-us = <612>;
+				min-residency-us = <1000>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-retention";
+				arm,psci-suspend-param = <0x00000002>;
+				entry-latency-us = <41>;
+				exit-latency-us = <82>;
+				min-residency-us = <200>;
+			};
+
+			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <100>;
+				exit-latency-us = <525>;
+				min-residency-us = <1000>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {
-- 
2.17.1
