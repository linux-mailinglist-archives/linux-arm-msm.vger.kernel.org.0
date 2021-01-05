Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5379D2EB3EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 21:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbhAEUL2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 15:11:28 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:56129 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725800AbhAEULX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 15:11:23 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 6E1E71180;
        Tue,  5 Jan 2021 15:10:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 05 Jan 2021 15:10:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdrag0n.dev; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=4Py02Jvhjsmn1sAsdBHXTHu4Y7
        pEH/8tMwuJWcwaspA=; b=TgjQqa3ZqRGa8haN3VtJRClkbsSoW+/jHP/Jz0DIx0
        hxz+3eRfEdorQj78R9uAhC4H5OuXEVGoUZ0BJzcN6wTM4ibdvECe5dkXBkI/0ga9
        d7M+qExnf7trxNwUAyPBFvOATEDDU6Iex+oN786aaejyH2obX+rahSC6k05pRPm2
        wX88wNwIFFdIOTKAviPuZGEWX6BjYBNzlHwknqZTSIRK6Z8FYVrsV0IV8/rh51Y9
        hwiodNWSe3dloYqznt4X5CPbrkYS/o+Axdcjob4Thkab54UH7TOiGZKB6AMh9M5s
        PZmEJecQ1HH4YQXrU/tNvYNa1ju4Uie4esGBViGkfWvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4Py02Jvhjsmn1sAsd
        BHXTHu4Y7pEH/8tMwuJWcwaspA=; b=g6Sn0Oa8CukWVQH3UPwMbBSZBx+IJRpgz
        pBG6fnKWgHLiO1SycuQoKgv/rJOcb2fEzsSEUuXP5t9GiZd4G8nObXgeP+lK4vYI
        W1gQVuwLBeNJBMNj5ANMOoZLUAKB873ddn6be7V/WZ5tW9iPHyyWRzK3neCD4rE0
        AW3EbD43UI/ia5mM/InBnzoR8l1wimnb6A3NbgZTMTGXj216Ih9VhF1S6E1Wg0wB
        yc+1ll3djWiegSL+sZmhONmFhiJa/lzMv2qYW/3RjhpZ1m4XD77dWyd+5b+zyPOt
        QLqbeh4U/XwQ7lnIHp7lr17FDgC3hK0Wsrb8/VRvPNH4RV3P0Uc/A==
X-ME-Sender: <xms:t8f0X3KvWmbjThekF8G8GqI6-7RH37C3FUcHQSMplSheXhSfmDUVgA>
    <xme:t8f0X7I7S-95oESyQwlEN62jswZFXTjiQGMktPle3wh0ly-mipyJ2aKG81PC-EjwF
    XtWphlbwmBA2iJ36ho>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefjedgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegoteeftdduqddtudculdduhedm
    necujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffrghnnhihuc
    fnihhnuceouggrnhhnhieskhgurhgrghdtnhdruggvvheqnecuggftrfgrthhtvghrnhep
    hfeihffglefgudefvdduledvfedvfefgieeuueefgeetffdukeeghfevtdeifeetnecukf
    hppedutdegrddvtddtrdduvdelrddvuddvnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepuggrnhhnhieskhgurhgrghdtnhdruggvvh
X-ME-Proxy: <xmx:t8f0X_uuItY2sa5KsxD482KokjNk4xOV0mTxyrsXEIE8V8bS4QDc1Q>
    <xmx:t8f0XwZvQZTyOjrxkqqULTWd9mNJLoQ_R9uXa8mQ2uaHjuQQwdDu-g>
    <xmx:t8f0X-ZtZ7OFzBlRiVHNEG1ZuxEkMNOKLSoBz7w07lYLH02CGM8BtA>
    <xmx:uMf0X1XduTEkdIy_yWnN7ulexWQl7aVZXv1gBJK0o0fx_wJQcwqEZg>
Received: from pinwheel.localdomain (unknown [104.200.129.212])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1EDFE108005B;
        Tue,  5 Jan 2021 15:10:31 -0500 (EST)
