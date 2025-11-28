Return-Path: <linux-arm-msm+bounces-83720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CB518C919B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2E22134594C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 10:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF43C30B509;
	Fri, 28 Nov 2025 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTdSCiuT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gf7YO2SN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301E73054DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325518; cv=none; b=FEhRzGcuFMrLYzSRR2+EeQBfWdJuwnTMjoB2V6HwmnFG2PHvNB2LUrkexaBN9dhoiYTHGmQBhwyY0aZ51SiCwDoW2vGg+cwCIL/eFIF18tjRvikhCcqlRogocTUBTuZs1LWT3PRmvHhCkHDRPd+OPszYvFLAbrLA+24CTLB+v8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325518; c=relaxed/simple;
	bh=fZgWizBnPPlVTWS2nuOlSWwPJtzT5jETR+QI+4Hy6j0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HR8vnJ5gZ47yfExiQ/ReokwKOsX+JW/s57uqa5zsYs9SMYULb+ldvvRFVkCRZ7gPbRbg8iqAqWmUIbdhOh1WlS9XFNKLsFOgvL8tYYOv7/opCICl4jWOn8HizKpHPnu375asp9wmXuCKNx3UE061CWK4H5dJi8jJUCzLMxxldCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTdSCiuT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gf7YO2SN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8OglR3627248
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vxrCpTObh+sq8TpBfdVpWIOw/J1PvdPRar/
	7svAe1Ms=; b=RTdSCiuT+ZrAtcmrWHLcsKkF3kxC1NSMTWNaQipQelKqJ048qfq
	IIsxoZuAOpKGfHBWhWFqDO5X22iGtkWvcGNcUiAXtngk9yT/b841WQGC/a7ZAhJ1
	v2hB7pYiV066lNyfM9sByg3YhyWddc/TdvZISK/NZggvej1xdRiW1yp8/pk49Q93
	txWZEMc84OS2vn6btJ5wyHTFZXtjInHU7yJygLU4SuxvcQeCqkPhCCC0A+DZolCa
	nx1pZpZM788eeh/JtEbzvSzdxQjJWc31+74219xGsyhK5CrrmfvV9ZsxOmdnb197
	9rN1nFusoEx2fpJVKWSsBS2bvJMfdTktTBw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmynu050-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:25:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7be3d08f863so2529271b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 02:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764325515; x=1764930315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxrCpTObh+sq8TpBfdVpWIOw/J1PvdPRar/7svAe1Ms=;
        b=Gf7YO2SNE+2JhUrtSvdBctpSj1n0Bondl4blivTcKCoVca3sXiRBkU310BXbgQYubB
         QXm6PvsAjiCTwvmvSQKem+9i7Kwr++htykhVwda/rB730u3ysIdiVS6kJ1noSi/ElOF4
         eXO6IQBArtBFyj6zl0KlsN9aq5zy4O7q4rG3C+Ohtwjvgi1fwUT8csMesqyw1dkMzzyT
         P7CdernAu/qOrUrirh0wRLllQ4v68WZ084Rl5KoD6H+4RP0gmSb523E276y9NZO/wVEx
         nFIPPztrmFiHkJQgVxQhkiNljQPvUAw7Dh5nUq3XznEeM/0F+qsXywbLlYZSU5J0M1W+
         4kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764325515; x=1764930315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxrCpTObh+sq8TpBfdVpWIOw/J1PvdPRar/7svAe1Ms=;
        b=MWHTdF7T976fyIothKus9ewjG+Am3r7bJ8Bjq1vH6jysAw8R5B25jy/ZlzcvbVnytk
         1LfADoeOmdUnYx2uGRPjHk9MaUXdwsjSd6uyyxHXvriarkosKMiFbAA/l1Jpi2LABv+6
         3opuS2endY2GadHFY2SwqwzkNPvrKPc0/yulzYvK0518vAGJhJ1nqcvWrZz7C9GhveLN
         Cm5nfcrIz7DgCoAW2LtciwNOOcQU78jHKOs3cBYgtjlXz5XHHtK6B+B4XxcnkvMbh2Wv
         vhWUCqz6YSqNdhf+W2EsZ2/TqfJtYkNTJPYoGQJlGx1AEP7jsj/JG6fZ7AWtnGpYjuGm
         7W/w==
X-Gm-Message-State: AOJu0YxXwaDfjwtretbt0BMaZbkVSF4u3NUldcU4fMQuDmSohF899IFo
	x/+sdCXRGW1FWRdZlkhGcbI2oqQuCbj8kOxPGdXZ2+XfTVl1n8nfvm+2MkyGt0OnhaVnyfcmvdj
	QmiwG/q5ppJMLPyfd5Z3XjuGbCvqCHfg59G7+L8G4HhOiinSRC3uUEZN/kAoYr7uMMcnc
