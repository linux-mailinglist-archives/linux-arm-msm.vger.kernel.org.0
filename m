Return-Path: <linux-arm-msm+bounces-38611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D12AF9D4789
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56B361F21B1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0561C9EAB;
	Thu, 21 Nov 2024 06:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e1tqEh07"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32491C9B98;
	Thu, 21 Nov 2024 06:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732170586; cv=none; b=r6mbb2ZTop/Aqtl062d9TUVzwmZvj36UDq7XJ9lnPXELIt5kj42oaEGRjRDA92n/zE2UBNJQ34iMW8/vZVOMx3pLg72TtG62saQJ/P8UKNe1pjhxH7qlh0I6Bd1pkIvDjZzMFUUSCoBIQJeaWD3Bisvue8y4LRHg++H4pMzzHLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732170586; c=relaxed/simple;
	bh=tW6lYfDQgWTzkIZNrcEony2IMOCr5u+WoYAYNqXNnNg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uy3HRvA+4AAekoIH6zZN1l9QGQGoe6KgR2AEeH8qcv5axTH2ddKAS6TyFcGVGS5dzzdRt8QFMYGIPE6lyMXjvSit6iv/weMarpX2MwMYkIuM9tp+VhlHfCkq/eLLACNaY08optzsSCAMtI2yudJxrPrR8/5AycGRGvpuwYIK3I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e1tqEh07; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKSNM5003971;
	Thu, 21 Nov 2024 06:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r7QGRJT45n0T5+Wc2ENAMTJg
	AWENYDW4gQh9c7sFtMA=; b=e1tqEh07ncsSPIDTj0OtsSCjsGJHI79/+o33X2i7
	MC6s0rHZZrfEtECwEZ65pOGaOFyrz69gXFU4bP4YhYGL2RHO8XOIxkHUsfzFW05u
	0I3Bn/vF6DQZifcSC27fTGyT7grqC570OEJXvONeVjIY1mTBROtYrnP6kWaQsWtn
	QQUWZt13PsubGvAtbDsQT7UJDy+UDD49EnS5/W0Ho/r66ZBL34VlnywzsDzxKZdw
	3a7rwtcGrFFUIm6B+4OBZg/O/FJtbAhoAhpqurs0gaxu6dz3jT+DFeELjeFkbGBr
	i7vdLmVpIDJJp4ZPVizMs6dNavQ5i6xXapLKVXamGYOzSg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3axp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:29:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL6TQmh025550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:29:26 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 22:29:22 -0800
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
Subject: [PATCH v7 1/3] dt-bindings: arm: Add arm,static-trace-id for coresight dummy source
Date: Thu, 21 Nov 2024 14:28:27 +0800
Message-ID: <20241121062829.11571-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241121062829.11571-1-quic_jinlmao@quicinc.com>
References: <20241121062829.11571-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: noefrPb6PaVQEMUMK35Xlg45owA5jzaz
X-Proofpoint-ORIG-GUID: noefrPb6PaVQEMUMK35Xlg45owA5jzaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=926
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210048

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


