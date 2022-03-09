Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCE34D3B91
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 22:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237244AbiCIVBg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 16:01:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238295AbiCIVBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 16:01:34 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD556351E
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 13:00:34 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id qt6so7749806ejb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Mar 2022 13:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BXhDDcjJdPDbZfpGFJmQRsA5lMP0BnPrEwgZzVXptZc=;
        b=yazTznPHI8M198M1idtUVVJnuyKbjxMmxfAJ8aZURFDWBfyDkRTcn58emCAo04qq2h
         WdUeLzzYMPPlHKXFrBnjGwIRG0cQzZsoDBJ68OpclUYmitafelpvOoLtLZdAEORYhMlw
         Inm8/XfUCDsfsIQqtUwltTB8+y0Fd0qrxSah5H4A4wMCTyy/6BB07CmJKmHlVgoXnKbm
         tGLnsxqRbQzf/q+QYJC33ZHWwPFPrxbGmaOyDuvhblLHwoEPZaHJ6MeifPEADcpPXpXk
         2X9VCqs17oPWybP0vUuc3mTJL5XyTbR1TSlxg9x4veuW+o+RVVGRodb7NT3dS93gpGhG
         XO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BXhDDcjJdPDbZfpGFJmQRsA5lMP0BnPrEwgZzVXptZc=;
        b=23rRur2gON/orGtiFuKE6RdKriQ6IsLceUcqHnD3CAsZyHS8eTdn2BcKvXjv2pIjdE
         m9cWZWDt2zV+xUOJ2uU2qejfzrw7hiu+ND8ateHEiZj/5DjmbQBHWGXGv6BzKlwjmoJs
         AirLMH4+E4mX44F+LSdvTl/6yFIzNHnHhwFS6jjU6J/rIoZWLl7y+TtLGfnY2NxrlhlA
         D7oYGI2t23/1S0nTZG61AI9oDDedNfdIhqsdovjpdj4mnGkiefH0/0wfx/RE2p3WOpxj
         VG/Mk5Eu/o4mlRk0GQBHquEf5/qWV5tVjBVGMbMdMNiXti6wnqnZ4griKc9S8z2J0o81
         yPuw==
X-Gm-Message-State: AOAM530t+1o0BuhJXUi0mmieOiy3j08rclM+/I0i6pf2pqC77+Phpsia
        ceE5YZ7YuI4CMdz+1LBhF1B2aQ==
X-Google-Smtp-Source: ABdhPJwPDZIFPTmUHQLCgNMYAZ16u51kKVzOBSc48jHwjq0bMw9h44fPQrcB8c5nZpjskOhkdVhfqA==
X-Received: by 2002:a17:906:7706:b0:6d6:e521:5471 with SMTP id q6-20020a170906770600b006d6e5215471mr1464261ejm.387.1646859632586;
        Wed, 09 Mar 2022 13:00:32 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id l26-20020a1709061c5a00b006da815e14e2sm1114743ejg.37.2022.03.09.13.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 13:00:32 -0800 (PST)
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
Subject: [PATCH v11 4/9] dt-bindings: iio: adc: document qcom-spmi-rradc
Date:   Wed,  9 Mar 2022 21:00:09 +0000
Message-Id: <20220309210014.352267-5-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220309210014.352267-1-caleb.connolly@linaro.org>
References: <20220309210014.352267-1-caleb.connolly@linaro.org>
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

