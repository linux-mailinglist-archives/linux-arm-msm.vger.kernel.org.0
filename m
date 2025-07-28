Return-Path: <linux-arm-msm+bounces-66806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B9CB13381
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 05:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A382168ADA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 03:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54ACD213E7B;
	Mon, 28 Jul 2025 03:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hpRxMg6p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285981EA7C4
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 03:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753675105; cv=none; b=JhUDG9DCVS+6oZtPDxR2SiDINCK7cvesz25582vuNlw9kAfAHZNIQXHDJPJcAcZQ3oEFeXSiUU/sT5L1bs7+bpJfD3d5YG0Cgh71bXiTD24aSrtbLVlN0H68hCozOqzvAOl5DSBzfe6wqtPeSIKeEILCrf0MVHOrReqFPP8sTsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753675105; c=relaxed/simple;
	bh=Ej6/Hn+dFu5p/Yn/78OA+qJgtWDOEmZYCQaGRZjKC9k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lCkHSABjARJfTkeZrqBTKj1bayrfHe+uwakQMkwesNdo147ZNO6Ov6XHP8LwSiNFwUSl5hOyMrKjjOYAhTuv3QRaVH6e1ToM4KD2B9RHZ6t5JW5sGU9oPnXnoYluJ1oIlFzkf2be8XzfEqVCVxN3UA6raHq5JWdct7D8mfQ+t9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpRxMg6p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S2Rcux006620
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 03:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iY7bTL5QACvfY2kxIWT6SIlQBlkz7nRT42z
	4/XX8V+Q=; b=hpRxMg6pk2ZZbz/sUTxtcVcFQ/O/KP+qmzFylqK+gjLY6a1/h3o
	mQ1x+08nhd4Dq2xVZObUNd14FkAQjRT6/oFj+6tj2/pnool4tavxGk3/EyM0Z9Re
	CdxT4/2jTu5WPiXo5ObUapzRTLChFvsBo/i29BhfEVou1BL+ISC0v+3anPKXEkPf
	/by33tZgbj+E7k8V113WFO9qn+mi6fllH0KUeCZqml78MbNvGuBm/xyj5il/IZOc
	9dOvh+A9f8WDimTgTO3X4RgIBm4rLoa8n7aOwnSN68PS1dkMB6R30LvINUeZZaFO
	7mML8QRmgyjmwS4ZMjZTZ5CtxFGpvj+xq5A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860enr5dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 03:58:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b350d850677so2831328a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 20:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753675100; x=1754279900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iY7bTL5QACvfY2kxIWT6SIlQBlkz7nRT42z4/XX8V+Q=;
        b=Y+rRoFeP7UmZIv6ayW0FSCO7lwA7WdWfLwOPKBQZknKXGk1s080VF8ke1udriZ5Quu
         qvPRAvP7QqbmgfPPzQ+I/27TV6c7cJZscVGfELIseltD3fu/SWdyIFOjTubVKIE44/Uq
         LMoWZkinm7CeMJKxM+4S/uPSNJUd+/gYJX5/kzTDWr/lUJ5URlsbXR+0PmcK0N2zH3Qe
         qBMLWFjqZntGb813xd3prK3jKIn1yfNXENEjrvmmBOQKnBX87ziWmQ/fXOJNpodUOajH
         skBrcRKdg0CFgaCaRRH3krdHYF71s4DedXNwK+YMYEAO9F3rUwYqE0nwsGimHo9NylI5
         gWeg==
X-Forwarded-Encrypted: i=1; AJvYcCVRg4ar/yuNFhQv1Mfzzq+JwdhEeyuJCU5Fztbd5ZJWvmrwuxNpFE/GJR88Ujto6gnOi05fajzw8tfmbiRy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0n6FSDkThFMJocA9BSCRNpaOEvCStPmTXnvclNddio5s9q4Ul
	pn9ZdLMTNUtoR//cJHCVFwf7pRL6bJIu7VffmcdP5PyQ6/PQfyflfs7sLP7pmf+9w6ep+rom05/
	qPiRHkad/HQeaQ1C4DhMJwbSdRrSy/z2+1Hqan3aoJFO8m08uPYU/0SFv9+HF7r2OoafZ
