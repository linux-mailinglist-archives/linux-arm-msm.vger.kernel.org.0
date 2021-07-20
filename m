Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9033CF369
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 06:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347217AbhGTD5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 23:57:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:24004 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346864AbhGTD4y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 23:56:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626755853; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=cCMxnGPXnUlWg5Wm/Z2bG0pfbepduQ9q/7nKqEhvC1U=; b=LlMdd76kVrPBSQUV303ZO3Dj8Xn9jsw34081owgVLSOXuX4WbQp35FQPJuoBP13oD+ydrk4g
 K0WWgRSgNTcB67OpqAR+8z6xk3tG2tfjEND1Hdl3EXE84ssr0jtk60uFmryi1cZhP05mJeTm
 Re64vwb2eDfMTb2sE4HEEiiag0A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60f6530c56871ded773817a3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 04:37:32
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5013CC433F1; Tue, 20 Jul 2021 04:37:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 614AEC433D3;
        Tue, 20 Jul 2021 04:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 614AEC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     mka@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP property
Date:   Tue, 20 Jul 2021 10:06:36 +0530
Message-Id: <1626755807-11865-3-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The load state power-domain, used by the co-processors to notify the
Always on Subsystem (AOSS) that a particular co-processor is up/down,
suffers from the side-effect of changing states during suspend/resume.
However the co-processors enter low-power modes independent to that of
the application processor and their states are expected to remain
unaltered across system suspend/resume cycles. To achieve this behavior
let's drop the load state power-domain and replace them with the qmp
property for all SoCs supporting low power mode signalling.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v4:
 * Commit message change and sc8180x co-processor addition. [Rob/Bjorn]

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 65 +++++++++++-----------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index c597ccced623..1182afb5f593 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -78,11 +78,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 3
+    maxItems: 2
 
   power-domain-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 2
 
   firmware-name:
     $ref: /schemas/types.yaml#/definitions/string
@@ -92,6 +92,10 @@ properties:
     maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: States used by the AP to signal the Hexagon core
@@ -368,13 +372,11 @@ allOf:
       properties:
         power-domains:
           items:
-            - description: Load State power domain
             - description: CX power domain
             - description: MX power domain
             - description: MSS power domain
         power-domain-names:
           items:
-            - const: load_state
             - const: cx
             - const: mx
             - const: mss
@@ -390,43 +392,20 @@ allOf:
       properties:
         power-domains:
           items:
-            - description: Load State power domain
             - description: CX power domain
-        power-domain-names:
-          items:
-            - const: load_state
-            - const: cx
 
   - if:
       properties:
         compatible:
           contains:
             enum:
+              - qcom,sdx55-mpss-pas
               - qcom,sm8150-mpss-pas
               - qcom,sm8350-mpss-pas
     then:
       properties:
         power-domains:
           items:
-            - description: Load State power domain
-            - description: CX power domain
-            - description: MSS power domain
-        power-domain-names:
-          items:
-            - const: load_state
-            - const: cx
-            - const: mss
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sdx55-mpss-pas
-    then:
-      properties:
-        power-domains:
-          items:
             - description: CX power domain
             - description: MSS power domain
         power-domain-names:
@@ -450,12 +429,10 @@ allOf:
       properties:
         power-domains:
           items:
-            - description: Load State power domain
             - description: LCX power domain
             - description: LMX power domain
         power-domain-names:
           items:
-            - const: load_state
             - const: lcx
             - const: lmx
 
@@ -469,12 +446,10 @@ allOf:
       properties:
         power-domains:
           items:
-            - description: Load State power domain
             - description: CX power domain
             - description: MXC power domain
         power-domain-names:
           items:
-            - const: load_state
             - const: cx
             - const: mxc
 
@@ -510,6 +485,32 @@ allOf:
             - const: mss_restart
             - const: pdc_reset
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-mpss-pas
+              - qcom,sc8180x-adsp-pas
+              - qcom,sc8180x-cdsp-pas
+              - qcom,sc8180x-mpss-pas
+              - qcom,sm8150-adsp-pas
+              - qcom,sm8150-cdsp-pas
+              - qcom,sm8150-mpss-pas
+              - qcom,sm8150-slpi-pas
+              - qcom,sm8250-adsp-pas
+              - qcom,sm8250-cdsp-pas
+              - qcom,sm8250-slpi-pas
+              - qcom,sm8350-adsp-pas
+              - qcom,sm8350-cdsp-pas
+              - qcom,sm8350-mpss-pas
+              - qcom,sm8350-slpi-pas
+    then:
+      properties:
+        qcom,qmp:
+          items:
+            - description: Reference to the AOSS side-channel message RAM.
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmcc.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

