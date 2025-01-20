Return-Path: <linux-arm-msm+bounces-45595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0E8A16E02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92E2D3A29A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 14:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CAC1E5700;
	Mon, 20 Jan 2025 14:00:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFF11E2842;
	Mon, 20 Jan 2025 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381625; cv=none; b=l+d7LmO0qbMhwB8E0kQhzvpTSzNNI/ufUz/Vek7BH1qYfODBR+NI/2eKOqdOke77T+CVL7tp3Teq+nJ3W1pn3oWyriUSLEQCNwm8YB8a6YZWLfC4nLskIJr7iYK3qXjPDKierGanyuiuvIvvT6r0sau8X6OBcoYNEawqjnzPFGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381625; c=relaxed/simple;
	bh=VEiCcVBUQAXwHu1ffrHgeG5LsZdIgEmHmhV+woKGDz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t/WPH4YWzRRVufw0A2qYBHB4Tcp7G6z0r6CNxPoCKMpNdw1DljMwj3jFPhgnyLc4J70gLdtkyXhzQnrpj5a3MRW2hRGmgRgAWJTGkVZgunofREOiIjoSpWtB3sZbT34Ekl1FQwB8bHG4ZRhrlcehECKHIxbAVcZ/VmPvEoShXY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [119.122.212.126])
	by smtp.qiye.163.com (Hmail) with ESMTP id 935772a0;
	Mon, 20 Jan 2025 22:00:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v5 3/5] arm64: dts: qcom: ipq6018: move mp5496 regulator out of soc dtsi
Date: Mon, 20 Jan 2025 22:00:04 +0800
Message-Id: <20250120140006.655463-4-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250120140006.655463-1-amadeus@jmu.edu.cn>
References: <20250120140006.655463-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSBhOVkxMHkxNSENCHk9MSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSVVKSU1ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-HM-Tid: 0a9484039b0d03a2kunm935772a0
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngg6Mjo6KDIPKDZOCw8pKkoO
	ED0aC0NVSlVKTEhMSENKTUpMSk5NVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpJVUpJTVlXWQgBWUFIT0lNNwY+

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


