Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2441319D2BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 10:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgDCIxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 04:53:08 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34626 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbgDCIxI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 04:53:08 -0400
Received: by mail-wr1-f66.google.com with SMTP id 65so7561718wrl.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2020 01:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=+OXpb5EFpICXLw1io+wvQ9jUaJu3qsns/5/x5bYpZx4=;
        b=pL6XXTGk5UHWgUEva9YNpZFDlwICJOJlCL1NnyoJ4DtnvW7w6Et7/WCDPwIeYee4J+
         wTMSi2siQD2qqoGPSqDctPDz3+V14ULWnOV3nx5BREDysqtfnR/w7vuNCKYFs12n5NXL
         vwEEqwfGx+f6iRB3z6FcMrguU2p0id8BPZN44q+OouP/64jcMIdpT3QMRNNielubjlYn
         DtKAGv4Gx6qoIBlP5Dp+jHxPlMhxgF/8Kv4QnX6HmhVtJEsdCmmU0oY6zuX4eRT9Tx6k
         ThPP7J8xhMeUWRCVzm4SGBzz982EoXZv4GzCf1nQgOXRzW2ojk20gVhWpnn+q8Z+feDI
         Q1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+OXpb5EFpICXLw1io+wvQ9jUaJu3qsns/5/x5bYpZx4=;
        b=oV1munJe89ZGOLjs0AKrgKlufcbT0ddSCmnerK1LUzeBHONSe5DKy2oFC4CT24Hgsb
         JfT/t7rGKlnBb9mLtbU/aqpw8gecBwDXusSpqPQwGKKAm5haN6p4lWSlZsq0pxK4Vepc
         V4DY44M38B04Pkty8N61yWHBQpEjOQnqz1EDs/djQXm3QfsBwOTTsbNWeEH7dyokFilv
         ZeCist1gmAse6iHde8lCKxvXsLyiuNviowOqLgqSK19xTQxu2mRWb2+l1+4FeAEp0moE
         //zRTqGLR1DNUMiYtGn8ThgtcSV7bjvBM9vv7HL/4P7It9ZkpFcWXMxxqhukbI0G4MmR
         a9mQ==
X-Gm-Message-State: AGi0PuaU6mQP4tpeytxS6yja+SGEQZrb5JWBO3cZVueiL7MUZAoavjNq
        mDZgToePYj4mtWwdUEGLmoXi2A==
X-Google-Smtp-Source: APiQypIYgLA0yf0j1QNNNyxnM+xxwGD4xP3f2QwRIpMpevJQPjH7pQTPHfGOi258pfTn51oOnvVj8A==
X-Received: by 2002:adf:f304:: with SMTP id i4mr7479260wro.46.1585903985400;
        Fri, 03 Apr 2020 01:53:05 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id 127sm11275550wmd.38.2020.04.03.01.53.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 03 Apr 2020 01:53:02 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, stephan@gerhold.net,
        agross@kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3] arch: arm64: dts: msm8916: Add missing cpu opps
Date:   Fri,  3 Apr 2020 10:56:59 +0200
Message-Id: <1585904219-25117-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The highest cpu frequency opps have been dropped because CPR is not
supported. However, we can simply specify operating voltage so that
they match the max corner voltages for each freq. With that, we can
support up to 1.2Ghz. Ideally, msm8916 CPR should be implemented to
fine tune operating voltages and optimize power consumption.

The SPMI interface is directly used for AP regulator control since
it offers a minimal transition latency (maximum transition latency
with spmi is 250us, with rpm is 970us as reported by cpufreq-info).

According to some CPR downstream drivers, VDD_MX (VDD_MEM) needs to
be scaled along VDD_APC, this can be done in different ways, including
setting VDD_MX to its maximum value (turbo).

This patch:
- Adds missing opps and corresponding target voltages to msm8916.dtsi.
- Adds pm8916 spmi regulator node to pm8916.dtsi.
- Force VDD_MX to its turbo voltage, to allow safe VDD_APC scaling.

