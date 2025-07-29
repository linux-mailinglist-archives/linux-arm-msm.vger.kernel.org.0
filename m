Return-Path: <linux-arm-msm+bounces-67029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81349B14FDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 17:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAE144E61AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B8328726B;
	Tue, 29 Jul 2025 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ywFvilFI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA04D2877F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753801106; cv=none; b=ZmMe9u/HXREh05ptx0CZcf5YjEhzg0rN5ivUpV1vC1iUgq9rPIZRqE0+RdkqBV5c1os4+na8ODHvUnwvgzUI+L4Q3L2GdSYWco++stRd+xAb0NYTzKIchXFU9RWTKSjt5RjpdK1SZ7dE7VWCPMefFEQ94j403R0zDDshs1IzumU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753801106; c=relaxed/simple;
	bh=G1mNuBpA7HbauYoTqR/3ft2D5iQv7PrC1A9qoCeBmnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GyyRAZ6dHH1D6x4SPxKbssRdtg59xyUvJkvpNLNqwNFSDo83MjutL93BOsL10PzBBvoP5GAqjWxe/g8KRmau5znu9KAw8EOGQZBq9YmVYswbauXDEL21gE/sCLj5ZbrmOTP2lF1Yn9WJfLpX5HRvJi40w2wewDsuW4OioWh5/lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ywFvilFI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so44010365e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 07:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753801102; x=1754405902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHsvigqSpw00u1mtcnaLxdNNr9s9Oed6sd1X0ydEhkE=;
        b=ywFvilFI/YG5ftYG3pfPsO2xcaCDGyDiB3bCKIEmjGtC5VEwH5TRkZqUZQO03IuNpK
         5trW82yeBtVTs1EGVRhZETCYKPmjXXizS0AoSVdA0wVOGG3QqR1AWVFip2MFSjMX0Jo0
         g2CoE+H/h0cVBqS2F+9B1IYb6QP/OAZlvtVrJ2c/vL4iZVBWcHd+OqbDAkNcQiRKXmb0
         rBDb+W/mj1UWsreikHX1m57bu0KOsscFHQtIsormQAEFL4lLJNxp15OJmzT6+vdAmT6L
         MNMNNyRZLdmbSFPTNw5GRCGNMTiTNKDGAmUmVkwHxNdB1EJfB+aWF330j1ILA3SpRK6P
         tkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753801102; x=1754405902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHsvigqSpw00u1mtcnaLxdNNr9s9Oed6sd1X0ydEhkE=;
        b=YgWJsKIrA8FOwxPloPlDcay91PiRBg042aBPAKlN5ttl0cBBZfZMRji68d3KtxJ0EI
         5NN5mElAjf/NnjSk/l40mwIQK4bbhiLuGdI2FZnglcqvjgpOzy7ZhmeBFyeTz+LG08En
         YqWIEbI9rwobYECgZsAwlGsJ/nEmC3kZwNNnMWHuXlIYKrDIFgLtW/2YEl++5aZCbmkt
         hFdRCL70qvdZeLkaoSeWNjGBq814mLI/gvNGQiH+cyL1VbqJqlE47EC+Mz6kCwIpx3EG
         HJWaNwNgvh5zuEEWZR79jvBtmjjJVs5K05bIAoRHv6SrgAS6riMN4qr0EeSTiKzB+q+G
         1wFw==
X-Gm-Message-State: AOJu0YxsJ7k1CWNFBZeS5tqNTQMf+qwhZbCnqvN/vRcJgUFloGi+f/+b
	aUNaTaWUTyPusa6acrKTwIkcZG8MBdN2YSd4dQ0G+a4WzdhCRfMYwbAIZzRoG5J0FCQ=
X-Gm-Gg: ASbGnctsKNMNKCc37AVPEUWkyGqrnKTWbWfYYF3PoDw1LDGEfs7tR+7BuA1NyQ4IVHp
	AbHm4VQkZ+MYB9wG2f7lAmMkDxOdxcVByjHFpPQXWjcor8iLnlfw4NOcsn2yhPiHvG1bE2J1R43
	yMBT0AO2KRw+c9CErBDU/nWRiM1O+GPRJJrZ+Bi6LfBQ4Zhvfpd+9vbMu/+SF4Zti5jSwUUPiXu
	ojO5LX0m148a1LrdgfYf5IGZ+jZL5c1zeW2a5iSzvrOr3uPJ84tSwkptbr614iXTCxBk5qzIq8W
	aundB13N8ediUCO/TtSXdz11+MFYXquZ/UPO8jEixlglbpBVmoJ6u/CIrWom0Rww6IQh0tL/xpG
	DDYs9o+jfxtzCf1tKrSv/93yLJA6SnO/wHfO1Uqb6kUk=
X-Google-Smtp-Source: AGHT+IErc4AESaBFczNyM97DPfV/SppVmdg8l4MS3ZHOXD1p0g7Pk6+WmXwiG6iRAAUfgH2rgywKGQ==
X-Received: by 2002:a05:600c:19c6:b0:456:2020:165d with SMTP id 5b1f17b1804b1-45892bdf4femr728825e9.31.1753801102129;
        Tue, 29 Jul 2025 07:58:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705bcbb7sm210294075e9.18.2025.07.29.07.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:58:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 29 Jul 2025 16:58:18 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sm8650: Flatten the USB nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-topic-sm8x50-usb-flatten-v1-2-4be74a629136@linaro.org>
