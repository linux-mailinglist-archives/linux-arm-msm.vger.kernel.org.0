Return-Path: <linux-arm-msm+bounces-40274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D6F9E3D59
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51624160FE5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB3320ADEE;
	Wed,  4 Dec 2024 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pmdd5bal"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A99205AB3;
	Wed,  4 Dec 2024 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733323986; cv=none; b=BEZBpD4dUl317KnQieTbOMh2awjyyXd7VzmUKJzav0aCJAMD4+7OGHP0XJ2k2es8sKnHNrkGIJG/Zs9CvlTjlJngemOMIRGL8Uz4LH8u8/9sCOKrx/Cn5uAYhXD7wMhe5zhhV32gDoa4TTcPQOrDcFC2pTtEW9qTluFQ/XY5V90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733323986; c=relaxed/simple;
	bh=5H9xiq6zQ/EOKxt05SxXOzasrc6/C/oXkvCoJzbAo3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bo80N8AMkqSORO4ZdOPYY/KJTEYDnfQe0NbxozCK6nFj6SDLYFtEAzaPrNIbHCdC4SD8DtnjYrk4cf8JSsO3FvP9VQx5DoX9q36tJ3olYq/LPpPnFRdgT9wATf1u+WbuVCEijMLtJqwYopQSNd9QlTfTdmNCVkxRNC1SYSW1QYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pmdd5bal; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B46kdCJ023313;
	Wed, 4 Dec 2024 14:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D90expnj0SSF/9ucUSQPsvixz5/QNnMYJizpIQMPybs=; b=Pmdd5balSEsMIRaP
	39RdXI/gWvXM0dgCKj2PVYYXgkHpQ3TIb8+mDwn1nantSYr/1CveFVmxQ22MfJ1C
	wATuiAZ2BQzZmWPDlFgxCGJcBgij1RUWwWmAohFT+OKlQxHb0/b89WqZhDPrcTGQ
	tI6uWZI5TWOibiOJNMhc5TtNu6Z5t0agXaFZrMaswOJqVz4Ydj+qCji2srHbG0iC
	Uwt/mnFl5ATCZ4L/QYXJuxQe+pVp3j1z7FEGvCPEzEFxEMcyc1KXrjVe5irc7cvj
	/9hetgbxyhu4aaf5PMbD8FWGhLQz9Vgz8s/E1WQMUxO+mY0mBxsLBaipwdo27wbA
	SowD5w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj4298f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 14:52:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4EqoGC004299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 14:52:50 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 06:52:44 -0800
From: Lei Wei <quic_leiwei@quicinc.com>
Date: Wed, 4 Dec 2024 22:43:53 +0800
Subject: [PATCH net-next v2 1/5] dt-bindings: net: pcs: Add Ethernet PCS
 for Qualcomm IPQ9574 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-ipq_pcs_rc1-v2-1-26155f5364a1@quicinc.com>
References: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
In-Reply-To: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
To: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
	<andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
	<linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_luoj@quicinc.com>,
        <quic_leiwei@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <bartosz.golaszewski@linaro.org>, <vsmuthu@qti.qualcomm.com>,
        <john@phrozen.org>, <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733323958; l=8670;
 i=quic_leiwei@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=5H9xiq6zQ/EOKxt05SxXOzasrc6/C/oXkvCoJzbAo3c=;
 b=w08EN6Coz6JbfdAJHO4habL4TLj3rmBbHSzAUsVjSlgfOk8qFvOPoPGocy19qO0cCvl+/54Ny
 BXKgTDcraBVD1A4sedRXPqkLu2cxG/bhtvu/UGwS6PClpQGdWar0qPD
X-Developer-Key: i=quic_leiwei@quicinc.com; a=ed25519;
 pk=uFXBHtxtDjtIrTKpDEZlMLSn1i/sonZepYO8yioKACM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tt8rb_3g4ZK6AFimI23gp5WVXQ4bsQkS
X-Proofpoint-ORIG-GUID: tt8rb_3g4ZK6AFimI23gp5WVXQ4bsQkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040114

