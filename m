Return-Path: <linux-arm-msm+bounces-15863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC8B892E80
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 05:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 058051F218C3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 03:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DC6C8E0;
	Sun, 31 Mar 2024 03:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y3jU0THa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F87A79DC
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 03:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711856943; cv=none; b=WCvgurnZdZ4Y+tNQoEI8xZgmvDj21LYAL8P7U5Swb14ZT7M2hrpNw6VpUA83/wyfBjZB1xp2VB3CdRgBkt4TsHlZYYEfJlkRolHF99Uhwx0cE0zlu4Cfhs39phVqDEn570UD+IaVgkNF7C6cnG8FyKbpbVUuCebhAJUnki0pmEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711856943; c=relaxed/simple;
	bh=TBIiNNBgZICGeD+NJeW5hxRyvvEMnqmHX98cdDr1ewo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c++wrdvk1rjM6sYiOdP/QudRj03mDQxLRflIf0InZMo2E7UipAVCPHEcluc55UUPuhDE4Rjk2m8kCk29FNL4BZugajUgkttYxNU8bnCl9PbQEdO4gB+zlEyZYzT4eZV6JVTb5K32O85dqnEcW/n3WZ9FEDpqwQ8cG7kvu5IJzy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y3jU0THa; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-515a68d45faso3137756e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 20:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711856938; x=1712461738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=likv4eu7xKsHRY+ZmHx+zM6NgK/jlhd2B+FPr4klQxA=;
        b=y3jU0THatgx0ay46rJ1wyR59VuJV3TrEb5pKTc154g3c0oZUtpUXBK4r4s6o0rP2dp
         jTvdJEV1omNhQESJn5JGXApk5ZAT1gq2B6SlvQNuXUlwR8VpTwJbJtJFBVarmsL3xi0X
         01xvR3vC1UxUsnP9ENkZgEUJ+Kmry7ocaBOfiPvnkDDmUHg9fRPg2i3pRsB9QZ4orvJM
         M+w/CHFnEur6i+2zevAP6eAZU1v14lU0L2CF2X/n4g1zFYcCezHKgcB6O5UiXiG9KXag
         pzxc4jcFrGBrDN918QSSOsN3Ko1bcPL7sB03jjd49VZ2jJZWMYsXTWtwjU3MGY0/3lLx
         xWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711856938; x=1712461738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=likv4eu7xKsHRY+ZmHx+zM6NgK/jlhd2B+FPr4klQxA=;
        b=FELuG68E9LE/u6xEt1aygwqT8vNn5yQlevQa0VOd6/d4iTcOQvb6KWKgwLa8usrGXn
         sPQrV7aTKEf1UzVXT1tjmlxg/DYOr2qQ1Xp2PKtmZ7HVMRUs5WVBZR/yu9TMCALsmVsW
         L1AE1UmujZV6VPHgAJNN3TDAkycCcdg0wB3gJU4nKMufP+ZxJJYWDGId4wJJ/NWKjr3M
         qn/PiAS7kCRMuHPCL3QxwcYNvtl9U9f3eoqh4ONT7u4rj/ztS7fjm7fgwcpVp6PSZ/tP
         BwgrB2wK7Y7b0M7LNDUzWtT4WgNIYziKzzVsItFQXCePVYVFDZhxBwcGw4vwGr7oi/ug
         YZww==
X-Gm-Message-State: AOJu0YzWXkfpBAc38RnYk2cY05AhclJlZtEKXJCVetOFPRcrlcP3pa5T
	fKlFWy3Tv7amxdI7r9tvzwGnAiOhcvnfp4JolUbVcQqA+4AErg3j8EF9G0XFsDc=
X-Google-Smtp-Source: AGHT+IFP2RiABVbRp9DIzRPWooq3AnMTyp3nSEM2T4UIv/zC4NwB9i0Wjl+Enin7JWvM/a5PHyIvrQ==
X-Received: by 2002:a19:ca49:0:b0:513:e27c:78f4 with SMTP id h9-20020a19ca49000000b00513e27c78f4mr3680956lfj.53.1711856938707;
        Sat, 30 Mar 2024 20:48:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k9-20020ac257c9000000b00515ce9f4a2bsm762980lfo.35.2024.03.30.20.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 20:48:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 06:48:56 +0300
