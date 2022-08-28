Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7635C5A3CCD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Aug 2022 10:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbiH1Ioh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Aug 2022 04:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbiH1IoQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Aug 2022 04:44:16 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DC72F001
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 01:44:00 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id m2so3605376lfp.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=nM4yfzJ2q/SPSZ/URGP+BdMN7FGkjiXY4m9ev5phHHo=;
        b=eho3RnZKI3+xT8GnI5NCFSxLP4flQCw2sK5F/LcXPtzUPkzIsFPTQw+ly0as5RcXjb
         uaKFIB4kYwUhZwtSbD2ECY8jJKMOqN3nDp/g2ymGVOQ1LB/C+4eTZkKyFFEGPhQx9uTc
         /dRee1qCnP2iwfssy3+dCf6faXPsACBQij1oGnYtd0DFB7mQb9vSKy0sapndC3maW3Fv
         BT/Sc01Zbtpc9BgI2wAAFTHRbFtlHCUS0FFNCYfT1S55w51otuLxQyFEW+0F3uORhR1O
         BZJ8ii/WReCHFcvx5zovoSaOjM8arb/ndEsRQEPPOnN0XHAOeqjCpfqdAacxe0RgXuUY
         3fIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=nM4yfzJ2q/SPSZ/URGP+BdMN7FGkjiXY4m9ev5phHHo=;
        b=KfNeQzbUY9SO985d3QWvR15RoZVmIhkvB0HLkfQqbJSFK3dxxC1vv5VmuG7mZ4IJAN
         Z67016YOhVVgiPn3pZzk6+FdWjPXT/qgqXH/qrQgYeTUzs3PDAoieHFLu5g4pVCfkIfI
         HDMLFKQ65WPdorZfhgenLShRJzN38L13JFv8Zu5TUmCO402a/RLKmgGZAyatb7M9Wo9b
         Sv48/zD/4yfCSC/L0wGu1VGj6IOpbONg/pOtiRpM4hAj3FuptxWEhz5xVfDGo2jfaowj
         DBZfkiBfoq22akls6+K12TDj8fS67RmjlJC8o+8ZoWi3i4NO615hFsaz416QJ4o596lb
         yTxQ==
X-Gm-Message-State: ACgBeo0xl1tA7vPibnc9ZtiqV8BJ7yKQOfyhDQ6Lwq+bH5Nf1CjVqzLx
        /R8XYGc2ahTSaqPOtBOgDT8Asg==
X-Google-Smtp-Source: AA6agR4iwwkRp8WfcxhNnZSzna6uxn0MmtYb7J9EtoNTNBopKmm6iwIJcheUOiBasmGBHNuFJq25lg==
X-Received: by 2002:a05:6512:692:b0:492:ece0:32e5 with SMTP id t18-20020a056512069200b00492ece032e5mr5332902lfe.636.1661676240403;
        Sun, 28 Aug 2022 01:44:00 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id c6-20020ac25f66000000b0048afe02c925sm890114lfc.219.2022.08.28.01.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 01:43:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 13/14] dt-bindings: mfd: qcom,spmi-pmic: fix regulator node schema
Date:   Sun, 28 Aug 2022 11:43:40 +0300
Message-Id: <20220828084341.112146-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220828084341.112146-1-krzysztof.kozlowski@linaro.org>
References: <20220828084341.112146-1-krzysztof.kozlowski@linaro.org>
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

The regulators node of Qualcomm SPMI PMIC represents sub-device, so it
has its own compatible, multiple regulators and uses dedicated bindings.

Fixes: 3f5117be9584 ("dt-bindings: mfd: convert to yaml Qualcomm SPMI PMIC")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 7e42ab75d71b..e062de7510ca 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -94,7 +94,7 @@ properties:
 
   regulators:
     type: object
-    $ref: /schemas/regulator/regulator.yaml#
+    $ref: /schemas/regulator/qcom,spmi-regulator.yaml#
 
   pwm:
     type: object
-- 
2.34.1

