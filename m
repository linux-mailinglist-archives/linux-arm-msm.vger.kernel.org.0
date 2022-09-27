Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7915EC80C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 17:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232683AbiI0Pgc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 11:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbiI0Pfl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 11:35:41 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6655FD34
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:35:14 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id g20so11344174ljg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EalEz9AV2V0m5q+BMPo2gblVIc4RaNqnpRQA+ia4FNc=;
        b=E0i5PYEN24O+6dgL9ngxmJEGTGs47BaRui5U8vGwlpdKMIngJr2/XH4ZAXfdA2FyZQ
         QCug4TFZuaVXHHivO8BVAiDmo65MMrpC3ftNNeLDKvi+M6GIGoMa3+2osjcYrZr9+bsm
         yemvCSFXbYCo+l/Gh14xz9ng6qHw14g3an3w7r3kOK72aCLTkrLJEG0iRRSH84REC76L
         SyIj0zYDeINJwq5f+8k4qCsuDUMDktB5LP6772PCtyvpWN7rJm9IVIbJ4/K1o16ry/0M
         mvDBHfcsL52pLZR8VIervMuU4hAlgyQCAnQhrHmoxc2kPgSx6eXWhgx8KFVw7KzfD8bQ
         jTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EalEz9AV2V0m5q+BMPo2gblVIc4RaNqnpRQA+ia4FNc=;
        b=Ln7ZVM8d91X9hwb3Ij/VzeuQ+/R2Cn1jLIDdErZY97I9lXWtU1WO54S8fYxK7YkP1F
         zM3KWRj2enYR1g2txifw+LpfEjj8ch8fvD29l60WYJTLer8v+1EBc+Y1NWeAmP4uH6al
         7zJPuROzDzAxjEPoA0Y7+7y2DcqUAj+vvoAqWcDEIjS2OR7ir+A9+gXmvudX3Zbfda+Q
         kD0qm7BeHnjMk6zVbsLYPHncX1itiCPPtkL/875UygXOUv8d20DYfR00aXdFZPh+LECi
         oB6mPdyeL+VhHaQAz0tfx73oq5+sMSGZPFWBGeAmFdAHHMttKBXKJqRZkr8Ikn7SMIOe
         O4dg==
X-Gm-Message-State: ACrzQf3+GyByqGZNWnOR++0lRAbt4e72Tl92jGQQsh1WakrYQg9RT67P
        x8cYlqbLvuclvgXjVgb26SnPEA==
X-Google-Smtp-Source: AMsMyM4hs1yEXSuiLsujg/XbJUM5EFTVyJx5Cxs22w2sTyb14cMgxbDCc+qifhsud/W44L8RZT7Mzg==
X-Received: by 2002:a2e:9c1a:0:b0:26b:2bf7:9154 with SMTP id s26-20020a2e9c1a000000b0026b2bf79154mr9419060lji.417.1664292912811;
        Tue, 27 Sep 2022 08:35:12 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e7312000000b00268bc2c1ed0sm191592ljc.22.2022.09.27.08.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:35:11 -0700 (PDT)
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
Subject: [PATCH v2 11/12] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add bias-bus-hold
Date:   Tue, 27 Sep 2022 17:34:28 +0200
Message-Id: <20220927153429.55365-12-krzysztof.kozlowski@linaro.org>
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

The existing SC7280 LPASS pin controller nodes use bias-bus-hold, so
allow it.  Squash also blank lines for readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml      | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index a8a48b684692..bd54c92287d6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -91,13 +91,10 @@ $defs:
             3: Reserved (No adjustments)
 
       bias-pull-down: true
-
       bias-pull-up: true
-
+      bias-bus-hold: true
       bias-disable: true
-
       output-high: true
-
       output-low: true
 
     required:
-- 
2.34.1

