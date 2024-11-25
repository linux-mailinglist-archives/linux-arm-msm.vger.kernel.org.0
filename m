Return-Path: <linux-arm-msm+bounces-39092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9709F9D85E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 14:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BEC3285AE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 13:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03231A724C;
	Mon, 25 Nov 2024 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oslA/PAq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A2418A922;
	Mon, 25 Nov 2024 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732540002; cv=none; b=cqcHkDOucbc7+eMo6M2/1/Jq53l1n31aUxBrrSbFm95E+j37lZkt8+b6mKRnWk2nwWI+Z6GSpRlbZXBZY9d/f8jgSFaXvpP4sfX0C7sbIme6MbQSdSJWN1XwKftCiiXskVKsSSZq7ovnLwy65ypP84hu7WNRN7OTnzYhEt9Z11U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732540002; c=relaxed/simple;
	bh=At3GL89jOmv5TWxwnpQw8bCiPq/tYd4TS68iJQzTs58=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kw/ohn2TFfUS390puupPQY6nOXC9p5UqWUNs9lOvbI0SVjp5aMtv2ukraGKkB2+8ipjffpR5HhR/Pv5P3kz226g8tk1yQ3VTwjLZAfyhVky1ukFd1w3pIJEjIcK8E/NrDc1/TMQRGCvVK0D7n3K/O2V7gJJVVQZFsIJ7pcdgl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oslA/PAq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APAcbFD001628;
	Mon, 25 Nov 2024 13:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eC6avYkW8fRxK8wRkqoZyaUS
	nhAHVAeti8ny6pU3kso=; b=oslA/PAqoZ5wGi0a2lhyshPLAAtvSmsTt+v3aFrt
	WglK4cDqLgGytTEramRhZJDLRNUTT2PNJSU8SmM7z1QFFeifoCBHG/JXt9MfmmEj
	wNTvlnqVvwomS/85uc6UPs3WQqEFaXFkQhaavy691NW2USu1bJfw0Gqbb/iU8THW
	5kJ8Cw65Xc0NpmjW5BkUORIdQ36CHGgTxqWhcB6faB12/AvwOORb7J5rNV6Yabc5
	pifrAh06oIq/G68mpFCjJuZtDTCoyc85ISIPMlvQr+Pwvyf//4vtugpqwP0BX8kn
	XHkNCkTuKG1wziN5nbxuPG+ODqzSqXgEo1Auy3XCJEHnvw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43387jcr3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 13:06:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APD6RYs022571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 13:06:27 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 05:06:23 -0800
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
Subject: [PATCH v6 1/4] dt-bindings: arm: qcom,coresight-static-replicator: Add property for source filtering
Date: Mon, 25 Nov 2024 21:05:52 +0800
Message-ID: <20241125130555.19924-2-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241125130555.19924-1-quic_taozha@quicinc.com>
References: <20241125130555.19924-1-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xhRmSXli98VmlbpA_GAZVWDkwOWBJdlO
X-Proofpoint-GUID: xhRmSXli98VmlbpA_GAZVWDkwOWBJdlO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 impostorscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250112

The is some "magic" hard coded filtering in the replicators,
which only passes through trace from a particular "source". Add
a new property "filter-source" to label a phandle to the coresight
trace source device matching the hard coded filtering for the port.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../arm/arm,coresight-static-replicator.yaml  | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index 1892a091ac35..a6f793ea03b6 100644
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
+              filter-source:
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
+                    filter-source = <&tpdm_video>;
                 };
             };
 
@@ -79,6 +95,7 @@ examples:
                 reg = <1>;
                 replicator_out_port1: endpoint {
                     remote-endpoint = <&tpiu_in_port>;
+                    filter-source = <&tpdm_mdss>;
                 };
             };
         };
-- 
2.17.1


