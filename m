Return-Path: <linux-arm-msm+bounces-41016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FDF9E9188
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A4361887A1F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53307221DB8;
	Mon,  9 Dec 2024 11:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gte904k3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A926C221D88
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742178; cv=none; b=OAqhJIwTUc4nRV6OmtOfKngEVR3mq5muxNOj1H/HgiCv2WeWioJYEhtmHqb2GygmnzU2ZkE/VBPBy/U6Ku8sOwRdFPAF16x9RU7YPpTF/x+gVJdh9hXuNSpciZH+UqKFikvu1dVxvWHUlBndEUL3oRmGYneqjkalvnK4SB6uBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742178; c=relaxed/simple;
	bh=GlS5WDoRtGHpA8QTt3x6IvZf6O0GiSsbv4oxLcXsdhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qgH+FETHRGlvYRGDnBqSXkvXM0AD7ijTOuOgwnfQQFq1C1qRB4x0JCCNGVMFaHeFic44iZcfrs4dUhL5oc2lw5Az2VQv9nwJyUgJkO+StEoth1l6pOpMoZ+ySDqPisf2A4DEvtp2EDWahYY5wcm20dmu7SFdesfn7l+4ABcShaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gte904k3; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3cfa1da14so205516a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 03:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733742173; x=1734346973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdsBiUzpJ/4d1OMZs144Fw5edGLmJ/IGg9JYvy7elyY=;
        b=gte904k3fdboT2E0NTw2nVDoHivKNxmAUuPy8Eje3s8EBUOKLXICSX/iuIyiK/LrVu
         DHKpo0RSCDzMxUk9N3nXDg/hiXAYjSPz7onUQLwQrTzpShnFd2PvBNN9Aluz7SQy5OTr
         2Cq3LiSXKXpAgPDFF8diM7u48U1zgLdRsmhy6WhjP+57nYl7cYK14ufsNMHFEGhqhbmw
         K0ebNpeSu7BbBCuQqim2wRJ/qu/gmSYBrUxGmguuZIArU0NDHhj4NcquHHjqrScXEJKe
         bLbbQHEpd7anaubT87cw5m1HiKSYrNRbIkrlHVbeAvZmFyK8mzTMm0n6SH5SHwku1Umf
         JNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742173; x=1734346973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdsBiUzpJ/4d1OMZs144Fw5edGLmJ/IGg9JYvy7elyY=;
        b=dfb0+7E9aDEQuAZJRRK+dj+1+BR+suPQGTUsHDVH/YagRLenOeKtHvzsnBO86ktim+
         S+Xr/GbKSD2q83KsxxvaWFoKy6m59+hB6ERWjHtOzgPZewUMEATKdyXqDQDgb1mJEFdh
         h/o0je/TIFxgBh/sOVX9ZbEvg1ARtEesINti6gutU3e25jDQon/VARGcceymJRYVHmiv
         Ufp6LG7lSsq6ih3dVGcs7D8h7+WlU7laM4qtJtRw3yX/EeZVeOxs+ksOMSpoZtGdYyJb
         VYejiRLuBM9dORu4WAz4cgMnwSA+b49gPBah4BiYEFav8hckoVmnCTHSO7qQqc4J4/pU
         bomg==
X-Gm-Message-State: AOJu0YzXOaurzRYWBr9sJuZcymle8dWNzdO70+5JZvW8ERJFLfTGBb84
	cU5H79rdhaRk3Vs5jcsfk+hfPj72I+3qp0Rtrjz86/qu0i+8Ck0LH4Y9E1L4TSE=
X-Gm-Gg: ASbGncusVO0EHmeisRDlpGa1FgXt0b/Qx+RoMaTIVVaw3/o1p/h1xlMx84koXUQavIn
	mGbA5f/3rz2e6wHzssXS0fFXBrmI8GGP0qJvYhWoJWB7XCYtHt8DehCuZxgnQXnk3SkGb+0mEZ7
	D76O0uPxSxv3iFI4Q5i9BkS3fJHNjjNMGfqH8ryEffLfFj6BrXbq4tVr1dC9u2bxFj6+1rgxDxs
	1Hzuc6KpZP8h242HONlIHx3OiIpCqy/YqiqmwECKKAxJ94Ai8vy7IeuHNkt0IAJnw==
