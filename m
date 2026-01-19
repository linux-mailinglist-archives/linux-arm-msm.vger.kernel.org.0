Return-Path: <linux-arm-msm+bounces-89588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E1CD3A26F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B7EB3002B98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CB8352C3E;
	Mon, 19 Jan 2026 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WL6pk2Jc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJbCufWk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E69934D4D3
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768813699; cv=none; b=m9Cb9SQwujYlPZ2we+H0Ti86QbwRKGdw0617PqrUg1BeAtoBdSCrn71dy/Bj+fP6kjANHEmITF17oYIs2OHJbZGBLa4GibdKuytlDo7JeWhr8Sl3k/8spK6uwzXP/orjoI2o9nkKgms1AWHUI2rz5ctTg8GZdTZmVyu3+rnNsS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768813699; c=relaxed/simple;
	bh=Gu+agJdF6ovuxnuRDXT9mgfYBZ0CXRnXMRp7Lmjw9SI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hvQNW78AO40yuNfD1kziu7fcQK6P4B2rkYyCCBDiy5nmI0/6qLDKsPvfI860+pOroPEO6TyL10twCU7TkxZicnnhrZxa1/CXjPIRAjc1Kg6zW8G7kXz9KFAO86r9/zUR57zvmLnxyIjXVzE6UMmraSIrvmJ4J/zdrpjxnHRFwpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WL6pk2Jc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJbCufWk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90xgP903057
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RIXY4nL2q+Mkz6n3rwkdrHPb2Qb94VklqJ7
	2ZINucWQ=; b=WL6pk2Jc79AO09/2XGs9wnzEmNcdEaMuvsE2SR8SaHJWLl+39pn
	ttarV52pBh//ihX2SZpBcAcmpASEX3GnrIxvvTcexuM6p/8e6/Vl6VbzE/MldD3V
	MrdT24RiZC9VTcPoi8jiVi7U90zq59TUB35o84B4qqn0qTk8D2qF1zWLLS54v5gN
	hxy0Dml2tO0a+pRqCPWK8RXcWi4N6qmppu3rn/ps266+7Yzr9fxpNvl4FVpesgPg
	ZUREKrXUgoDw+SICnIwAAYUchGm8emq0bbZzbheTzctGs+QCHgYJ5F6Bl0ONv4Sd
	OoT0zZfjVpF2N/+IjFMWwEnVz/pa094qPDw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4ys6ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:08:16 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124627fc58dso1087472c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 01:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768813695; x=1769418495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIXY4nL2q+Mkz6n3rwkdrHPb2Qb94VklqJ72ZINucWQ=;
        b=RJbCufWkCWW+kk5d4FucX4ZQnd6gIFPFOuNhP9adWnmUBYoDo40bUtYKIl4cr+/Imf
         MtFptNXyuYnV/PJ+oVTWhwFL8Fy5G3eNN01lv2+J9IMamF0qJUD+OFms1vQCI5nEWkFQ
         0X/SWqHovvnDuWgkxKOAA3D9hsbRCqqmDzWXpnxMkIa0wMItWvWERatJr1RqjizN3vkv
         5c/4Y9YIDBnAUQot0Sw8m9yK1x9yw1xtFBZHIzrI2ds9EcAe+axwI9p8NvRGD9CH2ISp
         d/n7A/PyFatLYxJG1akd1G6B0VC4OxJtZHJ+1frYK8+YCnVi+SKMexs3R2kWFoKbnv/v
         QF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768813695; x=1769418495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIXY4nL2q+Mkz6n3rwkdrHPb2Qb94VklqJ72ZINucWQ=;
        b=KvVYSgEKvqbCHxca9Qwh/OZNavQ9vdI/h/Jus53MJwxQ8rsPPlFBc0CGKE4XvmzSzv
         7cvlUDEGuw2OYmfbz1OCNbxjUZlCPTazP8Dc9xXak6QbZhCn+PbX+hpOGEjMRJqnmbCd
         r7h9HPnSupIQ7fC+IOAyQHAfIt3+g0kRIYmCb/VMOnKau9JSJ64A/EqZJ6zII5xUTYo7
         D11MtQbr6gMGUQbL4GeQ3oTvyMV1LC3mipF10mxfRo0ztpFsirWlsTs3CHqKgWovjQDO
         0WV9l/ipXZZI+6yb84IvEGsgiBioN/pTx9Sr+Tca9A5p2WLUB904ATwxUCn0RK9kY40O
         TVTQ==
