Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE36B5E8985
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233678AbiIXIGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233679AbiIXIFv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:05:51 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10388121E5C
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:28 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id w8so3474625lft.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=q8x9uNJv1GdLZmJTd8sk+6NP6nWeg6X+qM8aAbyTccQ=;
        b=C2DHYP4iiFXaUsom/T+schnOontFRttz/XOW5i9gotd5n9Ooa4q67Z4OTwOLt85PCi
         UrbnzOyAUJZ7y6xtJNSYDwOKubuaVFvqglcxiHFh1+QD/qscMCz9E8xZhXfaDsk3PUhI
         EkmdYzbxDJV08hQ1DTrfeVz8iP6T/KPz1t+8rj6iHYSfsGTRnXp1yG6ftVExYgQZXyPH
         1+jrKLEtYszydUfxA8WzZpbSNnf7te+NWSWigf91LiPs6uhHuxR3FiisZc3zMPybnwZ0
         QeqdR2ZVS3QtjIG8EbRsx8oxUpc7elKX1UGQBbtSVDKo0m8AVJq3aO+TF6DXgH8cgFIJ
         5Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=q8x9uNJv1GdLZmJTd8sk+6NP6nWeg6X+qM8aAbyTccQ=;
        b=6oar8XBqkvw0hn5pQvbtdHHQYi7MF6sAKF70V3pCC9nxpc/XJGd3T/EqgSefqHyyK7
         OJVwROKm5mmcdhsH86KGXjRo5Nsii86eQfam+gU3dkRQ5DuZ3va8+82OBLHTKj7M5yVa
         UCu3zbVseUC1L20RxHYKLT/vUhLDoBC+5wGYZK9SyfKBSHx2r7pXbJKHJYrJ7qVXQxE0
         xikQMWchBkY/NKpX0XXjtm3I/1Cu0lLx8gZb9BtGuuv714vwj8Zx6+DCfTjT5+F/vdr+
         9NAuxP2djr3mh4uLMJYMDoHC7wz9VaTGWDZ/URYQE6/fJCJaaW+M1w7GuxFVJw2lDtrp
         h4Kg==
X-Gm-Message-State: ACrzQf052hEgU151ugY7YWRf4bbanT6fZju/bOSdK1lbtfBrXE8plSM7
        wWALrATnS3UuMvXFKAZaHQNpUA==
X-Google-Smtp-Source: AMsMyM64S/N8FT5hyfKWJNxchNsUKQri69eWg1V4EY4lVh35Lp2phGeMaZYXwfjOfTVE+2j3JlGBww==
X-Received: by 2002:a05:6512:c0f:b0:49b:1e8c:59fd with SMTP id z15-20020a0565120c0f00b0049b1e8c59fdmr4531851lfu.426.1664006728356;
        Sat, 24 Sep 2022 01:05:28 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 16/32] dt-bindings: pinctrl: qcom,msm8909-tlmm: fix matching pin config
Date:   Sat, 24 Sep 2022 10:04:43 +0200
Message-Id: <20220924080459.13084-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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

