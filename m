Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBEA625983
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 12:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233615AbiKKLhI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 06:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233604AbiKKLgi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 06:36:38 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55AEF69DD2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 03:36:18 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id f37so7910030lfv.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 03:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jF161Eg7n0UygRaLy1ADIgA+vp2I1IUSYtCaqNOSavw=;
        b=Ue597laUUdsvlmSluFDi0bDqOMbRTooWeh6UN8ZgrT87+FHaVXYCQwDXR5gdrnb4bc
         1VqBB23tDxUYH3WxNghQdzLGxjXN/LEy+ZsBCFx7f6CRPMqQhqoosz2g02ZFldN+P9Pe
         BtZYZ/cuCVdx0vRKoRCsRN2RgzSmvXQimi8bxUFfompey0Mh+6j/ZI/w+dYp1+/xI1qV
         3D9JzkhL+ROSx3YTROf0xLTfS+GHMrYJF3urc6lI47BjIF9Lcn2otKRecXGKG6WDL7lk
         jScQJbJeB24aYj3RTuxkX1mKLF1U+oG9uSeicF9aMbPJu70A9dYCHA6pYeRuL/4b186c
         skbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jF161Eg7n0UygRaLy1ADIgA+vp2I1IUSYtCaqNOSavw=;
        b=zaymEKED+2aZwGQbTOL+Iq5LRVP32dc5M2EcmDw+HwpDhV0lPXdOWFvDyCP6/YUUJ4
         +97NbbIMnrnZsir1G7Oqbh8T750Qu1OtmGzYS9vGBO1LiFtdOz2OwJxtFPhNmvQ0O3Vu
         OCLoDUIx/ewnvp2aYlbZzStRwhIwR74R0eXlP05mc+xAZ9pa9GiWeZ4Piu0/Lh0wYpA+
         oxLYwxisNyYKZh7YhaYY3FXjgFO0v1H1VzWnOj5HOK/rDAMDdNU5Sa61tH6PxCmOlHSx
         jj377uUNrueU4zV+SLdxuONWEtkY8JqnTkZBhjcZVNL6T1kLfcu2iUX5K9kypE2vOHrh
         KYJw==
X-Gm-Message-State: ANoB5pmD2nRiHg4q2vOaqsC1oYztOfaUDoIcPQkhOjjFZUZnvNSMBhS4
        Qq/tHUIHER40aeDEvdqrImg1Og==
X-Google-Smtp-Source: AA0mqf5qlyYZMSvN0eDxF/3Qk/qPFehRkTqOyBDOfWSG28mnuUyS2f/a5pudHk2doI3/ZaSqE7dT7g==
X-Received: by 2002:ac2:5396:0:b0:4a2:3a4b:5012 with SMTP id g22-20020ac25396000000b004a23a4b5012mr555125lfh.526.1668166576691;
        Fri, 11 Nov 2022 03:36:16 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 03:36:16 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Patrick Lai <plai@qti.qualcomm.com>,
        Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 07/10] ASoC: dt-bindings: qcom,q6prm: Split to separate schema
Date:   Fri, 11 Nov 2022 12:35:44 +0100
Message-Id: <20221111113547.100442-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
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

The APR/GPR bindings with services got complicated so move out the Q6PRM
service to its own binding.  Previously the compatible was documented in
qcom,apr.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,q6prm.yaml | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6prm.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6prm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6prm.yaml
new file mode 100644
index 000000000000..f6dbb1267bfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6prm.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6prm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Proxy Resource Manager (Q6PRM)
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+allOf:
+  - $ref: /schemas/soc/qcom/qcom,apr-services.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,q6prm
+
+  clock-controller:
+    $ref: /schemas/sound/qcom,q6dsp-lpass-clocks.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP LPASS clock controller
+
+required:
+  - compatible
+  - clock-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+
+    gpr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        service@2 {
+            reg = <GPR_PRM_MODULE_IID>;
+            compatible = "qcom,q6prm";
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+            clock-controller {
+                compatible = "qcom,q6prm-lpass-clocks";
+                #clock-cells = <2>;
+            };
+        };
+    };
-- 
2.34.1

