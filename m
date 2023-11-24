Return-Path: <linux-arm-msm+bounces-1780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F67F6C37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 07:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 740B81F20219
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 06:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3095D5248;
	Fri, 24 Nov 2023 06:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MbwPPde0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E5510C7;
	Thu, 23 Nov 2023 22:17:59 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AO6FJjL019103;
	Fri, 24 Nov 2023 06:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=+rC3fAAF+kAdyzD5pa358EWqIfoYv7Taj32icgwuGtc=;
 b=MbwPPde0lASljtMslTguc8nKHh+bKrP4tl1l3/Y9YPuP94YXCdMGKeFsqQi2GotgGNjr
 /rE1kQTA9WZGuOJP07aJC85U4AG7Dp6KZRtNGfzWQmwYVdV1nDhWTnEx1FSgfEXhRZab
 gdSWZbBK9RNIR5FjkSVPYewT7jPrswNaH7c1Zat7Fp0t1J8gi3D3iFxMeDKLXeFZQesZ
 6qqB9N1RuHiypUjxFtfgXhr2UIO7Si6IrboX4QBv0p1CJuqu6REjcHmOCfQa1XRAzD7p
 P7nGrw130rtjz1SkpbZvCccl++aZ2n51HMkiJfsw0JQUwVKOUJM5pKy80Qu/CEHY20PH IQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uj4hwhv6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 06:17:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AO6HsMK022018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 06:17:54 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 23 Nov 2023 22:17:54 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        "Tao
 Zhang" <quic_taozha@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: Fix the warnings from coresight bindings
Date: Thu, 23 Nov 2023 22:17:36 -0800
Message-ID: <20231124061739.2816-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p1UzWmpBdue14J3S1bLQmteJzDMNnz0X
X-Proofpoint-ORIG-GUID: p1UzWmpBdue14J3S1bLQmteJzDMNnz0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=646
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311240046

Fix all warnings in Qualcomm boards coming from Coresight bindings.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 26 ----------------------
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 32 +++++++++++++++++----------
 arch/arm64/boot/dts/qcom/sdm845.dtsi  |  5 +----
 arch/arm64/boot/dts/qcom/sm8150.dtsi  |  5 +----
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 24 ++++----------------
 5 files changed, 26 insertions(+), 66 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 6ba9da9e6a8b..e42c22b26adc 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2637,24 +2637,6 @@ funnel1_out: endpoint {
 			};
 		};
 
-		funnel@3023000 {
-			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0x3023000 0x1000>;
-
-			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-
-			out-ports {
-				port {
-					funnel2_out: endpoint {
-						remote-endpoint =
-						  <&merge_funnel_in2>;
-					};
-				};
-			};
-		};
-
 		funnel@3025000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x3025000 0x1000>;
@@ -2681,14 +2663,6 @@ merge_funnel_in1: endpoint {
 						  <&funnel1_out>;
 					};
 				};
-
-				port@2 {
-					reg = <2>;
-					merge_funnel_in2: endpoint {
-						remote-endpoint =
-						  <&funnel2_out>;
-					};
-				};
 			};
 
 			out-ports {
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index b485bf925ce6..ebc5ba1b369e 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2031,9 +2031,11 @@ etm5: etm@7c40000 {
 
 			cpu = <&CPU4>;
 
-			port {
-				etm4_out: endpoint {
-					remote-endpoint = <&apss_funnel_in4>;
+			out-ports {
+				port {
+					etm4_out: endpoint {
+						remote-endpoint = <&apss_funnel_in4>;
+					};
 				};
 			};
 		};
@@ -2048,9 +2050,11 @@ etm6: etm@7d40000 {
 
 			cpu = <&CPU5>;
 
-			port {
-				etm5_out: endpoint {
-					remote-endpoint = <&apss_funnel_in5>;
+			out-ports {
+				port {
+					etm5_out: endpoint {
+						remote-endpoint = <&apss_funnel_in5>;
+					};
 				};
 			};
 		};
@@ -2065,9 +2069,11 @@ etm7: etm@7e40000 {
 
 			cpu = <&CPU6>;
 
-			port {
-				etm6_out: endpoint {
-					remote-endpoint = <&apss_funnel_in6>;
+			out-ports {
+				port {
+					etm6_out: endpoint {
+						remote-endpoint = <&apss_funnel_in6>;
+					};
 				};
 			};
 		};
@@ -2082,9 +2088,11 @@ etm8: etm@7f40000 {
 
 			cpu = <&CPU7>;
 
-			port {
-				etm7_out: endpoint {
-					remote-endpoint = <&apss_funnel_in7>;
+			out-ports {
+				port {
+					etm7_out: endpoint {
+						remote-endpoint = <&apss_funnel_in7>;
+					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bf5e6eb9d313..c4dbca4c15f2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3545,11 +3545,8 @@ etf_out: endpoint {
 			};
 
 			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
 
-				port@1 {
-					reg = <1>;
+				port {
 					etf_in: endpoint {
 						remote-endpoint =
 						  <&merge_funnel_out>;
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 97623af13464..7bae3bc6af06 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2957,11 +2957,8 @@ replicator1_out: endpoint {
 			};
 
 			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
 
-				port@1 {
-					reg = <1>;
+				port {
 					replicator1_in: endpoint {
 						remote-endpoint = <&replicator_out1>;
 					};
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index be970472f6c4..fa4e8887d53b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3095,11 +3095,8 @@ tpda@6004000 {
 			clock-names = "apb_pclk";
 
 			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
 
-				port@0 {
-					reg = <0>;
+				port {
 					tpda_out_funnel_qatb: endpoint {
 						remote-endpoint = <&funnel_qatb_in_tpda>;
 					};
@@ -3142,11 +3139,7 @@ funnel_qatb_out_funnel_in0: endpoint {
 			};
 
 			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
+				port {
 					funnel_qatb_in_tpda: endpoint {
 						remote-endpoint = <&tpda_out_funnel_qatb>;
 					};
@@ -3355,11 +3348,8 @@ etf_out: endpoint {
 			};
 
 			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
 
-				port@0 {
-					reg = <0>;
+				port {
 					etf_in_funnel_swao_out: endpoint {
 						remote-endpoint = <&funnel_swao_out_etf>;
 					};
@@ -3443,8 +3433,6 @@ funnel@6c2d000 {
 			clock-names = "apb_pclk";
 
 			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
 				port {
 					tpdm_mm_out_tpda9: endpoint {
 						remote-endpoint = <&tpda_9_in_tpdm_mm>;
@@ -3710,11 +3698,7 @@ funnel_apss_merg_out_funnel_in1: endpoint {
 			};
 
 			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
+				port {
 					funnel_apss_merg_in_funnel_apss: endpoint {
 					remote-endpoint = <&funnel_apss_out_funnel_apss_merg>;
 					};
-- 
2.41.0


