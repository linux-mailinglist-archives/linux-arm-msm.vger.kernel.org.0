Return-Path: <linux-arm-msm+bounces-43703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C16A9FECFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 06:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5261161F0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 05:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9294318756A;
	Tue, 31 Dec 2024 05:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SVXuU2rE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5AC18660A;
	Tue, 31 Dec 2024 05:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735624170; cv=none; b=s8jxxMj4vtsAm2ko9nyn0Zr5Sn+pVQsfVQBoD81BZY+SCfx4IrVEMHaP1dOFvRefUmqe88VBkig7QIVb3+U53d9ctauIwu5RoCFEJanV9qaCEFobwxxp5Acfi/Fw8pyUznpwK0hwBsaTU2df4JUIYD6Dt2kZ4PzG9/JV5pOlsRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735624170; c=relaxed/simple;
	bh=aSplzpIc7pnygDIlc5qQCFg4FafFbg9r/gGkki9Ptvs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XnjDm3NgUk5gin4Od60y0e/xn5H6StZQr1/A4wLO+yUmTtdTE9uU8RCEf3bZrScXBgFwM6Y6kytab2LLoi+5CifE9VaDmR5ztvTLAtnJE5CVYPVcc6PwBMuDAgQottiC/IyWwMaLlLGGD9wgM09JgIYvtbDx4QJdezO56yQB2u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SVXuU2rE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV5n5oP010219;
	Tue, 31 Dec 2024 05:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMUnqJXwdTvFa4prAGvIQxhYcP50oiYqnXSfY7mIY+g=; b=SVXuU2rE6N4mxFlc
	4dUpYHtkE2i92nHJOnFQiC1H7CkLqakpn0qhTvYdk6LaW1txErp2pG41gSQsjn7d
	PM451v38S5bgDMgTA36A8f8UdKycDrBXbIAswoxSUE9duVOaZlsC0wF5+PgFzyH5
	1CesAjM3KvhTHbIfNl8wHkdCCW9daRmsWbHpBH0Kb1ctgIwJwC55O7Mqv3wq002B
	pXh+nsFt8BdbQIt3dK35cTo8CQ+/aKfFDD4J7ngqu18HkWtaf3AHAzgdzAYXoeLK
	TWOASJeTfJcf1C1AvwV6QE7bEDIyjfqXsfwPYqCvwkuVnvXcqUfay2XBOaD13+t7
	khmBUg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43vasy8017-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 05:49:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV5nL7N001111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 05:49:21 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Dec 2024 21:49:17 -0800
From: Sricharan R <quic_srichara@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH V2 1/2] dt-bindings: mailbox: Document qcom,tmel-qmp
Date: Tue, 31 Dec 2024 11:18:59 +0530
Message-ID: <20241231054900.2144961-2-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241231054900.2144961-1-quic_srichara@quicinc.com>
References: <20241231054900.2144961-1-quic_srichara@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 0_sSgFg4WcdquMi4fBFnOws1LvwZ85p1
X-Proofpoint-GUID: 0_sSgFg4WcdquMi4fBFnOws1LvwZ85p1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412310047

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

TMEL SS provides different kinds of services like secureboot, remote image
authentication, key management, crypto, OEM provisioning etc. This patch adds
support for remote image authentication. Support for rest of the services can
be added.

The QMP mailbox is the primary means of communication between TMEL SS and other
subsystem on the SoC. A dedicated pair of inbound and outbound mailboxes is
implemented for each subsystem/external execution environment which needs to
communicate with TMEL for security services. The inbound mailboxes are used to
send IPC requests to TMEL, which are then processed by TMEL firmware and
accordingly the responses are sent to the requestor via outbound mailboxes.

It is an IPC transport protocol which is light weight and supports a subset of
API's. It handles link initialization, negotiation, establishment and
communication across client(APPSS/BTSS/AUDIOSS) and server(TMEL SS).

   -----------------------------------------------       ---------------------------------------------------
  |                                              |       |                                                 |
  |                 SOC  CLIENT                  | SOC   |                TMEL  SS                        |
  |                                              | AHB   |                                                 |
  |     ----------    ---------   ---------      |       | ------    -------     --------    ------------  |
  |     |        |    |       |   |       |      | WO    | |     | R |     |     |      |    |SERVICES   | |
  |     | APPS   |<-->| TMEL  |<->|       |------------->| | IN  |-->|     |     | TMEL |    |--------   | |
  |     |        |    | COM   |   | QMP   |      | RO    | |     | W | QMP |<--->| COM  |<-->| a) ATTEST | |
  |     |        |    |       |   |       |<-------------| | OUT |<--|     |     |      |    | b) CRYPTO | |
  |     |        |    |       |   |       |      |       | |     |   |     |     |      |    | .. more   | |
  |     ---------     ---------   ---------      |       | ------    -------     -------     ------------  |
  |                                              |       |                                                 |
   -----------------------------------------------       --------------------------------------------------

This binding describes the component responsible for communication between the
TMEL server based subsystems (Q6) and the TMEL client (APPSS/BTSS/AUDIOSS),
used for security services like secure image authentication, enable/disable
efuses, crypto services. Each client in the   SoC has its own block of message
RAM and IRQ for communication with the TMEL SS.

Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
  [V2]  Added HW description as per comments.
        Removed the fallback compatible.
        Fixed naming convention to TME-L in all places.
        Fixed indendation for example.
        Removed the 'description' for some items.

 .../bindings/mailbox/qcom,tmel-qmp.yaml       | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml b/Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml
new file mode 100644
index 000000000000..a434359e0a2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/qcom,tmel-qmp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TMEL IPCC channel
+
+maintainers:
+  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
+
+description:
+  TMEL SS provides different kinds of services like secureboot, remote image
+  authentication, key management, crypto, OEM provisioning etc. This patch adds
+  support for remote image authentication. Support for rest of the services can
+  be added.
+
+  The QMP mailbox is the primary means of communication between TMEL SS and
+  other subsystem on the SoC. A dedicated pair of inbound and outbound mailboxes
+  is implemented for each subsystem/external execution environment which needs to
+  communicate with TMEL for security services. The inbound mailboxes are used to
+  send IPC requests to TMEL, which are then processed by TMEL firmware and
+  accordingly the responses are sent to the requestor via outbound mailboxes.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,ipq5424-tmel-qmp
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
+    tmel_qmp: mailbox@32090000 {
+        compatible = "qcom,ipq5424-tmel-qmp";
+        reg = <0x32090000 0x2000>;
+        interrupts = <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;
+        mboxes = <&apcs_glb 20>;
+        #mbox-cells = <2>;
+    };
+
+...
-- 
2.34.1


