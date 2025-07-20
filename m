Return-Path: <linux-arm-msm+bounces-65771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B873B0B416
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 09:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F9063AA474
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 07:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B1B1DDC11;
	Sun, 20 Jul 2025 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FVPP6r+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF0E1C2437
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752996114; cv=none; b=Id9o0dq2Vh72DThM4RIfx/BD7WmlZuG5eKT+21PxiNflx9WpwAzGFbAEt99GyHyIskMQWJdBe8UCXPGF3LtUUf9slzpnykDcAFX0itk22JdGWiewiWM/yBtjQvvyXEjl79sBIuv1f544LKVM2PNG2ASVyLZx3s9BmMlPsNYHT10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752996114; c=relaxed/simple;
	bh=q5dFyPSKzoOAh+WaNwTAwU0DgLXb0FDwbrfGiHFnX0s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dDZpi+1oAQVvOY4txqKV3bDFHfCF5uvY4Ab26rvJc8DhWcO3TY/6sVPLV8aCOaIfbIFNnXB5ZkV+BSmwcevETdXXMEe0jW54Wzz3zNKkkAPDP8mlb2tF4riJ2mz/8oAVh4WEQKftNFzkTq/NTFucAlux9YUCaasBYU8/A9ne1qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FVPP6r+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K3NhJr002166
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 07:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=S0qMC8iWPilpYL7kcDpX+g1J31I4WsZ38+6
	cMf0mIt0=; b=FVPP6r+EdIKk/7OHuD1RWi6NzyDkfwsrqYEPA8OMQeXFoQv5TwL
	M18rPNk8ZiyIahYzilqmB9gWjU/FNOmsb6wsfmqgi2yIKB5dHILjwbNS1YvNGn8b
	Pzh8/4DNaK9plEedVMLZyHjxLS+o/Qz/B0NncS1MZc4sn9hC3ZaOlb2542yHhwwc
	q8bUNCmhkQC+0BOu5zfRy9KWN4OHU09y4uTwCoeXJfRkR55RM/6wmRwtt60Pb6t5
	mrTqw3QByAnPXWRhM+sfyLEmccAKopEYxAMndY9uWiiEpfR1dbiu3etGyspyv2oP
	7fsA53EkSfeLsdjqsWmoj657xfreXXfc6tA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v1u4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 07:21:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b321087b1cdso3796298a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 00:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752996109; x=1753600909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0qMC8iWPilpYL7kcDpX+g1J31I4WsZ38+6cMf0mIt0=;
        b=RcE88cDmIPd4kWkR+pA9uxsEKX0stOlQ4E4RI7lNP0rz08mDIgITQVXFEUk+eBLpZp
         1R8Cg4Ie/tj+57nAxRp5Xa/7E6Lb3OQU7h3u1X4Mw14FVt73AhIfNjR1dxc9F2OyOiLv
         F2PzRDtaW5wKbhuPvNWbFy1K3gaFnsPZWofGxn7cvPBPrk/ClA7NDUtDJnsI+Z2+vdqO
         G+c7LvbeIBvI2Am/pWk7eVc9vHWR4P/uX33jg6ZrZMvqb79L/bwZulgF2aWjeuPYzROQ
         LAVqnr8hfN/RnRtC8VEbrz8c6hYzDeMdcoTXneICdu413CAkcAy7Jb5KhJOL8VSohEGC
         UAyg==
X-Forwarded-Encrypted: i=1; AJvYcCWvM0XMLLkdUz3K5Y/plx4mhqVZ5/taZ4EiOTzFrIvqmiLY4inJww8e4/kauQaOHNytL9s6hKPCGFaTh+jC@vger.kernel.org
X-Gm-Message-State: AOJu0YyFrdeRCrGb1Rfekr5PjtVQdm7hpsh14bQjDctuXOP+pckI9XgV
	xdb/df+oDxhTuO75tjIrLV3vt0U75xsi6U+PkQM6+nNpA37iE3Xbpkw1VN1L60m8ZztW6SjLwP/
	E1PuMCysG3hMiBsl5LBVuuwDKaSEJax9yvY77zDKJuT3WAIe/NqS0NxUAfJ5vUUjPd2Jh
