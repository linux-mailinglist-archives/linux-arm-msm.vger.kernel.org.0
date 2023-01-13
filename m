Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92235669E13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 17:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjAMQ2t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 11:28:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjAMQ2M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 11:28:12 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1298E7EA58
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:22:24 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id v6so10467705ejg.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bexLBDu2Jcqr900kwtHlEd3vc21Me48gshjDc+jPY5U=;
        b=iGbfa1kPYcyjjbwACbG3VaTIbW+t0C83bDns2PeqtRAE3fKZyPa/WEmxMc79C7n+k0
         LSn7GtKnoYNf36+3K5afjV9HtWsYGjR6SztHSRfDbdDn8o7Jtsm88jzTkgzpLLt/mibF
         XlwJuLig4EvjXMVD6NKEn0QZv/t3QADwTFWKXR5D+iaP5uuiZooEJDe/8aSmLbQQdbg/
         tvs9JayG5UkN4ibEtzCdON79+XZZJFzTAWvYpJkrx95wlIipqCFl2etYsvPfiOZ5WO/I
         ZyMfPDeN4OS5JYIyM4BO7L8zP8T6WGZZWy0WiWHLPvKxkkyvycgHI+qvxOHZ/z9EvWH5
         GIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bexLBDu2Jcqr900kwtHlEd3vc21Me48gshjDc+jPY5U=;
        b=59rqSTdxq7GVMNMH2npO+QaiyRxm0anitWlSnfUEiLRE6xchc8l7tQb6M2u2q0vNeb
         jUUg+T0jqCv3rS8OYjZZrNfub8984X/bh5wXNVmXWdLwWzKvnzsLI5GEySWINWsoIJxK
         JnVnEx745vdal/rIqvvNYJ2gPheVgv8duDBblGLSnhHkl5DwT8NlhPwAHnUvIBNR4Hds
         yBKAsEQpFG93Y46AGgOmziup5Upumk/CcH6YwjQRPpcSz5ZFmfhV90jcwZqMvM07zeyS
         EIhMdecB4mhnl2z/rGMRJ/nXS8Axlc+P7R0VX5RxV+lhxQE9ndFtxixqPAzntDumNnA2
         hpPg==
X-Gm-Message-State: AFqh2kqFh5xHvNwJX/6A1weJfaxrERi8WCqdVZjwGR5u7X8niLSDu/2O
        q0yZ3UxDU4jnXf7D9RWB7nt80Q==
X-Google-Smtp-Source: AMrXdXteXj2KfLx4/wMmN2219OBKDVEo2r86wx6/WgM1C2Dv8h723tnkzSLIYUoGCqzY6op/E1Rujg==
X-Received: by 2002:a17:907:a609:b0:7c1:22a6:818f with SMTP id vt9-20020a170907a60900b007c122a6818fmr4233958ejc.25.1673626942675;
        Fri, 13 Jan 2023 08:22:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o11-20020a170906768b00b0084d242d07ffsm8376737ejm.8.2023.01.13.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 08:22:22 -0800 (PST)
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
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] ASoC: dt-bindings: qcom,wcd934x: Allow usage as IFD device
Date:   Fri, 13 Jan 2023 17:22:14 +0100
Message-Id: <20230113162214.117261-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
References: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The WCD9340 audio codec appears on Slimbus twice: as IFD device without
properties and the actual audio-codec referencing the former via
wcd9340_ifd.  Allow in the binding both versions to fix several warnings
like:

  sdm850-samsung-w737.dtb: ifd@0,0: 'reset-gpios' is a required property
  sdm850-samsung-w737.dtb: ifd@0,0: 'slim-ifc-dev' is a required property
  sdm850-samsung-w737.dtb: ifd@0,0: 'interrupt-controller' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

oneOf: interrupts-extended|interrupts is needed to avoid dtschema
limitation.
---
 .../bindings/sound/qcom,wcd934x.yaml          | 58 ++++++++++++++-----
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index 39b27126cfc1..ea09590bfa30 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -149,21 +149,49 @@ patternProperties:
 required:
   - compatible
   - reg
-  - reset-gpios
-  - slim-ifc-dev
-  - interrupts
-  - interrupt-controller
-  - clock-frequency
-  - clock-output-names
-  - qcom,micbias1-microvolt
-  - qcom,micbias2-microvolt
-  - qcom,micbias3-microvolt
-  - qcom,micbias4-microvolt
-  - "#interrupt-cells"
-  - "#clock-cells"
-  - "#sound-dai-cells"
-  - "#address-cells"
-  - "#size-cells"
+
+allOf:
+  - if:
+      required:
+        - slim-ifc-dev
+    then:
+      required:
+        - reset-gpios
+        - slim-ifc-dev
+        - interrupt-controller
+        - clock-frequency
+        - clock-output-names
+        - qcom,micbias1-microvolt
+        - qcom,micbias2-microvolt
+        - qcom,micbias3-microvolt
+        - qcom,micbias4-microvolt
+        - "#interrupt-cells"
+        - "#clock-cells"
+        - "#sound-dai-cells"
+        - "#address-cells"
+        - "#size-cells"
+      oneOf:
+        - required:
+            - interrupts-extended
+        - required:
+            - interrupts
+    else:
+      properties:
+        reset-gpios: false
+        slim-ifc-dev: false
+        interrupts: false
+        interrupt-controller: false
+        clock-frequency: false
+        clock-output-names: false
+        qcom,micbias1-microvolt: false
+        qcom,micbias2-microvolt: false
+        qcom,micbias3-microvolt: false
+        qcom,micbias4-microvolt: false
+        "#interrupt-cells": false
+        "#clock-cells": false
+        "#sound-dai-cells": false
+        "#address-cells": false
+        "#size-cells": false
 
 additionalProperties: false
 
-- 
2.34.1

