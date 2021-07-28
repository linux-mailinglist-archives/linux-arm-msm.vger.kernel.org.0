Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D733D3D9887
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhG1W01 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:26:27 -0400
Received: from relay01.th.seeweb.it ([5.144.164.162]:37759 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbhG1W0P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:26:15 -0400
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 207D020068;
        Thu, 29 Jul 2021 00:26:11 +0200 (CEST)
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
Subject: [PATCH 19/39] arm64: dts: qcom: sdm630: Add Adreno 508 GPU configuration
Date:   Thu, 29 Jul 2021 00:25:22 +0200
Message-Id: <20210728222542.54269-20-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

The SDM630 SoC features an Adreno 508.0 GPU with a minimum frequency
of 160MHz and a maximum of (depending on the speed-bin) 775MHz.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 84 +++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index f6f30ec607d6..c7d39fea8254 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
- * Copyright (c) 2020, Konrad Dybcio
+ * Copyright (c) 2020, Konrad Dybcio <konradybcio@gmail.com>
+ * Copyright (c) 2020, AngeloGioacchino Del Regno <kholk11@gmail.com>
  */
 
 #include <dt-bindings/clock/qcom,gcc-sdm660.h>
@@ -1134,6 +1135,87 @@ sd-cd {
 			};
 		};
 
+		adreno_gpu: gpu@5000000 {
+			compatible = "qcom,adreno-508.0", "qcom,adreno";
+			#stream-id-cells = <16>;
+
+			reg = <0x05000000 0x40000>;
+			reg-names = "kgsl_3d0_reg_memory";
+
+			interrupts = <0 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+				<&gpucc GPUCC_RBBMTIMER_CLK>,
+				<&gcc GCC_BIMC_GFX_CLK>,
+				<&gcc GCC_GPU_BIMC_GFX_CLK>,
+				<&gpucc GPUCC_RBCPR_CLK>,
+				<&gpucc GPUCC_GFX3D_CLK>;
+
+			clock-names = "iface",
+				"rbbmtimer",
+				"mem",
+				"mem_iface",
+				"rbcpr",
+				"core";
+
+			power-domains = <&rpmpd SDM660_VDDMX>;
+			iommus = <&kgsl_smmu 0>;
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
+			interconnects = <&gnoc 1 &bimc 5>;
+			interconnect-names = "gfx-mem";
+
+			operating-points-v2 = <&gpu_sdm630_opp_table>;
+
+			gpu_sdm630_opp_table: opp-table {
+				compatible  = "operating-points-v2";
+				opp-775000000 {
+					opp-hz = /bits/ 64 <775000000>;
+					opp-level = <RPM_SMD_LEVEL_TURBO>;
+					opp-peak-kBps = <5412000>;
+					opp-supported-hw = <0xA2>;
+				};
+				opp-647000000 {
+					opp-hz = /bits/ 64 <647000000>;
+					opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+					opp-peak-kBps = <4068000>;
+					opp-supported-hw = <0xFF>;
+				};
+				opp-588000000 {
+					opp-hz = /bits/ 64 <588000000>;
+					opp-level = <RPM_SMD_LEVEL_NOM>;
+					opp-peak-kBps = <3072000>;
+					opp-supported-hw = <0xFF>;
+				};
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
+					opp-peak-kBps = <2724000>;
+					opp-supported-hw = <0xFF>;
+				};
+				opp-370000000 {
+					opp-hz = /bits/ 64 <370000000>;
+					opp-level = <RPM_SMD_LEVEL_SVS>;
+					opp-peak-kBps = <2188000>;
+					opp-supported-hw = <0xFF>;
+				};
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <1648000>;
+					opp-supported-hw = <0xFF>;
+				};
+				opp-160000000 {
+					opp-hz = /bits/ 64 <160000000>;
+					opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
+					opp-peak-kBps = <1200000>;
+					opp-supported-hw = <0xFF>;
+				};
+			};
+		};
+
 		kgsl_smmu: iommu@5040000 {
 			compatible = "qcom,sdm630-smmu-v2",
 				     "qcom,adreno-smmu", "qcom,smmu-v2";
-- 
2.32.0

