Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF4F5E6C49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 21:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbiIVT5D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 15:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbiIVT5C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 15:57:02 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B22AE86C
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 12:56:59 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id q17so12247990lji.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vuu0tv1Yqm02vtfpTTnenBNqkV0fPko0ODs3e/csPvc=;
        b=xqccfBz27H/qB8AI4lXpO0apUqMJryNdfafLE3yk75oMMcECoGBZ82iidbyI1L42YT
         XyPVLvwA9IjKWSw1hts8PJ/fRFOZ2iL26rwGGV61l7UJQuB43fPDu01YlM7/yOI5LgQs
         jcyQnosBxuuLORFmhni6kaQEl7ws+g41iDfEeuJFXrXj68LmRwHmcKIDQ6hjbQBpgh49
         uBaEJqHRTh/Wyq2XZ7ntW7tyYZ1rwfpeb7O4gJVlbsFE0o/WSgY5RAvTTwqBdik1xQgS
         dEYqur8ZDV6YX8y/JH3EGNSwmoNxsZjl292QJTNutgT8gF8qlNAo6FqLdNWtv+3FQshC
         6MQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vuu0tv1Yqm02vtfpTTnenBNqkV0fPko0ODs3e/csPvc=;
        b=RHAqFKw6a6gD9RtjErVkdoeR7Z/dQfsVws5R/Yxlva6t1CNb/T8ESA53gNj1GczErx
         25UYboOzTtPFlkHtPpla0bFQZVTeqwb/+WRlyNDSx6sdBF1GhY8bCArx2pUcpXHVRigC
         OOLejsqrO/DyyU7wrnmXYvZP9ea/VbnuBaT0yemJwAYUDto0UdcwoBSs5Wczfzz+Ia1K
         hZPKFbm74UcfxHUCigHbQtIWN/hvi47vuuSZAzAZ5yECg5o8A9R3aCCqAThH47DeapHG
         In/LbVFj0Ugg2+zeId4/hbNKlzo9HNEux6/gNWcu/8eZCMEtC7M7lA14n8lAQJFxIBga
         butQ==
X-Gm-Message-State: ACrzQf3f3erXPNS9ldzVJhMIxGRmebhUZP7Yi0Lg9aqZwK34/Pluy4yq
        rJkkq4vzOsjg4j4jINbm2IkM1Q==
X-Google-Smtp-Source: AMsMyM6JjNEw3xI/sgnD/3QVOlqXMAK9jnY5gJJ3rd4JSZJKFa8T3dfu+R2sV44OGXtfZYp+62daeg==
X-Received: by 2002:a05:651c:179e:b0:26b:dbbb:eb9 with SMTP id bn30-20020a05651c179e00b0026bdbbb0eb9mr1639689ljb.121.1663876617772;
        Thu, 22 Sep 2022 12:56:57 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x15-20020a19e00f000000b00498fc3d4d15sm1079375lfg.190.2022.09.22.12.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 12:56:57 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/12] dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: fix gpio pattern
Date:   Thu, 22 Sep 2022 21:56:40 +0200
Message-Id: <20220922195651.345369-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
References: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
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

Fix double ']' in GPIO pattern to properly match "pins" property.
Otherwise schema for pins state is not applied.

Fixes: 958bb025f5b3 ("dt-bindings: pinctrl: qcom: Add sc8280xp lpass lpi pinctrl bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

