Return-Path: <linux-arm-msm+bounces-32655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE319881F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 11:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 181EC1F2208F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 09:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD80E1BB6A2;
	Fri, 27 Sep 2024 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RPGdifUo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F06A19882E;
	Fri, 27 Sep 2024 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430882; cv=none; b=L75dEao6Bfdi+StFzb/373vy1VjUk055f7UqXdUJeEyphKcRdCGr6S1olxmIMPkv20TaQQcdaLAMm4NB0DX3WAQ6QCBGyUeW7WztbV2qK1EDZ3OFb3mS/cdyG0ZA/vfY2qR0rafQXOPKVSF/Ivi8jauq40lgzc9w002VRte3S9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430882; c=relaxed/simple;
	bh=Uw7sLzkVAes5Hqg5Gp4z1DB8/f3SIc8zBw2svsM798w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kNLApRH7Yplp7ZQDAanzz3OrFh8beei6wL8GjQ2ZeGs/tc2pb0na94S241COQplRgsHcOgWLOa+wAX+GtzG7PaazGR8w2koOv1dr93ogZlVf8lHFg4YEPPO7s/GqWFUz8LWvTw3TVjdnooX/0e3EW9TsqhxbDwlSbljyFnZxFyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RPGdifUo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R7CIWV022976;
	Fri, 27 Sep 2024 09:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h8c+isiB99bdrLaDeU1EMmXZzyUM0bS68OEUxgbOQmE=; b=RPGdifUoQugbcZo2
	6ioZMQiNB9LT25SU5gODnZamSvGpjJhIi5D7d4kHGLJWirztqAr4eaKCvjE3CB/8
	zF818KaWXL6x6uAr/K6XodnJ6kqMqeB7ZmvjV6dur29Z20U3pgvLge5GuEtaDhve
	UIR5dqEGIOPLcGg9r48Ytx93msugfixZ1r7mo3hTp9Nb/ngdyCmff5osycuyto/E
	hRKo+nVGVrHOis5MeWV81byxHi2bq2G0y5iyYPE0nNu6Ixm4uV2zvmm8Xpibrfpu
	GgNQaMrVHRtQ5jLVxbS092QKw1JWWA1bfPjyHdLG8EW7M1jN7qRhfknFvLQGqpXA
	WkfB+A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spwf2avb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 09:54:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48R9sRaU029250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 09:54:27 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Sep 2024 02:54:27 -0700
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
Subject: [PATCH v5 1/2] dt-bindings: arm: coresight: Update the pattern of ete node name
Date: Fri, 27 Sep 2024 02:54:10 -0700
Message-ID: <20240927095413.15278-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240927095413.15278-1-quic_jinlmao@quicinc.com>
References: <20240927095413.15278-1-quic_jinlmao@quicinc.com>
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
X-Proofpoint-GUID: Vj7hx5rVh57cL74r1vgM66mbaW0WZlSl
X-Proofpoint-ORIG-GUID: Vj7hx5rVh57cL74r1vgM66mbaW0WZlSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270069

The device full name is embedded trace extension. There is no good fit
in generic names list for the embedded trace extension. ETE is abbreviation
of embedded trace extension and the number is the CPU number that ete is
associated. Change the pattern of the node name as it won't affect any
device tree node as of now.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../bindings/arm/arm,embedded-trace-extension.yaml          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
index f725e6940993..9c2c9ac9705a 100644
--- a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
@@ -23,7 +23,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^ete([0-9a-f]+)$"
+    pattern: "^ete(-[0-9]+)?$"
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


