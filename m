Return-Path: <linux-arm-msm+bounces-66804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACA1B1318F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 21:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31B2D189771C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 19:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C249225765;
	Sun, 27 Jul 2025 19:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6LrkgeC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55623224AF0
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 19:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753645024; cv=none; b=A2bwCaPeD4QpKW56CdUNDZ6rsq/44LiB5X0IcZmqiWReNMOifodP/RCi2TBegEHILhNQ5LusGnbiXS4yp5tl5H2fK76Z9Z+ooSx0tkmsOdP1V6iWnKU6Odt4Ed5DPiUnLG5x9yxGqynlmIiWeEkQA1bicw9yxNiol3bsOgNAtiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753645024; c=relaxed/simple;
	bh=pCQCdRmlqteGXO1dI3JhZJOwDdd/l/sBFMVSJ+tKS4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OzLLcHzXnL3MHtK82ZWt2ic2NkE0aDlkkW9VudD1FD8lneDK3YSFswDynwNLSx8g9gAx+7rl7FGpZhshskKMRm/uDzS5b9/wihRwLAIauZ18ZkV3hBoLDosWSGLJxWinAL6BsFvNBGRN8XM0/x6eFGFiQ00ObUHekvwkCIdPYL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6LrkgeC; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-af240271376so33700766b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 12:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753645020; x=1754249820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7y0vcHUdKY5HubRv6sWiVBOd/tgjmHnqruM1wM9dbQk=;
        b=s6LrkgeC+hWkWa+ir8J+CtTAN+p4+uthXLN8vYGrG3a9reDJG3Ptzp+3pBtO22ky2B
         Sgf4asUc5b1OkP7jk/+hPkGom30TBTou4ob1VoDj0TOt4weIAP1Edf8NCInGXaE2RVKi
         PlAd0eMeC3YY8RVdT3DjGQPucJ7RNtVAyg+a5np9bcNZITOXE6PZmKzgMB16Ku4JIe+6
         Y721bSWXIPMlnVehXY2tpud05in7hJ43C27iUX/pfjhfwaYvIq5D+TUuh0wgVX9eaeLv
         EkMGoFCPVJRqu2VOGs0kryO6SQTk+qWKgjtjAeLW2wX1C4q1FfkBFUFwnTzJ+TAvOkOP
         w3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753645020; x=1754249820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7y0vcHUdKY5HubRv6sWiVBOd/tgjmHnqruM1wM9dbQk=;
        b=a9BCzbvJchfGA5O+t0k0P4EjbPVDEV8Nl4qL+URoFg/Ga8Rbm/6ArWQ9P14btkrkpH
         9LYN3buKAPnsfh8ydQmAzXRiwSZRhbwvL0yZ4uRY043rxGIJ2y/Da/XeVD8jJHqQkcg/
         6R7uMFL2AhlWKGlnBZLwR3VMQ7L8uCbzVdhAsA1FtF6JYQ0kgx6BauMBVko1j38uSgZm
         MlNvIHpCI52ljkWW2sAyAwGRK4e8gpt/g4QcZJzFf2uyckgPn/W+gRgqXlp2EIJYGMvb
         XAuCVLLKtGZVoAZHgzz6FANjZwcY5RQJjhGhS4dZOcoysZulMO4rfnRo1K71VCBFRXTc
         CStQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmyjrPUe7yLIofjsxMuwXUvlFdZVDVWz2CA+fWt0MzhjVVrDIys5ZSwMRrwqTuePb6MUHcPngdT/zZ2rqz@vger.kernel.org
X-Gm-Message-State: AOJu0YxDIBU2xg9sEmKbvhpFFblg7YVDLlJd0MymTszA7FOIVLegkWsh
	0boeu7wAtst27ELTlPeghQb5uQRCnX97cRQqHSwJiP2SzfRA+hKwUrPSRl5PLWjHpGQ=
