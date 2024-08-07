Return-Path: <linux-arm-msm+bounces-28061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8C994A164
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 09:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BA1CB2692A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 07:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140E91C4604;
	Wed,  7 Aug 2024 07:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OPdp00k6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C411C688B;
	Wed,  7 Aug 2024 07:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723014690; cv=none; b=DUl9PL8Ak+lr/LXVLS92Gb2k0wbNvupBgYdDsGp6Bw9e0QVzcWcVqKCU5mL35rQ+5tC+th6eSU5aXZqTZmPUVDw517Pe9ERF8LpnxC0/VXw09ufoIuO4eXnq91q+LMhHsa5FcjLvim+AZaI+8a4LL37imbtZqboJQ1oLryjBClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723014690; c=relaxed/simple;
	bh=xtdK8DhxKr5RSovPL/E9A6ZjlISHKbz7V8fs6HERyCA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YTV1mUI/q5UqJeRjT+UQ3wuF2bCj6ZLePiS8sK60TmzfdNKgBRyEG8ZeRspP8+194FCE/JyywH+/JtBU6OjWcO9xDxEKlRaceV8ZeUEsd35GjECNMQV351VoeDmKyjs8ZJ3fTQ53Eddwb6KFwAX8JhOz5oJbmyOYDXnSfE1b7SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OPdp00k6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 476MPSZe023405;
	Wed, 7 Aug 2024 07:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6OLCkhhJoAnKTff8YYhVLWacQ2AQlOWPKVZgQIaZHr0=; b=OPdp00k6OxiKp1HK
	azO754Grjx1O/tDb1pH118yI9b1Yi70EU/bAaYs830xgsOKeofLGJyety3EwA4M0
	lFVuUCfQyoF4wqkPgoEIfpCcwuxw8r+jHA8goIsFzocyIUoJwhVO7LXIIK8rTMKk
	7Lgd5Dn4vhsQ2QOEmhBRp7PDX1ZZW39A73WzGKOtIuc29IwWj5ip6QQ0Lmxf+tdW
	HFqBZznCufH5yG1bdIhXFJiPXIKpsKBAmqHCAB0Qyjdwtjn0hiZ7UxDX9EN/L2k5
	XtefnSPAUSd8cDsXxRBgtfoA5l1MXyjoIGSUKb8AEWPN8HgguSdk4VfL05yZ+bbv
	5N9HzA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sbgs1sh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 07:11:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4777B5Hg023192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 07:11:05 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 Aug 2024 00:11:05 -0700
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
Subject: [PATCH v2 1/2] dt-bindings: arm: Add qcom,inst-id for remote etm
Date: Wed, 7 Aug 2024 00:10:50 -0700
Message-ID: <20240807071054.12742-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240807071054.12742-1-quic_jinlmao@quicinc.com>
References: <20240807071054.12742-1-quic_jinlmao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: C0m4YpdRwjANPpvB5Fe1Y9tVyJr9-5Ed
X-Proofpoint-GUID: C0m4YpdRwjANPpvB5Fe1Y9tVyJr9-5Ed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_04,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070048

qcom,inst-id is the instance id used by qmi API to communicate with
remote processor.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
index 4fd5752978cd..a65121505c68 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
@@ -20,6 +20,13 @@ properties:
   compatible:
     const: qcom,coresight-remote-etm
 
+  qcom,inst-id:
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
+  - qcom,inst-id
   - out-ports
 
 additionalProperties: false
@@ -40,6 +48,8 @@ examples:
     etm {
         compatible = "qcom,coresight-remote-etm";
 
+        qcom,inst-id = <5>;
+
         out-ports {
             port {
                 modem_etm0_out_funnel_modem: endpoint {
-- 
2.41.0


