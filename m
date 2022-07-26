Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFB658125E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 13:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237981AbiGZLwJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 07:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232717AbiGZLwI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 07:52:08 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE4632EC3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:52:07 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t1so22238932lft.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g610o0FM4Xw34WWwumLukW80tQhkdeJbk6IaR7mFIqk=;
        b=kBaF0r4YaHJRbh5V44q5o03GzLpcEOucr3ltIn+UMm8T1eWReUQCvBsbF8Y5x5QtOR
         scCfkR9n5Uwnr2AjYj85NH33ytoJKPJ0b9zDRxxPxE/zu17lUJFiKsSAHD5aGJ6o7GjK
         uDZBcQd7P68AHKj7f/PZhfqLE/68EPfGuoy/zIy9omHg2orn5je+EEMuk8WSFW/0Oh19
         2Ww1+RxsDgmytwiKcrt7YAjX85OE0H85p1CoUQ5DaV/V9dZIy1qp8iZKlcvn+J2Z0Eo+
         KPCaVODtAZ0jpGpmVhrPU+icGqEm8Lc+0ghzVZaECdADXaL/gBTo7DibxL3Rn7abYKQq
         0OJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g610o0FM4Xw34WWwumLukW80tQhkdeJbk6IaR7mFIqk=;
        b=2gysfGZcaIVv6IVhPUlLmAIjUt6xRCYr0O8eEV+PMMAA/XpWw68piZBnFw6avGsbFv
         bb9XiGWrEtuyvGNQ+bgmxtay5AlYW/zkPUmqv8YFfJFviZEMUoU+P3g+Vj/wDTB/xlyG
         eVWW2P91rRevUTjIsFBnGIHku+H/MOnbRQfMtpNSihyVChpHdJxv9V6WxfQDitnXp0HD
         LZokZvU+hnvHW6uJXH6QZ4dJTDDXY7YHSHCsrtqEQh1yW08BGoFkVu0swGNCVJwvzgwV
         mE7qUGI0vlFFTL3QjxzaHwO2bBmVfUvK1ECSjqU/LQu6wman5HsgQ+qOztDiWbKUcN0O
         CQ2w==
X-Gm-Message-State: AJIora/gNbWYGcYks19slPEwMeAulE94Exq9FEOmdn83DCFtz9fRaVE9
        LFUqmmJS3fXvikMRYxkxbRCsYQ==
X-Google-Smtp-Source: AGRyM1sCMrmSP9VlJQn02f5I/simnfIKZufl6hZipxlZUYnQ70rZOTTXLPYi/1iTbOhE0FA560kovQ==
X-Received: by 2002:a05:6512:2821:b0:48a:6a01:3d29 with SMTP id cf33-20020a056512282100b0048a6a013d29mr6564937lfb.649.1658836325541;
        Tue, 26 Jul 2022 04:52:05 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id s17-20020a05651c201100b0025d30dba34asm2163679ljo.113.2022.07.26.04.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 04:52:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: add PM8226 constraints
Date:   Tue, 26 Jul 2022 13:52:02 +0200
Message-Id: <20220726115202.99108-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the constraints (number of GPIOs) for PM8226 variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 6bc84779b092..694898f382be 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -159,6 +159,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pm8226-gpio
               - qcom,pm8350b-gpio
               - qcom,pm8950-gpio
     then:
-- 
2.34.1

