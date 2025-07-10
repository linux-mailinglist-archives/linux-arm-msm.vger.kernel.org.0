Return-Path: <linux-arm-msm+bounces-64381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4069B002CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 15:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4950017C301
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 13:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33987270EA4;
	Thu, 10 Jul 2025 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i8dGylzF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937C2223DF1;
	Thu, 10 Jul 2025 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752152473; cv=none; b=Dj1VRkdap9BgGvPhc2tgJTATie/Ni6GhTkbysXvXh2/JQMsSkl66g1SqJ/HhCkXBEG7n1kTiT6T971/FgoygOfpUcYmc4R3xgNQhQtl098/g5kDaz/SxTrgOthIodaeqR5il1A/J8AYi9J1Fx7PbVQdc8crdJ2SqVinptTm/rdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752152473; c=relaxed/simple;
	bh=BJrfyzG2K6+fMdXYhaKF808Csj5VeWQwIiioTzueKX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Mn0CHuwqN6qjvNegkQtk+LmIXMsVTwKLqOTuDV+BGV//vSziC6/k2NhX1gpMxfOU9uMSSvaBA2dadhXkymeWeXUOit7m24Ij2cXtnXFD7q/EOffhnTVgOO1KxgaXPyr0nuMTYMV+r1j1aHbho4yZmGGM7EZ91hDQPghI//6TWRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i8dGylzF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9fXTt003109;
	Thu, 10 Jul 2025 13:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5q+2o9veVg+lilD+I3TWajUcimnQ8yLxQoRPxi+KAvU=; b=i8dGylzFcXGynt6D
	+mrmblM38wiithbYNnwU+NzQHmwAGv4QCIlijLjG5u8qpGlb9og+LiRMelm6Djvi
	CaEleHEnsLQNlv1atDYfpFIq5FpX9ioK74QDAhLGgYMK2V6awYcPI+uNFJ8aTzbO
	AlzO65W2fBI/v/TGCVjenK5geRMGDaS9czRbOajQ2+ipcCy2NuZQOgHryEebfQbL
	tfVVUeonqtP9ddNH0utY/Q0BDtQRZSD8WelELF0ExGcceV9pL51EQ1eVXdEuL6nT
	Cbhqx94s1e34XqziUApdJMUKEdCuBpcn5gKtmhH4Bsh12vbJUdHIYeRLMj8hTLfD
	s9p2vw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bg9f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 13:01:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56AD15k0016995
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 13:01:05 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 06:01:01 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Thu, 10 Jul 2025 18:30:40 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: sc8180x: Add video clock
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250710-sc8180x-videocc-dt-v4-2-07a9d9d5e0e6@quicinc.com>
References: <20250710-sc8180x-videocc-dt-v4-0-07a9d9d5e0e6@quicinc.com>
In-Reply-To: <20250710-sc8180x-videocc-dt-v4-0-07a9d9d5e0e6@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDExMSBTYWx0ZWRfXxWBqW6Bz79aW
 w6J43En8hudg91zTBpw6JCSeZFB76rOkSC83SueYzmh55NRZBCOeBZ9f2kysvWHjj/B9nbyyQ2a
 T9Ozryb5isX36n4O5+edbR86lTF1SktCBpcycXa+f9XhS/+yP8lgLT7Yxe6/haAfaBZaXF2oSKE
 MlLoV3wwqmHcvBcC0hAP6ksSr8RDTKZmHYNAn/2tSAZIlz10T6RGtDXzH/wcTtIhUU1poKs62cT
 wYmeiKLinZ3sW9bAyf3sYXmCpN6bn87FweEQNfFzXGBvD/LaWQmG+fHve2yy8z8Mm5AVR5L40Dj
 49KWyrzvCeRQkulIPx0EjMzy5GxXVId+kqb0cVk7GFBjLdMXj75+CMt8LuECVDkcm/Lq7Cn1rcr
 oTqNAI19A6GDwh/B5C00qygn/QwVWkQmoMOpicG76Fc2egNS66fH4ZFneEGqEuRn0mj99DF5
X-Proofpoint-ORIG-GUID: BgYgYkirza99i2OxgXnF9URiIWXTSlGa
X-Proofpoint-GUID: BgYgYkirza99i2OxgXnF9URiIWXTSlGa
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686fb992 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=3wTN53G7mrEkdP7EbdsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=958 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100111

Add device node for video clock controller on Qualcomm
sc8180x platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index b74ce3175d209b569e634073662307964158b340..e0dfa1eae8202881a02cc8531111792e7c962fa6 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8180x-camcc.h>
+#include <dt-bindings/clock/qcom,videocc-sm8150.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8180x.h>
@@ -2943,6 +2944,20 @@ usb_sec_dwc3_ss: endpoint {
 			};
 		};
 
+		videocc: clock-controller@ab00000 {
+			compatible = "qcom,sc8180x-videocc",
+				     "qcom,sm8150-videocc";
+			reg = <0 0x0ab00000 0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "bi_tcxo";
+			power-domains = <&rpmhpd SC8180X_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sc8180x-camcc";
 			reg = <0 0x0ad00000 0 0x20000>;

-- 
2.25.1


