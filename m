Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDFE5ECB39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbiI0Rk2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233290AbiI0Rj1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:39:27 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374AC1E459D
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:38 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a2so16775054lfb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xB28Educepf+IPa2bu7radSAhQAuISxlsfTo2XNAGj0=;
        b=hSZRNPzh2KrqCkPodlMo83NivQfwuyoByIw3eM7iaH+BnC+Hgb2xxcRqOn6gHe+HSX
         xwVtW0OAh96LJdVzOtyg3dC/ajk3BsoLxuvtYxGRNtXk4E1oH0FABxEKIIRPyIgQhRy3
         V1ed6UxUDJgsxwKFRfSmAnTISNkOrfsEUzPavEkUuEJ0D0T4yVVXUw8Y7uji/rpYykWW
         id3algpFXucNGbclxuCeli9rBHVwLUAVEv6xZBRRTj9dAdaStYqSj9MUVfEp2EOjOQn+
         T2wwShUIO/wYQ2j3VPRe4igNtusVcVHg5GoDZq0kqU8AFXC+76jcFfTpz7M3yfj4h/51
         TKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xB28Educepf+IPa2bu7radSAhQAuISxlsfTo2XNAGj0=;
        b=4GoA2d++/E1pN19v/no37ZPgymdAotLNDw61D8YFIpz9fK17VQ+DN9w1vsyL9yLMzo
         IbXszIYTRSx4siQdNK1wEs+ScLWkSO0N9tsYYYrk2a4vBDVpYdyo7IZRV9o0iC2aVv01
         ha9ixnq09Soeq9+Pt1vdKxbXFNavv50L332TqJwtETX7expw6QUviXYPqo28xI743KUO
         8ayEO0frkiwCKdDSg2tpUzQIhOjP1OzaOzjvDEZbHgzCifJ41pWGaagXNj/1HK2YODW8
         UcfGp501FssGQOnrJ5/XNBejS/CTuOxNtGqaZiNWs1Q89S87qgMo9SI1smuBuSCOySY3
         Qsug==
X-Gm-Message-State: ACrzQf0Kz7uKuOhN3mxD9pABz7ru1ZWKezC0GqmKFEkevUaiI9TqYUF+
        VOWGhikVNeFb1uk5M/rbFVsnqw==
X-Google-Smtp-Source: AMsMyM48me0beCgoGDPz0SC/BrZGdw0oEi+C/2M2ntiEeXFZGZK3vCINmtJQYBq/UOACiNAw150GHQ==
X-Received: by 2002:a05:6512:3a91:b0:49a:d3f2:1b09 with SMTP id q17-20020a0565123a9100b0049ad3f21b09mr10707842lfu.255.1664300318409;
        Tue, 27 Sep 2022 10:38:38 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:38:37 -0700 (PDT)
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
Subject: [PATCH v3 18/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: fix matching pin config
Date:   Tue, 27 Sep 2022 19:36:46 +0200
Message-Id: <20220927173702.5200-19-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
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

