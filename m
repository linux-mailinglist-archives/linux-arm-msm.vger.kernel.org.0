Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 953E95B4E40
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbiIKLQP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiIKLPu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:15:50 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C83F33A0B
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:13:21 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id bt10so10405869lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LY6MROhdDWqu/4edFHort3LM4phvkt99NZ7SpMsHito=;
        b=UlXwv8zHCBGWyOuF0fWGnm/+ajG1lCVWlYEsBbu/dKAvoHgwdqOuQgjf/WTOzXSvUq
         MqrbG3c8nac+2YDkXM7lDCliEMZm2Q9693NYyn/7thWYtKG2+fDMmCh16CkxP0xQBWak
         yVIBYEgDNEALssE4NdniucFuuaqHJAlbkR6H/NZiUqYp02tQxdJsLW7n1Kgfg5fwcUxf
         AXxb34hgNGmQv0niVlnCuIlqF51KT8+u8vYR2iza4VmyvXiENAwTwjZB2evzmqYHLWKl
         fzwpSwZETKk4A27gXcd3BPk8SSl8C/t4Q1+2ceHaOeE/5KEOMwOnyVFXURUG8TffgOWZ
         gn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LY6MROhdDWqu/4edFHort3LM4phvkt99NZ7SpMsHito=;
        b=gZxZiMN12L5LT8eXazmd7hSSjwuXQZTJH4oafP8J8KfbdU1K0awTRTZQt4igtizZ+k
         g+2iUPvxsDIW4D30GcnXmxZd0KVHLTayQnaJDM9twqtyMJHS/HjP4CkWShTS4YKF/CEd
         GyZvBY0JxV7KAp7bg1IdRRjsyvmHocBfYgvMLZVXR4D9JoWtt3xHJoDvDIaSoi+QZDx4
         bwD3FuIy0KlPpF6/x2QEOwBeVNMRLLdVNkP6pD2Hkem2HtmZiWge4yHF85qwrrY61bho
         wCI6sgy7yvj9W2S9HFY9JkiqBbwMvaKwmd2lr19bEIEDehqOjm7fxZn2cLl7xrpr7gzF
         WZYg==
X-Gm-Message-State: ACgBeo1yVUpHnW12xeZh8pWWyuqBMpH/8uHC+Y4tx7TM/rhQEJKxYy58
        cqAGAPfYW1YDU93kaJFzYoJeow==
X-Google-Smtp-Source: AA6agR75JudROwn7bBCFv7WnkmTOAERMdjhFVJG5LusllC9UtEA8ZA4zgLpjORcn6SoUc/vBMI+PDQ==
X-Received: by 2002:a05:6512:3a90:b0:48a:fcf6:3137 with SMTP id q16-20020a0565123a9000b0048afcf63137mr6654623lfu.255.1662894764144;
        Sun, 11 Sep 2022 04:12:44 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:43 -0700 (PDT)
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
Subject: [PATCH 31/40] dt-bindings: pinctrl: qcom,sc8280xp-pinctrl: fix matching pin config
Date:   Sun, 11 Sep 2022 13:11:51 +0200
Message-Id: <20220911111200.199182-32-krzysztof.kozlowski@linaro.org>
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
 .../devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
index 87a381c9a19d..5147afc28721 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
@@ -43,8 +43,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sc8280xp-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sc8280xp-tlmm-state"
+        additionalProperties: false
 
 '$defs':
   qcom-sc8280xp-tlmm-state:
@@ -135,13 +136,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                        rx {
+                        rx-pins {
                                 pins = "gpio4";
                                 function = "qup14";
                                 bias-pull-up;
                         };
 
-                        tx {
+                        tx-pins {
                                 pins = "gpio5";
                                 function = "qup14";
                                 bias-disable;
-- 
2.34.1

