Return-Path: <linux-arm-msm+bounces-46788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03525A25D6D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2E21188C892
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3335E20E71D;
	Mon,  3 Feb 2025 14:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUQIpCe6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069F22080E3;
	Mon,  3 Feb 2025 14:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593837; cv=none; b=e/YIbNff8GnzBV/LaPumbTOcX2qswSooTPAyBMzZwHaKLUHfLdN+LfEWh3dAgBeVVpwDE30WXonkzubtctYIZspbS+g2zZW0CRsQ5/kSVu6Io60IH4sHJTqZ/85K070e4aU5pSfOrmulBAKHuDXHBXS6gAanN/KgTsK46ol1Qig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593837; c=relaxed/simple;
	bh=jyj4H+U34Hj+Nhb/ZxrCWryb8DeT8pfEsrmpmBpygoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBJ0oi63n9P7dK9qYSskP+eq1lm25p/EMXTh+9fqf91xxch9CJM48iC9C4ZM08NmdJg/dsjksLY1XHNlc0Dn15tRuDT05wcbBHhU2dmyO5nc1Uo77IOk6sFW/ikudRrH0ya1gUVHc5rfcNRS0qfbKlkw3jM1mEds88BN6QhNE48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUQIpCe6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8B6C4CEE8;
	Mon,  3 Feb 2025 14:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738593836;
	bh=jyj4H+U34Hj+Nhb/ZxrCWryb8DeT8pfEsrmpmBpygoM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pUQIpCe6l4tJEqk7PAt5sn6HTUpnhuNBuNiCPr6HjXH6BUdap52wAEr1Q65i3nQHt
	 A41PJTRONhdwVSWWh4oEoQ6Gf+hRrD6+gWF1A3BD+HiJkGfQ7U5TT4hn+deP06UNYg
	 eegSsvKrSNwGR6TOvNhl7tK8mwfcJbJQDQiJw6ogxmPk8p+8ldyZz6w14ghcI9AafN
	 RFPYww+mHSCAGbiKW7svEbyc8SNKUBckkp/Y+uTaPl3/3i5LV5RSIjDmvPAKRfpujZ
	 2T+RZ5+IgFcFtLmqrc5msIiiP7V6BjsYWyJ83vr3rNlhSPIYXvpDKx6vPXuZsfvOXX
	 Y5Qg4YDZMEbSA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 03 Feb 2025 15:43:25 +0100
Subject: [PATCH v2 6/6] arm64: dts: qcom: Add X1P42100 SoC and CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-x1p4_dts-v2-6-72cd4cdc767b@oss.qualcomm.com>
References: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
In-Reply-To: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738593805; l=6853;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=l+DTdL7EGdTkecqQttNm8W32COU/CPwUAoWtGLzUsc8=;
 b=iaaKplJaXbbVIKA8sFnJb3Qc71kpOhariHFx7M4z7uUF6g7bknAm4kGs0FAle8vJC3q0f0zzN
 ONPotdCJIQLD4a9RrPpXKSqUHKebI6ombLL/htSp/K11UgfNkq/dIF3
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

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
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


