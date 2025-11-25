Return-Path: <linux-arm-msm+bounces-83234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 423A6C849FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 12:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 23ABB4E896A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 11:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270B42EDD7D;
	Tue, 25 Nov 2025 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQC8kSvC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byvYEyg7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4603148CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764068673; cv=none; b=g17kpskbpsm6YdwMvJo7YBCwejNQ8NhrMOcKp5pnHDuFDo3HljHb0Ba+jKAZFIE+CmulGYYEWMEmnI++Copp1CyKLb6rVzurUqMyOR2kQAuSV4Q/ioIAivna9yu1Stow+Wp/PYtOdRMLM2Ts+mWd2UZKnFLWjbhaf39LEZKJIug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764068673; c=relaxed/simple;
	bh=C81a/S3qeVxwX6KustEahqnVYvCWUXx6O6Bf1Z6iLNY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VilVOGFBY2dt/8iTThRpjcbZKs/pGHsUYeIAz9W/8A+Cp3Oe/LLkbiemIcUSgoH0KLOQsImg8jgqszzRhEFiMxXwIIR/hSRK4VP5i4I+s8QLtMCsU+eJu3h7Doq5kfXJRzPF3l81Neh8Cnn/ys6MbLyuxCZooyQK5zLbwZNEjtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQC8kSvC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byvYEyg7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9R9K51232373
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 11:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bmZbL0K9SXCLEqNMiJE9LPy8YU2GVu0eUFh
	/6bJOQSo=; b=NQC8kSvC75nSPKwdBeTy3SZexncii4PXqifsXLnjsRLZymCDV+/
	OC4eNm5K65EAjsBQcSTDLp5HwIOhdM9BL8UrXNBf7gVbvzf98pNCbja6P1wYn1i4
	Wb7XObbfLq/uEq3mjtzYeBbccj/7rq/YMrO/SiDrTUE3jMnqNp24TCZ9BKTgty9l
	hHybtX+cnj8DNUPTOUHHCtlEwsEmadPhtKcb+rQjlCwvCiD0cW3+fdBdEPBQuYy1
	p7wWk6R9Yv3ic8zh+i33/sAtPEO1TE2m2+/QmWbMA25OGt8bgRyYrwc9fwwZyWpm
	zOumqn90MUUcm2I2lrQ5UnSaGVZlrADTFPg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xyhwrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 11:04:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so10657370b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 03:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764068670; x=1764673470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bmZbL0K9SXCLEqNMiJE9LPy8YU2GVu0eUFh/6bJOQSo=;
        b=byvYEyg75emCeRX0oI+8Z/EoAm7u/1F+pLigAV+lVoi1ucsnS/CPADg7eliGZtgP0C
         BHg7OeK4Ywuu9EbPAev6ngH0eeMGrA46VKEHuVgTDUqRksUSskvDOalV3q9qe+0wzoKF
         E2FkBoul+XDFFqw9l9Yfaiz5rapUOha+uPqGE+S3UEkkN6OAVdrkTFgqxym4Eo5FXMCS
         mDaimmDCz1JRJ9UW7lBPQaAiMqxK/bFsxSVIjgVUvjmjTWTU6TUQKQqsm/reRgiBrpeN
         4hHU42YofTaoNJ2KjQ4K9rxc4IyOmgWUV5/6O3RJiSSA1Mv3sxf9arLWedlXtSR+FpOE
         2UbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764068670; x=1764673470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmZbL0K9SXCLEqNMiJE9LPy8YU2GVu0eUFh/6bJOQSo=;
        b=GAUAAcZwod429x7XnE65NOLQO+Pov8aCkqFvuSvBJupuAoq+r7tKH3oBWZnByBfsml
         9130AXXBwoGih+CWUgCi1URIm+im/dEj6QRQcrGOlXG8wGndSycbVPGuRx8UPQCaaX6W
         N73OGL+Sgy0cKRmlnDMtdiPdfc7ssOHxskBgpyxkjvqDnxXQ9Ezbro2rAY1MTRy8Ve8n
         iTEZLDBYohyZlkmC9lGGOVeacDt30xAMObXC/Qf3NIQArGdIhVQdYxzP6/Xdd2FRQzI4
         JAYO8JRp46oTHxHVAZtleBwog05OXqKbZcrpxBsx5AfUEWwjbCORX0F1xKdqlvP/idgQ
         om3g==
