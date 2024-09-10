Return-Path: <linux-arm-msm+bounces-31401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3456C97309E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 12:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED61C288467
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 10:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C299718E756;
	Tue, 10 Sep 2024 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g6jwjmbO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5447A18CBE6;
	Tue, 10 Sep 2024 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725962512; cv=none; b=Xs3zhQpa+2zorwLz5pjMHhMqPuiQcF7VW3/PY5Ir2IYJn+t/Ehc8KH8zglUYafskcotdtjHCrqFcOWQBNxVV0h25Dx6za0pDfME1/AU3cP1SUWY6zEpW5odyILeME/QFC559tvqcThDDW0Ck6NxsNFCUDZDL4mcmJLqugVqOlkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725962512; c=relaxed/simple;
	bh=s0Z4GqSWEWbzdT7D8dLokJdyc27ZzbCwdC6UJGrUhbI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N2o9zAAMNAWycg1ZRS6JB27L3ltFnjw26HMWn9+Tx2b4ayKH2gt7ovCBZFsq82NPZhysIpySolCOBd6bdnhHcvXyPMAtMQK81SazT/xBu+ibLe7vN8A+Pv2EQEKQZBqU+b/d6Uqg/JsviQgrGoj/r0tUaouGlsbEb+ft+5tGNPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g6jwjmbO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A3Vgc7019866;
	Tue, 10 Sep 2024 10:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UGmRYO2Hh4rcHDwOaxF7xYo2cbhPH5yXTpxEtcrpBWk=; b=g6jwjmbOHpSlpCZS
	nqs3buHZm0YrXshZ6HqWbYZhuzVkvwxaoMQ6IwEaC5+Z9jwvKuRVrR2lCmKKtyxX
	fxzy/zUo3aXdhcpB8Qy5jaWtXkFJoLUop63W1CBVk61672gRRVNFsJOWK0rDR8sH
	dvKxLW+XO6FmS9w4zQcwoUib/jLfVxx4+GfxxnhtIUBbUUHcFruC7u1AYwSZRbnD
	gQOQT++S5X/oxcxTf8dB83pXpN59haH8jUPH+9XI3d7Y8dcD5auEMs/j84fW5sKs
	122FmUIxvZBO59eNMm8pDA5WCY6Q4oN5C92wvmW7Q7ALQT6aZOFfSwgv8OUuWarQ
	hlmDkw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy59whv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 10:01:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48AA1dfN001335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 10:01:39 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 03:01:38 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v4 RESEND 1/3] dt-bindings: arm: Add arm,trace-id for coresight dummy source
Date: Tue, 10 Sep 2024 03:01:23 -0700
Message-ID: <20240910100127.8948-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240910100127.8948-1-quic_jinlmao@quicinc.com>
References: <20240910100127.8948-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SvYO9UU2oDMUa1HKo3mIayzEx6AtQ5Of
X-Proofpoint-ORIG-GUID: SvYO9UU2oDMUa1HKo3mIayzEx6AtQ5Of
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxlogscore=907 phishscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100074

Some dummy source HW has static trace id which cannot be changed via
software programming. Add arm,trace-id for static id support to
coresight dummy source.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
index d50a60368e27..bf2a5df72690 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
@@ -38,6 +38,12 @@ properties:
     enum:
       - arm,coresight-dummy-source
 
+  arm,static-trace-id:
+    description: If dummy source needs static id support, use this to set trace id.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 111
+
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.46.0


