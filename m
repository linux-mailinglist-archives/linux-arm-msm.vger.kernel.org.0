Return-Path: <linux-arm-msm+bounces-55048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E623A97F51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 08:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E42417D68C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 06:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB6E266B54;
	Wed, 23 Apr 2025 06:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JnEm1OtR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF941DF75C
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745390072; cv=none; b=Nyw6x8FoQWz+QK8+w8Hgz2P4TKaLlk5iai4iMvtaW6CfhVTLXiufnrUr3XX5smF3oShLFLk5pLFmW9bW0tVfFFw8g+X/SgHY+H9f6mxPLnxe70odz8JUTC68iiX5efPaZcn0ZA9qUcdUyd2P7ANyyBErecpfnJZ4ZC8AqZZtH8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745390072; c=relaxed/simple;
	bh=yqGpH2aThU+nKQjs8KC1mOaWJu2iC3pxpZchxfCBqVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rDaXlKlU+iMk29m11NJH//YF4REyGpOwDZev2F87bDEVZmWOtMUKXXLeK29TUPhHAi7v+jzBlAeV1oiybRIInNXbg5jMiNvP5Zt0+zp70F4OnQE5FrFEUf2jQTvddLvC7S46pcf7WwytMJF3RqxCScBopFrxNyPXikYBZ80cAxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JnEm1OtR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i875020408
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnpdyBHgKacwIPDCZR87HPu6qkrnPCIn4xlRJ7d0MkA=; b=JnEm1OtRCRD/UvtR
	33ddJECEIkj/nH+qtsYUTEhHQpd6dHmE/B/aIE0v2L4OSvQ0WIpE73BsoppdQg+r
	tpm315kjAAKVnVLXXDP/VD5iqQ6lnITtZP8l3QPg5RjI7wvxQMJnrRsfb3N7nB7P
	lcV8vV6EtLVT3didCfpYyvwZS8FIV//mPfLcloC7kdrWW139y9aD4AAzg7476hw/
	e4sBpUUPhI9O4z4dOJGXNheQttAMTvH25XmbLA3gZfP3jFfLlq3DjLaxXGfMstK0
	DC6o8EekOdVzJMCx/Wi1J3KhZN+n6gMcsUzgolsVTEEEWvmWOmLjuIz7ZHqj5U0e
	fvyOAw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh213tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:34:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6YTKL021932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:34:29 GMT
Received: from ap-cloud-sh02-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 23:34:28 -0700
From: Songwei Chai <quic_songchai@quicinc.com>
Date: Wed, 23 Apr 2025 14:34:18 +0800
Subject: [PATCH v5 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-tgu_patch-v5-1-3b52c105cc63@quicinc.com>
References: <20250423-tgu_patch-v5-0-3b52c105cc63@quicinc.com>
In-Reply-To: <20250423-tgu_patch-v5-0-3b52c105cc63@quicinc.com>
To: <quic_songchai@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745390067; l=5873;
 i=quic_songchai@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=yqGpH2aThU+nKQjs8KC1mOaWJu2iC3pxpZchxfCBqVQ=;
 b=p6BWD99jwFw9PUVf9QBK9GVPdO5m4PJZKhbX1zh5ljIbFG0BBQ2MxcxigApLE3+ObYbONwCM7
 L28AkIzzGW1BP5pvZYjWQvo09WwV7aiVE2AIGRETxyIjW3tNLAb1Bf9
X-Developer-Key: i=quic_songchai@quicinc.com; a=ed25519;
 pk=uPEL8tAga6UMzd+eo6u4Mmg7ctrdZe8b/sjFJqJYEHA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680889f6 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FNfC-szXCY-FulyEgcCumnCb9itkP7Hq
X-Proofpoint-ORIG-GUID: FNfC-szXCY-FulyEgcCumnCb9itkP7Hq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0MiBTYWx0ZWRfXyzZM+/yAN++x l3Ez2Ln7WjqIMm/CclBhRhswl4cufYPUslmsCKZAiF97rAvLHRr6OTUnOpJuPR2hOC5qOwB98o7 NLnbvIEgWknLVJICdRmiJ00Ar/1X30cxnijVlVs/ccD6BbuNSiwpCHAkWV53gV3UzN8sGrdbp4x
 g7FGDwqBN+cPlcQl2eLrdv+pPnpfKNrDGRX8NW0zgCPjexDvtQK9UDZgWcvzaDlzT4HCrvPlBXp zdMdbl+J/M1qOlppjqbc5bOEuTx1LuCgl9fmGRERoTgYBexVU7A00Xp64qCbTfajp4p0PnywuVz UZZKzEqyzGDh1GN349gsx9B8mXxchNDkPjaQkIelJGOqR+dk0j0DcXUiGfZaDydvoDOubSDrSOm
 S7WMBXHs7BDe7UBWGTdYRPFQA2Z71CBeXrbHuq28sFac05m/3vwUJ+fDpYK3nny9kewq3e2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230042

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
---
 .../bindings/arm/qcom,coresight-tgu.yaml           | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3576d38711261806522295f8b3d8eadb1559ed41
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

-- 
2.34.1


