Return-Path: <linux-arm-msm+bounces-38850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F149D5FA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 14:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6E7C282C39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 13:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7026A1DE4D1;
	Fri, 22 Nov 2024 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f/a64b8N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F5D1EB39;
	Fri, 22 Nov 2024 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732281672; cv=none; b=cE0mmqmaWk/uJIBxVsJka3M128XXMdfOIEeWG665jDjLmdaOTeNJ1YQj0Z7iReCOCW3jKNg7ssmXJ0VrCfdcu3IgO7gQdKMeyrdbYDKUDCMEsLnVu+Gt4HTgnz85t4zyJiRQu6UwnDnw23vfKgwSSX3GlAjAySHOO8KoOaCgImY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732281672; c=relaxed/simple;
	bh=CGjYYuV2s8sSIKMGfBw//FLhJifkTYPh4ZjMvvTbehM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SMTMN28ghJXilYU8Mi93lqU2oz+5GinNogV2uXp8frEiIYIfMqL7Q3VIm3eNrdFc6UA2GciVl+MAN1UHhVRY5zlkAgzsP1TZumtP7DYqSTf7IYA+QJxM1zTpGzfMpVvSwUBGkRDjjDRFTlpotbV4tlYckZ/j705Rqg86kUB9A/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f/a64b8N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMAE8lC027544;
	Fri, 22 Nov 2024 13:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8UBwGI14pF4Lr0wGBdlEEGI7R4ni4Zwzi4ps0rdAWK0=; b=f/a64b8N+72sn1RB
	o5x5/IG9keWb1SnGR8ba8ytESwMxzwSZFN6PcWOooe9GFSW4moiWjwtMIYi3KyRa
	Bi2YgnKFFoLs7+CyJWtJHb0NHpnLFg/yv5lM5qW5NyALaDpjUrESwla0iLB1W3Pl
	bOP9ieC5RSHodr7rR5CnAPRib4PuzOGXOdWY0WNKpDnocRsQiqB+yZ58aAjnV1dw
	qmvHVIsMrABAGyfKx2NAagGvyv8upkAIQf344zidfg334CM6Tr/s2iV1g4G0PU/+
	bFi+3V/IIZzt5nIFhUL6t854O9qgZj2s408hDTfzZ0l6Sv1P/bnUrvETAoK+EWle
	yIweVQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432d5b21ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 13:21:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMDL4MO024935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 13:21:04 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 05:21:00 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>
Subject: [PATCH V2 1/2] dt-bindings: crypto: ice: document the qcs8300 inline crypto engine
Date: Fri, 22 Nov 2024 18:50:43 +0530
Message-ID: <20241122132044.30024-2-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122132044.30024-1-quic_yrangana@quicinc.com>
References: <20241122132044.30024-1-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V3wr7n9JT0ZBKxp6D2ZwQDvJgRciXmBV
X-Proofpoint-ORIG-GUID: V3wr7n9JT0ZBKxp6D2ZwQDvJgRciXmBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220112

Add the compatible string for QCom ICE on qcs8300 SoCs.

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 0304f074cf08..657693867ddf 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
-- 
2.34.1


