Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8903640E4BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 19:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346809AbhIPRFT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 13:05:19 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:16311 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347156AbhIPQ5x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 12:57:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631811393; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=5uJxVVTc/lbclgjf/w3rh+bkr6B1ffaroF3YrcjwPW4=; b=lSEuXBkaDsx+Y3GAuFCpbEzub+pb2I3rmcpVNPIo/47dIbiTP5HIeAjYH7tApRkJD7Cp5MTt
 Lzs98plpN8iLawKDuFw+MxmVXTeX9u/F6cMAiYUpbsInxFGN2LA7LaTNru2V9MVM7pvP+sSm
 AnnC8YCfXh0mMxDUu1q3c5ZOmRo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61437736648642cc1cd5620f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 16:56:22
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 07A26C35A18; Thu, 16 Sep 2021 16:56:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1FD75C359F1;
        Thu, 16 Sep 2021 16:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1FD75C359F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v3 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Thu, 16 Sep 2021 22:25:52 +0530
Message-Id: <1631811353-503-3-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631811353-503-1-git-send-email-pillair@codeaurora.org>
References: <1631811353-503-1-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add WPSS PIL loading support for SC7280 SoCs.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 .../bindings/remoteproc/qcom,hexagon-v56.yaml      | 88 +++++++++++++++++++++-
 1 file changed, 86 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
index 051da43..5674602 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,qcs404-cdsp-pil
+      - qcom,sc7280-wpss-pil
       - qcom,sdm845-adsp-pil
 
   reg:
@@ -43,14 +44,14 @@ properties:
       - const: stop-ack
 
   clocks:
-    minItems: 7
+    minItems: 3
     maxItems: 8
     description:
       List of phandles and clock specifier pairs for the Hexagon,
       per clock-names below.
 
   clock-names:
-    minItems: 7
+    minItems: 3
     maxItems: 8
 
   power-domains:
@@ -58,6 +59,11 @@ properties:
     items:
       - description: CX power domain
 
+  power-domain-names:
+    minItems: 1
+    items:
+      - const: cx
+
   resets:
     minItems: 1
     maxItems: 2
@@ -78,6 +84,10 @@ properties:
       Phandle reference to a syscon representing TCSR followed by the
       three offsets within syscon for q6, modem and nc halt registers.
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: States used by the AP to signal the Hexagon core
@@ -117,6 +127,33 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sc7280-wpss-pil
+    then:
+      properties:
+        interrupts-extended:
+          maxItems: 6
+          items:
+            - description: Watchdog interrupt
+            - description: Fatal interrupt
+            - description: Ready interrupt
+            - description: Handover interrupt
+            - description: Stop acknowledge interrupt
+            - description: Shutdown acknowledge interrupt
+        interrupt-names:
+          maxItems: 6
+          items:
+            - const: wdog
+            - const: fatal
+            - const: ready
+            - const: handover
+            - const: stop-ack
+            - const: shutdown-ack
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,sdm845-adsp-pil
     then:
       properties:
@@ -192,6 +229,25 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sc7280-wpss-pil
+    then:
+      properties:
+        power-domains:
+          maxItems: 2
+          items:
+            - description: CX power domain
+            - description: MX power domain
+        power-domain-names:
+          maxItems: 2
+          items:
+            - const: cx
+            - const: mx
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,sdm845-adsp-pil
     then:
       properties:
@@ -219,6 +275,34 @@ allOf:
           items:
             - const: restart
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7280-wpss-pil
+    then:
+      properties:
+        resets:
+          items:
+            - description: AOSS restart
+            - description: PDC SYNC
+        reset-names:
+          items:
+            - const: restart
+            - const: pdc_sync
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm845-adsp-pil
+              - qcom,qcs404-cdsp-pil
+    then:
+      properties:
+        qcom,qmp: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.7.4

