Return-Path: <linux-arm-msm+bounces-89573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF2CD3A0DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8663D300519E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242A733A9F2;
	Mon, 19 Jan 2026 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvZafzm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RctJfpkN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C3A33A9CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768809698; cv=none; b=gpivGjLyUspnsj9yAZj7rBNv5Zv4dvzjnat5dyENU0Ugdprtzlty7KfDWP+AgFXNxxcWmy5Qdw3O00RtZ1LUWuFg+hgFSFUt1gccrnE38H/2sJKcHYCh43D+XCbXPJ2cSP6I08KLt1oax+/bP3kBXN3VEj00jcykkzvpNbS3AOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768809698; c=relaxed/simple;
	bh=pDmmNocizfH76SRA8j9jH8fEjG3n9Kxj12cOg+1ovME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UY6gr1uJFWaBYcDSgKzIIn46MO834Il7AQGHnZlGWi81Qk4wgTZvLSLPDDWj7vHSsMRw1mw9G4/urvfvTOpD/ts96EGsem1Rcy6lGOF0otWXYSCyLG/ssClMuTttNrxUgZY9thVj+8FDu5AHV1SkO/8HUgzJRt6M9dZusXIGHzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvZafzm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RctJfpkN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IMQwIT121490
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xaVXVeSfRnDWf8J/BOUi6fLiNP+XpcMfhyY
	0HzLwJ5w=; b=UvZafzm6ZzMffZ43JU+xVjYGUWjFpYrOsr5MihQAU0MfzwK+2US
	Rx/mgBP2gnZoXcDbHEjZFIGHN5JbTkNLm4AaXHuTlmPIFodgCPkYxoQLhVFMRQRz
	BW7gD9ytdXKYqlOyKKO2hHi7Un4BvunMRVElk5DF02XtGb9mU4F/+960YGEl/GUp
	Nk6HmFVIjaNuHvVcgmgEzUSdWNQsX0WusPA4SfvtZ0j6VDXQZfDE0uYHRPbTAnnR
	QX2RxJPwwC0fOLu9e/HKsHfggES5aP/e7ydQ/14Ev5RqlyaW2ACWAHvhWiQPGC+1
	4i2L8a9JbmVnHwkVyoCp4ypc1eyK+WMrkdg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2gum8a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:01:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b6e793cc0bso400829eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 00:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768809694; x=1769414494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xaVXVeSfRnDWf8J/BOUi6fLiNP+XpcMfhyY0HzLwJ5w=;
        b=RctJfpkNDmhOE/WCIRN+sxkN7pcZ3aXD4Aah8ImANHWUaZ95hVrOEm0M5noscrvFq4
         rEXpJgq3F0IScoNjT/tk1hOnTve5+0IbmM597IPvznILN3og2XlLr6h/XW5h2X/j+xfj
         iP1jW0/UfUvVAKTByv4A/vPHhvy1+r3UwJZjzFAEq6v0p/VjtvU7eJ0fD8tKevsLOZv0
         gSQYZEVq8VH/bjnS61FNOPaarlHOqwttsb6SfkiZ1ryABO4QxM32A23bAphmVetOvqox
         BkzeRnr3tJGSOC4IufIBqrSNiwBAAF2YnxhUdgBCMX7Az6gAhEasRxkV9dP4aMBnIf53
         wcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768809694; x=1769414494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaVXVeSfRnDWf8J/BOUi6fLiNP+XpcMfhyY0HzLwJ5w=;
        b=K2Sej6xdaUaxCzm0bJrV9ybCfoigmIQFSkVebQyfR7fm16np4HmHBvp56MaeiCnhyU
         +UmUi9n0HA/hHDKhW7+Sadqb3EFL+Tnyg2ojdu5zk79+gQLN7uqVDTvtbiSofK3lf/S2
         a87cEorwFjXscB75kpMeSwO2zaodWEbMPvOIhZv7brrTAVYQwdncTdL531bC9nSSlrgl
         PTZnni5liqsGshBCCktOEbboI9XjLhkCqOOZdu5LDIxsjhfWJLV8hllKGXhuWrPzLAkD
         5bhCYnBkQiBqbEoNxKFYriiOU2EbZtpoAVDquaiS8E/4+bxo2D8rxqMv+psU1+2W+iZ+
         2miw==
