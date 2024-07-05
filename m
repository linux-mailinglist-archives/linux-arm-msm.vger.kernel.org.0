Return-Path: <linux-arm-msm+bounces-25337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAAA928477
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67F622869EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB72148832;
	Fri,  5 Jul 2024 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cwqg9N26"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E1F146A62;
	Fri,  5 Jul 2024 09:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170095; cv=none; b=I+DHJL3PCN4vW9t1LtfA00MbwSbiTd2nYCE12sRLg9bAGq5MtyhAJ75NgyfTCQvvQHr3yybbL5+o9iI2NfslI1gtqotU9ydW+MsqM2lDn5RKBLi1tROvDfIDmCyPLaCQPfOY5ufaY5I7Qo4yL6UkhVaFvfxAxOz7wuCRoGNJGLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170095; c=relaxed/simple;
	bh=pT+iWXpiH/JwnqGJzfStt9Sb9v9j8OvDt6SYmoTYyAI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HYz1jrmT88PfMw1DXyg4xiqKtce8zcv6wZNmeE8czEwzPno/iFT0bfhiY/epURcbSQ8uTJjYa4k0VdfoZPGHRA6YXudqdye2pjEKFe8zzj0xAyfE70B59+uuwiYtNht30kIJmO9iW5SCy4zT105cpduRpAVfU5WWts7oHymJfNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cwqg9N26; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4657wwnc019819;
	Fri, 5 Jul 2024 09:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3Ek86X5Lu33l062T+Y81JhwLcIdJPaaNLC0Ej+41EE=; b=Cwqg9N26lr73h60o
	LLh4257gZ9r6M+Km/P24LGo7yDhIdGP/uuoI4CZcnn1pLj1PK/cdnA+ITT6E7ZIT
	UpHHiFy/gBmIDZHfQLTDDWO4yXMfpl+tUiOMT6j2myjgZXorauDIJUB3Nq+4nxC+
	sRMFbgpuLH7KHL5hfHmvRgce6017lU/YEZFZVxQ1AFaBw3t1m64yv/CNwVTO9yqk
	6cii0+HKkxPmmTQ202lhxD2QW6wQqLz51Ud7/y8mB8wYUmBt0u1EYb6drBb1CE8I
	0bCO+EQT8vDgKRYrxlIYA7fewpmKivyewTjLJlTENcHNW4NR5h3t+OBFCKot14j5
	ZgLZag==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406cww85p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 09:01:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46591KPg003912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 09:01:20 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 02:01:15 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        James Clark <james.clark@arm.com>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        "Tao
 Zhang" <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Song
 Chai" <quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 2/4] dt-bindings: arm: Add binding document for Coresight Control Unit device.
Date: Fri, 5 Jul 2024 17:00:47 +0800
Message-ID: <20240705090049.1656986-3-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AQG-K1uGekS1lbF1RPoeHsX9oFxJJ25T
X-Proofpoint-GUID: AQG-K1uGekS1lbF1RPoeHsX9oFxJJ25T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_05,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=1 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050067

Add binding document for Coresight Control Unit device.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 .../bindings/arm/qcom,coresight-ccu.yaml      | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
new file mode 100644
index 000000000000..9bb8ced393a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-ccu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CoreSight Control Unit
+
+maintainers:
+  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
+  - Mao Jinlong <quic_jinlmao@quicinc.com>
+  - Jie Gan <quic_jiegan@quicinc.com>
+
+description:
+  The Coresight Control unit controls various Coresight behaviors.
+  Used to enable/disable ETR’s data filter function based on trace ID.
+
+properties:
+  compatible:
+    const: qcom,coresight-ccu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+  reg-names:
+    items:
+      - const: ccu-base
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    unevaluatedProperties:
+      patternProperties:
+        '^port(@[0-7])?$':
+          description: Input connections from CoreSight Trace bus
+          $ref: /schemas/graph.yaml#/properties/port
+
+          properties:
+            qcom,ccu-atid-offset:
+              description:
+                Offset to the Coresight Control Unit component's ATID register
+                that is used by specific TMC ETR. The ATID register can be programed based
+                on the trace id to filter out specific trace data which gets into ETR buffer.
+              $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - in-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@1001000 {
+        compatible = "qcom,coresight-ccu";
+        reg = <0x1001000 0x1000>;
+        reg-names = "ccu-base";
+
+        in-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                ccu_in_port0: endpoint {
+                    qcom,ccu-atid-offset = <0x1f>;
+                    remote-endpoint = <&etr0_out_port>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                ccu_in_port1: endpoint {
+                    qcom,ccu-atid-offset = <0x2f>;
+                    remote-endpoint = <&etr1_out_port>;
+                };
+            };
+        };
+    };
-- 
2.34.1


