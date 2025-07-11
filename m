Return-Path: <linux-arm-msm+bounces-64530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B769DB01884
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 207EFB43CE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B128727E7E2;
	Fri, 11 Jul 2025 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jRv41im0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B0127B4F2;
	Fri, 11 Jul 2025 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226862; cv=none; b=hUz0l5SrY7B60/sBbdADWhBa4wsOQTGi0FriUP9rUA0wul4XdSCxZY8MT3VJHHVnY9G90m0DJqIpyg44vm1SXawyh3rDj2q2aSzsT2FKHyTd5KoiY5bNnQ41SDgaSh2+JNTlI0ynKM0s6q/A8rwCwudxwzjY9IVSCSBBN20CV+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226862; c=relaxed/simple;
	bh=ETO7lievG1x9ZBr7VIlvumBOeDyEWmpjU5kaaIr0klI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YiJAJJz2tKhRG+34geDFzmFTOUUE/rp4qaCHpFo4L3i5oW6ou8mzLE4R63ZSRxFiS2kXDqcng38ZLm1Zx0s97chio/MWADFPNe2d6JGeD0oa4A9oE0KhdxtfRp5wntEFCVMRgTyWjfXFkkx2tKP3K+SODSDi7syqXDaKA+qaVaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jRv41im0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X5Lk001258;
	Fri, 11 Jul 2025 09:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/qWxdxxHpThKGwDFM8CASPxln5OqgHWkEroR6zYclE=; b=jRv41im0TERMz6K6
	cKwypJYw1ma6gUi9HKnEtxktRCVpj+a+zmRYYkRcudQSjl7kRq/MLbKEwXpsW3Am
	+Knx/prnEKKR0+eTP3Q4XXQTa/HkQ0r5lM3JLjZ+EA6lrMpuhdvw2s22W8Pghv0r
	TjUiJTJEuvw6Fej4IKn4q3tuhUAaHUW5T1IWwHqYtglNNnIrc39RjyO4ZFNlPtz1
	msw81ORyu3xFJxGeBHREYR0gQrmFMrCQBQyK8Z8fLntByXf4snAlGymsMnLXuGVC
	Q30cCw7sa1RJBXTskdtp7RaYLlkQwW56v1wc2t8LE3bTIzSroKj+HsqHz80CoCwG
	McUEYA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucnbhem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56B9ekkl024445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:46 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 02:40:46 -0700
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
Subject: [PATCH v6 1/5] dt-bindings: arm: Add CoreSight QMI component description
Date: Fri, 11 Jul 2025 02:40:27 -0700
Message-ID: <20250711094031.4171091-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
References: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=6870dc1f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=3H110R4YSZwA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=VdmNJPKJaTtzAbcruW8A:9 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wBzAz10I7jozGN_ABxDLbZrQ45FW6OgP
X-Proofpoint-ORIG-GUID: wBzAz10I7jozGN_ABxDLbZrQ45FW6OgP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA2NyBTYWx0ZWRfX/5aZ0rX3hiMm
 Ygico7mIjMw5qJYSMA+rbCmnojDxNnlbTHRMTsdGVzipZ82/H3Fr5f2us5ikRlpdhTj5o5t2xVE
 lJ2/d+hlP432htrG6nm9OxfLddBmPTo5fLqdyVnXEHberH9xFq8fWE071NqAlrmqhUNtoUS0r0K
 LbP+cYJ57TZA+XymCf+bXwfpfZJj8pL4NuOVWuPZklNSQMlGm6MqWHrGC9PZQorF8ZQonX40vSC
 j+y2rRgS04gvcP03RpiIB22CsVXrERX79qW5pZ4ewtklEi5IBc/kod/XbAs4/4r8dhYdn4FL/oe
 sVqv3JKT3OWrHXGeMThsud2FD34tjQ2QOeJGmcTAixSZ1LBjEVKk9HmAtOxA3PnZA1fuepSSiBz
 scQZHNEfYHHpJ6j/IXar/jiLkaCxo5cw4DrU7OW9iZSLzkJMF4VwQUF+ulK8AqgnnauDiKxq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110067

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


