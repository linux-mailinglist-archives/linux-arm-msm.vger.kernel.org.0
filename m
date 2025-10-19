Return-Path: <linux-arm-msm+bounces-77934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E5116BEEA15
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 18:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC8444EA4E5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 16:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E742EBB93;
	Sun, 19 Oct 2025 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Po0t7Ksr";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="zDHljI/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF8B1684B0;
	Sun, 19 Oct 2025 16:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760891274; cv=none; b=S6CxosE5gWEQfaB/ubn3mltoO2hUBMaVxu1f3MbkIDfnZejDm0WFQODvMcd+LchsTE6OOC+Q6PjWZJ+kjwVe/yv8sbONjWnQRjpuj1m4waalAWWpPXpVWeCmsDViRBry7Hn418QcPP5iGBMg5ab2mCZlYgr5t57+3tlShcBFSPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760891274; c=relaxed/simple;
	bh=st+1yNFz+vvDs1LlhfggFEc3ez1k5mgOSA5NgcHNxvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzpcelSNGaNwhdvm0k/YuooeZpd8kA2RhShLbfoD1YW5qd+t9LsKzr5rEohTanjGVYD3MmHU81o3sRRPViDYJX+NTMlGsSXJusCbVvCpCCgv6BsPErpZ2hipVRdNJTJ0PkOMPnSDQyvrrEzrRZsTnnK3jzX68Hy/AtpPvSXtJJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Po0t7Ksr; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=zDHljI/k; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760891235; bh=EpA0cWeWZXJ936qAvX0YhI4
	C6aWz27QwmTCYoawtD7M=; b=Po0t7Ksr3k3J/mtYMy5q/S7NyQBF7zpDAJaD0GViIdhAeAjPlc
	AAeuIfOAd9dpMvmhAARUwkzLVXsaJeAi/ZowzWs5zZEAx/5yORQlLucxbR2/eoeMwfM0m0mkVPY
	7BtRY8mHxOqHUEwxL2dFqLywrMFH8Wmf/gEixr4rAqN9IzX87URRmRCF5kkL7VGooLMwCo149aX
	1mLElroGLcNxbqRn6nivFRxI6T2z9cb6fUroWPyk3LaFAvp2T5eRI7VfcUJTOGefMszgBH0Eb+i
	6nq4FGH8nULLIygpitdZXpa6jm10p7OJ9L4pzwz7kreBb/zBd0WrLY2RZdTYI/4x0PQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760891235; bh=EpA0cWeWZXJ936qAvX0YhI4
	C6aWz27QwmTCYoawtD7M=; b=zDHljI/kReZ1vafhNfKxD0jOEjtEwxBAOQejuJsjEl3YX2w66m
	cFdAZjLc4fgGG3zKv8ntwo8yMi82xWUJEJAw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sun, 19 Oct 2025 19:27:06 +0300
Subject: [PATCH 1/2] arm64: dts: qcom: sdm630/660: Add CDSP-related nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-1-9ab5f2865a6e@mainlining.org>
References: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-0-9ab5f2865a6e@mainlining.org>
In-Reply-To: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-0-9ab5f2865a6e@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760891233; l=6389;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=st+1yNFz+vvDs1LlhfggFEc3ez1k5mgOSA5NgcHNxvE=;
 b=8nhVJOA5CJrVPYtKiCmvHoKrm/1i6qaeS8N9jt7GHT7Jgw86L9E3IKppvnWHjifAmOGAI8qg/
 cxyI25RGS3HB0aDLBCiPbV+wcB+8Y0HyEF3z3PsLqcGlUxP3ooAE/Xv
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

In order to enable CDSP support for SDM660 SoC:
 * add shared memory p2p nodes for CDSP
 * add CDSP-specific smmu node
 * add CDSP peripheral image loader node

Memory region for CDSP in SDM660 occupies the same spot as
TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
In sdm660.dtsi replace buffer_mem inherited from SDM630 with
cdsp_region, which is also larger in size.

SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
related nodes and add buffer_mem back.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi |   2 +-
 arch/arm64/boot/dts/qcom/sdm636.dtsi |  14 ++++
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 152 +++++++++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8b1a45a4e56e..a6a1933229b9 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -563,7 +563,7 @@ modem_smp2p_in: slave-kernel {
 		};
 	};
 
