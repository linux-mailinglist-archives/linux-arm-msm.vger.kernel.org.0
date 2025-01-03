Return-Path: <linux-arm-msm+bounces-43867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94480A008B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63704160DFC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5100C1F943F;
	Fri,  3 Jan 2025 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JweOXTKI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2121F9A91;
	Fri,  3 Jan 2025 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735903947; cv=none; b=bdYccqNvUSNulXOAatQr95hE4Z/YjxmQ9ViesKgjvMDjPh5Ot8oFfPD6FzE089OiKhQlGUP2H3WA3Jo2iyOdKUjXOiDxTWZQoXO2CwLGoSfVZ0xQos15YMSQSCVhtD8Hp8yoetSF1+Zd9DY6hNp8IANeb389orEp18HgRzQu2cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735903947; c=relaxed/simple;
	bh=iNIVkXST6d3+hB8hMtRfZT8eSQWB/yvql/nRKp1LUgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=pqonO1GyqGoK+XwT9CIkzqxpb+jgcXgcjgv3whgVWaNtB55DC+n2kLb9cCgpNFARyKva3IDQUgiorenyjjRLqqNlE/AK9j8zi/5qHBQD0Ls+kqeqovaOPLUuT7qFhd2CBTKqS0U9OiPWyJv4ccuPanBIUybfYf4L8lCB03rHGDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JweOXTKI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50375nwv031512;
	Fri, 3 Jan 2025 11:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J9Heps9Yu8HytqQ7S3AWx/
	8B/eCBb28RrB/322femNY=; b=JweOXTKIV95iZb5OdXLebh1uw2U61SO0bNe/lL
	cRwnCvNmWsEjFmWRA+Z7Cybei8HhsWrciWqgIMijP9C352Gh2KCWXctHbDh5iOp4
	jxnP1sRROSrOL5z1ZcCy1VLfA2dHeNWIXsYiksBhkOPEwnqBR2Wh3WXNKxY6Hk3E
	JSohx75hBRF+1/h45OvSXSZdwVeOfvvXmwHHMaIS4XY6Xx6ScTL2xKf2kj8DdBWq
	RAgRWWFCiNvohMEAhjvhkz1l3ZEPXwZ8Dj+zJ8qpDX5wX7mUvU6uP1sCItBFM/7Z
	fpmoUUPGNRKSuqTgXe41lBiGjYS/LqVK5OWGlDI6VpZ4Eazw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xb700jjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 11:32:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503BWLwa027141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 11:32:21 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 3 Jan 2025 03:32:15 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Fri, 3 Jan 2025 19:27:27 +0800
Subject: [PATCH v3] arm64: dts: qcom: Add coresight node for SM8650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250103-sm8650-cs-dt-v3-1-759a3f6a3cc8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJ7Jd2cC/33MsQ7CIBSF4Vdp7iwGKJDi5HsYh3qh9g5tFSrRN
 Ly7tHHp4nhO8n8LRB/IRzhVCwSfKNI0llEfKsC+He+ekSsbJJdKSG5ZHBqjOcPI3MxaZ5R12LX
 aN1CSR/AdvTfuci27pzhP4bPpSazvDxJ8DyXBBJPGGlsrLXSjzs8XIY14xGmAlUryXy5Ljp1Ua
 NDenMN9nnP+AtawOmXpAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735903935; l=4614;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=iNIVkXST6d3+hB8hMtRfZT8eSQWB/yvql/nRKp1LUgI=;
 b=NZbV4h8STrDXNugMF+WeSj/z6UvADGNrwL83fZtDfmCl1gNnI2j2AbMFFZjz6zZr/8F5vY1FJ
 nFtg0GHgiFnAupXn2K1SHZPTYR846sjlaohtkVcmHEImMVsOTHKqS2R
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9OjKNRb8xmdKlBaSTvgmyv_0Ft75MmbW
X-Proofpoint-GUID: 9OjKNRb8xmdKlBaSTvgmyv_0Ft75MmbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=1
 phishscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=969 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030102

Add coresight components: Funnel, ETE and ETF for SM8650.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
Changes in v3:
- Move ete0 and funnel-ete to /.
- Update coding style.
- Link to v2: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com

Changes in v2:
- Update compatible for funnel and etf.
- remove unnecessary property: reg-names and arm,primecell-periphid.
- Link to v1: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v1-1-269693451584@quicinc.com
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 166 +++++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 25e47505adcb790d09f1d2726386438487255824..ec24e3ee77d14e9d59d9c9bc4b3be211e5fb4f01 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -365,6 +365,40 @@ cluster_sleep_1: cluster-sleep-1 {
 		};
 	};
 
+	ete0 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu0>;
+
+		out-ports {
+			port {
+				ete0_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete0>;
+				};
+			};
+		};
+	};
+
+	funnel-ete {
+		compatible = "arm,coresight-static-funnel";
+
+		in-ports {
+			port {
+				funnel_ete_in_ete0: endpoint {
+					remote-endpoint = <&ete0_out_funnel_ete>;
+				};
+			};
+		};
+
+		out-ports {
+			port {
+				funnel_ete_out_funnel_apss: endpoint {
+					remote-endpoint = <&funnel_apss_in_funnel_ete>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm8650", "qcom,scm";
@@ -5654,6 +5688,138 @@ compute-cb@12 {
 				};
 			};
 		};
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
+				port {
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
+				#address-cells = <1>;
+				#size-cells = <0>;
+
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
+				#address-cells = <1>;
+				#size-cells = <0>;
+
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


