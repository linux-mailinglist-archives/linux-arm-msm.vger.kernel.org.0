Return-Path: <linux-arm-msm+bounces-62288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E2AAE792F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A8A97AD9F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 07:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6177C213E74;
	Wed, 25 Jun 2025 07:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oA7wk0se"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4583211A3F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838140; cv=none; b=TXMC3ssBtkV9l8JRpJTkfmbddjZgs0PPBd2AI9ck3bwt85hnwCfczmbmqkcxGpY8nEldqYXXDTEcuO6B6rgfeNYvV2K14P8DUshaaYvo8hsbuEKkJXbl1OoSXWiODOhGftykHoBLK02+dgcZvAQYHKwpxWZC4VrHfjOM412zFSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838140; c=relaxed/simple;
	bh=qmAaAgyAvFaRCJNeZygFXPW8o2/QgBY/gsAXcTTt30Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R1oi/rmYROFptdSt7YSOsIiAvmkcnst97wywnVltyCpWWyLv0ZD8Wky+B7gTY27+VXXd8uTDxjIjo0YOC1mdu44XTaURYVXAPlGPy3isvhmf6czVNQLadnq8QJzT3SZs+bzFkxQEissGuPrf343rjl0V0j9aIryPA1ePJGCKesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oA7wk0se; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1pHNt001125
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10O1gzx2RVhUKUSFNt+AB/dN8LNlejk69sx6Hj6vKMM=; b=oA7wk0seQf8pjVeb
	fjOxIL1cDnX+v9ER0wE1S59VY9zYVnrb3k28FVF+05lmFLcglzgTykw4YzVCHxg/
	fsWAtsY2/YoT4MOl38y+7uHEUDh4RfGBCdUFtK+bly+8n2jOMbzyzc6l035G1l+D
	8X+/iAVqtk9DbWNduhFVycj6u22Ow0ko7v//fwDJTE/k6nvv3kqRdQBzh2/dQyc8
	7KB5DgjzDGN/v811C1IduIWylWzJAkLiqOrQWwG5aQElh3yolS/MOm3gRG/CP+LM
	u71Qj0Wn1hc/b60rLYEiRiitl1vrW7l5uJ+Nvc/rCDAruH+nbEHO1WOvdCkB44xY
	RS4I1w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7td8udx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:55:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so7797499a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 00:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750838137; x=1751442937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10O1gzx2RVhUKUSFNt+AB/dN8LNlejk69sx6Hj6vKMM=;
        b=ojf+/vniK3UsuU8gkhwJ5ykN2oTqfxTWqNtGz6h6IAGow5Re54boTold2Z99Z0220G
         IoRxm9hYTT7ATCG5+vi+TCazfd2B6ZMfdTdNk8egMeVbzwln7UQdGBtjqJ8nQPzVPLzH
         kl/rvzwt2l//6GcErTLyRfpixQm8nqGON6ryWtue81SJmmQFyWnFf+3a3GY4MoPyacsU
         O+29sUjrf/jT83SdBKHxxmYyzqZVeXjlikdpoHdeVyTbi+rUdtSK+rDpydbcGc07Yd40
         tVYEv4kNcigTrchOyCaZ27my92lTYVstoZd1adtJ2/apxnrXi/ETTuya32IY/LUPLcUL
         BcFw==
X-Gm-Message-State: AOJu0YyKl8NzNte0OaJJhEvVQCWpdIgN0rGaoWHCHEXxUXvCENm6CzrA
	69RmBXTHH0XDVB1WUQedlg62gPckhOL3Ilwm1bwbfWLX7wICZElZhr8UsaYBabdJkPmAFd6trkD
	dNY1H3CgbVMglrGMrosHPDIE7jJYxxk+J6RfieA+gt/PAC7os315t8vpyxdAeMsAAoln7lxAxjs
	hjGtA=
X-Gm-Gg: ASbGncs9cA8+aolulQf+VOpd+T23mQ4f4Fo/IUpmbJ0cXt7YvwfbJht4th2M1/QZLr7
	Yxv1gBstDOzoxE3xi/iuJmtFc9pd7kJUqHSRhT8VRyq8nTXJQDZcaKIbJ/G2ML2jWMLvNBAD7Ky
	pA2h1EIegblNe8PDnljldibHXHyaD/opiBxpBZzxz76IG1KuR1ErS7fUq0YoZO4zoIr4r1beGdW
	oDm5qrohLBxltVxcEzjSbdx4JddKwlPZU+7COSCFbBSQinRPLXT4Hf0eKZqauuBU0NMmboN3Rva
	5TaYPY20D8BakGT5VVKCQDbN/r5C71EmMto4LVvzTp3Ztktra5S0Iczn48pgd1S4F42Qp7YEDWP
	ByNo88nO++g==
