Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF0F5F66D3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbiJFMuR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbiJFMtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:49:15 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A461A4B92
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:59 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y5so2546737lfl.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mFK0jWSBGCqHueR6jez0prdbdNbJLNaBR9Qi0IdExSc=;
        b=V5GCFgpz9z9EovrbXOXQspzv/4whrmwJ3ffaW51KT7AOpt5iX3iksirxuVXEY7+FMG
         jo4b2+F0Qa9cEIX7A5YvdiWoAJF1Are3hNUDJTHNrYKE3Hl0s3TUfwKzsIoCI2dCuE9K
         zBZKmEoQNguWGofsuTVfcXk+Pg7SSHvayqBl+EQYa2CD0/JGc65rCAg/wG8v5xJWt4Kv
         IfM/hdl7BKHsEQX2BiSXZwHjWEGNgi6obDxg54RhOfu0dt78YLT8+ttIrcdmAMMZikme
         OEE60DkEgvta8oZUrArxq4zL5NoeSrVCVUUn4NrsWibSXTTzlGFlqiDZgXnkjJesyQTW
         fPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mFK0jWSBGCqHueR6jez0prdbdNbJLNaBR9Qi0IdExSc=;
        b=QoBPpGDVspXgor2oqUj2JkSdpCEq9qU6BSR4jNckGp7C6Lxoz0Hr0orbdqdtqWhpI7
         xqAIYBe3AMIOWnuSuSEbeSYGNZRWCNvoRLlDs04GJidVzSj1zC3A3C+3JCP8WiIcFgT7
         QFc5BxcZZkqEs+l0UTsIuYyqJvBJZ6tkqA2LbI06gW6cOGQ0Jvm2dvU1PPY1X8PIfAIh
         FCtYD6exY5mB8GMARz7N76xZDx60IXYY+1b0x3dm0hJ7J1KlYR74VgnZw6NFjrSdlPXE
         gd8F4Ccy1lAkQw/xAgi01seHtmIUnx+IUvfQ8NXJgXlKjB8q6IQJbE5TWnfkXxBenbGj
         3Euw==
X-Gm-Message-State: ACrzQf3IPRfV4GdqCzSm8rkkvP0OaJK960EzJaZp3ZvEuP9GBynGjn4E
        Pg9NFM1E1FeF3de4I85zBbby5w==
X-Google-Smtp-Source: AMsMyM5LgBrIJFT78fsjLxmvhLww8MGJPFVwdPrEpGtnHF3XM77EQ4ldrB3LH9MsX3yCKkiM5u04eQ==
X-Received: by 2002:ac2:5a5d:0:b0:4a2:3d64:8ad3 with SMTP id r29-20020ac25a5d000000b004a23d648ad3mr1776826lfn.530.1665060454471;
        Thu, 06 Oct 2022 05:47:34 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:34 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 28/34] dt-bindings: pinctrl: qcom,sdx55: fix matching pin config
Date:   Thu,  6 Oct 2022 14:46:53 +0200
Message-Id: <20221006124659.217540-29-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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
(level one and two) are not properly matched.

  qcom-sdx55-telit-fn980-tlb.dtb: pinctrl@f100000: 'pcie_ep_clkreq_default', 'pcie_ep_perst_default', 'pcie_ep_wake_default' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'

This method also unifies the bindings with other Qualcomm TLMM and LPASS
pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml       | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
index a38090b14aab..fff57abf4fbc 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
@@ -45,9 +45,17 @@ properties:
   gpio-reserved-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sdx55-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sdx55-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sdx55-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -146,7 +154,7 @@ examples:
                 #interrupt-cells = <2>;
                 interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
 
-                serial-pins {
+                serial-state {
                         pins = "gpio8", "gpio9";
                         function = "blsp_uart3";
                         drive-strength = <8>;
-- 
2.34.1