X-Gm-Message-State: AOJu0YxE7BgV3cHJn+yCzGIYUwjaRZSFGOmFaqKA2skuMxm1xC+6mec/
	hPJh3RJlOh7uI0qzkwt7zeZOAndcg0ALV/tGpiibxqdNf+h3Fx81p+dcbG/vxGkudced1pW7pee
	jvZuYVipE/ObzmJ01+GxPLDC2J6inXJ7yLdbv1ZROe2f68N1apNgYerKslIZLibnUk1DK
X-Gm-Gg: AY/fxX5qQZYzJP13Keni2VTv3eCgPqz2th5V/cZhHKjV09+dnRYqyfAmcZPYfTzKAP5
	kQXaVE92mHOUmPfg26pU5m4CGsMNbytP31/LdipPHHAf0jtQp2dDUu/MVsXESEfYDPcpACm4MDI
	IIDtyMtiEUodi76Y+mBycKvuYm/4VTSrWzfNXtfsSniWFAsbu6I96w8OAMzTsg74it8D5ZKqFTK
	KjVCQGyxWSr7xid9KWjOvt9n4+Dz9mJ/3kLbQBbzvLayxwNyw/E4IcTaSujYw6RLAmVrrAr3DX3
	xNTXqjBJOZIRtzSojuXeDhv2GuLs+MZOQns+ckhAQCv/N/A7DzZbkWTgyz7um17yxA5VjzN4vHX
	hRJPvO4U/FOMzVmI756nSfJBW27c7Zl1MlYCy7vORbqTRDBDzUW9YIWKNyIKavsRw5g==
X-Received: by 2002:a05:7301:9f09:b0:2ae:5ce7:21dd with SMTP id 5a478bee46e88-2b6b3f0758emr7184762eec.17.1768809693931;
        Mon, 19 Jan 2026 00:01:33 -0800 (PST)
X-Received: by 2002:a05:7301:9f09:b0:2ae:5ce7:21dd with SMTP id 5a478bee46e88-2b6b3f0758emr7184740eec.17.1768809692884;
        Mon, 19 Jan 2026 00:01:32 -0800 (PST)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b361f5c9sm12048721eec.22.2026.01.19.00.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:01:32 -0800 (PST)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Zhang <wei.zhang@oss.qualcomm.com>
Subject: [PATCH v6] arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride
Date: Mon, 19 Jan 2026 00:01:25 -0800
Message-ID: <20260119080125.2761623-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NSBTYWx0ZWRfXw+AA3vOMV7Af
 YT/xGqOz7qvVz4cBEqcJXBESVrr4hFnbJuuGC8b8pSvKiZMEBxRt7ry1Y2laNKKjTq04QEDeHOn
 vDLBWKc75hAPjgnjSOCYiU76i8kNHWh+ZPm+pdSNmycETfYdgUhOPsJ29rSZyzcszPetJLQB+Kn
 1OODogZNWmI5ozqO74lrEYdP8XqzRkU80V149Dv9RUHjR7211BP24CDGDeC/SWQElV1BAO4iOpr
 4BIDX1IuN0LBAdBjQcpZm4vLuuDU6BC//KeH/Z3lKpN6v8PMAStwEe9hMvJJAWY8lRCtiPwxnwW
 QV2TUAKRu5iHM5rdMQuPoxNmQIkLUYQAGtJNsd/AURTXlHz4eMIsMNWEMaI8mcZW7hjXlkqE6IM
 t5NDIISisj9a7ZgaIp9xMLsamsgAT6/xwqf0k0OZNf0WTULfJ4w7X+5cAbNUzUoz5H8P7nTweSw
 L+YNiE5kYhGSCeyMXyQ==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696de4df cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=vM19rjaGBDlTF_Dnh2IA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Zt4rVfDkdEWBw20BN7CbzatNwpLIByCG
