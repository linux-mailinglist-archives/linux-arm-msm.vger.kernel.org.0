Return-Path: <linux-arm-msm+bounces-64154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E957FAFE450
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A54D1897A27
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A032877F6;
	Wed,  9 Jul 2025 09:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DjB/lZee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58B12877E6;
	Wed,  9 Jul 2025 09:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752053901; cv=none; b=NrblYxVxGLgvpKKjdrJqdCUi613U4zHc6d3IWVyzOMYxZTAE6AeKbBwrbLq2aeavhd3F4RpGU8oY9t98P3pEEhmE4QMKsyckgcPhuTcCVuGIgEhj3kJPkJow4NAqJW666HbVma+rt/X7LRPIdGPbsKqaxDpqfrTlszh75Dv0QlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752053901; c=relaxed/simple;
	bh=gA8pDytsNDHdSeIXisKyMwNmc0tUrkbHg3u47RpJnT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lBJKIClMSqInbkSOZfr5w9FClJuxFcYvF8xS/ng4o1KuatxjrA26AgQeve7yHyphQE5eP0XSYyI/a/YZakf8G4RhEpyWdy5uHYd5g9nvriGjKfYqfg8UL6W740o4qQT3IuuricW9PruEZ0o3eGEBvVSBhuoir+F1h8mKT+lcL4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DjB/lZee; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5699BnH7014069;
	Wed, 9 Jul 2025 09:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lcQ/3Rmh2mRi0aI2moethbjL7iBwgAxD9ZMrCiKU6ss=; b=DjB/lZeeQU6ixCGI
	/XurBprkSczXYq2t8e7KPrFH1zdyJbC6urucVCcQTKyHpVw1buOmdpOWBP5WB2mM
	F6DH8J4PEl2tE28Zjfm5rv+M+tzXA276XE4i9FF/LbXW4ArszdfqMrsTbYmx42GS
	JgUMa1mewfBSqQFLOvduL33byqtY52ShdzB1EX1MDP5nWKlY+o8hYbQJG2fLKPl8
	Fwd6UYSbbPBVAvyIYw6aQ6RU1RQF1KG7UhhMwv5y9bnzee82mjo+Rp24pB49nnL6
	864Y1sZ/kmWB9zV9vPJbg3q46nFsxY2q52sSseiMh3e4KtXtGGHwg571AlyK3T4q
	NXvVog==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bbq1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 09:38:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5699cD5c008297
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 09:38:13 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 9 Jul 2025 02:38:08 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Wed, 9 Jul 2025 15:07:25 +0530
Subject: [PATCH 4/8] dt-bindings: clock: qcom,qcs404-turingcc: Reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-gcc-ref-fixes-v1-4-ceddde06775b@quicinc.com>
References: <20250709-gcc-ref-fixes-v1-0-ceddde06775b@quicinc.com>
In-Reply-To: <20250709-gcc-ref-fixes-v1-0-ceddde06775b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        "Srinivas
 Kandagatla" <srini@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA4NCBTYWx0ZWRfX+7Dk5WJTBMFK
 nVp8htK+/HTC7fkA/I811rvMh5me+XJTkLMOXC4PBerNJ+NZ4H9LJB39S4EH3m2orwUyR010Iny
 lGCie4mubWDbQM/vF/p3vLLRx/6LPcMbYJDGRQ/tR9xpW+jNUPv3hVN24/i0eC/ngckIYJiK7pM
 4IIpfaO19eEL1B5+fkGKYAN0durn+6vSizH7Nsj1uKM4A1JpkO78Yq8mJn3QI3y9Jd+rHq7rNLn
 SII+BBz1u/PTo8pCVLj7jexU4nMUeovurjl9n5X3ludHql0mRQM7mUSWhtyP4We/P4VxiNEbgg5
 GpjbtcGh9Dy4E2TLo63IRPPc9L2F+uWHTOYOe1hYiHIBnkg1LxXjNi2p6GkejT3LzRFjLzYwJtW
 i/upsALaaYo52xSdBv7GbcWmXtDi8JxBZJv0wNTHTTZ37MKUjATKVD6m7v6QQdXRcNr8hB9M
X-Proofpoint-ORIG-GUID: r-5A4bZFTkt2gH-iRdZIP0FhedeW1cK1
X-Proofpoint-GUID: r-5A4bZFTkt2gH-iRdZIP0FhedeW1cK1
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686e3886 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=CSwUXwCv9_y7JT142Q8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090084

Reference the common qcom,gcc.yaml schema to unify the common
parts of the binding.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,qcs404-turingcc.yaml | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs404-turingcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs404-turingcc.yaml
index 033e010754a26bd03e02a364b0a6f36d87a3af62..794984f563fe3eb253aaf7524205097cf0c62711 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcs404-turingcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs404-turingcc.yaml
@@ -13,26 +13,17 @@ properties:
   compatible:
     const: qcom,qcs404-turingcc
 
-  reg:
-    maxItems: 1
-
   clocks:
     maxItems: 1
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
 required:
   - compatible
-  - reg
   - clocks
-  - '#clock-cells'
-  - '#reset-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.25.1


