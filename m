Return-Path: <linux-arm-msm+bounces-66750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8FAB128B4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 05:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E8021C84122
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 03:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3945A17DFE7;
	Sat, 26 Jul 2025 03:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9zPCR1+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC4B1F8755
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Jul 2025 03:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753500727; cv=none; b=AmnwYNXXtP4XSP6lYnewaZMYi/SO9DiM0bzWE57YFQT9PDqPkGGe0hpDs8h+a9w/qRBN3zypN0VVgkFs1K7xxC8BXr6nBcKnSLHvQiF5tSpYrGmraYpyZhWhAfeZ0pR67C/DIpmbGI9/tSOoOxJVv1kC4dj9hDRlCfu0C7mv3Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753500727; c=relaxed/simple;
	bh=FNMITkEVpOoqcIGg54LZ2VRbz7J/tHXA5GygPZyM1P8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a2CN47GSbCuB04qeYYT/xovSRg8pYWuz/XNeAlxGIBEkuf1A6T0WoF1yI4uJklzEMKzep7amKSOXtR3QxGTCO0H5FMCptwTLDWWpOHmDe4UDsPI/D/lZWEl8s02kaTywTdON7Iviw9CtaEkjjpR+ujIOm1kwwQMkeOzjErEjhAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9zPCR1+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q3W5aD019031
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Jul 2025 03:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I3MezgVjfBB+OkOwz/xZS+bTPYSXEs0cyDo86T8LwuM=; b=j9zPCR1+uvf7jTHS
	h/qv4TJIIClvepB+0fYcwjKr6ke3+5FkpxhPLP0xyRH7x9rmngjnLGorKNCZM/RJ
	XVlImaKqnF0VMkC6PdXbKwzXVejgzR5wLT+orYdLOGhx+mxyxsS8SS0irOPjL3KF
	BEbO2ahDvbBTF6u6di6AW129VIAAuxetUTjjl0+mxZCyZS8IpHs0GWOoUj101mTq
	KKPbb42SzfEOIkztMv66iuu51ZvkGuKFkSEzCc/DXNDKVuezTPEASdkjxaRlI5u/
	3oGostqTP8bIBcrepVnEHDZouYavfunTmNOeZaDYAFHZhgi5TbuCZ2aPmEzaPL6J
	hCkU+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2kv5gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Jul 2025 03:32:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-754f57d3259so4068241b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 20:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753500708; x=1754105508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3MezgVjfBB+OkOwz/xZS+bTPYSXEs0cyDo86T8LwuM=;
        b=JjbKZBvexmoxkme0FCHxD0ve8k+slvKvl2XNIzwLOY6mqBWiQR/+7iDmKvkS61BE4R
         DzFXgV26UMecxOcrRKNJXPaaAMd+Lv0ekHUpB8Aj6R9nEpIcj+KtpDaAMOZfQdGl8Msc
         OEsYDjIISfQcn4RQuzMhywd6cg2+lWJqNxYYmZPIW7tMFNFiX6GOLmgoeqgZrTb6G7TU
         FXXO3C98GfKnowACeqg8JBBd82aKlOwt6I6oz4a1W0XLY/o2VqMzV0ZJD4vyG26iXFYw
         wrgfwwRvcLEeZMaLWwp9/ZjlqQVPP+adWDSaxLIZwGZK+OQk2u9OHdoxpdpQ86jlZVcF
         wc7g==
X-Gm-Message-State: AOJu0YxfYG7barE0RC2Z/Im9kYhuQRKP/Px1+D45GqWXWmc+6ON36C5n
	dAbve1hrrUv810BatM1eXKDjGhHwTVrVUMLzwzSrjo2g1IXMhgxMIWwAZrrOo1KazsHq+uahmBS
	eojaSeb5MQ+xmH8NUOQH52gyq1k/M07Ig8y1+c574bknDBfoIeAZQ5NbKTpHsZYMFLwpW
X-Gm-Gg: ASbGncvGN6/VPTV5VD0c3KDifroc90kzG78tbKQmLNznLjAC01AyGxjMp0xP0+Gfe3h
	LvhMo8K4mH/UiIpxl7BVqjDz20i2GSpTFWDedFOlKWCJWfmYuBDDzTd36awLtF4z+sMtqZmwK7R
	9TDQSRiNtF1p+l/qOD6Et+Buys2FYB+BBhKVc5hhJ/XrtDmSVvlMMN+yH1592FH9hMEzp2t0kA1
	QxE5wRfg92VjBP4oAIjFc4Eoz0B3zXXIaLmG9gbGExSwWLLsE4FOLl0y0duI37ueXkiCfnKENmA
	R5KeO6JpBmQGAxgN09oloXRw+ecGg75TTJioTZSqhp/ndCRaQWS2gH3QcQkh6me9hSawHDGpvRQ
	arelZRq5kUoZQsafc6EkPBnseTvxHtd3jFQ==
X-Received: by 2002:a05:6a00:c96:b0:749:464a:a77b with SMTP id d2e1a72fcca58-763349b95e7mr6439835b3a.18.1753500707832;
        Fri, 25 Jul 2025 20:31:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvDltXxmDexaoxMv0d0qGjmAfhk8r+83nLqc4pRPgxBi7p9/A5Xrs/dLANsQcVwj3fRMtg0Q==
