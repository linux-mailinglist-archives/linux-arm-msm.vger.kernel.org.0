Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 259F36544E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 17:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiLVQKX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 11:10:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235285AbiLVQKA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 11:10:00 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1DFF3579B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 08:09:08 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bp15so3355228lfb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 08:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k1dtaKDDkGKVAiwWp9WScF8JO/ojvra0YFJui4t3mI4=;
        b=PIxL4o4ah0KW1M8l0ifhZo3XsYoFPA9lCxiKj/xQeV/Ne7kGDZo3qgkBgujZh6koqu
         Jd9zaU7WT8GVw2tCMfPC5X1cEL0yYu1g9V//u9TrXHH8B5jUUeiSdyZedtLGr3bVMUB1
         AYkPxroPTIz2z2/KDFhAgF251XN3a8XO1/bebhX6pluvS67jGlMWaHfaLSarouVoUk1B
         fGLByTV3cTvb55LzWRnu7NWdEyKGOkR/r4SK05a27zqjhBcgBh/Q/fThgbMsLxIUfjIc
         hd9/Etg9V0oCDzqV8ajXmwM2wVJBsyo1Hrg5Q56t3vdX4y/gqXyvJKuvPcSeH8wQVU9a
         WQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1dtaKDDkGKVAiwWp9WScF8JO/ojvra0YFJui4t3mI4=;
        b=QUDvVICdG7obI6/dPzlKUGrMoHUzOEvctt6GaeCJ+W54cPzvHbX61WxqZB5TRYyx3y
         40aSyv+omOQvaXiTFjveFSqbZVOjGGRJmaz+J5HIwuYgV/YEFeqDZqR9YrlO2/WjU+Ch
         ifO5CnBsikF6+H3ZcIuQr/Zu+GasFVvsV1I5Isy3mYkd9zrinToyp6WVC18esT465nvA
         RUKzJiYj3xRVKNPncfCJvrG/fRTaXMSFdcmvHWSjRm+TIZzeOGNlKcKzKx5SGdWuPKO3
         hufqOWZ6vs8JFR3JdTgEBwSWsVosedgAJMp7dkPD8EoeUFjK7kumPP2fVmK5MibbT6KX
         7EnQ==
X-Gm-Message-State: AFqh2krK/6joX1DDDlcCTFkKg3FiHfpNvvkl/O2J4L1zzf8FjVhlN82k
        jbbkNZ1wsiJAeMFN322tHJNllA==
X-Google-Smtp-Source: AMrXdXt7Mb0y1Q3l/cK+o2snE4jU4rov7Lm5jm9cZGQbaz/sUhl0qDXM/THBF7oxd4ELZD1S3xHTNw==
X-Received: by 2002:a05:6512:2987:b0:4ca:877d:a546 with SMTP id du7-20020a056512298700b004ca877da546mr3120025lfb.12.1671725347156;
        Thu, 22 Dec 2022 08:09:07 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p7-20020a056512138700b00494643db68fsm114661lfa.81.2022.12.22.08.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 08:09:06 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: add bias-bus-hold
Date:   Thu, 22 Dec 2022 17:09:04 +0100
Message-Id: <20221222160904.172070-1-krzysztof.kozlowski@linaro.org>
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

Allow bias-bus-hold and input-enable properties (already used in SM8450):

  sm8450-qrd.dtb: pinctrl@3440000: dmic02-default-state: 'oneOf' conditional failed, one must be fixed:
    'pins' is a required property
    'function' is a required property
    'clk-pins', 'data-pins' do not match any of the regexes: 'pinctrl-[0-9]+'
    'input-enable' does not match any of the regexes: 'pinctrl-[0-9]+'

Compact the properties which are just set to true for readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml      | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
index 01a0a4a40ba5..4fbe8c506cda 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
@@ -96,14 +96,11 @@ $defs:
           2: Lower Slew rate (slower edges)
           3: Reserved (No adjustments)
 
+      bias-bus-hold: true
       bias-pull-down: true
-
       bias-pull-up: true
-
       bias-disable: true
-
       output-high: true
-
       output-low: true
 
     required:
-- 
2.34.1

