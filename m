Return-Path: <linux-arm-msm+bounces-48717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC389A3DF21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21575189F0B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72A41FF1AD;
	Thu, 20 Feb 2025 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYarBClA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7481FDE26
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 15:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066266; cv=none; b=sI6BLkwyNLdQkZSIFZwYHVeM8LfrbLmRAadR9t+iactsFnJXHuJr19Fsu83c4L2hIiD9kduJAgcx1cVJUedgxVr2AiuXKumYHRY2QkjqPa5ArHpN07PCzrWG0ACcQ3KKcC6a3a7KMp4SMjqye7LteCA8aat4pzd7R3ArMQvK2WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066266; c=relaxed/simple;
	bh=KpHuLPF934rP2t1H3wJSjuXw8ygXmk03Uz/8hyPhB/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQaXCNeW+6SYstBIvQ6/rXFtlQjYaQW8IcSDVefSFtMZY8nLDYrBWXYIP4tBNYAcPVGaEqTPbFRbtfIehHGnVNc9Hxibuj0CI5qIj1P274rGPalowQFgdEogu12HB0dtW/7VVpF3qlE0IXdkPovwDntn31HCi+iNHlmKdWr8L7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fYarBClA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dc191ca8baso198534a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740066263; x=1740671063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ci3Ph8zqjVgZAd6sVC6+WfoCrO0U6KJHgS9AYF+8LbU=;
        b=fYarBClA+H3FMeHv8yCXHeC4sDyfzSdthSCIHvzLCZZBIfmMu6q3v5+3uuJp14WBgS
         9m5BL0b4Il6TLNHyAUiW/mzG9u/KgHwPCtwNpHPrcoyN12NVcZ6iav4siQSvaIRJok/Y
         vyBuNyy6Q1D41aKAyepoE/kR+yschGOV1C50A6K1TRQkA/MR+PI3uSm+MrYx8Px7d6KQ
         SHeE6GOtEjC23XOlT8dJrSBTAJbSR0HUWG2bTbKYAcuW/peTo3ueLTUyuNpqVnHxqriG
         282w6s07cPI7fGIn/LSe4vJto6qhV66TB3anritz3bJmDE4lfryK2p+y0fOe1pv/se8a
         p0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066263; x=1740671063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ci3Ph8zqjVgZAd6sVC6+WfoCrO0U6KJHgS9AYF+8LbU=;
        b=YhsDk/I3JG7zFKY4G7YPxfM+LRrWqQJTP+tF3o2p4407n3c+QEox00Kmthb7pjKj2c
         Ru1HEusDZAwqlVE8bUJnxMh8IGzczpWwSZ02ZCTqM5saq7lgLyKCEcF/IuT9eq0udODc
         MUfd508gaco0ktga9Lw1gIvqpMmpo65yWhtRRXtax8CMvgSGTNLqvDXSa7ToFCdu04Uh
         2919TPV0YesOAlDFU8plFUBeiMyRJVo4OOIxLYGXF+0aTiecAxTAUOzu2JLKya4hkVBW
         sqM+g0I007Njt1YlpNgj/g1qTo9hwlpK4NvbIjpRfvKMoqyDw5P7y51tz4q5MEyy3Vcj
         fdiw==
X-Gm-Message-State: AOJu0YxQCa+7Cr5pmKhYYV8fBIODlFXipQ3YV7zUIJ+tu4ZWkVxFHxJA
	0zv1Z6LNbynxSdcBfz1aHTWfpUbVIYk/yASKtwrIyANnlBB38s8ewBrUHRQOgH0=
X-Gm-Gg: ASbGncv0NbZKlqM4iRMlk3EQAK9clKU67suuFoilbaqLMRHt8sUPuiCCm18l4qlInbz
	dsMjUUMmEEValRzChW7ep0jrnUYmxrkWbdXpMjNsznrr5fCVqnMzsMJDiJlpxKW/Efn6y8B7O2L
	VqewY7uuIhIdac8mleYb4tkmic50g9guoD3cpbrZ7X2dU/fP2gExbx95QS3huTNN3f3mmYMXQxK
	bbBFu+bzVrKpSjws7LPtEcbpGxgPycDlldGQN2/CTB6I5DLiiFU3zGrS0bacI76r++aOtlnZO0Q
	77dqhQg0i64V68053aqY6yeYeBiDfpOOlkctmNeeE6Mdg87FwmqXU20W4X3Eyl4x6g==
X-Google-Smtp-Source: AGHT+IG8JsSDqYIcSTgMk8jsE87ZIUuX229pWGn2oCjJBOzUBey148zQ9hMMJB6uA2FPgDa2k2EzzQ==
X-Received: by 2002:a05:6402:348d:b0:5e0:8275:e9dc with SMTP id 4fb4d7f45d1cf-5e08275ee92mr3309633a12.1.1740066262643;
        Thu, 20 Feb 2025 07:44:22 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece2881b3sm12418151a12.77.2025.02.20.07.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:44:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Feb 2025 16:44:11 +0100
