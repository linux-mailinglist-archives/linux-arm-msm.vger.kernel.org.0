Return-Path: <linux-arm-msm+bounces-29242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD295ADC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 08:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DADB1F23224
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 06:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BB613B2B2;
	Thu, 22 Aug 2024 06:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DamhMI3l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF4113541B;
	Thu, 22 Aug 2024 06:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724308913; cv=none; b=Z7evEqeXEbUG/HelsSUmq+OLtXSzGQiXhICdr+7SNk+rkahSs3syp/HCnE0pOD3PIXaIaV+gaOWQEeFMPJA/JiXjhiRN8i5Isiw1jA/HqJsammqAyUJFKtZVnA+MtuM8dHshSib8qO348Yo9tF80+XMeaMFsOAz+M5M/uCx7tFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724308913; c=relaxed/simple;
	bh=8AXwKzyNRufyveBj/TLdLHYlOeGpptBfOKcQz7EADNg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=okkEXo7oMS2g6mEtxDVBgdgwhRjVh87EZomIPlo47WTtaAzzAjOqqkafVZUZAmQH/k8n+BoXtCiB8UuK0/w/t2ZQ6vsklJJa9xLR1OR1rihcroLyLdmmVIT4EY5VoNri5+zX5ss9RiQidHSUAUiFvxw9p9cYCFLtl+To//Hobc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DamhMI3l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M12XPw007747;
	Thu, 22 Aug 2024 06:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvyqo88xmsjdZi8P9SbLN7yS8DpRDsLSGrYVleZqP14=; b=DamhMI3lERNEXNHj
	diluOEwwxfVzSahzhkirmBypScg9offBQJy3lNMz8c/UVuBiOUPXXWKNCTnqvDga
	+HcO+CiMLhWE5KCiKSPdApaqJJMUlonlqJkExspCQn4U+Zw1Rcu9WQRJTNybXiCr
	EREzToO+1mGUkgxcJJuGorUKJAVQr7FqqZe3ypuhLaUk3w54I24pSVddjyxXZT+n
	dErAtKMzZJ/tp5dM5nP+XzCOgU0GEaFHwMvMwsTRG7xKIWU5PZC3OspFdpBh5MhR
	AS3oHsGUn083NMvhEy/YfNd7zObsvvOSwoYhANNT2Bn1KCszAXia1Ab9T8+d9GJt
	EzHNlQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4159yjbx2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 06:41:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47M6fc0t004432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 06:41:38 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 21 Aug 2024 23:41:38 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: arm: Add qcom,qmi-id for remote etm
Date: Wed, 21 Aug 2024 23:41:18 -0700
Message-ID: <20240822064122.5231-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240822064122.5231-1-quic_jinlmao@quicinc.com>
References: <20240822064122.5231-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -jJl-R8wQ6GxEJcYF1Wsp-QZUETneZAb
X-Proofpoint-GUID: -jJl-R8wQ6GxEJcYF1Wsp-QZUETneZAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408220048

qcom,qmi-id is the instance id used by qmi API to communicate with
remote processor.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
index 4fd5752978cd..27e5f18bfedf 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
@@ -20,6 +20,13 @@ properties:
   compatible:
     const: qcom,coresight-remote-etm
 
+  qcom,qmi-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      This id is used by qmi API to communicate with remote processor for
+      enabling and disabling remote etm. Each processor has its unique instance
+      id.
+
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
@@ -31,6 +38,7 @@ properties:
 
 required:
   - compatible
+  - qcom,qmi-id
   - out-ports
 
 additionalProperties: false
@@ -40,6 +48,8 @@ examples:
     etm {
         compatible = "qcom,coresight-remote-etm";
 
+        qcom,qmi-id = <5>;
+
         out-ports {
             port {
                 modem_etm0_out_funnel_modem: endpoint {
-- 
2.41.0


