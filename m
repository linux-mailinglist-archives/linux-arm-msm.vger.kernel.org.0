Return-Path: <linux-arm-msm+bounces-64152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A377AFE444
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67443580539
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32D52874E0;
	Wed,  9 Jul 2025 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iWAVZOtr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ADF28642D;
	Wed,  9 Jul 2025 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752053889; cv=none; b=i1uisSRn0ngRwYC1jqlwKdEu8wiVFLzK4TgB8dsATh7/x7vZeGjPv6WqbyBJqXP64ixjAlUwSDyAz1LoKc6fOY1Ghjiki8Tw6GbKXfzFLZNFZCPM9M6WwOS3HknKxJKHkWcePnltglRoL7RrCHjQsOjFl/kpuHGD7/4VpprbJRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752053889; c=relaxed/simple;
	bh=1YjvLKEmyLFp8Pz682rtXO08Mf9QzR1Z70u1wxCzTOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bFuMRNCn4XdY2KRCd9ILpTNNAowWZqTlKBhmj8sxoEcXDCElwgCdyZSP1bpssZ79RAEdA37aU6qM7FqVYVl0kkCYAP2kdl54f7vVXsdra04uWnBAA6va96FvexxfAqOrUrJVsTDQlAk20J7x8Bbt2puHkZzyzK6EzKiPSLXxtcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iWAVZOtr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697jg8A010324;
	Wed, 9 Jul 2025 09:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdP68Li+CGHm/tYVHD8y183Y/7oW2KQENy3fw2DBnrI=; b=iWAVZOtrBAgLLbQK
	B1GG5MF6KP5icRLmMD7LQvcmzM1oiYd/UPxBrtH8gWOB0TZCjPXEdpAO6oNaIrgS
	AiV5E2VkFK8xO1qWhdjo2mFumpuZbAaNMpm8of9i+qfm6xn/Q6hs7BRBckoBC6PC
	QdvGGA1Ugw2G+NN/w92VW782AN+JWnA2bLLXi+Lth6cuACCA+DCj+JCWCUxXjh4T
	dAmsVoLoT2+5x0xn4PfjEARKGExUldYg8VHM6yYKswVykfECXRdTgCfwOJhNrlyb
	vUtVh2PXQXtRuJlElS317lE/uObbMrXHBV4t1x4eVnorv0zCcBf2MK+6lGymgUlH
	Lvhmlg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap0bv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 09:38:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5699c3Wb025973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 09:38:03 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 9 Jul 2025 02:37:58 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Wed, 9 Jul 2025 15:07:23 +0530
Subject: [PATCH 2/8] dt-bindings: clock: qcom,lcc: Reference qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-gcc-ref-fixes-v1-2-ceddde06775b@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686e387c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=0fMSYeP1Ra-aph9aVOUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FpTZpx7C1eQZwtPzTOObOE55iTu-gyzQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA4NSBTYWx0ZWRfXwKLHYjADTPdf
 LUgk3BjwguuLThWLFWv4wG9OPDdKrU2m4ncLWWzPDK0IhTvxaG3VKgAu0zRZDKnyQYsbVuwyk3R
 gy00zQDBd+YgrDjVBigNMok5Y3w6HCEPiDIR41NyzLyv0Qcreo1c+KJtAJzFR/BYjYxfVv7aT5I
 gWLtqnmDvYdfFeIcoqLbxBbq2nVq0/Hpk/BA69v/tXuXCOvEMdxSeiLcqJzM/ZmfmWOho35OORi
 CghymOC6ueiWJcItZVQYkeqdmyHTppWm2LPZM6/kpJpcJWWCDfXYkIQzMPYcE4r6mgyCAJY5J5u
 3OoTqusXnpQugRyu6WHwJeeR95QRcMa/AeEqfbWWlMw/J6cFrfhZz4pHU/MLIYlOIrJKJDT1vnL
 HTCehQG4DFLuaP/80ftVkl6kH1PtKU51H71hAXLURRywdJky/z95I8py8QiXegSkzLOCnbFw
X-Proofpoint-GUID: FpTZpx7C1eQZwtPzTOObOE55iTu-gyzQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=971 clxscore=1011 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090085

Reference the common qcom,gcc.yaml schema to unify the common
parts of the binding.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,lcc.yaml | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,lcc.yaml b/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
index 55985e562a34f8b1f5d8cff88fd733cdbae7d37c..b4b500dea527269a9a282b3f99714d5703dd9215 100644
--- a/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
@@ -23,24 +23,11 @@ properties:
   clock-names:
     maxItems: 8
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-
-additionalProperties: false
 
 allOf:
+  - $ref: qcom,gcc.yaml#
   - if:
       properties:
         compatible:
@@ -110,6 +97,8 @@ allOf:
         - clocks
         - clock-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     clock-controller@28000000 {

-- 
2.25.1


