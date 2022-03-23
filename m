Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEDF84E5666
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 17:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245457AbiCWQaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 12:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245475AbiCWQaL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 12:30:11 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBF224BF4
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 09:28:40 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id bg10so3945433ejb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 09:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c/ADcma9NkOLR4HokqCTyF+5iNUoI0kDBtkLmFmcl+w=;
        b=BP4PSojo2ufR/Zd7quer7ssvLnNjMaiW2JNPw8NQNTvFLw/23S+O+0+eOQte37fCvo
         Ho0k+gTv83MYP2ypMFzBolQiDRKHl+tDzALeN7sp2GBWB23LuV6oXLYG4OaLFDtv0ZWi
         JE5Qo86p/3YidbPxcFWrR/ad+M39a05PCZOVHByAlNy+8dnEmzohlrTRpw6/tRILhH9L
         Oj+hh1es9XrIP/RU09ufoCNazd8/2AalFEhNAyX4pBcTLkNhGDxQ74w6xig0Qq1D2+4J
         FAtON6vxtITyyX65e0hJN45LwIc4HH6MouN2kPGig+B+ncyaYTbUPiEiN3DoZoQwyzll
         S5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c/ADcma9NkOLR4HokqCTyF+5iNUoI0kDBtkLmFmcl+w=;
        b=yQskxrIlThhA31oOeZO2X/UkpCiMkkaN5/zgOTJf1A8UqcmzNXIBgDUXynv2rlk+4t
         0szAjeDyqWLlc0PgCSdk+nYgjWEdkMaKvs//8ISCYzJxUFLLUH7kQ2Bs6HxFl1omWtPQ
         AN84U9n5LQ99o2DHDr/3mnAbm7mWIjBAzo6bh67hgJ93GR4a4SypB5DHbwTxrjGlSM9j
         B5pkBTFy8B2DM+H9MpItGiKjXSOK1cYYUScNSGbIXcARkSyJMU/AaTAD18BxUcNegf4U
         k8GUIpyoalTnR+oNVkSf0v7FdztutJrzacHQzi5ji2PQHM2KymeY9Tnxx6SL4TF6g2Em
         9J5w==
X-Gm-Message-State: AOAM533igUHhfkLObeeq2wx5kz+xJ2P9P/LDnzhkAeCaLVlPGKM7OPs0
        ZXmc/BVKb1/IVk2Ygik+AE3CBA==
X-Google-Smtp-Source: ABdhPJyw3w1GVav3HC/RWU/Nz+R0s+j/QsEovRzudvMJlKZttFZbi+2ltzccR0Rx32WbBwJ99ak4dA==
X-Received: by 2002:a17:907:a429:b0:6e0:68f3:d7a with SMTP id sg41-20020a170907a42900b006e068f30d7amr884227ejc.75.1648052919472;
        Wed, 23 Mar 2022 09:28:39 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id z11-20020a50e68b000000b00412ec8b2180sm173306edm.90.2022.03.23.09.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 09:28:38 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
X-Google-Original-From: Caleb Connolly <caleb@connolly.tech>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v13 4/9] dt-bindings: iio: adc: document qcom-spmi-rradc
Date:   Wed, 23 Mar 2022 16:28:15 +0000
Message-Id: <20220323162820.110806-5-caleb@connolly.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323162820.110806-1-caleb@connolly.tech>
References: <20220323162820.110806-1-caleb@connolly.tech>
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

From: Caleb Connolly <caleb.connolly@linaro.org>

Add dt-binding docs for the Qualcomm SPMI RRADC found in PMICs like
PMI8998 and PMI8994

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 .../bindings/iio/adc/qcom,spmi-rradc.yaml     | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
new file mode 100644
index 000000000000..c8cbfd3444be
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
@@ -0,0 +1,51 @@
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
+  The Qualcomm SPMI Round Robin ADC (RRADC) provides interface to clients to
+  read the voltage, current and temperature for supported peripherals such as
+  the battery thermistor die temperature, charger temperature, USB and DC input
+  voltage / current and battery ID resistor.
+
+properties:
+  compatible:
+    enum:
+      - qcom,pmi8998-rradc
+      - qcom,pm660-rradc
+
+  reg:
+    maxItems: 1
+
+  qcom,batt-id-delay-ms:
+    description: Sets the hardware settling time for the battery ID resistor.
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
-- 
2.35.1

