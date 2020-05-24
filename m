Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CA61E02E0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 23:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388311AbgEXVGl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 May 2020 17:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388297AbgEXVGe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 May 2020 17:06:34 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44820C08C5C2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2020 14:06:33 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id f189so15972915qkd.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2020 14:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c4VnJkkNORcnXVsefViOavxGbWlTLu5kwrmQ6DrqkvQ=;
        b=SaeTcgNnIrdJ8m5uLR3jhp+c9gJSwdrSG3yfaHKqk7QafEBO3e3oUSaIMJnOiH1s+N
         kCHAR1JIFUlnbKxbHoRtemu1mTOnDvxBdQ3/Cz1a/Xda42SroQ8exlp3X9HDOINBkK5K
         AmFHDca+jvBvI5CxzLsE1/R5YFNPUYG+hwytGos1dDYyYZkpX/Lbg+9Qzsz405pzwfH8
         D1E0av4TSh3BO9B1dK2l6xuAF0g/Kbwj9OUoi2tvpF7q+QnD4pl8fl5yPj4LaU+ZLS3Y
         8wj0YFlDCnesl78WiuSSk07Kvu7x7sbXBwqE5a/vvqUwBLRJEaE+fvdjUO4/TqnWiQ4R
         5amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c4VnJkkNORcnXVsefViOavxGbWlTLu5kwrmQ6DrqkvQ=;
        b=CykcO7kZzC9M4g99d+FNzr/d/smWQJFEn9+12InWnBMRf2dHy6ePK/BhZK+4HlRK/J
         gMZcvxSc4Snj3/Uh9DC/sHwJa+DnzXsHwHxI7xke4yDzkvBMf2VAUQKhyGC1lyJDTSnj
         G+ggob3IfGfwncDD1vgKpSdEzQ3I0xFCwFu5am4MdbszqdcAaqn1E+OPpKUQmpNv7U/Z
         22CYf8mKk0rc8PF1VyxYN03Uo8IXIS2TnHtC/9vA3tYdtghHRBmVD08IOqYxBxFHY50i
         lt0lw0q8ASWIBMHUKIQzYtOrNrwhscVmhf5SjiEkn2BY7xdSfCfaoPBg+r12ufq+asZd
         DNVw==
X-Gm-Message-State: AOAM532txm9mrqyrGccjE97ym7tiyaan4sV+aAJXphyqqAo6TcIJCywL
        fTCU3/g1MUDlT7zfwlhEReK3PJBbXXM=
X-Google-Smtp-Source: ABdhPJzto33NRO761giF2rceigWsUm197eO6eWMTp5L9x4kbF/xyxA7Cg7V4rIriKBtHuluzQeByJA==
X-Received: by 2002:a05:620a:a53:: with SMTP id j19mr24846414qka.183.1590354392272;
        Sun, 24 May 2020 14:06:32 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id g51sm4401769qtb.69.2020.05.24.14.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 14:06:31 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 09/10] arm64: dts: qcom: add sm8150 GPU nodes
Date:   Sun, 24 May 2020 17:06:10 -0400
Message-Id: <20200524210615.17035-10-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200524210615.17035-1-jonathan@marek.ca>
References: <20200524210615.17035-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This brings up the GPU. Tested on HDK855 by running vulkan CTS.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 132 +++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 903514fc299f..1996e42ccb28 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,gcc-sm8150.h>
+#include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -540,6 +541,137 @@ glink-edge {
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
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+		};
+
+		adreno_smmu: iommu@2ca0000 {
+			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
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

