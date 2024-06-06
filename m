Return-Path: <linux-arm-msm+bounces-21910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED32E8FE585
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E23641C23FC5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 11:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4712195F00;
	Thu,  6 Jun 2024 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zpcJ5utk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FF1195B08
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 11:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717673773; cv=none; b=ZW5aoypErmfpufO7Mph8JgiLDds4KLls6QHHOLLUG7mQbggdb27hLnTmENHvId8Y/kKkhy1tDAURO3szvlABFAC9FlMxEvXM0QT5yo6cwxTLnWPn9NcrCnDXSawvrm/B8f652HnT6Csjs5tvk7EtDD3Ihr9QtlValPY/NUDu0N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717673773; c=relaxed/simple;
	bh=oEkR0OJ7HbU+SvpCsJqIooT/mtFwOiyIxsWq7bfXgKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvQSS6e6Y5OTaOIJ4ZHUz6qbRSNCNB/mCmOW477L20LpF08JcWZrgCn50yLaiPKfRMllelwHmOENZ5w4VHfGLSV8fDvNIplO4ecjMxDNzQ+ANhjbjNPjq/6yu/Bl09C25xgr96336H1HHNfzdVr1DnRBqMWKMephmzAIv9g29nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zpcJ5utk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52b98fb5c32so1366429e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 04:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717673770; x=1718278570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AALcZ2Ku6h2Uz9lkb57i7tD7jzgv1De3ydwjkcYX8M=;
        b=zpcJ5utk5r36O3d0qv9SMNR/ZqMEruWMG4M81ER4p8YJ9RsibyTU5l97QHSfGFI2Sy
         x+x41qxLphSkE5S6TNCbnXnM1Op5FGS1goRRvzxMgLNkSZCKbwqgGP+3/CcqwzogYe5q
         XkXOdHPkdeTMiw33g5c/2BH409m9AfMDH/hhKwZwQt0yRcT5O16up3+Ll3SfPRrwJfmN
         7iXwzGGzcMSCewf7IsZgrsY3gBF3LL3KxxvNBpKjBHuWH9UkuLtHAwDAIzDKMiqa39jn
         cwITL1v3GO4yfAqgBLrHw3wqCbt94Cx+1uG8cwVcCkSuNEow6IYkaKUeTLKl1qJLoQPz
         AceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717673770; x=1718278570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AALcZ2Ku6h2Uz9lkb57i7tD7jzgv1De3ydwjkcYX8M=;
        b=W5G38csSS8bpSu3ug2BS11EAESTk2YsBX+FGYVa8jZ19088wh3d3jlW+r9M7fZsPxi
         0iAd7L1yqq79Bc60v+ZwaOiFdu17lK2BwMCw5e+ArFiqhHyQcKTfrJCVPvg1ukKD1Qpx
         LXEsfLS8yo36U0fSWGgOXoSpVTSn6YlZTdeK3cOdTXZPWLa0MsdHMhIUMdqioe+g7Qku
         s1NX7vpKaFqwNcfyc49DH9Dd7uDZEpWsBMoxAJ6vQCY9irYG3EtYQRW2kbN+rV6nLIi6
         sVw/bG32XTjofZl+ZTB2fHLGDXnhuc9rXf8i9zzIfPCULjF72zEGDLhfSpOiX+0+wp+V
         21Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWSiqaQYJ0Rnc6J4fTgeMjxKcz6aIARiswrAc4KdrGXIHA6rBq4oseFcadtBLi3j2hKHUZgn02CQp6B4nZyIfhELjGX22oxLyBlYGlAcw==
X-Gm-Message-State: AOJu0Yyr/BJ934re3X1+4eKKuTLJQ5h+1xNduMb48Nz0u8vbgG9qehBs
	FZBYJGCsA/hkQQKPLUBz9jYw6cQfeGCOMTzKs4vASvbXSZ4ERerHp5HzC8M8fOE=
X-Google-Smtp-Source: AGHT+IHFOZvzE9Ih1G2ixT6dzlQjKt2UMESk7swE4DWn9KX7Ls2jy0rbqL7GzQ8QwmhArYJdRHnqUw==
X-Received: by 2002:a05:6512:3b8d:b0:52b:9a53:83d1 with SMTP id 2adb3069b0e04-52bab50b1b6mr4278918e87.56.1717673769744;
        Thu, 06 Jun 2024 04:36:09 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c80581c05sm84014866b.7.2024.06.06.04.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 04:36:09 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 06 Jun 2024 13:36:03 +0200
