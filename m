Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0732C600202
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiJPREz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbiJPREZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:04:25 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D1444CC1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:03:07 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id bb5so6505745qtb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tlOCAYHN2Y3xhk9dkRfACKtc8xJakVTM1MhtXVqD2k=;
        b=SdK0qk19osurWIczOdFuqewveos1pKAMTRzBeZw0R4Fva46GzjQYyp/jx/SQJRYkYZ
         XdWLR7Kdx1jrcMq8n23WSrc6KcHvy842gUT5+wHfjS/Ta7juI19QW//gQew1X5l4BbzB
         DJDGCFNdS4MjfZVPk39Lr2BHX7jnnFhAhFrj+kZNdW05BvIHvXV4LC4fwVvR1B3goDDU
         5tGF9PakBTxxVCnOVfmdyKc5+pCoby2585X0NYLSTJwhSU9F4MOjXZVQw361BBdMBjOB
         pCg6EOWrlD2H6jRNtfE4kC2cTZEGoDyhGA8J2l9Hs39dOh5i/edYKkivrkcpjzNvsHcg
         Ihbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tlOCAYHN2Y3xhk9dkRfACKtc8xJakVTM1MhtXVqD2k=;
        b=f3NRD41Kh1BDJ1+pJ8caUOqUJtyzTJFRSzNTsXEpQhvgdanek/SHv8ODUCCCwE9t40
         plYQeEwQYhUlvOckcHYE5Kh8lNR9AYW7ySwSCM2GSOlw7PwvG22CbcVhSP/kvQ6n9OE3
         vR0fgOpyKfkIs6Pf79Bfj8cl15pHuAAUS3RwD990UWDPDo5mSwoBP7yYisKMpvMXGh88
         tUpYnqYfsZTsS0ptRDFqLqaY7qO9WDcl//fKcFQnlIj6NfMCP/au4SOLPz/9iImcqMCe
         jp4KEIs1aV3W9HKrki7u6icdxBNZeOu7zy4nb8piQemjCBYfaHrqq9Gi/fwFYfe4ErZV
         MFkA==
X-Gm-Message-State: ACrzQf2jjmU/BkWW+3BvHBhx1IEX9YOC9fkwD4nxn2quDzc0l0+X7weq
        yuRmBovZ4ztT/NS1Am1Di4lVzLgP7Jie1Q==
X-Google-Smtp-Source: AMsMyM74DJbc2aSQXxJb165RGlqbl6nmNKgtm2fhFoXdhM/4sLeAOInGVaxJl9Vm2l3QTh7mKaWMig==
X-Received: by 2002:a05:622a:54d:b0:39c:dadc:10db with SMTP id m13-20020a05622a054d00b0039cdadc10dbmr5897879qtx.504.1665939776227;
        Sun, 16 Oct 2022 10:02:56 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:02:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 33/34] dt-bindings: pinctrl: qcom,sc7280: fix matching pin config
Date:   Sun, 16 Oct 2022 13:00:34 -0400
Message-Id: <20221016170035.35014-34-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
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

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sc7280-pinctrl.yaml      | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index ad3496784678..4606ca980dc4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -47,9 +47,17 @@ properties:
 
   wakeup-parent: true
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sc7280-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sc7280-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sc7280-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -162,7 +170,7 @@ examples:
         gpio-ranges = <&tlmm 0 0 175>;
         wakeup-parent = <&pdc>;
 
-        qup_uart5_default: qup-uart5-pins {
+        qup_uart5_default: qup-uart5-state {
             pins = "gpio46", "gpio47";
             function = "qup13";
             drive-strength = <2>;
-- 
2.34.1