X-Gm-Message-State: AOJu0YxI8VnzXgJYkOXaHRR3EGfF8Ni2c0RdEw64S9dYtm95qtR9Req6
	VMuesvkhPm+pabLerwt/oCU9sUlUJDsHDfHWNpQibTRaLKADUcnajAyAgbbb7ejHLkS69k/wpqQ
	hSpesW5Vw2r9d7q+kKr5hZJ8emHiog+CM3BJfHBQJEwkubDz0ansFtejesXC3vuLTDDYf+bI3lN
	3/
X-Gm-Gg: AY/fxX7xhJhTWHsCcSFgd9ETHEBag2/Ueq8qBpUEspNxQcpVLShIrznszN7wO3FCo2H
	EdvW6V6qNqrCGIpjAjlqSkwlF37Uh5Iktnfkk9/JPgJYfEEsVS8daqiZyWtLou0F1SReoML7WCA
	zue4EcQ0jGvY4aLV8NvypHVR8ZZ5VfPG9LfkhFFITSPMwUbKQbLsRq7XxSHTlWcA8qHFZNMzojo
	pYV//0YQP0OIC0SoYR10y5lH1s3HSnkQCXvsS+ZbeiVi/TKIY0PilgLDdTMGBsH6Ck5cnvDMDPZ
	avDlvlBOU4SLe08DQbJDgmOA+L12oW3yHpBdH4fiIE1K2wgQjefvRBWhMUKyUDlnW1AA1/vvTab
	EeGZnqzHQTiryJTwsuhkMyyVx+vANizvHu7v64yi5XHjI5032EdJXhnQt1VnJzl033g==
X-Received: by 2002:a05:7022:220b:b0:119:e56b:98a5 with SMTP id a92af1059eb24-1244a6e358amr9027380c88.12.1768813695162;
        Mon, 19 Jan 2026 01:08:15 -0800 (PST)
X-Received: by 2002:a05:7022:220b:b0:119:e56b:98a5 with SMTP id a92af1059eb24-1244a6e358amr9027358c88.12.1768813694538;
        Mon, 19 Jan 2026 01:08:14 -0800 (PST)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af22aaasm12728885c88.17.2026.01.19.01.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 01:08:14 -0800 (PST)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Zhang <wei.zhang@oss.qualcomm.com>
Subject: [PATCH v7] arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride
Date: Mon, 19 Jan 2026 01:07:58 -0800
Message-ID: <20260119090758.2780678-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696df480 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=vM19rjaGBDlTF_Dnh2IA:9
 a=vBUdepa8ALXHeOFLBtFW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3NCBTYWx0ZWRfX2R8iK91nUBbf
 hnHj2ZGV83zcl7w/FUU4USuzLQRJg3meH2pZFlMw0/PXGr1Ysz1VA/54YueOoOyjLNvYPmSDRcI
 Uo9Ia7whF3P6QNIPAVfh4poDxMz8W4wkNDi2/KAMPifzD4DmnV0IJy6iJZ45zJPhnvO1vpAPr1O
 97f+YCHCn+nvbod9BsOJFXYYNUTdVAWSiPW8krZlDu8y5t1o7ao1YTZlazolHaCW+YkeXoyrygA
 FQ6vYzYZnPIvRUaN3pumE4/Q04uaAJUz4ve96MfrsD2xQp3K/TQjr2UtBmpcva6qnsOtnFX3P9m
 eP69nIW55HDSqlfJKIvY04wGXEzel4QvDuKV2rcCoSjVHvF91kk3ycZPYaSN2qdT6j22Kc9yNaH
 almUhiXocJzCcjpwOtxq8AfoLe9eYT99H1y+d//CHexRUSbEjqdX1iiaUYdSY8FiQK1sY44pb/C
 B58HHY7RNr0l25wKqKA==
X-Proofpoint-ORIG-GUID: qtI3_fbVUIew2Lij1Ey2-naBOG5eZzm3
X-Proofpoint-GUID: qtI3_fbVUIew2Lij1Ey2-naBOG5eZzm3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190074

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
- Link to v6: https://lore.kernel.org/all/20260119080125.2761623-1-wei.zhang@oss.qualcomm.com/

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


