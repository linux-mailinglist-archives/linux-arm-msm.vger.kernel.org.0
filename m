Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCBA5579C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 14:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbiFWMEZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 08:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbiFWMEY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:04:24 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CDC31369
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:22 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id by38so1230227ljb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eLo0cmj8iEhVelCOHSSbw79s0qehpremV7AWxy+/lLQ=;
        b=tcTGwolRBv0D4qD9ejpmCeDs1hoaOeSmTcyx4lu6JHFxpbx4pM0D2TZv/6vemKt2ga
         jed1TsXSemb7bDoHCe4Uflr9k1oX7vMkFRG5XSxrSxFVfB/MvughH8zna/mCK4Xemn9c
         omUbRcPyySluNVhjn5tvH/PrIaHyT932/S+k49hRZa+V7Snbc0dGa4nzImRoVFQBuk8G
         GRQPHKKy4DQW6QTAsVo2XbV6uwUN4YXJWW9N/v5cre54uIwuw1h7MauVgW3cmlzJlmwO
         FIhqPkkWi5y+hb9tSL2BUS4z2FEFJ6CBusFgTOqEr1Ic8LGPfPKudT6Wm6gbWCOwjp+k
         jDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eLo0cmj8iEhVelCOHSSbw79s0qehpremV7AWxy+/lLQ=;
        b=56P3dCl0prC40n9G5sAqORO03zkCGEQu1GJwS30DV2tBxI6iW/nUS9vbaMin/2gMDx
         iElnNxtRZnGJkKsJpHYeelJIAvtUm3yMSKUhDh8D7jSSJhD4uEN+g1LGRn6k4CtwMFp7
         Buqz/WSF3Nb3jRIUe26ytm3hryXxtVZrIcB5yGl4FhXKNMbbOgyYK6khC4eXFyES+Wx3
         Oeg/6XJna4crpxU4CXSzoiEwHdlYoeIyLGJdX0ayQqxV3YLKrBpGp9ATZLAs0MXcF5+V
         B/kIBEL+w7fIrdCT+zx52I9WJ4uWmwrvWDcl8lbWEoCh6J1NS/J0W04eGa/2dAGvXmGv
         3srg==
X-Gm-Message-State: AJIora9NHDMP/3ELCnTpNq+pbvuJLO4OcbFb4IqRYDTPhPPsIRHMufNq
        qNLrXjmymi0xssl+LlPFHuk85w==
X-Google-Smtp-Source: AGRyM1vhm4tEf25uqRF7DTxCNaFF4kdl9eUiq3K6lXVVrAMG+iaWY8gJoIKfW0f0Qeatk1pBR+Wsyw==
X-Received: by 2002:a2e:b6c6:0:b0:25a:93bb:f801 with SMTP id m6-20020a2eb6c6000000b0025a93bbf801mr1502777ljo.489.1655985860818;
        Thu, 23 Jun 2022 05:04:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 02/15] dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8960
Date:   Thu, 23 Jun 2022 15:04:05 +0300
Message-Id: <20220623120418.250589-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
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

Define clock/clock-names properties of the MMCC device node to be used
on MSM8960/APQ8064 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index d02fe6dc79b5..c13243682365 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -82,6 +82,37 @@ then:
     - clock-names
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mmcc-apq8064
+              - qcom,mmcc-msm8960
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board PXO source
+            - description: PLL 3 clock
+            - description: PLL 3 Vote clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: DSI phy instance 2 dsi clock
+            - description: DSI phy instance 2 byte clock
+            - description: HDMI phy PLL clock
+
+        clock-names:
+          items:
+            - const: pxo
+            - const: pll3
+            - const: pll8_vote
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: dsi2pll
+            - const: dsi2pllbyte
+            - const: hdmipll
+
   - if:
       properties:
         compatible:
-- 
2.35.1

