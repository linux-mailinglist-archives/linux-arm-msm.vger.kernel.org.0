Return-Path: <linux-arm-msm+bounces-78640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AFEC0339F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 21:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5B683B2A8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 19:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A7C34DB7F;
	Thu, 23 Oct 2025 19:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="E/gVGIkY";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QdPmdLB2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA71134DB4C;
	Thu, 23 Oct 2025 19:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761249142; cv=none; b=ZTPXpBwvG4MRm0pwSUlZ4r96FiWopNedrgpCSPykSyJUP/z6KuuwdRsvHwZXYs5VC00gLBgVsUy5GZ7efEMRvx/hVuvCfEsTjSJkSc1qHnfjYPBZIkaqgENX5QvquIQNrzP2ur8b/0quUF+D6mdUNN0ypeJKws1Qj+S/9i9wXjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761249142; c=relaxed/simple;
	bh=dhHPKuURJIj5McbOTlyiJy2zuDlhCglU6Sx7LbpuVlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=azkCsA+IOS32nBssZ+78RF4ZIOgmHASprq8FtD6hSWNrmJeGFGPYnuczn+ES9Sg0Ht627s2Ch+s56yjCg8McoWOEnXzMle29IDNjjHeYzlJyWhtBnzmXVtxnKLrw9D3oLhXS4imp4V2v06lOtV5KKabka/JSEq2xp0fClwOvatQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=E/gVGIkY; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QdPmdLB2; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1761249129; bh=QO2cmeuIvRMrYEgMB0HuwUI
	swd79lUuQZPmj9I39kXA=; b=E/gVGIkYT1WwhFbCSPpHnaX4dmtMP14Z0cB+JhrM+1meFTPcFl
	MT3VaM1n25+xjvDOMkp/mjWnwcXooymYCnF0bPjOYI2g/NcnpPzML8WWS94FFCWhX/ezug5A93H
	WRa2MRu6cBoBGYO+MNELlVQ1udlUjvXPSGfDwxSWY3qGtdjdVr0VP57Y46pXMU81TqhqJqcVDl2
	vIn9aXFQMbWConD8FEfUYOBYJ9rB4U0H4TrPRGB6Rxd6K4jXKdd+sklnnW3iTNWpIv3MGWhj+et
	fGXfv7T/OVhlWWiiHXXpuNtozJtp54hQPI6CQEuLQMlzJMcN1B/UtwujaThv8dnQUQg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1761249129; bh=QO2cmeuIvRMrYEgMB0HuwUI
	swd79lUuQZPmj9I39kXA=; b=QdPmdLB2N4KdFrIaqy/P9ppKQqmOZwamWPTmb3yNTjDNH//zKF
	3nlbhcuYJT9Nzm77t1d5CcsnzJQketXJIGBQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Thu, 23 Oct 2025 22:51:59 +0300
Subject: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
In-Reply-To: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761249128; l=6792;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=dhHPKuURJIj5McbOTlyiJy2zuDlhCglU6Sx7LbpuVlM=;
 b=Rp3M3KEpYnaysxtg4ww7tI6eNsEfU8B0CX0tlPKu5f+/MJOoPszovUWJWp7tWkFM+65Kr8iLH
 ffQZlNnpZ5KBtyad5FqxsWFjWpAWlCU3IshpfVjqda7zV8kwhN8tgfC
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
 arch/arm64/boot/dts/qcom/sdm636.dtsi |  23 +++--
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 162 +++++++++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+), 10 deletions(-)

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
index ae15d81fa3f9..38e6e3bfc3ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm636.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm636.dtsi
@@ -7,15 +7,20 @@
 
 #include "sdm660.dtsi"
 
-/*
- * According to the downstream DTS,
- * 636 is basically a 660 except for
- * different CPU frequencies, Adreno
- * 509 instead of 512 and lack of
- * turing IP. These differences will
- * be addressed when the aforementioned
- * peripherals will be enabled upstream.
- */
+/delete-node/ &remoteproc_cdsp;
+/delete-node/ &cdsp_smmu;
+/delete-node/ &cdsp_region;
+
+/ {
+	/delete-node/ smp2p-cdsp;
+
+	reserved-memory {
+		buffer_mem: tzbuffer@94a00000 {
+			reg = <0x0 0x94a00000 0x00 0x100000>;
+			no-map;
+		};
+	};
+};
 
 &adreno_gpu {
 	compatible = "qcom,adreno-509.0", "qcom,adreno";
diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index ef4a563c0feb..d50cce25ccbe 100644
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
+			reg = <0x0 0x94a00000 0x00 0x600000>;
+			no-map;
+		};
+	};
+};
+
 &adreno_gpu {
 	compatible = "qcom,adreno-512.0", "qcom,adreno";
 	operating-points-v2 = <&gpu_sdm660_opp_table>;
@@ -247,6 +278,137 @@ &mmcc {
 			<0>;
 };
 
+&soc {
+	cdsp_smmu: iommu@5180000 {
+		compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
+		reg = <0x5180000 0x40000>;
+		#iommu-cells = <1>;
+
+		#global-interrupts = <2>;
+		interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 545 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 547 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 549 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&gcc GCC_HLOS1_VOTE_TURING_ADSP_SMMU_CLK>;
+		clock-names = "bus";
+
+		power-domains = <&gcc HLOS1_VOTE_TURING_ADSP_GDSC>;
+
+	};
+
+	remoteproc_cdsp: remoteproc@1a300000 {
+		compatible = "qcom,sdm660-cdsp-pas";
+		reg = <0x1a300000 0x00100>;
+		interrupts-extended = <&intc GIC_SPI 518 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog",
+				  "fatal",
+				  "ready",
+				  "handover",
+				  "stop-ack";
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
+
+				compute-cb@6 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <6>;
+					iommus = <&cdsp_smmu 4>;
+				};
+
+				compute-cb@7 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <7>;
+					iommus = <&cdsp_smmu 5>;
+				};
+
+				compute-cb@8 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <8>;
+					iommus = <&cdsp_smmu 6>;
+				};
+
+				compute-cb@9 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <9>;
+					iommus = <&cdsp_smmu 7>;
+				};
+
+				compute-cb@10 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <10>;
+					iommus = <&cdsp_smmu 8>;
+				};
+
+				compute-cb@11 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <11>;
+					iommus = <&cdsp_smmu 9>;
+				};
+
+				compute-cb@12 {
+					compatible = "qcom,fastrpc-compute-cb";
+					reg = <12>;
+					iommus = <&cdsp_smmu 10>;
+				};
+
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


