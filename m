Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98923D3954
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 13:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbhGWKkn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 06:40:43 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:34505 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbhGWKkn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 06:40:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627039277; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=fHwTtapl35FE2Ue6XQbrKD2NlRjdE4DDciMxOgEZwF8=; b=VV+sMaQwwBnhZQA3EUanXaJyAOpJyzaBs/Y76DXj4mm7tafCd7DCeRXwutg3mU/wEFZS54A7
 c7zM4Uu0smmGWOamTP2JoTVLsSp38D3O6CbGCC/vw7piw5vfZxaGbzSoY8UaFrOwSoti7r+k
 0mXRCpHInR4UzbX++PMk8rpzHrg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60faa6291dd16c8788e2baa0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Jul 2021 11:21:13
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C7DBDC433F1; Fri, 23 Jul 2021 11:21:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 85FEDC433D3;
        Fri, 23 Jul 2021 11:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 85FEDC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org, robh@kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jordan@cosmicpenguin.net,
        mka@chromium.org, jonathan@marek.ca, robdclark@gmail.com,
        dianders@chromium.org, sboyd@kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7280: Add gpu support
Date:   Fri, 23 Jul 2021 16:50:54 +0530
Message-Id: <1627039254-13083-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the necessary dt nodes for gpu support in sc7280.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
This patch has dependency on the GPUCC bindings patch here:
https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 107 +++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 029723a..beb313c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -16,6 +16,8 @@
 #include <dt-bindings/reset/qcom,sdm845-pdc.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/interconnect/qcom,sc7280.h>
+#include <dt-bindings/clock/qcom,gpucc-sc7280.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -592,6 +594,111 @@
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-635.0", "qcom,adreno";
+			#stream-id-cells = <16>;
+			reg = <0 0x03d00000 0 0x40000>, <0 0x03d9e000 0 0x1000>,
+				<0 0x03d61000 0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory", "cx_mem", "cx_dbgc";
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
+			clock-names = "gmu", "cxo", "axi", "memnoc", "ahb",
+					"hub", "smmu_vote";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>, <&gpucc GPU_CC_GX_GDSC>;
+			power-domain-names = "cx", "gx";
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
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

