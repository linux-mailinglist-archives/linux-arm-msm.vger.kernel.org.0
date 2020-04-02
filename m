Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8023819BEF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 11:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387477AbgDBJ4l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 05:56:41 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35043 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgDBJ4l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 05:56:41 -0400
Received: by mail-wm1-f67.google.com with SMTP id i19so2943012wmb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 02:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3P/PC/AJVPqyW+wzVRgTKSW/N7qEY5CiVeEmdA+Jhbg=;
        b=ubx5Q+Ji71lB9zgoEypGZCDLLgItRKx+QTnyrNbOlILyRT0l8QbpCbk8ChwuBhxJGK
         tstuE0HRhUjPZAqT08lHsXLah3+9mLGkRY2w2bQaM2i0KcTDEp/G6MoFvoSRJq63Hwpt
         aAxx0FTDqM6gT8/Hlp9zFV+F77yE/Qn51RpSDxre/jbatJgLMGBsajLbZKvSGIrlnlOE
         /ni0yvbYAF6v4vcgfhIVtoeknXjGfR3mV7QKrBA8J1VZscD99SkMUgHzcLmVMYTZ6yqe
         PtIohBTVI/8vPceQC1ksHYR+a8ejjYD4szDSKlme3orPdEi2nQ+HvnohMiQ4xQPbho2p
         96lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3P/PC/AJVPqyW+wzVRgTKSW/N7qEY5CiVeEmdA+Jhbg=;
        b=THY/hMdAHzh418ghCFKMZSBS+P+3wMH+Uiujk4q5Cfc4GkHAoF8Kxx7maZ1bDzxPRd
         CXdBYryuMNSHIbh2zPaSWlELa536mkuG4cywaiT9L5XbvePMNKHhn5WqNHSiV8Pciu40
         BUtr42l1bzDdELp5EFh/XXDKeyWCgBN/uVHL/kbzuwj0kObeUXKf9vslWpEsZa52Hxik
         cjhKixeECGfeceBruMnaDtEOk1DkOGvNwtSPjvEDmbKargB37Spyem1XyHsbloPCjaK3
         OPqlPb6/3ujJ3WTjICTnU/0zLwOfQKUTDlZePieQbB9R2AYmvZ5kfh3uYY7eLblY+whA
         /iDQ==
X-Gm-Message-State: AGi0PuYNoGSSYTGRvmXtJ34XV75BxmoI9YdSs6C4CL8Oq7270EKdVEDG
        3qBmD8uocxpY/CQb1xOB3rruag==
X-Google-Smtp-Source: APiQypKDX7b29kuqlte0bzMRpyfKjv2jKL5CUgn1nkmyOf/DlIIGbQRpSEtBLiwPHKJ4dALr8h8FRg==
X-Received: by 2002:a1c:dfd4:: with SMTP id w203mr1839624wmg.158.1585821398861;
        Thu, 02 Apr 2020 02:56:38 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id u16sm6733153wro.23.2020.04.02.02.56.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 02 Apr 2020 02:56:38 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, stephan@gerhold.net,
        agross@kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] arch: arm64: dts: msm8916: Add missing cpu opps
Date:   Thu,  2 Apr 2020 12:00:35 +0200
Message-Id: <1585821635-28324-1-git-send-email-loic.poulain@linaro.org>
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

This patch:
- Adds missing opps and corresponding target voltages to msm8916.dtsi.
- Adds pm8916 spmi regulator node to pm8916.dtsi.

Tested with a dragonboard-410c.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: - move cpu-supply to msm8916 since pm8916 s2 is tighly coupled
     to AP core (cf pm8916 specification) + other pm8916 supplies
     are already defined in msm8916.
     - s2 min/max are specified in pm8916 spec
     - Removed 1.36GHz op since freq seems capped to 1.21 anyway

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 25 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8916.dtsi  | 13 +++++++++++++
 2 files changed, 38 insertions(+)

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
index 0bcdf04..73d3b28 100644
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

