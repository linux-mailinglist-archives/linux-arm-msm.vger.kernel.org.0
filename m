Return-Path: <linux-arm-msm+bounces-2136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9F27FA61F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 17:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E690128177F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 16:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A690364DC;
	Mon, 27 Nov 2023 16:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tBb5eVlo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDCFCE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 08:20:16 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-544455a4b56so5845886a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 08:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701102015; x=1701706815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wScVN9GJ+E8NH1QgW/pZgzNPoRc7lXT0Ko7dLMF2kn0=;
        b=tBb5eVloyVgCUvzVDCzmI3mmhG7Kb4yf2YsEBHuryVc0w2nZwSNIc3oOObzOxbTHy1
         FRgLv5TzVo2mhuFVJW201KboRsXYtK5wsalt3JEt4bwnv1474Ul+cpPtF3oQdNseTaMA
         FCrKCxnX/AEtmsRDTxUk1stKMf3eU1Z9NaWNl4Wk1kTO9caBBjY4uUiNwHd21Qa5mtW4
         i/FziCY0QUkbKrLg/vnErvmzqAMgSqVgz+lNfsixPm53TvkJkiKlbBGJH2zvcXOti3BP
         DyvUVfNhAu5xLl7XTh5l1xYg0DgIMxZYcBOwSYpehrKGxgxZ4qDR3C4BqlAcy08mlXak
         QCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701102015; x=1701706815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wScVN9GJ+E8NH1QgW/pZgzNPoRc7lXT0Ko7dLMF2kn0=;
        b=JewATHuHD8kf3trNkyTHKaYmbpSanFd5vUAcil5s8PO0w0xaLCwBbgD7+MvsbE/sNe
         BQ9apFixVugZYflkqXlKtAb88+xtJvOtW1gaZ+jNOavF5FzCt3UdNdhpmngSGNokUF4O
         V5b4dfO+zEaZcLbwFIVlrI9itAXVML/g+4wE/6tJfitu5QgrjY/QLhlCpV1mgPYuDvVP
         M2SJu6vq5PHklCf3YsjmjVzeuPDL12ytEvf2ZlG/lgAvDciPI/0mz2fHb+5W7UbqeWLC
         M2xCve7TP50sPyET9uSltXllRz9OrtcvJ/ILOfcacTtNP9R0xaWkYzL+/QtAkHLYb+Rc
         fwtA==
X-Gm-Message-State: AOJu0YwzJNp/a9BuCZsbMcp5JnGX6IcAgfK1jk8c5mgoYpf5XY8Bj1rg
	UhoafJkJVcKiDeOl79s0++u4tnM4TUaCAqR3A44=
X-Google-Smtp-Source: AGHT+IGy0Fk2mPPN0sXHr17CQkC/+bQ81dI1bsK9vUcJe9XfJ34BTBR2CPBJZ9FdvdCitB42Tjln+g==
X-Received: by 2002:a17:906:3290:b0:9c1:66cc:1d7d with SMTP id 16-20020a170906329000b009c166cc1d7dmr7796734ejw.64.1701102014921;
        Mon, 27 Nov 2023 08:20:14 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b009c3828fec06sm5734760eje.81.2023.11.27.08.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 08:20:14 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 17:20:04 +0100
Subject: [PATCH 2/6] arm64: dts: qcom: sm8450: Add GPU nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231127-topic-a7xx_dt-v1-2-a228b8122ebf@linaro.org>
References: <20231127-topic-a7xx_dt-v1-0-a228b8122ebf@linaro.org>
In-Reply-To: <20231127-topic-a7xx_dt-v1-0-a228b8122ebf@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701102008; l=7123;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=I5oAq4yvU3S7sBbp5DBP75jCv9QJAYvsZHzH8XavMSU=;
 b=HoaVPcrRvjXrREUWeLaJt3R2+uJce6mBb18Ppr+odKdWMibsFYokteuvpay3z5ROgGRGAbOrn
 dlbTW4nz8kMCq0TN9SpOcjf9dm0DocD7Sairm1/44Z/7BgYh9MDJGHm
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Add the required nodes to support the A730 GPU.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 202 +++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index bde9c1093384..e9664672c160 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8450-camcc.h>
 #include <dt-bindings/clock/qcom,sm8450-dispcc.h>
+#include <dt-bindings/clock/qcom,sm8450-gpucc.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
@@ -18,6 +19,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8450.h>
+#include <dt-bindings/reset/qcom,sm8450-gpucc.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
@@ -2019,6 +2021,206 @@ tcsr: syscon@1fc0000 {
 			reg = <0x0 0x1fc0000 0x0 0x30000>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-730.1", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0 0x400>,
+				 <&adreno_smmu 1 0x400>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+
+			status = "disabled";
+
+			zap-shader {
+				memory-region = <&gpu_micro_code_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-818000000 {
+					opp-hz = /bits/ 64 <818000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+				};
+
+				opp-791000000 {
+					opp-hz = /bits/ 64 <791000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+				};
+
+				opp-734000000 {
+					opp-hz = /bits/ 64 <734000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+
+				opp-640000000 {
+					opp-hz = /bits/ 64 <640000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+				};
+
+				opp-599000000 {
+					opp-hz = /bits/ 64 <599000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				opp-545000000 {
+					opp-hz = /bits/ 64 <545000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+				};
+
+				opp-492000000 {
+					opp-hz = /bits/ 64 <492000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				opp-421000000 {
+					opp-hz = /bits/ 64 <421000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+				};
+
+				opp-350000000 {
+					opp-hz = /bits/ 64 <350000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-317000000 {
+					opp-hz = /bits/ 64 <317000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-285000000 {
+					opp-hz = /bits/ 64 <285000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+				};
+
+				opp-220000000 {
+					opp-hz = /bits/ 64 <220000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-730.1", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x35000>,
+			      <0x0 0x03d50000 0x0 0x10000>,
+			      <0x0 0x0b290000 0x0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_DEMET_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "hub",
+				      "demet";
+
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 5 0x400>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+			};
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,sm8450-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,sm8450-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>;
+			clock-names = "gmu",
+				      "hub",
+				      "hlos",
+				      "bus",
+				      "iface",
+				      "ahb";
+			power-domains = <&gpucc GPU_CX_GDSC>;
+			dma-coherent;
+		};
+
 		usb_1_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8450-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";

-- 
2.43.0


