Return-Path: <linux-arm-msm+bounces-46124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A23A1C0BE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 04:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C5A01886B2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 03:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32694206F31;
	Sat, 25 Jan 2025 03:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbmyR7sT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012DD206F2C;
	Sat, 25 Jan 2025 03:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737775910; cv=none; b=NCKoXA4TM0rR+vJ4igKoIzjC2SLtFnCnUQbJ4ywERIupdY+lYXCy/z/XbBxi4jRp70XqH11GXgpP048WsohbzXYY3IBLWTAfBMxsVqY1TrhIl57UN2gaIqrrnvqZ3fj5HOXPd9rHm9fW4Bh2jHEqcz4f7Uvy0GQ3HyksQ1O7mhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737775910; c=relaxed/simple;
	bh=M8Bdlvl5nyzHYIiScpov8RgKmsbbZjDZhC05j7cCLFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kPUjRIVlJleJ24dvxDnS4NQjwEE7CFna5z2t7HNskZBn0GFXuVVUmf/QqCDHA+kImwxT+3FAVsF0rbZmOdoXhJKGgEbIXF1X8S05HFn+T5C0LUUjAwFgxz1et+c57fc0Ht9rG9Ds1GQgeK9n/jSe4ZMow3JbPfWkId52xNDvkIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbmyR7sT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819ECC4CEE3;
	Sat, 25 Jan 2025 03:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737775909;
	bh=M8Bdlvl5nyzHYIiScpov8RgKmsbbZjDZhC05j7cCLFM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TbmyR7sTm/a86z+BrESF5Ncq/NHdaEtSP+P/XLhPfg/Zo6esk/OjJwImRzA93Tvk7
	 0pulwjnlLjZLR2TO96EWzkbBQdBUbNNCvOX4Cztf+1OKEzsOoAPMrHWXOzUkwGL2Cz
	 Q8xsdF9LRwXkxU0iVpq4yErdQgGkVsDkaQTbPkL1lAQqCQSrJGAkJOt7opaP12hqsb
	 R2ppB1DGd8Lm3Tcicetg3gv2Lub9S+Nmluntj5iwiHqrSUgodVDf+1oytS3sqyGAjC
	 fi/4krJUytPLLSL7tNDYIrt8q6UDa1K8eBGg0LxbvAoNuL4Pe91OXUWhBaGXDPS632
	 x4iC85YruqobA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 25 Jan 2025 04:31:22 +0100
Subject: [PATCH 6/6] arm64: dts: qcom: Add X1P42100 SoC and CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250125-topic-x1p4_dts-v1-6-02659a08b044@oss.qualcomm.com>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
In-Reply-To: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737775883; l=6792;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=dShHZd5JVDmHj/fjonqknaHvP1/xj6l8LEGMyGVK4+M=;
 b=FaRnWAqKw+qMBk752y8JiZpHU5cgBc2BXaKO/iYeUwGgS+6ZDgo1GgYTZGvW2oPOBMSFCEkvq
 MUdGf39lGjLBqvGbKVaAy00lsDyMNDP9MiH7IBsIkVdPdlyki/CpfKK
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The X1 family is split into two parts: the 10- and 12-core parts are
variants of the same silicon with different fusing, whereas the 8-core
ones are a separate design. Thankfully, the software interface is only
barely different, letting us reuse much of the existing X1 work.

Introduce support for the X1P42100 SoC and the CRD based on it, through
overlaying some bits. Everything we already support on X1E80100 and
friends, minus the GPU, should work as-is.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile            |  1 +
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi       | 30 +++++------
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts    | 17 ++++++
 arch/arm64/boot/dts/qcom/x1p42100.dtsi       | 81 ++++++++++++++++++++++++++++
 5 files changed, 115 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 140b0b2abfb555b8ef61bd9ed0217d8997800809..b54f45b3bec812f4f029c5a991ad3ea30585d4e5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -298,3 +298,4 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus15.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
index d7a2a2b8fc6c30bdb10df81eac7d92306998838f..bf6cdede156bc66f681c53f9bd19966bae23da14 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
@@ -110,7 +110,7 @@ trip1 {
 			};
 		};
 
