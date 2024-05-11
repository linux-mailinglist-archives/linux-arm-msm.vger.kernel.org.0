Return-Path: <linux-arm-msm+bounces-19750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B268C346F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 00:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E19AB213CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 22:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB0F5D8E4;
	Sat, 11 May 2024 22:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PvQ2HEt0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8C456B7C
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 22:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715465060; cv=none; b=P+tE/WxZxUPOqkx5Tvz1hjncq6Glet/EifeIOQelMR2ZDoDLqjjhVcFnO3prn3TYhAzMmD4TMuoSbGGn8Huc/gRqaznqdVAa9h+md7fM9ytVBTDvyDXwrvV/kjvyqbyWenN/wcteHqCOktBg0HHpiLjBfELOyEbN3NgrRwtz1eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715465060; c=relaxed/simple;
	bh=AlpynXXpJZSHjm7LZQziISspOSwbAivaAe6/Z8RjxRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMpjB+H7iJTir2HRnRPpd1vYe6idrPar1PLb8j/tB55YiKCmJeXnBiVs4qZSNujKodNENkbem1dwPPwt/hXueBVSN3zS5UBGmxPxJEqWsL+PMjLxIvKJClfMCr0I7/mYmaPbH7+KixK4bC3VwLNag2Jhm3xFP6oNMHaSsr7bboM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PvQ2HEt0; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51fcb7dc722so2940767e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 15:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715465055; x=1716069855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FniD+DfIhC5m8cA+8LhWMdJv+AA1Hxyt107B4ClXQls=;
        b=PvQ2HEt0dCfX4MlzeQIEsbIlRY3boME5ioZPMqABqayK6ARiRyG252FWJqviEEySTK
         sHTa29Dui2BJIKhPCjRHrR5O5B8UsxYUwwPMb9QJanGek3A6j6qAeyBIlv6PjrbtROpf
         PgDkqsF2lE+vH3XXst3J6pYvf3e80/LrpFLJQ3cKKV76jKe5WsxUs9A+1mpVhf7LgFTu
         svCC/t2Ib7ZxM36vqBoKLCxY9tpc7sFCBVR7bdbcg4ZxsEManEOS9TZBMsYbAFizKysF
         HlXkAJW4gaBLwlU2fKuCZnOgXjJ8S3VSceD66JawNXfqsgFiE6QbC3nC34qR5d0fjBEk
         OGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715465055; x=1716069855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FniD+DfIhC5m8cA+8LhWMdJv+AA1Hxyt107B4ClXQls=;
        b=rmP0U/Cb9mnX4wHX+MqiU4Zmn0bhFk+uVL2Y1ysbxEVNocGkjkRUQB7Wtcz2vehMcx
         xeowxEekkAiOKFJXDvbN/88WjFzJrhX1+eItof71De2mb3i5vGmVtvn3TjnZtgHak+Py
         A2WVtFegRrP6/ZwIRtbHuADEUNMkiURTCY3QraW0Y46TimFDAR9iIS7KTUt6vL8fpQ5D
         e0WoYhwqxBuqhFewlF34UTBpmtk7occoeQcuTAJiwgITPV2KBGxHbQtXE6S6SZD4kLGD
         bpoxYxi5oePMK8hDXoHDuqAlMvALHnxIHh1hFAThilEJuXF4DSl3Dyc3ThWAEQtv2YN8
         r8jA==
X-Gm-Message-State: AOJu0Yx85cCqBui+alAmo1/hErgUUtUdvy8M/yZUrmyBB3Yyuy3RV0eU
	CBVsUr0r3gpfTx56NcHIVvxsqtbe9KbLMeP6kSR9w5DmZVw3RmuDtk5bgUqkpKk=
X-Google-Smtp-Source: AGHT+IEWBvncLbuzBRWNYYBz4ED6Z7cMcKUUHTuSsQt/0awRnk+3OqSjM2feqUq0yNLrg9f6PcsHTg==
X-Received: by 2002:a05:6512:10ce:b0:520:1679:f679 with SMTP id 2adb3069b0e04-521e0f4efc1mr3634177e87.20.1715465054580;
        Sat, 11 May 2024 15:04:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d878fsm1123875e87.206.2024.05.11.15.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 15:04:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 01:04:13 +0300
