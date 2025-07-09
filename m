Return-Path: <linux-arm-msm+bounces-64158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9028FAFE460
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEDD81758CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D5228AB03;
	Wed,  9 Jul 2025 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g58X1YQw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BC128726B;
	Wed,  9 Jul 2025 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752053919; cv=none; b=ZvJQqA2icaexkemvuiNHPmGkXd5+U2R8FFFFHxyN0i5+EzD7LMY3h7QaZA3AtxiDlHFWDwGAxxwYd7QQ14a50WB0T+EWarUMPDaO4Ly7MzFkhHtAwrIJw4XLzJVtZqNAaH8n/hr7eWiqeetPyXT/a0/fkCIE0c/0AZmEPrEfQ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752053919; c=relaxed/simple;
	bh=nKrExGfUFm5UUyYKFjmpxVWFJDdKwdrVIjxI8q+BMAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HA5IZlape/Rim+Xd+7EtEYuxprRf8D6xwda8H4LsINTDV13N0ncG8FVe/v87KmF6LtezodYVipAqopD9tqDeh0qbVqn05R8ADnZWbvXlbo36aJXhUs6ov9F9scCx+zds1IEr9FCHgiWQdeFJmi8udgaVoL8aDJSPpzr1Opyv9Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g58X1YQw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697jrk2010481;
	Wed, 9 Jul 2025 09:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4bVqrO1/mJGgpF02jT42iKFcHDR+XFzd6jBC2UdwKE=; b=g58X1YQwE+b+yG6k
	WBax4VTV3TseyAYQGeEpvz5/N6LbECaQdeItY7U/e1IV7GkKgYCZGiunnE5JHTQf
	fE2kYTNJHql8UQvSlVBBqIZvHzSnemarkR6xfUftZHhmgE5SxgILU2RF0Qk6HcRV
	Q4AfMRyXF8VQy5E1T66OT9vaiYIL9ZTR2dTienflkQmWNLnQPvnvel/XetgVPvdo
	gfg/10uJA4ZQi87yHB5e6IGyDRMbYlgXMMP1HWkspyiN9tg1BT4nQjwgzUA2yrCo
	jZUFCgP9Ay9dwsjYEFVHc359vHXt/SyvrDEBzM0FilqSYJczYPSiZgAlmwXA6cS0
	8puzPA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap0bxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 09:38:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5699cX3l027277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 09:38:33 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 9 Jul 2025 02:38:28 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Wed, 9 Jul 2025 15:07:29 +0530
Subject: [PATCH 8/8] dt-bindings: clock: qcom,sm4450-dispcc: Reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-gcc-ref-fixes-v1-8-ceddde06775b@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686e389a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=vY0fMMrL0GyAagIjfbUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _Pb9b17LfcU8LGlsUZnCVAhgMrn1yeUf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA4NSBTYWx0ZWRfX+j/nL6frAFNG
 ytIHhYAUJkfkwK+1uUiCrvo6BDvUfFQiwHqC7fCx86G365DItHXxhn1tE8GwJBYPeNIyxWwM2Hw
 7sAIS6NMtNX5kvjJ0eSYPmCvQosPna+hPl8QvKD+PnSTyO9S9nQ39d3pq+pWOdutOeq5310605s
 z8rSBHhXBdAu8EdgoKvKVKGnzMLkWNabcUGa8bH4AihNShjNn2icrdC1VpMSm7cVqLBzN9Xq0gl
 VXCI41ln778SjJ6860Ue3yMa7uB+cCdQFbqdQVVBheFok/AW5UqlGGkqkRqGTOWSjOC7u1lYpYw
 utWNZRRkBlX7nTDZ/XjsSUC3vn7u+zb9fWSa5pW+TNZWoWj8W7HYYCwypTFYqqERBNKj0120VPf
 7r4gEe/rQiTsnunKwLEUJux7ArZJtuFosfRdyAfguRxqAxcv4U6YywjHI5wWbwvX39TZW+VL
X-Proofpoint-GUID: _Pb9b17LfcU8LGlsUZnCVAhgMrn1yeUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090085

Reference the common qcom,gcc.yaml schema to unify the common
parts of the binding.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 .../bindings/clock/qcom,sm4450-dispcc.yaml           | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm4450-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm4450-dispcc.yaml
index 2aa05353eff17326b9f4234ac1c99dcd82a6abdb..03208166689a9305142d619509dd8fb73a2f629c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm4450-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm4450-dispcc.yaml
@@ -20,9 +20,6 @@ properties:
   compatible:
     const: qcom,sm4450-dispcc
 
-  reg:
-    maxItems: 1
-
   clocks:
     items:
       - description: Board XO source
@@ -32,24 +29,15 @@ properties:
       - description: Byte clock from DSI PHY0
       - description: Pixel clock from DSI PHY0
 
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