X-Gm-Gg: ASbGncuqgK5UxA4Lpv+Aoeo+94Jb72wqkV7/PGMjIbRjrpT1bxOb/d/IONxKKc0Nw2J
	pdmY0PtiIgi+tnBLBDsiEzyOC/mjtOYdz6eF75o0Dh5aQHeXz7z0RgYsEr3WLpZFoVat1JRWqhk
	pr8MW0+WCXa759XeBiCqtjAVPQIQ3peSn9Ne4uJai6AFJN/bHnbMdIDYCqg+3wDRXQ0AuELyAww
	4AehWft/3BoQDO7r+wuvPzaebCHG9a10Rh6MQmDLy4KMqTQdLpz7phVeePtlu43zNaGYx5KxGZA
	pLp7gP6ZK7GzwB60c/Lu/Q4YUvOElDWwiY0hTOtBxq8pVfY3xNPKsgkP0WruYXh1mTKbcSSNDK/
	7jYj+AZ/bMOLIUF5MQDq6W6/WTMabzME+XLMrOX71jbaAX4g=
X-Received: by 2002:aa7:989d:0:b0:7aa:ac12:2c33 with SMTP id d2e1a72fcca58-7c58c2a7354mr21421320b3a.1.1764325515318;
        Fri, 28 Nov 2025 02:25:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElceZ+5sXf28FIfmwcALeTyEwrEaZoHYrPc4zex0f3/yT0I2F4BVk4hndXZaNhkmXYfAWmIA==
X-Received: by 2002:aa7:989d:0:b0:7aa:ac12:2c33 with SMTP id d2e1a72fcca58-7c58c2a7354mr21421293b3a.1.1764325514750;
        Fri, 28 Nov 2025 02:25:14 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1520a03a3sm4621255b3a.29.2025.11.28.02.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:25:14 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v7] arm64: dts: qcom: lemans-evk: Add OTG support for primary USB controller
Date: Fri, 28 Nov 2025 15:55:07 +0530
Message-Id: <20251128102507.3206169-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LS5B67V-SgT-fbu5PNdkWkiBXFFh8FpN
X-Authority-Analysis: v=2.4 cv=QOplhwLL c=1 sm=1 tr=0 ts=6929788c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QAzQKOYyiUK49Y4y4FoA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NSBTYWx0ZWRfX29r59gjhBajT
 DJI7yhMc/lvbHNEoTscr0s6wBcbRUPj0IaYjJyW4V3ZPiHUqEl7dkC3dyX8k9a6yO6jZ/0C7LOF
 AddZ084wlRA7iJpjw/BC+Z7Y92XvoU/f26E7J/17tYmTU3qDY2VRmRnNvRTYHC1HqHRcQ3fB8FE
 vgdWSEGvZdzwxrDCzBWpmNOMBFFlmVd85j8lPOm+5C47teFiR//8aFcR/+q/9gLEsJUIr9V2zZp
 pUSYNbPuuyu0h3Vw4OQwFmVX6j05OggfBHxyfH3WReviOTvrg7HwPgZzRCraVq19uxCg68Bo/tj
 M1fFAsDxZgMgvAAYU6oNZXgj9QbA3EcQAnsITvRQrSLYHt0VvWzvbHgsk0dnxf344IAxfOsUZgM
 WRuftIKuM+fKeI0pLV7XM5wJxeLSwA==
X-Proofpoint-GUID: LS5B67V-SgT-fbu5PNdkWkiBXFFh8FpN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280075

Enable OTG support for primary USB controller on EVK Platform. Add
HD3SS3220 Type-C port controller present between Type-C port and SoC
that provides role switch notifications to controller.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v7:
- Renamed hd3ss3220@67 to usb-typec@67
- Compile tested since its only node name change

Link to v6:
https://lore.kernel.org/all/20251127073537.1218832-1-krishna.kurapati@oss.qualcomm.com/

Changes in v6:
- Renamed remote endpoints in controller node

Link to v5:
https://lore.kernel.org/all/20251125110420.2192971-1-krishna.kurapati@oss.qualcomm.com/

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
index b40fa203e4a2..2536ebe36edb 100644
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
+					remote-endpoint = <&usb_0_dwc3_hs>;
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
+	usb-typec@67 {
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
+					remote-endpoint = <&usb_0_dwc3_ss>;
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
 
+&usb_0_dwc3_hs {
+	remote-endpoint = <&usb0_con_hs_ep>;
+};
+
+&usb_0_dwc3_ss {
+	remote-endpoint = <&hd3ss3220_out_ep>;
+};
+
 &usb_0_hsphy {
 	vdda-pll-supply = <&vreg_l7a>;
 	vdda18-supply = <&vreg_l6c>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..bf869c5b5ee0 100644
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
+					usb_0_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_0_dwc3_ss: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_1: usb@a800000 {
-- 
2.34.1


