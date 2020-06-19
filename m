Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A27201B67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 21:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389291AbgFSTii (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 15:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389188AbgFSTig (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 15:38:36 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A39C0613EE
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 12:38:36 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id m21so8447717eds.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 12:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bc0EZxqMpmZISM9ElvK31kDmIBAq3+rxrtnJno+BjDo=;
        b=ZDgMz5JHq+KMJ8D4IkLan1p9yralYLWSuyfLbSRg7MnOT7B7Ya2MbNLRCTVtCpeD5m
         f5z+mVEtC60dqznIjyt+A3T5fsxB+I837FIZ3euRgNXQURbE5mQw9NqeYNKf+Mcb68M5
         vuH1rUIIJ0rjl5qtI7FAMcveYWIPkdhoXRnPR1N5it1DZymsrKKgxEd0dSJ0CphaG9X9
         WGRTAHkEm8nkVNXyHfv2UFc32y7KGd+KtmeQy/MDbGAZtakzb8KbYApjJqugZitejrWn
         6fWKiru8COt0gdTvGPi3NtubmuAeTLUZNE09SL31ootTo5Ndz1ygmeN2muRSs5sNh8fy
         J2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bc0EZxqMpmZISM9ElvK31kDmIBAq3+rxrtnJno+BjDo=;
        b=n6UNmxXqhda+hkbOtXuPqPapZIMYVjzaEX3mqoTPcFVbI6Wgs623wSc/bjTCmRY081
         NOYuQ0tH+shjcbYej5c+N/PELkRwSzzD2WwInmspRJU9BTzRFVn8ALq9gqgueJdYzH63
         ZWWeT3GU8f1WqMP+vNXTQS9vN1iNClH0Q+IZcBlII3tnZxfrHdMsJeycfXPutgxvPTR+
         YUwQ23pstG+oqKBTWpL/9wonJ039gJVaYDmQdqillty33NP+yknLWqJGxYhxWf+qcCUr
         +2qLVN79U9wnAgVesVc79ksZCZoPT368IVT5U5OMeLykwZlHg6ak6uNZZMWofocngNU/
         z6zw==
X-Gm-Message-State: AOAM533Yqd6oQKgdNYzGqkrojDDkTrQCbaiP9QB+Ymb4EVO+ygIxQeZp
        5sQIK7BR6AqsBwhGcJo/wfzRxQ==
X-Google-Smtp-Source: ABdhPJwETwzXw3t4hMwGhGSWNIOoesMalaqKKfHu8tftFEuHS9GRq18br4h+VfQ2WXMhAy6erVDFHg==
X-Received: by 2002:a50:fc0d:: with SMTP id i13mr4875035edr.260.1592595514953;
        Fri, 19 Jun 2020 12:38:34 -0700 (PDT)
Received: from localhost.localdomain (ppp089210109128.access.hol.gr. [89.210.109.128])
        by smtp.gmail.com with ESMTPSA id dn17sm5310125edb.26.2020.06.19.12.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 12:38:34 -0700 (PDT)
From:   Pantelis Antoniou <pantelis.antoniou@linaro.org>
To:     alsa-devel@alsa-project.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Matt Porter <mporter@konsulko.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the apq8039 sound complex
Date:   Fri, 19 Jun 2020 22:38:30 +0300
Message-Id: <20200619193831.12528-2-pantelis.antoniou@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a yaml device binding for the QCOM apq8039 sound complex driver.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@linaro.org>
---
 .../bindings/sound/qcom,apq8039.yaml          | 370 ++++++++++++++++++
 1 file changed, 370 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8039.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8039.yaml b/Documentation/devicetree/bindings/sound/qcom,apq8039.yaml
new file mode 100644
index 000000000000..f1c4fb99ccbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,apq8039.yaml
@@ -0,0 +1,370 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,apq8039.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies APQ8039 ASoC sound card
+
+maintainers:
+  - Pantelis Antoniou <pantelis.antoniou@linaro.org>
+
+properties:
+  compatible:
+    items:
+      - const: qcom,apq8039-sndcard
+
+  pinctrl-0:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      Should specify pin control groups used for this controller matching
+      the first entry in pinctrl-names.
+
+  pinctrl-1:
+    description: |
+      Should specify pin control groups used for this controller matching
+      the second entry in pinctrl-names.
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+    description:
+      Names for the pin configuration(s); may be "default" or "sleep",
+      where the "sleep" configuration may describe the state
+      the pins should be in during system suspend.
+
+  reg:
+    description: Must contain an address for each entry in "reg-names".
+    minItems: 2
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: mic-iomux
+      - const: spkr-iomux
+
+  qcom,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of the sound complex.
+
+  qcom,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      List of the connections between audio components;  each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source; valid names could be power supplies
+      and MicBias of msm8916-analoc-wcd codec.
+
+  function-definition:
+    type: object
+    description: |
+      Functional configuration for the sound complex via a
+      simple control. allows fixed and dynamically constructed
+      function selection.
+
+    properties:
+      mixer-control:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: |
+          Name of the exported alsa mix control.
+
+      function-list:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: |
+          phandle(s) of the functions which the sound complex
+          exposes via the control.
+
+      system-list:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: |
+          phandle(s) of the default, init and shutdown functions
+          Must be one of the declared ones in the function property.
+          The default function is the one selected by default on
+          startup (after the init function's sequence is executed).
+          On shutdown the shutdown function sequence will be executed.
+          Typically init and shutdown are the same and it's purpose
+          is to initialize the sound complex mixer controls to the
+          all off state, and be ready for a regular function selection.
+
+    patternProperties:
+      "^[A-Za-z_][A-Aa-z0-9_]*$":
+        type: object
+        description:
+          Function description subnodes. The name of the function
+          is simply the name of the subnode, so restrictions apply
+          to the valid node names.
+
+          The function definition of each subnode is either a cooked
+          function (i.e. which is not dependent on state inputs), or
+          a function that is selecting a cooked function based on the
+          state inputs and the generated state vector.
+
+        oneOf:
+          # non-cooked function
+          - properties:
+              enable:
+                $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+                description: |
+                  Sequence of alsa mixer controls to apply when this state is to
+                  be enabled.
+
+              disable:
+                $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+                description: |
+                  Sequence of alsa mixer controls to apply when this state is to
+                  be disabled.
+
+            required:
+              - enable
+
+          # cooked function
+          - properties:
+              state-inputs:
+                description: |
+                  A list of state inputs to be used in constructing a state
+                  vector.
+                type: array
+                uniqueItems: true
+                minItems: 1
+                items:
+                  anyOf:
+                    - const: JACK_HEADPHONE
+                    - const: JACK_MICROPHONE
+
+              state-input-bits:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                description: |
+                  Number of bits to use for each state-input in the
+                  state vector creation. For now only the value 1 is
+                  supported for JACK_HEADPHONE and JACK_MICROPHONE.
+
+              state-input-defaults:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                description: |
+                  The default value to use as a state input at startup.
+
+              state-map:
+                $ref: /schemas/types.yaml#/definitions/phandle-array
+                description: |
+                  The mapping of this function to a cooked function. The
+                  format used is a sequence of phandle to a state, the mask
+                  to apply to the state vector, and the equality value.
+
+                  Take the example's configuration
+
+                    state-inputs         = "JACK_HEADPHONE", "JACK_MICROPHONE";
+                    state-input-bits     = <1>, <1>;
+                    state-input-defaults = <0>, <0>;
+
+                    state-map = <&speaker    0x1 0x0>,
+                                <&headphones 0x3 0x1>,
+                                <&headset    0x3 0x3>;
+
+                  is decoded as follows.
+
+                  There are 3 possible cooked functions to be selected.
+                  speaker, headphone and headset. The state-inputs are
+                  the JACK_HEADPHONE and JACK_MICROPHONE, which are single
+                  bit values, being placed at bit 0 and bit 1 of the
+                  constructed vector.
+
+                  The 4 possible state vectors are:
+                    MICROPHONE=0, HEADPHONE=0, 0
+                    MICROPHONE=0, HEADPHONE=1, 1
+                    MICROPHONE=1, HEADPHONE=0, 2
+                    MICROPHONE=1, HEADPHONE=1, 3
+
+                  The speaker function is selected when HEADPHONE=0 because
+                  both (0 & 1) == (2 & 1) == 0.
+
+                  The headphones function is selected when HEADPHONE=1 and
+                  MICROPHONE=0 because (1 & 3) == 1.
+
+                  The headset function is selected when both HEADPHONE=1 and
+                  MICROPHONE=1 because (3 & 3) == 3.
+
+            required:
+              - state-inputs
+              - state-input-bits
+              - state-input-defaults
+              - state-map
+
+patternProperties:
+  "^.*dai-link-[0-9]+$":
+    type: object
+    description: |-
+      cpu and codec child nodes:
+        Container for cpu and codec dai sub-nodes.
+        One cpu and one codec sub-node must exist.
+
+    properties:
+      link-name:
+        description: The link name
+
+      cpu:
+        type: object
+        properties:
+
+          sound-dai:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+            description: phandle(s) of the CPU DAI(s)
+
+        required:
+          - sound-dai
+
+      codec:
+        type: object
+        properties:
+
+          sound-dai:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+            description: phandle(s) of the codec DAI(s)
+
+        required:
+          - sound-dai
+
+    required:
+      - link-name
+      - cpu
+      - codec
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - qcom,model
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/apq8016-lpass.h>
+
+    sound: sound@7702000  {
+        compatible = "qcom,apq8039-sndcard";
+        reg = <0x07702000 0x4>, <0x07702004 0x4>;
+        reg-names = "mic-iomux", "spkr-iomux";
+
+        status = "okay";
+        pinctrl-0 = <&cdc_pdm_lines_act>;
+        pinctrl-1 = <&cdc_pdm_lines_sus>;
+        pinctrl-names = "default", "sleep";
+        qcom,model = "APQ8039";
+        qcom,audio-routing = "AMIC2", "MIC BIAS Internal2";
+
+        internal-codec-playback-dai-link-0 {
+            link-name = "WCD";
+            cpu {
+                sound-dai = <&lpass MI2S_PRIMARY>;
+            };
+            codec {
+                sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
+            };
+        };
+
+        internal-codec-capture-dai-link-0 {
+            link-name = "WCD-Capture";
+            cpu {
+                sound-dai = <&lpass MI2S_TERTIARY>;
+            };
+            codec {
+                sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
+            };
+        };
+
+        function-definition {
+
+            mixer-control = "Jack Function";
+            function-list = <&auto &headphones &headset &speaker &off>;
+            system-list = <&auto &off &off>;  // default, init, shutdown
+
+            auto: Automatic {
+                // Headphone presence bit 0 (1) - H
+                // Microphone presence bit 1 (2) - M
+                state-inputs         = "JACK_HEADPHONE", "JACK_MICROPHONE";
+                state-input-bits     = <1>, <1>;
+                state-input-defaults = <0>, <0>;
+
+                // HM & MASK
+                state-map =
+                    <&speaker    0x1 0x0>,  // no headphone -> speaker
+                    <&headphones 0x3 0x1>,  // headphone but no mic -> headphones
+                    <&headset    0x3 0x3>;  // headphone & mic -> headset
+            };
+            headphones: Headphones {
+                enable =
+                    "RX1 MIX1 INP1", "RX1",
+                    "RX2 MIX1 INP1", "RX2",
+                    "RDAC2 MUX", "RX2",
+                    "RX1 Digital Volume", "128",
+                    "RX2 Digital Volume", "128",
+                    "HPHL", "Switch",
+                    "HPHR", "Switch";
+
+                disable =
+                    "RX1 Digital Volume", "0",
+                    "RX2 Digital Volume", "0",
+                    "HPHL", "ZERO",
+                    "HPHR", "ZERO",
+                    "RDAC2 MUX", "RX1",
+                    "RX1 MIX1 INP1", "ZERO",
+                    "RX2 MIX1 INP1", "ZERO";
+            };
+            headset: Headset {
+                enable =
+                    "RX1 MIX1 INP1", "RX1",
+                    "RX2 MIX1 INP1", "RX2",
+                    "RDAC2 MUX", "RX2",
+                    "RX1 Digital Volume", "128",
+                    "RX2 Digital Volume", "128",
+                    "DEC1 MUX", "ADC2",
+                    "CIC1 MUX", "AMIC",
+                    "ADC2 Volume", "8",
+                    "ADC2 MUX", "INP2",
+                    "HPHL", "Switch",
+                    "HPHR", "Switch";
+
+                disable =
+                    "RX1 Digital Volume", "0",
+                    "RX2 Digital Volume", "0",
+                    "HPHL", "ZERO",
+                    "HPHR", "ZERO",
+                    "RDAC2 MUX", "RX1",
+                    "RX1 MIX1 INP1", "ZERO",
+                    "RX2 MIX1 INP1", "ZERO",
+                    "ADC2 MUX", "ZERO",
+                    "ADC2 Volume", "0",
+                    "DEC1 MUX", "ZERO";
+            };
+            speaker: Speaker {
+                enable =
+                    "SPK DAC Switch", "1",
+                    "RX3 MIX1 INP1", "RX1",
+                    "RX3 MIX1 INP2", "RX2",
+                    "RX3 Digital Volume", "128";
+
+                disable =
+                    "SPK DAC Switch", "0",
+                    "RX3 MIX1 INP1", "ZERO",
+                    "RX3 MIX1 INP2", "ZERO";
+            };
+            off: Off {
+                enable =
+                    "RX1 Digital Volume", "0",
+                    "RX2 Digital Volume", "0",
+                    "HPHL", "ZERO",
+                    "HPHR", "ZERO",
+                    "RDAC2 MUX", "RX1",
+                    "RX1 MIX1 INP1", "ZERO",
+                    "RX2 MIX1 INP1", "ZERO",
+                    "ADC2 MUX", "ZERO",
+                    "ADC2 Volume", "0",
+                    "DEC1 MUX", "ZERO",
+                    "SPK DAC Switch", "0",
+                    "RX3 MIX1 INP1", "ZERO",
+                    "RX3 MIX1 INP2", "ZERO";
+            };
+        };
+    };
-- 
2.20.1