X-Gm-Gg: ASbGncsm32p2tGOpFNhHp4IK+jpvG5tT8uWgZlhAQf2/fkkNTSxqzfUuyGB1gnNvIET
	LoIma59LLYI8lpTjE9NPEdwtm9z4xYKwwqQ3wCl1n8SYO7FNPwH//rFeOssfKkqSwAm6Nmy4efA
	nuBILDSMvI9OiZveusn7Y+ARuxAGnh7tdOx4WGADLiJ7srJBY/1CRDriMAjOGrXq3SaFjajGvMv
	HxaHt4f8PcOYjG5JJXfER4XTZFFspeykDj4C9/7NMF4WHYceDonHro43lrbi801NgVpOBnjD+th
	kZfj84aw2Ih6ORh7R7V6BNi617qYkxFP3eLZAHbt0ERMV/a82ybnHzdYR4hqKObHHmxkpo9qRe5
	v+g==
X-Received: by 2002:a05:6a20:9187:b0:234:10b7:f0ae with SMTP id adf61e73a8af0-23d701899a2mr18530766637.35.1753675100227;
        Sun, 27 Jul 2025 20:58:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERMdKqXTnrzWgb+0vXhBc4oT7OKMgeCAgen3c1SexlRH+N3LpLutoekZazfyk03ulD0j6B6A==
X-Received: by 2002:a05:6a20:9187:b0:234:10b7:f0ae with SMTP id adf61e73a8af0-23d701899a2mr18530733637.35.1753675099679;
        Sun, 27 Jul 2025 20:58:19 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e8d2abea1sm4141607a91.19.2025.07.27.20.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 20:58:19 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: sc7280: Flatten usb controller nodes
Date: Mon, 28 Jul 2025 09:28:12 +0530
Message-Id: <20250728035812.2762957-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mwJJWYcVSYjyEce3UMEYDwz--J0f2qI1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDAyOCBTYWx0ZWRfX+ka2NLHpAsRM
 x6hzHfPtSQWTpl5icwCe3PGh1LW0JOYlkwhodK8v8LZjnSeLZAae/1KxcmfPJfgKqh0QxVuG+rx
 tlfcK4e6AAF+U4Rv5V2pF/OqrNRAHo31mDPBpg5hK8+Q791EoARsQNuqY+jXuhJnDfNhPtVAyTX
 ljX+aPo0VbsKRJQM7lOhWgY1NyCRE/LjMSluzs/QR7zqrM/x1dZ/pi4vtBoFjYP3fh+Q5P28Pwj
 Mgb2f8EQHC/nfq5XfcU5Wvfe+9lxhvbueyIrNmrW8q+MfTiyL708lnKfIjYrmqD2GcKy8mFek0X
 x+Qd/b+fvXxcEfTYjf5Fn4Ygki5NfxClhPzTNqSNiWl1aeZZkLXapatCzJtMYK8mLL1nlTGxAdm
 gMq+nOLPTMuGkWk0vGomNd0iiX3rR2ajOuDZjrXJvmCjad5XUIt2J5CXrTJtnoJN+gAWB73W
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=6886f55d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B4eZWCRmW58KndMlcVcA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: mwJJWYcVSYjyEce3UMEYDwz--J0f2qI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280028

Flatten usb controller nodes and update to using latest bindings
and flattened driver approach.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
This patch has only been compile tested.

Changes in v3:
Fixed dt labels as pointed by Dmitry.
Fixed DTBS warning pointed by Rob's bot in v2.
Flattened second controller as well.

Link to v2:
https://lore.kernel.org/all/20250725050216.526327-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
Fixed reg base address

