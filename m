Return-Path: <linux-arm-msm+bounces-84665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 684D2CAD1ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4E6C3012EF2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A345D313E13;
	Mon,  8 Dec 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLDGa321"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA603101DB;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765196776; cv=none; b=eidW7pPMmCtpKqqC7jAseGr39U/2Ea34xlbBc1xplBux7YsXDiSpg8Ahl/0cm+zPM4+lE6ZDb36eXbnSfwnDTH7yVNkqurYQBW9r1Uro/Wr8dd8+pafS+HihXFShsYqJ5H0gG+Bhl6IK4MD/7Nwh7bENRrSzL9k00uaTZFHFbxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765196776; c=relaxed/simple;
	bh=nhfyVPKPFjdRUSMI0tLPuUioNXlIyFKkVgmPSw9cTZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n4spU04dWusfQjQgqAMhrYQDj0P6YDBQyl+dopwkmsY89OGyetbmdG2fytndaKD55xrKmgkCqzBzW1MoZ5PcuPxd4HONcVkfMVWCiVNF8emHUvAPo0JyLMbXPmNzVNL6ldxkC7kyODy7F/NxncYJ84EoGuRcEpUET8mGNXY6Ox4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLDGa321; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2D58C19423;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765196775;
	bh=nhfyVPKPFjdRUSMI0tLPuUioNXlIyFKkVgmPSw9cTZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MLDGa321rQuVeXt9IJhTUavcldpJ/MiPbCVr8vuvVGhxkO9X7pFAfQefYYkN9havg
	 P4+V2kp0ZiDflWhh1mQuTM2SKD7MrB/lKimmYC0Gkqk3YvO80bXkdBuN7XkPjexUrk
	 8PPedWasRtaknEZ7lWrom8x44yOr1QPHjda/EFBQoXGm1O1rjECgevA53LUw+f0Fzk
	 vX4OgIdDESvXuXnkGGfS38FR+zqsE+AroP31FoujSG4G2pLd6eVBO76RiM0OyY76lv
	 tqwYbCjr5Yfw9u/CDhOjT4Nb7XxMr6S2/T2j/Ht11K0YFiP8QlE0W1OdSwgHtbd5F/
	 E5+zHAXGauTPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72EDD3B7E8;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 08 Dec 2025 16:25:38 +0400
Subject: [PATCH v6 6/8] arm64: dts: qcom: ipq5332: add nodes to bring up q6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-ipq5018-wifi-v6-6-d0ce2facaa5f@outlook.com>
References: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
In-Reply-To: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765196772; l=3002;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=Gswde2W3JD/OmCvigFFq4uqsbwMQe0X0RLimQqg+l3I=;
 b=LKXC0SIOIxfSP8gcyrTWlOn5H8oj8HDWrAmo3pMRpPc1YMnuwp58jdcWXWenyHySbtybrq3aG
 EqIeAgyfbPGCEXAosXp1wgsyONUtamcJExtVyZ0SaQt3h+2ZpCx5hy5
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 45fc512a3bab221c0d99f819294abf63369987da..6bc60285d9458f04c67222112b82faa56fbdeb11 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -2,7 +2,7 @@
 /*
  * IPQ5332 device tree source
  *
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -146,6 +146,11 @@ smem@4a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@4a900000 {
+			reg = <0x0 0x4a900000 0x0 0x2b00000>;
+			no-map;
+		};
 	};
 
 	soc@0 {
@@ -586,6 +591,39 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5332-wcss-sec-pil";
+			reg = <0x0d100000 0x10000>;
+			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
+			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_IM_SLEEP_CLK>;
+			clock-names = "sleep";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@18000000 {
 			compatible = "qcom,pcie-ipq5332", "qcom,pcie-ipq9574";
 			reg = <0x18000000 0xf1c>,
@@ -871,4 +909,28 @@ timer {
 			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
 };

-- 
2.52.0