X-Gm-Gg: ASbGncvW8bdMR1FqLj476KnGh0k0tV3NWJPqaWc+vns7G9qTV67N95relaasqMdud/e
	oz8QC/eTK2DGMx4MAh/XB547sy4N8uljD8dCCOb5vyELmHt+pC2CXrNaHeNjiaxMHiTrIEYwmud
	8HxIMP2kJqt/cpFzS7ppFbhtoXzHhiQiFTDwv5SrviqcuiVkU+vzo3MtC1AUiiEMfdWWzy5ZM/e
	BcehbFkcb1k//tcnh8Rvoe2r7PYRq4qt1ta0VNFLyn5t88QVfpQOISeeaHzvc3aMLOyeBiiWnM7
	x8TA2177zgMOw2vI3DEaFoXT0BdLjgCszYYTju+QnMA7FxZu8PFZxFccEBpWNXPIWDTubhMixhe
	I+zwe9L9RvqzNiMDMxeXeNGbfrhmUZnUb
X-Google-Smtp-Source: AGHT+IGnsqbLYepeBQlMegx0Lp4dkyiztC6rJSiVSH/e1bfIWi3D25Q5CqLCNjtZas5rY3E0iHNbaQ==
X-Received: by 2002:a17:907:9628:b0:ae3:cd73:efb9 with SMTP id a640c23a62f3a-af61d779f94mr388208866b.12.1753645020391;
        Sun, 27 Jul 2025 12:37:00 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358a1c23sm318267066b.51.2025.07.27.12.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 12:36:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8650: Sort nodes by unit address
Date: Sun, 27 Jul 2025 21:36:53 +0200
Message-ID: <20250727193652.4029-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11920; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=pCQCdRmlqteGXO1dI3JhZJOwDdd/l/sBFMVSJ+tKS4c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBohn/U3EEL9lsA4gGgyw4soEmQ+T9mPFjc51imq
 SGyybgk7lOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaIZ/1AAKCRDBN2bmhouD
 178DD/4lZF18/08Yzvzw4qiqtSF/pGbR/jJj2qVZaM/GpMpRi+GufSA4BeTgMrFK7oxYRr0pc0S
 7TevAv373OoKlhYRsE8PNguNRvDwcfLrqPU5XbVcXS/nh0DLMpJMpMbrQRjl0OpcxBh+NpMXmsF
 csL2DC9rs3f30DTHY4/S2+z+khXMyapTVf9I8pum+3uB6JFg/pYnxsYjKwSYFw2IMQm8YtxQNWH
 vk7Bkq8q0PX9cpWz99MqNo2EL6jwa5DHh+W2rYcynAJVCEWunj3lKLzEi8x60DXykI6nXOZhCw3
 kn4bv2LnE1LrNn29y6sTTAI9v+ZmcnhJuq+Rc3wl4DwkpoEIQsm6TNBk0DoWNU3AhShfA2QROHn
 y11Vtzcv5x60DQYmYVZfK7ZkPseCuMR6YJvRDLjFui4z3hGkiK+qJYnd2of43LehvtjA498J0Mn
 zO6K0ywoDSupG3yndZP5a0UasP11oeFm5XBoWVDFPi++ZDdXvQA8e0D+u0o1O9HwmhHXdMac29v
 2O72/lzLDFnhum7PL7np7WG/ftYI+i5JCLSYuqSoI1pMN5AMfzuGBTk7veCm1CZrRlyrN5HZBZR
 2MfSrK6AE1jY4NBgPtiOb3xkYHDaoLdM4TX9oDzSEwkQWHYrnicjEKeB87LNSzVJ7eeG71bg35F ZgD3tpNChMWjR4Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Qualcomm DTS uses sorting of MMIO nodes by the unit address, so move
few nodes in SM8650 DTSI to fix that.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 414 +++++++++++++--------------
 1 file changed, 207 insertions(+), 207 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index e14d3d778b71..2360d560dc86 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3490,6 +3490,11 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 			};
 		};
 