Subject: [PATCH v4 7/9] arm64: dts: qcom: sc8280xp: describe USB signals
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-typec-fix-sm8250-v4-7-ad153c747a97@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5407;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AlpynXXpJZSHjm7LZQziISspOSwbAivaAe6/Z8RjxRM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP+tYPAib342t1j5xaJoi2bMg2ctSDeRBaK0Bu
 aVEXb7It+WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/rWAAKCRCLPIo+Aiko
 1V9HCACNT29hMpiPAaDuO2/R3PYWwXMKWsVHbhy9f9+soIojUnYDKk0eSo6sRbQexr0IufoE9UL
 0IpvJbBQq7PMQWhEkANmfm9EHMbnD++/FiNJmpuDkuOH+EWjkiQ2ahI5UyWsHor1KK9kdVTI8BK
 350/RYBlpEvAB9xXbjCWmki5l8fFyLJ8Wg2OwKwuBqdMjSlef4Xx0DZVc7y9Op54K6mRqdM3oNB
 SkyLuHNLfpdLZ+WUjsh0zFh1C01KONmCkTebdMzhN3smAYzYUNmVGcv9FUMIz70EGMaMmtT2CDY
 3HC3x29PK3U7LEy1EsaHt0q4zN6qBnbsrcWiEH3BUQ2RfTWB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow example of other platforms. Rename HS graph nodes to contain
'dwc3_hs' and link SS lanes from DWC3 controllers to QMP PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          | 20 ++++----
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 20 ++++----
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 54 ++++++++++++++++++++--
 3 files changed, 70 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 41215567b3ae..a2627ab4db9a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -56,7 +56,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_con0_hs: endpoint {
-						remote-endpoint = <&usb_0_role_switch>;
+						remote-endpoint = <&usb_0_dwc3_hs>;
 					};
 				};
 
@@ -91,7 +91,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_con1_hs: endpoint {
-						remote-endpoint = <&usb_1_role_switch>;
+						remote-endpoint = <&usb_1_dwc3_hs>;
 					};
 				};
 
@@ -675,6 +675,10 @@ &usb_0_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_con0_hs>;
+};
+
 &usb_0_hsphy {
 	vdda-pll-supply = <&vreg_l9d>;
 	vdda18-supply = <&vreg_l1c>;
@@ -700,10 +704,6 @@ &usb_0_qmpphy_out {
 	remote-endpoint = <&pmic_glink_con0_ss>;
 };
 
-&usb_0_role_switch {
-	remote-endpoint = <&pmic_glink_con0_hs>;
-};
-
 &usb_1 {
 	status = "okay";
 };
@@ -712,6 +712,10 @@ &usb_1_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_con1_hs>;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l4b>;
 	vdda18-supply = <&vreg_l1c>;
@@ -737,10 +741,6 @@ &usb_1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_con1_ss>;
 };
 
-&usb_1_role_switch {
-	remote-endpoint = <&pmic_glink_con1_hs>;
-};
-
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index e937732abede..cd914fffcf06 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -117,7 +117,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_con0_hs: endpoint {
-						remote-endpoint = <&usb_0_role_switch>;
+						remote-endpoint = <&usb_0_dwc3_hs>;
 					};
 				};
 
@@ -152,7 +152,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_con1_hs: endpoint {
-						remote-endpoint = <&usb_1_role_switch>;
+						remote-endpoint = <&usb_1_dwc3_hs>;
 					};
 				};
 
@@ -1131,6 +1131,10 @@ &usb_0_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_con0_hs>;
+};
+
 &usb_0_hsphy {
 	vdda-pll-supply = <&vreg_l9d>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1156,10 +1160,6 @@ &usb_0_qmpphy_out {
 	remote-endpoint = <&pmic_glink_con0_ss>;
 };
 
-&usb_0_role_switch {
-	remote-endpoint = <&pmic_glink_con0_hs>;
-};
-
 &usb_1 {
 	status = "okay";
 };
@@ -1168,6 +1168,10 @@ &usb_1_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_con1_hs>;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l4b>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1193,10 +1197,6 @@ &usb_1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_con1_ss>;
 };
 
-&usb_1_role_switch {
-	remote-endpoint = <&pmic_glink_con1_hs>;
-};
-
 &usb_2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 0549ba1fbeea..e87196b2ace0 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3222,6 +3222,14 @@ port@0 {
 					usb_0_qmpphy_out: endpoint {};
 				};
 
+				port@1 {
+					reg = <1>;
+
+					usb_0_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_ss>;
+					};
+				};
+
 				port@2 {
 					reg = <2>;
 
@@ -3275,6 +3283,14 @@ port@0 {
 					usb_1_qmpphy_out: endpoint {};
 				};
 
+				port@1 {
+					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+
 				port@2 {
 					reg = <2>;
 
@@ -3560,8 +3576,23 @@ usb_0_dwc3: usb@a600000 {
 				phys = <&usb_0_hsphy>, <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 
-				port {
-					usb_0_role_switch: endpoint {
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_0_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_0_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
+						};
 					};
 				};
 			};
@@ -3622,8 +3653,23 @@ usb_1_dwc3: usb@a800000 {
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 
-				port {
-					usb_1_role_switch: endpoint {
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
+							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+						};
 					};
 				};
 			};

-- 
2.39.2


