Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CECC601CF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 01:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiJQXBx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 19:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbiJQXBf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 19:01:35 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D3A82D3D
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:01:05 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id a5so7661750qkl.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lL14UiPeKdh/QD6+joJS9aO6pvdHV6+MX1LEVoDNOrY=;
        b=TAsTICd0OgUrPqwCzBtvgs5YgZ5Ohv5rT5bqEILH0ayaIGVTaN6Eo+PJaS9VLHEgCE
         0H+HkOHLJjqG56g7kjoc9A9DsN24HpiZ1K1OGULU5S9guvWzjjWIBYHYcW6gy1uj+VWf
         w1R/7UPkySjIHeeHpkVynyO9vVBL8YqFxVUjIAtaX9YFRfQpBjlBSceIjrhwPcNgx+BK
         mN7XoGknua7ERKlKF4hf4tcRY2y0jyBvRmQfwfr4wxe5bjnvlN9OnVrqvBJnnEC0EB2o
         MMZYlE3ODmndJymWXt7wTScXp0hbAPAq2YyPSvgXk0xRVLipnG6YqXqb3jv7cQ0eJjx6
         C2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lL14UiPeKdh/QD6+joJS9aO6pvdHV6+MX1LEVoDNOrY=;
        b=KnSiNtpvGbW1HgWjHsL0vpbkprv6q6kgdsdznAmOFe7T/1nQ/cSeX/gSz5ashBvRMP
         8TplGiB7NL8YO15oUXgN+pXRT6Bn6k0GoA9tjpZ/JBew4Q/xviMaddGFSqgm3U48PQdh
         DZ5O1DvRxr9Kqw8h1KSFfTm5aTGuqUc/LpoyFoANnoXAIq+D2wJ60VA/94rDsvt+yowR
         OYuELv9YOEiml7o2lJDcZgZ6DnanAOvN3F0nYXcHDrX1TcayQSNKF8UvX5AA9IVmn6tM
         29onfadL2vU1aw9i6He+0rxxZlJ+Nx4Q4glT10PtDXxhEvt1c/PXqH6T27zk2xEReXTF
         LCJA==
X-Gm-Message-State: ACrzQf1cQ7uBuFzb/wZbuLZ8Ji5iYnWS2ZGh7NoeqhdR7Mlx7cs+r0Zk
        Y04T7nKc+kNorLwRGtaohNvyQg==
X-Google-Smtp-Source: AMsMyM5nJuYjYivuIQdvAh6jU7b3JFI2xjyTO1XpdKWgZCYTYSsgoAbiPaeHGC3CIcv4RUw9Oz2Cng==
X-Received: by 2002:a05:620a:4549:b0:6ee:ce57:796c with SMTP id u9-20020a05620a454900b006eece57796cmr9383887qkp.373.1666047664871;
        Mon, 17 Oct 2022 16:01:04 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 15/33] dt-bindings: pinctrl: qcom,sm8450: drop checks used in common TLMM
Date:   Mon, 17 Oct 2022 18:59:54 -0400
Message-Id: <20221017230012.47878-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
References: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema already brings
requirement of function for GPIO pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sm8450-pinctrl.yaml         | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
index 9cd97a467648..7ab9a0eec017 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
@@ -60,6 +60,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -112,16 +113,6 @@ $defs:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 examples:
-- 
2.34.1

