Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7102F51E99F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 21:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446928AbiEGTxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 May 2022 15:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446918AbiEGTxO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 May 2022 15:53:14 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB0731704B
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 May 2022 12:49:25 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 129so6326314wmz.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 May 2022 12:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=myk9/CeIwb2oqmRLj1NXsqVbqAgoDqd1CdT+ldYMtBg=;
        b=Mh2jWBEKl/E8w0kFPKiPGsrIuY7ajNHgWCXYCRoZ978ZZ9GKV8q+UacHmPYneYCcDt
         +51SetBYvpg5/5TT48+G8MWhanXqLOo+xfueNU/iR0y9cYjRLpP2Uq4bC9dnc3EOvOZB
         uMmfHJa00yjK8OI5ZgEnDHianPdWM7S1KLopkhMwgNNOIxZ0mafCcA5PcES2HztY7LO1
         nZ8Xwnc2V2c9z11gDHJhu69OXINbv9bXHu0Z9RBijeZd6kWoeF75IHG4pDt9GRSEDZae
         T9g/i5ZjxaOKLMGy5tgjOJ10KGSk7GGwRQgJBETbtdbTQOUGr/5Pg16t57HzOCPm3sEm
         14ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=myk9/CeIwb2oqmRLj1NXsqVbqAgoDqd1CdT+ldYMtBg=;
        b=tcbxy3TpnDUArtW6Ndox1AdsxxcDeQjAaojjHPmVKtXKTjhqmLR1f7vlXJ1y1ps9TN
         ejHt6vbnkQF75uMyBwWUOe0GJVIfx8CP7RJ/peI+g9Vw8G6L0s8ApXolMhWZaeeQt6RB
         ke7OWc13AeFb3DN9xh5h9Kkfl3NAPQuEewfdqJrfWLOyB0F7REkSN3YtwuQKcaClUayg
         lkZaS5QRVmp00nC96fPhz3AJlpBU7HwoCZp0I8TDL6FeWkxjnvGf9V8Ot03yyrCBYNvW
         /LrqNqC+IW4IZZrn6e2jIVEF3ZpxWv6Pm3P8nSxkxjFxSBzv84F+7rSHvhBlfknpkJ6m
         KfWw==
X-Gm-Message-State: AOAM531at6OK78W3wH/uYgGrJsKi5v0KZXxPoztJTJwQkQjVYASfue0C
        2vyROGViQj15rJ+GnGZgOEeagA==
X-Google-Smtp-Source: ABdhPJwWdbTN2Z8RP4sAy2XxJaGdn9LcigPpzNRjoHCXLHREsGKkBuDf2PmjbouI4p3Ml368y7E5cA==
X-Received: by 2002:a05:600c:4f06:b0:394:836b:1552 with SMTP id l6-20020a05600c4f0600b00394836b1552mr3563482wmq.145.1651952964331;
        Sat, 07 May 2022 12:49:24 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c1c0600b003942a244ec4sm8535027wms.9.2022.05.07.12.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 12:49:23 -0700 (PDT)
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
Subject: [PATCH 04/11] dt-bindings: pinctrl: qcom,pmic-gpio: add 'input-disable'
Date:   Sat,  7 May 2022 21:49:06 +0200
Message-Id: <20220507194913.261121-5-krzysztof.kozlowski@linaro.org>
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

'input-disable' is already used and supported by common pinctrl
bindings, so add it also here to fix warnings like:

  arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: gpio@c000: lt9611-rst-state: 'oneOf' conditional failed, one must be fixed:
    'input-disable' does not match any of the regexes: 'pinctrl-[0-9]+'
    'function', 'input-disable', 'output-high', 'pins', 'power-source' do not match any of the regexes: '(pinconf|-pins)$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 33eb52660291..7e74a87ccc39 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -401,6 +401,7 @@ $defs:
 
       bias-high-impedance: true
       input-enable: true
+      input-disable: true
       output-high: true
       output-low: true
       output-enable: true
-- 
2.32.0

