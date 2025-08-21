Return-Path: <linux-arm-msm+bounces-70214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F2EB30187
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 19:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C3EE1C82B80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 17:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09149341AA1;
	Thu, 21 Aug 2025 17:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzKAwygS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548A5341671
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 17:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755798900; cv=none; b=iU5qMd/RLqy0IiNhduhxRRI4yYXM8GHMs+z3AO09AHHNHfJqQLMlk+VlSg37BK+rwdnT5UidtI+uGII5mbzGdYBGVfU7V4Q2iD7NmMtHBX+2CZYWliHDwnjpKudjJn+D0MadOxlCX68sLzpjNCf9KzvVaV3DIORVoE+v1xX3LjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755798900; c=relaxed/simple;
	bh=PFa690eod7vbQoPrBTBGBZTqe+BMbVh+t4iOEti3jnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nGr6zctTbLBQaYQeka+elqGgRNaNKd1Ta359DCyde7c7F+JsqkLkfHlC1I8/h96nlsWf8ggeupgo0yFwxL9R5ObPvY/qi+NpjH013lGazUAtSXu7RLZqGsKpNPXl9FSKqtBfnLzlXFYzp+GH1MTF89WvIHWKJcYhNeDwHTRkstE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzKAwygS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bDaM015772
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 17:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7F2iS3xObjAX92GGdMnwxH
	2K3kJqgrYwHb57/wCGVV0=; b=dzKAwygSPajxfPtAWa1k3jE5nomgXSYgKLT5/k
	yp9Yt4uNmcdzb5Ga9TEQU5vDSr5UBRbZANGmMD4VwRPdNOADDMTcAJpqK//Q1Zc4
	FyhkwNYQSWOPiCfb/LsV5DuE/GSnMXSX7P9ZLd/SMNEPb2glg2aS/+ifqZ8PPWBT
	1mXS+/ay9PBm1LDhhePvR+7iSZ1/tZ10KY4mwLEZltv2BJLFkOPDQTmV1mGagPx3
	RPFj1ua//tJY0UMoqCkTUEtI4IdUq2Noj0Tq05aabNJSZwVxjqU5pnCr4FFfhFiN
	kG2fkJb55uYGRpZdZVvMBwLARc2dWN1TlAq5U5O3UH3uCv+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5296aj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 17:54:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e54a1646aso1427162b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755798897; x=1756403697;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7F2iS3xObjAX92GGdMnwxH2K3kJqgrYwHb57/wCGVV0=;
        b=aVQd2ywAkIx+bP7E+iuC96IfO1WfXDCceP8NGRH+qDN25aYxO6BhHXrCldtD3/nSRu
         t7mCK/22GZe/JEx8QhqmmPjz/KCbwQdHgIwN4EpmmgPOVl1PphiwDOO7MSjYMAckLtj5
         D8NQWG4F0uB/A8GshrdGTc3h3MNAstHD7slF+pR1/I9afuh5bV2mZSE2Hz8L0MbUjkPE
         tu2JMr6vWwP4FCoNyaq5ESqFCSYO12EkT3JNzXgNf9QcEyQUdRNXH50ifTOvTIkkYUJ2
         VsF64Uz+f4mIJ3bk4MooVd8P7A3coExG8qvQpop3uqb4xWfuqroiE3AquUl9WXYTRfB9
         LCQQ==
X-Gm-Message-State: AOJu0YyJts0xUVALXyOtJreRGErtsUE71Oc6sWuDo+pI0wh8QQsyo9Bv
	VN+gm+Dlir8DOfH/3Ajs3L912HWO2o+iPgMqDsGBzkgst6yAgeOqHyvSJZQjp9A2YQmRjciDcgw
	kpj+cHd9wl4iPZTg9c2bhXcRtqkgCuM7ek3cVzke7QcnBWqWOZVjhHns2PCSf6GuU1ywO
X-Gm-Gg: ASbGncsSOprPcT0KkK6oIpf8Gs1Cm/atwVHUQF6fW0RFpZId/+CqRcIsNS21Cqh8IAE
	sV17O+S3lnhzEYMPNv6y4ZWhSuoT38WnMqeBsu222iWX5Pbnlj8KcQlisZAgwhojQ9etpEUi3/h
	zrMspW4J6PxAgVk5prsjLe4xl2kC1V4R/kp3cvkJdL5Hxzq6rCU8xGTsgBaMgcecuMroT2Ejdok
	cVYbhLbNx5Vinlen1J1qkSiKWyEAunXSNRvDk3P5T9u/hB0u3P2nKvZJZctJnElQWibfu6le47N
	yKyXmyZe9tmfz1qMmIqynlBtOAhj8RSmsrBNT7H7f9OqWpIUqkPKaRjSlMT6ArdBRzT0KdVYfUd
	3
X-Received: by 2002:a05:6a00:1a8b:b0:76e:885a:c331 with SMTP id d2e1a72fcca58-7702fc7597cmr290726b3a.31.1755798896585;
        Thu, 21 Aug 2025 10:54:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHdfCq/ZDg3n95yEzjK9PbaokU3P+W+8kWA1gzRlO4XEPL8VOLZfw4yxx7aajJbuGBkf+VAQ==
X-Received: by 2002:a05:6a00:1a8b:b0:76e:885a:c331 with SMTP id d2e1a72fcca58-7702fc7597cmr290700b3a.31.1755798896124;
        Thu, 21 Aug 2025 10:54:56 -0700 (PDT)
