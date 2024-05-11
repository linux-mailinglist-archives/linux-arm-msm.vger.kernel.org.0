Return-Path: <linux-arm-msm+bounces-19748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C658C3467
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 00:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B79B1C21013
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 22:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB24F55C08;
	Sat, 11 May 2024 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndLg/Gek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD47546522
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 22:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715465056; cv=none; b=KkGqwDV2uMT/+A4tF6qGyEFgBA8hiEm/2Ydz3ERSgtU+Bfyb7XPgOPqI+WKSLtpE48VzBXJqdnwDCOAcBmMJf8E7PZXwcyV8YppjhB6pEmj2X4A6jEmKxKh8PelYZRnH3WB4prnuhuY1KIcb/EIKfJRE0kcjeiQfrYW9QAuIkrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715465056; c=relaxed/simple;
	bh=hVvfvlT0rTVoTQnAQO6OY0YYd59DO6aFyNFsg5mz/Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/Lvd/AeAz7qDyhSbtq4iiJX88XIX/Xq9QAIw3sqvzPXAbWx2btFKMfyO8krgDpxhQD2NxQQO6YpvgeauEqKXPJuL7xJdgZQ1nU+UFkNPL4TIgkh8vT02r/pfooSVTCfDIE4ZbovD43R6ft90uHTF3IQiymIx/U76AJK9UHOOYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndLg/Gek; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51f17ac14daso3688406e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 15:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715465053; x=1716069853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9qo3xIojnnkSqyd6PmjGL/rK5eEsRYHclhwjeAFQxA=;
        b=ndLg/GekCjijqV/p1CXjCtyth9xRxujnno/JaJwKSXCgbndCxrXxu5yzDBB3Xu9iVX
         L8CNgiB6cMhFaBoE+8O1Ry7hvQY21N5rAHzjmDsHrGGoMhmGPil6ctcV+NcM0OOCAj5W
         eSZOIjYcUZOKWdEPBHtYXXgykIc/LH+aNam4ldkDMnt6FHKo5FO+QtR2x/SV5I7Sn3Uz
         1ul2oKICr5D7KAYe/j0WWFVgwwqT/3mUB9k65EisvEgf3HNyqwmXMhC/qTeFkFohkYG5
         CGgW1cQzNbQG5KmD45cXhwtgcsT4WpCAvOlsjvHb8jXD85FW/Ks2C8OhCqhMGwH4YwDp
         5ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715465053; x=1716069853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9qo3xIojnnkSqyd6PmjGL/rK5eEsRYHclhwjeAFQxA=;
        b=Ih71tlkpU1OCszI71pSUy7ncd0391GmcA/o6WPwo+Eo9obu+d4w3izoaKwZCEm35zL
         c7z57LG4y/pxwXzl1hNwiTzzlNX8aOEz4kBiSCO92e1pHLn4CYgJJHFBzCccjI3dQ2t1
         cMUdOxYG7aRffgKCimWSoa9aut9OoT1kuZeBxNWgYj1PQ5dJ3HxpwakFYNd64MemvQJp
         GeXdMH7KXjL5yzV5PaSi9hJgP4yWF+jrhGHE8ZkVjN+HHJ0FT9xOwkTKDay0nXl1frXD
         kO0CTjVNINDyplXOgWWtWowAMVqtjcU2iWuOFATkxmseubIYYi3PFQbN6g/U20NX0Wux
         o1tQ==
X-Gm-Message-State: AOJu0Yw+MjlgdsF8KfTErUvO5gEbuQg4UYGkZ1DczSjufb1b/b3att5m
	z9SX7ipsAX3pK/g5aL1PsDa8NRjMz0T46R4RvX5iEe/CXIrJRh8JfOC6/OeJjtk=
X-Google-Smtp-Source: AGHT+IFTcFY3BZtCUzClHuacmb3lnGezviOqBcffAbZv4EoQVO1ce1TKzZVFczdU2zUQqR+dUVEiug==
X-Received: by 2002:ac2:4651:0:b0:520:ed4e:2200 with SMTP id 2adb3069b0e04-522100749e7mr3164276e87.54.1715465053164;
        Sat, 11 May 2024 15:04:13 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d878fsm1123875e87.206.2024.05.11.15.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 15:04:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 01:04:11 +0300