-	soc@0 {
+	soc: soc@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0 0 0xffffffff>;
diff --git a/arch/arm64/boot/dts/qcom/sdm636.dtsi b/arch/arm64/boot/dts/qcom/sdm636.dtsi
index ae15d81fa3f9..41e4e97f7747 100644
--- a/arch/arm64/boot/dts/qcom/sdm636.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm636.dtsi
@@ -16,6 +16,20 @@
  * be addressed when the aforementioned
  * peripherals will be enabled upstream.
  */
+/delete-node/ &cdsp_pil;
+/delete-node/ &cdsp_smmu;
+/delete-node/ &cdsp_region;
+
+/ {
+	/delete-node/ smp2p-cdsp;
+
+	reserved-memory {
+		buffer_mem: tzbuffer@94a00000 {
+			reg = <0x00 0x94a00000 0x00 0x100000>;
+			no-map;
+		};
+	};
+};
 
 &adreno_gpu {
 	compatible = "qcom,adreno-509.0", "qcom,adreno";
diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index ef4a563c0feb..5c3bcf5f2573 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -9,6 +9,37 @@
 
 #include "sdm630.dtsi"
 
+/delete-node/ &buffer_mem;
+
+/ {
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts = <GIC_SPI 514 IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&apcs_glb 30>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		cdsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		cdsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	reserved-memory {
+		cdsp_region: cdsp@94a00000 {
+			reg = <0x00 0x94a00000 0x00 0x600000>;
+			no-map;
+		};
+	};
+};
+
 &adreno_gpu {
 	compatible = "qcom,adreno-512.0", "qcom,adreno";
 	operating-points-v2 = <&gpu_sdm660_opp_table>;
@@ -247,6 +278,127 @@ &mmcc {
 			<0>;
 };
 
+&soc {
+	cdsp_smmu: iommu@5180000 {
+		compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
+		reg = <0x5180000 0x40000>;
+		#iommu-cells = <1>;
+
+		clocks = <&gcc GCC_HLOS1_VOTE_TURING_ADSP_SMMU_CLK>;
+		clock-names = "bus";
+
+		power-domains = <&gcc HLOS1_VOTE_TURING_ADSP_GDSC>;
+
+		#global-interrupts = <2>;
+		interrupts =
+			<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 545 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 547 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 549 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	cdsp_pil: remoteproc@1a300000 {
+		compatible = "qcom,sdm660-cdsp-pas";
+		reg = <0x1a300000 0x00100>;
+		interrupts-extended =
+			<&intc GIC_SPI 518 IRQ_TYPE_EDGE_RISING>,
+			<&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+			<&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+			<&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+			<&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready",
+			"handover", "stop-ack";
+
+		clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+		clock-names = "xo";
+
+		memory-region = <&cdsp_region>;
+		power-domains = <&rpmpd SDM660_VDDCX>;
+		power-domain-names = "cx";
+
+		qcom,smem-states = <&cdsp_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		glink-edge {
+			interrupts = <GIC_SPI 513 IRQ_TYPE_EDGE_RISING>;
+
+			label = "turing";
+			mboxes = <&apcs_glb 29>;
+			qcom,remote-pid = <5>;
+
+			fastrpc {
+				compatible = "qcom,fastrpc";
+				qcom,glink-channels = "fastrpcglink-apps-dsp";
+				label = "cdsp";
+				qcom,non-secure-domain;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compute-cb@5 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <5>;
+					iommus = <&cdsp_smmu 3>;
+				};
+				compute-cb@6 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <6>;
+					iommus = <&cdsp_smmu 4>;
+				};
+				compute-cb@7 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <7>;
+					iommus = <&cdsp_smmu 5>;
+				};
+				compute-cb@8 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <8>;
+					iommus = <&cdsp_smmu 6>;
+				};
+				compute-cb@9 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <9>;
+					iommus = <&cdsp_smmu 7>;
+				};
+				compute-cb@10 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <10>;
+					iommus = <&cdsp_smmu 8>;
+				};
+				compute-cb@11 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <11>;
+					iommus = <&cdsp_smmu 9>;
+				};
+				compute-cb@12 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <12>;
+					iommus = <&cdsp_smmu 10>;
+				};
+				compute-cb@13 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <13>;
+					iommus = <&cdsp_smmu 11>;
+				};
+			};
+		};
+	};
+};
+
 &tlmm {
 	compatible = "qcom,sdm660-pinctrl";
 };

-- 
2.51.1


