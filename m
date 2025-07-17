Return-Path: <linux-arm-msm+bounces-65379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D14BDB0851A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 08:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE4414E57A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAE02185AC;
	Thu, 17 Jul 2025 06:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jR26A7E8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E8221767C;
	Thu, 17 Jul 2025 06:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752734366; cv=none; b=GrlD0/P/XWQkCTY95aGsX/RCDtakP04L8Rvlg/REf2pmGXMqzH0rIyT12jZdqGJEndx2CCxxru5xfVAbjIzcXuElgEXgzvpiHPEcBehI2YzZSkWMC4+qFemmSmWTPbfE7jtll8+k/ZNoFXrVoHbqHTbKN6Z92fScsm+r0NQdMa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752734366; c=relaxed/simple;
	bh=WBUwVf8vkrP48QO93pWyjDPbacEAaoG2xYRvqC9uZYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=StzXcnj6D0Ci+vdepAWx5j/VLmeN/bOtKnTvb23JL1f/p0ORCdBD3fCent2dcnUcYRQu8w5SmY8BEsLoMnte5vSiYwrsEw6jY14AhjRxgeVdQkkzEt4+A05TZx2e5cmhvY6dBs03/OAMPYDdns4IxyQfhAjk5N9lNfAyohw8fTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jR26A7E8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H4LJnQ030463;
	Thu, 17 Jul 2025 06:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJEXZ4z07z565R67+R7ViPzkRTSpC9S3Rd47JLDawdY=; b=jR26A7E8/E3FGzVe
	9tmohYy+HV8JCJRoRxjzGFPQpCiCEpJOUg4tPc0C5aj1keDQBqGoQBiTTic95rb3
	Yyrx2L03k6hUnLLUUkEe9Gte3FRledleHjYwjywy1NxL6/xclTcOYt9vZvpYCw0H
	58WqTeHI4EESbjTHGqn61oMvZ5XSPlngu7SvxkUjOgI0u337Fvjff4VeBrWxZt2v
	RrlnF78NHarwUOYaiDDp9ETLE3DYpHDGKsHOtjeoHwqoaKtzOYjeWD20QWH5/fl5
	I7kZeRDkKDgG3fQw0AXiRddcZj1/yhTBWffD+hn/dcmKVePCQ42qQObxHU4q12s/
	BpmM5A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7kbyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 06:39:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H6dJXX019696
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 06:39:19 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 23:39:15 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Thu, 17 Jul 2025 12:08:33 +0530
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom,sm8150-camcc: Reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250717-gcc-ref-fixes-v2-1-a2a571d2be28@quicinc.com>
References: <20250717-gcc-ref-fixes-v2-0-a2a571d2be28@quicinc.com>
In-Reply-To: <20250717-gcc-ref-fixes-v2-0-a2a571d2be28@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA1NiBTYWx0ZWRfXwLJbrBExY5Vt
 QiMMHAqIHBVCnsRM1+NQfJZHhrlAjaLXnLe/+PyTm4WMlbVpBJS+d1n5BZPI0wH/z9g32t0Oq6N
 wM62HbKij73B/qLiemL6l97oXzS44FXILSeHiNIcaco9XRLtZh716B3Du73IlfNqIRZx2zI49ip
 o/JYk7AFO4r0FmkkJxi61xP5xIz/1Wk/PGXb82iYDbJ25+uVYQWRKWeE0MzRygdUa/X7Uu1YCFj
 k6ovweCucCoZmdqDAG1BOSxCI90czsp5CJR7GQ0l4//dAvORwYJbL/dywTQk7UBLQ90dL27Z64d
 q0ewFqxdPNE3Oag8iU+yow3APgiXZVBjTR8LjxpztVVYGGbbaTJAwANph6jnJGoUw+hPmptOKjE
 lT+xfylBy1gL2at/e1MfTtroWMeMUzKZLmmd2PM1FYNTlyI2iL/zSd1LNb+viiVAdv7h9Jnb
X-Proofpoint-GUID: omEnfh-qxYZ4nCQe1XuqC1w7vFzrDDjC
X-Proofpoint-ORIG-GUID: omEnfh-qxYZ4nCQe1XuqC1w7vFzrDDjC
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=68789a99 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=_YWzZ9VlQIXh2UY1fugA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170056

Reference the common qcom,gcc.yaml schema to unify the common
parts of the binding.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,sm8150-camcc.yaml | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml
index 5e9f62d7866cfc816845e5cd3fc132894bffe5fd..1b505f473e293af77d5158e8e65dac12244133f4 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml
@@ -19,9 +19,6 @@ properties:
   compatible:
     const: qcom,sm8150-camcc
 
-  reg:
-    maxItems: 1
-
   clocks:
     items:
       - description: Board XO source
@@ -37,26 +34,17 @@ properties:
     description:
       A phandle to an OPP node describing required MMCX performance point.
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - power-domains
   - required-opps
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.25.1


