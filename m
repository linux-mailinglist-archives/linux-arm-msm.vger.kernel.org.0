Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 391983D48E5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jul 2021 19:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhGXQs7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 12:48:59 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:51009 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbhGXQs7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 12:48:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627147770; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Ktj1i3AlaWGew5NfuLfcGEy2Chnk/dvK1HpNHbnFwgA=; b=QqauvPxG26UGdYgjjE5/QZ3SJSs/mteKQftaW84Hsm5rBgqJI3nMVN90htm7zMGrakOquIg7
 SIz1lQx7Rwz92QgFOIk8X15OH4Irmff35OeVNKPNoARTkp3Ccxe13XGiecW/KepLg7EgdTJv
 y1c+wQpigzHldOClacz3MbcQRfk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60fc4df4e31d882d180b0095 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 24 Jul 2021 17:29:24
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 26A82C4323A; Sat, 24 Jul 2021 17:29:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3176C433D3;
        Sat, 24 Jul 2021 17:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A3176C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Douglas Anderson <dianders@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: sc7280: Add gpu support
Date:   Sat, 24 Jul 2021 22:59:00 +0530
Message-Id: <1627147740-11590-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the necessary dt nodes for gpu support in sc7280.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
This patch has dependency on the GPUCC bindings patch here:
https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/

Changes in v2:
- formatting update and removed a duplicate header (Stephan)

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 116 +++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 029723a..524a5e0 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+#include <dt-bindings/clock/qcom,gpucc-sc7280.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,sc7280.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -585,6 +586,121 @@
 			#clock-cells = <1>;
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
 		lpass_ag_noc: interconnect@3c40000 {
 			reg = <0 0x03c40000 0 0xf080>;
 			compatible = "qcom,sc7280-lpass-ag-noc";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