Subject: [PATCH v2 1/4] arm64: dts: qcom: sm8750: Add CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-b4-sm8750-cdsp-v2-1-a70dd2d04419@linaro.org>
References: <20250220-b4-sm8750-cdsp-v2-0-a70dd2d04419@linaro.org>
In-Reply-To: <20250220-b4-sm8750-cdsp-v2-0-a70dd2d04419@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6280;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KpHuLPF934rP2t1H3wJSjuXw8ygXmk03Uz/8hyPhB/E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnt03QrCeuHxMMcHXFOwA1KzKCtxFt0fI/9d4c2
 9qUKH2LqpqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7dN0AAKCRDBN2bmhouD
 1ztKD/4/NOfj2pd6klWasGhfZNGNGwiUDgewKmK4hwIg69BDBez3TwjikQ5YyjpqmITklBiD24o
 Nvx3uGdtTPmoq4AEkbTF5of890WyTsLSYYY6xWtsissHNMNfHn8gs8ZjJgw6rWQPZeTcJ9+K+Tu
 XjnyaW8TZoMk6uWquGJeLRZ0I11jTBDkBb0TL7SXr/GxUnVzn+Esk984EDLqPkVCHkJ49Rm8yE0
 CbWF0/zpDpvZsBv0YKBiiIh945EZKJsyVf1QcLAvC0AKY+O6UyG17jRstWRTiakm7s9eb82dxEW
 8SmAzCuw1f3d/IutNBv7sD5FrDFJoHnG27t884ibAY83WY0rQPcPrbkipACF/JqCwtab034U6v+
 pKKRP5MgWYUXpRQ5BoNqewquoAHbWZ+80uVvnvqyo6fgsqns6nnMzcge1Z+neDsKqnxc6ffuhRW
 4WyoPC5V+YTzBz0hZ+g2NJIPuPeDGr3PF9cNgFDgK1zKJ/lto6Dc3afoz4AVoBeMN/MnQ3YzFe4
 FAQ4x7cBPKqviDbzhUgHn0w7ZkzGbWKeKA50/4nDojvWZTMjlzpcQ5jhfNoNWCJxEcqZYwhQ2MJ
 i8GaNd6hyeiA/FA4bTvOxXe1O02UDumR6BrWAub6pFAtyyK31xNq3JLDRVyKOj0h1C7YgKJDAxO
 JLbAcWiVw8SjywA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add nodes for the CDSP and its SMP2P.  These are compatible with earlier
SM8650 with difference in one more interrupt.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 194 +++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 55668ee979a465aa0149ff9317d2cbc733e9c27b..033e8153aa73cea00d1d4394c572bf8e19231305 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -545,6 +545,32 @@ smp2p_adsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <94>, <432>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -3236,6 +3262,174 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,sm8750-cdsp-pas", "qcom,sm8650-cdsp-pas";
+			reg = <0x0 0x32300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mxc",
+					     "nsp";
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
+			qcom,qmp = <&aoss_qmp>;
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <5>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x19c1 0x0>,
+							 <&apps_smmu 0x0c21 0x0>,
+							 <&apps_smmu 0x0c01 0x40>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x1962 0x0>,
+							 <&apps_smmu 0x0c02 0x20>,
+							 <&apps_smmu 0x0c42 0x0>,
+							 <&apps_smmu 0x19c2 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1963 0x0>,
+							 <&apps_smmu 0x0c23 0x0>,
+							 <&apps_smmu 0x0c03 0x40>,
+							 <&apps_smmu 0x19c3 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1964 0x0>,
+							 <&apps_smmu 0x0c24 0x0>,
+							 <&apps_smmu 0x0c04 0x40>,
+							 <&apps_smmu 0x19c4 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1965 0x0>,
+							 <&apps_smmu 0x0c25 0x0>,
+							 <&apps_smmu 0x0c05 0x40>,
+							 <&apps_smmu 0x19c5 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1966 0x0>,
+							 <&apps_smmu 0x0c06 0x20>,
+							 <&apps_smmu 0x0c46 0x0>,
+							 <&apps_smmu 0x19c6 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x1967 0x0>,
+							 <&apps_smmu 0x0c27 0x0>,
+							 <&apps_smmu 0x0c07 0x40>,
+							 <&apps_smmu 0x19c7 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x1968 0x0>,
+							 <&apps_smmu 0x0c08 0x20>,
+							 <&apps_smmu 0x0c48 0x0>,
+							 <&apps_smmu 0x19c8 0x0>;
+						dma-coherent;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x196c 0x0>,
+							 <&apps_smmu 0x0c2c 0x20>,
+							 <&apps_smmu 0x0c0c 0x40>,
+							 <&apps_smmu 0x19cc 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x196d 0x0>,
+							 <&apps_smmu 0x0c0d 0x20>,
+							 <&apps_smmu 0x0c2e 0x0>,
+							 <&apps_smmu 0x0c4d 0x0>,
+							 <&apps_smmu 0x19cd 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x196e 0x0>,
+							 <&apps_smmu 0x0c0e 0x20>,
+							 <&apps_smmu 0x19ce 0x0>;
+						dma-coherent;
+					};
+				};
+			};
+		};
 	};
 
 	timer {

-- 
2.43.0


