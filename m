Return-Path: <linux-arm-msm+bounces-24898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F539242E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 17:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C80F1C21C3C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 15:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED1F1BE23F;
	Tue,  2 Jul 2024 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CICZtsYR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07241BBBD7;
	Tue,  2 Jul 2024 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719935515; cv=none; b=WoNPZn+Tth1RGxGc/A7GdWzCWmMbTskCiFv/8FwSQE4vQ5bhv7BYDfW8+FAhildo7a4kcSpqYMSsYR4BPEpUQh2DDAp0fD+owjhCHr7gUv9b9eNxO2h8NqI0TRLYJTrnaYduY6aDgvrfPol1X+4DeBlBnnzC8CjIWiSr8JwWSqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719935515; c=relaxed/simple;
	bh=SAfYNBxH6Pgtj2iX/+fRfgZXTZ4rbJNocVdHZQRDBBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RnRRwUDXM0wmY2UqJ6f3Uld2FkARJMu+HpILMY22LEnnXIJi1Px8JDVSuaiJwQu5YJg0lonPindCQDvXSj3exibOFnMadlZOaVAdYIQDeCRnGldKwvlk7fzGOMyX1/pzxsS4/qc7+z8+ra5jCQON98GKajTF1nz+c8AIkBkwxIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CICZtsYR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462EAQMM004045;
	Tue, 2 Jul 2024 15:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AlJxuN0uquBxhcLM2axp5fy7OGB8bG92FlFPnXA2UOc=; b=CICZtsYRk5i5yICO
	VJ0O/DGhU5/RckBkx3t9Mx09qsUygFoYK1ysoLoQe7o0fVk7cMeXxLSnYUGXY+iY
	Qi9tw3oPlkQiOWqcV+h7ITwiagnwOUzTKj96lpQG3eOYd5Uu+gCdKvzfIIcQOp+S
	i6qMx3sbvMbiz0URGEHUSS5gpf5xoEUFf7kvEeavCQedkQfFWWKaX4LL1DGwvwaS
	m6b4qOrEZfC6KmJlhhphdtD8UVIrLqRmvvQ1t+liPrUF7rI1hyiB/VTHRB8oxzs6
	QMKl61oTO7ptMSE9DF8zrTmiRuiI/lirmPyX8b6L7PGC5gP6wCqFWoG7CD9EMKVR
	/ZFDQQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402ag2gvst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 15:51:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 462FpQ66010795
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jul 2024 15:51:26 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 2 Jul 2024 08:51:21 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Tue, 2 Jul 2024 21:20:44 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: Add camera clock controller for
 sm8150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240702-camcc-support-sm8150-v2-6-4baf54ec7333@quicinc.com>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
In-Reply-To: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Stephen Boyd <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ooo26-ZjI8woBq8UlydhME0zh7Fb4Nwn
X-Proofpoint-GUID: Ooo26-ZjI8woBq8UlydhME0zh7Fb4Nwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_11,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 malwarescore=0 phishscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020117

Add device node for camera clock controller on Qualcomm
SM8150 platform.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8155p.dtsi |  4 ++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi  | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p.dtsi b/arch/arm64/boot/dts/qcom/sa8155p.dtsi
index ffb7ab695213..52f6019885c1 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8155p.dtsi
@@ -9,6 +9,10 @@
 
 #include "sm8150.dtsi"
 
+&camcc {
+	power-domains = <&rpmhpd SA8155P_CX>;
+};
+
 &dispcc {
 	power-domains = <&rpmhpd SA8155P_CX>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index a35c0852b5a1..7ea6c5e4f886 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8150.h>
+#include <dt-bindings/clock/qcom,sm8150-camcc.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3722,6 +3723,18 @@ camnoc_virt: interconnect@ac00000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sm8150-camcc";
+			reg = <0 0x0ad00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+			power-domains = <&rpmhpd SM8150_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8150-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.25.1


