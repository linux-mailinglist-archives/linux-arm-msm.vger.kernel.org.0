Return-Path: <linux-arm-msm+bounces-23296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDA090F836
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 23:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3C21C21B2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E8B1607B4;
	Wed, 19 Jun 2024 21:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="K90oZqlr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884E515CD6A;
	Wed, 19 Jun 2024 21:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718830992; cv=none; b=DHCFAytKLz2ZIPZGHaQkAPfecu/TE2bGo75/jN0uaw/bxOrRP5zy4YcezauiyCQqOT5YyZ0QXXhm0J2Af6FRrpbAK5rFRWIBYqI6Ij/MkL46MHLkIQSLzSZSCNcRje0ySqbKiOKdPuh7M3vtDKL1Kh4I6VsFz/9HkKG3mRq/Th4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718830992; c=relaxed/simple;
	bh=dUwcd84l+RYpW49/qEw1x1mOaB4uDAc7T83NkO3zsws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l60UCgIl/GeJQI+d0dLP+fA5AbEXRdjw5WJfYecuuGdMXb1AVHwFOlSXLRgNkqqUuqvHmznmG8YE8mEEQNEWCA5XgwrqPqIzGRVRRoHv58XWyFu1ICvpScO+2Tkk1PoCH8jbuL3H0Z992ZW7bRgfqL2T8/MC/uiDVG7gM+HPk10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=K90oZqlr; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718830986; bh=dUwcd84l+RYpW49/qEw1x1mOaB4uDAc7T83NkO3zsws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K90oZqlrjkf1IIwNjfglDGJ+QiHXe7GsPljp5ZxsTlh1kPNwqQ7IdnoFV2xC4NBsF
	 RGhOBwDvZ/T77cNmy8ilSyI5t7RQmMWe9ZJEXIOAA2Y3LFeYZL4AuY1cU3S/VDtkyp
	 Nk++2/VpcUnREhcfR9bDinJ+pdlsdCcnHhg60QAg=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 19 Jun 2024 23:02:49 +0200
Subject: [PATCH 5/7] ARM: dts: qcom: msm8226: Add CPU frequency scaling
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-msm8226-cpufreq-v1-5-85143f5291d1@lucaweiss.eu>
References: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
In-Reply-To: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4286; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=dUwcd84l+RYpW49/qEw1x1mOaB4uDAc7T83NkO3zsws=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmc0eGLqcNJbh1wVnue6IdO/aqiu05W3jAATm7r
 MAr3WyAkceJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZnNHhgAKCRBy2EO4nU3X
 VisTD/9M2iuFtpZOilOG47G5cwe9w7HrSMw49i29PsV2LuLrO2tcKvond0g3NsF9CDQAeGd9N8X
 Md7J+EgqiFn8D+yUUu3speZNN87cWbOmYFvIsAJPo1lyQbLOfdfbZG4C28YBWmko1VJET/iStsk
 krhq/M6smaDGB2Q9qg+CnbtCymRUCqvWA9IoMUc3waaTWyJYXZOVl1Wem29opLbGjIng0UqVlXL
 uBmk+ILhn4UfKyqqtCC28KwJFnjHu2rupZl/OhXx50wn3At7f5m4FBpBp3WYlscxpvwGkRjNNuD
 7pXEPWRkwRGrF8Q4i/RNI/uNp8ASEdrgEP4EUtA/KtYpPjhtuX2VpharsS+eZdJ+H1HoLSWD31P
 QC/udtViSlGyrXZrslJhIvooPoHlDvsZ2nWjAIsyrdT35g3/tBS0BjUXTL5ZemtRLxBfl3VETo/
 HCTNxARhYWtLK50OEN6wx9t943zKiBuM8CKBvy4UpzcvV/RrECzdUEfChxyIs/PCVSQc9rtDHu9
 0IWG1xW+/K01r8WbeX5mM2IYB2Ys0YsUgsvmqPk9JRol0l51+ntGbLyApGOJSEZfcmiSMJ/QcDO
 wsdDEpA6ZMxB7sH/nKACiG9baznHG9b5BJomXEpG6gFjY7gzrXvpproBWxqg84ZjN6RcHT954pb
 E4ymBKZYrIOc30A==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add a node for the a7pll with its frequencies. With this we can use the
apcs-kpss-global driver for the apcs node and use the apcs to scale the
CPU frequency according to the opp-table.

