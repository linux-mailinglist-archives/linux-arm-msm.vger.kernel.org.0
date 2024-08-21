Return-Path: <linux-arm-msm+bounces-29168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5EA95933B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 05:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46C851F243CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 03:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F07158203;
	Wed, 21 Aug 2024 03:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mG8cNcVi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07340225DA;
	Wed, 21 Aug 2024 03:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724210095; cv=none; b=ob2b8ztE3iRdsRljhhwLjdWjFwmzuim04WA3ohtxM0G6xtHkHoPejdONg7dLU/aHfYS2G5eYMy+tiQASVEWAjF2fN7Ty6dB5CWjvcNgh4lzSeohIqacR0dUcOULr7jMyN0DmXDGWCqjO4oEFD+ybdAgd6yzEcyLJsf61YszlAII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724210095; c=relaxed/simple;
	bh=XC2r9myoV9mK755CGiB2PbIgBad5ZaKbGq7IcSd7/Dw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jWGPKOdME9GRcXG6mjzFoAsvcmSHPZkm0Va+s83J8rk+3dgHfoG2PEhSzWSKwrY3Ww9e5jDTkNDUe3U19AGnQHuEymTLEjD3Q+dWvvW/5jVVGf/eVx1/KDR8YyiVpaEWxM9IhYX6Yd/WD6JDoIDSL9p/AIC45fKhpfwKgsbgLaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mG8cNcVi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KMoumZ015501;
	Wed, 21 Aug 2024 03:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wWjrqp89UnF8NqshoLlbQS5w
	pJVq1NqW54XTbTeq0QM=; b=mG8cNcViPD1soOaWE8HF0jiK3uc9EiVBpHoc29m2
	2DhMea6+jWJGHxa/H0bGASlN6TE+YAJj4X5TgILoiUB/lUvUsNeqDtqipGdwpEXJ
	uCPBn77pOyvxGLiuIlEWMzx02I+Afo1/myUNo4FzsjIBTMmBXkcr6yIxYs450mth
	1R1M+Kb+ihXNkckeF6UOP167SkfZnetGOoaMJIOPXWR3WtaeiUoe05ccgXzrzJNj
	X2VMmrdYIubesL+/yyUYNhDvmjTOBFIMsmrR3puoZ7jOpet9ettZADubpUOOINe3
	sJsrW9pEFLek+qQwRO+PRqC9uvlQHHejmIr1yedaLXkRow==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412key9kjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 03:14:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47L3EQ2T021041
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 03:14:26 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 20:14:22 -0700
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
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom,coresight-static-replicator: Add property for source filtering
Date: Wed, 21 Aug 2024 11:13:46 +0800
Message-ID: <20240821031348.6837-2-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240821031348.6837-1-quic_taozha@quicinc.com>
References: <20240821031348.6837-1-quic_taozha@quicinc.com>
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
X-Proofpoint-ORIG-GUID: rYGi-8DKm8Yrnv5Iob02uWXrcs9Yumqt
X-Proofpoint-GUID: rYGi-8DKm8Yrnv5Iob02uWXrcs9Yumqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_03,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408210022

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


