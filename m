Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5D9420E3DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390861AbgF2VS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390855AbgF2VSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 17:18:54 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 452C4C03E97A
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 14:18:54 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id z2so14052633qts.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 14:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=snsizZHV6FarzIo1/rFuJ3/yVOUqTzRajk7bCD023lA=;
        b=zQ9sW2SoXjWVZRmQyT1/owh8pijHBo07EyN8C/Z0d1XSGHxQYbXs7aVsBcpXKVMUti
         OK8v+cUd4chLSkPfS2RGwAkZ7KtJe5hRSgABvJ5A3WRuUsdv4ZXuw+PE7WBQ/q1HR7O1
         P7s9+RTQWwjqW+hvbYIiJZeWAGVb4n1pGED/ITyFvo0Eq0gBwEr7LD0z6Rfoj4E6JMW5
         DPCJ3YhzJOugH/x3CHB+XuRZATqAGOe/rNvfXMNUYBnC50Mkyba3K9qNRgJg5uhbUHYb
         Uf9nuVX9GLHPxIn2Jph24nY078m94JMkU75qjFA6qqBAkmjRYn+qch7VoP1U5v7rQMqI
         5jFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=snsizZHV6FarzIo1/rFuJ3/yVOUqTzRajk7bCD023lA=;
        b=YXeWwb5vl8f1yPr8nPqt19tEkuh32GNqwIf0LNGtmDyexqJS9UeRk5v0i5Azp2Y8Qb
         mF9VvEHgmd19OJVWShkoH9cc9/0WlmjQXN9xccxbShLjdMllo7G0dmzf0UMkXEbE/Q4/
         ztHy7KR3iDDtWhL9j52rKVshIKFDYLSL8CRpEMn0/7RT/xIPUHH5omvRs4f+kmkXTuNc
         fcOKdgMFuNbbOl0z/z5eb7UdoqJ2Qlkf2OXibCf0aK4oQChB40Dl1YLbxOOzGmD7BryV
         f2riVFO0hap1YfYSvXf06+iLSS545P69JX004kVf2HTsIKf6Xvksfg0ORSw6qVwDZBeX
         pvHw==
X-Gm-Message-State: AOAM531vK/zW9tJs4+gl2ZkguYL7CFynWum9kRk0aocCHJe0JI5cf9ao
        rTdgK5Y00AfSceDu4Ahe0PV1FcMn/fA=
X-Google-Smtp-Source: ABdhPJz3aQ7N4NLDCKSx7kR96toy3vM1yTDI0Ktde9VRgU3v3iCNkR89UoQmk4xFQBIVkavhBP39sg==
X-Received: by 2002:aed:2cc7:: with SMTP id g65mr18311733qtd.248.1593465533310;
        Mon, 29 Jun 2020 14:18:53 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id b196sm1169078qkg.11.2020.06.29.14.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:18:52 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v2 13/13] arm64: dts: qcom: add sm8250 GPU nodes
Date:   Mon, 29 Jun 2020 17:17:19 -0400
Message-Id: <20200629211725.2592-14-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629211725.2592-1-jonathan@marek.ca>
References: <20200629211725.2592-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This brings up the GPU. Tested on HDK865 by running vulkan CTS.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 143 +++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 25224d8cac4e..c9b38dd88f43 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+#include <dt-bindings/clock/qcom,gpucc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
@@ -387,6 +388,148 @@ tcsr_mutex: hwlock@1f40000 {
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
+				opp-441600000 {
+					opp-hz = /bits/ 64 <441600000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+				};
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
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,sm8250-smmu-500", "arm,mmu-500";
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