At the same time unfortunately we need to provide the gcc node xo_board
instead of the XO via rpmcc since otherwise we'll have a circular
dependency between apcs, gcc and the rpm.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 103 ++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 270973e85625..6e9fbe2e7223 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -44,6 +44,8 @@ CPU0: cpu@0 {
 			device_type = "cpu";
 			reg = <0>;
 			next-level-cache = <&L2>;
+			clocks = <&apcs>;
+			operating-points-v2 = <&cpu_opp_table>;
 			qcom,acc = <&acc0>;
 			qcom,saw = <&saw0>;
 		};
@@ -54,6 +56,8 @@ CPU1: cpu@1 {
 			device_type = "cpu";
 			reg = <1>;
 			next-level-cache = <&L2>;
+			clocks = <&apcs>;
+			operating-points-v2 = <&cpu_opp_table>;
 			qcom,acc = <&acc1>;
 			qcom,saw = <&saw1>;
 		};
@@ -64,6 +68,8 @@ CPU2: cpu@2 {
 			device_type = "cpu";
 			reg = <2>;
 			next-level-cache = <&L2>;
+			clocks = <&apcs>;
+			operating-points-v2 = <&cpu_opp_table>;
 			qcom,acc = <&acc2>;
 			qcom,saw = <&saw2>;
 		};
@@ -74,6 +80,8 @@ CPU3: cpu@3 {
 			device_type = "cpu";
 			reg = <3>;
 			next-level-cache = <&L2>;
+			clocks = <&apcs>;
+			operating-points-v2 = <&cpu_opp_table>;
 			qcom,acc = <&acc3>;
 			qcom,saw = <&saw3>;
 		};
@@ -98,6 +106,29 @@ memory@0 {
 		reg = <0x0 0x0>;
 	};
 
+	cpu_opp_table: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+		};
+
+		opp-384000000 {
+			opp-hz = /bits/ 64 <384000000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+		};
+
+		opp-787200000 {
+			opp-hz = /bits/ 64 <787200000>;
+		};
+
+		/* Higher CPU frequencies need speedbin support */
+	};
+
 	pmu {
 		compatible = "arm,cortex-a7-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
@@ -231,9 +262,75 @@ intc: interrupt-controller@f9000000 {
 			#interrupt-cells = <3>;
 		};
 
-		apcs: syscon@f9011000 {
-			compatible = "syscon";
+		apcs: mailbox@f9011000 {
+			compatible = "qcom,msm8226-apcs-kpss-global",
+				     "qcom,msm8916-apcs-kpss-global", "syscon";
 			reg = <0xf9011000 0x1000>;
+			#mbox-cells = <1>;
+			clocks = <&a7pll>, <&gcc GPLL0_VOTE>;
+			clock-names = "pll", "aux";
+			#clock-cells = <0>;
+		};
+
+		a7pll: clock@f9016000 {
+			compatible = "qcom,msm8226-a7pll";
+			reg = <0xf9016000 0x40>;
+			#clock-cells = <0>;
+			clocks = <&xo_board>;
+			clock-names = "xo";
+			operating-points-v2 = <&a7pll_opp_table>;
+
+			a7pll_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-768000000 {
+					opp-hz = /bits/ 64 <768000000>;
+				};
+
+				opp-787200000 {
+					opp-hz = /bits/ 64 <787200000>;
+				};
+
+				opp-998400000 {
+					opp-hz = /bits/ 64 <998400000>;
+				};
+
+				opp-1094400000 {
+					opp-hz = /bits/ 64 <1094400000>;
+				};
+
+				opp-1190400000 {
+					opp-hz = /bits/ 64 <1190400000>;
+				};
+
+				opp-1305600000 {
+					opp-hz = /bits/ 64 <1305600000>;
+				};
+
+				opp-1344000000 {
+					opp-hz = /bits/ 64 <1344000000>;
+				};
+
+				opp-1401600000 {
+					opp-hz = /bits/ 64 <1401600000>;
+				};
+
+				opp-1497600000 {
+					opp-hz = /bits/ 64 <1497600000>;
+				};
+
+				opp-1593600000 {
+					opp-hz = /bits/ 64 <1593600000>;
+				};
+
+				opp-1689600000 {
+					opp-hz = /bits/ 64 <1689600000>;
+				};
+
+				opp-1785600000 {
+					opp-hz = /bits/ 64 <1785600000>;
+				};
+			};
 		};
 
 		saw_l2: power-manager@f9012000 {
@@ -571,7 +668,7 @@ gcc: clock-controller@fc400000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 
-			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+			clocks = <&xo_board>,
 				 <&sleep_clk>;
 			clock-names = "xo",
 				      "sleep_clk";

-- 
2.45.2


