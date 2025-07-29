Return-Path: <linux-arm-msm+bounces-67028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC4DB14FDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 17:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA126188EEF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F06A28A72B;
	Tue, 29 Jul 2025 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8rHcL7Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C7A1FC7CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753801105; cv=none; b=q4Ajck/wDyTfHmybzuALDQ8B7ftews1LsBL5MHckpV16DW7wINvtjA9O0fgNqcbzWLom3RouxZaiRkCORBhkbWJoEvHqgtMjiFK+Wk6lbBOkIfR7iGQ4nvQGE8hEMSrlyBLkkW+2o+Uq++84D9jPRbm50I8gjOKu1u7Zj9vSINA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753801105; c=relaxed/simple;
	bh=a76w9P/W1dZKqTU1YXIkU5GRvE3+uA+XoVFIJPcGYJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUxIbtdWbIHNyx/jJDACDSv9tatIO2z3JdQ2CDkwIYbtL3JUzklgPHlcZeKLs9L6zGNHIOo6cLl/30nB4pWVUzcxA5MkA34a5p+Mcn32QapdEl0wr/PPOKVys7ZUHkf0gJvr1h5ShtibALno+eLJiEcyG3dzmGncBtkKluiITiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8rHcL7Y; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45629703011so39760805e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 07:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753801101; x=1754405901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p05nlOvQfzxXoS5wCNf98NUfm77DuBDoigr1C8/LCF4=;
        b=N8rHcL7YQTTtYg1B172V++BDLw1XoQvHjp73m5O+awhEuLClHZlNmIpZ89s+REfr7j
         QAExCcLdLoDy7HSI37NoxLmNnwo48CXuIuvwRx/AItTMnRXqJyLhDAPb3CHvrXOXA4jd
         XNuoYL/VGYZEYFTY3ZyEmvhUckTCNYusPRMG63f94g0aDWqYhIM8E/TpHOCP+vbTSsiB
         diHjBxgeGFoWnevdKQj1shfOKArtFkP9TYUNa5rv6eY//zeJX4tGR4wZUb37p04kU27L
         Uw097H5sCbRR5kkV08SFxKd7r+5Ox5mXuXMGKaw7UdrplDXEBRkzNpMkuXk7yROdVNTe
         fPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753801101; x=1754405901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p05nlOvQfzxXoS5wCNf98NUfm77DuBDoigr1C8/LCF4=;
        b=Pw0xbI6W0dLySVVn9KI1st/BqXirvJNKyuG8xEnilHIMD7xzFne7NLs0yYn9wfT07w
         KjxHLQUoJTjohMjsDjhQ+xz4VaP/LVC8ubzCXDfLFNPmiPVX7x/v0jLr4DuUXfLOw0mB
         CXcqnWbxAQxqiUt/bS9rEfNRMlXpsoq1Z1H/SWYbdSXwVLKEKCjAWQ1gAd4EGERoMJqE
         adT+LJPbe+MpKypdYSSUOKWNUpx99BJAPDsCnYAD+F/OFdd2R0dk22HvyTs/9wk+mkvA
         rGkbJOAJdn1ypcRHk/V+/te4534HDR/VsxyXXqHz26szEO/jlryM1B4U/+TuE57kACcR
         iI4Q==
X-Gm-Message-State: AOJu0YzxGqV5jTxV1liOHIfjWm2XwOhONyZy5flNniluU8oqZKOoHHUe
	NYtPEq3ZWnPEHlr0uLwXuI/cqUU2+RG5a3QDEWENgVP4lKhLQ3wSOJYnC7Y0yimVFhk=
X-Gm-Gg: ASbGnct4FixHS4YRKyAYaJ1uncOA6Snn5KcPTBbbKOjyLa/qsMLw73vk/s+u6danx3A
	G/EMPYBGOS9WD7Ag31/3vrWC8BnhbvDChB9EPbNEZaZiCwAEjsfvD9cP37gagBXvPKQb9TbezoG
	lQowiqpo+wDDwOJhIDwh6PwjdLQVke8jGqQ3TnzDuESIE+hWits8F5SdRtKHDCRZnDtn9EDYMsK
	nG8jVsx7eyCxM18dGotruU7NBiXpTan3pZjX47J81+V+j4tSJxiDCc8Iu0MTMDniWrDPyxEUj2T
	E8+H8R1uX1arPyEuz1R1+IhTVUTWx4eOQQ5hHuoQl9zI8bn5QMt9/9knLS75gXLrDhXJ+fMtSA8
	e2Pkv0RFCugD/3cT10r9fjkgUnIQaei5Q0KpYvbfi9cs=
