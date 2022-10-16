Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7363F600252
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbiJPRXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbiJPRX3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:23:29 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA123609D
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:22:53 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id t25so5460623qkm.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2iL+LousVGow5dUY1Ud/R94eK5M2XQe1d4+QVWonkw=;
        b=lD22R/RZXD6eLwHXcT21Lz0aDWcWIuQD7bSOwq8PYsiIdfGEECOOFxXCjLwDj/V7IZ
         7U7qvSuLfqaIraKVaDkfqAXDok5s9trdFTgdnRcuo2juTTlPPLZOjsyucfXY0XOk0M5k
         lwPTo5Inzs0XaNzDOVgB0DQwd6zT3BoIzpyxUe2j3oBXSUU9nS1vaWs8lS6m8089XTRy
         4S4BE+AUHXnjIbTODYpbIvtmAgXpgzL2O6kdl5JfofwJG0G07HPOXciL+6c5Mx0KTLxb
         gSbJie6rzdA5OuhuhvhlMc5XRgQFDIvS/YSbs031IwpPBlcdlkiD9Vg3AZK/wratREgn
         JCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2iL+LousVGow5dUY1Ud/R94eK5M2XQe1d4+QVWonkw=;
        b=j90C+0r+jjfImVeIEsAVOo2Rto8WIN757Zjw7lPunN/9E+5XGuu296rFmXXgOMm5Pp
         WuCpI5NESdbnhgfEhSX8eWNUphjTT1uaTxJX/Hwb1SCUHkY7ovmHc28h7lihr3P0n1li
         0PpPTJxGVY+hSDZBj5qBCADOzOSiD3vzShpRWQ1X57UY5VtbBwh2fVhk92REqw9ijWD+
         2/FSD+4F5PfYty4W06dRS5Xl64QdBFYhG0IED653DIf9HxdxpdsGeXkzVER0EnjVh1ny
         XDxwaEtTQuMNlzqyT2Tdov477eM4RJlLiRotC6qCfxI1tdIgQax8+Kj0jMIEc3XhQ+fa
         J8cg==
X-Gm-Message-State: ACrzQf3HXbKlNfBhfZ2evwqeco0gz6uk+0TBfT/A6hEFh/vxE4KapYGC
        PSWarKP4yDenVaXzvoZXG7VqkQ==
X-Google-Smtp-Source: AMsMyM4T97UMwF/cgy5/I//zcNdCaULwdJu3GToIgMCAbHFgOe0KRPq14+q+qfB1wsICbC2hcZioyg==
X-Received: by 2002:a05:620a:1250:b0:6ee:8d19:d6de with SMTP id a16-20020a05620a125000b006ee8d19d6demr5175524qkl.669.1665940971846;
        Sun, 16 Oct 2022 10:22:51 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id r5-20020ac87945000000b003431446588fsm6051008qtt.5.2022.10.16.10.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:22:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 14/17] dt-bindings: pinctrl: qcom,sm8250: add input-enable
Date:   Sun, 16 Oct 2022 13:22:09 -0400
Message-Id: <20221016172212.49105-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
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

The SM8250 pinctrl driver supports input-enable and DTS already use it
(sm8250-sony-xperia-edo-pdx203).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index aa8315a4d9b1..e9619c4a39d8 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -114,6 +114,7 @@ $defs:
       bias-pull-up: true
       bias-disable: true
       drive-strength: true
+      input-enable: true
       output-high: true
       output-low: true
 
-- 
2.34.1

