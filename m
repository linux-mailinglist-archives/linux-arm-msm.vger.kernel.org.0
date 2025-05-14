Return-Path: <linux-arm-msm+bounces-57951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18111AB753B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B8854C80F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6393428CF7B;
	Wed, 14 May 2025 19:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KAwGDg+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A698528CF6F;
	Wed, 14 May 2025 19:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249779; cv=none; b=SrdesO8IFqzfjxVbmPbQOP1UMPiMHGIoUJCi4L2SU35e5LFjcBoCPkyfEe3PS+WIleAWP+b1er3fO0eo21ytJ2eNR5LbIvg3J39ddnBfFl6MhGeDVOl+E0u+Y8WlBkuEqUTiJd/hvOtLXCSZifEw9RBodu3Ldy5eVATV+RvZdms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249779; c=relaxed/simple;
	bh=RiBVKb3hAk3WJBKGlUpLIK1UIiemzHD/5Y+Tb93uqDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HbVJvj9q0k1GhwJ8fG5YFm1N1FU3Wl1R+J0i3sBy/VBtHO3hbzLc17esLI7iKRsGUP2vzqWxMvYRfryeK9IbZNEE8wkEHVmVQl3OV08pJWVdrQsT1yZbrBT3Y17gTX4pb19MSToeCUu7SE4DQ5d3tn9zGj9MpWFC7zjfYgXxZ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KAwGDg+u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EIj8Kf009132;
	Wed, 14 May 2025 19:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMSKx4GguEtdc9PiHdAmYtL2bK4iv+tmYUPTbDCPEDk=; b=KAwGDg+ukHpsrVSX
	vPwD4BfiwQWFdR7KQErqoRfANyBF9XxlzPHQNFkrhrGgmx3IAvQJ17XtmEapS1L8
	etY8u2//Q3gl3/b0boul8MX2bBGMfLtH7rMriD3CG4vhweikeK+YwgSvOK5NHQjc
	oX2Jh8GaVDcu5JF7Ykh4Xdfzh0FdYzpFQWBSWc3CsY2757RHGHKLjkhvG816JKay
	ARt/gQhYllSd/gKPX1aA08YMWNT2uVco5AhUjZPEcwvngbyVV0wEhA7HUrvl9za4
	dl2h3t/O92orqLnBWMRATPCV+fvm86viAdFyFtv02kXZoavfoY8orVtCcXuk3Gmc
	CaMMCA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcputfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EJ9WKQ010625
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:32 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 12:09:26 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 15 May 2025 00:38:48 +0530
Subject: [PATCH v4 03/18] dt-bindings: clock: qcom: sm8450-camcc: Allow to
 specify two power domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250515-videocc-pll-multi-pd-voting-v4-3-571c63297d01@quicinc.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
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
X-Proofpoint-GUID: 3owEy3VjoxPGQuUS08dklE8t2iPLSdZw
X-Proofpoint-ORIG-GUID: 3owEy3VjoxPGQuUS08dklE8t2iPLSdZw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NCBTYWx0ZWRfXyjfd4rCtNcTn
 B5M+cRCzSQZxEMMm0W3yR2Sr2QUgzsi3s5nRQ8sPgIOA703l6+/KRZLxVt4w7FrSEiS8pPRExsE
 plGaM7lpd3BYJWAnkIrpDGJqpff6/vosL3Dxq//3Q8r4X6iIgRVv/pt7Gc/3ufkYrBn5oIU92AC
 FTDcoRHyMrxLrkb1jtmVkuoQ+SKmUXp80SQvvqFtXoxj/C0rhNA/XQyMrkB9YSHwTF9+6auqdxA
 2M+VahQs8i2+IUgfkBuAkV2TvNZV/M3S3QaMGukM5gTwv8ieOUC1t2pxtmE+zT0AAFvioO1fugK
 fixXP/mrJFQlNXD3Je7Zizv5yMkjFOPWTwtKgO7C8BZt2X5ivq7QRMlHlW351EI8NnSYuThGAPO
 9snAyR2tuxqgcnwoR+7k/z1Pq0AYYOcfbGmEvI5iGsiqoBYB5/aqPp+9zfzt/jRw0QlzMmZV
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=6824ea6d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=VNckzqIK-Xfz9zBCpKcA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=981 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140174

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
index 883f12e3d11fa16384108434f6de120162226a28..c1e06f39431e68a3cd2f6c2dba84be2a3c143bb1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -35,14 +35,18 @@ properties:
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
@@ -80,8 +84,10 @@ examples:
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