-		pmc8380-6-thermal {
+		pmc8380_6_thermal: pmc8380-6-thermal {
 			polling-delay-passive = <100>;
 
 			thermal-sensors = <&pmc8380_6_temp_alarm>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 9d14d53180734ed3eda2ed70b54e9ee8acbcd892..4ebb0943970e65241b9b073f5f46a99fb34ead41 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -252,7 +252,7 @@ core3 {
 				};
 			};
 
-			cluster2 {
+			cpu_map_cluster2: cluster2 {
 				core0 {
 					cpu = <&cpu8>;
 				};
@@ -8203,7 +8203,7 @@ opp-9 {
 		};
 
 		/* cluster0 */
-		pmu@240b3400 {
+		bwmon_cluster0: pmu@240b3400 {
 			compatible = "qcom,x1e80100-cpu-bwmon", "qcom,sdm845-bwmon";
 			reg = <0 0x240b3400 0 0x600>;
 
@@ -8213,6 +8213,19 @@ pmu@240b3400 {
 					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
 
 			operating-points-v2 = <&cpu_bwmon_opp_table>;
+		};
+
+		/* cluster2 */
+		bwmon_cluster2: pmu@240b5400 {
+			compatible = "qcom,x1e80100-cpu-bwmon", "qcom,sdm845-bwmon";
+			reg = <0 0x240b5400 0 0x600>;
+
+			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
 
 			cpu_bwmon_opp_table: opp-table {
 				compatible = "operating-points-v2";
@@ -8243,19 +8256,6 @@ opp-5 {
 			};
 		};
 
-		/* cluster2 */
-		pmu@240b5400 {
-			compatible = "qcom,x1e80100-cpu-bwmon", "qcom,sdm845-bwmon";
-			reg = <0 0x240b5400 0 0x600>;
-
-			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
-
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
-
-			operating-points-v2 = <&cpu_bwmon_opp_table>;
-		};
-
 		/* cluster1 */
 		pmu@240b6400 {
 			compatible = "qcom,x1e80100-cpu-bwmon", "qcom,sdm845-bwmon";
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
new file mode 100644
index 0000000000000000000000000000000000000000..cf07860a63e97c388909fb5721ae7b9729b6c586
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "x1p42100.dtsi"
+#include "x1-crd.dtsi"
+
+/delete-node/ &pmc8380_6;
+/delete-node/ &pmc8380_6_thermal;
+
+/ {
+	model = "Qualcomm Technologies, Inc. X1P42100 CRD";
+	compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
+};
diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..27f479010bc330eb6445269a1c46bf78ec6f1bd4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/* X1P42100 is heavily based on X1E80100, with some meaningful differences */
+#include "x1e80100.dtsi"
+
+/delete-node/ &bwmon_cluster0;
+/delete-node/ &cluster_pd2;
+/delete-node/ &cpu_map_cluster2;
+/delete-node/ &cpu8;
+/delete-node/ &cpu9;
+/delete-node/ &cpu10;
+/delete-node/ &cpu11;
+/delete-node/ &cpu_pd8;
+/delete-node/ &cpu_pd9;
+/delete-node/ &cpu_pd10;
+/delete-node/ &cpu_pd11;
+/delete-node/ &pcie3_phy;
+
+&gcc {
+	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
+};
+
+/* The GPU is physically different and will be brought up later */
+&gpu {
+	/delete-property/ compatible;
+};
+
+&gpucc {
+	compatible = "qcom,x1p42100-gpucc";
+};
+
+/* PCIe3 has half the lanes compared to X1E80100 */
+&pcie3 {
+	num-lanes = <4>;
+};
+
+&pcie6a_phy {
+	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
+};
+
+&soc {
+	/* The PCIe3 PHY on X1P42100 uses a different IP block */
+	pcie3_phy: phy@1bd4000 {
+		compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
+		reg = <0x0 0x01bd4000 0x0 0x2000>,
+		      <0x0 0x01bd6000 0x0 0x2000>;
+
+		clocks = <&gcc GCC_PCIE_3_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_3_CFG_AHB_CLK>,
+			 <&tcsr TCSR_PCIE_8L_CLKREF_EN>,
+			 <&gcc GCC_PCIE_3_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_3_PIPE_CLK>,
+			 <&gcc GCC_PCIE_3_PIPEDIV2_CLK>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref",
+			      "rchng",
+			      "pipe",
+			      "pipediv2";
+
+		resets = <&gcc GCC_PCIE_3_PHY_BCR>,
+			 <&gcc GCC_PCIE_3_NOCSR_COM_PHY_BCR>;
+		reset-names = "phy",
+			      "phy_nocsr";
+
+		assigned-clocks = <&gcc GCC_PCIE_3_PHY_RCHNG_CLK>;
+		assigned-clock-rates = <100000000>;
+
+		power-domains = <&gcc GCC_PCIE_3_PHY_GDSC>;
+
+		#clock-cells = <0>;
+		clock-output-names = "pcie3_pipe_clk";
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+};

-- 
2.48.1