X-Google-Smtp-Source: AGHT+IGh2upUsVCxMp6v23ePbPz+L3uqU9/kQjqdceMgnW02Y20/7QTOoLVj8E4FEcbt3QiJvcWzHw==
X-Received: by 2002:a05:6402:2349:b0:5d0:d786:b87b with SMTP id 4fb4d7f45d1cf-5d3be7a104fmr4732590a12.9.1733742172928;
        Mon, 09 Dec 2024 03:02:52 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3dd4f641bsm3348818a12.51.2024.12.09.03.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:02:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 12:02:18 +0100
Subject: [PATCH v2 13/19] arm64: dts: qcom: x1e80100: Fix ADSP memory base
 and length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-dts-qcom-cdsp-mpss-base-address-v2-13-d85a3bd5cced@linaro.org>
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9093;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GlS5WDoRtGHpA8QTt3x6IvZf6O0GiSsbv4oxLcXsdhE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVs48kuv1FTqyJxBsD4RBsweM0qOXD+E9W1srl
 XZiHua7IT6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1bOPAAKCRDBN2bmhouD
 1xxuD/9pnzUwOZcuH67hOerkYOVRlIGA0GjFNN2MAO4SUAuIxauzYRmCsg1yuw+ORdMy4ng4XS1
 ZxxBy6NXc0RXPYsmtWwk70YYxWVyDxE7vCLZJ7C1064aNump+ZyXPw8tYLGXXa/8lsBkhYgciZ1
 HyD28IrHQDoPvk/lVdInMsUamBd92AKOoYTNQblNIxlZc6XMVf0zXu8TZ/Z0u0yKar4mK4gH9v9
 +Vc/ITyY488whp+ICT9WRMfNyKa5wVT3t9Yysh7AYn7iNIVKX38XOo/0DhF0BdINefyWK5SZK7B
 pFyu8Ww/LH55rR4Z0yefjogQm4UhqNAkWTx0+qei9l3hPY05KaOFiMdXZulARA77EK2lNqcu7fX
 IYxzQeOowCy6bZSAl3JM6JyjbagwXdZ1glX5e5tqhBBD70bnOuLbKbcUqWp0hKFfF2pNTMkn5oP
 dGk5pK5VZXHmq7ASn18D/7Z3Yu+VOvf29Z9mauocikNCWNJGj408KCT4cPSnKpM6LEL/QnksK9i
 YyNTHdo3yJmeI8K6rQcAttm8K3q1w/3DSjRKr6RT6cfB4/bZhaMrooyKEKSzCCNMgoGDCzdVujH
 UlBfiuPIunbrbZhC6hSg3Eku85N2xe8zbSWlwIJbL1sx4/k4ODT4vqxzlmahmUV+W5vPYxuu/ev
 0+Fp1fQz5dBU8xQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in ADSP PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB): 0x0680_0000 with length of 0x10000.

0x3000_0000, value used so far, is the main region of CDSP and was
simply copied from other/older DTS.

Correct the base address and length, which also moves the node to
different place to keep things sorted by unit address.  The diff looks
big, but only the unit address and "reg" property were changed.  This
should have no functional impact on Linux users, because PAS loader does
not use this address space at all.

