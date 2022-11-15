Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0890A62980A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 13:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237699AbiKOMDo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 07:03:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237701AbiKOMDI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 07:03:08 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE04629342
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:02:58 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j16so24023312lfe.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjIcwISYizTMd4GfNjSCEyTXmXHAf6CHHATueef/HN8=;
        b=eFOxtUSLZmpzuZ+rOIG8oQ+VUcQiqQP7CPntwlOX5IfDXrOr27TVUvcIeQJKozFIYu
         X45MGLLpJe2FJi9RZZjhs4nfoG6PzrFm8Ml+/PbDJMp/PDoh7Axl0PCfZ++vBjRsTVmj
         CgV3nZtDJ0/rgDCVac5hBKrONLjsXSjjb+nnzB3w+l0rlI3gsJ8cYtwVygTDjYq4XH5D
         j9KkAZCo04xy8GZ/LNuqQO0IYFu5LqKEazZ5VVnq/N8R7tXJ01lCOfuq0rbOeNh53Lbc
         WSqIsj6ZgQ3hEfWCqwpUIGA8UvQ1gUvKzwPYJw2J/T77dsRzpZz0wCminqXR2r/GWHJr
         1x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjIcwISYizTMd4GfNjSCEyTXmXHAf6CHHATueef/HN8=;
        b=Zx4Jq6WaYV45xjtCa7cJ+TkFcEtuxOcHcuhcEdKxmCR5A5+GonOEbdWNl9x5q7cIYH
         WJLe96k9dqzwONzKbG9x83Qu403+/+P/NUqAc9KwQAnUbd51ozWv99wT7gTtMNB7d++B
         CLe7WPhFYNYjIotYY+lLRXVRBxGQizoNn/Zj9VvDMIzrb1yQFw0EeAVbrHKY4/3ThIzG
         QgiC7VrV7PBbk3VhKuWdGNV5kFwWR3rIoqF3zMAGSbDpJUEGpGyqTAThWxynmfEmRajb
         MDnpST3gYwPJ0iiJJ0kraGRo9szOj5bAxAvhSlRqcFb1C2jzu6Pc8c311uG6nqrp2Mnd
         bhyQ==
X-Gm-Message-State: ANoB5pkQTd7txRiyRK/n0bYJMp+bzXLSjVxiDPEfbuOfn+uECQy4lXki
        3uAEfSQKpD9yf9KVcTvDe6ZbAQ==
X-Google-Smtp-Source: AA0mqf7zJGKPdafXhGbdYS0VR7Iqoj6lKhMNRCrXLV2on/t88JgLH5dNUEGY8Em3jgBZUTjFhWt4tw==
X-Received: by 2002:ac2:55a9:0:b0:4aa:da5d:dfd8 with SMTP id y9-20020ac255a9000000b004aada5ddfd8mr6090205lfg.677.1668513777308;
        Tue, 15 Nov 2022 04:02:57 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:02:56 -0800 (PST)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        quic_srivasam@quicinc.com, quic_plai@quicinc.com
Subject: [PATCH v2 09/11] ASoC: dt-bindings: qcom,q6core: Split to separate schema
Date:   Tue, 15 Nov 2022 13:02:33 +0100
Message-Id: <20221115120235.167812-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
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

The APR/GPR bindings with services got complicated so move out the
Q6Core service to its own binding.  Previously the compatible was
documented in qcom,apr.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
---
 .../bindings/sound/qcom,q6core.yaml           | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6core.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6core.yaml b/Documentation/devicetree/bindings/sound/qcom,q6core.yaml
new file mode 100644
index 000000000000..e240712de9ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6core.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6core.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Audio Core (Q6Core)
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
+      - qcom,q6core
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,apr.h>
+
+    apr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        service@3 {
+            compatible = "qcom,q6core";
+            reg = <APR_SVC_ADSP_CORE>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+        };
+    };
-- 
2.34.1

