Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C52BC4BECF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Feb 2022 23:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235159AbiBUWI1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Feb 2022 17:08:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235182AbiBUWI0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Feb 2022 17:08:26 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C23DE5A
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 14:08:02 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id p9so29313768wra.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 14:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BXhDDcjJdPDbZfpGFJmQRsA5lMP0BnPrEwgZzVXptZc=;
        b=OTNmxNVLOaQ+GZKIwdNHVkFnAwjww6BZWFKx5LbvBdxtXUj+Y+BmBDPxUT6dj/V9PC
         Z0jjWh/52KsT9FdiNXVfeUY5y6XB18IfIvhNDjihl8x2XjLxu25tlKH7h0ug7Yb99aNF
         Up00b0G3Nzb0ga9pp0+o0nKhRU+DgUmbcznu71gH7RGlJwiTqKCy2EJYjz4jxbsxYL4s
         iac8056KIYm1wJvrbOXqNgPHxBu8iaKDpS7E/HF4+msJiBq0awetxxExLdC+IvlvTm+I
         SmQ5A92dUTp8Cnn3zHlhccFjgUN1g4BvNTLFe/TEsdUERSDCrvDkIvm4EX0T6LVpiy5L
         ym0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BXhDDcjJdPDbZfpGFJmQRsA5lMP0BnPrEwgZzVXptZc=;
        b=1KezLtMsieWmZMsnYHPV9hhaMy00fb5++wy2TTjM11bJkYkqE1MqyeWvGvuLp+unV5
         JjB5VPO8U5QCmM7LIQK0E9VUnkdmh2fkViZOjycSVF2spwACP84GdBaKsfM87Cqh0g1K
         iMyJN3nO6pF1iC/FF5jSSq8TBDPbIpz9JFDl/io/a/tWv++2BWCuDR2dBkPr5rmW3R7f
         pcG+iNpy0Y7NCCF0D/LbyH4ZZohtrvT7JG/ZlF6/GHOP5W9pZqY2jsWcBZHdEZP1DtJo
         uqBEG5fcQ5jdFQJAQKZvT8gLxIDTaJyhvZKiJOjlqnj5kmmquAQT6x8tIGvXfN+Oeo7u
         INGA==
X-Gm-Message-State: AOAM533zf5XFV61x4RaOLx1V1wMVC0EprhpkwplvmDukvlYE5kQryCJa
        m/EmdPMbaC6vljf7l+f4fDbDjw==
X-Google-Smtp-Source: ABdhPJxKPGbD/d2f978lTkfrNdnCGiaLOTYPGMXwtCm7AxG+jXYJifwW054/N8QZ4K4NAXDTlZSE3Q==
X-Received: by 2002:adf:d844:0:b0:1e4:bd02:b34d with SMTP id k4-20020adfd844000000b001e4bd02b34dmr16421411wrl.591.1645481281285;
        Mon, 21 Feb 2022 14:08:01 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id w8sm51626093wre.83.2022.02.21.14.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 14:08:00 -0800 (PST)
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
Subject: [PATCH v8 4/9] dt-bindings: iio: adc: document qcom-spmi-rradc
Date:   Mon, 21 Feb 2022 22:07:38 +0000
Message-Id: <20220221220743.541704-5-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221220743.541704-1-caleb.connolly@linaro.org>
References: <20220221220743.541704-1-caleb.connolly@linaro.org>
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

