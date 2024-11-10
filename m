Return-Path: <linux-arm-msm+bounces-37428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DB29C33C3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 17:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AB6B1C20A59
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 16:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DBC5C603;
	Sun, 10 Nov 2024 16:06:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m17248.xmail.ntesmail.com (mail-m17248.xmail.ntesmail.com [45.195.17.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE2D1BC2A;
	Sun, 10 Nov 2024 16:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.195.17.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731254781; cv=none; b=qQmBIHKF7594KrE/upoQmyFkwL7bAEV2tpEjhFzF+n1Lhr7DUKYfKrlhJtnqY4MSVZPE2iRXwmsp2LAkYlU0luPMM1ND0oL/e4QWvR7P4rLea/g38zh/gn572HgGf7CrhNw/fHXtvl9oYXzCKAYRBrm4WBPe62SWrOdrLlUT6E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731254781; c=relaxed/simple;
	bh=VEiCcVBUQAXwHu1ffrHgeG5LsZdIgEmHmhV+woKGDz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ADQiof4dycjY30TWPoJ2TTH6aUXTnTEeU/PK9LBH57CAKwXbNJRaS5bu/pq3zu8FqU7L44FywiigaWrMPxjvemGBB60mH12qmwBunPHWY5iTL4N10aKM+T5bj/6dK/hMNQ6OsEqVVYDMej0PD6Wn05keiZzFQJ3MGLQ0qyS6qP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.195.17.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c03:51e0::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 250d5e7c;
	Sun, 10 Nov 2024 23:30:41 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: amadeus@jmu.edu.cn
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] arm64: dts: qcom: ipq6018: move mp5496 regulator out of soc dtsi
Date: Sun, 10 Nov 2024 23:30:36 +0800
Message-Id: <20241110153036.3645169-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241110153036.3645169-1-amadeus@jmu.edu.cn>
References: <20241110140019.3426181-1-amadeus@jmu.edu.cn>
 <20241110153036.3645169-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQkoeVk8YTRhJThhLH0hOT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtIQU5KHktBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a9316b2df5b03a2kunm250d5e7c
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kzo6TAw5GTIaPC0DMwssAkgc
	NgIKCQtVSlVKTEhKSU5JTU9JSU9NVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0hBTkoeS0FBSllXWQgBWUFIT0lNNwY+

Some IPQ60xx SoCs don't come with the mp5496 pmic chip. The mp5496
pmic was never part of the IPQ60xx SoC, it's optional, so we moved
it out of the soc dtsi.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  2 +-
 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi | 35 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 14 --------
 3 files changed, 36 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
index f5f4827c0e17..9c69d3027b43 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -7,7 +7,7 @@
 
 /dts-v1/;
 
-#include "ipq6018.dtsi"
+#include "ipq6018-mp5496.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. IPQ6018/AP-CP01-C1";
diff --git a/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi b/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
new file mode 100644
index 000000000000..fe2152df69f4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * ipq6018-mp5496.dtsi describes common properties (e.g. regulators) that
+ * apply to most devices that make use of the IPQ6018 SoC and MP5496 PMIC.
+ */
+
+#include "ipq6018.dtsi"
+
+&cpu0 {
+	cpu-supply = <&ipq6018_s2>;
+};
+
+&cpu1 {
+	cpu-supply = <&ipq6018_s2>;
+};
+
+&cpu2 {
+	cpu-supply = <&ipq6018_s2>;
+};
+
+&cpu3 {
+	cpu-supply = <&ipq6018_s2>;
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-mp5496-regulators";
+
+		ipq6018_s2: s2 {
+			regulator-min-microvolt = <725000>;
+			regulator-max-microvolt = <1062500>;
+			regulator-always-on;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 7514919132b6..a02aa641cb90 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -43,7 +43,6 @@ cpu0: cpu@0 {
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-supply = <&ipq6018_s2>;
 			#cooling-cells = <2>;
 		};
 
@@ -56,7 +55,6 @@ cpu1: cpu@1 {
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-supply = <&ipq6018_s2>;
 			#cooling-cells = <2>;
 		};
 
@@ -69,7 +67,6 @@ cpu2: cpu@2 {
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-supply = <&ipq6018_s2>;
 			#cooling-cells = <2>;
 		};
 
@@ -82,7 +79,6 @@ cpu3: cpu@3 {
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-supply = <&ipq6018_s2>;
 			#cooling-cells = <2>;
 		};
 
@@ -184,16 +180,6 @@ glink-edge {
 			rpm_requests: rpm-requests {
 				compatible = "qcom,rpm-ipq6018", "qcom,glink-smd-rpm";
 				qcom,glink-channels = "rpm_requests";
-
-				regulators {
-					compatible = "qcom,rpm-mp5496-regulators";
-
-					ipq6018_s2: s2 {
-						regulator-min-microvolt = <725000>;
-						regulator-max-microvolt = <1062500>;
-						regulator-always-on;
-					};
-				};
 			};
 		};
 	};
-- 
2.25.1


