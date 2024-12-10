Return-Path: <linux-arm-msm+bounces-41217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F749EA8EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 07:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E9F928400E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 06:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1ED228C93;
	Tue, 10 Dec 2024 06:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cyIjfvTU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D21D7E31;
	Tue, 10 Dec 2024 06:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733813516; cv=none; b=hkzdj2V6hdqjOpOPrItYv2HwachiYmOvF5V8jn453nWNkX24rrls7Kwiq/zFLt5J9ldOL+urqsFCFmLhTD3uUmqsIeLq5SQkQ13R4MGmB7qBKv6gCP2Cg5LyustiGdh7GyHns4CUwT+INfJYAGthYx/keJrhehh1Yf3Mvd4DIKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733813516; c=relaxed/simple;
	bh=1S1wPf1HFeMW07im7JMykBYcmm7ypw/AYiG9lWAac9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=eXTI06kGxakEl4vaXsWUvkRN36Bt4ezwuZtuPYxp4gHJurDDRdW1c3wHXmTmBU9QJQfpexLbbFTE38vM3PZM6vyyUbil9y0xBS38HqWY8B+bKJITpwE7ijoD1+tmu5ypdO9X1TonBwoJWdKM3qNnev1Q1DjZJG7vq+nKtZ03CVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cyIjfvTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA3pGf4015092;
	Tue, 10 Dec 2024 06:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xMTrXNAvveJzC/dYtfDsKz
	UGU9Sk9yP2NxncEyQTiKY=; b=cyIjfvTUs7lE3XpgRqmDoLyYyfGiUlOHo80Sh5
	nov4D2/RhWPYY8nIX3c5sEzia9LAJjFh8f4kxQyYIgpmsmRhVvJ6aBh0VBtV6tZe
	3QebSnXkWRat3fGgftuX5Yj8uHneQRsQgGIDdGYHJmOvfCNLk6AfH1fnKaVJ3qcW
	KQZ+EUK9kVnRAzC51tXFw3HTC209zy196t08ZJSdXUBrSk5wXulEAjh3ZJfcrVTL
	ucsXP64NQ6K6S3wPQLtxqOh+0LQyS3tNZS/TASDsy158mTXlLwi5IhYGyOJLxpPF
	d8vhdRJ54ipoqwJsa2VSy5T/sSeGN44qgJWJatnJWnUB+3/w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ee3n8cax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 06:51:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA6ppE0015019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 06:51:51 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 22:51:45 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Tue, 10 Dec 2024 14:51:21 +0800
Subject: [PATCH RESEND] arm64: dts: qcom: Add coresight node for SM8650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-sm8650-cs-dt-v1-1-6640ebe0c6cf@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733813506; l=4508;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=1S1wPf1HFeMW07im7JMykBYcmm7ypw/AYiG9lWAac9Y=;
 b=d6spmr/zMNyWqKWlOL8b7l1HtxL1Tt9V3qGPpgQzBwuVu+3TYu/tXDdDoa1lMBkLXbWccyx5L
 WEPGEV7xEpFCmnz1biKtJNnGwbqevSpwh4MoZLkhCJbHkP4VuvwLw77
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dQSzw3Uj40IXvh_WG8z_3geEasjQOnx_
X-Proofpoint-ORIG-GUID: dQSzw3Uj40IXvh_WG8z_3geEasjQOnx_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 mlxlogscore=895 lowpriorityscore=0 adultscore=0 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412100051

Add coresight components: Funnel, ETE and ETF for SM8650.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 187 +++++++++++++++++++++++++++++++++++
 1 file changed, 187 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 25e47505adcb790d09f1d2726386438487255824..b3890096085fa09ce36d8199df4aee2b120eff63 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5654,6 +5654,193 @@ compute-cb@12 {
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
+			out-ports {
+				port {
+					funnel_ete_out_funnel_apss: endpoint {
+						remote-endpoint = <&funnel_apss_in_funnel_ete>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel_ete_in_ete0: endpoint {
+						remote-endpoint = <&ete0_out_funnel_ete>;
+					};
+				};
+			};
+		};
+
+		funnel@13810000 {
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x000bb908>;
+
+			reg = <0x0 0x13810000 0x0 0x1000>;
+			reg-names = "funnel-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
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
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x000bb908>;
+
+			reg = <0x0 0x10042000 0x0 0x1000>;
+			reg-names = "funnel-base";
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
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x000bb908>;
+
+			reg = <0x0 0x10045000 0x0 0x1000>;
+			reg-names = "funnel-base";
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
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x000bb908>;
+
+			reg = <0x0 0x10b04000 0x0 0x1000>;
+			reg-names = "funnel-base";
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
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x000bb961>;
+
+			reg = <0x0 0x10b05000 0x0 0x1000>;
+			reg-names = "tmc-base";
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


