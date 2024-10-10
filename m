Return-Path: <linux-arm-msm+bounces-33837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582F6998330
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF51C283AE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52061BF7F8;
	Thu, 10 Oct 2024 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WVr8FGn9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9911BE87A;
	Thu, 10 Oct 2024 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728554976; cv=none; b=RvfJInisFfHq+FPO27/7AoBJ0UNT5JdD0q4w3G9ZzhkExRYs4Qa/37gkbeUIV6QnLC5eRjw6QiB0OTdlTAsbUYeLSiEQsFtfUnhB5MF6qN/sUzw712x3dE/Cd4XvOzppN86eMxpStZybz8LuBFAup6blTjxCYDBO/CV/6NdHtoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728554976; c=relaxed/simple;
	bh=0nUSCYmUoLeMIKexUMt7eewsr/wkT9vs+u37RgsZvZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=j2I/WO5OMn/r2StMY383/ein0EnXYf3/bjekBkvI75On/WWk3WYO0Axsldo0fqXD1BWGDN44KuHL/T7CbC6WuMm8XvWd16vynD+Zv/ZNwdftIEVtwRryZ5/M0cxcOD4imfzQMWDHvaso+q/Bcb2Wt6nbVoMO1AVnJgjKhQze5nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WVr8FGn9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1cqKs029507;
	Thu, 10 Oct 2024 10:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXyfTG4qGMHRF2YKlc+wVAbV9xHn0cO+A9wE//gaaBk=; b=WVr8FGn9xcV32qgO
	g00Qih21rjJJ+UWFW1+6PdhagBVhJwrn4P15xnZoMrwni6hKdPs3K+L/n+ZG8UJL
	gyYx/HzZktYDq5EXrpspQMJXLNRyAbAI8J7wY+Xla6g908hIjDENcsIHFKJLOyvv
	cw1gESK3TA1ZUifSBRBQ6GuWEdnsR7LAXdud3nPMdy/Mxedx9wJbq3IRx+qZALiJ
	hsoUmgQjVfH1uYdm992TnlRs2m6HvwMqd/Vo55R8Tf1dib81j6n0NAunyxmdednd
	OxzT1rEKB7ZWgjd5ewsivjeUgZC2UPMJpFHK/8ZShAR3XgfhrQLWfCg7qy0RJOx+
	RfcVCA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425c8qwetu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 10:09:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AA9Ua4014584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 10:09:30 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 03:09:26 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Thu, 10 Oct 2024 18:08:46 +0800
Subject: [PATCH v2 1/3] dt-bindings: cache: qcom,llcc: Document the QCS8300
 LLCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241010-qcs8300_llcc-v2-1-d4123a241db2@quicinc.com>
References: <20241010-qcs8300_llcc-v2-0-d4123a241db2@quicinc.com>
In-Reply-To: <20241010-qcs8300_llcc-v2-0-d4123a241db2@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728554962; l=1017;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=0nUSCYmUoLeMIKexUMt7eewsr/wkT9vs+u37RgsZvZ4=;
 b=RGsjulLGRa10pAP4Isszm+6e0itn6gte8pwACsfBZeQ8h7uGYkY2Wu4CzKiGSPK3Y1WhFYm0U
 pilQbSvv8QWD8iXnrkYe7c36A9NChhh5dSYZ1g42vX4owVkB37qgsoI
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RmvLwxD6FOr5UgK_s0FK8-r0C6hOBt-8
X-Proofpoint-ORIG-GUID: RmvLwxD6FOr5UgK_s0FK8-r0C6hOBt-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=777 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100067

Document the Last Level Cache Controller on QCS8300 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 68ea5f70b75f..c4691a3285a3 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-llcc
       - qcom,qdu1000-llcc
       - qcom,sa8775p-llcc
       - qcom,sc7180-llcc
@@ -165,6 +166,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs8300-llcc
               - qcom,sdm845-llcc
               - qcom,sm8150-llcc
               - qcom,sm8250-llcc

-- 
2.25.1


