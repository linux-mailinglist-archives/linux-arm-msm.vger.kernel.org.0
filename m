Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E61924BB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 11:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbfEUJfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 05:35:51 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:33474 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727721AbfEUJfu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 05:35:50 -0400
Received: by mail-pf1-f182.google.com with SMTP id z28so8800960pfk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=hZWhk/gl4Z1xokw4cH1p9gk38btAaqLGCZ6mHMUmOeE=;
        b=SPA5OfjVrYpfVS1IJi1xsatjBTD09NwSLSRhDSmmGdnQg+rsuD2X/EE08O6ebZZ8lG
         aTs+XhB0rBnOwGPSdC8sGipdGYJ4i87mQ2aLfmZGKAx1FxAIXCCDx1UQLUOgQaEW3MH3
         QKq/qfRlwaPIYyAEOvxnyeSQO/dsKbz/EEyGqBiO3xuP+QF5lHVotRK2RNmz6UyM1y9k
         0Sntkoawv1bOeSwkTRQnLpmEU4XZw4fFgYxvxeDWmKp/wxUqF7UJUxhVpYdiFe3YQo7I
         QneV163SoataU4a3jv/CA836uFA08skF1hnTnzbeTdw7o0sci8jp7pyMWxOGmyrnIK+M
         SX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=hZWhk/gl4Z1xokw4cH1p9gk38btAaqLGCZ6mHMUmOeE=;
        b=eXKd4tMES0bU7C7Uk4NQskhyhMAbCmRnxhtJkrzqjmnw+JCQ/jEMEymfqoXJ9hgQeC
         tpTwBhTATwytpYscGN5BgS0LLoz+nkBE/VQo9sJAR7+faT9alztNiSXwPmFMm6jXkJMT
         Dy/f8LYgS3p+BGrMxNxv6CAOtsD8s7qzFNUwPRf5eecAxU/9WFP8PmOFnqjN1l8TLILC
         iGeKpTE3NipjZ8R2mkzpG2B1zJOQQBC/Nyo22FWkU49M60YxsQTFGkF+M4TNR2K7LPrD
         /UezVOFy1AgJPvtjyfAweHomLHwpWEOIDNFCAHiP53LhyitYFkr589tqB1xD25gxyEdH
         T9Jw==
X-Gm-Message-State: APjAAAX/9imTBTdfpIJI7Jkvbu9bT0g0ECgPW1tkq5bXcZuXPxdYDul3
        QFUUT/e0v8nCCtDN6Tem71tZ3A==
X-Google-Smtp-Source: APXvYqxpxk8AHmOonyD/hyp/wyBi5bADJ4v5QVn1MAJCqJyoz/1L+ont6i1ZIiHyWEmrjpTKec9YTA==
X-Received: by 2002:a63:1c10:: with SMTP id c16mr54781596pgc.442.1558431349298;
        Tue, 21 May 2019 02:35:49 -0700 (PDT)
Received: from localhost ([49.248.189.249])
        by smtp.gmail.com with ESMTPSA id i22sm23139715pfa.127.2019.05.21.02.35.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 02:35:48 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        niklas.cassel@linaro.org, marc.w.gonzalez@free.fr,
        sibis@codeaurora.org, daniel.lezcano@linaro.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low power states
Date:   Tue, 21 May 2019 15:05:17 +0530
Message-Id: <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1558430617.git.amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1558430617.git.amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device bindings for cpuidle states for cpu devices.

Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 3fd0769fe648..54810980fcf9 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -78,6 +78,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
@@ -97,6 +98,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_1: l1-icache {
@@ -112,6 +114,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_2: l1-icache {
@@ -127,6 +130,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_3: l1-icache {
@@ -142,6 +146,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L2_1: l2-cache {
@@ -161,6 +166,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_101: l1-icache {
@@ -176,6 +182,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_102: l1-icache {
@@ -191,6 +198,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_103: l1-icache {
@@ -238,6 +246,48 @@
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
+				arm,psci-suspend-param = <0x00000003>;
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
+				arm,psci-suspend-param = <0x00000003>;
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

