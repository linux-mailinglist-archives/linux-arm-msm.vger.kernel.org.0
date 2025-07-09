Return-Path: <linux-arm-msm+bounces-64177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F0CAFE606
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC0231C41AB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BB428DB52;
	Wed,  9 Jul 2025 10:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PEZ/Zs/c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC73028DB46;
	Wed,  9 Jul 2025 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752057693; cv=none; b=jQBgWCCcX96fzMcf1vc3uUxRkxukAtHhpZPidERGUw5aIoFxfZ3MHAU7pYh4UX2q4ibqeZlgi4vhy3UXHU/Z4IVxtp/qGWNLwKnENdy2NjnmmDCx2mh1n92iJ7Rqo3w2biFO66bFfU3zYesb0rr1fezeJTFsYtpQil5zgkgpdTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752057693; c=relaxed/simple;
	bh=wyJzfbn3l5OUInqYJ2GqzAtkxErsetMwzwAWdZpRks0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=duZuGR4lSczLv5E4KtQCcWHfeUzI8zGJHT6mZFN3qnSftIpVpFrxpGTO8S6OtxakDaELnsFEgwWJSSleuXVVls7prHx+myK29hf2DS2PcZmyDCx1n9KR0GgMHnu7rldku0VttgeAn9RNasxI+meo3kb+ivdJCarF5SBUj+jtpA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PEZ/Zs/c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697jlwn010359;
	Wed, 9 Jul 2025 10:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=vktluOVJjQHz1jx7rK9E09//XyOHyZZTZMy0tHUOISQ=; b=PE
	Z/Zs/c5r8MsMUp1XV5mbbtGECUr6o34vOkSlU4w+/YreDx9WYAXKIbduJqpYnXMb
	ijPpl7/kSJ9/STUrk+NRgtPGrT3z1KN/qKSGqunDIS4JbDHCBqCQWZ/WTJh3ccHa
	rM/koebEz7ylkotDYBLAgHsnsIlJiDZTJX/2a2m52w1olxIx0dln3MCOWg3GAshJ
	vVlO64jy0FbUnKn0yK86n4Y6r/QnBXU8Eat8isTYZg7PDNxO3S2m7yqAYZxWp47+
	ecxOwVU3yu43gD96A8f7BqImZp3sV0TyfSRhAu71HbA9UIo2eFIY+EMgLGcqH6id
	1romX1fH7fS47PnYLpkw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap0jnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 10:41:20 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 569AcWhT002186;
	Wed, 9 Jul 2025 10:41:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 47s9h16ueg-1;
	Wed, 09 Jul 2025 10:41:19 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569AZ3pY027076;
	Wed, 9 Jul 2025 10:41:19 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-songchai-lv.qualcomm.com [10.81.24.255])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 569AfJfe006072;
	Wed, 09 Jul 2025 10:41:19 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 4201483)
	id C78F85010D0; Wed,  9 Jul 2025 03:41:18 -0700 (PDT)
From: songchai <songchai@qti.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, quic_songchai@quicinc.com
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 1/7] dt-bindings: arm: Add support for Coresight TGU trace
Date: Wed,  9 Jul 2025 03:41:08 -0700
Message-Id: <20250709104114.22240-2-songchai@qti.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250709104114.22240-1-songchai@qti.qualcomm.com>
References: <20250709104114.22240-1-songchai@qti.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686e4750 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=N3VNWiZ0WD7Ir0aJMQYA:9 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: k02v8-cbelI_xKSixLrWZpEz8Qu5Lqep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA5NiBTYWx0ZWRfXw3oI590gNoml
 uE1D0gtJt7Jp1mp8X/PbJuZa0JXC732qwbXfR8FL5XtL16NYgDdj+AIN5uE6QHxANXKzO3VUsEy
 g1B8shyozSpCoWmhFL8e9gy1DLx3p77JQrhFM9RTI73lqUfOmYeM86vTep0kXlRtDMbYy0IYlsp
 WOp3tYYZpPpgEn2FPRKHEwXViSOc6w+uWc0bsS6zmhw7Jaioy6qjFZahS0piUxLj6YmM0LNY981
 VgbBeEa6WB+KJIkLW33IRyXxX0zspgmi4RJ7taxnG1dWayeu4re3RWvaPhnMYKYE0ac336SiQ5j
 bsFopTZbWpEkRmxnau0TuWpOPPCK0/B8er3i4QOmmgpxs1s4ZvbSN/DOYrzHClsSits+AaK17aj
 9euIrpJCy1IHLblEEIusoWaRFKzSxKNB1TvCrKjV1am2JWV3K7rBVRLfxJu2B/lBRQhQYPdB
