Return-Path: <linux-arm-msm+bounces-73911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA730B7E251
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A10D7B8914
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 12:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8274D2C0263;
	Wed, 17 Sep 2025 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8NpNxlX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816162FBDFF
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 12:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758112719; cv=none; b=kufQw65BtP/HvP/bm0RyO8Sp6FJpohJV7+SLJQsHJN8ia/DQjMoBNwRVycpPjkwW7QabPTy07gmLcugpOnw2FUacnQ566kRw9jmzRPzpMSjQ8eZEmC3BSPjlYIJ3q8kgOGrCIhVLF25VWoqWtjRNdMxzFXQq+/GTiLGf4meq8Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758112719; c=relaxed/simple;
	bh=SVMG8crLccMmaw6nWd7Fh/ITCvVrSV7lDRi1dnWJWfA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d7VQy+ybQs44BgFA6TQqgqE1CT3dthaFxJoldnbQi60ZImNO9TaY28Ew9WjjcnMzv1hntUWtpU7qvK4pUSt0Pl1cWzz3UisfRaScJI2cL+sWGvYG0KUu6zhZijGHb/yNpaaH0zrpBw18+WzLpx+h4M4CndNhuF/j2cE8Smabu1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8NpNxlX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8Xa4C002145
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 12:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VzdtNsZMV9zLFUxOfBZ6WQDotjnzk0Ptsep
	I8V0d7g0=; b=N8NpNxlXmEPIBQqvOFs9TXgu+5YG5UYV3nuYVc4qZ0TW/T6SKTL
	28Zjg/pm2II9tNLGn/r4g7Xy7rXyPKvhm05xpW6OV8pNqDixDdV/cZ0h8je7nAvR
	Hpn+GaLOvUCEJVFdWWAZfKMllNeEnFje7DMlKWsvtccPrAnx/gMk6HPoAYZWFlXs
	cU1zgPTJqnU5mPjpzKvbawo4K/E/G3otDWlX/K4G4CujjAttpl7PfHhVfLGUaZw2
	ALBT1kztVsfoxCPt7hmE2jphoInHtGwxp6SnawVVhKmqEMGBBxagEQ91BkaKjVBd
	dMHDcihZlP6lsxv5RbncFOnUSpHhKpZ2QPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwjbrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 12:38:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24ae30bd2d0so60616775ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 05:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758112715; x=1758717515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzdtNsZMV9zLFUxOfBZ6WQDotjnzk0PtsepI8V0d7g0=;
        b=LGMubgbQpThru6x6vgf/IbPUdP3vmlO3E0tzB5mHAmiw075Yt5/iMVCPVOtctpy5Bi
         SOCKvZKxbX8nS6ZKMvzJJ7F35rQ5/86TS92NeOJfFOe0D31qMGU3pu0vB7z1ebqFz6a6
         PkHCVqB/qovemK19GMYkeZKGPflKKMtu3oDIxx7MQxws5jnMLW83axfXMAt7uM6gp6pj
         qsvkz2b768mKM9JbHimW8BHmVHIOzilwmqrK1tKOIYN7sGl+IAzaX7yUVrEF9VvQuJ0K
         jq2rATf3brPLyLq9Rjt5V663Y94Jy3sYfL73v9rc5DRne9c1ljuxzftSFz+9AdV/GOAa
         ajTg==
X-Gm-Message-State: AOJu0Ywetr9lRVreVG00ycR/ICtnPWEvbNjnElVr4x81I73YMY2Nr3+o
	SnMQRGagLW9xY0RfGvZoJm7MMKzZbg0E1WZsQAliR6cCY/y5I9G3FabW5rdW8FHP1tVEolTPAY8
	Bc3Q2DeOBQMPB4N5B/JjVr/O4A0M3CAMcaxPvaMxbtpfcPHOiKnKFgGUFuGY/id2avEE0
X-Gm-Gg: ASbGncvO2iqS2y5klpi2LTBaabnctphavfvAUrzgObagMI3cODL3d/PL2UPICFIYAAJ
	S2HYVWjoFXlc80W9TP+6v2BH9MbwY+GMCboXslCrpB/VEm+HxbS0fWvP9rdJXZpT4QKrXlLlk1R
	kotpk+QHfD3WLfU+30pLxBbt/eq+FThYEEY8Zwjghgt74sKkj1ENkmE8gErCNSkHBHejwdkZtvQ
	3fOh5sXf3S3Q8Nt8C2QicYeE1r1lGFonbGtVJASqQT40JrOhgsvD9tE1IgmFEO6oQo6rSOVwaXc
	LiF41dFUJoR1hJfWcAut47F4CFHJUD5rG4KFhxM88OLeme8bUerpk3wOOVCcLKdlZ3gFv6a//yP
	Ehg==
X-Received: by 2002:a17:902:e546:b0:265:5a25:4b0a with SMTP id d9443c01a7336-26811e87aaemr31220265ad.18.1758112714706;
        Wed, 17 Sep 2025 05:38:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQMWAo2VZ/X+xqHVnZaPQOCqYoq2hAXT0q87kWC+JCbaHIScWIH3WSH9NMFL1uN86kumnX3w==
X-Received: by 2002:a17:902:e546:b0:265:5a25:4b0a with SMTP id d9443c01a7336-26811e87aaemr31219715ad.18.1758112714134;
        Wed, 17 Sep 2025 05:38:34 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26263a76cd4sm119577095ad.31.2025.09.17.05.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 05:38:33 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: lemans: Flatten usb controller nodes
