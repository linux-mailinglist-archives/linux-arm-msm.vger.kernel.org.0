Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F80724BBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 11:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbfEUJfy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 05:35:54 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40099 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727751AbfEUJfx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 05:35:53 -0400
Received: by mail-pl1-f195.google.com with SMTP id g69so8173264plb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 02:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=OuNFZ+SA9/lFwmBNRAIREtDsjJ8h7DxrY2zk1C9lBgk=;
        b=dT03vwkKl0VvPQzyLmlH7/Me42fNULDZR/1F3dZ50wPF5Gv9UgPhYu0y5zQaURZVc5
         DmPIY+QoeT4Hj2bL+iptaMWD1Q36GjNHZVzwiTMxO/hdJQiwiJLPzZzelsMy0nDP7XDl
         SXv0xco2jE2phUS2oFSBwQuAAUtWrPIG0HdsHTCfFwCA+8u2lAz/OaVn+ZbB1TE+RG8B
         OGgFYuFUrsdk/JSE1S29UtpNuRxDuLWUPRdZ6pYNkGtUcq6xiAumR/xOSMa4s+UQ1Hzg
         8YDphoW6QPNvms46GQ3Wde5n/n+LoluYdBTTbMGiJFZKvCGkyv5bhZY+RfWYC2DFIvpq
         FDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=OuNFZ+SA9/lFwmBNRAIREtDsjJ8h7DxrY2zk1C9lBgk=;
        b=s2uiByCgzM19RarOiLV7k1lsc8s75L/zoTP7Wj1Gv/VJoGAZp/B9TNLQPb63h/GRn0
         OIOn7MGc9J9ew2TiKcaOuabgab1uuExaFFuO5YQeBEeNKxfWAPOc5yjAUKiy1YwatXBc
         bKYRsigiIFLoxKhldchvuDVI/2MNai2zBVwlcO6tHwGOZlAFS9g0U5xef0kh6bKtOtch
         i0TEE6cgDcXAv2R8f74/hR/d2p6xnrUKIqUT0n8GJSOspNXsn2Sb+5CNqsNe0sIdYdjv
         Osw/Y6X4rz3td00L4YfqJA0qflGKmhOTHflrfYcHluOfz2RVUdqlBziW6l9dK+C6lDZF
         pe1w==
X-Gm-Message-State: APjAAAWSE3Fp+IvufxQFOfmVFAWjoIwpdBwyTg1Fa5FbWkX92qmPOi6U
        AOuRZWJrnckFhIqGriRpDIVdpw==
X-Google-Smtp-Source: APXvYqxTiCLcqQ+xKVgZIJREjsQAOln6NeTqSAkZvQqfeyJ8qXZ0xEsQVytx1JHvArSZWm0wegvicg==
X-Received: by 2002:a17:902:46a:: with SMTP id 97mr53341531ple.66.1558431352778;
        Tue, 21 May 2019 02:35:52 -0700 (PDT)
Received: from localhost ([49.248.189.249])
        by smtp.gmail.com with ESMTPSA id y10sm17013586pfm.68.2019.05.21.02.35.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 02:35:52 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        niklas.cassel@linaro.org, marc.w.gonzalez@free.fr,
        sibis@codeaurora.org, daniel.lezcano@linaro.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>, mkshah@codeaurora.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 8/9] arm64: dts: qcom: sdm845: Add PSCI cpuidle low power states
Date:   Tue, 21 May 2019 15:05:18 +0530
Message-Id: <67d61032221b069082222347fb56effe17d4a7c3.1558430617.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1558430617.git.amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1558430617.git.amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>

Add device bindings for cpuidle states for cpu devices.

Cc: <mkshah@codeaurora.org>
Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
Reviewed-by: Evan Green <evgreen@chromium.org>
[amit: rename the idle-states to more generic names and fixups]
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5308f1671824..a0ae6bf033ee 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -119,6 +119,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
@@ -136,6 +137,8 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1
+					   &CLUSTER_SLEEP_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_100>;
@@ -150,6 +153,8 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1
+					   &CLUSTER_SLEEP_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_200>;
@@ -164,6 +169,8 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1
+					   &CLUSTER_SLEEP_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_300>;
@@ -178,6 +185,8 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1
+					   &CLUSTER_SLEEP_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_400>;
@@ -192,6 +201,8 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1
+					   &CLUSTER_SLEEP_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_500>;
@@ -206,6 +217,8 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x600>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1
+					   &CLUSTER_SLEEP_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_600>;
@@ -220,6 +233,8 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x700>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1
+					   &CLUSTER_SLEEP_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_700>;
@@ -228,6 +243,60 @@
 				next-level-cache = <&L3_0>;
 			};
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <350>;
+				exit-latency-us = <461>;
+				min-residency-us = <1890>;
+				local-timer-stop;
+			};
+
+			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-rail-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <360>;
+				exit-latency-us = <531>;
+				min-residency-us = <3934>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <264>;
+				exit-latency-us = <621>;
+				min-residency-us = <952>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-rail-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <702>;
+				exit-latency-us = <1061>;
+				min-residency-us = <4488>;
+				local-timer-stop;
+			};
+
+			CLUSTER_SLEEP_0: cluster-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "cluster-power-down";
+				arm,psci-suspend-param = <0x400000F4>;
+				entry-latency-us = <3263>;
+				exit-latency-us = <6562>;
+				min-residency-us = <9987>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	pmu {
-- 
2.17.1

