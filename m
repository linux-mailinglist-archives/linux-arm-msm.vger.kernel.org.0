Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07C5B1BE09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 21:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfEMTbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 15:31:49 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38621 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfEMTbt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 15:31:49 -0400
Received: by mail-lj1-f193.google.com with SMTP id 14so12099813ljj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7AxPd/WiAkEtzi6eC4zcfxrPuKGzl2d+dQ6Z4/Ng9yA=;
        b=iguEcn8d2UHmA1BdPS+ybI3lkwBDS3Ab7tjgLTOWKG6wZ7qEdUTtbHKOqgM2Pnvm4B
         Xofw8r8SJPdY+sJxTtVFiOGqhI6kONaT2HlWPLlUPTFxNHUtX5OLL4bifccr+S/yXa3L
         1874f/2ZGLG1PlPpnMLUejT0OAYu+L+O/+Tjquwfhc9n4SfDn/aZgcGK8cGVd1V0uzUf
         PPof97i8Xu9/kDaXfsu5Hm2b0l3KZKU/pEG+zdRjUSm4VqyLizf/dMOcOLG7wEsnVQ0t
         p+FWaZl+/zA11ABliZ+oXMfD7J1aEnNIpgO0Q9nWUTv9CRs6+XpZ0/jLRxkxzf+u27O2
         FmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7AxPd/WiAkEtzi6eC4zcfxrPuKGzl2d+dQ6Z4/Ng9yA=;
        b=c0oyl7bYqSuPE9TJQPFJsOy5xZd/2yCVIBuDwctGuJVXvTfmx1jqbQ0MP/+QfQfZG+
         XuOlnWF7W8ZJqtFiJnU0IZMuxUPguWW0V6Ux/kjcHyAuSKbimDlH+9gTzabOCiR4JDuB
         dm1HHM+Fyg0KZfCe1R9FFyxVVWYiE+pwV/oDYoa0vxltK5LQe+1TOdg5KuwmehrhGDYl
         DGozeEcsmb9XHewzFRfEUO9O0m34vdssfKhCd+u/wtSZPaGE9tfnspfywQCpWd5Z81v7
         Bi1W2mBXtbUqo4/OMz2fmE/wZ5FDNFw/P2U4f5dx4f4bYkTIfup8nxHljhvEGXjaOev5
         52Hw==
X-Gm-Message-State: APjAAAVV6FQqw/Gt/LAPpn+jhqB7s+X8OUnUdvSoWkzyaa3Fi9JSNWNA
        35zXddSA8DQ0y0CCe55KQqubcA==
X-Google-Smtp-Source: APXvYqwxMWB7/4WyFA59ijUF+6dp1ja8lpTuNpIG+hVBnaOO/pbLdkkOZsUgbqrpPxXYczj1YuOnIA==
X-Received: by 2002:a2e:309:: with SMTP id 9mr15762950ljd.114.1557775419346;
        Mon, 13 May 2019 12:23:39 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id q21sm3449365lfa.84.2019.05.13.12.23.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 12:23:38 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Raju P . L . S . S . S . N" <rplsssn@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Kevin Hilman <khilman@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Souvik Chakravarty <souvik.chakravarty@arm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>
Subject: [PATCH 18/18] arm64: dts: hikey: Convert to the hierarchical CPU topology layout
Date:   Mon, 13 May 2019 21:23:00 +0200
Message-Id: <20190513192300.653-19-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513192300.653-1-ulf.hansson@linaro.org>
References: <20190513192300.653-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To enable the OS to manage last-man standing activities for a CPU, while an
idle state for a group of CPUs is selected, let's convert the Hikey
platform into using the hierarchical CPU topology layout.

Cc: Wei Xu <xuwei5@hisilicon.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes:
	- None.

