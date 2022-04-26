Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156BB50F9E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 12:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348729AbiDZKOd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 06:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348653AbiDZKNY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 06:13:24 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D6222BE6C
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 02:36:15 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id v1so17783209ljv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 02:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aqpv+MsraYmAMNWLkARIliibZ+YyOcALvDsEFEi8Sgw=;
        b=Fbc3VR9sFt2gzNsdu1qRY34I7dNBHhEavjo4EoxtDEIPoyfwt+HBDOljTWASj0kZ3u
         5LuLxbpnFqSpYvFOkMwGb+pwGwvKQfNnjoCepxXubyPjMH9stI+S3ZfzZ+wx8BJ0SUNU
         nVFZ9NyWhTQw/wCNVUJQjpYrtFba0rPqIegEMVE7fHJIp8dcaFPqStR01NmGQamDrk8F
         pyKEZ4X2MqJtHZVT2ZnHKbXgSBhiSa91YkVBTq5PU9N2NsLC3nUoTdE31gzIVhxGjvlT
         HM68JF5uQi5a6WljlSO/qiyrhDTK/C5G8EpTdoJlb0huzVdUo98FPQnGPFlDpStlFEpW
         BWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aqpv+MsraYmAMNWLkARIliibZ+YyOcALvDsEFEi8Sgw=;
        b=3TvRo9ZNKkY8xXI44pSda+5yV1EdsGPi4Kkfw0EfydPDZ1CH/W8upY9meWm6QvCrck
         JnfVMU8LZmcorhnkMRRZHw+sFlazY+xYRggt5BCmjn/iWtcHTZwzodDYYOAijXOltaFa
         vKwkt6JBaUG88ZAb6i9M5Uq04EVBXx/mg+o0vvYvz5F5nmKykY972s2HfFW5UxPp0+C/
         hGYwSnsAURzCjEBmyUzmqgGKPO/3qR7krv5dRuSXYXobb0uYkRLzI+7AlZU628b2d/Ba
         Fjmfuc8hHkzpzeh15Y9gvQh36H7M+1tJdvfzhPcNNqk3xW+qYLFtLCcPIXmwdRDxj1m+
         Hq6A==
X-Gm-Message-State: AOAM532g/rlIEPcbUoZia3CA0Zs5TJg1hSJvUnRs/eMbGrlWBe9uNliu
        yqW6/a/n/JlrxhP8O7CAmVLdwjmAUbpaVQ==
X-Google-Smtp-Source: ABdhPJzQIFvoHDDbUzZA1glQx6vzXXSepDbgZjA5QEZ96AYEuu6jJ00WgexUTqYIwDrQ75CVGTaA1A==
X-Received: by 2002:a2e:8617:0:b0:24d:a185:76c9 with SMTP id a23-20020a2e8617000000b0024da18576c9mr14013870lji.312.1650965774112;
        Tue, 26 Apr 2022 02:36:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.30])
        by smtp.gmail.com with ESMTPSA id x23-20020a056512131700b004486c863c8esm1684232lfu.257.2022.04.26.02.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 02:36:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: clock/qcom,gcc-apq8064: move msm8960 compat from gcc-other.yaml
Date:   Tue, 26 Apr 2022 12:36:08 +0300
Message-Id: <20220426093608.2957210-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426093608.2957210-1-dmitry.baryshkov@linaro.org>
References: <20220426093608.2957210-1-dmitry.baryshkov@linaro.org>
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

MSM8960 shares the design (and the driver) of the global clock
controller. Move it from clock/qcom,gcc-other.yaml to
clock/qcom,gcc-apq8064.yaml.

As the eaxmple in gcc-other.yaml was using the msm8960 compat string,
change it to qcom,gcc-msm8660.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml         | 6 ++++--
 Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml | 5 ++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index 9fafcb080069..bd7b04c75e50 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/qcom,gcc-apq8064.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller Binding for APQ8064
+title: Qualcomm Global Clock & Reset Controller Binding for APQ8064/MSM8960
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -23,7 +23,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,gcc-apq8064
+    enum:
+      - qcom,gcc-apq8064
+      - qcom,gcc-msm8960
 
   nvmem-cells:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 142402f29d98..9c69083bd93e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -47,7 +47,6 @@ properties:
       - qcom,gcc-msm8916
       - qcom,gcc-msm8939
       - qcom,gcc-msm8953
-      - qcom,gcc-msm8960
       - qcom,gcc-msm8974
       - qcom,gcc-msm8974pro
       - qcom,gcc-msm8974pro-ac
@@ -61,10 +60,10 @@ required:
 unevaluatedProperties: false
 
 examples:
-  # Example for GCC for MSM8960:
+  # Example for GCC for MSM8660:
   - |
     clock-controller@900000 {
-      compatible = "qcom,gcc-msm8960";
+      compatible = "qcom,gcc-msm8660";
       reg = <0x900000 0x4000>;
       #clock-cells = <1>;
       #reset-cells = <1>;
-- 
2.35.1

