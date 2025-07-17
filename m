Return-Path: <linux-arm-msm+bounces-65382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16028B08526
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 08:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7440A7B0CA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105F621B91D;
	Thu, 17 Jul 2025 06:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cDoEaijy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9B021A454;
	Thu, 17 Jul 2025 06:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752734379; cv=none; b=KgOGOZOO0C3pJTqCmDvEXHQ2kVldKSoy1royM6MCy+qD81hfMBTs7uTBJZ0B025ObYwRXIXRP4xO8g6ZE3BpukPmfL5kVCjhlAJYI9aJ3gzLsMSzRQivU3ye7X5AmlOA5SHhbFaMdnbS0BOo04mQncsCKvMQSyCwOENM6RvyiZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752734379; c=relaxed/simple;
	bh=eZzJ3/zksrrJbDCYNyCMKblV9Q9k/Cyo6z9ekYQeYog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rebjpRRxUJImgDW28KAA7fiK4Gvk8Dy94EZO70k+/lOijJe5H9WDo8FePNJ9vPa0KgaihDXXXZCiibQ9fLrGaZPoLJXG6u5fuwvCFLwS21A/MdgxoPVYBUE3vWuX5lUkonWzH9iB/gx7kG16EbW9uLIwMrWG/uN9UblkAA2SWEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cDoEaijy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H467qA003009;
	Thu, 17 Jul 2025 06:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZFXGo1+tT7aj/ISeCFFTA2HIZnGtqClrhqnODi65iE=; b=cDoEaijyO30DXsJM
	d4BiD17kKGac3Y+UMPs1sJ2haUfmTX3Y0ITa2Vb3yigGsFjqy5byT6w9QfmOXRZU
	3YzkBm5OeNnsoX0WKOP3454Tckmt9ioD1Bi2Nkmw93kOQexMDnZaS/ziiWonJeDm
	dmonoBfPLG1zX9zncQRtJP1lPN2lWsZ2wXViA1IbxChZtPCuwqon4fVUL5KK5Hyq
	9mKVnBts4RwXTMa5DnLi9wST2IRHeXNCVP7iRF4yy83GbHNLa5PMFM+O3OWbwbsT
	eFDI2c2ScgkB72tCvU7aPHbQz/9fxkJXIwHiZ2JCNJS213dnk+an05ikDouUzG3t
	A01ERg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xsukrb71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 06:39:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H6dYnQ032531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 06:39:34 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 23:39:30 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Thu, 17 Jul 2025 12:08:36 +0530
Subject: [PATCH v2 4/4] dt-bindings: clock: qcom,sm4450-dispcc: Reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250717-gcc-ref-fixes-v2-4-a2a571d2be28@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 1wUHVXB-AULJtfkJ9i9uIFe9KwijSou-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA1NiBTYWx0ZWRfX2dXlI1hN0RXS
 FugT0tjrjsAIcrOQ7E/QtW8WxdKSGWcLlh6OhI1hcx1NOwGhz1mvQTnLwWmK1jl2iQVzvCj3TON
 avoyrG4fpuyDx0aM35uqkjwP1TcBInhN4jPesf2CUHWDGErU8TyscSGJvNeSROvipHpfXLs/0nl
 +eDVGIOGUEr7KDzAvYRaD4Zi/nOOoe3UsTQbQ0TcoORGaktLCQVIC6iX/DfpGMhIYqtNYXuRHFj
 /ocAZgGnEhk0J7NMEPh3POr3pkdG02E4BRXpSOxoq4ywAt9zGQyQOx19J6uAVQKTpaHJSZ1XRic
 xiQ+hqu2Cu1NAe7C0Husp7TsWmyJ7CTjbN/XN70Xl/4pPEgb5SV/C6S+pAn8oFU7VjCxtefHUT2
 SxDnvEk7gpqc26YoaOeM89SFTiA0woySL5PRT7cA0uqlWqYwZ5eq50Dhu8G5ClgTkIq8LzQp
X-Proofpoint-GUID: 1wUHVXB-AULJtfkJ9i9uIFe9KwijSou-
X-Authority-Analysis: v=2.4 cv=JJk7s9Kb c=1 sm=1 tr=0 ts=68789aa7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=vY0fMMrL0GyAagIjfbUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170056

Reference the common qcom,gcc.yaml schema to unify the common
parts of the binding.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
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


