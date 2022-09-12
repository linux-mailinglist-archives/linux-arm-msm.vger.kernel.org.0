Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0F45B5435
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbiILGUO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbiILGTN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:19:13 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033502AC73
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:32 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id z20so9337798ljq.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BZ9D0FRQE2grk03g+mdXjEXzyihdHpyqrjbkROOcsv4=;
        b=TTp7DZxGJuSnK3qrqpKDd7lgsAeYbQrUqzjZLtnmGzksft9og6MTCGIPnpRvGH8l78
         935LZxGnhSIwJgrDjLwFI03pkV46Nda36x7mJ6BolP2K4222alRCRCwiudqELPhKYC8n
         C3KEqhN3YLEk1wYeYH8c2irj1tdvCJG7KkmRCrXsy3PciuWRmb+iSMJ02qoEXVY7WDV6
         YYjZhGp62s8k9bOkjEsYX9BODC7SQc/E99rJgVI1J5dONR4Lqsc56YtkrEKlWrHPo2mH
         f4Bk5F2PC9PgnOaEomfA0T4V3l+nNdw7qOMbkofMSGyZkU7WlmbnroeH7KZ8aAw0FxF9
         k62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BZ9D0FRQE2grk03g+mdXjEXzyihdHpyqrjbkROOcsv4=;
        b=o0f4Q2sZcir758oJAHlqF1he6Nx4y/hE+h/NWm9tBsk2NixYsuSkm6uYkIKR5vjjfv
         ibviB2oJLm7wI8IZVgXzOFVFSGgnMf0h5qT5u7+Qs8+JIsr+x9EcrGEckx+k0BZeRnmU
         WaaphSgxMPq7lP69OeEajkAIizCHLRS0AOl4vDVcNZ1lsoFygg09IV4MnmJMgDgyNm2+
         W+Vcs0N7tqJGKKIq0n4ibE/4L1ChW+6DhJncy0x9Eoe77k0TcPuH5LeuAI74h6EeL+3n
         iQvr+2NZvev7atYZp47/UOTZ83uGu8TDe5IRaDMf+66n0zHyvoZkirXfHI+2nTBDItCa
         3UdQ==
X-Gm-Message-State: ACgBeo1tdDXFoD7DNif0DZdFOW+0Vi8Ui+doW/NlLHiMUbd3ImTAKpz8
        YkwA8ndfUfQCC2H/auGfbPft6A==
X-Google-Smtp-Source: AA6agR4ojUBJbR98VBNGjH6wUq6Nv9KGgK1AKUNvZJBoFiv1DMMK6QwYkduNkakZUyZXwJv9yrH0Dw==
X-Received: by 2002:a05:651c:91:b0:25e:4418:4c20 with SMTP id 17-20020a05651c009100b0025e44184c20mr7478771ljq.131.1662963496904;
        Sun, 11 Sep 2022 23:18:16 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 18/40] dt-bindings: pinctrl: qcom,sm8350-pinctrl: do not require function on non-GPIOs
Date:   Mon, 12 Sep 2022 08:17:24 +0200
Message-Id: <20220912061746.6311-19-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sm8350-pinctrl.yaml        | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
index f3106d25adcf..6ae5571f60da 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
@@ -54,7 +54,6 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -108,7 +107,16 @@ $defs:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-3])$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1

