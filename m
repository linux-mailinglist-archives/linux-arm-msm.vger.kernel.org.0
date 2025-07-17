Return-Path: <linux-arm-msm+bounces-65381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D5B08523
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 08:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4BBD4E53B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D1D21A931;
	Thu, 17 Jul 2025 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c2j/hqFG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA5221A454;
	Thu, 17 Jul 2025 06:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752734375; cv=none; b=PXgiLVyotmc+gl9Xptyz8px/d1+MMJmgjw2JeCjhWNMT6/8Y3pdIerssI8aKHMC3M5cvOriTfE3gd8yljZb9cMPgN3P4sZj88fdfKYuHsJNJJAlcPFwtvz2JILgX1QiHhhb3HmNm9Bc5RZTl3QjprRVS0lab8Ao/Agv/2HYI5s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752734375; c=relaxed/simple;
	bh=w5w00t+w3I4RikQEagASO67gAy2eLHkzgCc/xyNZbVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JeQ0UcfoHV3kES+YeexaAh9fzXcFZt39fKW5+C1L+/x4EGiPIAilrrIl2YLNwefbfBO7nIfYAoudsF2WSzV7I2MKFkj34AyyW+2PUeiSiuObOg8FBE6d8rHrE5CwcwOxD5SWxagKLwsIE2UFUajyYxX0goy5+z6+Iizaojxf7tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c2j/hqFG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H3nXch022240;
	Thu, 17 Jul 2025 06:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2rS3v9sf4JQ1LjxzPpq+GTQ0oXeH+72NyK/eKDOX2b0=; b=c2j/hqFGyWWSJneb
	P5h2wln2NJa0sysvZKIcPpecE3/z489AE/2uO1pH8RMkl9O0L1VwI6fu0pJjeErg
	RB5EzAcjJMn4vVG7YdO53fKn+LKTwRIeB2ZxNp1SPkCRdrr4iLGkErYId9u1iiok
	7NIlDMl/DOFdD7jRCAlRt4W9hAZk2FZaRTaPMR8Ut9Rr4Y3TQ47pTRLI8fQLZiPu
	VuTF/W2/qKXLOBrpDXWlym7HM+5+M2F/QtXsRxE7OwKa+wu6k3GkS57/BLgn1j3S
	UShc975wCCbtWIkzv69xBATA7gNj52Lpb1x74113sqq7wVtbPh1QDsIafONSMtL8
	Io6sYQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy6f9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 06:39:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H6dTro011343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 06:39:29 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 23:39:25 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Thu, 17 Jul 2025 12:08:35 +0530
Subject: [PATCH v2 3/4] dt-bindings: clock: qcom,sm4450-camcc: Reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250717-gcc-ref-fixes-v2-3-a2a571d2be28@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA1NiBTYWx0ZWRfXy7zzVf86hHWl
 lUqbg7NdxCZKk9LxURKnkTcvqczEFpSSG/VVP2py9MC2eZBix7wTYzT0aHi1zHjaw0/7oPA4684
 KtT83oCyhq9Re2n409ZCPm6cTvGJ1doxyt4Off6HiJH0Gj2O4SeumChcDZnxAKoAILsDxQOAYuZ
 NPyKFi3kBapT9xPWHhRYdSBPQT7+hW7VeSyKtDkADSmNY1QMbVwv+/uk9KAgPFUaFEp20yipDhc
 /gDJ1E2WMTzbbJefJ+hD5RQMdPL5AqIwUHHkUmJyIBiUNO3pdfjlx+JiEMkUSTla5usTxIjR5ut
 SDteXF+Ey6Oo2hXexZdmRAsxUJPdnz2kPb8bABInKePTai5NcvKrxh6xpcszROrI3nHc3QgsL7x
 5z8+i1SS300jOnVYTlALzaZbHVOFbnK0D72QDsZrGrQJNd2AZ7QLepDkwcjsFefg6TR3ttKj
X-Proofpoint-GUID: EIEr7aohcH-EWCKODnhtM0FtdCdswxgC
X-Proofpoint-ORIG-GUID: EIEr7aohcH-EWCKODnhtM0FtdCdswxgC
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=68789aa2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=_YWzZ9VlQIXh2UY1fugA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170056

Reference the common qcom,gcc.yaml schema to unify the common
parts of the binding.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
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


