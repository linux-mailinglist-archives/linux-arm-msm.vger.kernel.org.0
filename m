Return-Path: <linux-arm-msm+bounces-64035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07605AFCACF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 636D87B518C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D322DD61E;
	Tue,  8 Jul 2025 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="semBo5/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340832DD5F3;
	Tue,  8 Jul 2025 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978860; cv=none; b=Jp9UwJm3vMunGrGnzwzEhKl4QE4TV3rvCtSpNygvXoCrJcJiwJE9w/vaAb7GlaH+ARK62vKI10Yilnf9upf6Ihn69Atv1XTYyM5g+i0iuZFqHP3rO1KVkZgESqAzzaN4h95eDoM6ugbxMzbGhphHTvjmAEvS/lKWvkNfCM91UWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978860; c=relaxed/simple;
	bh=nVcGMtqovNhYLTO5f7VRPEzyfGwo4DPtY/nMhcKEtMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yx49RasJt5eASClHKVx+MvYYwUUtqx/pPysVXKe8TIFTNU9jbJ825Er3tM1zrvF+PVMRQ9FU8MaWfjFw+1SMS345AX0BcDBtD1WpNZVSWlqEvkC/n8KhV5P2nfg9a5cJJ36p0QcKUn9xqykZzyPbYPoV1/l2pvSKWfrR5eozJXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=semBo5/H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A242C4CEED;
	Tue,  8 Jul 2025 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751978859;
	bh=nVcGMtqovNhYLTO5f7VRPEzyfGwo4DPtY/nMhcKEtMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=semBo5/HZQ3/yrkkXABfj8viKzKZDYYs4/ZA76H6cChJjHFqHQTp/oIdyCXUkkg+h
	 B7am+Njnnl5+y+yOSAetXE6eFt+gZqwhYcsdadO2YSzlVv2mhT575cl/4RdtnqEGoV
	 2bP5KmArXca7CCsOfJrWcV0TuPDOCDQ1xHi2+WqysPLwVE5j3KRrXkZg+CEYAogfjF
	 1EqB5H9B3bgKbPx3e/TGj/orxodMDJlril6lJfMD6LcwlYHvkakJaRBh+NdjYwRVak
	 V4OZgJEJsEPrveahrCPvhRckc+3UHP7ib5WsF2UMre8rZ7/jO7XOF1W6BzAmzSI6OV
	 AyRQ60aYqmQ2Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 08 Jul 2025 14:47:22 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-topic-8750_gpucc-v1-3-86c86a504d47@oss.qualcomm.com>
References: <20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com>
In-Reply-To: <20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751978844; l=3538;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=7WkfONM1t9IOjJmIQnSYmNaGuqdmIeuahhgix3BR1tk=;
 b=Lbh77eD9/3OfcUSBIlsUsj8sjPlqjng4E/ZDYqC6/ERJib2Dqjgs/wCNIbDc26wkLNV+QjxCo
 glrzhhAnd8wCTNkI0vVa0OSvSx574/1tuiiI4WLV7kyepodxQbQo3Sb
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
2.50.0


