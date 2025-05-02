Return-Path: <linux-arm-msm+bounces-56595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FA5AA7C41
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083224A6AC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDA12222B6;
	Fri,  2 May 2025 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1lphMiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3A61E5B97;
	Fri,  2 May 2025 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225507; cv=none; b=FffYxM5k2OruBJgWOBSK1iKeM8k35sHHC1PRwhuxfc5JyYD1joqSHZ5ZcOTWQLZM4n+a4eVLkpekGKCSEZZNBntsZ2nBdMjdnHwUr6Cc/U60QNqcV2eY8hx8orA0xD/dN3U1Xx0fdsh7qqzpKkXISY7JAQxROGJCHwkjzYRiJyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225507; c=relaxed/simple;
	bh=xQz7/ip2nEPumaqGK964az0S5cMRMP84I5h8RYDtIDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4eN0uzSTUJMgs0VnKB8nax5I3/p81nKs3EKcU1ZmriRasR5+ND33MwjzFxDMVW692MLf3WWys3HI6MUHbNVi5ZUkCwj2iKgJB3XPElfm2XPXUtqUoA0SWf2fQiix3Wt+qLIv1T7GQFuJUDAL3d51sGH14VXk0sw0jjRhQSiX+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1lphMiH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9938C4CEE4;
	Fri,  2 May 2025 22:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746225506;
	bh=xQz7/ip2nEPumaqGK964az0S5cMRMP84I5h8RYDtIDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P1lphMiHz33H2iFHUtCkahykyJDj6RlEd6r6Z+cGqaPw8AIaOF4u3NqzAjivYYnHq
	 HKsgtsjij9Dzi4nPyDzBdqvNGTzCUcjY2BN8SD5TbMfxvLDAjYC/crZY44jLlN4Cwf
	 202YtV5N/PhInDEBiRM5haqEpvQ1TrM9W+yqNxuD/phqSDkaM1aHVyoL/qKZksdXBO
	 wisRt/g7wC5EpxLXJhxj/ZcZK1j/HzyFCC+EKM/wFgacoV6htb/Qt2B6WE2xaNutOc
	 WJwWlCQn/BTjI99LiRLn9Oao1sGJBL4oX+P6SPFuoPMxi1ynceo+FupVYE+8KJn3WT
	 UWiJMvCv4++Eg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 03 May 2025 00:38:00 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: sc8280xp: Fix node order
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-topic-8280_slpi-v1-2-9400a35574f7@oss.qualcomm.com>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
In-Reply-To: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746225495; l=17883;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ZixE+N25/mineEHJ4hLG/8d1ohoKVciJuCDIRNzuz/I=;
 b=cAmfkn+K+tXa9P2al+rDeEpMOuKTx0iICSlJpNXWO31KJJAoKc+SZlXayfu3edy0I0nbFT/hc
 BiOtoXi+CXjCZR0N93IXLRwEJSeNjWOQ46JRMrfKHSqCRfXqkTIoyau
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Certain /soc@0 subnodes are very out of order. Reshuffle them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 574 ++++++++++++++++-----------------
 1 file changed, 287 insertions(+), 287 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 35ef31d4ecf26125407bb64dd2de6e777a3400a3..3f9195da90ee898c68296f19dc55bcb3ac73fe29 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2454,293 +2454,6 @@ tcsr: syscon@1fc0000 {
 			reg = <0x0 0x01fc0000 0x0 0x30000>;
 		};
 
