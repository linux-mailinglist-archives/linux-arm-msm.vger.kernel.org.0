Return-Path: <linux-arm-msm+bounces-25554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E182C92B08F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 08:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E3A51C2118C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 06:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC8913DDAA;
	Tue,  9 Jul 2024 06:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B8GJSWWP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB7B1474B4;
	Tue,  9 Jul 2024 06:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720507810; cv=none; b=snHMLNDv6t/K+ykwvDRcgB5jTEpApKrDRVv+Wjuk6G05MPbd851spayQ4/6TePUB0BXsJ9Aw0zA9kVQKsKsi1Lh+jUnK9w69SIzmcpmcCGhBMofFZKt8MA/wtymv1Cxj65aQL0Iaj7Osu4E690bDx9tifk8SZf5demDXPbK8oEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720507810; c=relaxed/simple;
	bh=c8rTXqmcbWsQc3zgc8HOKAreLwLlfOo4qcuvd8YOLNo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IEIz+RMTS1YKXpy0sN6e7JJ9mTpM3fvHvYHjXzQqcLzseSi2/TercC14vm0IDOsgquE+IT2VQgghN2PgVpp+FxtUSteIrYl37/mrL0X3ZiHEwv9YAwqpqYVBmZTfa5EJWxgE5Ub9O12iv3as1uv86Ed6B6QKiRASK/dD9qkN4z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B8GJSWWP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4691NCRm012016;
	Tue, 9 Jul 2024 06:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPep6Y3ytgYw45bHh8wJzu8HusFCdCOaHUwFfmVAAeI=; b=B8GJSWWPE0Z8oDkn
	luU8snBUolwLyfv/Nb7DUlNODACluXujZRySD8l7M1pWXCyv4zG7dsEubrxxrC3E
	c8Z6IQco4TdVqTM9U0woDxlxXLAa7K/lUzuVwzwZC76EQVzhmfhdAWnlRAJkeTEy
	9p7/Jtqe4aeVpXjxy0/X8BjJTlwzOt300F/H7m4FVnjso8vP5TASJEvIsTPHmI9b
	IiriFvM1jlT01b5e45q5DnXHL9tEVWsyeIJqs72ybaDpoWoKCRLuKpG1oeVmW+6p
	/rH17ZIfRxFAcmCkcU28HoO97EctI5MQ4BAPs3dEMR/G83majrZ1OyxqjWANr7Je
	F0c9FA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwnjdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 06:50:04 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4696o1Ql020645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 06:50:02 GMT
Received: from hu-nainmeht-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 23:49:58 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: document the SDX75 PAS
Date: Tue, 9 Jul 2024 12:19:20 +0530
Message-ID: <20240709064924.325478-2-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709064924.325478-1-quic_nainmeht@quicinc.com>
References: <20240709064924.325478-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UzaulRkQTIaSwdCSo8Y1O1gWQwkMwM7D
X-Proofpoint-ORIG-GUID: UzaulRkQTIaSwdCSo8Y1O1gWQwkMwM7D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090044

Document the MPSS Peripheral Authentication Service on SDX75 platform.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 73fda7565cd1..d7fad7b3c2c6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sdx75-mpss-pas
       - qcom,sm8550-adsp-pas
       - qcom,sm8550-cdsp-pas
       - qcom,sm8550-mpss-pas
@@ -113,6 +114,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sdx75-mpss-pas
             - qcom,sm8650-mpss-pas
     then:
       properties:
@@ -146,6 +148,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sdx75-mpss-pas
             - qcom,sm8550-mpss-pas
             - qcom,sm8650-mpss-pas
     then:
-- 
2.34.1