Subject: [PATCH v4 5/9] arm64: dts: qcom: sc8180x: switch USB+DP QMP PHYs
 to new bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-typec-fix-sm8250-v4-5-ad153c747a97@linaro.org>
References: <20240512-typec-fix-sm8250-v4-0-ad153c747a97@linaro.org>
In-Reply-To: <20240512-typec-fix-sm8250-v4-0-ad153c747a97@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7378;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hVvfvlT0rTVoTQnAQO6OY0YYd59DO6aFyNFsg5mz/Js=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP+tYNmwzw3jfHOdsMUIbalRCLS7pJ5F99GTaV
 v9KW7Uum7CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/rWAAKCRCLPIo+Aiko
 1SN/B/4nObihuFgyMeA5OlhDW9VVXj1c0dyViz+Hll1bnheQURwcWj/MSCHBmrokPSwRgR96vMS
 SLzYAu0TZs1dvkw9ZjiNDqrXVEbQ25A2RnPf4kcRaxOYowGqxvM2R9narvuki8R6pllda6t6yuS
 76Dhgf7yW5o+uNqRrO4lQrt6UoOVzV7W4mcp0jPJwPMQENgD1NwUORUzN6Av8pgntwbi2TVqAMF
 wrc+iS0nLq+ZU+fdQoseYnsmGn4y8q79AmeEAfS5MQXvVJlnhuhKOUAkxH11822yGGg0UD/LtpE
 0QRhvCxJdC1WQSQG5J/l4w0ft67fwwoUOxsaT/smvBEjqsiF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

To follow other Qualcomm platforms, update QMP USB+DP PHYs to use newer
bindings rather than old bindings which had PHYs as subdevices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 122 ++++++++++++----------------------
 1 file changed, 41 insertions(+), 81 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index b92b6fb73057..897c0f51a612 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8180x.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -2511,28 +2512,25 @@ usb_sec_hsphy: phy@88e3000 {
 			status = "disabled";
 		};
 
