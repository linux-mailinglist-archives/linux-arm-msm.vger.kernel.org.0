Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86F0451E997
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 21:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446916AbiEGTxN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 May 2022 15:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387004AbiEGTxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 May 2022 15:53:12 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D54B17075
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 May 2022 12:49:22 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id p189so6311607wmp.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 May 2022 12:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UG9+cIig2tf9rl736/AVv78nJje23FHX5KBYsT/BjQA=;
        b=EMbGODijqIlISgN1pdNil9wjlUNJjOspKbP6duPQiKQvHoqy1zqqVDZxlp+k9oX1Wf
         8e6nOWSdQNIHRktRwFOzbyck52pPnrFaOacopd/neEE8iZVoixi+VtFeKt+/znRJnl2j
         1QdadhiUoUAWE9/IWpvWefhnvYIneeWsWUFPaGahBCrDQsrHGJ7uC82/x9WwnPGZRtKO
         7sILMAXYyFyuXfNN2JuyEfYgLMHR3Bff25u+GjUmbfT3I61mGtTEgNHYNzMweCFjka6a
         ZD3oC069Md4bOJavsL8qcSbStgtIv38Gqf/ry4Bc4a2osRqXEh7th8bnDXVs4h7HRqQ7
         rulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UG9+cIig2tf9rl736/AVv78nJje23FHX5KBYsT/BjQA=;
        b=lwDaYsGH872f7jWmOhkAyL6MDZAuM88vpYb8kjKx8M/iyPOOwLnuTy4XNU5J6BDH65
         iB4Nd8V0K+j0pZvn8sEoBCRSAC7u0uPDWr3pCqjxqgx2FxD96rBpDk6irogld4IGb/Uc
         YLTBqP/gImQwAaqoh9162Yl5o9ybP3G8eJKlfgOKZU58KvQSWpCqAREEcAPCSXIXp2tr
         96b4SlYqyZxhZ6vo4WFEpdWX+z9kOwV1l/mBXdAIeEE4yUS0Q33m3oMeMY4mLjkWOGxQ
         SpzKRio1H9OX1Wt9Iwx7cPbOEWhVfMEVxxsznMYCP6jO1NmZZiiZm7DYxxhhlKtZ/FIp
         14vQ==
X-Gm-Message-State: AOAM5325SYqy+i3MPJ8bEV+HwZXtXveayDtPeKRNyKmSkxEpBqrcVuHZ
        uYWNrd/wjsX1EJhaOpNSnsUEtw==
X-Google-Smtp-Source: ABdhPJwuMW64Rcvj5fMdYDpnbLoGwSodlAvje7aQa+DJrIzbCs/DKPagFoz3Lj6faPBuIXVQpeIFeg==
X-Received: by 2002:a7b:c5d0:0:b0:389:fe85:3d79 with SMTP id n16-20020a7bc5d0000000b00389fe853d79mr16043414wmk.77.1651952960901;
        Sat, 07 May 2022 12:49:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c1c0600b003942a244ec4sm8535027wms.9.2022.05.07.12.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 12:49:20 -0700 (PDT)
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
Subject: [PATCH 01/11] dt-bindings: pinctrl: qcom,pmic-gpio: document PM8150L and PMM8155AU
Date:   Sat,  7 May 2022 21:49:03 +0200
Message-Id: <20220507194913.261121-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
References: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
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

Add missing compatibles for devices: PM8150L and PMM8155AU.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 22dbcba752d0..23d6b9165e20 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,pm8058-gpio
           - qcom,pm8150-gpio
           - qcom,pm8150b-gpio
+          - qcom,pm8150l-gpio
           - qcom,pm8226-gpio
           - qcom,pm8350-gpio
           - qcom,pm8350b-gpio
@@ -49,6 +50,7 @@ properties:
           - qcom,pmi8994-gpio
           - qcom,pmi8998-gpio
           - qcom,pmk8350-gpio
+          - qcom,pmm8155au-gpio
           - qcom,pmr735a-gpio
           - qcom,pmr735b-gpio
           - qcom,pms405-gpio
@@ -135,6 +137,7 @@ $defs:
                  - gpio1-gpio2 for pmi8950
                  - gpio1-gpio10 for pmi8994
                  - gpio1-gpio4 for pmk8350
+                 - gpio1-gpio10 for pmm8155au
                  - gpio1-gpio4 for pmr735a
                  - gpio1-gpio4 for pmr735b
                  - gpio1-gpio12 for pms405 (holes on gpio1, gpio9
-- 
2.32.0

