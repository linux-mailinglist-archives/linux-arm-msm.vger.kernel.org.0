Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE4C217EE6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 07:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729639AbgGHFJw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 01:09:52 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35317 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729296AbgGHFJw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 01:09:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594184991; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=3Ch8WSA1B/4jOFB5bA7AVNVE1HX8i9OvLQvCMnXDHgo=; b=NsC7wOZNeiI/T8VZ3AZg/qrvisju0IKHDGYPuBE60tdtEdbyWw/RUeLewXcI/VQkwdzZ8eui
 v6tVES5ustMQ8uR8HyBuofQFV2XBo4GLjdK2JkB2EuUAGuC1JLaAfNPp993IM+M92tywfP2j
 K1pMuqjdM9CH55B7GQNHVgPaLyw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5f0555069b7f1f3df742d24d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Jul 2020 05:09:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB87AC4344B; Wed,  8 Jul 2020 05:09:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rohkumar-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0208CC433C6;
        Wed,  8 Jul 2020 05:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0208CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
From:   Rohit kumar <rohitkr@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH v3 8/8] dt-bindings: sound: lpass-cpu: Move to yaml format
Date:   Wed,  8 Jul 2020 10:38:16 +0530
Message-Id: <1594184896-10629-9-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ajit Pandey <ajitp@codeaurora.org>

Update lpass-cpu binding with yaml formats.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.txt   |  80 -----------
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 154 +++++++++++++++++++++
 2 files changed, 154 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
deleted file mode 100644
index 04e34cc..00000000
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
+++ /dev/null
@@ -1,80 +0,0 @@
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
-Example:
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
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
new file mode 100644
index 00000000..9c350bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -0,0 +1,154 @@
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
+description:
+  Qualcomm SOC Low-Power Audio SubSystem (LPASS) that consist of MI2S interface
+  for audio data transfer on external codecs. LPASS cpu driver is a module to
+  configure Low-Power Audio Interface(LPAIF) core registers across different
+  IP versions.
+
+properties:
+  compatible:
+    enum:
+      - qcom,lpass-cpu
+      - qcom,apq8016-lpass-cpu
+      - qcom,lpass-cpu-sc7180
+
+  reg:
+    items:
+      - description: LPAIF core registers
+
+  reg-names:
+    items:
+      - const: lpass-lpaif
+
+  clocks:
+    items:
+      - description: AHBIX core clock
+      - description: oscillator clock for MI2S external interfaces
+      - description: Bit clock for single MI2S dai
+      - description: Bit clock for MI2S_PRIMARY dai interface
+      - description: Bit clock for MI2S_SECONDARY dai interface
+      - description: Bit clock for MI2S_TERTIARY dai interface
+      - description: Bit clock for MI2S_QUATERNARY dai interface
+      - description: NOC MPORT clock of LPASS core
+      - description: NOC SWAY clock of LPASS core
+
+  clock-names:
+    items:
+      - const: ahbix-clk
+      - const: mi2s-osr-clk
+      - const: mi2s-bit-clk
+      - const: mi2s-bit-clk0
+      - const: mi2s-bit-clk1
+      - const: mi2s-bit-clk2
+      - const: mi2s-bit-clk3
+      - const: pcnoc-mport-clk
+      - const: pcnoc-sway-clk
+
+  interrupts:
+    items:
+      - description: LPAIF DMA buffer interrupt
+
+  interrupt-names:
+    items:
+      - const: lpass-irq-lpaif
+
+  qcom,adsp:
+    maxItems: 1
+    description: Phandle for the audio DSP node
+
+  iommus:
+    maxItems: 1
+    description: Phandle to apps_smmu node with sid mask
+
+  power-domains:
+    maxItems: 1
+    description: Phandle for power domain node
+
+  '#sound-dai-cells':
+    const: 1
+
+  child-node:
+    description: Required properties for each DAI
+    type: object
+    properties:
+      reg:
+        description: Must be one of the DAI ID
+                     (Usually part of dtbindings header)
+      qcom,playback-sd-lines:
+        description: List of serial data lines to use for playback
+                     Each SD line should be represented by a number from 0-3.
+      qcom,capture-sd-lines :
+        description: List of serial data lines to use for capture
+                     Each SD line should be represented by a number from 0-3.
+    required:
+      -reg
+    # Note that adding a subnode changes the default to "no lines configured",
+    # so both playback and capture lines should be configured when a subnode
+    # is added.
+
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - sound-dai-cells
+
+optional:
+  - qcom,adsp
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: qcom,lpass-cpu-sc7180
+
+then:
+  required:
+    - iommus
+    - power-domains
+
+examples:
+  lpass@28100000 {
+	compatible = "qcom,lpass-cpu";
+	clocks = <&lcc AHBIX_CLK>,
+		 <&lcc MI2S_OSR_CLK>,
+		 <&lcc MI2S_BIT_CLK>;
+
+	clock-names = "ahbix-clk",
+		      "mi2s-osr-clk",
+		      "mi2s-bit-clk";
+
+	interrupts = <0 85 1>;
+        interrupt-names = "lpass-irq-lpaif";
+
+	iommus = <&apps_smmu 0x1020 0>;
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
+
+	reg = <0x28100000 0x10000>;
+	reg-names = "lpass-lpaif";
+	#sound-dai-cells = <1>;
+	qcom,adsp = <&adsp>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* Optional to set different MI2S SD lines */
+	mi2s-quaternary@3 {
+		reg = <MI2S_QUATERNARY>;
+		qcom,playback-sd-lines = <0 1>;
+  };
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

