Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25AA95EC7EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 17:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbiI0Pf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 11:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbiI0PfL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 11:35:11 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F076341
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:34:58 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id c7so11309086ljm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=D/+IAx3457n7py8LTtibntWPebPSaEptQQHDgCPuAVM=;
        b=U/xzp6A+3fFL79gjVF1GCFn4iBaxYds76XR1yj4WRiYF+NWsLNc9hlePSg9TJsb7B+
         LwHhESERbG3mcl6rn8HMCDbEq9nX8/K/CG+tDkLTzMcG1VE3xKt0sK+q3TaCAs0IWBT0
         i1O5Gkhz1qpZ9QXpMqHOEt7wK/mHor5OHqkuvobNmhT1lEp3kyXpbXxEXdRqIqrDG5lc
         +uXmN15Iwh+ZVLLqadxozPwCur//WlEtm7NzaZsjS/S/favyN+zhE2zEVN6gQ2t22uDj
         B2v6s/JcA/ByT/K6c+NC2TwILSAHeoH7vuNi5vKtauf1SVRpm3GzcKUTs2s6HHUSiPn+
         SAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=D/+IAx3457n7py8LTtibntWPebPSaEptQQHDgCPuAVM=;
        b=qiqwGfEAVJWgTf9jPTSzyMXmd10SrUSbfEIt4YJvb8O0/G4I0+RpWsCRVnXz4RL1zy
         /bA6StqwnoSXHbbzmgjL5LHKOC71kwoT6DD7D7+9UYyyYACJsR/5LGVJr4K2rO8X5bg9
         ZoG2f7znclDQ8CuscBtflCcoXB2dZaifox52hxhXVRu1uZ23hVb96ElOGBTXSpR0thtl
         XJ4NOflgdHB7qh6HxQXOsQRhu6cpFNd6gNAbs4NbRCje4c04BPeUegQy3aEMWBkF3wv4
         PTQXhDylFfwrMJe5P51rdqgKAmFOo7SJdgmczMnUFQDJzKuhZHg6MxKpU5PXXAc75H0L
         tb4g==
X-Gm-Message-State: ACrzQf3um7iiS6fuCndh09inaS8XXOhrdonM9eBlBBKxGAhaJtlQl+mc
        6lUeNtLtehLoZvhdc0i9RMSNYA==
X-Google-Smtp-Source: AMsMyM4whTK4N5JDrPNgaoYeYa3I5yUnMzzYhiBJ75zP3hXlA+e1oiPT4IfCjzfXdi/r5GJ0HHYeYQ==
X-Received: by 2002:a2e:6a04:0:b0:26c:3d75:5d84 with SMTP id f4-20020a2e6a04000000b0026c3d755d84mr10146253ljc.162.1664292896947;
        Tue, 27 Sep 2022 08:34:56 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e7312000000b00268bc2c1ed0sm191592ljc.22.2022.09.27.08.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:34:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 05/12] dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: fix gpio pattern
Date:   Tue, 27 Sep 2022 17:34:22 +0200
Message-Id: <20220927153429.55365-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix double ']' in GPIO pattern to properly match "pins" property.
Otherwise schema for pins state fails.

Fixes: 958bb025f5b3 ("dt-bindings: pinctrl: qcom: Add sc8280xp lpass lpi pinctrl bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
index 1f468303bb08..fb3ad6c0d80e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
@@ -58,7 +58,7 @@ patternProperties:
           List of gpio pins affected by the properties specified in this
           subnode.
         items:
-          pattern: "^gpio([0-1]|1[0-8]])$"
+          pattern: "^gpio([0-1]|1[0-8])$"
 
       function:
         enum: [ swr_tx_clk, swr_tx_data, swr_rx_clk, swr_rx_data,
-- 
2.34.1

