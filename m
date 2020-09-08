Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFF02617E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 19:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731315AbgIHRov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 13:44:51 -0400
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:50790
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726434AbgIHRok (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 13:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599587079;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=efKqBny9Xuy7qd1R1neLKwB6INAiegIZcN0JH6viFMY=;
        b=aS+eyRx+OUIF9TYFoMmzyy1utIeJeQC78FaBRYf9Ag48y6SYeNrHjGkiDXreFx0B
        HP5J3d8kpSaSqOR605aRy82wTdl/LnoIzHFSX/1w0sCHAGXgWkt6aiSaAaslruo0zFd
        rSDlW/Ir28UZYlJXC4JnVKQAL31KbNQi2lCPLdNs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599587079;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=efKqBny9Xuy7qd1R1neLKwB6INAiegIZcN0JH6viFMY=;
        b=Zg1iSEjx1cwIByyfAa+VybFwEU39knGisA7q7vX2PVTRnr344JJ997jsdhHsf74Q
        wgXJC3aeorN8l5MEvz4idpq/3x/y1dwPHVmhhBykodnQ6Kjlni11iW6uiR2HBJfVcEM
        ixCWiDD+acjGcYO48z1Faspe/nef9xxsrc5X/PKI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 97A8CC43387
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
Subject: [PATCH v4 2/5] ASoC: dt-bindings: Add dt binding for lpass hdmi
Date:   Tue, 8 Sep 2020 17:44:39 +0000
Message-ID: <010101746ed1d41a-5890a534-9c2c-4203-bce5-46075d7827da-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599587037-6742-1-git-send-email-srivasam@codeaurora.org>
References: <1599587037-6742-1-git-send-email-srivasam@codeaurora.org>
X-SES-Outgoing: 2020.09.08-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Adds bindings for lpass hdmi interface
which can support audio path over dp.

Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 51 ++++++++++++++++++++--
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index 09c9bd2..7c2ac0c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,lpass-cpu
       - qcom,apq8016-lpass-cpu
       - qcom,sc7180-lpass-cpu
+      - qcom,sc7180-lpass-hdmi
 
   reg:
     maxItems: 1
@@ -60,10 +61,12 @@ properties:
     const: 0
 
 patternProperties:
-  "(^mi2s-[0-9a-f]$|mi2s)":
+  "^dai@[0-9a-f]$":
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
@@ -145,6 +148,22 @@ allOf:
         - iommus
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7180-lpass-hdmi
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: pcnoc-sway-clk
+            - const: audio-core
+            - const: pcnoc-mport-clk
+      required:
+        - iommus
+        - power-domains
+
 examples:
   - |
     #include <dt-bindings/sound/sc7180-lpass.h>
@@ -178,12 +197,36 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
             /* Optional to set different MI2S SD lines */
-            mi2s-primary@0 {
+            dai@mi2s-primary {
                 reg = <MI2S_PRIMARY>;
                 qcom,playback-sd-lines = <1>;
                 qcom,capture-sd-lines = <0>;
             };
         };
+
+        lpassh@62d87000 {
+            compatible = "qcom,sc7180-lpass-hdmi";
+
+            reg = <0 0x62d87000 0 0x68000>;
+
+            iommus = <&apps_smmu 0x1032 0>;
+
+            power-domains = <&lpass_hm 0>;
+
+            clocks = <&gcc 131>,
+                 <&lpasscc 6>,
+                 <&lpasscc 10>;
+
+            clock-names = "pcnoc-sway-clk", "audio-core",
+                          "pcnoc-mport-clk";
+
+            #sound-dai-cells = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            interrupts = <0 268 1>;
+        };
     };
 
 ...
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

