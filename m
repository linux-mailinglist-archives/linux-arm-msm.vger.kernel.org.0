Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7606962980E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 13:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238085AbiKOMDw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 07:03:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238088AbiKOMDV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 07:03:21 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B4929347
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:02:59 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id l8so17178658ljh.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkOf/mQUlsAzKnqG9ceUWMbAjAhQi8V3atO61+Os6Co=;
        b=anf744ExR0fZsJ1I1OyvBXNU1H4MLAI7O2S1l1uefyxIpkbuEbViN251I+wha2NBEu
         wMXyVd/8/HUQOu8O/wOVe26LDSRCRD4pSiP5/+UICaxguM9E19p4okgTjWRNRj7YJomf
         vPGYjFLmqGBffiECXKg0kucezF7nWUpNe3VO1nnBBbiGcLEvqRiA9Bzc9SnxzpZvUeNT
         AkBq/dxBdGOyzFURgAzbYYgfLg1FJbPLyfXtmrfmH380IyYqgISaBZGyAtDIZeOQQALy
         nNMJtsJURx4mIb1SF8JXmasPAfXnwiSKyk9OCJbBNkpWKGnSa8tk3gcQfIaod0Pb1IUJ
         /imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkOf/mQUlsAzKnqG9ceUWMbAjAhQi8V3atO61+Os6Co=;
        b=VjuJyuGc7aHOrhYTQfaoOumXybD19RB8Gsjqn0kecFHwnSckRjFBEfoFOmCcafFUha
         o5XzIUTFQoxehx0n7Q2IbbWqVH34NtUTx+hf90MJli2cx8f/ayrr08nP1fc8d3y0OfPn
         /4+c6FtqJD0eOROj2nX/8utl2Eu7aERQsDBzGJeAOF1ma3diyt2yW9IDwoxThqPR9O5A
         NDmGNqLI5aCnXcLjqBiIlO5k08KeJ7PfNFfJXkrbYGlpX02RMvcdAYi/sbxnmYE2kGcm
         4cJuwldFrSje1DuK/xtyvmGXBvpsPDUR15KiGuyhvcqQOhMI4bya6wvTLDxw5ben7LCi
         +2Rw==
X-Gm-Message-State: ANoB5pktFEjSji8migegNPYGewLsCnXpCXkk7oaD3dtB62yvgfyp6gqF
        FRf9YmBWBMPrEhHRSa5xk/MEcg==
X-Google-Smtp-Source: AA0mqf65mLd6kXKx0FhGMnC9RBT7gtZlpsoxDFQEamw0DjHir+5klbOIYdLhqIrx3mUeZn2XxjklOA==
X-Received: by 2002:a2e:b706:0:b0:277:d75:f1de with SMTP id j6-20020a2eb706000000b002770d75f1demr6146907ljo.272.1668513778946;
        Tue, 15 Nov 2022 04:02:58 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:02:58 -0800 (PST)
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
Subject: [PATCH v2 10/11] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Split to separate schema
Date:   Tue, 15 Nov 2022 13:02:34 +0100
Message-Id: <20221115120235.167812-11-krzysztof.kozlowski@linaro.org>
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

The Qualcomm DSP LPASS Audio DAIs are a bit different than Qualcomm DSP
Audio FrontEnd (Q6AFE) DAIs - they do not use children nodes for each
DAI.  None of other properties from qcom,q6dsp-lpass-ports.yaml apply
here as well, so move the qcom,q6apm-lpass-dais compatible to its own
binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
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

