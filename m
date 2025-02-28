Return-Path: <linux-arm-msm+bounces-49799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6933BA4909B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1877816F01D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 04:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DC41BDA97;
	Fri, 28 Feb 2025 04:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lnb1f2At"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E881B6CE1;
	Fri, 28 Feb 2025 04:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740718474; cv=none; b=HYZ2+Ku3+VBxGXLhsFIWGgwdeIpnWJb/UM5Hpp8YqXitWp8ALDca5R6jFFkQFkjD6+21CQg8JzFLQtmg0uuo5X9crSjTV9xfU2Fr1ZpY0Qz/+iHMSIbM4k13R0SNsuNlrzgQccafRQqLsRd1pePQl5moh2S1FxvrxfejxtZBqZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740718474; c=relaxed/simple;
	bh=E+nmZlxFn2EBExQpVLIRt0NDyQfI7zXKeA2qQUHddIo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JCK3K0KSyBrLuq3/HONmXf8RADMYWkuks0rOkU7bP0XBcD8/gj0j3FA91Hv89FqWfpDcoo+1UW2zfkYdB9cF6B9GKYgk2pyO6CB/Tip9Y49t/wbwtqRaytj5luEJQuypW8NywQq3suymkgG3JMEbMNg9T5dITzQY/d8kVJ1KRnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lnb1f2At; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RJi7nY017852;
	Fri, 28 Feb 2025 04:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iO8VawJSBgEVcpx9KZWK2KCewT5v9Q5s6mF36LVmp00=; b=lnb1f2Aty++aDM/a
	LznhKFV02XqU0KSfGnXOQUha73GpkivBh+uZMJYz6kl2VHlMFWzGBB69X97PqwLg
	j/Y6fHDSImWeqp8T7Yko6eyCEeglS3ePwHmVB4LfDAxx8ILnreHL01MiccvyDGfC
	HDsVqOMTooIYvaNxzPM9rBczhv+7wJqGnels+T/L7S7Ckb93ohzpFFccFkQ0xblG
	aTz8swh1N6KdWZxILYVBPHrL6gE+ArIDwHZceGAA0Ujgcxqe9KHSKEF08mN0ndEv
	D3L7NpRmiRapARTuKTVNyjyp/MX62HWT27DkQUtmNiq+3h6y7GKnAM19gyMPVO8j
	Ezv/9Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn80j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 04:54:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51S4sFKd021375
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 04:54:15 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 20:54:12 -0800
From: Sricharan R <quic_srichara@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH V3 1/2] dt-bindings: mailbox: Document qcom,tmel-qmp
Date: Fri, 28 Feb 2025 10:23:55 +0530
Message-ID: <20250228045356.3527662-2-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228045356.3527662-1-quic_srichara@quicinc.com>
References: <20250228045356.3527662-1-quic_srichara@quicinc.com>
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
X-Proofpoint-ORIG-GUID: rZN6Wz6RZWahaUiiVm0PLHA5l4ZqKsrM
X-Proofpoint-GUID: rZN6Wz6RZWahaUiiVm0PLHA5l4ZqKsrM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280032

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

TMEL SS provides different kinds of services like secureboot, remote image
authentication, key management, crypto, OEM provisioning etc. This patch
adds support for remote image authentication. Support for rest of the
services can be added.

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
the TMEL server based subsystems (Q6) and the TMEL client
(CPU/BTSS/AUDIOSS), used for security services like secure image
authentication, enable/disable efuses, crypto services. Each client in the
SoC has its own block of message RAM and IRQ for communication with the
TMEL SS.

Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
#V3:
---
        Fixed wrappings.
        Made mailbox-cells as a required property and changed value to '1'.
        Fixed to use compatible as filename.
        Renamed compatible as per Krzystof's comments.
        Dropped unused label.

    Following tests were done and no issues.

       *)  Checkpatch
       *)  Codespell
       *)  Sparse
       *)  kerneldoc check
       *)  Kernel lock debugging
       *)  dt_binding_check and dtbs_check

 .../bindings/mailbox/qcom,ipq5424-tmel.yaml   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml b/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
new file mode 100644
index 000000000000..2e3c79add405
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
@@ -0,0 +1,62 @@
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
+  TMEL SS provides different kinds of services like secureboot, remote image authentication,
+  key management, crypto, OEM provisioning etc. This patch adds support for remote image
+  authentication. Support for rest of the services can be added.
+
+  The QMP mailbox is the primary means of communication between TMEL SS and other subsystem on
+  the SoC. A dedicated pair of inbound and outbound mailboxes is implemented for each
+  subsystem/external execution environment which needs to communicate with TMEL for security
+  services. The inbound mailboxes are used to send IPC requests to TMEL, which are then processed
+  by TMEL firmware and accordingly the responses are sent back via outbound mailboxes.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,ipq5424-tmel
+
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
+
+...
-- 
2.34.1


