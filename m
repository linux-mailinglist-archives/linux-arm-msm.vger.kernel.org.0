Return-Path: <linux-arm-msm+bounces-30195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2ED965CA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 11:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38E5D28529F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B845F16F910;
	Fri, 30 Aug 2024 09:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VRltU51D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E150916F8FE;
	Fri, 30 Aug 2024 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725009831; cv=none; b=jmP6uVfHu1YZiZAKfQw7iK/XnsAbladlsWWqspgrgOUppEg3rwtRuIa7hBG9i+EnftNpYqH4ofFX0SH/8jVxrFDOpDBZgPwTL1jf4Zrcie0fLkPBGf15+hCXGbg4rwTvSB2tQmS0mJlR8TuayisYwaQogq5cf5Z17ORrX/RpvcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725009831; c=relaxed/simple;
	bh=L0k2XO5Nwxoul96hBLxolreZmdZWyMR2T7pdmehI9eY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7LkSsxOKMc8m//76hVLXdFPyN/KEH5g11EpqdxRGCOskEY5GOHUbB7i5JtFfznNELgW0DoKgsqUeta6/7SISzCylLHR75BZBunTICsh0av0hHDTXD4QPDCm8zoRXw6DxfDWsYZuN5zyAw/DS9n3vVKYUf2a1LzHCMsL+1NtRQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VRltU51D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U8Y1VE010746;
	Fri, 30 Aug 2024 09:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6ciIuYFrWglPzftsrVss1IbmmvQhTTa62+5EVsgCEQ=; b=VRltU51DQ7NA+F0p
	0gngRE8L/MfE7fSDjJX5oPTT0RxPfisAWxAtTeejEjrZ1yV3ibdWfxZIEbQC0A0/
	B3ZL0ijdWJgKGZyed7LTa5P9xwcSQNEE3GSfTbCRpItY+DqwUVkXHeFF7I5PhmkV
	AP24JWa4QfTft7/0BRQ9RdNCyXvoj8YMiK1Z27GysDxPs1dMUTtnO9NJI3CVPbaY
	iKw4NN3k1vDs/yAHGF+LqNJhApvg83RqJFSpXHxRFmc+GZq25MTycklYDv0LAqmC
	YAZbWPCOqYmwC9vtx3nL6AgN7zYwSSWrnF4x/jdFKCl+/9PWQwaMgAtv/cYuLldZ
	RoWGNg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0g5gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 09:23:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47U9NZQd030577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 09:23:36 GMT
Received: from 3b5b8f7e4007.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 Aug 2024 02:23:35 -0700
From: songchai <quic_songchai@quicinc.com>
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
CC: songchai <quic_songchai@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 1/7] dt-bindings: arm: Add support for Coresight TGU trace
Date: Fri, 30 Aug 2024 17:23:02 +0800
Message-ID: <20240830092311.14400-2-quic_songchai@quicinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830092311.14400-1-quic_songchai@quicinc.com>
References: <20240830092311.14400-1-quic_songchai@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IfED_g3cbKdZgQya16l7H7SI-jxX7qCq
X-Proofpoint-ORIG-GUID: IfED_g3cbKdZgQya16l7H7SI-jxX7qCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_04,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300069

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
 |                         |                     |     | prioroty[3] |
 |         step[7]         |<--                  |     |-------------|
 |-------------------------|   |                 |     | prioroty[2] |
 |                         |   |                 |     |-------------|
 |           ...           |   |Steps region     |     | prioroty[1] |
 |                         |   |                 |     |-------------|
 |-------------------------|   |                 |     | prioroty[0] |
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

Signed-off-by: songchai <quic_songchai@quicinc.com>
---
 .../bindings/arm/qcom,coresight-tgu.yaml      | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
new file mode 100644
index 000000000000..c261252e33e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
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
+  of a Logic Analyzer.The corresponding trigger logic can be realized by
+  configuring the conditions for each step after sensing the signal.
+  Once setup and enabled, it will observe sense inputs and based upon
+  the activity of those inputs, even over clock cycles, may detect a
+  preprogrammed state/sequence and then produce a trigger or interrupt.
+
+  The primary use case of the TGU is to detect patterns or sequences on a
+  given set of signals within some region of the SoC.
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
+  $nodename:
+    pattern: "^tgu(@[0-9a-f]+)$"
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
+  qcom,tgu-steps:
+    description:
+      The trigger logic is realized by configuring each step after sensing
+      the signal. The parameter here is used to describe the maximum of steps
+      that could be configured in the current TGU.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 8
+
+  qcom,tgu-regs:
+    description:
+      There are some "groups" register clusters in each step, which are used to configure the signal
+      that we want to detect.Meanwhile, each group has its own priority, and the priority increases
+      with number of groups.For example, group3 has a higher priority than group2 ,the signal configured
+      in group3 will be sensed more preferentially than the signal which is configured in group2.
+      The parameter here is used to describe the signal number that each group could be configured.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 18
+
+  qcom,tgu-conditions:
+    description:
+      A condition sets a specific requirement for a step and defines the subsequent
+      action once the requirement is met. For example, in step two, if signal A is
+      detected three times, the process jumps back to step one. The parameter describes
+      the register number for each functionality, whether it is setting a specific
+      requirement or defining a subsequent action.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 4
+
+  qcom,tgu-timer-counters:
+    description:
+      TGU has timer and counter which are used to set some requirement on each step.
+      For example, we could use counter to create a trigger into CTI once TGU senses
+      the target signal three times.This parameter is used to describe the number of
+      Timers/Counters in TGU.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 2
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description: AXI Slave connected to another Coresight component
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
+  # minimum TGU definition.
+  - |
+    tgu@10b0e000 {
+        compatible = "qcom,coresight-tgu", "arm,primecell";
+        reg = <0x10b0e000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb_pclk";
+
+        qcom,tgu-steps = <3>;
+        qcom,tgu-regs = <4>;
+        qcom,tgu-conditions = <4>;
+        qcom,tgu-timer-counters = <1>;
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


