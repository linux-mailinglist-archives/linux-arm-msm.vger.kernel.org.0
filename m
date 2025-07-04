Return-Path: <linux-arm-msm+bounces-63608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D8AF883B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 08:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E1416E2DE7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 06:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8672261586;
	Fri,  4 Jul 2025 06:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9hi0tk2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B2C262FD7
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611424; cv=none; b=t/DYlZPlzX//8bnV4vq9CFfCbROQaOb8l+A26J9fAY6aGn1GpT0hqsQaloLduIyUaBmcCbEX44H8opJ16Q4mtTo6ecusH1jWH7oYwNw56qmcbxZCc+apXDyVvT2kxC0bZbAr4ztjbhqgTYB/p0nYeB/PgKZqd+JrpxPuLWEGbfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611424; c=relaxed/simple;
	bh=Y7okKbQ+abWkqsZR3FSBPtlNKOlDb1SKPlwBBSOrJ0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWZW6WkCvdA2k3x3G1j5Pv+7lFtub7WbDYk4JDO7LYT06sCTQYllOOKESwFtE0GTW3qlnloUzR94Qk0Sh+ysJQaFWyQK2l98KlI9itkw0uqOTyMRkd/tdJ5ydwWRbSFNhwpyVEprorcUKQWnPXKfbFqOAKnrIwud+zgGJIDqwbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9hi0tk2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5645iBcP018568
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 06:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XY4mycc9eGNoFjLkdL3V/aOO4QflX+QnXB06ZfuD9dg=; b=Z9hi0tk2usSXxtBv
	a/zkTBJQruU+zy2J1O6AaO9ZBWZgtSu+WuKV2lGhvFOO2J7vKkXeICUgDz8jL35y
	MINDQQ1zRIbtihWITwQU4x8TQH3zj9jVA5yWeVVwJHJ3keTGpC30Mhge1l5/B+l4
	NC5Il/tTedcpzgUcZAKyVGK+T2T8Lz35P7mv5XDVSK/tMpUwAMvkjdZ1Uq5g0vld
	MpUM3KyeSdVPhjEpEy7OzUKoSDE3u0gRmtF8OHB07uQadQHgtRoTaSRlfKwjprQo
	r0O5kOdf9YvmkG7IUQU2sToC1Jc3K2e7h65cgOIC5GD733flFSYBOk9WpcwtllzP
	V++iMQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxtv94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 06:43:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so1303545a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 23:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611419; x=1752216219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XY4mycc9eGNoFjLkdL3V/aOO4QflX+QnXB06ZfuD9dg=;
        b=PXRQ3AqFAgzPD1SAigQEM2qL41ZLGUbCETyq3gmi1n7zzrYgcUqmjhr1GoSpH1cU+d
         TW/ItdT9e4OOtY1toxfceoPZXQ9kjCLwXK4IMM5QQs5N03OgwxbHJLmK0LUPBc59bILG
         oi57bR+vFu2UuwVcSiQQjkq+Spc9YmXr+/HEeW1EBpJ+EilRabKBJxxQDU/zGdl7cAzH
         NbhcRHsh7Vn9RK9uq+L95q9hJYgaPBJkqHmP4IDP6+MNGj1Pla8wRQDnWpiF4qW36pIi
         RIEeXLAbEPyMZYTIg5guYB5jVu0g5ecNH6rZBBIQY4iXdVH3NVoNuVQgJ3/FGeaBjKRK
         y0dw==
X-Gm-Message-State: AOJu0Yw7Wr3sg8bakAXBnQnkyTUm8oH5q+B8EZLQ2WGiSpid4lqQ9eoi
	1hN4HOUhB1ArF0tHgzg/5NoUCjs5Igv3BNxuFFjntC5JsMgCZRNoXZCkzkjvjoaBZ/yo1CSzw76
	EBucGBRo0ob4vaNVcpKbrRYelYI6h86QO9bDsHYP+bo5S7FN+f0R3zzvZy/8KQJz1eC0n
