Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F39AF50FA0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 12:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243687AbiDZKUL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 06:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348663AbiDZKSH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 06:18:07 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2CA136631
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 02:41:52 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id y19so9932753ljd.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 02:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oPLNTV7n0Ijb4QN5+/ZP2G9taYmSFsaYJE9s/1u9hZM=;
        b=IT9mK2eoGUOIpdf1Q2IMc+OQyH3OeGKt1vz56WDGc8UWW1sxqL2BYBk4sECBkmNuCq
         6Ws0vp6DOahvYB9133CJYMBwrPPD15dKg/bnu9Y8K0W4DFJN9jvYS+5QEEFfWpjnJUxd
         rHOvUcGrXyCeMQaPtATLWwBSut3HR/GZNXQ3D1uaJpZaO7f88E1axyvlQHgKtKzoVif7
         BmAMHIiijOdTbe760WL+8a8bnmBD2x802Kdx3FSsGI9GiZounpJ47jxk0yuc3v0XgVmo
         RtcFCuSsNYeDE0xvMWSbGngpPJv5oBw7Z35/LjtIkvKEjdBXXnFyZRSjs7pGRbSd3Tt+
         EVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oPLNTV7n0Ijb4QN5+/ZP2G9taYmSFsaYJE9s/1u9hZM=;
        b=fxKvtXpTwG+ZaPxMsOYtC/OWccZHM+RUGSVRh8C83R9y2dirjeTYpGMJwu/wSoslwH
         c/351g1dLC6+E2z3hoaTw5vm9FZtgychtrOi1zRFHbpP70koLDJgGb1DaydUj23uV4t2
         6er20qnGsLEuZzVAfEdlGiwKi5nIUlyQZSFDOy5NvKa3PAF69XQ2Tu9r3ayB3Gbf+CBz
         AEiPinmPnPKqLWQpnJb77pBcPNeq9OFGY9PexW1A6Z8adQxgR+Yr1fD2DBS8Fg9TJNrB
         szuWHAozraGquc+2aYj7GRdtYBxypV3xwgAlQMOG/zPJ4q9XqjwCRaxW/Al+lPP9tIiQ
         e6YQ==
X-Gm-Message-State: AOAM5324/7zKnkkl8s1vt4Gzt8azcGNMOvxl5VDS6wMGzSDkPF313lYN
        yO+LRYBxfRgmG+Br1rbaMNbMxg==
X-Google-Smtp-Source: ABdhPJxgDm/fyRI4MiY9vpmBbhCagFjJGzxR3PP62y4dLAuol0ngRjqo5SRL31C8w7+svvwwsfoQgA==
X-Received: by 2002:a2e:b8cc:0:b0:24d:c4a0:7ff4 with SMTP id s12-20020a2eb8cc000000b0024dc4a07ff4mr13947382ljp.378.1650966110734;
        Tue, 26 Apr 2022 02:41:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.30])
        by smtp.gmail.com with ESMTPSA id y28-20020a19641c000000b00471f6806403sm1330117lfb.16.2022.04.26.02.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 02:41:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        quic_tdas@quicinc.com
Subject: [PATCH v4 3/3] dt-bindings: clock: qcom,gcc-apq8064: split tsens to the child node
Date:   Tue, 26 Apr 2022 12:41:44 +0300
Message-Id: <20220426094144.2958416-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426094144.2958416-1-dmitry.baryshkov@linaro.org>
References: <20220426094144.2958416-1-dmitry.baryshkov@linaro.org>
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

Split tsens properties to the child node of the gcc. This follows the
lead of ipq8064 (which also uses a separate node for tsens) and makes
device tree closer to other platforms, where tsens is a completely
separate device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-apq8064.yaml      | 45 +++++++------------
 1 file changed, 17 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index b867da12761e..f2762599f679 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -23,47 +23,36 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,gcc-apq8064
-      - qcom,gcc-msm8060
-
-  nvmem-cells:
-    minItems: 1
-    maxItems: 2
-    description:
-      Qualcomm TSENS (thermal sensor device) on some devices can
-      be part of GCC and hence the TSENS properties can also be part
-      of the GCC/clock-controller node.
-      For more details on the TSENS properties please refer
-      Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
-
-  nvmem-cell-names:
-    minItems: 1
     items:
-      - const: calib
-      - const: calib_backup
-
-  '#thermal-sensor-cells':
-    const: 1
+      - enum:
+          - qcom,gcc-apq8064
+          - qcom,gcc-msm8060
+      - const: syscon
 
 required:
   - compatible
-  - nvmem-cells
-  - nvmem-cell-names
-  - '#thermal-sensor-cells'
 
 unevaluatedProperties: false
 
 examples:
   - |
     clock-controller@900000 {
-      compatible = "qcom,gcc-apq8064";
+      compatible = "qcom,gcc-apq8064", "syscon";
       reg = <0x00900000 0x4000>;
-      nvmem-cells = <&tsens_calib>, <&tsens_backup>;
-      nvmem-cell-names = "calib", "calib_backup";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-      #thermal-sensor-cells = <1>;
+
+      thermal-sensor {
+        compatible = "qcom,msm8960-tsens";
+
+        nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+        nvmem-cell-names = "calib", "calib_backup";
+        interrupts = <0 178 4>;
+        interrupt-names = "uplow";
+
+        #qcom,sensors = <11>;
+        #thermal-sensor-cells = <1>;
+        };
     };
 ...
-- 
2.35.1

