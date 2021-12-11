Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114794710D9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Dec 2021 03:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244529AbhLKC0R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 21:26:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244379AbhLKC0N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 21:26:13 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660CEC0617A1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 18:22:37 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id l25so35701818eda.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 18:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UGu50E09mCw1U2A+S3O19n9x6nLpFWs+pIRJt2who2g=;
        b=FJhMOelpXH/gQkr1u/xvKKHT9KsquhHmDyWP+tjc1adW1YFCaZkavXR9QdYylwIw52
         H2R9nCMEeAE9yjspJ5c709PvGmqCkjeSjTe33VtSdPfDfo8sG0t7ImLhA44MZDv3nznO
         aSfghjxeL7RCjJpjJZsdjy77Hd36uu2nn2rC4r7bwV1OS5Cq0q5zQHCm+x+7Rb+Ya3RL
         drgZYdhsrPgLjeE9wUcXjh1x1ubJTZXpckLgux9X3WpcXunflwuRsIijrDpe9qdOEnQj
         s+XwQWCSGhbGOV20nm418dzEuUb2zJ5nK7f1x3GPnr8gCTblGd7Re1k8VtSGTEqCQutI
         zzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UGu50E09mCw1U2A+S3O19n9x6nLpFWs+pIRJt2who2g=;
        b=LZdLrPAdRQHHF1Pm5f1FvNwZ1pdCokN5XV6shPH7QrOB4Cpb9NJhuIisZlgf2C2jka
         GEDQbs1+YiclvOzRIot0rwRMePY84i2rbC3faav9Q7mpLCsj8DuNQXxrpCfXtkq1q4LM
         YVOLNO29w+T+Vb/oCKTQlYhPn9xhne4mOV2mpPlVhJbRP2Ivk3y2wlwCIlAORUtGeOIt
         LmxByh3fGXyKNEDx9scg1ww9G9O17qtN4qt/qbWtzSIFw33v1aVLusPLpsGAvWHNQm/U
         FrapvecZSCyfIz8e6UQwCUC3YTBaABzNIhCqaM/miyBQoyHAh07Vt+8dEqyiAEo3EBOR
         sRCw==
X-Gm-Message-State: AOAM533heQ3EF1zFwRUk7Ww4/wxIjJnRpXejUWq0r7mHKgBfAju8OCeW
        boOTxOFtD1oUr2S5TKXhx8lAqQ==
X-Google-Smtp-Source: ABdhPJylsm/JkdtpGjy9BZuZbGuSwA+7ItwXoqaYozk3OClVmNQrEogbcpSPKrL3NdH+T+lW+WBY6A==
X-Received: by 2002:a17:907:3e9a:: with SMTP id hs26mr28599389ejc.433.1639189355965;
        Fri, 10 Dec 2021 18:22:35 -0800 (PST)
Received: from lion.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id s2sm2449424ejn.96.2021.12.10.18.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 18:22:35 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
X-Google-Original-From: Caleb Connolly <caleb@connolly.tech>
To:     caleb.connolly@linaro.org, sumit.semwal@linaro.org,
        amit.pundir@linaro.org, john.stultz@linaro.org
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: iio: adc: document qcom-spmi-rradc
Date:   Sat, 11 Dec 2021 02:22:19 +0000
Message-Id: <20211211022224.3488860-3-caleb@connolly.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211211022224.3488860-1-caleb@connolly.tech>
References: <20211211022224.3488860-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Caleb Connolly <caleb.connolly@linaro.org>

Add dt-binding docs for the Qualcomm SPMI RRADC found in PMICs like
PMI8998 and PMI8994

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
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
2.34.1