Fixes: 5f2a9cd4b104 ("arm64: dts: qcom: x1e80100: Add ADSP/CDSP remoteproc nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Commit msg corrections, second paragraph (Johan)
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 274 ++++++++++++++++-----------------
 1 file changed, 137 insertions(+), 137 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..9df6903b5d59aadda26d9e0d4d9f951c5c3add7b 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3720,6 +3720,143 @@ nsp_noc: interconnect@320c0000 {
 			#interconnect-cells = <2>;
 		};
 
+		remoteproc_adsp: remoteproc@6800000 {
+			compatible = "qcom,x1e80100-adsp-pas";
+			reg = <0x0 0x06800000 0x0 0x10000>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&adspslpi_mem>,
+					<&q6_adsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1063 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1064 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1065 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1066 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x1007 0x80>,
+							 <&apps_smmu 0x1067 0x0>;
+						dma-coherent;
+					};
+				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1001 0x80>,
+								 <&apps_smmu 0x1061 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
+			};
+		};
+
 		lpass_wsa2macro: codec@6aa0000 {
 			compatible = "qcom,x1e80100-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
 			reg = <0 0x06aa0000 0 0x1000>;
@@ -6319,143 +6456,6 @@ system-cache-controller@25000000 {
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		remoteproc_adsp: remoteproc@30000000 {
-			compatible = "qcom,x1e80100-adsp-pas";
-			reg = <0 0x30000000 0 0x100>;
-
-			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog",
-					  "fatal",
-					  "ready",
-					  "handover",
-					  "stop-ack";
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd RPMHPD_LCX>,
-					<&rpmhpd RPMHPD_LMX>;
-			power-domain-names = "lcx",
-					     "lmx";
-
-			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-
-			memory-region = <&adspslpi_mem>,
-					<&q6_adsp_dtb_mem>;
-
-			qcom,qmp = <&aoss_qmp>;
-
-			qcom,smem-states = <&smp2p_adsp_out 0>;
-			qcom,smem-state-names = "stop";
-
-			status = "disabled";
-
-			glink-edge {
-				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
-							     IPCC_MPROC_SIGNAL_GLINK_QMP
-							     IRQ_TYPE_EDGE_RISING>;
-				mboxes = <&ipcc IPCC_CLIENT_LPASS
-						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-
-				label = "lpass";
-				qcom,remote-pid = <2>;
-
-				fastrpc {
-					compatible = "qcom,fastrpc";
-					qcom,glink-channels = "fastrpcglink-apps-dsp";
-					label = "adsp";
-					qcom,non-secure-domain;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					compute-cb@3 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
-						iommus = <&apps_smmu 0x1003 0x80>,
-							 <&apps_smmu 0x1063 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@4 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
-						iommus = <&apps_smmu 0x1004 0x80>,
-							 <&apps_smmu 0x1064 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@5 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
-						iommus = <&apps_smmu 0x1005 0x80>,
-							 <&apps_smmu 0x1065 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@6 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
-						iommus = <&apps_smmu 0x1006 0x80>,
-							 <&apps_smmu 0x1066 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@7 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
-						iommus = <&apps_smmu 0x1007 0x80>,
-							 <&apps_smmu 0x1067 0x0>;
-						dma-coherent;
-					};
-				};
-
-				gpr {
-					compatible = "qcom,gpr";
-					qcom,glink-channels = "adsp_apps";
-					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
-					qcom,intents = <512 20>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					q6apm: service@1 {
-						compatible = "qcom,q6apm";
-						reg = <GPR_APM_MODULE_IID>;
-						#sound-dai-cells = <0>;
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-
-						q6apmbedai: bedais {
-							compatible = "qcom,q6apm-lpass-dais";
-							#sound-dai-cells = <1>;
-						};
-
-						q6apmdai: dais {
-							compatible = "qcom,q6apm-dais";
-							iommus = <&apps_smmu 0x1001 0x80>,
-								 <&apps_smmu 0x1061 0x0>;
-						};
-					};
-
-					q6prm: service@2 {
-						compatible = "qcom,q6prm";
-						reg = <GPR_PRM_MODULE_IID>;
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-
-						q6prmcc: clock-controller {
-							compatible = "qcom,q6prm-lpass-clocks";
-							#clock-cells = <2>;
-						};
-					};
-				};
-			};
-		};
-
 		remoteproc_cdsp: remoteproc@32300000 {
 			compatible = "qcom,x1e80100-cdsp-pas";
 			reg = <0 0x32300000 0 0x1400000>;

-- 
2.43.0


