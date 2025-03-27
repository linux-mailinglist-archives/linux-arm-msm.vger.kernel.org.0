Return-Path: <linux-arm-msm+bounces-52600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9E9A72CE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 577283BB6D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F019320DD50;
	Thu, 27 Mar 2025 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CiXm6Md1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F11020E035;
	Thu, 27 Mar 2025 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069227; cv=none; b=kAUPuU2oNaTjqIU8mfUM0gdiokxsCNXa1r7HQLqMoo4/0c/Kygem9emyHBVaAcI1M7tedMGTHXJ37lw1qBDYS2LuDLFc8GIcHDI5NdPkZfR6EegBZNLjxFASCxE5oJbeUO3FuKXYKcrpn4zYF/fYDizhbhMZYegQfxHQsIHiHAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069227; c=relaxed/simple;
	bh=+C/Fz8CkBLRNLXdogBtLx//G396sKHXTw5fIJbUkPKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dVJH/gchTw+6ZrBRusPSIoOjmG4/Vs+hMD0FAwAj1P78nG2zndWtrbiTn9LowLftp423Q276r9U6zTFjQRjJYdNggFmpjCJCEtFdI94KucVHygIVNY7MBx0XhHW5uBcN5yEyqv/cxxc0DBXrnvUEZdWy6Rbe6CTF05i8Q98SJEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CiXm6Md1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5llb7027640;
	Thu, 27 Mar 2025 09:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oGEVFYdfer/mH0HmnqhGS+15xLeqJPrF8MT/hb3tF8=; b=CiXm6Md1yxeIm/Lo
	FS9jB8HUZ/kKXvXuAjRbz9K/hb3kspzVGzbCDg5ILccCedkDJ/MaDhostWR52IUT
	34eN2QMhEtA3RFMMbpidcu16I5eySmXa2ZNXDi/A7h0iTYdShJiDlIDYdIa/WDQn
	Gf4PMbb9dn+SziAx0R7R2AytUcKO/bA5o+zwgaozOLXPk5IueVW9If6XMTv/tetj
	P5vcPZ1dPpyoMpMNj1ViD+8JQ0gXwAfmHO8+Hc39vF1Xa3No5r0iPsbspY76Xu9w
	ExlcDY+49mkMewMjGNx8gGA+hKn0xpogTYr2FshvgykOtl9ymDMrF8v8TYxC+mgK
	ze16dQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd4r3nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:53:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R9rg9B013502
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:53:42 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 02:53:36 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 27 Mar 2025 15:22:23 +0530
Subject: [PATCH v3 03/18] dt-bindings: clock: qcom: sm8450-camcc: Allow to
 specify two power domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250327-videocc-pll-multi-pd-voting-v3-3-895fafd62627@quicinc.com>
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
X-Proofpoint-ORIG-GUID: slncZJ8aaiJz6AgL-HCV_MNuVDu0eLi-
X-Proofpoint-GUID: slncZJ8aaiJz6AgL-HCV_MNuVDu0eLi-
X-Authority-Analysis: v=2.4 cv=QLZoRhLL c=1 sm=1 tr=0 ts=67e52026 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=3sO3uEbrjyG51rgbiRAA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=872 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270066

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

To configure the camera PLLs and enable the camera GDSCs on SM8450, SM8475,
SM8550 and SM8650 platforms, the MXC rail must be ON along with MMCX.
Therefore, update the camcc bindings to include the MXC power domain on
these platforms.

Fixes: 9cbc64745fc6 ("dt-bindings: clock: qcom: Add SM8550 camera clock controller")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml   | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 883f12e3d11fa16384108434f6de120162226a28..927258cad89d93c7f6ce60c3fda53d094081c063 100644
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
+      Phandles to OPP nodes that describe required performance point on power domains
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


