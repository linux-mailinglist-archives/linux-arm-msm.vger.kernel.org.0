Return-Path: <linux-arm-msm+bounces-80027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9F9C292E0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 17:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 016EC347C27
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 16:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B83224F3;
	Sun,  2 Nov 2025 16:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAamxyzN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAhgusL+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F82C268688
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Nov 2025 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762102298; cv=none; b=tQGvL76K08ayoq9AAYClDu1WZEqSlZFFuy/Pk9Xf3VCJvSYI+IDuiAbkRfeupKYm9z2a98chon9wdHiljtY3O6XGoLPFTuEHmGyYI1kp3wtIwLQPoeO43X5qHeZ0t0uEQ36CtnvWaYn0c6sdmEe5akiNlZpZCgEJbAZoCKzW4JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762102298; c=relaxed/simple;
	bh=9uM0tStFngDwtUSlKfZtaTwcdpjIXoy/QiF4EAxAfOE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iS1LsiRQggwWUXmFx0vBjg8IxXEFTV4XfSdds2e/ktyDE0gxNgh1yRoglN9hWxhwXwaYZ5ROCi61og7njMSPACo3Wecf+WNtIk8aSNLAPvVPDoJtUnBDgFFFydNOQ3njkRDgI85mfBqrFXF7ypaWGnvGrpItg9t8cggWeKSxLSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAamxyzN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAhgusL+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2GfbmV808970
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Nov 2025 16:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gAWYRe/oqqVPEztps6Yj94w9R+YuWWsCbrE
	va3arqTg=; b=RAamxyzN9oal6DDHDAcweAZ13f2Alal9ievRYtuKuVGlnOGw0iV
	nF05n6USJHy6evjkNSSvPJuSzxDCsq0Ejvtsi2QVTOHQM3Ul3YcbbfwbPH7E57v3
	GEaFkKQeUMkMQI9qS6plJQKBghD+FqjCSEF0oaorbT7B5uc2mgBHfPJzWn+G+Fd1
	ypoF6H6IaLdzwYHdno44aS5PHNd3S5vSWhIy9GZKtuMXg8hAUEEMaZ2hEgI3kCqK
	APkFtnB3plqB7CzpGraMY6U3lhoWg2IDIcZCXI34Q+MKk+WpSIiNqutR9wCtIZaL
	OlvhGIuAaTgLBEhQQbjekUwJmrE5izCoKVw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5977afem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 16:51:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33da21394adso4277417a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 08:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762102294; x=1762707094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gAWYRe/oqqVPEztps6Yj94w9R+YuWWsCbrEva3arqTg=;
        b=TAhgusL+Lqon/BhugfS0jtUC1Oy8pwvBSmySJ43zLVqy34M14H/6hCKjMQ8lRV4+64
         X1/FfCxH5KcH+seUkB7xui9onRdqMih4MQpO7TVBirg1pU72CDH+IG8yuzxamcyJM9Em
         KpWPbDuiJ0isQQrECxJsHdEX9IHGGp4tRDZx2C5l1dyMCOmb6NEbc4wC8J60WfB4nVJH
         Z8HDKgTAIob80qhqlbyM7GlG/p6UzLtqkc2RXXl0uThr4JreRsASKwVr4UWdcAFLr0KE
         xc8kj5EjfuN4X3cXFe/j7/Ahy/NicizcU8cOWQTD4sL+iSK9oOGywjIUf8Sz0TyENk2J
         X0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762102294; x=1762707094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAWYRe/oqqVPEztps6Yj94w9R+YuWWsCbrEva3arqTg=;
        b=vRPMzlTP0CwA8ianS9m5scX5layVrcteRLrfXfsak2i2QM2Cp8ZoYTuBgvUzxcAClB
         mWDBCS/bCyzAoS3uqi4H2qem2GFWPO5rofV42pyKP0Y9ItkDeGWJVUMquAckJeK4NyyK
         c5tzG4tVRkB+b9ZkpsUAo5Hz5Uda9l8szs71VvFhVQPZ9stSsY/Kefi0dQ3nRa2f+xP0
         YqEf4qTXEuNt10zIGlNslaTeFbRhkMO+CPkx0NuMnq//CytqEuuoQag6EvET714d80HD
         4iNw3aIlsDDZ/GlharaCbHRkp+9OLM7dnPkWFVrUbBc/WCtKomXXJw8zgNCiZ1oKH3rT
         Tyew==
X-Gm-Message-State: AOJu0YwiCVslLC27JH5Dz/0Q2izr85Vy9b51rjG8/21cRHtyESmSVL1x
	i7SfRwP14t+3+K8V+wZ0pwO1VCuomChLgT9KZa2OIEkAl7koRWfL12TWCe5MSBpG3L8Hr1KWCYb
	QuqtPSpvU4pNNVPb6KSWWQrdAOMUoEwGtIOWZVB5rnyrpL9sS69Okk1aOywP75E+cedqf
