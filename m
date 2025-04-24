Return-Path: <linux-arm-msm+bounces-55385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 873D8A9ACA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 13:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6DFA442581
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F9522D793;
	Thu, 24 Apr 2025 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HKb5VQ99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B38226D11;
	Thu, 24 Apr 2025 11:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495964; cv=none; b=uwzVAzM77pVJlxiYMe1Ke9Gqq0RrJJaaxdYfGhAgv5c7nSIo/xavCWyXotndcZInuIozHJF89E9Q5fYuNgmoxg7gkyiXMMcRiKHd0YBwYe+8vGAgiis4q/1VEaEFGxZMky7oGZ/Xf0NLl8T3w8Sfg1T0wbvhc2zmpAxGwqn8P2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495964; c=relaxed/simple;
	bh=ETO7lievG1x9ZBr7VIlvumBOeDyEWmpjU5kaaIr0klI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JGcfOeZNMklvxvWeOf96wzSMJP3esZLX/bDX4jB6un/tQsDJe/Wo39X6UNwWGp3ZwqMO2A5Wy5Fh48CC8ZCJXOjmNcHMQPWNy9/s3l6R7TBj79BLzdvcIyLBVJJ3ZLiFVtYFyItKcZP8FxRNStR74m+zoMmJ0LTbQGSnMKyE30I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HKb5VQ99; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OBotB7019543;
	Thu, 24 Apr 2025 11:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/qWxdxxHpThKGwDFM8CASPxln5OqgHWkEroR6zYclE=; b=HKb5VQ99goZ0J0hC
	tVGLmklkaZtG46nhkwQ51TmTlCZeNHO7VhGr5Se940mMXwRhTBd1ow7opunDdKjG
	6W7Cfd28yXS1b4fOl/jDSqr/S5cao6FOcnYVKxcfZ3e5D/XEFRUj4GKm8SkTbW9E
	/0E4DHeZPrUtL82oxQfaVJehepKNjCC5MRpcR2XxRMv8YSJ1FCBCH/oZzqUP3aCa
	rQVBjDT3lRdt/sxkfei3m+/oKxZrLrbqTeHNLvc/r2KJ32tscjWj8CJzfp6npBsi
	WGA6Mv073qrmYtsEbnERNDgPprQRl59dpk8wgkjK8Tfb/zrpnyCakGEApzemHZtJ
	iHo8jA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3nefy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OBx9kb016709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:09 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 04:59:08 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/5] dt-bindings: arm: Add CoreSight QMI component description
Date: Thu, 24 Apr 2025 04:58:50 -0700
Message-ID: <20250424115854.2328190-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: v4Nndtw4i7mVhn7tsHN29kzyw-in7aZN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MCBTYWx0ZWRfX4fYT22afGktU /Xu2WVgqcKPLKshd4Hbu+Zw17M45Alb/gczUbvHPa5ufMvuPoy7VFfNK6MLiZE7LoTkOJ6sjg9w 1oUb8y3iidc4R2wXFCbFms8cjTwFq6zS6VtNTfcujsqWdFgZ4N6VhA8sVvcyOimYV4vaKjMDQc5
 fpUKqSa2dA777On4IGwEK2oMZQSchOLHQyJUx0+wLgJfaZkgs5pTcmLsfEableR82XETlv9knou LdiHMnEYs0fGBvQjHXLf+xHcaHoo/MRQeD5Z6w46yTcGuVoLWUnQ/mbX7tISA+PfItBfdjYWRs/ RNr84xw0SjcawWn067mIBkexOSzMVducqewZO2vD29fbv2ahDhIOXaXlqD0VQ/d5++Ce/adVZua
 +oWLPfgURDtfe0gH/g9+2bJOPLqKHerLXdp3E1t3WLy7OClT5X4yKfR8HVsmpw8gg6JA1h+J
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a278e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=VdmNJPKJaTtzAbcruW8A:9 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: v4Nndtw4i7mVhn7tsHN29kzyw-in7aZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240080

Add new coresight-qmi.yaml file describing the bindings required
to define qmi node in the device trees.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../bindings/arm/qcom,coresight-qmi.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
new file mode 100644
index 000000000000..601c865fe4d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-qmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm coresight QMI(Qualcomm Messaging Interface) component
+
+description: |
+  Qualcomm Messaging Interface (QMI) is an interface that clients can
+  use to send, and receive, messages from a remote entity. The coresight
+  QMI component is to configure QMI instance ids and service ids for different
+  remote subsystem connections. Coresight QMI driver uses the ids to init
+  the qmi connections. Other coresight drivers call the send qmi request
+  function when connection is established.
+
+maintainers:
+  - Mao Jinlong <quic_jinlmao@quicinc.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,coresight-qmi
+
+patternProperties:
+  '^conns(-[0-9]+)?$':
+    type: object
+    description:
+      QMI instance id and service id for different remote subsystem connections.
+
+    properties:
+      qmi-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Instance id for the remote subsystem connection.
+
+      service-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Service id for the remote subsystem connection.
+
+    additionalProperties: false
+
+    required:
+      - qmi-id
+      - service-id
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  # Minimum coresight qmi definition.
+  - |
+    coresight-qmi {
+      compatible = "qcom,coresight-qmi";
+
+      conns-0 {
+          qmi-id = <0xd>;
+          service-id = <0x33>;
+      };
+    };
+
+...
-- 
2.25.1


