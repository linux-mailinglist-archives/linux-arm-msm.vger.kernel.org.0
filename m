Return-Path: <linux-arm-msm+bounces-84663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E35CAD1F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3778730216A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D286313E09;
	Mon,  8 Dec 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIl3oYq7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2820130FF36;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765196776; cv=none; b=M32RBkTOwNmWKwORYBtrpAG1HQ2uypqTFJVV4jZD3nhu92f+K+EeAsNEPInIeFzArmloC2up0DWppscDgIULrozsWdnbbLvvePQboUSzsJZ54ZHKGTz71MbbYe/y7Ak2FY3q2Of88uNq/0BVJN1ecU76O83bQMpWAP0LCo7BWlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765196776; c=relaxed/simple;
	bh=fqcmFpPoc5B/uv5ucuzvYa4YZ5nagGJcM+2jcKrs+mY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MbBgvB6GmRaIzSJ51tLenyRNS4US+nq/0X3aKjAJCIHbhUQfNvl2ZFvsFNHWpwgfIM8BCgG+DG/vNgOgRiP9UPBBT0EdRCVnCu5B1YTv6GKQSJ25aAmD7W4ktLATfOdrBXEq3KAIzDzNouFevMdOvloHTi7Uw/ScBkLetWWDQhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIl3oYq7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7539C2BC87;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765196775;
	bh=fqcmFpPoc5B/uv5ucuzvYa4YZ5nagGJcM+2jcKrs+mY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OIl3oYq7dGUdMbEwE2wZ3Qv+sOJAdAyfLpGgnB0NTKPDCwE4ref/OWF8nF/B5EXaL
	 sOWgiBBnokpmxsyqyt0UoVVGbxwVQ8IkqcQv1AMILcvBmQT4YZ9gRPfc1sty2KI4HX
	 E2ge1VXc5ACIsu1LhD++vQuBli2zNh8igU+SDVXh0GWAHIqtlcCd/YqsVt/5QLaUiz
	 S6/948rAugGjoot4EHLo0H07r2vFgGBV0qKeS3rDT6mHPKjsUBY3mT6a1G+dG9nWXT
	 Tln2WHS1R2fJHYmy/QO5WByovFYr4AsfUa5jJeChTfMZ53f+8toaGbME/DhnqXkvOU
	 cqA+F8xnbbvhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E602D3B7E1;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 08 Dec 2025 16:25:37 +0400
Subject: [PATCH v6 5/8] arm64: dts: qcom: ipq5018: add nodes to bring up q6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-ipq5018-wifi-v6-5-d0ce2facaa5f@outlook.com>
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
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765196772; l=2649;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=sll66Msl0HywqzZYWOxYFHfmLXyUalHJSEerG/T57gM=;
 b=dCwpkISlr1Eo4IbdTmhiHt5wUwR/79QVGl2oDsOp7TXtEi1vs8TWOWg9kU6DhC+DdFhussJWZ
 MXnfxdYjfSMAN2PpzzzenF/FH6o9LG1gF0oiTkXMXPN2wosQ2V2MekP
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index f024b3cba33f6100ac3f4d45598ff2356e026dcf..570899711b62bb286780f54db2461ebbc5291340 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -158,6 +158,11 @@ tz_region: tz@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x200000>;
 			no-map;
 		};
+
+		q6_region: wcss@4b000000 {
+			no-map;
+			reg = <0x0 0x4b000000 0x0 0x1b00000>;
+		};
 	};
 
 	soc: soc@0 {
@@ -717,6 +722,41 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq5018-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_SLEEP_CLK_SRC>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>;
+			clock-names = "sleep",
+				      "interconnect";
+
+			qcom,smem-states = <&wcss_smp2p_out 0>,
+					   <&wcss_smp2p_out 1>;
+			qcom,smem-state-names = "shutdown",
+						"stop";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@80000000 {
 			compatible = "qcom,pcie-ipq5018";
 			reg = <0x80000000 0xf1d>,
@@ -991,4 +1031,28 @@ timer {
 			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
 };

-- 
2.52.0