X-Gm-Gg: ASbGncte3kXWFMCzFJpFj+AOZoXejQdANnfpNO/bqPfrQCwiEFn3RKX0EXzbP1IHmlF
	Fs+M6neaM2MbS3j/b3QVEC5VgS7MvuJe3a5mjwcqp7UPcNrJ8wvsB6qNosotW6wRJ47NCNsbw6f
	FzlC9y3B0v6Ov6Vf4gDJYynlme8dQmV60qSacBrB1JzmwTj82Xj2CNxRnTNZ6reFXQTQromIYe6
	/2WKkEw6wpkIms1eENdjWg6raQUmBsoIMRR7gvQSIuW+zMho1fn2lGc9lp79VwGnlTS40/5PSmO
	3+NjkBi96GsD+3nlkVFEZ1nhZJGVmMBVj2JF4RMHG7VQ3/nuuD8UurzYGxPRyHjjvuncriyvS3d
	vGOm/sxVV04vAo/5nNhxyVBbm1V4bxEfexyI3
X-Received: by 2002:a17:90b:5490:b0:33b:cbb2:31ed with SMTP id 98e67ed59e1d1-34082f057a0mr12425361a91.0.1762102293899;
        Sun, 02 Nov 2025 08:51:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNjv2nYc1CoJI1aBfHf91i+MIUBeEJL5Ob1AWJMBUPxSaAU4Oim9AeDWi83I4wS9zjrRzqpg==
X-Received: by 2002:a17:90b:5490:b0:33b:cbb2:31ed with SMTP id 98e67ed59e1d1-34082f057a0mr12425340a91.0.1762102293338;
        Sun, 02 Nov 2025 08:51:33 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3409288c7ebsm8258528a91.6.2025.11.02.08.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 08:51:33 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4] arm64: dts: qcom: lemans-evk: Add OTG support for primary USB controller
Date: Sun,  2 Nov 2025 22:21:26 +0530
Message-Id: <20251102165126.2799143-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hpjlCJ6QTHUXuan_yUqxVocNZyOmyM2g
X-Proofpoint-ORIG-GUID: hpjlCJ6QTHUXuan_yUqxVocNZyOmyM2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE1NiBTYWx0ZWRfX87OLbkyileQI
 W3fbf8OZgLFtXinQfvfTbxGiBcygg4SQ5Li1kOKVNdl1Aok8lZDkLFJgLG6AIDAtpmTjz7CBAQa
 DAuhFV6QNFAun5GSfy5JNGe8XlScjjwro5fcQ9Aq6KyRNVEW6XyvcsGwcHwBgRqyb4ey5L1Tceo
 F8874L1i6KIXcV0UXWlXBjsVS3LWqhzouBuVzsb1DP0wz95+W0tSWpG4+y77CSYm+9ZIyTnVInY
 ManYRow5VacDc8qugWEidyN7UHxzIvrytRqwchn8nrk0LAM6/iPfc/84+3OY/0KQvRp2hNa/aDa
 dvmLx/ucDSx/Qm9UtkvyW7UpEpND9Kvew5jHsA6EWHcCXmehtpALNHA4InbDNQV6gxMqQ+nrEaX
 0ziNBnuZ4OSXOrxzpTICgBTMZV8nVg==
X-Authority-Analysis: v=2.4 cv=WcABqkhX c=1 sm=1 tr=0 ts=69078c17 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uwWTS8yvPgOoQYSI5BYA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511020156

Enable OTG support for primary USB controller on EVK Platform. Add
HD3SS3220 Type-C port controller present between Type-C port and SoC
that provides role switch notifications to controller.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v4:
- Moved remote endpoints to SoC file.
- Renamed vbus regulator name.
- Moved usb-role-swich property to SoC file.

Changes in v3:
- Moved "usb-role-switch" to lemans dtsi file
- Moved vbus supply to connector node

Link to v3 DT:
https://lore.kernel.org/all/20251024182138.2744861-1-krishna.kurapati@oss.qualcomm.com/

Link to v2:
https://lore.kernel.org/all/20251008180036.1770735-1-krishna.kurapati@oss.qualcomm.com/

Link to v6 bindings and driver changes:
https://lore.kernel.org/all/20251102164819.2798754-1-krishna.kurapati@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 108 +++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  20 +++++
 2 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index b40fa203e4a2..b96d667f1b40 100644
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
 
@@ -454,6 +492,53 @@ &gpi_dma2 {
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