Tested with a dragonboard-410c.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
  v2: - move cpu-supply to msm8916 since pm8916 s2 is tighly coupled
     to AP core (cf pm8916 specification) + other pm8916 supplies
     are already defined in msm8916.
     - s2 min/max are specified in pm8916 spec
     - Removed 1.36GHz op since freq seems capped to 1.21 anyway
  v3: - Set VDD_MX (l3) to its maximum value (turbo)

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 10 ++++++++--
 arch/arm64/boot/dts/qcom/msm8916.dtsi     | 25 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8916.dtsi      | 13 +++++++++++++
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 037e26b..a889649 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -594,9 +594,15 @@
 		regulator-max-microvolt = <1200000>;
 	};
 
+	/**
+	 * Set vdd-mx in turbo mode since we do not perform vdd-mx scaling.
+	 * vdd-mx (vdd-mem) is limited to 1.2875 max by the RPM.
+	 * cf APQ8016(E) device specification - Table 3-3 - Operating condition
+	 */
 	l3 {
-		regulator-min-microvolt = <375000>;
-		regulator-max-microvolt = <1525000>;
+		regulator-min-microvolt = <1287500>;
+		regulator-max-microvolt = <1287500>;
+		regulator-always-on;
 	};
 
 	l4 {
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9f31064..7407157 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -103,6 +103,7 @@
 			next-level-cache = <&L2_0>;
 			enable-method = "psci";
 			clocks = <&apcs>;
+			cpu-supply = <&pm8916_spmi_s2>;
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>;
 			power-domains = <&CPU_PD0>;
@@ -116,6 +117,7 @@
 			next-level-cache = <&L2_0>;
 			enable-method = "psci";
 			clocks = <&apcs>;
+			cpu-supply = <&pm8916_spmi_s2>;
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>;
 			power-domains = <&CPU_PD1>;
@@ -129,6 +131,7 @@
 			next-level-cache = <&L2_0>;
 			enable-method = "psci";
 			clocks = <&apcs>;
+			cpu-supply = <&pm8916_spmi_s2>;
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>;
 			power-domains = <&CPU_PD2>;
@@ -142,6 +145,7 @@
 			next-level-cache = <&L2_0>;
 			enable-method = "psci";
 			clocks = <&apcs>;
+			cpu-supply = <&pm8916_spmi_s2>;
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>;
 			power-domains = <&CPU_PD3>;
@@ -342,15 +346,35 @@
 
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <1050000>;
 		};
 		opp-400000000 {
 			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1050000>;
+		};
+		opp-533330000 {
+			opp-hz = /bits/ 64 <533330000>;
+			opp-microvolt = <1150000>;
 		};
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1150000>;
 		};
 		opp-998400000 {
 			opp-hz = /bits/ 64 <998400000>;
+			opp-microvolt = <1350000>;
+		};
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			opp-microvolt = <1350000>;
+		};
+		opp-1152000000 {
+			opp-hz = /bits/ 64 <1152000000>;
+			opp-microvolt = <1350000>;
+		};
+		opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+			opp-microvolt = <1350000>;
 		};
 	};
 
@@ -1605,6 +1629,7 @@
 					compatible = "qcom,rpm-pm8916-regulators";
 
 					pm8916_s1: s1 {};
+					/* s2 is directly controlled via spmi */
 					pm8916_s3: s3 {};
 					pm8916_s4: s4 {};
 
diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index 0bcdf04..04f55f1 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -157,5 +157,18 @@
 			vdd-micbias-supply = <&pm8916_l13>;
 			#sound-dai-cells = <1>;
 		};
+
+		spmi_regulators: spmi_regulators  {
+			compatible = "qcom,pm8916-regulators";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pm8916_spmi_s2: s2 {
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1562000>;
+			};
+			/* other regulators can be controlled via rpm */
+		};
 	};
 };
-- 
2.7.4