References: <20250729-topic-sm8x50-usb-flatten-v1-0-4be74a629136@linaro.org>
In-Reply-To: <20250729-topic-sm8x50-usb-flatten-v1-0-4be74a629136@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5785;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=G1mNuBpA7HbauYoTqR/3ft2D5iQv7PrC1A9qoCeBmnI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoiOGL5vRSKPAoLrk3+YfDrsEa5OpAg8IuYfVUKDrF
 7pcZDcKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaIjhiwAKCRB33NvayMhJ0QV1EA
 CcKSE+dBtILpL00HPJDYm5W8ZzLGTaAi1Tqd5pztY6nMAAPn/oZ43QPDRjWg1sQoyMnNIVMm2VdKDl
 XiYRp6NJ4CRiOqfGFVYEvxWfvbv7VQ/+fAbb2zwet9Q5ktM8HDYRsyYG2mkkoIrke3+yUA3OAdtEdy
 wXSdJNlLS0ltVGN0nL6FDSbEnWG8ptZpncrJb2LdXJ30tAKo5nksY2ueWigYPO9wMoM/aeLGGEI0TZ
 Cvq9LfyWVxy9fsrEECouowYyp1sk9Z+em2b6zFaA1CBdMCv6NWD7YnQsk6RfNKvImwQt+XtQyJhcsL
 hR0dllrRlTtThycBntW+j+Wocqv+dahNbj7zyOz45tdyJB0pcw4xPG8ut79nE0Xwwv2QExS9jDIaqQ
 7N7L9CcAGHAJfcz56KCsjD/lkD4mJJBAGzFBN5vL603FmnZf/rl4ZtRz5H/GBwzp6Yk/MsYgxFUbHV
 c3JN+3MrQDZQUzLRtaHBtzvswqMMe3hxm3OczbH8mbhr4buaT3x36UM2ClTBbGgLckaqlo/Gwi/y8Z
 EXDUz+roxS4B3uJ1Iv+2U7edp1Mx5uGN9ErB8qfom//A/nXokQGoRuvdDiBdVdLOmpxEf5XiEqi/dx
 w6/wAHYPJsM0MHQ3oBRgKRIYvyqM1B/zj1VeWd3ow/uFmywpHi/v6J8ttrHA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Transition the USB controllers found in the SM8650 SoC to the newly
introduced, flattened representation of the Qualcomm USB block, i.e.
qcom,snps-dwc3, to show the end result.

The reg and interrupts properties from the usb child node are merged
with their counterpart in the outer node, remaining properties and child
nodes are simply moved.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts |  6 +--
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  6 +--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  6 +--
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 86 +++++++++++++++------------------
 4 files changed, 46 insertions(+), 58 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 259649d7dcd768ecf93c9473adc1738e7d715b6c..a00da76a60620b998973cab189f12eeaa0a448fa 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1310,12 +1310,10 @@ &ufs_mem_phy {
  */
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 8a957adbfb383411153506e46d4c9acfb02e3114..c67bbace27439ad67cfb247a88aec633f93f5a6d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -857,12 +857,10 @@ &ufs_mem_phy {
  */
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 7552d5d3fb4020e61d47242b447c9ecbec5f8d55..081b7e40f5742120a611cbfa57a59dfb1dc19b9f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1293,12 +1293,10 @@ &ufs_mem_phy {
  */
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index e14d3d778b71bbbd0c8fcc851eebc9df9ac09c31..0120b9c7432a945a204ed76a461a6d0f13875537 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5651,16 +5651,18 @@ usb_dp_qmpphy_dp_in: endpoint {
 			};
 		};
 
-		usb_1: usb@a6f8800 {
-			compatible = "qcom,sm8650-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
+		usb_1: usb@a600000 {
+			compatible = "qcom,sm8650-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0x10000>;
 
-			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>,
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>,
 					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
 					      <&pdc 14 IRQ_TYPE_EDGE_RISING>,
 					      <&pdc 15 IRQ_TYPE_EDGE_RISING>,
 					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
@@ -5685,6 +5687,11 @@ usb_1: usb@a6f8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			phys = <&usb_1_hsphy>,
+			       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
 			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -5692,59 +5699,46 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			interconnect-names = "usb-ddr",
 					     "apps-usb";
 
+			iommus = <&apps_smmu 0x40 0>;
+
 			power-domains = <&gcc USB30_PRIM_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			status = "disabled";
-
-			usb_1_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a600000 0 0xcd00>;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,usb2-gadget-lpm-disable;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,usb3_lpm_capable;
+			snps,usb2-lpm-disable;
+			snps,has-lpm-erratum;
+			tx-fifo-resize;
 
-				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>;
-
-				iommus = <&apps_smmu 0x40 0>;
-
-				phys = <&usb_1_hsphy>,
-				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy",
-					    "usb3-phy";
+			dma-coherent;
 
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
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-				dma-coherent;
+			status = "disabled";
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_1_dwc3_hs: endpoint {
-						};
+					usb_1_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_1_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
-						};
+					usb_1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 					};
 				};
 			};

-- 
2.34.1