Date: Wed, 17 Sep 2025 18:08:27 +0530
Message-Id: <20250917123827.671966-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=do/bC0g4 c=1 sm=1 tr=0 ts=68caabcc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ZO7FcIPpQ5q0aZ6D8fgA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: DgEDurKtTEwKXpo9dkyqZT5Fxxjnhxqx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+0VcuUmZb3hc
 O7Jt0hzxFqG6MIlZNIm7y3YTFi8PjeFNRzfI3DLcy2KbMKERkbnX7b9q+0OKk61WSPTyzUrSIIM
 YLrX6U0t5LDAODguQScFtanedY1nnsO9OyKCKPNRikA62Eehu1u70CMPqrSxmPh8f2dG0L1gYKw
 uFostTRy8HgdP/dE57z0f28ooX3zTJIuNdY0heIpXsZypmK3K8YiQdvGCkgnJcY7NWc3zAW7Plb
 dwELRH9YzKdesZRuKa4MSJaqL3kURkxJ7QBh42sa+Q+gPRfwMnMN5lc3mCVePnw84Ss3ObyRa5o
 uFVhbkzlVcw/0lfUhkyFkS4zd/XPSrKyuOJ4zyI9mPG4nPGlsmJpos6HH179NxiiL2yRc06Ojxt
 /TRV14+B
X-Proofpoint-ORIG-GUID: DgEDurKtTEwKXpo9dkyqZT5Fxxjnhxqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

Flatten usb controller nodes and update to using latest bindings and
flattened driver approach. Enumeration of ADB has been tested on EVK
Platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts       |  6 +-
 .../boot/dts/qcom/lemans-ride-common.dtsi     | 15 +--
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 96 ++++++++-----------
 3 files changed, 44 insertions(+), 73 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index d5dbcbd86171..c7dc9b8f4457 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -751,11 +751,9 @@ &ufs_mem_phy {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "peripheral";
+
+	status = "okay";
 };
 
 &usb_0_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 25e756c14160..c69aa2f41ce2 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -997,14 +997,11 @@ &ufs_mem_phy {
 &usb_0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb0_en_state>;
+	dr_mode = "peripheral";
 
 	status = "okay";
 };
 
-&usb_0_dwc3 {
-	dr_mode = "peripheral";
-};
-
 &usb_0_hsphy {
 	vdda-pll-supply = <&vreg_l7a>;
 	vdda18-supply = <&vreg_l6c>;
@@ -1023,14 +1020,11 @@ &usb_0_qmpphy {
 &usb_1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb1_en_state>;
+	dr_mode = "host";
 
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l7a>;
 	vdda18-supply = <&vreg_l6c>;
@@ -1049,14 +1043,11 @@ &usb_1_qmpphy {
 &usb_2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb2_en_state>;
+	dr_mode = "host";
 
 	status = "okay";
 };
 
-&usb_2_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_2_hsphy {
 	vdda-pll-supply = <&vreg_l7a>;
 	vdda18-supply = <&vreg_l6c>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index b7e727f01cec..ee279d11873f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3924,12 +3924,9 @@ usb_0_qmpphy: phy@88e8000 {
 			status = "disabled";
 		};
 
-		usb_0: usb@a6f8800 {
-			compatible = "qcom,sa8775p-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_0: usb@a600000 {
+			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -3942,12 +3939,14 @@ usb_0: usb@a6f8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 12 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
@@ -3964,18 +3963,13 @@ usb_0: usb@a6f8800 {
 
 			wakeup-source;
 
-			status = "disabled";
+			iommus = <&apps_smmu 0x080 0x0>;
+			phys = <&usb_0_hsphy>, <&usb_0_qmpphy>;
+			phy-names = "usb2-phy", "usb3-phy";
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-			usb_0_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a600000 0 0xe000>;
-				interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x080 0x0>;
-				phys = <&usb_0_hsphy>, <&usb_0_qmpphy>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-			};
+			status = "disabled";
 		};
 
 		usb_1_hsphy: phy@88e6000 {
@@ -4015,12 +4009,9 @@ usb_1_qmpphy: phy@88ea000 {
 			status = "disabled";
 		};
 
-		usb_1: usb@a8f8800 {
-			compatible = "qcom,sa8775p-dwc3", "qcom,dwc3";
-			reg = <0 0x0a8f8800 0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_1: usb@a800000 {
+			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
 				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
@@ -4033,12 +4024,14 @@ usb_1: usb@a8f8800 {
 					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 7 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 13 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
@@ -4055,18 +4048,13 @@ usb_1: usb@a8f8800 {
 
 			wakeup-source;
 
-			status = "disabled";
+			iommus = <&apps_smmu 0x0a0 0x0>;
+			phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
+			phy-names = "usb2-phy", "usb3-phy";
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-			usb_1_dwc3: usb@a800000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a800000 0 0xe000>;
-				interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x0a0 0x0>;
-				phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-			};
+			status = "disabled";
 		};
 
 		usb_2_hsphy: phy@88e7000 {
@@ -4082,12 +4070,9 @@ usb_2_hsphy: phy@88e7000 {
 			status = "disabled";
 		};
 
-		usb_2: usb@a4f8800 {
-			compatible = "qcom,sa8775p-dwc3", "qcom,dwc3";
-			reg = <0 0x0a4f8800 0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_2: usb@a400000 {
+			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB20_MASTER_CLK>,
@@ -4100,11 +4085,13 @@ usb_2: usb@a4f8800 {
 					  <&gcc GCC_USB20_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq";
@@ -4120,18 +4107,13 @@ usb_2: usb@a4f8800 {
 
 			wakeup-source;
 
-			status = "disabled";
+			iommus = <&apps_smmu 0x020 0x0>;
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-			usb_2_dwc3: usb@a400000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a400000 0 0xe000>;
-				interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x020 0x0>;
-				phys = <&usb_2_hsphy>;
-				phy-names = "usb2-phy";
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-			};
+			status = "disabled";
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.34.1