X-Proofpoint-GUID: k02v8-cbelI_xKSixLrWZpEz8Qu5Lqep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090096
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Songwei Chai <quic_songchai@quicinc.com>

The Trigger Generation Unit (TGU) is designed to detect patterns or
sequences within a specific region of the System on Chip (SoC). Once
configured and activated, it monitors sense inputs and can detect a
pre-programmed state or sequence across clock cycles, subsequently
producing a trigger.

   TGU configuration space
        offset table
 x-------------------------x
 |                         |
 |                         |
 |                         |                           Step configuration
 |                         |                             space layout
 |   coresight management  |                           x-------------x
 |        registers        |                     |---> |             |
 |                         |                     |     |  reserve    |
 |                         |                     |     |             |
 |-------------------------|                     |     |-------------|
 |                         |                     |     | priority[3] |
 |         step[7]         |<--                  |     |-------------|
 |-------------------------|   |                 |     | priority[2] |
 |                         |   |                 |     |-------------|
 |           ...           |   |Steps region     |     | priority[1] |
 |                         |   |                 |     |-------------|
 |-------------------------|   |                 |     | priority[0] |
 |                         |<--                  |     |-------------|
 |         step[0]         |-------------------->      |             |
 |-------------------------|                           |  condition  |
 |                         |                           |             |
 |     control and status  |                           x-------------x
 |           space         |                           |             |
 x-------------------------x                           |Timer/Counter|
                                                       |             |
						       x-------------x
TGU Configuration in Hardware

The TGU provides a step region for user configuration, similar
to a flow chart. Each step region consists of three register clusters:

1.Priority Region: Sets the required signals with priority.
2.Condition Region: Defines specific requirements (e.g., signal A
reaches three times) and the subsequent action once the requirement is
met.
3.Timer/Counter (Optional): Provides timing or counting functionality.

Add a new coresight-tgu.yaml file to describe the bindings required to
define the TGU in the device trees.

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/qcom,coresight-tgu.yaml      | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
new file mode 100644
index 000000000000..3576d3871126
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-tgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trigger Generation Unit - TGU
+
+description: |
+  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
+  to sense a plurality of signals and create a trigger into the CTI or
+  generate interrupts to processors. The TGU is like the trigger circuit
+  of a Logic Analyzer. The corresponding trigger logic can be realized by
+  configuring the conditions for each step after sensing the signal.
+  Once setup and enabled, it will observe sense inputs and based upon
+  the activity of those inputs, even over clock cycles, may detect a
+  preprogrammed state/sequence and then produce a trigger or interrupt.
+
+  The primary use case of the TGU is to detect patterns or sequences on a
+  given set of signals within some region to indentify the issue in time
+  once there is abnormal behavior in the subsystem.
+
+maintainers:
+  - Mao Jinlong <quic_jinlmao@quicinc.com>
+  - Sam Chai <quic_songchai@quicinc.com>
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,coresight-tgu
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: qcom,coresight-tgu
+      - const: arm,primecell
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
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description:
+          The port mechanism here ensures the relationship between TGU and
+          TPDM, as TPDM is one of the inputs for TGU. It will allow TGU to
+          function as TPDM's helper and enable TGU when the connected
+          TPDM is enabled.
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    tgu@10b0e000 {
+        compatible = "qcom,coresight-tgu", "arm,primecell";
+        reg = <0x10b0e000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb_pclk";
+
+        in-ports {
+            port {
+                tgu_in_tpdm_swao: endpoint{
+                    remote-endpoint = <&tpdm_swao_out_tgu>;
+                };
+            };
+        };
+    };
+...