X-Gm-Gg: ASbGncvWIK/S33R2mSFZzDNzYG5SWbjPwIyZ3H5KQm4th2VKqWmvM1fwki5KmapL7bl
	+PB6NtCGvq5jJG9LdGjwYRwUx8rxsiOP/1TDwbDXSVlZ6EXiLRmjPyMnLi7VFZbKZ/HnP/jyhuD
	tABp9Ky+600NyvnYaaicHQQ98ZOwg3zcGrQiSLV26LhA4ynvqsw/ofBHZt3VfLBLyB3gYVgZtE8
	Z86ANie5xDgZp3KuizJFnY/oOwEfGpk5SpB0QSo/j3zARu6As1whh6SViGt30XnkiW88e1jaZsG
	UTTZowUVA0PW/rHKHySWzl19LlGglO9pZp3e4S9aOafYCTZxkJhbCWq0JIWmNuwj+I7bLcQUiLK
	2pXnYzW/tAw==
X-Received: by 2002:a17:90b:3c50:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-31aac447bc9mr2535366a91.10.1751611419091;
        Thu, 03 Jul 2025 23:43:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPVGGwwAqSgxWpv+FpYeN5/LOE4UCVIYAMsBEHzg/oj6y2VXO0m2Zdc5WReer63LHGOEjuhA==
X-Received: by 2002:a17:90b:3c50:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-31aac447bc9mr2535319a91.10.1751611418516;
        Thu, 03 Jul 2025 23:43:38 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae3e24asm1260338a91.5.2025.07.03.23.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 23:43:38 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 14:43:21 +0800
Subject: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-615-v3-2-6c384e0470f2@oss.qualcomm.com>
References: <20250704-615-v3-0-6c384e0470f2@oss.qualcomm.com>
In-Reply-To: <20250704-615-v3-0-6c384e0470f2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751611410; l=4826;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=Y7okKbQ+abWkqsZR3FSBPtlNKOlDb1SKPlwBBSOrJ0Y=;
 b=7RXT+Bc91c+xUDmJiV/YiILIGEgvh3KUheky5OeXLU/rnK6J9hUdLnb5VC9QN7fm0afmub8we
 SP1Wi1jLIjMBmdhZ506O64lkHIaBwkE8iQvw+mrIso4Bejy09oJsRNX
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA1MSBTYWx0ZWRfX7/LiX9QXOgff
 85TLnsvcaSSCzo4rE/Qsc1rdSLhUdRzORLtDHHZMJS3hGeVQioJkKGtlQdX3dKjFnMukqmkW6Ws
 HYIdc1q4wldLydU9gY5VXP/H+6YZOV0sZPtAz2Scv0UgYNSaHwvs+se59kVqwHCYBSQimKNa79H
 bICNIp0jJy232xbTUacGfa5I+2VwTZpY0gIfsRLPIJAhRGRq8pOID+DGuSvQCLcbhO7k12RzK4+
 LusBKTGmjMXhUF/G1n7gTUuk+amY7PrUyb57nYhD28SuX5tCfPxRlFE7viCT/CcCRUvkOcthm/A
 o56zARtiKnJ0hP8NIMM0O0SEFKSCW6PyKFMEu0wajrL+kO8EY25ATmeh+QGkN+fLsrtY+1qvT9w
 +gL8g5qLidPKEBAC8EB7VWfmLKGP+29oHKVwFmpjoHAGUSw5jLWz1wbNbmmrLHxHml5PODFr
X-Proofpoint-GUID: yFK-xzXKe9K2S075P3kz8ZskQzBe92nk
X-Proofpoint-ORIG-GUID: yFK-xzXKe9K2S075P3kz8ZskQzBe92nk
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6867781c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=cKvnr5XBRiLjHSnd2BMA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040051

Add a node for the PMU module of the WCN6855 present on the qcs615 ride
board. Assign its LDO power outputs to the existing WiFi/BT module.

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 011f8ae077c256f079ce1b07720374a9bf721488..e21524a8ceffca0c68951d04fa6895cac5bb3d0e 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -18,6 +18,7 @@ aliases {
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2;
 		serial0 = &uart0;
+		serial1 = &uart7;
 	};
 
 	chosen {
@@ -209,6 +210,85 @@ vreg_l17a: ldo17 {
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
 
 &gcc {
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


