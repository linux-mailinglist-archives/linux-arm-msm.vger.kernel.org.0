Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4645D3FE264
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 20:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244489AbhIASc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 14:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236651AbhIAScZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 14:32:25 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8384C0613C1;
        Wed,  1 Sep 2021 11:31:27 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4473020164;
        Wed,  1 Sep 2021 20:31:26 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org, jeffrey.l.hugo@gmail.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 5/5] arm64: dts: msm8998: Configure Adreno GPU and related IOMMU
Date:   Wed,  1 Sep 2021 20:31:23 +0200
Message-Id: <20210901183123.1087392-5-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901183123.1087392-1-angelogioacchino.delregno@somainline.org>
References: <20210901183123.1087392-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSM8998 SoC includes an Adreno 540.1 GPU, with a maximum frequency
of 710MHz. This GPU may or may not accept a ZAP shader, depending on
platform configuration, so adding a zap-shader node is left to the
board DT.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 97 +++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 221dc61ca5e3..0103fc1dfcfc 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1421,6 +1421,103 @@ glink-edge {
 			};
 		};
 
+		adreno_gpu: gpu@5000000 {
+			compatible = "qcom,adreno-540.1", "qcom,adreno";
+			reg = <0x05000000 0x40000>;
+			reg-names = "kgsl_3d0_reg_memory";
+
+			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+				<&gpucc RBBMTIMER_CLK>,
+				<&gcc GCC_BIMC_GFX_CLK>,
+				<&gcc GCC_GPU_BIMC_GFX_CLK>,
+				<&gpucc RBCPR_CLK>,
+				<&gpucc GFX3D_CLK>;
+			clock-names = "iface",
+				"rbbmtimer",
+				"mem",
+				"mem_iface",
+				"rbcpr",
+				"core";
+
+			interrupts = <0 300 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&adreno_smmu 0>;
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&rpmpd MSM8998_VDDMX>;
+			#stream-id-cells = <16>;
+			status = "disabled";
+
+			gpu_opp_table: opp-table {
+				compatible  = "operating-points-v2";
+				opp-710000097 {
+					opp-hz = /bits/ 64 <710000097>;
+					opp-level = <RPM_SMD_LEVEL_TURBO>;
+					opp-supported-hw = <0xFF>;
+				};
+
+				opp-670000048 {
+					opp-hz = /bits/ 64 <670000048>;
+					opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+					opp-supported-hw = <0xFF>;
+				};
+
+				opp-596000097 {
+					opp-hz = /bits/ 64 <596000097>;
+					opp-level = <RPM_SMD_LEVEL_NOM>;
+					opp-supported-hw = <0xFF>;
+				};
+
+				opp-515000097 {
+					opp-hz = /bits/ 64 <515000097>;
+					opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
+					opp-supported-hw = <0xFF>;
+				};
+
+				opp-414000000 {
+					opp-hz = /bits/ 64 <414000000>;
+					opp-level = <RPM_SMD_LEVEL_SVS>;
+					opp-supported-hw = <0xFF>;
+				};
+
+				opp-342000000 {
+					opp-hz = /bits/ 64 <342000000>;
+					opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+					opp-supported-hw = <0xFF>;
+				};
+
+				opp-257000000 {
+					opp-hz = /bits/ 64 <257000000>;
+					opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
+					opp-supported-hw = <0xFF>;
+				};
+			};
+		};
+
+		adreno_smmu: iommu@5040000 {
+			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
+			reg = <0x05040000 0x10000>;
+			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+				 <&gcc GCC_BIMC_GFX_CLK>,
+				 <&gcc GCC_GPU_BIMC_GFX_CLK>;
+			clock-names = "iface", "mem", "mem_iface";
+
+			#global-interrupts = <0>;
+			#iommu-cells = <1>;
+			interrupts =
+				<GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
+			/*
+			 * GPU-GX GDSC's parent is GPU-CX. We need to bring up the
+			 * GPU-CX for SMMU but we need both of them up for Adreno.
+			 * Contemporarily, we also need to manage the VDDMX rpmpd
+			 * domain in the Adreno driver.
+			 * Enable GPU CX/GX GDSCs here so that we can manage the
+			 * SoC VDDMX RPM Power Domain in the Adreno driver.
+			 */
+			power-domains = <&gpucc GPU_GX_GDSC>;
+			status = "disabled";
+		};
+
 		gpucc: clock-controller@5065000 {
 			compatible = "qcom,msm8998-gpucc";
 			#clock-cells = <1>;
-- 
2.32.0