+		rng: rng@10c3000 {
+			compatible = "qcom,sm8650-trng", "qcom,trng";
+			reg = <0 0x010c3000 0 0x1000>;
+		};
+
 		cnoc_main: interconnect@1500000 {
 			compatible = "qcom,sm8650-cnoc-main";
 			reg = <0 0x01500000 0 0x14080>;
@@ -3561,11 +3566,6 @@ mmss_noc: interconnect@1780000 {
 			#interconnect-cells = <2>;
 		};
 
-		rng: rng@10c3000 {
-			compatible = "qcom,sm8650-trng", "qcom,trng";
-			reg = <0 0x010c3000 0 0x1000>;
-		};
-
 		pcie0: pcie@1c00000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-sm8650", "qcom,pcie-sm8550";
@@ -3926,38 +3926,6 @@ pcie1_phy: phy@1c0e000 {
 			status = "disabled";
 		};
 
-		cryptobam: dma-controller@1dc4000 {
-			compatible = "qcom,bam-v1.7.0";
-			reg = <0 0x01dc4000 0 0x28000>;
-
-			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
-
-			#dma-cells = <1>;
-
-			iommus = <&apps_smmu 0x480 0>,
-				 <&apps_smmu 0x481 0>;
-
-			qcom,ee = <0>;
-			qcom,num-ees = <4>;
-			num-channels = <20>;
-			qcom,controlled-remotely;
-		};
-
-		crypto: crypto@1dfa000 {
-			compatible = "qcom,sm8650-qce", "qcom,sm8150-qce", "qcom,qce";
-			reg = <0 0x01dfa000 0 0x6000>;
-
-			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "memory";
-
-			dmas = <&cryptobam 4>, <&cryptobam 5>;
-			dma-names = "rx", "tx";
-
-			iommus = <&apps_smmu 0x480 0>,
-				 <&apps_smmu 0x481 0>;
-		};
-
 		ufs_mem_phy: phy@1d80000 {
 			compatible = "qcom,sm8650-qmp-ufs-phy";
 			reg = <0 0x01d80000 0 0x2000>;
@@ -4079,6 +4047,38 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x28000>;
+
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			#dma-cells = <1>;
+
+			iommus = <&apps_smmu 0x480 0>,
+				 <&apps_smmu 0x481 0>;
+
+			qcom,ee = <0>;
+			qcom,num-ees = <4>;
+			num-channels = <20>;
+			qcom,controlled-remotely;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sm8650-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+
+			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+
+			iommus = <&apps_smmu 0x480 0>,
+				 <&apps_smmu 0x481 0>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0 0x01f40000 0 0x20000>;
@@ -4962,6 +4962,176 @@ opp-202000000 {
 			};
 		};
 
+		usb_1_hsphy: phy@88e3000 {
+			compatible = "qcom,sm8650-snps-eusb2-phy",
+				     "qcom,sm8550-snps-eusb2-phy";
+			reg = <0 0x088e3000 0 0x154>;
+
+			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_dp_qmpphy: phy@88e8000 {
+			compatible = "qcom,sm8650-qmp-usb3-dp-phy";
+			reg = <0 0x088e8000 0 0x3000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			power-domains = <&gcc USB3_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
+					};
+				};
+			};
+		};
+
+		usb_1: usb@a6f8800 {
+			compatible = "qcom,sm8650-dwc3", "qcom,dwc3";
+			reg = <0 0x0a6f8800 0 0x400>;
+
+			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&pdc 14 IRQ_TYPE_EDGE_RISING>,
+					      <&pdc 15 IRQ_TYPE_EDGE_RISING>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&tcsr TCSR_USB3_CLKREF_EN>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "xo";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
+			power-domains = <&gcc USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			usb_1_dwc3: usb@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a600000 0 0xcd00>;
+
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				iommus = <&apps_smmu 0x40 0>;
+
+				phys = <&usb_1_hsphy>,
+				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+				phy-names = "usb2-phy",
+					    "usb3-phy";
+
+				snps,hird-threshold = /bits/ 8 <0x0>;
+				snps,usb2-gadget-lpm-disable;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
+				snps,is-utmi-l1-suspend;
+				snps,usb3_lpm_capable;
+				snps,usb2-lpm-disable;
+				snps,has-lpm-erratum;
+				tx-fifo-resize;
+
+				dma-coherent;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
+						};
+					};
+				};
+			};
+		};
+
 		iris: video-codec@aa00000 {
 			compatible = "qcom,sm8650-iris";
 			reg = <0 0x0aa00000 0 0xf0000>;
@@ -5580,176 +5750,6 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 		};
 