X-Google-Smtp-Source: AGHT+IHLn5likhDOow361J0wljLn5gSP87I+9EMtbVP1wjtdnS4tSC4JDlAEbb9BZ77EmfkO1Yh4vQ==
X-Received: by 2002:a05:600c:458d:b0:453:84a:8cf1 with SMTP id 5b1f17b1804b1-45892bdff3amr782595e9.33.1753801101455;
        Tue, 29 Jul 2025 07:58:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705bcbb7sm210294075e9.18.2025.07.29.07.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:58:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 29 Jul 2025 16:58:17 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sm8550: Flatten the USB nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-topic-sm8x50-usb-flatten-v1-1-4be74a629136@linaro.org>
References: <20250729-topic-sm8x50-usb-flatten-v1-0-4be74a629136@linaro.org>
In-Reply-To: <20250729-topic-sm8x50-usb-flatten-v1-0-4be74a629136@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4132;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=a76w9P/W1dZKqTU1YXIkU5GRvE3+uA+XoVFIJPcGYJE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoiOGLHlvpHvQOv93BMXnI0Iihyvqjt15v7LA4d0Ew
 gOj67kmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaIjhiwAKCRB33NvayMhJ0VbSD/
 4xgNLkzwXMTH2FRWlC7I2ZwthBc7j32LyZ4lfsSwdPFyXl8yPEute388anz++CqWA6rsQ0U2mytdzD
 jju2GYu0bJDK/2hYMhmU2UVmjcizQquicG6e82FfSLt/IwQreyaI616JSqPgRWCbFSwTdKbmxoDutY
 lsKkUKLxSp66160lt7JxPFMQRl5KDDqKmIzOYsHiN3Wajda4Gi5VP1Cn+EGjWzSO1QCgKOmKtTauwY
 VY86a60MCCxrFksDJzzbuGWSG4PtSB+7+DYD8CeGw+kzFZopy9yLkJ52JHS083F/7x9hMFiimUgyd9
 NE0IH+lzzG8QvuSgvk1++jrsYaWUrSr95cMP1NHGnGiGv0LR6omiywXrEF+4Mpmoa3gCnIOZTugtfN
 c0TwIqkgDUlMc4d1W4AqkJwI6rlGZ0je2DIN4pD1XYR+lFqm45MAqQPX9+BvfbJeSnfK/SqrloyY8g
 4tMMhlq32JYfrV1h9VanWeTOg98iB/rSAHf2VQjxh3I/2N24NYNxWA46+Oc/PmhvbMh/eypxC0UdIX
 PGYTwnBQAWEI/qyswcYSL8wEvXRNPwfjJNxsooZCrNCLqO2RV8zeyGct80n99IBoql+E0KBZiRIQuA
 Y8TO92yIn9KU8mwavEkYWA7HpuJbkXuZ90OQUElD3t8zRy5E5tfchdS9DYhA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Transition the USB controllers found in the SM8550 SoC to the newly
introduced, flattened representation of the Qualcomm USB block, i.e.
qcom,snps-dwc3, to show the end result.

The reg and interrupts properties from the usb child node are merged
with their counterpart in the outer node, remaining properties and child
nodes are simply moved.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 84 ++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 45713d46f3c52487d2638b7ab194c111f58679ce..1e67b1cbdbfd1ac5478af23bf45ba45bb756ef29 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4084,12 +4084,11 @@ usb_dp_qmpphy_dp_in: endpoint {
 			};
 		};
 
-		usb_1: usb@a6f8800 {
-			compatible = "qcom,sm8550-dwc3", "qcom,dwc3";
-			reg = <0x0 0x0a6f8800 0x0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_1: usb@a600000 {
+			compatible = "qcom,sm8550-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -4108,12 +4107,14 @@ usb_1: usb@a6f8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
@@ -4130,47 +4131,46 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			status = "disabled";
+			iommus = <&apps_smmu 0x40 0x0>;
 
-			usb_1_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0x0a600000 0x0 0xcd00>;
-				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x40 0x0>;
-				phys = <&usb_1_hsphy>,
-				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy", "usb3-phy";
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
-				dma-coherent;
-				usb-role-switch;
+			phys = <&usb_1_hsphy>,
+			       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
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
 
-					port@0 {
-						reg = <0>;
+			dma-coherent;
 
-						usb_1_dwc3_hs: endpoint {
-						};
+			usb-role-switch;
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


