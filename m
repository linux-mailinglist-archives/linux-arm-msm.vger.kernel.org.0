Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1D8052FE4D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 18:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355428AbiEUQqi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 12:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354364AbiEUQqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 12:46:03 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3D0E0D2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:45:56 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id bq30so19049091lfb.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nSqdOaQpm9dJZEkQiG71E3KaehIM6/FOIXcHUqCSrEs=;
        b=M3DtHP2ERb0Rvojw/1FEv+yctpDgtzFxlQnJDPAAYBWdpW+NIwEwQ2f55sZ8u+Iv9x
         bOIhafn8XTnqRQTp64fLQCrJ9if2z1VwF5dq5b8aP7zOdZ9c1Bep++0U/tpnuoLiFzGs
         75jbBKnrXK1pjd4X0wlsBFJWAgYjyJK5wZuFUt8j0D3/GlL+oc9TXVmc5KQnAgwcCPPk
         LmjMcOaDc/8plCakuZuVK2szxLPtf3otRQKSic/1Hj9/P9jl6j3A6ywcdZYzlGCNL6mM
         +iCnCYeelxN2wICxiq69YsLHj/+HbHcy52uRAal5CCQ7xInFrJWu3Q2HzyLhPiFT6dNM
         uvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nSqdOaQpm9dJZEkQiG71E3KaehIM6/FOIXcHUqCSrEs=;
        b=yimXrxeaU2H3zzDwhgYlZF3GIqJySayz/rbX/kxSfaEZN1dofbnW0lWe6/Xrg43XsY
         vjpLsAssNIQmrnqcTloP6e1BouEmShj7+TFN4oW6gr9vmbaw8Vy4fiMVwhQBKkpcUJav
         wAf33fwNy2D3Uz9jIYeDjyGvf5eh8LJdoxKdJ/1PBwza9+vQtoWVZB4+WXWZgrTYd9MP
         O6rdMhEH8iuFvRS2AxJZgbPCGiIJ1jp8ou3Jh9uJwqianinovWmtfUCmnGhcrGVSTUmH
         e+EAWcqfCNmyp/z6hmCplrqtVuiPNew7bL4vLuzEnHVebxzrxOF51Mil9R3yLtEw6Ywc
         GJhA==
X-Gm-Message-State: AOAM533pCPR1WxpwEXtw4au4E0uie+o1U3opvY8Mc92FJaSm2suOX+eI
        YAeHntDxWGrXz8yN7EyhkEs3+w==
X-Google-Smtp-Source: ABdhPJwyavJ5BFdbWdaqAc60EB3Vv7PIJMKDTj1b/eCptAUkFPOGK/jYbpfpCp87pBloZL+ZCfoZgw==
X-Received: by 2002:a05:6512:2594:b0:478:627a:2621 with SMTP id bf20-20020a056512259400b00478627a2621mr1962246lfb.221.1653151554681;
        Sat, 21 May 2022 09:45:54 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f26-20020a19ae1a000000b0047255d211cesm1114282lfc.253.2022.05.21.09.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 09:45:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/12] dt-bindings: arm: qcom: add missing MSM8998 board compatibles
Date:   Sat, 21 May 2022 18:45:40 +0200
Message-Id: <20220521164550.91115-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
References: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
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

Document board compatibles already present in Linux kernel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d137fe371935..ac995de501e7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -38,6 +38,7 @@ description: |
         msm8992
         msm8994
         msm8996
+        msm8998
         sa8155p
         sa8540p
         sc7180
@@ -208,6 +209,20 @@ properties:
               - xiaomi,scorpio
           - const: qcom,msm8996
 
+      - items:
+          - enum:
+              - asus,novago-tp370ql
+              - fxtec,pro1
+              - hp,envy-x2
+              - lenovo,miix-630
+              - oneplus,cheeseburger
+              - oneplus,dumpling
+              - qcom,msm8998-mtp
+              - sony,xperia-lilac
+              - sony,xperia-maple
+              - sony,xperia-poplar
+          - const: qcom,msm8998
+
       - items:
           - enum:
               - qcom,ipq4019-ap-dk01.1-c1
-- 
2.32.0

