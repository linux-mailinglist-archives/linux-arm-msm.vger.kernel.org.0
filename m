Return-Path: <linux-arm-msm+bounces-59891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC93AC8FD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5C5A7A9332
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBD922D4D7;
	Fri, 30 May 2025 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GaoEc7Xi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5527F70830;
	Fri, 30 May 2025 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611278; cv=none; b=VTFlF9XZBV4GvarcAjci2+RWu2DwOyjpDsRIGANfdrgORpaTva6PSfIQCQ1OO40NyQDGWZIDzjfp8uubNkNmC8NlIGWhOHCFmg8AOKjUqzTi0+nCaPdpGUwsv2G1iwtJT+ofW+NngwhVlUuy9/QRG1x+JTu1kkaJf9y7bftArbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611278; c=relaxed/simple;
	bh=zXjF8jfs+kNZqnzl1iUWon1/MSwqge2rnUmh6hDCuv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CrJEE9jPz5OYC4fpLOb08Q8EM2inZ8M28SgUK46GHPc0EkzEFtpaP3Vgs+GLBe4rytOUYVs2LGgq8ItydPsJWSQmM2HBQf3cqhVejgqhDe/5jsHnKB1sw7RnYkOU9yoniFsaWy8uOUhzrosRwCeTiF46/wMeQ2eenbYMkWFcDiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GaoEc7Xi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAaLTg008153;
	Fri, 30 May 2025 13:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYNooSaF9VtErmHd6i7PAl2z2xZHfuO7wnNVgPs5eGs=; b=GaoEc7XiHN/wT6+C
	CAD2pPwQuvbkhlW5q2uVm6yRmbay4ortaOW+Zba91WlCd1QQZoZjEXA5U1NfRMjj
	fBrYGmNe0bl7QzTzML3JrnJuzR4I9QTUtGoaZC0nbqyA+Snq8ZkSB9ovas1i8fwd
	781iDjqm6gIADPSxKl+9K6iIHvBgJGGGsZdTbsKgJpRz5tB1E8+78WAqmQ2iNeR0
	kATbYXFT+yF+ii9wbA2BOfrAVJitOFhyGDvn71J6H3ZUIL+E3EpWe8uhLahXbQXp
	aK+JZEYDfobf76mkLQgMDV1KJc/AVUXdrg1eYYoZZAHDfFeXXIsu1ruhIdWJaPrF
	CLrA9Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf9k49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UDLCuX031158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:12 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 06:21:06 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Fri, 30 May 2025 18:50:47 +0530
Subject: [PATCH v5 02/18] dt-bindings: clock: qcom,sm8450-camcc: Allow to
 specify two power domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-videocc-pll-multi-pd-voting-v5-2-02303b3a582d@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6839b0c9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=VNckzqIK-Xfz9zBCpKcA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: x9zy4aIHhdhTajYnVSszW4R7bYCFBXGM
X-Proofpoint-GUID: x9zy4aIHhdhTajYnVSszW4R7bYCFBXGM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNiBTYWx0ZWRfX/SRSLqeTM55S
 kjtFi4BsbPs4Di/ViLL+zExEmBJLbpvBABP9mWrS5ro1d0uf8ZCQcvJJvrbIR/SYq9Y9aPYLMy4
 huPtJ3U8sn0K8+j0YiZE/MM1jHxEYrBTg2setTSX833Jwq0XvyaT2+GGxa5DSOVgjzTjSbzl9DW
 UaT6q32oOoDvPNLx8belwiECBh/O6alGXwBdcQ0cIYs2xLjxVYyCp0FPzwVR14PPxNrUJaB4zsb
 q++FN8HsEr9RurPqx71T1TmR+Ysz9K4+jVvBUs6HcmnogCDXFYGZcoCFtx//SKvs7Djo6BIXOch
 P6tDk6Rw5covG/+vofiVkQIkB2IFwycGYVVWK3pnYYxjgM8Eam8cQAQFpxddfXMWMUwVf8LgVRr
 2jfprIlXeMw521hqiumIEvwxzzTgUgqGxqQPJgSb2mgvvMqcP4mT4Hc8w5EcY0pJALYclB55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=985 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300116

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

To configure the camera PLLs and enable the camera GDSCs on SM8450, SM8475,
SM8550 and SM8650 platforms, the MXC rail must be ON along with MMCX.
Therefore, update the camcc bindings to include the MXC power domain on
these platforms.

Fixes: 9cbc64745fc6 ("dt-bindings: clock: qcom: Add SM8550 camera clock controller")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml   | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 9e79f8fec437b9aecb5103092f6ff2ad1cd42626..3fded6aa712fc1920c4c4a923545901ba804c42f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -37,14 +37,18 @@ properties:
       - description: Sleep clock source
 
   power-domains:
-    maxItems: 1
     description:
-      A phandle and PM domain specifier for the MMCX power domain.
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
 
   reg:
     maxItems: 1
@@ -82,8 +86,10 @@ examples:
                <&rpmhcc RPMH_CXO_CLK>,
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
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


