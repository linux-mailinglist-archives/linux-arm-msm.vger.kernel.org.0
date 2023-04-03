Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724076D51DC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 22:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbjDCUFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 16:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232572AbjDCUFl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 16:05:41 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CBE30F2
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 13:05:39 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id n19so17791620wms.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 13:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680552338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMtS8+3vZlgnCGkT1exYxWnCIJOSzjNXrQ+UkT+wR24=;
        b=ZxRt7rkQyjmlQpCHuQGn7hMAN9N5cPyC0L6f1OXUIi/BEqX8+xK4PC05gizf8l6291
         XLX8Tn590rxE6qp4cQVfYr/7tsM4Gf9vXBoQBFf6p17QLH4z879SSQU0p+7Ac3+5VGHC
         1EFfZynRD+bFC9Spwb9iA+SNsTsE+mi5qJQ3TlZr/vsi5ekSrStQDYriph0S/h3NJH6e
         Siv4+vLlUya5JBG0AP0egDPvYRrTODRcLTOTOOrn9KoXdhiS+C8Mr5M58mJspyYWEAa7
         AfOSvp1vxuJXodkrmqOmhhE5AriOvtlvbRSC9JHM1rg3RDt6RwAWZC3O1rQGC21vW1jN
         t4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680552338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMtS8+3vZlgnCGkT1exYxWnCIJOSzjNXrQ+UkT+wR24=;
        b=xxCV5aRLPzLAtWf69k55chpDi8JcmN6mrkwMv2oSKshf9mIth9lFrNyU5VftFR6wTT
         hQVYG4tm3fzljFW7JZ+wieICGjZpdgr+Dnf4E42WS64pzUYRJb8ivc80ZLeUi1yHKGIu
         8HrRSPNFaKumBkixm6Lf0iSiT9Sp1+uoO4+xFynuDt3ID8/y00Mi2kEUfKJohGSkUHa9
         8AngQ98fpT6QgfkTugEoHvtV4jrdMsdxemExwrMvDHkOnmV/TH3g9kdx+Dwejj9FRcIK
         typzGnw80TvsBjBiUYb7cyFCD3pFkUUaUjBsZqMYEOYcER5wPzAXV7zRmLkU+ubXyoSY
         p0jQ==
X-Gm-Message-State: AAQBX9eNZWm+SnJp/Ztfg/bJBc87TMp0umvSLZQfshTRVnkjixLpqS6p
        HQP88iREIPKhQqBqTGPxQVgNdA==
X-Google-Smtp-Source: AKy350bl6WGWzHFV0PYy6AyP4+rPWk7CLiQtYdaTG5D5DSHQbRaoYXhSPZLJp12G75Nx5czzI63sOg==
X-Received: by 2002:a1c:7918:0:b0:3db:8de:6993 with SMTP id l24-20020a1c7918000000b003db08de6993mr173588wme.4.1680552338146;
        Mon, 03 Apr 2023 13:05:38 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id iv19-20020a05600c549300b003ef69873cf1sm20798037wmb.40.2023.04.03.13.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 13:05:37 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Eric Biggers <ebiggers@google.com>
Subject: [PATCH v5 1/6] dt-bindings: crypto: Add Qualcomm Inline Crypto Engine
Date:   Mon,  3 Apr 2023 23:05:25 +0300
Message-Id: <20230403200530.2103099-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403200530.2103099-1-abel.vesa@linaro.org>
References: <20230403200530.2103099-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add schema file for new Qualcomm Inline Crypto Engine driver.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Eric Biggers <ebiggers@google.com>
---

The v4 is here:
https://lore.kernel.org/all/20230327134734.3256974-2-abel.vesa@linaro.org/

Changes since v4:
 * added Eric's R-b tag

Changes since v3:
 * added Krzysztof's R-b tag

Changes since v2:
 * moved the file to crypto dir
 * added soc specific compatible
 * dropped top level description
 * renamed node to crypto and dropped label in example

 .../crypto/qcom,inline-crypto-engine.yaml     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
new file mode 100644
index 000000000000..92e1d76e29ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. (QTI) Inline Crypto Engine
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,sm8550-inline-crypto-engine
+      - const: qcom,inline-crypto-engine
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
+
+    crypto@1d88000 {
+      compatible = "qcom,sm8550-inline-crypto-engine",
+                   "qcom,inline-crypto-engine";
+      reg = <0x01d88000 0x8000>;
+      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+    };
+...
-- 
2.34.1