X-Gm-Gg: ASbGncs38SM3KsSU6awhQaR7uzP4+1VwsIizZb6RtiyVc+NfF/nebdow0/l8hosEsDP
	uzq535tmeOzbpCXki5LJ3c1AAMABunzD1kppPOKd7lSOqAtRLwp8IZ0QY5rN9+AHn+cjU7DcHnY
	BX39c4tcP5jvq+unxsTvnFaJazdCJ4WgCS3vCTBA/qB0MLQYit4GF9GVzDtx24WpkDSJQW6e5dr
	k9gCHqAPB1LgtX44Dme8gR8OFh3YMty2OgTPfOk/oAI9K/BYDjoCQMGY3Q9j7i7VgsSiB7GZvW7
	SdOsl4Kcy6DncF2zTyNaQVmGKiz+tWekwd1i5L10tx2H+sPGtLDu6AkYWM04nFvbf8L2HEcu1bc
	/EA==
X-Received: by 2002:a05:6a21:6005:b0:201:b65:81ab with SMTP id adf61e73a8af0-23812947ed1mr27155922637.23.1752996109232;
        Sun, 20 Jul 2025 00:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVrw5F+lDh+D6GQbLzCucJeKgpkFGNHFBY9wenkPd6GC2O/TewO4YnOZqFOKVaFKIP2y3mUw==
X-Received: by 2002:a05:6a21:6005:b0:201:b65:81ab with SMTP id adf61e73a8af0-23812947ed1mr27155895637.23.1752996108750;
        Sun, 20 Jul 2025 00:21:48 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe8cae9sm3425243a12.18.2025.07.20.00.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 00:21:48 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [RFC PATCH] arm64: dts: qcom: sc7280: Flatten primary usb controller node
Date: Sun, 20 Jul 2025 12:51:25 +0530
Message-Id: <20250720072125.1514823-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7iV4VKCRhHDowRJn8kZA-BSZTfrVrdat
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687c990e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=F1BopdVJQ9INZIdvojUA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDA2OSBTYWx0ZWRfX3IsGD82JuJwG
 vK7rb3/ruCIsP6jJjkfAQWftFsTAr4aiWyii3RI02ovjgxKNF1CU7Y3ie4L19ZDZLzrVZ+L5d+u
 FcF+pJbIBZqk91fVSGFWUXj9Zodm7yidK0ZTw4iCuDSdkPQsYIfV1bdN7jBAFFGNtC7CxFLviDZ
 nQbYajBcHyJDHPMhalhiu3Gx7+2i04L+neqGj235fgLd96/ogMGDRJ5RKJWNCWTDa+LaDMXWOaX
 KSOfbguconGOKOLQyL6bAj8t0YRCmy5lP9Iv+OA8/ppSxb1z4ECKdnA8wWo76Dikei2ktpJ+ku0
 tVZauHkgRlvzLRU3tEsziCjgt9/w4qcMBvnVgT/9pA8muy39oLTwkvXzG7/YjOV2HNb7+SBfYKy
 PFOTBM8UODAazc3Iyu27W/B0YV4QG+GgCtLxPq0D6I3DIhQsAXvJjGB2TyjGxd5nRq3qTrVu
X-Proofpoint-ORIG-GUID: 7iV4VKCRhHDowRJn8kZA-BSZTfrVrdat
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200069

Flatten primary usb controller node and update to using latest
bindings and flattened driver approach.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
DTBS check has been done on all platforms. This patch has only been
compile tested since I dont have access to many of the platforms.
If folks from community can help test on any platforms, it would be
helpful. Thanks in advance.

 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  6 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      |  7 +--
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |  6 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  6 +-
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  6 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts       |  6 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |  6 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 59 ++++++++-----------
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  6 +-
 9 files changed, 42 insertions(+), 66 deletions(-)

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
index b1cc3bc1aec8..e94e21301bdd 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4245,13 +4245,9 @@ compute-cb@14 {
 		};
 
 		usb_1: usb@a6f8800 {
-			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
+			compatible = "qcom,sc7280-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a6f8800 0 0xfc100>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-			dma-ranges;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -4268,12 +4264,14 @@ usb_1: usb@a6f8800 {
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
@@ -4290,37 +4288,32 @@ usb_1: usb@a6f8800 {
 
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