-		usb_prim_qmpphy: phy@88e9000 {
+		usb_prim_qmpphy: phy@88e8000 {
 			compatible = "qcom,sc8180x-qmp-usb3-dp-phy";
-			reg = <0 0x088e9000 0 0x18c>,
-			      <0 0x088e8000 0 0x38>,
-			      <0 0x088ea000 0 0x40>;
-			reg-names = "reg-base", "dp_com";
+			reg = <0 0x088e8000 0 0x3000>;
+
 			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
 			clock-names = "aux",
-				      "ref_clk_src",
 				      "ref",
-				      "com_aux";
+				      "com_aux",
+				      "usb3_pipe";
+
 			resets = <&gcc GCC_USB3_DP_PHY_PRIM_SP0_BCR>,
 				 <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>;
 			reset-names = "phy", "common";
 
 			#clock-cells = <1>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			#phy-cells = <1>;
 
 			status = "disabled";
 
@@ -2546,59 +2544,38 @@ port@0 {
 					usb_prim_qmpphy_out: endpoint {};
 				};
 
+				port@1 {
+					reg = <1>;
+
+					usb_prim_qmpphy_usb_ss_in: endpoint {};
+				};
+
 				port@2 {
 					reg = <2>;
 
 					usb_prim_qmpphy_dp_in: endpoint {};
 				};
 			};
-
-			usb_prim_ssphy: usb3-phy@88e9200 {
-				reg = <0 0x088e9200 0 0x200>,
-				      <0 0x088e9400 0 0x200>,
-				      <0 0x088e9c00 0 0x218>,
-				      <0 0x088e9600 0 0x200>,
-				      <0 0x088e9800 0 0x200>,
-				      <0 0x088e9a00 0 0x100>;
-				#phy-cells = <0>;
-				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_prim_phy_pipe_clk_src";
-			};
-
-			usb_prim_dpphy: dp-phy@88ea200 {
-				reg = <0 0x088ea200 0 0x200>,
-				      <0 0x088ea400 0 0x200>,
-				      <0 0x088eaa00 0 0x200>,
-				      <0 0x088ea600 0 0x200>,
-				      <0 0x088ea800 0 0x200>;
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
 		};
 
 		usb_sec_qmpphy: phy@88ee000 {
 			compatible = "qcom,sc8180x-qmp-usb3-dp-phy";
-			reg = <0 0x088ee000 0 0x18c>,
-			      <0 0x088ed000 0 0x10>,
-			      <0 0x088ef000 0 0x40>;
-			reg-names = "reg-base", "dp_com";
+			reg = <0 0x088ed000 0 0x3000>;
+
 			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
-				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
+				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
 			clock-names = "aux",
-				      "ref_clk_src",
 				      "ref",
-				      "com_aux";
+				      "com_aux",
+				      "usb3_pipe";
 			resets = <&gcc GCC_USB3_DP_PHY_SEC_BCR>,
 				 <&gcc GCC_USB3_PHY_SEC_BCR>;
 			reset-names = "phy", "common";
 
 			#clock-cells = <1>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			#phy-cells = <1>;
 
 			status = "disabled";
 
@@ -2612,37 +2589,18 @@ port@0 {
 					usb_sec_qmpphy_out: endpoint {};
 				};
 
+				port@1 {
+					reg = <1>;
+
+					usb_sec_qmpphy_usb_ss_in: endpoint {};
+				};
+
 				port@2 {
 					reg = <2>;
 
 					usb_sec_qmpphy_dp_in: endpoint {};
 				};
 			};
-
-			usb_sec_ssphy: usb3-phy@88e9200 {
-				reg = <0 0x088ee200 0 0x200>,
-				      <0 0x088ee400 0 0x200>,
-				      <0 0x088eec00 0 0x218>,
-				      <0 0x088ee600 0 0x200>,
-				      <0 0x088ee800 0 0x200>,
-				      <0 0x088eea00 0 0x100>;
-				#phy-cells = <0>;
-				clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_sec_phy_pipe_clk_src";
-			};
-
-			usb_sec_dpphy: dp-phy@88ef200 {
-				reg = <0 0x088ef200 0 0x200>,
-				      <0 0x088ef400 0 0x200>,
-				      <0 0x088efa00 0 0x200>,
-				      <0 0x088ef600 0 0x200>,
-				      <0 0x088ef800 0 0x200>;
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-				clock-output-names = "qmp_dptx1_phy_pll_link_clk",
-						     "qmp_dptx1_phy_pll_vco_div_clk";
-			};
 		};
 
 		system-cache-controller@9200000 {
@@ -2711,7 +2669,7 @@ usb_prim_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x140 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_prim_hsphy>, <&usb_prim_ssphy>;
+				phys = <&usb_prim_hsphy>, <&usb_prim_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 
 				port {
@@ -2768,7 +2726,7 @@ usb_sec_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0x160 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_sec_hsphy>, <&usb_sec_ssphy>;
+				phys = <&usb_sec_hsphy>, <&usb_sec_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 
 				port {
@@ -3086,9 +3044,10 @@ mdss_dp0: displayport-controller@ae90000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-				assigned-clock-parents = <&usb_prim_dpphy 0>, <&usb_prim_dpphy 1>;
+				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
-				phys = <&usb_prim_dpphy>;
+				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
@@ -3163,9 +3122,10 @@ mdss_dp1: displayport-controller@ae98000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
-				assigned-clock-parents = <&usb_sec_dpphy 0>, <&usb_sec_dpphy 1>;
+				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
-				phys = <&usb_sec_dpphy>;
+				phys = <&usb_sec_qmpphy QMP_USB43DP_DP_PHY>;
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
@@ -3312,12 +3272,12 @@ dispcc: clock-controller@af00000 {
 				 <&mdss_dsi0_phy 1>,
 				 <&mdss_dsi1_phy 0>,
 				 <&mdss_dsi1_phy 1>,
-				 <&usb_prim_dpphy 0>,
-				 <&usb_prim_dpphy 1>,
+				 <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <&edp_phy 0>,
 				 <&edp_phy 1>,
-				 <&usb_sec_dpphy 0>,
-				 <&usb_sec_dpphy 1>;
+				 <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 			clock-names = "bi_tcxo",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk",

-- 
2.39.2


