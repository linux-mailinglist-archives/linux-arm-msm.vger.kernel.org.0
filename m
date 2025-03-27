Return-Path: <linux-arm-msm+bounces-52683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EBBA73DDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 19:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5105F3B31B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 18:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D540121ABBA;
	Thu, 27 Mar 2025 18:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mWMofBzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1177A21A931;
	Thu, 27 Mar 2025 18:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743099498; cv=none; b=REFVTnYFJMyvfh9VCkNzxSJnM+7fkCQQu+6pHidkUYS+5OaKayGnJGcJPre4R9jGCkZBux89zN8p5xPd60UDEIqEqrhHQv9g2l8X4C0r/9fd3jaGHFq4OU+aodjcwMswfmsmWycKiEdPNgvrPddgLkROecpikZLcXUSvdl6RvC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743099498; c=relaxed/simple;
	bh=3Ut/gNGkU2XyQtJrgjLB2PYYQNoOTLDsoT7cYLOwaVs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mp9Fd2OeqWHuW04hio2BGtE0yKJ9Phy4ypg3KOCf7cogflt9TtlW4DQ2smPvuKewx7SzYr+C4ucAjquN1HXdnMRI2xEkIeFlFj5r38vBMB1G/T86l1lI+heKSPQc8Z+205N8ZiIESrc7Ld7doNK8tv7F8dyq3m/6ZUj7UGNx/hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mWMofBzU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REcx3q002259;
	Thu, 27 Mar 2025 18:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0FSQxyKT416D3aRAeudmvPZKevVEBRKqHlW0BEb560=; b=mWMofBzU9WqVCFng
	FtWWXqiu8hPhE3oyVBfw9AbaC8ipXNCbxe5N7M8g5pFr3lNchQSlVJ2hjdao2cWq
	kGDKWtWhkwef4gUtcwC8st5iTb7KLF5FJ73CbWcqQNRqwgtJWT/mLShHLZaSLrDl
	JXPbVYza1jG22/lsflQ3I+S+130uzmBhNgr/oUO6OG/BmVRQbq4e+WHxM/sAPryu
	xxoB8IkyYxO73YXqzouBa/LZE0M4PaZ2PGFLGROpKRAmmK6XwQ17xZp1Fsu70gdH
	oSQznqQog5tpmxAy9sy7gyVwKntihvWeetCWiw8Tw1upcrGvonc/6XHmMGx53i6R
	Pj1IBw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdy5mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 18:18:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52RIIBcl001809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 18:18:11 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Mar 2025 11:18:07 -0700
From: Sricharan R <quic_srichara@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH V4 1/2] dt-bindings: mailbox: Document qcom,ipq5424-tmel
Date: Thu, 27 Mar 2025 23:47:49 +0530
Message-ID: <20250327181750.3733881-2-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327181750.3733881-1-quic_srichara@quicinc.com>
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QFh0-fd7pjwgOJZJVEYg8Uu0Q-Yl7pOi
X-Proofpoint-GUID: QFh0-fd7pjwgOJZJVEYg8Uu0Q-Yl7pOi
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e59664 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=1RJauMYTzl87JpOh4HIA:9 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_03,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270125

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

TMEL(Trust Management Engine Lite) subsystem provides different kinds of
services like secureboot, remote image authentication, key management,
crypto, OEM provisioning etc.

The QMP mailbox is the primary means of communication between TMEL SS and
other subsystem on the SoC. A dedicated pair of inbound and outbound
mailboxes is implemented for each subsystem/external execution environment
which needs to communicate with TMEL for security services. The inbound
mailboxes are used to send IPC requests to TMEL, which are then processed
by TMEL firmware and accordingly the responses are sent back via outbound
mailboxes.

It is an IPC transport protocol which is light weight and supports a subset
of API's. It handles link initialization, negotiation, establishment and
communication across client(CPU/BTSS/AUDIOSS) and server(TMEL SS).

   -----------------------------------------------       ---------------------------------------------------
  |                                              |       |                                                 |
  |                 SOC  CLIENT                  | SOC   |                TMEL  SS                         |
  |                                              | AHB   |                                                 |
  |     ----------    ---------   ---------      |       | ------    -------     --------    ------------  |
  |     |        |    |       |   |       |      | WO    | |     | R |     |     |      |    |SERVICES   | |
  |     | CPU    |<-->| TMEL  |<->|       |------------->| | IN  |-->|     |     | TMEL |    |--------   | |
  |     |        |    | COM   |   | QMP   |      | RO    | |     | W | QMP |<--->| COM  |<-->| a) ATTEST | |
  |     |        |    |       |   |       |<-------------| | OUT |<--|     |     |      |    | b) CRYPTO | |
  |     |        |    |       |   |       |      |       | |     |   |     |     |      |    | .. more   | |
  |     ---------     ---------   ---------      |       | ------    -------     -------     ------------  |
  |                                              |       |                                                 |
   -----------------------------------------------       --------------------------------------------------

This binding describes the component responsible for communication between
the TMEL subsystem and the TMEL client (CPU/BTSS/AUDIOSS),
used for security services like secure image authentication, enable/disable
efuses, crypto services. Each client in the SoC has its own block of message
RAM and IRQ for communication with the TMEL SS.

Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
[v4]
	Fixed TMEL naming and added expansion
        Fixed wrappings for 80 columns

[V3]
        Fixed wrappings.
        Made mailbox-cells as a required property and changed value to '1'.
        Fixed to use compatible as filename.
        Renamed compatible as per Krzystof's comments.
        Dropped unused label.

[V2]
        Added HW description as per comments.
        Removed the fallback compatible.
        Fixed naming convention to TME-L in all places.
        Fixed indendation for example.
        Removed the 'description' for some items.

[V1]
	RFC Post.

 .../bindings/mailbox/qcom,ipq5424-tmel.yaml   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml b/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
new file mode 100644
index 000000000000..5bdeab166a1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/qcom,ipq5424-tmel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TMEL IPCC channel
+
+maintainers:
+  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
+
+description:
+  TMEL(Trust Management Engine Lite) SS provides different kinds of services
+  like secureboot, remote image authentication, key management, crypto, OEM
+  provisioning etc.
+
+  The QMP mailbox is the primary means of communication between TMEL SS and
+  other subsystem on the SoC. A dedicated pair of inbound and outbound mailbox
+  is implemented for each subsystem/external execution environment which needs
+  to communicate with TMEL for security services. The inbound mailboxes are used
+  to send IPC requests to TMEL, which are then processed by TMEL firmware and
+  accordingly the responses are sent back via outbound mailboxes.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,ipq5424-tmel
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  mboxes:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - mboxes
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mailbox@32090000 {
+        compatible = "qcom,ipq5424-tmel";
+        reg = <0x32090000 0x2000>;
+        interrupts = <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;
+        mboxes = <&apcs_glb 20>;
+        #mbox-cells = <1>;
+    };
-- 
2.34.1


