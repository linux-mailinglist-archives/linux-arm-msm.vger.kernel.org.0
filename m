Return-Path: <linux-arm-msm+bounces-85191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63552CBCA37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 07:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A324A300A6F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 06:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8B632571C;
	Mon, 15 Dec 2025 06:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsXRE9XD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CB730BF78;
	Mon, 15 Dec 2025 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765780529; cv=none; b=bujoSqwNWjgj+ACmVREsL8zdYA6eiPc7upSCwrs6doAGyYf7Vpa8OnYJ8W7YDADEknBDpxCi4kaqNPqk8XVHHNg2uIGre/TN5D4Px2XsD9jKvRtN4VQ3sALYMw0lSx3qzWJw7rO7RHVjsszB1wTtNKqJcGQ6my1iMay4jj/Ue8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765780529; c=relaxed/simple;
	bh=ZB+ibr6dilxZnutwmYn2gcBErrUE9nWV6PvJR01uJRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aTpRd/oRJANadrk4I5iYrzvGCGEkP50al+9hnCxXA4GsqS81Z1DT4yCOG0az1tYO0n2fuCX+S+jhedXP+TtTwHy3mSqph/eISPhEGfHN4oqTlNccHRAapsbl2XTMv5If14jX3D9AgWpeKmmp1hRb1q43qK9gzdt2OEW4ddkpC/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsXRE9XD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4A72C4AF19;
	Mon, 15 Dec 2025 06:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765780528;
	bh=ZB+ibr6dilxZnutwmYn2gcBErrUE9nWV6PvJR01uJRU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OsXRE9XDaX4RhSgtmTGEP4tALitWEUwHtVgejOXo++/ly6biy8TfmrzP+LdPdDdx9
	 2oj66rYxpJMCt3H+9GPiep7h7ir1piEKYVOcaIHYsNVHQtDAJpwku9StaLzh0h0BmM
	 zgFM/fu9pTE2axdbVvJv3yJJiraJCSVU5gMAdcfRZ6mwoJ2WKl563w4DGYySJdNJTc
	 PFcMyQJF6IymGwwYwC2gEFZNZAwSi+jFvg+EtMFwwte3ctNUXVuA7JMWz+c1UGNZDV
	 Nge/+rqtXliiNU7Qk+/Z3apWDMf/gJwsy25qY32FE1I0i/He/SmM1A4xMg6lgl0kUX
	 zFVIwguPdOR8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA082D59D99;
	Mon, 15 Dec 2025 06:35:28 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 15 Dec 2025 10:35:12 +0400
Subject: [PATCH v7 7/8] arm64: dts: qcom: ipq5424: add nodes to bring up q6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-ipq5018-wifi-v7-7-ec4adba941b5@outlook.com>
References: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
In-Reply-To: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765780526; l=2766;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=+Zkxc9uM0DSPpECVa8dmf4bSp6l72OxtVRlDoafOAek=;
 b=UkasRBP1Cb17TLka2FEA3pzS24OsJ8PcpNRMcPxX/kyS1T7mSKScWfT5VIgKIfykB60TVlgIz
 ny9mA4ak3wICHfjcSx+RVGn0AH0oBLGVWi2DLV14JsSuh7GmnrzyEKb
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 68 +++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index eb393f3fd728f0b2fc8cd93c849f8c170d76e312..08fcda401556eb2a16d317966cd39c006e109b25 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -222,6 +222,35 @@ tfa@8a832000 {
 			no-map;
 			status = "disabled";
 		};
+
+		q6_region: wcss@8a900000 {
+			reg = <0x0 0x8a900000 0x0 0x2800000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 501 IRQ_TYPE_EDGE_RISING>;
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
 	};
 
 	soc@0 {
@@ -752,6 +781,37 @@ dwc_0: usb@8a00000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5424-wcss-sec-pil";
+			reg = <0 0x0d100000 0 0x4040>;
+			firmware-name = "ath12k/IPQ5424/hw1.0/q6_fw0.mbn";
+			interrupts-extended = <&intc GIC_SPI 508 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 0>,
+					      <&smp2p_wcss_in 1 0>,
+					      <&smp2p_wcss_in 2 0>,
+					      <&smp2p_wcss_in 3 0>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			mboxes = <&tmel_qmp 0>;
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 500 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		timer@f420000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0 0xf420000 0 0x1000>;
@@ -811,6 +871,14 @@ frame@f42d000 {
 			};
 		};
 
+		apcs_glb: mailbox@f400000 {
+			compatible = "qcom,ipq5424-apcs-apps-global",
+				     "qcom,ipq6018-apcs-apps-global";
+			reg = <0 0x0f400000 0 0x10000>;
+			#clock-cells = <1>;
+			#mbox-cells = <1>;
+		};
+
 		apss_clk: clock-controller@fa80000 {
 			compatible = "qcom,ipq5424-apss-clk";
 			reg = <0x0 0x0fa80000 0x0 0x20000>;

-- 
2.52.0



