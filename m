Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11F54665F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 15:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358776AbhLBPAk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:00:40 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.171]:34149 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358673AbhLBPAj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:00:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638457027;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=69VoTyRpLpO98sh4C/ClvwoFOzZ+d0nmfaiGQQ9Sibo=;
    b=EaAZlmJPYhudVE2y+Py5PqORCJot2A2dYFSqIx0xSOPDwntGG7owYNNGVZL/249u8t
    zFwBQn3uH7phEnWIvbmT5ZP/MT2d+nEVaU1AGMzewqLmKKl6NjiZV0sSJC54siaukhQk
    k+1RFLkLxQ7FCm7tTSVV9/Bs3ALH/hVX1vjZNG4lv3D3WhwGHi0X6Z/LtxlPHuddFUjl
    LJGjya29oxL8IuhxN6ZQveFw1fpaZzFu5vDViNcqHO7J/HiLc3EaPNspRmCf7/WHYbqy
    WrWa2EYV1Dyv+446EBPT+DsysTYh4UnltU7wRopqlqh++ID1HckBG7woa1rvbY1Ri8Da
    ZHHw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyLyu9s="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.34.10 AUTH)
    with ESMTPSA id j03bcbxB2Ev6pxy
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 2 Dec 2021 15:57:06 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/5] ASoC: dt-bindings: qcom: apq8016-sbc: Move to qcom,sm8250 DT schema
Date:   Thu,  2 Dec 2021 15:55:03 +0100
Message-Id: <20211202145505.58852-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211202145505.58852-1-stephan@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All the Qualcomm sound card drivers use the same common device tree
parsing code, so the allowed device tree nodes are almost the same
for all of them. Convert the qcom,apq8016-sbc-sndcard documentation
to a DT schema by adding it to the existing qcom,sm8250 schema.

The only speciality of qcom,apq8016-sbc-sndcard is that it has memory
resources for setting up an I/O mux. This can be handled using
a conditional if statement that only requires it for the apq8016-sbc
compatible.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Note: There will be a dtbs_check warning caused by this, because the
recommended naming for nodes is different in this DT schema (-dai-link
suffix). I will address this in a separate patch if this series is
accepted, simply by changing apq8016-sbc.dts to the example added
in this patch. The driver itself accepts any naming for those nodes.
---
 .../bindings/sound/qcom,apq8016-sbc.txt       | 96 -------------------
 .../bindings/sound/qcom,sm8250.yaml           | 83 +++++++++++++++-
 2 files changed, 81 insertions(+), 98 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