X-Proofpoint-ORIG-GUID: Zt4rVfDkdEWBw20BN7CbzatNwpLIByCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190065

Enable WLAN on qcs8300-ride by adding a node for the PMU module
of the WCN6855 and assigning its LDO power outputs to the existing
WiFi module.

On the qcs8300-ride platform, the corresponding firmware and BDF
are QCA6698AQ instead of WCN6855, which have been added in the
20250211 release.

Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
This patch depends on:
- PCIe
https://lore.kernel.org/all/20251128104928.4070050-1-ziyue.zhang@oss.qualcomm.com/

Changes in v7:
- Align regulator node names to match the existing naming style in the dts (Dmitry)

Changes in v6:
- Rebase patches
- Remove unintended 'output-low' from wlan-en-state pinctrl (Konrad)
- Link to v5: https://lore.kernel.org/all/20251113055148.2729943-1-wei.zhang@oss.qualcomm.com/

Changes in v5:
- Rebase patches
- Flip the order of property-n and property-names (Konrad)
- Flip the order of bias and output property (Konrad)
- Link to v4: https://lore.kernel.org/all/20250325075331.1662306-1-quic_stonez@quicinc.com/

Changes in v4:
- Rename the symbol pcieport0 to pcie0_port0 (Konrad)
- Adjust the property order in node pcie0_port0 (Konrad)
- Add to the commit message mentioning FW and BDF used by QCS8300 (Dmitry)
- Specify the calibration data using the correct variant (Dmitry)
- Link to v3: https://lore.kernel.org/all/20250318093350.2682132-1-quic_stonez@quicinc.com/

Changes in v3:
- Complete the nodes property definitions according to DTS binding requirements (Bjorn)
- Link to v2: https://lore.kernel.org/all/20250227065439.1407230-1-quic_stonez@quicinc.com/

Changes in v2:
- Rename the nodes name according to DTS coding style (Konrad & Krzysztof)
- Provide regulator-min/max-microvolt to the regulators (Konrad)
- Link to v1: https://lore.kernel.org/all/20250210062910.3618336-1-quic_stonez@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 107 ++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 68691f7b5f94..57cf1edb2d19 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -33,6 +33,88 @@ regulator-usb2-vbus {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	vreg_conn_1p8: regulator-conn-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_conn_pa: regulator-conn-pa {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_pa";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pmm8650au_1_gpios 6 GPIO_ACTIVE_HIGH>;
+	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&wlan_en_state>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&vreg_conn_pa>;
+		vddaon-supply = <&vreg_conn_1p8>;
+		vddpmu-supply = <&vreg_conn_pa>;
+		vddpmumx-supply = <&vreg_conn_1p8>;
+		vddpmucx-supply = <&vreg_conn_pa>;
+		vddrfa0p95-supply = <&vreg_conn_1p8>;
+		vddrfa1p3-supply = <&vreg_conn_pa>;
+		vddrfa1p9-supply = <&vreg_conn_1p8>;
+		vddpcie1p3-supply = <&vreg_conn_pa>;
+		vddpcie1p9-supply = <&vreg_conn_1p8>;
+
+		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
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
@@ -355,6 +437,25 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
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
+
+		qcom,calibration-variant = "QC_QCS8300_Ride";
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -461,6 +562,12 @@ perst-pins {
 			bias-pull-down;
 		};
 	};
+
+	wlan_en_state: wlan-en-state {
+		pins = "gpio54";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart7 {

base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
prerequisite-patch-id: 0e8aad7b8514142fb33c17829386f17c3a55127a
prerequisite-patch-id: e641f09d4139ac77c34757bd08af2db746de3963
prerequisite-patch-id: 4d16e87cf6213d6e25b2c40e2753d4e629778d53
prerequisite-patch-id: 40187dae2c9518a10866104b9fcd5a481ac67d51
prerequisite-patch-id: dd3bdf2aebda74f3603aff24a2c9aaa7f4fd6763
-- 
2.34.1


