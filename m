Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD88136244
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 22:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbgAIVMl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 16:12:41 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:34803 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725879AbgAIVMl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 16:12:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578604360; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=PJixwL0VU9s6ZsflEZw4xRatwWO7fcIY1DfVMe27rOc=; b=rwtjQIFy9JLgwc8V42ikxVU/8+5w9O6NNp2uvE1NZuOSi1BFq5CycyOpC8yq4kgGRQLz5+Rg
 frwN77mpx+fr15AcAZ5IAqjSH+DP8a2bg9Ma6xjZ6bLXX2Lj4vTcvQb8hcPd8z7R5/R/F47B
 j/TqY4KOjUayhTbXUumK3fPas98=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e179746.7f4d8854d148-smtp-out-n03;
 Thu, 09 Jan 2020 21:12:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B37E6C447A1; Thu,  9 Jan 2020 21:12:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 344ADC447A2;
        Thu,  9 Jan 2020 21:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 344ADC447A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org, evgreen@chromium.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        daidavid1@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 1/4] dt-bindings: interconnect: Add OSM L3 DT bindings
Date:   Fri, 10 Jan 2020 02:42:12 +0530
Message-Id: <20200109211215.18930-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20200109211215.18930-1-sibis@codeaurora.org>
References: <20200109211215.18930-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for Operating State Manager (OSM) L3 interconnect provider
on SDM845 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../bindings/interconnect/qcom,osm-l3.yaml    | 61 +++++++++++++++++++
 .../dt-bindings/interconnect/qcom,osm-l3.h    | 12 ++++
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
 create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
new file mode 100644
index 0000000000000..b4d46a1e92573
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,osm-l3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Operating State Manager (OSM) L3 Interconnect Provider
+
+maintainers:
+  - Sibi Sankar <sibis@codeaurora.org>
+
+description:
+  L3 cache bandwidth requirements on Qualcomm SoCs is serviced by the OSM.
+  The OSM L3 interconnect provider aggregates the L3 bandwidth requests
+  from CPU/GPU and relays it to the OSM.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sdm845-osm-l3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: xo clock
+      - description: alternate clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: alternate
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#interconnect-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #define GPLL0               165
+    #define RPMH_CXO_CLK        0
+
+    osm_l3: interconnect@17d41000 {
+      compatible = "qcom,sdm845-osm-l3";
+      reg = <0x17d41000 0x1400>;
+
+      clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
+      clock-names = "xo", "alternate";
+
+      #interconnect-cells = <1>;
+    };
diff --git a/include/dt-bindings/interconnect/qcom,osm-l3.h b/include/dt-bindings/interconnect/qcom,osm-l3.h
new file mode 100644
index 0000000000000..54858ff7674d7
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,osm-l3.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
+
+#define MASTER_OSM_L3_APPS	0
+#define SLAVE_OSM_L3		1
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
