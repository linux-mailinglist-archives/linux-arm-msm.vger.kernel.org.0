Return-Path: <linux-arm-msm+bounces-59890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04610AC8FEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA1443A37EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9426E22A4FA;
	Fri, 30 May 2025 13:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eOuyEAM0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32D313635E;
	Fri, 30 May 2025 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611274; cv=none; b=WozG6XwiemyaxigDH5Fu/TK7ZFZF2ogpeDXIcx/OrJkMdIQzZHjjzx17lPCIUTixxCdNzA82DkMqZ42RD8Gjx1ZzXqMvZEYAnt4JFmF23wGG/yMk/y0Z+JOtTdZFhpQ8At3Cp9AaZY/lxxwSKCEZP2Y0IVAKCyfgl8iJAz/MJZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611274; c=relaxed/simple;
	bh=02e9NjVrKr0p5lv0XRTtSIaSmEjAp5gGx3kkZVJjiUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OWuuIAgZwu3JKMRzFdwsXkY79xTNNDFVmpQEvUVal5S0bUHMLtBTE9GkLAJUTTRHHAo/gS2KFc6etml8F1jCa0NGOLKo1+iywCfQ921pLEGxdCqe3Bwt/9CbnOpXwfwGDHEN/vQQuQFBPIU9ojrz8QMMJaYi1ukcAV2Iv+pYaoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eOuyEAM0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBnxNC017015;
	Fri, 30 May 2025 13:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OU+wTIryrsNnj6BieoMWjBh9/0Mr0VkKaCV97QKe4Xw=; b=eOuyEAM0i7sRlujL
	sklELnNnbnlO1h5iGTItyguVFrizFy5+/hJPylFVOyWaHFDvRaX9VWum/vs6c/Hl
	oDDPD0Z6217pjPsirqYOxW7nCxdyLBu6EuCWpdO8yHImqFKEtUf6IALTKTORs7WW
	PKka1lhUUZKVec4JaVh+/oWnW4zkDWwtcZmdpGCjNA2YN71GV+YoGD7HGRhhWezW
	9ID1kajmVAOOATlwNiRTscd+JN4xdh5WGp62VJgpDyyumehoVZ9eZcZDMp0ouEhF
	NrolbJ65SkpZ/eNTWUi9OtBOhhLvloPoRRywAXtJ2IzqHGshq72SW2uCBe1btWja
	qybaiQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4yr8y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UDL6KI014607
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:06 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 06:21:01 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Fri, 30 May 2025 18:50:46 +0530
Subject: [PATCH v5 01/18] dt-bindings: clock: qcom,sm8450-videocc: Add MXC
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-videocc-pll-multi-pd-voting-v5-1-02303b3a582d@quicinc.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
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
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNiBTYWx0ZWRfX9Hh3CxFRBF4N
 MxFMobB0yLCa+ONAjlSu51bWwDgt8vsFKvf+QoCsf4PuSUtfqEXt/MlMEz8n6gDVoNXM2XMAZa0
 RfRSrFKdag+/cF4QJeXIl3xpI50Ne6aMUSWnG6dsmy8yBiQBMCAD53TKjqKABin3dcLfhDO5DJi
 I5eXh6B2KVaWKpd+d2CIdDjBDSB8KpREly706LWh2lXvq3Kon2rg7Go0IwnYbcGQW7Os0qW4+JG
 gpPTcTFspDakNynQg3XEK6tnZIxKJGalprqJwxBCI4nBChR/NQHiCqOd0KKyWSq06JG7Lwb1Bw0
 asEbtfEiiojnqjDCdGWRwk6On0XIMF1uQnbO19oWoVTdyIQms9WBO9XVspCtg6QoSLoryXi5tK1
 JpJ0p1bu8xDkvEvxLJYqK/2Ejj8ZCcDIi9eZyiE6CBpZZ890wXwD7qNmqvIr82CS+LcN8rg+
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=6839b0c3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=Nwh09rWfvR_xP5f7LFwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: r1taEYSH1eLgFOyQteWZWPUY7I-H52Ka
X-Proofpoint-ORIG-GUID: r1taEYSH1eLgFOyQteWZWPUY7I-H52Ka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300116

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
index 62714fa54db82491a7a108f7f18a253d737f8d61..0d99178332cb99d3f02f50605e19b9b26e3ec807 100644
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
+      OPP nodes that describe required performance points on power domains
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


