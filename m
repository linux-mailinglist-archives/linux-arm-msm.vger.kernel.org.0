Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54F955B4E0C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbiIKLO2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbiIKLNc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:13:32 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E373C8FA
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:41 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id m15so10343411lfl.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qSa6F8HJSYWjDBg+j7oIEuAdlpcYu3Iz+kDxwwRpkho=;
        b=fcT6LABS3+06XZ+IpQVOFKLZ6waL4mRDByzgK2SU8YdN3vIM7Jhblze2xDl5hWgPvc
         HIp4AnYPRme4ihYksJnB9YqXhwGhMbPRLTBB+panMzpn8Ztmyi44R0rhdk2JksrzMKoK
         LtpCMFtY06R3b86YngSFYaq5gSi/KaBGHQRfaaMF4E8WhCtup5wYrXh137Mna1v1LS2M
         lAkMq0BuA5ZH5/YMHAgS3tK0OLGcfNSWdVQn9XjW7jUb4voorburunyWw5jc6SfxmDW3
         NOmU5rDsN2VENXGG22XR0jG3/j1x+bYd7/N3qrg0JXrtyZW0hYZxwrPjhhQ7dW08up2c
         jb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qSa6F8HJSYWjDBg+j7oIEuAdlpcYu3Iz+kDxwwRpkho=;
        b=GYZM3cHGZLS+YDJoQ2DLW0hCcXwJCAVWq0uoOaGdwCS1mlOIm9TJocfR6PexCsoJdv
         gW3uWO5vD82bqRw0mkG1qU6KuvT+4Gi3U+W7tyYTqjQsT4C8QJlZThuma54Yag67a9QN
         qsUQlIM18dDMPiBrVah0vFhWxovl9LXd+0WdVwReOneAZqgmpLUdzVf+Hmbftep53iTq
         JLIaDNbYuHhJXcRGbrSE/X7axM5w5I1Strl65SLwYTL1GJzO3DPEj9cdSuXi6FVWblLQ
         /E+RRk3U/D5PnM74UjrGbR2kKu0mTwfEVdOvMmbsNmFM/uhyNOXq3FqV9VAS1Or98QmC
         gwcQ==
X-Gm-Message-State: ACgBeo1wiUld34wz/FfE2ls3PIY/PdkI4tOydL2rx2sdOB9m4CDMcD0C
        jXvZ1M9CLgjbdeWZJnVku8gKcg==
X-Google-Smtp-Source: AA6agR5YHFeNsypLF6H4/v9a+555z9gDBP6k/IZpoOWSqfNKrbVWO4xSoWLUtKAtlz2xtxkSqGZnqA==
X-Received: by 2002:a05:6512:1588:b0:498:eb9c:2fda with SMTP id bp8-20020a056512158800b00498eb9c2fdamr5306190lfb.91.1662894760677;
        Sun, 11 Sep 2022 04:12:40 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 28/40] dt-bindings: pinctrl: qcom,sc8180x-pinctrl: fix matching pin config
Date:   Sun, 11 Sep 2022 13:11:48 +0200
Message-Id: <20220911111200.199182-29-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
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

Matching PMIC GPIOs config nodes within a '-state' node by '.*' pattern
does not work as expected because of linux,phandle in the DTB:

    'pins' is a required property
    'function' is a required property
    'rx', 'tx' do not match any of the regexes: 'pinctrl-[0-9]+'
    [[59]] is not of type 'object'

Make the schema stricter and expect such nodes to be either named
'pinconfig' or followed with '-pins' prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
index 86509172603d..646fabdf81f7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
@@ -51,8 +51,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sc8180x-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sc8180x-tlmm-state"
+        additionalProperties: false
 
 '$defs':
   qcom-sc8180x-tlmm-state:
@@ -137,13 +138,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                        rx {
+                        rx-pins {
                                 pins = "gpio4";
                                 function = "qup6";
                                 bias-pull-up;
                         };
 
-                        tx {
+                        tx-pins {
                                 pins = "gpio5";
                                 function = "qup6";
                                 bias-disable;
-- 
2.34.1

