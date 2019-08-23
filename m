Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0B49B087
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 15:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394994AbfHWNOP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 09:14:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51746 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731783AbfHWNOO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 09:14:14 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 394F3607F1; Fri, 23 Aug 2019 13:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566566053;
        bh=w0qh6XJYrxs5xcGc7zNaxVDZmR62zB5wrHYzm42ZVwQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ciKRhdzHKqilauCLb3s3mEWxgOJIuzNuis36kKwjG384kLnOtfeImMrm0PxjDlj1U
         EmcNB1NZmA+kLzZuMfirgWgr4fyQMjv0PiZcFtrDTO/ERWOWyEaDWuw4oUM7g4SJ0O
         a8XseZN/tnkrwKizUd7H04Rs6KkZjHvsWvhYGZWw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84338607EB;
        Fri, 23 Aug 2019 13:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566566052;
        bh=w0qh6XJYrxs5xcGc7zNaxVDZmR62zB5wrHYzm42ZVwQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LGEePLZuSxRNVP5H4Dw9KDiEhbXpC27UuuMPNUx3JE64PphTI4ID98WDO6L3df2c9
         rb+QCMz3KX6m6vquJzn3nvFcS9j+GJNGjBiExhek+8XkLN21stbRiYX+lCNINyDqd5
         HmXJHi6lmOUD50Cgza6aALV6+fIJsIv19+ehd3FI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84338607EB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     sboyd@kernel.org, robh@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH_v3 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
Date:   Fri, 23 Aug 2019 18:44:00 +0530
Message-Id: <20190823131401.4011-2-govinds@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190823131401.4011-1-govinds@codeaurora.org>
References: <20190823131401.4011-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree binding for the Q6SSTOP clock controller found in QCS404.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 .../bindings/clock/qcom,q6sstopcc.yaml        | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
new file mode 100644
index 000000000000..39621e2e2f4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,q6sstopcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Q6SSTOP clock Controller
+
+maintainers:
+  - Govind Singh <govinds@codeaurora.org>
+
+description:
+   Q6SSTOP clock controller is used by WCSS remoteproc driver
+   to bring WDSP out of reset.
+
+properties:
+  compatible:
+    const: "qcom,qcs404-q6sstopcc"
+
+  reg:
+    items:
+      - description: Q6SSTOP clocks register region
+      - description: Q6SSTOP_TCSR register region
+
+  clocks:
+    items:
+      - description: ahb clock for the q6sstopCC
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    q6sstopcc: clock-controller@7500000 {
+      compatible = "qcom,qcs404-q6sstopcc";
+      reg = <0x07500000 0x4e000>, <0x07550000 0x10000>;
+      clocks = <&gcc 141>;
+      #clock-cells = <1>;
+    };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

