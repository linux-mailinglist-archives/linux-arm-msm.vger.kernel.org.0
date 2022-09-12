Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 740BD5B5438
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbiILGUQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiILGTP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:19:15 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8392AC7E
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:33 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id x10so9326254ljq.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=isoYJKBwL9O1ZTWOtoJy6YqcTPPUMcFYuBQOWK2a8G0=;
        b=Sn5uYWupsTjYshBneVtvzhVm3tf9tCxdh4UlYVFBt+IUS0/qO8AZG6l1xAt8OTwdcw
         LqSgZqKAY72eXW7HIgMULuiRS3xGprajeZGJiGeCelFx7FciQ6ekWDZRaV8/z10dk4gS
         127eQTscFSplDtvT8htQc83JifHjo++wfC1ErJCMomo10pyjyMeliT0Iu/Pc69Cq7JTf
         kkzYKb2Zh66/CVOvi25eYko/MCV67RJbLzmpxKnHCPokSsNSre0NdELFow6p5CRQ+CDu
         d8hREZz8A0EG//L7Kr5EffVi2u2ONDT3bjh4v7h1YagyiR6TD43pdXyGcUg74p0EUZs6
         /ZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=isoYJKBwL9O1ZTWOtoJy6YqcTPPUMcFYuBQOWK2a8G0=;
        b=c5KjjYVt8LI1kMOORyr7J/4hUfdeRBMvQ18lNq9aZu68Qz7oXvUm5K0P6LFm6b/g3z
         6hCbu4bPIqZzP4RyyNnpNk3mZwc2/iqtFVq1qx3Jka9vJM56mBLLpN8gYf9pIUrVELU5
         hLMrWBwxS4RwHowi/+h6tNBModXDga3CqrN4RHoSJAR6rFhgaBh5OpHdxj6BSW8RRg1d
         IkT+8/TmtFnJnYv4OauWsdcCC4qlbz9GF27wR2f99eHgTKSry5X4U7wE3eWnzjk13rD3
         kZF04i42Nrqw/k1LCN06/MCWq4Lmc0NxZGnmqNukXeIIQpAelyUAdkaNrorxgpllXSeL
         4REA==
X-Gm-Message-State: ACgBeo2a8qjV9Z1JRv10U5E7UTGhdBp7Os2cxamKHe8GloOAtCkJDkZ8
        WjZw25lXZcfzSTFr+0rekl+lIA==
X-Google-Smtp-Source: AA6agR4xwxfcUqidIq62wQLoSkaPFn1oBOsoXm32yp4o95+WVvQIOqMOm3t2WCydvzEkLmkKr0zW7Q==
X-Received: by 2002:a2e:978f:0:b0:26a:a62e:8f2c with SMTP id y15-20020a2e978f000000b0026aa62e8f2cmr7369259lji.153.1662963513116;
        Sun, 11 Sep 2022 23:18:33 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:32 -0700 (PDT)
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
Subject: [PATCH v2 28/40] dt-bindings: pinctrl: qcom,sc8180x-pinctrl: fix matching pin config
Date:   Mon, 12 Sep 2022 08:17:34 +0200
Message-Id: <20220912061746.6311-29-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Matching PMIC GPIOs config nodes within a '-state' node by '.*' pattern
does not work as expected because of linux,phandle in the DTB:

    'pins' is a required property
    'function' is a required property
    'rx', 'tx' do not match any of the regexes: 'pinctrl-[0-9]+'
    [[59]] is not of type 'object'

Make the schema stricter and expect such nodes to be followed with a
'-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
index 86509172603d..646fabdf81f7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
@@ -51,8 +51,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sc8180x-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sc8180x-tlmm-state"
+        additionalProperties: false
 
 '$defs':
   qcom-sc8180x-tlmm-state:
@@ -137,13 +138,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                        rx {
+                        rx-pins {
                                 pins = "gpio4";
                                 function = "qup6";
                                 bias-pull-up;
                         };
 
-                        tx {
+                        tx-pins {
                                 pins = "gpio5";
                                 function = "qup6";
                                 bias-disable;
-- 
2.34.1

