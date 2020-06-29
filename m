Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 883B620E5CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732878AbgF2Vl6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727926AbgF2Sh6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 14:37:58 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5C0C031C41
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 10:21:19 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id o38so13434367qtf.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 10:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DqAKdt3lk82f18skm9MplMyKRKUbc8f3Yv5d4peK0Jw=;
        b=w5i6SQNv/k+D73je2CRcdyD+0Az5V4KBSj88gUxaNU9octr3t+vYWR1z9dbIMJj/1F
         PaGfgCqeVeOZhH0syXM4R1Zk+2GqLopRZpjR+7jKyeAFSAZyq+uQiaVLtr5tzj4FqO3u
         x00S0zaaOyA4NhkmlXy9lJlxPHpJd7c6hv9QxDfNMSuusi0N5rCEY7jLOK9DBmEdEJMV
         lsmvJyoKgPlPeuE6sfmWOCrmAWngDxCGrNReUqv9F0zwoL9a7NDubghRYQa6Yv7ySY36
         If73t3/CtelKI7xYjNdKnrgRRyUmA9jQRvHuq75pkOoDhN1m7c8ETQMnYY3rY796K0Bo
         fgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DqAKdt3lk82f18skm9MplMyKRKUbc8f3Yv5d4peK0Jw=;
        b=P2Ni9AaThjB+plQALW7Nwfcckvkp+LSD1LGfBkdw9W9hy+yOgPv+1s/cgx6L+RV7Z3
         kdklzzCkmfvM3luIUTaibi3/+pSJ1UChUgRA5BefOBfinW4cmRB9f+DcVHkzUCNNWLy5
         9OYSYF3Px+ZwPiEKwS33jbvyUoWd+NFIIvtnHqQU9mQfHUorYrplhVuIyFI+5OC1AXS3
         qSN65kyhr4Co6MxONJkai4xzJg2+ZQjA4BWBNwwjtYtzZFJdd0lCyTmuxEJSQlkWAaUw
         jDcg0Uieh4XFED+srROaF6GfeLBeXJS/PCzqoJxSJIn2wOBzou0imLMuwJZwNqqTnwrZ
         9TTw==
X-Gm-Message-State: AOAM531w1d42qUtYvV6gW/kBRVzt/g4q8v7q5hxK/IDwE/cSLQq1tCcl
        5Uah46vn9yBKgkmrHPJ9nqR9/l/gyYU=
X-Google-Smtp-Source: ABdhPJzoX9t8EnEg8SA3ZjJG2lajLSBPeU7HyGvl3rLXCaUCHfg2zKcEyUNd/+m0kAxQSeLfsPAnYQ==
X-Received: by 2002:ac8:36d8:: with SMTP id b24mr16512566qtc.315.1593451278675;
        Mon, 29 Jun 2020 10:21:18 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q5sm408363qtf.12.2020.06.29.10.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 10:21:18 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 12/13] arm64: dts: qcom: add sm8150 GPU nodes
Date:   Mon, 29 Jun 2020 13:20:42 -0400
Message-Id: <20200629172049.30452-13-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629172049.30452-1-jonathan@marek.ca>
References: <20200629172049.30452-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This brings up the GPU. Tested on HDK855 by running vulkan CTS.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 136 +++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index f928ef9fa3a3..2be39eb0ce7f 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,gcc-sm8150.h>
+#include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -540,6 +541,141 @@ glink-edge {
 			};
 		};
 
+		gpu: gpu@2c00000 {
+			/*
+			 * note: the amd,imageon compatible makes it possible
+			 * to use the drm/msm driver without the display node,
+			 * make sure to remove it when display node is added
+			 */
+			compatible = "qcom,adreno-640.1",
+				     "qcom,adreno",
+				     "amd,imageon";
+			#stream-id-cells = <16>;
+
+			reg = <0 0x2c00000 0 0x40000>;
+			reg-names = "kgsl_3d0_reg_memory";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0 0x401>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+
+			zap-shader {
+				memory-region = <&gpu_mem>;
+			};
+
+			/* note: downstream checks gpu binning for 675 Mhz */
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-675000000 {
+					opp-hz = /bits/ 64 <675000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+				};
+
+				opp-585000000 {
+					opp-hz = /bits/ 64 <585000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+
+				opp-499200000 {
+					opp-hz = /bits/ 64 <499200000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+				};
+
+				opp-427000000 {
+					opp-hz = /bits/ 64 <427000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				opp-345000000 {
+					opp-hz = /bits/ 64 <345000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				opp-257000000 {
+					opp-hz = /bits/ 64 <257000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+			};
+		};
+
+		gmu: gmu@2c6a000 {
+			compatible="qcom,adreno-gmu-640.1", "qcom,adreno-gmu";
+
+			reg = <0 0x2c6a000 0 0x30000>,
+			      <0 0xb290000 0 0x10000>,
+			      <0 0xb490000 0 0x10000>;
+			reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+			         <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
+			clock-names = "ahb", "gmu", "cxo", "axi", "memnoc";
+
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
+			power-domain-names = "cx", "gx";
+
+			iommus = <&adreno_smmu 5 0x400>;
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
+		gpucc: clock-controller@2c90000 {
+			compatible = "qcom,sm8150-gpucc";
+			reg = <0 0x2c90000 0 0x9000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "bi_tcxo",
+				      "gcc_gpu_gpll0_clk_src",
+				      "gcc_gpu_gpll0_div_clk_src";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		adreno_smmu: iommu@2ca0000 {
+			compatible = "qcom,sm8150-smmu-500", "arm,mmu-500";
+			reg = <0 0x2ca0000 0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+			         <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "ahb", "bus", "iface";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
 		tlmm: pinctrl@3100000 {
 			compatible = "qcom,sm8150-pinctrl";
 			reg = <0x0 0x03100000 0x0 0x300000>,
-- 
2.26.1

