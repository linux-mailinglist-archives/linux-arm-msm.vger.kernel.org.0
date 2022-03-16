Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 540CC4DB317
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 15:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356829AbiCPOZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 10:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358000AbiCPOZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 10:25:05 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4B02A27B
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 07:23:50 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id d10so4500860eje.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 07:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BXhDDcjJdPDbZfpGFJmQRsA5lMP0BnPrEwgZzVXptZc=;
        b=IjzBcqGN7RcPqYuwrmnQjE4kJ8FNl/d6hC+vojagQ/pBr45dMUJ/vCtshjjt4UjPBy
         e+JEBm7jmoJHLh9rTMlaY40Ho1EOSmz2YzKLmtFmkg4/jiIFp4ObEASr1r7mEh/fa372
         onv+NNIu0LzdMwtpD3NvfZG6BHXcrPkDt+2VSsuAc5/QSJb7HmvYWz3beZluRa64osaU
         sawaE7hOnwLAVr0ErUrczRt9o9rQL8AKpGZpzc3xs8eDDlqqM5uZNFzijTJ4fsDVy9P6
         pFJOs7IVIoUs9l77zAQpjavmxy7gfpju7XoLO5ky+glP8D0Gxyhk/TX6ebPZT2N+P9Ex
         4rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BXhDDcjJdPDbZfpGFJmQRsA5lMP0BnPrEwgZzVXptZc=;
        b=HLDk1zEZMtZOq6g7xt9YjqFi855PQLjKI9byUS4GyhJ7g0fOncu7JULDcDViQpTYA/
         L+OVZ619E+S2aRW3F/4M74T9hmaJj88s5vz+34UQb1FTepCN3K+E0rz+3KgqfXO4W6/6
         GBEez5PYTmqpWLr+76D7C7cetq/oZLvgEh9/GwDpxnqxaPLBWqDkNXPOPS3hXhR9+U72
         mw1HTpqmRRNgkylQwb7vuuMYuuEN+4I52vSGdSWUx/nC/WC5YiL2154AxircrAuauTI8
         Dy4hJR2uhnjd5zDFc2RL9fLIAlh+TGQaW0UJXpkK3v/28Z40UajSpqnIQZygGorkGFCe
         qFeA==
X-Gm-Message-State: AOAM5330k4pN5vnTXTzzgt8kFA+Jq6nBdCE0By9OOyBh0wyYTbnHziN6
        O+QV+8jj4tkqUuSC9DBzgNfAMA==
X-Google-Smtp-Source: ABdhPJzlG70WXjem2JgNOWoSg8BoU5ZqqeWxVyngW8lIjhG+vLnglm5KWFg5jNv1s1woFrVM86bthw==
X-Received: by 2002:a17:907:1614:b0:6df:678a:a7d5 with SMTP id hb20-20020a170907161400b006df678aa7d5mr138555ejc.719.1647440629252;
        Wed, 16 Mar 2022 07:23:49 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006b2511ea97dsm952263ejc.42.2022.03.16.07.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 07:23:48 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v12 4/9] dt-bindings: iio: adc: document qcom-spmi-rradc
Date:   Wed, 16 Mar 2022 14:23:08 +0000
Message-Id: <20220316142313.92371-5-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316142313.92371-1-caleb.connolly@linaro.org>
References: <20220316142313.92371-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dt-binding docs for the Qualcomm SPMI RRADC found in PMICs like
PMI8998 and PMI8994

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/iio/adc/qcom,spmi-rradc.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
new file mode 100644
index 000000000000..11d47c46a48d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/qcom,spmi-rradc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm's SPMI PMIC Round Robin ADC
+
+maintainers:
+  - Caleb Connolly <caleb.connolly@linaro.org>
+
+description: |
+  The Qualcomm SPMI Round Robin ADC (RRADC) provides interface to clients to read the
+  voltage, current and temperature for supported peripherals such as the battery thermistor
+  die temperature, charger temperature, USB and DC input voltage / current and battery ID
+  resistor.
+
+properties:
+  compatible:
+    enum:
+      - qcom,pmi8998-rradc
+      - qcom,pm660-rradc
+
+  reg:
+    description: rradc base address and length in the SPMI PMIC register map
+    maxItems: 1
+
+  qcom,batt-id-delay-ms:
+    description:
+      Sets the hardware settling time for the battery ID resistor.
+    enum: [0, 1, 4, 12, 20, 40, 60, 80]
+
+  "#io-channel-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic_rradc: adc@4500 {
+          compatible = "qcom,pmi8998-rradc";
+          reg = <0x4500>;
+          #io-channel-cells  = <1>;
+      };
+    };
+...
-- 
2.35.1

