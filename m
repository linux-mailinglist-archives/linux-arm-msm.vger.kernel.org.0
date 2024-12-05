Return-Path: <linux-arm-msm+bounces-40448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D24389E4F55
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 018841881B78
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 08:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F9F1D1F57;
	Thu,  5 Dec 2024 08:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SZyV0YVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4111D0DEC;
	Thu,  5 Dec 2024 08:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733386150; cv=none; b=mBmew/jQUDCnX1X4J1RT/FkpZknLd8XTqd1+fwtU+4nKloDKPZTaBQAujydZeqPc6lEVQL94o8TI3lBAP/p36lzl2ud0kDDHCT5SOqVWQLSUwnf+pYNSwD67jDeXvq+A3ZIo45kUTFZ6bea10Zngl8kgQeWOPk6re1LrHRwwGA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733386150; c=relaxed/simple;
	bh=XXxw5/lyl5PhPLaeAiDtnLFYhAhoQ8Dru5kcFY26kLA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBUixcE4pQc6gn23ttK9F9To109RzgmQ11KOrivhOpEV4U/+xBVahY7s5U3/2/sqUKuZsnBOeb3LFN1doqpYY15KNQn6sUzjV8opDjdradyHjsGnBViRPZkPrGpPJ5XobzvS//cUHSL0zGPSK8zQIKYXNrtd/TYH3Cxo1DMOzA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SZyV0YVH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B55UiMP010103;
	Thu, 5 Dec 2024 08:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RtyHK6AoJJuyxjFw1q9LUgOX1Sye9mP0GipHxGyv2yU=; b=SZyV0YVHHlk/h5R4
	iod/qbg5vefwfZRn0QyXG8hxVV0susIkjk/mRmm6WkXXtL2/0jJd1oxuDcxYMXDg
	n8BXd/SMoBCCo/SFHIGrM84pQxcMP+p1W1JMmmTdFTtGjTwtsPqwbSt+MQdlD3xK
	pu0r23B81IodK7bzsqvEGOqpdYlmJgtIfgEVWe1u0UCg1slfdk+ArRFEFtzv4d0o
	aocjvEzWYwj2YTyrgTB6jK5JRUP3xqpHuzSMFDNKscHnN4IM9foDHelozO0TbTdS
	My2SDJF9H9DWmz1aAJHoHLcN2P/wAX5LZ+zYW7EU2YTx3Yg+ywIQiqW3XbsnB8F/
	zxQ21w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v7yxxsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 08:09:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B588xQW014211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 08:08:59 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 00:08:56 -0800
From: Sricharan R <quic_srichara@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH RFC 1/2] dt-bindings: mailbox: qcom: Document qcom,tmelite-qmp
Date: Thu, 5 Dec 2024 13:36:32 +0530
Message-ID: <20241205080633.2623142-2-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205080633.2623142-1-quic_srichara@quicinc.com>
References: <20241205080633.2623142-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IzjzdA2fgqGO7jLRLIj6xGETp3dEDpYF
X-Proofpoint-GUID: IzjzdA2fgqGO7jLRLIj6xGETp3dEDpYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=981 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050059

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

This binding describes the component responsible for communication
between the TME-L server based subsystems (Q6) and the TME-L client
(APPSS/BTSS/AUDIOSS), used for security services like secure image
authentication, enable/disable efuses, crypto services. Each client
in the   SoC has its own block of message RAM and IRQ for communication
with the TME-L SS. The protocol used to communicate in the message RAM
is known as Qualcomm Messaging Protocol (QMP).

Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
 .../bindings/mailbox/qcom,tmelite-qmp.yaml    | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml b/Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
new file mode 100644
index 000000000000..1f2b3e02b894
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/qcom,tmelite-qmp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TMELITE IPCC channel
+
+maintainers:
+  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
+
+description:
+  This binding describes the component responsible for communication
+  between the TME-L server based subsystems (Q6) and the TME-L client
+  (APPSS/BTSS/AUDIOSS), used for security services like secure image
+  authentication, enable/disable efuses, crypto services. Each client
+  in the   SoC has its own block of message RAM and IRQ for communication
+  with the TME-L SS. The protocol used to communicate in the message RAM
+  is known as Qualcomm Messaging Protocol (QMP).
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,ipq5424-tmelite-qmp
+      - const: qcom,tmelite-qmp
+
+  reg:
+    maxItems: 1
+    description:
+      The base address and size of the message RAM for this client's
+      communication with the TMELITE core
+
+  interrupts:
+    maxItems: 1
+    description:
+      Should specify the TMELITE message IRQ for this client
+
+  mboxes:
+    maxItems: 1
+    description:
+      Reference to the mailbox representing the outgoing doorbell in APCS for
+      this client, as described in mailbox/mailbox.txt
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell is the client-id, and the second cell is the signal-id.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tmel_qmp: qmp@32090000 {
+           compatible = "qcom,ipq5424-tmelite-qmp", "qcom,tmelite-qmp";
+           reg = <0x32090000 0x2000>;
+           interrupts = <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;
+           mboxes = <&apcs_glb 20>;
+           #mbox-cells = <2>;
+    };
+
+...
-- 
2.34.1


