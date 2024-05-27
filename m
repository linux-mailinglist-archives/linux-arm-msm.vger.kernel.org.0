Return-Path: <linux-arm-msm+bounces-20543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D5C8CFB06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 10:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EF3E280F99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 08:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E985787B;
	Mon, 27 May 2024 08:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lh2gEfGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF914778E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716797266; cv=none; b=L23h70Q5Wtqlt4tgjP7PqT+3lsOpll1CQMPzwEYOmU4iH4RcpgbcBBJHk8shN6kzZaideCeXiREA68+g9r24H6WTeT4MzBwYNQdge3qVJxHheB3spCcl8Fak1gKNg8DD2/secGTtIMLtEywcyQi7qcsR51sqSnzyTv2OJpnjKMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716797266; c=relaxed/simple;
	bh=XI2FDb/7NtFHwP6ncH4VK34anbbKyDSEs2qwvfVMI3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=srXVFLpmM3GfT4Ea2h9LtegJAKjNFzcSlLyWlWgk7thpmdlx4mjhhkEItN/dL51g6EA/EWtWZFcgbFMmtPjwPL50KvPYP7U3OfaWJZVtPsGt1ukZhJj1MNFH2bBaVv9isAYBYm0ALliNEipFfadXqPxwiUqPJHUU97wknZlnUoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lh2gEfGI; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5785fc9c543so2887133a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 01:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716797263; x=1717402063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w794Jc9ulQoga5+/dsXAFbxB9u1U937YIUKTLLXw2s4=;
        b=Lh2gEfGIng01ToyPe7ZDFfM5aYQoF2H/SId04ePgDSpiuj9SHxe9MnvXaQEDJAGbFo
         +xoQ5SQY10oRHkge0yVkYYxjjwni7pFlJrgguivcKs/y8sV16/HN8/6ZbsEvs3bOOqhs
         xPVigwxooGvKCKicBFiD0LI9sbr0/uvAbQVFGIr7hAhUpnsiRWvU7Fdh/ZF+9+ocoXO/
         cR5coEcjmzNLLWZkJGbuHnXYlz0k3CQ8mUu6Mgl95YsSJ7R7oBHtKZzzwQwUCDYmTKvM
         heiB2DEa1jjUNgIT2Jlw/AGhxcCMWxHZsaOp2xPa5NrnspSb2HnHvIAE1eqWj6exfocs
         H5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716797263; x=1717402063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w794Jc9ulQoga5+/dsXAFbxB9u1U937YIUKTLLXw2s4=;
        b=IDVuWMUjM3TLoPBZFqYPzMZhhv8fL3WlCAnTxfuOeTs7Smd/z4QDsd0w2R0DGZfFjm
         Z7SiJ75OVcJmN9kTQo2YPmXRofMTpnQCexFqKKuzdWzXqwUliQNiAR0gSI0p+zIPd/1k
         B1ceptk+5vDzXACbrtLd+uuvsRIoxxDW/tXW7R/BSJ0tqFluWmThpClkAlT3Sxu2dsgF
         Hv7A8CqQ9lRIAoWDLZqkC72bNXju5IYOXnLWs4KLFTFcmSdMZRR61kJxANGL/6aw+Ncx
         sdWNv3FSrbJC3Xy+yIsju576Y6OM+D0y7ea3gZDDtVjZK2Umk4bL2DaKVJwsVe8Y/rZ6
         UJWw==
X-Gm-Message-State: AOJu0Yw+Ai8J4HdL+tIdswMmvGSuwCOJljXBL85DGxTw6Yu23DWtUPqH
	VJoqkgdiwI7WGB34UloNi6dMH26upp1L4M60oIwbNS+sQJSDYWzlk/n8mNHqzs8tZBnpDrVjdG5
	8
X-Google-Smtp-Source: AGHT+IHO6xpHvKtn4O43UeuIe2iUm+SXjZCQWp8L1B2yzeSGdV4oZrBT948cCyAZlkVeAr4aTiA9Ww==
X-Received: by 2002:a50:c2d2:0:b0:578:42fb:a4d with SMTP id 4fb4d7f45d1cf-578519aa3ffmr8537851a12.30.1716797263231;
        Mon, 27 May 2024 01:07:43 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579d30b82a8sm1240893a12.79.2024.05.27.01.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:07:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 May 2024 11:07:29 +0300
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Add pmic-glink node
 with all 3 connectors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-x1e80100-dts-pmic-glink-v1-3-7ea5c8eb4d2b@linaro.org>
