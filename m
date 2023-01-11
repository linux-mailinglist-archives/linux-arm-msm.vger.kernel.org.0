Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A13F665435
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 07:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235482AbjAKGES (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 01:04:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235539AbjAKGEM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 01:04:12 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CBBB7E1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 22:04:07 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bf43so21944529lfb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 22:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VI1IjcklbSGHdzMZQLrZQtp9sC0C8UYZ9TXhuVnVOeE=;
        b=UvNrwS1nE0zTNCKfCLOucEvCCNbFqK0zZ8jGnubOy6FYoYLOXpAexb+SXEbIuQ/mSN
         c9dVXv40vZWK6VKYBeJytoHqSjTw5y7byscETmHX5H/AhUJvNO4Vn685Mtszz5TMt8ZT
         lbjrn48b9lkMj2ZpNaOgWEBKrOdTJW7tH8OM+Pd0THftQlO7M0YogR+enWFbvWi8JioN
         TOUYAgtzfSIw3AJ0ns9WXfLjGZAxay0dLZHMQ7tSmvCb6dT9tqj6RannwOdPmkE+U/6D
         pbTQ6NFXULUwXd0VzcSfWNDqi5Vtgc6fgbBGGKKWOTelgki3u1iO5dzy5/zzKk7KpCf+
         YhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VI1IjcklbSGHdzMZQLrZQtp9sC0C8UYZ9TXhuVnVOeE=;
        b=RsvUBQ7vXTM4tv8pjTfeOGm+GW167DBZf1P4PNGwRkcmAyHYRdx3o+NJo1DMafklhW
         c7jo5gnCsZOOqm5g/myKROhH0FAhIuqv2plX58b9xmIOQQzosqvtkYrOTb8qrOficEoP
         OSLSNRNCbUaJgVOVYcQg4hykoBfjJSEZhWtrTgIwLYUwRe/FZI8y6JU4azywLsg4mM1N
         BGJh+ZcalB0JMfhggpnnKNQT/ozfX6NkA5dejEGIbIOx95nG1ZYXrgSnYiiJcbDiDHnB
         1by6T8ePr9DSweuaPoYFLiw6+zWTCyrwNK9KKbd+vJLyT77S4K0HUeexugljNPdyXEP1
         izmA==
X-Gm-Message-State: AFqh2kpw2jEMfa+7/iHpPG2SNpFQn8KcaSLwn0rIODud8jrcXA+JNYzP
        kE5yBrCRVvipzlg/sKiGgjlRIQ==
X-Google-Smtp-Source: AMrXdXudRo9G46nQq7ighKR3srBHJMPiYkzlOrkLLk+9ANLddeq20aigTdp0OQJWJ5BEf636mwwcTw==
X-Received: by 2002:a05:6512:130f:b0:4cb:654:5337 with SMTP id x15-20020a056512130f00b004cb06545337mr2539738lfu.49.1673417046012;
        Tue, 10 Jan 2023 22:04:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b7-20020a056512070700b004cb143f7391sm2524607lfs.258.2023.01.10.22.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 22:04:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/12] dt-bindings: clock: qcom,mmcc: define clocks/clock-names for APQ8084
Date:   Wed, 11 Jan 2023 08:03:53 +0200
Message-Id: <20230111060402.1168726-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
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

Define clock/clock-names properties of the MMCC device node to be used
on APQ8084 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index cf04d791093f..acf0c923c24f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -32,11 +32,11 @@ properties:
 
   clocks:
     minItems: 8
-    maxItems: 10
+    maxItems: 13
 
   clock-names:
     minItems: 8
-    maxItems: 10
+    maxItems: 13
 
   '#clock-cells':
     const: 1
@@ -137,6 +137,46 @@ allOf:
             - const: edp_link_clk
             - const: edp_vco_div
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mmcc-apq8084
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board sleep source
+            - description: MMSS GPLL0 voted clock
+            - description: GPLL0 clock
+            - description: GPLL0 voted clock
+            - description: GPLL1 clock
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: HDMI phy PLL clock
+            - description: eDP phy PLL link clock
+            - description: eDP phy PLL vco clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: sleep_clk
+            - const: mmss_gpll0_vote
+            - const: gpll0
+            - const: gpll0_vote
+            - const: gpll1
+            - const: dsi0pll
+            - const: dsi0pllbyte
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: hdmipll
+            - const: edp_link_clk
+            - const: edp_vco_div
+
   - if:
       properties:
         compatible:
-- 
2.39.0

