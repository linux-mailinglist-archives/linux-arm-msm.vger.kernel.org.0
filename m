Return-Path: <linux-arm-msm+bounces-15293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC3688CFB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 22:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C424A327F53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 21:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F5713DDAC;
	Tue, 26 Mar 2024 21:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aV5pTKjS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325F713D510
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 21:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711487324; cv=none; b=GDrFVh6Gknj8/s2mKw9i1WxOY2iFs3XI2TIAHkHDvFHqRVGsqkm+rFyqC0woYqIdaUV1UxQCxTKtoidlef23HBWm1tTVsV1Xpj4+xFsL99/ex4h10nsJQnBtKdUYJbfKSxGelU2BnGtAfbmV5OrrhWsRmkh/xrrkyI1Wp20XlOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711487324; c=relaxed/simple;
	bh=eJZZmFBoxhxVlet/0pBFlU3St7YEEvnSSAuyn+HM1GM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j/8ml3sjwulCfC+KkWuuYri+sPsi/dcA6BOPoM6R1DF6kffQMQPil62Qo01DoZBBchc7b3nHn17/COKIdq7XVSjjzER8ci75XG75Um0Gq5G+d26QJA1Q5JbFkm3klnEtNioapHGs+YxHvecXzBXWr0zsX7A/MJll5wTl3E4curI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aV5pTKjS; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a46d0a8399aso36287766b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 14:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711487320; x=1712092120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iz1lawlQGhNU4mln98FQrEkeNw+AVALbW0k/A8mWnj8=;
        b=aV5pTKjSBSHgYvEGlYOCOUuYmjp172im5ax2e+zTGkYErD53wlqaoi58rhwMLBbqsp
         g6b5Jsbd3JFg8L9s8rTW850qkDMVFsDHtQ9ZDj4brGEQiEuZVv1xF07WnPML03RbAtDG
         CodMbYnON4bgumsRexwnaaQQJzWPj7M0EjAQxNV2ss2FzBsVHlF4LvJIaMkuj/k4IZZC
         FaSKLOOVPk8NKdKtfNyONxR93a7PJVJw7asuQu8hZTi8dx642Ip3xVTgBKt4uCHMzGQk
         77T3b4xQ0DI8KIjMoIXUYGn91jAX0VFoKYEr+Q9+eVjloR3pKkkVDBsqyYLiZzjOKDvz
         5vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711487320; x=1712092120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iz1lawlQGhNU4mln98FQrEkeNw+AVALbW0k/A8mWnj8=;
        b=wsa+dHvcTTCy6nriyVbN52P4yUYDhHcgN5Ouot8QyYcvq/d4odOhyloL9jFLUhF/o5
         MqUMGT7Fec7LMNkIaQKB4pf6egSzgAXl7QwayCTM8UjTzk6tdgb9vvrqsNIkzFyt/yDZ
         m8lvTaVqkNec5WXg9n0yEgI2RuAtzkezFZQOla4d7329qkTbxpMrVEvG6H/MJgwW9pZI
         kc+zOXiAhuHj4C3d87QIHhh5o2jMXLdDE8+pT02eSfGtVU7Bnr3t5DYdIxvnKf3H3cZa
         GLu9ttDjNnn4IbA4hd42I05/X3oEG39VsURCV3UB3/5hx7tztDcfV0wjGDQAEGhh5uCH
         fVcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSKlsErqfDXGWV0K0ewEgRsud98trmyohTSIcMIEmyu0HNq+Of8pTxFMy8Sa9dFCkCZJFG5gZIB7SajhL94UxnrY64e7rXvS/FUljfJQ==
X-Gm-Message-State: AOJu0YxN5FGP6HKCojatjEqvgNAz6p8RZeb3fejC8ZQ1bs2V86XSRaC/
	C03HOgr6xlcvhMpHxzoQIQMPCEvAI0cBEgl0J2fveDwf3BhlE7Oe9u2dn4faLHk=
X-Google-Smtp-Source: AGHT+IF9gIMlB6BgJdNrNsE9cP9shpQy1D8/sskwlRLNLTu9jMqWbISItN36UsrcdjpcA/QOZtyMHQ==
X-Received: by 2002:a17:906:1859:b0:a46:ed72:6bba with SMTP id w25-20020a170906185900b00a46ed726bbamr2342407eje.18.1711487320261;
        Tue, 26 Mar 2024 14:08:40 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id l19-20020a17090612d300b00a46cffe6d06sm4621697ejb.42.2024.03.26.14.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 14:08:39 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 26 Mar 2024 22:08:26 +0100
Subject: [PATCH v3 4/5] arm64: dts: qcom: qcm2290: Add GPU nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v3-4-86f67786539a@linaro.org>
References: <20240219-topic-rb1_gpu-v3-0-86f67786539a@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v3-0-86f67786539a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711487311; l=5480;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=eJZZmFBoxhxVlet/0pBFlU3St7YEEvnSSAuyn+HM1GM=;
 b=dQUTA7QiV7nxAQQnjtyj5olcw+VCU5PDrriCa9n8AxJM67AO6856TWlvCwEozQux2Bnkb8XhF
 iaLxb2869PLASv3o7C/Cc0yt5XkagmceTSJ1KdfoC4EMJoMsw1hHzK6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Describe the GPU hardware on the QCM2290.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 154 ++++++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 8221336a8212..913478be6e9d 100644
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
2.44.0