Subject: [PATCH v2 6/7] arm64: dts: qcom: x1e80100: describe USB signals
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-typec-fix-sm8250-v2-6-857acb6bd88e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4103;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TBIiNNBgZICGeD+NJeW5hxRyvvEMnqmHX98cdDr1ewo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCN0lNMYWHl/dxGdMNsYy7GyioANCW98Nddfrb
 k+PV6tUfReJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgjdJQAKCRCLPIo+Aiko
 1XCqB/9TClEOyOW/yOs63+nvWj9S9N+yOgX996z3EUt1ro73G7ZrHt+ovlYkNdf6EtUuDWTLSDt
 QdspNSp1el45sYDwJmKhHnPSX9BBXxwuCXnL2qTQM/ugOnT1H+WPl3yAc18HVBdmW04uAG+8Rvw
 NoM7ZA4o86Iwape8uHi2fCNBcOHzSUFFTHJblzjdAr4S0mHfR5w4RWCC7N28wP6R3ZuSY9QYf82
 AUaPgxvCZ2h0VRuSp4hTt2S/60Y+idFgTWVzBR28qmPUMyb++NOuxeOoANl04xppc1pF7s2Vm0f
 QHyvADtOU8siyDygL0mD+SpizCxbMe+7EUgQ9Svz9FoMpTOM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow example of other platforms. Rename HS graph nodes to contain
'dwc3_hs' and link SS lanes from DWC3 controllers to QMP PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 149 +++++++++++++++++++++++++++++++--
 1 file changed, 141 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index f5a3b39ae70e..3213eccc3a3a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2543,6 +2543,33 @@ usb_1_ss0_qmpphy: phy@fd5000 {
 			#phy-cells = <1>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_ss0_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_ss0_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_ss0_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_1_ss1_hsphy: phy@fd9000 {
@@ -2583,6 +2610,33 @@ usb_1_ss1_qmpphy: phy@fda000 {
 			#phy-cells = <1>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_ss1_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_ss1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss1_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_ss1_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_1_ss2_hsphy: phy@fde000 {
@@ -2623,6 +2677,33 @@ usb_1_ss2_qmpphy: phy@fdf000 {
 			#phy-cells = <1>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_ss2_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_ss2_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss2_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_ss2_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
 		};
 
 		cnoc_main: interconnect@1500000 {
@@ -3445,8 +3526,23 @@ usb_1_ss2_dwc3: usb@a000000 {
 
 				dma-coherent;
 
-				port {
-					usb_1_ss2_role_switch: endpoint {
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_ss2_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_ss2_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_1_ss2_qmpphy_usb_ss_in>;
+						};
 					};
 				};
 			};
@@ -3514,8 +3610,15 @@ usb_2_dwc3: usb@a200000 {
 				phy-names = "usb2-phy";
 				maximum-speed = "high-speed";
 
-				port {
-					usb_2_role_switch: endpoint {
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_2_dwc3_hs: endpoint {
+						};
 					};
 				};
 			};
@@ -3590,8 +3693,23 @@ usb_1_ss0_dwc3: usb@a600000 {
 
 				dma-coherent;
 
-				port {
-					usb_1_ss0_role_switch: endpoint {
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_ss0_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_ss0_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_1_ss0_qmpphy_usb_ss_in>;
+						};
 					};
 				};
 			};
@@ -3673,8 +3791,23 @@ usb_1_ss1_dwc3: usb@a800000 {
 
 				dma-coherent;
 
-				port {
-					usb_1_ss1_role_switch: endpoint {
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_ss1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_ss1_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_1_ss1_qmpphy_usb_ss_in>;
+						};
 					};
 				};
 			};

-- 
2.39.2