X-Received: by 2002:a05:6a21:680b:b0:204:4573:d854 with SMTP id adf61e73a8af0-2207f1adf3bmr3113953637.9.1750838136943;
        Wed, 25 Jun 2025 00:55:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC3jHPZgRF6kJlMuOp8DFSDHAfRZ3QhMCmd78xMwOjAaKhLkEJyX5fbMo71k17lpmzCifvGQ==
X-Received: by 2002:a05:6a21:680b:b0:204:4573:d854 with SMTP id adf61e73a8af0-2207f1adf3bmr3113921637.9.1750838136522;
        Wed, 25 Jun 2025 00:55:36 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8853133sm3707478b3a.129.2025.06.25.00.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:55:36 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:55:07 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-qcs615-v2-2-0f1899647b36@oss.qualcomm.com>
References: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
In-Reply-To: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750838128; l=4666;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=qmAaAgyAvFaRCJNeZygFXPW8o2/QgBY/gsAXcTTt30Q=;
 b=F2RjplUhdhDnPLL4TvkSqg+/kunIM+Sryysuj8fqy1bInJdbHRTxcCvmjWlIKszBn6OtXSgMQ
 Tt4NF1M0DbqDFYe/0+38Kgiy1A0Q3XNPkVV6KNnTWbRnMw0XQuWagKF
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685bab7a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=cKvnr5XBRiLjHSnd2BMA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1OCBTYWx0ZWRfX8JyRTHHOp1bP
 WrV+kQYM99aSRBfH/1ia0L2pVTf7Ur7XLgphUwSoEEnmUUH3dlV22oApX1DWQrCJGSRa6qmJY9E
 3a9VB83bSrwpXRZZMo/LAcNtvJw/oSQdSqVk2bwAM2unuxaDSeiXxUVHbG8pbqh0lWfPvXUXhyA
 XWYKeXNg5YnmkrKYX0nUraKYvGTCbGEqOyxrbzqKoNPv7i723vbKzFmyYEzS/ezafeOZOCUgGgF
 AJve12TCrwihtqegZBrndyc+sV604Nts9HS4CAbLs1rqMSjW3DSS2hwM3156Kbj2rS1KdfgB9mk
 Mrr55oTi1BAZuOZ7u2put3oQYh5u3/HF9flrnyaoQqe1Idvz+QpNmIQ3v9rQ2PywvixY/hSW/uW
 DjXXCc7asY67VWpUxGrm7Ns6nBKD+OlOak4Wird+IKKnIqgUtATXAdDcYSD5NDrLN9n6IInj
X-Proofpoint-GUID: 975Hw14WWQ1uerAQZ4YlKR7Wiq-nkShy
X-Proofpoint-ORIG-GUID: 975Hw14WWQ1uerAQZ4YlKR7Wiq-nkShy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250058

Add a node for the PMU module of the WCN6855 present on the qcs615 ride
board. Assign its LDO power outputs to the existing WiFi/BT module.

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 131 +++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 011f8ae077c256f079ce1b07720374a9bf721488..69597b6f9d0bccb294a6dcac3fe4eb0e21f2cf7a 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -18,6 +18,7 @@ aliases {
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2;
 		serial0 = &uart0;
+		serial1 = &uart7;
 	};
 
 	chosen {
@@ -209,6 +210,83 @@ vreg_l17a: ldo17 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	vreg_conn_1p8: vreg_conn_1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p8";
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_conn_pa: vreg_conn_pa {
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
 
 &gcc {
@@ -234,6 +312,25 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		qcom,ath11k-calibration-variant = "QC_QCS615_Ride";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pm8150_gpios {
 	usb2_en: usb2-en-state {
 		pins = "gpio10";
@@ -257,6 +354,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/qcs615/adsp.mbn";
 
@@ -274,6 +375,13 @@ &rpmhcc {
 };
 
 &tlmm {
+	bt_en_state: bt-en-state {
+		pins = "gpio85";
+		function = "gpio";
+		output-low;
+		bias-pull-down;
+	};
+
 	pcie_default_state: pcie-default-state {
 		clkreq-pins {
 			pins = "gpio90";
@@ -296,6 +404,13 @@ wake-pins {
 			bias-pull-up;
 		};
 	};
+
+	wlan_en_state: wlan-en-state {
+		pins = "gpio98";
+		function = "gpio";
+		output-low;
+		bias-pull-down;
+	};
 };
 
 &sdhc_1 {
@@ -336,6 +451,22 @@ &uart0 {
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
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;

-- 
2.34.1


