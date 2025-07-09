Return-Path: <linux-arm-msm+bounces-64151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E3DAFE448
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D0217B6E45
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F037A286D72;
	Wed,  9 Jul 2025 09:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XPFC4oca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FBB286D55;
	Wed,  9 Jul 2025 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752053884; cv=none; b=o27CMxmX4iQ+vHihejsSogYVRt0PgP7PX67jGTTeugOHk52rRgU46D+p1ETgdWaSg77xrnN0JN3NrVtRK0rvBVe1K2M75c3SM54THArVxcpTpekLfYKk+c59zE7f9FpKxRfu0Lld2t6JO0tiCFRQ5VljDd5HWL6bP954H7rJArc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752053884; c=relaxed/simple;
	bh=xK6St0aKUaL86roMKcMdRPeR0rMiS8euIvYxDmD9NiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aSnKJBP3fp5rlnmIYYGlzPkfEAFBcwfoE2tkQiEHVo6M793Nb+cJDBd8Ba7G6DiKIsxlyxw9+aJLr22mPSDI2rjpPVmwpRacGuI58OIiihze3skgnFVUm82DEKuqkr93oziLWQ0v+4WSFFoe2plPacFAj1h29z24l/Y2ypAIo0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XPFC4oca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697jdr1010299;
	Wed, 9 Jul 2025 09:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8KPNkQ7s++jzEJxUAI7CHNY2tht7ZOa9ip+YjX4kog=; b=XPFC4ocaG7xiKkzU
	z4kG7Bos7lU/ZEL78cpzdfkRrGOUqARPeBtQ5RhJJU/aj0Y884V6k9rEIdXP56Yy
	s3zVx2A/Xboq4KoJEQtotpODej6itkzsY5x6HItGzVLrC3n4QEUspfjKEZJCj/Sn
	PYlzWVCviMp+APYJXell61dJWV9cCsmW5+YRxSfoJu12on4HKGwhyiMlTQuGkQPX
	qWHZoDrM8ke7OdlQi4juCWcjsN7ljVywjeedlXCv37deUlKMjbw+eF+L9AZz+Bps
	2nkVK4UNtYnlQnmbqHm5D8C1HfKoOVCuTLbBay+uGHGuvIhAz0XRm/1O+ZcMa55y
	qlPBLw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap0buu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 09:37:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5699bwC7016907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 09:37:58 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 9 Jul 2025 02:37:53 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Wed, 9 Jul 2025 15:07:22 +0530
Subject: [PATCH 1/8] dt-bindings: clock: qcom,sm8150-camcc: Reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-gcc-ref-fixes-v1-1-ceddde06775b@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686e3877 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=_YWzZ9VlQIXh2UY1fugA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: noD2b5r2y1Dj5JwOcWtArwRvj40t7CDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA4NSBTYWx0ZWRfXwfA+QW8/WhgC
 2djHTEZKR4YhgXsTApeJN04EMcXlZqE5Y4mTbD6sx/rhjJv+eZdlt0jxY73IMDbl1EBDor391ZE
 wN5meeFjGd8X/zvIELBtYF8wWsH76CW6LSisoMANwFUTyepcuiS1zM7H/e8ui0u/vSjvKxBNe7P
 DOWYVqq/HxTG4pyb6Hczz/o2gKWRVtkGoVzMXcIV5NwRN5/vWCtgFjmKYWZlZtyqA8bMldsheYg
 dxSjZaHMNB9wvYsdyWK+zieFbq+s0/Atn7CD/XKnX3GErUEPq0wDvMgBFShhehjIlYU/3LzW3MM
 msElFydu+gQx57opqeovDGPFTu50fcOEvVqK/5xLz1jwt941kt+EGbLo6b5UKgc5XVpp6OzaeJ9
 7VJ5qbb2BWac7Uor/lhE6QqfZ4G3otfeL17GONVZ5PZ73UfcxxJPeYGjzuLmURgd9Ar7GOE3
X-Proofpoint-GUID: noD2b5r2y1Dj5JwOcWtArwRvj40t7CDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1011 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090085

Reference the common qcom,gcc.yaml schema to unify the common
parts of the binding.

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


