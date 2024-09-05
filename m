Return-Path: <linux-arm-msm+bounces-31010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E3996E237
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 20:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1831F26DF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 18:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AEF18859D;
	Thu,  5 Sep 2024 18:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hSrUnMqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942E2156F28;
	Thu,  5 Sep 2024 18:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725562079; cv=none; b=tKrIGIadxGbu1ivakXwQTPjCc4MpbI8qy1dZdPHIaAftcIKAd0wZwwok/Qsoc3D+v506HCIdW9vfP1RAd3iyG1iLRliBr1o1xkpBTxcbrcmpoOHPMJFE8BYaZ+/uvZLZQHVp3CxyAnZ/AGuyG9CJ0DM7SG3i3e+cP5FsaD1sAhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725562079; c=relaxed/simple;
	bh=u1f+B9H2BSYGuPmARHLMMPR9FJ6EBCBY3LnhjGAiT1Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cu9AQOX7tudVVah8cCOp9nF4HEJXELcGj0QTTj7nTWGSNZ/iT18WA5VqMQKP7PNoWrX8IvWz9mmHFZs1ojeb0xAUMTKEViVg46PDrfS73JkZdZsRNZ+0Pd2BVhfh0P8BmGaNwYdxOgWsJPc9FRPx4rFcHRseCWshPgzVsZAH4og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hSrUnMqh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IR1Y1029920;
	Thu, 5 Sep 2024 18:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9Tv0skhcTVsQNb9pDT1RDT
	vuRnQPYTxVr8IyeE9mhZQ=; b=hSrUnMqhJX7PMqHDFpcsjT5Cp02mnJMSkaaaDc
	/Gwc/HB3SUagUqxxHIwMFIgsNr7GTI+vTDqZfOndpIvANZCRbwos7u/jrVx13zWE
	UBRdV9MMzWkdzZ4duhQDhXl4Qi58cXKy5I8JpZC27cZUvqsbGZhhw6sXWRVm8N7i
	qv42qMf+mZcB80YRO+eM/BsJQmZcJXPSmA77zyMEvuNIh65O7pvwloZnTerpvgGS
	2x1yE0GT1LYJGKnQ9KcEwZFkcq9qQf5HnkJbiyPEpNTx319FszNjb1DuNPGEARnI
	gjbSK0Va878Zg7QSitIFdo9fAu1sSyqqWTIR3GrYNv1pcc5w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu01ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 18:47:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485IlrNs004144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 18:47:53 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 11:47:50 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, Nikunj Kela <quic_nkela@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3] dt-bindings: mailbox: qcom-ipcc: document the support for SA8255p
Date: Thu, 5 Sep 2024 11:47:36 -0700
Message-ID: <20240905184736.3763361-1-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kFP3SIINrkq3DqSa6UxJVHgQbi6OA8uo
X-Proofpoint-GUID: kFP3SIINrkq3DqSa6UxJVHgQbi6OA8uo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_13,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=928 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409050139

Add a compatible for the ipcc on SA8255p platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---

Changes in v3:
	- Removed the patch from original series[1]

Changes in v2:
	- Added Reviewed-by tag

[1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 05e4e1d51713..bc108b8db9f4 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - qcom,qdu1000-ipcc
+          - qcom,sa8255p-ipcc
           - qcom,sa8775p-ipcc
           - qcom,sc7280-ipcc
           - qcom,sc8280xp-ipcc
-- 
2.34.1


