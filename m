Return-Path: <linux-arm-msm+bounces-27499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A38B99426F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5433728220C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CED716DEDB;
	Wed, 31 Jul 2024 06:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gqmmlbZ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B722516DEA7;
	Wed, 31 Jul 2024 06:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722407484; cv=none; b=kyqbpig7hr9CFbQjZ1pvH6LF49BmppeGhyxlIhUScKfjBHqcVoUzp3oikyEd4ff0d7V3xBVF5A/RN5gB2fDG0NUUG16GXlmyeeWwNZHuDPbK+lI8SWIret16OE4KiWfpzVJEmbPZRYSQZX4albGXTjum/Uj12EOKBsYPsWroSWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722407484; c=relaxed/simple;
	bh=DZcw5goAzWnGAWG0As3uOmdBJ48IufZnDTLVzYnWPxY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BTr+0tTYgbnlh9j9z1FilrwD3oggksNbj0XOgAPc6onFR/33WO3tYiiO1zyGpofDA9pbQ9gGggM/xlu4k6SIrQWSy6Q6W2tYbXln+I5YgBaNM5jAV7KtrXDFbpBx9IzCs0eBu+OjowjAXV3WJcsWY1BeIupafEqzhSCDeKe9g38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gqmmlbZ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V4O4Nb024004;
	Wed, 31 Jul 2024 06:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4JmNUZPN16E9WqZhL2XIRbjO/MB26eCqrMH5LsOvyHc=; b=gqmmlbZ9okG8XCmM
	5L57/0MmITAfMUiYT6L4fchQpAWxNk6iofQSU48z4cn7U2S6wKqWVYE7caKA7uNF
	yZWaho57HVQ8osYgBqHbgN0KrCVUO87NQNDiJtEI3p469KhOiQ90QKhBXmu+a9sl
	cO2AA+O0NfPNs+isgTs158E90wVhN5I2vGsWNMYL8BR6e1NyOHiuDwzGN6HyvGcZ
	vwtaDNKtBS4eaJz8KDMeO4STx4TU7k8yV94r0VSkfCjmLKW676BD//MwGUoEmGhi
	D3wxp5/wsKFvi/TvkqVbQimOfq16TKtMy+BqRCAY1q1cvKdkkskHEIyAHy4FjYNz
	iZXiCg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw453cpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:30:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V6Uu94027575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:30:56 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 23:30:50 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
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
        Jagadeesh Kona <quic_jkona@quicinc.com>, <stable@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
Subject: [PATCH V3 8/8] arm64: dts: qcom: Add camera clock controller for sm8150
Date: Wed, 31 Jul 2024 11:59:16 +0530
Message-ID: <20240731062916.2680823-9-quic_skakitap@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
References: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l6w24MUP0EEd-9hC4v97XXiULHmcRGzZ
X-Proofpoint-ORIG-GUID: l6w24MUP0EEd-9hC4v97XXiULHmcRGzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_03,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407310047

Add device node for camera clock controller on Qualcomm
SM8150 platform.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8155p.dtsi |  4 ++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi  | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p.dtsi b/arch/arm64/boot/dts/qcom/sa8155p.dtsi
index 9e70effc72e1..d678ed822378 100644
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
index 3e236adb9397..27f87835bc55 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/clock/qcom,videocc-sm8150.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8150.h>
+#include <dt-bindings/clock/qcom,sm8150-camcc.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3759,6 +3760,18 @@ camnoc_virt: interconnect@ac00000 {
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


