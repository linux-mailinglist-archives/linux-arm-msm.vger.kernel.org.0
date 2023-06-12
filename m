Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 458FB72BEE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 12:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjFLK0v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 06:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbjFLKYl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 06:24:41 -0400
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA8C2ECD6
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 03:03:30 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-977c72b116fso627641366b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 03:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563842; x=1689155842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJzV8k8PINg1fP+cCISdw3LZJs7BP96rMaIUJI+fFlI=;
        b=pRDueYu/tRrKVqAPFSh1p62giJ9RVa7Yo9TLHpe2QX9ej46v2Wogo2mbh8849n8ogB
         dPaaUGzBADFJyl2t/WTZoC9MXCBEcexqjVbxR6vrW6EIOjo7OcwcMmGnoeQHS9tsuP3V
         +SV3tFKnreUnzF5WizOcX6cgvGNUFx7u/HP4ksaOqhr9Y/xKjqqHkronwZocWhANGLnQ
         u7uGuobDV9pirCr16hxp4/FuXchXADQaY/oUHuBvvblot3QCIG/e399R+nOEQkAxRb79
         28F3DN+VoBrvYWoaQVzB68j0CNl6cshrt9LPh3QcFnNB9W7cQ9bra0Iff70wbfJu698t
         M1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563842; x=1689155842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJzV8k8PINg1fP+cCISdw3LZJs7BP96rMaIUJI+fFlI=;
        b=UjbB2YzG0zNFq1g6Og27GjKzOqWgZaO3V0Sx+4PTP9GWmBNaDa7jw9Cr+T4C9ro950
         JbJcFA9TSzGjl5G3w0bqzAooupf8Z8srGnXBMvkpKfgzWb2aMrrL2YTxhSDqh7/UBuE2
         sy1IfsWZhla7WADvT6gDAKYNBvxZL9zevvqBpSqogzyNlFcYNzLCuRra0pnPzYSrcphE
         XHD57Tdrflo40YenJzapgNgAU2jlUni5WGNvXv9FiPuqq44xiaeuPf/MDBVFAoqXqjsT
         r/KOarIlHt5Z8iwelbqKzLxvsIGk4NnS/6UaC9+95qBKiGRUO0ONX4z0AXQkriMs3kiz
         LOfQ==
X-Gm-Message-State: AC+VfDwetpkZe2iXeyJV7kU4Qs3129ny61yYt3oko9lOZ3CsTDGqbzQy
        CgA9d0x27tZg1nbCr1cm6F+TQw==
X-Google-Smtp-Source: ACHHUZ6pRYxendYgoWbyLTl7w4hnUEIQzwT9hEIK8twkyXzDMp6cMGP7pSNdEbVfvpmiucwLWMNLKQ==
X-Received: by 2002:a17:907:3182:b0:974:1eb9:f74f with SMTP id xe2-20020a170907318200b009741eb9f74fmr7847298ejb.15.1686563842037;
        Mon, 12 Jun 2023 02:57:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u1-20020a170906780100b00977cad140a8sm4949175ejm.218.2023.06.12.02.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Patrick Lai <quic_plai@quicinc.com>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: qcom,wsa8840: Add WSA884x family of speakers
Date:   Mon, 12 Jun 2023 11:57:15 +0200
Message-Id: <20230612095716.118631-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add binding for WSA8840/WSA8845/WSA8845H smart speaker amplifiers used
in Qualcomm QRD8550 board with SM8550 SoC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. None.

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

