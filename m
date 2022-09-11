Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB8A95B4E35
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbiIKLPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbiIKLOr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:14:47 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92F83DF2B
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:13:09 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id y29so7395948ljq.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zWIyjK4dxfH9A9tyS53A/sJlwsqf8yeDaeYqVdTxLgc=;
        b=tUD1+6C3hCVPVFOS3id5nXTI6adwuUFvb3Z/8cNVtDl8VCPzz9mnjmlCyZ2ZrRKXt+
         8d1B5zdYjVt1iR7lJ26Lfazrolozts9OgUQoNw24bp4BPkMXY6ed74YLqdgvstfe0iWi
         7hFFJIzUm9XcJ4xChvC+fXyWlEPgRmNvs591hu0nKy+9B8wGAmQ/yarQHInvHNuapX8x
         hPwlq/Iwj12iIJWyTwHvF+yRam2VTqOckAkfVnmYeOKKWxYGvJPpPuLh9EOGoHerQL85
         gJf5LAhLMdphfq4kJy1JV5mzjc82W8rB9jdGjosuJ9DlcOxIVMYcB4yl948SgYBvkgu3
         UHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zWIyjK4dxfH9A9tyS53A/sJlwsqf8yeDaeYqVdTxLgc=;
        b=zpBlRXqZMCOPt5RJL9dTEXJSVg2oKQKacuKGIzZN+mXI8cSeFiUor5m6zSErWxNVBX
         DjXGPWB6Es8g+l+pZ4RKEH+ceKC9OlA6jpGxl/jg4GEiUMnTG9fr+nnmny73wvrCNVHl
         1YcKJSSot9LzLolE5bgpYSEUgHehcb7Aoy8oqHNKNPkXzJtkkUnqvAk1ogJtzmYijGHd
         C+lrzF0CYQ67CG7i80UhiP2kx3fF8/by9MW1YmzAmCvb6akxBZIXD5t/rmzPHH8/lxeY
         JKFdCLbLzEGjNCZOCyVob+mPTClzErmpcomOka3Q/zHbXcWiMiHpKvwJqz7StHXJJCmY
         06bA==
X-Gm-Message-State: ACgBeo1/Izleq/00ja4QMT1Xyg6PrAbTBUhBid8CWrqpL64FJ0h7dYZe
        g5XsSoV7eTFuGeI/4/C+vfFeHA==
X-Google-Smtp-Source: AA6agR7xzMEvsn9zwERj173UliSnQ0E3HepcVO7+NPt1sn/QisreddnFlYb9sow1/tebXUzP+r4bRg==
X-Received: by 2002:a2e:a887:0:b0:25e:3174:fb67 with SMTP id m7-20020a2ea887000000b0025e3174fb67mr6114743ljq.337.1662894753224;
        Sun, 11 Sep 2022 04:12:33 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 22/40] dt-bindings: pinctrl: qcom,sm8450-pinctrl: add gpio-line-names
Date:   Sun, 11 Sep 2022 13:11:42 +0200
Message-Id: <20220911111200.199182-23-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
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

Add common gpio-line-names property and restrict gpio-reserved-ranges to
fixed size.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
index 296f503c1d97..9cd97a467648 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
@@ -27,7 +27,14 @@ properties:
   interrupt-controller: true
   '#interrupt-cells': true
   gpio-controller: true
-  gpio-reserved-ranges: true
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 105
+
+  gpio-line-names:
+    maxItems: 209
+
   '#gpio-cells': true
   gpio-ranges: true
   wakeup-parent: true
-- 
2.34.1

