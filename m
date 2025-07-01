Return-Path: <linux-arm-msm+bounces-63203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D4BAEF6DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 13:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D79401C000A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 11:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01ECA2749DE;
	Tue,  1 Jul 2025 11:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RbH5McO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6A62749D2;
	Tue,  1 Jul 2025 11:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370046; cv=none; b=pwP8gD5+NYZIqsw3LHFYqtjdD7qMZrnLrHUpEhUYdH5RF+0r/S31JOj0JXNcKNlX3lnaaoZL6NLfxH0ILrbm4mDs8Vw1R4/jv/3L69ATOm4MQyN4rx9a0vMeyMuGJf2TowWZBEBYXH5MPWmuI9D5x4QiR9gN8gmM4XNchoLTaqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370046; c=relaxed/simple;
	bh=iDfjW0ZYeaf2VMJr1Ahi4pGoCHXLk7QhFzoFFc4ZUoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QrftYULn6H5miw/gVr4N3f3mebhOjabuAPZuLV9ntiGoHIwVtJkfFAnfNZMQBVw5QF/zR8PGCrkeIKg43iB9GDaY5zvN8zoWDpvQWsK9jkGZWL7WOkO6I9Ovip6CYN7nnGhcbOqNlX4MpnBms+TkKgLjp9s0at/tthfQ3NUszQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RbH5McO1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619VAPN028616;
	Tue, 1 Jul 2025 11:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RwZTQbL75/1moTLXzC1AwqoLs4/vgd6yXqL79a3xzaE=; b=RbH5McO1gefrk2ix
	WNnv47QbgiXy1le2xWN2lRM0TkYVGgb2DD0psojpxaxJ9XHqdp5/RGkOLxvtY2iZ
	VPIFILEjWqIsOm2yPd/CP0hQXWDy+UoOv2N/0blRD+xBDF0ojWvZbj0zmFt001PN
	PzAuJWQqjkqDM09Coz6TJvJY7UIbhjsThfctj1hzaDfuy3ltvdmlMMBLbk35gg22
	HwIhYdiMlDJcJGg57O+I6cwTlM9LABal/kH0Kg0suj8ZgC8e7Fk4zu5Bv9yun4Nm
	nNnH6kkbQ4s7ngqA/ZEE038XzkmldnqCwIJFWaj6UyHTXlN7F8f5ShfSkZ2NGS1X
	uNdd9A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvrntv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 11:40:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561Bef3U018600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 11:40:41 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 1 Jul 2025 04:40:36 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Tue, 1 Jul 2025 17:10:19 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: sc8180x: Add video clock
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250701-sc8180x-videocc-dt-v2-2-b05db66cc1f6@quicinc.com>
References: <20250701-sc8180x-videocc-dt-v2-0-b05db66cc1f6@quicinc.com>
In-Reply-To: <20250701-sc8180x-videocc-dt-v2-0-b05db66cc1f6@quicinc.com>
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
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ml1fgupPLv76uabPkn3rIYaVS2zFbL8Q
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6863c93a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=pPhMc3DFDLYxrPtO74kA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ml1fgupPLv76uabPkn3rIYaVS2zFbL8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3MiBTYWx0ZWRfX9N5dSYYui47L
 UaFkl1sNKI3ImNFiVCoRjSCsiB0JGIVW1XiBFawg4eV+75FW3IxLhp705eibnR+n33SvPmK7hPq
 jKFbW65wN7f3U1vqKIR/1PAKVtnFVoMiut5ZEEe7gNmIHxSXly0r8DHbvcCxfPtPDWeicCmxEbE
 FZAXF5Fu0rLrqcEXDePycXMCZBFL/89mDlRlmV7awP6LLft3QqQh3XiNSYm047P7/TP43bMzD+9
 Ikgn1mV9vitcH8plpJwwsrIAtXl3hQenk+KKJvWouA/tzNeyj+6RiDL1MpyUmEAeOBfhocpAw/J
 nCjtusg2v+tu2lJjx6l+7QAMVqtlW0HAwv2Y5wyjs9rulI1YdhX3jpjW8jJot+2euLXcfJl2hXB
 7Witu/UZ4Hj09RFGYo6knAtppJQ/yjpEaJuaBSuHiiMGzqsu8+ugTZGiXrl8bUKznYyrbRza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=915 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010072

Add device node for video clock controller on Qualcomm
sc8180x platform.

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


