Return-Path: <linux-arm-msm+bounces-32538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9C6986CF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 08:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E1EF1C21A60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 06:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C58818E05E;
	Thu, 26 Sep 2024 06:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ln7lkkWb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE5F18BB84;
	Thu, 26 Sep 2024 06:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727333737; cv=none; b=U187dk3bRwznl4NkZKBxxWaWiCR/8bnsRRfCeVLpuE4Aeihs7t4TWFyq4HldfCstULpIMWK4hBE2/hm9aIiQYpSLPHBpxyQNBdaClKB2ltABtkiX2xXjlNnbX1sdU57fQfW9lmORWrYU9sqTtRrpZRhvQZYFRNedAdn9QGrmee8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727333737; c=relaxed/simple;
	bh=SWUPv2yT9vFS1HF8hRCvwlmEe4NDPJrRcVUDDOhbUmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VXAwe7aoNA+i13CcN0rYdIkEs++RwjhjDQoWsTpoDqFSSLAkuQqlDhtFFlfEk7z3gYJps/joEU6BmQjKXBoumP7kZy1Rs61OgLkUOid0HSzvKnATKDvCxWB7SAkV/ON2S9FyMbYR2R4tJjb2/BYhr3ebySbpAYr4gjrvZLA7GPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ln7lkkWb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5C1Z027655;
	Thu, 26 Sep 2024 06:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZMYU44qOA/0KMilXTlkfwD0/Wursf8pVE12AIec0iDA=; b=ln7lkkWb58bLbLGm
	SAFcToDFHFmXLdUi0fX00/2+lYJlQd77vXzJfcwIBZfMe9bj6Ck4Yqv/El3UaKch
	PGZstY+FcBXMwkTZlbIRXOVQ6A42XthVcVPB7KDHgTFvPZrUWqVds9jdy4Wv3RSD
	0VorGgSnowVM4MBmlRisqP1gRj9sKzNJEH4TOZyGj9nYp8DVmiJpd20w6PNhd/SJ
	UCaMbKFxNobdzNEq4vCX40+ySokNs2R1hCnZ3+jWIDFdZNqPtcY+mWwOl1gMhK5p
	qMlg0LFCv/xu10Ms2O+jualuqjkuLMI1lIRsCDxGga08gO5xwhiIPfBKXI4Zwc2C
	96a9QQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spc2xec6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 06:55:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48Q6tDNd010853
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 06:55:13 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 23:55:06 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 26 Sep 2024 14:54:41 +0800
Subject: [PATCH v3 1/7] dt-bindings: arm: qcom: document QCS615 and the
 reference board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240926-add_initial_support_for_qcs615-v3-1-e37617e91c62@quicinc.com>
References: <20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com>
In-Reply-To: <20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@quicinc.com>, Lijuan Gao <quic_lijuang@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727333702; l=1010;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=SWUPv2yT9vFS1HF8hRCvwlmEe4NDPJrRcVUDDOhbUmo=;
 b=wzx+zlK1xDrKcDme0fW9zJ9SO6YKMh9XbwCPFMO1yplpywQVWHsAnYo9KrQuh+lBSV3Pvd6/C
 kFi6Gr7b3EyAXZBqi2uo2zda+al4xrBdY1lpNV4Hf2T7xj8ucursF91
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: buzxagTfgaNbyofgELwUFwRxJPDnPzZn
X-Proofpoint-ORIG-GUID: buzxagTfgaNbyofgELwUFwRxJPDnPzZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260044

Document the QCS615 SoC and its reference board QCS615 RIDE.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..a0c9e7179ce9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -42,6 +42,7 @@ description: |
         msm8996
         msm8998
         qcs404
+        qcs615
         qcs8550
         qcm2290
         qcm6490
@@ -895,6 +896,11 @@ properties:
           - const: qcom,qcs404-evb
           - const: qcom,qcs404
 
+      - items:
+          - enum:
+              - qcom,qcs615-ride
+          - const: qcom,qcs615
+
       - items:
           - enum:
               - qcom,sa8155p-adp

-- 
2.46.0


