Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30E923D9881
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbhG1W0V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbhG1W0Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:26:16 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEEEC06179C;
        Wed, 28 Jul 2021 15:26:04 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id C4E261FA14;
        Thu, 29 Jul 2021 00:26:02 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/39] arm64: dts: qcom: sdm630: Add clocks and power domains to SMMU nodes
Date:   Thu, 29 Jul 2021 00:25:15 +0200
Message-Id: <20210728222542.54269-13-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Add the required clocks and power domains for the SMMUs to work.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 31 +++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index fd8f3678cf5d..9683efa4dbcb 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -563,9 +563,14 @@ snoc: interconnect@1626000 {
 		anoc2_smmu: iommu@16c0000 {
 			compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
 			reg = <0x016c0000 0x40000>;
-			#iommu-cells = <1>;
 
+			assigned-clocks = <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
+			assigned-clock-rates = <1000>;
+			clocks = <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
+			clock-names = "bus";
 			#global-interrupts = <2>;
+			#iommu-cells = <1>;
+
 			interrupts =
 				<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
@@ -904,9 +909,22 @@ sd-cd {
 		kgsl_smmu: iommu@5040000 {
 			compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
 			reg = <0x05040000 0x10000>;
-			#iommu-cells = <1>;
 
+			/*
+			 * GX GDSC parent is CX. We need to bring up CX for SMMU
+			 * but we need both up for Adreno. On the other hand, we
+			 * need to manage the GX rpmpd domain in the adreno driver.
+			 * Enable CX/GX GDSCs here so that we can manage just the GX
+			 * RPM Power Domain in the Adreno driver.
+			 */
+			power-domains = <&gpucc GPU_GX_GDSC>;
+			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+				 <&gcc GCC_BIMC_GFX_CLK>,
+				 <&gcc GCC_GPU_BIMC_GFX_CLK>;
+			clock-names = "iface", "mem", "mem_iface";
 			#global-interrupts = <2>;
+			#iommu-cells = <1>;
+
 			interrupts =
 				<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
@@ -1597,9 +1615,16 @@ blsp_i2c8: i2c@c1b8000 {
 		mmss_smmu: iommu@cd00000 {
 			compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
 			reg = <0x0cd00000 0x40000>;
-			#iommu-cells = <1>;
 
+			clocks = <&mmcc MNOC_AHB_CLK>,
+				 <&mmcc BIMC_SMMU_AHB_CLK>,
+				 <&rpmcc RPM_SMD_MMSSNOC_AXI_CLK>,
+				 <&mmcc BIMC_SMMU_AXI_CLK>;
+			clock-names = "iface-mm", "iface-smmu",
+				      "bus-mm", "bus-smmu";
 			#global-interrupts = <2>;
+			#iommu-cells = <1>;
+
 			interrupts =
 				<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.32.0

