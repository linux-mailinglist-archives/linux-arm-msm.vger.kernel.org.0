Return-Path: <linux-arm-msm+bounces-31013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B2C96E2B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 21:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3101CB24B8C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 19:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A52618800E;
	Thu,  5 Sep 2024 19:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ViC0mNvU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538EC17B51A;
	Thu,  5 Sep 2024 19:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725563187; cv=none; b=oTgoqGPmXQiqCMZoGCn00LVNX9rrjs5qTp5rV/MWTa/eH1aHESH5dM9nkBeiPmtS1uo7AlWW+GDHE3OWwerR8luy8RDgp3IK4FzjvfExTw/zTisRVK3Wfk+uFFZUI7XUgAD0W/mCR3r5mBFuBetMnkEinuOf/t9L0WwLeHiLMoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725563187; c=relaxed/simple;
	bh=bzKxaVcQNju0GtOCtqNEcWAgwzN6svVh9DoLlnCpN4s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UV4yA532hhm8cnkedEseW+jhLQqpjB65/b8woRdR+jz8Xjz7Xgkwll7HXUNcZiAq1VjNyNzHO5s3IrO5uu2+pOj0zthRXzMaDEtTuWBXfsWNgJuvuMXXJIOUGyo2W1/Uapmy/asKfs8nxw/tutOkf5vWZHNS3/NYTLgYk7AA7ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ViC0mNvU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IPwBC009913;
	Thu, 5 Sep 2024 19:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AnKTN5vuP29xkwcISjnjBi
	myM0H1ikhA/VOIJITT8MY=; b=ViC0mNvUM1b17j61cDdds7PwqqjZZyKDVKA+yZ
	0AIYan8ecsQp0XwMHDuicGGmPvaZEiFhl5GV2dqGrn3lO20fFN4DX5t9TP2YN324
	UmyXp5WE/v2dfj5oafrQyXLBpEf9sRGJoryhJMbSf45fXU5DB+ADc2TMoaVq0gb4
	XYnZwEe3+A4+MYKCs7SWjHEaKT+/d2AjCeK3UCk2okgZzICVgfIYz5nGmwWkN/Xt
	iPhWjlxqKr5BIdq5cuUrYNxZeXgvc0AH87K94fU5cUWhUp4LpIwlVPaX/nDmMYEt
	tMbNWvpN7ykfsxi8TMc4ez7z/VFsdTcYnu49gWL5CluZW47w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwrr2pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 19:06:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485J6IIb017525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 19:06:18 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 12:06:15 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <quic_psodagud@quicinc.com>,
        Nikunj Kela
	<quic_nkela@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3] dt-bindings: crypto: qcom,prng: document support for SA8255p
Date: Thu, 5 Sep 2024 12:06:05 -0700
Message-ID: <20240905190605.3770972-1-quic_nkela@quicinc.com>
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
X-Proofpoint-ORIG-GUID: UIkexxWkfLzmiIdedVkmO3uWxNtvxQab
X-Proofpoint-GUID: UIkexxWkfLzmiIdedVkmO3uWxNtvxQab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_13,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 impostorscore=0 mlxlogscore=976 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409050142

Document SA8255p compatible for the True Random Number Generator.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---

Changes in v3:
	- Removed the patch from original series[1]

Changes in v2:
	- Added Reviewed-by tag

[1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 89c88004b41b..048b769a73c0 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,prng-ee  # 8996 and later using EE
       - items:
           - enum:
+              - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
               - qcom,sm8450-trng
-- 
2.34.1


