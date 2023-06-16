Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C27733091
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 13:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbjFPL6L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 07:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345209AbjFPL57 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 07:57:59 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE10268B
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 04:57:58 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9786fc23505so83818666b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 04:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686916677; x=1689508677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCcBymWVvFUYBpDZiz8yU1Vny7cOsw1jZWNc7ndk0g0=;
        b=gqCyE0hmXsh5+SvPr4OtsUuNGaxP4q3VKwqLomoxeLqsyxVvM54E9sDqWkU7Bh1nJ1
         Mzqu5MZLDqSPGBAQFRES9i88e7cqUWq6rnwxNXNL7tzsoi2f7mRzHtt2Gm+WzMzSR/Qh
         cssftCLEP0z0dXLpUOSEog8oIUg3lBKoxv9LrW3+Sq8+zyzfo8n5twzwQrkonoMRcCe2
         Ct9CrZ4L3ceZ5ReVNuxtBnJJmZQkhd9ltJBbHgzZaemGxAxeaoHPWQqPpNRF62TRAEft
         bz9A1iWyo9/1VRN/1G5UC3rpjbV1w3tMVut/aeuWu8n3DiLa7AQQj3Ed59gUf88Hx2QT
         //PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686916677; x=1689508677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCcBymWVvFUYBpDZiz8yU1Vny7cOsw1jZWNc7ndk0g0=;
        b=P/R2XjEt/KeDZGSQUffk3ebRdn+Y75zdP+zfsqHQKd1P/dKJEtNt1x4fl5txauhsnV
         1wAIcmKNbmfomUppXWku2AfMkPL8fxGbFxi8WztnEcC1A3NZKzfoKdGF9xju0buGYfC2
         js37CRVz0PKUpJkmGAbTdSUsq1g41CSUEAHha0YSUrv5R7JgBgxaMjJ4wRhRaBYcG6Vi
         SfP2zXsgAGI0IY1QTstiZzEcFJcq9RrBPnHK0BXYwiaAZL8NSmH0ufvyqTPtj8H7SCnk
         N8BbTIHiXFh++/uOojDGuAC+z3jH5bnrHpnaApFJdhZmCrlRGORoyMxnQ4QJFVvNvibe
         eZgg==
X-Gm-Message-State: AC+VfDykE02fcO79HqR8XDu7rWR7Rn7GLEEKsZZB1eLJob3u17yM70nO
        Of8hZ0iOi5YbB/P8q1xwBhlk5w==
X-Google-Smtp-Source: ACHHUZ6vE3R7qCnh2PCNxWO4ZDi/LEFRqmkN2EuSjzOX5wnWLJIPzyKm2jXbyfA+JjRibTxAsX8UkA==
X-Received: by 2002:a17:906:f1c3:b0:974:419d:7837 with SMTP id gx3-20020a170906f1c300b00974419d7837mr1304247ejb.34.1686916676767;
        Fri, 16 Jun 2023 04:57:56 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id g19-20020a17090613d300b0097889c33582sm10723823ejc.215.2023.06.16.04.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 04:57:56 -0700 (PDT)
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
Subject: [PATCH v4 1/2] ASoC: dt-bindings: qcom,wsa8840: Add WSA884x family of speakers
Date:   Fri, 16 Jun 2023 13:57:50 +0200
Message-Id: <20230616115751.392886-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add binding for WSA8840/WSA8845/WSA8845H smart speaker amplifiers used
in Qualcomm QRD8550 board with SM8550 SoC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v4:
1. None.

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

