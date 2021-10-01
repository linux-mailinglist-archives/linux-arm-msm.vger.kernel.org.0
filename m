Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECF641EBB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 13:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353847AbhJALYm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 07:24:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:21301 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353806AbhJALYi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 07:24:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633087374; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=9JXwk9Y4rZybwNR3znacc9RiHClix2j/6JV51CRVOac=; b=vuIn4tzih0Cn5Od7XlcukNtRVdRazR5cD7fIgf9hVM/iDF4l/8kHv5z+E679LZOyqTQiPgIu
 zDtnyf7GQPbVh5NBTSTJXjEN/T01rYOiX59hFPKWroxxkvJK2rvt/lO7Ml4wugChLsuP4ZD3
 L6vSAttxdvuQgljeY1nEZXmXI38=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6156ef73605ecf100ba0726e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 11:22:27
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 28EA6C43637; Fri,  1 Oct 2021 11:22:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E7ABC4338F;
        Fri,  1 Oct 2021 11:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8E7ABC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: [PATCH 6/8] ASoC: dt-bindings: Add SC7280 sound card bindings
Date:   Fri,  1 Oct 2021 16:51:30 +0530
Message-Id: <1633087292-1378-7-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
References: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for lpass sc7280 based soundcards which supports
audio over i2s based speaker, soundwire based headset, msm dmics
and HDMI Port.

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 69 +++++++++++++++++++---
 1 file changed, 61 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index 1e23c0e..6840533 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -22,35 +22,36 @@ properties:
       - qcom,lpass-cpu
       - qcom,apq8016-lpass-cpu
       - qcom,sc7180-lpass-cpu
+      - qcom,sc7280-lpass-cpu
 
   reg:
-    maxItems: 2
+    maxItems: 5
     description: LPAIF core registers
 
   reg-names:
-    maxItems: 2
+    maxItems: 5
 
   clocks:
     minItems: 3
-    maxItems: 6
+    maxItems: 7
 
   clock-names:
     minItems: 3
-    maxItems: 6
+    maxItems: 7
 
   interrupts:
-    maxItems: 2
+    maxItems: 4
     description: LPAIF DMA buffer interrupt
 
   interrupt-names:
-    maxItems: 2
+    maxItems: 4
 
   qcom,adsp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Phandle for the audio DSP node
 
   iommus:
-    maxItems: 2
+    maxItems: 3
     description: Phandle to apps_smmu node with sid mask
 
   power-domains:
@@ -69,7 +70,7 @@ patternProperties:
   "^dai-link@[0-9a-f]$":
     type: object
     description: |
-      LPASS CPU dai node for each I2S device. Bindings of each node
+      LPASS CPU dai node for each I2S device or Soundwire device. Bindings of each node
       depends on the specific driver providing the functionality and
       properties.
     properties:
@@ -174,6 +175,58 @@ allOf:
         - iommus
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-lpass-cpu
+
+    then:
+      properties:
+        clock-names:
+          oneOf:
+            - items:   #for I2S
+                - const: lpass_aon_cc_audio_hm_h_clk
+                - const: lpass_core_cc_sysnoc_mport_core_clk
+                - const: lpass_core_cc_ext_if1_ibit_clk
+            - items:   #for Soundwire
+                - const: lpass_aon_cc_audio_hm_h_clk
+                - const: lpass_audio_cc_codec_mem0_clk
+                - const: lpass_audio_cc_codec_mem1_clk
+                - const: lpass_audio_cc_codec_mem2_clk
+            - items:   #for HDMI
+                - const: lpass_aon_cc_audio_hm_h_clk
+
+        reg-names:
+          anyOf:
+            - items:   #for I2S
+                - const: lpass-lpaif
+            - items:   #for I2S and HDMI
+                - const: lpass-hdmiif
+                - const: lpass-lpaif
+            - items:   #for I2S, soundwire and HDMI
+                - const: lpass-cdc-lpm
+                - const: lpass-rxtx-lpaif
+                - const: lpass-va-lpaif
+                - const: lpass-hdmiif
+                - const: lpass-lpaif
+        interrupt-names:
+          anyOf:
+            - items:   #for I2S
+                - const: lpass-irq-lpaif
+            - items:   #for I2S and HDMI
+                - const: lpass-irq-lpaif
+                - const: lpass-irq-hdmi
+            - items:   #for I2S, soundwire and HDMI
+                - const: lpass-irq-lpaif
+                - lpass-irq-vaif
+                - lpass-irq-rxtxif
+                - lpass-irq-hdmi
+
+      required:
+        - iommus
+        - power-domains
+
 examples:
   - |
     #include <dt-bindings/sound/sc7180-lpass.h>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