X-Gm-Message-State: AOJu0Yyv+ywI04MqN3jo7m3jqjvZ8qF0FrK3VyFNB4JkCTLgFWGKN4dq
	xFj+2H7bEey1Vnc2+9wUgIOPuiknwu8a16PjCZhqFz8on+1yZ/fRcByEuODBpR0VW7NZwlsukmj
	yFzHxJ80vi4zB5hFGvDLXv1+yokaszDXIPQ8IQK2/w18xsy0iEdsz+/0rQklLgTMKUlrE
X-Gm-Gg: ASbGncuRmcuHPyVpm9Z4EGE6ICQjc3YT++WsSiiNYqWVHkwULQAK8qKl+7pGqsGtn8S
	sMankzJjFbkLBRPc/tLmaTp5PL/eTKUaai0kTfHuEluFlb61so3yLWaoHPb0xrgAuUUAGZjFIc6
	J2eGfszZ4rFkVtH7DxTEcugQN4C1emqITcifBf2IKGU/tk8gpS5N2ryBjWuBoWX8XWbGw2xxC9N
	mrh1z7/KzGLPZfIw4tsAj0rUADhzdoiCa3NX1LV/9hUrhswKqqhNh6xAwSau59MhvyF/sB5YTMQ
	r87mb/wuMweILi2GRj3vBmB3ELWsZSPwL+RdNk4sw12j/u4ij3t4NGCgo/e78K8l6hw5GaTSHjr
	/k88WLZZ1jEHN5CGTCc7Ek7OUnAH3LXDIhFNNu3Rq83rvKDY=
X-Received: by 2002:a05:6a20:6a09:b0:34f:99ce:4c31 with SMTP id adf61e73a8af0-36150f2bcaemr16472994637.46.1764068669886;
        Tue, 25 Nov 2025 03:04:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3EgxkznJ2A0mFcbO/HmImQrEPdXFN7U30098LSRHBrbhyt6jlvdhm0VqwSSni0qCbeEcI2A==
X-Received: by 2002:a05:6a20:6a09:b0:34f:99ce:4c31 with SMTP id adf61e73a8af0-36150f2bcaemr16472963637.46.1764068669393;
        Tue, 25 Nov 2025 03:04:29 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6314sm15893495a12.7.2025.11.25.03.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 03:04:28 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v5] arm64: dts: qcom: lemans-evk: Add OTG support for primary USB controller
Date: Tue, 25 Nov 2025 16:34:20 +0530
Message-Id: <20251125110420.2192971-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=69258d3e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7f_fPzOtc9ZKcCOMuPUA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA4OSBTYWx0ZWRfX5vMnUou7XQ+1
 GY7cV3ZX2ugJ/43NCL5r+EwtHdbfEamVyaS+jStzsbybqL9gRiiKWwzkE9JSrdyIFg9c9dlaTyG
 i1NWC9vJNuwqwn6LkuV00uy05n/VWgG8BRe9HD4A5sDhRPgNEIXYMnxFkw/zXZTP7c8OU01SUIO
 oSnI5N9zGo8wwTktmCCmlXxl+579yfUMixLRGE7OOUtm+tyFvFdIf8gecgh0aF9wsBF6ABzwkjU
 TYvk5+BsV82VwToOe1d4b7ch4jvCiqz8HFsVyxkJafXBZkJTujdBDaAK9X9pS/MevFjvwNql516
 d+LVc089OMr5uiXQ5jZe6eSzL3MP+wqsGFOH9vrqCnbLp+MtchTDqJZx16DL/famiDSXjh2FBAY
 +QvJiCCJBnF7fASnSkF5ZMBCE6Ye6Q==
