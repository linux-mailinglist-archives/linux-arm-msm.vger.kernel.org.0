Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A56B26DE5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 16:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbgIQOhJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 10:37:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:21464 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727472AbgIQOg7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 10:36:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600353362; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=gPyLpnk35md75z42y0gXvz/xNdSmi34X9M0nhz3DYJ8=; b=roRsKVMJ2blRhD4Xo8CSxXgGbLWmz2ZqTs8uVBoVzgX7ZHdu3jMV+dD73aIre2KIjmFH/nsK
 rgYHOcdQK1RFy1MgwV19msiEHG+oi07Lb2j+MVxxWhVST0wADEeceTP4LwEDO5qQZikmoQlH
 9oX1G3BpWqK4LmYO598ZfKRFSp8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f6366a591755cb92b39744d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 13:37:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4FE8EC433CA; Thu, 17 Sep 2020 13:37:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 214B4C433FE;
        Thu, 17 Sep 2020 13:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 214B4C433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao <srivasam@codeaurora.org>
Subject: [PATCH v5 2/5] ASoC: dt-bindings: Add dt binding for lpass hdmi
Date:   Thu, 17 Sep 2020 19:07:05 +0530
Message-Id: <1600349828-10727-3-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600349828-10727-1-git-send-email-srivasam@codeaurora.org>
References: <1600349828-10727-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Adds bindings for lpass hdmi interface
which can support audio path over dp.

Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 74 +++++++++++++++-------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index 09c9bd2..f95ef70 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -24,9 +24,10 @@ properties:
       - qcom,sc7180-lpass-cpu
 
   reg:
-    maxItems: 1
+    maxItems: 2
     description: LPAIF core registers
-
+  reg-names:
+     maxItems: 2
   clocks:
     minItems: 3
     maxItems: 6
@@ -36,15 +37,16 @@ properties:
     maxItems: 6
 
   interrupts:
-    maxItems: 1
+    maxItems: 2
     description: LPAIF DMA buffer interrupt
-
+  interrupt-names:
+    maxItems: 2
   qcom,adsp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Phandle for the audio DSP node
 
   iommus:
-    maxItems: 1
+    maxItems: 2
     description: Phandle to apps_smmu node with sid mask
 
   power-domains:
@@ -60,10 +62,12 @@ properties:
     const: 0
 
 patternProperties:
-  "(^mi2s-[0-9a-f]$|mi2s)":
+  "^dai-link@[0-9a-f]$":
     type: object
-    description: Required properties for each DAI
-
+    description: |
+      LPASS CPU dai node for each I2S device. Bindings of each node
+      depends on the specific driver providing the functionality and
+      properties.
     properties:
       reg:
         maxItems: 1
@@ -85,9 +89,11 @@ patternProperties:
 required:
   - compatible
   - reg
+  - reg-names
   - clocks
   - clock-names
   - interrupts
+  - interrupt-names
   - '#sound-dai-cells'
 
 additionalProperties: false
@@ -134,13 +140,32 @@ allOf:
     then:
       properties:
         clock-names:
-          items:
-            - const: pcnoc-sway-clk
-            - const: audio-core
-            - const: mclk0
-            - const: pcnoc-mport-clk
-            - const: mi2s-bit-clk0
-            - const: mi2s-bit-clk1
+          oneOf:
+           - items:   #for I2S
+              - const: pcnoc-sway-clk
+              - const: audio-core
+              - const: mclk0
+              - const: pcnoc-mport-clk
+              - const: mi2s-bit-clk0
+              - const: mi2s-bit-clk1
+           - items:   #for HDMI
+              - const: pcnoc-sway-clk
+              - const: audio-core
+              - const: pcnoc-mport-clk
+        reg-names:
+          anyOf:
+            - items:   #for I2S and HDMI
+              - const: lpass-hdmiif
+              - const: lpass-lpaif
+            - items:   #for I2S
+              - const: lpass-lpaif
+        interrupt-names:
+          anyOf:
+            - items:   #for I2S and HDMI
+              - const: lpass-irq-lpaif
+              - const: lpass-irq-hdmi
+            - items:   #for I2S
+              - const: lpass-irq-lpaif
       required:
         - iommus
         - power-domains
@@ -152,12 +177,15 @@ examples:
     soc {
         #address-cells = <2>;
         #size-cells = <2>;
-        lpass@62f00000 {
+        lpass@62d80000 {
             compatible = "qcom,sc7180-lpass-cpu";
 
-            reg = <0 0x62f00000  0 0x29000>;
-
-            iommus = <&apps_smmu 0x1020 0>;
+            reg = <0 0x62d87000 0 0x68000>,
+                  <0 0x62f00000 0 0x29000>;
+            reg-names = "lpass-hdmiif",
+                        "lpass-lpaif";
+            iommus = <&apps_smmu 0x1020 0>,
+                     <&apps_smmu 0x1032 0>;
             power-domains = <&lpass_hm 0>;
 
             clocks = <&gcc 131>,
@@ -171,14 +199,16 @@ examples:
                           "mclk0", "pcnoc-mport-clk",
                           "mi2s-bit-clk0", "mi2s-bit-clk1";
 
-            interrupts = <0 160 1>;
-
+            interrupts = <0 160 1>,
+                         <0 268 1>;
+            interrupt-names = "lpass-irq-lpaif",
+                              "lpass-irq-hdmi";
             #sound-dai-cells = <1>;
 
             #address-cells = <1>;
             #size-cells = <0>;
             /* Optional to set different MI2S SD lines */
-            mi2s-primary@0 {
+            dai-link@0 {
                 reg = <MI2S_PRIMARY>;
                 qcom,playback-sd-lines = <1>;
                 qcom,capture-sd-lines = <0>;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

