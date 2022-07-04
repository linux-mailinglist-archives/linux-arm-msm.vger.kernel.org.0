Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3D1565CE6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 19:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234174AbiGDRZC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 13:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233904AbiGDRZB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 13:25:01 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048D21114A
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 10:24:58 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i18so16772984lfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 10:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=glRhV38mG/+y5mBv6glviP1PuUDmRJFS1HB3Fou6wAc=;
        b=zPgTxBhhkK6INxMsheYi5k3NI9UeiCMi+x9DjylsBr9Zt9DzS8MwFzq7jkLguL4R8j
         QPQvzgLnou7AM9Ic3bOwKl/lFBR398Q2pAxDd3IgvBj4sLrgSSnCy8B+U/mKC6rDrRlj
         RPPPrXnE78iE+44f7//N+nmViDBJ11ePURsKbHEIET4YGpu0WhLBdpyEkWpiD6sXrd/T
         DdCJkmlre9NfETNHszjHRroeMv06jS3e2ZdvAyp3tPFiDBNn5FHMBscbqmb7RTaxOVuf
         vdD2zomNyqHm5GyCJ2qDg+lEsXDTp7BlgGKG6dmTLapsGTwCxAuH5/sGhtKVqFi6y42a
         bZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=glRhV38mG/+y5mBv6glviP1PuUDmRJFS1HB3Fou6wAc=;
        b=bPkxVD6l1bR1zXkEBbHOC5JMT951VtQCtWpYKHeHrza7IcKky/htWM6QZYiyeNtEH5
         NEvON8UrVVnRFbLtOLwdxEyPx3SBal6XMk2T8HBJNP/gsOd/AvoJpukyf26+2zwKq27E
         Dl/OuSX9DcVEiMKZt996eaFBUd6PnySYH7JstiN9yjQANe2SOS33k/87uO3SBv7wEeAF
         rKGQMsqaGM5oZ18XsUG/G5wU5q6IL0pqxS2GjEOkWVRBqbpEtJDhHHwyciSERVuFRvWK
         hsAvFqTB3/RfZXiSdhL8tDyDeOfMXzdpj2MCf18j9s8HtwahPMHXceO0kaokQQUki17X
         nhaA==
X-Gm-Message-State: AJIora/RdSnXkg36U3yW0vqtWiZrRNJ0CQfUUrcqtfk7l7/fyUenmUSz
        J9Ej8eb+5/cdiM82lXXMNPaCaQ==
X-Google-Smtp-Source: AGRyM1sWVjZjQHgVWRK8s/dl/ZuJ1HFXlQWI+LwMkSJuMnWE/tkDujzdoKZtuVRRNgiAb1n6ooKxOw==
X-Received: by 2002:a05:6512:1318:b0:482:ae30:fc77 with SMTP id x24-20020a056512131800b00482ae30fc77mr5851356lfu.279.1656955496275;
        Mon, 04 Jul 2022 10:24:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u15-20020ac2518f000000b0048152c51812sm2339596lfi.154.2022.07.04.10.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 10:24:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 2/7] dt-bindings: clock: separate bindings for MSM8916 GCC device
Date:   Mon,  4 Jul 2022 20:24:48 +0300
Message-Id: <20220704172453.838303-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
References: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
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

Separate bindings for GCC on Qualcomm MSM8916 platforms. This adds new
clocks/clock-names properties to be used for clock links.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-msm8916.yaml      | 61 +++++++++++++++++++
 .../bindings/clock/qcom,gcc-other.yaml        |  1 -
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
new file mode 100644
index 000000000000..564aa764b17b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8916.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8916
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on MSM8916.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8916.h
+
+properties:
+  compatible:
+    const: qcom,gcc-msm8916
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+      - description: DSI phy instance 0 dsi clock
+      - description: DSI phy instance 0 byte clock
+      - description: External MCLK clock
+      - description: External Primary I2S clock
+      - description: External Secondary I2S clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+      - const: dsi0pll
+      - const: dsi0pllbyte
+      - const: ext_mclk
+      - const: ext_pri_i2s
+      - const: ext_sec_i2s
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clock-controller@300000 {
+      compatible = "qcom,gcc-msm8916";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      reg = <0x300000 0x90000>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 6c78df0c46a9..61b90e836b5b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -41,7 +41,6 @@ properties:
       - qcom,gcc-mdm9607
       - qcom,gcc-msm8226
       - qcom,gcc-msm8660
-      - qcom,gcc-msm8916
       - qcom,gcc-msm8939
       - qcom,gcc-msm8953
       - qcom,gcc-msm8974
-- 
2.35.1