Subject: [PATCH v4 4/5] arm64: dts: qcom: qcm2290: Add GPU nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-topic-rb1_gpu-v4-4-4bc0c19da4af@linaro.org>
References: <20240606-topic-rb1_gpu-v4-0-4bc0c19da4af@linaro.org>
In-Reply-To: <20240606-topic-rb1_gpu-v4-0-4bc0c19da4af@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717673761; l=5480;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=oEkR0OJ7HbU+SvpCsJqIooT/mtFwOiyIxsWq7bfXgKs=;
 b=Dwt92DIyZ+6++wATwwrQLT9y8Jtb0EcswLGK71pRAvbovJuiXi+ACqvOGzli4GzR0Si9gIexN
 lpGxe+0K2EHAM5OKTBTRF82Vt2wCzcqeEHKeqiC8ilvAMz2d5rz8bFt
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Describe the GPU hardware on the QCM2290.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 154 ++++++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 106110a9f551..99d98afb1b2c 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
 #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
@@ -758,6 +759,11 @@ qusb2_hstx_trim: hstx-trim@25b {
 				reg = <0x25b 0x1>;
 				bits = <1 4>;
 			};
+
+			gpu_speed_bin: gpu-speed-bin@2006 {
+				reg = <0x2006 0x2>;
+				bits = <5 8>;
+			};
 		};
 
 		pmu@1b8e300 {
@@ -1425,6 +1431,154 @@ usb_dwc3_ss: endpoint {
 			};
 		};
 
+		gpu: gpu@5900000 {
+			compatible = "qcom,adreno-07000200", "qcom,adreno";
+			reg = <0x0 0x05900000 0x0 0x40000>;
+			reg-names = "kgsl_3d0_reg_memory";
+
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gcc GCC_BIMC_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "mem_iface",
+				      "alt_mem_iface",
+				      "gmu",
+				      "xo";
+
+			interconnects = <&bimc MASTER_GFX3D RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "gfx-mem";
+
+			iommus = <&adreno_smmu 0 1>,
+				 <&adreno_smmu 2 0>;
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&rpmpd QCM2290_VDDCX>;
+			qcom,gmu = <&gmu_wrapper>;
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			zap-shader {
+				memory-region = <&pil_gpu_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* TODO: Scale RPM_SMD_BIMC_GPU_CLK w/ turbo freqs */
+				opp-1123200000 {
+					opp-hz = /bits/ 64 <1123200000>;
+					required-opps = <&rpmpd_opp_turbo_plus>;
+					opp-peak-kBps = <6881000>;
+					opp-supported-hw = <0x3>;
+					turbo-mode;
+				};
+
+				opp-1017600000 {
+					opp-hz = /bits/ 64 <1017600000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					opp-peak-kBps = <6881000>;
+					opp-supported-hw = <0x3>;
+					turbo-mode;
+				};
+
+				opp-921600000 {
+					opp-hz = /bits/ 64 <921600000>;
+					required-opps = <&rpmpd_opp_nom_plus>;
+					opp-peak-kBps = <6881000>;
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-844800000 {
+					opp-hz = /bits/ 64 <844800000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <6881000>;
+					opp-supported-hw = <0x7>;
+				};
+
+				opp-672000000 {
+					opp-hz = /bits/ 64 <672000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+					opp-peak-kBps = <3879000>;
+					opp-supported-hw = <0xf>;
+				};
+
+				opp-537600000 {
+					opp-hz = /bits/ 64 <537600000>;
+					required-opps = <&rpmpd_opp_svs>;
+					opp-peak-kBps = <2929000>;
+					opp-supported-hw = <0xf>;
+				};
+
+				opp-355200000 {
+					opp-hz = /bits/ 64 <355200000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <1720000>;
+					opp-supported-hw = <0xf>;
+				};
+			};
+		};
+
+		gmu_wrapper: gmu@596a000 {
+			compatible = "qcom,adreno-gmu-wrapper";
+			reg = <0x0 0x0596a000 0x0 0x30000>;
+			reg-names = "gmu";
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+		};
+
+		gpucc: clock-controller@5990000 {
+			compatible = "qcom,qcm2290-gpucc";
+			reg = <0x0 0x05990000 0x0 0x9000>;
+			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			power-domains = <&rpmpd QCM2290_VDDCX>;
+			required-opps = <&rpmpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		adreno_smmu: iommu@59a0000 {
+			compatible = "qcom,qcm2290-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x059a0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "mem",
+				      "hlos",
+				      "iface";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+
+			#global-interrupts = <1>;
+			#iommu-cells = <2>;
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.45.2


