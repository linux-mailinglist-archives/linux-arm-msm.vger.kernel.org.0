Return-Path: <linux-arm-msm+bounces-64157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CF6AFE45B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEEF6176B98
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A1128A723;
	Wed,  9 Jul 2025 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FOUzdRJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6291F289E38;
	Wed,  9 Jul 2025 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752053913; cv=none; b=fkOC//k9zLML2BkfQZ7l6HB4dLEFNoJi3/IlG6XutlqFj9kDFmMkiztnvHOJqBcmnvAuLDO6IYe6nSjmydOv0b4jHYtOsymrjsgOqVlUgL6ZDKnSaCQQoSByi8S2Kv42kQvITASRHbuuDm89F+ZQZnEp1lXx76Z6Nh0ecRFw4NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752053913; c=relaxed/simple;
	bh=nFim6aEajTrvWUuDvLXzmwzB7eowV9qMCbeXBlNldBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Hq501pCrTTDgs8P9lcl3OyJNJ3PGazUFxXMXkrk55obgsePop0GE4nSVHjLGKcOUF2Ur8Ypxrye/UkU8hNA7tArC0Ac1HYlaxWtPb++/mcXdYmLUZxdA2n/+z8X//fLh0uVCKmK9P4jhWYZiasK2TQYboZlF8diGaCNiuhf6iNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FOUzdRJt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697Yf1W030323;
	Wed, 9 Jul 2025 09:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0r4VvPuWFRwyo2BmTXQQAKkxigZ1HASnucxAak56iLQ=; b=FOUzdRJt03oM2LiJ
	wK3lcGwdTar0wbNgxRcUfqHnspDBpuTyRYNoXtguIaw1O5YzZAOBHjPzIW5MZpBs
	ZqXPNwelvpXIaEL7U1AOIlN+SrP/jzjGxln4w/hwvt+vX6mbK41X9NYp7mnCmpld
	YUfF+7M/Lllw/ohYVSxI7Kd66Ey3gFNUsjjaIDdSo82maARhVlY61zpqtuNw8U49
	cxfQKj1RMV7VGwxVhN/2bC1vkVnJ+6+1Zw1eBQM0m0MjcLDlMaDbjDFhUmLZDykZ
	+mXvJD1AFiyP9AqHaRwVVBb5+ZaALNVcZ/T8lSwI0gEBZC9SB6TCm8FYoUbMOO+w
	lRNK4A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b117sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 09:38:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5699cSAE009001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 09:38:28 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 9 Jul 2025 02:38:23 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Wed, 9 Jul 2025 15:07:28 +0530
Subject: [PATCH 7/8] dt-bindings: clock: qcom,sm4450-camcc: Reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-gcc-ref-fixes-v1-7-ceddde06775b@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686e3895 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=_YWzZ9VlQIXh2UY1fugA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA4NiBTYWx0ZWRfX8xdzVh548evD
 /VdaqwRyx4que027aFNWU7bOvGFt0Q15MKKE/1k8yVy+YpqA1aPTz8xWKHI+P+91y/usv0nMqm4
 ZQ6GWYuXG9+tIA6x++lBZeDCrXwV7XqMwyWI2xo3bF0/deITmP1nTDriIHAh3l7pSejrf/hmvDw
 ZiHbGYKRUsk6IVYOhshqpPOoYRI6Z5fx1xiwQK1fjpDkNiS0sFT3a0+U74SQW0uA01DT32x7P3z
 FFs+sNt1tm++ZPdXMzWYa/fgj9xw81cRSQCgOUHYRf340mFaNsSADoXCBkHIkhXcnZgrtsK0Kxl
 QJ6KayX+84/M2S8EPftqrKj97GMBKau5+0wTt0rfTRmAaKoPKjtd2pWJifbJIXir73sNHxV/iNU
 1FUUwAJyCD5XLK20vwNTdVPltR23UpktwI58SE6Tr95OOK5CRnIBvU0DBgF2e9VjbldfW+OG
X-Proofpoint-GUID: 58XmxMq5p3ZH6_gDAocadDF-Lquu6y5t
X-Proofpoint-ORIG-GUID: 58XmxMq5p3ZH6_gDAocadDF-Lquu6y5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090086

Reference the common qcom,gcc.yaml schema to unify the common
parts of the binding.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,sm4450-camcc.yaml | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm4450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm4450-camcc.yaml
index f54ce865880dedfb4bb7c38cbd39a6f5690cda31..1464f3d1f48552d0056715340eb1905d7b2b3e1c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm4450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm4450-camcc.yaml
@@ -20,32 +20,20 @@ properties:
   compatible:
     const: qcom,sm4450-camcc
 
-  reg:
-    maxItems: 1
-
   clocks:
     items:
       - description: Board XO source
       - description: Camera AHB clock source from GCC
 
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


