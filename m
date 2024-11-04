Return-Path: <linux-arm-msm+bounces-36929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0C59BB407
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8ABD7B23E1F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E9C1B3948;
	Mon,  4 Nov 2024 11:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LGexz7H/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F063E192D99;
	Mon,  4 Nov 2024 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730721415; cv=none; b=Ijh61KhQRSC/QH3FJo96RyWAEs2DFkovX80Sqr8SOf2eZLwGMZNqxi3ZsPt5kDmIb6gIhnrw5LMGF7upRgJ4AaDg/QxNPKWZFsXd0AbvZ0m5QSePy7hcr98JwSJgzw/P2/j2kAX5VLsZ4aa0P7DCQ4iKTl/JQK32/wty0FTEWeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730721415; c=relaxed/simple;
	bh=tW6lYfDQgWTzkIZNrcEony2IMOCr5u+WoYAYNqXNnNg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZQYjYu4IbbLS4La+9gHB2MSNg9xDKVxTbmrCQ9sGnGlPuQ9Pj7P08QvsYz6IAjIajq/aSRT8LJtX9ykafXsFTelr52rUKVMJS5HlxOaTIV534iDtnOpbKY5585FrWRSyHw9MwO5QjoCSmSJXK9qm5yqC8z8I307Q3RQV57LuS/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LGexz7H/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BjX6A013486;
	Mon, 4 Nov 2024 11:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r7QGRJT45n0T5+Wc2ENAMTJg
	AWENYDW4gQh9c7sFtMA=; b=LGexz7H/pgS4ghvnQNtGWZnB/K1ux3FPGNogdG1O
	x6g9u3m3lXOVdHf0DxcAo8CyzRkIB7zUjKmHldNU24zV44udehHErCY/h6kc1YJ4
	rZzt7ULrH2XVZBp6E54eSO1nFctlsCmj+ZHnPdDHGyZ6uFMT7waHWlnkLgQcmL71
	JdqviHOMgkdboF9ARsC+jFYM04vYpkhnixpTq1UPXobeagkuRmbC+brSB10HowQv
	KYKQNfdWXvszOR521dm96y79j14Vi1Ck5XeD6nLK8fT6C4i5ImbEU9WY0uildXZe
	SEFuJNInJ/M7zj1X7UfBWC85zOXoDKoDpSR/Dl7NpcNufg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4um2n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 11:56:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4BuP6A004862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 11:56:25 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 03:56:21 -0800
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
Subject: [PATCH v6 1/3] dt-bindings: arm: Add arm,static-trace-id for coresight dummy source
Date: Mon, 4 Nov 2024 19:56:02 +0800
Message-ID: <20241104115604.14522-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241104115604.14522-1-quic_jinlmao@quicinc.com>
References: <20241104115604.14522-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JznvFPf7BOZQmtmtC0KLiLiT7LA1wo3w
X-Proofpoint-ORIG-GUID: JznvFPf7BOZQmtmtC0KLiLiT7LA1wo3w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=910 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040105

Some dummy source HW has static trace id which cannot be changed via
software programming. Add arm,static-trace-id for static id support to
coresight dummy source.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
index 04a8c37b4aff..742dc4e25d3b 100644
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
2.17.1


