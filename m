Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54BD862B75B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbiKPKME (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:12:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbiKPKLt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:11:49 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EE421E0D
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:11:48 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id v1so29048105wrt.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Qej+X9L0LDwif2YwJHaq/jZ9PPv+8zS7y3TDz6dHpM=;
        b=Uq+R2iDQp5PciR2jHtrmk8i/Dq01exWTwx0SqNq1Pj2UXSc7qi2MzrUgUrJt+hnZ26
         QkoA/WztanSIUaPFvF70pF5U5CACe+zQmdSRTmGTQpo1gvEbO/n4kuEzR9CxCRcEgJ7C
         3lOJww7/8vzAnvGGt64kw4lLJg6w6Sep4a9c7UmHJO+4Qil38XLPjl+0u+Ni4BYnEYSe
         DaXFXy1wB63NAxbWepNwSvOyJKQReL0r2px/9QrbdcTGVAmKOOGMJ7lVewCRPjEQCx4s
         LMhH2lodhkK3MeRS5Jj53gyf/CBDaxgzNEM6h1QOinhgJLdv41SDZZXwrS7RhuGsRr4N
         YZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Qej+X9L0LDwif2YwJHaq/jZ9PPv+8zS7y3TDz6dHpM=;
        b=eBT0qLILWXM/Nr/j3XzIFNw2SqTvyvzpwyjkZzpKRwHVFWQqXTX7yB3HKTR63qiwMO
         GQb5auxiZuMQWYnmxuobzCu5UHkPZl2yT1Kgmy5sN4I4NaOF9H9R/U81N63BVwRzfv/9
         fvGLkgbVhiI+ttLucZfkzpq2yc2FNC11HZ1yuteBTXbVr//mHrzMAYFrPqQ0nRTCr1ww
         bVoKTLFJiP+Nc15R3oFOFkSbmcWdaxlH+6dzim3o399uSutO6NeZO2p7Ddnl4WE5OUJC
         hTyvD6ZiDHW1JwfZrRgPLfrMIk8NYGX1SkA7/wL9Ag9zebPEW8i88SZeGkiIoXekZq7/
         FQGw==
X-Gm-Message-State: ANoB5pkFqFVRO0dAG4DDRs07AavhsP2zL0GJX9zZlw7p5Y2YlHaVZ/gD
        EIAjDDnYrsRKxUiodO7Rxep8yA==
X-Google-Smtp-Source: AA0mqf5bwdV7+IAFS9abch8kfaDbStiEwno2CxvELKhTbNGkd+vZAnf3MUiuVS80w5aq4WzSiYqkRA==
X-Received: by 2002:adf:df92:0:b0:241:8e98:42f with SMTP id z18-20020adfdf92000000b002418e98042fmr7871862wrl.206.1668593507111;
        Wed, 16 Nov 2022 02:11:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id h12-20020a05600c350c00b003c6bd91caa5sm1741752wmq.17.2022.11.16.02.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:11:46 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:11:34 +0100
Subject: [PATCH 5/7] dt-bindings: pinctrl: qcom,pmic-gpio: document pmr735d
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-spmi-v1-5-6338a2b4b241@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-gpio@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document compatible, pin count & pin names for pmr735d.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index a32e4b4566bb..db505fdeac86 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -61,6 +61,7 @@ properties:
           - qcom,pmp8074-gpio
           - qcom,pmr735a-gpio
           - qcom,pmr735b-gpio
+          - qcom,pmr735d-gpio
           - qcom,pms405-gpio
           - qcom,pmx55-gpio
           - qcom,pmx65-gpio
@@ -116,6 +117,7 @@ allOf:
             enum:
               - qcom,pm8008-gpio
               - qcom,pmi8950-gpio
+              - qcom,pmr735d-gpio
     then:
       properties:
         gpio-line-names:
@@ -440,6 +442,7 @@ $defs:
                  - gpio1-gpio12 for pmp8074 (holes on gpio1 and gpio12)
                  - gpio1-gpio4 for pmr735a
                  - gpio1-gpio4 for pmr735b
+                 - gpio1-gpio2 for pmr735d
                  - gpio1-gpio12 for pms405 (holes on gpio1, gpio9
                                             and gpio10)
                  - gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10

-- 
b4 0.10.1
