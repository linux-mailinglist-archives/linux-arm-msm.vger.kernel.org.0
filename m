Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEFEE590833
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 23:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234164AbiHKVmS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 17:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbiHKVmQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 17:42:16 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CFB9F0E9;
        Thu, 11 Aug 2022 14:42:15 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BLDBbi018458;
        Thu, 11 Aug 2022 21:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=viRGnpzvkALHzKJt4CKKAQj5+xyzvG7AE91JosXNPus=;
 b=gs17nuG4F4htg8VLOuToGXwtetzeMq7XlLQ4AuwaaFf28zr+qdzhawliCdSK20XA1jdc
 QyZoyfWlE5152EoXWPz/Q8GLIgIAEeYY7iqEfy1OxVemk5P9FVQF6fK3wDbX5ZeEdFyh
 +73Q5DfaPeJlYZD0nO8q9is91n4PkdVVQnHEp3gmtR2h5b1iXksobKY1p9MvZVk+PVj1
 YZ2rNP9DlmGMnu6UT4d7qTwNAA4NVAxLwF3bhm14ByHD0nnUbio9xVCM9mvaHTGCqJ/L
 7GhodUyVVlmI749ivcwa9CfjuO6q8T2iIPKxMcKgKqlQQ3CGY/DI/vx0gCIzYswNF1IS zA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hw8ht856x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 21:41:57 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27BLfvX0007815
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 21:41:57 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 11 Aug 2022 14:41:56 -0700
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        <devicetree@vger.kernel.org>
CC:     Elliot Berman <quic_eberman@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Srivatsa Vaddagiri" <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Marc Zyngier" <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v3 03/12] dt-bindings: Add binding for gunyah hypervisor
Date:   Thu, 11 Aug 2022 14:40:58 -0700
Message-ID: <20220811214107.1074343-4-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811214107.1074343-1-quic_eberman@quicinc.com>
References: <20220811214107.1074343-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EPb4qh8Fg1mVCN4W_35-Ur1ishBR-nbW
X-Proofpoint-ORIG-GUID: EPb4qh8Fg1mVCN4W_35-Ur1ishBR-nbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_13,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1011 malwarescore=0 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208110065
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When Linux is booted as a guest under the Gunyah hypervisor, the Gunyah
Resource Manager applies a devicetree overlay describing the virtual
platform configuration of the guest VM, such as the message queue
capability IDs for communicating with the Resource Manager. This
information is not otherwise discoverable by a VM: the Gunyah hypervisor
core does not provide a direct interface to discover capability IDs nor
a way to communicate with RM without having already known the
corresponding message queue capability ID. Add the DT bindings that
Gunyah adheres for the hypervisor node and message queues.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
Changes since v2:
 - Add newlines as suggested
 - Fixed typo in example (gunyah-resource-mgr@0 -> gunyah-resource-mgr@1)

 .../bindings/firmware/gunyah-hypervisor.yaml  | 87 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml

diff --git a/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
new file mode 100644
index 000000000000..8edcd3915f3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/gunyah-hypervisor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Gunyah Hypervisor
+
+maintainers:
+  - Murali Nalajala <quic_mnalajal@quicinc.com>
+  - Elliot Berman <quic_eberman@quicinc.com>
+
+description: |+
+  On systems which support devicetree, Gunyah generates and overlays a deviceetree overlay which
+  describes the basic configuration of the hypervisor. Virtual machines use this information to determine
+  the capability IDs of the message queues used to communicate with the Gunyah Resource Manager.
+  See also: https://github.com/quic/gunyah-resource-manager/blob/develop/src/vm_creation/dto_construct.c
+
+properties:
+  compatible:
+    - items:
+        - const: gunyah-hypervisor-1.0
+        - const: gunyah-hypervisor
+
+  "#address-cells":
+    description: Number of cells needed to represent 64-bit capability IDs.
+    const: 2
+
+  "#size-cells":
+    description: must be 0, because capability IDs are not memory address
+                  ranges and do not have a size.
+    const: 0
+
+patternProperties:
+  "^gunyah-resource-mgr(@.*)?":
+    type: object
+    description:
+      Resource Manager node which is required to communicate to Resource
+      Manager VM using Gunyah Message Queues.
+
+    properties:
+      compatible:
+        - items:
+            - const: gunyah-resource-manager-1-0
+            - const: gunyah-resource-manager
+
+      reg:
+        items:
+          - description: Gunyah capability ID of the TX message queue
+          - description: Gunyah capability ID of the RX message queue
+
+      interrupts:
+        items:
+          - description: Interrupt for the TX message queue
+          - description: Interrupt for the RX message queue
+
+    additionalProperties: false
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+
+additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    hypervisor {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        compatible = "gunyah-hypervisor-1.0", "gunyah-hypervisor";
+
+        gunyah-resource-mgr@0 {
+            compatible = "gunyah-resource-manager-1-0", "gunyah-resource-manager";
+            interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>, /* TX full IRQ */
+                         <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>; /* RX empty IRQ */
+            reg = <0x00000000 0x00000000>, <0x00000000 0x00000001>;
+                  /* TX, RX cap ids */
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 24d1660bbafa..77bb7833d561 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8739,6 +8739,7 @@ M:	Elliot Berman <quic_eberman@quicinc.com>
 M:	Murali Nalajala <quic_mnalajal@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
+F:	Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
 F:	Documentation/virt/gunyah/
 
 HABANALABS PCI DRIVER
-- 
2.25.1