The 'UNIPHY' PCS block in the IPQ9574 SoC includes PCS and SerDes
functions. It supports different interface modes to enable Ethernet
MAC connections to different types of external PHYs/switch. It includes
PCS functions for 1Gbps and 2.5Gbps interface modes and XPCS functions
for 10Gbps interface modes. There are three UNIPHY (PCS) instances
in IPQ9574 SoC which provide PCS/XPCS functions to the six Ethernet
ports.

Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
---
 .../bindings/net/pcs/qcom,ipq9574-pcs.yaml         | 190 +++++++++++++++++++++
 include/dt-bindings/net/qcom,ipq9574-pcs.h         |  15 ++
 2 files changed, 205 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/pcs/qcom,ipq9574-pcs.yaml b/Documentation/devicetree/bindings/net/pcs/qcom,ipq9574-pcs.yaml
new file mode 100644
index 000000000000..74573c28d6fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/qcom,ipq9574-pcs.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/qcom,ipq9574-pcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ethernet PCS for Qualcomm IPQ9574 SoC
+
+maintainers:
+  - Lei Wei <quic_leiwei@quicinc.com>
+
+description:
+  The UNIPHY hardware blocks in the Qualcomm IPQ SoC include PCS and SerDes
+  functions. They enable connectivity between the Ethernet MAC inside the
+  PPE (packet processing engine) and external Ethernet PHY/switch. There are
+  three UNIPHY instances in IPQ9574 SoC which provide PCS functions to the
+  six Ethernet ports.
+
+  For SGMII (1Gbps PHY) or 2500BASE-X (2.5Gbps PHY) interface modes, the PCS
+  function is enabled by using the PCS block inside UNIPHY. For USXGMII (10Gbps
+  PHY), the XPCS block in UNIPHY is used.
+
+  The SerDes provides 125M (1Gbps mode) or 312.5M (2.5Gbps and 10Gbps modes)
+  RX and TX clocks to the NSSCC (Networking Sub System Clock Controller). The
+  NSSCC divides these clocks and generates the MII RX and TX clocks to each
+  of the MII interfaces between the PCS and MAC, as per the link speeds and
+  interface modes.
+
+  Different IPQ SoC may support different number of UNIPHYs (PCSes) since the
+  number of ports and their capabilities can be different between these SoCs
+
+  Below diagram depicts the UNIPHY (PCS) connections for an IPQ9574 SoC based
+  board. In this example, the PCS0 has four GMIIs/XGMIIs, which can connect
+  with four MACs to support QSGMII (4 x 1Gbps) or 10G_QXGMII (4 x 2.5Gbps)
+  interface modes.
+
+  -           +-------+ +---------+  +-------------------------+
+    +---------+CMN PLL| |  GCC    |  |   NSSCC (Divider)       |
+    |         +----+--+ +----+----+  +--+-------+--------------+
+    |              |         |          ^       |
+    |       31.25M |  SYS/AHB|clk  RX/TX|clk    +------------+
+    |       ref clk|         |          |       |            |
+    |              |         v          | MII RX|TX clk   MAC| RX/TX clk
+    |25/50M     +--+---------+----------+-------+---+      +-+---------+
+    |ref clk    |  |   +----------------+       |   |      | |     PPE |
+    v           |  |   |     UNIPHY0            V   |      | V         |
+  +-------+     |  v   |       +-----------+ (X)GMII|      |           |
+  |       |     |  +---+---+   |           |--------|------|-- MAC0    |
+  |       |     |  |       |   |           | (X)GMII|      |           |
+  |  Quad |     |  |SerDes |   | PCS/XPCS  |--------|------|-- MAC1    |
+  |       +<----+  |       |   |           | (X)GMII|      |           |
+  |(X)GPHY|     |  |       |   |           |--------|------|-- MAC2    |
+  |       |     |  |       |   |           | (X)GMII|      |           |
+  |       |     |  +-------+   |           |--------|------|-- MAC3    |
+  +-------+     |              |           |        |      |           |
+                |              +-----------+        |      |           |
+                +-----------------------------------+      |           |
+                +--+---------+----------+-------+---+      |           |
+  +-------+     |            UNIPHY1                |      |           |
+  |       |     |              +-----------+        |      |           |
+  |(X)GPHY|     | +-------+    |           | (X)GMII|      |           |
+  |       +<----+ |SerDes |    | PCS/XPCS  |--------|------|- MAC4     |
+  |       |     | |       |    |           |        |      |           |
+  +-------+     | +-------+    |           |        |      |           |
+                |              +-----------+        |      |           |
+                +-----------------------------------+      |           |
+                +--+---------+----------+-------+---+      |           |
+  +-------+     |           UNIPHY2                 |      |           |
+  |       |     |              +-----------+        |      |           |
+  |(X)GPHY|     | +-------+    |           | (X)GMII|      |           |
+  |       +<----+ |SerDes |    | PCS/XPCS  |--------|------|- MAC5     |
+  |       |     | |       |    |           |        |      |           |
+  +-------+     | +-------+    |           |        |      |           |
+                |              +-----------+        |      |           |
+                +-----------------------------------+      +-----------+
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq9574-pcs
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  clocks:
+    items:
+      - description: System clock
+      - description: AHB clock needed for register interface access
+
+  clock-names:
+    items:
+      - const: sys
+      - const: ahb
+
+  '#clock-cells':
+    const: 1
+    description: See include/dt-bindings/net/qcom,ipq9574-pcs.h for constants
+
+patternProperties:
+  '^pcs-mii@[0-4]$':
+    type: object
+    description: PCS MII interface.
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 4
+        description: MII index
+
+      clocks:
+        items:
+          - description: PCS MII RX clock
+          - description: PCS MII TX clock
+
+      clock-names:
+        items:
+          - const: rx
+          - const: tx
+
+    required:
+      - reg
+      - clocks
+      - clock-names
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
+
+    ethernet-pcs@7a00000 {
+        compatible = "qcom,ipq9574-pcs";
+        reg = <0x7a00000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&gcc GCC_UNIPHY0_SYS_CLK>,
+                 <&gcc GCC_UNIPHY0_AHB_CLK>;
+        clock-names = "sys",
+                      "ahb";
+        #clock-cells = <1>;
+
+        pcs-mii@0 {
+            reg = <0>;
+            clocks = <&nsscc 116>,
+                     <&nsscc 117>;
+            clock-names = "rx",
+                          "tx";
+        };
+
+        pcs-mii@1 {
+            reg = <1>;
+            clocks = <&nsscc 118>,
+                     <&nsscc 119>;
+            clock-names = "rx",
+                          "tx";
+        };
+
+        pcs-mii@2 {
+            reg = <2>;
+            clocks = <&nsscc 120>,
+                     <&nsscc 121>;
+            clock-names = "rx",
+                          "tx";
+        };
+
+        pcs-mii@3 {
+            reg = <3>;
+            clocks = <&nsscc 122>,
+                     <&nsscc 123>;
+            clock-names = "rx",
+                          "tx";
+        };
+    };
diff --git a/include/dt-bindings/net/qcom,ipq9574-pcs.h b/include/dt-bindings/net/qcom,ipq9574-pcs.h
new file mode 100644
index 000000000000..96bd036aaa70
--- /dev/null
+++ b/include/dt-bindings/net/qcom,ipq9574-pcs.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ * Device Tree constants for the Qualcomm IPQ9574 PCS
+ */
+
+#ifndef _DT_BINDINGS_PCS_QCOM_IPQ9574_H
+#define _DT_BINDINGS_PCS_QCOM_IPQ9574_H
+
+/* The RX and TX clocks which are provided from the SerDes to NSSCC. */
+#define PCS_RX_CLK		0
+#define PCS_TX_CLK		1
+
+#endif /* _DT_BINDINGS_PCS_QCOM_IPQ9574_H */

-- 
2.34.1


