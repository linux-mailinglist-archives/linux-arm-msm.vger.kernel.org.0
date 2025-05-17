Return-Path: <linux-arm-msm+bounces-58267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 526FFABAB63
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 19:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A091D189F24E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 17:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41A6210F4B;
	Sat, 17 May 2025 17:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZtAva41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A357621019E;
	Sat, 17 May 2025 17:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747502893; cv=none; b=sOUbFLmk0nonLzJyY6TrgwAraOwAQlZAufeIGQVKjgiEDk14qX4+sM8IFOYBRhqeEqn1mQhotqVHzHltHAitC38VjQpUTTOqe5cZCm5GATB9wyeq8uQr+cjaRUikqIueeMv/XueEbty2XX60H6XxUgc537EJIF29bgRwN5Mb6jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747502893; c=relaxed/simple;
	bh=JVEQxDFr1oBoBMSgA9Z2WU+IEPU+6po+f3inf4JbNrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/fHCv9hvxfK5oG4RfE+6uT1mZflpfruosirVyb2Io0+kDofLUnS/JFvnHT0pul8HgFUcrCjMBbNDwYCjY3fhmywSag1YsP9Rt14pN5QEgfJhW2ZWK0+r3ZYoROBdheC3PA4fXw5Lk3LfqXxI8MitXlVaF9fI3YMmb7pLyPMz9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZtAva41; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59176C4CEF0;
	Sat, 17 May 2025 17:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747502893;
	bh=JVEQxDFr1oBoBMSgA9Z2WU+IEPU+6po+f3inf4JbNrI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UZtAva41q4GAXA2HwnrOi5ktzOhaSYYT3YYMQU+supB9vKILFmS7SqQAJBANycOll
	 TfLEFUywJ5VmAHQv0avZ+nHcsKhn2bCSKcrZurVXmTedmhB9bS1xR0zt0IAOSIO3py
	 vnXqBN8ePRT+MZdEzlXjeLVFb8P+95OJpW7jWzSFmdr9yAd11evPuDrwp2Y2tT4BJD
	 CWj8H2Dw4AsBlOz3w45uZUVsT3SIqR6+lH5Tq/93OUB4jVHQZSihWW6GG22AlJangL
	 cH2XDFF4JwSxeTi086FdfSyiPI1szS37acgRQnpANdQKSP+TB4+QNN9X1PqwmJ8Seb
	 dnxP1Y8kXdG2Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:27:52 +0200
Subject: [PATCH v2 3/5] arm64: dts: qcom: sc8280xp: Add SLPI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-8280_slpi-v2-3-1f96f86ac3ae@oss.qualcomm.com>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
In-Reply-To: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747502874; l=3655;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=NTpPYjRM1aEKBIJ6EFzGdjafUGuz3bdEpt2oY9zN99A=;
 b=9wUHo4STnGbHN1nj3RzhYrjAaDl5lpmzfnBkCqlFgtW2ZBEwFiPkLDHw7k2oiTcOG8LWFmEVI
 8abX8B+WjciAG0jTGbwAojeIdjDgpIJfW70CtyBwlt31bh3fPdKD5hd
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 99 ++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 94dcbccca62e992030bcdd6eb3bc3fcd879c1e8a..87555a119d947dca75415675807f7965b2f203ac 100644
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
@@ -2454,6 +2483,76 @@ tcsr: syscon@1fc0000 {
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
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_SLPI
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "slpi";
+				qcom,remote-pid = <3>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "sdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0521 0x0>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0522 0x0>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0523 0x0>;
+					};
+				};
+			};
+		};
+
 		remoteproc_adsp: remoteproc@3000000 {
 			compatible = "qcom,sc8280xp-adsp-pas";
 			reg = <0 0x03000000 0 0x10000>;

-- 
2.49.0


