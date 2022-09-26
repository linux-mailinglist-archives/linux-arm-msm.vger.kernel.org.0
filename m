Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6785E9AFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234246AbiIZHra (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234257AbiIZHqv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:46:51 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302E5E2A
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:09 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i26so9457378lfp.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=q8x9uNJv1GdLZmJTd8sk+6NP6nWeg6X+qM8aAbyTccQ=;
        b=TomDDAjGehS+AvbV3Gxa7Kib6PIi+/VupziHtXN0Up4EVfppvBuvacfNrv+4txoJaI
         baAxSzJZPR1NB5XjCGTOLZVCcZXDY2ExsSf5E0GHSeWp1KTK+sXrtCIAcw8sSXsfKy/N
         DnU39+WCIdS6ouzAwXqKAmK/1c+yeN1++o35ypnc8eydpVdb2nFVAI17XQsAABDnto2y
         LzJmeRVHcmT7FDYRpzV83U5x82jB7Kh50ZbHXJyUdR6HVe89sg7DMypuOVmS0IMwPrl2
         qFMa6v9OFXQGwbv1v/ujunTvYhKZy68pUPk45XdR7j2Db94lcgVhJe8ynlWaYT0pGimg
         /EkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=q8x9uNJv1GdLZmJTd8sk+6NP6nWeg6X+qM8aAbyTccQ=;
        b=HQ23EWIj2mHHEeI0oLgJ2EvadRG7Hmlboz8b0Uoo0he/NSfSG08WIuzooVaO35ByiX
         ns9hV1lE5ZOfFbfUODAp1nCTO3ppVTTAa4Pklkcr3zMpD39BqPmb3Xft1F+WoKORyuN+
         gGmLMsSHcMqn0O8/wRfFBqBpz+Tyhy9lJH7wbTHZ3tzDSYy0hhgNbEAJxd/08ggSmvFN
         mOYzBEqMr7iFITCUMxCB+h4/bgeSsFnd9rvhxWMN3CWX4H9qSLoSXdur8vTXugT+0lCq
         IsRkzGNKmNhvfunfaM2ncDTMs1NGKGSqLAlY9oepuTsu6V7q8RHtgYykbwGIo3Z844KB
         rt3Q==
X-Gm-Message-State: ACrzQf150J/bIFgCROiPpA7ZNQeFbaa+pJl9FkPbGCPeOyt05cHCWfC/
        d8Lvm/k267Ztp1mbG1jgTN9+Ng==
X-Google-Smtp-Source: AMsMyM7AiHnmuyM07PSrTn6Z4gNfjo4n47TNeFS4OrT9OBfijBZQCQ/8hkCrGw7+9QO2ZRdaVmbBLg==
X-Received: by 2002:a05:6512:159e:b0:498:f1eb:f7a with SMTP id bp30-20020a056512159e00b00498f1eb0f7amr7838095lfb.425.1664178296474;
        Mon, 26 Sep 2022 00:44:56 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 17/33] dt-bindings: pinctrl: qcom,msm8909-tlmm: fix matching pin config
Date:   Mon, 26 Sep 2022 09:43:59 +0200
Message-Id: <20220926074415.53100-18-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml     | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
index e03530091478..b1735918fa90 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -43,8 +43,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-msm8909-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-msm8909-tlmm-state"
+        additionalProperties: false
 
 $defs:
   qcom-msm8909-tlmm-state:
@@ -136,13 +137,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                        rx {
+                        rx-pins {
                                 pins = "gpio4";
                                 function = "blsp_uart1";
                                 bias-pull-up;
                         };
 
-                        tx {
+                        tx-pins {
                                 pins = "gpio5";
                                 function = "blsp_uart1";
                                 bias-disable;
-- 
2.34.1

