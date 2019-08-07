Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 195D484A93
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 13:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbfHGLYw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 07:24:52 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40050 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbfHGLYv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 07:24:51 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6EB9060F3C; Wed,  7 Aug 2019 11:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565177090;
        bh=PIXnz/s7UVOKoZDPJvBvU7GkUMvGMQ1RI4HtQIftILQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AMDjiQJGWA2QYVnIgoxC3104+BXApPXyhOoaFmM+1801X6A2Qhd9x6C6/GWLJvc+5
         hl/qpZMvHkvCo8XJCa2RJPyeBHbHd78MFJBJ99T6W0FkqOrBnA+KTJQ/vWjTz+l5Bd
         /60HrVeSrVANMH/uLrsFF625QVLOpqX+p3JrVBZ0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D8B260CED;
        Wed,  7 Aug 2019 11:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565177089;
        bh=PIXnz/s7UVOKoZDPJvBvU7GkUMvGMQ1RI4HtQIftILQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=irCPYjlTJ/gUDXW//nMNmTC+qWZ8isMeHfFCL6044j4MXEIa4vVZtuOnRTK3R3tmU
         HHkSiyjUJXUIhgdFdrx95Y3ZkbmkC6icNIvooMxoJvzlS3lCqxYpodJd4wd0JawBZ+
         slTRkoFG3C1C0g+qfwKYzu9q6UmGix7brOvXwuRY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D8B260CED
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: interconnect: Add OSM L3 DT bindings
Date:   Wed,  7 Aug 2019 16:54:31 +0530
Message-Id: <20190807112432.26521-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807112432.26521-1-sibis@codeaurora.org>
References: <20190807112432.26521-1-sibis@codeaurora.org>
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
 .../bindings/interconnect/qcom,osm-l3.yaml    | 55 +++++++++++++++++++
 .../dt-bindings/interconnect/qcom,osm-l3.h    | 13 +++++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
 create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
new file mode 100644
index 0000000000000..51a4722e1a69f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: BSD-2-Clause
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
+    const: "qcom,sdm845-osm-l3"
+
+  reg:
+    maxItems: 1
+    description: OSM L3 registers
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
+  - clocks-names
+  - '#interconnect-cells'
+
+examples:
+  - |
+    osm_l3: interconnect@17d41000 {
+      compatible = "qcom,sdm845-osm-l3";
+      reg = <0 0x17d41000 0 0x1400>;
+
+      clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
+      clock-names = "xo", "alternate";
+
+      #interconnect-cells = <1>;
+    };
diff --git a/include/dt-bindings/interconnect/qcom,osm-l3.h b/include/dt-bindings/interconnect/qcom,osm-l3.h
new file mode 100644
index 0000000000000..6662134c84248
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,osm-l3.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
+
+#define MASTER_OSM_L3_APPS	0
+#define MASTER_OSM_L3_GPU	1
+#define SLAVE_OSM_L3		2
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