From:   Danny Lin <danny@kdrag0n.dev>
Cc:     Danny Lin <danny@kdrag0n.dev>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8150: Add support for deep CPU cluster idle
Date:   Tue,  5 Jan 2021 12:10:00 -0800
Message-Id: <20210105201000.913183-1-danny@kdrag0n.dev>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for deep idling of the entire unified DynamIQ
CPU cluster on sm8150. In this idle state, the LLCC (Last-Level Cache
Controller) is powered off and the AOP (Always-On Processor) enters a
low-power sleep state.

I'm not sure what the per-CPU 0x400000f4 idle state previously
contributed by Qualcomm as the "cluster sleep" state is, but the
downstream kernel has no such state. The real deep cluster idle state
is 0x41000c244, composed of:

    Cluster idle state: (0xc24) << 4 = 0xc240
    Is reset state: 1 << 30 = 0x40000000
    Affinity level: 1 << 24 = 0x1000000
    CPU idle state: 0x4 (power collapse)

This setup can be replicated with the PSCI power domain cpuidle driver,
which utilizes OSI to enter cluster idle when the last active CPU
enters idle.

The cluster idle state cannot be used as a plain cpuidle state because
it requires that all CPUs in the cluster are idling.

Signed-off-by: Danny Lin <danny@kdrag0n.dev>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 91 ++++++++++++++++++++++------
 1 file changed, 73 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 309e00b6fa44..8956c6986744 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -52,10 +52,10 @@ CPU0: cpu@0 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <488>;
 			dynamic-power-coefficient = <232>;
-			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&CPU_PD0>;
+			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_0: l2-cache {
 				compatible = "cache";
@@ -73,10 +73,10 @@ CPU1: cpu@100 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <488>;
 			dynamic-power-coefficient = <232>;
-			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&CPU_PD1>;
+			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_100: l2-cache {
 				compatible = "cache";
@@ -92,10 +92,10 @@ CPU2: cpu@200 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <488>;
 			dynamic-power-coefficient = <232>;
-			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_200>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&CPU_PD2>;
+			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_200: l2-cache {
 				compatible = "cache";
@@ -110,10 +110,10 @@ CPU3: cpu@300 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <488>;
 			dynamic-power-coefficient = <232>;
-			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_300>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&CPU_PD3>;
+			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_300: l2-cache {
 				compatible = "cache";
@@ -128,10 +128,10 @@ CPU4: cpu@400 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <369>;
-			cpu-idle-states = <&BIG_CPU_SLEEP_0
-					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_400>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			power-domains = <&CPU_PD4>;
+			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_400: l2-cache {
 				compatible = "cache";
@@ -146,10 +146,10 @@ CPU5: cpu@500 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <369>;
-			cpu-idle-states = <&BIG_CPU_SLEEP_0
-					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_500>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			power-domains = <&CPU_PD5>;
+			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_500: l2-cache {
 				compatible = "cache";
@@ -164,10 +164,10 @@ CPU6: cpu@600 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <369>;
-			cpu-idle-states = <&BIG_CPU_SLEEP_0
-					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_600>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			power-domains = <&CPU_PD6>;
+			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_600: l2-cache {
 				compatible = "cache";
@@ -182,10 +182,10 @@ CPU7: cpu@700 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <421>;
-			cpu-idle-states = <&BIG_CPU_SLEEP_0
-					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_700>;
 			qcom,freq-domain = <&cpufreq_hw 2>;
+			power-domains = <&CPU_PD7>;
+			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_700: l2-cache {
 				compatible = "cache";
@@ -251,11 +251,13 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 				min-residency-us = <4488>;
 				local-timer-stop;
 			};
+		};
 
+		domain-idle-states {
 			CLUSTER_SLEEP_0: cluster-sleep-0 {
-				compatible = "arm,idle-state";
+				compatible = "domain-idle-state";
 				idle-state-name = "cluster-power-collapse";
-				arm,psci-suspend-param = <0x400000F4>;
+				arm,psci-suspend-param = <0x4100c244>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;
 				min-residency-us = <9987>;
@@ -291,6 +293,59 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
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
 	};
 
 	reserved-memory {
-- 
2.29.2