---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 87 ++++++++++++++++++++---
 1 file changed, 76 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 108e2a4227f6..36ff460f428f 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -20,6 +20,64 @@
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
+
+		CPU_PD0: cpu-pd0 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD0>;
+			domain-idle-states = <&CPU_SLEEP>;
+		};
+
+		CPU_PD1: cpu-pd1 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD0>;
+			domain-idle-states = <&CPU_SLEEP>;
+		};
+
+		CPU_PD2: cpu-pd2 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD0>;
+			domain-idle-states = <&CPU_SLEEP>;
+		};
+
+		CPU_PD3: cpu-pd3 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD0>;
+			domain-idle-states = <&CPU_SLEEP>;
+		};
+
+		CPU_PD4: cpu-pd4 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD1>;
+			domain-idle-states = <&CPU_SLEEP>;
+		};
+
+		CPU_PD5: cpu-pd5 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD1>;
+			domain-idle-states = <&CPU_SLEEP>;
+		};
+
+		CPU_PD6: cpu-pd6 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD1>;
+			domain-idle-states = <&CPU_SLEEP>;
+		};
+
+		CPU_PD7: cpu-pd7 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD1>;
+			domain-idle-states = <&CPU_SLEEP>;
+		};
+
+		CLUSTER_PD0: cluster-pd0 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&CLUSTER_SLEEP>;
+		};
+
+		CLUSTER_PD1: cluster-pd1 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&CLUSTER_SLEEP>;
+		};
 	};
 
 	cpus {
@@ -70,9 +128,8 @@
 			};
 
 			CLUSTER_SLEEP: cluster-sleep {
-				compatible = "arm,idle-state";
-				local-timer-stop;
-				arm,psci-suspend-param = <0x1010000>;
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x1000000>;
 				entry-latency-us = <1000>;
 				exit-latency-us = <700>;
 				min-residency-us = <2700>;
@@ -88,9 +145,10 @@
 			next-level-cache = <&CLUSTER0_L2>;
 			clocks = <&stub_clock 0>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 			#cooling-cells = <2>; /* min followed by max */
 			dynamic-power-coefficient = <311>;
+			power-domains = <&CPU_PD0>;
+			power-domain-names = "psci";
 		};
 
 		cpu1: cpu@1 {
@@ -101,9 +159,10 @@
 			next-level-cache = <&CLUSTER0_L2>;
 			clocks = <&stub_clock 0>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 			#cooling-cells = <2>; /* min followed by max */
 			dynamic-power-coefficient = <311>;
+			power-domains = <&CPU_PD1>;
+			power-domain-names = "psci";
 		};
 
 		cpu2: cpu@2 {
@@ -114,9 +173,10 @@
 			next-level-cache = <&CLUSTER0_L2>;
 			clocks = <&stub_clock 0>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 			#cooling-cells = <2>; /* min followed by max */
 			dynamic-power-coefficient = <311>;
+			power-domains = <&CPU_PD2>;
+			power-domain-names = "psci";
 		};
 
 		cpu3: cpu@3 {
@@ -127,9 +187,10 @@
 			next-level-cache = <&CLUSTER0_L2>;
 			clocks = <&stub_clock 0>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 			#cooling-cells = <2>; /* min followed by max */
 			dynamic-power-coefficient = <311>;
+			power-domains = <&CPU_PD3>;
+			power-domain-names = "psci";
 		};
 
 		cpu4: cpu@100 {
@@ -140,9 +201,10 @@
 			next-level-cache = <&CLUSTER1_L2>;
 			clocks = <&stub_clock 0>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 			#cooling-cells = <2>; /* min followed by max */
 			dynamic-power-coefficient = <311>;
+			power-domains = <&CPU_PD4>;
+			power-domain-names = "psci";
 		};
 
 		cpu5: cpu@101 {
@@ -153,9 +215,10 @@
 			next-level-cache = <&CLUSTER1_L2>;
 			clocks = <&stub_clock 0>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 			#cooling-cells = <2>; /* min followed by max */
 			dynamic-power-coefficient = <311>;
+			power-domains = <&CPU_PD5>;
+			power-domain-names = "psci";
 		};
 
 		cpu6: cpu@102 {
@@ -166,9 +229,10 @@
 			next-level-cache = <&CLUSTER1_L2>;
 			clocks = <&stub_clock 0>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 			#cooling-cells = <2>; /* min followed by max */
 			dynamic-power-coefficient = <311>;
+			power-domains = <&CPU_PD6>;
+			power-domain-names = "psci";
 		};
 
 		cpu7: cpu@103 {
@@ -179,9 +243,10 @@
 			next-level-cache = <&CLUSTER1_L2>;
 			clocks = <&stub_clock 0>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 			#cooling-cells = <2>; /* min followed by max */
 			dynamic-power-coefficient = <311>;
+			power-domains = <&CPU_PD7>;
+			power-domain-names = "psci";
 		};
 
 		CLUSTER0_L2: l2-cache0 {
-- 
2.17.1

