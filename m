Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC5E596DFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 14:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239202AbiHQMEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 08:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239192AbiHQMEU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 08:04:20 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B292D4D241
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 05:04:15 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id x25so13349199ljm.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 05:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ReOjLSRdM73U3T0jSSkVf1kkbc1X9kpMxiIghbKwlM0=;
        b=z0TsarAxIowZ9kSH9JdfzT94ayGy1+6y9CBhIAvRIXYPpHTdcOP2rigvWy3itZufME
         R0TagUtnAhzsaNXXZGhTU/b7hPmV/r50VgkD0Du020fiGzIJi/tjt9ivXGzNOMqL04vZ
         8Wjm3HK5lgRcW5JryJas9fiPVVEc+jtjecO1I9BtrYCxZM9pGvtCksp3+cmPfFqwfZ3x
         nqxKnPrq8YbmUtV28KGB5vNetemnGIYXsP3IYzORMDW1GqPgT8TBcWib4MBWX5WM4Nsl
         AbhGOzqQ0OwmWs4tGwE8KdRKtj/38oSsBXzWP3rKcfg9rQvidJJgIxtw3UC0GXv1ACV/
         9mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ReOjLSRdM73U3T0jSSkVf1kkbc1X9kpMxiIghbKwlM0=;
        b=vuykb3J5ijiSP6QQKLJlCLHfhSTvIN1LDjQwaGT2erFrYhrUCeEHblPWeb3fxL+u+6
         RmLKI/wacrr7MXWKbBUtIrW5DjoNT83jXfaj8frW8Ev5K9acwXV/iTjTbCFMuKFrBgkL
         LeYGebSx9l7dOV78l3D2vtX6tvake/ExHNMpouQOcGlAUFBujx76/GzeOuFohAbDlG4Z
         k9B3Kt/xTIEmGwIJIPv9MqaRpxQKqs01l1/YBXMWHJh2munY1m2qMgx839A8aQf1YjCh
         j9U9Wmg+Dx1SL7te3/J27DcEY0aRnb1v++BKgP2QGnJlUQYY5VnSSYTVD9Tfh6vKc9Vh
         vYmw==
X-Gm-Message-State: ACgBeo3PoAFZ3k2qEd8h54QQbOSpL8lhKIBROAIOkJPNeY1bmmnxSu+a
        aOz5FxuK4eDnpGFyMk43OPB6Fw==
X-Google-Smtp-Source: AA6agR4HaRuQaKBpbYd2r7g/Qd0i+GDhUEFiJdCWvdd78tKYkxTUqpJzc2jYZuh9mukaJIWD0s2AIA==
X-Received: by 2002:a2e:b911:0:b0:261:8189:64e7 with SMTP id b17-20020a2eb911000000b00261818964e7mr5077716ljb.179.1660737853970;
        Wed, 17 Aug 2022 05:04:13 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id d15-20020a05651221cf00b0048a97042251sm1670496lft.22.2022.08.17.05.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 05:04:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 01/14] dt-bindings: mfd: qcom,tcsr: add SC7180, SC7280, SDM845 and MSM8998
Date:   Wed, 17 Aug 2022 15:03:49 +0300
Message-Id: <20220817120403.458000-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817120403.458000-1-krzysztof.kozlowski@linaro.org>
References: <20220817120403.458000-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document existing (SC7280) and new compatibles for TCSR syscon
registers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 2f816fd0c9ec..849295b058b6 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -18,6 +18,10 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,sc7180-tcsr
+              - qcom,sc7280-tcsr
+              - qcom,sdm845-tcsr
+              - qcom,msm8998-tcsr
               - qcom,tcsr-apq8064
               - qcom,tcsr-apq8084
               - qcom,tcsr-ipq8064
-- 
2.34.1

