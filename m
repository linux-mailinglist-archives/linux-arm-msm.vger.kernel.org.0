Return-Path: <linux-arm-msm+bounces-5940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8DD81DF4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Dec 2023 09:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29B871F21E79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Dec 2023 08:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDF11C14;
	Mon, 25 Dec 2023 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mfBmgumo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78461C2E;
	Mon, 25 Dec 2023 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BP8c0Ef011114;
	Mon, 25 Dec 2023 08:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=VRfK9RWMLCh9Ms22Qc54Qyf+Loo5sc4QpXd0wUmTPtY=; b=mf
	BmgumoRyOX/MFxHnUp8eOPEAHjLoNQxatFgbMc0eldoIoebehUUwHMC88IBKmPYi
	YXhgDjNrNLt0bxF8/WLQojRm1CHBFhLGM1zAXnDZTwc42dP8Om05etR3gst1IRug
	XFnUtNGDJtkgCk7dywFY2olvxWVjLwq67IiNq1X6zv42itppLim/CCE7f6iSrnRE
	e3QEbLcTl1Xew97+iRGrsVdLKZdnTHwoypox4dTyqSxay23qYsvI4hJtETLoB5bj
	f7+e6hjUjcP82cWWo6o3rrK8SR7t/cN5MFUSc4xI9RAj5DALQJlMVGC8pGV/CtKb
	91wGqflwsRk8vUCWsZtA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v5mwr3fg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Dec 2023 08:47:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BP8j6rE014182
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Dec 2023 08:47:06 GMT
Received: from akronite-sh-dev02.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 25 Dec 2023 00:45:00 -0800
From: Luo Jie <quic_luoj@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <robert.marko@sartura.hr>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH v4 5/5] dt-bindings: net: ipq4019-mdio: Document ipq5332 platform
Date: Mon, 25 Dec 2023 16:44:24 +0800
Message-ID: <20231225084424.30986-6-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231225084424.30986-1-quic_luoj@quicinc.com>
References: <20231225084424.30986-1-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Nb0T21WSm4ZUuz0kvuUOKZMZXXcoqUq2
X-Proofpoint-ORIG-GUID: Nb0T21WSm4ZUuz0kvuUOKZMZXXcoqUq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312250066

Update the yaml file for the new DTS properties.

1. qcom,cmn-ref-clock-frequency for the CMN PLL source clock select.
2. clock-frequency for MDIO clock frequency config.
3. add uniphy AHB & SYS GCC clocks.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 .../bindings/net/qcom,ipq4019-mdio.yaml       | 141 +++++++++++++++++-
 1 file changed, 136 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
index 3407e909e8a7..205500cb1fd1 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
@@ -18,8 +18,10 @@ properties:
 
       - items:
           - enum:
+              - qcom,ipq5332-mdio
               - qcom,ipq6018-mdio
               - qcom,ipq8074-mdio
+              - qcom,ipq9574-mdio
           - const: qcom,ipq4019-mdio
 
   "#address-cells":
@@ -30,19 +32,76 @@ properties:
 
   reg:
     minItems: 1
-    maxItems: 2
-    description:
-      the first Address and length of the register set for the MDIO controller.
-      the second Address and length of the register for ethernet LDO, this second
-      address range is only required by the platform IPQ50xx.
+    maxItems: 5
+    description: |
+      The first address and length of the register set for the MDIO controller,
+      the optional second address and length of the register is for CMN block,
+      the optional third, fourth and fifth address and length of the register
+      for Ethernet LDO, the optional Ethernet LDO address range is required by
+      the platform IPQ50xx/IPQ5332.
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: mdio
+      - const: cmn_blk
+      - const: eth_ldo1
+      - const: eth_ldo2
+      - const: eth_ldo3
 
   clocks:
+    minItems: 1
     items:
       - description: MDIO clock source frequency fixed to 100MHZ
+      - description: UNIPHY0 AHB clock source frequency fixed to 100MHZ
+      - description: UNIPHY1 AHB clock source frequency fixed to 100MHZ
+      - description: UNIPHY0 SYS clock source frequency fixed to 24MHZ
+      - description: UNIPHY1 SYS clock source frequency fixed to 24MHZ
 
   clock-names:
+    minItems: 1
     items:
       - const: gcc_mdio_ahb_clk
+      - const: uniphy0_ahb
+      - const: uniphy1_ahb
+      - const: uniphy0_sys
+      - const: uniphy1_sys
+
+  qcom,cmn-ref-clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 25000000
+      - 31250000
+      - 40000000
+      - 48000000
+      - 50000000
+      - 96000000
+    default: 48000000
+    description: |
+      The reference clock source of CMN PLL block is selectable, the
+      reference clock source can be from wifi module or the external
+      xtal, the reference clock frequency 48MHZ can be from internal
+      wifi or the external xtal, if absent, the internal 48MHZ is used,
+      if the 48MHZ is specified, which means the external 48Mhz is used.
+
+  clock-frequency:
+    enum:
+      - 390625
+      - 781250
+      - 1562500
+      - 3125000
+      - 6250000
+      - 12500000
+    default: 390625
+    description: |
+      The MDIO bus clock that must be output by the MDIO bus hardware,
+      only the listed frequencies above can be supported, other frequency
+      will cause malfunction. If absent, the default hardware value 0xff
+      is used, which means the default MDIO clock frequency 390625HZ, The
+      MDIO clock frequency is MDIO_SYS_CLK/(MDIO_CLK_DIV + 1), the SoC
+      MDIO_SYS_CLK is fixed to 100MHZ, the MDIO_CLK_DIV is from MDIO control
+      register, there is higher clock frequency requirement on the normal
+      working case where the MDIO slave devices support high clock frequency.
 
 required:
   - compatible
@@ -59,8 +118,10 @@ allOf:
           contains:
             enum:
               - qcom,ipq5018-mdio
+              - qcom,ipq5332-mdio
               - qcom,ipq6018-mdio
               - qcom,ipq8074-mdio
+              - qcom,ipq9574-mdio
     then:
       required:
         - clocks
@@ -70,6 +131,20 @@ allOf:
         clocks: false
         clock-names: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5332-mdio
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        reg-names:
+          minItems: 4
+
 unevaluatedProperties: false
 
 examples:
@@ -100,3 +175,59 @@ examples:
         reg = <4>;
       };
     };
+
+  - |
+    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio@90000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "qcom,ipq5332-mdio",
+                   "qcom,ipq4019-mdio";
+
+      reg = <0x90000 0x64>,
+            <0x9b000 0x800>,
+            <0x7a00610 0x4>,
+            <0x7a10610 0x4>;
+
+      reg-names = "mdio",
+                  "cmn_blk",
+                  "eth_ldo1",
+                  "eth_ldo2";
+
+      clocks = <&gcc GCC_MDIO_AHB_CLK>,
+               <&gcc GCC_UNIPHY0_AHB_CLK>,
+               <&gcc GCC_UNIPHY1_AHB_CLK>,
+               <&gcc GCC_UNIPHY0_SYS_CLK>,
+               <&gcc GCC_UNIPHY1_SYS_CLK>;
+
+      clock-names = "gcc_mdio_ahb_clk",
+                    "uniphy0_ahb",
+                    "uniphy1_ahb",
+                    "uniphy0_sys",
+                    "uniphy1_sys";
+
+      clock-frequency = <6250000>;
+      reset-gpios = <&tlmm 51 GPIO_ACTIVE_LOW>;
+
+      qca8kphy0: ethernet-phy@1 {
+        compatible = "ethernet-phy-id004d.d180";
+        reg = <1>;
+      };
+
+      qca8kphy1: ethernet-phy@2 {
+        compatible = "ethernet-phy-id004d.d180";
+        reg = <2>;
+      };
+
+      qca8kphy2: ethernet-phy@3 {
+        compatible = "ethernet-phy-id004d.d180";
+        reg = <3>;
+      };
+
+      qca8kphy3: ethernet-phy@4 {
+        compatible = "ethernet-phy-id004d.d180";
+        reg = <4>;
+      };
+    };
-- 
2.42.0


