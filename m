Return-Path: <linux-arm-msm+bounces-29703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22248961CB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 05:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D21E8285386
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 03:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACCA13D612;
	Wed, 28 Aug 2024 03:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EU3l2vI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C92913D251;
	Wed, 28 Aug 2024 03:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724814343; cv=none; b=aQSjPmC7PrKU57T3PVIjC+fPlc58vqCkFKGDeT9DS5D2GUH761QJyudgJJKbMnuDqEQEF8SZkzhU2zTgUTbEQ7Q6AORfK8QqL2W5kqmsM90sYQl+PliSzzo10HzOlaO3FGgYduXEsMOCIYD1y78y4tjMA1EI5sgobO/An+03JZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724814343; c=relaxed/simple;
	bh=LG4sxuuMVqfZUfVkQ3jd0T+UHgrWz5ZoIMFFHpGXGfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QTzijbfYrUELv+Q0c4nERYlGXfeIUa9T217QkFBbbtp7DMFB7BNI2fPN+AzCkPEspstJxYDKkU/POmKcSzmlqHRRRNZBetxUc5MtSdE5Nes7s//dAIDELfK0jmmtvDAyvRgYGFEt5s9u+tHiPkJt92uH9lAJj7I+AXkcaX0Q/oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EU3l2vI3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLaJ5a018472;
	Wed, 28 Aug 2024 03:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EocZd8P0VcfC3HYnsK5NK+A4MNOPk6kNISelYNQiHBc=; b=EU3l2vI3N2LhMTcl
	5OesgzyOKNmLPVd8cq7Qdje3OVq/2jYQCDuycP75uLBxVD5J6c83X5p+G0wOfrDC
	oasXFyrUFawv4LNwsFmqVYPN+7zXMn7KRgHMgS3zLqndOHAgJ6EieIJ9LFoeej8n
	KX5q+PdziSzJWHeNcmSVj0px5zgNGaaDcs2aLEQUL7K79iJpFEhDEomN5BXU9K1i
	r/Wy2koRg6c599nbkJbXgh+wwiYGOc7bHsWaLhewEXtcN/txuTCEZAHWrDMFk7a6
	496JbAnPBWw8vdbJ2o4Ffaqeid5rBxQHcjyKAFumwkyw7ndu+nmMBC5/3+aM3m4U
	hAeZpw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv08h59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 03:05:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S35Zl1027574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 03:05:35 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 20:05:31 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mathieu.poirier@linaro.org>,
        <bartosz.golaszewski@linaro.or>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tengfan@quicinc.com>
CC: <quic_jingyw@quicinc.com>, Xin Liu <quic_liuxin@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,sa8775p-pas: Document QCS8300 remoteproc
Date: Wed, 28 Aug 2024 11:05:10 +0800
Message-ID: <20240828030511.443605-2-quic_jingyw@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240828030511.443605-1-quic_jingyw@quicinc.com>
References: <20240828030511.443605-1-quic_jingyw@quicinc.com>
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
X-Proofpoint-GUID: phEqqiXBRzNdrahozNJqNBMlvx_W4Yi2
X-Proofpoint-ORIG-GUID: phEqqiXBRzNdrahozNJqNBMlvx_W4Yi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_01,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280019

Document the components used to boot the ADSP, CDSP and GPDSP on the
QCS8300 SoC.

Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index 7fe401a06805..44b070a17ca0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -16,6 +16,9 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-adsp-pas
+      - qcom,qcs8300-cdsp-pas
+      - qcom,qcs8300-gpdsp-pas
       - qcom,sa8775p-adsp-pas
       - qcom,sa8775p-cdsp0-pas
       - qcom,sa8775p-cdsp1-pas
@@ -64,6 +67,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,qcs8300-adsp-pas
             - qcom,sa8775p-adsp-pas
     then:
       properties:
@@ -75,6 +79,23 @@ allOf:
           items:
             - const: lcx
             - const: lmx
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,qcs8300-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MXC power domain
+            - description: NSP0 power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mxc
+            - const: nsp0
 
   - if:
       properties:
@@ -99,6 +120,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,qcs8300-gpdsp-pas
             - qcom,sa8775p-gpdsp0-pas
             - qcom,sa8775p-gpdsp1-pas
     then:
-- 
2.25.1


