Return-Path: <linux-arm-msm+bounces-68366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECFFB208BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60F4517A082
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E762D3ECB;
	Mon, 11 Aug 2025 12:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBnOkGry"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCF12D3A93
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 12:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754915125; cv=none; b=KNu5FEzXmN/1NEsjZ+NvQNDbkWsT3Al0wlzTUoULy1iDeRRTyPHLP2/gZybGwsj5YKtfdrf1H4HYq47suWWN+4PgNSplw4HGQi9JzbrVm71khicFll/UkvuH67D8jOCQ6qc6GxtCO+Gs6CvGjAgvI95xVIc6rhvYuXxm42uuKlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754915125; c=relaxed/simple;
	bh=E6EpzJPTESLvnjqzhszJRKba7xo8Q4+acZhnQGMvoUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JBbuvAbgvR3Ttifxq4hWUkxranY/cxFGhyvCXb148cXGuUUsBjfz8YwETLN9rc15b2ulrSKttJdZ0d9ybX2fCTZbsyssFNEKWlXwnCTgnppFEfGm3+HzCmKcDORJdRDVhq7SMC/fXg9haQNdoRQ02yVKt8ZKEC+LtHX1OqpYGAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBnOkGry; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-459e20ec1d9so42690665e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 05:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754915122; x=1755519922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etivZ7e+0kguo0gK+8IF/PpV+Adfh+Nn8xqpoIKE9zQ=;
        b=JBnOkGryd5ir06hwuwDV+SediYHhBshzefPbEb5tNZyIFrmJuu0EeUChR1ATkFzmoH
         lMYHkkTrvS6AcyvfCFxZtSA6bBGu/u8pHHqB44JlpNTiQ4sWbWdPbfBazJfuQ2XmteTi
         +PzvgJsFlrbM54ojX6OcypBwPKj08K79652yUbk0e1Wmz4+3FGI/kvsT9KZkbvl1nc6D
         8+dHXx+ADmrqXDwZ96lEnHfiXnbmz9UobJz3q6Wb6Y04orW5FWdAwn5tYTJDtCQexUee
         HQS4O/+sZk637YRfXeQei0s8HMmg/astiV8WJCHlxDDe3UnuX7vWTbloIOaPId0FvKyZ
         wSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754915122; x=1755519922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etivZ7e+0kguo0gK+8IF/PpV+Adfh+Nn8xqpoIKE9zQ=;
        b=YeTzXO5ckyqcYTPz4NwkQUVLqgds3Q4bh4qXnCU0vSNf6LP52GKwp6YgXF2cpmwKw1
         6Kdw4VzPzUq2oVOleoANqRBEfFL3PEOBrbRdLaIGe5PksuMIJDZ0Y/o/f1cFBhyv/rZ/
         PI7Kr/Cg7jk8bOfszolBRhkSU5nsIZyUDna8VTQq89OWd7HYFDWPIZf8/zBq1WRd7iP8
         28PbIgvlnBLWPS0WAoAuNzoBmqgdSYAz7YmVcDf3BhGq7M7IQ3RJuKphCEy5ufCRqEqU
         Onn/KtsDPIA1GT1uIoX4d1UCn+dHw6U2qjSAm/kz95y57V3uKKZlBW1bOAieXpAUK0yt
         ssaQ==
X-Gm-Message-State: AOJu0Yy71rBcNmFXouROorqhiaHMbDw8QMaARIB8IH1RqIt8J76oAR/5
	CxgU21h/FOvm7PIRA8mYW7ZP8ramKGuZ7j2oAu0Vwag4YJy+lhavdl64UUcUhvYYA5c=
