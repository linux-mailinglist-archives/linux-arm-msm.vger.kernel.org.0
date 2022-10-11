Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0784A5FB980
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 19:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbiJKR27 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 13:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiJKR2V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 13:28:21 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D02958503
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:26:53 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id z30so8921601qkz.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0C1L6kOIdb7uBBS651widzpOjAhyGK+kNAfE8fg7HE=;
        b=ROCTPZaGnMIq+6GuFd3xqVgHyJ8PYkuO4VPdGHFfBQH/v/kovNzp64XLEY4pQQ6MLZ
         BzLgFxTuRO1kD8UeV/A5RP4KdsyHezhJFtZsMUz6rJCWhonoqV1IrUOuIBVONIMKkB2I
         J51pY4YIAGXmHLwjeA0Y3zoch4jZQKJvHVgQjT4C2kFiMODxng1zcPiBMzOMM1xSXTru
         7S0DLfX9EXe/vamSZvBePa29oeVDwkXgURYf4/5mH4eN0+T+5zR8Vpgo4Rw/ngVju6Tm
         4hUGTnjS80OZcwKO2Qgu8f8pM0D46shRsemXvfKTHvvfXGvTPETXPzKIfbCoQnDaPoiS
         yiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0C1L6kOIdb7uBBS651widzpOjAhyGK+kNAfE8fg7HE=;
        b=FiKfL9Ihu7SxPMa25wuIns6qw75nmgg0SwcvKZ/opQkPF+iWFZfLwxtjhyMV7pJAUc
         ihAN9cME1B2YGVOpAXVDRsCEMUrSY8+KWIAk92a0rFcTIh12/W0weF9SSfOPVafgGP6X
         sj4OoqmneCKyI9yPk5EVf146JTAzMs1ADgl4Ch2H3pCSuxIF6JQf5VFPzq+oj+6uvBTS
         /WJzROcOPQmOLtXhTPynOwDfiPsF0qOIQAWmFbiU+qFOOamz1qjgAUe9qj83QCotya4V
         AeOgSLbW2ZTL7xlUNXYFx+hbhn/3alkMxSjWR/6z6CdR8/ZuFMSzXZpFg5R9KTWhGphb
         DYLQ==
X-Gm-Message-State: ACrzQf0wycnOVeGU3JWPRjQHdbrHgL/HTZeW9ov+WBWIhQjOCy3ITL0j
        VE74VhyrgaPxWe+zzHxZjVOr+Q==
X-Google-Smtp-Source: AMsMyM6beKzoEuWQ27r1v9y6aj2Znu7qwhqwTZ/aJRjXH/dYvG1/nmMH58Wt/hhQ/BHXnp4N39IR+w==
X-Received: by 2002:a05:620a:2a0f:b0:6cf:92d8:2aad with SMTP id o15-20020a05620a2a0f00b006cf92d82aadmr17397546qkp.237.1665509212944;
        Tue, 11 Oct 2022 10:26:52 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:52 -0700 (PDT)
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
Subject: [PATCH v2 30/34] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: minor style cleanups
Date:   Tue, 11 Oct 2022 13:23:54 -0400
Message-Id: <20221011172358.69043-31-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
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

Drop "binding" from description (and align it with other Qualcomm
pinctrl bindings), use double quotes consistently and drop redundant
quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml      | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index bd54c92287d6..8270debd4f25 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -4,15 +4,14 @@
 $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
-  Low Power Island (LPI) TLMM block
+title: Qualcomm SC7280 SoC LPASS LPI TLMM
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  LPASS LPI IP on most Qualcomm SoCs
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SC7280 SoC.
 
 properties:
   compatible:
@@ -29,7 +28,7 @@ properties:
 
   gpio-controller: true
 
-  '#gpio-cells':
+  "#gpio-cells":
     description: Specifying the pin number and flags, as defined in
       include/dt-bindings/gpio/gpio.h
     const: 2
@@ -107,7 +106,7 @@ required:
   - compatible
   - reg
   - gpio-controller
-  - '#gpio-cells'
+  - "#gpio-cells"
   - gpio-ranges
 
 additionalProperties: false
-- 
2.34.1

