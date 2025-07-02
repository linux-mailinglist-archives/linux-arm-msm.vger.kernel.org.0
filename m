Return-Path: <linux-arm-msm+bounces-63424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E5AAF5C68
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 17:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EF363B4A79
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 15:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89392D375E;
	Wed,  2 Jul 2025 15:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RPecq4fm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105F62F533C;
	Wed,  2 Jul 2025 15:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469222; cv=none; b=RY++KcbHJ+mAgLtq0toEJbAfIAr2eNZvY8uBPiuhenoCcJkxhcPgF1X67wCm6zCwdvD0TQmXCyQJ2xxaRFAIzFOIiNYWBV5GQ15j9qQ5j6MmHlAIsBXRkogVJC1pN7OQ1mc6QL27G7n7ILSpkVWeBYHKj84IDkLNM60g3GpEVIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469222; c=relaxed/simple;
	bh=iDfjW0ZYeaf2VMJr1Ahi4pGoCHXLk7QhFzoFFc4ZUoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EaF9NyZ8N1FC1X9hknqeJctRE/a0TGKsoXsz5urGkU4fH9dTKS2GTC4ci3EgFSOQcnxf+3u73Opwand8fQ4DjUtTdzgf4M4cEwm1OPeMb+GdJdiKXzAw4i1BRGwNWiwwsoDasvD/qQeO8T8yM4qxsrkR9o7xpiWtLOhDIonQE/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RPecq4fm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562DHwqa002603;
	Wed, 2 Jul 2025 15:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RwZTQbL75/1moTLXzC1AwqoLs4/vgd6yXqL79a3xzaE=; b=RPecq4fmtjjBDc8w
	zoArENpVw74NWztw7Ue4tSP47Lv6fsVR+9kMVGtePBQuHswALycHsu2euvrydHQR
	5pLTAsRG1/6rYpgIqIzDheU7S+xKtxq/Llds5jKhkYZi170AhvZyyIeoqsruTA1t
	1IxBCz+L9uUcqlrXIl+GygYWO9WvEkekTSuABhNIRJNWXzDiqDShs7dXxutJ3LE0
	wHM+sId2sdiskfbVMso+V1kKgYfYpgrRdRrSOQWYyzXnoBqWOI6mt0GYAVlFiXgA
	wFogC+cS8Tm8DamhG6lRYjvLY4V0yqYJBkFNijHe/rDTH0RYDLoKmtC6upw2xEnr
	6S9IOA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcw1w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 15:13:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562FDbsW010624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 15:13:37 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 08:13:32 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Wed, 2 Jul 2025 20:43:14 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: sc8180x: Add video clock
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250702-sc8180x-videocc-dt-v3-2-916d443d8a38@quicinc.com>
References: <20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com>
In-Reply-To: <20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com>
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
X-Proofpoint-GUID: 4yR0qTn3s5JChJ0YiHZKdSRRVOF6YIjY
X-Proofpoint-ORIG-GUID: 4yR0qTn3s5JChJ0YiHZKdSRRVOF6YIjY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyNSBTYWx0ZWRfX5Q0XmYEFZ019
 rDY6G8vSoSzDP7LwzZzYLwJSz8Vj6ILqr9/n0GjrwP9np8tgkaTU4iKxX0RGdYsgDGi1JkowG4E
 UmiHv9d7cXf6vykigsI5VLFGQEBzDSpAgAeaiCNC9Zv6kkM4mY/2OadUiRPtS/ojeJybWg9S9j1
 b4cZlmv4LWUUdX+UT8ha9NRBzPt8XsGkkVeHIr0njsNnf/V5OUebXkBu9kF+BUUkOxzmv7H40Dv
 Nl3VqLkvOow9AQwW76XpShSlQAO9mX0VhTQLgUEQTvckjrydDMPNpKeut/lGzhQ4f5H5+dGepIb
 cI3VhTMkq4RuITBLJ/y3NRJmlluIpgOD/Yk9OTrCCHEQmLk7CM5i1Nj3dM7U6d8zlqH16SqUlsZ
 ll3lRWTHslyd7npQGdd9ILhBQYQ62qh3FgevGdGmWdyvy0K4eoXobnUw33UAv8evEoUIcd4i
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68654ca1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=pPhMc3DFDLYxrPtO74kA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=919 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020125

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


