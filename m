Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77E6DD8A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2019 13:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbfJSLiB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Oct 2019 07:38:01 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35276 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbfJSLiA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Oct 2019 07:38:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7181B60E0E; Sat, 19 Oct 2019 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571485079;
        bh=RBGdUDeLSkLs6i5bGIoVVtXNF2AitC9GlfUGH8Iws5k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n/4C1ILRX+1jCBdBtHotY6iesZHHL07PWOWdJd0+aSzic8kC2yjmWhhu4pTFQzzub
         tixCOaA1YOJ866k5izq4nvVsTqKJJneq80oUtEe2lCihPCC3pyYpSOiiYqvycMn2Yy
         XFqceZCtHVHxDhgWUhaHIlToSxaJYSMtxXfhMVss=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 21A6C60D90;
        Sat, 19 Oct 2019 11:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571485061;
        bh=RBGdUDeLSkLs6i5bGIoVVtXNF2AitC9GlfUGH8Iws5k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IL1hWNWcP+SEQnp4COYPjVAhPRhMTeKse0AXLzSel3W2eKEcGcpGh+7O2BiI5zuBv
         CW58GzLNvgwu0BC8gEDbGxeTRb+zXXPRrV0ckTJy1jr1HeTbI928QX1dBRhfkABXBE
         zL8f7wPtXNoc5j2M9FjqvgKzs2Lx052JZhuLbPn0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 21A6C60D90
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 2/3] dt-bindings: msm: Convert LLCC bindings to YAML
Date:   Sat, 19 Oct 2019 17:07:12 +0530
Message-Id: <b5d9e61c4a68ef3290958a891c9361523e0073c0.1571484439.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert LLCC bindings to DT schema format using json-schema.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 .../devicetree/bindings/arm/msm/qcom,llcc.txt | 41 --------------
 .../bindings/arm/msm/qcom,llcc.yaml           | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
deleted file mode 100644
index eaee06b2d8f2..000000000000
--- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-== Introduction==
-
-LLCC (Last Level Cache Controller) provides last level of cache memory in SOC,
-that can be shared by multiple clients. Clients here are different cores in the
-SOC, the idea is to minimize the local caches at the clients and migrate to
-common pool of memory. Cache memory is divided into partitions called slices
-which are assigned to clients. Clients can query the slice details, activate
-and deactivate them.
-
-Properties:
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be "qcom,sdm845-llcc"
-
-- reg:
-	Usage: required
-	Value Type: <prop-encoded-array>
-	Definition: The first element specifies the llcc base start address and
-		    the size of the register region. The second element specifies
-		    the llcc broadcast base address and size of the register region.
-
-- reg-names:
-        Usage: required
-        Value Type: <stringlist>
-        Definition: Register region names. Must be "llcc_base", "llcc_broadcast_base".
-
-- interrupts:
-	Usage: required
-	Definition: The interrupt is associated with the llcc edac device.
-			It's used for llcc cache single and double bit error detection
-			and reporting.
-
-Example:
-
-	cache-controller@1100000 {
-		compatible = "qcom,sdm845-llcc";
-		reg = <0x1100000 0x200000>, <0x1300000 0x50000> ;
-		reg-names = "llcc_base", "llcc_broadcast_base";
-		interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
new file mode 100644
index 000000000000..5ac90d101807
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/msm/qcom,llcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Last Level Cache Controller
+
+maintainers:
+  - Rishabh Bhatnagar <rishabhb@codeaurora.org>
+  - Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
+
+description: |
+  LLCC (Last Level Cache Controller) provides last level of cache memory in SoC,
+  that can be shared by multiple clients. Clients here are different cores in the
+  SoC, the idea is to minimize the local caches at the clients and migrate to
+  common pool of memory. Cache memory is divided into partitions called slices
+  which are assigned to clients. Clients can query the slice details, activate
+  and deactivate them.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sdm845-llcc
+
+  reg:
+    items:
+      - description: LLCC base register region
+      - description: LLCC broadcast base register region
+
+  reg-names:
+    items:
+      - const: llcc_base
+      - const: llcc_broadcast_base
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    cache-controller@1100000 {
+      compatible = "qcom,sdm845-llcc";
+      reg = <0x1100000 0x200000>, <0x1300000 0x50000> ;
+      reg-names = "llcc_base", "llcc_broadcast_base";
+      interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