Link to RFC:
https://lore.kernel.org/all/20250720072125.1514823-1-krishna.kurapati@oss.qualcomm.com/

 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |   6 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      |   7 +-
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |   6 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |   6 +-
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |   6 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts       |   6 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |   6 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 106 ++++++++----------
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |   6 +-
 9 files changed, 62 insertions(+), 93 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index e115b6a52b29..f17ac3dc9b06 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1364,12 +1364,10 @@ &ufs_mem_phy {
 };
 
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
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 7a155ef6492e..8ed6e28b0c29 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -751,12 +751,9 @@ &ufs_mem_phy {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
-	/delete-property/ usb-role-switch;
 	dr_mode = "peripheral";
+
+	status = "okay";
 };
 
 &usb_1_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index b9a0f7ac4d9c..eb8efba1b9dd 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -910,12 +910,10 @@ &ufs_mem_phy {
 };
 
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
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5fbcd48f2e2d..01f0b460305c 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1127,12 +1127,10 @@ bluetooth: bluetooth {
 };
 
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
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 2ba4ea60cb14..5c5e4f1dd221 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -621,15 +621,13 @@ CROS_STD_MAIN_KEYMAP
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
 
 	#address-cells = <1>;
 	#size-cells = <0>;
 
+	status = "okay";
+
 	/* 2.x hub on port 1 */
 	usb_hub_2_x: hub@1 {
 		compatible = "usbbda,5411";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index b5fe7356be48..3103f94cd685 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -81,11 +81,9 @@ channel@403 {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "otg";
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 90e5b9ab5b84..ccd39a1baeda 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -520,11 +520,9 @@ &ufs_mem_phy {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd30100..0fa8d34999a3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3711,14 +3711,10 @@ usb_dp_qmpphy_dp_in: endpoint {
 			};
 		};
 
-		usb_2: usb@8cf8800 {
-			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
-			reg = <0 0x08cf8800 0 0x400>;
+		usb_2: usb@8c00000 {
+			compatible = "qcom,sc7280-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x08c00000 0 0xfc100>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-			dma-ranges;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
 				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
@@ -3735,11 +3731,13 @@ usb_2: usb@8cf8800 {
 					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq";
@@ -3753,24 +3751,19 @@ usb_2: usb@8cf8800 {
 					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_USB2 0>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			usb_2_dwc3: usb@8c00000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x08c00000 0 0xe000>;
-				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0xa0 0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-				phys = <&usb_2_hsphy>;
-				phy-names = "usb2-phy";
-				maximum-speed = "high-speed";
-				usb-role-switch;
+			iommus = <&apps_smmu 0xa0 0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+			maximum-speed = "high-speed";
+			usb-role-switch;
 
-				port {
-					usb2_role_switch: endpoint {
-						remote-endpoint = <&eud_ep>;
-					};
+			port {
+				usb2_role_switch: endpoint {
+					remote-endpoint = <&eud_ep>;
 				};
 			};
 		};
@@ -4252,14 +4245,10 @@ compute-cb@14 {
 			};
 		};
 
-		usb_1: usb@a6f8800 {
-			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
+		usb_1: usb@a600000 {
+			compatible = "qcom,sc7280-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xfc100>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-			dma-ranges;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -4276,12 +4265,14 @@ usb_1: usb@a6f8800 {
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
@@ -4298,37 +4289,32 @@ usb_1: usb@a6f8800 {
 
 			wakeup-source;
 
-			usb_1_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a600000 0 0xe000>;
-				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0xe0 0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,parkmode-disable-ss-quirk;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy", "usb3-phy";
-				maximum-speed = "super-speed";
+			iommus = <&apps_smmu 0xe0 0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,parkmode-disable-ss-quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+			maximum-speed = "super-speed";
 
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
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index befbb40228b5..f16b47b6a74c 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -1425,16 +1425,14 @@ &ufs_mem_phy {
 &usb_1 {
 	/* USB 2.0 only */
 	qcom,select-utmi-as-pipe-clk;
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
 	maximum-speed = "high-speed";
 	/* Remove USB3 phy */
 	phys = <&usb_1_hsphy>;
 	phy-names = "usb2-phy";
+
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
-- 
2.34.1