Received: from hu-vvalluru-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e830d3558sm8053939b3a.75.2025.08.21.10.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 10:54:55 -0700 (PDT)
From: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 23:24:28 +0530
Subject: [PATCH v3] arm64: dts: qcom: lemans-evk: Enable Display Port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-enable-iq9-dp-v3-1-8c3a719e3b9a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFRdp2gC/3XPwW7DIAwG4FeJOI8KAwnQ095j2sGAWZHapIE02
 lTl3UfTw6Rpu1j6LfmzfWeVSqbKjt2dFVpzzdPYgnrpWDjh+EE8x5aZFLIXBoDTiP7curPj8co
 xxuCCAdcHx9rMtVDKn7v39v7MheZbY5dnk3msxMN0ueTl2AFiL6JTlqxNASMokHowPgrnSQtlf
 KLBpsQe1inXZSpf+6kr7Ng/V63AgQ9RWSAQvTbqdar1MN/w/Fh8aGUHV/mDWCl+I7Ihzqj2H0q
 pjf4D2bbtGwZgUwlCAQAA
X-Change-ID: 20250711-enable-iq9-dp-addc9c7195c9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shashank Maurya <quic_ssmaurya@quicinc.com>,
        Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755798892; l=3547;
 i=venkata.valluru@oss.qualcomm.com; s=20250711; h=from:subject:message-id;
 bh=V5g7F5RRDwJD+H4l8qjmFMShWrA8kWLy0TMticjfMnU=;
 b=MaekKgqai/A8QlOyblqrfq3lV3L6YCeYbTrz5UL0DviZdnmMUki016PkLEsXMMHwIHsJWJQ43
 o6nTJw6sVMADqQb55RJI7vcyn38WFZJ/vq4V6rqeAEp80LtoVJ/hPzX
X-Developer-Key: i=venkata.valluru@oss.qualcomm.com; a=ed25519;
 pk=f/CAPG1ZGl5SP8S1GuC97WMhUEV87h0JheHkNMt1nhM=
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a75d72 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=Zrbf0049nC-wOleC0xsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: irYJwWqqvhHWDF10wcW1PngTZDuypjtt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXz+dCMxAc/Dvn
 +MS++K9Ak/EtAAZE5M2fQSgaD8XJ2LP5otEYv5kR16NSUQ1ZJECihLvPFjsdxewsVjCb6/qCE00
 mIZBezVvoMK80KZ0GW3q5tObAkwpeQ3lmCC8abl4UW1O0xCal3/8wOgfou3bEqAHtMArReRPRWN
 zMNT3hht/S5PEjZvw2SbSfghKhbVcEm6OZB4PEMijIkA+v2HMfRCAo8XPcrNPe+6fQuhxHXjS3F
 xmBwHfwTaelQwu/XUkOOtOh+wwd31hfEPUA/aKVBzYPljCjUyFoHyley0jOpcroB+Q4yDx1buPK
 Tkd1v6ubS04F6e7SOpsZxsBKjcv12slg/ij+p0bAxju9qG+lsWke1qdA1Q24DwdfImALYK3+xDb
 ab5zgc3qy5bk+RzQ6osmFoAfhEmzqQ==
X-Proofpoint-GUID: irYJwWqqvhHWDF10wcW1PngTZDuypjtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

From: Shashank Maurya <quic_ssmaurya@quicinc.com>

Lemans EVK board has two mini-DP connectors, connected to EDP0
and EDP1 phys. Other EDP phys are available on expansion
connectors for the mezzanine boards.
Enable EDP0 and EDP1 along with their corresponding PHYs.

Signed-off-by: Shashank Maurya <quic_ssmaurya@quicinc.com>
Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
---
Changes in v3:
- moved pinctrl nodes to soc dtsi.
- Link to v2: https://lore.kernel.org/r/20250820-enable-iq9-dp-v2-1-973c9ca22474@oss.qualcomm.com

Changes in v2:
- added dp-connector nodes for edp0 and edp1.
- Link to v1: https://lore.kernel.org/r/20250711-enable-iq9-dp-v1-1-6d381e105473@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 70 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 12 ++++++
 2 files changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 669ac52f4cf6aece72141416068268531fd9f79a..9e415012140b8a0c17c36580b9c6d3ad6cadcbca 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -22,6 +22,30 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	edp0-connector {
+		compatible = "dp-connector";
+		label = "EDP0";
+		type = "mini";
+
+		port {
+			edp0_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp0_out>;
+			};
+		};
+	};
+
+	edp1-connector {
+		compatible = "dp-connector";
+		label = "EDP1";
+		type = "mini";
+
+		port {
+			edp1_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp1_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -253,6 +277,52 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	pinctrl-0 = <&dp0_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp0_connector_in>;
+};
+
+&mdss0_dp0_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&mdss0_dp1 {
+	pinctrl-0 = <&dp1_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss0_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp1_connector_in>;
+};
+
+&mdss0_dp1_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 64f5378c6a4770cee2c7d76cde1098d7df17a24a..7c9972c28a54008dc0bc1b556d93c0707a278dd4 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5004,6 +5004,18 @@ tlmm: pinctrl@f000000 {
 			gpio-ranges = <&tlmm 0 0 149>;
 			wakeup-parent = <&pdc>;
 
+			dp0_hot_plug_det: dp0-hot-plug-det-state {
+				pins = "gpio101";
+				function = "edp0_hot";
+				bias-disable;
+			};
+
+			dp1_hot_plug_det: dp1-hot-plug-det-state {
+				pins = "gpio102";
+				function = "edp1_hot";
+				bias-disable;
+			};
+
 			qup_i2c0_default: qup-i2c0-state {
 				pins = "gpio20", "gpio21";
 				function = "qup0_se0";

---
base-commit: 1aa50d938e88fcad1312467bd09be4037bfe68ff
change-id: 20250711-enable-iq9-dp-addc9c7195c9

Best regards,
-- 
Prahlad Valluru <venkata.valluru@oss.qualcomm.com>


