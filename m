Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67187625981
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 12:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbiKKLhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 06:37:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233689AbiKKLgk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 06:36:40 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD6B7BE59
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 03:36:19 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id p8so7886772lfu.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 03:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IE0XX0QezEMZ/aKTh/HTXAG3MFrHP8nMS3WLzX4ya5U=;
        b=s2gI4VxUfsIKi0pZhF8MIqrbWNCRSvmA7zTOsT2Vi56Km8Hv93CZubsQjOikGkw0Wg
         9zkS5VWib0yrQg5nMWImgwH5ZCZ+biHj+ayJLw4m3VjPx+EBus/mYaPI4myaYuA89if6
         qXJjpQcXUCJ6NllRC+dSxXhOSNtosHTJyFpcLrCL/frgy4GhO3SkUPLdPtHiaMDXw1cn
         11Vbyx806/xRyLzJZVoVsWPcfPvtjtQJshR+HfSIG1ji0K14Bj83yf0RwySzaH3eLIQL
         8xvMkBEWTz1+BPLIAAS+kd34b/wxoKW35i2yMi9GW4CCY0pHLP8hEZ06/WM0cVKqOoYj
         HmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IE0XX0QezEMZ/aKTh/HTXAG3MFrHP8nMS3WLzX4ya5U=;
        b=B+zidkOA+Y0XoaRMwB2R7o+GRYkkaXP4jrVVN/ZamhenLazleP/Fnd509QMxP56ZJv
         M/zXSOnaJupyrgYipW9VpVjw6GzS4Y7jotF6ggHi5MRuL7muU6wvl91Ma02i5GGY/J26
         lnBSg9/Bs3IfOG1uhZUe6ANwq70747RhVyBIBEJ+ckm87GrzchXFVqkeJtCKAWoiLFoA
         oP01edAjEhNugZhmdpTraUoa+Rsz52Cml1m3LmMDWwcpi7ILyxZAKlrVufSFr6vuDGOg
         LNO0r/Vtl8Y0gXFnIzic3F+I5xZ9JszYJoF61xE+T/4JZgH155lWuwlVnVF+xSDLOkj2
         lQVg==
X-Gm-Message-State: ANoB5pkzzWUVEG8g0+ZlqlB/yQD66WNY3PyKQpwTd9P83XADIGrwAsMF
        6XeIt5vozP89j+XybQUvtunh0g==
X-Google-Smtp-Source: AA0mqf6AKOgt1YOV3uAwJC6iu43pL9hvefRdn2Rq9U+9FjpDIzZP5m5frQd5HcLJuLfQGTLfRaHouQ==
X-Received: by 2002:ac2:5ded:0:b0:4a2:b387:8b19 with SMTP id z13-20020ac25ded000000b004a2b3878b19mr568219lfq.284.1668166578907;
        Fri, 11 Nov 2022 03:36:18 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 03:36:18 -0800 (PST)
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
Subject: [PATCH 09/10] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Split to separate schema
Date:   Fri, 11 Nov 2022 12:35:46 +0100
Message-Id: <20221111113547.100442-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm DSP LPASS Audio DAIs are a bit different than Qualcomm DSP
Audio FrontEnd (Q6AFE) DAIs - they do not use children nodes for each
DAI.  None of other properties from qcom,q6dsp-lpass-ports.yaml apply
here as well, so move the qcom,q6apm-lpass-dais compatible to its own
binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 32 +++++++++++++++++++
 .../sound/qcom,q6dsp-lpass-ports.yaml         |  1 -
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
new file mode 100644
index 000000000000..4b3ce779206b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6apm-lpass-dais.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DSP LPASS (Low Power Audio SubSystem) Audio Ports
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,q6apm-lpass-dais
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    dais {
+        compatible = "qcom,q6apm-lpass-dais";
+        #sound-dai-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index b202692f1756..d8ebf2e528d2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -16,7 +16,6 @@ properties:
   compatible:
     enum:
       - qcom,q6afe-dais
-      - qcom,q6apm-lpass-dais
 
   '#sound-dai-cells':
     const: 1
-- 
2.34.1

