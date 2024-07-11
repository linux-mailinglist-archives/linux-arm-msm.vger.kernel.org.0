Return-Path: <linux-arm-msm+bounces-25918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C1C92E1EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65B2C1F26300
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 08:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B781509A4;
	Thu, 11 Jul 2024 08:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="perwwfyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C786E150987;
	Thu, 11 Jul 2024 08:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720685964; cv=none; b=igoMvBuRXt5yhsDxj6e3wYZ0GvLZ/7/GHRjXXJlJeNvdBFHFZZnmNOp69PLydmeRmKi0gSW6kDq4ahrpedOnsFZv5/C+HmsuFzYZYr/U8QbXDyxaZovbvElvzfGa4toIiJEPV7GW1PtxqNmrfJ5aWRXvBruGqG9HrZaDwILjcFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720685964; c=relaxed/simple;
	bh=XC2r9myoV9mK755CGiB2PbIgBad5ZaKbGq7IcSd7/Dw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nn01jJ0aO1rI1yfxGovyay7AgHZ5all3c/ADbUgauVMsS+Qj6kYhgi7qXtDCjAqVE1Yb4hpg2pve12+Ij+3gzPEberbWsOeePhmxjsot799MVEaWYw+RjKQyeG5VHVRDqArUsokHcN8maRso3HtF7TXhPh+6TBjq7hAxqkXHOy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=perwwfyZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4mnCf011431;
	Thu, 11 Jul 2024 08:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wWjrqp89UnF8NqshoLlbQS5w
	pJVq1NqW54XTbTeq0QM=; b=perwwfyZYnPQFGMtoPH0TtUofngrNZtTCrpYT1kF
	K8CEaCrQg/cGNDF8kzwyhVgZ5ADwCo8hRq7gfsA6jSIX0eFXmv8cvNPqxmytlDbZ
	rbU6/Zl4sFqeezf7W/Jp3DDXL1PTEU+qEnRIhI5rk7lJZlFlzYvsvdZYsiW+3P/G
	WlHOPS8lfNJA14/S8NYOQhJaLfnkKs1DDMXGQQ91J/fFap2jsTlyfqHylTtXfVzy
	Xcl4oYmitG9gRxLcsdxVhKQhfF3n4TnM3GqSZ0ImdpmZjZZ+CWgJCqK3mX3vrxLV
	a6uhN8NwP0FaWBU+uYaGXCstzSvFAfUjzFuj4pbG1cL4gA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 409vydsxcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 08:18:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46B8IpJn026746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 08:18:51 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Jul 2024 01:18:47 -0700
From: Tao Zhang <quic_taozha@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: Tao Zhang <quic_taozha@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom,coresight-static-replicator: Add property for source filtering
Date: Thu, 11 Jul 2024 16:17:48 +0800
Message-ID: <20240711081750.21792-2-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240711081750.21792-1-quic_taozha@quicinc.com>
References: <20240711081750.21792-1-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xynafpUtVZsCdcqLaUgeRYPc5fJlUFg7
X-Proofpoint-ORIG-GUID: xynafpUtVZsCdcqLaUgeRYPc5fJlUFg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_04,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110056

The is some "magic" hard coded filtering in the replicators,
which only passes through trace from a particular "source". Add
a new property "filter-src" to label a phandle to the coresight
trace source device matching the hard coded filtering for the port.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 .../arm/arm,coresight-static-replicator.yaml  | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index 1892a091ac35..0d258c79eb94 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -45,7 +45,22 @@ properties:
     patternProperties:
       '^port@[01]$':
         description: Output connections to CoreSight Trace bus
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              filter-src:
+                $ref: /schemas/types.yaml#/definitions/phandle
+                description:
+                  phandle to the coresight trace source device matching the
+                  hard coded filtering for this port
+
+              remote-endpoint: true
 
 required:
   - compatible
@@ -72,6 +87,7 @@ examples:
                 reg = <0>;
                 replicator_out_port0: endpoint {
                     remote-endpoint = <&etb_in_port>;
+                    filter-src = <&tpdm_video>;
                 };
             };
 
@@ -79,6 +95,7 @@ examples:
                 reg = <1>;
                 replicator_out_port1: endpoint {
                     remote-endpoint = <&tpiu_in_port>;
+                    filter-src = <&tpdm_mdss>;
                 };
             };
         };
-- 
2.17.1


