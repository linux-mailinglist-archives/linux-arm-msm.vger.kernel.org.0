Return-Path: <linux-arm-msm+bounces-1373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 615167F30F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 15:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 165922833E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 14:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC9354FBA;
	Tue, 21 Nov 2023 14:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bN4DxuyY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D74E1707;
	Tue, 21 Nov 2023 06:32:33 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALE2DBW003193;
	Tue, 21 Nov 2023 14:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=pVNEr0Q9vRdjhIb5bJsONpiWNzmfdgAMPP5B4cuQpCM=;
 b=bN4DxuyYJp74ZpjdUzf0WzciMcJLGCy2Dpjt/IKz1zDRDuToaEoy5PlcOEjvtacs3sQB
 mqThR9aWAAQr0cfoZ4YukMKWAOgvPEMuXd7qf0RhTFEwH8nREX1ikoojHAqthuRIZaAg
 YrNyysSOZzx7qWdBSJC11NDpVyWc3XC/6ICK0b/1PzP+sgbzop4Agiqbjm1anAGsPSlC
 lOVNWPI6ntTMD9nMlDfABogF9UNwowGK0q9Ph7GPaqDCP8Zmm36bEj7kk9cHS6TuQO5g
 Nqye65Qc1gdcTzQ66fm60a50p2KzHOWyTicic94PgYOvYoVtnLFP/d31ll3HuoFZVwfT 2Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugu548vrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 14:32:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALEVrR1014146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 14:31:53 GMT
Received: from hu-kathirav-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 06:31:47 -0800
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Date: Tue, 21 Nov 2023 20:00:50 +0530
Subject: [PATCH v2 8/9] arm64: dts: qcom: ipq5332: add support for the
 NSSCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231121-ipq5332-nsscc-v2-8-a7ff61beab72@quicinc.com>
References: <20231121-ipq5332-nsscc-v2-0-a7ff61beab72@quicinc.com>
In-Reply-To: <20231121-ipq5332-nsscc-v2-0-a7ff61beab72@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Kathiravan
 Thirumoorthy" <quic_kathirav@quicinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700577061; l=1493;
 i=quic_kathirav@quicinc.com; s=20230906; h=from:subject:message-id;
 bh=On+vIlP7kEdi1CuNbDT2X799qtb+G8sW5nlXO17K7xg=;
 b=ipoJ2oAqObrNQtVYNUFM9oe54k4fj3exYxrpQryAYQnbZBT83iZ6E2MPIokJKMca2ZBq4N3KM
 7VabXMLhiVFAP4z0RheezWhaSsAvl8//ZCIAEUizIL59eGaiDhJox8r
X-Developer-Key: i=quic_kathirav@quicinc.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6YOC--r_Xpun7PM7Me_O2lK13_HC_aAh
X-Proofpoint-ORIG-GUID: 6YOC--r_Xpun7PM7Me_O2lK13_HC_aAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_05,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=765 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210114

Describe the NSS clock controller node and it's relevant external
clocks.

Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
---
Changes in V2:
	- Update the node names with proper suffix
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 42e2e48b2bc3..5cbe72f03869 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -15,6 +15,18 @@ / {
 	#size-cells = <2>;
 
 	clocks {
+		cmn_pll_nss_200m_clk: cmn-pll-nss-200m-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <200000000>;
+			#clock-cells = <0>;
+		};
+
+		cmn_pll_nss_300m_clk: cmn-pll-nss-300m-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <300000000>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -473,6 +485,22 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
+		nsscc: clock-controller@39b00000{
+			compatible = "qcom,ipq5332-nsscc";
+			reg = <0x39b00000 0x80000>;
+			clocks = <&cmn_pll_nss_200m_clk>,
+				 <&cmn_pll_nss_300m_clk>,
+				 <&gcc GPLL0_OUT_AUX>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&xo_board>;
+			#clock-cells = <0x1>;
+			#reset-cells = <0x1>;
+			#power-domain-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.34.1