X-Gm-Gg: ASbGncsFBfmx19v4em2g8QY1E6RohqDo+UCDGnpjF4ZdnH3Ibp0CfCKFkUM9Z3VM1+D
	lo8QoHojShCS3ryLpdqovZnxHMxibjaY/1z9z/aZa0RscyMmN/IGJY7Y1ZxG5osEQrPA6iNLs6P
	LXu+1747POV2nnWhfCE8Kynm6NFGcotI4Q4B7G287XWoF17BErgdjJE6NjKjHvUHa2EhkTWSnC7
	t02XT8Jv3aVYk4yIxYfq6TAFirciI5xXA1xOEkUM03XI76HSwDZ8N9GOAI1GzsFluX43ffre2Ge
	msxhB5PPcoURXuqjolJHWKtsNNzrvTvz0wXPkRNOpdp3ChC4kqymFnzSPa8ckz0EhGlEcSRna8A
	55qEeJ/krwaF9CVgicTVDZ80KgU2dzj8IzY5PSbg44XTEBkr+qtyg3A==
X-Google-Smtp-Source: AGHT+IGUr95wE+u93q0vSmOmXp2/y9tli6pPk887xnwSyMiOxxtfYzlWTj9sJPKnAhzf/3cHhtET5Q==
X-Received: by 2002:a05:600c:5395:b0:458:c059:7d9c with SMTP id 5b1f17b1804b1-459fa71d713mr92177285e9.6.1754915121583;
        Mon, 11 Aug 2025 05:25:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5d0b1afsm248013475e9.26.2025.08.11.05.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:25:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 11 Aug 2025 14:25:17 +0200
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm8550: Flatten the USB nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-topic-sm8x50-usb-flatten-v2-1-0bbb3ac292e4@linaro.org>
References: <20250811-topic-sm8x50-usb-flatten-v2-0-0bbb3ac292e4@linaro.org>
In-Reply-To: <20250811-topic-sm8x50-usb-flatten-v2-0-0bbb3ac292e4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4086;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=E6EpzJPTESLvnjqzhszJRKba7xo8Q4+acZhnQGMvoUU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBomeEv1lNuaeeR1zoBkMkCI01a0HE0ROxrrqcWa3Zk
 qKhbZP+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaJnhLwAKCRB33NvayMhJ0dQLEA
 CoWU7XsGGHWfzWFGnl5ydGcCnFK5TROYKBabhal8PsD5CZMQWATGKq5pB2zbwZGLdYbUiAQQNEt/Sg
 RJJ5kGDYj/FDx/Xq6+5EuXm7dLWzwy+Pseck46oxTQFjEJf3Cy5oIu/OWkjXKg5pV4lf+uApLVTYDB
 nOqY8jqBHhUM3ekCSpOvfjykSkmPb+eLZxXXPNnY8eqT6S6iXkwSWRtiCPkE6M3VlxRZgfuai+Vsqq
 ctIzWtpeWH2KGdRLE/4fxqhqZ87FeNZJYrZXRp1uqGUJZNL9/EynM+FqAz+BNtlMgBK1aINfybOPdz
 jPlRqW+DqJ5nRJOTJUWU26gRMz4quaGa8HQXBGtgFFWt/gqe6wkY8cCVPkMkkYeWdZ+cIH25n10D3u
 pyqSYQLYArqRfzaJz10pd4u7B7xnHY6sFDcJdBM0AhoNgqKs8an7SHe6QVt2ryrMhAEwH/nafDZ9TJ
 FytOrjc+eBQBwkalcQvSxL3jv5wc/CkUJMXdI8Z8Yo07xyXw0vMOtygn5OkUP8Kfmq5Hgn8y+fvLOy
 GIsR6C2lmAHWMrrGUFRtP93CRGuCogHhKNRyj7z7X/5mzlKLRZeOBPjfU7+KbJ9DzAb0mnq20ToeUr
 UJCNuf49GMurTKd61MrgTLN5jUHVB3EVR4tosrtlhF7kgWViCi1EQZghIYYA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Transition the USB controllers found in the SM8550 SoC to the newly
introduced, flattened representation of the Qualcomm USB block.

The reg and interrupts properties from the usb child node are merged
with their counterpart in the outer node, remaining properties and child
nodes are simply moved.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 84 ++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 45713d46f3c52487d2638b7ab194c111f58679ce..4f81a6fac6cc0a4fadce96e84c70a1c6dc52d8f3 100644
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
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
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


