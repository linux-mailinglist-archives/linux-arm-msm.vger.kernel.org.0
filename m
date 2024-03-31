Return-Path: <linux-arm-msm+bounces-15860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F30B892E7C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 05:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF0AEB21613
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 03:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC97F947A;
	Sun, 31 Mar 2024 03:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZUQWwJ2D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D611C0DFC
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 03:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711856941; cv=none; b=LVOsGTYg8oPJkgyoBPUCN/v3YktOUcJQdJqvmU32ZhlPl2wvX26dtmtZk0j9GA7p67TEF1iEqulB/zDMHgnb/Trnp+2mR3pC6VggxfCqaO0G7OwIp5i4+kQPjtyslvuolccmXA8a4swiegHjQgldDNCMlF++tL7LPRFkE6vPk8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711856941; c=relaxed/simple;
	bh=sFKrGZBWRp2+EGuhj/chCtTzPZ3MU2TwU02NxW+14vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QP+KyyUuPAIj3gMD4KQr78b6x5atCmR4eRy0k/W/PNxkPc/tZ5G0w56KjOEQzb3G9o4cnHUt0NbDvusHNjk3r8U1zsbP/qqPT34txrSmvU1ewwJxqXoiqWqlffzo/s4O1u+JUjkQ9bRMyfDB6uZrWF4989cCxlgdH/IkLYGwq6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZUQWwJ2D; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513da1c1f26so3662814e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 20:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711856938; x=1712461738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piQT5IzRdBgW7kJqPQ+vFxpxuzB/TA4xCkBFfjKv6ho=;
        b=ZUQWwJ2DjftoqXjtY4hUegnnJunHXs0hIwK4attxeE0nBsZ6CrCb4+HDqmPRex0XpQ
         FOaij2g9NlTIA2L0nVDG+qvlB5wH3JhQGrttejj2kT9HJYYcRp6rea+6RIHp+My3QOCE
         Nthr+8NldSevfKB4CxocghwGPP9MIhJI3WpMBymSx5eGi2fdvQMFuWB2/y+pRKExj+wR
         h1AmhJI/X7S5qbLE3UWCRCTXM5txUJhndr+rzRduKwJsd+hVpmaR+LcNHK4QvZ5F5jKU
         9OeDlsthEWkhRINYqNJxwufNHayhZQHjaYEF0SfcOrWRR2w2POl7rGZBkhcRJ46ycz2N
         PjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711856938; x=1712461738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piQT5IzRdBgW7kJqPQ+vFxpxuzB/TA4xCkBFfjKv6ho=;
        b=sT6cDaCDNFpI5mbHYee4UkYSz0k2hIfkxWSfNzjXdzlT9FsIrdF86OiAwAqYwh+bO+
         ZLPXHKh7Fbs2Fa0iHea0yIdR0TfYuixoMhwy4vWumAGssbuKdKslMGTiQsxmzufO8dE3
         DEyNbt+nA0z6SvNGx+E9Z4Szm/uWhYRhX2DHppVe4z3PmRPfb3YvMdvOW51dYd86Z7Bm
         8GfNb2NH5pGsRci3XS1BU5pRW+SPRTFFSm6RXnG8MacfYtN7PIQF+R7NmEQ8AC6Cy4uQ
         TWw8O/cdIfOUyON9gh8V83a6NsI0V867cLUOxS6SMB5RFzQG/zTIopyuZR/mGwIyj0hg
         MFbQ==
X-Gm-Message-State: AOJu0YyiyF79IJ+VvOuOe1SXu/gpBpUkfoeL0FylTMya5D2G2rNNRn31
	Ck3nQFfK2HJmfRFnD/8jc700GrYTfocB2HfATetXsT2jFYrByybJpwzMwSbQFU0=
X-Google-Smtp-Source: AGHT+IEcG5ROLd802DNIpU7lClsiBemX4e0BkCJVnkyXFj4gk2A47Y2A+KKC3ejdjhlWqv0j7pbegQ==
X-Received: by 2002:ac2:4109:0:b0:515:a530:d570 with SMTP id b9-20020ac24109000000b00515a530d570mr3448487lfi.59.1711856938094;
        Sat, 30 Mar 2024 20:48:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k9-20020ac257c9000000b00515ce9f4a2bsm762980lfo.35.2024.03.30.20.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 20:48:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 06:48:55 +0300
Subject: [PATCH v2 5/7] arm64: dts: qcom: sc8280xp: describe USB signals
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-typec-fix-sm8250-v2-5-857acb6bd88e@linaro.org>
References: <20240331-typec-fix-sm8250-v2-0-857acb6bd88e@linaro.org>
In-Reply-To: <20240331-typec-fix-sm8250-v2-0-857acb6bd88e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5467;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sFKrGZBWRp2+EGuhj/chCtTzPZ3MU2TwU02NxW+14vw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCN0lq1twDnz+WjmkbRVqam8roFsA+2Je63Dr7
 5s2qwhC8baJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgjdJQAKCRCLPIo+Aiko
 1f6VB/4jqUAE1d0DUyhtCjLX2ugm38c/5SWg1OwjNkyskA7yiG1UOWdgHpYVYrGzNo/q3nGfepT
 ncy5iUlFIXRkffix8tLpMaZjYax5ooDzG6G7z7AzjdhDlJ6Y2jJPb3He9i6jBSBrcPLEdWiq0xJ
 vklaJvzlqvuihUAZ1dMNeGReeqVsUBAWiJVsuDZo9/pv4f08r24OO9NqCrJ+j/FEOlwURIr8RGS
 0DrMVL8YizG8+iymXLE3tusnQV1PFz70TyMZuhyduur/0PSxnenmDERMQY6dIWw+GWmTksG9soQ
 wwC0ZtgzvbcOAwhjNQ68BM3KcEIdM0iKbj76fyQ0g2ZJzlMp
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
index 15ae94c1602d..53252bb93d9e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -115,7 +115,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_con0_hs: endpoint {
-						remote-endpoint = <&usb_0_role_switch>;
+						remote-endpoint = <&usb_0_dwc3_hs>;
 					};
 				};
 
@@ -150,7 +150,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_con1_hs: endpoint {
-						remote-endpoint = <&usb_1_role_switch>;
+						remote-endpoint = <&usb_1_dwc3_hs>;
 					};
 				};
 
@@ -1102,6 +1102,10 @@ &usb_0_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_con0_hs>;
+};
+
 &usb_0_hsphy {
 	vdda-pll-supply = <&vreg_l9d>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1127,10 +1131,6 @@ &usb_0_qmpphy_out {
 	remote-endpoint = <&pmic_glink_con0_ss>;
 };
 
-&usb_0_role_switch {
-	remote-endpoint = <&pmic_glink_con0_hs>;
-};
-
 &usb_1 {
 	status = "okay";
 };
@@ -1139,6 +1139,10 @@ &usb_1_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_con1_hs>;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l4b>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1164,10 +1168,6 @@ &usb_1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_con1_ss>;
 };
 
-&usb_1_role_switch {
-	remote-endpoint = <&pmic_glink_con1_hs>;
-};
-
 &vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 9f6d98fbc28e..41caa8713cfd 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3164,6 +3164,14 @@ port@0 {
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
 
@@ -3217,6 +3225,14 @@ port@0 {
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
 
@@ -3420,8 +3436,23 @@ usb_0_dwc3: usb@a600000 {
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
@@ -3482,8 +3513,23 @@ usb_1_dwc3: usb@a800000 {
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


