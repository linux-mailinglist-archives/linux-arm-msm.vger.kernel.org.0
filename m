Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 056B48B9A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2019 15:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728967AbfHMNKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Aug 2019 09:10:05 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43908 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728793AbfHMNKE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Aug 2019 09:10:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7948460E42; Tue, 13 Aug 2019 13:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565701803;
        bh=LB6VhLfiTT7wiQ7EY39GInmqZi2dKYMz8xDxRS6dEH8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QN3MDaI8q6N74uz/d8DHEIvUc8c/elQI+zCSTKQC9jbRWchsEB3eY4xpgKlxX66+t
         3VZN4R7V91UiaR5ttW8SPypIouiUpW+uF+prKyVe9O/IxWDFwgWWIBctP4OJIODIK/
         HSM+S6QV6un3qJMbNlFJ4BfcRMHKewtz8XDi8Al0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E19C60850;
        Tue, 13 Aug 2019 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565701801;
        bh=LB6VhLfiTT7wiQ7EY39GInmqZi2dKYMz8xDxRS6dEH8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iDpV3OmhumzE52fNw9+3Ipy4Zyd/NRAi+KL9HQtqItgJqN6QhPvJDhwIJiLx8voyQ
         5hcSkVaHffDFjs5LSqkAKS/5SQPKtRyqOMvkB4svyG4ytKwbx2GXqOqyynaHD5422R
         vfW1kD1NQaw68FinFHJg/FURKXFEEm+cRQaboNa8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E19C60850
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     sboyd@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-soc@vger.kernel.org, andy.gross@linaro.org,
        linux-remoteproc@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [v2 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
Date:   Tue, 13 Aug 2019 18:39:45 +0530
Message-Id: <20190813130946.16448-2-govinds@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813130946.16448-1-govinds@codeaurora.org>
References: <20190813130946.16448-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree binding for the Q6SSTOP clock controller found in QCS404.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 .../bindings/clock/qcom,q6sstopcc.yaml        | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
new file mode 100644
index 000000000000..861e9ba97ca3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,osm-l3.yaml#
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
+    maxItems: 2
+    description: Q6SSTOP clocks register region
+    description: Q6SSTOP_TCSR register region
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
+examples:
+  - |
+    q6sstopcc: clock-controller@7500000 {
+      compatible = "qcom,qcs404-q6sstopcc";
+      reg = <0x07500000 0x4e000>, <0x07550000 0x10000>;
+      clocks = <&gcc GCC_WCSS_Q6_AHB_CLK>;
+      #clock-cells = <1>;
+    };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