References: <20240527-x1e80100-dts-pmic-glink-v1-0-7ea5c8eb4d2b@linaro.org>
In-Reply-To: <20240527-x1e80100-dts-pmic-glink-v1-0-7ea5c8eb4d2b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3938; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=XI2FDb/7NtFHwP6ncH4VK34anbbKyDSEs2qwvfVMI3g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmVD9JIuGpagS3kazFLBrzcKj2DLF0EHbtHf0rU
 SV4Qc3h1I+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZlQ/SQAKCRAbX0TJAJUV
 VgzAD/kBAvCtqp7dxEI+ETdOOMzYGNvCFspkEHntdq7NDIgZDl+JP89mL8Fj63BrC9cLZSz3brE
 ZTlfUYCtZalbXVtev2aq3qDyhceGRn22umNclV8Dc20psnpukQach25zkGcpj4wiathGYOVgPP8
 raI2yigxzh8u8T1BcU0lern4fqemL8T+EpykIgfRGbvK53PgMrmg/ANlHPijRIUBUvXgA7birrm
 j+D+s13ObQa8rBtBE9QlbYKU5OefC5s0/hrbJakVGlwnIP+R88Mo+PvV20p6f6411Ubh5HoNcE9
 EOo612QAdAMLveGyyG4UOySRfELY745oTwj3Vho+++zu1hg8rbWyEXEIgkgIkFE34cB6eOE+S1t
 TsTY3sjmSPYR1nGC4uNV/i/ZLWEdJqv0S45yQ54hwte7TdQBTay+PppVbNc8wz+tPOoC9HG7sCY
 ZVPrJ/1woFV1AwtZ4WxJ74qTPhvMdFj6abcZXi+Uu3NnsXxZ1c/6kD0HAcMqmlEWKaS7TsAwKuk
 ekF8Qqj+ZI9b15tjqsftoVZcrwVjf1hHOwAyy55nxptPC4NGAaZ4vgbeaEPG4NThvHdP3kmMRTX
 55HRrv3jE/cmVHeHg+sXQ8U1e8YIBK8Wlf70CdFguo4YZ5Cg4ybo/b17TzO15YBdAaNaLKi5IKH
 D7UfhJMStBLsj3w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add the pmic-glink node and describe all 3 USB Type-C connectors. Do this
for USB only, for now. The DP port will come at a later stage since it
uses a mux.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 143 ++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 2061fbe7b75a..a7eecf84b6d6 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -23,6 +23,101 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	pmic-glink {
+		compatible = "qcom,x1e80100-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss0_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss0_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss1_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss1_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@2 {
+			compatible = "usb-c-connector";
+			reg = <2>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss2_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss2_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss2_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss2_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 
@@ -548,6 +643,22 @@ &usb_1_ss0_dwc3 {
 	usb-role-switch;
 };
 
+&usb_1_ss0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss0_hs_in>;
+};
+
+&usb_1_ss0_dwc3_ss {
+	remote-endpoint = <&usb_1_ss0_qmpphy_usb_ss_in>;
+};
+
+&usb_1_ss0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+};
+
+&usb_1_ss0_qmpphy_usb_ss_in {
+	remote-endpoint = <&usb_1_ss0_dwc3_ss>;
+};
+
 &usb_1_ss1_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
@@ -570,6 +681,22 @@ &usb_1_ss1_dwc3 {
 	usb-role-switch;
 };
 
+&usb_1_ss1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss1_hs_in>;
+};
+
+&usb_1_ss1_dwc3_ss {
+	remote-endpoint = <&usb_1_ss1_qmpphy_usb_ss_in>;
+};
+
+&usb_1_ss1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss1_ss_in>;
+};
+
+&usb_1_ss1_qmpphy_usb_ss_in {
+	remote-endpoint = <&usb_1_ss1_dwc3_ss>;
+};
+
 &usb_1_ss2_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
@@ -591,3 +718,19 @@ &usb_1_ss2_dwc3 {
 	dr_mode = "host";
 	usb-role-switch;
 };
+
+&usb_1_ss2_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss2_hs_in>;
+};
+
+&usb_1_ss2_dwc3_ss {
+	remote-endpoint = <&usb_1_ss2_qmpphy_usb_ss_in>;
+};
+
+&usb_1_ss2_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss2_ss_in>;
+};
+
+&usb_1_ss2_qmpphy_usb_ss_in {
+	remote-endpoint = <&usb_1_ss2_dwc3_ss>;
+};

-- 
2.34.1