-		gpu: gpu@3d00000 {
-			compatible = "qcom,adreno-690.0", "qcom,adreno";
-
-			reg = <0 0x03d00000 0 0x40000>,
-			      <0 0x03d9e000 0 0x1000>,
-			      <0 0x03d61000 0 0x800>;
-			reg-names = "kgsl_3d0_reg_memory",
-				    "cx_mem",
-				    "cx_dbgc";
-			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
-			iommus = <&gpu_smmu 0 0xc00>, <&gpu_smmu 1 0xc00>;
-			operating-points-v2 = <&gpu_opp_table>;
-
-			qcom,gmu = <&gmu>;
-			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "gfx-mem";
-			#cooling-cells = <2>;
-
-			status = "disabled";
-
-			gpu_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				opp-270000000 {
-					opp-hz = /bits/ 64 <270000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
-					opp-peak-kBps = <451000>;
-				};
-
-				opp-410000000 {
-					opp-hz = /bits/ 64 <410000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
-					opp-peak-kBps = <1555000>;
-				};
-
-				opp-500000000 {
-					opp-hz = /bits/ 64 <500000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
-					opp-peak-kBps = <1555000>;
-				};
-
-				opp-547000000 {
-					opp-hz = /bits/ 64 <547000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
-					opp-peak-kBps = <1555000>;
-				};
-
-				opp-606000000 {
-					opp-hz = /bits/ 64 <606000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
-					opp-peak-kBps = <2736000>;
-				};
-
-				opp-640000000 {
-					opp-hz = /bits/ 64 <640000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
-					opp-peak-kBps = <2736000>;
-				};
-
-				opp-655000000 {
-					opp-hz = /bits/ 64 <655000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
-					opp-peak-kBps = <2736000>;
-				};
-
-				opp-690000000 {
-					opp-hz = /bits/ 64 <690000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
-					opp-peak-kBps = <2736000>;
-				};
-			};
-		};
-
-		gmu: gmu@3d6a000 {
-			compatible = "qcom,adreno-gmu-690.0", "qcom,adreno-gmu";
-			reg = <0 0x03d6a000 0 0x34000>,
-			      <0 0x03de0000 0 0x10000>,
-			      <0 0x0b290000 0 0x10000>;
-			reg-names = "gmu", "rscc", "gmu_pdc";
-			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hfi", "gmu";
-			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
-				 <&gpucc GPU_CC_CXO_CLK>,
-				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
-				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
-				 <&gpucc GPU_CC_AHB_CLK>,
-				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
-				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
-			clock-names = "gmu",
-				      "cxo",
-				      "axi",
-				      "memnoc",
-				      "ahb",
-				      "hub",
-				      "smmu_vote";
-			power-domains = <&gpucc GPU_CC_CX_GDSC>,
-					<&gpucc GPU_CC_GX_GDSC>;
-			power-domain-names = "cx",
-					     "gx";
-			iommus = <&gpu_smmu 5 0xc00>;
-			operating-points-v2 = <&gmu_opp_table>;
-
-			gmu_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				opp-200000000 {
-					opp-hz = /bits/ 64 <200000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
-				};
-
-				opp-500000000 {
-					opp-hz = /bits/ 64 <500000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
-				};
-			};
-		};
-
-		gpucc: clock-controller@3d90000 {
-			compatible = "qcom,sc8280xp-gpucc";
-			reg = <0 0x03d90000 0 0x9000>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
-				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
-			clock-names = "bi_tcxo",
-				      "gcc_gpu_gpll0_clk_src",
-				      "gcc_gpu_gpll0_div_clk_src";
-
-			power-domains = <&rpmhpd SC8280XP_GFX>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-		};
-
-		gpu_smmu: iommu@3da0000 {
-			compatible = "qcom,sc8280xp-smmu-500", "qcom,adreno-smmu",
-				     "qcom,smmu-500", "arm,mmu-500";
-			reg = <0 0x03da0000 0 0x20000>;
-			#iommu-cells = <2>;
-			#global-interrupts = <2>;
-			interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>;
-
-			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
-				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
-				 <&gpucc GPU_CC_AHB_CLK>,
-				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
-				 <&gpucc GPU_CC_CX_GMU_CLK>,
-				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
-				 <&gpucc GPU_CC_HUB_AON_CLK>;
-			clock-names = "gcc_gpu_memnoc_gfx_clk",
-				      "gcc_gpu_snoc_dvm_gfx_clk",
-				      "gpu_cc_ahb_clk",
-				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
-				      "gpu_cc_cx_gmu_clk",
-				      "gpu_cc_hub_cx_int_clk",
-				      "gpu_cc_hub_aon_clk";
-
-			power-domains = <&gpucc GPU_CC_CX_GDSC>;
-			dma-coherent;
-		};
-
-		usb_0_hsphy: phy@88e5000 {
-			compatible = "qcom,sc8280xp-usb-hs-phy",
-				     "qcom,usb-snps-hs-5nm-phy";
-			reg = <0 0x088e5000 0 0x400>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "ref";
-			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_2_hsphy0: phy@88e7000 {
-			compatible = "qcom,sc8280xp-usb-hs-phy",
-				     "qcom,usb-snps-hs-5nm-phy";
-			reg = <0 0x088e7000 0 0x400>;
-			clocks = <&gcc GCC_USB2_HS0_CLKREF_CLK>;
-			clock-names = "ref";
-			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_2_hsphy1: phy@88e8000 {
-			compatible = "qcom,sc8280xp-usb-hs-phy",
-				     "qcom,usb-snps-hs-5nm-phy";
-			reg = <0 0x088e8000 0 0x400>;
-			clocks = <&gcc GCC_USB2_HS1_CLKREF_CLK>;
-			clock-names = "ref";
-			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_2_hsphy2: phy@88e9000 {
-			compatible = "qcom,sc8280xp-usb-hs-phy",
-				     "qcom,usb-snps-hs-5nm-phy";
-			reg = <0 0x088e9000 0 0x400>;
-			clocks = <&gcc GCC_USB2_HS2_CLKREF_CLK>;
-			clock-names = "ref";
-			resets = <&gcc GCC_QUSB2PHY_HS2_MP_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_2_hsphy3: phy@88ea000 {
-			compatible = "qcom,sc8280xp-usb-hs-phy",
-				     "qcom,usb-snps-hs-5nm-phy";
-			reg = <0 0x088ea000 0 0x400>;
-			clocks = <&gcc GCC_USB2_HS3_CLKREF_CLK>;
-			clock-names = "ref";
-			resets = <&gcc GCC_QUSB2PHY_HS3_MP_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_2_qmpphy0: phy@88ef000 {
-			compatible = "qcom,sc8280xp-qmp-usb3-uni-phy";
-			reg = <0 0x088ef000 0 0x2000>;
-
-			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
-				 <&gcc GCC_USB3_MP0_CLKREF_CLK>,
-				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
-			clock-names = "aux", "ref", "com_aux", "pipe";
-
-			resets = <&gcc GCC_USB3_UNIPHY_MP0_BCR>,
-				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
-			reset-names = "phy", "phy_phy";
-
-			power-domains = <&gcc USB30_MP_GDSC>;
-
-			#clock-cells = <0>;
-			clock-output-names = "usb2_phy0_pipe_clk";
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_2_qmpphy1: phy@88f1000 {
-			compatible = "qcom,sc8280xp-qmp-usb3-uni-phy";
-			reg = <0 0x088f1000 0 0x2000>;
-
-			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
-				 <&gcc GCC_USB3_MP1_CLKREF_CLK>,
-				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
-			clock-names = "aux", "ref", "com_aux", "pipe";
-
-			resets = <&gcc GCC_USB3_UNIPHY_MP1_BCR>,
-				 <&gcc GCC_USB3UNIPHY_PHY_MP1_BCR>;
-			reset-names = "phy", "phy_phy";
-
-			power-domains = <&gcc USB30_MP_GDSC>;
-
-			#clock-cells = <0>;
-			clock-output-names = "usb2_phy1_pipe_clk";
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
 		remoteproc_adsp: remoteproc@3000000 {
 			compatible = "qcom,sc8280xp-adsp-pas";
 			reg = <0 0x03000000 0 0x10000>;
@@ -3166,6 +2879,180 @@ lpasscc: clock-controller@33e0000 {
 			#reset-cells = <1>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-690.0", "qcom,adreno";
+
+			reg = <0 0x03d00000 0 0x40000>,
+			      <0 0x03d9e000 0 0x1000>,
+			      <0 0x03d61000 0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&gpu_smmu 0 0xc00>, <&gpu_smmu 1 0xc00>;
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "gfx-mem";
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-270000000 {
+					opp-hz = /bits/ 64 <270000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <451000>;
+				};
+
+				opp-410000000 {
+					opp-hz = /bits/ 64 <410000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <1555000>;
+				};
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <1555000>;
+				};
+
+				opp-547000000 {
+					opp-hz = /bits/ 64 <547000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <1555000>;
+				};
+
+				opp-606000000 {
+					opp-hz = /bits/ 64 <606000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <2736000>;
+				};
+
+				opp-640000000 {
+					opp-hz = /bits/ 64 <640000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <2736000>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <2736000>;
+				};
+
+				opp-690000000 {
+					opp-hz = /bits/ 64 <690000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <2736000>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-690.0", "qcom,adreno-gmu";
+			reg = <0 0x03d6a000 0 0x34000>,
+			      <0 0x03de0000 0 0x10000>,
+			      <0 0x0b290000 0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
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
+			iommus = <&gpu_smmu 5 0xc00>;
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+			};
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,sc8280xp-gpucc";
+			reg = <0 0x03d90000 0 0x9000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "bi_tcxo",
+				      "gcc_gpu_gpll0_clk_src",
+				      "gcc_gpu_gpll0_div_clk_src";
+
+			power-domains = <&rpmhpd SC8280XP_GFX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		gpu_smmu: iommu@3da0000 {
+			compatible = "qcom,sc8280xp-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0 0x03da0000 0 0x20000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+			interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HUB_AON_CLK>;
+			clock-names = "gcc_gpu_memnoc_gfx_clk",
+				      "gcc_gpu_snoc_dvm_gfx_clk",
+				      "gpu_cc_ahb_clk",
+				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
+				      "gpu_cc_cx_gmu_clk",
+				      "gpu_cc_hub_cx_int_clk",
+				      "gpu_cc_hub_aon_clk";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		sdc2: mmc@8804000 {
 			compatible = "qcom,sc8280xp-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;
@@ -3209,6 +3096,71 @@ opp-202000000 {
 			};
 		};
 
+		usb_0_hsphy: phy@88e5000 {
+			compatible = "qcom,sc8280xp-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088e5000 0 0x400>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_hsphy0: phy@88e7000 {
+			compatible = "qcom,sc8280xp-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088e7000 0 0x400>;
+			clocks = <&gcc GCC_USB2_HS0_CLKREF_CLK>;
+			clock-names = "ref";
+			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_hsphy1: phy@88e8000 {
+			compatible = "qcom,sc8280xp-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088e8000 0 0x400>;
+			clocks = <&gcc GCC_USB2_HS1_CLKREF_CLK>;
+			clock-names = "ref";
+			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_hsphy2: phy@88e9000 {
+			compatible = "qcom,sc8280xp-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088e9000 0 0x400>;
+			clocks = <&gcc GCC_USB2_HS2_CLKREF_CLK>;
+			clock-names = "ref";
+			resets = <&gcc GCC_QUSB2PHY_HS2_MP_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_hsphy3: phy@88ea000 {
+			compatible = "qcom,sc8280xp-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088ea000 0 0x400>;
+			clocks = <&gcc GCC_USB2_HS3_CLKREF_CLK>;
+			clock-names = "ref";
+			resets = <&gcc GCC_QUSB2PHY_HS3_MP_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		usb_0_qmpphy: phy@88eb000 {
 			compatible = "qcom,sc8280xp-qmp-usb43dp-phy";
 			reg = <0 0x088eb000 0 0x4000>;
@@ -3256,6 +3208,54 @@ port@2 {
 			};
 		};
 
+		usb_2_qmpphy0: phy@88ef000 {
+			compatible = "qcom,sc8280xp-qmp-usb3-uni-phy";
+			reg = <0 0x088ef000 0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&gcc GCC_USB3_MP0_CLKREF_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
+			clock-names = "aux", "ref", "com_aux", "pipe";
+
+			resets = <&gcc GCC_USB3_UNIPHY_MP0_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
+			reset-names = "phy", "phy_phy";
+
+			power-domains = <&gcc USB30_MP_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "usb2_phy0_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_qmpphy1: phy@88f1000 {
+			compatible = "qcom,sc8280xp-qmp-usb3-uni-phy";
+			reg = <0 0x088f1000 0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&gcc GCC_USB3_MP1_CLKREF_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
+			clock-names = "aux", "ref", "com_aux", "pipe";
+
+			resets = <&gcc GCC_USB3_UNIPHY_MP1_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP1_BCR>;
+			reset-names = "phy", "phy_phy";
+
+			power-domains = <&gcc USB30_MP_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "usb2_phy1_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		usb_1_hsphy: phy@8902000 {
 			compatible = "qcom,sc8280xp-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";

-- 
2.49.0


