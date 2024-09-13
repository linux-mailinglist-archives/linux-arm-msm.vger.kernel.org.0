Return-Path: <linux-arm-msm+bounces-31691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5C7977C28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 11:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FAF21F281E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 09:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8DF1D79A5;
	Fri, 13 Sep 2024 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RIbutGkL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD4F1D6C67;
	Fri, 13 Sep 2024 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726219498; cv=none; b=kDhOQyIhDy6of+BRinHAlTt3Rsw2flugZ0MzMJYwSHn8pFp/H8GHcClPu9xg3Vde8M/9C6F5Rl5whSI7nPACKCFmPcRRa7ttzhkgGqnNDe+BbFlAqoeRgNPjdGOGOrmiVFoxvl6xBqDsx2dhFl/xdujGCYKkVvtob383syPWSjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726219498; c=relaxed/simple;
	bh=3HvbLA+W0U2xyA09iQnxLAS+bomsPx+DyQDXnE4zi/U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rt8eBzJDMmisN5dkkVyGWKavzObshiKy3pkicRmkEdqz+jOimklRWb6G88abjicPbH4euwuwzkchji6uD+LxX08fWaKRjXc8NZsqo/lOOsFI9M3EMXxlNwRadpfuRqhix5A5ee3RDXvRbjcHctW7gam1RcaCh7fsqfLLgPUEi5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RIbutGkL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMB4i3002995;
	Fri, 13 Sep 2024 09:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5qWEnnDV5xMavjrV0K8vEtfKqe13yXNlIsTlxMXd6Wo=; b=RIbutGkLlbbrmEst
	EFoa6aMhbZlEb6PVvsDBBe2gyukWhnGDvP3r7zc06/OFYFuQSZHp9qP5yUlru+2v
	UtlNoaAIZVWe4SrAnXhzEcqcCS6fbayz2YIcc5QN6WRue9UNsh4LEPs7ZYdGwMZ/
	zg7PvnOssrBK/xsGUZ55HqXWlZlxSUosf7hPKc0RYP40C5sx1zHrXyJ/Jg2C3KXv
	o6lyRxG4FKPzeoYqSy87bQXEsq7oG8dTcI46x2CUCpARiv7+fhThI5cPynhyoy+E
	N7fngdDFybrlsCx7RxNIcutYWlTToqOct6e6SFbmdI2I5UMnV9DK4jIGxWqkVsu9
	dOWF7g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybq03aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 09:24:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48D9OgbH007098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 09:24:42 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 02:24:41 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: arm: coresight: Update the pattern of ete node name
Date: Fri, 13 Sep 2024 02:24:28 -0700
Message-ID: <20240913092430.31569-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913092430.31569-1-quic_jinlmao@quicinc.com>
References: <20240913092430.31569-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Yrf5HAaKaiWVrORaOk43REaac6R7PC3G
X-Proofpoint-GUID: Yrf5HAaKaiWVrORaOk43REaac6R7PC3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130065

The device full name is embedded trace extension. There is no good fit
in generic names list for the embedded trace extension. ETE is abbreviation
of embedded trace extension and the number is the CPU number that ete is
associated.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../bindings/arm/arm,embedded-trace-extension.yaml          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
index f725e6940993..0a88e14e7db3 100644
--- a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
@@ -23,7 +23,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^ete([0-9a-f]+)$"
+    pattern: "^ete-[0-9]+$"
   compatible:
     items:
       - const: arm,embedded-trace-extension
@@ -55,13 +55,13 @@ examples:
 
 # An ETE node without legacy CoreSight connections
   - |
-    ete0 {
+    ete-0 {
       compatible = "arm,embedded-trace-extension";
       cpu = <&cpu_0>;
     };
 # An ETE node with legacy CoreSight connections
   - |
-   ete1 {
+   ete-1 {
       compatible = "arm,embedded-trace-extension";
       cpu = <&cpu_1>;
 
-- 
2.46.0


