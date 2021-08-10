Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0865B3E8207
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 20:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237341AbhHJSFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 14:05:25 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13669 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236691AbhHJSCf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 14:02:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628618533; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=O6oKfpq+92xnN3o8TZsu/BnQk7NHoYwPaMopS+Fm37I=; b=Zurzub0ElWebkFy8/aHRUDzVxqQf/Uli48i6Fj1EfxS17kyDERrZw7A1o9m4Ftl5OSPpXse3
 WlCjPZrZVbCi3BCAtS7XzbERZoaGsjfSiaLEYp7opFoz7rGLSjKUBvh4JJX2+YuoUDxhlTT+
 KZ4l80Hv2P9zK7ugTWz/WbxeGws=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6112bf12b3873958f5ddc330 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 18:01:54
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F38BCC4163F; Tue, 10 Aug 2021 18:01:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C54E3C2E860;
        Tue, 10 Aug 2021 18:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C54E3C2E860
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=pillair@codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        sboyd@kernel.org, mpubbise@codeaurora.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v2 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Tue, 10 Aug 2021 23:31:22 +0530
Message-Id: <1628618483-664-3-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628618483-664-1-git-send-email-pillair@codeaurora.org>
References: <1628618483-664-1-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add WPSS PIL loading support for SC7280 SoCs.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 .../bindings/remoteproc/qcom,hexagon-v56.yaml      | 79 ++++++++++++++++++++--
 1 file changed, 74 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
index 5f3558e..9ae433c6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,qcs404-cdsp-pil
+      - qcom,sc7280-wpss-pil
       - qcom,sdm845-adsp-pil
 
   reg:
@@ -26,25 +27,30 @@ properties:
 
   interrupts-extended:
     minItems: 5
-    maxItems: 5
+    maxItems: 6
 
   interrupt-names:
     minItems: 5
-    maxItems: 5
+    maxItems: 6
 
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
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  power-domain-names:
+    minItems: 1
+    maxItems: 2
 
   resets:
     minItems: 1
@@ -92,6 +98,7 @@ required:
   - clocks
   - clock-names
   - power-domains
+  - power-domain-names
   - qcom,halt-regs
   - memory-region
   - qcom,smem-states
@@ -129,6 +136,31 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sc7280-wpss-pil
+    then:
+      properties:
+        interrupts-extended:
+          items:
+            - description: Watchdog interrupt
+            - description: Fatal interrupt
+            - description: Ready interrupt
+            - description: Handover interrupt
+            - description: Stop acknowledge interrupt
+            - description: Shutdown acknowledge interrupt
+        interrupt-names:
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
@@ -211,6 +243,26 @@ allOf:
         power-domains:
           items:
             - description: CX power domain
+        power-domain-names:
+          items:
+            - const: cx
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7280-wpss-pil
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
 
   - if:
       properties:
@@ -244,6 +296,23 @@ allOf:
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
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.7.4

