Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55C922964E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 12:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731742AbgGVKgH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 06:36:07 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:47985 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726153AbgGVKgG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 06:36:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595414165; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=JG8mkzVcX0Gg43RaKrfKLGwnFc0DGEkRUtwaONvTcEY=; b=Sd7omPEcDRc6wXKXFP9mx8nbIsKMT69wHBdbs4qRMTjSuMriODZoJQA0FabSfo5v4VO2VsfR
 SwoF03e2Ofl7GE9nrQ64/soiMn6aoCM0I5tzj5/tKhcH9fpwpf5if7ZOEPhUqaEO78Glycw8
 KhqogEjTZAvtmPXASb1Jl1Oys4c=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f18164dcf983e60a873d1a8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Jul 2020 10:34:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A42E6C433A1; Wed, 22 Jul 2020 10:34:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B352C433C6;
        Wed, 22 Jul 2020 10:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B352C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
From:   Rohit kumar <rohitkr@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH v4 12/12] dt-bindings: sound: lpass-cpu: Move to yaml format
Date:   Wed, 22 Jul 2020 16:01:55 +0530
Message-Id: <1595413915-17867-13-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update lpass-cpu binding with yaml formats.

Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 130 ---------------
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 185 +++++++++++++++++++++
 2 files changed, 185 insertions(+), 130 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
