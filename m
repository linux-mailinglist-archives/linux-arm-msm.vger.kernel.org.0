Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153FD21A169
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 15:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbgGINy5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 09:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728168AbgGINyw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 09:54:52 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C73C08E806
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 06:54:49 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id z63so1802859qkb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 06:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zVIPPLbqjmo/Iwwps8MpLZxj/UFeCK2sq0o44pRwZbI=;
        b=N2qBkrm3PwwpiXpSOVCdW9cCXUInnitzIwZbtP3lbWBl2nDnEYa+fKCXE+SJ36xoR7
         uh8889qN/Xncrc+qpp7d26NOMTmo/p4+28mkrJ0AGrloAHEIdnWYzHwkbLvHx2Himg+9
         pjfeob73Pu8CVT17lUTJpGPC5ACosnPtnYkP0HjEY9b6KJt9r/rD+HgUmIsJJz4mjgE2
         cm2csvFxZAfuXrh6aZVBDRfaEwtZFi2nRCa1dqVWuwLn6MAF5Y3b3QCT8HWbkeQjhCPz
         /cM4URfFJ9g4KMFuJoBA+ro+jNNWVgvjFK/VlvrH2qLTa4Jb4SsxouxkCtduVK8IRNvM
         HAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zVIPPLbqjmo/Iwwps8MpLZxj/UFeCK2sq0o44pRwZbI=;
        b=qYQ7QFcve/jI08Adlms6eAuz8LkhytPJ1hA8Zy3rw+jkEQKk/ujc7eWFiZrOmzLfg8
         sIN0b/kYsjRNSdvRpEBvsn1sj2x++4ps308AIjst0mAy2oPwP8ZUzeMORFfYJ8llj/pa
         rgcvVOWswBemgy94FIV/xdAOBZWH6tDZkqWrNqntqkwSwOISM6FiPSC78tiUXrm4kzBs
         4dIHvoiUCBWpBt2+ZOEkhaEIJRBHv2jo3SjXYrHhBA7wbl1dVIzdp1PggkZglycd7LE5
         df7IO992SbzlsST24SH6//FIFpMosFoUDoQDd5FvbuLpp3Nok1fqxdM9yWs70u309pPt
         XKNg==
X-Gm-Message-State: AOAM530nn+cn2gNtun0B2MrpbstjvcAlmmFAdWnu9usZQTlVt6Ki957I
        dtOoZNdzjUPgTV0HAAOJbuVCfpCoHt0=
X-Google-Smtp-Source: ABdhPJz1Gd0tavblm07W9CmsHnSrtnNcEZ6RVnIYMIIE1NfVw8XI37E675bACSS+UnssGFHVqBDEaQ==
X-Received: by 2002:a37:a6ce:: with SMTP id p197mr61870185qke.211.1594302888642;
        Thu, 09 Jul 2020 06:54:48 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 130sm3632735qkn.82.2020.07.09.06.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 06:54:48 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 13/14] arm64: dts: qcom: add sm8150 GPU nodes
Date:   Thu,  9 Jul 2020 09:52:44 -0400
Message-Id: <20200709135251.643-14-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200709135251.643-1-jonathan@marek.ca>
References: <20200709135251.643-1-jonathan@marek.ca>
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
index d117a64f591e..b65fd7027d1e 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,gcc-sm8150.h>
+#include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -549,6 +550,141 @@ glink-edge {
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

