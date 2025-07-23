Return-Path: <linux-arm-msm+bounces-66358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FC5B0FBCB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3A8A566234
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 20:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B174D2405E3;
	Wed, 23 Jul 2025 20:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ToqvqtpQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CEA23F42A;
	Wed, 23 Jul 2025 20:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753303151; cv=none; b=nz+ssUo2x/vTVw71jzXgbo+h8Z0yhzQnUN7w+ynr5d/he0EIXJjU4ugEOtbF9cF6nLAOjCSIwJy37Qann6+P45TA723d8zi7MnB0alcBDpeoXUni+1cxLTTFRJMF7tHd5UcgUBHkeM/BbzLTrNii7NLHwMfyamD6EmYzeBf2fGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753303151; c=relaxed/simple;
	bh=Y8XWMhXI7RKjZEVQrAd7cxvtNOVWzzAHhlZ5WemGnXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hT7grVBtbAw3EqCkUJ/YxOwl5N8j3tAXyW24oKluzYyQN6frK8UUhRdPZ3kWHzm0R/YeevAUdunRCDvyjFd3SF9mNgkSTDOs7/bPQIDm8DeCauiuNjqUcA8Is/oEjToioyM3aVOdkalJVTPSXVIsKpuIvgOLNakg61TwCEUbo2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ToqvqtpQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19DEC4CEF5;
	Wed, 23 Jul 2025 20:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753303151;
	bh=Y8XWMhXI7RKjZEVQrAd7cxvtNOVWzzAHhlZ5WemGnXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ToqvqtpQZJn066HB9fvyIVDs3Y/rSDg2DpQS6Z775Il/Xe6NzG1inPNeF/kylZmDd
	 6AssBvZEmLYo1b7/BclDJvGRIh25gwty4ivChB4sEHj8UO7DZ+0IIfe8uiqelQmO+8
	 gQmXDOjnUoJgd9iwlaF6hZ5D5IFogppEVyNO/07u8oZTJUsFz2fAb1r9hMCcAickz1
	 CAYke0syhLTrne1sR+2MdkDM6YAKsubO280nP08AWRyxZUd0wZ21Q4YPKOsqbFSuZX
	 G419zIRFf2j6p3F10LuTT++RrqdI4Kwnh08vq8BQBd6ob50JeX5MM2T8c3e8Ol4Yth
	 /LtVOwDfCitmg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 23 Jul 2025 22:38:50 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-topic-8750_gpucc-v2-3-56c93b84c390@oss.qualcomm.com>
References: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
In-Reply-To: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753303136; l=3538;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=lBuG/qnS0fMh7X+vXyp6ymSX7K0Q0xZ365zPbKGt4/U=;
 b=zmSf86OEOnP6NhkJaivg6j8M7FU9uCzexo6/g3X+Hiq8lncwcqLh8JvTTSr//0efz6HViF0zj
 ozmQEVbdb7CBUH5PPV1RHExwTVkBbpUmvrEb5Ji6SE3Q0mkPFBPh0+Y
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
is simply a separate block housing the GX GDSC) nodes, required to
power up the graphics-related hardware.

Make use of it by enabling the associated IOMMU as well. The GPU itself
needs some more work and will be enabled later.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 4643705021c6ca095a16d8d7cc3adac920b21e82..ca0770a34bed64183185aedde04f1bb96eebfa91 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
+#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -3154,6 +3155,68 @@ tcsrcc: clock-controller@f204008 {
 			#reset-cells = <1>;
 		};
 
+		gxcc: clock-controller@3d64000 {
+			compatible = "qcom,sm8750-gxcc";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&gpucc GPU_CC_CX_GDSC>;
+			#power-domain-cells = <1>;
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,sm8750-gpucc";
+			reg = <0x0 0x03d90000 0x0 0x9800>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,sm8750-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8750-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.50.1


