Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC8872B158
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jun 2023 12:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232548AbjFKK1G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Jun 2023 06:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjFKK1E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Jun 2023 06:27:04 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 787DAC1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 03:27:02 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-977c89c47bdso607634866b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 03:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686479221; x=1689071221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a22HjzVjSoWXGTL9TglCphqPmf2Pi6NIr/Is0weeN9o=;
        b=RnUfUrdL6sWZr9D4mK3Vi1cDtRMbQk0vZDIGXp3858j7hX63QeV1fZGs5lGNF3DSL6
         3W8fE/ccu5d+BXkN87POWFmUVROI6PtlM2Fm8zCBb0nzH8Mh5PLUVHcTmTqQmVsNig9g
         l+If9Dfu5ZdHY7ocfMPmZz7WZsIswIPrr3K4WynmSHM8f/1XtYKBrXMFRLrLxC6XKei1
         XK2ESw/LBWa45tjg5jEBqTObFAQf0k1Y8daB1+TPsrgWmnsu8kytDnAmD+528j8fN/LH
         yZDiFKPlLrSxLRBYp5dS+VjRcLPcYhDC0JlVtBHuwwVb27023L5nLC7ah8+mwgiZwT+L
         ADBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686479221; x=1689071221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a22HjzVjSoWXGTL9TglCphqPmf2Pi6NIr/Is0weeN9o=;
        b=LG7B2zvk5eFvmRFkAVuwCTcj5TaVF3kkBDR2GDs3QzNXhgfStaw1K3AepMsCuONCl0
         PWaPdu2jJh6PrcgysDSAq9jYNSXuMOyCHHzM4QpxldW8bjfyTDPEEBuAFiI2vzNDWMMa
         qB1yjM/z5/Y4eOo44uj6FoG0nSBImOfsf+eWtzDY60nMo/x3uudm+VYec0Qzjs7XVAPw
         HWz4jPo9tb39l6QadkQG9mejejfpUEoqNHLEmXBtGXikh4z3PHxy5GGxMeV0oJ/CgCbu
         6E/p3QYq2VBHvPG2iFducx0sPLhEPawIjVZp/MQb0EP+VhZj70vRE1zjsJEevnjI4kKL
         tyKw==
X-Gm-Message-State: AC+VfDxetMyUXnGcWP4de/c7fNVoLMjJZsLjKq2RqRN2VAAfe/+y6W7N
        /yDoAVjZGxqDzrHWzrQgabZSbA==
X-Google-Smtp-Source: ACHHUZ6E9ylSdo9+OY0Zw2a+lCirUbPbGQZJDOrHG+7A7s72zMIAZ4Fbk9IzFifcsPKHY7jJpdVOYQ==
X-Received: by 2002:a17:907:928a:b0:973:940e:a01d with SMTP id bw10-20020a170907928a00b00973940ea01dmr7870043ejc.67.1686479220830;
        Sun, 11 Jun 2023 03:27:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090680cc00b0096f7105b3a6sm3666806ejx.189.2023.06.11.03.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 03:27:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Patrick Lai <quic_plai@quicinc.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom,wsa8840: Add WSA884x family of speakers
Date:   Sun, 11 Jun 2023 12:26:56 +0200
Message-Id: <20230611102657.74714-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add binding for WSA8840/WSA8845/WSA8845H smart speaker amplifiers used
in Qualcomm QRD8550 board with SM8550 SoC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Correct compatible (sdw version 1 -> 2).

Cc: Patrick Lai <quic_plai@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wsa8840.yaml          | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
new file mode 100644
index 000000000000..e6723c9e312a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WSA8840/WSA8845/WSA8845H smart speaker amplifier
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  WSA884X is a family of Qualcomm Aqstic smart speaker amplifiers using
+  SoundWire digital audio interface.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: sdw20217020400
+
+  reg:
+    maxItems: 1
+
+  powerdown-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  vdd-1p8-supply: true
+  vdd-io-supply: true
+
+required:
+  - compatible
+  - reg
+  - powerdown-gpios
+  - '#sound-dai-cells'
+  - vdd-1p8-supply
+  - vdd-io-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    soundwire-controller {
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        speaker@0,1 {
+            compatible = "sdw20217020400";
+            reg = <0 1>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&spkr_2_sd_n_active>;
+            powerdown-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_LOW>;
+            #sound-dai-cells = <0>;
+            sound-name-prefix = "SpkrRight";
+            vdd-1p8-supply = <&vreg_l15b_1p8>;
+            vdd-io-supply = <&vreg_l3g_1p2>;
+        };
+    };
-- 
2.34.1