deleted file mode 100644
index 23998262a0a7..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
+++ /dev/null
@@ -1,96 +0,0 @@
-* Qualcomm Technologies APQ8016 SBC ASoC machine driver
-
-This node models the Qualcomm Technologies APQ8016 SBC ASoC machine driver
-
-Required properties:
-
-- compatible		: "qcom,apq8016-sbc-sndcard"
-
-- pinctrl-N		: One property must exist for each entry in
-			  pinctrl-names.  See ../pinctrl/pinctrl-bindings.txt
-			  for details of the property values.
-- pinctrl-names		: Must contain a "default" entry.
-- reg			: Must contain an address for each entry in reg-names.
-- reg-names		: A list which must include the following entries:
-				* "mic-iomux"
-				* "spkr-iomux"
-- qcom,model		: Name of the sound card.
-
-- qcom,audio-routing	: A list of the connections between audio components.
-			  Each entry is a pair of strings, the first being the
-			  connection's sink, the second being the connection's
-			  source. Valid names could be power supplies, MicBias
-			  of msm8x16_wcd codec and the jacks on the board:
-
-			  Power supplies:
-			  * MIC BIAS External1
-			  * MIC BIAS External2
-			  * MIC BIAS Internal1
-			  * MIC BIAS Internal2
-
-			  Board connectors:
-			  * Headset Mic
-			  * Secondary Mic
-			  * DMIC
-			  * Ext Spk
-
-Optional properties:
-
-- aux-devs		: A list of phandles for auxiliary devices (e.g. analog
-			  amplifiers) that do not appear directly within the DAI
-			  links. Should be connected to another audio component
-			  using "qcom,audio-routing".
-
-Dai-link subnode properties and subnodes:
-
-Required dai-link subnodes:
-
-- cpu					: CPU   sub-node
-- codec					: CODEC sub-node
-
-Required CPU/CODEC subnodes properties:
-
--link-name		: Name of the dai link.
--sound-dai		: phandle/s and port of CPU/CODEC
-
-Example:
-
-sound: sound {
-	compatible = "qcom,apq8016-sbc-sndcard";
-	reg = <0x07702000 0x4>, <0x07702004 0x4>;
-	reg-names = "mic-iomux", "spkr-iomux";
-	qcom,model = "DB410c";
-
-	qcom,audio-routing =
-		"MIC BIAS External1", "Handset Mic",
-		"MIC BIAS Internal2", "Headset Mic",
-		"MIC BIAS External1", "Secondary Mic",
-		"AMIC1", "MIC BIAS External1",
-		"AMIC2", "MIC BIAS Internal2",
-		"AMIC3", "MIC BIAS External1",
-		"DMIC1", "MIC BIAS Internal1",
-		"MIC BIAS Internal1", "Digital Mic1",
-		"DMIC2", "MIC BIAS Internal1",
-		"MIC BIAS Internal1", "Digital Mic2";
-
-	/* I2S - Internal codec */
-	internal-dai-link@0 {
-		cpu { /* PRIMARY */
-			sound-dai = <&lpass MI2S_PRIMARY>;
-		};
-		codec {
-			sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
-		};
-	};
-
-	/* External Primary or External Secondary -ADV7533 HDMI */
-	external-dai-link@0 {
-		link-name = "ADV7533";
-		cpu { /* QUAT */
-			sound-dai = <&lpass MI2S_QUATERNARY>;
-		};
-		codec {
-			sound-dai = <&adv_bridge 0>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 3123382297b8..97f13a0a71a9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -4,18 +4,19 @@
 $id: http://devicetree.org/schemas/sound/qcom,sm8250.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Technologies Inc. SM8250 ASoC sound card driver
+title: Qualcomm Technologies Inc. ASoC sound card drivers
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description:
-  This bindings describes SC8250 SoC based sound cards
+  This bindings describes Qualcomm SoC based sound cards
   which uses LPASS internal codec for audio.
 
 properties:
   compatible:
     enum:
+      - qcom,apq8016-sbc-sndcard
       - qcom,sm8250-sndcard
       - qcom,qrb5165-rb5-sndcard
 
@@ -37,6 +38,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description: User visible long sound card name
 
+  # Only valid for some compatibles (see allOf if below)
+  reg: true
+  reg-names: true
+
 patternProperties:
   ".*-dai-link$":
     description:
@@ -79,6 +84,33 @@ required:
   - compatible
   - model
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apq8016-sbc-sndcard
+    then:
+      properties:
+        reg:
+          items:
+            - description: Microphone I/O mux register address
+            - description: Speaker I/O mux register address
+        reg-names:
+          items:
+            - const: mic-iomux
+            - const: spkr-iomux
+      required:
+        - compatible
+        - model
+        - reg
+        - reg-names
+    else:
+      properties:
+        reg: false
+        reg-names: false
+
 additionalProperties: false
 
 examples:
@@ -160,3 +192,50 @@ examples:
             };
         };
     };
+
+  - |
+    #include <dt-bindings/sound/qcom,lpass.h>
+    sound@7702000 {
+        compatible = "qcom,apq8016-sbc-sndcard";
+        reg = <0x07702000 0x4>, <0x07702004 0x4>;
+        reg-names = "mic-iomux", "spkr-iomux";
+
+        model = "DB410c";
+        audio-routing =
+            "AMIC2", "MIC BIAS Internal2",
+            "AMIC3", "MIC BIAS External1";
+
+        pinctrl-0 = <&cdc_pdm_lines_act &ext_sec_tlmm_lines_act &ext_mclk_tlmm_lines_act>;
+        pinctrl-1 = <&cdc_pdm_lines_sus &ext_sec_tlmm_lines_sus &ext_mclk_tlmm_lines_sus>;
+        pinctrl-names = "default", "sleep";
+
+        quaternary-dai-link {
+            link-name = "ADV7533";
+            cpu {
+                sound-dai = <&lpass MI2S_QUATERNARY>;
+            };
+            codec {
+                sound-dai = <&adv_bridge 0>;
+            };
+        };
+
+        primary-dai-link {
+            link-name = "WCD";
+            cpu {
+                sound-dai = <&lpass MI2S_PRIMARY>;
+            };
+            codec {
+                sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
+            };
+        };
+
+        tertiary-dai-link {
+            link-name = "WCD-Capture";
+            cpu {
+                sound-dai = <&lpass MI2S_TERTIARY>;
+            };
+            codec {
+                sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
+            };
+        };
+    };
-- 
2.34.1

