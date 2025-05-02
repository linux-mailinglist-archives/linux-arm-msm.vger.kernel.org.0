Return-Path: <linux-arm-msm+bounces-56596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA29AA7C44
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41C4F987EBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A4A223DC7;
	Fri,  2 May 2025 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+SbYuIg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA3F2236FC;
	Fri,  2 May 2025 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225510; cv=none; b=XR00BBI38IbHp2l/0lGc3o/dNcOM2YSNJynXtrs6zJb2rJEAhYzcltx+2QOqijAzDn3x45ESSqwAamQe5h0KPNLhwckEvKVwobpNNFDS1aj1/se2rxkXj9rWxSAZFbneO3505zJCTNwiShA5an2T0MwHCgsLWRRxrh/HzfgRVwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225510; c=relaxed/simple;
	bh=46Iz1SAIFT0JpyGlK8VgIBKquW7d8t2mwHaZU9vek3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqqI4epFpEE2E7EQ+FtPEmZEfWr8k4u5QLNaeByNnE/RZbf0H4IhHWBZ0yvdDgqLhNNUiQxsu7KoyjcSOoGnRtmFpXPebvRdceFml6Ng1X/LK9+Wa5rbjrkRIXLxHnoD8tOE4zkrbG6JqpSxRf2SNyCR6Bjjz+VcB82PPozp6Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+SbYuIg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68DE1C4CEED;
	Fri,  2 May 2025 22:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746225510;
	bh=46Iz1SAIFT0JpyGlK8VgIBKquW7d8t2mwHaZU9vek3M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s+SbYuIg86j8WxZx9B8uZWiv1ovYu/ZUo++UARWAWGcGiZe5k6dESAyrpEh6T7yl5
	 nrXkcT7DMvXvjgbuV5z2+crryZ2Ndd4NiSzc+qAeh1cbGbOFXbFCVOWRVBFHTsu5ht
	 A6NUIhg+aKv33mprT3WIA68lyS/jLikbe9LRatk4oNxjQPBrcN/eieoEORww+wHR8x
	 i5W0oWp/Fdy25hCjOaRRUCFeOUKl5JpgzXLUFYND9G1EUy7u+J5TnjZ7Sgh5A1aFbG
	 /xas+1v6pHTDCYmsbh9/UN/FwnWnCozCET9GsbrqP2oZtR7ZY/G+2tI1JkBwDuz9Ki
	 mpEEs3mxMo4KQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 03 May 2025 00:38:01 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add SLPI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
In-Reply-To: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746225495; l=2986;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=510uETyHRVIvkSyJRnlRP+3kTmwGHCpIWWOr8PY43F0=;
 b=3V6VspehR9/5TiD9I7Z7WCRKgu5LCl3dCVvAgn4+YZxcLwB1CksAYxPzDxdSTdw12ksg7JL3g
 gmXcYGtLWdsC7+2qprGjh1lKjuVef0RHMIfabHNYgDxsAX9n2o2D5W0
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 72 ++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 3f9195da90ee898c68296f19dc55bcb3ac73fe29..75ec34bfa729946687c4c35aa9550685cac95a10 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -695,6 +695,11 @@ pil_adsp_mem: adsp-region@86c00000 {
 			no-map;
 		};
 
+		pil_slpi_mem: slpi-region@88c00000 {
+			reg = <0 0x88c00000 0 0x1500000>;
+			no-map;
+		};
+
 		pil_nsp0_mem: cdsp0-region@8a100000 {
 			reg = <0 0x8a100000 0 0x1e00000>;
 			no-map;
@@ -783,6 +788,30 @@ smp2p_nsp1_in: slave-kernel {
 		};
 	};
 
+	smp2p-slpi {
+		compatible = "qcom,smp2p";
+		qcom,smem = <481>, <430>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_SLPI
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <3>;
+
+		smp2p_slpi_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_slpi_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -2454,6 +2483,49 @@ tcsr: syscon@1fc0000 {
 			reg = <0x0 0x01fc0000 0x0 0x30000>;
 		};
 
+		remoteproc_slpi: remoteproc@2400000 {
+			compatible = "qcom,sc8280xp-slpi-pas", "qcom,sm8350-slpi-pas";
+			reg = <0 0x02400000 0 0x10000>;
+
+			interrupts-extended = <&pdc 9 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SC8280XP_LCX>,
+					<&rpmhpd SC8280XP_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			memory-region = <&pil_slpi_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_slpi_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
+							IPCC_MPROC_SIGNAL_GLINK_QMP
+							IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_SLPI
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "slpi";
+				qcom,remote-pid = <3>;
+			};
+		};
+
 		remoteproc_adsp: remoteproc@3000000 {
 			compatible = "qcom,sc8280xp-adsp-pas";
 			reg = <0 0x03000000 0 0x10000>;

-- 
2.49.0