deleted file mode 100644
index c21392e..00000000
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
+++ /dev/null
@@ -1,130 +0,0 @@
-* Qualcomm Technologies LPASS CPU DAI
-
-This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
-
-Required properties:
-
-- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
-			  "qcom,lpass-cpu-sc7180"
-- clocks		: Must contain an entry for each entry in clock-names.
-- clock-names		: A list which must include the following entries:
-				* "ahbix-clk"
-				* "mi2s-osr-clk"
-				* "mi2s-bit-clk"
-			: required clocks for "qcom,lpass-cpu-apq8016"
-				* "ahbix-clk"
-				* "mi2s-bit-clk0"
-				* "mi2s-bit-clk1"
-				* "mi2s-bit-clk2"
-				* "mi2s-bit-clk3"
-				* "pcnoc-mport-clk"
-				* "pcnoc-sway-clk"
-			: required clocks for "qcom,lpass-cpu-sc7180"
-				* "audio-core"
-				* "mclk0"
-				* "mi2s-bit-clk0"
-				* "mi2s-bit-clk1"
-				* "pcnoc-sway-clk"
-				* "pcnoc-mport-clk"
-
-- interrupts		: Must contain an entry for each entry in
-			  interrupt-names.
-- interrupt-names	: A list which must include the following entries:
-				* "lpass-irq-lpaif"
-- pinctrl-N		: One property must exist for each entry in
-			  pinctrl-names.  See ../pinctrl/pinctrl-bindings.txt
-			  for details of the property values.
-- pinctrl-names		: Must contain a "default" entry.
-- reg			: Must contain an address for each entry in reg-names.
-- reg-names		: A list which must include the following entries:
-				* "lpass-lpaif"
-- #address-cells	: Must be 1
-- #size-cells		: Must be 0
-
-
-
-Optional properties:
-
-- qcom,adsp		: Phandle for the audio DSP node
-
-By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
-The SD lines to use can be configured by adding subnodes for each of the DAIs.
-
-Required properties for each DAI (represented by a subnode):
-- reg			: Must be one of the DAI IDs
-			  (usually part of dt-bindings header)
-- qcom,playback-sd-lines: List of serial data lines to use for playback
-			  Each SD line should be represented by a number from 0-3.
-- qcom,capture-sd-lines	: List of serial data lines to use for capture
-			  Each SD line should be represented by a number from 0-3.
-
-Note that adding a subnode changes the default to "no lines configured",
-so both playback and capture lines should be configured when a subnode is added.
-
-Examples:
-1)
-
-lpass@28100000 {
-	compatible = "qcom,lpass-cpu";
-	clocks = <&lcc AHBIX_CLK>, <&lcc MI2S_OSR_CLK>, <&lcc MI2S_BIT_CLK>;
-	clock-names = "ahbix-clk", "mi2s-osr-clk", "mi2s-bit-clk";
-	interrupts = <0 85 1>;
-	interrupt-names = "lpass-irq-lpaif";
-	pinctrl-names = "default", "idle";
-	pinctrl-0 = <&mi2s_default>;
-	pinctrl-1 = <&mi2s_idle>;
-	reg = <0x28100000 0x10000>;
-	reg-names = "lpass-lpaif";
-	qcom,adsp = <&adsp>;
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	/* Optional to set different MI2S SD lines */
-	dai@3 {
-		reg = <MI2S_QUATERNARY>;
-		qcom,playback-sd-lines = <0 1>;
-	};
-};
-
-2)
-
-#include <dt-bindings/sound/sc7180-lpass.h>
-
-lpass_cpu: lpass {
-	compatible = "qcom,lpass-cpu-sc7180";
-
-	reg = <0 0x62F00000 0 0x29000>;
-
-	iommus = <&apps_smmu 0x1020 0>;
-
-	power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
-	clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
-		<&lpasscorecc LPASS_AUDIO_CORE_CORE_CLK>,
-		<&lpasscorecc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
-		<&lpasscorecc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
-		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
-		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
-	clock-names = "pcnoc-sway-clk", "audio-core",
-			"mclk0", "pcnoc-mport-clk",
-			"mi2s-bit-clk0", "mi2s-bit-clk1";
-	interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "lpass-irq-lpaif";
-
-
-	#sound-dai-cells = <1>;
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	mi2s-primary@0 {
-		reg = <MI2S_PRIMARY>;
-		qcom,playback-sd-lines = <1>;
-		qcom,capture-sd-lines = <0>;
-	};
-
-	mi2s-secondary@1 {
-		reg = <MI2S_SECONDARY>;
-		qcom,playback-sd-lines = <0>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
new file mode 100644
index 00000000..03c598f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -0,0 +1,185 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS CPU dai driver bindings
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+  - Rohit kumar <rohitkr@codeaurora.org>
+
+description: |
+  Qualcomm SOC Low-Power Audio SubSystem (LPASS) that consist of MI2S interface
+  for audio data transfer on external codecs. LPASS cpu driver is a module to
+  configure Low-Power Audio Interface(LPAIF) core registers across different
+  IP versions.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,lpass-cpu
+        description: For IPQ806x
+
+      - const: qcom,apq8016-lpass-cpu
+        description: For APQ8016
+
+      - const: qcom,lpass-cpu-sc7180
+        description: For SC7180
+
+  reg:
+    maxItems: 1
+    description: LPAIF core registers
+
+  clocks:
+    minItems: 3
+    maxItems: 6
+
+  clock-names:
+    minItems: 3
+    maxItems: 6
+
+  interrupts:
+    maxItems: 1
+    description: LPAIF DMA buffer interrupt
+
+  qcom,adsp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle for the audio DSP node
+
+  iommus:
+    maxItems: 1
+    description: Phandle to apps_smmu node with sid mask
+
+  power-domains:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
+patternProperties:
+  "(^mi2s-[0-9a-f]$|mi2s)":
+    type: object
+    description: Required properties for each DAI
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Must be one of the DAI ID
+
+    required:
+      - reg
+
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - '#sound-dai-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,lpass-cpu-sc7180
+
+    then:
+      required:
+        - iommus
+        - power-domains
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,lpass-cpu
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: ahbix-clk
+            - const: mi2s-osr-clk
+            - const: mi2s-bit-clk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,apq8016-lpass-cpu
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: ahbix-clk
+            - const: mi2s-bit-clk0
+            - const: mi2s-bit-clk1
+            - const: mi2s-bit-clk2
+            - const: mi2s-bit-clk3
+            - const: pcnoc-mport-clk
+            - const: pcnoc-sway-clk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,lpass-cpu-sc7180
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: pcnoc-sway-clk
+            - const: audio-core
+            - const: mclk0
+            - const: pcnoc-mport-clk
+            - const: mi2s-bit-clk0
+            - const: mi2s-bit-clk1
+
+examples:
+  - |
+    #include <dt-bindings/sound/sc7180-lpass.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        lpass@62f00000 {
+            compatible = "qcom,lpass-cpu-sc7180";
+
+            reg = <0 0x62f00000  0 0x29000>;
+
+            iommus = <&apps_smmu 0x1020 0>;
+            power-domains = <&lpass_hm 0>;
+
+            clocks = <&gcc 131>,
+                 <&lpasscorecc 6>,
+                 <&lpasscorecc 7>,
+                 <&lpasscorecc 10>,
+                 <&lpasscorecc 8>,
+                 <&lpasscorecc 9>;
+
+            clock-names = "pcnoc-sway-clk", "audio-core",
+                          "mclk0", "pcnoc-mport-clk",
+                          "mi2s-bit-clk0", "mi2s-bit-clk1";
+
+            interrupts = <0 160 1>;
+
+            #sound-dai-cells = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+            /* Optional to set different MI2S SD lines */
+            mi2s-primary@0 {
+                reg = <MI2S_PRIMARY>;
+                qcom,playback-sd-lines = <1>;
+                qcom,capture-sd-lines = <0>;
+            };
+        };
+    };
+
+...
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

