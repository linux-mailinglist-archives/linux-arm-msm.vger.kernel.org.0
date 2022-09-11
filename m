Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 115BD5B4DD6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbiIKLMu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiIKLMV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:12:21 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCA332D9D
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:18 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id z20so7408376ljq.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ozqjcsR32neOzHv2L/2DOKBG63rqHKYUg3f24PJLOOc=;
        b=GK88lwecgkTizgJh3GKvFnjgNw7U1/lM6XE8hqiam83MYylcrebe/xhqceJed3AKY1
         HNTcCNyLrXxIZx3Z7u5nBapp2paLpQLvThc/f5FPXggAEp1yERCAgmoEelbAn1sMqFkn
         lKHHUaR6dPZR5QiQwJ/rQ6MIbG4v7tEQpCUQO+1/SxigjE+WqWYLpVJCIEb5J2ipwMmI
         8l4Z6dAtkFmY2XUtjY33A/5mz6e8fUQrx3+ozGCy8nIqa7mpou5VKBE96/SZqr6MaZCy
         mjNMtHyjWCJ/2mnmy6bNbEVbUyleC0Qd4xHO7Aqcbd3ywVArgat36FepOkOhMRX9LvSv
         ALJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ozqjcsR32neOzHv2L/2DOKBG63rqHKYUg3f24PJLOOc=;
        b=zS7Wml+0N3r4dQeto9YvbUrLu6/MvyRxA1+7NjJ6YNYqLYTAbU6ob98jx/tTC3N0Lh
         Z2F0UVh3RzoGn4eWsfhUdOQ45VvsyfrDTQsZ/9ruzUh0SeqJPB1/8d2VQL5QktCS6Bje
         zf/B2HrQA8ymFtA83SYDFQvCkir0ao4vKFlYaDopiPpf15T1HfkXAnpLJVVu5IJKxvqe
         Qp+OoQCQ6fCfcJXAUP26M+oSbyLSKpKyAaN4XNy2pxEHq0zrUDu+xpQxTvIOQJAvEbKq
         RjACK3J+uRK4qvH55GkhAPu2CLAJvQS136M0CeSALeRxTQm+AnAaQh+VQFcUSXP+2rE4
         vJ/Q==
X-Gm-Message-State: ACgBeo3y3icXuMZn9u51bvEhQOAqdt4dHoTYfZA1f+vnQBb7OKSMpcAE
        T0sdm7EF9EeUh9g0sWiiSfvv9g==
X-Google-Smtp-Source: AA6agR762iiL5ojhwyiA2ZJI0eAuNMgBz1devbGS6PL3OdLnl1YSzbPBjipjNZ9BjzcriWAq5Qxiww==
X-Received: by 2002:a2e:9e48:0:b0:261:c713:37dd with SMTP id g8-20020a2e9e48000000b00261c71337ddmr6126947ljk.385.1662894738003;
        Sun, 11 Sep 2022 04:12:18 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:17 -0700 (PDT)
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
Subject: [PATCH 11/40] dt-bindings: pinctrl: qcom,sm6375-pinctrl: do not require function on non-GPIOs
Date:   Sun, 11 Sep 2022 13:11:31 +0200
Message-Id: <20220911111200.199182-12-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required:

  sdc1-clk-pins: 'function' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Another question is whether 'function' should be disallowed for such
pins?
---
 .../bindings/pinctrl/qcom,sm6375-tlmm.yaml           | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
index 50f0ca5ab7e7..dbd91d6b63b3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
@@ -54,7 +54,6 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -120,7 +119,16 @@ $defs:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-4][0-9]|15[0-6])$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1

