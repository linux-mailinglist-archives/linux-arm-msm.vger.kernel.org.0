Return-Path: <linux-arm-msm+bounces-41233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A12159EAA83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55BB7288752
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 08:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC62230985;
	Tue, 10 Dec 2024 08:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PQX4AYDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3096422D4CD;
	Tue, 10 Dec 2024 08:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733819035; cv=none; b=lkvBWb5q3F/XThwWL5e/Vp2Fpg3T5JvIlmg1IAurttCQTcureypGhq+iGFLzbdF18Hz5IlJcfAAa+gKqaMvZLkjFFcu0fxU8PrGBiat0vh4TTYhmwLMmR1Mu/Lg1K2j3/TcgvhfFP08140d5lXOFmUjhuzaLXVgkMOsB7Zx2Pyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733819035; c=relaxed/simple;
	bh=LxVL3dWaIY5BiEszPJpsF/yeGkMBUNkZigOVtbf3bvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=ImAb8sPYKQpwIvsPDVrJxS4KpkddnS+xeV4Bsf8C4bfOulBJROLQSsT0X2FzMni/ufvwcVX/77pNRMt7b5IrqdPHRf9sKLInLA1CrDSeOPgqWgGyobIEjRwIPiI/Bak+n6ixknxu9p8viby4hi/O7SX1qdjUu7cOsaEmUqf8x28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PQX4AYDE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA6GKCH015028;
	Tue, 10 Dec 2024 08:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MPvKwalamfsowX47Fg6i3O
	lsKTIsdqMd1PpWR86+a6Q=; b=PQX4AYDEEm/pTwOsBz7aQ/FgJEM7r8L/D0/Emw
	KJrkIpcIULDf5GQd0U1ehwxQ6FRPJGgE/Q9sMzeztyVPHPZm0sYnJIsqmk2RpzqF
	2t9FaWBLDrTfCHtm6b00AfQG41R3aEs/udtDPjZbL6LcOT7Cd2Q7fPIXt0u1LZdq
	joN6kaLe3yWjlI9KhIW9bC19jsgATWapqUjJ0M9rf/WprgYYt78bqUfFeFJZJk5/
	04Zg30mlxwjZ8CYm3gdCpSIAN0fz7nYXC+s9HPNBRA2pP9aMAPFTmVTrLW/Egvmk
	2L/y0RT4bETzOtWTquQ2e/rZdGfPZHN2UkAhm7TxRx25kI2A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceetqshy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 08:23:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA8NlIA005628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 08:23:47 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 00:23:41 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Tue, 10 Dec 2024 16:23:21 +0800
Subject: [PATCH v2] arm64: dts: qcom: Add coresight node for SM8650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHj6V2cC/1XMQQ7CIBCF4as0s3YMIJDiynuYLhqgdhZtlalE0
 3B3sXHj8n/J+zbgmCgynJsNUszEtMw11KEBP/bzLSKF2qCE0lIJhzy11gj0jGHFPljtgh96E1u
 ol3uKA7127trVHonXJb13Pcvv+oOk+IeyRInKOutO2kjT6svjSZ5mf/TLBF0p5QNZSOFCqgAAA
 A==
X-Change-ID: 20241209-sm8650-cs-dt-ad649dcfa5e8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733819021; l=4281;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=LxVL3dWaIY5BiEszPJpsF/yeGkMBUNkZigOVtbf3bvc=;
 b=82+zkxe9QXPpQNethGni9O/w3u+LVKw4Z6vcDh770Nxdm62ajwMVobHWHpbvhJ/utgMmZnWp+
 8TI9i1ifn4UDz5EL9XV1YFEYdWcnGXpeof7Tom/xQTmf5IGC8L+6nk3
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DTHV9US0lY0LD1JhzgOUyx9mgwlTSRUb
X-Proofpoint-ORIG-GUID: DTHV9US0lY0LD1JhzgOUyx9mgwlTSRUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=1 clxscore=1015 impostorscore=0 mlxlogscore=883
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100064

Add coresight components: Funnel, ETE and ETF for SM8650.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
Changes in v2:
- Update compatible for funnel and etf.
- remove unnecessary property: reg-names and arm,primecell-periphid.
- Link to v1: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v1-1-269693451584@quicinc.com
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 165 +++++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 25e47505adcb790d09f1d2726386438487255824..76620d478e872a2b725693dc32364e2a183572b7 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5654,6 +5654,171 @@ compute-cb@12 {
 				};
 			};
 		};
+
+		ete0 {
+			compatible = "arm,embedded-trace-extension";
+
+			cpu = <&cpu0>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					ete0_out_funnel_ete: endpoint {
+						remote-endpoint = <&funnel_ete_in_ete0>;
+					};
+				};
+			};
+		};
+
+		funnel_ete {
+			compatible = "arm,coresight-static-funnel";
+
+			in-ports {
+				port@0 {
+					reg = <0>;
+
+					funnel_ete_in_ete0: endpoint {
+						remote-endpoint = <&ete0_out_funnel_ete>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_ete_out_funnel_apss: endpoint {
+						remote-endpoint = <&funnel_apss_in_funnel_ete>;
+					};
+				};
+			};
+		};
+
+		funnel@13810000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+
+			reg = <0x0 0x13810000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port@0 {
+					reg = <0>;
+
+					funnel_apss_in_funnel_ete: endpoint {
+						remote-endpoint = <&funnel_ete_out_funnel_apss>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_apss_out_funnel_in1: endpoint {
+						remote-endpoint = <&funnel_in1_in_funnel_apss>;
+					};
+				};
+			};
+		};
+
+		funnel@10042000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+
+			reg = <0x0 0x10042000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port@4 {
+					reg = <4>;
+
+					funnel_in1_in_funnel_apss: endpoint {
+						remote-endpoint = <&funnel_apss_out_funnel_in1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in1_out_funnel_qdss: endpoint {
+						remote-endpoint = <&funnel_qdss_in_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@10045000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+
+			reg = <0x0 0x10045000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					funnel_qdss_in_funnel_in1: endpoint {
+						remote-endpoint = <&funnel_in1_out_funnel_qdss>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_qdss_out_funnel_aoss: endpoint {
+						remote-endpoint = <&funnel_aoss_in_funnel_qdss>;
+					};
+				};
+			};
+		};
+
+		funnel@10b04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+
+			reg = <0x0 0x10b04000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port@7 {
+					reg = <7>;
+
+					funnel_aoss_in_funnel_qdss: endpoint {
+						remote-endpoint = <&funnel_qdss_out_funnel_aoss>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_aoss_out_tmc_etf: endpoint {
+						remote-endpoint = <&tmc_etf_in_funnel_aoss>;
+					};
+				};
+			};
+		};
+
+		tmc@10b05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+
+			reg = <0x0 0x10b05000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tmc_etf_in_funnel_aoss: endpoint {
+						remote-endpoint = <&funnel_aoss_out_tmc_etf>;
+					};
+				};
+			};
+		};
 	};
 
 	thermal-zones {

---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241209-sm8650-cs-dt-ad649dcfa5e8

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


