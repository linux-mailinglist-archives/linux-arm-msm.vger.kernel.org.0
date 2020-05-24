Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E261E02E1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 23:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388287AbgEXVGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 May 2020 17:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388298AbgEXVGe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 May 2020 17:06:34 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F32C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2020 14:06:34 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id e16so6671325qtg.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2020 14:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0FV4gDWANQPDDk3Qcqd7n0WZF5nF9QpVrxzsC0+ROQ=;
        b=ppJWH4TWXQrqBS1oqnCG5bBN51rlxhSS7K+fr4P8jI5cdDcWagjBIyFe6mTTLJJXu3
         EHvB3OtgFISr77VZGLcFr5z39GTQ4vdFNll7UGScjCN4b0mjN9WHscll0mkxiL67V0EG
         Jh3lAY8ICqHfQeojBpFghjPkO3nXJPmhtZ+5RnZur1fO3GjjOXpe44eqQp/cmzcKTPJN
         F05Q8YdvnDX/9j4BR3yFMRbvFMsPraYHS8hLN7S6M7SXqerW8HGTbDmZmnr30HH769ba
         PCn1zLw67jE3UWVqn5iAcIdUtesCTxHZFPpT/+0G6YTfbexgskErcbFeRKozrT6gNoeo
         AJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0FV4gDWANQPDDk3Qcqd7n0WZF5nF9QpVrxzsC0+ROQ=;
        b=MtgmA4BANFwZbfoH8fTQk1wMZX99y1l0ksmLNuko/42ipKmcXQ9QbKHIHRyuh8MC/K
         nkw8ifMUTUE2ETeQthjt/BZOVKrC1umK6AONOPT6snMv880BOMaH1mdtQQWEadixb3Ru
         dbgf5dD0sp8qc0P3ZlpZfBVzM+DyGuqmgrVZSDw5HMJxL/GdCg7ANPHcNrF3fWaGfpWE
         NAaTh7SPrx3r/dfIcRdUJkKJIph5v+706XzHNBpr8VLs6eJWqdPdTsHOqWt7YdVUKcKd
         m1wpD1UecVJ46prwfupginNqTTTSuvz3zPs+kJWa3tD23zrp12buwrU+aIiD3JU4RfxI
         ArTA==
X-Gm-Message-State: AOAM531FvXPT+zXtrkkbx0IlHglpDOyaxIon/9i/0mfbpo2g8004p26f
        42ZvdWCEGGaA9VHgFFLbxR4nlk2lFl4=
X-Google-Smtp-Source: ABdhPJzHUDxBBjtUNeq8JlCgH/w/+qn1imv9TCQck3AoNbnMGzYBC+Dy/Twnm8Arw+Zbq1XNxZdLyg==
X-Received: by 2002:ac8:340b:: with SMTP id u11mr25926922qtb.38.1590354393351;
        Sun, 24 May 2020 14:06:33 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id g51sm4401769qtb.69.2020.05.24.14.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 14:06:32 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 10/10] arm64: dts: qcom: add sm8250 GPU nodes
Date:   Sun, 24 May 2020 17:06:11 -0400
Message-Id: <20200524210615.17035-11-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200524210615.17035-1-jonathan@marek.ca>
References: <20200524210615.17035-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This brings up the GPU. Tested on HDK865 by running vulkan CTS.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 139 +++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 3bdce658c08a..a55d0e5d7425 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+#include <dt-bindings/clock/qcom,gpucc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
@@ -387,6 +388,144 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		gpu: gpu@3d00000 {
+			/*
+			 * note: the amd,imageon compatible makes it possible
+			 * to use the drm/msm driver without the display node,
+			 * make sure to remove it when display node is added
+			 */
+			compatible = "qcom,adreno-650.2",
+				     "qcom,adreno",
+				     "amd,imageon";
+			#stream-id-cells = <16>;
+
+			reg = <0 0x3d00000 0 0x40000>;
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
+			/* note: downstream checks gpu binning for 670 Mhz */
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-670000000 {
+					opp-hz = /bits/ 64 <670000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+				};
+
+				opp-587000000 {
+					opp-hz = /bits/ 64 <587000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+
+				opp-525000000 {
+					opp-hz = /bits/ 64 <525000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+				};
+
+				opp-490000000 {
+					opp-hz = /bits/ 64 <490000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				/* opp-441600000 {
+					opp-hz = /bits/ 64 <441600000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+				}; */
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				opp-305000000 {
+					opp-hz = /bits/ 64 <305000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible="qcom,adreno-gmu-650.2", "qcom,adreno-gmu";
+
+			reg = <0 0x3d6a000 0 0x30000>,
+			      <0 0x3de0000 0 0x10000>,
+			      <0 0xb290000 0 0x10000>,
+			      <0 0xb490000 0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc", "gmu_pdc_seq";
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
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,sm8250-gpucc";
+			reg = <0 0x3d90000 0 0x9000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+		};
+
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
+			reg = <0 0x3da0000 0 0x10000>;
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
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "ahb", "bus", "iface";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
 		usb_1_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8250-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
-- 
2.26.1

