Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12FF1100FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 16:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbfLCPQT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 10:16:19 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:54622
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726057AbfLCPQT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 10:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575386178;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=a+ZeEDIVNB9eGTEKRl0WtwhCV5OviwdJ9UgvQi9PSGI=;
        b=P2CHVTSbxU/IZlRRUd3ulzIbil+vTF5daGDcckKwQxSCxLzg1Lngu+IFDZy1uaji
        IXC9TiZ3Nyr1O4mZRAPz7b1gG1xQVkjLmm1XL25OKHJw+IxSaEiCyLe6lXvaRs+irP1
        enABFh9a6fQuV6opbBkdeZryEmQpPA5ycbmRYe1o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575386178;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=a+ZeEDIVNB9eGTEKRl0WtwhCV5OviwdJ9UgvQi9PSGI=;
        b=eMJAOwX1fGNRtHyQqWqSGpQ9XJAXXGUqk9BQ2KDSw88Ri/w1SgSx5qKRNWQE0Xc6
        RnTasfAY0NOmFe1Gp81b3Ww9Ba8gteERM+1rS2m+BI30v9m5FbWl8KLhaUYfFrPfdF1
        KRqEiYPv9EAn8jAUt22zDq1bp31hIXwtfe6Kbbpw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7A637C447B5
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 5/5] arm: dts: sc7180: Add A618 gpu dt blob
Date:   Tue, 3 Dec 2019 15:16:18 +0000
Message-ID: <0101016ecc556508-b3be0a5f-4987-4c21-a0b4-33f380cf278b-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org>
References: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org>
X-SES-Outgoing: 2019.12.03-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the required dt nodes and properties
to enabled A618 GPU.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 116 +++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index c3db2e5..31223d0 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -18,6 +18,8 @@
 #include <dt-bindings/reset/qcom,sdm845-pdc.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
+#include <dt-bindings/clock/qcom,gpucc-sc7180.h>
+#include <dt-bindings/power/qcom-rpmpd.h>

 / {
 	interrupt-parent = <&intc>;
@@ -733,6 +735,120 @@
 			#power-domain-cells = <1>;
 		};

+		gpu: gpu@5000000 {
+			compatible = "qcom,adreno-618.0", "qcom,adreno";
+			#stream-id-cells = <16>;
+			reg = <0 0x5000000 0 0x40000>, <0 0x509e000 0 0x1000>,
+				<0 0x5061000 0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory", "cx_mem", "cx_dbgc";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			interconnects = <&gem_noc 35 &mc_virt 512>;
+
+			qcom,gmu = <&gmu>;
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+				};
+
+				opp-650000000 {
+					opp-hz = /bits/ 64 <650000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+				};
+
+				opp-565000000 {
+					opp-hz = /bits/ 64 <565000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+
+				opp-430000000 {
+					opp-hz = /bits/ 64 <430000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+                                opp-355000000 {
+					opp-hz = /bits/ 64 <355000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+                                opp-267000000 {
+					opp-hz = /bits/ 64 <267000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-180000000 {
+					opp-hz = /bits/ 64 <180000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+			};
+		};
+
+		adreno_smmu: iommu@5040000 {
+			compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
+			reg = <0 0x5040000 0 0x10000>;
+			#iommu-cells = <1>;
+			#global-interrupts = <2>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 366 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 367 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 368 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 369 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 370 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 371 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				<&gcc GCC_GPU_CFG_AHB_CLK>,
+				<&gcc GCC_DDRSS_GPU_AXI_CLK>;
+
+			clock-names = "bus", "iface", "mem_iface_clk";
+			power-domains = <&gpucc CX_GDSC>;
+		};
+
+		gmu: gmu@506a000 {
+			compatible="qcom,adreno-gmu-618", "qcom,adreno-gmu";
+
+			reg = 	<0 0x506a000 0 0x31000>,
+				<0 0xb290000 0 0x10000>,
+				<0 0xb490000 0 0x10000>;
+			reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				   <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+			       <&gpucc GPU_CC_CXO_CLK>,
+			       <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+			       <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
+			clock-names = "gmu", "cxo", "axi", "memnoc";
+
+			power-domains = <&gpucc CX_GDSC>;
+
+			iommus = <&adreno_smmu 5>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sc7180-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;
--
1.9.1