X-Proofpoint-ORIG-GUID: H1LjK4pT0hxpkqUOI14mxZMZkc4cbOxV
X-Proofpoint-GUID: H1LjK4pT0hxpkqUOI14mxZMZkc4cbOxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250089

Enable OTG support for primary USB controller on EVK Platform. Add
HD3SS3220 Type-C port controller present between Type-C port and SoC
that provides role switch notifications to controller.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v5:
- Re-organised pmic gpio node to maintain alphanumeric order

Link to v4:
https://lore.kernel.org/all/20251102165126.2799143-1-krishna.kurapati@oss.qualcomm.com/

Changes in v4:
- Moved remote endpoints to SoC file.
- Renamed vbus regulator name.
- Moved usb-role-swich property to SoC file.

Link to v3:
https://lore.kernel.org/all/20251024182138.2744861-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Moved "usb-role-switch" to lemans dtsi file
- Moved vbus supply to connector node

Link to v2:
https://lore.kernel.org/all/20251008180036.1770735-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Removed redundant property of dr_mode setting.
- Added power-role property in connector node.

Link to v1:
https://lore.kernel.org/all/20251002172946.589061-1-krishna.kurapati@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 108 +++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  20 +++++
 2 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index b40fa203e4a2..3d73fc2a893e 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -38,6 +38,35 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector-0 {
+		compatible = "usb-c-connector";
+		label = "USB0-Type-C";
+		data-role = "dual";
+		power-role = "dual";
+
+		vbus-supply = <&vbus_supply_regulator_0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb0_con_hs_ep: endpoint {
+					remote-endpoint = <&usb3_0_hs_ep>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+
+				usb0_con_ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_in_ep>;
+				};
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -102,6 +131,15 @@ platform {
 		};
 	};
 
+	vbus_supply_regulator_0: regulator-vbus-supply-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_supply_0";
+		gpio = <&expander1 2 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
+
 	vmmc_sdc: regulator-vmmc-sdc {
 		compatible = "regulator-fixed";
 
@@ -454,6 +492,43 @@ &gpi_dma2 {
 	status = "okay";
 };
 
+&i2c11 {
+	status = "okay";
+
+	hd3ss3220@67 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x67>;
+
+		interrupts-extended = <&pmm8654au_2_gpios 5 IRQ_TYPE_EDGE_FALLING>;
+
+		id-gpios = <&tlmm 50 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_id>, <&usb0_intr_state>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hd3ss3220_in_ep: endpoint {
+					remote-endpoint = <&usb0_con_ss_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hd3ss3220_out_ep: endpoint {
+					remote-endpoint = <&usb3_0_ss_ep>;
+				};
+			};
+		};
+	};
+};
+
 &i2c18 {
 	status = "okay";
 
@@ -607,6 +682,16 @@ &pmm8654au_0_pon_resin {
 	status = "okay";
 };
 
+&pmm8654au_2_gpios {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio5";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
@@ -746,11 +831,24 @@ wake-pins {
 		};
 	};
 
+	qup_i2c11_default: qup-i2c11-state {
+		pins = "gpio48", "gpio49";
+		function = "qup1_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	sd_cd: sd-cd-state {
 		pins = "gpio36";
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	usb_id: usb-id-state {
+		pins = "gpio50";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart10 {
@@ -779,11 +877,17 @@ &ufs_mem_phy {
 };
 
 &usb_0 {
-	dr_mode = "peripheral";
-
 	status = "okay";
 };
 
+&usb3_0_hs_ep {
+	remote-endpoint = <&usb0_con_hs_ep>;
+};
+
+&usb3_0_ss_ep {
+	remote-endpoint = <&hd3ss3220_out_ep>;
+};
+
 &usb_0_hsphy {
 	vdda-pll-supply = <&vreg_l7a>;
 	vdda18-supply = <&vreg_l6c>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..5fa4a43a7350 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4026,7 +4026,27 @@ usb_0: usb@a600000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			usb-role-switch;
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb3_0_hs_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb3_0_ss_ep: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_1: usb@a800000 {
-- 
2.34.1


