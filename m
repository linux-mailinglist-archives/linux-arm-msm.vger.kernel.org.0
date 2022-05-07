Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D506E51E999
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 21:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446812AbiEGTxP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 May 2022 15:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446871AbiEGTxN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 May 2022 15:53:13 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A9817AB2
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 May 2022 12:49:23 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso8681457wma.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 May 2022 12:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kw5YZ04RaC5TF/c9OWgq1MFTANMDOhl3ugmuJ0GkdcI=;
        b=kiLkhgPG3EQK79wFbKkwcwQhX1IicdWu1W9AaDqwA/+aeK62c9WkU7Xcy9HhCR37ZI
         Z6OtKg9AaD12A/L/uaRlweu9JyE0Lpwd0NpyAqm6yzMfHIZdtXdl10697LLT8QheB5Kj
         3rqYHQc3V+23g2RjBAjlg01L0ym0RjpwalB1RzfO/gCKAOKdO0opVVhwC/xn5/XOY3Dy
         seWpVf3t4poy4RzrIAXSLFdYpi2QiwZXPxPMxVWFDRH8HUMZfRUrR9m5hudeQ6z/KX/z
         Z3/gGAfTxpoBVtplPT4NXgXyxVKp2GseJ2e7sMNVcq81blgMJxyUaYf0GQzK4vYxivEk
         M6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kw5YZ04RaC5TF/c9OWgq1MFTANMDOhl3ugmuJ0GkdcI=;
        b=RH250gEtfJvgb3UtP2KL9Q9uxfgKhzSVzRgpwZ2c8paRpFSn9ae0v3OmVRoQjGeFjY
         8PgKiEz6x8ccq1ug16WN9e2A8ftQP5HdFlPUVAbF6LM1PB+Kj/KPbo6iJc2yIAC4qrWT
         j1LiTCwbs6EP/hnMzCkVQ0i7YTi4aR7j8UM/0GtefiTH0o2l+Q39uWaV87rOVk5gOpFN
         /UXSbnELStN48suAF/qBB0kQBW2rnurLNksDF8fh4/Ww87ADXnMtB5POSjkbtM3/ezgV
         57LPPnhqY5lbzJSvcDo3w4I8180Qc3By0s2DCz2NP48GO7ypqlCfc/SStUpBMaOIwaTo
         OHQQ==
X-Gm-Message-State: AOAM5312tBeLuHhzStuvDu+A6GqY1VAl5ITAX2eGZY/jaGAMWU1Y6chU
        x0E1usEib/iRGImCebKXbvtyKQ==
X-Google-Smtp-Source: ABdhPJyLr87kVkCuEVeZ1cog5/UfK8IWliGUfmJ1UYaLfRP2/T5N8swWJYkKIQTBpIHsG4eoE4Gi/g==
X-Received: by 2002:a7b:cd97:0:b0:38f:f785:ff8 with SMTP id y23-20020a7bcd97000000b0038ff7850ff8mr15332104wmj.44.1651952962001;
        Sat, 07 May 2022 12:49:22 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c1c0600b003942a244ec4sm8535027wms.9.2022.05.07.12.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 12:49:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/11] dt-bindings: pinctrl: qcom,pmic-gpio: fix matching pin config
Date:   Sat,  7 May 2022 21:49:04 +0200
Message-Id: <20220507194913.261121-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
References: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
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

Matching PMIC GPIOs config nodes within a '-state' node by '.*' pattern
does not work as expected because of linux,phandle in the DTB:

  arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: gpios@c000: divclk4-state: 'oneOf' conditional failed, one must be fixed:
    'pins' is a required property
    'function' is a required property
    'pinconf' does not match any of the regexes: 'pinctrl-[0-9]+'
    [[2]] is not of type 'object'

Make the schema stricter and expect such nodes to be either named
'pinconfig' or followed with '-pins' prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 23d6b9165e20..c266aa3f05c1 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -95,8 +95,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-pmic-gpio-state"
       - patternProperties:
-          ".*":
+          "(pinconf|-pins)$":
             $ref: "#/$defs/qcom-pmic-gpio-state"
+        additionalProperties: false
 
 $defs:
   qcom-pmic-gpio-state:
@@ -237,7 +238,7 @@ examples:
       #gpio-cells = <2>;
 
       pm8921_gpio_keys: gpio-keys-state {
-        volume-keys {
+        volume-keys-pins {
           pins = "gpio20", "gpio21";
           function = "normal";
 
-- 
2.32.0

