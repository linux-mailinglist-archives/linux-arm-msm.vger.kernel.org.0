Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903063D8D42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 13:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236185AbhG1Lyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 07:54:38 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:64092 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236162AbhG1Lyi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 07:54:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627473276; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=I+6EtmTkJGuPi6NoSMeA9deQefDBI6Bli9FnlFgsfRM=; b=EmsGg40pv1Js4f05Qb31MydlL78CR41WQK9OA42Skf7Y62z+4Y3RgO5ykjHj0Cqjd4frxj7r
 DxZfA+lrbCP9SKGTCuSnzhRFElYPUre4KoawEm4nPKDyiB224czNMS03sr6x7xQCse67YLy4
 ioFNmdQJkPbYk+MgwRl2/OadqF8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61014566e31d882d18f4a10d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Jul 2021 11:54:14
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31DC5C4360C; Wed, 28 Jul 2021 11:54:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E297C433D3;
        Wed, 28 Jul 2021 11:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4E297C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add gpu support
Date:   Wed, 28 Jul 2021 17:24:01 +0530
Message-Id: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the necessary dt nodes for gpu support in sc7280.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
This has dependency on the below GPUCC bindings patch which is already
accepted in clk-next:
https://patchwork.kernel.org/project/linux-clk/list/?series=514831&state=%2A&archive=both

Changes in v3:
- Re-ordered the nodes based on address (Stephan)
- Added the patch for gpu cooling to the stack.

Changes in v2:
- formatting update and removed a duplicate header (Stephan)

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 116 +++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 029723a..c88f366 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+#include <dt-bindings/clock/qcom,gpucc-sc7280.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,sc7280.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -592,6 +593,85 @@
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		gpu@3d00000 {
+			compatible = "qcom,adreno-635.0", "qcom,adreno";
+			#stream-id-cells = <16>;
+			reg = <0 0x03d00000 0 0x40000>,
+			      <0 0x03d9e000 0 0x1000>,
+			      <0 0x03d61000 0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&adreno_smmu 0 0x401>;
+			operating-points-v2 = <&gpu_opp_table>;
+			qcom,gmu = <&gmu>;
+			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "gfx-mem";
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-550000000 {
+					opp-hz = /bits/ 64 <550000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <6832000>;
+				};
+
+				opp-450000000 {
+					opp-hz = /bits/ 64 <450000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <4068000>;
+				};
+
+				opp-315000000 {
+					opp-hz = /bits/ 64 <315000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <1804000>;
+				};
+			};
+		};
+
+		gmu: gmu@3d69000 {
+			compatible="qcom,adreno-gmu-635.0", "qcom,adreno-gmu";
+			reg = <0 0x03d6a000 0 0x34000>,
+				<0 0x3de0000 0 0x10000>,
+				<0 0x0b290000 0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+					<&gpucc GPU_CC_CXO_CLK>,
+					<&gcc GCC_DDRSS_GPU_AXI_CLK>,
+					<&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+					<&gpucc GPU_CC_AHB_CLK>,
+					<&gpucc GPU_CC_HUB_CX_INT_CLK>,
+					<&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "ahb",
+				      "hub",
+				      "smmu_vote";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gpucc GPU_CC_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+			iommus = <&adreno_smmu 5 0x400>;
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
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sc7280-gpucc";
 			reg = <0 0x03d90000 0 0x9000>;
@@ -606,6 +686,42 @@
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,sc7280-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
+			reg = <0 0x03da0000 0 0x20000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 675 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+					<&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+					<&gpucc GPU_CC_AHB_CLK>,
+					<&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+					<&gpucc GPU_CC_CX_GMU_CLK>,
+					<&gpucc GPU_CC_HUB_CX_INT_CLK>,
+					<&gpucc GPU_CC_HUB_AON_CLK>;
+			clock-names = "gcc_gpu_memnoc_gfx_clk",
+					"gcc_gpu_snoc_dvm_gfx_clk",
+					"gpu_cc_ahb_clk",
+					"gpu_cc_hlos1_vote_gpu_smmu_clk",
+					"gpu_cc_cx_gmu_clk",
+					"gpu_cc_hub_cx_int_clk",
+					"gpu_cc_hub_aon_clk";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+		};
+
 		stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0 0x06002000 0 0x1000>,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