X-Received: by 2002:a05:6a00:c96:b0:749:464a:a77b with SMTP id d2e1a72fcca58-763349b95e7mr6439806b3a.18.1753500707386;
        Fri, 25 Jul 2025 20:31:47 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640881f5a1sm724917b3a.23.2025.07.25.20.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 20:31:47 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Sat, 26 Jul 2025 11:31:31 +0800
Subject: [PATCH v6 2/2] arm64: dts: qcom: qcs615-ride: Enable WiFi/BT nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250726-615-v6-2-42b8150bcdd6@oss.qualcomm.com>
References: <20250726-615-v6-0-42b8150bcdd6@oss.qualcomm.com>
In-Reply-To: <20250726-615-v6-0-42b8150bcdd6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753500699; l=4837;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=FNMITkEVpOoqcIGg54LZ2VRbz7J/tHXA5GygPZyM1P8=;
 b=u3NyJYcOA3iqa6fhYkuKSAAqh+G42YJg6+/h00NCcmprwdY28bIdIRuzbXi1t9G1KwQqntoQ0
 KifDcwVaFdZBgPV6yJ1cu0LcC13aG8Fato4kt6gXxyHu6DDWbDA9nLZ
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Proofpoint-GUID: OPQEyXuP7VoAKQUfhih2Zsoii-F6XBNZ
X-Proofpoint-ORIG-GUID: OPQEyXuP7VoAKQUfhih2Zsoii-F6XBNZ
X-Authority-Analysis: v=2.4 cv=QNtoRhLL c=1 sm=1 tr=0 ts=68844c34 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=cKvnr5XBRiLjHSnd2BMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDAyNyBTYWx0ZWRfXwGIG+MvoYGd6
 1CDf+WGhf+lgRqdu27FDXpxvbkQlN1tMaitSPCI2iazWkaTL/U+q5Sw5NwxeB1LGgH0IHn05iuD
 ErWgzIFfU+irrmSRmvUfJLMUVm/Xc0xJZz4X0uxGR6ps2HqCE+LLo+gVoL4gcTkR/HK027HYRWF
 cG2Khfem8mhm3jUsVL1uisrzFr+LHdHmf4ROAw5UpfSGMYhQWAr9ZdpdNm77+3OWD86c54eCKH+
 rs352NXNJyWstruNNdqxPYAgNwrx400AvtiBd6vwxpCPHV7KB2Ra7h3X3Mw/dF1sVVR0wAnKTv8
 3pjWv+IJODuf0Lu49mQE5/dDzHN4qmWqwlqWkwcQ8RF2mKb8YsuIl0VI7/eTVbbKgrMT4dTK/50
 BJcDv41hWa8lZzRop12N5RXnY+epp8BB0VxnONFULD7vfPo6jr9CMg+ajX84Srp05Nta5CQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260027

Enable WiFi/BT on qcs615-ride by adding a node for the PMU module of the
WCN6855 and assigning its LDO power outputs to the existing WiFi/BT
module.

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 011f8ae077c256f079ce1b07720374a9bf721488..f6df6a88adc8cdc416a57d38b8eaabd53fbe3fcd 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -18,6 +18,7 @@ aliases {
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2;
 		serial0 = &uart0;
+		serial1 = &uart7;
 	};
 
 	chosen {
@@ -47,6 +48,85 @@ regulator-usb2-vbus {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	vreg_conn_1p8: regulator-conn-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p8";
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_conn_pa: regulator-conn-pa {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_pa";
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
+	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+		pinctrl-names = "default";
+
+		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
+		wlan-enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_conn_pa>;
+		vddaon-supply = <&vreg_s5a>;
+		vddpmu-supply = <&vreg_conn_1p8>;
+		vddpmumx-supply = <&vreg_conn_1p8>;
+		vddpmucx-supply = <&vreg_conn_pa>;
+		vddrfa0p95-supply = <&vreg_s5a>;
+		vddrfa1p3-supply = <&vreg_s6a>;
+		vddrfa1p9-supply = <&vreg_l15a>;
+		vddpcie1p3-supply = <&vreg_s6a>;
+		vddpcie1p9-supply = <&vreg_l15a>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -234,6 +314,25 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pcie_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		qcom,calibration-variant = "QC_QCS615_Ride";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pm8150_gpios {
 	usb2_en: usb2-en-state {
 		pins = "gpio10";
@@ -257,6 +356,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/qcs615/adsp.mbn";
 
@@ -274,6 +377,13 @@ &rpmhcc {
 };
 
 &tlmm {
+	bt_en_state: bt-en-state {
+		pins = "gpio85";
+		function = "gpio";
+		bias-pull-down;
+		output-low;
+	};
+
 	pcie_default_state: pcie-default-state {
 		clkreq-pins {
 			pins = "gpio90";
@@ -296,6 +406,13 @@ wake-pins {
 			bias-pull-up;
 		};
 	};
+
+	wlan_en_state: wlan-en-state {
+		pins = "gpio98";
+		function = "gpio";
+		bias-pull-down;
+		output-low;
+	};
 };
 
 &sdhc_1 {
@@ -336,6 +453,24 @@ &uart0 {
 	status = "okay";
 };
 
+&uart7 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;

-- 
2.34.1


