Return-Path: <linux-arm-msm+bounces-52598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD8EA72CD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 906A63A9DD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D8A20DD62;
	Thu, 27 Mar 2025 09:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bpFD1jdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F2320DD48;
	Thu, 27 Mar 2025 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069217; cv=none; b=DS5yVDdFaZiegyey7PQ4e/72r7Prk1iPt12iLN2Na+8UFhPkLv4wxQ3FKVOeV9C2qX8xrABetd6eEQHwox3i7cnFW5zjyg53AsnHqwEBXdpaSmJFLvkEHNgYF/QS6dcDheHIYHTZQCfuPKHGO1TcOVwIYSZ9qLNTma0iZdc7NBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069217; c=relaxed/simple;
	bh=bnfNdcr7CdT3j8KPqfJm0nK15rqIKlXAeNVuX1T/+tE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VJKSc7f9+JPg3/znhNnk0SEaewlNtKa1tYwEYcLzs2o/qYk++KgiDcRP6i7A9Xxg5EnGHblJMIdQID6AKUbFRhmmehbLBG0rQjMxGG5LgU/DZW4+DKUhksZAehfxo+KxQQYojg74hYd+Mnr0jK/eAR5gJjPJdH3dOVlCErvbEgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bpFD1jdl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFHS010183;
	Thu, 27 Mar 2025 09:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g5pa8yqa9rYrWAVooj7ioSSskufEsG1dXGzEGVyAWYU=; b=bpFD1jdl0XjXwW10
	RZdWItRSR6TgyKNk9pzMHLkRgjDb0DGNmPEQkS5GFCSTtYvuW7WNpXDL5ToQFExM
	cMmErqGyR32YEE/IerdmjDd0aqLh72qBFYW1/Hs7q/C9xhJZqn/1BaSMK5QB5C1E
	gqLr78aSSPxUBnirg+ve7OwODwArYPYE4v53oHC9OnM2cNljWiPfe50YHhQrA/bV
	/20ohkN3mK+88H3GCQs9sANqG53ycQRpc2BNPkcgi0FwgVAfP7iG9zB64VQCXfW+
	zsyxk7ISpSMjJseA6rXkumG7dXFK+8wjropHLzn89z7demFwwG6uxid2XbO17AWb
	21puLg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcyg4j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:53:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R9rUU0006501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:53:30 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 02:53:24 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 27 Mar 2025 15:22:21 +0530
Subject: [PATCH v3 01/18] dt-bindings: clock: qcom,sm8450-videocc: Add MXC
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250327-videocc-pll-multi-pd-voting-v3-1-895fafd62627@quicinc.com>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e5201b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=Nwh09rWfvR_xP5f7LFwA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Pn-_Wj3LU0ynvE18SFCKR5qIiaXWzxbA
X-Proofpoint-GUID: Pn-_Wj3LU0ynvE18SFCKR5qIiaXWzxbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270066

To configure the video PLLs and enable the video GDSCs on SM8450,
SM8475, SM8550 and SM8650 platforms, the MXC rail must be ON along
with MMCX. Therefore, update the videocc bindings to include
the MXC power domain on these platforms.

Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 62714fa54db82491a7a108f7f18a253d737f8d61..93807b1448025a4f2724378346a4bd87f08a8e57 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -32,14 +32,18 @@ properties:
       - description: Video AHB clock from GCC
 
   power-domains:
-    maxItems: 1
     description:
-      MMCX power domain.
+      Power domains required for the clock controller to operate
+    items:
+      - description: MMCX power domain
+      - description: MXC power domain
 
   required-opps:
-    maxItems: 1
     description:
-      A phandle to an OPP node describing required MMCX performance point.
+      Phandles to OPP nodes that describe required performance point on power domains
+    items:
+      - description: MMCX performance point
+      - description: MXC performance point
 
 required:
   - compatible
@@ -72,8 +76,10 @@ examples:
       reg = <0x0aaf0000 0x10000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&gcc GCC_VIDEO_AHB_CLK>;
-      power-domains = <&rpmhpd RPMHPD_MMCX>;
-      required-opps = <&rpmhpd_opp_low_svs>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>,
+                      <&rpmhpd RPMHPD_MXC>;
+      required-opps = <&rpmhpd_opp_low_svs>,
+                      <&rpmhpd_opp_low_svs>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.34.1


