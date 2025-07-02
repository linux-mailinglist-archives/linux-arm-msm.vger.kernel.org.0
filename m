Return-Path: <linux-arm-msm+bounces-63423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32805AF5C65
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 17:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5936C3AFFBC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 15:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6389F2D0C85;
	Wed,  2 Jul 2025 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PoNPrgh+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE0B2D3757;
	Wed,  2 Jul 2025 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469218; cv=none; b=uH7dLBSP8zhEqp0ljWutNVkQqqm/CTfLqGJlC1ebnOUsAVPRPYG0GvX9GgKzDMHFDBzUDs0KQprA7tMaoCZjR9dGX0C52mQ5z1iTXP4ct/FEu3CXQ52FZzUT/5M+EB7iFget5Zv1CC4EFaq99h0kdSTEUz5N9LZKoxQH3UV3Fq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469218; c=relaxed/simple;
	bh=2ihNgJW3++WTyi6alSEFtinXmVxhYwzlX+sssfaXXb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LqUOyyEB+Red3/C6BdWgdTZEAntwMTzdtFFbbzh8ubcRY92HH5qLnq4j6phwOr74BIYQdjbCvM+ugmdqw4nxsRvVIQ/F7AmzxwZgu3GVBN24Xw1MNg/Yj+dlL2fU8zEplZN1j31X9Kwqmgvocz7JBvbDOpelAe01Oio16Eo42Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PoNPrgh+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562B7omv012466;
	Wed, 2 Jul 2025 15:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eF60tMOqu7KEBnAfq9o06J+xHNcN1skBpHk8ijDIA+Q=; b=PoNPrgh+rcV6Vn/R
	YPcLXW/J4Ip7nBWX7hnjNfRWXDkNAW5LGubxA5b4CuJfcikgv3yLzHO/ShrN7zPx
	T275qjUs25ttdssZXVTytMJU585nHFiqogaJb11xVEcBAIJxU8bm1yKOCrPyyz1j
	1X8dplRoXqNJPFVBXG5XqYlZt0mdY4oMuYPQ2qm3SgiPsrdJ3EJLLpgkLlEEB9QA
	VFBdQH04JABSwdHioPfHNrvuj3I6otr0xWE5LfBAU/RIGLVssPr0rd7zmqTwZceQ
	ow3I6HxAEXcvATShK6RZP0pwYMIt9DHyKGS3tboqbZet2r8ttpQ0wXB25mV5hHhZ
	WGPgyA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30a4ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 15:13:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562FDWww005600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 15:13:32 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 08:13:28 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Wed, 2 Jul 2025 20:43:13 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250702-sc8180x-videocc-dt-v3-1-916d443d8a38@quicinc.com>
References: <20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com>
In-Reply-To: <20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=68654c9d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=m3WaDHdJIJcFsLUxIFMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: J7BdMVlrGgpZLF7n2KxV2oODPxbNRUN2
X-Proofpoint-GUID: J7BdMVlrGgpZLF7n2KxV2oODPxbNRUN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyNSBTYWx0ZWRfX8o8roVkgv2XJ
 nvHB7vFVFK8zvbQZKlmrVfArveiOe9Ko8satyG/T7jKgSf/JiATzeJUGkSRoN/Doxwh7/y9OEs2
 K0/e2Bw6jskFCOzXYUgCWGcKMjLd/0vqLZmNEHkQF5OGZb8ayuExFEItp57YCMpFsAHa+SCxjil
 G07slW2K88OZPS5XKgzXOPQKk3vG3sBW3kwS4smXbLV54WcfvYpT/Q9xq/ho/h2pDjrgg3tAtSk
 ttfHWDIssn5OqaA4QMl+owvlvThADlx0gSoYimrUjutWMPMy0786/cQt4WYAz3YTfiektvCsf1F
 dFqnD2lYXM6C+7lk/u+skPoQl+n9RNE3pBV8g/jjSIiLoILdgSrSaJoZYOEBkgk/KZNY3W5xPHc
 QRZrJRX91T7F1ogKSD+AFiBB2wDjmS1WHWqPD6aR6Rzh+w63YtnybaeQWp4IydfJG4x55Qug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=991 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020125

The sc8180x video clock controller block is identical to that
of sm8150. Add a new compatible string for sc8180x videocc and
use sm8150 as fallback.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,videocc.yaml       | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 5f7738d6835c4ba999402e163fc85a07e3a47a5a..b490caaf843243a7a96395fdd2b99972a45679f9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -23,13 +23,17 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7180-videocc
-      - qcom,sc7280-videocc
-      - qcom,sdm845-videocc
-      - qcom,sm6350-videocc
-      - qcom,sm8150-videocc
-      - qcom,sm8250-videocc
+    oneOf:
+      - enum:
+          - qcom,sc7180-videocc
+          - qcom,sc7280-videocc
+          - qcom,sdm845-videocc
+          - qcom,sm6350-videocc
+          - qcom,sm8150-videocc
+          - qcom,sm8250-videocc
+      - items:
+          - const: qcom,sc8180x-videocc
+          - const: qcom,sm8150-videocc
 
   clocks:
     minItems: 1
@@ -111,6 +115,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sc8180x-videocc
             - qcom,sm8150-videocc
     then:
       properties:

-- 
2.25.1