-		usb_1_hsphy: phy@88e3000 {
-			compatible = "qcom,sm8650-snps-eusb2-phy",
-				     "qcom,sm8550-snps-eusb2-phy";
-			reg = <0 0x088e3000 0 0x154>;
-
-			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
-			clock-names = "ref";
-
-			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_dp_qmpphy: phy@88e8000 {
-			compatible = "qcom,sm8650-qmp-usb3-dp-phy";
-			reg = <0 0x088e8000 0 0x3000>;
-
-			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
-			clock-names = "aux",
-				      "ref",
-				      "com_aux",
-				      "usb3_pipe";
-
-			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
-				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
-			reset-names = "phy",
-				      "common";
-
-			power-domains = <&gcc USB3_PHY_GDSC>;
-
-			#clock-cells = <1>;
-			#phy-cells = <1>;
-
-			orientation-switch;
-
-			status = "disabled";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					usb_dp_qmpphy_out: endpoint {
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					usb_dp_qmpphy_usb_ss_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_ss>;
-					};
-				};
-
-				port@2 {
-					reg = <2>;
-
-					usb_dp_qmpphy_dp_in: endpoint {
-						remote-endpoint = <&mdss_dp0_out>;
-					};
-				};
-			};
-		};
-
-		usb_1: usb@a6f8800 {
-			compatible = "qcom,sm8650-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
-
-			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>,
-					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
-					      <&pdc 14 IRQ_TYPE_EDGE_RISING>,
-					      <&pdc 15 IRQ_TYPE_EDGE_RISING>,
-					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
-					  "hs_phy_irq",
-					  "dp_hs_phy_irq",
-					  "dm_hs_phy_irq",
-					  "ss_phy_irq";
-
-			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
-				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
-				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
-				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
-				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
-				 <&tcsr TCSR_USB3_CLKREF_EN>;
-			clock-names = "cfg_noc",
-				      "core",
-				      "iface",
-				      "sleep",
-				      "mock_utmi",
-				      "xo";
-
-			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
-					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
-			assigned-clock-rates = <19200000>, <200000000>;
-
-			resets = <&gcc GCC_USB30_PRIM_BCR>;
-
-			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
-			interconnect-names = "usb-ddr",
-					     "apps-usb";
-
-			power-domains = <&gcc USB30_PRIM_GDSC>;
-			required-opps = <&rpmhpd_opp_nom>;
-
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			status = "disabled";
-
-			usb_1_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a600000 0 0xcd00>;
-
-				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>;
-
-				iommus = <&apps_smmu 0x40 0>;
-
-				phys = <&usb_1_hsphy>,
-				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy",
-					    "usb3-phy";
-
-				snps,hird-threshold = /bits/ 8 <0x0>;
-				snps,usb2-gadget-lpm-disable;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-				snps,is-utmi-l1-suspend;
-				snps,usb3_lpm_capable;
-				snps,usb2-lpm-disable;
-				snps,has-lpm-erratum;
-				tx-fifo-resize;
-
-				dma-coherent;
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						usb_1_dwc3_hs: endpoint {
-						};
-					};
-
-					port@1 {
-						reg = <1>;
-
-						usb_1_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
-						};
-					};
-				};
-			};
-		};
-
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8650-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
-- 
2.48.1


